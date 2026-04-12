import apiClient from '../lib/api-client';
import type {
  ChangeSet,
  ChangeSetObject,
  ChangeSetStatus,
  ConflictDetail,
} from '@apex-dev-manager/shared-types';

// ---------------------------------------------------------------------------
// Create a new change set
// ---------------------------------------------------------------------------

export async function createChangeSet(
  connectionId: string,
  name: string,
  description?: string,
): Promise<ChangeSet> {
  const { data } = await apiClient.post<{ data: ChangeSet }>(
    '/change-manager',
    { connectionId, name, description },
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// List change sets
// ---------------------------------------------------------------------------

export async function listChangeSets(
  connectionId?: string,
  status?: ChangeSetStatus,
  limit?: number,
  offset?: number,
): Promise<{ items: ChangeSet[]; total: number }> {
  const { data } = await apiClient.get<{ data: { items: ChangeSet[]; total: number } }>(
    '/change-manager',
    { params: { connectionId, status, limit, offset } },
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Get a single change set
// ---------------------------------------------------------------------------

export async function getChangeSet(id: string): Promise<ChangeSet> {
  const { data } = await apiClient.get<{ data: ChangeSet }>(`/change-manager/${id}`);
  return data.data;
}

// ---------------------------------------------------------------------------
// Add object to change set
// ---------------------------------------------------------------------------

export async function addObject(
  changeSetId: string,
  object: ChangeSetObject,
): Promise<ChangeSet> {
  const { data } = await apiClient.post<{ data: ChangeSet }>(
    `/change-manager/${changeSetId}/objects`,
    object,
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Remove object from change set
// ---------------------------------------------------------------------------

export async function removeObject(
  changeSetId: string,
  objectIndex: number,
): Promise<ChangeSet> {
  const { data } = await apiClient.delete<{ data: ChangeSet }>(
    `/change-manager/${changeSetId}/objects/${objectIndex}`,
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Detect conflicts
// ---------------------------------------------------------------------------

export async function detectConflicts(changeSetId: string): Promise<ConflictDetail[]> {
  const { data } = await apiClient.post<{ data: ConflictDetail[] }>(
    `/change-manager/${changeSetId}/detect-conflicts`,
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Submit for review
// ---------------------------------------------------------------------------

export async function submitForReview(changeSetId: string): Promise<ChangeSet> {
  const { data } = await apiClient.post<{ data: ChangeSet }>(
    `/change-manager/${changeSetId}/submit`,
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Approve change set
// ---------------------------------------------------------------------------

export async function approveChangeSet(changeSetId: string): Promise<ChangeSet> {
  const { data } = await apiClient.post<{ data: ChangeSet }>(
    `/change-manager/${changeSetId}/approve`,
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Reject change set
// ---------------------------------------------------------------------------

export async function rejectChangeSet(changeSetId: string): Promise<ChangeSet> {
  const { data } = await apiClient.post<{ data: ChangeSet }>(
    `/change-manager/${changeSetId}/reject`,
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Apply change set
// ---------------------------------------------------------------------------

export async function applyChangeSet(changeSetId: string): Promise<ChangeSet> {
  const { data } = await apiClient.post<{ data: ChangeSet }>(
    `/change-manager/${changeSetId}/apply`,
  );
  return data.data;
}
