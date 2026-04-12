import { useCallback, type CSSProperties } from 'react';
import type { QuickActionType } from '@apex-dev-manager/shared-types';
import { useQuickAction } from '../hooks/useAI';

// ---------------------------------------------------------------------------
// Styles
// ---------------------------------------------------------------------------

const containerStyle: CSSProperties = {
  display: 'flex',
  flexDirection: 'column',
  gap: '0.5rem',
  padding: '0.75rem',
  borderBottom: '1px solid #e5e7eb',
  backgroundColor: '#f9fafb',
};

const titleStyle: CSSProperties = {
  fontSize: '0.75rem',
  fontWeight: 600,
  color: '#6b7280',
  textTransform: 'uppercase',
  letterSpacing: '0.05em',
  marginBottom: '0.25rem',
};

const buttonsContainerStyle: CSSProperties = {
  display: 'flex',
  flexWrap: 'wrap',
  gap: '0.375rem',
};

const actionButtonBase: CSSProperties = {
  display: 'inline-flex',
  alignItems: 'center',
  gap: '0.375rem',
  padding: '0.375rem 0.75rem',
  fontSize: '0.75rem',
  fontWeight: 500,
  border: '1px solid #d1d5db',
  borderRadius: '0.375rem',
  backgroundColor: '#ffffff',
  color: '#374151',
  cursor: 'pointer',
  transition: 'all 0.15s ease',
  whiteSpace: 'nowrap',
};

const disabledButtonStyle: CSSProperties = {
  ...actionButtonBase,
  opacity: 0.5,
  cursor: 'not-allowed',
};

const resultContainerStyle: CSSProperties = {
  marginTop: '0.5rem',
  padding: '0.75rem',
  backgroundColor: '#ffffff',
  border: '1px solid #e5e7eb',
  borderRadius: '0.5rem',
  fontSize: '0.8125rem',
  lineHeight: 1.6,
  whiteSpace: 'pre-wrap',
  maxHeight: 300,
  overflowY: 'auto',
};

const errorStyle: CSSProperties = {
  color: '#b91c1c',
  fontSize: '0.75rem',
  marginTop: '0.25rem',
};

const loadingStyle: CSSProperties = {
  color: '#6b7280',
  fontSize: '0.75rem',
  fontStyle: 'italic',
  marginTop: '0.25rem',
};

// ---------------------------------------------------------------------------
// Action definitions
// ---------------------------------------------------------------------------

interface ActionDef {
  type: QuickActionType;
  label: string;
  icon: string;
  description: string;
}

const ACTIONS: ActionDef[] = [
  { type: 'explain', label: 'Explain', icon: '?', description: 'Explain what this code does' },
  { type: 'refactor', label: 'Refactor', icon: 'R', description: 'Suggest refactoring improvements' },
  { type: 'find-bugs', label: 'Find Bugs', icon: 'B', description: 'Find potential bugs and issues' },
  { type: 'document', label: 'Document', icon: 'D', description: 'Generate documentation' },
  { type: 'optimize', label: 'Optimize', icon: 'O', description: 'Suggest performance optimizations' },
  { type: 'security', label: 'Security', icon: 'S', description: 'Security vulnerability review' },
];

// ---------------------------------------------------------------------------
// Props
// ---------------------------------------------------------------------------

export interface QuickActionsProps {
  selectedCode: string;
  language?: string;
  connectionId?: string;
  appId?: number;
  pageId?: number;
  appName?: string;
  pageName?: string;
  onResult?: (content: string, action: QuickActionType) => void;
}

// ---------------------------------------------------------------------------
// QuickActions
// ---------------------------------------------------------------------------

export function QuickActions({
  selectedCode,
  language,
  connectionId,
  appId,
  pageId,
  appName,
  pageName,
  onResult,
}: QuickActionsProps) {
  const { mutate, data, isPending, error, reset } = useQuickAction();

  const handleAction = useCallback(
    (action: QuickActionType) => {
      if (!selectedCode.trim()) return;

      reset();
      mutate(
        {
          action,
          code: selectedCode,
          language,
          connectionId,
          appId,
          pageId,
          appName,
          pageName,
        },
        {
          onSuccess: (result) => {
            onResult?.(result.content, action);
          },
        },
      );
    },
    [selectedCode, language, connectionId, appId, pageId, appName, pageName, mutate, reset, onResult],
  );

  const hasCode = selectedCode.trim().length > 0;

  return (
    <div style={containerStyle}>
      <div style={titleStyle}>Quick Actions</div>
      <div style={buttonsContainerStyle}>
        {ACTIONS.map((action) => (
          <button
            key={action.type}
            type="button"
            style={hasCode && !isPending ? actionButtonBase : disabledButtonStyle}
            onClick={() => handleAction(action.type)}
            disabled={!hasCode || isPending}
            title={hasCode ? action.description : 'Select code first'}
          >
            <span style={{ fontWeight: 700, fontSize: '0.6875rem' }}>{action.icon}</span>
            {action.label}
          </button>
        ))}
      </div>

      {isPending && <div style={loadingStyle}>Processing...</div>}

      {error && (
        <div style={errorStyle}>
          Error: {(error as Error).message}
        </div>
      )}

      {data && !isPending && (
        <div style={resultContainerStyle}>
          {data.content}
        </div>
      )}

      {!hasCode && (
        <div style={{ fontSize: '0.6875rem', color: '#9ca3af', marginTop: '0.125rem' }}>
          Select code in the editor to use quick actions.
        </div>
      )}
    </div>
  );
}

export default QuickActions;
