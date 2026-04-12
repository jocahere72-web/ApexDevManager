import apiClient from '../lib/api-client';
import type {
  Release,
  Pipeline,
  DeploymentStatus,
} from '@apex-dev-manager/shared-types';

// ---------------------------------------------------------------------------
// Create release
// ---------------------------------------------------------------------------

export async function createRelease(
  connectionId: string,
  version: string,
  changeSetIds?: string[],
): Promise<Release> {
  const { data } = await apiClient.post<{ data: Release }>(
    '/releases',
    { connectionId, version, changeSetIds },
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// List releases
// ---------------------------------------------------------------------------

export async function listReleases(
  connectionId?: string,
  status?: DeploymentStatus,
  limit?: number,
  offset?: number,
): Promise<{ items: Release[]; total: number }> {
  const { data } = await apiClient.get<{ data: { items: Release[]; total: number } }>(
    '/releases',
    { params: { connectionId, status, limit, offset } },
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Get release
// ---------------------------------------------------------------------------

export async function getRelease(id: string): Promise<Release> {
  const { data } = await apiClient.get<{ data: Release }>(`/releases/${id}`);
  return data.data;
}

// ---------------------------------------------------------------------------
// Get pipeline status
// ---------------------------------------------------------------------------

export async function getPipelineStatus(releaseId: string): Promise<Pipeline> {
  const { data } = await apiClient.get<{ data: Pipeline }>(`/releases/${releaseId}/pipeline`);
  return data.data;
}

// ---------------------------------------------------------------------------
// Build release
// ---------------------------------------------------------------------------

export async function buildRelease(releaseId: string): Promise<Release> {
  const { data } = await apiClient.post<{ data: Release }>(`/releases/${releaseId}/build`);
  return data.data;
}

// ---------------------------------------------------------------------------
// Promote to staging
// ---------------------------------------------------------------------------

export async function promoteToStaging(releaseId: string): Promise<Release> {
  const { data } = await apiClient.post<{ data: Release }>(`/releases/${releaseId}/promote`);
  return data.data;
}

// ---------------------------------------------------------------------------
// Deploy to production
// ---------------------------------------------------------------------------

export async function deployToProduction(releaseId: string): Promise<Release> {
  const { data } = await apiClient.post<{ data: Release }>(`/releases/${releaseId}/deploy`);
  return data.data;
}

// ---------------------------------------------------------------------------
// Rollback
// ---------------------------------------------------------------------------

export async function rollbackRelease(
  releaseId: string,
  reason: string,
): Promise<Release> {
  const { data } = await apiClient.post<{ data: Release }>(
    `/releases/${releaseId}/rollback`,
    { reason },
  );
  return data.data;
}
