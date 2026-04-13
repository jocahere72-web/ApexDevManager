import { apiClient } from '@/lib/api-client';

// ---------------------------------------------------------------------------
// Types
// ---------------------------------------------------------------------------

export type ConnectionType = 'ords' | 'jdbc';
export type ConnectionStatus = 'connected' | 'degraded' | 'disconnected' | 'unknown';
export type Environment = 'dev' | 'test' | 'staging' | 'prod';

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
  ordsUsername?: string | null;
  apexBaseUrl?: string | null;
  apexWorkspace?: string | null;
  workspaceName?: string | null;
  schemaName?: string | null;
  // JDBC-specific
  host?: string;
  port?: number;
  serviceName?: string;
  dbHost?: string | null;
  dbPort?: number | null;
  dbServiceName?: string | null;
  dbUsername?: string | null;
  dbSid?: string | null;
  // Common auth
  username: string;
  description?: string | null;
  config?: {
    host?: string;
    serviceName?: string;
    [key: string]: unknown;
  };
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
  description?: string;
  apexWorkspace?: string;
  schemaName?: string;
  workspaceName?: string;
  apexBaseUrl?: string;
  ordsUsername?: string;
  dbUsername?: string;
  dbPassword?: string;
}

export interface TestConnectionResult {
  success: boolean;
  latencyMs: number;
  message: string;
}

export interface ConnectionSecrets {
  ordsPassword: string | null;
  dbPassword: string | null;
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

  const response = await apiClient.get('/connections', { params });
  // Backend returns { success, data, pagination }. Axios wraps in .data.
  const body = response.data;
  return {
    data: body.data ?? [],
    total: body.pagination?.total ?? 0,
    page: body.pagination?.page ?? 1,
    pageSize: body.pagination?.pageSize ?? 20,
    totalPages: body.pagination?.totalPages ?? 0,
  };
}

export async function fetchConnectionById(id: string): Promise<Connection> {
  const response = await apiClient.get(`/connections/${id}`);
  return response.data.data;
}

export async function fetchConnectionSecrets(id: string): Promise<ConnectionSecrets> {
  const response = await apiClient.get(`/connections/${id}/secrets`);
  return response.data.data;
}

export async function createConnection(payload: ConnectionPayload): Promise<Connection> {
  const response = await apiClient.post('/connections', payload);
  return response.data.data;
}

export async function updateConnection(
  id: string,
  payload: Partial<ConnectionPayload>,
): Promise<Connection> {
  const response = await apiClient.patch(`/connections/${id}`, payload);
  return response.data.data;
}

export async function deleteConnection(id: string): Promise<void> {
  await apiClient.delete(`/connections/${id}`);
}

export async function testConnection(id: string): Promise<TestConnectionResult> {
  const response = await apiClient.post(`/connections/${id}/test`);
  return response.data.data;
}

// Stubs - backend endpoints not yet implemented
export async function fetchHealthHistory(_id: string, _hours = 24): Promise<HealthHistoryEntry[]> {
  console.warn('fetchHealthHistory: endpoint not yet available in backend');
  return [];
}

export async function fetchChangeLog(_id: string): Promise<ChangeLogEntry[]> {
  console.warn('fetchChangeLog: endpoint not yet available in backend');
  return [];
}
