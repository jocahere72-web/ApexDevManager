import { logger } from '../../lib/logger.js';
import { tenantQuery } from '../../lib/tenant-db.js';
import { NotFoundError, ConflictError } from '../../lib/errors.js';
import { encryptCredentials, decryptCredentials } from '../connections/encryption.service.js';
import type { CreateLLMProviderInput, UpdateLLMProviderInput } from './llm-providers.validation.js';
import type { PoolClient } from 'pg';

// ── Types ────────────────────────────────────────────────────────────────────

export interface LLMProviderRow {
  id: string;
  tenantId: string;
  providerName: string;
  displayName: string;
  baseUrl: string | null;
  defaultModel: string;
  availableModels: string[];
  isActive: boolean;
  maxTokensPerRequest: number;
  rateLimitRpm: number;
  monthlyBudgetUsd: number | null;
  currentMonthCostUsd: number;
  config: Record<string, unknown>;
  createdAt: string;
  updatedAt: string;
}

// ── Row mapper (never returns api_key_encrypted) ────────────────────────────

function rowToProvider(row: Record<string, unknown>): LLMProviderRow {
  return {
    id: row.id as string,
    tenantId: row.tenant_id as string,
    providerName: row.provider_name as string,
    displayName: row.display_name as string,
    baseUrl: (row.base_url as string) ?? null,
    defaultModel: row.default_model as string,
    availableModels: (row.available_models as string[]) ?? [],
    isActive: row.is_active as boolean,
    maxTokensPerRequest: row.max_tokens_per_request as number,
    rateLimitRpm: row.rate_limit_rpm as number,
    monthlyBudgetUsd: row.monthly_budget_usd != null ? Number(row.monthly_budget_usd) : null,
    currentMonthCostUsd: Number(row.current_month_cost_usd ?? 0),
    config: (row.config as Record<string, unknown>) ?? {},
    createdAt: (row.created_at as Date).toISOString(),
    updatedAt: (row.updated_at as Date).toISOString(),
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
       VALUES ($1, $2, 'llm_provider_management', $3, 'llm_provider', $4, $5, NOW())`,
      [tenantId, actorId, action, targetId, details ? JSON.stringify(details) : null],
    );
  } catch (err) {
    logger.error({ err, tenantId, actorId, action, targetId }, 'Failed to write audit log');
  }
}

// ── Select columns (never includes api_key_encrypted) ──────────────────────

const SELECT_COLS = `id, tenant_id, provider_name, display_name, base_url,
  default_model, available_models, is_active, max_tokens_per_request,
  rate_limit_rpm, monthly_budget_usd, current_month_cost_usd, config,
  created_at, updated_at`;

// ── Encrypt API key using the connections encryption service ────────────────

function encryptApiKey(apiKey: string, tenantId: string): unknown {
  // Re-use the connections encryption service. It encrypts a {username, password}
  // pair — we store the API key in the password field with a placeholder username.
  const blob = encryptCredentials({ username: '_llm_', password: apiKey }, tenantId);
  return blob;
}

function decryptApiKey(blob: unknown, tenantId: string): string {
  const creds = decryptCredentials(blob as Parameters<typeof decryptCredentials>[0], tenantId);
  return creds.password;
}

// ── Create Provider ─────────────────────────────────────────────────────────

export async function createProvider(
  tenantId: string,
  data: CreateLLMProviderInput,
  actorId: string,
  client?: PoolClient,
): Promise<LLMProviderRow> {
  // Check for duplicate provider per tenant
  const existing = await tenantQuery(
    client,
    `SELECT id FROM llm_providers WHERE tenant_id = $1 AND provider_name = $2`,
    [tenantId, data.providerName],
  );

  if (existing.rowCount && existing.rowCount > 0) {
    throw new ConflictError(`Provider "${data.providerName}" is already configured for this tenant`);
  }

  // Check if this is the first provider — auto-activate
  const countResult = await tenantQuery(
    client,
    `SELECT COUNT(*)::int AS total FROM llm_providers WHERE tenant_id = $1`,
    [tenantId],
  );
  const isFirst = (countResult.rows[0].total as number) === 0;

  const encrypted = encryptApiKey(data.apiKey, tenantId);

  const result = await tenantQuery(
    client,
    `INSERT INTO llm_providers (
       tenant_id, provider_name, display_name, api_key_encrypted, base_url,
       default_model, available_models, is_active, max_tokens_per_request,
       rate_limit_rpm, monthly_budget_usd, created_by
     ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12)
     RETURNING ${SELECT_COLS}`,
    [
      tenantId,
      data.providerName,
      data.displayName,
      JSON.stringify(encrypted),
      data.baseUrl ?? null,
      data.defaultModel,
      data.availableModels ?? [],
      isFirst, // auto-activate if first
      data.maxTokensPerRequest ?? 4096,
      data.rateLimitRpm ?? 60,
      data.monthlyBudgetUsd ?? null,
      actorId,
    ],
  );

  const created = rowToProvider(result.rows[0]);

  await logAudit(tenantId, actorId, 'llm_provider.created', created.id, {
    providerName: data.providerName,
    displayName: data.displayName,
    isActive: isFirst,
  }, client);

  logger.info({ tenantId, providerId: created.id, providerName: data.providerName }, 'LLM provider created');

  return created;
}

// ── List Providers ──────────────────────────────────────────────────────────

export async function listProviders(
  tenantId: string,
  client?: PoolClient,
): Promise<LLMProviderRow[]> {
  const result = await tenantQuery(
    client,
    `SELECT ${SELECT_COLS} FROM llm_providers WHERE tenant_id = $1 ORDER BY is_active DESC, display_name ASC`,
    [tenantId],
  );

  return result.rows.map(rowToProvider);
}

// ── Get Provider ────────────────────────────────────────────────────────────

export async function getProvider(
  tenantId: string,
  id: string,
  client?: PoolClient,
): Promise<LLMProviderRow> {
  const result = await tenantQuery(
    client,
    `SELECT ${SELECT_COLS} FROM llm_providers WHERE tenant_id = $1 AND id = $2`,
    [tenantId, id],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('LLM provider not found');
  }

  return rowToProvider(result.rows[0]);
}

// ── Get Active Provider ─────────────────────────────────────────────────────

export async function getActiveProvider(
  tenantId: string,
  client?: PoolClient,
): Promise<LLMProviderRow | null> {
  const result = await tenantQuery(
    client,
    `SELECT ${SELECT_COLS} FROM llm_providers WHERE tenant_id = $1 AND is_active = TRUE LIMIT 1`,
    [tenantId],
  );

  if (result.rowCount === 0) {
    return null;
  }

  return rowToProvider(result.rows[0]);
}

// ── Update Provider ─────────────────────────────────────────────────────────

export async function updateProvider(
  tenantId: string,
  id: string,
  data: UpdateLLMProviderInput,
  actorId: string,
  client?: PoolClient,
): Promise<LLMProviderRow> {
  const setClauses: string[] = ['updated_at = NOW()'];
  const params: unknown[] = [tenantId, id];
  let paramIndex = 3;

  if (data.displayName !== undefined) {
    setClauses.push(`display_name = $${paramIndex}`);
    params.push(data.displayName);
    paramIndex++;
  }

  if (data.apiKey !== undefined) {
    const encrypted = encryptApiKey(data.apiKey, tenantId);
    setClauses.push(`api_key_encrypted = $${paramIndex}`);
    params.push(JSON.stringify(encrypted));
    paramIndex++;
  }

  if (data.baseUrl !== undefined) {
    setClauses.push(`base_url = $${paramIndex}`);
    params.push(data.baseUrl);
    paramIndex++;
  }

  if (data.defaultModel !== undefined) {
    setClauses.push(`default_model = $${paramIndex}`);
    params.push(data.defaultModel);
    paramIndex++;
  }

  if (data.availableModels !== undefined) {
    setClauses.push(`available_models = $${paramIndex}`);
    params.push(data.availableModels);
    paramIndex++;
  }

  if (data.maxTokensPerRequest !== undefined) {
    setClauses.push(`max_tokens_per_request = $${paramIndex}`);
    params.push(data.maxTokensPerRequest);
    paramIndex++;
  }

  if (data.rateLimitRpm !== undefined) {
    setClauses.push(`rate_limit_rpm = $${paramIndex}`);
    params.push(data.rateLimitRpm);
    paramIndex++;
  }

  if (data.monthlyBudgetUsd !== undefined) {
    setClauses.push(`monthly_budget_usd = $${paramIndex}`);
    params.push(data.monthlyBudgetUsd);
    paramIndex++;
  }

  if (data.config !== undefined) {
    setClauses.push(`config = $${paramIndex}`);
    params.push(JSON.stringify(data.config));
    paramIndex++;
  }

  const result = await tenantQuery(
    client,
    `UPDATE llm_providers SET ${setClauses.join(', ')}
     WHERE tenant_id = $1 AND id = $2
     RETURNING ${SELECT_COLS}`,
    params,
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('LLM provider not found');
  }

  const updated = rowToProvider(result.rows[0]);

  await logAudit(tenantId, actorId, 'llm_provider.updated', id, data as Record<string, unknown>, client);

  logger.info({ tenantId, providerId: id }, 'LLM provider updated');

  return updated;
}

// ── Delete Provider ─────────────────────────────────────────────────────────

export async function deleteProvider(
  tenantId: string,
  id: string,
  actorId: string,
  client?: PoolClient,
): Promise<void> {
  const result = await tenantQuery(
    client,
    `DELETE FROM llm_providers WHERE tenant_id = $1 AND id = $2 RETURNING id, is_active`,
    [tenantId, id],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('LLM provider not found');
  }

  await logAudit(tenantId, actorId, 'llm_provider.deleted', id, undefined, client);

  logger.info({ tenantId, providerId: id }, 'LLM provider deleted');
}

// ── Activate Provider ───────────────────────────────────────────────────────

export async function activateProvider(
  tenantId: string,
  id: string,
  actorId: string,
  client?: PoolClient,
): Promise<LLMProviderRow> {
  // Deactivate all providers for tenant
  await tenantQuery(
    client,
    `UPDATE llm_providers SET is_active = FALSE, updated_at = NOW() WHERE tenant_id = $1`,
    [tenantId],
  );

  // Activate the requested provider
  const result = await tenantQuery(
    client,
    `UPDATE llm_providers SET is_active = TRUE, updated_at = NOW()
     WHERE tenant_id = $1 AND id = $2
     RETURNING ${SELECT_COLS}`,
    [tenantId, id],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('LLM provider not found');
  }

  const activated = rowToProvider(result.rows[0]);

  await logAudit(tenantId, actorId, 'llm_provider.activated', id, {
    providerName: activated.providerName,
  }, client);

  logger.info({ tenantId, providerId: id, providerName: activated.providerName }, 'LLM provider activated');

  return activated;
}

// ── Get Decrypted API Key (internal only) ───────────────────────────────────

export async function getDecryptedApiKey(
  tenantId: string,
  id: string,
  client?: PoolClient,
): Promise<string> {
  const result = await tenantQuery(
    client,
    `SELECT api_key_encrypted FROM llm_providers WHERE tenant_id = $1 AND id = $2`,
    [tenantId, id],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('LLM provider not found');
  }

  const blob = result.rows[0].api_key_encrypted;
  if (!blob) {
    throw new Error('No API key configured for this provider');
  }

  return decryptApiKey(blob, tenantId);
}

// ── Test Provider ───────────────────────────────────────────────────────────

export async function testProvider(
  tenantId: string,
  id: string,
  client?: PoolClient,
): Promise<{ success: boolean; message: string; latencyMs: number }> {
  const provider = await getProvider(tenantId, id, client);
  const apiKey = await getDecryptedApiKey(tenantId, id, client);

  const start = Date.now();

  try {
    if (provider.providerName === 'anthropic') {
      const { default: Anthropic } = await import('@anthropic-ai/sdk');
      const anthropic = new Anthropic({ apiKey });
      await anthropic.messages.create({
        model: provider.defaultModel,
        max_tokens: 10,
        messages: [{ role: 'user', content: 'Say "ok"' }],
      });
    } else if (provider.providerName === 'openai') {
      // Simple HTTP test for OpenAI-compatible APIs
      const baseUrl = provider.baseUrl || 'https://api.openai.com/v1';
      const response = await fetch(`${baseUrl}/models`, {
        headers: { Authorization: `Bearer ${apiKey}` },
      });
      if (!response.ok) {
        throw new Error(`API returned ${response.status}: ${response.statusText}`);
      }
    } else if (provider.providerName === 'google') {
      const baseUrl = provider.baseUrl || 'https://generativelanguage.googleapis.com/v1beta';
      const response = await fetch(`${baseUrl}/models?key=${apiKey}`);
      if (!response.ok) {
        throw new Error(`API returned ${response.status}: ${response.statusText}`);
      }
    } else if (provider.providerName === 'mistral') {
      const baseUrl = provider.baseUrl || 'https://api.mistral.ai/v1';
      const response = await fetch(`${baseUrl}/models`, {
        headers: { Authorization: `Bearer ${apiKey}` },
      });
      if (!response.ok) {
        throw new Error(`API returned ${response.status}: ${response.statusText}`);
      }
    } else if (provider.providerName === 'local') {
      if (!provider.baseUrl) {
        throw new Error('Local provider requires a base URL');
      }
      const response = await fetch(`${provider.baseUrl}/models`);
      if (!response.ok) {
        throw new Error(`API returned ${response.status}: ${response.statusText}`);
      }
    }

    const latencyMs = Date.now() - start;
    logger.info({ tenantId, providerId: id, latencyMs }, 'LLM provider test successful');

    return { success: true, message: 'Connection successful', latencyMs };
  } catch (err) {
    const latencyMs = Date.now() - start;
    const message = (err as Error).message ?? 'Unknown error';
    logger.warn({ tenantId, providerId: id, err, latencyMs }, 'LLM provider test failed');

    return { success: false, message, latencyMs };
  }
}
