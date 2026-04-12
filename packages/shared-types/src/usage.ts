// ---------------------------------------------------------------------------
// Usage Intelligence shared types (M15 Cost & Usage Analytics)
// ---------------------------------------------------------------------------

/**
 * Resource type tracked for usage.
 */
export type ResourceType = 'compute' | 'storage' | 'ai-tokens' | 'api-calls' | 'bandwidth' | 'database';

/**
 * Time granularity for usage data.
 */
export type TimeGranularity = 'hour' | 'day' | 'week' | 'month';

/**
 * Usage metrics for a tenant.
 */
export interface UsageMetrics {
  tenantId: string;
  period: { start: string; end: string };
  totalCostUsd: number;
  byResource: Record<ResourceType, { quantity: number; unit: string; costUsd: number }>;
  activeUsers: number;
  totalApiCalls: number;
  totalAiTokens: number;
  storageUsedGb: number;
}

/**
 * Detailed cost breakdown by category.
 */
export interface CostBreakdown {
  tenantId: string;
  period: { start: string; end: string };
  items: CostLineItem[];
  totalUsd: number;
  currency: string;
}

/**
 * A single cost line item.
 */
export interface CostLineItem {
  category: ResourceType;
  label: string;
  quantity: number;
  unitPrice: number;
  totalUsd: number;
  percentOfTotal: number;
}

/**
 * AI-generated optimization suggestion.
 */
export interface OptimizationSuggestion {
  id: string;
  category: ResourceType;
  title: string;
  description: string;
  estimatedSavingsUsd: number;
  estimatedSavingsPercent: number;
  effort: 'low' | 'medium' | 'high';
  priority: 'low' | 'medium' | 'high' | 'critical';
  actionItems: string[];
  applied: boolean;
}

/**
 * Usage trend data point.
 */
export interface UsageTrendPoint {
  date: string;
  costUsd: number;
  apiCalls: number;
  aiTokens: number;
  activeUsers: number;
}

/**
 * Usage trends over time.
 */
export interface UsageTrends {
  tenantId: string;
  granularity: TimeGranularity;
  dataPoints: UsageTrendPoint[];
  projectedMonthlyCost: number;
  costChangePercent: number;
}

/**
 * Request to export a usage report.
 */
export interface ExportReportRequest {
  format: 'csv' | 'pdf' | 'json';
  period: { start: string; end: string };
  includeBreakdown: boolean;
  includeSuggestions: boolean;
}
