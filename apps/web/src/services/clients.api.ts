import { apiClient } from '@/lib/api-client';

// ---------------------------------------------------------------------------
// Types
// ---------------------------------------------------------------------------

export interface Client {
  id: string;
  name: string;
  code: string;
  description: string;
  connectionId: string | null;
  connectionName: string | null;
  appId: number | null;
  contactName: string | null;
  contactEmail: string | null;
  contactPhone: string | null;
  issueCount: number;
  createdAt: string;
  updatedAt: string;
}

export interface ClientSummary {
  id: string;
  name: string;
  code: string;
  description: string;
  connectionId: string | null;
  connectionName: string | null;
  appId: number | null;
  contactName: string | null;
  contactEmail: string | null;
  issueCount: number;
}

export interface ClientFilters {
  search?: string;
  page?: number;
  pageSize?: number;
  isActive?: boolean;
}

export interface ClientPayload {
  name: string;
  code: string;
  description?: string;
  connectionId?: string | null;
  contactName?: string | null;
  contactEmail?: string | null;
  contactPhone?: string | null;
}

export interface PaginatedClients {
  data: ClientSummary[];
  total: number;
  page: number;
  pageSize: number;
  totalPages: number;
}

// ---------------------------------------------------------------------------
// API Functions
// ---------------------------------------------------------------------------

export async function fetchClients(filters: ClientFilters = {}): Promise<PaginatedClients> {
  const params: Record<string, string | number> = {};
  if (filters.search) params.search = filters.search;
  if (filters.isActive !== undefined) params.isActive = String(filters.isActive);
  params.page = filters.page ?? 1;
  params.pageSize = filters.pageSize ?? 20;

  const response = await apiClient.get('/clients', { params });
  const body = response.data;
  return {
    data: body.data ?? [],
    total: body.pagination?.total ?? 0,
    page: body.pagination?.page ?? 1,
    pageSize: body.pagination?.pageSize ?? 20,
    totalPages: body.pagination?.totalPages ?? 0,
  };
}

export async function fetchClient(id: string): Promise<Client> {
  const response = await apiClient.get(`/clients/${id}`);
  return response.data.data;
}

export async function createClient(payload: ClientPayload): Promise<Client> {
  const response = await apiClient.post('/clients', payload);
  return response.data.data;
}

export async function updateClient(id: string, payload: Partial<ClientPayload>): Promise<Client> {
  const response = await apiClient.patch(`/clients/${id}`, payload);
  return response.data.data;
}

export async function deleteClient(id: string): Promise<void> {
  await apiClient.delete(`/clients/${id}`);
}
