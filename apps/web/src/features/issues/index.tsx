import { useState, useEffect, useCallback } from 'react';
import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import {
  fetchIssues,
  createIssue,
  ISSUE_STATUSES,
  STATUS_LABELS,
  type IssueSummary,
  type IssueStatus,
  type IssuePriority,
  type IssueType,
  type IssueFilters,
  type IssuePayload,
} from '@/services/issues.api';
import { fetchClients, type ClientSummary } from '@/services/clients.api';
import IssueCard from './components/IssueCard';
import IssueDetail from './components/IssueDetail';

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

const PRIORITY_OPTIONS: IssuePriority[] = ['critical', 'high', 'medium', 'low'];
const TYPE_OPTIONS: IssueType[] = ['feature', 'bug', 'enhancement', 'task'];

const PRIORITY_DOT: Record<IssuePriority, string> = {
  critical: 'var(--app-danger)',
  high: 'var(--app-warm)',
  medium: 'var(--app-accent)',
  low: 'var(--app-muted)',
};

const STATUS_COL_COLORS: Record<IssueStatus, string> = {
  intake: '#6366f1',
  prd: '#8b5cf6',
  design: '#a855f7',
  build: '#3b82f6',
  review: '#f59e0b',
  test: '#14b8a6',
  deploy: '#f97316',
  done: 'var(--app-success)',
};

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export default function IssuesPage() {
  const [issues, setIssues] = useState<IssueSummary[]>([]);
  const [clients, setClients] = useState<ClientSummary[]>([]);
  const [loading, setLoading] = useState(true);

  // Filters
  const [search, setSearch] = useState('');
  const [debouncedSearch, setDebouncedSearch] = useState('');
  const [filterClient, setFilterClient] = useState('');
  const [filterStatus, setFilterStatus] = useState<IssueStatus | ''>('');
  const [filterPriority, setFilterPriority] = useState<IssuePriority | ''>('');

  // View
  const [view, setView] = useState<'kanban' | 'list'>('kanban');
  const [selectedIssueId, setSelectedIssueId] = useState<string | null>(null);

  // New issue modal
  const [modalOpen, setModalOpen] = useState(false);
  const [formTitle, setFormTitle] = useState('');
  const [formDescription, setFormDescription] = useState('');
  const [formClientId, setFormClientId] = useState('');
  const [formPriority, setFormPriority] = useState<IssuePriority>('medium');
  const [formType, setFormType] = useState<IssueType>('task');

  const debouncedSetSearch = useCallback(
    debounce((...args: unknown[]) => setDebouncedSearch(args[0] as string), 300),
    [],
  );

  const loadIssues = useCallback(async () => {
    setLoading(true);
    try {
      const filters: IssueFilters = { pageSize: 500 };
      if (debouncedSearch) filters.search = debouncedSearch;
      if (filterClient) filters.clientId = filterClient;
      if (filterStatus) filters.status = filterStatus;
      if (filterPriority) filters.priority = filterPriority;
      const result = await fetchIssues(filters);
      setIssues(result.data);
    } catch (err) {
      console.error('Failed to load issues', err);
    } finally {
      setLoading(false);
    }
  }, [debouncedSearch, filterClient, filterStatus, filterPriority]);

  useEffect(() => {
    loadIssues();
  }, [loadIssues]);

  useEffect(() => {
    fetchClients({ pageSize: 200 })
      .then((r) => setClients(r.data))
      .catch(() => {});
  }, []);

  // Group by status for kanban
  const grouped = ISSUE_STATUSES.reduce<Record<IssueStatus, IssueSummary[]>>(
    (acc, status) => {
      acc[status] = [];
      return acc;
    },
    {} as Record<IssueStatus, IssueSummary[]>,
  );
  issues.forEach((issue) => {
    if (grouped[issue.status]) grouped[issue.status].push(issue);
  });

  const openNewIssue = () => {
    setFormTitle('');
    setFormDescription('');
    setFormClientId(clients[0]?.id ?? '');
    setFormPriority('medium');
    setFormType('task');
    setModalOpen(true);
  };

  const handleCreateIssue = async () => {
    if (!formTitle.trim() || !formClientId) return;
    const payload: IssuePayload = {
      clientId: formClientId,
      title: formTitle,
      description: formDescription || undefined,
      priority: formPriority,
      type: formType,
    };
    try {
      await createIssue(payload);
      setModalOpen(false);
      loadIssues();
    } catch (err) {
      console.error('Failed to create issue', err);
    }
  };

  const handleCardClick = (issue: IssueSummary) => {
    setSelectedIssueId(issue.id);
  };

  // ---------------------------------------------------------------------------
  // Render
  // ---------------------------------------------------------------------------

  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow="Delivery"
        title="Issues"
        description="Plan, prioritize, and move work through the delivery pipeline."
        actions={
          <>
            <div className="app-tabs" style={{ marginBottom: 0, padding: 3 }}>
              <button
                onClick={() => setView('kanban')}
                className={`app-tab${view === 'kanban' ? ' app-tab-active' : ''}`}
              >
                Kanban
              </button>
              <button
                onClick={() => setView('list')}
                className={`app-tab${view === 'list' ? ' app-tab-active' : ''}`}
              >
                List
              </button>
            </div>
            <button onClick={openNewIssue} className="app-button app-button-primary">
              + New Issue
            </button>
          </>
        }
      />
      <div className="app-workspace" style={{ overflow: 'hidden' }}>
        {/* Main panel */}
        <div
          className="app-workspace-main"
          style={{ display: 'flex', flexDirection: 'column', overflow: 'hidden' }}
        >
          {/* Filter bar */}
          <div
            className="app-toolbar"
            style={{
              padding: '12px',
              borderBottom: '1px solid var(--app-border)',
              marginBottom: 0,
            }}
          >
            <input
              placeholder="Search issues..."
              value={search}
              onChange={(e) => {
                setSearch(e.target.value);
                debouncedSetSearch(e.target.value);
              }}
              className="app-input"
              style={{ width: 'min(100%, 260px)' }}
            />
            <select
              value={filterClient}
              onChange={(e) => setFilterClient(e.target.value)}
              className="app-select"
              style={{ width: 'min(100%, 180px)' }}
            >
              <option value="">All Clients</option>
              {clients.map((c) => (
                <option key={c.id} value={c.id}>
                  {c.name}
                </option>
              ))}
            </select>
            <select
              value={filterStatus}
              onChange={(e) => setFilterStatus(e.target.value as IssueStatus | '')}
              className="app-select"
              style={{ width: 'min(100%, 180px)' }}
            >
              <option value="">All Statuses</option>
              {ISSUE_STATUSES.map((s) => (
                <option key={s} value={s}>
                  {STATUS_LABELS[s]}
                </option>
              ))}
            </select>
            <select
              value={filterPriority}
              onChange={(e) => setFilterPriority(e.target.value as IssuePriority | '')}
              className="app-select"
              style={{ width: 'min(100%, 180px)' }}
            >
              <option value="">All Priorities</option>
              {PRIORITY_OPTIONS.map((p) => (
                <option key={p} value={p}>
                  {p.charAt(0).toUpperCase() + p.slice(1)}
                </option>
              ))}
            </select>
          </div>

          {/* Loading */}
          {loading && (
            <div style={{ padding: '2rem', color: 'var(--app-muted)' }}>Loading issues...</div>
          )}

          {/* Kanban view */}
          {!loading && view === 'kanban' && (
            <div
              style={{
                display: 'flex',
                gap: '12px',
                flex: 1,
                overflowX: 'auto',
                overflowY: 'hidden',
                padding: '12px',
              }}
            >
              {ISSUE_STATUSES.map((status) => {
                const col = grouped[status];
                const colColor = STATUS_COL_COLORS[status];
                return (
                  <div
                    key={status}
                    className="app-card"
                    style={{
                      minWidth: '240px',
                      width: '240px',
                      flexShrink: 0,
                      display: 'flex',
                      flexDirection: 'column',
                      overflow: 'hidden',
                      background: 'var(--app-surface-raised)',
                    }}
                  >
                    {/* Column header */}
                    <div
                      style={{
                        padding: '10px 12px',
                        display: 'flex',
                        justifyContent: 'space-between',
                        alignItems: 'center',
                        borderBottom: `3px solid ${colColor}`,
                      }}
                    >
                      <span
                        style={{
                          fontSize: '0.78rem',
                          fontWeight: 700,
                          color: 'var(--app-text)',
                          textTransform: 'uppercase',
                          letterSpacing: '0.04em',
                        }}
                      >
                        {STATUS_LABELS[status]}
                      </span>
                      <span className="app-status-pill" style={{ padding: '1px 7px' }}>
                        {col.length}
                      </span>
                    </div>

                    {/* Cards */}
                    <div
                      style={{
                        flex: 1,
                        overflowY: 'auto',
                        padding: '8px',
                        display: 'flex',
                        flexDirection: 'column',
                        gap: '8px',
                      }}
                    >
                      {col.length === 0 && (
                        <div
                          style={{
                            fontSize: '0.75rem',
                            color: 'var(--app-muted)',
                            textAlign: 'center',
                            padding: '1.5rem 0',
                          }}
                        >
                          No issues
                        </div>
                      )}
                      {col.map((issue) => (
                        <IssueCard
                          key={issue.id}
                          issue={issue}
                          isSelected={selectedIssueId === issue.id}
                          onClick={handleCardClick}
                        />
                      ))}
                    </div>
                  </div>
                );
              })}
            </div>
          )}

          {/* List view */}
          {!loading && view === 'list' && (
            <div className="app-table-wrap" style={{ flex: 1 }}>
              <table className="app-table">
                <thead>
                  <tr style={{ position: 'sticky', top: 0 }}>
                    {[
                      'Code',
                      'Title',
                      'Client',
                      'Status',
                      'Priority',
                      'Type',
                      'Assigned',
                      'Updated',
                    ].map((header) => (
                      <th key={header}>{header}</th>
                    ))}
                  </tr>
                </thead>
                <tbody>
                  {issues.length === 0 && (
                    <tr>
                      <td
                        colSpan={8}
                        style={{ padding: '2rem', textAlign: 'center', color: 'var(--app-muted)' }}
                      >
                        No issues found.
                      </td>
                    </tr>
                  )}
                  {issues.map((issue) => (
                    <tr
                      key={issue.id}
                      onClick={() => handleCardClick(issue)}
                      className="app-table-row"
                      style={{
                        backgroundColor:
                          selectedIssueId === issue.id ? 'var(--app-accent-soft)' : 'transparent',
                      }}
                    >
                      <td
                        style={{
                          fontFamily: 'monospace',
                          fontWeight: 700,
                          color: 'var(--app-text)',
                          fontSize: '0.75rem',
                        }}
                      >
                        {issue.code}
                      </td>
                      <td
                        style={{
                          maxWidth: '240px',
                          overflow: 'hidden',
                          textOverflow: 'ellipsis',
                          whiteSpace: 'nowrap',
                        }}
                      >
                        {issue.title}
                      </td>
                      <td style={{ color: 'var(--app-muted)' }}>{issue.clientName}</td>
                      <td>
                        <span className="app-status-pill app-status-accent">
                          {STATUS_LABELS[issue.status]}
                        </span>
                      </td>
                      <td>
                        <span style={{ display: 'flex', alignItems: 'center', gap: '5px' }}>
                          <span
                            style={{
                              width: '8px',
                              height: '8px',
                              borderRadius: '50%',
                              backgroundColor: PRIORITY_DOT[issue.priority],
                              display: 'inline-block',
                            }}
                          />
                          <span style={{ textTransform: 'capitalize', fontSize: '0.78rem' }}>
                            {issue.priority}
                          </span>
                        </span>
                      </td>
                      <td style={{ textTransform: 'capitalize' }}>
                        {issue.type}
                      </td>
                      <td style={{ color: 'var(--app-muted)' }}>
                        {issue.assignedToName ?? '--'}
                      </td>
                      <td style={{ color: 'var(--app-muted)', fontSize: '0.75rem' }}>
                        --
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </div>

        {/* Detail sidebar */}
        {selectedIssueId && (
          <div
            className="app-workspace-panel"
            style={{ flex: '0 0 400px', overflowY: 'auto' }}
          >
            <IssueDetail
              issueId={selectedIssueId}
              onClose={() => setSelectedIssueId(null)}
              onUpdated={loadIssues}
            />
          </div>
        )}

        {/* New issue modal */}
        {modalOpen && (
          <div className="app-modal-backdrop" onClick={() => setModalOpen(false)}>
            <div className="app-modal" onClick={(e) => e.stopPropagation()}>
              <h2 className="app-card-title" style={{ marginBottom: '18px' }}>
                New Issue
              </h2>

              <div className="app-field">
                <label className="app-label">Client *</label>
                <select
                  value={formClientId}
                  onChange={(e) => setFormClientId(e.target.value)}
                  className="app-select"
                >
                  <option value="">Select client...</option>
                  {clients.map((c) => (
                    <option key={c.id} value={c.id}>
                      {c.name}
                    </option>
                  ))}
                </select>
              </div>

              <div className="app-field">
                <label className="app-label">Title *</label>
                <input
                  value={formTitle}
                  onChange={(e) => setFormTitle(e.target.value)}
                  className="app-input"
                  placeholder="Issue title"
                />
              </div>

              <div className="app-field">
                <label className="app-label">Description</label>
                <textarea
                  value={formDescription}
                  onChange={(e) => setFormDescription(e.target.value)}
                  rows={3}
                  className="app-textarea"
                  placeholder="Describe the issue..."
                />
              </div>

              <div style={{ display: 'flex', gap: '12px' }}>
                <div className="app-field" style={{ flex: 1 }}>
                  <label className="app-label">Priority</label>
                  <select
                    value={formPriority}
                    onChange={(e) => setFormPriority(e.target.value as IssuePriority)}
                    className="app-select"
                  >
                    {PRIORITY_OPTIONS.map((p) => (
                      <option key={p} value={p}>
                        {p.charAt(0).toUpperCase() + p.slice(1)}
                      </option>
                    ))}
                  </select>
                </div>
                <div className="app-field" style={{ flex: 1 }}>
                  <label className="app-label">Type</label>
                  <select
                    value={formType}
                    onChange={(e) => setFormType(e.target.value as IssueType)}
                    className="app-select"
                  >
                    {TYPE_OPTIONS.map((t) => (
                      <option key={t} value={t}>
                        {t.charAt(0).toUpperCase() + t.slice(1)}
                      </option>
                    ))}
                  </select>
                </div>
              </div>

              <div className="app-toolbar" style={{ justifyContent: 'flex-end', marginTop: '8px' }}>
                <button onClick={() => setModalOpen(false)} className="app-button">
                  Cancel
                </button>
                <button
                  onClick={handleCreateIssue}
                  disabled={!formTitle.trim() || !formClientId}
                  className="app-button app-button-primary"
                  style={{ opacity: !formTitle.trim() || !formClientId ? 0.5 : 1 }}
                >
                  Create Issue
                </button>
              </div>
            </div>
          </div>
        )}
      </div>
    </AppPage>
  );
}
