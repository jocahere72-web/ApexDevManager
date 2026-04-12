import { useState, useCallback, type CSSProperties } from 'react';
import type { PRDSession, PRDStatus } from '@apex-dev-manager/shared-types';
import { usePRDSessions, useCreateSession } from '../hooks/usePRD';

// ---------------------------------------------------------------------------
// Styles
// ---------------------------------------------------------------------------

const containerStyle: CSSProperties = {
  display: 'flex',
  flexDirection: 'column',
  height: '100%',
  overflow: 'hidden',
};

const headerStyle: CSSProperties = {
  display: 'flex',
  alignItems: 'center',
  justifyContent: 'space-between',
  padding: '0.75rem 1rem',
  borderBottom: '1px solid #e5e7eb',
  backgroundColor: '#f9fafb',
};

const titleStyle: CSSProperties = {
  fontSize: '0.9375rem',
  fontWeight: 600,
  color: '#111827',
  margin: 0,
};

const createButtonStyle: CSSProperties = {
  display: 'inline-flex',
  alignItems: 'center',
  gap: '0.25rem',
  padding: '0.375rem 0.75rem',
  fontSize: '0.8125rem',
  fontWeight: 500,
  color: '#fff',
  backgroundColor: '#2563eb',
  border: 'none',
  borderRadius: '0.375rem',
  cursor: 'pointer',
  transition: 'background-color 0.15s ease',
};

const listStyle: CSSProperties = {
  flex: 1,
  overflowY: 'auto',
  padding: '0.5rem',
};

const itemStyle: CSSProperties = {
  padding: '0.75rem',
  marginBottom: '0.375rem',
  borderRadius: '0.375rem',
  border: '1px solid #e5e7eb',
  cursor: 'pointer',
  transition: 'all 0.15s ease',
  backgroundColor: '#fff',
};

const itemSelectedStyle: CSSProperties = {
  ...itemStyle,
  borderColor: '#2563eb',
  backgroundColor: '#eff6ff',
};

const itemTitleStyle: CSSProperties = {
  fontSize: '0.8125rem',
  fontWeight: 500,
  color: '#111827',
  marginBottom: '0.25rem',
  overflow: 'hidden',
  textOverflow: 'ellipsis',
  whiteSpace: 'nowrap',
};

const itemMetaStyle: CSSProperties = {
  display: 'flex',
  alignItems: 'center',
  justifyContent: 'space-between',
  fontSize: '0.6875rem',
  color: '#6b7280',
};

const badgeBaseStyle: CSSProperties = {
  display: 'inline-block',
  padding: '0.125rem 0.5rem',
  fontSize: '0.6875rem',
  fontWeight: 500,
  borderRadius: '9999px',
  textTransform: 'capitalize',
};

const emptyStyle: CSSProperties = {
  display: 'flex',
  flexDirection: 'column',
  alignItems: 'center',
  justifyContent: 'center',
  padding: '2rem 1rem',
  textAlign: 'center',
  color: '#6b7280',
  fontSize: '0.8125rem',
};

const dialogOverlayStyle: CSSProperties = {
  position: 'fixed',
  inset: 0,
  backgroundColor: 'rgba(0, 0, 0, 0.4)',
  display: 'flex',
  alignItems: 'center',
  justifyContent: 'center',
  zIndex: 1000,
};

const dialogStyle: CSSProperties = {
  backgroundColor: '#fff',
  borderRadius: '0.5rem',
  padding: '1.5rem',
  width: '24rem',
  maxWidth: '90vw',
  boxShadow: '0 20px 25px -5px rgba(0, 0, 0, 0.1)',
};

const inputStyle: CSSProperties = {
  width: '100%',
  padding: '0.5rem 0.75rem',
  fontSize: '0.875rem',
  border: '1px solid #d1d5db',
  borderRadius: '0.375rem',
  marginBottom: '1rem',
  outline: 'none',
  boxSizing: 'border-box',
};

const dialogButtonRowStyle: CSSProperties = {
  display: 'flex',
  justifyContent: 'flex-end',
  gap: '0.5rem',
};

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

const STATUS_COLORS: Record<PRDStatus, { bg: string; color: string }> = {
  draft: { bg: '#f3f4f6', color: '#374151' },
  uploading: { bg: '#dbeafe', color: '#1d4ed8' },
  extracting: { bg: '#fef3c7', color: '#b45309' },
  generating: { bg: '#fef3c7', color: '#b45309' },
  validating: { bg: '#e0e7ff', color: '#4338ca' },
  validated: { bg: '#d1fae5', color: '#065f46' },
  exported: { bg: '#d1fae5', color: '#065f46' },
  error: { bg: '#fee2e2', color: '#991b1b' },
};

function formatDate(iso: string): string {
  return new Date(iso).toLocaleDateString(undefined, {
    month: 'short',
    day: 'numeric',
    hour: '2-digit',
    minute: '2-digit',
  });
}

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

interface PRDSessionListProps {
  selectedId: string | null;
  onSelect: (session: PRDSession) => void;
  onCreateNew: () => void;
}

export function PRDSessionList({ selectedId, onSelect, onCreateNew }: PRDSessionListProps) {
  const { data, isLoading, error } = usePRDSessions();
  const createSession = useCreateSession();

  const [showDialog, setShowDialog] = useState(false);
  const [newTitle, setNewTitle] = useState('');

  const handleCreate = useCallback(async () => {
    if (!newTitle.trim()) return;

    try {
      const session = await createSession.mutateAsync({ title: newTitle.trim() });
      setShowDialog(false);
      setNewTitle('');
      onSelect(session);
    } catch {
      // Error handled by mutation
    }
  }, [newTitle, createSession, onSelect]);

  const sessions = data?.sessions ?? [];

  return (
    <div style={containerStyle}>
      {/* Header */}
      <div style={headerStyle}>
        <h3 style={titleStyle}>PRD Sessions</h3>
        <button
          type="button"
          style={createButtonStyle}
          onClick={() => setShowDialog(true)}
        >
          + New
        </button>
      </div>

      {/* List */}
      <div style={listStyle}>
        {isLoading && (
          <div style={emptyStyle}>Loading sessions...</div>
        )}

        {error && (
          <div style={{ ...emptyStyle, color: '#dc2626' }}>
            Failed to load sessions
          </div>
        )}

        {!isLoading && !error && sessions.length === 0 && (
          <div style={emptyStyle}>
            <p style={{ marginBottom: '0.5rem' }}>No PRD sessions yet</p>
            <p>Create a new session to get started</p>
          </div>
        )}

        {sessions.map((session) => {
          const colors = STATUS_COLORS[session.status] ?? STATUS_COLORS.draft;
          const isSelected = session.id === selectedId;

          return (
            <div
              key={session.id}
              style={isSelected ? itemSelectedStyle : itemStyle}
              onClick={() => onSelect(session)}
              role="button"
              tabIndex={0}
              onKeyDown={(e) => {
                if (e.key === 'Enter' || e.key === ' ') onSelect(session);
              }}
            >
              <div style={itemTitleStyle}>{session.title}</div>
              <div style={itemMetaStyle}>
                <span
                  style={{
                    ...badgeBaseStyle,
                    backgroundColor: colors.bg,
                    color: colors.color,
                  }}
                >
                  {session.status}
                </span>
                <span>{formatDate(session.updatedAt)}</span>
              </div>
              {session.validationScore != null && (
                <div
                  style={{
                    fontSize: '0.6875rem',
                    color: '#6b7280',
                    marginTop: '0.25rem',
                  }}
                >
                  Score: {session.validationScore}/100
                </div>
              )}
            </div>
          );
        })}
      </div>

      {/* Create Dialog */}
      {showDialog && (
        <div
          style={dialogOverlayStyle}
          onClick={() => setShowDialog(false)}
          role="dialog"
          aria-modal="true"
        >
          <div style={dialogStyle} onClick={(e) => e.stopPropagation()}>
            <h4 style={{ margin: '0 0 1rem', fontSize: '1rem', color: '#111827' }}>
              New PRD Session
            </h4>
            <label
              htmlFor="prd-title"
              style={{
                display: 'block',
                fontSize: '0.8125rem',
                fontWeight: 500,
                color: '#374151',
                marginBottom: '0.375rem',
              }}
            >
              Title
            </label>
            <input
              id="prd-title"
              type="text"
              style={inputStyle}
              value={newTitle}
              onChange={(e) => setNewTitle(e.target.value)}
              placeholder="e.g., Invoice Management Module"
              onKeyDown={(e) => {
                if (e.key === 'Enter') handleCreate();
              }}
              autoFocus
            />
            <div style={dialogButtonRowStyle}>
              <button
                type="button"
                style={{
                  ...createButtonStyle,
                  backgroundColor: '#fff',
                  color: '#374151',
                  border: '1px solid #d1d5db',
                }}
                onClick={() => {
                  setShowDialog(false);
                  setNewTitle('');
                }}
              >
                Cancel
              </button>
              <button
                type="button"
                style={createButtonStyle}
                onClick={handleCreate}
                disabled={!newTitle.trim() || createSession.isPending}
              >
                {createSession.isPending ? 'Creating...' : 'Create'}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

export default PRDSessionList;
