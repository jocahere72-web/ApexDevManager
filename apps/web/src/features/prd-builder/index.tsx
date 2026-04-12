import { useState, useEffect } from 'react';
import { apiClient } from '@/lib/api-client';

interface PRDSession {
  id: string;
  title: string;
  status: string;
  created_at: string;
  updated_at: string;
}

function PRDBuilderPage() {
  const [sessions, setSessions] = useState<PRDSession[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [showCreate, setShowCreate] = useState(false);
  const [newTitle, setNewTitle] = useState('');
  const [creating, setCreating] = useState(false);

  const fetchSessions = async () => {
    try {
      setLoading(true);
      const res = await apiClient.get('/prd/sessions');
      setSessions(res.data.data || []);
      setError(null);
    } catch (err: any) {
      setError(err.response?.data?.error?.message || 'Failed to load sessions');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchSessions();
  }, []);

  const handleCreate = async () => {
    if (!newTitle.trim()) return;
    setCreating(true);
    try {
      await apiClient.post('/prd/sessions', { title: newTitle.trim() });
      setNewTitle('');
      setShowCreate(false);
      fetchSessions();
    } catch (err: any) {
      setError(err.response?.data?.error?.message || 'Failed to create session');
    } finally {
      setCreating(false);
    }
  };

  const statusColors: Record<string, string> = {
    draft: '#6b7280',
    ingesting: '#2563eb',
    extracting: '#d97706',
    generating: '#d97706',
    validating: '#7c3aed',
    validated: '#059669',
    exported: '#059669',
  };

  return (
    <div style={{ maxWidth: '900px' }}>
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '1.5rem' }}>
        <div>
          <h2 style={{ fontSize: '1.5rem', fontWeight: 700, margin: 0, color: '#111827' }}>PRD Builder</h2>
          <p style={{ color: '#6b7280', margin: '0.25rem 0 0', fontSize: '0.875rem' }}>
            Create and manage Product Requirements Documents
          </p>
        </div>
        <button
          onClick={() => setShowCreate(true)}
          style={{
            padding: '0.5rem 1rem', backgroundColor: '#2563eb', color: '#fff',
            border: 'none', borderRadius: '0.375rem', fontWeight: 600, cursor: 'pointer',
            fontSize: '0.875rem',
          }}
        >
          + New PRD Session
        </button>
      </div>

      {error && (
        <div style={{ padding: '0.75rem', backgroundColor: '#fef2f2', color: '#dc2626', borderRadius: '0.375rem', marginBottom: '1rem', fontSize: '0.875rem' }}>
          {error}
        </div>
      )}

      {loading ? (
        <p style={{ color: '#6b7280' }}>Loading sessions...</p>
      ) : sessions.length === 0 ? (
        <div style={{
          padding: '3rem', textAlign: 'center', backgroundColor: '#f9fafb',
          borderRadius: '0.5rem', border: '1px dashed #d1d5db',
        }}>
          <p style={{ fontSize: '1.1rem', fontWeight: 600, color: '#374151', margin: '0 0 0.5rem' }}>No PRD sessions yet</p>
          <p style={{ color: '#6b7280', fontSize: '0.875rem' }}>Click "New PRD Session" to start building your first PRD.</p>
        </div>
      ) : (
        <div style={{ display: 'flex', flexDirection: 'column', gap: '0.5rem' }}>
          {sessions.map((s) => (
            <div key={s.id} style={{
              padding: '1rem', border: '1px solid #e5e7eb', borderRadius: '0.5rem',
              display: 'flex', justifyContent: 'space-between', alignItems: 'center',
              cursor: 'pointer', transition: 'background-color 0.15s',
            }}>
              <div>
                <h3 style={{ margin: 0, fontSize: '0.95rem', fontWeight: 600 }}>{s.title}</h3>
                <p style={{ margin: '0.25rem 0 0', fontSize: '0.8rem', color: '#6b7280' }}>
                  Updated {new Date(s.updated_at).toLocaleDateString()}
                </p>
              </div>
              <span style={{
                padding: '0.25rem 0.625rem', borderRadius: '9999px', fontSize: '0.75rem',
                fontWeight: 600, color: statusColors[s.status] || '#6b7280',
                backgroundColor: '#f3f4f6',
              }}>
                {s.status}
              </span>
            </div>
          ))}
        </div>
      )}

      {/* Create dialog */}
      {showCreate && (
        <div style={{
          position: 'fixed', inset: 0, backgroundColor: 'rgba(0,0,0,0.4)',
          display: 'flex', alignItems: 'center', justifyContent: 'center', zIndex: 1000,
        }}>
          <div style={{
            backgroundColor: '#fff', borderRadius: '0.5rem', padding: '1.5rem',
            width: '24rem', maxWidth: '90vw', boxShadow: '0 20px 25px rgba(0,0,0,0.1)',
          }}>
            <h3 style={{ margin: '0 0 1rem', fontSize: '1.1rem', fontWeight: 600 }}>New PRD Session</h3>
            <input
              type="text"
              placeholder="PRD title..."
              value={newTitle}
              onChange={(e) => setNewTitle(e.target.value)}
              autoFocus
              style={{
                width: '100%', padding: '0.5rem 0.75rem', border: '1px solid #d1d5db',
                borderRadius: '0.375rem', fontSize: '0.875rem', marginBottom: '1rem',
                boxSizing: 'border-box',
              }}
            />
            <div style={{ display: 'flex', justifyContent: 'flex-end', gap: '0.5rem' }}>
              <button
                onClick={() => { setShowCreate(false); setNewTitle(''); }}
                style={{
                  padding: '0.5rem 1rem', backgroundColor: '#f3f4f6', border: 'none',
                  borderRadius: '0.375rem', cursor: 'pointer', fontSize: '0.875rem',
                }}
              >
                Cancel
              </button>
              <button
                onClick={handleCreate}
                disabled={creating || !newTitle.trim()}
                style={{
                  padding: '0.5rem 1rem', backgroundColor: '#2563eb', color: '#fff',
                  border: 'none', borderRadius: '0.375rem', cursor: 'pointer',
                  fontSize: '0.875rem', fontWeight: 600,
                  opacity: creating || !newTitle.trim() ? 0.5 : 1,
                }}
              >
                {creating ? 'Creating...' : 'Create'}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

export default PRDBuilderPage;
