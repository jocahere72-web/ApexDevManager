import apiClient from '../lib/api-client';
import type {
  FactoryJob,
  FactoryTemplate,
  FactorySpec,
  FactoryJobStatus,
  FactoryComponentType,
  CreateTemplateRequest,
  GenerateBatchRequest,
} from '@apex-dev-manager/shared-types';

const BASE = '/factory';

/**
 * Generate code from a spec.
 */
export async function generateFromSpec(spec: FactorySpec): Promise<FactoryJob> {
  const { data } = await apiClient.post<{ data: FactoryJob }>(`${BASE}/generate`, { spec });
  return data.data;
}

/**
 * Generate code for multiple components in batch.
 */
export async function generateBatch(specs: FactorySpec[], connectionId: string): Promise<FactoryJob[]> {
  const { data } = await apiClient.post<{ data: FactoryJob[] }>(`${BASE}/batch`, { specs, connectionId });
  return data.data;
}

/**
 * List templates.
 */
export async function getTemplates(componentType?: FactoryComponentType): Promise<FactoryTemplate[]> {
  const params = componentType ? `?componentType=${componentType}` : '';
  const { data } = await apiClient.get<{ data: FactoryTemplate[] }>(`${BASE}/templates${params}`);
  return data.data;
}

/**
 * Create a template.
 */
export async function createTemplate(request: CreateTemplateRequest): Promise<FactoryTemplate> {
  const { data } = await apiClient.post<{ data: FactoryTemplate }>(`${BASE}/templates`, request);
  return data.data;
}

/**
 * Delete a template.
 */
export async function deleteTemplate(id: string): Promise<void> {
  await apiClient.delete(`${BASE}/templates/${id}`);
}

/**
 * List generation jobs.
 */
export async function listJobs(status?: FactoryJobStatus): Promise<FactoryJob[]> {
  const params = status ? `?status=${status}` : '';
  const { data } = await apiClient.get<{ data: FactoryJob[] }>(`${BASE}/jobs${params}`);
  return data.data;
}

/**
 * Get job details.
 */
export async function getJob(id: string): Promise<FactoryJob> {
  const { data } = await apiClient.get<{ data: FactoryJob }>(`${BASE}/jobs/${id}`);
  return data.data;
}
