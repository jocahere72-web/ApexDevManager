import apiClient from '../lib/api-client';
import type {
  UsageMetrics,
  CostBreakdown,
  OptimizationSuggestion,
  UsageTrends,
  TimeGranularity,
} from '@apex-dev-manager/shared-types';

const BASE = '/usage';

/**
 * Get usage metrics.
 */
export async function getUsageMetrics(start?: string, end?: string): Promise<UsageMetrics> {
  const params = new URLSearchParams();
  if (start) params.set('start', start);
  if (end) params.set('end', end);
  const query = params.toString() ? `?${params}` : '';
  const { data } = await apiClient.get<{ data: UsageMetrics }>(`${BASE}/metrics${query}`);
  return data.data;
}

/**
 * Get cost breakdown.
 */
export async function getCostBreakdown(start?: string, end?: string): Promise<CostBreakdown> {
  const params = new URLSearchParams();
  if (start) params.set('start', start);
  if (end) params.set('end', end);
  const query = params.toString() ? `?${params}` : '';
  const { data } = await apiClient.get<{ data: CostBreakdown }>(`${BASE}/costs${query}`);
  return data.data;
}

/**
 * Get optimization suggestions.
 */
export async function getOptimizationSuggestions(): Promise<OptimizationSuggestion[]> {
  const { data } = await apiClient.get<{ data: OptimizationSuggestion[] }>(`${BASE}/suggestions`);
  return data.data;
}

/**
 * Get usage trends.
 */
export async function getUsageTrends(granularity?: TimeGranularity, days?: number): Promise<UsageTrends> {
  const params = new URLSearchParams();
  if (granularity) params.set('granularity', granularity);
  if (days) params.set('days', String(days));
  const query = params.toString() ? `?${params}` : '';
  const { data } = await apiClient.get<{ data: UsageTrends }>(`${BASE}/trends${query}`);
  return data.data;
}

/**
 * Export usage report.
 */
export async function exportReport(
  format: 'csv' | 'pdf' | 'json',
  period: { start: string; end: string },
  includeBreakdown = true,
  includeSuggestions = true,
): Promise<Blob> {
  const { data } = await apiClient.post(`${BASE}/export`, {
    format, period, includeBreakdown, includeSuggestions,
  }, { responseType: 'blob' });
  return data as unknown as Blob;
}
