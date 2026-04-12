import { useState } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import {
  AppCard,
  AppEmptyState,
  AppPage,
  AppPageHeader,
} from '@/components/ui/AppTemplate';
import {
  useConnection,
  useHealthHistory,
  useChangeLog,
  useDeleteConnection,
} from '../hooks/useConnections';
import HealthBadge from './HealthBadge';
import DeleteConnectionModal from './DeleteConnectionModal';
import { testConnection } from '@/services/connections.api';

// ---------------------------------------------------------------------------
// Tab type
// ---------------------------------------------------------------------------

type Tab = 'general' | 'health' | 'changelog';

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export default function ConnectionDetail() {
  const { id } = useParams<{ id: string }>();
  const navigate = useNavigate();

  const { data: connection, isLoading, isError, error } = useConnection(id ?? '');
  const { data: healthHistory } = useHealthHistory(id ?? '');
  const { data: changeLog } = useChangeLog(id ?? '');
  const deleteMutation = useDeleteConnection();

  const [activeTab, setActiveTab] = useState<Tab>('general');
  const [deleteModalOpen, setDeleteModalOpen] = useState(false);
  const [testResult, setTestResult] = useState<{ success: boolean; message: string } | null>(null);
  const [isTesting, setIsTesting] = useState(false);

  // -- Handlers --------------------------------------------------------------

  const handleTestNow = async () => {
    if (!connection || !id) return;
    setIsTesting(true);
    setTestResult(null);
    try {
      const result = await testConnection(id);
      setTestResult({ success: result.success, message: result.message });
    } catch (err) {
      setTestResult({ success: false, message: (err as Error).message });
    } finally {
      setIsTesting(false);
    }
  };

  const handleDelete = async () => {
    if (!id) return;
    try {
      await deleteMutation.mutateAsync(id);
      navigate('/connections');
    } catch {
      // handled by mutation state
    }
  };

  // -- Loading / Error -------------------------------------------------------

  if (isLoading) return <AppEmptyState>Loading connection...</AppEmptyState>;
  if (isError) {
    return (
      <AppEmptyState>
        <p className="conn-error-text">Error: {(error as Error).message}</p>
      </AppEmptyState>
    );
  }
  if (!connection) return <AppEmptyState>Connection not found.</AppEmptyState>;

  // -- Tab Content -----------------------------------------------------------

  const renderGeneral = () => (
    <div className="app-stack">
      <AppCard>
        <h3 className="conn-section-title">Properties</h3>
        <div>
          <div className="conn-prop-row">
            <span className="conn-prop-label">Name</span>
            <span className="conn-prop-value">{connection.name}</span>
          </div>
          <div className="conn-prop-row">
            <span className="conn-prop-label">Type</span>
            <span className="conn-prop-value">{connection.type}</span>
          </div>
          <div className="conn-prop-row">
            <span className="conn-prop-label">Environment</span>
            <span className="conn-prop-value conn-env-cell">{connection.environment}</span>
          </div>
          <div className="conn-prop-row">
            <span className="conn-prop-label">Username</span>
            <span className="conn-prop-value">{connection.username}</span>
          </div>
          {connection.type === 'ords' && (
            <div className="conn-prop-row">
              <span className="conn-prop-label">ORDS Base URL</span>
              <span className="conn-prop-value">{connection.ordsBaseUrl}</span>
            </div>
          )}
          {connection.type === 'jdbc' && (
            <>
              <div className="conn-prop-row">
                <span className="conn-prop-label">Host</span>
                <span className="conn-prop-value">{connection.host}</span>
              </div>
              <div className="conn-prop-row">
                <span className="conn-prop-label">Port</span>
                <span className="conn-prop-value">{connection.port}</span>
              </div>
              <div className="conn-prop-row">
                <span className="conn-prop-label">Service Name</span>
                <span className="conn-prop-value">{connection.serviceName}</span>
              </div>
            </>
          )}
          <div className="conn-prop-row">
            <span className="conn-prop-label">Created</span>
            <span className="conn-prop-value">{new Date(connection.createdAt).toLocaleString()}</span>
          </div>
          <div className="conn-prop-row">
            <span className="conn-prop-label">Updated</span>
            <span className="conn-prop-value">{new Date(connection.updatedAt).toLocaleString()}</span>
          </div>
        </div>
      </AppCard>

      {/* Tags */}
      <AppCard>
        <h3 className="conn-section-title">Tags</h3>
        {connection.tags.length > 0 ? (
          <div>
            {connection.tags.map((tag) => (
              <span key={tag} className="app-status-pill app-status-accent conn-tag">
                {tag}
              </span>
            ))}
          </div>
        ) : (
          <p className="conn-muted-text">No tags assigned.</p>
        )}
      </AppCard>
    </div>
  );

  const renderHealth = () => (
    <div className="app-stack">
      <AppCard>
        <h3 className="conn-section-title">Overview</h3>
        <div className="conn-health-grid">
          <div>
            <div className="conn-health-label">Status</div>
            <HealthBadge
              status={connection.status}
              size="md"
              latencyMs={connection.latencyMs}
              lastCheckAt={connection.lastCheckAt}
            />
          </div>
          <div>
            <div className="conn-health-label">Uptime</div>
            <div className="conn-health-value">
              {connection.uptime != null ? `${connection.uptime.toFixed(2)}%` : '--'}
            </div>
          </div>
          <div>
            <div className="conn-health-label">Failures (24h)</div>
            <div className={`conn-health-value${connection.failureCount > 0 ? ' conn-health-value-danger' : ''}`}>
              {connection.failureCount}
            </div>
          </div>
          <div>
            <div className="conn-health-label">Latency</div>
            <div className="conn-health-value">
              {connection.latencyMs != null ? `${connection.latencyMs}ms` : '--'}
            </div>
          </div>
        </div>
      </AppCard>

      {/* Latency History */}
      <AppCard>
        <h3 className="conn-section-title">Latency History</h3>
        {healthHistory && healthHistory.length > 0 ? (
          <>
            <div
              style={{
                display: 'flex',
                alignItems: 'flex-end',
                gap: 2,
                height: 80,
                padding: '8px 0',
              }}
            >
              {(() => {
                const maxLatency = Math.max(
                  ...healthHistory.map((h: any) => h.latencyMs ?? 0),
                  1,
                );
                return healthHistory.map((h: any, i: number) => {
                  const value = h.latencyMs ?? 0;
                  const heightPct = (value / maxLatency) * 100;
                  return (
                    <div
                      key={h.id ?? i}
                      title={`${value}ms`}
                      style={{
                        flex: 1,
                        minWidth: 4,
                        maxWidth: 18,
                        height: `${Math.max(heightPct, 4)}%`,
                        background: value > maxLatency * 0.75
                          ? 'var(--app-danger)'
                          : 'var(--app-accent)',
                        borderRadius: 2,
                        transition: 'height 0.2s ease',
                      }}
                    />
                  );
                });
              })()}
            </div>
            <p className="conn-chart-meta">
              {healthHistory.length} data points available
            </p>
          </>
        ) : (
          <p className="conn-muted-text">No latency checks recorded yet.</p>
        )}
      </AppCard>
    </div>
  );

  const renderChangeLog = () => (
    <AppCard>
      <h3 className="conn-section-title">Change Log</h3>
      {!changeLog || changeLog.length === 0 ? (
        <p className="conn-muted-text">No changes recorded.</p>
      ) : (
        <div>
          {changeLog.map((entry) => (
            <div key={entry.id} className="conn-changelog-entry">
              <div className="conn-changelog-header">
                <span className="conn-changelog-action">{entry.action}</span>
                <span className="conn-meta-cell">
                  {new Date(entry.changedAt).toLocaleString()}
                </span>
              </div>
              <div className="conn-changelog-detail">
                {entry.details} -- by {entry.changedBy}
              </div>
            </div>
          ))}
        </div>
      )}
    </AppCard>
  );

  // -- Render ----------------------------------------------------------------

  return (
    <AppPage>
      <AppPageHeader
        eyebrow="Connections"
        title={connection.name}
        description="Review connection configuration, health history, and change activity."
      />
      <div>
        <div className="app-toolbar conn-detail-header">
          <div className="conn-detail-nav">
            <button
              type="button"
              className="app-button"
              onClick={() => navigate('/connections')}
            >
              &larr; Back
            </button>
            <HealthBadge status={connection.status} size="sm" />
          </div>
          <div className="app-toolbar">
            <button
              type="button"
              className="app-button app-button-primary"
              onClick={() => navigate(`/connections/${id}/edit`)}
            >
              Edit
            </button>
            <button type="button" className="app-button" onClick={handleTestNow} disabled={isTesting}>
              {isTesting ? 'Testing...' : 'Test Now'}
            </button>
            <button
              type="button"
              className="app-button conn-button-danger"
              onClick={() => setDeleteModalOpen(true)}
            >
              Delete
            </button>
          </div>
        </div>

        {testResult && (
          <div className={`app-alert${testResult.success ? '' : ' app-alert-danger'} conn-test-alert`}>
            {testResult.message}
          </div>
        )}

        {/* Tab bar */}
        <div className="app-tabs">
          <button
            type="button"
            className={`app-tab${activeTab === 'general' ? ' app-tab-active' : ''}`}
            onClick={() => setActiveTab('general')}
          >
            General
          </button>
          <button
            type="button"
            className={`app-tab${activeTab === 'health' ? ' app-tab-active' : ''}`}
            onClick={() => setActiveTab('health')}
          >
            Health
          </button>
          <button
            type="button"
            className={`app-tab${activeTab === 'changelog' ? ' app-tab-active' : ''}`}
            onClick={() => setActiveTab('changelog')}
          >
            Change Log
          </button>
        </div>

        {/* Tab content */}
        {activeTab === 'general' && renderGeneral()}
        {activeTab === 'health' && renderHealth()}
        {activeTab === 'changelog' && renderChangeLog()}

        {/* Delete Modal */}
        <DeleteConnectionModal
          connectionName={connection.name}
          open={deleteModalOpen}
          onClose={() => setDeleteModalOpen(false)}
          onConfirm={handleDelete}
          isDeleting={deleteMutation.isPending}
        />
      </div>
    </AppPage>
  );
}
