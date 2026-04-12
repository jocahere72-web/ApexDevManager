import { logger } from '../../lib/logger.js';
import { tenantQuery } from '../../lib/tenant-db.js';
import { NotFoundError, ConflictError } from '../../lib/errors.js';
import { encryptCredentials, decryptCredentials } from './encryption.service.js';
import { testOrdsConnection } from './ords.client.js';
import { testJdbcConnection } from './jdbc.client.js';
import type {
  CreateConnectionInput,
  UpdateConnectionInput,
  ListConnectionsQuery,
  TestResult,
  ConnectionStatus,
} from './connections.validation.js';
import type { PoolClient } from 'pg';

// ── Types ────────────────────────────────────────────────────────────────────
export interface ConnectionProfile {
  id: string;
  tenantId: string;
  name: string;
  type: 'ords' | 'jdbc';
  environment: string;
  config: Record<string, unknown>;
  status: ConnectionStatus;
  tags: string[];
  labels: Record<string, string>;
  isActive: boolean;
  lastHealthCheck: Date | null;
  lastLatencyMs: number | null;
  consecutiveFailures: number;
  createdAt: Date;
  updatedAt: Date;
}

export interface ConnectionHealth {
  connectionId: string;
  status: ConnectionStatus;
  lastHealthCheck: Date | null;
  lastLatencyMs: number | null;
  consecutiveFailures: number;
}

// ── Audit Logging ────────────────────────────────────────────────────────────
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
       VALUES ($1, $2, 'connection_management', $3, 'connection', $4, $5, NOW())`,
      [tenantId, actorId, action, targetId, details ? JSON.stringify(details) : null],
    );
  } catch (err) {
    logger.error({ err, tenantId, actorId, action, targetId }, 'Failed to write audit log');
  }
}

// ── Row to Profile ───────────────────────────────────────────────────────────
function rowToProfile(row: Record<string, unknown>): ConnectionProfile {
  const connType = row.connection_type as 'ords' | 'jdbc';
  const config: Record<string, unknown> =
    connType === 'ords'
      ? { ordsBaseUrl: row.ords_url }
      : { host: row.db_host, serviceName: row.service_name };

  return {
    id: row.id as string,
    tenantId: row.tenant_id as string,
    name: row.name as string,
    type: connType,
    environment: row.environment as string,
    config,
    status: (row.status ?? 'unknown') as ConnectionStatus,
    tags: (row.tags ?? []) as string[],
    labels: (row.labels ?? {}) as Record<string, string>,
    isActive: row.is_active as boolean,
    lastHealthCheck: (row.last_check_at as Date) ?? null,
    lastLatencyMs: (row.last_latency_ms as number) ?? null,
    consecutiveFailures: (row.consecutive_failures as number) ?? 0,
    createdAt: row.created_at as Date,
    updatedAt: row.updated_at as Date,
  };
}

// ── Create Connection ────────────────────────────────────────────────────────
export async function createConnection(
  tenantId: string,
  data: CreateConnectionInput,
  actorId: string,
  client?: PoolClient,
): Promise<ConnectionProfile> {
  // Check for duplicate name within tenant
  const existing = await tenantQuery(
    client,
    `SELECT id FROM connections WHERE tenant_id = $1 AND name = $2 AND deleted_at IS NULL`,
    [tenantId, data.name],
  );

  if (existing.rowCount && existing.rowCount > 0) {
    throw new ConflictError('A connection with this name already exists');
  }

  // Encrypt credentials
  const encryptedCreds = encryptCredentials(
    { username: data.username, password: data.password },
    tenantId,
  );

  // Test the connection before saving
  let testResult: TestResult;
  if (data.type === 'ords') {
    testResult = await testOrdsConnection({
      ordsBaseUrl: data.ordsBaseUrl,
      username: data.username,
      password: data.password,
    });
  } else {
    testResult = await testJdbcConnection({
      host: data.host,
      port: data.port,
      serviceName: data.serviceName,
      username: data.username,
      password: data.password,
    });
  }

  const initialStatus: ConnectionStatus = testResult.success ? 'connected' : 'disconnected';

  const result = await tenantQuery(
    client,
    `INSERT INTO connections (
       tenant_id, name, connection_type, environment, ords_url, db_host, service_name,
       encrypted_credentials, status, tags, labels, is_active, consecutive_failures,
       last_check_at, last_latency_ms, change_log, created_at, updated_at
     )
     VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, true, 0, NOW(), $12, $13, NOW(), NOW())
     RETURNING id, tenant_id, name, connection_type, environment, ords_url, db_host, service_name,
               status, tags, labels, is_active, last_check_at, last_latency_ms,
               consecutive_failures, created_at, updated_at`,
    [
      tenantId,
      data.name,
      data.type,
      data.environment,
      data.type === 'ords' ? data.ordsBaseUrl : null,
      data.type === 'jdbc' ? data.host : null,
      data.type === 'jdbc' ? data.serviceName : null,
      JSON.stringify(encryptedCreds),
      initialStatus,
      data.tags ?? [],
      JSON.stringify(data.labels ?? {}),
      testResult.latencyMs,
      JSON.stringify([
        {
          action: 'created',
          actorId,
          timestamp: new Date().toISOString(),
          testResult: { success: testResult.success, latencyMs: testResult.latencyMs },
        },
      ]),
    ],
  );

  const connection = rowToProfile(result.rows[0]);

  await logAudit(tenantId, actorId, 'connection.created', connection.id, {
    name: data.name,
    type: data.type,
    environment: data.environment,
    testSuccess: testResult.success,
  }, client);

  logger.info(
    { tenantId, connectionId: connection.id, type: data.type, status: initialStatus },
    'Connection created',
  );

  return connection;
}

// ── List Connections ─────────────────────────────────────────────────────────
export async function listConnections(
  tenantId: string,
  query: ListConnectionsQuery,
  client?: PoolClient,
): Promise<{ connections: ConnectionProfile[]; total: number }> {
  const conditions: string[] = ['tenant_id = $1', 'deleted_at IS NULL'];
  const params: unknown[] = [tenantId];
  let paramIndex = 2;

  if (query.search) {
    conditions.push(`name ILIKE $${paramIndex}`);
    params.push(`%${query.search}%`);
    paramIndex++;
  }

  if (query.environment) {
    conditions.push(`environment = $${paramIndex}`);
    params.push(query.environment);
    paramIndex++;
  }

  if (query.status) {
    conditions.push(`status = $${paramIndex}`);
    params.push(query.status);
    paramIndex++;
  }

  const whereClause = conditions.join(' AND ');
  const offset = (query.page - 1) * query.limit;

  const [dataResult, countResult] = await Promise.all([
    tenantQuery(
      client,
      `SELECT id, tenant_id, name, connection_type, environment, ords_url, db_host, service_name,
              status, tags, labels, is_active, last_check_at, last_latency_ms,
              consecutive_failures, created_at, updated_at
       FROM connections
       WHERE ${whereClause}
       ORDER BY created_at DESC
       LIMIT $${paramIndex} OFFSET $${paramIndex + 1}`,
      [...params, query.limit, offset],
    ),
    tenantQuery(client, `SELECT COUNT(*)::int AS total FROM connections WHERE ${whereClause}`, params),
  ]);

  return {
    connections: dataResult.rows.map(rowToProfile),
    total: countResult.rows[0].total as number,
  };
}

// ── Get Connection By ID ─────────────────────────────────────────────────────
export async function getConnectionById(
  tenantId: string,
  id: string,
  client?: PoolClient,
): Promise<ConnectionProfile> {
  const result = await tenantQuery(
    client,
    `SELECT id, tenant_id, name, connection_type, environment, ords_url, db_host, service_name,
            status, tags, labels, is_active, last_check_at, last_latency_ms,
            consecutive_failures, created_at, updated_at
     FROM connections
     WHERE tenant_id = $1 AND id = $2 AND deleted_at IS NULL`,
    [tenantId, id],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Connection not found');
  }

  return rowToProfile(result.rows[0]);
}

// ── Update Connection ────────────────────────────────────────────────────────
export async function updateConnection(
  tenantId: string,
  id: string,
  data: UpdateConnectionInput,
  actorId: string,
  client?: PoolClient,
): Promise<ConnectionProfile> {
  const setClauses: string[] = ['updated_at = NOW()'];
  const params: unknown[] = [tenantId, id];
  let paramIndex = 3;

  if (data.name !== undefined) {
    // Check for duplicate name
    const existing = await tenantQuery(
      client,
      `SELECT id FROM connections WHERE tenant_id = $1 AND name = $2 AND id != $3 AND deleted_at IS NULL`,
      [tenantId, data.name, id],
    );
    if (existing.rowCount && existing.rowCount > 0) {
      throw new ConflictError('A connection with this name already exists');
    }

    setClauses.push(`name = $${paramIndex}`);
    params.push(data.name);
    paramIndex++;
  }

  if (data.environment !== undefined) {
    setClauses.push(`environment = $${paramIndex}`);
    params.push(data.environment);
    paramIndex++;
  }

  if (data.tags !== undefined) {
    setClauses.push(`tags = $${paramIndex}`);
    params.push(data.tags);
    paramIndex++;
  }

  if (data.labels !== undefined) {
    setClauses.push(`labels = $${paramIndex}`);
    params.push(JSON.stringify(data.labels));
    paramIndex++;
  }

  // Append to change_log
  setClauses.push(
    `change_log = change_log || $${paramIndex}::jsonb`,
  );
  params.push(
    JSON.stringify([
      {
        action: 'updated',
        actorId,
        timestamp: new Date().toISOString(),
        changes: data,
      },
    ]),
  );
  paramIndex++;

  const result = await tenantQuery(
    client,
    `UPDATE connections SET ${setClauses.join(', ')}
     WHERE tenant_id = $1 AND id = $2 AND deleted_at IS NULL
     RETURNING id, tenant_id, name, connection_type, environment, ords_url, db_host, service_name,
               status, tags, labels, is_active, last_check_at, last_latency_ms,
               consecutive_failures, created_at, updated_at`,
    params,
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Connection not found');
  }

  const connection = rowToProfile(result.rows[0]);

  await logAudit(tenantId, actorId, 'connection.updated', id, data as Record<string, unknown>, client);

  logger.info({ tenantId, connectionId: id }, 'Connection updated');

  return connection;
}

// ── Soft Delete Connection ───────────────────────────────────────────────────
export async function softDeleteConnection(
  tenantId: string,
  id: string,
  actorId: string,
  client?: PoolClient,
): Promise<void> {
  const result = await tenantQuery(
    client,
    `UPDATE connections SET deleted_at = NOW(), updated_at = NOW()
     WHERE tenant_id = $1 AND id = $2 AND deleted_at IS NULL
     RETURNING id`,
    [tenantId, id],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Connection not found');
  }

  await logAudit(tenantId, actorId, 'connection.deleted', id, undefined, client);

  logger.info({ tenantId, connectionId: id }, 'Connection soft-deleted');
}

// ── Test Connection ──────────────────────────────────────────────────────────
export async function testConnection(
  tenantId: string,
  id: string,
  client?: PoolClient,
): Promise<TestResult> {
  const result = await tenantQuery(
    client,
    `SELECT connection_type, ords_url, db_host, service_name, encrypted_credentials
     FROM connections
     WHERE tenant_id = $1 AND id = $2 AND deleted_at IS NULL`,
    [tenantId, id],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Connection not found');
  }

  const row = result.rows[0];
  const type = row.connection_type as 'ords' | 'jdbc';
  const encryptedCreds = row.encrypted_credentials as {
    iv: string;
    encrypted: string;
    authTag: string;
    keyId: string;
  };

  const creds = decryptCredentials(encryptedCreds, tenantId);

  let testResult: TestResult;

  if (type === 'ords') {
    testResult = await testOrdsConnection({
      ordsBaseUrl: row.ords_url as string,
      username: creds.username,
      password: creds.password,
    });
  } else {
    testResult = await testJdbcConnection({
      host: row.db_host as string,
      port: 1521,
      serviceName: row.service_name as string,
      username: creds.username,
      password: creds.password,
    });
  }

  // Update status based on test result
  let newStatus: ConnectionStatus;
  if (testResult.success) {
    newStatus = testResult.latencyMs >= 3000 ? 'degraded' : 'connected';
  } else {
    newStatus = 'disconnected';
  }

  await tenantQuery(
    client,
    `UPDATE connections
     SET status = $1, last_check_at = NOW(), last_latency_ms = $2,
         consecutive_failures = CASE WHEN $3 THEN 0 ELSE consecutive_failures + 1 END,
         updated_at = NOW()
     WHERE id = $4`,
    [newStatus, testResult.latencyMs, testResult.success, id],
  );

  return testResult;
}

// ── Get Health Status ────────────────────────────────────────────────────────
export async function getHealthStatus(
  tenantId: string,
  id: string,
  client?: PoolClient,
): Promise<ConnectionHealth> {
  const result = await tenantQuery(
    client,
    `SELECT id, status, last_check_at, last_latency_ms, consecutive_failures
     FROM connections
     WHERE tenant_id = $1 AND id = $2 AND deleted_at IS NULL`,
    [tenantId, id],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Connection not found');
  }

  const row = result.rows[0];

  return {
    connectionId: row.id as string,
    status: (row.status ?? 'unknown') as ConnectionStatus,
    lastHealthCheck: (row.last_check_at as Date) ?? null,
    lastLatencyMs: (row.last_latency_ms as number) ?? null,
    consecutiveFailures: (row.consecutive_failures as number) ?? 0,
  };
}
