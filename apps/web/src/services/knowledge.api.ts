import apiClient from '../lib/api-client';
import type {
  KnowledgeArticle,
  SearchResult,
  ContextualHelp,
  LearningPath,
  IngestDocRequest,
  KnowledgeCategory,
} from '@apex-dev-manager/shared-types';

const BASE = '/knowledge';

/**
 * Search the knowledge base.
 */
export async function searchKnowledge(
  query: string,
  category?: KnowledgeCategory,
  tags?: string[],
  limit?: number,
): Promise<SearchResult[]> {
  const params = new URLSearchParams({ q: query });
  if (category) params.set('category', category);
  if (tags?.length) params.set('tags', tags.join(','));
  if (limit) params.set('limit', String(limit));

  const { data } = await apiClient.get<{ data: SearchResult[] }>(`${BASE}/search?${params}`);
  return data.data;
}

/**
 * Ingest a document into the knowledge base.
 */
export async function ingestDocument(request: IngestDocRequest): Promise<KnowledgeArticle> {
  const { data } = await apiClient.post<{ data: KnowledgeArticle }>(`${BASE}/ingest`, request);
  return data.data;
}

/**
 * Get contextual help for a component type.
 */
export async function getContextualHelp(componentType: string): Promise<ContextualHelp> {
  const { data } = await apiClient.get<{ data: ContextualHelp }>(`${BASE}/help/${componentType}`);
  return data.data;
}

/**
 * Get learning paths for a role.
 */
export async function getLearningPath(role: string): Promise<LearningPath[]> {
  const { data } = await apiClient.get<{ data: LearningPath[] }>(`${BASE}/learning-path?role=${encodeURIComponent(role)}`);
  return data.data;
}
