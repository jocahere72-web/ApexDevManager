import apiClient from '../lib/api-client';
import type {
  ComponentSource,
  EditorSession,
  ChangeLogEntry,
  FormatResponse,
  ComponentType,
} from '@apex-dev-manager/shared-types';

// ---------------------------------------------------------------------------
// Fetch component source code
// ---------------------------------------------------------------------------

export async function fetchComponentSource(
  connectionId: string,
  componentType: ComponentType,
  componentId: string,
): Promise<ComponentSource> {
  const { data } = await apiClient.get<{ data: ComponentSource }>(
    `/editor/source/${connectionId}/${componentType}/${componentId}`,
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Open an editor session (view or edit with lock)
// ---------------------------------------------------------------------------

export async function openSession(
  connectionId: string,
  componentType: ComponentType,
  componentId: string,
  mode: 'view' | 'edit' = 'view',
): Promise<EditorSession> {
  const { data } = await apiClient.post<{ data: EditorSession }>(
    '/editor/session/open',
    { connectionId, componentType, componentId, mode },
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Save draft content for a session
// ---------------------------------------------------------------------------

export async function saveDraft(
  sessionId: string,
  draftContent: string,
  cursorLine?: number,
  cursorColumn?: number,
): Promise<EditorSession> {
  const { data } = await apiClient.put<{ data: EditorSession }>(
    `/editor/session/${sessionId}/draft`,
    { draftContent, cursorLine, cursorColumn },
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Apply code changes (writes to DB, creates change log)
// ---------------------------------------------------------------------------

export async function applyCode(
  sessionId: string,
  code: string,
  options?: {
    componentName?: string;
    appId?: string;
    pageId?: number;
    source?: 'manual' | 'ai';
    aiRequestId?: string;
  },
): Promise<{ changeLogId: string; appliedAt: string }> {
  const { data } = await apiClient.post<{
    data: { changeLogId: string; appliedAt: string };
  }>(`/editor/session/${sessionId}/apply`, {
    code,
    ...options,
  });
  return data.data;
}

// ---------------------------------------------------------------------------
// Release a session / lock
// ---------------------------------------------------------------------------

export async function releaseSession(
  sessionId: string,
): Promise<void> {
  await apiClient.delete(`/editor/session/${sessionId}`);
}

// ---------------------------------------------------------------------------
// Format code
// ---------------------------------------------------------------------------

export async function formatCode(
  source: string,
  language = 'plsql',
): Promise<FormatResponse> {
  const { data } = await apiClient.post<{ data: FormatResponse }>(
    '/editor/format',
    { source, language },
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Fetch change log for a component
// ---------------------------------------------------------------------------

export async function fetchChangeLog(
  connectionId: string,
  componentType: ComponentType,
  componentId: string,
  limit = 20,
  offset = 0,
): Promise<{ entries: ChangeLogEntry[]; total: number }> {
  const { data } = await apiClient.get<{
    data: { entries: ChangeLogEntry[]; total: number };
  }>(
    `/editor/changelog/${connectionId}/${componentType}/${componentId}`,
    { params: { limit, offset } },
  );
  return data.data;
}
