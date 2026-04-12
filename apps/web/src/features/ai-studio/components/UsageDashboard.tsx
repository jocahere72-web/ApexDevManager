import { useState, type CSSProperties } from 'react';
import { useUsage } from '../hooks/useAI';

// ---------------------------------------------------------------------------
// Styles
// ---------------------------------------------------------------------------

const containerStyle: CSSProperties = {
  padding: '1.5rem',
  backgroundColor: '#ffffff',
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
  fontSize: '1.125rem',
  fontWeight: 700,
  color: '#1f2937',
};

const periodSelectorStyle: CSSProperties = {
  display: 'flex',
  gap: '0.25rem',
  backgroundColor: '#f3f4f6',
  borderRadius: '0.5rem',
  padding: '0.125rem',
};

const periodButtonBase: CSSProperties = {
  padding: '0.375rem 0.75rem',
  fontSize: '0.75rem',
  fontWeight: 500,
  border: 'none',
  borderRadius: '0.375rem',
  cursor: 'pointer',
  transition: 'all 0.15s ease',
};

const periodButtonActive: CSSProperties = {
  ...periodButtonBase,
  backgroundColor: '#ffffff',
  color: '#1f2937',
  boxShadow: '0 1px 2px rgba(0,0,0,0.1)',
};

const periodButtonInactive: CSSProperties = {
  ...periodButtonBase,
  backgroundColor: 'transparent',
  color: '#6b7280',
};

const cardsContainerStyle: CSSProperties = {
  display: 'grid',
  gridTemplateColumns: 'repeat(auto-fit, minmax(200px, 1fr))',
  gap: '1rem',
  marginBottom: '1.5rem',
};

const cardStyle: CSSProperties = {
  padding: '1rem',
  backgroundColor: '#f9fafb',
  borderRadius: '0.75rem',
  border: '1px solid #e5e7eb',
};

const cardLabelStyle: CSSProperties = {
  fontSize: '0.75rem',
  fontWeight: 500,
  color: '#6b7280',
  textTransform: 'uppercase',
  letterSpacing: '0.05em',
};

const cardValueStyle: CSSProperties = {
  fontSize: '1.5rem',
  fontWeight: 700,
  color: '#1f2937',
  marginTop: '0.25rem',
};

const sectionTitleStyle: CSSProperties = {
  fontSize: '0.875rem',
  fontWeight: 600,
  color: '#374151',
  marginBottom: '0.75rem',
};

const tableStyle: CSSProperties = {
  width: '100%',
  borderCollapse: 'collapse',
  fontSize: '0.8125rem',
};

const thStyle: CSSProperties = {
  textAlign: 'left',
  padding: '0.5rem 0.75rem',
  borderBottom: '2px solid #e5e7eb',
  fontWeight: 600,
  color: '#374151',
  fontSize: '0.75rem',
};

const tdStyle: CSSProperties = {
  padding: '0.5rem 0.75rem',
  borderBottom: '1px solid #f3f4f6',
  color: '#4b5563',
};

const chartPlaceholderStyle: CSSProperties = {
  height: 200,
  backgroundColor: '#f3f4f6',
  borderRadius: '0.5rem',
  display: 'flex',
  alignItems: 'center',
  justifyContent: 'center',
  color: '#9ca3af',
  fontSize: '0.8125rem',
  border: '1px dashed #d1d5db',
};

const loadingStyle: CSSProperties = {
  textAlign: 'center',
  color: '#6b7280',
  marginTop: 48,
  fontSize: '0.875rem',
};

const errorStyle: CSSProperties = {
  textAlign: 'center',
  color: '#b91c1c',
  marginTop: 48,
  fontSize: '0.875rem',
};

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

function formatTokens(n: number): string {
  if (n >= 1_000_000) return `${(n / 1_000_000).toFixed(1)}M`;
  if (n >= 1_000) return `${(n / 1_000).toFixed(1)}K`;
  return n.toString();
}

function formatCost(n: number): string {
  return `$${n.toFixed(4)}`;
}

// ---------------------------------------------------------------------------
// UsageDashboard
// ---------------------------------------------------------------------------

export function UsageDashboard() {
  const [period, setPeriod] = useState<'day' | 'week' | 'month'>('month');
  const { data, isLoading, error } = useUsage(period);

  if (isLoading) return <div style={loadingStyle}>Loading usage data...</div>;
  if (error) return <div style={errorStyle}>Failed to load usage data.</div>;
  if (!data) return null;

  const modelEntries = Object.entries(data.byModel);

  return (
    <div style={containerStyle}>
      {/* Header */}
      <div style={headerStyle}>
        <h2 style={titleStyle}>AI Usage</h2>
        <div style={periodSelectorStyle}>
          {(['day', 'week', 'month'] as const).map((p) => (
            <button
              key={p}
              type="button"
              style={p === period ? periodButtonActive : periodButtonInactive}
              onClick={() => setPeriod(p)}
            >
              {p.charAt(0).toUpperCase() + p.slice(1)}
            </button>
          ))}
        </div>
      </div>

      {/* Summary cards */}
      <div style={cardsContainerStyle}>
        <div style={cardStyle}>
          <div style={cardLabelStyle}>Total Tokens</div>
          <div style={cardValueStyle}>{formatTokens(data.totalTokens)}</div>
        </div>
        <div style={cardStyle}>
          <div style={cardLabelStyle}>Input Tokens</div>
          <div style={cardValueStyle}>{formatTokens(data.totalInputTokens)}</div>
        </div>
        <div style={cardStyle}>
          <div style={cardLabelStyle}>Output Tokens</div>
          <div style={cardValueStyle}>{formatTokens(data.totalOutputTokens)}</div>
        </div>
        <div style={cardStyle}>
          <div style={cardLabelStyle}>Estimated Cost</div>
          <div style={cardValueStyle}>{formatCost(data.estimatedCostUsd)}</div>
        </div>
      </div>

      {/* Per-model breakdown */}
      {modelEntries.length > 0 && (
        <div style={{ marginBottom: '1.5rem' }}>
          <h3 style={sectionTitleStyle}>By Model</h3>
          <table style={tableStyle}>
            <thead>
              <tr>
                <th style={thStyle}>Model</th>
                <th style={{ ...thStyle, textAlign: 'right' }}>Requests</th>
                <th style={{ ...thStyle, textAlign: 'right' }}>Input</th>
                <th style={{ ...thStyle, textAlign: 'right' }}>Output</th>
                <th style={{ ...thStyle, textAlign: 'right' }}>Total</th>
                <th style={{ ...thStyle, textAlign: 'right' }}>Cost</th>
              </tr>
            </thead>
            <tbody>
              {modelEntries.map(([modelName, stats]) => (
                <tr key={modelName}>
                  <td style={tdStyle}>{modelName}</td>
                  <td style={{ ...tdStyle, textAlign: 'right' }}>{stats.requestCount}</td>
                  <td style={{ ...tdStyle, textAlign: 'right' }}>{formatTokens(stats.inputTokens)}</td>
                  <td style={{ ...tdStyle, textAlign: 'right' }}>{formatTokens(stats.outputTokens)}</td>
                  <td style={{ ...tdStyle, textAlign: 'right' }}>{formatTokens(stats.totalTokens)}</td>
                  <td style={{ ...tdStyle, textAlign: 'right' }}>{formatCost(stats.estimatedCostUsd)}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}

      {/* Daily chart placeholder */}
      <div>
        <h3 style={sectionTitleStyle}>Daily Usage</h3>
        <div style={chartPlaceholderStyle}>
          Daily chart - integrate with charting library (e.g. Recharts, Chart.js)
          <br />
          {data.dailyBreakdown.length} data points available
        </div>
      </div>
    </div>
  );
}

export default UsageDashboard;
