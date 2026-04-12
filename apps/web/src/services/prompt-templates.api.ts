import { apiClient } from '@/lib/api-client';
import type {
  PromptTemplate,
  CreatePromptTemplateRequest,
  UpdatePromptTemplateRequest,
  PromptCategory,
} from '@apex-dev-manager/shared-types';

// ---------------------------------------------------------------------------
// API Functions
// ---------------------------------------------------------------------------

export async function fetchPromptTemplates(
  category?: PromptCategory,
): Promise<PromptTemplate[]> {
  const params = category ? { category } : {};
  const response = await apiClient.get('/prompt-templates', { params });
  return response.data.data ?? [];
}

export async function fetchPromptTemplate(id: string): Promise<PromptTemplate> {
  const response = await apiClient.get(`/prompt-templates/${id}`);
  return response.data.data;
}

export async function fetchPromptTemplateBySlug(
  slug: string,
): Promise<PromptTemplate | null> {
  const response = await apiClient.get(`/prompt-templates/slug/${slug}`);
  return response.data.data ?? null;
}

export async function createPromptTemplate(
  payload: CreatePromptTemplateRequest,
): Promise<PromptTemplate> {
  const response = await apiClient.post('/prompt-templates', payload);
  return response.data.data;
}

export async function updatePromptTemplate(
  id: string,
  payload: UpdatePromptTemplateRequest,
): Promise<PromptTemplate> {
  const response = await apiClient.patch(`/prompt-templates/${id}`, payload);
  return response.data.data;
}

export async function deletePromptTemplate(id: string): Promise<void> {
  await apiClient.delete(`/prompt-templates/${id}`);
}

export async function resetPromptTemplate(
  slug: string,
): Promise<PromptTemplate> {
  const response = await apiClient.post(`/prompt-templates/${slug}/reset`);
  return response.data.data;
}
