import { useState, useEffect, useCallback } from 'react';
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

  // eslint-disable-next-line react-hooks/exhaustive-deps
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

  // Styles
  const headerStyle: React.CSSProperties = {
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: '1.25rem',
    flexWrap: 'wrap',
    gap: '0.75rem',
  };

  const searchStyle: React.CSSProperties = {
    padding: '8px 12px',
    border: '1px solid #d1d5db',
    borderRadius: '8px',
    fontSize: '0.85rem',
    width: '260px',
    outline: 'none',
    boxSizing: 'border-box' as const,
  };

  const btnPrimary: React.CSSProperties = {
    padding: '8px 18px',
    backgroundColor: '#3b82f6',
    color: '#fff',
    border: 'none',
    borderRadius: '8px',
    fontSize: '0.85rem',
    fontWeight: 600,
    cursor: 'pointer',
  };

  const btnSecondary: React.CSSProperties = {
    padding: '6px 12px',
    backgroundColor: '#f3f4f6',
    color: '#374151',
    border: '1px solid #d1d5db',
    borderRadius: '6px',
    fontSize: '0.75rem',
    fontWeight: 500,
    cursor: 'pointer',
  };

  const cardStyle: React.CSSProperties = {
    border: '1px solid #e5e7eb',
    borderRadius: '10px',
    padding: '16px 18px',
    backgroundColor: '#ffffff',
    cursor: 'pointer',
    transition: 'box-shadow 0.15s, border-color 0.15s',
  };

  const badgeStyle = (bg: string, color: string): React.CSSProperties => ({
    fontSize: '0.6rem',
    fontWeight: 700,
    padding: '2px 8px',
    borderRadius: '9999px',
    backgroundColor: bg,
    color,
    textTransform: 'uppercase',
    letterSpacing: '0.04em',
  });

  const overlayStyle: React.CSSProperties = {
    position: 'fixed',
    top: 0,
    left: 0,
    right: 0,
    bottom: 0,
    backgroundColor: 'rgba(0,0,0,0.4)',
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
    zIndex: 1000,
  };

  const modalStyle: React.CSSProperties = {
    backgroundColor: '#fff',
    borderRadius: '12px',
    padding: '24px',
    width: '460px',
    maxWidth: '90vw',
    maxHeight: '85vh',
    overflowY: 'auto',
    boxShadow: '0 20px 60px rgba(0,0,0,0.2)',
  };

  const fieldStyle: React.CSSProperties = {
    display: 'flex',
    flexDirection: 'column',
    gap: '4px',
    marginBottom: '14px',
  };

  const labelStyle: React.CSSProperties = {
    fontSize: '0.75rem',
    fontWeight: 600,
    color: '#374151',
  };

  const inputStyle: React.CSSProperties = {
    padding: '8px 10px',
    border: '1px solid #d1d5db',
    borderRadius: '6px',
    fontSize: '0.85rem',
    outline: 'none',
    boxSizing: 'border-box' as const,
  };

  return (
    <div>
      {/* Header */}
      <div style={headerStyle}>
        <h1 style={{ margin: 0, fontSize: '1.5rem', fontWeight: 700, color: '#111827' }}>
          Clients
        </h1>
        <div style={{ display: 'flex', gap: '0.75rem', alignItems: 'center' }}>
          <input
            placeholder="Search clients..."
            value={search}
            onChange={(e) => {
              setSearch(e.target.value);
              debouncedSetSearch(e.target.value);
            }}
            style={searchStyle}
          />
          <button onClick={openNew} style={btnPrimary}>
            + New Client
          </button>
        </div>
      </div>

      {/* Loading */}
      {loading && (
        <div style={{ color: '#6b7280', padding: '2rem 0' }}>Loading clients...</div>
      )}

      {/* Grid */}
      {!loading && clients.length === 0 && (
        <div style={{ color: '#9ca3af', padding: '3rem', textAlign: 'center' }}>
          No clients found. Create one to get started.
        </div>
      )}

      {!loading && clients.length > 0 && (
        <div
          style={{
            display: 'grid',
            gridTemplateColumns: 'repeat(auto-fill, minmax(320px, 1fr))',
            gap: '16px',
          }}
        >
          {clients.map((client) => (
            <div
              key={client.id}
              style={cardStyle}
              onMouseEnter={(e) => {
                (e.currentTarget as HTMLDivElement).style.boxShadow =
                  '0 4px 16px rgba(0,0,0,0.08)';
                (e.currentTarget as HTMLDivElement).style.borderColor = '#93c5fd';
              }}
              onMouseLeave={(e) => {
                (e.currentTarget as HTMLDivElement).style.boxShadow = 'none';
                (e.currentTarget as HTMLDivElement).style.borderColor = '#e5e7eb';
              }}
            >
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
                  <div
                    style={{
                      fontSize: '1rem',
                      fontWeight: 600,
                      color: '#111827',
                      marginBottom: '2px',
                    }}
                  >
                    {client.name}
                  </div>
                  {client.description && (
                    <div
                      style={{
                        fontSize: '0.78rem',
                        color: '#6b7280',
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
                <span style={badgeStyle('#e0e7ff', '#3730a3')}>{client.code}</span>
              </div>

              {/* Connection info */}
              {client.connectionName && (
                <div
                  style={{
                    fontSize: '0.78rem',
                    color: '#4b5563',
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
                    color: '#6b7280',
                    marginBottom: '10px',
                  }}
                >
                  {client.contactName && <span>{client.contactName}</span>}
                  {client.contactName && client.contactEmail && <span> &middot; </span>}
                  {client.contactEmail && (
                    <span style={{ color: '#3b82f6' }}>{client.contactEmail}</span>
                  )}
                </div>
              )}

              {/* Footer: issue count + actions */}
              <div
                style={{
                  display: 'flex',
                  justifyContent: 'space-between',
                  alignItems: 'center',
                  marginTop: '8px',
                  paddingTop: '10px',
                  borderTop: '1px solid #f3f4f6',
                }}
              >
                <span style={{ fontSize: '0.72rem', color: '#9ca3af' }}>
                  {client.issueCount} issue{client.issueCount !== 1 ? 's' : ''}
                </span>
                <div style={{ display: 'flex', gap: '6px' }}>
                  <button
                    onClick={(e) => {
                      e.stopPropagation();
                      openEdit(client);
                    }}
                    style={btnSecondary}
                  >
                    Edit
                  </button>
                  <button
                    onClick={(e) => {
                      e.stopPropagation();
                      handleDeactivate(client.id);
                    }}
                    style={{
                      ...btnSecondary,
                      color: '#dc2626',
                      borderColor: '#fecaca',
                    }}
                  >
                    Delete
                  </button>
                </div>
              </div>
            </div>
          ))}
        </div>
      )}

      {/* Modal */}
      {modalOpen && (
        <div style={overlayStyle} onClick={() => setModalOpen(false)}>
          <div style={modalStyle} onClick={(e) => e.stopPropagation()}>
            <h2
              style={{
                margin: '0 0 18px',
                fontSize: '1.15rem',
                fontWeight: 700,
                color: '#111827',
              }}
            >
              {editingId ? 'Edit Client' : 'New Client'}
            </h2>

            <div style={fieldStyle}>
              <label style={labelStyle}>Name *</label>
              <input
                value={formName}
                onChange={(e) => setFormName(e.target.value)}
                style={inputStyle}
                placeholder="Acme Corp"
              />
            </div>

            <div style={fieldStyle}>
              <label style={labelStyle}>Code *</label>
              <input
                value={formCode}
                onChange={(e) => setFormCode(e.target.value.toUpperCase())}
                maxLength={6}
                style={{ ...inputStyle, fontFamily: 'monospace', textTransform: 'uppercase' }}
                placeholder="ACME"
              />
            </div>

            <div style={fieldStyle}>
              <label style={labelStyle}>Description</label>
              <textarea
                value={formDescription}
                onChange={(e) => setFormDescription(e.target.value)}
                rows={2}
                style={{ ...inputStyle, resize: 'vertical' }}
                placeholder="Brief description..."
              />
            </div>

            <div style={fieldStyle}>
              <label style={labelStyle}>Connection</label>
              <select
                value={formConnectionId}
                onChange={(e) => setFormConnectionId(e.target.value)}
                style={inputStyle}
              >
                <option value="">-- None --</option>
                {connections.map((c) => (
                  <option key={c.id} value={c.id}>
                    {c.name}
                  </option>
                ))}
              </select>
            </div>

            <div style={fieldStyle}>
              <label style={labelStyle}>Contact Name</label>
              <input
                value={formContactName}
                onChange={(e) => setFormContactName(e.target.value)}
                style={inputStyle}
                placeholder="Jane Doe"
              />
            </div>

            <div style={fieldStyle}>
              <label style={labelStyle}>Contact Email</label>
              <input
                value={formContactEmail}
                onChange={(e) => setFormContactEmail(e.target.value)}
                style={inputStyle}
                type="email"
                placeholder="jane@acme.com"
              />
            </div>

            <div style={{ display: 'flex', justifyContent: 'flex-end', gap: '8px', marginTop: '8px' }}>
              <button onClick={() => setModalOpen(false)} style={btnSecondary}>
                Cancel
              </button>
              <button
                onClick={handleSubmit}
                disabled={!formName.trim() || !formCode.trim()}
                style={{
                  ...btnPrimary,
                  opacity: !formName.trim() || !formCode.trim() ? 0.5 : 1,
                  cursor: !formName.trim() || !formCode.trim() ? 'not-allowed' : 'pointer',
                }}
              >
                {editingId ? 'Save Changes' : 'Create Client'}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
