import { useState, useEffect, useMemo, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  fetchIssues,
  fetchIssue,
  updateIssue,
  transitionIssueWithReason,
  type IssueSummary,
  type Issue,
} from '@/services/issues.api';
import { fetchUsersByRole, fetchUsers, type UserProfile } from '@/services/users.api';

// ---------------------------------------------------------------------------
// Types
// ---------------------------------------------------------------------------

type ActiveModal = 'assign' | 'return' | null;

// ---------------------------------------------------------------------------
// Utility
// ---------------------------------------------------------------------------

function formatDate(iso: string | undefined | null): string {
  if (!iso) return '—';
  try {
    const d = new Date(iso);
    return d.toLocaleString('es-CO', { dateStyle: 'medium', timeStyle: 'short' });
  } catch {
    return '—';
  }
}

function priorityColor(p: string): string {
  switch (p) {
    case 'critical': return 'var(--app-danger)';
    case 'high':     return 'var(--app-warm)';
    case 'medium':   return 'var(--app-accent)';
    default:         return 'var(--app-muted)';
  }
}

function priorityLabel(p: string): string {
  return ({ critical: 'Crítica', high: 'Alta', medium: 'Media', low: 'Baja' } as Record<string, string>)[p] ?? p;
}

function typeLabel(t: string): string {
  return ({ feature: 'Nueva funcionalidad', bug: 'Corrección', enhancement: 'Mejora', task: 'Tarea' } as Record<string, string>)[t] ?? t;
}

// ---------------------------------------------------------------------------
// Main component
// ---------------------------------------------------------------------------

export default function DevelopmentLeadInbox() {
  const navigate = useNavigate();

  // List state
  const [items, setItems] = useState<IssueSummary[]>([]);
  const [loading, setLoading] = useState(true);
  const [listError, setListError] = useState('');
  const [search, setSearch] = useState('');

  // Selection + detail
  const [selectedId, setSelectedId] = useState<string | null>(null);
  const [selected, setSelected] = useState<Issue | null>(null);
  const [loadingDetail, setLoadingDetail] = useState(false);

  // Modal state
  const [modal, setModal] = useState<ActiveModal>(null);
  const [actionError, setActionError] = useState('');
  const [submitting, setSubmitting] = useState(false);

  // Assign modal
  const [developers, setDevelopers] = useState<UserProfile[]>([]);
  const [selectedDevId, setSelectedDevId] = useState('');
  const [loadingDevs, setLoadingDevs] = useState(false);

  // Return modal
  const [returnComments, setReturnComments] = useState('');

  // ── Load list (status = intake = Radicado/Aprobado) ──────────────────────
  const loadList = useCallback(() => {
    setLoading(true);
    setListError('');
    fetchIssues({ status: 'intake', pageSize: 100 })
      .then((r) => setItems(r.data))
      .catch((err) => {
        console.error('fetchIssues error:', err);
        const apiMsg =
          err?.response?.data?.error?.message ||
          err?.response?.data?.message ||
          err?.message ||
          'Error desconocido';
        const status = err?.response?.status ?? '';
        setListError(
          `No se pudieron cargar los requerimientos aprobados` +
            (status ? ` (HTTP ${status})` : '') +
            `: ${apiMsg}`,
        );
      })
      .finally(() => setLoading(false));
  }, []);

  useEffect(loadList, [loadList]);

  // ── Load detail when selection changes ───────────────────────────────────
  useEffect(() => {
    if (!selectedId) {
      setSelected(null);
      return;
    }
    setLoadingDetail(true);
    fetchIssue(selectedId)
      .then(setSelected)
      .catch((err) => {
        console.error(err);
        setSelected(null);
      })
      .finally(() => setLoadingDetail(false));
  }, [selectedId]);

  // ── Load developers for assign modal ─────────────────────────────────────
  useEffect(() => {
    if (modal !== 'assign') return;
    setLoadingDevs(true);
    // Try by role first; if empty, fall back to all active users
    fetchUsersByRole('developer')
      .then(async (devs) => {
        if (devs.length > 0) {
          setDevelopers(devs);
        } else {
          const all = await fetchUsers({ isActive: true, limit: 100 });
          setDevelopers(all.data);
        }
      })
      .catch(() => setDevelopers([]))
      .finally(() => setLoadingDevs(false));
  }, [modal]);

  // ── Filtered list ────────────────────────────────────────────────────────
  const filtered = useMemo(() => {
    const q = search.trim().toLowerCase();
    if (!q) return items;
    return items.filter((i) =>
      [i.code, i.title, i.clientName, i.appName].some((v) =>
        String(v ?? '').toLowerCase().includes(q),
      ),
    );
  }, [items, search]);

  // ── Asignar action: set assignedTo + transition intake → prd ─────────────
  const handleAssign = async () => {
    if (!selected || !selectedDevId) return;
    setActionError('');
    setSubmitting(true);
    try {
      await updateIssue(selected.id, { assignedTo: selectedDevId });
      await transitionIssueWithReason(selected.id, 'prd', 'Asignado por el Jefe de Desarrollo');
      // Reset + refresh
      setModal(null);
      setSelectedDevId('');
      setSelectedId(null);
      loadList();
    } catch (err) {
      console.error(err);
      setActionError('No se pudo asignar el requerimiento.');
    } finally {
      setSubmitting(false);
    }
  };

  // ── Devolver action: transition intake → draft with comments ─────────────
  const handleReturn = async () => {
    if (!selected) return;
    const reason = returnComments.trim();
    if (reason.length < 10) {
      setActionError('Los comentarios deben tener al menos 10 caracteres.');
      return;
    }
    setActionError('');
    setSubmitting(true);
    try {
      await transitionIssueWithReason(selected.id, 'draft', reason);
      setModal(null);
      setReturnComments('');
      setSelectedId(null);
      loadList();
    } catch (err) {
      console.error(err);
      setActionError('No se pudo devolver el requerimiento.');
    } finally {
      setSubmitting(false);
    }
  };

  const closeModal = () => {
    setModal(null);
    setActionError('');
    setReturnComments('');
    setSelectedDevId('');
  };

  // ─────────────────────────────────────────────────────────────────────────
  // Render
  // ─────────────────────────────────────────────────────────────────────────

  return (
    <div style={styles.page}>
      {/* Header */}
      <div style={styles.header}>
        <div>
          <p className="app-label" style={{ margin: 0 }}>BANDEJA DEL JEFE DE DESARROLLO</p>
          <h1 style={styles.title}>Requerimientos Aprobados</h1>
          <p style={styles.subtitle}>
            Revisa los requerimientos radicados y asignalos a un ingeniero o devuelvelos con comentarios.
          </p>
        </div>
        <div style={{ display: 'flex', gap: 8 }}>
          <button className="app-button" onClick={loadList} disabled={loading}>
            {loading ? 'Cargando...' : '🔄 Actualizar'}
          </button>
        </div>
      </div>

      {/* Layout: list + detail */}
      <div style={styles.body}>
        {/* ── List column ── */}
        <div style={styles.listCol}>
          <div style={styles.searchBar}>
            <input
              className="app-input"
              type="search"
              placeholder="Buscar por código, título, cliente o aplicación..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
            />
            <span style={styles.counter}>
              {filtered.length} de {items.length}
            </span>
          </div>

          {listError && <div style={styles.errorBanner}>{listError}</div>}

          {loading && items.length === 0 ? (
            <div style={styles.empty}>Cargando requerimientos...</div>
          ) : filtered.length === 0 ? (
            <div style={styles.empty}>
              <div style={{ fontSize: '2rem', opacity: 0.35 }}>📭</div>
              <div style={{ marginTop: 8, fontWeight: 600 }}>Bandeja vacía</div>
              <div style={{ fontSize: '0.85rem', color: 'var(--app-muted)' }}>
                No hay requerimientos aprobados pendientes de asignación.
              </div>
            </div>
          ) : (
            <div style={styles.list}>
              {filtered.map((it) => {
                const isSelected = it.id === selectedId;
                return (
                  <button
                    key={it.id}
                    type="button"
                    onClick={() => setSelectedId(it.id)}
                    style={{
                      ...styles.listItem,
                      ...(isSelected ? styles.listItemActive : {}),
                    }}
                  >
                    <div style={styles.listItemHeader}>
                      <span style={styles.code}>{it.code}</span>
                      <span style={{ ...styles.priority, color: priorityColor(it.priority) }}>
                        ● {priorityLabel(it.priority)}
                      </span>
                    </div>
                    <div style={styles.listItemTitle}>{it.title}</div>
                    <div style={styles.listItemMeta}>
                      <span>{it.clientName}</span>
                      {it.appName && <span> · {it.appName}</span>}
                      {it.pageName && <span> · pg. {it.pageName}</span>}
                    </div>
                  </button>
                );
              })}
            </div>
          )}
        </div>

        {/* ── Detail column ── */}
        <div style={styles.detailCol}>
          {!selectedId && (
            <div style={styles.detailPlaceholder}>
              <div style={{ fontSize: '2.5rem', opacity: 0.25 }}>👆</div>
              <div style={{ marginTop: 12, fontSize: '0.95rem' }}>
                Selecciona un requerimiento de la lista
              </div>
            </div>
          )}

          {selectedId && loadingDetail && (
            <div style={styles.detailPlaceholder}>Cargando...</div>
          )}

          {selected && !loadingDetail && (
            <>
              {/* Action bar */}
              <div style={styles.actionBar}>
                <button
                  className="app-button"
                  onClick={() => { setActionError(''); setModal('return'); }}
                  disabled={submitting}
                >
                  ↩ Devolver con comentarios
                </button>
                <button
                  className="app-button app-button-primary"
                  onClick={() => { setActionError(''); setModal('assign'); }}
                  disabled={submitting}
                >
                  👤 Asignar a ingeniero
                </button>
              </div>

              {/* Detail card */}
              <div style={styles.detailCard}>
                <div style={styles.detailHeader}>
                  <span style={styles.code}>{selected.code}</span>
                  <span style={{ ...styles.priority, color: priorityColor(selected.priority) }}>
                    ● {priorityLabel(selected.priority)} · {typeLabel(selected.type)}
                  </span>
                </div>
                <h2 style={styles.detailTitle}>{selected.title}</h2>

                <div style={styles.metaGrid}>
                  <MetaField label="Cliente"        value={selected.clientName} />
                  <MetaField label="Aplicación"     value={selected.appName} />
                  <MetaField label="Página"         value={selected.pageName} />
                  <MetaField label="Radicado por"   value={selected.requestedByName ?? '—'} />
                  <MetaField label="Fecha"          value={formatDate(selected.createdAt)} />
                  <MetaField label="Score IA"       value={selected.aiValidationScore != null ? `${selected.aiValidationScore}/100` : '—'} />
                </div>

                {selected.description && (
                  <div style={styles.descriptionBlock}>
                    <div className="app-label" style={{ marginBottom: 6 }}>DESCRIPCIÓN</div>
                    <div style={styles.descriptionBody}>{selected.description}</div>
                  </div>
                )}

                {/* AI validation summary */}
                {selected.aiValidationNotes && (
                  <div style={styles.aiBlock}>
                    <div className="app-label" style={{ marginBottom: 6 }}>VALIDACIÓN IA</div>
                    <div style={styles.aiSummary}>
                      {String((selected.aiValidationNotes as { summary?: string }).summary ?? 'Sin resumen')}
                    </div>
                  </div>
                )}

                {/* Adjuntos */}
                {selected.requirementDocuments && selected.requirementDocuments.length > 0 && (
                  <div style={styles.aiBlock}>
                    <div className="app-label" style={{ marginBottom: 6 }}>ADJUNTOS</div>
                    <ul style={{ margin: 0, paddingLeft: 18 }}>
                      {selected.requirementDocuments.map((d) => (
                        <li key={d.id} style={{ fontSize: '0.85rem' }}>
                          {d.filename} <span style={{ color: 'var(--app-muted)' }}>({Math.round(d.fileSize / 1024)} KB)</span>
                        </li>
                      ))}
                    </ul>
                  </div>
                )}

                {/* History — read from audit/transitions */}
                <IssueHistory issueId={selected.id} />

                <button
                  className="app-button"
                  style={{ marginTop: 16 }}
                  onClick={() => navigate(`/issues/${selected.id}`)}
                >
                  Ver detalle completo →
                </button>
              </div>
            </>
          )}
        </div>
      </div>

      {/* ── Assign modal ── */}
      {modal === 'assign' && selected && (
        <div className="app-modal-backdrop" onClick={closeModal}>
          <div
            className="app-modal"
            style={{ width: 'min(92vw, 520px)' }}
            onClick={(e) => e.stopPropagation()}
          >
            <h2 className="app-card-title" style={{ margin: 0 }}>Asignar a ingeniero</h2>
            <p style={{ color: 'var(--app-muted)', fontSize: '0.85rem', marginTop: 6 }}>
              Al asignar, el requerimiento pasa al estado <strong>Asignado</strong> y el ingeniero
              podrá comenzar la fase de PRD.
            </p>

            <div style={{ marginTop: 16 }}>
              <label className="app-label">Ingeniero de desarrollo</label>
              <select
                className="app-select"
                value={selectedDevId}
                onChange={(e) => setSelectedDevId(e.target.value)}
                disabled={loadingDevs}
              >
                <option value="">
                  {loadingDevs ? 'Cargando...' : '— Selecciona un ingeniero —'}
                </option>
                {developers.map((d) => (
                  <option key={d.id} value={d.id}>
                    {d.displayName} ({d.email})
                  </option>
                ))}
              </select>
              {!loadingDevs && developers.length === 0 && (
                <div style={{ fontSize: '0.8rem', color: 'var(--app-muted)', marginTop: 6 }}>
                  No hay usuarios activos disponibles.
                </div>
              )}
            </div>

            {actionError && <div style={styles.errorBanner}>{actionError}</div>}

            <div style={styles.modalActions}>
              <button className="app-button" onClick={closeModal} disabled={submitting}>
                Cancelar
              </button>
              <button
                className="app-button app-button-primary"
                onClick={handleAssign}
                disabled={submitting || !selectedDevId}
              >
                {submitting ? 'Asignando...' : '✓ Confirmar asignación'}
              </button>
            </div>
          </div>
        </div>
      )}

      {/* ── Return modal ── */}
      {modal === 'return' && selected && (
        <div className="app-modal-backdrop" onClick={closeModal}>
          <div
            className="app-modal"
            style={{ width: 'min(92vw, 560px)' }}
            onClick={(e) => e.stopPropagation()}
          >
            <h2 className="app-card-title" style={{ margin: 0 }}>Devolver con comentarios</h2>
            <p style={{ color: 'var(--app-muted)', fontSize: '0.85rem', marginTop: 6 }}>
              El requerimiento volverá al estado <strong>Devuelto</strong> y el Líder Operativo
              podrá corregirlo. Los comentarios quedarán en el histórico.
            </p>

            <div style={{ marginTop: 16 }}>
              <label className="app-label">Motivo / comentarios</label>
              <textarea
                className="app-textarea"
                rows={6}
                placeholder="Explica qué falta o qué debe corregirse..."
                value={returnComments}
                onChange={(e) => setReturnComments(e.target.value)}
              />
              <div style={{ fontSize: '0.75rem', color: 'var(--app-muted)', marginTop: 4 }}>
                Mínimo 10 caracteres. {returnComments.length} escritos.
              </div>
            </div>

            {actionError && <div style={styles.errorBanner}>{actionError}</div>}

            <div style={styles.modalActions}>
              <button className="app-button" onClick={closeModal} disabled={submitting}>
                Cancelar
              </button>
              <button
                className="app-button"
                onClick={handleReturn}
                disabled={submitting || returnComments.trim().length < 10}
                style={{ background: 'var(--app-warm)', color: '#fff' }}
              >
                {submitting ? 'Devolviendo...' : '↩ Confirmar devolución'}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

// ---------------------------------------------------------------------------
// Sub-components
// ---------------------------------------------------------------------------

function MetaField({ label, value }: { label: string; value?: string | null }) {
  return (
    <div>
      <div style={{ fontSize: '0.7rem', color: 'var(--app-muted)', fontWeight: 600, letterSpacing: '0.04em' }}>
        {label.toUpperCase()}
      </div>
      <div style={{ fontSize: '0.88rem', marginTop: 2 }}>{value || '—'}</div>
    </div>
  );
}

function IssueHistory({ issueId }: { issueId: string }) {
  // Reads transitions from the issue itself (already embedded in Issue type)
  // Shown as a compact timeline. Annotated returns come with returnedReason.
  const [issue, setIssue] = useState<Issue | null>(null);
  useEffect(() => {
    fetchIssue(issueId).then(setIssue).catch(() => setIssue(null));
  }, [issueId]);

  if (!issue) return null;
  const transitions = issue.transitions ?? [];
  if (transitions.length === 0) return null;

  return (
    <div style={{ marginTop: 20 }}>
      <div className="app-label" style={{ marginBottom: 8 }}>HISTORIAL DE ESTADOS</div>
      <ol style={{ margin: 0, padding: 0, listStyle: 'none' }}>
        {transitions.slice(-8).reverse().map((t, i) => (
          <li key={i} style={styles.historyItem}>
            <span style={styles.historyDot}>•</span>
            <div style={{ flex: 1 }}>
              <div style={{ fontSize: '0.82rem' }}>
                <strong>{t.from ?? '—'}</strong> → <strong>{t.to}</strong>
              </div>
              <div style={{ fontSize: '0.72rem', color: 'var(--app-muted)' }}>
                {formatDate(t.at)}
              </div>
            </div>
          </li>
        ))}
      </ol>
      {issue.returnedReason && (
        <div style={styles.returnedBanner}>
          <strong>Última devolución:</strong> {issue.returnedReason}
        </div>
      )}
    </div>
  );
}

// ---------------------------------------------------------------------------
// Styles
// ---------------------------------------------------------------------------

const styles: Record<string, React.CSSProperties> = {
  page: {
    padding: '24px 28px',
    maxWidth: 1400,
    margin: '0 auto',
  },
  header: {
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'flex-end',
    marginBottom: 20,
    gap: 12,
    flexWrap: 'wrap',
  },
  title: {
    margin: '4px 0 6px',
    fontSize: '1.65rem',
    fontWeight: 600,
  },
  subtitle: {
    margin: 0,
    color: 'var(--app-muted)',
    fontSize: '0.9rem',
  },
  body: {
    display: 'grid',
    gridTemplateColumns: 'minmax(320px, 420px) 1fr',
    gap: 20,
    alignItems: 'start',
  },
  listCol: {
    display: 'flex',
    flexDirection: 'column',
    gap: 12,
    minHeight: 400,
  },
  searchBar: {
    display: 'flex',
    gap: 8,
    alignItems: 'center',
  },
  counter: {
    fontSize: '0.78rem',
    color: 'var(--app-muted)',
    whiteSpace: 'nowrap',
  },
  list: {
    display: 'flex',
    flexDirection: 'column',
    gap: 8,
  },
  listItem: {
    textAlign: 'left',
    background: 'var(--app-surface)',
    border: '1px solid var(--app-border)',
    borderRadius: 10,
    padding: '10px 12px',
    cursor: 'pointer',
    transition: 'all 0.15s',
  },
  listItemActive: {
    borderColor: 'var(--app-accent)',
    boxShadow: '0 0 0 2px rgba(59,130,246,0.12)',
  },
  listItemHeader: {
    display: 'flex',
    justifyContent: 'space-between',
    fontSize: '0.72rem',
    marginBottom: 4,
  },
  listItemTitle: {
    fontSize: '0.92rem',
    fontWeight: 500,
    marginBottom: 4,
  },
  listItemMeta: {
    fontSize: '0.76rem',
    color: 'var(--app-muted)',
  },
  code: {
    fontFamily: 'var(--app-mono, ui-monospace)',
    color: 'var(--app-muted)',
    fontSize: '0.72rem',
  },
  priority: {
    fontSize: '0.72rem',
    fontWeight: 600,
  },
  detailCol: {
    minHeight: 400,
  },
  detailPlaceholder: {
    background: 'var(--app-surface)',
    border: '1px dashed var(--app-border)',
    borderRadius: 12,
    padding: '80px 24px',
    textAlign: 'center',
    color: 'var(--app-muted)',
  },
  actionBar: {
    display: 'flex',
    gap: 8,
    justifyContent: 'flex-end',
    marginBottom: 12,
  },
  detailCard: {
    background: 'var(--app-surface)',
    border: '1px solid var(--app-border)',
    borderRadius: 12,
    padding: 22,
  },
  detailHeader: {
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 6,
  },
  detailTitle: {
    margin: '4px 0 18px',
    fontSize: '1.3rem',
    fontWeight: 600,
    lineHeight: 1.3,
  },
  metaGrid: {
    display: 'grid',
    gridTemplateColumns: 'repeat(3, 1fr)',
    gap: 14,
    padding: '14px 0',
    borderTop: '1px solid var(--app-border)',
    borderBottom: '1px solid var(--app-border)',
  },
  descriptionBlock: {
    marginTop: 16,
  },
  descriptionBody: {
    whiteSpace: 'pre-wrap',
    fontSize: '0.88rem',
    lineHeight: 1.55,
    color: 'var(--app-text)',
  },
  aiBlock: {
    marginTop: 16,
    padding: 12,
    background: 'rgba(59,130,246,0.05)',
    borderRadius: 8,
  },
  aiSummary: {
    fontSize: '0.85rem',
    lineHeight: 1.5,
  },
  historyItem: {
    display: 'flex',
    gap: 10,
    padding: '6px 0',
    borderBottom: '1px solid var(--app-border-subtle, rgba(0,0,0,0.05))',
  },
  historyDot: {
    color: 'var(--app-accent)',
    fontSize: '1.2rem',
    lineHeight: 1,
  },
  returnedBanner: {
    marginTop: 10,
    padding: '10px 12px',
    background: 'rgba(234,179,8,0.1)',
    borderRadius: 8,
    fontSize: '0.82rem',
    color: '#854d0e',
  },
  modalActions: {
    display: 'flex',
    justifyContent: 'flex-end',
    gap: 8,
    marginTop: 20,
  },
  empty: {
    textAlign: 'center',
    padding: '60px 20px',
    color: 'var(--app-muted)',
    background: 'var(--app-surface)',
    border: '1px dashed var(--app-border)',
    borderRadius: 10,
  },
  errorBanner: {
    marginTop: 12,
    padding: '10px 12px',
    background: 'rgba(239,68,68,0.08)',
    color: 'var(--app-danger)',
    borderRadius: 8,
    fontSize: '0.85rem',
  },
};
