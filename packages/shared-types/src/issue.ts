export type IssuePriority = 'low' | 'medium' | 'high' | 'critical';
export type IssueType = 'feature' | 'bug' | 'enhancement' | 'task';
export type IssueStatus = 'intake' | 'prd' | 'design' | 'build' | 'review' | 'test' | 'deploy' | 'done';

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
}

export interface CreateIssueRequest {
  clientId: string;
  title: string;
  description?: string;
  priority?: IssuePriority;
  type?: IssueType;
  requestedBy?: string;
  tags?: string[];
}

export interface UpdateIssueRequest {
  title?: string;
  description?: string;
  priority?: IssuePriority;
  type?: IssueType;
  status?: IssueStatus;
  assignedTo?: string | null;
  requestedBy?: string;
  tags?: string[];
  prdSessionId?: string;
  changeSetId?: string;
  releaseId?: string;
  testSuiteId?: string;
}

export const ISSUE_STATUS_FLOW: IssueStatus[] = ['intake', 'prd', 'design', 'build', 'review', 'test', 'deploy', 'done'];
