import { useState, useEffect } from 'react';
import {
  AppCard,
  AppEmptyState,
  AppPage,
  AppPageHeader,
  AppStatusPill,
} from '@/components/ui/AppTemplate';
import { apiClient } from '@/lib/api-client';

interface PRDSession {
  id: string;
  title: string;
  status: string;
  created_at: string;
  updated_at: string;
}

function getErrorMessage(err: unknown, fallback: string) {
  return err instanceof Error ? err.message : fallback;
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
    } catch (err: unknown) {
      setError(getErrorMessage(err, 'Failed to load sessions'));
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
    } catch (err: unknown) {
      setError(getErrorMessage(err, 'Failed to create session'));
    } finally {
      setCreating(false);
    }
  };

  return (
    <AppPage>
      <AppPageHeader
        eyebrow="Product Requirements"
        title="PRD Builder"
        description="Create and manage Product Requirements Documents."
        actions={
          <button onClick={() => setShowCreate(true)} className="app-button app-button-primary">
            + New PRD Session
          </button>
        }
      />

      {error && (
        <div className="app-alert app-alert-danger" style={{ marginBottom: '1rem' }}>
          {error}
        </div>
      )}

      {loading ? (
        <AppEmptyState>Loading sessions...</AppEmptyState>
      ) : sessions.length === 0 ? (
        <AppEmptyState>
          <div>
            <p className="app-card-title">No PRD sessions yet</p>
            <p className="app-card-meta">
              Click "New PRD Session" to start building your first PRD.
            </p>
          </div>
        </AppEmptyState>
      ) : (
        <AppCard>
          <div className="app-stack">
            {sessions.map((s) => (
              <div key={s.id} className="app-list-card">
                <div>
                  <h3 className="app-card-title">{s.title}</h3>
                  <p className="app-card-meta">
                    Updated {new Date(s.updated_at).toLocaleDateString()}
                  </p>
                </div>
                <AppStatusPill tone="accent">{s.status}</AppStatusPill>
              </div>
            ))}
          </div>
        </AppCard>
      )}

      {showCreate && (
        <div className="app-modal-backdrop">
          <div className="app-modal">
            <h3 className="app-card-title" style={{ marginBottom: '1rem' }}>
              New PRD Session
            </h3>
            <input
              type="text"
              placeholder="PRD title..."
              value={newTitle}
              onChange={(e) => setNewTitle(e.target.value)}
              autoFocus
              className="app-input"
              style={{ marginBottom: '1rem' }}
            />
            <div className="app-toolbar" style={{ justifyContent: 'flex-end' }}>
              <button
                onClick={() => {
                  setShowCreate(false);
                  setNewTitle('');
                }}
                className="app-button"
              >
                Cancel
              </button>
              <button
                onClick={handleCreate}
                disabled={creating || !newTitle.trim()}
                className="app-button app-button-primary"
                style={{ opacity: creating || !newTitle.trim() ? 0.5 : 1 }}
              >
                {creating ? 'Creating...' : 'Create'}
              </button>
            </div>
          </div>
        </div>
      )}
    </AppPage>
  );
}

export default PRDBuilderPage;
