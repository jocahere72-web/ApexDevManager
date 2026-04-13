import { useState, useEffect, useMemo, useCallback } from 'react';
import {
  fetchUsers,
  createUser,
  updateUser,
  deactivateUser,
  type UserProfile,
  type CreateUserPayload,
  type UpdateUserPayload,
} from '@/services/users.api';
import { ROLE_LABELS, type Role } from '@apex-dev-manager/shared-types';

// ---------------------------------------------------------------------------
// Role catalog — ordered to match the product flow
// ---------------------------------------------------------------------------

const ROLE_ORDER: Role[] = [
  'admin',
  'ops_lead',
  'tech_lead',
  'developer',
  'dba',
  'qa_analyst',
  'devops_engineer',
  'release_manager',
  'knowledge_editor',
  'marketplace_publisher',
  'auditor',
];

const ROLE_DESCRIPTIONS: Record<Role, string> = {
  admin: 'Acceso total. Configura el tenant, usuarios y parámetros.',
  ops_lead: 'Radica requerimientos y responde devoluciones del Jefe de Desarrollo.',
  tech_lead: 'Revisa la bandeja de aprobados, asigna ingenieros o devuelve con comentarios.',
  developer: 'Implementa los requerimientos asignados: PRD, diseño y construcción.',
  dba: 'Revisa cambios de esquema y aprueba scripts de base de datos.',
  qa_analyst: 'Valida y ejecuta pruebas funcionales y de regresión.',
  devops_engineer: 'Gestiona despliegues, pipelines y ambientes.',
  release_manager: 'Aprueba releases y controla el calendario de publicación.',
  knowledge_editor: 'Administra la base de conocimiento y documentación.',
  marketplace_publisher: 'Publica componentes y plantillas al marketplace interno.',
  auditor: 'Acceso solo lectura a auditoría y actividad del sistema.',
};

const ROLE_COLOR: Record<Role, string> = {
  admin: '#7c3aed',
  ops_lead: '#0891b2',
  tech_lead: '#2563eb',
  developer: '#059669',
  dba: '#ca8a04',
  qa_analyst: '#db2777',
  devops_engineer: '#ea580c',
  release_manager: '#9333ea',
  knowledge_editor: '#0d9488',
  marketplace_publisher: '#4f46e5',
  auditor: '#64748b',
};

// ---------------------------------------------------------------------------
// Utilities
// ---------------------------------------------------------------------------

function formatDate(iso: string): string {
  try {
    return new Date(iso).toLocaleDateString('es-CO', { day: '2-digit', month: 'short', year: 'numeric' });
  } catch {
    return '—';
  }
}

function getInitials(name: string): string {
  return name.trim().split(/\s+/).slice(0, 2).map((w) => w[0]?.toUpperCase() ?? '').join('');
}

// ---------------------------------------------------------------------------
// Password strength helper
// ---------------------------------------------------------------------------

function passwordIssues(pw: string): string[] {
  const issues: string[] = [];
  if (pw.length < 12) issues.push('mínimo 12 caracteres');
  if (!/[a-z]/.test(pw)) issues.push('una minúscula');
  if (!/[A-Z]/.test(pw)) issues.push('una mayúscula');
  if (!/\d/.test(pw))    issues.push('un dígito');
  if (!/[!@#$%^&*()_+\-=[\]{};':"\\|,.<>/?`~]/.test(pw)) issues.push('un caracter especial');
  return issues;
}

// ---------------------------------------------------------------------------
// Main component
// ---------------------------------------------------------------------------

export default function UsersPage() {
  const [users, setUsers] = useState<UserProfile[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  const [search, setSearch] = useState('');
  const [roleFilter, setRoleFilter] = useState<Role | ''>('');
  const [activeFilter, setActiveFilter] = useState<'all' | 'active' | 'inactive'>('active');

  const [modal, setModal] = useState<{ mode: 'create' } | { mode: 'edit'; user: UserProfile } | null>(null);

  // ── Load list ────────────────────────────────────────────────────────────
  const load = useCallback(() => {
    setLoading(true);
    setError('');
    fetchUsers({
      search: search.trim() || undefined,
      role: roleFilter || undefined,
      isActive: activeFilter === 'all' ? undefined : activeFilter === 'active',
      limit: 100,
    })
      .then((r) => setUsers(r.data))
      .catch((err) => {
        const msg =
          err?.response?.data?.error?.message ||
          err?.response?.data?.message ||
          err?.message ||
          'Error desconocido';
        const status = err?.response?.status ?? '';
        setError(`No se pudieron cargar los usuarios${status ? ` (HTTP ${status})` : ''}: ${msg}`);
      })
      .finally(() => setLoading(false));
  }, [search, roleFilter, activeFilter]);

  useEffect(load, [load]);

  // ── Role counters ────────────────────────────────────────────────────────
  const roleCounts = useMemo(() => {
    const counts: Record<string, number> = {};
    users.forEach((u) => u.roles.forEach((r) => { counts[r] = (counts[r] ?? 0) + 1; }));
    return counts;
  }, [users]);

  // ── Deactivate handler ───────────────────────────────────────────────────
  const handleDeactivate = async (u: UserProfile) => {
    if (!window.confirm(`¿Desactivar a ${u.displayName}? No podrá iniciar sesión hasta reactivarlo.`)) return;
    try {
      await deactivateUser(u.id);
      load();
    } catch (err) {
      const e = err as { response?: { data?: { error?: { message?: string } } } };
      alert('No se pudo desactivar: ' + (e.response?.data?.error?.message ?? 'Error desconocido'));
    }
  };

  // ─────────────────────────────────────────────────────────────────────────
  // Render
  // ─────────────────────────────────────────────────────────────────────────

  return (
    <div style={styles.page}>
      {/* Header */}
      <div style={styles.header}>
        <div>
          <p className="app-label" style={{ margin: 0 }}>ADMINISTRACIÓN</p>
          <h1 style={styles.title}>Usuarios y Roles</h1>
          <p style={styles.subtitle}>
            Gestiona los usuarios del tenant, sus roles y permisos en el flujo de trabajo.
          </p>
        </div>
        <div style={{ display: 'flex', gap: 8 }}>
          <button className="app-button" onClick={load} disabled={loading}>
            {loading ? 'Cargando...' : '🔄 Actualizar'}
          </button>
          <button className="app-button app-button-primary" onClick={() => setModal({ mode: 'create' })}>
            + Nuevo usuario
          </button>
        </div>
      </div>

      {/* Role summary cards */}
      <div style={styles.roleGrid}>
        {ROLE_ORDER.map((r) => (
          <button
            key={r}
            type="button"
            onClick={() => setRoleFilter(roleFilter === r ? '' : r)}
            style={{
              ...styles.roleCard,
              borderColor: roleFilter === r ? ROLE_COLOR[r] : 'var(--app-border)',
              boxShadow: roleFilter === r ? `0 0 0 2px ${ROLE_COLOR[r]}20` : 'none',
            }}
          >
            <div style={styles.roleCardHead}>
              <span style={{ ...styles.roleDot, background: ROLE_COLOR[r] }} />
              <span style={styles.roleCount}>{roleCounts[r] ?? 0}</span>
            </div>
            <div style={styles.roleName}>{ROLE_LABELS[r]}</div>
            <div style={styles.roleDesc}>{ROLE_DESCRIPTIONS[r]}</div>
          </button>
        ))}
      </div>

      {/* Filters */}
      <div style={styles.filterBar}>
        <input
          className="app-input"
          type="search"
          placeholder="Buscar por nombre o email..."
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          style={{ flex: 1, minWidth: 200 }}
        />
        <select
          className="app-select"
          value={roleFilter}
          onChange={(e) => setRoleFilter(e.target.value as Role | '')}
          style={{ minWidth: 180 }}
        >
          <option value="">Todos los roles</option>
          {ROLE_ORDER.map((r) => (
            <option key={r} value={r}>{ROLE_LABELS[r]}</option>
          ))}
        </select>
        <select
          className="app-select"
          value={activeFilter}
          onChange={(e) => setActiveFilter(e.target.value as 'all' | 'active' | 'inactive')}
          style={{ minWidth: 140 }}
        >
          <option value="active">Activos</option>
          <option value="inactive">Inactivos</option>
          <option value="all">Todos</option>
        </select>
        <span style={{ color: 'var(--app-muted)', fontSize: '0.82rem' }}>
          {users.length} usuario{users.length !== 1 ? 's' : ''}
        </span>
      </div>

      {error && <div style={styles.errorBanner}>{error}</div>}

      {/* Table */}
      <div style={styles.tableCard}>
        {loading && users.length === 0 ? (
          <div style={styles.empty}>Cargando usuarios...</div>
        ) : users.length === 0 ? (
          <div style={styles.empty}>
            <div style={{ fontSize: '2.2rem', opacity: 0.3 }}>👥</div>
            <div style={{ marginTop: 8, fontWeight: 600 }}>Sin usuarios</div>
            <div style={{ fontSize: '0.85rem', color: 'var(--app-muted)' }}>
              Ajusta los filtros o crea el primer usuario.
            </div>
          </div>
        ) : (
          <table style={styles.table}>
            <thead>
              <tr>
                <th style={styles.th}>Usuario</th>
                <th style={styles.th}>Email</th>
                <th style={styles.th}>Roles</th>
                <th style={styles.th}>Estado</th>
                <th style={styles.th}>Creado</th>
                <th style={styles.thRight}>Acciones</th>
              </tr>
            </thead>
            <tbody>
              {users.map((u) => (
                <tr key={u.id} style={styles.tr}>
                  <td style={styles.td}>
                    <div style={{ display: 'flex', alignItems: 'center', gap: 10 }}>
                      <div style={styles.avatar}>{getInitials(u.displayName)}</div>
                      <div>
                        <div style={{ fontWeight: 500 }}>{u.displayName}</div>
                      </div>
                    </div>
                  </td>
                  <td style={styles.td}>
                    <span style={{ color: 'var(--app-muted)', fontSize: '0.85rem' }}>{u.email}</span>
                  </td>
                  <td style={styles.td}>
                    <div style={{ display: 'flex', flexWrap: 'wrap', gap: 4 }}>
                      {u.roles.map((r) => {
                        const role = r as Role;
                        const color = ROLE_COLOR[role] ?? '#64748b';
                        return (
                          <span key={r} style={{ ...styles.roleTag, background: `${color}15`, color }}>
                            {ROLE_LABELS[role] ?? r}
                          </span>
                        );
                      })}
                    </div>
                  </td>
                  <td style={styles.td}>
                    <span style={{ ...styles.statusPill, background: u.isActive ? 'rgba(34,197,94,0.12)' : 'rgba(148,163,184,0.15)', color: u.isActive ? '#166534' : '#475569' }}>
                      {u.isActive ? '● Activo' : '○ Inactivo'}
                    </span>
                  </td>
                  <td style={styles.td}>
                    <span style={{ color: 'var(--app-muted)', fontSize: '0.82rem' }}>{formatDate(u.createdAt)}</span>
                  </td>
                  <td style={styles.tdRight}>
                    <button className="app-button" onClick={() => setModal({ mode: 'edit', user: u })}>
                      Editar
                    </button>
                    {u.isActive && (
                      <button
                        className="app-button"
                        onClick={() => handleDeactivate(u)}
                        style={{ marginLeft: 6, color: 'var(--app-danger)' }}
                      >
                        Desactivar
                      </button>
                    )}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </div>

      {/* Modal */}
      {modal && (
        <UserModal
          mode={modal.mode}
          user={modal.mode === 'edit' ? modal.user : undefined}
          onClose={() => setModal(null)}
          onSaved={() => { setModal(null); load(); }}
        />
      )}
    </div>
  );
}

// ---------------------------------------------------------------------------
// User Modal (create / edit)
// ---------------------------------------------------------------------------

interface UserModalProps {
  mode: 'create' | 'edit';
  user?: UserProfile;
  onClose: () => void;
  onSaved: () => void;
}

function UserModal({ mode, user, onClose, onSaved }: UserModalProps) {
  const [email, setEmail] = useState(user?.email ?? '');
  const [displayName, setDisplayName] = useState(user?.displayName ?? '');
  const [roles, setRoles] = useState<Role[]>((user?.roles as Role[]) ?? []);
  const [isActive, setIsActive] = useState(user?.isActive ?? true);
  const [password, setPassword] = useState('');
  const [submitting, setSubmitting] = useState(false);
  const [formError, setFormError] = useState('');

  const toggleRole = (r: Role) => {
    setRoles((prev) => (prev.includes(r) ? prev.filter((x) => x !== r) : [...prev, r]));
  };

  const pwIssues = password ? passwordIssues(password) : [];

  const handleSubmit = async () => {
    setFormError('');

    if (!displayName.trim()) return setFormError('El nombre es obligatorio.');
    if (roles.length === 0) return setFormError('Selecciona al menos un rol.');

    if (mode === 'create') {
      if (!email.trim()) return setFormError('El email es obligatorio.');
      if (pwIssues.length > 0) return setFormError(`La contraseña debe tener ${pwIssues.join(', ')}.`);
    }

    setSubmitting(true);
    try {
      if (mode === 'create') {
        const payload: CreateUserPayload = {
          email: email.trim(),
          displayName: displayName.trim(),
          roles,
          password,
        };
        await createUser(payload);
      } else if (user) {
        const payload: UpdateUserPayload = {
          displayName: displayName.trim(),
          roles,
          isActive,
        };
        await updateUser(user.id, payload);
      }
      onSaved();
    } catch (err) {
      const e = err as { response?: { data?: { error?: { message?: string } } } };
      setFormError(e.response?.data?.error?.message ?? 'No se pudo guardar el usuario.');
    } finally {
      setSubmitting(false);
    }
  };

  return (
    <div className="app-modal-backdrop" onClick={onClose}>
      <div
        className="app-modal"
        style={{ width: 'min(94vw, 620px)' }}
        onClick={(e) => e.stopPropagation()}
      >
        <h2 className="app-card-title" style={{ margin: 0 }}>
          {mode === 'create' ? 'Nuevo usuario' : `Editar: ${user?.displayName}`}
        </h2>

        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 12, marginTop: 16 }}>
          <div>
            <label className="app-label">Nombre completo *</label>
            <input
              className="app-input"
              value={displayName}
              onChange={(e) => setDisplayName(e.target.value)}
              placeholder="Ej. Juan Camilo Henao"
            />
          </div>
          <div>
            <label className="app-label">Email *</label>
            <input
              className="app-input"
              type="email"
              value={email}
              disabled={mode === 'edit'}
              onChange={(e) => setEmail(e.target.value)}
              placeholder="usuario@empresa.com"
            />
            {mode === 'edit' && (
              <div style={{ fontSize: '0.72rem', color: 'var(--app-muted)', marginTop: 4 }}>
                El email no se puede modificar.
              </div>
            )}
          </div>
        </div>

        {mode === 'create' && (
          <div style={{ marginTop: 12 }}>
            <label className="app-label">Contraseña temporal *</label>
            <input
              className="app-input"
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              placeholder="Mínimo 12 caracteres con mayúscula, minúscula, dígito y especial"
            />
            {password && pwIssues.length > 0 && (
              <div style={{ fontSize: '0.75rem', color: 'var(--app-warm)', marginTop: 4 }}>
                Falta: {pwIssues.join(', ')}
              </div>
            )}
            {password && pwIssues.length === 0 && (
              <div style={{ fontSize: '0.75rem', color: '#16a34a', marginTop: 4 }}>
                ✓ Contraseña válida
              </div>
            )}
          </div>
        )}

        {mode === 'edit' && (
          <div style={{ marginTop: 12 }}>
            <label className="app-label">Estado</label>
            <div style={{ display: 'flex', gap: 12, marginTop: 4 }}>
              <label style={{ display: 'flex', gap: 6, alignItems: 'center', cursor: 'pointer' }}>
                <input type="radio" checked={isActive} onChange={() => setIsActive(true)} />
                Activo
              </label>
              <label style={{ display: 'flex', gap: 6, alignItems: 'center', cursor: 'pointer' }}>
                <input type="radio" checked={!isActive} onChange={() => setIsActive(false)} />
                Inactivo
              </label>
            </div>
          </div>
        )}

        <div style={{ marginTop: 18 }}>
          <label className="app-label">Roles * ({roles.length} seleccionado{roles.length !== 1 ? 's' : ''})</label>
          <div style={styles.rolePicker}>
            {ROLE_ORDER.map((r) => {
              const checked = roles.includes(r);
              const color = ROLE_COLOR[r];
              return (
                <label
                  key={r}
                  style={{
                    ...styles.rolePickerItem,
                    borderColor: checked ? color : 'var(--app-border)',
                    background: checked ? `${color}10` : 'transparent',
                  }}
                >
                  <input
                    type="checkbox"
                    checked={checked}
                    onChange={() => toggleRole(r)}
                    style={{ marginRight: 8 }}
                  />
                  <div style={{ flex: 1 }}>
                    <div style={{ fontWeight: 500, fontSize: '0.88rem' }}>{ROLE_LABELS[r]}</div>
                    <div style={{ fontSize: '0.72rem', color: 'var(--app-muted)', marginTop: 2 }}>
                      {ROLE_DESCRIPTIONS[r]}
                    </div>
                  </div>
                </label>
              );
            })}
          </div>
        </div>

        {formError && <div style={styles.errorBanner}>{formError}</div>}

        <div style={styles.modalActions}>
          <button className="app-button" onClick={onClose} disabled={submitting}>Cancelar</button>
          <button
            className="app-button app-button-primary"
            onClick={handleSubmit}
            disabled={submitting}
          >
            {submitting ? 'Guardando...' : mode === 'create' ? 'Crear usuario' : 'Guardar cambios'}
          </button>
        </div>
      </div>
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
  roleGrid: {
    display: 'grid',
    gridTemplateColumns: 'repeat(auto-fill, minmax(230px, 1fr))',
    gap: 10,
    marginBottom: 20,
  },
  roleCard: {
    textAlign: 'left',
    background: 'var(--app-surface)',
    border: '1px solid var(--app-border)',
    borderRadius: 10,
    padding: 12,
    cursor: 'pointer',
    transition: 'all 0.15s',
  },
  roleCardHead: {
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 6,
  },
  roleDot: {
    width: 10,
    height: 10,
    borderRadius: 999,
  },
  roleCount: {
    fontSize: '1.2rem',
    fontWeight: 700,
    color: 'var(--app-text)',
  },
  roleName: {
    fontSize: '0.92rem',
    fontWeight: 600,
    marginBottom: 4,
  },
  roleDesc: {
    fontSize: '0.74rem',
    color: 'var(--app-muted)',
    lineHeight: 1.4,
  },
  filterBar: {
    display: 'flex',
    gap: 10,
    alignItems: 'center',
    flexWrap: 'wrap',
    marginBottom: 14,
  },
  tableCard: {
    background: 'var(--app-surface)',
    border: '1px solid var(--app-border)',
    borderRadius: 12,
    overflow: 'hidden',
  },
  table: {
    width: '100%',
    borderCollapse: 'collapse',
    fontSize: '0.9rem',
  },
  th: {
    textAlign: 'left',
    padding: '12px 16px',
    fontSize: '0.72rem',
    fontWeight: 600,
    color: 'var(--app-muted)',
    letterSpacing: '0.04em',
    textTransform: 'uppercase',
    borderBottom: '1px solid var(--app-border)',
  },
  thRight: {
    textAlign: 'right',
    padding: '12px 16px',
    fontSize: '0.72rem',
    fontWeight: 600,
    color: 'var(--app-muted)',
    letterSpacing: '0.04em',
    textTransform: 'uppercase',
    borderBottom: '1px solid var(--app-border)',
  },
  tr: {
    borderBottom: '1px solid var(--app-border)',
  },
  td: {
    padding: '12px 16px',
    verticalAlign: 'middle',
  },
  tdRight: {
    padding: '12px 16px',
    textAlign: 'right',
    whiteSpace: 'nowrap',
  },
  avatar: {
    width: 34,
    height: 34,
    borderRadius: 999,
    background: 'linear-gradient(135deg, var(--app-accent) 0%, #8b5cf6 100%)',
    color: '#fff',
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
    fontSize: '0.8rem',
    fontWeight: 600,
  },
  roleTag: {
    padding: '2px 8px',
    borderRadius: 999,
    fontSize: '0.72rem',
    fontWeight: 500,
  },
  statusPill: {
    padding: '3px 10px',
    borderRadius: 999,
    fontSize: '0.72rem',
    fontWeight: 600,
  },
  rolePicker: {
    display: 'grid',
    gridTemplateColumns: '1fr 1fr',
    gap: 8,
    maxHeight: 300,
    overflowY: 'auto',
    padding: 4,
  },
  rolePickerItem: {
    display: 'flex',
    alignItems: 'flex-start',
    padding: 10,
    border: '1px solid var(--app-border)',
    borderRadius: 8,
    cursor: 'pointer',
    transition: 'all 0.15s',
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
