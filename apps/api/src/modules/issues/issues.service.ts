import { logger } from '../../lib/logger.js';
import { tenantQuery } from '../../lib/tenant-db.js';
import { NotFoundError, ValidationError } from '../../lib/errors.js';
import type { CreateIssueInput, UpdateIssueInput, ListIssuesQuery } from './issues.validation.js';
import type { PoolClient } from 'pg';
import type { Issue, IssueRequirementDocument, IssueStatus, IssueApproval, IssueReturnRecord } from '@apex-dev-manager/shared-types';
import { ISSUE_STATUS_FLOW, VALID_TRANSITIONS } from '@apex-dev-manager/shared-types';

// ── Row mapper ──────────────────────────────────────────────────────────────
function rowToIssue(row: Record<string, unknown>): Issue {
  return {
    id: row.id as string,
    tenantId: row.tenant_id as string,
    clientId: row.client_id as string,
    code: row.code as string,
    title: row.title as string,
    description: (row.description as string) ?? undefined,
    priority: row.priority as Issue['priority'],
    type: row.type as Issue['type'],
    status: row.status as Issue['status'],
    connectionId: (row.connection_id as string) ?? undefined,
    appId: (row.app_id as number) ?? undefined,
    appName: (row.app_name as string) ?? undefined,
    pageId: (row.page_id as number) ?? undefined,
    pageName: (row.page_name as string) ?? undefined,
    prdSessionId: (row.prd_session_id as string) ?? undefined,
    changeSetId: (row.change_set_id as string) ?? undefined,
    releaseId: (row.release_id as string) ?? undefined,
    testSuiteId: (row.test_suite_id as string) ?? undefined,
    assignedTo: (row.assigned_to as string) ?? undefined,
    requestedBy: (row.requested_by as string) ?? undefined,
    tags: (row.tags as string[]) ?? [],
    createdBy: (row.created_by as string) ?? undefined,
    createdAt: (row.created_at as Date).toISOString(),
    updatedAt: (row.updated_at as Date).toISOString(),
    // AI validation fields
    aiValidationScore: (row.ai_validation_score as number) ?? undefined,
    aiValidationNotes: (row.ai_validation_notes as Record<string, unknown>) ?? undefined,
    aiValidatedAt: row.ai_validated_at ? (row.ai_validated_at as Date).toISOString() : undefined,
    // Return tracking
    returnedReason: (row.returned_reason as string) ?? undefined,
    returnedBy: (row.returned_by as string) ?? undefined,
    returnedAt: row.returned_at ? (row.returned_at as Date).toISOString() : undefined,
    // Joined fields
    clientName: (row.client_name as string) ?? undefined,
    clientCode: (row.client_code as string) ?? undefined,
    assignedToName: (row.assigned_to_name as string) ?? undefined,
  };
}

function rowToRequirementDocument(row: Record<string, unknown>): IssueRequirementDocument {
  return {
    id: row.id as string,
    filename: row.filename as string,
    mimeType: row.mime_type as string,
    fileSize: row.file_size as number,
    createdAt: (row.created_at as Date).toISOString(),
  };
}

// ── Audit Logging ───────────────────────────────────────────────────────────
async function logAudit(
  tenantId: string,
  actorId: string,
  action: string,
  targetId: string,
  details?: Record<string, unknown>,
  client?: PoolClient,
): Promise<void> {
  try {
    await tenantQuery(
      client,
      `INSERT INTO audit_events (tenant_id, user_id, event_type, action, entity_type, entity_id, event_payload, created_at)
       VALUES ($1, $2, 'issue_management', $3, 'issue', $4, $5, NOW())`,
      [tenantId, actorId, action, targetId, details ? JSON.stringify(details) : null],
    );
  } catch (err) {
    logger.error({ err, tenantId, actorId, action, targetId }, 'Failed to write audit log');
  }
}

// ── Select columns (with JOINs) ────────────────────────────────────────────
const SELECT_WITH_JOINS = `
  i.id, i.tenant_id, i.client_id, i.code, i.title, i.description,
  i.priority, i.type, i.status, i.connection_id, i.app_id, i.app_name,
  i.page_id, i.page_name,
  i.prd_session_id, i.change_set_id, i.release_id, i.test_suite_id,
  i.assigned_to, i.requested_by, i.tags, i.created_by, i.created_at, i.updated_at,
  i.ai_validation_score, i.ai_validation_notes, i.ai_validated_at,
  i.returned_reason, i.returned_by, i.returned_at,
  c.name AS client_name, c.code AS client_code,
  u.display_name AS assigned_to_name
`;

const FROM_WITH_JOINS = `
  FROM issues i
  LEFT JOIN clients c ON i.client_id = c.id
  LEFT JOIN users u ON i.assigned_to = u.id
`;

// ── Create Issue ────────────────────────────────────────────────────────────
export async function createIssue(
  tenantId: string,
  data: CreateIssueInput,
  actorId: string,
  client?: PoolClient,
): Promise<Issue> {
  // Fetch client to get code, connectionId, appId
  const clientResult = await tenantQuery(
    client,
    `SELECT code, connection_id, app_id FROM clients WHERE tenant_id = $1 AND id = $2`,
    [tenantId, data.clientId],
  );

  if (clientResult.rowCount === 0) {
    throw new NotFoundError('Client not found');
  }

  const clientRow = clientResult.rows[0];
  const clientCode = clientRow.code as string;
  const inheritedConnectionId = clientRow.connection_id as string | null;
  const inheritedAppId = clientRow.app_id as number | null;
  const selectedAppId = data.appId ?? inheritedAppId;

  // Get next sequence number
  const seqResult = await tenantQuery(
    client,
    `INSERT INTO issue_sequences (tenant_id, client_id, last_seq)
     VALUES ($1, $2, 1)
     ON CONFLICT (tenant_id, client_id)
     DO UPDATE SET last_seq = issue_sequences.last_seq + 1
     RETURNING last_seq`,
    [tenantId, data.clientId],
  );

  const seq = seqResult.rows[0].last_seq as number;
  const code = `${clientCode}-${String(seq).padStart(3, '0')}`;

  // Insert issue
  const result = await tenantQuery(
    client,
    `INSERT INTO issues (
       tenant_id, client_id, code, title, description,
       priority, type, status, connection_id, app_id, app_name, page_id, page_name,
       requested_by, tags, created_by
     )
     VALUES ($1, $2, $3, $4, $5, $6, $7, 'draft', $8, $9, $10, $11, $12, $13, $14, $15)
     RETURNING id`,
    [
      tenantId,
      data.clientId,
      code,
      data.title,
      data.description ?? null,
      data.priority ?? 'medium',
      data.type ?? 'feature',
      inheritedConnectionId,
      selectedAppId,
      data.appName ?? null,
      data.pageId ?? null,
      data.pageName ?? null,
      data.requestedBy ?? null,
      data.tags ?? [],
      actorId,
    ],
  );

  const issueId = result.rows[0].id as string;

  if (data.requirementDocument) {
    await tenantQuery(
      client,
      `INSERT INTO issue_documents (
         tenant_id, issue_id, filename, mime_type, file_size, content, created_by
       )
       VALUES ($1, $2, $3, $4, $5, $6, $7)`,
      [
        tenantId,
        issueId,
        data.requirementDocument.filename,
        data.requirementDocument.mimeType,
        data.requirementDocument.fileSize,
        Buffer.from(data.requirementDocument.contentBase64, 'base64'),
        actorId,
      ],
    );

    await logActivity(
      tenantId,
      issueId,
      'artifact_linked',
      `Archivo de requerimientos agregado: ${data.requirementDocument.filename}`,
      undefined,
      undefined,
      actorId,
      client,
    );
  }

  await logAudit(
    tenantId,
    actorId,
    'issue.created',
    issueId,
    {
      code,
      title: data.title,
      clientId: data.clientId,
      appId: selectedAppId,
      appName: data.appName,
      pageId: data.pageId,
      pageName: data.pageName,
    },
    client,
  );

  logger.info({ tenantId, issueId, code }, 'Issue created');

  // Return full issue with joins
  return getIssueById(tenantId, issueId, client);
}

// ── List Issues ─────────────────────────────────────────────────────────────
export async function listIssues(
  tenantId: string,
  filters: ListIssuesQuery,
  client?: PoolClient,
): Promise<{ issues: Issue[]; total: number }> {
  const conditions: string[] = ['i.tenant_id = $1', 'i.deleted_at IS NULL'];
  const params: unknown[] = [tenantId];
  let paramIndex = 2;

  if (filters.clientId) {
    conditions.push(`i.client_id = $${paramIndex}`);
    params.push(filters.clientId);
    paramIndex++;
  }

  if (filters.status) {
    conditions.push(`i.status = $${paramIndex}`);
    params.push(filters.status);
    paramIndex++;
  }

  if (filters.priority) {
    conditions.push(`i.priority = $${paramIndex}`);
    params.push(filters.priority);
    paramIndex++;
  }

  if (filters.type) {
    conditions.push(`i.type = $${paramIndex}`);
    params.push(filters.type);
    paramIndex++;
  }

  if (filters.assignedTo) {
    conditions.push(`i.assigned_to = $${paramIndex}`);
    params.push(filters.assignedTo);
    paramIndex++;
  }

  if (filters.search) {
    conditions.push(
      `(i.title ILIKE $${paramIndex} OR i.description ILIKE $${paramIndex} OR i.code ILIKE $${paramIndex})`,
    );
    params.push(`%${filters.search}%`);
    paramIndex++;
  }

  const whereClause = conditions.join(' AND ');
  const offset = (filters.page - 1) * filters.limit;

  const [dataResult, countResult] = await Promise.all([
    tenantQuery(
      client,
      `SELECT ${SELECT_WITH_JOINS}
       ${FROM_WITH_JOINS}
       WHERE ${whereClause}
       ORDER BY i.updated_at DESC
       LIMIT $${paramIndex} OFFSET $${paramIndex + 1}`,
      [...params, filters.limit, offset],
    ),
    tenantQuery(client, `SELECT COUNT(*)::int AS total FROM issues i WHERE ${whereClause}`, params),
  ]);

  return {
    issues: dataResult.rows.map(rowToIssue),
    total: countResult.rows[0].total as number,
  };
}

// ── Get Issue By ID ─────────────────────────────────────────────────────────
export async function getIssueById(
  tenantId: string,
  id: string,
  client?: PoolClient,
): Promise<Issue> {
  const result = await tenantQuery(
    client,
    `SELECT ${SELECT_WITH_JOINS}
     ${FROM_WITH_JOINS}
     WHERE i.tenant_id = $1 AND i.id = $2`,
    [tenantId, id],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Issue not found');
  }

  const issue = rowToIssue(result.rows[0]);
  const documentsResult = await tenantQuery(
    client,
    `SELECT id, filename, mime_type, file_size, created_at
     FROM issue_documents
     WHERE tenant_id = $1 AND issue_id = $2
     ORDER BY created_at DESC`,
    [tenantId, id],
  );
  issue.requirementDocuments = documentsResult.rows.map(rowToRequirementDocument);
  return issue;
}

// ── Update Issue ────────────────────────────────────────────────────────────
export async function updateIssue(
  tenantId: string,
  id: string,
  data: UpdateIssueInput,
  actorId: string,
  client?: PoolClient,
): Promise<Issue> {
  const setClauses: string[] = ['updated_at = NOW()'];
  const params: unknown[] = [tenantId, id];
  let paramIndex = 3;

  const fieldMap: Record<string, string> = {
    title: 'title',
    description: 'description',
    priority: 'priority',
    type: 'type',
    assignedTo: 'assigned_to',
    requestedBy: 'requested_by',
    tags: 'tags',
    appId: 'app_id',
    appName: 'app_name',
    pageId: 'page_id',
    pageName: 'page_name',
    prdSessionId: 'prd_session_id',
    changeSetId: 'change_set_id',
    releaseId: 'release_id',
    testSuiteId: 'test_suite_id',
  };

  for (const [key, column] of Object.entries(fieldMap)) {
    const value = (data as Record<string, unknown>)[key];
    if (value !== undefined) {
      setClauses.push(`${column} = $${paramIndex}`);
      params.push(value);
      paramIndex++;
    }
  }

  const result = await tenantQuery(
    client,
    `UPDATE issues SET ${setClauses.join(', ')}
     WHERE tenant_id = $1 AND id = $2
     RETURNING id, status`,
    params,
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Issue not found');
  }

  // Audit log if status changed
  if (data.priority || data.assignedTo !== undefined) {
    await logAudit(tenantId, actorId, 'issue.updated', id, data as Record<string, unknown>, client);
  }

  logger.info({ tenantId, issueId: id }, 'Issue updated');

  return getIssueById(tenantId, id, client);
}

// ── Save AI Validation Result ──────────────────────────────────────────────
export async function saveIssueValidation(
  tenantId: string,
  id: string,
  data: { score: number; notes: Record<string, unknown> },
  actorId: string,
  client?: PoolClient,
): Promise<Issue> {
  const result = await tenantQuery(
    client,
    `UPDATE issues
       SET ai_validation_score = $3,
           ai_validation_notes = $4,
           ai_validated_at = NOW(),
           updated_at = NOW()
     WHERE tenant_id = $1 AND id = $2
     RETURNING id`,
    [tenantId, id, data.score, JSON.stringify(data.notes)],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Issue not found');
  }

  await logAudit(
    tenantId,
    actorId,
    'issue.validation_saved',
    id,
    { score: data.score } as Record<string, unknown>,
    client,
  );

  logger.info({ tenantId, issueId: id, score: data.score }, 'Issue validation saved');

  return getIssueById(tenantId, id, client);
}

// ── Transition Issue ────────────────────────────────────────────────────────
export async function transitionIssue(
  tenantId: string,
  id: string,
  newStatus: IssueStatus,
  actorId: string,
  options?: { reason?: string; annotations?: Record<string, unknown> },
  client?: PoolClient,
): Promise<Issue> {
  // Fetch current issue
  const current = await getIssueById(tenantId, id, client);

  if (current.status === newStatus) {
    return current;
  }

  // Validate transition using the valid transitions map
  const validTargets = VALID_TRANSITIONS[current.status] ?? [];
  if (!validTargets.includes(newStatus)) {
    throw new ValidationError(
      `Invalid status transition from '${current.status}' to '${newStatus}'. ` +
        `Valid transitions: ${validTargets.join(', ') || 'none'}.`,
    );
  }

  // Check if this is a forward or return transition
  const currentIndex = ISSUE_STATUS_FLOW.indexOf(current.status);
  const newIndex = ISSUE_STATUS_FLOW.indexOf(newStatus);
  const isReturn = newIndex < currentIndex;

  // Additional validations for specific transitions
  if (current.status === 'intake' && newStatus === 'prd') {
    // Must have assignedTo before moving to prd
    if (!current.assignedTo) {
      throw new ValidationError(
        'Cannot move to PRD stage without assigning a developer. Set assignedTo first.',
      );
    }
  }

  // Build update query
  const setClauses = ['status = $3', 'updated_at = NOW()'];
  const params: unknown[] = [tenantId, id, newStatus];

  // If returning, track return info
  if (isReturn && options?.reason) {
    setClauses.push('returned_reason = $4', 'returned_by = $5', 'returned_at = NOW()');
    params.push(options.reason, actorId);
  } else {
    // Clear return fields when moving forward
    setClauses.push('returned_reason = NULL', 'returned_by = NULL', 'returned_at = NULL');
  }

  await tenantQuery(
    client,
    `UPDATE issues SET ${setClauses.join(', ')}
     WHERE tenant_id = $1 AND id = $2`,
    params,
  );

  // Log return history if this is a return transition
  if (isReturn && options?.reason) {
    await tenantQuery(
      client,
      `INSERT INTO issue_return_history (tenant_id, issue_id, from_stage, to_stage, returned_by, reason, annotations)
       VALUES ($1, $2, $3, $4, $5, $6, $7)`,
      [
        tenantId,
        id,
        current.status,
        newStatus,
        actorId,
        options.reason,
        options.annotations ? JSON.stringify(options.annotations) : null,
      ],
    );
  }

  // If returning from prd_approval, reset approvals
  if (current.status === 'prd_approval' && newStatus === 'prd') {
    await tenantQuery(
      client,
      `DELETE FROM issue_approvals WHERE tenant_id = $1 AND issue_id = $2 AND stage = 'prd_approval'`,
      [tenantId, id],
    );
  }

  await logAudit(
    tenantId,
    actorId,
    isReturn ? 'issue.returned' : 'issue.transitioned',
    id,
    {
      old_status: current.status,
      new_status: newStatus,
      reason: options?.reason,
    },
    client,
  );

  await logActivity(
    tenantId,
    id,
    'status_change',
    isReturn
      ? `Issue devuelto de ${current.status} a ${newStatus}: ${options?.reason ?? ''}`
      : `Issue avanzado de ${current.status} a ${newStatus}`,
    undefined,
    undefined,
    actorId,
    client,
  );

  logger.info({ tenantId, issueId: id, from: current.status, to: newStatus, isReturn }, 'Issue transitioned');

  return getIssueById(tenantId, id, client);
}

// ── Approval Management ────────────────────────────────────────────────────

export async function submitApproval(
  tenantId: string,
  issueId: string,
  stage: IssueStatus,
  actorId: string,
  actorRole: string,
  decision: 'approved' | 'returned',
  comments?: string,
  client?: PoolClient,
): Promise<IssueApproval> {
  // Upsert approval record
  const result = await tenantQuery(
    client,
    `INSERT INTO issue_approvals (tenant_id, issue_id, stage, approver_user_id, approver_role, decision, comments, decided_at)
     VALUES ($1, $2, $3, $4, $5, $6, $7, NOW())
     ON CONFLICT (issue_id, stage, approver_role)
     DO UPDATE SET decision = $6, comments = $7, decided_at = NOW()
     RETURNING *`,
    [tenantId, issueId, stage, actorId, actorRole, decision, comments ?? null],
  );

  const approval = result.rows[0];

  await logActivity(
    tenantId,
    issueId,
    'comment',
    `${actorRole} ${decision === 'approved' ? 'aprobó' : 'devolvió'} en etapa ${stage}${comments ? ': ' + comments : ''}`,
    undefined,
    undefined,
    actorId,
    client,
  );

  logger.info({ tenantId, issueId, stage, actorRole, decision }, 'Approval submitted');

  return {
    id: approval.id as string,
    tenantId: approval.tenant_id as string,
    issueId: approval.issue_id as string,
    stage: approval.stage as IssueStatus,
    approverUserId: approval.approver_user_id as string,
    approverRole: approval.approver_role as string,
    decision: approval.decision as IssueApproval['decision'],
    comments: approval.comments as string | undefined,
    decidedAt: approval.decided_at ? (approval.decided_at as Date).toISOString() : undefined,
    createdAt: (approval.created_at as Date).toISOString(),
  };
}

export async function getApprovals(
  tenantId: string,
  issueId: string,
  stage: IssueStatus,
  client?: PoolClient,
): Promise<IssueApproval[]> {
  const result = await tenantQuery(
    client,
    `SELECT a.*, u.display_name AS approver_name
     FROM issue_approvals a
     LEFT JOIN users u ON a.approver_user_id = u.id
     WHERE a.tenant_id = $1 AND a.issue_id = $2 AND a.stage = $3
     ORDER BY a.created_at`,
    [tenantId, issueId, stage],
  );

  return result.rows.map((row) => ({
    id: row.id as string,
    tenantId: row.tenant_id as string,
    issueId: row.issue_id as string,
    stage: row.stage as IssueStatus,
    approverUserId: row.approver_user_id as string,
    approverRole: row.approver_role as string,
    approverName: (row.approver_name as string) ?? undefined,
    decision: row.decision as IssueApproval['decision'],
    comments: (row.comments as string) ?? undefined,
    decidedAt: row.decided_at ? (row.decided_at as Date).toISOString() : undefined,
    createdAt: (row.created_at as Date).toISOString(),
  }));
}

export async function getReturnHistory(
  tenantId: string,
  issueId: string,
  client?: PoolClient,
): Promise<IssueReturnRecord[]> {
  const result = await tenantQuery(
    client,
    `SELECT r.*, u.display_name AS returned_by_name
     FROM issue_return_history r
     LEFT JOIN users u ON r.returned_by = u.id
     WHERE r.tenant_id = $1 AND r.issue_id = $2
     ORDER BY r.created_at DESC`,
    [tenantId, issueId],
  );

  return result.rows.map((row) => ({
    id: row.id as string,
    tenantId: row.tenant_id as string,
    issueId: row.issue_id as string,
    fromStage: row.from_stage as IssueStatus,
    toStage: row.to_stage as IssueStatus,
    returnedBy: row.returned_by as string,
    returnedByName: (row.returned_by_name as string) ?? undefined,
    reason: row.reason as string,
    annotations: (row.annotations as Record<string, unknown>) ?? undefined,
    createdAt: (row.created_at as Date).toISOString(),
  }));
}

// ── Get Issues By Client ────────────────────────────────────────────────────
export async function getIssuesByClient(
  tenantId: string,
  clientId: string,
  client?: PoolClient,
): Promise<Issue[]> {
  const result = await tenantQuery(
    client,
    `SELECT ${SELECT_WITH_JOINS}
     ${FROM_WITH_JOINS}
     WHERE i.tenant_id = $1 AND i.client_id = $2
     ORDER BY i.created_at DESC`,
    [tenantId, clientId],
  );

  return result.rows.map(rowToIssue);
}

// ── Activity types ─────────────────────────────────────────────────────────
export type ActivityType =
  | 'status_change'
  | 'prd_created'
  | 'prd_exported'
  | 'change_set_created'
  | 'release_created'
  | 'test_created'
  | 'code_edited'
  | 'comment'
  | 'artifact_linked';

export type ArtifactType =
  | 'prd_session'
  | 'change_set'
  | 'release'
  | 'test_suite'
  | 'conversation'
  | 'editor_session';

export interface IssueActivity {
  id: string;
  tenantId: string;
  issueId: string;
  activityType: ActivityType;
  description: string;
  artifactType?: ArtifactType;
  artifactId?: string;
  actorId?: string;
  createdAt: string;
}

function rowToActivity(row: Record<string, unknown>): IssueActivity {
  return {
    id: row.id as string,
    tenantId: row.tenant_id as string,
    issueId: row.issue_id as string,
    activityType: row.activity_type as ActivityType,
    description: row.description as string,
    artifactType: (row.artifact_type as ArtifactType) ?? undefined,
    artifactId: (row.artifact_id as string) ?? undefined,
    actorId: (row.actor_id as string) ?? undefined,
    createdAt: (row.created_at as Date).toISOString(),
  };
}

// ── Log Activity ───────────────────────────────────────────────────────────
export async function logActivity(
  tenantId: string,
  issueId: string,
  activityType: ActivityType,
  description: string,
  artifactType?: ArtifactType,
  artifactId?: string,
  actorId?: string,
  client?: PoolClient,
): Promise<void> {
  await tenantQuery(
    client,
    `INSERT INTO issue_activities (tenant_id, issue_id, activity_type, description, artifact_type, artifact_id, actor_id)
     VALUES ($1, $2, $3, $4, $5, $6, $7)`,
    [
      tenantId,
      issueId,
      activityType,
      description,
      artifactType ?? null,
      artifactId ?? null,
      actorId ?? null,
    ],
  );
  logger.info({ tenantId, issueId, activityType }, 'Issue activity logged');
}

// ── Get Activities ─────────────────────────────────────────────────────────
export async function getActivities(
  tenantId: string,
  issueId: string,
  client?: PoolClient,
): Promise<IssueActivity[]> {
  // Ensure issue exists
  await getIssueById(tenantId, issueId, client);

  const result = await tenantQuery(
    client,
    `SELECT * FROM issue_activities
     WHERE tenant_id = $1 AND issue_id = $2
     ORDER BY created_at DESC`,
    [tenantId, issueId],
  );

  return result.rows.map(rowToActivity);
}

// ── Link Artifact ──────────────────────────────────────────────────────────
const ARTIFACT_TABLE_MAP: Record<ArtifactType, string> = {
  prd_session: 'prd_sessions',
  change_set: 'change_sets',
  release: 'releases',
  test_suite: 'test_suites',
  conversation: 'ai_conversations',
  editor_session: 'editor_sessions',
};

export async function linkArtifact(
  tenantId: string,
  issueId: string,
  artifactType: ArtifactType,
  artifactId: string,
  actorId: string,
  client?: PoolClient,
): Promise<void> {
  // Ensure issue exists
  await getIssueById(tenantId, issueId, client);

  const tableName = ARTIFACT_TABLE_MAP[artifactType];
  if (!tableName) {
    throw new ValidationError(`Unknown artifact type: ${artifactType}`);
  }

  // Update the artifact table to set issue_id
  const result = await tenantQuery(
    client,
    `UPDATE ${tableName} SET issue_id = $3 WHERE tenant_id = $1 AND id = $2`,
    [tenantId, artifactId, issueId],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError(`${artifactType} not found`);
  }

  // Also update the issue's reference column if applicable
  const issueColumnMap: Partial<Record<ArtifactType, string>> = {
    prd_session: 'prd_session_id',
    change_set: 'change_set_id',
    release: 'release_id',
    test_suite: 'test_suite_id',
  };

  const issueColumn = issueColumnMap[artifactType];
  if (issueColumn) {
    await tenantQuery(
      client,
      `UPDATE issues SET ${issueColumn} = $3, updated_at = NOW() WHERE tenant_id = $1 AND id = $2`,
      [tenantId, issueId, artifactId],
    );
  }

  await logActivity(
    tenantId,
    issueId,
    'artifact_linked',
    `Linked ${artifactType.replace('_', ' ')} ${artifactId.slice(0, 8)}...`,
    artifactType,
    artifactId,
    actorId,
    client,
  );

  logger.info({ tenantId, issueId, artifactType, artifactId }, 'Artifact linked to issue');
}

// ── Get Issue Stats ─────────────────────────────────────────────────────────
export async function getIssueStats(
  tenantId: string,
  clientId?: string,
  client?: PoolClient,
): Promise<Record<IssueStatus, number>> {
  const conditions: string[] = ['tenant_id = $1'];
  const params: unknown[] = [tenantId];

  if (clientId) {
    conditions.push('client_id = $2');
    params.push(clientId);
  }

  const result = await tenantQuery(
    client,
    `SELECT status, COUNT(*)::int AS count
     FROM issues
     WHERE ${conditions.join(' AND ')}
     GROUP BY status`,
    params,
  );

  // Initialize all statuses to 0
  const stats = {} as Record<IssueStatus, number>;
  for (const s of ISSUE_STATUS_FLOW) {
    stats[s] = 0;
  }

  // Fill in actual counts
  for (const row of result.rows) {
    stats[row.status as IssueStatus] = row.count as number;
  }

  return stats;
}
