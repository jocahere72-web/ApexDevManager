import { useState, useEffect, useCallback, type CSSProperties } from 'react';
import type {
  DashboardOverview,
  ConnectionHealth,
  Alert,
  HealthStatus,
  AlertSeverity,
} from '@apex-dev-manager/shared-types';
import * as dashboardApi from '@/services/dashboard.api';

// ---------------------------------------------------------------------------
// Styles
// ---------------------------------------------------------------------------

const containerStyle: CSSProperties = {
  padding: '1.5rem',
  height: '100%',
  overflowY: 'auto',
};

const gridStyle: CSSProperties = {
  display: 'grid',
  gridTemplateColumns: 'repeat(auto-fill, minmax(240px, 1fr))',
  gap: '1rem',
  marginBottom: '1.5rem',
};

const cardStyle: CSSProperties = {
  border: '1px solid #e5e7eb',
  borderRadius: '0.5rem',
  padding: '1rem',
  backgroundColor: '#fff',
};

const cardTitle: CSSProperties = {
  fontSize: '0.75rem',
  fontWeight: 500,
  color: '#6b7280',
  textTransform: 'uppercase' as const,
  letterSpacing: '0.05em',
  marginBottom: '0.5rem',
};

const cardValue: CSSProperties = {
  fontSize: '1.75rem',
  fontWeight: 700,
  color: '#111827',
};

const sectionTitle: CSSProperties = {
  fontSize: '1rem',
  fontWeight: 600,
  color: '#111827',
  marginBottom: '0.75rem',
};

const statusDot = (status: HealthStatus): CSSProperties => {
  const colors: Record<HealthStatus, string> = {
    healthy: '#22c55e',
    degraded: '#eab308',
    down: '#ef4444',
    unknown: '#9ca3af',
  };
  return {
    display: 'inline-block',
    width: 8,
    height: 8,
    borderRadius: '50%',
    backgroundColor: colors[status] ?? '#9ca3af',
    marginRight: '0.5rem',
  };
};

const alertBanner: CSSProperties = {
  padding: '0.75rem 1rem',
  borderRadius: '0.5rem',
  marginBottom: '1rem',
  display: 'flex',
  alignItems: 'center',
  gap: '0.75rem',
  fontSize: '0.875rem',
};

const severityColors: Record<AlertSeverity, { bg: string; border: string; text: string }> = {
  critical: { bg: '#fef2f2', border: '#fecaca', text: '#991b1b' },
  error: { bg: '#fef2f2', border: '#fecaca', text: '#991b1b' },
  warning: { bg: '#fefce8', border: '#fef08a', text: '#854d0e' },
  info: { bg: '#eff6ff', border: '#bfdbfe', text: '#1e40af' },
};

const connRowStyle: CSSProperties = {
  display: 'flex',
  justifyContent: 'space-between',
  alignItems: 'center',
  padding: '0.5rem 0',
  borderBottom: '1px solid #f3f4f6',
  fontSize: '0.8125rem',
};

const activityRowStyle: CSSProperties = {
  display: 'flex',
  gap: '0.75rem',
  padding: '0.5rem 0',
  borderBottom: '1px solid #f3f4f6',
  fontSize: '0.8125rem',
};

const progressBarOuter: CSSProperties = {
  width: '100%',
  height: '0.5rem',
  backgroundColor: '#e5e7eb',
  borderRadius: '9999px',
  overflow: 'hidden',
};

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export function OverviewDashboard() {
  const [overview, setOverview] = useState<DashboardOverview | null>(null);
  const [alerts, setAlerts] = useState<Alert[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    loadDashboard();
  }, []);

  const loadDashboard = useCallback(async () => {
    setLoading(true);
    setError(null);
    try {
      const [data, alertData] = await Promise.all([
        dashboardApi.getDashboardOverview(),
        dashboardApi.getAlerts(false),
      ]);
      setOverview(data);
      setAlerts(alertData);
    } catch (err) {
      setError((err as Error).message);
    } finally {
      setLoading(false);
    }
  }, []);

  if (loading) {
    return (
      <div style={containerStyle}>
        <div style={{ textAlign: 'center', padding: '3rem', color: '#6b7280' }}>Loading dashboard...</div>
      </div>
    );
  }

  if (!overview) {
    return (
      <div style={containerStyle}>
        <div style={{ textAlign: 'center', padding: '3rem', color: '#6b7280' }}>No dashboard data available.</div>
      </div>
    );
  }

  return (
    <div style={containerStyle}>
      <h2 style={{ fontSize: '1.25rem', fontWeight: 600, color: '#111827', marginBottom: '1rem' }}>
        Dashboard Overview
      </h2>

      {error && (
        <div style={{ padding: '0.75rem', backgroundColor: '#fef2f2', border: '1px solid #fecaca', borderRadius: '0.375rem', color: '#991b1b', marginBottom: '1rem', fontSize: '0.875rem' }}>
          {error}
        </div>
      )}

      {/* Alerts banner */}
      {alerts.map((alert) => {
        const colors = severityColors[alert.severity] ?? severityColors.info;
        return (
          <div key={alert.id} style={{ ...alertBanner, backgroundColor: colors.bg, border: `1px solid ${colors.border}`, color: colors.text }}>
            <span style={{ fontWeight: 600 }}>[{alert.severity.toUpperCase()}]</span>
            <span>{alert.title}: {alert.message}</span>
          </div>
        );
      })}

      {/* Key metrics grid */}
      <div style={gridStyle}>
        <div style={cardStyle}>
          <div style={cardTitle}>Connections</div>
          <div style={cardValue}>{overview.connections.length}</div>
          <div style={{ fontSize: '0.75rem', color: '#6b7280', marginTop: '0.25rem' }}>
            {overview.connections.filter((c) => c.status === 'healthy').length} healthy
          </div>
        </div>

        <div style={cardStyle}>
          <div style={cardTitle}>AI Usage Today</div>
          <div style={cardValue}>{overview.aiUsage.totalTokensToday.toLocaleString()}</div>
          <div style={{ fontSize: '0.75rem', color: '#6b7280', marginTop: '0.25rem' }}>
            ${overview.aiUsage.estimatedCostToday.toFixed(2)} | {overview.aiUsage.conversationsToday} chats
          </div>
        </div>

        <div style={cardStyle}>
          <div style={cardTitle}>Deployments</div>
          <div style={cardValue}>{overview.deployments.totalDeployments}</div>
          <div style={{ fontSize: '0.75rem', color: overview.deployments.successRate >= 90 ? '#22c55e' : '#ef4444', marginTop: '0.25rem' }}>
            {overview.deployments.successRate}% success rate
          </div>
        </div>

        <div style={cardStyle}>
          <div style={cardTitle}>Test Coverage</div>
          <div style={cardValue}>{overview.testCoverage.percent.toFixed(0)}%</div>
          <div style={progressBarOuter}>
            <div style={{ width: `${overview.testCoverage.percent}%`, height: '100%', backgroundColor: overview.testCoverage.percent >= 80 ? '#22c55e' : '#eab308', borderRadius: '9999px' }} />
          </div>
          <div style={{ fontSize: '0.75rem', color: '#6b7280', marginTop: '0.25rem' }}>
            {overview.testCoverage.totalSuites} suites | {overview.testCoverage.passRate}% pass rate
          </div>
        </div>

        <div style={cardStyle}>
          <div style={cardTitle}>Active Users</div>
          <div style={cardValue}>{overview.activeUsers.today}</div>
          <div style={{ fontSize: '0.75rem', color: '#6b7280', marginTop: '0.25rem' }}>
            Week: {overview.activeUsers.thisWeek} | Month: {overview.activeUsers.thisMonth}
          </div>
        </div>

        <div style={cardStyle}>
          <div style={cardTitle}>AI Cost (Month)</div>
          <div style={cardValue}>${overview.aiUsage.estimatedCostMonth.toFixed(2)}</div>
          <div style={{ fontSize: '0.75rem', color: '#6b7280', marginTop: '0.25rem' }}>
            {overview.aiUsage.totalTokensMonth.toLocaleString()} tokens
          </div>
        </div>
      </div>

      {/* Two-column layout */}
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '1.5rem' }}>
        {/* Connection health */}
        <div>
          <div style={sectionTitle}>Connection Health</div>
          <div style={cardStyle}>
            {overview.connections.length === 0 ? (
              <div style={{ color: '#9ca3af', fontSize: '0.8125rem', padding: '0.5rem 0' }}>No connections configured.</div>
            ) : (
              overview.connections.map((conn) => (
                <div key={conn.connectionId} style={connRowStyle}>
                  <div style={{ display: 'flex', alignItems: 'center' }}>
                    <span style={statusDot(conn.status)} />
                    <span style={{ fontWeight: 500 }}>{conn.connectionName}</span>
                  </div>
                  <div style={{ display: 'flex', gap: '0.75rem', alignItems: 'center' }}>
                    <span style={{ fontSize: '0.75rem', color: '#6b7280' }}>{conn.responseTimeMs}ms</span>
                    <span style={{ fontSize: '0.6875rem', color: '#9ca3af' }}>
                      {new Date(conn.lastCheckedAt).toLocaleTimeString()}
                    </span>
                  </div>
                </div>
              ))
            )}
          </div>
        </div>

        {/* Recent activity */}
        <div>
          <div style={sectionTitle}>Recent Activity</div>
          <div style={cardStyle}>
            {overview.recentActivity.length === 0 ? (
              <div style={{ color: '#9ca3af', fontSize: '0.8125rem', padding: '0.5rem 0' }}>No recent activity.</div>
            ) : (
              overview.recentActivity.slice(0, 10).map((activity) => (
                <div key={activity.id} style={activityRowStyle}>
                  <div style={{ width: 6, height: 6, borderRadius: '50%', backgroundColor: '#2563eb', marginTop: '0.375rem', flexShrink: 0 }} />
                  <div style={{ flex: 1 }}>
                    <div style={{ fontWeight: 500 }}>{activity.title}</div>
                    {activity.description && (
                      <div style={{ fontSize: '0.75rem', color: '#6b7280' }}>{activity.description}</div>
                    )}
                  </div>
                  <div style={{ fontSize: '0.6875rem', color: '#9ca3af', whiteSpace: 'nowrap' }}>
                    {new Date(activity.timestamp).toLocaleTimeString()}
                  </div>
                </div>
              ))
            )}
          </div>
        </div>
      </div>
    </div>
  );
}

export default OverviewDashboard;
