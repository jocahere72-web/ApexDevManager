import { useState, useEffect, useCallback } from 'react';
import { AppEmptyState, AppStatusPill } from '@/components/ui/AppTemplate';
import {
  fetchIssue,
  updateIssue,
  transitionIssue,
  fetchIssueActivities,
  ISSUE_STATUSES,
  STATUS_LABELS,
  type Issue,
  type IssuePriority,
  type IssueType,
  type IssueActivity,
} from '@/services/issues.api';
import IssuePipeline from './IssuePipeline';

interface IssueDetailProps {
  issueId: string;
  onClose: () => void;
  onUpdated: () => void;
}

const PRIORITY_COLORS: Record<string, string> = {
  critical: 'var(--app-danger)',
  high: 'var(--app-warm)',
  medium: 'var(--app-accent-strong)',
  low: 'var(--app-muted)',
};

const ACTIVITY_COLORS: Record<string, string> = {
  status_change: 'var(--app-accent)',
  prd_created: 'var(--app-success, #22c55e)',
  prd_exported: 'var(--app-success, #22c55e)',
  change_set_created: 'var(--app-warm, #f59e0b)',
  release_created: 'var(--app-accent-strong)',
  test_created: 'var(--app-accent)',
  code_edited: 'var(--app-muted)',
  comment: 'var(--app-muted)',
  artifact_linked: 'var(--app-accent-strong)',
};

const ARTIFACT_PATHS: Record<string, string> = {
  prd_session: '/prd',
  change_set: '/change-manager',
  release: '/releases',
  test_suite: '/test-studio',
  conversation: '/ai-studio',
  editor_session: '/code-editor',
};

const TYPE_ICONS: Record<string, string> = {
  feature: '\u2B50',
  bug: '\uD83D\uDC1B',
  enhancement: '\u2728',
  task: '\uD83D\uDCCB',
};

export default function IssueDetail({ issueId, onClose, onUpdated }: IssueDetailProps) {
  const [issue, setIssue] = useState<Issue | null>(null);
  const [loading, setLoading] = useState(true);
  const [editing, setEditing] = useState(false);
  const [advancing, setAdvancing] = useState(false);
  const [activities, setActivities] = useState<IssueActivity[]>([]);

  // Edit form state
  const [editTitle, setEditTitle] = useState('');
  const [editDescription, setEditDescription] = useState('');
  const [editPriority, setEditPriority] = useState<IssuePriority>('medium');
  const [editType, setEditType] = useState<IssueType>('task');
  const [editAssignedTo, setEditAssignedTo] = useState('');

  const loadIssue = useCallback(async () => {
    setLoading(true);
    try {
      const [data, acts] = await Promise.all([fetchIssue(issueId), fetchIssueActivities(issueId)]);
      setIssue(data);
      setActivities(acts);
    } catch (err) {
      console.error('Failed to load issue', err);
    } finally {
      setLoading(false);
    }
  }, [issueId]);

  useEffect(() => {
    loadIssue();
  }, [loadIssue]);

  const startEdit = () => {
    if (!issue) return;
    setEditTitle(issue.title);
    setEditDescription(issue.description ?? '');
    setEditPriority(issue.priority);
    setEditType(issue.type);
    setEditAssignedTo(issue.assignedTo ?? '');
    setEditing(true);
  };

  const saveEdit = async () => {
    if (!issue) return;
    try {
      await updateIssue(issue.id, {
        title: editTitle,
        description: editDescription,
        priority: editPriority,
        type: editType,
        assignedTo: editAssignedTo || null,
      });
      setEditing(false);
      await loadIssue();
      onUpdated();
    } catch (err) {
      console.error('Failed to update issue', err);
    }
  };

  const handleAdvance = async () => {
    if (!issue) return;
    const currentIndex = ISSUE_STATUSES.indexOf(issue.status);
    if (currentIndex >= ISSUE_STATUSES.length - 1) return;
    const nextStatus = ISSUE_STATUSES[currentIndex + 1];
    setAdvancing(true);
    try {
      await transitionIssue(issue.id, nextStatus);
      await loadIssue();
      onUpdated();
    } catch (err) {
      console.error('Failed to advance issue', err);
    } finally {
      setAdvancing(false);
    }
  };

  if (loading) return <AppEmptyState>Loading issue...</AppEmptyState>;

  if (!issue) {
    return <AppEmptyState>Issue not found.</AppEmptyState>;
  }

  const currentIndex = ISSUE_STATUSES.indexOf(issue.status);
  const canAdvance = currentIndex < ISSUE_STATUSES.length - 1;
  const nextStatus = canAdvance ? ISSUE_STATUSES[currentIndex + 1] : null;

  const labelStyle: React.CSSProperties = {
    fontSize: '0.7rem',
    fontWeight: 600,
    color: 'var(--app-muted)',
    textTransform: 'uppercase',
    letterSpacing: '0.04em',
    marginBottom: '2px',
  };

  const valueStyle: React.CSSProperties = {
    fontSize: '0.85rem',
    color: 'var(--app-text)',
  };

  return (
    <div
      style={{
        display: 'flex',
        flexDirection: 'column',
        height: '100%',
        backgroundColor: 'var(--app-surface)',
      }}
    >
      {/* Header */}
      <div
        style={{
          padding: '16px 20px',
          borderBottom: '1px solid var(--app-border)',
          display: 'flex',
          flexDirection: 'column',
          gap: '12px',
        }}
      >
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start' }}>
          <div>
            <div style={{ display: 'flex', alignItems: 'center', gap: '8px', marginBottom: '4px' }}>
              <span
                style={{
                  fontFamily: 'monospace',
                  fontWeight: 700,
                  fontSize: '0.85rem',
                  color: 'var(--app-muted)',
                }}
              >
                {issue.code}
              </span>
              <AppStatusPill tone="accent">{STATUS_LABELS[issue.status]}</AppStatusPill>
            </div>
            {editing ? (
              <input
                value={editTitle}
                onChange={(e) => setEditTitle(e.target.value)}
                className="app-input"
                style={{ fontSize: '1.1rem', fontWeight: 600 }}
              />
            ) : (
              <h2 className="app-card-title" style={{ margin: 0 }}>
                {issue.title}
              </h2>
            )}
          </div>
          <button
            onClick={onClose}
            style={{
              width: 32,
              height: 32,
              border: '1px solid var(--app-border)',
              borderRadius: 'var(--app-radius-sm)',
              background: 'var(--app-surface)',
              color: 'var(--app-muted)',
              cursor: 'pointer',
            }}
          >
            ×
          </button>
        </div>

        {/* Pipeline */}
        <IssuePipeline currentStatus={issue.status} />

        {/* Action buttons */}
        <div className="app-toolbar">
          {canAdvance && (
            <button
              onClick={handleAdvance}
              disabled={advancing}
              className="app-button app-button-primary"
              style={{ opacity: advancing ? 0.6 : 1 }}
            >
              {advancing ? 'Advancing...' : `Advance to ${STATUS_LABELS[nextStatus!]}`}
            </button>
          )}
          {!editing ? (
            <button onClick={startEdit} className="app-button">
              Edit
            </button>
          ) : (
            <>
              <button onClick={saveEdit} className="app-button app-button-primary">
                Save
              </button>
              <button onClick={() => setEditing(false)} className="app-button">
                Cancel
              </button>
            </>
          )}
        </div>
      </div>

      {/* Body */}
      <div style={{ flex: 1, overflowY: 'auto', padding: '16px 20px' }}>
        {/* Info grid */}
        <div
          className="app-responsive-two-column"
          style={{
            display: 'grid',
            gridTemplateColumns: '1fr 1fr',
            gap: '14px',
            marginBottom: '20px',
          }}
        >
          <div>
            <div style={labelStyle}>Client</div>
            <div style={valueStyle}>{issue.clientName}</div>
          </div>
          <div>
            <div style={labelStyle}>Application</div>
            <div style={valueStyle}>
              {issue.appId ? `${issue.appId} - ${issue.appName ?? 'Aplicacion APEX'}` : '--'}
            </div>
          </div>
          <div>
            <div style={labelStyle}>Page</div>
            <div style={valueStyle}>
              {issue.pageId ? `${issue.pageId} - ${issue.pageName ?? 'Sin nombre'}` : '--'}
            </div>
          </div>
          <div>
            <div style={labelStyle}>Priority</div>
            {editing ? (
              <select
                value={editPriority}
                onChange={(e) => setEditPriority(e.target.value as IssuePriority)}
                className="app-select"
              >
                <option value="critical">Critical</option>
                <option value="high">High</option>
                <option value="medium">Medium</option>
                <option value="low">Low</option>
              </select>
            ) : (
              <span
                style={{
                  fontSize: '0.8rem',
                  fontWeight: 600,
                  color: PRIORITY_COLORS[issue.priority],
                  textTransform: 'capitalize',
                }}
              >
                {issue.priority}
              </span>
            )}
          </div>
          <div>
            <div style={labelStyle}>Type</div>
            {editing ? (
              <select
                value={editType}
                onChange={(e) => setEditType(e.target.value as IssueType)}
                className="app-select"
              >
                <option value="feature">Feature</option>
                <option value="bug">Bug</option>
                <option value="enhancement">Enhancement</option>
                <option value="task">Task</option>
              </select>
            ) : (
              <div style={valueStyle}>
                {TYPE_ICONS[issue.type]} {issue.type}
              </div>
            )}
          </div>
          <div>
            <div style={labelStyle}>Assigned To</div>
            {editing ? (
              <input
                value={editAssignedTo}
                onChange={(e) => setEditAssignedTo(e.target.value)}
                placeholder="User ID"
                className="app-input"
              />
            ) : (
              <div style={valueStyle}>{issue.assignedToName ?? 'Unassigned'}</div>
            )}
          </div>
          <div>
            <div style={labelStyle}>Requested By</div>
            <div style={valueStyle}>{issue.requestedBy ?? '--'}</div>
          </div>
          <div>
            <div style={labelStyle}>Tags</div>
            <div style={{ display: 'flex', gap: '4px', flexWrap: 'wrap' }}>
              {issue.tags.length > 0 ? (
                issue.tags.map((tag) => (
                  <span
                    key={tag}
                    style={{
                      fontSize: '0.65rem',
                      padding: '1px 6px',
                      borderRadius: '4px',
                      backgroundColor: 'var(--app-soft)',
                      color: 'var(--app-muted)',
                    }}
                  >
                    {tag}
                  </span>
                ))
              ) : (
                <span style={{ fontSize: '0.8rem', color: 'var(--app-muted)' }}>--</span>
              )}
            </div>
          </div>
        </div>

        {/* Requirement documents */}
        <div style={{ marginBottom: '20px' }}>
          <div style={{ ...labelStyle, marginBottom: '8px' }}>Requirement Document</div>
          {issue.requirementDocuments && issue.requirementDocuments.length > 0 ? (
            <div style={{ display: 'flex', flexDirection: 'column', gap: '6px' }}>
              {issue.requirementDocuments.map((document) => (
                <div
                  key={document.id}
                  style={{
                    display: 'flex',
                    justifyContent: 'space-between',
                    gap: '12px',
                    padding: '8px 10px',
                    backgroundColor: 'var(--app-surface-raised)',
                    borderRadius: 'var(--app-radius-sm)',
                    fontSize: '0.8rem',
                  }}
                >
                  <span style={{ color: 'var(--app-text)' }}>{document.filename}</span>
                  <span style={{ color: 'var(--app-muted)', whiteSpace: 'nowrap' }}>
                    {(document.fileSize / 1024).toFixed(1)} KB
                  </span>
                </div>
              ))}
            </div>
          ) : (
            <p style={{ fontSize: '0.8rem', color: 'var(--app-muted)', margin: 0 }}>
              No requirement document attached.
            </p>
          )}
        </div>

        {/* Description */}
        <div style={{ marginBottom: '20px' }}>
          <div style={labelStyle}>Description</div>
          {editing ? (
            <textarea
              value={editDescription}
              onChange={(e) => setEditDescription(e.target.value)}
              rows={4}
              className="app-textarea"
            />
          ) : (
            <p
              style={{
                fontSize: '0.85rem',
                color: 'var(--app-text)',
                lineHeight: 1.5,
                margin: '4px 0 0',
              }}
            >
              {issue.description || 'No description.'}
            </p>
          )}
        </div>

        {/* Linked Artifacts */}
        <div style={{ marginBottom: '20px' }}>
          <div style={{ ...labelStyle, marginBottom: '8px' }}>Linked Artifacts</div>
          <div style={{ display: 'flex', flexDirection: 'column', gap: '6px' }}>
            {[
              { label: 'PRD Session', value: issue.prdSessionId, path: '/prd' },
              { label: 'Change Set', value: issue.changeSetId, path: '/change-manager' },
              { label: 'Release', value: issue.releaseId, path: '/releases' },
              { label: 'Test Suite', value: issue.testSuiteId, path: '/test-studio' },
            ].map((artifact) => (
              <div
                key={artifact.label}
                style={{
                  display: 'flex',
                  justifyContent: 'space-between',
                  alignItems: 'center',
                  padding: '6px 10px',
                  backgroundColor: 'var(--app-surface-raised)',
                  borderRadius: 'var(--app-radius-sm)',
                  fontSize: '0.8rem',
                }}
              >
                <span style={{ color: 'var(--app-muted)' }}>{artifact.label}</span>
                {artifact.value ? (
                  <a
                    href={`${artifact.path}/${artifact.value}`}
                    style={{
                      color: 'var(--app-accent-strong)',
                      textDecoration: 'none',
                      fontWeight: 600,
                    }}
                  >
                    {artifact.value.slice(0, 8)}...
                  </a>
                ) : (
                  <span style={{ color: 'var(--app-muted)' }}>Not linked</span>
                )}
              </div>
            ))}
          </div>
        </div>

        {/* Activity Timeline */}
        <div>
          <div style={{ ...labelStyle, marginBottom: '8px' }}>Activity</div>
          {activities.length > 0 || (issue.transitions && issue.transitions.length > 0) ? (
            <div style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
              {/* Issue activities from API */}
              {activities.map((a) => (
                <div
                  key={a.id}
                  style={{
                    display: 'flex',
                    alignItems: 'flex-start',
                    gap: '8px',
                    fontSize: '0.78rem',
                    color: 'var(--app-text)',
                  }}
                >
                  <div
                    style={{
                      width: '8px',
                      height: '8px',
                      borderRadius: '50%',
                      backgroundColor: ACTIVITY_COLORS[a.activityType] || 'var(--app-accent)',
                      flexShrink: 0,
                      marginTop: '4px',
                    }}
                  />
                  <div style={{ flex: 1 }}>
                    <span>{a.description}</span>
                    {a.artifactType && a.artifactId && (
                      <a
                        href={
                          ARTIFACT_PATHS[a.artifactType]
                            ? `${ARTIFACT_PATHS[a.artifactType]}/${a.artifactId}`
                            : '#'
                        }
                        style={{
                          marginLeft: '6px',
                          color: 'var(--app-accent-strong)',
                          textDecoration: 'none',
                          fontSize: '0.72rem',
                          fontWeight: 600,
                        }}
                      >
                        View
                      </a>
                    )}
                  </div>
                  <span
                    style={{ color: 'var(--app-muted)', fontSize: '0.7rem', whiteSpace: 'nowrap' }}
                  >
                    {new Date(a.createdAt).toLocaleString()}
                  </span>
                </div>
              ))}
              {/* Legacy transitions */}
              {issue.transitions &&
                issue.transitions.map((t, i) => (
                  <div
                    key={`t-${i}`}
                    style={{
                      display: 'flex',
                      alignItems: 'center',
                      gap: '8px',
                      fontSize: '0.78rem',
                      color: 'var(--app-text)',
                    }}
                  >
                    <div
                      style={{
                        width: '8px',
                        height: '8px',
                        borderRadius: '50%',
                        backgroundColor: 'var(--app-accent)',
                        flexShrink: 0,
                      }}
                    />
                    <span>
                      <strong>{t.by}</strong> moved{' '}
                      {t.from ? (
                        <>
                          from <em>{STATUS_LABELS[t.from]}</em> to{' '}
                        </>
                      ) : (
                        'to '
                      )}
                      <em>{STATUS_LABELS[t.to]}</em>
                    </span>
                    <span
                      style={{ marginLeft: 'auto', color: 'var(--app-muted)', fontSize: '0.7rem' }}
                    >
                      {new Date(t.at).toLocaleString()}
                    </span>
                  </div>
                ))}
            </div>
          ) : (
            <p style={{ fontSize: '0.8rem', color: 'var(--app-muted)', margin: 0 }}>
              No activity yet.
            </p>
          )}
        </div>
      </div>
    </div>
  );
}
