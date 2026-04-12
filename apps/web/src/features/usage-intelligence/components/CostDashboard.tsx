import { useState, useEffect, useCallback, type CSSProperties } from 'react';
import type {
  UsageMetrics,
  CostBreakdown,
  CostLineItem,
  OptimizationSuggestion,
  UsageTrends,
} from '@apex-dev-manager/shared-types';
import * as usageApi from '@/services/usage.api';

// ---------------------------------------------------------------------------
// Styles
// ---------------------------------------------------------------------------

const containerStyle: CSSProperties = {
  padding: '1.5rem',
  height: '100%',
  overflowY: 'auto',
};

const headerStyle: CSSProperties = {
  display: 'flex',
  justifyContent: 'space-between',
  alignItems: 'center',
  marginBottom: '1.5rem',
};

const titleStyle: CSSProperties = {
  fontSize: '1.25rem',
  fontWeight: 600,
  color: '#111827',
};

const gridStyle: CSSProperties = {
  display: 'grid',
  gridTemplateColumns: 'repeat(auto-fill, minmax(200px, 1fr))',
  gap: '1rem',
  marginBottom: '1.5rem',
};

const costCardStyle: CSSProperties = {
  border: '1px solid #e5e7eb',
  borderRadius: '0.5rem',
  padding: '1rem',
  backgroundColor: '#fff',
};

const costCardTitle: CSSProperties = {
  fontSize: '0.75rem',
  fontWeight: 500,
  color: '#6b7280',
  textTransform: 'uppercase' as const,
  letterSpacing: '0.05em',
  marginBottom: '0.25rem',
};

const costCardValue: CSSProperties = {
  fontSize: '1.5rem',
  fontWeight: 700,
  color: '#111827',
};

const sectionStyle: CSSProperties = {
  marginBottom: '1.5rem',
};

const sectionTitle: CSSProperties = {
  fontSize: '1rem',
  fontWeight: 600,
  color: '#111827',
  marginBottom: '0.75rem',
};

const tableStyle: CSSProperties = {
  width: '100%',
  borderCollapse: 'collapse' as const,
  fontSize: '0.8125rem',
};

const thStyle: CSSProperties = {
  textAlign: 'left' as const,
  padding: '0.625rem 0.75rem',
  borderBottom: '2px solid #e5e7eb',
  fontWeight: 600,
  color: '#374151',
  fontSize: '0.75rem',
  textTransform: 'uppercase' as const,
};

const tdStyle: CSSProperties = {
  padding: '0.625rem 0.75rem',
  borderBottom: '1px solid #f3f4f6',
  color: '#4b5563',
};

const suggestionCard: CSSProperties = {
  border: '1px solid #e5e7eb',
  borderRadius: '0.5rem',
  padding: '1rem',
  marginBottom: '0.75rem',
  backgroundColor: '#fff',
};

const badgeStyle: CSSProperties = {
  display: 'inline-block',
  padding: '0.125rem 0.5rem',
  borderRadius: '9999px',
  fontSize: '0.6875rem',
  fontWeight: 600,
};

const buttonStyle: CSSProperties = {
  padding: '0.5rem 1rem',
  fontSize: '0.8125rem',
  fontWeight: 500,
  border: 'none',
  borderRadius: '0.375rem',
  cursor: 'pointer',
  backgroundColor: '#2563eb',
  color: '#fff',
};

const trendBarStyle: CSSProperties = {
  display: 'flex',
  alignItems: 'flex-end',
  gap: '2px',
  height: 120,
  padding: '0.5rem 0',
};

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

function priorityBadge(priority: string): CSSProperties {
  const colors: Record<string, { bg: string; color: string }> = {
    critical: { bg: '#fef2f2', color: '#991b1b' },
    high: { bg: '#fff7ed', color: '#9a3412' },
    medium: { bg: '#fefce8', color: '#854d0e' },
    low: { bg: '#f0fdf4', color: '#166534' },
  };
  const c = colors[priority] ?? colors.low;
  return { ...badgeStyle, backgroundColor: c.bg, color: c.color };
}

function effortBadge(effort: string): CSSProperties {
  const colors: Record<string, { bg: string; color: string }> = {
    low: { bg: '#dcfce7', color: '#166534' },
    medium: { bg: '#fef3c7', color: '#92400e' },
    high: { bg: '#fef2f2', color: '#991b1b' },
  };
  const c = colors[effort] ?? colors.medium;
  return { ...badgeStyle, backgroundColor: c.bg, color: c.color };
}

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export function CostDashboard() {
  const [metrics, setMetrics] = useState<UsageMetrics | null>(null);
  const [breakdown, setBreakdown] = useState<CostBreakdown | null>(null);
  const [suggestions, setSuggestions] = useState<OptimizationSuggestion[]>([]);
  const [trends, setTrends] = useState<UsageTrends | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    loadData();
  }, []);

  const loadData = useCallback(async () => {
    setLoading(true);
    setError(null);
    try {
      const [m, b, s, t] = await Promise.all([
        usageApi.getUsageMetrics(),
        usageApi.getCostBreakdown(),
        usageApi.getOptimizationSuggestions(),
        usageApi.getUsageTrends('day', 30),
      ]);
      setMetrics(m);
      setBreakdown(b);
      setSuggestions(s);
      setTrends(t);
    } catch (err) {
      setError((err as Error).message);
    } finally {
      setLoading(false);
    }
  }, []);

  const handleExport = useCallback(async (format: 'csv' | 'json') => {
    try {
      const now = new Date();
      const start = new Date(now.getFullYear(), now.getMonth(), 1).toISOString();
      const end = now.toISOString();
      const blob = await usageApi.exportReport(format, { start, end });
      const url = URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      a.download = `usage-report.${format}`;
      a.click();
      URL.revokeObjectURL(url);
    } catch (err) {
      setError((err as Error).message);
    }
  }, []);

  if (loading) {
    return (
      <div style={containerStyle}>
        <div style={{ textAlign: 'center', padding: '3rem', color: '#6b7280' }}>Loading usage data...</div>
      </div>
    );
  }

  return (
    <div style={containerStyle}>
      {/* Header */}
      <div style={headerStyle}>
        <h2 style={titleStyle}>Usage & Cost Intelligence</h2>
        <div style={{ display: 'flex', gap: '0.5rem' }}>
          <button type="button" style={buttonStyle} onClick={() => handleExport('csv')}>Export CSV</button>
          <button type="button" style={{ ...buttonStyle, backgroundColor: '#6b7280' }} onClick={() => handleExport('json')}>Export JSON</button>
        </div>
      </div>

      {error && (
        <div style={{ padding: '0.75rem', backgroundColor: '#fef2f2', border: '1px solid #fecaca', borderRadius: '0.375rem', color: '#991b1b', marginBottom: '1rem', fontSize: '0.875rem' }}>
          {error}
        </div>
      )}

      {/* Cost summary cards */}
      <div style={gridStyle}>
        <div style={costCardStyle}>
          <div style={costCardTitle}>Total Cost (30d)</div>
          <div style={costCardValue}>${metrics?.totalCostUsd.toFixed(2) ?? '0.00'}</div>
        </div>
        <div style={costCardStyle}>
          <div style={costCardTitle}>AI Tokens</div>
          <div style={costCardValue}>{(metrics?.totalAiTokens ?? 0).toLocaleString()}</div>
          <div style={{ fontSize: '0.75rem', color: '#6b7280' }}>${metrics?.byResource['ai-tokens']?.costUsd.toFixed(2) ?? '0.00'}</div>
        </div>
        <div style={costCardStyle}>
          <div style={costCardTitle}>API Calls</div>
          <div style={costCardValue}>{(metrics?.totalApiCalls ?? 0).toLocaleString()}</div>
        </div>
        <div style={costCardStyle}>
          <div style={costCardTitle}>Active Users</div>
          <div style={costCardValue}>{metrics?.activeUsers ?? 0}</div>
        </div>
        <div style={costCardStyle}>
          <div style={costCardTitle}>Storage</div>
          <div style={costCardValue}>{metrics?.storageUsedGb.toFixed(1) ?? '0'} GB</div>
        </div>
        {trends && (
          <div style={costCardStyle}>
            <div style={costCardTitle}>Projected Monthly</div>
            <div style={costCardValue}>${trends.projectedMonthlyCost.toFixed(2)}</div>
            <div style={{ fontSize: '0.75rem', color: trends.costChangePercent > 0 ? '#ef4444' : '#22c55e' }}>
              {trends.costChangePercent > 0 ? '+' : ''}{trends.costChangePercent.toFixed(1)}% vs prev period
            </div>
          </div>
        )}
      </div>

      {/* Trend chart placeholder */}
      {trends && trends.dataPoints.length > 0 && (
        <div style={sectionStyle}>
          <div style={sectionTitle}>Cost Trend (30 days)</div>
          <div style={{ ...costCardStyle, padding: '1rem' }}>
            <div style={trendBarStyle}>
              {(() => {
                const maxCost = Math.max(...trends.dataPoints.map((dp) => dp.costUsd), 0.01);
                return trends.dataPoints.map((dp, i) => (
                  <div
                    key={i}
                    style={{
                      flex: 1,
                      backgroundColor: '#2563eb',
                      borderRadius: '2px 2px 0 0',
                      height: `${Math.max((dp.costUsd / maxCost) * 100, 2)}%`,
                      minHeight: 2,
                    }}
                    title={`${new Date(dp.date).toLocaleDateString()}: $${dp.costUsd.toFixed(2)}`}
                  />
                ));
              })()}
            </div>
            <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: '0.6875rem', color: '#9ca3af' }}>
              <span>{trends.dataPoints.length > 0 ? new Date(trends.dataPoints[0].date).toLocaleDateString() : ''}</span>
              <span>{trends.dataPoints.length > 0 ? new Date(trends.dataPoints[trends.dataPoints.length - 1].date).toLocaleDateString() : ''}</span>
            </div>
          </div>
        </div>
      )}

      {/* Cost breakdown table */}
      {breakdown && (
        <div style={sectionStyle}>
          <div style={sectionTitle}>Cost Breakdown</div>
          <div style={costCardStyle}>
            <table style={tableStyle}>
              <thead>
                <tr>
                  <th style={thStyle}>Category</th>
                  <th style={thStyle}>Quantity</th>
                  <th style={thStyle}>Unit Price</th>
                  <th style={thStyle}>Total</th>
                  <th style={thStyle}>% of Total</th>
                </tr>
              </thead>
              <tbody>
                {breakdown.items.map((item) => (
                  <tr key={item.category}>
                    <td style={tdStyle}>{item.label}</td>
                    <td style={tdStyle}>{item.quantity.toLocaleString()}</td>
                    <td style={tdStyle}>${item.unitPrice.toFixed(6)}</td>
                    <td style={{ ...tdStyle, fontWeight: 600 }}>${item.totalUsd.toFixed(2)}</td>
                    <td style={tdStyle}>
                      <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
                        <div style={{ width: 60, height: 6, backgroundColor: '#e5e7eb', borderRadius: 3 }}>
                          <div style={{ width: `${item.percentOfTotal}%`, height: '100%', backgroundColor: '#2563eb', borderRadius: 3 }} />
                        </div>
                        {item.percentOfTotal.toFixed(1)}%
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
              <tfoot>
                <tr>
                  <td style={{ ...tdStyle, fontWeight: 700 }} colSpan={3}>Total</td>
                  <td style={{ ...tdStyle, fontWeight: 700 }}>${breakdown.totalUsd.toFixed(2)}</td>
                  <td style={tdStyle}>100%</td>
                </tr>
              </tfoot>
            </table>
          </div>
        </div>
      )}

      {/* Optimization suggestions */}
      <div style={sectionStyle}>
        <div style={sectionTitle}>Optimization Suggestions</div>
        {suggestions.length === 0 ? (
          <div style={{ color: '#6b7280', fontSize: '0.875rem' }}>No suggestions available.</div>
        ) : (
          suggestions.map((s) => (
            <div key={s.id} style={suggestionCard}>
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: '0.5rem' }}>
                <div style={{ fontWeight: 600, fontSize: '0.9375rem' }}>{s.title}</div>
                <div style={{ display: 'flex', gap: '0.375rem' }}>
                  <span style={priorityBadge(s.priority)}>{s.priority}</span>
                  <span style={effortBadge(s.effort)}>{s.effort} effort</span>
                </div>
              </div>
              <p style={{ fontSize: '0.8125rem', color: '#4b5563', marginBottom: '0.5rem' }}>{s.description}</p>
              <div style={{ display: 'flex', gap: '1rem', fontSize: '0.8125rem', marginBottom: '0.5rem' }}>
                <span style={{ color: '#22c55e', fontWeight: 600 }}>
                  Save ${s.estimatedSavingsUsd.toFixed(2)}/mo ({s.estimatedSavingsPercent}%)
                </span>
              </div>
              <div style={{ fontSize: '0.75rem', color: '#6b7280' }}>
                <strong>Action items:</strong>
                <ul style={{ margin: '0.25rem 0 0 1rem', padding: 0 }}>
                  {s.actionItems.map((item, i) => (
                    <li key={i} style={{ marginBottom: '0.125rem' }}>{item}</li>
                  ))}
                </ul>
              </div>
            </div>
          ))
        )}
      </div>
    </div>
  );
}

export default CostDashboard;
