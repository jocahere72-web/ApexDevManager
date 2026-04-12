import { useState, useEffect, type CSSProperties } from 'react';
import { useNavigate } from 'react-router-dom';
import type { Release, DeploymentStatus } from '@apex-dev-manager/shared-types';
import * as releaseApi from '@/services/release.api';

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
  },
  grid: {
    display: 'grid',
    gridTemplateColumns: 'repeat(auto-fill, minmax(360px, 1fr))',
    gap: '16px',
  },
  card: {
    backgroundColor: '#fff',
    borderRadius: '10px',
    boxShadow: '0 1px 3px rgba(0,0,0,0.1)',
    padding: '20px',
    cursor: 'pointer',
    transition: 'box-shadow 0.2s, transform 0.1s',
    border: '1px solid #f0f0f0',
  },
  cardHeader: {
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: '12px',
  },
  version: {
    fontSize: '18px',
    fontWeight: 600,
    color: '#1a1a2e',
  },
  badge: {
    display: 'inline-block',
    padding: '4px 10px',
    borderRadius: '12px',
    fontSize: '12px',
    fontWeight: 600,
  },
  pipeline: {
    display: 'flex',
    gap: '4px',
    marginBottom: '12px',
  },
  stage: {
    flex: 1,
    height: '6px',
    borderRadius: '3px',
    backgroundColor: '#e9ecef',
  },
  meta: {
    display: 'flex',
    justifyContent: 'space-between',
    fontSize: '12px',
    color: '#999',
  },
  empty: {
    textAlign: 'center' as const,
    padding: '48px',
    color: '#999',
  },
};

const statusColors: Record<DeploymentStatus, { bg: string; text: string }> = {
  draft: { bg: '#e3f2fd', text: '#1565c0' },
  building: { bg: '#fff3e0', text: '#e65100' },
  testing: { bg: '#fce4ec', text: '#ad1457' },
  staging: { bg: '#f3e5f5', text: '#6a1b9a' },
  production: { bg: '#e8f5e9', text: '#2e7d32' },
  rolled_back: { bg: '#ffebee', text: '#c62828' },
};

const stageColors: Record<string, string> = {
  pending: '#e9ecef',
  running: '#ffd93d',
  passed: '#27ae60',
  failed: '#e74c3c',
  skipped: '#bdc3c7',
};

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export default function ReleaseList() {
  const navigate = useNavigate();
  const [releases, setReleases] = useState<Release[]>([]);
  const [total, setTotal] = useState(0);
  const [loading, setLoading] = useState(true);
  const [statusFilter, setStatusFilter] = useState<DeploymentStatus | ''>('');

  useEffect(() => {
    loadReleases();
  }, [statusFilter]);

  async function loadReleases() {
    setLoading(true);
    try {
      const result = await releaseApi.listReleases(
        undefined,
        statusFilter || undefined,
      );
      setReleases(result.items);
      setTotal(result.total);
    } catch (err) {
      console.error('Failed to load releases:', err);
    } finally {
      setLoading(false);
    }
  }

  const formatDate = (iso: string | null) => {
    if (!iso) return '--';
    try {
      return new Date(iso).toLocaleDateString();
    } catch {
      return iso;
    }
  };

  return (
    <div style={styles.container}>
      <div style={styles.header}>
        <h1 style={styles.title}>Releases</h1>
        <button style={styles.createBtn} onClick={() => navigate('new')}>
          + New Release
        </button>
      </div>

      <div style={styles.filters}>
        <select
          style={styles.select}
          value={statusFilter}
          onChange={(e) => setStatusFilter(e.target.value as DeploymentStatus | '')}
        >
          <option value="">All Statuses</option>
          <option value="draft">Draft</option>
          <option value="building">Building</option>
          <option value="testing">Testing</option>
          <option value="staging">Staging</option>
          <option value="production">Production</option>
          <option value="rolled_back">Rolled Back</option>
        </select>
        <span style={{ padding: '8px', color: '#999', fontSize: '14px' }}>
          {total} release{total !== 1 ? 's' : ''}
        </span>
      </div>

      {loading ? (
        <div style={styles.empty}>Loading...</div>
      ) : releases.length === 0 ? (
        <div style={styles.empty}>No releases found.</div>
      ) : (
        <div style={styles.grid}>
          {releases.map((release) => {
            const sc = statusColors[release.status];
            return (
              <div
                key={release.id}
                style={styles.card}
                onClick={() => navigate(release.id)}
                onMouseEnter={(e) => {
                  (e.currentTarget as HTMLElement).style.boxShadow = '0 4px 12px rgba(0,0,0,0.15)';
                  (e.currentTarget as HTMLElement).style.transform = 'translateY(-1px)';
                }}
                onMouseLeave={(e) => {
                  (e.currentTarget as HTMLElement).style.boxShadow = '0 1px 3px rgba(0,0,0,0.1)';
                  (e.currentTarget as HTMLElement).style.transform = '';
                }}
              >
                <div style={styles.cardHeader}>
                  <span style={styles.version}>v{release.version}</span>
                  <span style={{ ...styles.badge, backgroundColor: sc.bg, color: sc.text }}>
                    {release.status.replace('_', ' ')}
                  </span>
                </div>

                {/* Pipeline mini visualization */}
                <div style={styles.pipeline}>
                  {release.pipeline.stages.map((stage) => (
                    <div
                      key={stage.name}
                      style={{
                        ...styles.stage,
                        backgroundColor: stageColors[stage.status] ?? '#e9ecef',
                      }}
                      title={`${stage.name}: ${stage.status}`}
                    />
                  ))}
                </div>

                <div style={styles.meta}>
                  <span>{release.changeSetIds.length} change set(s)</span>
                  <span>{formatDate(release.createdAt)}</span>
                </div>
              </div>
            );
          })}
        </div>
      )}
    </div>
  );
}
