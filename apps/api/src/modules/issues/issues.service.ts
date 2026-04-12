import { logger } from '../../lib/logger.js';
import { tenantQuery } from '../../lib/tenant-db.js';
import { NotFoundError, ValidationError } from '../../lib/errors.js';
import type { CreateIssueInput, UpdateIssueInput, ListIssuesQuery } from './issues.validation.js';
import type { PoolClient } from 'pg';
import type { Issue, IssueStatus } from '@apex-dev-manager/shared-types';
import { ISSUE_STATUS_FLOW } from '@apex-dev-manager/shared-types';

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
    // Joined fields
    clientName: (row.client_name as string) ?? undefined,
    clientCode: (row.client_code as string) ?? undefined,
    assignedToName: (row.assigned_to_name as string) ?? undefined,
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
  i.priority, i.type, i.status, i.connection_id, i.app_id,
  i.prd_session_id, i.change_set_id, i.release_id, i.test_suite_id,
  i.assigned_to, i.requested_by, i.tags, i.created_by, i.created_at, i.updated_at,
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
       priority, type, status, connection_id, app_id,
       requested_by, tags, created_by
     )
     VALUES ($1, $2, $3, $4, $5, $6, $7, 'intake', $8, $9, $10, $11, $12)
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
      inheritedAppId,
      data.requestedBy ?? null,
      data.tags ?? [],
      actorId,
    ],
  );

  const issueId = result.rows[0].id as string;

  await logAudit(tenantId, actorId, 'issue.created', issueId, {
    code,
    title: data.title,
    clientId: data.clientId,
  }, client);

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
    tenantQuery(
      client,
      `SELECT COUNT(*)::int AS total FROM issues i WHERE ${whereClause}`,
      params,
    ),
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

  return rowToIssue(result.rows[0]);
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

// ── Transition Issue ────────────────────────────────────────────────────────
export async function transitionIssue(
  tenantId: string,
  id: string,
  newStatus: IssueStatus,
  actorId: string,
  client?: PoolClient,
): Promise<Issue> {
  // Fetch current issue
  const current = await getIssueById(tenantId, id, client);
  const currentIndex = ISSUE_STATUS_FLOW.indexOf(current.status);
  const newIndex = ISSUE_STATUS_FLOW.indexOf(newStatus);

  // Validate: must be adjacent (one step forward or back) or same
  if (Math.abs(currentIndex - newIndex) > 1) {
    throw new ValidationError(
      `Invalid status transition from '${current.status}' to '${newStatus}'. ` +
      `Only adjacent transitions are allowed.`,
    );
  }

  if (current.status === newStatus) {
    return current;
  }

  await tenantQuery(
    client,
    `UPDATE issues SET status = $3, updated_at = NOW()
     WHERE tenant_id = $1 AND id = $2`,
    [tenantId, id, newStatus],
  );

  await logAudit(tenantId, actorId, 'issue.transitioned', id, {
    old_status: current.status,
    new_status: newStatus,
  }, client);

  logger.info({ tenantId, issueId: id, from: current.status, to: newStatus }, 'Issue transitioned');

  return getIssueById(tenantId, id, client);
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
