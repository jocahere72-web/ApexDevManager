import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import type {
  ComponentSource,
  EditorSession,
  ChangeLogEntry,
  FormatResponse,
  ComponentType,
} from '@apex-dev-manager/shared-types';
import {
  fetchComponentSource,
  openSession,
  saveDraft,
  applyCode,
  releaseSession,
  formatCode,
  fetchChangeLog,
} from '../../../services/editor.api';

// ---------------------------------------------------------------------------
// Query key factory
// ---------------------------------------------------------------------------

export const editorKeys = {
  all: ['editor'] as const,
  source: (connId: string, componentType: ComponentType, componentId: string) =>
    [...editorKeys.all, 'source', connId, componentType, componentId] as const,
  changeLog: (connId: string, componentType: ComponentType, componentId: string) =>
    [...editorKeys.all, 'changelog', connId, componentType, componentId] as const,
};

// ---------------------------------------------------------------------------
// Query hooks
// ---------------------------------------------------------------------------

/**
 * Fetch the source code for a component.
 */
export function useComponentSource(
  connectionId: string,
  componentType: ComponentType,
  componentId: string,
) {
  return useQuery<ComponentSource>({
    queryKey: editorKeys.source(connectionId, componentType, componentId),
    queryFn: () => fetchComponentSource(connectionId, componentType, componentId),
    enabled: !!connectionId && !!componentType && !!componentId,
    staleTime: 30_000,
  });
}

/**
 * Fetch the change log for a component (paginated).
 */
export function useChangeLog(
  connectionId: string,
  componentType: ComponentType,
  componentId: string,
  limit = 20,
  offset = 0,
) {
  return useQuery<{ entries: ChangeLogEntry[]; total: number }>({
    queryKey: [...editorKeys.changeLog(connectionId, componentType, componentId), limit, offset],
    queryFn: () => fetchChangeLog(connectionId, componentType, componentId, limit, offset),
    enabled: !!connectionId && !!componentType && !!componentId,
    staleTime: 10_000,
  });
}

// ---------------------------------------------------------------------------
// Mutation hooks
// ---------------------------------------------------------------------------

/**
 * Open a new editor session (view or edit with lock).
 */
export function useOpenSession() {
  return useMutation<
    EditorSession,
    Error,
    { connectionId: string; componentType: ComponentType; componentId: string; mode: 'view' | 'edit' }
  >({
    mutationFn: ({ connectionId, componentType, componentId, mode }) =>
      openSession(connectionId, componentType, componentId, mode),
  });
}

/**
 * Save draft content for a session.
 */
export function useSaveDraft() {
  return useMutation<
    EditorSession,
    Error,
    { sessionId: string; draftContent: string; cursorLine?: number; cursorColumn?: number }
  >({
    mutationFn: ({ sessionId, draftContent, cursorLine, cursorColumn }) =>
      saveDraft(sessionId, draftContent, cursorLine, cursorColumn),
  });
}

/**
 * Apply code changes to the database.
 */
export function useApplyCode() {
  const qc = useQueryClient();

  return useMutation<
    { changeLogId: string; appliedAt: string },
    Error,
    {
      sessionId: string;
      code: string;
      connectionId: string;
      componentType: ComponentType;
      componentId: string;
      componentName?: string;
      appId?: string;
      pageId?: number;
      source?: 'manual' | 'ai';
      aiRequestId?: string;
    }
  >({
    mutationFn: ({ sessionId, code, componentName, appId, pageId, source, aiRequestId }) =>
      applyCode(sessionId, code, { componentName, appId, pageId, source, aiRequestId }),
    onSuccess: (_data, variables) => {
      // Invalidate source and change log queries
      qc.invalidateQueries({
        queryKey: editorKeys.source(variables.connectionId, variables.componentType, variables.componentId),
      });
      qc.invalidateQueries({
        queryKey: editorKeys.changeLog(variables.connectionId, variables.componentType, variables.componentId),
      });
    },
  });
}

/**
 * Format source code.
 */
export function useFormatCode() {
  return useMutation<
    FormatResponse,
    Error,
    { source: string; language?: string }
  >({
    mutationFn: ({ source, language }) => formatCode(source, language),
  });
}

/**
 * Release an editor session / lock.
 */
export function useReleaseSession() {
  return useMutation<void, Error, string>({
    mutationFn: (sessionId: string) => releaseSession(sessionId),
  });
}
