import { useState, useCallback } from 'react';
import { useTranslation } from 'react-i18next';
import type {
  Conversation,
  ConversationMessage,
  QuickActionType,
} from '@apex-dev-manager/shared-types';
import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import { useConversation } from './hooks/useAI';
import { ChatPanel } from './components/ChatPanel';
import { ConversationList } from './components/ConversationList';
import { QuickActions } from './components/QuickActions';
import { UsageDashboard } from './components/UsageDashboard';

// ---------------------------------------------------------------------------
// View types
// ---------------------------------------------------------------------------

type RightPanelView = 'quick-actions' | 'usage';

// ---------------------------------------------------------------------------
// AIStudioPage
// ---------------------------------------------------------------------------

export function AIStudioPage() {
  const { t } = useTranslation();
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
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow={t('aiStudio.eyebrow')}
        title={t('aiStudio.title')}
        description={t('aiStudio.description')}
      />
      <div className="app-workspace">
        {/* Left sidebar: conversation list */}
        <div className="app-workspace-sidebar" style={{ display: 'flex', flexDirection: 'column', overflow: 'hidden' }}>
          <ConversationList
            selectedId={selectedConversationId}
            onSelect={handleSelectConversation}
            onNewChat={handleNewChat}
          />
        </div>

        {/* Center: chat panel */}
        <div className="app-workspace-main" style={{ display: 'flex', flexDirection: 'column', overflow: 'hidden' }}>
          <ChatPanel
            conversationId={selectedConversationId}
            messages={messages}
            onConversationCreated={handleConversationCreated}
            onApplyCode={handleApplyCode}
          />
        </div>

        {/* Right panel: quick actions / usage */}
        <div className="app-workspace-panel" style={{ display: 'flex', flexDirection: 'column', overflow: 'hidden' }}>
          <div className="app-tabs" style={{ margin: 0, borderRadius: 0, border: 'none', borderBottom: '1px solid var(--app-border)' }}>
            <button
              type="button"
              className={`app-tab${rightView === 'quick-actions' ? ' app-tab-active' : ''}`}
              onClick={() => setRightView('quick-actions')}
            >
              {t('aiStudio.quickActions')}
            </button>
            <button
              type="button"
              className={`app-tab${rightView === 'usage' ? ' app-tab-active' : ''}`}
              onClick={() => setRightView('usage')}
            >
              {t('aiStudio.usage')}
            </button>
          </div>

          {rightView === 'quick-actions' ? (
            <div style={{ flex: 1, overflowY: 'auto' }}>
              <QuickActions selectedCode={selectedCode} onResult={handleQuickActionResult} />
            </div>
          ) : (
            <div style={{ flex: 1, overflow: 'hidden' }}>
              <UsageDashboard />
            </div>
          )}
        </div>
      </div>
    </AppPage>
  );
}

export default AIStudioPage;
