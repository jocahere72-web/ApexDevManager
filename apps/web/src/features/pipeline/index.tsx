import { useState, useMemo } from 'react';
import { useAuth } from '@/hooks/useAuth';
import {
  fetchIssues,
  fetchIssueStats,
  ISSUE_STATUSES,
  STATUS_LABELS,
  type IssueStatus,
  type IssuePriority,
  type IssueSummary,
} from '@/services/issues.api';
import { useQuery } from '@tanstack/react-query';
import IssueWorkspace from './components/IssueWorkspace';

// ── Constants ──────────────────────────────────────────────────────────────

const PRIORITY_COLORS: Record<IssuePriority, string> = {
  critical: '#dc2626',
  high: '#ea580c',
  medium: '#ca8a04',
  low: '#16a34a',
};

const STATUS_COLORS: Record<IssueStatus, string> = {
  draft: '#6b7280',
  validation: '#8b5cf6',
  intake: '#3b82f6',
  prd: '#0891b2',
  prd_approval: '#d97706',
  design: '#7c3aed',
  build: '#0f766e',
  test: '#ea580c',
  docs: '#2563eb',
  done: '#16a34a',
};

type ViewMode = 'kanban' | 'list' | 'my-panel';

// ── Role helpers ───────────────────────────────────────────────────────────

function getUserPrimaryRole(roles: string[]): string {
  const priority = ['admin', 'ops_lead', 'tech_lead', 'developer', 'qa_analyst', 'dba'];
  for (const r of priority) {
    if (roles.includes(r)) return r;
  }
  return roles[0] ?? 'developer';
}

function getActionableStatuses(role: string): IssueStatus[] {
  switch (role) {
    case 'ops_lead': return ['draft', 'prd_approval'];
    case 'tech_lead': return ['intake', 'prd_approval'];
    case 'developer': return ['prd', 'design', 'build', 'docs'];
    case 'qa_analyst': return ['test'];
    case 'dba': return ['design'];
    case 'admin': return [...ISSUE_STATUSES];
    default: return [];
  }
}

function getRolePanelTitle(role: string): string {
  switch (role) {
    case 'ops_lead': return 'Mis Requerimientos';
    case 'tech_lead': return 'Panel de Desarrollo';
    case 'developer': return 'Mis Issues Asignados';
    case 'qa_analyst': return 'Pruebas Pendientes';
    case 'dba': return 'Cambios de BD Pendientes';
    case 'admin': return 'Panel Administrador';
    default: return 'Mi Panel';
  }
}

// ── Main Component ─────────────────────────────────────────────────────────

export default function PipelinePage() {
  const { user } = useAuth();
  const userRole = getUserPrimaryRole(user?.roles ?? []);
  const [viewMode, setViewMode] = useState<ViewMode>('my-panel');
  const [selectedIssueId, setSelectedIssueId] = useState<string | null>(null);
  const [statusFilter, setStatusFilter] = useState<IssueStatus | ''>('');
  const [search, setSearch] = useState('');

  // Queries
  const issuesQuery = useQuery({
    queryKey: ['issues', 'pipeline', statusFilter, search],
    queryFn: () => fetchIssues({
      status: statusFilter || undefined,
      search: search || undefined,
      assignedTo: (viewMode === 'my-panel' && (userRole === 'developer' || userRole === 'qa_analyst'))
        ? user?.id
        : undefined,
      pageSize: 200,
    }),
  });

  const statsQuery = useQuery({
    queryKey: ['issues', 'stats'],
    queryFn: () => fetchIssueStats(),
  });

  const issues = issuesQuery.data?.data ?? [];
  const stats = statsQuery.data;

  // Filter issues for role-based panel
  const actionableStatuses = getActionableStatuses(userRole);

  const myActionItems = useMemo(() => {
    if (viewMode !== 'my-panel') return [];
    return issues.filter((issue) => {
      if (userRole === 'developer' || userRole === 'qa_analyst') {
        return issue.assignedTo === user?.id && actionableStatuses.includes(issue.status);
      }
      if (userRole === 'ops_lead') {
        return actionableStatuses.includes(issue.status);
      }
      if (userRole === 'tech_lead') {
        return actionableStatuses.includes(issue.status);
      }
      if (userRole === 'dba') {
        return issue.status === 'design';
      }
      return actionableStatuses.includes(issue.status);
    });
  }, [issues, viewMode, userRole, user?.id, actionableStatuses]);

  const issuesByStatus = useMemo(() => {
    const map: Record<string, IssueSummary[]> = {};
    for (const s of ISSUE_STATUSES) map[s] = [];
    for (const issue of issues) {
      if (map[issue.status]) map[issue.status].push(issue);
    }
    return map;
  }, [issues]);

  // If an issue is selected, show the workspace
  if (selectedIssueId) {
    return (
      <IssueWorkspace
        issueId={selectedIssueId}
        userRole={userRole}
        userId={user?.id ?? ''}
        onBack={() => setSelectedIssueId(null)}
      />
    );
  }

  return (
    <div className="app-page">
      <div className="app-page-header">
        <div>
          <h1 className="app-page-title">Pipeline</h1>
          <p className="app-page-subtitle">Flujo completo de requerimientos a entrega</p>
        </div>
        <div style={{ display: 'flex', gap: '0.5rem', alignItems: 'center' }}>
          <button
            type="button"
            className={`app-button ${viewMode === 'my-panel' ? 'app-button-primary' : ''}`}
            onClick={() => setViewMode('my-panel')}
          >
            Mi Panel
          </button>
          <button
            type="button"
            className={`app-button ${viewMode === 'kanban' ? 'app-button-primary' : ''}`}
            onClick={() => setViewMode('kanban')}
          >
            Kanban
          </button>
          <button
            type="button"
            className={`app-button ${viewMode === 'list' ? 'app-button-primary' : ''}`}
            onClick={() => setViewMode('list')}
          >
            Lista
          </button>
        </div>
      </div>

      {/* Stats bar */}
      {stats && (
        <div style={{ display: 'flex', gap: '0.5rem', flexWrap: 'wrap', marginBottom: '1.5rem' }}>
          {ISSUE_STATUSES.map((s) => (
            <button
              key={s}
              type="button"
              onClick={() => setStatusFilter(statusFilter === s ? '' : s)}
              style={{
                display: 'flex',
                alignItems: 'center',
                gap: '0.4rem',
                padding: '0.35rem 0.75rem',
                borderRadius: '999px',
                border: statusFilter === s ? `2px solid ${STATUS_COLORS[s]}` : '1px solid var(--app-border)',
                background: statusFilter === s ? `${STATUS_COLORS[s]}15` : 'var(--app-surface)',
                cursor: 'pointer',
                fontSize: '0.8rem',
                fontWeight: statusFilter === s ? 600 : 400,
                color: statusFilter === s ? STATUS_COLORS[s] : 'var(--app-text-secondary)',
              }}
            >
              <span style={{
                width: 8, height: 8, borderRadius: '50%',
                background: STATUS_COLORS[s],
              }} />
              {STATUS_LABELS[s]}
              <strong style={{ color: 'var(--app-text)' }}>
                {stats.byStatus?.[s] ?? 0}
              </strong>
            </button>
          ))}
        </div>
      )}

      {/* Search bar */}
      <div style={{ marginBottom: '1rem' }}>
        <input
          type="text"
          className="app-input"
          placeholder="Buscar por código, título..."
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          style={{ maxWidth: '400px' }}
        />
      </div>

      {/* View content */}
      {viewMode === 'my-panel' && (
        <MyPanelView
          role={userRole}
          actionItems={myActionItems}
          allIssues={issues}
          userId={user?.id ?? ''}
          onSelectIssue={setSelectedIssueId}
        />
      )}

      {viewMode === 'kanban' && (
        <KanbanView
          issuesByStatus={issuesByStatus}
          onSelectIssue={setSelectedIssueId}
        />
      )}

      {viewMode === 'list' && (
        <ListView
          issues={issues}
          onSelectIssue={setSelectedIssueId}
        />
      )}
    </div>
  );
}

// ── My Panel View ──────────────────────────────────────────────────────────

function MyPanelView({
  role,
  actionItems,
  allIssues,
  userId,
  onSelectIssue,
}: {
  role: string;
  actionItems: IssueSummary[];
  allIssues: IssueSummary[];
  userId: string;
  onSelectIssue: (id: string) => void;
}) {
  const inProgressIssues = allIssues.filter(
    (i) => i.status !== 'done' && i.status !== 'draft' && !actionItems.find((a) => a.id === i.id),
  );

  return (
    <div>
      <h2 style={{ fontSize: '1.1rem', fontWeight: 600, marginBottom: '1rem', color: 'var(--app-text)' }}>
        {getRolePanelTitle(role)}
      </h2>

      {/* Action items */}
      <div className="app-card" style={{ marginBottom: '1.5rem' }}>
        <div style={{ padding: '0.75rem 1rem', borderBottom: '1px solid var(--app-border)' }}>
          <h3 style={{ fontSize: '0.9rem', fontWeight: 600, color: 'var(--app-accent)' }}>
            Pendientes de mi acción ({actionItems.length})
          </h3>
        </div>
        {actionItems.length === 0 ? (
          <div style={{ padding: '2rem', textAlign: 'center', color: 'var(--app-text-secondary)' }}>
            No hay items pendientes de tu acción.
          </div>
        ) : (
          <div>
            {actionItems.map((issue) => (
              <IssueRow key={issue.id} issue={issue} onSelect={onSelectIssue} />
            ))}
          </div>
        )}
      </div>

      {/* In progress */}
      {inProgressIssues.length > 0 && (
        <div className="app-card">
          <div style={{ padding: '0.75rem 1rem', borderBottom: '1px solid var(--app-border)' }}>
            <h3 style={{ fontSize: '0.9rem', fontWeight: 600, color: 'var(--app-text-secondary)' }}>
              En progreso ({inProgressIssues.length})
            </h3>
          </div>
          <div>
            {inProgressIssues.slice(0, 10).map((issue) => (
              <IssueRow key={issue.id} issue={issue} onSelect={onSelectIssue} />
            ))}
          </div>
        </div>
      )}
    </div>
  );
}

// ── Kanban View ────────────────────────────────────────────────────────────

function KanbanView({
  issuesByStatus,
  onSelectIssue,
}: {
  issuesByStatus: Record<string, IssueSummary[]>;
  onSelectIssue: (id: string) => void;
}) {
  return (
    <div style={{
      display: 'flex',
      gap: '0.75rem',
      overflowX: 'auto',
      paddingBottom: '1rem',
    }}>
      {ISSUE_STATUSES.map((status) => (
        <div
          key={status}
          style={{
            minWidth: '220px',
            maxWidth: '260px',
            flex: '0 0 auto',
          }}
        >
          <div style={{
            display: 'flex',
            alignItems: 'center',
            gap: '0.4rem',
            padding: '0.5rem 0.75rem',
            marginBottom: '0.5rem',
            borderRadius: '0.5rem',
            background: `${STATUS_COLORS[status]}12`,
            borderLeft: `3px solid ${STATUS_COLORS[status]}`,
          }}>
            <span style={{ fontSize: '0.8rem', fontWeight: 600, color: STATUS_COLORS[status] }}>
              {STATUS_LABELS[status]}
            </span>
            <span style={{
              fontSize: '0.7rem',
              background: STATUS_COLORS[status],
              color: '#fff',
              borderRadius: '999px',
              padding: '0.1rem 0.4rem',
              fontWeight: 700,
            }}>
              {issuesByStatus[status]?.length ?? 0}
            </span>
          </div>
          <div style={{ display: 'flex', flexDirection: 'column', gap: '0.4rem' }}>
            {(issuesByStatus[status] ?? []).map((issue) => (
              <button
                key={issue.id}
                type="button"
                onClick={() => onSelectIssue(issue.id)}
                className="app-card"
                style={{
                  padding: '0.6rem 0.75rem',
                  cursor: 'pointer',
                  textAlign: 'left',
                  border: '1px solid var(--app-border)',
                  width: '100%',
                  background: 'var(--app-surface)',
                }}
              >
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '0.3rem' }}>
                  <span style={{ fontSize: '0.7rem', fontWeight: 700, color: 'var(--app-text-secondary)' }}>
                    {issue.code}
                  </span>
                  <span style={{
                    width: 8, height: 8, borderRadius: '50%',
                    background: PRIORITY_COLORS[issue.priority],
                  }} />
                </div>
                <div style={{ fontSize: '0.8rem', fontWeight: 500, color: 'var(--app-text)', lineHeight: 1.3 }}>
                  {issue.title.length > 60 ? issue.title.slice(0, 60) + '...' : issue.title}
                </div>
                {issue.assignedToName && (
                  <div style={{ fontSize: '0.7rem', color: 'var(--app-text-secondary)', marginTop: '0.3rem' }}>
                    {issue.assignedToName}
                  </div>
                )}
              </button>
            ))}
          </div>
        </div>
      ))}
    </div>
  );
}

// ── List View ──────────────────────────────────────────────────────────────

function ListView({
  issues,
  onSelectIssue,
}: {
  issues: IssueSummary[];
  onSelectIssue: (id: string) => void;
}) {
  return (
    <div className="app-card">
      <table style={{ width: '100%', borderCollapse: 'collapse', fontSize: '0.85rem' }}>
        <thead>
          <tr style={{ borderBottom: '2px solid var(--app-border)' }}>
            <th style={{ textAlign: 'left', padding: '0.6rem 0.75rem', fontWeight: 600 }}>Código</th>
            <th style={{ textAlign: 'left', padding: '0.6rem 0.75rem', fontWeight: 600 }}>Título</th>
            <th style={{ textAlign: 'left', padding: '0.6rem 0.75rem', fontWeight: 600 }}>Estado</th>
            <th style={{ textAlign: 'left', padding: '0.6rem 0.75rem', fontWeight: 600 }}>Prioridad</th>
            <th style={{ textAlign: 'left', padding: '0.6rem 0.75rem', fontWeight: 600 }}>Asignado a</th>
            <th style={{ textAlign: 'left', padding: '0.6rem 0.75rem', fontWeight: 600 }}>Cliente</th>
          </tr>
        </thead>
        <tbody>
          {issues.map((issue) => (
            <tr
              key={issue.id}
              onClick={() => onSelectIssue(issue.id)}
              style={{ borderBottom: '1px solid var(--app-border)', cursor: 'pointer' }}
              onMouseOver={(e) => (e.currentTarget.style.background = 'var(--app-soft)')}
              onMouseOut={(e) => (e.currentTarget.style.background = '')}
            >
              <td style={{ padding: '0.5rem 0.75rem', fontWeight: 700, fontFamily: 'monospace', fontSize: '0.8rem' }}>
                {issue.code}
              </td>
              <td style={{ padding: '0.5rem 0.75rem' }}>
                {issue.title.length > 80 ? issue.title.slice(0, 80) + '...' : issue.title}
              </td>
              <td style={{ padding: '0.5rem 0.75rem' }}>
                <span style={{
                  display: 'inline-flex',
                  alignItems: 'center',
                  gap: '0.3rem',
                  padding: '0.15rem 0.5rem',
                  borderRadius: '999px',
                  fontSize: '0.75rem',
                  fontWeight: 600,
                  background: `${STATUS_COLORS[issue.status]}15`,
                  color: STATUS_COLORS[issue.status],
                }}>
                  <span style={{ width: 6, height: 6, borderRadius: '50%', background: STATUS_COLORS[issue.status] }} />
                  {STATUS_LABELS[issue.status]}
                </span>
              </td>
              <td style={{ padding: '0.5rem 0.75rem' }}>
                <span style={{
                  display: 'inline-block',
                  width: 8, height: 8, borderRadius: '50%',
                  background: PRIORITY_COLORS[issue.priority],
                  marginRight: '0.4rem',
                }} />
                {issue.priority}
              </td>
              <td style={{ padding: '0.5rem 0.75rem', color: 'var(--app-text-secondary)' }}>
                {issue.assignedToName ?? '—'}
              </td>
              <td style={{ padding: '0.5rem 0.75rem', color: 'var(--app-text-secondary)' }}>
                {issue.clientName}
              </td>
            </tr>
          ))}
        </tbody>
      </table>
      {issues.length === 0 && (
        <div style={{ padding: '2rem', textAlign: 'center', color: 'var(--app-text-secondary)' }}>
          No se encontraron issues.
        </div>
      )}
    </div>
  );
}

// ── Shared: Issue Row ──────────────────────────────────────────────────────

function IssueRow({
  issue,
  onSelect,
}: {
  issue: IssueSummary;
  onSelect: (id: string) => void;
}) {
  return (
    <button
      type="button"
      onClick={() => onSelect(issue.id)}
      style={{
        display: 'flex',
        alignItems: 'center',
        gap: '0.75rem',
        width: '100%',
        padding: '0.75rem 1rem',
        border: 'none',
        borderBottom: '1px solid var(--app-border)',
        background: 'transparent',
        cursor: 'pointer',
        textAlign: 'left',
      }}
      onMouseOver={(e) => (e.currentTarget.style.background = 'var(--app-soft)')}
      onMouseOut={(e) => (e.currentTarget.style.background = 'transparent')}
    >
      <span style={{
        fontFamily: 'monospace',
        fontSize: '0.8rem',
        fontWeight: 700,
        color: 'var(--app-text-secondary)',
        minWidth: '80px',
      }}>
        {issue.code}
      </span>
      <span style={{ flex: 1, fontSize: '0.85rem', fontWeight: 500, color: 'var(--app-text)' }}>
        {issue.title}
      </span>
      <span style={{
        display: 'inline-flex',
        alignItems: 'center',
        gap: '0.3rem',
        padding: '0.15rem 0.5rem',
        borderRadius: '999px',
        fontSize: '0.7rem',
        fontWeight: 600,
        background: `${STATUS_COLORS[issue.status]}15`,
        color: STATUS_COLORS[issue.status],
      }}>
        <span style={{ width: 6, height: 6, borderRadius: '50%', background: STATUS_COLORS[issue.status] }} />
        {STATUS_LABELS[issue.status]}
      </span>
      <span style={{
        display: 'inline-block',
        width: 8, height: 8, borderRadius: '50%',
        background: PRIORITY_COLORS[issue.priority],
      }} />
      {issue.assignedToName && (
        <span style={{ fontSize: '0.75rem', color: 'var(--app-text-secondary)', minWidth: '80px', textAlign: 'right' }}>
          {issue.assignedToName}
        </span>
      )}
    </button>
  );
}
