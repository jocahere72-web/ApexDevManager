import { useState, useEffect, useCallback } from 'react';
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
  critical: '#dc2626',
  high: '#ea580c',
  medium: '#2563eb',
  low: '#9ca3af',
};

const STATUS_COL_COLORS: Record<IssueStatus, string> = {
  intake: '#6366f1',
  prd: '#8b5cf6',
  design: '#a855f7',
  build: '#3b82f6',
  review: '#f59e0b',
  test: '#14b8a6',
  deploy: '#f97316',
  done: '#22c55e',
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

  // eslint-disable-next-line react-hooks/exhaustive-deps
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
  const grouped = ISSUE_STATUSES.reduce<Record<IssueStatus, IssueSummary[]>>((acc, status) => {
    acc[status] = [];
    return acc;
  }, {} as Record<IssueStatus, IssueSummary[]>);
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
  // Styles
  // ---------------------------------------------------------------------------

  const selectStyle: React.CSSProperties = {
    padding: '7px 10px',
    border: '1px solid #d1d5db',
    borderRadius: '6px',
    fontSize: '0.82rem',
    outline: 'none',
    backgroundColor: '#fff',
    boxSizing: 'border-box',
  };

  const searchInputStyle: React.CSSProperties = {
    ...selectStyle,
    width: '220px',
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
    padding: '6px 14px',
    backgroundColor: '#f3f4f6',
    color: '#374151',
    border: '1px solid #d1d5db',
    borderRadius: '6px',
    fontSize: '0.8rem',
    fontWeight: 500,
    cursor: 'pointer',
  };

  const toggleBtn = (active: boolean): React.CSSProperties => ({
    padding: '6px 14px',
    backgroundColor: active ? '#3b82f6' : '#f3f4f6',
    color: active ? '#fff' : '#374151',
    border: active ? '1px solid #3b82f6' : '1px solid #d1d5db',
    borderRadius: '6px',
    fontSize: '0.8rem',
    fontWeight: 600,
    cursor: 'pointer',
  });

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

  // ---------------------------------------------------------------------------
  // Render
  // ---------------------------------------------------------------------------

  return (
    <div style={{ display: 'flex', height: 'calc(100vh - 3.5rem - 3rem)', overflow: 'hidden' }}>
      {/* Main panel */}
      <div style={{ flex: 1, display: 'flex', flexDirection: 'column', overflow: 'hidden' }}>
        {/* Header */}
        <div
          style={{
            padding: '0 0 12px',
            display: 'flex',
            justifyContent: 'space-between',
            alignItems: 'center',
            flexWrap: 'wrap',
            gap: '10px',
          }}
        >
          <h1 style={{ margin: 0, fontSize: '1.5rem', fontWeight: 700, color: '#111827' }}>
            Issues
          </h1>
          <div style={{ display: 'flex', gap: '8px', alignItems: 'center' }}>
            <div style={{ display: 'flex', gap: '0' }}>
              <button
                onClick={() => setView('kanban')}
                style={{
                  ...toggleBtn(view === 'kanban'),
                  borderTopRightRadius: 0,
                  borderBottomRightRadius: 0,
                }}
              >
                Kanban
              </button>
              <button
                onClick={() => setView('list')}
                style={{
                  ...toggleBtn(view === 'list'),
                  borderTopLeftRadius: 0,
                  borderBottomLeftRadius: 0,
                  borderLeft: 'none',
                }}
              >
                List
              </button>
            </div>
            <button onClick={openNewIssue} style={btnPrimary}>
              + New Issue
            </button>
          </div>
        </div>

        {/* Filter bar */}
        <div
          style={{
            display: 'flex',
            gap: '8px',
            flexWrap: 'wrap',
            paddingBottom: '12px',
            borderBottom: '1px solid #e5e7eb',
            marginBottom: '12px',
          }}
        >
          <input
            placeholder="Search issues..."
            value={search}
            onChange={(e) => {
              setSearch(e.target.value);
              debouncedSetSearch(e.target.value);
            }}
            style={searchInputStyle}
          />
          <select
            value={filterClient}
            onChange={(e) => setFilterClient(e.target.value)}
            style={selectStyle}
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
            style={selectStyle}
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
            style={selectStyle}
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
          <div style={{ padding: '2rem', color: '#6b7280' }}>Loading issues...</div>
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
              paddingBottom: '8px',
            }}
          >
            {ISSUE_STATUSES.map((status) => {
              const col = grouped[status];
              const colColor = STATUS_COL_COLORS[status];
              return (
                <div
                  key={status}
                  style={{
                    minWidth: '240px',
                    width: '240px',
                    flexShrink: 0,
                    display: 'flex',
                    flexDirection: 'column',
                    backgroundColor: '#f9fafb',
                    borderRadius: '10px',
                    overflow: 'hidden',
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
                        color: '#374151',
                        textTransform: 'uppercase',
                        letterSpacing: '0.04em',
                      }}
                    >
                      {STATUS_LABELS[status]}
                    </span>
                    <span
                      style={{
                        fontSize: '0.7rem',
                        fontWeight: 600,
                        color: '#6b7280',
                        backgroundColor: '#e5e7eb',
                        padding: '1px 7px',
                        borderRadius: '9999px',
                      }}
                    >
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
                          color: '#d1d5db',
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
          <div style={{ flex: 1, overflowY: 'auto' }}>
            <table
              style={{
                width: '100%',
                borderCollapse: 'collapse',
                fontSize: '0.82rem',
              }}
            >
              <thead>
                <tr
                  style={{
                    borderBottom: '2px solid #e5e7eb',
                    textAlign: 'left',
                    position: 'sticky',
                    top: 0,
                    backgroundColor: '#fff',
                  }}
                >
                  {['Code', 'Title', 'Client', 'Status', 'Priority', 'Type', 'Assigned', 'Updated'].map(
                    (header) => (
                      <th
                        key={header}
                        style={{
                          padding: '8px 10px',
                          fontSize: '0.7rem',
                          fontWeight: 700,
                          color: '#6b7280',
                          textTransform: 'uppercase',
                          letterSpacing: '0.04em',
                        }}
                      >
                        {header}
                      </th>
                    ),
                  )}
                </tr>
              </thead>
              <tbody>
                {issues.length === 0 && (
                  <tr>
                    <td
                      colSpan={8}
                      style={{ padding: '2rem', textAlign: 'center', color: '#9ca3af' }}
                    >
                      No issues found.
                    </td>
                  </tr>
                )}
                {issues.map((issue) => (
                  <tr
                    key={issue.id}
                    onClick={() => handleCardClick(issue)}
                    style={{
                      borderBottom: '1px solid #f3f4f6',
                      cursor: 'pointer',
                      backgroundColor:
                        selectedIssueId === issue.id ? '#eff6ff' : 'transparent',
                    }}
                    onMouseEnter={(e) => {
                      if (selectedIssueId !== issue.id)
                        (e.currentTarget as HTMLTableRowElement).style.backgroundColor = '#f9fafb';
                    }}
                    onMouseLeave={(e) => {
                      if (selectedIssueId !== issue.id)
                        (e.currentTarget as HTMLTableRowElement).style.backgroundColor = 'transparent';
                    }}
                  >
                    <td
                      style={{
                        padding: '8px 10px',
                        fontFamily: 'monospace',
                        fontWeight: 700,
                        color: '#374151',
                        fontSize: '0.75rem',
                      }}
                    >
                      {issue.code}
                    </td>
                    <td
                      style={{
                        padding: '8px 10px',
                        maxWidth: '240px',
                        overflow: 'hidden',
                        textOverflow: 'ellipsis',
                        whiteSpace: 'nowrap',
                      }}
                    >
                      {issue.title}
                    </td>
                    <td style={{ padding: '8px 10px', color: '#6b7280' }}>
                      {issue.clientName}
                    </td>
                    <td style={{ padding: '8px 10px' }}>
                      <span
                        style={{
                          fontSize: '0.65rem',
                          fontWeight: 600,
                          padding: '2px 8px',
                          borderRadius: '9999px',
                          backgroundColor: '#dbeafe',
                          color: '#1d4ed8',
                          textTransform: 'uppercase',
                        }}
                      >
                        {STATUS_LABELS[issue.status]}
                      </span>
                    </td>
                    <td style={{ padding: '8px 10px' }}>
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
                    <td style={{ padding: '8px 10px', textTransform: 'capitalize' }}>
                      {issue.type}
                    </td>
                    <td style={{ padding: '8px 10px', color: '#6b7280' }}>
                      {issue.assignedToName ?? '--'}
                    </td>
                    <td style={{ padding: '8px 10px', color: '#9ca3af', fontSize: '0.75rem' }}>
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
          style={{
            width: '400px',
            minWidth: '360px',
            borderLeft: '1px solid #e5e7eb',
            overflowY: 'auto',
            backgroundColor: '#fff',
          }}
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
        <div
          style={{
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
          }}
          onClick={() => setModalOpen(false)}
        >
          <div
            style={{
              backgroundColor: '#fff',
              borderRadius: '12px',
              padding: '24px',
              width: '460px',
              maxWidth: '90vw',
              maxHeight: '85vh',
              overflowY: 'auto',
              boxShadow: '0 20px 60px rgba(0,0,0,0.2)',
            }}
            onClick={(e) => e.stopPropagation()}
          >
            <h2
              style={{
                margin: '0 0 18px',
                fontSize: '1.15rem',
                fontWeight: 700,
                color: '#111827',
              }}
            >
              New Issue
            </h2>

            <div style={fieldStyle}>
              <label style={labelStyle}>Client *</label>
              <select
                value={formClientId}
                onChange={(e) => setFormClientId(e.target.value)}
                style={inputStyle}
              >
                <option value="">Select client...</option>
                {clients.map((c) => (
                  <option key={c.id} value={c.id}>
                    {c.name}
                  </option>
                ))}
              </select>
            </div>

            <div style={fieldStyle}>
              <label style={labelStyle}>Title *</label>
              <input
                value={formTitle}
                onChange={(e) => setFormTitle(e.target.value)}
                style={inputStyle}
                placeholder="Issue title"
              />
            </div>

            <div style={fieldStyle}>
              <label style={labelStyle}>Description</label>
              <textarea
                value={formDescription}
                onChange={(e) => setFormDescription(e.target.value)}
                rows={3}
                style={{ ...inputStyle, resize: 'vertical' }}
                placeholder="Describe the issue..."
              />
            </div>

            <div style={{ display: 'flex', gap: '12px' }}>
              <div style={{ ...fieldStyle, flex: 1 }}>
                <label style={labelStyle}>Priority</label>
                <select
                  value={formPriority}
                  onChange={(e) => setFormPriority(e.target.value as IssuePriority)}
                  style={inputStyle}
                >
                  {PRIORITY_OPTIONS.map((p) => (
                    <option key={p} value={p}>
                      {p.charAt(0).toUpperCase() + p.slice(1)}
                    </option>
                  ))}
                </select>
              </div>
              <div style={{ ...fieldStyle, flex: 1 }}>
                <label style={labelStyle}>Type</label>
                <select
                  value={formType}
                  onChange={(e) => setFormType(e.target.value as IssueType)}
                  style={inputStyle}
                >
                  {TYPE_OPTIONS.map((t) => (
                    <option key={t} value={t}>
                      {t.charAt(0).toUpperCase() + t.slice(1)}
                    </option>
                  ))}
                </select>
              </div>
            </div>

            <div
              style={{
                display: 'flex',
                justifyContent: 'flex-end',
                gap: '8px',
                marginTop: '8px',
              }}
            >
              <button onClick={() => setModalOpen(false)} style={btnSecondary}>
                Cancel
              </button>
              <button
                onClick={handleCreateIssue}
                disabled={!formTitle.trim() || !formClientId}
                style={{
                  ...btnPrimary,
                  opacity: !formTitle.trim() || !formClientId ? 0.5 : 1,
                  cursor: !formTitle.trim() || !formClientId ? 'not-allowed' : 'pointer',
                }}
              >
                Create Issue
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
