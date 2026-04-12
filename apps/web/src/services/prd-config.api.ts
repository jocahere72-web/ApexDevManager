import apiClient from '../lib/api-client';

// ---------------------------------------------------------------------------
// Types
// ---------------------------------------------------------------------------

export interface PRDConfig {
  id: string;
  tenantId: string;
  name: string;
  exampleDocument: string;
  generationPrompt: string;
  extractionPrompt: string | null;
  validationPrompt: string | null;
  isDefault: boolean;
  createdBy: string | null;
  createdAt: string;
  updatedAt: string;
}

export interface CreateConfigParams {
  name: string;
  exampleDocument: string;
  generationPrompt: string;
  extractionPrompt?: string | null;
  validationPrompt?: string | null;
}

export interface UpdateConfigParams {
  name?: string;
  exampleDocument?: string;
  generationPrompt?: string;
  extractionPrompt?: string | null;
  validationPrompt?: string | null;
}

// ---------------------------------------------------------------------------
// API calls
// ---------------------------------------------------------------------------

export async function fetchConfigs(): Promise<PRDConfig[]> {
  const { data } = await apiClient.get<{ data: PRDConfig[] }>('/prd/configs');
  return data.data;
}

export async function fetchConfig(id: string): Promise<PRDConfig> {
  const { data } = await apiClient.get<{ data: PRDConfig }>(`/prd/configs/${id}`);
  return data.data;
}

export async function fetchDefaultConfig(): Promise<PRDConfig | null> {
  const { data } = await apiClient.get<{ data: PRDConfig | null }>('/prd/configs/default');
  return data.data;
}

export async function createConfig(params: CreateConfigParams): Promise<PRDConfig> {
  const { data } = await apiClient.post<{ data: PRDConfig }>('/prd/configs', params);
  return data.data;
}

export async function updateConfig(id: string, params: UpdateConfigParams): Promise<PRDConfig> {
  const { data } = await apiClient.patch<{ data: PRDConfig }>(`/prd/configs/${id}`, params);
  return data.data;
}

export async function deleteConfig(id: string): Promise<void> {
  await apiClient.delete(`/prd/configs/${id}`);
}

export async function setDefaultConfig(id: string): Promise<PRDConfig> {
  const { data } = await apiClient.post<{ data: PRDConfig }>(`/prd/configs/${id}/set-default`);
  return data.data;
}
