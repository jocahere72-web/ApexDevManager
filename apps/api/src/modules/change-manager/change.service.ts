import { pool } from '../../config/database.js';
import { logger } from '../../lib/logger.js';
import { NotFoundError, AppError } from '../../lib/errors.js';
import type {
  ChangeSet,
  ChangeSetObject,
  ChangeSetStatus,
  ConflictDetail,
} from '@apex-dev-manager/shared-types';

// ── Row mapping ─────────────────────────────────────────────────────────────

interface ChangeSetRow {
  id: string;
  tenant_id: string;
  connection_id: string;
  name: string;
  description: string | null;
  status: ChangeSetStatus;
  objects: ChangeSetObject[];
  conflict_count: number;
  created_by: string | null;
  approved_by: string | null;
  applied_at: string | null;
  created_at: string;
  updated_at: string;
}

function rowToChangeSet(row: ChangeSetRow): ChangeSet {
  return {
    id: row.id,
    tenantId: row.tenant_id,
    connectionId: row.connection_id,
    name: row.name,
    description: row.description,
    status: row.status,
    objects: row.objects ?? [],
    conflictCount: row.conflict_count,
    createdBy: row.created_by,
    approvedBy: row.approved_by,
    appliedAt: row.applied_at,
    createdAt: row.created_at,
    updatedAt: row.updated_at,
  };
}

// ── Service functions ───────────────────────────────────────────────────────

export async function createChangeSet(
  tenantId: string,
  connectionId: string,
  name: string,
  description: string | null,
  createdBy: string,
): Promise<ChangeSet> {
  const result = await pool.query<ChangeSetRow>(
    `INSERT INTO change_sets (tenant_id, connection_id, name, description, created_by)
     VALUES ($1, $2, $3, $4, $5)
     RETURNING *`,
    [tenantId, connectionId, name, description, createdBy],
  );
  logger.info({ changeSetId: result.rows[0].id }, 'Change set created');
  return rowToChangeSet(result.rows[0]);
}

export async function getChangeSet(
  tenantId: string,
  changeSetId: string,
): Promise<ChangeSet> {
  const result = await pool.query<ChangeSetRow>(
    `SELECT * FROM change_sets WHERE tenant_id = $1 AND id = $2`,
    [tenantId, changeSetId],
  );
  if (result.rowCount === 0) {
    throw new NotFoundError('Change set not found');
  }
  return rowToChangeSet(result.rows[0]);
}

export async function listChangeSets(
  tenantId: string,
  connectionId?: string,
  status?: ChangeSetStatus,
  limit = 50,
  offset = 0,
): Promise<{ items: ChangeSet[]; total: number }> {
  const conditions = ['tenant_id = $1'];
  const params: unknown[] = [tenantId];
  let idx = 2;

  if (connectionId) {
    conditions.push(`connection_id = $${idx++}`);
    params.push(connectionId);
  }
  if (status) {
    conditions.push(`status = $${idx++}`);
    params.push(status);
  }

  const where = conditions.join(' AND ');

  const countResult = await pool.query<{ count: string }>(
    `SELECT COUNT(*) as count FROM change_sets WHERE ${where}`,
    params,
  );

  const result = await pool.query<ChangeSetRow>(
    `SELECT * FROM change_sets WHERE ${where} ORDER BY created_at DESC LIMIT $${idx++} OFFSET $${idx++}`,
    [...params, limit, offset],
  );

  return {
    items: result.rows.map(rowToChangeSet),
    total: parseInt(countResult.rows[0].count, 10),
  };
}

export async function addObject(
  tenantId: string,
  changeSetId: string,
  object: ChangeSetObject,
): Promise<ChangeSet> {
  const cs = await getChangeSet(tenantId, changeSetId);
  if (cs.status !== 'draft') {
    throw new AppError('Cannot modify a non-draft change set', 400, 'BAD_REQUEST');
  }

  const updatedObjects = [...cs.objects, object];
  const result = await pool.query<ChangeSetRow>(
    `UPDATE change_sets SET objects = $3::jsonb, updated_at = NOW()
     WHERE tenant_id = $1 AND id = $2
     RETURNING *`,
    [tenantId, changeSetId, JSON.stringify(updatedObjects)],
  );
  return rowToChangeSet(result.rows[0]);
}

export async function removeObject(
  tenantId: string,
  changeSetId: string,
  objectIndex: number,
): Promise<ChangeSet> {
  const cs = await getChangeSet(tenantId, changeSetId);
  if (cs.status !== 'draft') {
    throw new AppError('Cannot modify a non-draft change set', 400, 'BAD_REQUEST');
  }

  const updatedObjects = cs.objects.filter((_, i) => i !== objectIndex);
  const result = await pool.query<ChangeSetRow>(
    `UPDATE change_sets SET objects = $3::jsonb, updated_at = NOW()
     WHERE tenant_id = $1 AND id = $2
     RETURNING *`,
    [tenantId, changeSetId, JSON.stringify(updatedObjects)],
  );
  return rowToChangeSet(result.rows[0]);
}

export async function detectConflicts(
  tenantId: string,
  changeSetId: string,
): Promise<ConflictDetail[]> {
  const cs = await getChangeSet(tenantId, changeSetId);
  const conflicts: ConflictDetail[] = [];

  // Compare each object's DDL against the live schema via ORDS/MCP
  // For now, return placeholder comparison logic
  for (const obj of cs.objects) {
    try {
      // In production, this would fetch live DDL via the connection's ORDS endpoint
      // and compare field-by-field with the change set object
      logger.debug({ object: obj.objectName }, 'Checking conflicts for object');
    } catch (err) {
      conflicts.push({
        objectType: obj.objectType,
        objectName: obj.objectName,
        field: 'ddl',
        localValue: obj.ddl.substring(0, 100),
        remoteValue: 'Unable to fetch live DDL',
        severity: 'high',
      });
    }
  }

  // Update conflict count
  await pool.query(
    `UPDATE change_sets SET conflict_count = $3, updated_at = NOW()
     WHERE tenant_id = $1 AND id = $2`,
    [tenantId, changeSetId, conflicts.length],
  );

  return conflicts;
}

export async function submitForReview(
  tenantId: string,
  changeSetId: string,
): Promise<ChangeSet> {
  const cs = await getChangeSet(tenantId, changeSetId);
  if (cs.status !== 'draft') {
    throw new AppError('Only draft change sets can be submitted for review', 400, 'BAD_REQUEST');
  }
  if (cs.objects.length === 0) {
    throw new AppError('Cannot submit an empty change set', 400, 'BAD_REQUEST');
  }

  const result = await pool.query<ChangeSetRow>(
    `UPDATE change_sets SET status = 'review', updated_at = NOW()
     WHERE tenant_id = $1 AND id = $2
     RETURNING *`,
    [tenantId, changeSetId],
  );
  logger.info({ changeSetId }, 'Change set submitted for review');
  return rowToChangeSet(result.rows[0]);
}

export async function approve(
  tenantId: string,
  changeSetId: string,
  approvedBy: string,
): Promise<ChangeSet> {
  const cs = await getChangeSet(tenantId, changeSetId);
  if (cs.status !== 'review') {
    throw new AppError('Only change sets in review can be approved', 400, 'BAD_REQUEST');
  }

  const result = await pool.query<ChangeSetRow>(
    `UPDATE change_sets SET status = 'approved', approved_by = $3, updated_at = NOW()
     WHERE tenant_id = $1 AND id = $2
     RETURNING *`,
    [tenantId, changeSetId, approvedBy],
  );
  logger.info({ changeSetId, approvedBy }, 'Change set approved');
  return rowToChangeSet(result.rows[0]);
}

export async function reject(
  tenantId: string,
  changeSetId: string,
): Promise<ChangeSet> {
  const cs = await getChangeSet(tenantId, changeSetId);
  if (cs.status !== 'review') {
    throw new AppError('Only change sets in review can be rejected', 400, 'BAD_REQUEST');
  }

  const result = await pool.query<ChangeSetRow>(
    `UPDATE change_sets SET status = 'rejected', updated_at = NOW()
     WHERE tenant_id = $1 AND id = $2
     RETURNING *`,
    [tenantId, changeSetId],
  );
  logger.info({ changeSetId }, 'Change set rejected');
  return rowToChangeSet(result.rows[0]);
}

export async function applyChangeSet(
  tenantId: string,
  changeSetId: string,
): Promise<ChangeSet> {
  const cs = await getChangeSet(tenantId, changeSetId);
  if (cs.status !== 'approved') {
    throw new AppError('Only approved change sets can be applied', 400, 'BAD_REQUEST');
  }

  // Execute DDL statements via MCP/ORDS connection
  // In production, this would iterate cs.objects and execute each DDL
  for (const obj of cs.objects) {
    logger.info(
      { objectType: obj.objectType, objectName: obj.objectName, action: obj.action },
      'Applying change set object',
    );
    // TODO: Execute obj.ddl via MCP client against the target connection
  }

  const result = await pool.query<ChangeSetRow>(
    `UPDATE change_sets SET status = 'applied', applied_at = NOW(), updated_at = NOW()
     WHERE tenant_id = $1 AND id = $2
     RETURNING *`,
    [tenantId, changeSetId],
  );
  logger.info({ changeSetId }, 'Change set applied');
  return rowToChangeSet(result.rows[0]);
}
