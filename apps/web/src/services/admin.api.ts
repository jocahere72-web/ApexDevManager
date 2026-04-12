import apiClient from '../lib/api-client';
import type {
  TenantOnboarding,
  SSOConfig,
  SCIMConfig,
  SSOTestResult,
  CreateTenantRequest,
  UpdateTenantConfigRequest,
  ConfigureSAMLRequest,
  ConfigureSCIMRequest,
} from '@apex-dev-manager/shared-types';

const TENANT_BASE = '/api/v1/admin';
const SSO_BASE = '/api/v1/admin';

// ---------------------------------------------------------------------------
// Tenant Management
// ---------------------------------------------------------------------------

/**
 * Create a new tenant.
 */
export async function createTenant(request: CreateTenantRequest): Promise<TenantOnboarding> {
  const { data } = await apiClient.post<{ data: TenantOnboarding }>(`${TENANT_BASE}/tenants`, request);
  return data.data;
}

/**
 * Get tenant configuration.
 */
export async function getTenantConfig(tenantId: string): Promise<TenantOnboarding> {
  const { data } = await apiClient.get<{ data: TenantOnboarding }>(`${TENANT_BASE}/tenants/${tenantId}/config`);
  return data.data;
}

/**
 * Update tenant configuration.
 */
export async function updateTenantConfig(tenantId: string, request: UpdateTenantConfigRequest): Promise<TenantOnboarding> {
  const { data } = await apiClient.patch<{ data: TenantOnboarding }>(`${TENANT_BASE}/tenants/${tenantId}/config`, request);
  return data.data;
}

/**
 * Suspend a tenant.
 */
export async function suspendTenant(tenantId: string): Promise<TenantOnboarding> {
  const { data } = await apiClient.post<{ data: TenantOnboarding }>(`${TENANT_BASE}/tenants/${tenantId}/suspend`);
  return data.data;
}

/**
 * Delete a tenant.
 */
export async function deleteTenant(tenantId: string): Promise<void> {
  await apiClient.delete(`${TENANT_BASE}/tenants/${tenantId}`);
}

// ---------------------------------------------------------------------------
// SSO Management
// ---------------------------------------------------------------------------

/**
 * Configure SAML SSO.
 */
export async function configureSAML(request: ConfigureSAMLRequest): Promise<SSOConfig> {
  const { data } = await apiClient.post<{ data: SSOConfig }>(`${SSO_BASE}/sso/saml`, request);
  return data.data;
}

/**
 * Configure SCIM provisioning.
 */
export async function configureSCIM(request: ConfigureSCIMRequest): Promise<SCIMConfig> {
  const { data } = await apiClient.post<{ data: SCIMConfig }>(`${SSO_BASE}/sso/scim`, request);
  return data.data;
}

/**
 * Get SSO configuration.
 */
export async function getSSOConfig(): Promise<{ sso: SSOConfig | null; scim: SCIMConfig | null }> {
  const { data } = await apiClient.get<{ data: { sso: SSOConfig | null; scim: SCIMConfig | null } }>(`${SSO_BASE}/sso/config`);
  return data.data;
}

/**
 * Test SSO connection.
 */
export async function testSSOConnection(): Promise<SSOTestResult> {
  const { data } = await apiClient.post<{ data: SSOTestResult }>(`${SSO_BASE}/sso/test`);
  return data.data;
}
