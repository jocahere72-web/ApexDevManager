import apiClient from '../lib/api-client';
import type {
  PRDSession,
  PRDSource,
  PRDSection,
  ExtractionData,
  ValidationResult,
  PageGenerationJob,
} from '@apex-dev-manager/shared-types';

// ---------------------------------------------------------------------------
// PRD Sessions
// ---------------------------------------------------------------------------

export interface CreateSessionParams {
  title: string;
  appId?: number;
}

export async function createSession(params: CreateSessionParams): Promise<PRDSession> {
  const { data } = await apiClient.post<{ data: PRDSession }>('/prd/sessions', params);
  return data.data;
}

export interface ListSessionsParams {
  page?: number;
  limit?: number;
  status?: string;
  appId?: number;
}

export interface SessionListResponse {
  sessions: PRDSession[];
  total: number;
}

export async function fetchSessions(params: ListSessionsParams = {}): Promise<SessionListResponse> {
  const { data } = await apiClient.get<{
    data: PRDSession[];
    pagination: { totalItems: number };
  }>('/prd/sessions', { params });

  return {
    sessions: data.data,
    total: data.pagination.totalItems,
  };
}

export async function fetchSession(id: string): Promise<PRDSession> {
  const { data } = await apiClient.get<{ data: PRDSession }>(`/prd/sessions/${id}`);
  return data.data;
}

// ---------------------------------------------------------------------------
// Sources
// ---------------------------------------------------------------------------

export interface UploadSourceParams {
  filename: string;
  mimeType: string;
  fileSize: number;
  storageKey: string;
}

export async function uploadSource(
  sessionId: string,
  params: UploadSourceParams,
): Promise<PRDSource> {
  const { data } = await apiClient.post<{ data: PRDSource }>(
    `/prd/sessions/${sessionId}/sources`,
    params,
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Extract Requirements
// ---------------------------------------------------------------------------

export interface ExtractParams {
  focusAreas?: string[];
  language?: string;
}

export async function extractRequirements(
  sessionId: string,
  params: ExtractParams = {},
): Promise<ExtractionData> {
  const { data } = await apiClient.post<{ data: ExtractionData }>(
    `/prd/sessions/${sessionId}/extract`,
    params,
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Generate Sections
// ---------------------------------------------------------------------------

export interface GenerateParams {
  templateStyle?: 'standard' | 'lean' | 'detailed';
  customSections?: string[];
}

export async function generateSections(
  sessionId: string,
  params: GenerateParams = {},
): Promise<PRDSection[]> {
  const { data } = await apiClient.post<{ data: PRDSection[] }>(
    `/prd/sessions/${sessionId}/generate`,
    params,
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Validate PRD
// ---------------------------------------------------------------------------

export interface ValidateParams {
  checkCategories?: string[];
}

export async function validatePRD(
  sessionId: string,
  params: ValidateParams = {},
): Promise<ValidationResult> {
  const { data } = await apiClient.post<{ data: ValidationResult }>(
    `/prd/sessions/${sessionId}/validate`,
    params,
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Export PRD
// ---------------------------------------------------------------------------

export interface ExportParams {
  format?: 'markdown' | 'yaml' | 'json';
  includeMeta?: boolean;
  includeExtractionData?: boolean;
}

export interface ExportResult {
  content: string;
  format: string;
  filename: string;
}

export async function exportPRD(
  sessionId: string,
  params: ExportParams = {},
): Promise<ExportResult> {
  const { data } = await apiClient.post<{ data: ExportResult }>(
    `/prd/sessions/${sessionId}/export`,
    params,
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Update Section
// ---------------------------------------------------------------------------

export interface UpdateSectionParams {
  title?: string;
  content?: string;
  generatedBy?: 'ai' | 'user' | 'hybrid';
}

export async function updateSection(
  sectionId: string,
  params: UpdateSectionParams,
): Promise<PRDSection> {
  const { data } = await apiClient.put<{ data: PRDSection }>(`/prd/sections/${sectionId}`, params);
  return data.data;
}

// ---------------------------------------------------------------------------
// Page Generation (PRD-to-Page)
// ---------------------------------------------------------------------------

export interface GeneratePageParams {
  prdSessionId?: string;
  connectionId?: string;
  appId?: number;
  inputType: 'prd_section' | 'freeform' | 'requirements';
  inputContent: string;
}

export async function generatePage(params: GeneratePageParams): Promise<PageGenerationJob> {
  const { data } = await apiClient.post<{ data: PageGenerationJob }>(
    '/page-gen/generate',
    params,
  );
  return data.data;
}

export interface ListJobsParams {
  page?: number;
  limit?: number;
  status?: string;
}

export interface JobListResponse {
  jobs: PageGenerationJob[];
  total: number;
}

export async function fetchJobs(params: ListJobsParams = {}): Promise<JobListResponse> {
  const { data } = await apiClient.get<{
    data: PageGenerationJob[];
    pagination: { totalItems: number };
  }>('/page-gen/jobs', { params });

  return {
    jobs: data.data,
    total: data.pagination.totalItems,
  };
}

export async function fetchJob(jobId: string): Promise<PageGenerationJob> {
  const { data } = await apiClient.get<{ data: PageGenerationJob }>(`/page-gen/jobs/${jobId}`);
  return data.data;
}

export async function applyPage(jobId: string): Promise<PageGenerationJob> {
  const { data } = await apiClient.post<{ data: PageGenerationJob }>(
    `/page-gen/jobs/${jobId}/apply`,
  );
  return data.data;
}
