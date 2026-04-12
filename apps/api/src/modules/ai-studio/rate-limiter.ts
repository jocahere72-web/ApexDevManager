import { logger } from '../../lib/logger.js';
import { RateLimitError } from '../../lib/errors.js';
import { tenantQuery } from '../../lib/tenant-db.js';
import type { PoolClient } from 'pg';

// ---------------------------------------------------------------------------
// Configuration
// ---------------------------------------------------------------------------

/** Default monthly token budget per tenant (10M tokens). */
const DEFAULT_TENANT_MONTHLY_BUDGET = 10_000_000;

/** Default per-user daily token limit (500K tokens). */
const DEFAULT_USER_DAILY_LIMIT = 500_000;

/** Default per-user requests per minute. */
const DEFAULT_USER_RPM = 20;

// In-memory RPM tracker (per user)
const rpmTracker = new Map<string, { count: number; windowStart: number }>();

// ---------------------------------------------------------------------------
// Rate Limiter
// ---------------------------------------------------------------------------

export interface RateLimitResult {
  allowed: boolean;
  tenantTokensUsed: number;
  tenantTokensLimit: number;
  userTokensUsed: number;
  userTokensLimit: number;
}

/**
 * Check rate limits before processing an AI request.
 * Checks:
 * 1. Per-user requests per minute (in-memory)
 * 2. Per-tenant monthly token budget (from DB + tenant settings)
 * 3. Per-user daily token limit (from DB)
 *
 * Throws RateLimitError if any limit is exceeded.
 */
export async function checkRateLimit(
  tenantId: string,
  userId: string,
  client?: PoolClient,
): Promise<RateLimitResult> {
  // ── Per-user RPM check (in-memory) ──────────────────────────────────
  const now = Date.now();
  const rpmKey = `${tenantId}:${userId}`;
  const rpm = rpmTracker.get(rpmKey);

  if (rpm) {
    const windowElapsed = now - rpm.windowStart;
    if (windowElapsed < 60_000) {
      if (rpm.count >= DEFAULT_USER_RPM) {
        throw new RateLimitError(
          `Rate limit exceeded: maximum ${DEFAULT_USER_RPM} AI requests per minute`,
        );
      }
      rpm.count++;
    } else {
      rpmTracker.set(rpmKey, { count: 1, windowStart: now });
    }
  } else {
    rpmTracker.set(rpmKey, { count: 1, windowStart: now });
  }

  // ── Tenant monthly token budget ─────────────────────────────────────
  const tenantBudget = await getTenantMonthlyBudget(tenantId, client);

  const tenantUsageResult = await tenantQuery(client,
    `SELECT COALESCE(SUM(total_tokens), 0)::int AS total
     FROM ai_token_usage
     WHERE tenant_id = $1
       AND created_at >= date_trunc('month', NOW())`,
    [tenantId],
  );
  const tenantTokensUsed = tenantUsageResult.rows[0].total as number;

  if (tenantTokensUsed >= tenantBudget) {
    logger.warn(
      { tenantId, used: tenantTokensUsed, budget: tenantBudget },
      'Tenant AI token budget exceeded',
    );
    throw new RateLimitError(
      'Monthly AI token budget exceeded for your organization. Contact your administrator.',
    );
  }

  // ── Per-user daily token limit ──────────────────────────────────────
  const userUsageResult = await tenantQuery(client,
    `SELECT COALESCE(SUM(total_tokens), 0)::int AS total
     FROM ai_token_usage
     WHERE tenant_id = $1
       AND user_id = $2
       AND created_at >= date_trunc('day', NOW())`,
    [tenantId, userId],
  );
  const userTokensUsed = userUsageResult.rows[0].total as number;

  if (userTokensUsed >= DEFAULT_USER_DAILY_LIMIT) {
    throw new RateLimitError(
      'Daily AI token limit exceeded. Please try again tomorrow.',
    );
  }

  return {
    allowed: true,
    tenantTokensUsed,
    tenantTokensLimit: tenantBudget,
    userTokensUsed,
    userTokensLimit: DEFAULT_USER_DAILY_LIMIT,
  };
}

/**
 * Retrieve the tenant's monthly AI token budget from tenant settings.
 * Falls back to the default budget if not configured.
 */
async function getTenantMonthlyBudget(tenantId: string, client?: PoolClient): Promise<number> {
  try {
    const result = await tenantQuery(client,
      `SELECT settings->>'aiCreditsMonthly' AS budget
       FROM tenants
       WHERE id = $1`,
      [tenantId],
    );

    if (result.rowCount && result.rows[0].budget) {
      const parsed = parseInt(result.rows[0].budget, 10);
      if (!isNaN(parsed) && parsed > 0) {
        return parsed;
      }
    }
  } catch (err) {
    logger.error({ err, tenantId }, 'Failed to fetch tenant AI budget');
  }

  return DEFAULT_TENANT_MONTHLY_BUDGET;
}

/**
 * Clean up stale RPM entries. Call periodically (e.g. every 5 minutes).
 */
export function cleanupRpmTracker(): void {
  const now = Date.now();
  for (const [key, value] of rpmTracker.entries()) {
    if (now - value.windowStart > 120_000) {
      rpmTracker.delete(key);
    }
  }
}
