import { useState, type CSSProperties } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import { useConnection, useHealthHistory, useChangeLog, useDeleteConnection } from '../hooks/useConnections';
import HealthBadge from './HealthBadge';
import DeleteConnectionModal from './DeleteConnectionModal';
import { testConnection } from '@/services/connections.api';
import type { ConnectionPayload } from '@/services/connections.api';

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
    if (!connection) return;
    setIsTesting(true);
    setTestResult(null);
    try {
      const payload: ConnectionPayload = {
        name: connection.name,
        type: connection.type,
        environment: connection.environment,
        username: connection.username,
        password: '', // server uses stored credentials for existing connections
        tags: connection.tags,
        ordsBaseUrl: connection.ordsBaseUrl,
        host: connection.host,
        port: connection.port,
        serviceName: connection.serviceName,
      };
      const result = await testConnection(payload);
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

  if (isLoading) return <p style={{ color: '#6b7280' }}>Loading connection...</p>;
  if (isError) return <p style={{ color: '#dc2626' }}>Error: {(error as Error).message}</p>;
  if (!connection) return <p style={{ color: '#6b7280' }}>Connection not found.</p>;

  // -- Styles ----------------------------------------------------------------

  const headerStyle: CSSProperties = {
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
    flexWrap: 'wrap',
    gap: '0.75rem',
    marginBottom: '1.25rem',
  };

  const tabBarStyle: CSSProperties = {
    display: 'flex',
    borderBottom: '2px solid #e5e7eb',
    marginBottom: '1.25rem',
    gap: '0',
  };

  const tabStyle = (active: boolean): CSSProperties => ({
    padding: '0.625rem 1rem',
    fontSize: '0.875rem',
    fontWeight: active ? 600 : 400,
    color: active ? '#2563eb' : '#6b7280',
    borderBottom: active ? '2px solid #2563eb' : '2px solid transparent',
    marginBottom: '-2px',
    cursor: 'pointer',
    backgroundColor: 'transparent',
    border: 'none',
    borderBottomWidth: '2px',
    borderBottomStyle: 'solid',
    borderBottomColor: active ? '#2563eb' : 'transparent',
  });

  const btnPrimary: CSSProperties = {
    padding: '0.375rem 0.875rem',
    backgroundColor: '#2563eb',
    color: '#ffffff',
    fontWeight: 500,
    fontSize: '0.8125rem',
    border: 'none',
    borderRadius: '0.375rem',
    cursor: 'pointer',
  };

  const btnSecondary: CSSProperties = {
    padding: '0.375rem 0.875rem',
    backgroundColor: '#ffffff',
    color: '#374151',
    fontWeight: 500,
    fontSize: '0.8125rem',
    border: '1px solid #d1d5db',
    borderRadius: '0.375rem',
    cursor: 'pointer',
  };

  const btnDanger: CSSProperties = {
    ...btnSecondary,
    color: '#dc2626',
    borderColor: '#fca5a5',
  };

  const sectionStyle: CSSProperties = {
    backgroundColor: '#ffffff',
    border: '1px solid #e5e7eb',
    borderRadius: '0.5rem',
    padding: '1.25rem',
  };

  const propRowStyle: CSSProperties = {
    display: 'flex',
    padding: '0.5rem 0',
    borderBottom: '1px solid #f3f4f6',
    fontSize: '0.875rem',
  };

  const propLabelStyle: CSSProperties = {
    width: '10rem',
    fontWeight: 500,
    color: '#6b7280',
    flexShrink: 0,
  };

  const propValueStyle: CSSProperties = {
    color: '#111827',
  };

  const tagStyle: CSSProperties = {
    display: 'inline-block',
    padding: '0.125rem 0.5rem',
    backgroundColor: '#eff6ff',
    color: '#1d4ed8',
    borderRadius: '0.25rem',
    fontSize: '0.75rem',
    fontWeight: 500,
    marginRight: '0.375rem',
  };

  // -- Tab Content -----------------------------------------------------------

  const renderGeneral = () => (
    <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem' }}>
      <div style={sectionStyle}>
        <h3 style={{ fontSize: '0.9375rem', fontWeight: 600, marginTop: 0, marginBottom: '0.75rem' }}>
          Properties
        </h3>
        <div>
          <div style={propRowStyle}>
            <span style={propLabelStyle}>Name</span>
            <span style={propValueStyle}>{connection.name}</span>
          </div>
          <div style={propRowStyle}>
            <span style={propLabelStyle}>Type</span>
            <span style={propValueStyle}>{connection.type}</span>
          </div>
          <div style={propRowStyle}>
            <span style={propLabelStyle}>Environment</span>
            <span style={{ ...propValueStyle, textTransform: 'capitalize' }}>{connection.environment}</span>
          </div>
          <div style={propRowStyle}>
            <span style={propLabelStyle}>Username</span>
            <span style={propValueStyle}>{connection.username}</span>
          </div>
          {connection.type === 'ORDS' && (
            <div style={propRowStyle}>
              <span style={propLabelStyle}>ORDS Base URL</span>
              <span style={propValueStyle}>{connection.ordsBaseUrl}</span>
            </div>
          )}
          {connection.type === 'JDBC' && (
            <>
              <div style={propRowStyle}>
                <span style={propLabelStyle}>Host</span>
                <span style={propValueStyle}>{connection.host}</span>
              </div>
              <div style={propRowStyle}>
                <span style={propLabelStyle}>Port</span>
                <span style={propValueStyle}>{connection.port}</span>
              </div>
              <div style={propRowStyle}>
                <span style={propLabelStyle}>Service Name</span>
                <span style={propValueStyle}>{connection.serviceName}</span>
              </div>
            </>
          )}
          <div style={propRowStyle}>
            <span style={propLabelStyle}>Created</span>
            <span style={propValueStyle}>{new Date(connection.createdAt).toLocaleString()}</span>
          </div>
          <div style={propRowStyle}>
            <span style={propLabelStyle}>Updated</span>
            <span style={propValueStyle}>{new Date(connection.updatedAt).toLocaleString()}</span>
          </div>
        </div>
      </div>

      {/* Tags */}
      <div style={sectionStyle}>
        <h3 style={{ fontSize: '0.9375rem', fontWeight: 600, marginTop: 0, marginBottom: '0.75rem' }}>
          Tags
        </h3>
        {connection.tags.length > 0 ? (
          <div>{connection.tags.map((tag) => <span key={tag} style={tagStyle}>{tag}</span>)}</div>
        ) : (
          <p style={{ color: '#9ca3af', fontSize: '0.875rem', margin: 0 }}>No tags assigned.</p>
        )}
      </div>
    </div>
  );

  const renderHealth = () => (
    <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem' }}>
      <div style={sectionStyle}>
        <h3 style={{ fontSize: '0.9375rem', fontWeight: 600, marginTop: 0, marginBottom: '0.75rem' }}>
          Overview
        </h3>
        <div style={{ display: 'flex', gap: '2rem', flexWrap: 'wrap' }}>
          <div>
            <div style={{ fontSize: '0.75rem', color: '#6b7280', marginBottom: '0.25rem' }}>Status</div>
            <HealthBadge
              status={connection.status}
              size="md"
              latencyMs={connection.latencyMs}
              lastCheckAt={connection.lastCheckAt}
            />
          </div>
          <div>
            <div style={{ fontSize: '0.75rem', color: '#6b7280', marginBottom: '0.25rem' }}>Uptime</div>
            <div style={{ fontSize: '1.125rem', fontWeight: 600 }}>
              {connection.uptime != null ? `${connection.uptime.toFixed(2)}%` : '--'}
            </div>
          </div>
          <div>
            <div style={{ fontSize: '0.75rem', color: '#6b7280', marginBottom: '0.25rem' }}>Failures (24h)</div>
            <div style={{ fontSize: '1.125rem', fontWeight: 600, color: connection.failureCount > 0 ? '#dc2626' : '#111827' }}>
              {connection.failureCount}
            </div>
          </div>
          <div>
            <div style={{ fontSize: '0.75rem', color: '#6b7280', marginBottom: '0.25rem' }}>Latency</div>
            <div style={{ fontSize: '1.125rem', fontWeight: 600 }}>
              {connection.latencyMs != null ? `${connection.latencyMs}ms` : '--'}
            </div>
          </div>
        </div>
      </div>

      {/* Latency Chart Placeholder */}
      <div style={sectionStyle}>
        <h3 style={{ fontSize: '0.9375rem', fontWeight: 600, marginTop: 0, marginBottom: '0.75rem' }}>
          Latency History
        </h3>
        <div
          style={{
            height: '12rem',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            backgroundColor: '#f9fafb',
            borderRadius: '0.375rem',
            border: '1px dashed #d1d5db',
            color: '#9ca3af',
            fontSize: '0.875rem',
          }}
        >
          Latency chart placeholder -- integrate charting library here
        </div>
        {healthHistory && healthHistory.length > 0 && (
          <p style={{ fontSize: '0.75rem', color: '#9ca3af', marginTop: '0.5rem', marginBottom: 0 }}>
            {healthHistory.length} data points available
          </p>
        )}
      </div>
    </div>
  );

  const renderChangeLog = () => (
    <div style={sectionStyle}>
      <h3 style={{ fontSize: '0.9375rem', fontWeight: 600, marginTop: 0, marginBottom: '0.75rem' }}>
        Change Log
      </h3>
      {!changeLog || changeLog.length === 0 ? (
        <p style={{ color: '#9ca3af', fontSize: '0.875rem', margin: 0 }}>No changes recorded.</p>
      ) : (
        <div style={{ display: 'flex', flexDirection: 'column', gap: '0' }}>
          {changeLog.map((entry) => (
            <div
              key={entry.id}
              style={{
                padding: '0.75rem 0',
                borderBottom: '1px solid #f3f4f6',
                fontSize: '0.875rem',
              }}
            >
              <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: '0.25rem' }}>
                <span style={{ fontWeight: 500 }}>{entry.action}</span>
                <span style={{ color: '#9ca3af', fontSize: '0.8125rem' }}>
                  {new Date(entry.changedAt).toLocaleString()}
                </span>
              </div>
              <div style={{ color: '#6b7280' }}>
                {entry.details} -- by {entry.changedBy}
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );

  // -- Render ----------------------------------------------------------------

  return (
    <div>
      {/* Header */}
      <div style={headerStyle}>
        <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem' }}>
          <button
            type="button"
            style={{ ...btnSecondary, padding: '0.25rem 0.625rem' }}
            onClick={() => navigate('/connections')}
          >
            &larr; Back
          </button>
          <h2 style={{ fontSize: '1.25rem', fontWeight: 700, margin: 0 }}>{connection.name}</h2>
          <HealthBadge status={connection.status} size="sm" />
        </div>
        <div style={{ display: 'flex', gap: '0.5rem' }}>
          <button type="button" style={btnPrimary} onClick={() => navigate(`/connections/${id}/edit`)}>
            Edit
          </button>
          <button type="button" style={btnSecondary} onClick={handleTestNow} disabled={isTesting}>
            {isTesting ? 'Testing...' : 'Test Now'}
          </button>
          <button type="button" style={btnDanger} onClick={() => setDeleteModalOpen(true)}>
            Delete
          </button>
        </div>
      </div>

      {/* Test result feedback */}
      {testResult && (
        <div
          style={{
            padding: '0.625rem 1rem',
            marginBottom: '1rem',
            borderRadius: '0.375rem',
            fontSize: '0.875rem',
            backgroundColor: testResult.success ? '#dcfce7' : '#fee2e2',
            color: testResult.success ? '#15803d' : '#b91c1c',
          }}
        >
          {testResult.message}
        </div>
      )}

      {/* Tab bar */}
      <div style={tabBarStyle}>
        <button type="button" style={tabStyle(activeTab === 'general')} onClick={() => setActiveTab('general')}>
          General
        </button>
        <button type="button" style={tabStyle(activeTab === 'health')} onClick={() => setActiveTab('health')}>
          Health
        </button>
        <button type="button" style={tabStyle(activeTab === 'changelog')} onClick={() => setActiveTab('changelog')}>
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
  );
}
