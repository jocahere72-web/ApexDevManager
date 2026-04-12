import { useState, useEffect, useCallback } from 'react';
import { useTranslation } from 'react-i18next';
import {
  AppCard,
  AppEmptyState,
  AppPage,
  AppPageHeader,
  AppStatusPill,
} from '@/components/ui/AppTemplate';
import {
  fetchClients,
  createClient,
  updateClient,
  deleteClient,
  type ClientSummary,
  type ClientPayload,
} from '@/services/clients.api';
import { fetchConnections } from '@/services/connections.api';

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

function debounce<T extends (...args: unknown[]) => void>(fn: T, ms: number) {
  let timer: ReturnType<typeof setTimeout>;
  return (...args: Parameters<T>) => {
    clearTimeout(timer);
    timer = setTimeout(() => fn(...args), ms);
  };
}

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export default function ClientsPage() {
  const { t } = useTranslation();
  const [clients, setClients] = useState<ClientSummary[]>([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState('');
  const [debouncedSearch, setDebouncedSearch] = useState('');
  const [modalOpen, setModalOpen] = useState(false);
  const [editingId, setEditingId] = useState<string | null>(null);

  // form state
  const [formName, setFormName] = useState('');
  const [formCode, setFormCode] = useState('');
  const [formDescription, setFormDescription] = useState('');
  const [formConnectionId, setFormConnectionId] = useState('');
  const [formContactName, setFormContactName] = useState('');
  const [formContactEmail, setFormContactEmail] = useState('');

  // connections for dropdown
  const [connections, setConnections] = useState<{ id: string; name: string }[]>([]);

  const debouncedSetSearch = useCallback(
    debounce((...args: unknown[]) => setDebouncedSearch(args[0] as string), 300),
    [],
  );

  const loadClients = useCallback(async () => {
    setLoading(true);
    try {
      const result = await fetchClients({ search: debouncedSearch, pageSize: 100 });
      setClients(result.data);
    } catch (err) {
      console.error('Failed to load clients', err);
    } finally {
      setLoading(false);
    }
  }, [debouncedSearch]);

  useEffect(() => {
    loadClients();
  }, [loadClients]);

  const loadConnections = async () => {
    try {
      const result = await fetchConnections({ pageSize: 100 });
      setConnections(result.data.map((c) => ({ id: c.id, name: c.name })));
    } catch {
      /* ignore */
    }
  };

  const openNew = () => {
    setEditingId(null);
    setFormName('');
    setFormCode('');
    setFormDescription('');
    setFormConnectionId('');
    setFormContactName('');
    setFormContactEmail('');
    loadConnections();
    setModalOpen(true);
  };

  const openEdit = (client: ClientSummary) => {
    setEditingId(client.id);
    setFormName(client.name);
    setFormCode(client.code);
    setFormDescription(client.description ?? '');
    setFormConnectionId('');
    setFormContactName(client.contactName ?? '');
    setFormContactEmail(client.contactEmail ?? '');
    loadConnections();
    setModalOpen(true);
  };

  const handleSubmit = async () => {
    const payload: ClientPayload = {
      name: formName,
      code: formCode.toUpperCase(),
      description: formDescription || undefined,
      connectionId: formConnectionId || null,
      contactName: formContactName || null,
      contactEmail: formContactEmail || null,
    };
    try {
      if (editingId) {
        await updateClient(editingId, payload);
      } else {
        await createClient(payload);
      }
      setModalOpen(false);
      loadClients();
    } catch (err) {
      console.error('Failed to save client', err);
    }
  };

  const handleDeactivate = async (id: string) => {
    if (!confirm('Delete this client?')) return;
    try {
      await deleteClient(id);
      loadClients();
    } catch (err) {
      console.error('Failed to delete client', err);
    }
  };

  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow={t('clients.eyebrow')}
        title={t('clients.title')}
        description={t('clients.description')}
        actions={
          <>
            <input
              placeholder={t('clients.search')}
              value={search}
              onChange={(e) => {
                setSearch(e.target.value);
                debouncedSetSearch(e.target.value);
              }}
              className="app-input"
              style={{ width: 'min(100%, 280px)' }}
            />
            <button onClick={openNew} className="app-button app-button-primary">
              + {t('clients.newClient')}
            </button>
          </>
        }
      />
      <div className="app-stack">
        {/* Loading */}
        {loading && <AppEmptyState>{t('clients.loading')}</AppEmptyState>}

        {/* Grid */}
        {!loading && clients.length === 0 && (
          <AppEmptyState>{t('clients.noClients')}</AppEmptyState>
        )}

        {!loading && clients.length > 0 && (
          <div
            className="app-grid"
            style={{ gridTemplateColumns: 'repeat(auto-fill, minmax(min(100%, 320px), 1fr))' }}
          >
            {clients.map((client) => (
              <AppCard key={client.id}>
                {/* Top row: name + code badge */}
                <div
                  style={{
                    display: 'flex',
                    justifyContent: 'space-between',
                    alignItems: 'flex-start',
                    marginBottom: '10px',
                  }}
                >
                  <div>
                    <div className="app-card-title">{client.name}</div>
                    {client.description && (
                      <div
                        style={{
                          fontSize: '0.78rem',
                          color: 'var(--app-muted)',
                          lineHeight: 1.3,
                          maxWidth: '220px',
                          overflow: 'hidden',
                          textOverflow: 'ellipsis',
                          whiteSpace: 'nowrap',
                        }}
                      >
                        {client.description}
                      </div>
                    )}
                  </div>
                  <AppStatusPill tone="accent">{client.code}</AppStatusPill>
                </div>

                {/* Connection info */}
                {client.connectionName && (
                  <div
                    style={{
                      fontSize: '0.78rem',
                      color: 'var(--app-muted)',
                      marginBottom: '6px',
                      display: 'flex',
                      alignItems: 'center',
                      gap: '4px',
                    }}
                  >
                    <span style={{ opacity: 0.7 }}>DB:</span> {client.connectionName}
                  </div>
                )}

                {/* Contact */}
                {(client.contactName || client.contactEmail) && (
                  <div
                    style={{
                      fontSize: '0.75rem',
                      color: 'var(--app-muted)',
                      marginBottom: '10px',
                    }}
                  >
                    {client.contactName && <span>{client.contactName}</span>}
                    {client.contactName && client.contactEmail && <span> &middot; </span>}
                    {client.contactEmail && (
                      <span style={{ color: 'var(--app-accent-strong)' }}>
                        {client.contactEmail}
                      </span>
                    )}
                  </div>
                )}

                {/* Footer: issue count + actions */}
                <div
                  className="app-toolbar"
                  style={{
                    justifyContent: 'space-between',
                    marginTop: '12px',
                    paddingTop: '12px',
                    borderTop: '1px solid var(--app-border)',
                  }}
                >
                  <span style={{ fontSize: '0.72rem', color: 'var(--app-muted)' }}>
                    {client.issueCount} issue{client.issueCount !== 1 ? 's' : ''}
                  </span>
                  <div style={{ display: 'flex', gap: '6px' }}>
                    <button
                      onClick={(e) => {
                        e.stopPropagation();
                        openEdit(client);
                      }}
                      className="app-button"
                    >
                      {t('clients.edit')}
                    </button>
                    <button
                      onClick={(e) => {
                        e.stopPropagation();
                        handleDeactivate(client.id);
                      }}
                      className="app-button"
                      style={{ color: 'var(--app-danger)', borderColor: '#f4b4ae' }}
                    >
                      {t('clients.delete')}
                    </button>
                  </div>
                </div>
              </AppCard>
            ))}
          </div>
        )}

        {/* Modal */}
        {modalOpen && (
          <div className="app-modal-backdrop" onClick={() => setModalOpen(false)}>
            <div className="app-modal" onClick={(e) => e.stopPropagation()}>
              <h2 className="app-card-title" style={{ marginBottom: '18px' }}>
                {editingId ? t('clients.editClient') : t('clients.newClient')}
              </h2>

              <div className="app-field">
                <label className="app-label">{t('clients.name')} *</label>
                <input
                  value={formName}
                  onChange={(e) => setFormName(e.target.value)}
                  className="app-input"
                  placeholder="Acme Corp"
                />
              </div>

              <div className="app-field">
                <label className="app-label">{t('clients.code')} *</label>
                <input
                  value={formCode}
                  onChange={(e) => setFormCode(e.target.value.toUpperCase())}
                  maxLength={6}
                  className="app-input"
                  style={{ fontFamily: 'monospace', textTransform: 'uppercase' }}
                  placeholder="ACME"
                />
              </div>

              <div className="app-field">
                <label className="app-label">{t('clients.descriptionLabel')}</label>
                <textarea
                  value={formDescription}
                  onChange={(e) => setFormDescription(e.target.value)}
                  rows={2}
                  className="app-textarea"
                  placeholder="Brief description..."
                />
              </div>

              <div className="app-field">
                <label className="app-label">{t('clients.connection')}</label>
                <select
                  value={formConnectionId}
                  onChange={(e) => setFormConnectionId(e.target.value)}
                  className="app-select"
                >
                  <option value="">-- None --</option>
                  {connections.map((c) => (
                    <option key={c.id} value={c.id}>
                      {c.name}
                    </option>
                  ))}
                </select>
              </div>

              <div className="app-field">
                <label className="app-label">{t('clients.contactName')}</label>
                <input
                  value={formContactName}
                  onChange={(e) => setFormContactName(e.target.value)}
                  className="app-input"
                  placeholder="Jane Doe"
                />
              </div>

              <div className="app-field">
                <label className="app-label">{t('clients.contactEmail')}</label>
                <input
                  value={formContactEmail}
                  onChange={(e) => setFormContactEmail(e.target.value)}
                  className="app-input"
                  type="email"
                  placeholder="jane@acme.com"
                />
              </div>

              <div className="app-toolbar" style={{ justifyContent: 'flex-end', marginTop: '8px' }}>
                <button onClick={() => setModalOpen(false)} className="app-button">
                  {t('clients.cancel')}
                </button>
                <button
                  onClick={handleSubmit}
                  disabled={!formName.trim() || !formCode.trim()}
                  className="app-button app-button-primary"
                  style={{ opacity: !formName.trim() || !formCode.trim() ? 0.5 : 1 }}
                >
                  {editingId ? t('clients.saveChanges') : t('clients.createClient')}
                </button>
              </div>
            </div>
          </div>
        )}
      </div>
    </AppPage>
  );
}
