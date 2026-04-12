import { apiClient } from '@/lib/api-client';
import type {
  LLMProvider,
  CreateLLMProviderRequest,
  UpdateLLMProviderRequest,
} from '@apex-dev-manager/shared-types';

// ---------------------------------------------------------------------------
// API Functions
// ---------------------------------------------------------------------------

export async function fetchLLMProviders(): Promise<LLMProvider[]> {
  const response = await apiClient.get('/llm-providers');
  return response.data.data ?? [];
}

export async function fetchActiveProvider(): Promise<LLMProvider | null> {
  const response = await apiClient.get('/llm-providers/active');
  return response.data.data ?? null;
}

export async function fetchLLMProvider(id: string): Promise<LLMProvider> {
  const response = await apiClient.get(`/llm-providers/${id}`);
  return response.data.data;
}

export async function createLLMProvider(
  payload: CreateLLMProviderRequest,
): Promise<LLMProvider> {
  const response = await apiClient.post('/llm-providers', payload);
  return response.data.data;
}

export async function updateLLMProvider(
  id: string,
  payload: UpdateLLMProviderRequest,
): Promise<LLMProvider> {
  const response = await apiClient.patch(`/llm-providers/${id}`, payload);
  return response.data.data;
}

export async function deleteLLMProvider(id: string): Promise<void> {
  await apiClient.delete(`/llm-providers/${id}`);
}

export async function activateLLMProvider(id: string): Promise<LLMProvider> {
  const response = await apiClient.post(`/llm-providers/${id}/activate`);
  return response.data.data;
}

export async function testLLMProvider(
  id: string,
): Promise<{ success: boolean; message: string; latencyMs: number }> {
  const response = await apiClient.post(`/llm-providers/${id}/test`);
  return response.data.data;
}
