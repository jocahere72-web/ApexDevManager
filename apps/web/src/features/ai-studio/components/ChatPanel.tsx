import { useState, useRef, useEffect, useCallback, type CSSProperties, type FormEvent } from 'react';
import type { ConversationMessage, CodeBlock } from '@apex-dev-manager/shared-types';
import { useStreamChat } from '../hooks/useAI';
import type { StreamChatParams } from '../../../services/ai.api';

// ---------------------------------------------------------------------------
// Styles
// ---------------------------------------------------------------------------

const containerStyle: CSSProperties = {
  display: 'flex',
  flexDirection: 'column',
  height: '100%',
  backgroundColor: '#ffffff',
};

const messagesAreaStyle: CSSProperties = {
  flex: 1,
  overflowY: 'auto',
  padding: '1rem',
  display: 'flex',
  flexDirection: 'column',
  gap: '0.75rem',
};

const userBubbleStyle: CSSProperties = {
  alignSelf: 'flex-end',
  backgroundColor: '#2563eb',
  color: '#ffffff',
  padding: '0.75rem 1rem',
  borderRadius: '1rem 1rem 0.25rem 1rem',
  maxWidth: '75%',
  fontSize: '0.875rem',
  lineHeight: 1.5,
  whiteSpace: 'pre-wrap',
  wordBreak: 'break-word',
};

const assistantBubbleStyle: CSSProperties = {
  alignSelf: 'flex-start',
  backgroundColor: '#f3f4f6',
  color: '#1f2937',
  padding: '0.75rem 1rem',
  borderRadius: '1rem 1rem 1rem 0.25rem',
  maxWidth: '80%',
  fontSize: '0.875rem',
  lineHeight: 1.6,
  whiteSpace: 'pre-wrap',
  wordBreak: 'break-word',
};

const codeBlockContainerStyle: CSSProperties = {
  position: 'relative',
  margin: '0.5rem 0',
  borderRadius: '0.5rem',
  overflow: 'hidden',
  border: '1px solid #e5e7eb',
};

const codeBlockHeaderStyle: CSSProperties = {
  display: 'flex',
  justifyContent: 'space-between',
  alignItems: 'center',
  padding: '0.375rem 0.75rem',
  backgroundColor: '#1f2937',
  color: '#9ca3af',
  fontSize: '0.75rem',
  fontFamily: 'monospace',
};

const codeBlockBodyStyle: CSSProperties = {
  padding: '0.75rem',
  backgroundColor: '#111827',
  color: '#e5e7eb',
  fontSize: '0.8125rem',
  fontFamily: "'JetBrains Mono', 'Fira Code', monospace",
  lineHeight: 1.5,
  overflowX: 'auto',
  whiteSpace: 'pre',
  margin: 0,
};

const applyButtonStyle: CSSProperties = {
  padding: '0.25rem 0.5rem',
  fontSize: '0.6875rem',
  backgroundColor: '#059669',
  color: '#ffffff',
  border: 'none',
  borderRadius: '0.25rem',
  cursor: 'pointer',
  fontWeight: 500,
};

const inputAreaStyle: CSSProperties = {
  display: 'flex',
  gap: '0.5rem',
  padding: '0.75rem 1rem',
  borderTop: '1px solid #e5e7eb',
  backgroundColor: '#f9fafb',
};

const textareaStyle: CSSProperties = {
  flex: 1,
  minHeight: 40,
  maxHeight: 120,
  padding: '0.5rem 0.75rem',
  border: '1px solid #d1d5db',
  borderRadius: '0.5rem',
  fontSize: '0.875rem',
  fontFamily: 'inherit',
  resize: 'none',
  outline: 'none',
  lineHeight: 1.4,
};

const sendButtonStyle: CSSProperties = {
  padding: '0.5rem 1rem',
  backgroundColor: '#2563eb',
  color: '#ffffff',
  border: 'none',
  borderRadius: '0.5rem',
  fontSize: '0.875rem',
  fontWeight: 600,
  cursor: 'pointer',
  whiteSpace: 'nowrap',
  alignSelf: 'flex-end',
};

const sendButtonDisabledStyle: CSSProperties = {
  ...sendButtonStyle,
  backgroundColor: '#9ca3af',
  cursor: 'not-allowed',
};

const modelSelectorStyle: CSSProperties = {
  display: 'flex',
  alignItems: 'center',
  gap: '0.5rem',
  padding: '0.5rem 1rem',
  borderBottom: '1px solid #e5e7eb',
  fontSize: '0.75rem',
  color: '#6b7280',
  backgroundColor: '#f9fafb',
};

const selectStyle: CSSProperties = {
  padding: '0.25rem 0.5rem',
  fontSize: '0.75rem',
  border: '1px solid #d1d5db',
  borderRadius: '0.25rem',
  backgroundColor: '#ffffff',
  outline: 'none',
};

const errorStyle: CSSProperties = {
  padding: '0.5rem 1rem',
  backgroundColor: '#fef2f2',
  color: '#b91c1c',
  fontSize: '0.8125rem',
  borderTop: '1px solid #fecaca',
};

const streamingIndicatorStyle: CSSProperties = {
  display: 'inline-block',
  width: 8,
  height: 8,
  borderRadius: '50%',
  backgroundColor: '#2563eb',
  animation: 'pulse 1.5s infinite',
  marginLeft: '0.25rem',
  verticalAlign: 'middle',
};

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

const MODELS = [
  { id: 'claude-sonnet-4-20250514', label: 'Claude Sonnet 4' },
  { id: 'claude-3-5-sonnet-20241022', label: 'Claude 3.5 Sonnet' },
  { id: 'claude-3-haiku-20240307', label: 'Claude 3 Haiku' },
];

/**
 * Extract code blocks from markdown content for rendering.
 */
function extractCodeBlocks(content: string): Array<{ before: string; block: CodeBlock } | { text: string }> {
  const parts: Array<{ before: string; block: CodeBlock } | { text: string }> = [];
  const regex = /```(\w*)\n([\s\S]*?)```/g;
  let lastIndex = 0;
  let match: RegExpExecArray | null;

  while ((match = regex.exec(content)) !== null) {
    if (match.index > lastIndex) {
      parts.push({ text: content.slice(lastIndex, match.index) });
    }
    parts.push({
      before: '',
      block: {
        language: match[1] || 'text',
        code: match[2].trimEnd(),
      },
    });
    lastIndex = match.index + match[0].length;
  }

  if (lastIndex < content.length) {
    parts.push({ text: content.slice(lastIndex) });
  }

  return parts;
}

// ---------------------------------------------------------------------------
// Props
// ---------------------------------------------------------------------------

export interface ChatPanelProps {
  conversationId: string | null;
  messages: ConversationMessage[];
  connectionId?: string;
  appId?: number;
  pageId?: number;
  appName?: string;
  pageName?: string;
  componentSource?: string;
  onConversationCreated?: (id: string) => void;
  onApplyCode?: (code: string, language: string) => void;
}

// ---------------------------------------------------------------------------
// ChatPanel
// ---------------------------------------------------------------------------

export function ChatPanel({
  conversationId,
  messages,
  connectionId,
  appId,
  pageId,
  appName,
  pageName,
  componentSource,
  onConversationCreated,
  onApplyCode,
}: ChatPanelProps) {
  const [input, setInput] = useState('');
  const [model, setModel] = useState(MODELS[0].id);
  const messagesEndRef = useRef<HTMLDivElement>(null);

  const {
    isStreaming,
    streamingContent,
    conversationId: streamConvId,
    error,
    send,
    cancel,
  } = useStreamChat();

  // Auto-scroll to bottom
  useEffect(() => {
    messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' });
  }, [messages, streamingContent]);

  // Notify parent of new conversation ID
  useEffect(() => {
    if (streamConvId && streamConvId !== conversationId) {
      onConversationCreated?.(streamConvId);
    }
  }, [streamConvId, conversationId, onConversationCreated]);

  const handleSubmit = useCallback(
    (e: FormEvent) => {
      e.preventDefault();
      const trimmed = input.trim();
      if (!trimmed || isStreaming) return;

      const params: StreamChatParams = {
        conversationId: conversationId ?? streamConvId ?? undefined,
        message: trimmed,
        connectionId,
        appId,
        pageId,
        appName,
        pageName,
        componentSource,
        model,
      };

      send(params);
      setInput('');
    },
    [input, isStreaming, conversationId, streamConvId, connectionId, appId, pageId, appName, pageName, componentSource, model, send],
  );

  const handleKeyDown = useCallback(
    (e: React.KeyboardEvent<HTMLTextAreaElement>) => {
      if (e.key === 'Enter' && !e.shiftKey) {
        e.preventDefault();
        handleSubmit(e as unknown as FormEvent);
      }
    },
    [handleSubmit],
  );

  // -----------------------------------------------------------------------
  // Render message content with code blocks
  // -----------------------------------------------------------------------

  function renderContent(content: string) {
    const parts = extractCodeBlocks(content);

    return parts.map((part, idx) => {
      if ('block' in part) {
        return (
          <div key={idx} style={codeBlockContainerStyle}>
            <div style={codeBlockHeaderStyle}>
              <span>{part.block.language}</span>
              {onApplyCode && (
                <button
                  type="button"
                  style={applyButtonStyle}
                  onClick={() => onApplyCode(part.block.code, part.block.language)}
                >
                  Apply to Editor
                </button>
              )}
            </div>
            <pre style={codeBlockBodyStyle}>{part.block.code}</pre>
          </div>
        );
      }
      return <span key={idx}>{(part as { text: string }).text}</span>;
    });
  }

  return (
    <div style={containerStyle}>
      {/* Model selector */}
      <div style={modelSelectorStyle}>
        <label htmlFor="model-select">Model:</label>
        <select
          id="model-select"
          style={selectStyle}
          value={model}
          onChange={(e) => setModel(e.target.value)}
        >
          {MODELS.map((m) => (
            <option key={m.id} value={m.id}>
              {m.label}
            </option>
          ))}
        </select>
      </div>

      {/* Messages area */}
      <div style={messagesAreaStyle} role="log" aria-label="Chat messages">
        {messages.length === 0 && !isStreaming && (
          <p style={{ color: '#9ca3af', textAlign: 'center', marginTop: 48, fontSize: '0.875rem' }}>
            Start a conversation by typing a message below.
          </p>
        )}

        {messages.map((msg) => (
          <div
            key={msg.id}
            style={msg.role === 'user' ? userBubbleStyle : assistantBubbleStyle}
          >
            {msg.role === 'assistant' ? renderContent(msg.content) : msg.content}
          </div>
        ))}

        {/* Streaming content */}
        {isStreaming && streamingContent && (
          <div style={assistantBubbleStyle}>
            {renderContent(streamingContent)}
            <span style={streamingIndicatorStyle} />
          </div>
        )}

        {isStreaming && !streamingContent && (
          <div style={assistantBubbleStyle}>
            <span style={{ color: '#6b7280' }}>Thinking...</span>
            <span style={streamingIndicatorStyle} />
          </div>
        )}

        <div ref={messagesEndRef} />
      </div>

      {/* Error display */}
      {error && <div style={errorStyle}>{error}</div>}

      {/* Input area */}
      <form onSubmit={handleSubmit} style={inputAreaStyle}>
        <textarea
          style={textareaStyle}
          value={input}
          onChange={(e) => setInput(e.target.value)}
          onKeyDown={handleKeyDown}
          placeholder="Ask about your APEX code... (Shift+Enter for new line)"
          disabled={isStreaming}
          rows={1}
          aria-label="Chat message input"
        />
        {isStreaming ? (
          <button
            type="button"
            style={{ ...sendButtonStyle, backgroundColor: '#dc2626' }}
            onClick={cancel}
          >
            Stop
          </button>
        ) : (
          <button
            type="submit"
            style={input.trim() ? sendButtonStyle : sendButtonDisabledStyle}
            disabled={!input.trim()}
          >
            Send
          </button>
        )}
      </form>
    </div>
  );
}

export default ChatPanel;
