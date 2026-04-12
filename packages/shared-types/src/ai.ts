// ---------------------------------------------------------------------------
// AI Studio shared types (M4 AI Engine + M10 stub)
// ---------------------------------------------------------------------------

/**
 * Quick action types available in the AI Studio toolbar.
 */
export type QuickActionType =
  | 'explain'
  | 'refactor'
  | 'find-bugs'
  | 'document'
  | 'optimize'
  | 'security';

/**
 * Roles for messages in a conversation.
 */
export type MessageRole = 'user' | 'assistant' | 'system';

/**
 * A single message within an AI conversation.
 */
export interface ConversationMessage {
  id: string;
  conversationId: string;
  role: MessageRole;
  content: string;
  action?: string;
  tokensInput?: number;
  tokensOutput?: number;
  model?: string;
  createdAt: string;
}

/**
 * A code block extracted from an AI response.
 */
export interface CodeBlock {
  language: string;
  code: string;
  filename?: string;
  startLine?: number;
}

/**
 * A conversation with its metadata.
 */
export interface Conversation {
  id: string;
  tenantId: string;
  userId: string;
  connectionId?: string;
  appId?: number;
  pageId?: number;
  title: string;
  messageCount: number;
  totalTokens: number;
  createdAt: string;
  updatedAt: string;
  messages?: ConversationMessage[];
}

/**
 * Request payload for AI chat.
 */
export interface AIRequest {
  conversationId?: string;
  message: string;
  connectionId?: string;
  appId?: number;
  pageId?: number;
  appName?: string;
  pageName?: string;
  componentSource?: string;
  model?: string;
}

/**
 * Request payload for quick actions.
 */
export interface QuickActionRequest {
  action: QuickActionType;
  code: string;
  language?: string;
  connectionId?: string;
  appId?: number;
  pageId?: number;
  appName?: string;
  pageName?: string;
}

/**
 * Server-Sent Event types for streaming responses.
 */
export type AIStreamEventType = 'start' | 'delta' | 'done' | 'error';

export interface AIStreamEvent {
  type: AIStreamEventType;
  /** Partial content delta (for 'delta' events). */
  content?: string;
  /** Conversation ID (sent with 'start' event). */
  conversationId?: string;
  /** Message ID (sent with 'start' event). */
  messageId?: string;
  /** Token usage (sent with 'done' event). */
  usage?: {
    inputTokens: number;
    outputTokens: number;
    totalTokens: number;
  };
  /** Error message (sent with 'error' event). */
  error?: string;
}

/**
 * Token usage summary for a time period.
 */
export interface TokenUsageSummary {
  tenantId: string;
  period: string;
  totalInputTokens: number;
  totalOutputTokens: number;
  totalTokens: number;
  estimatedCostUsd: number;
  byModel: Record<
    string,
    {
      inputTokens: number;
      outputTokens: number;
      totalTokens: number;
      estimatedCostUsd: number;
      requestCount: number;
    }
  >;
  byUser: Record<
    string,
    {
      inputTokens: number;
      outputTokens: number;
      totalTokens: number;
    }
  >;
  dailyBreakdown: Array<{
    date: string;
    totalTokens: number;
    estimatedCostUsd: number;
  }>;
}

/**
 * Model configuration.
 */
export interface ModelConfig {
  id: string;
  name: string;
  maxTokens: number;
  inputCostPer1k: number;
  outputCostPer1k: number;
  description: string;
}

/**
 * Result of input/output sanitization.
 */
export interface SanitizationResult {
  safe: boolean;
  sanitized: string;
  warnings: string[];
  blockedPatterns: string[];
}
