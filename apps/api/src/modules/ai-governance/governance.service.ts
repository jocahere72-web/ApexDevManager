import { pool } from '../../config/database.js';
import { logger } from '../../lib/logger.js';
import { NotFoundError, AppError } from '../../lib/errors.js';
import type {
  AIAuditEntry,
  SafetyRule,
  SafetyAction,
  GovernanceDashboard,
  TenantQuota,
} from '@apex-dev-manager/shared-types';

// ── Row mapping ─────────────────────────────────────────────────────────────

interface AuditRow {
  id: string;
  tenant_id: string;
  user_id: string;
  conversation_id: string | null;
  prompt_hash: string | null;
  prompt_risk_level: string | null;
  output_risk_level: string | null;
  blocked: boolean;
  block_reason: string | null;
  model: string | null;
  tokens_used: number;
  cost_usd: number;
  created_at: string;
}

interface SafetyRuleRow {
  id: string;
  tenant_id: string;
  rule_name: string;
  pattern: string;
  action: SafetyAction;
  enabled: boolean;
  created_at: string;
}

function rowToAuditEntry(row: AuditRow): AIAuditEntry {
  return {
    id: row.id,
    tenantId: row.tenant_id,
    userId: row.user_id,
    conversationId: row.conversation_id,
    promptHash: row.prompt_hash,
    promptRiskLevel: row.prompt_risk_level,
    outputRiskLevel: row.output_risk_level,
    blocked: row.blocked,
    blockReason: row.block_reason,
    model: row.model,
    tokensUsed: row.tokens_used,
    costUsd: parseFloat(String(row.cost_usd)),
    createdAt: row.created_at,
  };
}

function rowToSafetyRule(row: SafetyRuleRow): SafetyRule {
  return {
    id: row.id,
    tenantId: row.tenant_id,
    ruleName: row.rule_name,
    pattern: row.pattern,
    action: row.action,
    enabled: row.enabled,
    createdAt: row.created_at,
  };
}

// ── Audit functions ─────────────────────────────────────────────────────────

export async function auditPrompt(
  tenantId: string,
  userId: string,
  data: {
    conversationId?: string;
    promptHash?: string;
    promptRiskLevel?: string;
    model?: string;
    tokensUsed?: number;
    costUsd?: number;
  },
): Promise<{ blocked: boolean; blockReason: string | null; auditId: string }> {
  // Check safety rules
  const rules = await getEnabledRules(tenantId);
  let blocked = false;
  let blockReason: string | null = null;

  for (const rule of rules) {
    if (rule.action === 'block' && data.promptHash) {
      try {
        const regex = new RegExp(rule.pattern, 'i');
        // In production, check against the actual prompt content, not just the hash
        if (regex.test(data.promptHash)) {
          blocked = true;
          blockReason = `Blocked by rule: ${rule.ruleName}`;
          break;
        }
      } catch {
        logger.warn({ ruleId: rule.id }, 'Invalid safety rule pattern');
      }
    }
  }

  const result = await pool.query<AuditRow>(
    `INSERT INTO ai_audit_log
       (tenant_id, user_id, conversation_id, prompt_hash, prompt_risk_level, blocked, block_reason, model, tokens_used, cost_usd)
     VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
     RETURNING *`,
    [
      tenantId,
      userId,
      data.conversationId ?? null,
      data.promptHash ?? null,
      data.promptRiskLevel ?? null,
      blocked,
      blockReason,
      data.model ?? null,
      data.tokensUsed ?? 0,
      data.costUsd ?? 0,
    ],
  );

  return { blocked, blockReason, auditId: result.rows[0].id };
}

export async function auditOutput(
  auditId: string,
  tenantId: string,
  outputRiskLevel: string,
): Promise<AIAuditEntry> {
  const result = await pool.query<AuditRow>(
    `UPDATE ai_audit_log SET output_risk_level = $3
     WHERE tenant_id = $1 AND id = $2
     RETURNING *`,
    [tenantId, auditId, outputRiskLevel],
  );
  if (result.rowCount === 0) {
    throw new NotFoundError('Audit entry not found');
  }
  return rowToAuditEntry(result.rows[0]);
}

export async function getAuditLog(
  tenantId: string,
  limit = 50,
  offset = 0,
  filters?: { userId?: string; blocked?: boolean; model?: string },
): Promise<{ items: AIAuditEntry[]; total: number }> {
  const conditions = ['tenant_id = $1'];
  const params: unknown[] = [tenantId];
  let idx = 2;

  if (filters?.userId) {
    conditions.push(`user_id = $${idx++}`);
    params.push(filters.userId);
  }
  if (filters?.blocked !== undefined) {
    conditions.push(`blocked = $${idx++}`);
    params.push(filters.blocked);
  }
  if (filters?.model) {
    conditions.push(`model = $${idx++}`);
    params.push(filters.model);
  }

  const where = conditions.join(' AND ');
  const countResult = await pool.query<{ count: string }>(
    `SELECT COUNT(*) as count FROM ai_audit_log WHERE ${where}`,
    params,
  );

  const result = await pool.query<AuditRow>(
    `SELECT * FROM ai_audit_log WHERE ${where} ORDER BY created_at DESC LIMIT $${idx++} OFFSET $${idx++}`,
    [...params, limit, offset],
  );

  return {
    items: result.rows.map(rowToAuditEntry),
    total: parseInt(countResult.rows[0].count, 10),
  };
}

// ── Safety rules ────────────────────────────────────────────────────────────

async function getEnabledRules(tenantId: string): Promise<SafetyRule[]> {
  const result = await pool.query<SafetyRuleRow>(
    `SELECT * FROM ai_safety_rules WHERE tenant_id = $1 AND enabled = true`,
    [tenantId],
  );
  return result.rows.map(rowToSafetyRule);
}

export async function getSafetyRules(
  tenantId: string,
): Promise<SafetyRule[]> {
  const result = await pool.query<SafetyRuleRow>(
    `SELECT * FROM ai_safety_rules WHERE tenant_id = $1 ORDER BY created_at DESC`,
    [tenantId],
  );
  return result.rows.map(rowToSafetyRule);
}

export async function createRule(
  tenantId: string,
  ruleName: string,
  pattern: string,
  action: SafetyAction,
): Promise<SafetyRule> {
  const result = await pool.query<SafetyRuleRow>(
    `INSERT INTO ai_safety_rules (tenant_id, rule_name, pattern, action)
     VALUES ($1, $2, $3, $4)
     RETURNING *`,
    [tenantId, ruleName, pattern, action],
  );
  logger.info({ ruleId: result.rows[0].id, ruleName }, 'Safety rule created');
  return rowToSafetyRule(result.rows[0]);
}

export async function updateRule(
  tenantId: string,
  ruleId: string,
  updates: Partial<Pick<SafetyRule, 'ruleName' | 'pattern' | 'action' | 'enabled'>>,
): Promise<SafetyRule> {
  const setClauses: string[] = [];
  const params: unknown[] = [tenantId, ruleId];
  let idx = 3;

  if (updates.ruleName !== undefined) {
    setClauses.push(`rule_name = $${idx++}`);
    params.push(updates.ruleName);
  }
  if (updates.pattern !== undefined) {
    setClauses.push(`pattern = $${idx++}`);
    params.push(updates.pattern);
  }
  if (updates.action !== undefined) {
    setClauses.push(`action = $${idx++}`);
    params.push(updates.action);
  }
  if (updates.enabled !== undefined) {
    setClauses.push(`enabled = $${idx++}`);
    params.push(updates.enabled);
  }

  if (setClauses.length === 0) {
    throw new AppError('No fields to update', 400, 'BAD_REQUEST');
  }

  const result = await pool.query<SafetyRuleRow>(
    `UPDATE ai_safety_rules SET ${setClauses.join(', ')} WHERE tenant_id = $1 AND id = $2 RETURNING *`,
    params,
  );
  if (result.rowCount === 0) {
    throw new NotFoundError('Safety rule not found');
  }
  return rowToSafetyRule(result.rows[0]);
}

// ── Dashboard ───────────────────────────────────────────────────────────────

export async function getDashboard(tenantId: string): Promise<GovernanceDashboard> {
  const totalResult = await pool.query<{ count: string }>(
    `SELECT COUNT(*) as count FROM ai_audit_log WHERE tenant_id = $1`,
    [tenantId],
  );

  const blockedResult = await pool.query<{ count: string }>(
    `SELECT COUNT(*) as count FROM ai_audit_log WHERE tenant_id = $1 AND blocked = true`,
    [tenantId],
  );

  const costResult = await pool.query<{ total: string }>(
    `SELECT COALESCE(SUM(cost_usd), 0) as total FROM ai_audit_log WHERE tenant_id = $1`,
    [tenantId],
  );

  const byModelResult = await pool.query<{ model: string; count: string; cost_usd: string }>(
    `SELECT model, COUNT(*) as count, COALESCE(SUM(cost_usd), 0) as cost_usd
     FROM ai_audit_log WHERE tenant_id = $1 AND model IS NOT NULL
     GROUP BY model ORDER BY count DESC`,
    [tenantId],
  );

  const riskResult = await pool.query<{ level: string; count: string }>(
    `SELECT prompt_risk_level as level, COUNT(*) as count
     FROM ai_audit_log WHERE tenant_id = $1 AND prompt_risk_level IS NOT NULL
     GROUP BY prompt_risk_level ORDER BY count DESC`,
    [tenantId],
  );

  const recentResult = await pool.query<AuditRow>(
    `SELECT * FROM ai_audit_log WHERE tenant_id = $1 ORDER BY created_at DESC LIMIT 10`,
    [tenantId],
  );

  return {
    totalRequests: parseInt(totalResult.rows[0].count, 10),
    blockedRequests: parseInt(blockedResult.rows[0].count, 10),
    totalCostUsd: parseFloat(costResult.rows[0].total),
    byModel: byModelResult.rows.map((r) => ({
      model: r.model,
      count: parseInt(r.count, 10),
      costUsd: parseFloat(r.cost_usd),
    })),
    riskDistribution: riskResult.rows.map((r) => ({
      level: r.level,
      count: parseInt(r.count, 10),
    })),
    recentAudit: recentResult.rows.map(rowToAuditEntry),
  };
}

// ── Quota ────────────────────────────────────────────────────────────────────

export async function getTenantQuota(tenantId: string): Promise<TenantQuota> {
  // Fetch current day usage
  const usageResult = await pool.query<{ count: string; cost: string }>(
    `SELECT COUNT(*) as count, COALESCE(SUM(cost_usd), 0) as cost
     FROM ai_audit_log
     WHERE tenant_id = $1 AND created_at >= CURRENT_DATE`,
    [tenantId],
  );

  // Default quotas (could be stored in a tenant_quotas table in production)
  return {
    tenantId,
    maxRequestsPerDay: 10000,
    maxCostPerDay: 100.0,
    maxTokensPerRequest: 128000,
    currentDayRequests: parseInt(usageResult.rows[0].count, 10),
    currentDayCost: parseFloat(usageResult.rows[0].cost),
  };
}

export async function updateQuota(
  tenantId: string,
  updates: Partial<Pick<TenantQuota, 'maxRequestsPerDay' | 'maxCostPerDay' | 'maxTokensPerRequest'>>,
): Promise<TenantQuota> {
  // In production, persist to a tenant_quotas table
  logger.info({ tenantId, updates }, 'Tenant quota updated');
  const current = await getTenantQuota(tenantId);
  return {
    ...current,
    ...updates,
  };
}
