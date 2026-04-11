import {
  useQuery,
  useMutation,
  useQueryClient,
  type UseQueryOptions,
} from '@tanstack/react-query';
import {
  fetchConnections,
  fetchConnectionById,
  createConnection,
  updateConnection,
  deleteConnection,
  testConnection,
  fetchHealthHistory,
  fetchChangeLog,
  type ConnectionFilters,
  type Connection,
  type ConnectionPayload,
  type PaginatedConnections,
  type TestConnectionResult,
  type HealthHistoryEntry,
  type ChangeLogEntry,
} from '@/services/connections.api';

// ---------------------------------------------------------------------------
// Query key factory
// ---------------------------------------------------------------------------

export const connectionKeys = {
  all: ['connections'] as const,
  lists: () => [...connectionKeys.all, 'list'] as const,
  list: (filters: ConnectionFilters) => [...connectionKeys.lists(), filters] as const,
  details: () => [...connectionKeys.all, 'detail'] as const,
  detail: (id: string) => [...connectionKeys.details(), id] as const,
  health: (id: string) => [...connectionKeys.all, 'health', id] as const,
  changeLog: (id: string) => [...connectionKeys.all, 'changelog', id] as const,
};

// ---------------------------------------------------------------------------
// Queries
// ---------------------------------------------------------------------------

export function useConnections(
  filters: ConnectionFilters = {},
  options?: Partial<UseQueryOptions<PaginatedConnections>>,
) {
  return useQuery<PaginatedConnections>({
    queryKey: connectionKeys.list(filters),
    queryFn: () => fetchConnections(filters),
    refetchInterval: 30_000,
    ...options,
  });
}

export function useConnection(
  id: string,
  options?: Partial<UseQueryOptions<Connection>>,
) {
  return useQuery<Connection>({
    queryKey: connectionKeys.detail(id),
    queryFn: () => fetchConnectionById(id),
    enabled: !!id,
    ...options,
  });
}

export function useHealthHistory(
  id: string,
  hours = 24,
  options?: Partial<UseQueryOptions<HealthHistoryEntry[]>>,
) {
  return useQuery<HealthHistoryEntry[]>({
    queryKey: connectionKeys.health(id),
    queryFn: () => fetchHealthHistory(id, hours),
    enabled: !!id,
    ...options,
  });
}

export function useChangeLog(
  id: string,
  options?: Partial<UseQueryOptions<ChangeLogEntry[]>>,
) {
  return useQuery<ChangeLogEntry[]>({
    queryKey: connectionKeys.changeLog(id),
    queryFn: () => fetchChangeLog(id),
    enabled: !!id,
    ...options,
  });
}

// ---------------------------------------------------------------------------
// Mutations
// ---------------------------------------------------------------------------

export function useCreateConnection() {
  const queryClient = useQueryClient();

  return useMutation<Connection, Error, ConnectionPayload>({
    mutationFn: createConnection,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: connectionKeys.lists() });
    },
  });
}

export function useUpdateConnection(id: string) {
  const queryClient = useQueryClient();

  return useMutation<Connection, Error, Partial<ConnectionPayload>>({
    mutationFn: (payload) => updateConnection(id, payload),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: connectionKeys.detail(id) });
      queryClient.invalidateQueries({ queryKey: connectionKeys.lists() });
    },
  });
}

export function useDeleteConnection() {
  const queryClient = useQueryClient();

  return useMutation<void, Error, string>({
    mutationFn: deleteConnection,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: connectionKeys.lists() });
    },
  });
}

export function useTestConnection() {
  return useMutation<TestConnectionResult, Error, ConnectionPayload>({
    mutationFn: testConnection,
  });
}
