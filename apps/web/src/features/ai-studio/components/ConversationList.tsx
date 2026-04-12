import { useCallback, type CSSProperties } from 'react';
import type { Conversation } from '@apex-dev-manager/shared-types';
import { useConversations, useDeleteConversation } from '../hooks/useAI';

// ---------------------------------------------------------------------------
// Styles
// ---------------------------------------------------------------------------

const containerStyle: CSSProperties = {
  display: 'flex',
  flexDirection: 'column',
  height: '100%',
  backgroundColor: '#f9fafb',
  borderRight: '1px solid #e5e7eb',
  overflow: 'hidden',
};

const headerStyle: CSSProperties = {
  display: 'flex',
  justifyContent: 'space-between',
  alignItems: 'center',
  padding: '0.75rem 1rem',
  borderBottom: '1px solid #e5e7eb',
  backgroundColor: '#ffffff',
};

const headerTitleStyle: CSSProperties = {
  fontSize: '0.875rem',
  fontWeight: 600,
  color: '#1f2937',
};

const newChatButtonStyle: CSSProperties = {
  padding: '0.375rem 0.75rem',
  fontSize: '0.75rem',
  fontWeight: 600,
  backgroundColor: '#2563eb',
  color: '#ffffff',
  border: 'none',
  borderRadius: '0.375rem',
  cursor: 'pointer',
};

const listStyle: CSSProperties = {
  flex: 1,
  overflowY: 'auto',
  padding: '0.5rem',
};

const itemBaseStyle: CSSProperties = {
  display: 'flex',
  justifyContent: 'space-between',
  alignItems: 'flex-start',
  padding: '0.625rem 0.75rem',
  borderRadius: '0.5rem',
  cursor: 'pointer',
  marginBottom: '0.25rem',
  transition: 'background-color 0.1s ease',
};

const itemStyle: CSSProperties = {
  ...itemBaseStyle,
  backgroundColor: 'transparent',
};

const itemSelectedStyle: CSSProperties = {
  ...itemBaseStyle,
  backgroundColor: '#dbeafe',
};

const itemTitleStyle: CSSProperties = {
  fontSize: '0.8125rem',
  fontWeight: 500,
  color: '#1f2937',
  overflow: 'hidden',
  textOverflow: 'ellipsis',
  whiteSpace: 'nowrap',
  maxWidth: 180,
};

const itemMetaStyle: CSSProperties = {
  fontSize: '0.6875rem',
  color: '#9ca3af',
  marginTop: '0.125rem',
};

const deleteButtonStyle: CSSProperties = {
  padding: '0.125rem 0.375rem',
  fontSize: '0.6875rem',
  color: '#9ca3af',
  backgroundColor: 'transparent',
  border: 'none',
  borderRadius: '0.25rem',
  cursor: 'pointer',
  flexShrink: 0,
};

const emptyStyle: CSSProperties = {
  textAlign: 'center',
  color: '#9ca3af',
  fontSize: '0.8125rem',
  marginTop: 48,
  padding: '0 1rem',
};

const loadingStyle: CSSProperties = {
  textAlign: 'center',
  color: '#6b7280',
  fontSize: '0.8125rem',
  marginTop: 48,
};

// ---------------------------------------------------------------------------
// Props
// ---------------------------------------------------------------------------

export interface ConversationListProps {
  selectedId: string | null;
  onSelect: (conversation: Conversation) => void;
  onNewChat: () => void;
  connectionId?: string;
}

// ---------------------------------------------------------------------------
// ConversationList
// ---------------------------------------------------------------------------

export function ConversationList({
  selectedId,
  onSelect,
  onNewChat,
  connectionId,
}: ConversationListProps) {
  const { data, isLoading, error } = useConversations(connectionId);
  const deleteMutation = useDeleteConversation();

  const handleDelete = useCallback(
    (e: React.MouseEvent, id: string) => {
      e.stopPropagation();
      if (window.confirm('Delete this conversation? This cannot be undone.')) {
        deleteMutation.mutate(id);
      }
    },
    [deleteMutation],
  );

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    const now = new Date();
    const diffMs = now.getTime() - date.getTime();
    const diffMins = Math.floor(diffMs / 60_000);
    const diffHours = Math.floor(diffMs / 3_600_000);
    const diffDays = Math.floor(diffMs / 86_400_000);

    if (diffMins < 1) return 'Just now';
    if (diffMins < 60) return `${diffMins}m ago`;
    if (diffHours < 24) return `${diffHours}h ago`;
    if (diffDays < 7) return `${diffDays}d ago`;
    return date.toLocaleDateString();
  };

  const conversations = data?.conversations ?? [];

  return (
    <div style={containerStyle}>
      <div style={headerStyle}>
        <span style={headerTitleStyle}>Conversations</span>
        <button type="button" style={newChatButtonStyle} onClick={onNewChat}>
          + New Chat
        </button>
      </div>

      <div style={listStyle} role="list" aria-label="Conversation list">
        {isLoading && <div style={loadingStyle}>Loading conversations...</div>}

        {error && (
          <div style={{ ...emptyStyle, color: '#b91c1c' }}>
            Failed to load conversations.
          </div>
        )}

        {!isLoading && conversations.length === 0 && (
          <div style={emptyStyle}>
            No conversations yet. Start a new chat to begin.
          </div>
        )}

        {conversations.map((conv) => (
          <div
            key={conv.id}
            role="listitem"
            style={conv.id === selectedId ? itemSelectedStyle : itemStyle}
            onClick={() => onSelect(conv)}
            onMouseEnter={(e) => {
              if (conv.id !== selectedId) {
                (e.currentTarget as HTMLDivElement).style.backgroundColor = '#f3f4f6';
              }
            }}
            onMouseLeave={(e) => {
              if (conv.id !== selectedId) {
                (e.currentTarget as HTMLDivElement).style.backgroundColor = 'transparent';
              }
            }}
          >
            <div style={{ minWidth: 0 }}>
              <div style={itemTitleStyle} title={conv.title}>
                {conv.title}
              </div>
              <div style={itemMetaStyle}>
                {conv.messageCount} messages &middot; {formatDate(conv.updatedAt)}
              </div>
            </div>
            <button
              type="button"
              style={deleteButtonStyle}
              onClick={(e) => handleDelete(e, conv.id)}
              title="Delete conversation"
              aria-label={`Delete conversation: ${conv.title}`}
            >
              x
            </button>
          </div>
        ))}
      </div>
    </div>
  );
}

export default ConversationList;
