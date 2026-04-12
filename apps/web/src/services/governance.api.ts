import apiClient from '../lib/api-client';
import type {
  AIAuditEntry,
  SafetyRule,
  SafetyAction,
  GovernanceDashboard,
  TenantQuota,
} from '@apex-dev-manager/shared-types';

// ---------------------------------------------------------------------------
// Audit log
// ---------------------------------------------------------------------------

export async function getAuditLog(
  limit?: number,
  offset?: number,
  filters?: { userId?: string; blocked?: boolean; model?: string },
): Promise<{ items: AIAuditEntry[]; total: number }> {
  const { data } = await apiClient.get<{ data: { items: AIAuditEntry[]; total: number } }>(
    '/governance/audit-log',
    { params: { limit, offset, ...filters } },
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Dashboard
// ---------------------------------------------------------------------------

export async function getDashboard(): Promise<GovernanceDashboard> {
  const { data } = await apiClient.get<{ data: GovernanceDashboard }>('/governance/dashboard');
  return data.data;
}

// ---------------------------------------------------------------------------
// Safety rules
// ---------------------------------------------------------------------------

export async function getSafetyRules(): Promise<SafetyRule[]> {
  const { data } = await apiClient.get<{ data: SafetyRule[] }>('/governance/rules');
  return data.data;
}

export async function createSafetyRule(
  ruleName: string,
  pattern: string,
  action: SafetyAction,
): Promise<SafetyRule> {
  const { data } = await apiClient.post<{ data: SafetyRule }>(
    '/governance/rules',
    { ruleName, pattern, action },
  );
  return data.data;
}

export async function updateSafetyRule(
  ruleId: string,
  updates: Partial<Pick<SafetyRule, 'ruleName' | 'pattern' | 'action' | 'enabled'>>,
): Promise<SafetyRule> {
  const { data } = await apiClient.put<{ data: SafetyRule }>(
    `/governance/rules/${ruleId}`,
    updates,
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Quota
// ---------------------------------------------------------------------------

export async function getTenantQuota(): Promise<TenantQuota> {
  const { data } = await apiClient.get<{ data: TenantQuota }>('/governance/quota');
  return data.data;
}

export async function updateTenantQuota(
  updates: Partial<Pick<TenantQuota, 'maxRequestsPerDay' | 'maxCostPerDay' | 'maxTokensPerRequest'>>,
): Promise<TenantQuota> {
  const { data } = await apiClient.put<{ data: TenantQuota }>('/governance/quota', updates);
  return data.data;
}
