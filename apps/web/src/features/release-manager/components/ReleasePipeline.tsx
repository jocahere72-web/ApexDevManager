import { useState, useEffect, type CSSProperties } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import type { Release, PipelineStage } from '@apex-dev-manager/shared-types';
import * as releaseApi from '@/services/release.api';

// ---------------------------------------------------------------------------
// Styles
// ---------------------------------------------------------------------------

const styles: Record<string, CSSProperties> = {
  container: {
    padding: '24px',
    maxWidth: '960px',
  },
  breadcrumb: {
    fontSize: '14px',
    color: '#6c757d',
    marginBottom: '16px',
    cursor: 'pointer',
  },
  header: {
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: '32px',
  },
  title: {
    fontSize: '24px',
    fontWeight: 600,
    color: '#1a1a2e',
    margin: 0,
  },
  badge: {
    display: 'inline-block',
    padding: '4px 12px',
    borderRadius: '12px',
    fontSize: '13px',
    fontWeight: 600,
    marginLeft: '12px',
  },
  actions: {
    display: 'flex',
    gap: '8px',
  },
  btn: {
    padding: '8px 16px',
    border: 'none',
    borderRadius: '6px',
    cursor: 'pointer',
    fontSize: '14px',
    fontWeight: 500,
  },
  btnPrimary: { backgroundColor: '#6c5ce7', color: '#fff' },
  btnSuccess: { backgroundColor: '#27ae60', color: '#fff' },
  btnDanger: { backgroundColor: '#e74c3c', color: '#fff' },
  btnOutline: { backgroundColor: '#fff', color: '#333', border: '1px solid #ddd' },
  pipelineContainer: {
    display: 'flex',
    alignItems: 'center',
    gap: '0',
    marginBottom: '32px',
  },
  stageWrapper: {
    display: 'flex',
    flexDirection: 'column' as const,
    alignItems: 'center',
    flex: 1,
  },
  stageNode: {
    width: '100px',
    height: '100px',
    borderRadius: '50%',
    display: 'flex',
    flexDirection: 'column' as const,
    alignItems: 'center',
    justifyContent: 'center',
    fontWeight: 600,
    fontSize: '13px',
    border: '3px solid',
    position: 'relative' as const,
  },
  stageLabel: {
    marginTop: '8px',
    fontSize: '12px',
    fontWeight: 600,
    textTransform: 'uppercase' as const,
    letterSpacing: '0.5px',
    color: '#666',
  },
  stageStatus: {
    fontSize: '10px',
    marginTop: '4px',
    color: '#999',
  },
  connector: {
    width: '60px',
    height: '3px',
    backgroundColor: '#e9ecef',
    marginBottom: '30px',
  },
  detailsCard: {
    backgroundColor: '#fff',
    borderRadius: '8px',
    boxShadow: '0 1px 3px rgba(0,0,0,0.1)',
    padding: '20px',
    marginBottom: '16px',
  },
  sectionTitle: {
    fontSize: '16px',
    fontWeight: 600,
    marginBottom: '12px',
    color: '#333',
  },
  meta: {
    display: 'grid',
    gridTemplateColumns: '1fr 1fr',
    gap: '12px',
    fontSize: '14px',
    color: '#666',
  },
  metaLabel: {
    fontWeight: 600,
    color: '#333',
  },
  rollbackBox: {
    backgroundColor: '#fff3cd',
    border: '1px solid #ffc107',
    borderRadius: '8px',
    padding: '16px',
    marginBottom: '16px',
  },
};

const stageStyles: Record<string, { bg: string; border: string; text: string }> = {
  pending: { bg: '#f8f9fa', border: '#dee2e6', text: '#6c757d' },
  running: { bg: '#fff3cd', border: '#ffc107', text: '#856404' },
  passed: { bg: '#d4edda', border: '#28a745', text: '#155724' },
  failed: { bg: '#f8d7da', border: '#dc3545', text: '#721c24' },
  skipped: { bg: '#e2e3e5', border: '#6c757d', text: '#383d41' },
};

const stageIcons: Record<string, string> = {
  pending: '\u25CB', // circle
  running: '\u25D4', // half circle
  passed: '\u2713', // checkmark
  failed: '\u2717', // x
  skipped: '\u2014', // dash
};

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export default function ReleasePipeline() {
  const { id } = useParams<{ id: string }>();
  const navigate = useNavigate();
  const [release, setRelease] = useState<Release | null>(null);
  const [loading, setLoading] = useState(true);
  const [actionLoading, setActionLoading] = useState(false);
  const [rollbackReason, setRollbackReason] = useState('');

  useEffect(() => {
    if (id) loadRelease(id);
  }, [id]);

  async function loadRelease(releaseId: string) {
    setLoading(true);
    try {
      const r = await releaseApi.getRelease(releaseId);
      setRelease(r);
    } catch (err) {
      console.error('Failed to load release:', err);
    } finally {
      setLoading(false);
    }
  }

  async function handleBuild() {
    if (!id) return;
    setActionLoading(true);
    try {
      const updated = await releaseApi.buildRelease(id);
      setRelease(updated);
    } finally {
      setActionLoading(false);
    }
  }

  async function handlePromote() {
    if (!id) return;
    setActionLoading(true);
    try {
      const updated = await releaseApi.promoteToStaging(id);
      setRelease(updated);
    } finally {
      setActionLoading(false);
    }
  }

  async function handleDeploy() {
    if (!id || !confirm('Deploy to production?')) return;
    setActionLoading(true);
    try {
      const updated = await releaseApi.deployToProduction(id);
      setRelease(updated);
    } finally {
      setActionLoading(false);
    }
  }

  async function handleRollback() {
    if (!id || !rollbackReason.trim()) return;
    setActionLoading(true);
    try {
      const updated = await releaseApi.rollbackRelease(id, rollbackReason);
      setRelease(updated);
      setRollbackReason('');
    } finally {
      setActionLoading(false);
    }
  }

  const formatDate = (iso: string | null) => {
    if (!iso) return '--';
    return new Date(iso).toLocaleString();
  };

  if (loading) return <div style={{ padding: '24px' }}>Loading...</div>;
  if (!release) return <div style={{ padding: '24px' }}>Release not found.</div>;

  return (
    <div style={styles.container}>
      <div style={styles.breadcrumb} onClick={() => navigate('/releases')}>
        &larr; Back to Releases
      </div>

      <div style={styles.header}>
        <h1 style={styles.title}>
          Release v{release.version}
          <span
            style={{
              ...styles.badge,
              backgroundColor: '#e3f2fd',
              color: '#1565c0',
            }}
          >
            {release.status.replace('_', ' ')}
          </span>
        </h1>
        <div style={styles.actions}>
          {release.status === 'draft' && (
            <button
              style={{ ...styles.btn, ...styles.btnPrimary }}
              onClick={handleBuild}
              disabled={actionLoading}
            >
              Build
            </button>
          )}
          {(release.status === 'building' || release.status === 'testing') && (
            <button
              style={{ ...styles.btn, ...styles.btnPrimary }}
              onClick={handlePromote}
              disabled={actionLoading}
            >
              Promote to Staging
            </button>
          )}
          {release.status === 'staging' && (
            <button
              style={{ ...styles.btn, ...styles.btnSuccess }}
              onClick={handleDeploy}
              disabled={actionLoading}
            >
              Deploy to Production
            </button>
          )}
        </div>
      </div>

      {/* Pipeline visualization */}
      <div style={styles.pipelineContainer}>
        {release.pipeline.stages.map((stage: PipelineStage, i: number) => {
          const ss = stageStyles[stage.status] ?? stageStyles.pending;
          return (
            <div key={stage.name} style={{ display: 'flex', alignItems: 'center', flex: 1 }}>
              <div style={styles.stageWrapper}>
                <div
                  style={{
                    ...styles.stageNode,
                    backgroundColor: ss.bg,
                    borderColor: ss.border,
                    color: ss.text,
                  }}
                >
                  <span style={{ fontSize: '24px' }}>{stageIcons[stage.status]}</span>
                  <span style={{ fontSize: '11px', marginTop: '4px' }}>
                    {stage.name.toUpperCase()}
                  </span>
                </div>
                <div style={styles.stageLabel}>{stage.name}</div>
                <div style={styles.stageStatus}>{stage.status}</div>
              </div>
              {i < release.pipeline.stages.length - 1 && (
                <div
                  style={{
                    ...styles.connector,
                    backgroundColor: stage.status === 'passed' ? '#28a745' : '#e9ecef',
                  }}
                />
              )}
            </div>
          );
        })}
      </div>

      {/* Rollback section */}
      {release.status === 'production' && (
        <div style={styles.rollbackBox}>
          <strong>Rollback</strong>
          <div style={{ marginTop: '8px', display: 'flex', gap: '8px' }}>
            <input
              type="text"
              placeholder="Rollback reason..."
              value={rollbackReason}
              onChange={(e) => setRollbackReason(e.target.value)}
              style={{
                flex: 1,
                padding: '8px 12px',
                borderRadius: '6px',
                border: '1px solid #ddd',
                fontSize: '14px',
              }}
            />
            <button
              style={{ ...styles.btn, ...styles.btnDanger }}
              onClick={handleRollback}
              disabled={actionLoading || !rollbackReason.trim()}
            >
              Rollback
            </button>
          </div>
        </div>
      )}

      {/* Rolled-back notice */}
      {release.status === 'rolled_back' && release.rollbackReason && (
        <div style={{ ...styles.rollbackBox, backgroundColor: '#f8d7da', borderColor: '#dc3545' }}>
          <strong>Rolled Back</strong>
          <p style={{ margin: '8px 0 0' }}>{release.rollbackReason}</p>
          <p style={{ margin: '4px 0 0', fontSize: '12px', color: '#666' }}>
            Rolled back at: {formatDate(release.rolledBackAt)}
          </p>
        </div>
      )}

      {/* Details */}
      <div style={styles.detailsCard}>
        <h3 style={styles.sectionTitle}>Release Details</h3>
        <div className="app-responsive-two-column" style={styles.meta}>
          <div>
            <span style={styles.metaLabel}>Version:</span> {release.version}
          </div>
          <div>
            <span style={styles.metaLabel}>Status:</span> {release.status}
          </div>
          <div>
            <span style={styles.metaLabel}>Created:</span> {formatDate(release.createdAt)}
          </div>
          <div>
            <span style={styles.metaLabel}>Deployed:</span> {formatDate(release.deployedAt)}
          </div>
          <div>
            <span style={styles.metaLabel}>Change Sets:</span> {release.changeSetIds.length}
          </div>
          <div>
            <span style={styles.metaLabel}>Updated:</span> {formatDate(release.updatedAt)}
          </div>
        </div>
      </div>
    </div>
  );
}
