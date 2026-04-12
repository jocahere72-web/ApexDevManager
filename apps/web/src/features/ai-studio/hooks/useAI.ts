import { useState, useCallback, useRef } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import type {
  Conversation,
  ConversationMessage,
  AIStreamEvent,
  TokenUsageSummary,
  QuickActionType,
} from '@apex-dev-manager/shared-types';
import {
  streamChat,
  quickAction,
  fetchConversations,
  fetchConversation,
  deleteConversation as deleteConversationApi,
  fetchUsage,
} from '../../../services/ai.api';
import type { StreamChatParams, QuickActionParams } from '../../../services/ai.api';

// ---------------------------------------------------------------------------
// Query key factory
// ---------------------------------------------------------------------------

export const aiKeys = {
  all: ['ai'] as const,
  conversations: (connectionId?: string) =>
    [...aiKeys.all, 'conversations', connectionId ?? 'all'] as const,
  conversation: (id: string) => [...aiKeys.all, 'conversation', id] as const,
  usage: (period: string) => [...aiKeys.all, 'usage', period] as const,
};

// ---------------------------------------------------------------------------
// useConversations
// ---------------------------------------------------------------------------

export function useConversations(connectionId?: string) {
  return useQuery({
    queryKey: aiKeys.conversations(connectionId),
    queryFn: () => fetchConversations(1, 50, connectionId),
  });
}

// ---------------------------------------------------------------------------
// useConversation
// ---------------------------------------------------------------------------

export function useConversation(id: string | null) {
  return useQuery({
    queryKey: aiKeys.conversation(id ?? ''),
    queryFn: () => fetchConversation(id!),
    enabled: !!id,
  });
}

// ---------------------------------------------------------------------------
// useStreamChat
// ---------------------------------------------------------------------------

export interface StreamChatState {
  isStreaming: boolean;
  streamingContent: string;
  conversationId: string | null;
  error: string | null;
}

export function useStreamChat() {
  const [state, setState] = useState<StreamChatState>({
    isStreaming: false,
    streamingContent: '',
    conversationId: null,
    error: null,
  });
  const abortRef = useRef<AbortController | null>(null);
  const queryClient = useQueryClient();

  const send = useCallback(
    (params: StreamChatParams) => {
      // Cancel any existing stream
      abortRef.current?.abort();

      setState({
        isStreaming: true,
        streamingContent: '',
        conversationId: params.conversationId ?? null,
        error: null,
      });

      const controller = streamChat(
        params,
        (event: AIStreamEvent) => {
          switch (event.type) {
            case 'start':
              setState((prev) => ({
                ...prev,
                conversationId: event.conversationId ?? prev.conversationId,
              }));
              break;

            case 'delta':
              setState((prev) => ({
                ...prev,
                streamingContent: prev.streamingContent + (event.content ?? ''),
              }));
              break;

            case 'done':
              setState((prev) => ({
                ...prev,
                isStreaming: false,
                conversationId: event.conversationId ?? prev.conversationId,
              }));
              // Invalidate queries to refresh conversation list and messages
              queryClient.invalidateQueries({ queryKey: aiKeys.all });
              break;

            case 'error':
              setState((prev) => ({
                ...prev,
                isStreaming: false,
                error: event.error ?? 'Unknown error',
              }));
              break;
          }
        },
        (error: Error) => {
          setState((prev) => ({
            ...prev,
            isStreaming: false,
            error: error.message,
          }));
        },
      );

      abortRef.current = controller;
    },
    [queryClient],
  );

  const cancel = useCallback(() => {
    abortRef.current?.abort();
    setState((prev) => ({ ...prev, isStreaming: false }));
  }, []);

  const reset = useCallback(() => {
    abortRef.current?.abort();
    setState({
      isStreaming: false,
      streamingContent: '',
      conversationId: null,
      error: null,
    });
  }, []);

  return { ...state, send, cancel, reset };
}

// ---------------------------------------------------------------------------
// useQuickAction
// ---------------------------------------------------------------------------

export function useQuickAction() {
  return useMutation({
    mutationFn: (params: QuickActionParams) => quickAction(params),
  });
}

// ---------------------------------------------------------------------------
// useDeleteConversation
// ---------------------------------------------------------------------------

export function useDeleteConversation() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: (id: string) => deleteConversationApi(id),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: aiKeys.conversations() });
    },
  });
}

// ---------------------------------------------------------------------------
// useUsage
// ---------------------------------------------------------------------------

export function useUsage(period: 'day' | 'week' | 'month' = 'month') {
  return useQuery({
    queryKey: aiKeys.usage(period),
    queryFn: () => fetchUsage(period),
  });
}
