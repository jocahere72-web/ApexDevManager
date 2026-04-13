export type IssuePriority = 'low' | 'medium' | 'high' | 'critical';
export type IssueType = 'feature' | 'bug' | 'enhancement' | 'task';
export type IssueStatus =
  | 'intake'
  | 'prd'
  | 'design'
  | 'build'
  | 'review'
  | 'test'
  | 'deploy'
  | 'done';

export interface Issue {
  id: string;
  tenantId: string;
  clientId: string;
  code: string;
  title: string;
  description?: string;
  priority: IssuePriority;
  type: IssueType;
  status: IssueStatus;
  connectionId?: string;
  appId?: number;
  appName?: string;
  pageId?: number;
  pageName?: string;
  prdSessionId?: string;
  changeSetId?: string;
  releaseId?: string;
  testSuiteId?: string;
  assignedTo?: string;
  requestedBy?: string;
  tags: string[];
  createdBy?: string;
  createdAt: string;
  updatedAt: string;
  // Joined fields
  clientName?: string;
  clientCode?: string;
  assignedToName?: string;
  requirementDocuments?: IssueRequirementDocument[];
}

export interface IssueRequirementDocument {
  id: string;
  filename: string;
  mimeType: string;
  fileSize: number;
  createdAt: string;
}

export interface CreateIssueRequest {
  clientId: string;
  appId?: number;
  appName?: string;
  pageId?: number;
  pageName?: string;
  title: string;
  description?: string;
  priority?: IssuePriority;
  type?: IssueType;
  requestedBy?: string;
  tags?: string[];
  requirementDocument?: CreateIssueRequirementDocumentRequest;
}

export interface CreateIssueRequirementDocumentRequest {
  filename: string;
  mimeType?: string;
  fileSize: number;
  contentBase64: string;
}

export interface UpdateIssueRequest {
  title?: string;
  description?: string;
  priority?: IssuePriority;
  type?: IssueType;
  status?: IssueStatus;
  appId?: number | null;
  appName?: string | null;
  pageId?: number | null;
  pageName?: string | null;
  assignedTo?: string | null;
  requestedBy?: string;
  tags?: string[];
  prdSessionId?: string;
  changeSetId?: string;
  releaseId?: string;
  testSuiteId?: string;
}

export const ISSUE_STATUS_FLOW: IssueStatus[] = [
  'intake',
  'prd',
  'design',
  'build',
  'review',
  'test',
  'deploy',
  'done',
];
