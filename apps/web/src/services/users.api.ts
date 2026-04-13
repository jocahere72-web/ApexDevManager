import { apiClient } from '@/lib/api-client';

// ---------------------------------------------------------------------------
// Types
// ---------------------------------------------------------------------------

export interface UserProfile {
  id: string;
  tenantId: string;
  email: string;
  displayName: string;
  roles: string[];
  isActive: boolean;
  createdAt: string;
  updatedAt: string;
}

export interface UserFilters {
  search?: string;
  role?: string;
  isActive?: boolean;
  page?: number;
  limit?: number;
}

export interface PaginatedUsers {
  data: UserProfile[];
  total: number;
  page: number;
  pageSize: number;
  totalPages: number;
}

// ---------------------------------------------------------------------------
// API Functions
// ---------------------------------------------------------------------------

export async function fetchUsers(filters: UserFilters = {}): Promise<PaginatedUsers> {
  const params: Record<string, string | number | boolean> = {};
  if (filters.search) params.search = filters.search;
  if (filters.role) params.role = filters.role;
  if (filters.isActive !== undefined) params.isActive = filters.isActive;
  params.page = filters.page ?? 1;
  params.limit = filters.limit ?? 100;

  const response = await apiClient.get('/users', { params });
  const body = response.data;
  return {
    data: body.data ?? [],
    total: body.pagination?.totalItems ?? 0,
    page: body.pagination?.page ?? 1,
    pageSize: body.pagination?.pageSize ?? 100,
    totalPages: body.pagination?.totalPages ?? 0,
  };
}

/**
 * Fetch users filtered by role — convenience for assigning developers, DBA review, etc.
 */
export async function fetchUsersByRole(role: string): Promise<UserProfile[]> {
  const result = await fetchUsers({ role, isActive: true, limit: 100 });
  return result.data;
}

// ---------------------------------------------------------------------------
// CRUD
// ---------------------------------------------------------------------------

export interface CreateUserPayload {
  email: string;
  displayName: string;
  roles: string[];
  password: string;
}

export interface UpdateUserPayload {
  displayName?: string;
  roles?: string[];
  isActive?: boolean;
}

export async function fetchUser(id: string): Promise<UserProfile> {
  const response = await apiClient.get(`/users/${id}`);
  return response.data.data;
}

export async function createUser(payload: CreateUserPayload): Promise<UserProfile> {
  const response = await apiClient.post('/users', payload);
  return response.data.data;
}

export async function updateUser(id: string, payload: UpdateUserPayload): Promise<UserProfile> {
  const response = await apiClient.patch(`/users/${id}`, payload);
  return response.data.data;
}

export async function deactivateUser(id: string): Promise<void> {
  await apiClient.delete(`/users/${id}`);
}

export async function unlockUser(id: string): Promise<void> {
  await apiClient.post(`/users/${id}/unlock`);
}
