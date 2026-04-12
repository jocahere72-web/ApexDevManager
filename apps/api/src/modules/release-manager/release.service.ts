import { pool } from '../../config/database.js';
import { tenantQuery } from '../../lib/tenant-db.js';
import type { PoolClient } from 'pg';
import { logger } from '../../lib/logger.js';
import { NotFoundError, AppError } from '../../lib/errors.js';
import type {
  Release,
  DeploymentStatus,
  Pipeline,
  PipelineStage,
} from '@apex-dev-manager/shared-types';

// ── Row mapping ─────────────────────────────────────────────────────────────

interface ReleaseRow {
  id: string;
  tenant_id: string;
  connection_id: string;
  version: string;
  status: DeploymentStatus;
  pipeline: Pipeline;
  change_set_ids: string[];
  deployed_by: string | null;
  deployed_at: string | null;
  rolled_back_at: string | null;
  rollback_reason: string | null;
  created_at: string;
  updated_at: string;
}

function rowToRelease(row: ReleaseRow): Release {
  return {
    id: row.id,
    tenantId: row.tenant_id,
    connectionId: row.connection_id,
    version: row.version,
    status: row.status,
    pipeline: row.pipeline,
    changeSetIds: row.change_set_ids ?? [],
    deployedBy: row.deployed_by,
    deployedAt: row.deployed_at,
    rolledBackAt: row.rolled_back_at,
    rollbackReason: row.rollback_reason,
    createdAt: row.created_at,
    updatedAt: row.updated_at,
  };
}

function defaultPipeline(): Pipeline {
  const stages: PipelineStage[] = [
    { name: 'build', status: 'pending' },
    { name: 'test', status: 'pending' },
    { name: 'staging', status: 'pending' },
    { name: 'production', status: 'pending' },
  ];
  return { stages, currentStage: 'build' };
}

// ── Service functions ───────────────────────────────────────────────────────

export async function createRelease(
  tenantId: string,
  connectionId: string,
  version: string,
  changeSetIds: string[],
  client?: PoolClient,
): Promise<Release> {
  const pipeline = defaultPipeline();
  const result = await tenantQuery(client,
    `INSERT INTO releases (tenant_id, connection_id, version, pipeline, change_set_ids)
     VALUES ($1, $2, $3, $4::jsonb, $5)
     RETURNING *`,
    [tenantId, connectionId, version, JSON.stringify(pipeline), changeSetIds],
  );
  logger.info({ releaseId: result.rows[0].id, version }, 'Release created');
  return rowToRelease(result.rows[0]);
}

export async function getRelease(
  tenantId: string,
  releaseId: string,
  client?: PoolClient,
): Promise<Release> {
  const result = await tenantQuery(client,
    `SELECT * FROM releases WHERE tenant_id = $1 AND id = $2`,
    [tenantId, releaseId],
  );
  if (result.rowCount === 0) {
    throw new NotFoundError('Release not found');
  }
  return rowToRelease(result.rows[0]);
}

export async function listReleases(
  tenantId: string,
  connectionId?: string,
  status?: DeploymentStatus,
  limit = 50,
  offset = 0,
  client?: PoolClient,
): Promise<{ items: Release[]; total: number }> {
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
  const countResult = await tenantQuery(client,
    `SELECT COUNT(*) as count FROM releases WHERE ${where}`,
    params,
  );

  const result = await tenantQuery(client,
    `SELECT * FROM releases WHERE ${where} ORDER BY created_at DESC LIMIT $${idx++} OFFSET $${idx++}`,
    [...params, limit, offset],
  );

  return {
    items: result.rows.map(rowToRelease),
    total: parseInt(countResult.rows[0].count, 10),
  };
}

function advanceStage(pipeline: Pipeline, stageName: string, newStatus: PipelineStage['status']): Pipeline {
  const updated = { ...pipeline, stages: [...pipeline.stages] };
  const stageIdx = updated.stages.findIndex((s) => s.name === stageName);
  if (stageIdx === -1) throw new AppError(`Pipeline stage '${stageName}' not found`, 400, 'BAD_REQUEST');

  updated.stages[stageIdx] = {
    ...updated.stages[stageIdx],
    status: newStatus,
    ...(newStatus === 'running' ? { startedAt: new Date().toISOString() } : {}),
    ...(newStatus === 'passed' || newStatus === 'failed'
      ? { completedAt: new Date().toISOString() }
      : {}),
  };

  // Advance currentStage if passed
  if (newStatus === 'passed' && stageIdx + 1 < updated.stages.length) {
    updated.currentStage = updated.stages[stageIdx + 1].name;
  }

  return updated;
}

export async function buildRelease(
  tenantId: string,
  releaseId: string,
  client?: PoolClient,
): Promise<Release> {
  const release = await getRelease(tenantId, releaseId, client);
  if (release.status !== 'draft') {
    throw new AppError('Only draft releases can be built', 400, 'BAD_REQUEST');
  }

  let pipeline = advanceStage(release.pipeline, 'build', 'running');
  // Simulate build success
  pipeline = advanceStage(pipeline, 'build', 'passed');

  const result = await tenantQuery(client,
    `UPDATE releases SET status = 'building', pipeline = $3::jsonb, updated_at = NOW()
     WHERE tenant_id = $1 AND id = $2
     RETURNING *`,
    [tenantId, releaseId, JSON.stringify(pipeline)],
  );
  logger.info({ releaseId }, 'Release build started');
  return rowToRelease(result.rows[0]);
}

export async function promoteToStaging(
  tenantId: string,
  releaseId: string,
  client?: PoolClient,
): Promise<Release> {
  const release = await getRelease(tenantId, releaseId, client);
  if (!['building', 'testing'].includes(release.status)) {
    throw new AppError('Release must be in building or testing status to promote to staging', 400, 'BAD_REQUEST');
  }

  let pipeline = advanceStage(release.pipeline, 'test', 'passed');
  pipeline = advanceStage(pipeline, 'staging', 'running');

  const result = await tenantQuery(client,
    `UPDATE releases SET status = 'staging', pipeline = $3::jsonb, updated_at = NOW()
     WHERE tenant_id = $1 AND id = $2
     RETURNING *`,
    [tenantId, releaseId, JSON.stringify(pipeline)],
  );
  logger.info({ releaseId }, 'Release promoted to staging');
  return rowToRelease(result.rows[0]);
}

export async function deployToProduction(
  tenantId: string,
  releaseId: string,
  deployedBy: string,
  client?: PoolClient,
): Promise<Release> {
  const release = await getRelease(tenantId, releaseId, client);
  if (release.status !== 'staging') {
    throw new AppError('Only staged releases can be deployed to production', 400, 'BAD_REQUEST');
  }

  let pipeline = advanceStage(release.pipeline, 'staging', 'passed');
  pipeline = advanceStage(pipeline, 'production', 'passed');
  pipeline.completedAt = new Date().toISOString();

  const result = await tenantQuery(client,
    `UPDATE releases
     SET status = 'production', pipeline = $3::jsonb, deployed_by = $4, deployed_at = NOW(), updated_at = NOW()
     WHERE tenant_id = $1 AND id = $2
     RETURNING *`,
    [tenantId, releaseId, JSON.stringify(pipeline), deployedBy],
  );
  logger.info({ releaseId, deployedBy }, 'Release deployed to production');
  return rowToRelease(result.rows[0]);
}

export async function rollback(
  tenantId: string,
  releaseId: string,
  reason: string,
  client?: PoolClient,
): Promise<Release> {
  const release = await getRelease(tenantId, releaseId, client);
  if (release.status !== 'production') {
    throw new AppError('Only production releases can be rolled back', 400, 'BAD_REQUEST');
  }

  const result = await tenantQuery(client,
    `UPDATE releases
     SET status = 'rolled_back', rolled_back_at = NOW(), rollback_reason = $3, updated_at = NOW()
     WHERE tenant_id = $1 AND id = $2
     RETURNING *`,
    [tenantId, releaseId, reason],
  );
  logger.info({ releaseId, reason }, 'Release rolled back');
  return rowToRelease(result.rows[0]);
}

export async function getPipelineStatus(
  tenantId: string,
  releaseId: string,
  client?: PoolClient,
): Promise<Pipeline> {
  const release = await getRelease(tenantId, releaseId, client);
  return release.pipeline;
}
