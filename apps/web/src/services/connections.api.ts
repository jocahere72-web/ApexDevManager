import { apiClient } from '@/lib/api-client';

// ---------------------------------------------------------------------------
// Types
// ---------------------------------------------------------------------------

export type ConnectionType = 'ORDS' | 'JDBC';
export type ConnectionStatus = 'connected' | 'degraded' | 'disconnected' | 'unknown';
export type Environment = 'development' | 'staging' | 'production';

export interface Connection {
  id: string;
  name: string;
  type: ConnectionType;
  environment: Environment;
  status: ConnectionStatus;
  latencyMs: number | null;
  lastCheckAt: string | null;
  uptime: number | null;
  failureCount: number;
  tags: string[];
  // ORDS-specific
  ordsBaseUrl?: string;
  // JDBC-specific
  host?: string;
  port?: number;
  serviceName?: string;
  // Common auth
  username: string;
  createdAt: string;
  updatedAt: string;
}

export interface ConnectionSummary {
  id: string;
  name: string;
  type: ConnectionType;
  environment: Environment;
  status: ConnectionStatus;
  latencyMs: number | null;
  lastCheckAt: string | null;
}

export interface ConnectionFilters {
  search?: string;
  environment?: Environment | '';
  status?: ConnectionStatus | '';
  page?: number;
  pageSize?: number;
}

export interface ConnectionPayload {
  name: string;
  type: ConnectionType;
  environment: Environment;
  username: string;
  password: string;
  tags: string[];
  ordsBaseUrl?: string;
  host?: string;
  port?: number;
  serviceName?: string;
}

export interface TestConnectionResult {
  success: boolean;
  latencyMs: number;
  message: string;
}

export interface HealthHistoryEntry {
  timestamp: string;
  status: ConnectionStatus;
  latencyMs: number | null;
}

export interface ChangeLogEntry {
  id: string;
  action: string;
  changedBy: string;
  changedAt: string;
  details: string;
}

export interface PaginatedConnections {
  data: ConnectionSummary[];
  total: number;
  page: number;
  pageSize: number;
  totalPages: number;
}

// ---------------------------------------------------------------------------
// API Functions
// ---------------------------------------------------------------------------

export async function fetchConnections(
  filters: ConnectionFilters = {},
): Promise<PaginatedConnections> {
  const params: Record<string, string | number> = {};
  if (filters.search) params.search = filters.search;
  if (filters.environment) params.environment = filters.environment;
  if (filters.status) params.status = filters.status;
  params.page = filters.page ?? 1;
  params.pageSize = filters.pageSize ?? 20;

  const { data } = await apiClient.get<PaginatedConnections>('/connections', { params });
  return data;
}

export async function fetchConnectionById(id: string): Promise<Connection> {
  const { data } = await apiClient.get<Connection>(`/connections/${id}`);
  return data;
}

export async function createConnection(payload: ConnectionPayload): Promise<Connection> {
  const { data } = await apiClient.post<Connection>('/connections', payload);
  return data;
}

export async function updateConnection(
  id: string,
  payload: Partial<ConnectionPayload>,
): Promise<Connection> {
  const { data } = await apiClient.put<Connection>(`/connections/${id}`, payload);
  return data;
}

export async function deleteConnection(id: string): Promise<void> {
  await apiClient.delete(`/connections/${id}`);
}

export async function testConnection(
  payload: ConnectionPayload,
): Promise<TestConnectionResult> {
  const { data } = await apiClient.post<TestConnectionResult>('/connections/test', payload);
  return data;
}

export async function fetchHealthHistory(
  id: string,
  hours = 24,
): Promise<HealthHistoryEntry[]> {
  const { data } = await apiClient.get<HealthHistoryEntry[]>(
    `/connections/${id}/health-history`,
    { params: { hours } },
  );
  return data;
}

export async function fetchChangeLog(id: string): Promise<ChangeLogEntry[]> {
  const { data } = await apiClient.get<ChangeLogEntry[]>(`/connections/${id}/changelog`);
  return data;
}
