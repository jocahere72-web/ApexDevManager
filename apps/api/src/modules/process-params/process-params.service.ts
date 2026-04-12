import { logger } from '../../lib/logger.js';
import { tenantQuery } from '../../lib/tenant-db.js';
import { NotFoundError } from '../../lib/errors.js';
import type { PoolClient } from 'pg';
import {
  type ProcessStage,
  type ProcessParams,
  PROCESS_STAGES,
  DEFAULT_PROCESS_PARAMS,
} from '@apex-dev-manager/shared-types';

// ── Row mapper ──────────────────────────────────────────────────────────────

function rowToParams(row: Record<string, unknown>): ProcessParams {
  return {
    id: row.id as string,
    tenantId: row.tenant_id as string,
    stage: row.stage as ProcessStage,
    name: row.name as string,
    description: (row.description as string) ?? undefined,
    promptTemplate: (row.prompt_template as string) ?? undefined,
    modelOverride: (row.model_override as string) ?? undefined,
    temperature: Number(row.temperature ?? 0.7),
    maxTokens: (row.max_tokens as number) ?? 4096,
    referenceDocument: (row.reference_document as string) ?? undefined,
    checklist: (row.checklist as ProcessParams['checklist']) ?? [],
    requiredFields: (row.required_fields as ProcessParams['requiredFields']) ?? [],
    approvalRules: (row.approval_rules as ProcessParams['approvalRules']) ?? { requireApproval: false, minApprovers: 0, approverRoles: [] },
    config: (row.config as Record<string, unknown>) ?? {},
    isActive: row.is_active as boolean,
    createdBy: (row.created_by as string) ?? undefined,
    createdAt: (row.created_at as Date).toISOString(),
    updatedAt: (row.updated_at as Date).toISOString(),
  };
}

function defaultForStage(stage: ProcessStage): ProcessParams {
  const d = DEFAULT_PROCESS_PARAMS[stage];
  const now = new Date().toISOString();
  return {
    id: '',
    tenantId: '',
    stage,
    name: d.name ?? stage,
    description: d.description,
    promptTemplate: d.promptTemplate,
    modelOverride: undefined,
    temperature: d.temperature ?? 0.7,
    maxTokens: d.maxTokens ?? 4096,
    referenceDocument: undefined,
    checklist: d.checklist ?? [],
    requiredFields: d.requiredFields ?? [],
    approvalRules: d.approvalRules ?? { requireApproval: false, minApprovers: 0, approverRoles: [] },
    config: d.config ?? {},
    isActive: true,
    createdAt: now,
    updatedAt: now,
  };
}

// ── Audit Logging ───────────────────────────────────────────────────────────

async function logAudit(
  tenantId: string,
  actorId: string,
  action: string,
  targetId: string,
  details?: Record<string, unknown>,
  client?: PoolClient,
): Promise<void> {
  try {
    await tenantQuery(
      client,
      `INSERT INTO audit_events (tenant_id, user_id, event_type, action, entity_type, entity_id, event_payload, created_at)
       VALUES ($1, $2, 'process_params_management', $3, 'process_params', $4, $5, NOW())`,
      [tenantId, actorId, action, targetId, details ? JSON.stringify(details) : null],
    );
  } catch (err) {
    logger.error({ err, tenantId, actorId, action, targetId }, 'Failed to write audit log');
  }
}

// ── Select columns ──────────────────────────────────────────────────────────

const SELECT_COLS = `id, tenant_id, stage, name, description, prompt_template,
  model_override, temperature, max_tokens, reference_document, checklist,
  required_fields, approval_rules, config, is_active, created_by, created_at, updated_at`;

// ── Get Params for a single stage ───────────────────────────────────────────

export async function getParams(
  tenantId: string,
  stage: ProcessStage,
  client?: PoolClient,
): Promise<ProcessParams> {
  const result = await tenantQuery(
    client,
    `SELECT ${SELECT_COLS} FROM process_params
     WHERE tenant_id = $1 AND stage = $2 AND is_active = TRUE
     LIMIT 1`,
    [tenantId, stage],
  );

  if (result.rowCount === 0) {
    return defaultForStage(stage);
  }

  return rowToParams(result.rows[0]);
}

// ── Get All Params (all 7 stages) ───────────────────────────────────────────

export async function getAllParams(
  tenantId: string,
  client?: PoolClient,
): Promise<ProcessParams[]> {
  const result = await tenantQuery(
    client,
    `SELECT ${SELECT_COLS} FROM process_params
     WHERE tenant_id = $1 AND is_active = TRUE
     ORDER BY CASE stage
       WHEN 'intake' THEN 1 WHEN 'prd' THEN 2 WHEN 'design' THEN 3
       WHEN 'build' THEN 4 WHEN 'review' THEN 5 WHEN 'test' THEN 6
       WHEN 'deploy' THEN 7 END`,
    [tenantId],
  );

  const existingByStage = new Map<ProcessStage, ProcessParams>();
  for (const row of result.rows) {
    const params = rowToParams(row);
    existingByStage.set(params.stage, params);
  }

  // Fill in defaults for stages that have no custom config
  return PROCESS_STAGES.map((stage) => existingByStage.get(stage) ?? defaultForStage(stage));
}

// ── Upsert Params ───────────────────────────────────────────────────────────

export async function upsertParams(
  tenantId: string,
  stage: ProcessStage,
  data: Record<string, unknown>,
  actorId: string,
  client?: PoolClient,
): Promise<ProcessParams> {
  const defaults = DEFAULT_PROCESS_PARAMS[stage];

  const name = (data.name as string) ?? defaults.name ?? stage;
  const description = (data.description as string) ?? defaults.description ?? null;
  const promptTemplate = (data.promptTemplate as string) ?? defaults.promptTemplate ?? null;
  const modelOverride = (data.modelOverride as string) ?? null;
  const temperature = data.temperature != null ? Number(data.temperature) : 0.7;
  const maxTokens = data.maxTokens != null ? Number(data.maxTokens) : 4096;
  const referenceDocument = (data.referenceDocument as string) ?? null;
  const checklist = data.checklist ?? defaults.checklist ?? [];
  const requiredFields = data.requiredFields ?? defaults.requiredFields ?? [];
  const approvalRules = data.approvalRules ?? defaults.approvalRules ?? {};
  const config = data.config ?? {};

  // Deactivate existing active row for this stage
  await tenantQuery(
    client,
    `UPDATE process_params SET is_active = FALSE, updated_at = NOW()
     WHERE tenant_id = $1 AND stage = $2 AND is_active = TRUE`,
    [tenantId, stage],
  );

  const result = await tenantQuery(
    client,
    `INSERT INTO process_params (
       tenant_id, stage, name, description, prompt_template,
       model_override, temperature, max_tokens, reference_document,
       checklist, required_fields, approval_rules, config,
       is_active, created_by
     ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, TRUE, $14)
     RETURNING ${SELECT_COLS}`,
    [
      tenantId, stage, name, description, promptTemplate,
      modelOverride, temperature, maxTokens, referenceDocument,
      JSON.stringify(checklist), JSON.stringify(requiredFields),
      JSON.stringify(approvalRules), JSON.stringify(config),
      actorId,
    ],
  );

  const upserted = rowToParams(result.rows[0]);

  await logAudit(tenantId, actorId, 'process_params.upserted', upserted.id, { stage }, client);
  logger.info({ tenantId, stage, paramsId: upserted.id }, 'Process params upserted');

  return upserted;
}

// ── Reset Params (reverts to defaults) ──────────────────────────────────────

export async function resetParams(
  tenantId: string,
  stage: ProcessStage,
  actorId: string,
  client?: PoolClient,
): Promise<ProcessParams> {
  // Deactivate any custom config
  await tenantQuery(
    client,
    `UPDATE process_params SET is_active = FALSE, updated_at = NOW()
     WHERE tenant_id = $1 AND stage = $2 AND is_active = TRUE`,
    [tenantId, stage],
  );

  await logAudit(tenantId, actorId, 'process_params.reset', stage, { stage }, client);
  logger.info({ tenantId, stage }, 'Process params reset to defaults');

  return defaultForStage(stage);
}

// ── Seed Defaults ───────────────────────────────────────────────────────────

export async function seedDefaults(
  tenantId: string,
  client?: PoolClient,
): Promise<void> {
  const existing = await tenantQuery(
    client,
    `SELECT COUNT(*)::int AS total FROM process_params WHERE tenant_id = $1`,
    [tenantId],
  );

  if ((existing.rows[0].total as number) > 0) {
    logger.debug({ tenantId }, 'Process params already seeded, skipping');
    return;
  }

  for (const stage of PROCESS_STAGES) {
    const d = DEFAULT_PROCESS_PARAMS[stage];
    await tenantQuery(
      client,
      `INSERT INTO process_params (
         tenant_id, stage, name, description, prompt_template,
         model_override, temperature, max_tokens, reference_document,
         checklist, required_fields, approval_rules, config,
         is_active, created_by
       ) VALUES ($1, $2, $3, $4, $5, NULL, 0.7, 4096, NULL, $6, $7, $8, '{}', TRUE, NULL)`,
      [
        tenantId,
        stage,
        d.name ?? stage,
        d.description ?? null,
        d.promptTemplate ?? null,
        JSON.stringify(d.checklist ?? []),
        JSON.stringify(d.requiredFields ?? []),
        JSON.stringify(d.approvalRules ?? {}),
      ],
    );
  }

  logger.info({ tenantId, count: PROCESS_STAGES.length }, 'Process params defaults seeded');
}
