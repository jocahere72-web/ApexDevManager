import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import type {
  ApexApplication,
  ApexPage,
  ApplicationTree,
  SearchResult,
  SyncStatus,
} from '@apex-dev-manager/shared-types';
import {
  fetchApplications,
  fetchPages,
  fetchComponents,
  fetchApplicationTree,
  searchExplorer,
  syncConnection as syncConnectionApi,
  fetchSyncStatus,
} from '../../../services/explorer.api';

// ---------------------------------------------------------------------------
// Query key factory
// ---------------------------------------------------------------------------

export const explorerKeys = {
  all: ['explorer'] as const,
  applications: (connId: string) => [...explorerKeys.all, 'applications', connId] as const,
  pages: (connId: string, appId: string) =>
    [...explorerKeys.all, 'pages', connId, appId] as const,
  components: (connId: string, pageId: string) =>
    [...explorerKeys.all, 'components', connId, pageId] as const,
  tree: (connId: string, appId: string) =>
    [...explorerKeys.all, 'tree', connId, appId] as const,
  search: (connId: string, term: string) =>
    [...explorerKeys.all, 'search', connId, term] as const,
  syncStatus: (connId: string) => [...explorerKeys.all, 'syncStatus', connId] as const,
};

// ---------------------------------------------------------------------------
// Query hooks
// ---------------------------------------------------------------------------

export function useApplications(connId: string) {
  return useQuery<ApexApplication[]>({
    queryKey: explorerKeys.applications(connId),
    queryFn: () => fetchApplications(connId),
    enabled: !!connId,
  });
}

export function usePages(connId: string, appId: string) {
  return useQuery<ApexPage[]>({
    queryKey: explorerKeys.pages(connId, appId),
    queryFn: () => fetchPages(connId, appId),
    enabled: !!connId && !!appId,
  });
}

export function useComponents(connId: string, pageId: string) {
  return useQuery({
    queryKey: explorerKeys.components(connId, pageId),
    queryFn: () => fetchComponents(connId, pageId),
    enabled: !!connId && !!pageId,
  });
}

/**
 * Fetches a full application tree. Typically triggered on-demand (e.g. when
 * the user double-clicks an application node) rather than eagerly.
 */
export function useApplicationTree(connId: string, appId: string) {
  return useQuery<ApplicationTree>({
    queryKey: explorerKeys.tree(connId, appId),
    queryFn: () => fetchApplicationTree(connId, appId),
    enabled: !!connId && !!appId,
  });
}

/**
 * Search hook. Disabled until `term` reaches the minimum length (2 chars).
 */
export function useExplorerSearch(connId: string, term: string) {
  return useQuery<SearchResult>({
    queryKey: explorerKeys.search(connId, term),
    queryFn: () => searchExplorer(connId, term),
    enabled: !!connId && term.length >= 2,
    // Keep previous results visible while fetching new ones
    placeholderData: (prev) => prev,
  });
}

// ---------------------------------------------------------------------------
// Mutation hooks
// ---------------------------------------------------------------------------

export function useSyncConnection() {
  const qc = useQueryClient();
  return useMutation<SyncStatus, Error, string>({
    mutationFn: (connectionId: string) => syncConnectionApi(connectionId),
    onSuccess: (_data, connectionId) => {
      // Invalidate all explorer data for this connection so it refetches
      qc.invalidateQueries({ queryKey: [...explorerKeys.all] });
      qc.invalidateQueries({ queryKey: explorerKeys.syncStatus(connectionId) });
    },
  });
}

export function useSyncStatus(connId: string) {
  return useQuery<SyncStatus>({
    queryKey: explorerKeys.syncStatus(connId),
    queryFn: () => fetchSyncStatus(connId),
    enabled: !!connId,
    refetchInterval: 15_000, // poll every 15 s
  });
}
