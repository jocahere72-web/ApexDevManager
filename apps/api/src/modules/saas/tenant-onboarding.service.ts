// ---------------------------------------------------------------------------
// Tenant Onboarding Service (U13 SaaS Readiness)
// ---------------------------------------------------------------------------

import { pool, getClient } from '../../config/database.js';
import { logger } from '../../lib/logger.js';
import { NotFoundError, ValidationError } from '../../lib/errors.js';
import type {
  TenantOnboarding,
  TenantQuota,
  TenantSettings,
  TenantStatus,
  CreateTenantRequest,
  UpdateTenantConfigRequest,
} from '@apex-dev-manager/shared-types';

// ---------------------------------------------------------------------------
// Default settings and quotas by plan
// ---------------------------------------------------------------------------

const PLAN_QUOTAS: Record<string, Omit<TenantQuota, 'currentUsers' | 'currentConnections' | 'currentApps'>> = {
  free: {
    maxUsers: 5,
    maxConnections: 2,
    maxApps: 3,
    maxAiTokensPerMonth: 100000,
    maxStorageGb: 1,
    maxApiCallsPerDay: 1000,
  },
  starter: {
    maxUsers: 20,
    maxConnections: 5,
    maxApps: 10,
    maxAiTokensPerMonth: 500000,
    maxStorageGb: 5,
    maxApiCallsPerDay: 10000,
  },
  professional: {
    maxUsers: 100,
    maxConnections: 20,
    maxApps: 50,
    maxAiTokensPerMonth: 2000000,
    maxStorageGb: 25,
    maxApiCallsPerDay: 50000,
  },
  enterprise: {
    maxUsers: -1, // unlimited
    maxConnections: -1,
    maxApps: -1,
    maxAiTokensPerMonth: -1,
    maxStorageGb: 100,
    maxApiCallsPerDay: -1,
  },
};

const DEFAULT_SETTINGS: TenantSettings = {
  defaultTimezone: 'UTC',
  defaultLocale: 'en-US',
  enforceSSO: false,
  allowPublicSignup: false,
  passwordPolicy: {
    minLength: 12,
    requireUppercase: true,
    requireNumbers: true,
    requireSpecial: true,
    maxAgeDays: 90,
  },
  featureFlags: {
    aiStudio: true,
    codeFactory: true,
    marketplace: true,
    testStudio: true,
    knowledgeEngine: true,
  },
};

// ---------------------------------------------------------------------------
// Row mappers
// ---------------------------------------------------------------------------

function rowToTenant(row: Record<string, unknown>): TenantOnboarding {
  const quota = typeof row.quota === 'string' ? JSON.parse(row.quota as string) : (row.quota as TenantQuota);
  const settings = typeof row.settings === 'string' ? JSON.parse(row.settings as string) : (row.settings as TenantSettings);

  return {
    id: row.id as string,
    name: row.name as string,
    slug: row.slug as string,
    status: row.status as TenantStatus,
    adminEmail: row.admin_email as string,
    adminUserId: (row.admin_user_id as string) ?? undefined,
    plan: row.plan as TenantOnboarding['plan'],
    quota: quota ?? { ...PLAN_QUOTAS.free, currentUsers: 0, currentConnections: 0, currentApps: 0 },
    settings: settings ?? DEFAULT_SETTINGS,
    ssoConfigured: (row.sso_configured as boolean) ?? false,
    scimConfigured: (row.scim_configured as boolean) ?? false,
    provisionedAt: row.provisioned_at ? (row.provisioned_at as Date).toISOString() : undefined,
    createdAt: (row.created_at as Date).toISOString(),
    updatedAt: (row.updated_at as Date).toISOString(),
  };
}

// ---------------------------------------------------------------------------
// Create Tenant
// ---------------------------------------------------------------------------

/**
 * Provision a new tenant: create DB schema, admin user, and set defaults.
 */
export async function createTenant(
  request: CreateTenantRequest,
): Promise<TenantOnboarding> {
  logger.info({ name: request.name, slug: request.slug, plan: request.plan }, 'Creating new tenant');

  // Validate slug uniqueness
  const existingResult = await pool.query(
    `SELECT id FROM tenants WHERE slug = $1`,
    [request.slug],
  );

  if (existingResult.rowCount && existingResult.rowCount > 0) {
    throw new ValidationError('Tenant slug already exists');
  }

  const client = await getClient();
  try {
    await client.query('BEGIN');

    // Create tenant record
    const planQuota = PLAN_QUOTAS[request.plan] ?? PLAN_QUOTAS.free;
    const quota: TenantQuota = {
      ...planQuota,
      currentUsers: 0,
      currentConnections: 0,
      currentApps: 0,
    };

    const settings: TenantSettings = {
      ...DEFAULT_SETTINGS,
      ...(request.settings ?? {}),
    };

    const tenantResult = await client.query(
      `INSERT INTO tenants (name, slug, status, admin_email, plan, quota, settings)
       VALUES ($1, $2, 'provisioning', $3, $4, $5, $6)
       RETURNING *`,
      [
        request.name,
        request.slug,
        request.adminEmail,
        request.plan,
        JSON.stringify(quota),
        JSON.stringify(settings),
      ],
    );

    const tenantId = tenantResult.rows[0].id as string;

    // Create the tenant schema (namespace isolation)
    await client.query(`CREATE SCHEMA IF NOT EXISTS tenant_${request.slug.replace(/-/g, '_')}`);

    // Create admin user
    const userResult = await client.query(
      `INSERT INTO users (tenant_id, email, display_name, role, status)
       VALUES ($1, $2, $3, 'admin', 'active')
       RETURNING id`,
      [tenantId, request.adminEmail, request.name + ' Admin'],
    );

    const adminUserId = userResult.rows[0].id as string;

    // Update tenant with admin user and mark as active
    await client.query(
      `UPDATE tenants
       SET admin_user_id = $1, status = 'active', provisioned_at = NOW(), updated_at = NOW()
       WHERE id = $2`,
      [adminUserId, tenantId],
    );

    await client.query('COMMIT');

    // Fetch the final tenant state
    const finalResult = await pool.query(`SELECT * FROM tenants WHERE id = $1`, [tenantId]);

    logger.info({ tenantId, slug: request.slug }, 'Tenant created successfully');
    return rowToTenant(finalResult.rows[0]);
  } catch (err) {
    await client.query('ROLLBACK');
    throw err;
  } finally {
    client.release();
  }
}

// ---------------------------------------------------------------------------
// Suspend Tenant
// ---------------------------------------------------------------------------

/**
 * Suspend a tenant (disable access but retain data).
 */
export async function suspendTenant(
  tenantId: string,
): Promise<TenantOnboarding> {
  const result = await pool.query(
    `UPDATE tenants SET status = 'suspended', updated_at = NOW()
     WHERE id = $1 AND status = 'active'
     RETURNING *`,
    [tenantId],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Active tenant not found');
  }

  logger.info({ tenantId }, 'Tenant suspended');
  return rowToTenant(result.rows[0]);
}

// ---------------------------------------------------------------------------
// Delete Tenant
// ---------------------------------------------------------------------------

/**
 * Delete a tenant and clean up all associated data.
 */
export async function deleteTenant(
  tenantId: string,
): Promise<void> {
  const client = await getClient();
  try {
    await client.query('BEGIN');

    // Get tenant slug for schema cleanup
    const tenantResult = await client.query(
      `SELECT slug FROM tenants WHERE id = $1`,
      [tenantId],
    );

    if (tenantResult.rowCount === 0) {
      throw new NotFoundError('Tenant not found');
    }

    const slug = tenantResult.rows[0].slug as string;

    // Mark as deleting
    await client.query(
      `UPDATE tenants SET status = 'deleting', updated_at = NOW() WHERE id = $1`,
      [tenantId],
    );

    // Delete all tenant data (cascade via foreign keys)
    await client.query(`DELETE FROM ai_token_usage WHERE tenant_id = $1`, [tenantId]);
    await client.query(`DELETE FROM ai_messages WHERE tenant_id = $1`, [tenantId]);
    await client.query(`DELETE FROM ai_conversations WHERE tenant_id = $1`, [tenantId]);
    await client.query(`DELETE FROM connections WHERE tenant_id = $1`, [tenantId]);
    await client.query(`DELETE FROM users WHERE tenant_id = $1`, [tenantId]);

    // Drop tenant schema
    await client.query(`DROP SCHEMA IF EXISTS tenant_${slug.replace(/-/g, '_')} CASCADE`);

    // Mark as deleted (soft delete)
    await client.query(
      `UPDATE tenants SET status = 'deleted', updated_at = NOW() WHERE id = $1`,
      [tenantId],
    );

    await client.query('COMMIT');
    logger.info({ tenantId, slug }, 'Tenant deleted successfully');
  } catch (err) {
    await client.query('ROLLBACK');
    throw err;
  } finally {
    client.release();
  }
}

// ---------------------------------------------------------------------------
// Get / Update Tenant Config
// ---------------------------------------------------------------------------

/**
 * Get tenant configuration.
 */
export async function getTenantConfig(
  tenantId: string,
): Promise<TenantOnboarding> {
  const result = await pool.query(
    `SELECT * FROM tenants WHERE id = $1`,
    [tenantId],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Tenant not found');
  }

  // Enrich with current usage counts
  const tenant = rowToTenant(result.rows[0]);

  const [usersCount, connsCount, appsCount] = await Promise.all([
    pool.query(`SELECT COUNT(*)::int AS count FROM users WHERE tenant_id = $1`, [tenantId]),
    pool.query(`SELECT COUNT(*)::int AS count FROM connections WHERE tenant_id = $1`, [tenantId]),
    pool.query(
      `SELECT COUNT(DISTINCT app_id)::int AS count FROM apex_components WHERE tenant_id = $1`,
      [tenantId],
    ),
  ]);

  tenant.quota.currentUsers = usersCount.rows[0].count as number;
  tenant.quota.currentConnections = connsCount.rows[0].count as number;
  tenant.quota.currentApps = appsCount.rows[0].count as number;

  return tenant;
}

/**
 * Update tenant configuration.
 */
export async function updateTenantConfig(
  tenantId: string,
  request: UpdateTenantConfigRequest,
): Promise<TenantOnboarding> {
  // Get current config
  const current = await getTenantConfig(tenantId);

  const updatedPlan = request.plan ?? current.plan;
  const updatedQuota: TenantQuota = {
    ...current.quota,
    ...(request.quota ?? {}),
    // If plan changed, update limits from plan defaults
    ...(request.plan && request.plan !== current.plan
      ? PLAN_QUOTAS[request.plan] ?? {}
      : {}),
  };

  const updatedSettings: TenantSettings = {
    ...current.settings,
    ...(request.settings ?? {}),
  };

  const result = await pool.query(
    `UPDATE tenants
     SET name = COALESCE($1, name),
         plan = $2,
         quota = $3,
         settings = $4,
         updated_at = NOW()
     WHERE id = $5
     RETURNING *`,
    [
      request.name ?? current.name,
      updatedPlan,
      JSON.stringify(updatedQuota),
      JSON.stringify(updatedSettings),
      tenantId,
    ],
  );

  logger.info({ tenantId, plan: updatedPlan }, 'Tenant config updated');
  return rowToTenant(result.rows[0]);
}
