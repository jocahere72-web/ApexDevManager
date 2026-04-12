// ---------------------------------------------------------------------------
// AI Governance types (M10)
// ---------------------------------------------------------------------------

export type SafetyAction = 'block' | 'warn' | 'log';

export interface AIAuditEntry {
  id: string;
  tenantId: string;
  userId: string;
  conversationId: string | null;
  promptHash: string | null;
  promptRiskLevel: string | null;
  outputRiskLevel: string | null;
  blocked: boolean;
  blockReason: string | null;
  model: string | null;
  tokensUsed: number;
  costUsd: number;
  createdAt: string;
}

export interface SafetyRule {
  id: string;
  tenantId: string;
  ruleName: string;
  pattern: string;
  action: SafetyAction;
  enabled: boolean;
  createdAt: string;
}

export interface GovernanceDashboard {
  totalRequests: number;
  blockedRequests: number;
  totalCostUsd: number;
  byModel: { model: string; count: number; costUsd: number }[];
  riskDistribution: { level: string; count: number }[];
  recentAudit: AIAuditEntry[];
}

export interface TenantQuota {
  tenantId: string;
  maxRequestsPerDay: number;
  maxCostPerDay: number;
  maxTokensPerRequest: number;
  currentDayRequests: number;
  currentDayCost: number;
}
