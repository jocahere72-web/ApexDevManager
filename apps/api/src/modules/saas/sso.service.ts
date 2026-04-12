// ---------------------------------------------------------------------------
// SSO Service (U13 SaaS Readiness)
// ---------------------------------------------------------------------------

import { pool } from '../../config/database.js';
import { logger } from '../../lib/logger.js';
import { NotFoundError, ValidationError } from '../../lib/errors.js';
import type {
  SSOConfig,
  SCIMConfig,
  SCIMStatus,
  ConfigureSAMLRequest,
  ConfigureSCIMRequest,
  SSOTestResult,
} from '@apex-dev-manager/shared-types';

// ---------------------------------------------------------------------------
// Row mappers
// ---------------------------------------------------------------------------

function rowToSSOConfig(row: Record<string, unknown>): SSOConfig {
  const attrMapping = typeof row.attribute_mapping === 'string'
    ? JSON.parse(row.attribute_mapping as string)
    : (row.attribute_mapping as Record<string, string>) ?? {};

  return {
    tenantId: row.tenant_id as string,
    protocol: row.protocol as SSOConfig['protocol'],
    enabled: (row.enabled as boolean) ?? false,
    issuer: row.issuer as string,
    ssoUrl: row.sso_url as string,
    certificate: row.certificate as string,
    entityId: row.entity_id as string,
    nameIdFormat: (row.name_id_format as string) ?? 'urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress',
    attributeMapping: attrMapping,
    allowIdpInitiated: (row.allow_idp_initiated as boolean) ?? false,
    signRequests: (row.sign_requests as boolean) ?? true,
    lastTestedAt: row.last_tested_at ? (row.last_tested_at as Date).toISOString() : undefined,
    testResult: (row.test_result as 'success' | 'failure') ?? undefined,
    testError: (row.test_error as string) ?? undefined,
    createdAt: (row.created_at as Date).toISOString(),
    updatedAt: (row.updated_at as Date).toISOString(),
  };
}

function rowToSCIMConfig(row: Record<string, unknown>): SCIMConfig {
  return {
    tenantId: row.tenant_id as string,
    enabled: (row.enabled as boolean) ?? false,
    status: (row.status as SCIMStatus) ?? 'disabled',
    endpoint: row.endpoint as string,
    bearerToken: row.bearer_token as string,
    syncUsers: (row.sync_users as boolean) ?? true,
    syncGroups: (row.sync_groups as boolean) ?? false,
    defaultRole: (row.default_role as string) ?? 'developer',
    lastSyncAt: row.last_sync_at ? (row.last_sync_at as Date).toISOString() : undefined,
    lastSyncResult: (row.last_sync_result as string) ?? undefined,
    syncedUsers: (row.synced_users as number) ?? 0,
    syncedGroups: (row.synced_groups as number) ?? 0,
    createdAt: (row.created_at as Date).toISOString(),
    updatedAt: (row.updated_at as Date).toISOString(),
  };
}

// ---------------------------------------------------------------------------
// Configure SAML
// ---------------------------------------------------------------------------

/**
 * Configure or update SAML SSO for a tenant.
 */
export async function configureSAML(
  tenantId: string,
  request: ConfigureSAMLRequest,
): Promise<SSOConfig> {
  logger.info({ tenantId }, 'Configuring SAML SSO');

  // Validate certificate format
  if (!request.certificate.includes('BEGIN CERTIFICATE')) {
    throw new ValidationError('Invalid certificate format. Must be PEM-encoded X.509 certificate.');
  }

  // Upsert SSO config
  const result = await pool.query(
    `INSERT INTO sso_configs (tenant_id, protocol, enabled, issuer, sso_url, certificate, entity_id, name_id_format, attribute_mapping, allow_idp_initiated, sign_requests)
     VALUES ($1, 'saml', true, $2, $3, $4, $5, $6, $7, $8, $9)
     ON CONFLICT (tenant_id)
     DO UPDATE SET
       protocol = 'saml',
       enabled = true,
       issuer = $2,
       sso_url = $3,
       certificate = $4,
       entity_id = $5,
       name_id_format = $6,
       attribute_mapping = $7,
       allow_idp_initiated = $8,
       sign_requests = $9,
       updated_at = NOW()
     RETURNING *`,
    [
      tenantId,
      request.issuer,
      request.ssoUrl,
      request.certificate,
      request.entityId,
      request.nameIdFormat ?? 'urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress',
      JSON.stringify(request.attributeMapping ?? { email: 'email', name: 'displayName' }),
      request.allowIdpInitiated ?? false,
      request.signRequests ?? true,
    ],
  );

  // Update tenant SSO flag
  await pool.query(
    `UPDATE tenants SET sso_configured = true, updated_at = NOW() WHERE id = $1`,
    [tenantId],
  );

  logger.info({ tenantId }, 'SAML SSO configured successfully');
  return rowToSSOConfig(result.rows[0]);
}

// ---------------------------------------------------------------------------
// Configure SCIM
// ---------------------------------------------------------------------------

/**
 * Configure or update SCIM provisioning for a tenant.
 */
export async function configureSCIM(
  tenantId: string,
  request: ConfigureSCIMRequest,
): Promise<SCIMConfig> {
  logger.info({ tenantId, enabled: request.enabled }, 'Configuring SCIM');

  // Generate SCIM endpoint and bearer token
  const endpoint = `/api/v1/scim/${tenantId}`;
  const bearerToken = generateSCIMToken();

  const result = await pool.query(
    `INSERT INTO scim_configs (tenant_id, enabled, status, endpoint, bearer_token, sync_users, sync_groups, default_role)
     VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
     ON CONFLICT (tenant_id)
     DO UPDATE SET
       enabled = $2,
       status = $3,
       sync_users = $6,
       sync_groups = $7,
       default_role = $8,
       updated_at = NOW()
     RETURNING *`,
    [
      tenantId,
      request.enabled,
      request.enabled ? 'enabled' : 'disabled',
      endpoint,
      bearerToken,
      request.syncUsers ?? true,
      request.syncGroups ?? false,
      request.defaultRole ?? 'developer',
    ],
  );

  // Update tenant SCIM flag
  await pool.query(
    `UPDATE tenants SET scim_configured = $1, updated_at = NOW() WHERE id = $2`,
    [request.enabled, tenantId],
  );

  logger.info({ tenantId }, 'SCIM configured successfully');
  return rowToSCIMConfig(result.rows[0]);
}

// ---------------------------------------------------------------------------
// Get SSO Config
// ---------------------------------------------------------------------------

/**
 * Get the current SSO configuration for a tenant.
 */
export async function getSSOConfig(
  tenantId: string,
): Promise<{ sso: SSOConfig | null; scim: SCIMConfig | null }> {
  const [ssoResult, scimResult] = await Promise.all([
    pool.query(`SELECT * FROM sso_configs WHERE tenant_id = $1`, [tenantId]),
    pool.query(`SELECT * FROM scim_configs WHERE tenant_id = $1`, [tenantId]),
  ]);

  return {
    sso: ssoResult.rowCount ? rowToSSOConfig(ssoResult.rows[0]) : null,
    scim: scimResult.rowCount ? rowToSCIMConfig(scimResult.rows[0]) : null,
  };
}

// ---------------------------------------------------------------------------
// Test SSO Connection
// ---------------------------------------------------------------------------

/**
 * Test the SSO connection for a tenant.
 */
export async function testSSOConnection(
  tenantId: string,
): Promise<SSOTestResult> {
  logger.info({ tenantId }, 'Testing SSO connection');

  const ssoResult = await pool.query(
    `SELECT * FROM sso_configs WHERE tenant_id = $1`,
    [tenantId],
  );

  if (ssoResult.rowCount === 0) {
    throw new NotFoundError('SSO not configured for this tenant');
  }

  const config = rowToSSOConfig(ssoResult.rows[0]);

  try {
    // Test connectivity to the IdP
    const response = await fetch(config.ssoUrl, {
      method: 'HEAD',
      signal: AbortSignal.timeout(10000),
    });

    const success = response.ok || response.status === 405; // Some IdPs return 405 for HEAD

    // Update test result
    await pool.query(
      `UPDATE sso_configs
       SET last_tested_at = NOW(), test_result = $1, test_error = $2, updated_at = NOW()
       WHERE tenant_id = $3`,
      [success ? 'success' : 'failure', success ? null : `HTTP ${response.status}`, tenantId],
    );

    const result: SSOTestResult = {
      success,
      protocol: config.protocol,
      message: success
        ? 'SSO connection test successful. IdP is reachable.'
        : `SSO connection test failed. IdP returned HTTP ${response.status}.`,
      details: {
        issuer: config.issuer,
        ssoUrl: config.ssoUrl,
        entityId: config.entityId,
        httpStatus: response.status,
      },
      testedAt: new Date().toISOString(),
    };

    return result;
  } catch (err) {
    const errorMessage = (err as Error).message;

    await pool.query(
      `UPDATE sso_configs
       SET last_tested_at = NOW(), test_result = 'failure', test_error = $1, updated_at = NOW()
       WHERE tenant_id = $2`,
      [errorMessage, tenantId],
    );

    return {
      success: false,
      protocol: config.protocol,
      message: `SSO connection test failed: ${errorMessage}`,
      testedAt: new Date().toISOString(),
    };
  }
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

function generateSCIMToken(): string {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  let token = 'scim_';
  for (let i = 0; i < 48; i++) {
    token += chars.charAt(Math.floor(Math.random() * chars.length));
  }
  return token;
}
