import { useState, useEffect, useCallback } from 'react';
import {
  fetchIssue,
  updateIssue,
  transitionIssue,
  ISSUE_STATUSES,
  STATUS_LABELS,
  type Issue,
  type IssuePriority,
  type IssueType,
} from '@/services/issues.api';
import IssuePipeline from './IssuePipeline';

interface IssueDetailProps {
  issueId: string;
  onClose: () => void;
  onUpdated: () => void;
}

const PRIORITY_COLORS: Record<string, string> = {
  critical: '#dc2626',
  high: '#ea580c',
  medium: '#2563eb',
  low: '#6b7280',
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

  // Edit form state
  const [editTitle, setEditTitle] = useState('');
  const [editDescription, setEditDescription] = useState('');
  const [editPriority, setEditPriority] = useState<IssuePriority>('medium');
  const [editType, setEditType] = useState<IssueType>('task');
  const [editAssignedTo, setEditAssignedTo] = useState('');

  const loadIssue = useCallback(async () => {
    setLoading(true);
    try {
      const data = await fetchIssue(issueId);
      setIssue(data);
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

  if (loading) {
    return (
      <div style={{ padding: '2rem', color: '#6b7280' }}>Loading issue...</div>
    );
  }

  if (!issue) {
    return (
      <div style={{ padding: '2rem', color: '#ef4444' }}>Issue not found.</div>
    );
  }

  const currentIndex = ISSUE_STATUSES.indexOf(issue.status);
  const canAdvance = currentIndex < ISSUE_STATUSES.length - 1;
  const nextStatus = canAdvance ? ISSUE_STATUSES[currentIndex + 1] : null;

  const labelStyle: React.CSSProperties = {
    fontSize: '0.7rem',
    fontWeight: 600,
    color: '#6b7280',
    textTransform: 'uppercase',
    letterSpacing: '0.04em',
    marginBottom: '2px',
  };

  const valueStyle: React.CSSProperties = {
    fontSize: '0.85rem',
    color: '#111827',
  };

  const inputStyle: React.CSSProperties = {
    width: '100%',
    padding: '6px 8px',
    border: '1px solid #d1d5db',
    borderRadius: '6px',
    fontSize: '0.85rem',
    outline: 'none',
    boxSizing: 'border-box',
  };

  return (
    <div
      style={{
        display: 'flex',
        flexDirection: 'column',
        height: '100%',
        backgroundColor: '#ffffff',
      }}
    >
      {/* Header */}
      <div
        style={{
          padding: '16px 20px',
          borderBottom: '1px solid #e5e7eb',
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
                  color: '#4b5563',
                }}
              >
                {issue.code}
              </span>
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
            </div>
            {editing ? (
              <input
                value={editTitle}
                onChange={(e) => setEditTitle(e.target.value)}
                style={{ ...inputStyle, fontSize: '1.1rem', fontWeight: 600 }}
              />
            ) : (
              <h2 style={{ margin: 0, fontSize: '1.1rem', fontWeight: 600, color: '#111827' }}>
                {issue.title}
              </h2>
            )}
          </div>
          <button
            onClick={onClose}
            style={{
              background: 'none',
              border: 'none',
              fontSize: '1.2rem',
              cursor: 'pointer',
              color: '#6b7280',
              padding: '4px',
              lineHeight: 1,
            }}
          >
            ×
          </button>
        </div>

        {/* Pipeline */}
        <IssuePipeline currentStatus={issue.status} />

        {/* Action buttons */}
        <div style={{ display: 'flex', gap: '8px' }}>
          {canAdvance && (
            <button
              onClick={handleAdvance}
              disabled={advancing}
              style={{
                padding: '6px 14px',
                backgroundColor: '#3b82f6',
                color: '#ffffff',
                border: 'none',
                borderRadius: '6px',
                fontSize: '0.8rem',
                fontWeight: 600,
                cursor: advancing ? 'not-allowed' : 'pointer',
                opacity: advancing ? 0.6 : 1,
              }}
            >
              {advancing
                ? 'Advancing...'
                : `Advance to ${STATUS_LABELS[nextStatus!]}`}
            </button>
          )}
          {!editing ? (
            <button
              onClick={startEdit}
              style={{
                padding: '6px 14px',
                backgroundColor: '#f3f4f6',
                color: '#374151',
                border: '1px solid #d1d5db',
                borderRadius: '6px',
                fontSize: '0.8rem',
                fontWeight: 500,
                cursor: 'pointer',
              }}
            >
              Edit
            </button>
          ) : (
            <>
              <button
                onClick={saveEdit}
                style={{
                  padding: '6px 14px',
                  backgroundColor: '#22c55e',
                  color: '#ffffff',
                  border: 'none',
                  borderRadius: '6px',
                  fontSize: '0.8rem',
                  fontWeight: 600,
                  cursor: 'pointer',
                }}
              >
                Save
              </button>
              <button
                onClick={() => setEditing(false)}
                style={{
                  padding: '6px 14px',
                  backgroundColor: '#f3f4f6',
                  color: '#374151',
                  border: '1px solid #d1d5db',
                  borderRadius: '6px',
                  fontSize: '0.8rem',
                  fontWeight: 500,
                  cursor: 'pointer',
                }}
              >
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
            <div style={labelStyle}>Priority</div>
            {editing ? (
              <select
                value={editPriority}
                onChange={(e) => setEditPriority(e.target.value as IssuePriority)}
                style={inputStyle}
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
                style={inputStyle}
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
                style={inputStyle}
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
              {issue.tags.length > 0
                ? issue.tags.map((tag) => (
                    <span
                      key={tag}
                      style={{
                        fontSize: '0.65rem',
                        padding: '1px 6px',
                        borderRadius: '4px',
                        backgroundColor: '#f3f4f6',
                        color: '#4b5563',
                      }}
                    >
                      {tag}
                    </span>
                  ))
                : <span style={{ fontSize: '0.8rem', color: '#9ca3af' }}>--</span>}
            </div>
          </div>
        </div>

        {/* Description */}
        <div style={{ marginBottom: '20px' }}>
          <div style={labelStyle}>Description</div>
          {editing ? (
            <textarea
              value={editDescription}
              onChange={(e) => setEditDescription(e.target.value)}
              rows={4}
              style={{ ...inputStyle, resize: 'vertical' }}
            />
          ) : (
            <p style={{ fontSize: '0.85rem', color: '#374151', lineHeight: 1.5, margin: '4px 0 0' }}>
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
                  backgroundColor: '#f9fafb',
                  borderRadius: '6px',
                  fontSize: '0.8rem',
                }}
              >
                <span style={{ color: '#6b7280' }}>{artifact.label}</span>
                {artifact.value ? (
                  <a
                    href={`${artifact.path}/${artifact.value}`}
                    style={{ color: '#3b82f6', textDecoration: 'none', fontWeight: 500 }}
                  >
                    {artifact.value.slice(0, 8)}...
                  </a>
                ) : (
                  <span style={{ color: '#d1d5db' }}>Not linked</span>
                )}
              </div>
            ))}
          </div>
        </div>

        {/* Activity / Transitions */}
        <div>
          <div style={{ ...labelStyle, marginBottom: '8px' }}>Activity</div>
          {issue.transitions && issue.transitions.length > 0 ? (
            <div style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
              {issue.transitions.map((t, i) => (
                <div
                  key={i}
                  style={{
                    display: 'flex',
                    alignItems: 'center',
                    gap: '8px',
                    fontSize: '0.78rem',
                    color: '#374151',
                  }}
                >
                  <div
                    style={{
                      width: '8px',
                      height: '8px',
                      borderRadius: '50%',
                      backgroundColor: '#3b82f6',
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
                  <span style={{ marginLeft: 'auto', color: '#9ca3af', fontSize: '0.7rem' }}>
                    {new Date(t.at).toLocaleString()}
                  </span>
                </div>
              ))}
            </div>
          ) : (
            <p style={{ fontSize: '0.8rem', color: '#9ca3af', margin: 0 }}>No activity yet.</p>
          )}
        </div>
      </div>
    </div>
  );
}
