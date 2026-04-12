import apiClient from '../lib/api-client';
import type {
  DashboardOverview,
  Alert,
  Incident,
  IncidentStatus,
  CreateIncidentRequest,
  ResolveIncidentRequest,
} from '@apex-dev-manager/shared-types';

const BASE = '/api/v1/dashboard';

/**
 * Get main dashboard overview.
 */
export async function getDashboardOverview(): Promise<DashboardOverview> {
  const { data } = await apiClient.get<{ data: DashboardOverview }>(`${BASE}/overview`);
  return data.data;
}

/**
 * Get active alerts.
 */
export async function getAlerts(acknowledged?: boolean): Promise<Alert[]> {
  const params = acknowledged !== undefined ? `?acknowledged=${acknowledged}` : '';
  const { data } = await apiClient.get<{ data: Alert[] }>(`${BASE}/alerts${params}`);
  return data.data;
}

/**
 * Get incidents.
 */
export async function getIncidents(status?: IncidentStatus): Promise<Incident[]> {
  const params = status ? `?status=${status}` : '';
  const { data } = await apiClient.get<{ data: Incident[] }>(`${BASE}/incidents${params}`);
  return data.data;
}

/**
 * Create an incident.
 */
export async function createIncident(request: CreateIncidentRequest): Promise<Incident> {
  const { data } = await apiClient.post<{ data: Incident }>(`${BASE}/incidents`, request);
  return data.data;
}

/**
 * Resolve an incident.
 */
export async function resolveIncident(id: string, request: ResolveIncidentRequest): Promise<Incident> {
  const { data } = await apiClient.post<{ data: Incident }>(`${BASE}/incidents/${id}/resolve`, request);
  return data.data;
}
