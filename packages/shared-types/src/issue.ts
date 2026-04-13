export type IssuePriority = 'low' | 'medium' | 'high' | 'critical';
export type IssueType = 'feature' | 'bug' | 'enhancement' | 'task';
export type IssueStatus =
  | 'draft'
  | 'validation'
  | 'intake'
  | 'prd'
  | 'prd_approval'
  | 'design'
  | 'build'
  | 'test'
  | 'docs'
  | 'done';

export type ApprovalDecision = 'pending' | 'approved' | 'returned';

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
  // AI validation fields
  aiValidationScore?: number;
  aiValidationNotes?: Record<string, unknown>;
  aiValidatedAt?: string;
  // Return tracking
  returnedReason?: string;
  returnedBy?: string;
  returnedAt?: string;
  // Joined fields
  clientName?: string;
  clientCode?: string;
  assignedToName?: string;
  requestedByName?: string;
  requirementDocuments?: IssueRequirementDocument[];
}

export interface IssueApproval {
  id: string;
  tenantId: string;
  issueId: string;
  stage: IssueStatus;
  approverUserId: string;
  approverRole: string;
  approverName?: string;
  decision: ApprovalDecision;
  comments?: string;
  decidedAt?: string;
  createdAt: string;
}

export interface IssueReturnRecord {
  id: string;
  tenantId: string;
  issueId: string;
  fromStage: IssueStatus;
  toStage: IssueStatus;
  returnedBy: string;
  returnedByName?: string;
  reason: string;
  annotations?: Record<string, unknown>;
  createdAt: string;
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
  'draft',
  'validation',
  'intake',
  'prd',
  'prd_approval',
  'design',
  'build',
  'test',
  'docs',
  'done',
];

/** Labels for display in the UI. */
export const ISSUE_STATUS_LABELS: Record<IssueStatus, string> = {
  draft: 'Borrador',
  validation: 'Validación IA',
  intake: 'Recepción',
  prd: 'PRD',
  prd_approval: 'Aprobación PRD',
  design: 'Análisis y Diseño',
  build: 'Construcción',
  test: 'Pruebas',
  docs: 'Documentación',
  done: 'Entregado',
};

/**
 * Valid transitions map. Key = current status, value = array of statuses it can move to.
 * Includes both forward and return transitions.
 */
export const VALID_TRANSITIONS: Record<IssueStatus, IssueStatus[]> = {
  draft: ['validation', 'intake', 'prd'],    // Can skip validation
  validation: ['intake', 'draft'],           // IA approves or returns
  intake: ['prd', 'design', 'build', 'draft'], // Flexible forward or return
  prd: ['prd_approval', 'design', 'intake'], // Can skip approval
  prd_approval: ['design', 'prd'],           // Approve → design, or return → prd
  design: ['build', 'prd_approval', 'prd'],  // Forward or back
  build: ['test', 'design'],                 // Build ok → test, or fails → design
  test: ['docs', 'build'],                   // Tests pass → docs, or fail → build
  docs: ['done', 'test'],                    // Docs approved → done, or issues → test
  done: [],                                  // Terminal state
};

/**
 * Roles allowed to perform transitions from each stage.
 * 'assigned' means the developer assigned to the issue.
 * 'author' means the user who created the issue (requestedBy).
 */
export const TRANSITION_ROLES: Record<IssueStatus, string[]> = {
  draft: ['ops_lead', 'admin'],
  validation: ['system'],                    // Automatic
  intake: ['tech_lead', 'admin'],
  prd: ['developer', 'admin'],
  prd_approval: ['ops_lead', 'tech_lead', 'admin'],
  design: ['developer', 'dba', 'admin'],
  build: ['developer', 'admin'],
  test: ['qa_analyst', 'developer', 'admin'],
  docs: ['developer', 'admin'],
  done: [],
};
