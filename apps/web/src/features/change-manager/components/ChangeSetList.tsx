import { useState, useEffect, type CSSProperties } from 'react';
import { useNavigate } from 'react-router-dom';
import type { ChangeSet, ChangeSetStatus } from '@apex-dev-manager/shared-types';
import * as changeManagerApi from '@/services/change-manager.api';

// ---------------------------------------------------------------------------
// Styles
// ---------------------------------------------------------------------------

const styles: Record<string, CSSProperties> = {
  container: {
    padding: '24px',
  },
  header: {
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: '24px',
  },
  title: {
    fontSize: '24px',
    fontWeight: 600,
    color: '#1a1a2e',
    margin: 0,
  },
  createBtn: {
    padding: '8px 16px',
    backgroundColor: '#6c5ce7',
    color: '#fff',
    border: 'none',
    borderRadius: '6px',
    cursor: 'pointer',
    fontSize: '14px',
    fontWeight: 500,
  },
  filters: {
    display: 'flex',
    gap: '12px',
    marginBottom: '16px',
  },
  select: {
    padding: '8px 12px',
    borderRadius: '6px',
    border: '1px solid #ddd',
    fontSize: '14px',
    backgroundColor: '#fff',
  },
  table: {
    width: '100%',
    borderCollapse: 'collapse' as const,
    backgroundColor: '#fff',
    borderRadius: '8px',
    overflow: 'hidden',
    boxShadow: '0 1px 3px rgba(0,0,0,0.1)',
  },
  th: {
    textAlign: 'left' as const,
    padding: '12px 16px',
    backgroundColor: '#f8f9fa',
    fontSize: '12px',
    fontWeight: 600,
    color: '#6c757d',
    textTransform: 'uppercase' as const,
    letterSpacing: '0.5px',
    borderBottom: '2px solid #e9ecef',
  },
  td: {
    padding: '12px 16px',
    borderBottom: '1px solid #f0f0f0',
    fontSize: '14px',
    color: '#333',
  },
  row: {
    cursor: 'pointer',
    transition: 'background-color 0.15s',
  },
  badge: {
    display: 'inline-block',
    padding: '3px 10px',
    borderRadius: '12px',
    fontSize: '12px',
    fontWeight: 600,
  },
  empty: {
    textAlign: 'center' as const,
    padding: '48px',
    color: '#999',
  },
};

const statusColors: Record<ChangeSetStatus, { bg: string; text: string }> = {
  draft: { bg: '#e3f2fd', text: '#1565c0' },
  review: { bg: '#fff3e0', text: '#e65100' },
  approved: { bg: '#e8f5e9', text: '#2e7d32' },
  applied: { bg: '#f3e5f5', text: '#6a1b9a' },
  rejected: { bg: '#fce4ec', text: '#c62828' },
};

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export default function ChangeSetList() {
  const navigate = useNavigate();
  const [changeSets, setChangeSets] = useState<ChangeSet[]>([]);
  const [total, setTotal] = useState(0);
  const [loading, setLoading] = useState(true);
  const [statusFilter, setStatusFilter] = useState<ChangeSetStatus | ''>('');

  useEffect(() => {
    loadChangeSets();
  }, [statusFilter]);

  async function loadChangeSets() {
    setLoading(true);
    try {
      const result = await changeManagerApi.listChangeSets(
        undefined,
        statusFilter || undefined,
      );
      setChangeSets(result.items);
      setTotal(result.total);
    } catch (err) {
      console.error('Failed to load change sets:', err);
    } finally {
      setLoading(false);
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

  return (
    <div style={styles.container}>
      <div style={styles.header}>
        <h1 style={styles.title}>Change Sets</h1>
        <button style={styles.createBtn} onClick={() => navigate('new')}>
          + New Change Set
        </button>
      </div>

      <div style={styles.filters}>
        <select
          style={styles.select}
          value={statusFilter}
          onChange={(e) => setStatusFilter(e.target.value as ChangeSetStatus | '')}
        >
          <option value="">All Statuses</option>
          <option value="draft">Draft</option>
          <option value="review">In Review</option>
          <option value="approved">Approved</option>
          <option value="applied">Applied</option>
          <option value="rejected">Rejected</option>
        </select>
        <span style={{ padding: '8px', color: '#999', fontSize: '14px' }}>
          {total} change set{total !== 1 ? 's' : ''}
        </span>
      </div>

      {loading ? (
        <div style={styles.empty}>Loading...</div>
      ) : changeSets.length === 0 ? (
        <div style={styles.empty}>No change sets found. Create your first one!</div>
      ) : (
        <table style={styles.table}>
          <thead>
            <tr>
              <th style={styles.th}>Name</th>
              <th style={styles.th}>Status</th>
              <th style={styles.th}>Objects</th>
              <th style={styles.th}>Conflicts</th>
              <th style={styles.th}>Created</th>
            </tr>
          </thead>
          <tbody>
            {changeSets.map((cs) => {
              const colors = statusColors[cs.status];
              return (
                <tr
                  key={cs.id}
                  style={styles.row}
                  onClick={() => navigate(cs.id)}
                  onMouseEnter={(e) => {
                    (e.currentTarget as HTMLElement).style.backgroundColor = '#f8f9fa';
                  }}
                  onMouseLeave={(e) => {
                    (e.currentTarget as HTMLElement).style.backgroundColor = '';
                  }}
                >
                  <td style={styles.td}>
                    <strong>{cs.name}</strong>
                    {cs.description && (
                      <div style={{ color: '#999', fontSize: '12px', marginTop: '2px' }}>
                        {cs.description}
                      </div>
                    )}
                  </td>
                  <td style={styles.td}>
                    <span
                      style={{
                        ...styles.badge,
                        backgroundColor: colors.bg,
                        color: colors.text,
                      }}
                    >
                      {cs.status}
                    </span>
                  </td>
                  <td style={styles.td}>{cs.objects.length}</td>
                  <td style={styles.td}>
                    {cs.conflictCount > 0 ? (
                      <span style={{ color: '#e74c3c', fontWeight: 600 }}>
                        {cs.conflictCount}
                      </span>
                    ) : (
                      <span style={{ color: '#27ae60' }}>0</span>
                    )}
                  </td>
                  <td style={styles.td}>{formatDate(cs.createdAt)}</td>
                </tr>
              );
            })}
          </tbody>
        </table>
      )}
    </div>
  );
}
