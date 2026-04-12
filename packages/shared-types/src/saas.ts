// ---------------------------------------------------------------------------
// SaaS Readiness shared types (U13 Multi-tenancy & SSO)
// ---------------------------------------------------------------------------

/**
 * Status of a tenant.
 */
export type SaaSTenantStatus = 'provisioning' | 'active' | 'suspended' | 'deleting' | 'deleted';

/**
 * SSO protocol type.
 */
export type SSOProtocol = 'saml' | 'oidc';

/**
 * SCIM provisioning status.
 */
export type SCIMStatus = 'disabled' | 'enabled' | 'syncing' | 'error';

/**
 * Tenant onboarding and configuration.
 */
export interface TenantOnboarding {
  id: string;
  name: string;
  slug: string;
  status: SaaSTenantStatus;
  adminEmail: string;
  adminUserId?: string;
  plan: 'free' | 'starter' | 'professional' | 'enterprise';
  quota: SaaSTenantQuota;
  settings: SaaSTenantSettings;
  ssoConfigured: boolean;
  scimConfigured: boolean;
  provisionedAt?: string;
  createdAt: string;
  updatedAt: string;
}

/**
 * Resource quotas for a tenant.
 */
export interface SaaSTenantQuota {
  maxUsers: number;
  maxConnections: number;
  maxApps: number;
  maxAiTokensPerMonth: number;
  maxStorageGb: number;
  maxApiCallsPerDay: number;
  currentUsers: number;
  currentConnections: number;
  currentApps: number;
}

/**
 * Tenant-level settings.
 */
export interface SaaSTenantSettings {
  defaultTimezone: string;
  defaultLocale: string;
  enforceSSO: boolean;
  allowPublicSignup: boolean;
  passwordPolicy: {
    minLength: number;
    requireUppercase: boolean;
    requireNumbers: boolean;
    requireSpecial: boolean;
    maxAgeDays: number;
  };
  featureFlags: Record<string, boolean>;
}

/**
 * SSO configuration for a tenant.
 */
export interface SSOConfig {
  tenantId: string;
  protocol: SSOProtocol;
  enabled: boolean;
  issuer: string;
  ssoUrl: string;
  certificate: string;
  entityId: string;
  nameIdFormat: string;
  attributeMapping: Record<string, string>;
  allowIdpInitiated: boolean;
  signRequests: boolean;
  lastTestedAt?: string;
  testResult?: 'success' | 'failure';
  testError?: string;
  createdAt: string;
  updatedAt: string;
}

/**
 * SCIM provisioning configuration.
 */
export interface SCIMConfig {
  tenantId: string;
  enabled: boolean;
  status: SCIMStatus;
  endpoint: string;
  bearerToken: string;
  syncUsers: boolean;
  syncGroups: boolean;
  defaultRole: string;
  lastSyncAt?: string;
  lastSyncResult?: string;
  syncedUsers: number;
  syncedGroups: number;
  createdAt: string;
  updatedAt: string;
}

/**
 * Request to create a new tenant.
 */
export interface CreateTenantRequest {
  name: string;
  slug: string;
  adminEmail: string;
  plan: 'free' | 'starter' | 'professional' | 'enterprise';
  settings?: Partial<SaaSTenantSettings>;
}

/**
 * Request to update tenant configuration.
 */
export interface UpdateTenantConfigRequest {
  name?: string;
  plan?: 'free' | 'starter' | 'professional' | 'enterprise';
  quota?: Partial<SaaSTenantQuota>;
  settings?: Partial<SaaSTenantSettings>;
}

/**
 * Request to configure SAML SSO.
 */
export interface ConfigureSAMLRequest {
  issuer: string;
  ssoUrl: string;
  certificate: string;
  entityId: string;
  nameIdFormat?: string;
  attributeMapping?: Record<string, string>;
  allowIdpInitiated?: boolean;
  signRequests?: boolean;
}

/**
 * Request to configure SCIM provisioning.
 */
export interface ConfigureSCIMRequest {
  enabled: boolean;
  syncUsers?: boolean;
  syncGroups?: boolean;
  defaultRole?: string;
}

/**
 * SSO test connection result.
 */
export interface SSOTestResult {
  success: boolean;
  protocol: SSOProtocol;
  message: string;
  details?: Record<string, unknown>;
  testedAt: string;
}
