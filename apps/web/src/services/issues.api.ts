import { apiClient } from '@/lib/api-client';

// ---------------------------------------------------------------------------
// Types
// ---------------------------------------------------------------------------

export type IssueStatus =
  | 'intake'
  | 'prd'
  | 'design'
  | 'build'
  | 'review'
  | 'test'
  | 'deploy'
  | 'done';

export type IssuePriority = 'critical' | 'high' | 'medium' | 'low';
export type IssueType = 'feature' | 'bug' | 'enhancement' | 'task';

export const ISSUE_STATUSES: IssueStatus[] = [
  'intake',
  'prd',
  'design',
  'build',
  'review',
  'test',
  'deploy',
  'done',
];

export const STATUS_LABELS: Record<IssueStatus, string> = {
  intake: 'Intake',
  prd: 'PRD',
  design: 'Design',
  build: 'Build',
  review: 'Review',
  test: 'Test',
  deploy: 'Deploy',
  done: 'Done',
};

export interface Issue {
  id: string;
  code: string;
  title: string;
  description: string;
  status: IssueStatus;
  priority: IssuePriority;
  type: IssueType;
  clientId: string;
  clientName: string;
  clientCode: string;
  assignedTo: string | null;
  assignedToName: string | null;
  requestedBy: string | null;
  tags: string[];
  prdSessionId: string | null;
  changeSetId: string | null;
  releaseId: string | null;
  testSuiteId: string | null;
  transitions: IssueTransition[];
  createdAt: string;
  updatedAt: string;
}

export interface IssueSummary {
  id: string;
  code: string;
  title: string;
  status: IssueStatus;
  priority: IssuePriority;
  type: IssueType;
  clientId: string;
  clientName: string;
  clientCode: string;
  assignedTo: string | null;
  assignedToName: string | null;
}

export interface IssueTransition {
  from: IssueStatus | null;
  to: IssueStatus;
  at: string;
  by: string;
}

export interface IssueFilters {
  search?: string;
  clientId?: string;
  status?: IssueStatus | '';
  priority?: IssuePriority | '';
  type?: IssueType | '';
  assignedTo?: string;
  page?: number;
  pageSize?: number;
}

export interface IssuePayload {
  clientId: string;
  title: string;
  description?: string;
  priority: IssuePriority;
  type: IssueType;
  assignedTo?: string | null;
  requestedBy?: string | null;
  tags?: string[];
}

export interface IssueStats {
  total: number;
  byStatus: Record<IssueStatus, number>;
  byPriority: Record<IssuePriority, number>;
  byType: Record<IssueType, number>;
}

export interface PaginatedIssues {
  data: IssueSummary[];
  total: number;
  page: number;
  pageSize: number;
  totalPages: number;
}

// ---------------------------------------------------------------------------
// API Functions
// ---------------------------------------------------------------------------

export async function fetchIssues(
  filters: IssueFilters = {},
): Promise<PaginatedIssues> {
  const params: Record<string, string | number> = {};
  if (filters.search) params.search = filters.search;
  if (filters.clientId) params.clientId = filters.clientId;
  if (filters.status) params.status = filters.status;
  if (filters.priority) params.priority = filters.priority;
  if (filters.type) params.type = filters.type;
  if (filters.assignedTo) params.assignedTo = filters.assignedTo;
  params.page = filters.page ?? 1;
  params.pageSize = filters.pageSize ?? 100;

  const response = await apiClient.get('/issues', { params });
  const body = response.data;
  return {
    data: body.data ?? [],
    total: body.pagination?.total ?? 0,
    page: body.pagination?.page ?? 1,
    pageSize: body.pagination?.pageSize ?? 100,
    totalPages: body.pagination?.totalPages ?? 0,
  };
}

export async function fetchIssue(id: string): Promise<Issue> {
  const response = await apiClient.get(`/issues/${id}`);
  return response.data.data;
}

export async function createIssue(payload: IssuePayload): Promise<Issue> {
  const response = await apiClient.post('/issues', payload);
  return response.data.data;
}

export async function updateIssue(
  id: string,
  payload: Partial<IssuePayload>,
): Promise<Issue> {
  const response = await apiClient.patch(`/issues/${id}`, payload);
  return response.data.data;
}

export async function transitionIssue(
  id: string,
  status: IssueStatus,
): Promise<Issue> {
  const response = await apiClient.post(`/issues/${id}/transition`, { status });
  return response.data.data;
}

export async function fetchIssuesByClient(
  clientId: string,
): Promise<IssueSummary[]> {
  const response = await apiClient.get(`/issues/by-client/${clientId}`);
  return response.data.data ?? [];
}

// ---------------------------------------------------------------------------
// Activity Types
// ---------------------------------------------------------------------------

export interface IssueActivity {
  id: string;
  tenantId: string;
  issueId: string;
  activityType: string;
  description: string;
  artifactType?: string;
  artifactId?: string;
  actorId?: string;
  createdAt: string;
}

export async function fetchIssueActivities(
  issueId: string,
): Promise<IssueActivity[]> {
  const response = await apiClient.get(`/issues/${issueId}/activities`);
  return response.data.data ?? [];
}

export async function linkArtifactToIssue(
  issueId: string,
  artifactType: string,
  artifactId: string,
): Promise<void> {
  await apiClient.post(`/issues/${issueId}/link`, { artifactType, artifactId });
}

export async function fetchIssueStats(clientId?: string): Promise<IssueStats> {
  const params: Record<string, string> = {};
  if (clientId) params.clientId = clientId;
  const response = await apiClient.get('/issues/stats', { params });
  return response.data.data;
}
