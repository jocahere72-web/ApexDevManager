import apiClient from '../lib/api-client';
import type {
  ApexApplication,
  ApexPage,
  ApexRegion,
  ApexItem,
  ApexProcess,
  ApexDynamicAction,
  ApplicationTree,
  SearchResult,
  SyncStatus,
} from '@apex-dev-manager/shared-types';

// ---------------------------------------------------------------------------
// NOTE: The shared-types package defines granular component types (ApexRegion,
// ApexItem, etc.). The API returns them under a unified "components" endpoint
// for a given page. We alias the union here for convenience.
// ---------------------------------------------------------------------------
type ApexComponent = ApexRegion | ApexItem | ApexProcess | ApexDynamicAction;

// ---------------------------------------------------------------------------
// Applications
// ---------------------------------------------------------------------------

export async function fetchApplications(connectionId: string): Promise<ApexApplication[]> {
  const { data } = await apiClient.get<{ data: ApexApplication[] }>(
    `/connections/${connectionId}/applications`,
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Pages
// ---------------------------------------------------------------------------

export async function fetchPages(
  connectionId: string,
  appId: string,
): Promise<ApexPage[]> {
  const { data } = await apiClient.get<{ data: ApexPage[] }>(
    `/connections/${connectionId}/applications/${appId}/pages`,
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Components (regions, items, processes, dynamic actions for a page)
// ---------------------------------------------------------------------------

export async function fetchComponents(
  connectionId: string,
  pageId: string,
): Promise<ApexComponent[]> {
  const { data } = await apiClient.get<{ data: ApexComponent[] }>(
    `/connections/${connectionId}/pages/${pageId}/components`,
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Full application tree (deep fetch)
// ---------------------------------------------------------------------------

export async function fetchApplicationTree(
  connectionId: string,
  appId: string,
): Promise<ApplicationTree> {
  const { data } = await apiClient.get<{ data: ApplicationTree }>(
    `/connections/${connectionId}/applications/${appId}/tree`,
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Search
// ---------------------------------------------------------------------------

export async function searchExplorer(
  connectionId: string,
  query: string,
): Promise<SearchResult> {
  const { data } = await apiClient.get<{ data: SearchResult }>(
    `/connections/${connectionId}/explorer/search`,
    { params: { q: query } },
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Sync
// ---------------------------------------------------------------------------

export async function syncConnection(connectionId: string): Promise<SyncStatus> {
  const { data } = await apiClient.post<{ data: SyncStatus }>(
    `/connections/${connectionId}/sync`,
  );
  return data.data;
}

export async function fetchSyncStatus(connectionId: string): Promise<SyncStatus> {
  const { data } = await apiClient.get<{ data: SyncStatus }>(
    `/connections/${connectionId}/sync/status`,
  );
  return data.data;
}
