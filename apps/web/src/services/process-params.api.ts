import { apiClient } from '@/lib/api-client';
import type {
  ProcessParams,
  ProcessStage,
  UpsertProcessParamsRequest,
} from '@apex-dev-manager/shared-types';

// ---------------------------------------------------------------------------
// API Functions
// ---------------------------------------------------------------------------

export async function fetchAllProcessParams(): Promise<ProcessParams[]> {
  const response = await apiClient.get('/process-params');
  return response.data.data ?? [];
}

export async function fetchProcessParams(
  stage: ProcessStage,
): Promise<ProcessParams> {
  const response = await apiClient.get(`/process-params/${stage}`);
  return response.data.data;
}

export async function upsertProcessParams(
  stage: ProcessStage,
  payload: UpsertProcessParamsRequest,
): Promise<ProcessParams> {
  const response = await apiClient.put(`/process-params/${stage}`, payload);
  return response.data.data;
}

export async function resetProcessParams(
  stage: ProcessStage,
): Promise<ProcessParams> {
  const response = await apiClient.delete(`/process-params/${stage}`);
  return response.data.data;
}
