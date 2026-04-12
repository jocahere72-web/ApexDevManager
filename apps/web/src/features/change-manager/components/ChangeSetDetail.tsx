import { useState, useEffect, type CSSProperties } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import type { ChangeSet, ConflictDetail } from '@apex-dev-manager/shared-types';
import * as changeManagerApi from '@/services/change-manager.api';

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
    alignItems: 'flex-start',
    marginBottom: '24px',
  },
  title: {
    fontSize: '24px',
    fontWeight: 600,
    color: '#1a1a2e',
    margin: 0,
  },
  statusBadge: {
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
  btnPrimary: {
    backgroundColor: '#6c5ce7',
    color: '#fff',
  },
  btnSuccess: {
    backgroundColor: '#27ae60',
    color: '#fff',
  },
  btnDanger: {
    backgroundColor: '#e74c3c',
    color: '#fff',
  },
  btnOutline: {
    backgroundColor: '#fff',
    color: '#333',
    border: '1px solid #ddd',
  },
  section: {
    marginBottom: '24px',
  },
  sectionTitle: {
    fontSize: '16px',
    fontWeight: 600,
    color: '#333',
    marginBottom: '12px',
  },
  card: {
    backgroundColor: '#fff',
    borderRadius: '8px',
    boxShadow: '0 1px 3px rgba(0,0,0,0.1)',
    padding: '16px',
    marginBottom: '12px',
  },
  objectRow: {
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
    padding: '12px',
    borderBottom: '1px solid #f0f0f0',
  },
  objectInfo: {
    display: 'flex',
    gap: '12px',
    alignItems: 'center',
  },
  objectType: {
    fontSize: '11px',
    fontWeight: 600,
    textTransform: 'uppercase' as const,
    color: '#6c757d',
    backgroundColor: '#f0f0f0',
    padding: '2px 8px',
    borderRadius: '4px',
  },
  actionBadge: {
    fontSize: '11px',
    fontWeight: 600,
    padding: '2px 8px',
    borderRadius: '4px',
  },
  conflictWarning: {
    backgroundColor: '#fff3cd',
    border: '1px solid #ffc107',
    borderRadius: '8px',
    padding: '16px',
    marginBottom: '16px',
  },
  conflictItem: {
    padding: '8px 0',
    borderBottom: '1px solid #ffe08a',
    fontSize: '14px',
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
};

const actionColors: Record<string, { bg: string; text: string }> = {
  create: { bg: '#e8f5e9', text: '#2e7d32' },
  alter: { bg: '#fff3e0', text: '#e65100' },
  drop: { bg: '#fce4ec', text: '#c62828' },
};

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export default function ChangeSetDetail() {
  const { id } = useParams<{ id: string }>();
  const navigate = useNavigate();
  const [changeSet, setChangeSet] = useState<ChangeSet | null>(null);
  const [conflicts, setConflicts] = useState<ConflictDetail[]>([]);
  const [loading, setLoading] = useState(true);
  const [actionLoading, setActionLoading] = useState(false);

  useEffect(() => {
    if (id) loadChangeSet(id);
  }, [id]);

  async function loadChangeSet(csId: string) {
    setLoading(true);
    try {
      const cs = await changeManagerApi.getChangeSet(csId);
      setChangeSet(cs);
    } catch (err) {
      console.error('Failed to load change set:', err);
    } finally {
      setLoading(false);
    }
  }

  async function handleDetectConflicts() {
    if (!id) return;
    setActionLoading(true);
    try {
      const result = await changeManagerApi.detectConflicts(id);
      setConflicts(result);
    } catch (err) {
      console.error('Failed to detect conflicts:', err);
    } finally {
      setActionLoading(false);
    }
  }

  async function handleSubmit() {
    if (!id) return;
    setActionLoading(true);
    try {
      const updated = await changeManagerApi.submitForReview(id);
      setChangeSet(updated);
    } catch (err) {
      console.error('Failed to submit:', err);
    } finally {
      setActionLoading(false);
    }
  }

  async function handleApprove() {
    if (!id) return;
    setActionLoading(true);
    try {
      const updated = await changeManagerApi.approveChangeSet(id);
      setChangeSet(updated);
    } catch (err) {
      console.error('Failed to approve:', err);
    } finally {
      setActionLoading(false);
    }
  }

  async function handleReject() {
    if (!id) return;
    setActionLoading(true);
    try {
      const updated = await changeManagerApi.rejectChangeSet(id);
      setChangeSet(updated);
    } catch (err) {
      console.error('Failed to reject:', err);
    } finally {
      setActionLoading(false);
    }
  }

  async function handleApply() {
    if (!id || !confirm('Apply this change set? This will execute DDL against the database.'))
      return;
    setActionLoading(true);
    try {
      const updated = await changeManagerApi.applyChangeSet(id);
      setChangeSet(updated);
    } catch (err) {
      console.error('Failed to apply:', err);
    } finally {
      setActionLoading(false);
    }
  }

  async function handleRemoveObject(index: number) {
    if (!id) return;
    try {
      const updated = await changeManagerApi.removeObject(id, index);
      setChangeSet(updated);
    } catch (err) {
      console.error('Failed to remove object:', err);
    }
  }

  const formatDate = (iso: string | null) => {
    if (!iso) return '--';
    try {
      return new Date(iso).toLocaleString();
    } catch {
      return iso;
    }
  };

  if (loading) return <div style={{ padding: '24px' }}>Loading...</div>;
  if (!changeSet) return <div style={{ padding: '24px' }}>Change set not found.</div>;

  const statusColor: Record<string, string> = {
    draft: '#1565c0',
    review: '#e65100',
    approved: '#2e7d32',
    applied: '#6a1b9a',
    rejected: '#c62828',
  };

  return (
    <div style={styles.container}>
      <div style={styles.breadcrumb} onClick={() => navigate('/change-manager')}>
        &larr; Back to Change Sets
      </div>

      <div style={styles.header}>
        <div>
          <h1 style={styles.title}>
            {changeSet.name}
            <span
              style={{
                ...styles.statusBadge,
                backgroundColor: `${statusColor[changeSet.status]}20`,
                color: statusColor[changeSet.status],
              }}
            >
              {changeSet.status}
            </span>
          </h1>
          {changeSet.description && (
            <p style={{ color: '#666', margin: '8px 0 0' }}>{changeSet.description}</p>
          )}
        </div>

        <div style={styles.actions}>
          {changeSet.status === 'draft' && (
            <>
              <button
                style={{ ...styles.btn, ...styles.btnOutline }}
                onClick={handleDetectConflicts}
                disabled={actionLoading}
              >
                Check Conflicts
              </button>
              <button
                style={{ ...styles.btn, ...styles.btnPrimary }}
                onClick={handleSubmit}
                disabled={actionLoading || changeSet.objects.length === 0}
              >
                Submit for Review
              </button>
            </>
          )}
          {changeSet.status === 'review' && (
            <>
              <button
                style={{ ...styles.btn, ...styles.btnDanger }}
                onClick={handleReject}
                disabled={actionLoading}
              >
                Reject
              </button>
              <button
                style={{ ...styles.btn, ...styles.btnSuccess }}
                onClick={handleApprove}
                disabled={actionLoading}
              >
                Approve
              </button>
            </>
          )}
          {changeSet.status === 'approved' && (
            <button
              style={{ ...styles.btn, ...styles.btnSuccess }}
              onClick={handleApply}
              disabled={actionLoading}
            >
              Apply Changes
            </button>
          )}
        </div>
      </div>

      {/* Conflicts warning */}
      {conflicts.length > 0 && (
        <div style={styles.conflictWarning}>
          <strong>Conflicts Detected ({conflicts.length})</strong>
          {conflicts.map((c, i) => (
            <div key={i} style={styles.conflictItem}>
              <strong>{c.objectName}</strong> ({c.objectType}) - {c.field}:
              <span style={{ color: '#c62828', marginLeft: '8px' }}>{c.severity}</span>
            </div>
          ))}
        </div>
      )}

      {/* Objects list */}
      <div style={styles.section}>
        <h2 style={styles.sectionTitle}>Objects ({changeSet.objects.length})</h2>
        <div style={styles.card}>
          {changeSet.objects.length === 0 ? (
            <div style={{ textAlign: 'center', padding: '24px', color: '#999' }}>
              No objects added yet
            </div>
          ) : (
            changeSet.objects.map((obj, i) => {
              const ac = actionColors[obj.action] ?? { bg: '#f0f0f0', text: '#333' };
              return (
                <div key={i} style={styles.objectRow}>
                  <div style={styles.objectInfo}>
                    <span style={styles.objectType}>{obj.objectType}</span>
                    <strong>
                      {obj.schema ? `${obj.schema}.` : ''}
                      {obj.objectName}
                    </strong>
                    <span style={{ ...styles.actionBadge, backgroundColor: ac.bg, color: ac.text }}>
                      {obj.action}
                    </span>
                  </div>
                  {changeSet.status === 'draft' && (
                    <button
                      style={{
                        ...styles.btn,
                        ...styles.btnOutline,
                        padding: '4px 8px',
                        fontSize: '12px',
                      }}
                      onClick={() => handleRemoveObject(i)}
                    >
                      Remove
                    </button>
                  )}
                </div>
              );
            })
          )}
        </div>
      </div>

      {/* Metadata */}
      <div style={styles.section}>
        <h2 style={styles.sectionTitle}>Details</h2>
        <div style={styles.card}>
          <div className="app-responsive-two-column" style={styles.meta}>
            <div>
              <span style={styles.metaLabel}>Created:</span> {formatDate(changeSet.createdAt)}
            </div>
            <div>
              <span style={styles.metaLabel}>Updated:</span> {formatDate(changeSet.updatedAt)}
            </div>
            <div>
              <span style={styles.metaLabel}>Applied:</span> {formatDate(changeSet.appliedAt)}
            </div>
            <div>
              <span style={styles.metaLabel}>Conflict Count:</span> {changeSet.conflictCount}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
