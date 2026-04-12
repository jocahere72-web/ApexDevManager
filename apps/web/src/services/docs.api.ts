import apiClient from '../lib/api-client';
import type {
  DocGenRequest,
  GeneratedDoc,
  DocExportFormat,
} from '@apex-dev-manager/shared-types';

// ---------------------------------------------------------------------------
// Generate documentation
// ---------------------------------------------------------------------------

export async function generateDocs(request: DocGenRequest): Promise<GeneratedDoc> {
  const { data } = await apiClient.post<{ data: GeneratedDoc }>('/auto-docs/generate', request);
  return data.data;
}

// ---------------------------------------------------------------------------
// Generate API documentation
// ---------------------------------------------------------------------------

export async function generateAPIDoc(connectionId: string): Promise<GeneratedDoc> {
  const { data } = await apiClient.post<{ data: GeneratedDoc }>(
    '/auto-docs/generate-api',
    { connectionId },
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// List generated docs
// ---------------------------------------------------------------------------

export async function listDocs(): Promise<GeneratedDoc[]> {
  const { data } = await apiClient.get<{ data: GeneratedDoc[] }>('/auto-docs/docs');
  return data.data;
}

// ---------------------------------------------------------------------------
// Get single doc
// ---------------------------------------------------------------------------

export async function getDoc(docId: string): Promise<GeneratedDoc> {
  const { data } = await apiClient.get<{ data: GeneratedDoc }>(`/auto-docs/docs/${docId}`);
  return data.data;
}

// ---------------------------------------------------------------------------
// Export doc
// ---------------------------------------------------------------------------

export async function exportDoc(
  docId: string,
  format: DocExportFormat = 'markdown',
): Promise<{ content: string; mimeType: string }> {
  const { data } = await apiClient.post<{ data: { content: string; mimeType: string } }>(
    `/auto-docs/docs/${docId}/export`,
    { format },
  );
  return data.data;
}
