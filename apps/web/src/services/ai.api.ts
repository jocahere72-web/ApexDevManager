import apiClient from '../lib/api-client';
import type {
  Conversation,
  ConversationMessage,
  AIStreamEvent,
  TokenUsageSummary,
  QuickActionType,
} from '@apex-dev-manager/shared-types';

// ---------------------------------------------------------------------------
// Stream Chat (SSE via EventSource-like fetch)
// ---------------------------------------------------------------------------

export interface StreamChatParams {
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
 * Stream a chat response using SSE via fetch. Returns an AbortController so the
 * caller can cancel the stream, and calls `onEvent` for each server-sent event.
 */
export function streamChat(
  params: StreamChatParams,
  onEvent: (event: AIStreamEvent) => void,
  onError?: (error: Error) => void,
): AbortController {
  const controller = new AbortController();
  const token = localStorage.getItem('auth_token');

  fetch('/api/v1/ai/chat', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify(params),
    signal: controller.signal,
  })
    .then(async (response) => {
      if (!response.ok) {
        const errorBody = await response.text();
        throw new Error(errorBody || `HTTP ${response.status}`);
      }

      const reader = response.body?.getReader();
      if (!reader) throw new Error('No response body');

      const decoder = new TextDecoder();
      let buffer = '';

      while (true) {
        const { done, value } = await reader.read();
        if (done) break;

        buffer += decoder.decode(value, { stream: true });
        const lines = buffer.split('\n');
        buffer = lines.pop() ?? '';

        for (const line of lines) {
          if (line.startsWith('data: ')) {
            try {
              const event = JSON.parse(line.slice(6)) as AIStreamEvent;
              onEvent(event);
            } catch {
              // Skip malformed JSON lines
            }
          }
        }
      }
    })
    .catch((err) => {
      if ((err as Error).name !== 'AbortError') {
        onError?.(err as Error);
      }
    });

  return controller;
}

// ---------------------------------------------------------------------------
// Quick Action (non-streaming)
// ---------------------------------------------------------------------------

export interface QuickActionParams {
  action: QuickActionType;
  code: string;
  language?: string;
  connectionId?: string;
  appId?: number;
  pageId?: number;
  appName?: string;
  pageName?: string;
}

export interface QuickActionResponse {
  content: string;
  action: QuickActionType;
  model: string;
  usage: {
    inputTokens: number;
    outputTokens: number;
    totalTokens: number;
  };
}

export async function quickAction(params: QuickActionParams): Promise<QuickActionResponse> {
  const { data } = await apiClient.post<{ data: QuickActionResponse }>(
    '/ai/quick-action',
    params,
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Conversations
// ---------------------------------------------------------------------------

export interface ConversationListResponse {
  conversations: Conversation[];
  total: number;
}

export async function fetchConversations(
  page = 1,
  limit = 20,
  connectionId?: string,
): Promise<ConversationListResponse> {
  const params: Record<string, unknown> = { page, limit };
  if (connectionId) params.connectionId = connectionId;

  const { data } = await apiClient.get<{
    data: Conversation[];
    pagination: { totalItems: number };
  }>('/ai/conversations', { params });

  return {
    conversations: data.data,
    total: data.pagination.totalItems,
  };
}

export async function fetchConversation(id: string): Promise<Conversation> {
  const { data } = await apiClient.get<{ data: Conversation }>(`/ai/conversations/${id}`);
  return data.data;
}

export async function deleteConversation(id: string): Promise<void> {
  await apiClient.delete(`/ai/conversations/${id}`);
}

// ---------------------------------------------------------------------------
// Usage
// ---------------------------------------------------------------------------

export async function fetchUsage(
  period: 'day' | 'week' | 'month' = 'month',
): Promise<TokenUsageSummary> {
  const { data } = await apiClient.get<{ data: TokenUsageSummary }>('/ai/usage', {
    params: { period },
  });
  return data.data;
}
