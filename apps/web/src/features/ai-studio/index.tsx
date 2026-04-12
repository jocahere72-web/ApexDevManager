import { useState, useCallback, type CSSProperties } from 'react';
import type { Conversation, ConversationMessage, QuickActionType } from '@apex-dev-manager/shared-types';
import { useConversation } from './hooks/useAI';
import { ChatPanel } from './components/ChatPanel';
import { ConversationList } from './components/ConversationList';
import { QuickActions } from './components/QuickActions';
import { UsageDashboard } from './components/UsageDashboard';

// ---------------------------------------------------------------------------
// Layout styles
// ---------------------------------------------------------------------------

const layoutStyle: CSSProperties = {
  display: 'flex',
  height: '100%',
  minHeight: 0,
};

const leftSidebarStyle: CSSProperties = {
  width: 280,
  minWidth: 240,
  maxWidth: 320,
  display: 'flex',
  flexDirection: 'column',
  overflow: 'hidden',
};

const centerStyle: CSSProperties = {
  flex: 1,
  display: 'flex',
  flexDirection: 'column',
  overflow: 'hidden',
  minWidth: 0,
};

const rightPanelStyle: CSSProperties = {
  width: 300,
  minWidth: 240,
  maxWidth: 360,
  display: 'flex',
  flexDirection: 'column',
  borderLeft: '1px solid #e5e7eb',
  overflow: 'hidden',
};

const tabBarStyle: CSSProperties = {
  display: 'flex',
  borderBottom: '1px solid #e5e7eb',
  backgroundColor: '#f9fafb',
};

const tabButtonBase: CSSProperties = {
  padding: '0.625rem 1rem',
  fontSize: '0.8125rem',
  fontWeight: 500,
  border: 'none',
  cursor: 'pointer',
  borderBottom: '2px solid transparent',
  backgroundColor: 'transparent',
  color: '#6b7280',
  transition: 'all 0.15s ease',
};

const tabButtonActive: CSSProperties = {
  ...tabButtonBase,
  color: '#2563eb',
  borderBottomColor: '#2563eb',
};

// ---------------------------------------------------------------------------
// View types
// ---------------------------------------------------------------------------

type RightPanelView = 'quick-actions' | 'usage';

// ---------------------------------------------------------------------------
// AIStudioPage
// ---------------------------------------------------------------------------

export function AIStudioPage() {
  const [selectedConversationId, setSelectedConversationId] = useState<string | null>(null);
  const [selectedCode, setSelectedCode] = useState('');
  const [rightView, setRightView] = useState<RightPanelView>('quick-actions');

  // Fetch selected conversation messages
  const { data: conversation } = useConversation(selectedConversationId);
  const messages: ConversationMessage[] = conversation?.messages ?? [];

  // -----------------------------------------------------------------------
  // Handlers
  // -----------------------------------------------------------------------

  const handleSelectConversation = useCallback((conv: Conversation) => {
    setSelectedConversationId(conv.id);
  }, []);

  const handleNewChat = useCallback(() => {
    setSelectedConversationId(null);
  }, []);

  const handleConversationCreated = useCallback((id: string) => {
    setSelectedConversationId(id);
  }, []);

  const handleApplyCode = useCallback((code: string, language: string) => {
    // Placeholder: In a full implementation, this would send the code
    // to the editor component via a shared store or context.
    console.info('[AI Studio] Apply code to editor:', { language, codeLength: code.length });
  }, []);

  const handleQuickActionResult = useCallback((content: string, action: QuickActionType) => {
    console.info('[AI Studio] Quick action result:', { action, contentLength: content.length });
  }, []);

  // -----------------------------------------------------------------------
  // Render
  // -----------------------------------------------------------------------

  return (
    <div style={layoutStyle}>
      {/* Left sidebar: conversation list */}
      <div style={leftSidebarStyle}>
        <ConversationList
          selectedId={selectedConversationId}
          onSelect={handleSelectConversation}
          onNewChat={handleNewChat}
        />
      </div>

      {/* Center: chat panel */}
      <div style={centerStyle}>
        <ChatPanel
          conversationId={selectedConversationId}
          messages={messages}
          onConversationCreated={handleConversationCreated}
          onApplyCode={handleApplyCode}
        />
      </div>

      {/* Right panel: quick actions / usage */}
      <div style={rightPanelStyle}>
        <div style={tabBarStyle}>
          <button
            type="button"
            style={rightView === 'quick-actions' ? tabButtonActive : tabButtonBase}
            onClick={() => setRightView('quick-actions')}
          >
            Quick Actions
          </button>
          <button
            type="button"
            style={rightView === 'usage' ? tabButtonActive : tabButtonBase}
            onClick={() => setRightView('usage')}
          >
            Usage
          </button>
        </div>

        {rightView === 'quick-actions' ? (
          <div style={{ flex: 1, overflowY: 'auto' }}>
            <QuickActions
              selectedCode={selectedCode}
              onResult={handleQuickActionResult}
            />
          </div>
        ) : (
          <div style={{ flex: 1, overflow: 'hidden' }}>
            <UsageDashboard />
          </div>
        )}
      </div>
    </div>
  );
}

export default AIStudioPage;
