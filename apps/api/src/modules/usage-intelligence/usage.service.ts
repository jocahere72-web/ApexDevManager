// ---------------------------------------------------------------------------
// Usage Intelligence Service (M15 Cost & Usage Analytics)
// ---------------------------------------------------------------------------

import { pool } from '../../config/database.js';
import { PoolClient } from 'pg';
import { tenantQuery } from '../../lib/tenant-db.js';
import { logger } from '../../lib/logger.js';
import { claudeClient } from '../ai-studio/claude.client.js';
import type {
  UsageMetrics,
  CostBreakdown,
  CostLineItem,
  OptimizationSuggestion,
  UsageTrends,
  UsageTrendPoint,
  ExportReportRequest,
  ResourceType,
  TimeGranularity,
} from '@apex-dev-manager/shared-types';

// ---------------------------------------------------------------------------
// Get Usage Metrics
// ---------------------------------------------------------------------------

/**
 * Retrieve aggregated usage metrics for a tenant (OCI cost API integration).
 */
export async function getUsageMetrics(
  tenantId: string,
  period?: { start: string; end: string },
  client?: PoolClient,
): Promise<UsageMetrics> {
  const start = period?.start ?? new Date(Date.now() - 30 * 86400000).toISOString();
  const end = period?.end ?? new Date().toISOString();

  logger.info({ tenantId, start, end }, 'Fetching usage metrics');

  // AI token usage
  const aiResult = await tenantQuery(client,
    `SELECT
       COALESCE(SUM(total_tokens), 0)::bigint AS total_tokens,
       COALESCE(SUM(estimated_cost_usd), 0)::numeric AS ai_cost
     FROM ai_token_usage
     WHERE tenant_id = $1 AND created_at BETWEEN $2 AND $3`,
    [tenantId, start, end],
  );

  // API call counts
  const apiResult = await tenantQuery(client,
    `SELECT COUNT(*)::int AS total_calls
     FROM audit_events
     WHERE tenant_id = $1 AND created_at BETWEEN $2 AND $3`,
    [tenantId, start, end],
  );

  // Active users
  const usersResult = await tenantQuery(client,
    `SELECT COUNT(DISTINCT user_id)::int AS active_users
     FROM audit_events
     WHERE tenant_id = $1 AND created_at BETWEEN $2 AND $3`,
    [tenantId, start, end],
  );

  // Connection count for storage proxy
  const connectionsResult = await tenantQuery(client,
    `SELECT COUNT(*)::int AS conn_count FROM connections WHERE tenant_id = $1`,
    [tenantId],
  );

  const aiTokens = parseInt(aiResult.rows[0].total_tokens as string, 10);
  const aiCost = parseFloat(aiResult.rows[0].ai_cost as string);
  const apiCalls = apiResult.rows[0].total_calls as number;
  const activeUsers = usersResult.rows[0].active_users as number;
  const connCount = connectionsResult.rows[0].conn_count as number;

  // Estimate costs by resource type
  const computeCost = apiCalls * 0.00001; // Estimated per-call compute
  const storageCost = connCount * 0.5; // Estimated per-connection storage
  const bandwidthCost = apiCalls * 0.000005;

  const totalCostUsd = aiCost + computeCost + storageCost + bandwidthCost;

  return {
    tenantId,
    period: { start, end },
    totalCostUsd: Math.round(totalCostUsd * 100) / 100,
    byResource: {
      compute: { quantity: apiCalls, unit: 'requests', costUsd: Math.round(computeCost * 100) / 100 },
      storage: { quantity: connCount, unit: 'connections', costUsd: Math.round(storageCost * 100) / 100 },
      'ai-tokens': { quantity: aiTokens, unit: 'tokens', costUsd: Math.round(aiCost * 100) / 100 },
      'api-calls': { quantity: apiCalls, unit: 'calls', costUsd: Math.round(computeCost * 100) / 100 },
      bandwidth: { quantity: apiCalls, unit: 'requests', costUsd: Math.round(bandwidthCost * 100) / 100 },
      database: { quantity: connCount, unit: 'connections', costUsd: Math.round(storageCost * 100) / 100 },
    },
    activeUsers,
    totalApiCalls: apiCalls,
    totalAiTokens: aiTokens,
    storageUsedGb: connCount * 0.1, // Placeholder estimate
  };
}

// ---------------------------------------------------------------------------
// Get Cost Breakdown
// ---------------------------------------------------------------------------

/**
 * Get detailed cost breakdown by category.
 */
export async function getCostBreakdown(
  tenantId: string,
  period?: { start: string; end: string },
  client?: PoolClient,
): Promise<CostBreakdown> {
  const metrics = await getUsageMetrics(tenantId, period, client);

  const items: CostLineItem[] = Object.entries(metrics.byResource).map(([category, data]) => ({
    category: category as ResourceType,
    label: category.replace('-', ' ').replace(/\b\w/g, (c) => c.toUpperCase()),
    quantity: data.quantity,
    unitPrice: data.quantity > 0 ? data.costUsd / data.quantity : 0,
    totalUsd: data.costUsd,
    percentOfTotal: metrics.totalCostUsd > 0 ? Math.round((data.costUsd / metrics.totalCostUsd) * 10000) / 100 : 0,
  }));

  return {
    tenantId,
    period: metrics.period,
    items,
    totalUsd: metrics.totalCostUsd,
    currency: 'USD',
  };
}

// ---------------------------------------------------------------------------
// Get Optimization Suggestions (AI-powered)
// ---------------------------------------------------------------------------

/**
 * Generate AI-powered optimization suggestions based on usage patterns.
 */
export async function getOptimizationSuggestions(
  tenantId: string,
  client?: PoolClient,
): Promise<OptimizationSuggestion[]> {
  logger.info({ tenantId }, 'Generating optimization suggestions');

  const metrics = await getUsageMetrics(tenantId, undefined, client);

  const prompt = `Analyze these usage metrics for an Oracle APEX development platform and suggest cost optimizations:

Total Cost: $${metrics.totalCostUsd}/month
AI Tokens: ${metrics.totalAiTokens} tokens ($${metrics.byResource['ai-tokens'].costUsd})
API Calls: ${metrics.totalApiCalls} calls ($${metrics.byResource['api-calls'].costUsd})
Active Users: ${metrics.activeUsers}
Storage: ${metrics.storageUsedGb} GB

Return a JSON array of optimization suggestions. Each should have:
- id: unique string
- category: one of "compute", "storage", "ai-tokens", "api-calls", "bandwidth", "database"
- title: short title
- description: detailed explanation
- estimatedSavingsUsd: number
- estimatedSavingsPercent: number (0-100)
- effort: "low" | "medium" | "high"
- priority: "low" | "medium" | "high" | "critical"
- actionItems: string[]

Return only the JSON array.`;

  const response = await claudeClient.chat(
    [{ role: 'user', content: prompt }],
    { systemPrompt: 'Return only valid JSON.' },
  );

  let suggestions: OptimizationSuggestion[];
  try {
    suggestions = JSON.parse(response.content);
    suggestions = suggestions.map((s) => ({ ...s, applied: false }));
  } catch {
    suggestions = [
      {
        id: 'default-1',
        category: 'ai-tokens',
        title: 'Optimize AI Token Usage',
        description: 'Consider using shorter prompts and caching frequent queries to reduce AI token consumption.',
        estimatedSavingsUsd: metrics.byResource['ai-tokens'].costUsd * 0.2,
        estimatedSavingsPercent: 20,
        effort: 'low',
        priority: 'medium',
        actionItems: ['Enable prompt caching', 'Review long-running conversations', 'Set token limits per user'],
        applied: false,
      },
    ];
  }

  return suggestions;
}

// ---------------------------------------------------------------------------
// Get Usage Trends
// ---------------------------------------------------------------------------

/**
 * Get usage trends over time.
 */
const GRANULARITY_MAP: Record<string, string> = {
  hour: "date_trunc('hour', created_at)",
  day: "date_trunc('day', created_at)",
  week: "date_trunc('week', created_at)",
  month: "date_trunc('month', created_at)",
};

export async function getUsageTrends(
  tenantId: string,
  granularity: TimeGranularity = 'day',
  days = 30,
  client?: PoolClient,
): Promise<UsageTrends> {
  const since = new Date(Date.now() - days * 86400000).toISOString();

  const truncFn = GRANULARITY_MAP[granularity];
  if (!truncFn) {
    throw new Error(`Invalid granularity: ${granularity}. Must be one of: ${Object.keys(GRANULARITY_MAP).join(', ')}`);
  }

  const result = await tenantQuery(client,
    `SELECT
       ${truncFn} AS date,
       COALESCE(SUM(estimated_cost_usd), 0)::numeric AS cost_usd,
       COALESCE(SUM(total_tokens), 0)::bigint AS ai_tokens
     FROM ai_token_usage
     WHERE tenant_id = $1 AND created_at >= $2
     GROUP BY ${truncFn}
     ORDER BY ${truncFn}`,
    [tenantId, since],
  );

  // Get API calls trend
  const apiResult = await tenantQuery(client,
    `SELECT
       ${truncFn.replace('created_at', 'a.created_at')} AS date,
       COUNT(*)::int AS api_calls,
       COUNT(DISTINCT a.user_id)::int AS active_users
     FROM audit_events a
     WHERE a.tenant_id = $1 AND a.created_at >= $2
     GROUP BY ${truncFn.replace('created_at', 'a.created_at')}
     ORDER BY ${truncFn.replace('created_at', 'a.created_at')}`,
    [tenantId, since],
  );

  // Merge data points
  const dateMap = new Map<string, UsageTrendPoint>();

  for (const row of result.rows) {
    const date = (row.date as Date).toISOString();
    dateMap.set(date, {
      date,
      costUsd: parseFloat(row.cost_usd as string),
      apiCalls: 0,
      aiTokens: parseInt(row.ai_tokens as string, 10),
      activeUsers: 0,
    });
  }

  for (const row of apiResult.rows) {
    const date = (row.date as Date).toISOString();
    const existing = dateMap.get(date) ?? { date, costUsd: 0, apiCalls: 0, aiTokens: 0, activeUsers: 0 };
    existing.apiCalls = row.api_calls as number;
    existing.activeUsers = row.active_users as number;
    dateMap.set(date, existing);
  }

  const dataPoints = Array.from(dateMap.values()).sort((a, b) => a.date.localeCompare(b.date));

  // Calculate projections
  const totalCost = dataPoints.reduce((sum, dp) => sum + dp.costUsd, 0);
  const avgDailyCost = dataPoints.length > 0 ? totalCost / dataPoints.length : 0;
  const projectedMonthlyCost = Math.round(avgDailyCost * 30 * 100) / 100;

  // Calculate change percent (current vs previous period)
  const midpoint = Math.floor(dataPoints.length / 2);
  const firstHalfCost = dataPoints.slice(0, midpoint).reduce((sum, dp) => sum + dp.costUsd, 0);
  const secondHalfCost = dataPoints.slice(midpoint).reduce((sum, dp) => sum + dp.costUsd, 0);
  const costChangePercent = firstHalfCost > 0 ? Math.round(((secondHalfCost - firstHalfCost) / firstHalfCost) * 10000) / 100 : 0;

  return {
    tenantId,
    granularity,
    dataPoints,
    projectedMonthlyCost,
    costChangePercent,
  };
}

// ---------------------------------------------------------------------------
// Export Report
// ---------------------------------------------------------------------------

/**
 * Export a usage report in the specified format.
 */
export async function exportReport(
  tenantId: string,
  request: ExportReportRequest,
  client?: PoolClient,
): Promise<{ content: string; contentType: string; filename: string }> {
  logger.info({ tenantId, format: request.format }, 'Exporting usage report');

  const metrics = await getUsageMetrics(tenantId, request.period, client);
  const breakdown = request.includeBreakdown ? await getCostBreakdown(tenantId, request.period, client) : null;
  const suggestions = request.includeSuggestions ? await getOptimizationSuggestions(tenantId, client) : null;

  const reportData = {
    generatedAt: new Date().toISOString(),
    tenant: tenantId,
    period: request.period,
    metrics,
    breakdown,
    suggestions,
  };

  switch (request.format) {
    case 'json':
      return {
        content: JSON.stringify(reportData, null, 2),
        contentType: 'application/json',
        filename: `usage-report-${tenantId}-${Date.now()}.json`,
      };

    case 'csv': {
      const lines = [
        'Category,Quantity,Unit,Cost USD,Percent of Total',
        ...(breakdown?.items ?? []).map(
          (item) => `${item.label},${item.quantity},${item.category},${item.totalUsd},${item.percentOfTotal}%`,
        ),
        '',
        `Total,,,$${metrics.totalCostUsd},100%`,
      ];
      return {
        content: lines.join('\n'),
        contentType: 'text/csv',
        filename: `usage-report-${tenantId}-${Date.now()}.csv`,
      };
    }

    case 'pdf':
      // PDF generation would use a library like pdfkit in production
      return {
        content: JSON.stringify(reportData, null, 2),
        contentType: 'application/json',
        filename: `usage-report-${tenantId}-${Date.now()}.json`,
      };

    default:
      return {
        content: JSON.stringify(reportData, null, 2),
        contentType: 'application/json',
        filename: `usage-report-${tenantId}-${Date.now()}.json`,
      };
  }
}
