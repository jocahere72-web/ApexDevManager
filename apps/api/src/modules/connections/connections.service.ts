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
  description?: string | null;
  ordsBaseUrl?: string | null;
  ordsUsername?: string | null;
  dbHost?: string | null;
  dbPort?: number | null;
  dbServiceName?: string | null;
  dbSid?: string | null;
  dbUsername?: string | null;
  schemaName?: string | null;
  workspaceName?: string | null;
  apexWorkspace?: string | null;
  apexAppId?: number | null;
  apexBaseUrl?: string | null;
  apexVersion?: string | null;
}

export interface ConnectionHealth {
  connectionId: string;
  status: ConnectionStatus;
  lastHealthCheck: Date | null;
  lastLatencyMs: number | null;
  consecutiveFailures: number;
}

export interface DatabaseTestInput {
  connectionId?: string;
  host?: string;
  port?: number;
  serviceName?: string;
  username?: string;
  password?: string;
}

export interface ConnectionSecrets {
  ordsPassword: string | null;
  dbPassword: string | null;
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
    // Extended fields
    description: (row.description as string) ?? null,
    ordsBaseUrl: (row.ords_url as string) ?? null,
    ordsUsername: (row.ords_username as string) ?? null,
    dbHost: (row.db_host as string) ?? null,
    dbPort: (row.db_port as number) ?? 1521,
    dbServiceName: (row.service_name as string) ?? null,
    dbSid: (row.db_sid as string) ?? null,
    dbUsername: (row.db_username as string) ?? null,
    schemaName: (row.schema_name as string) ?? null,
    workspaceName: (row.workspace_name as string) ?? null,
    apexWorkspace: (row.apex_workspace as string) ?? null,
    apexAppId: (row.apex_app_id as number) ?? null,
    apexBaseUrl: (row.apex_base_url as string) ?? null,
    apexVersion: (row.apex_version as string) ?? null,
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

  // Encrypt DB password if provided
  let dbPasswordEncrypted: string | null = null;
  const dbPass = (data as any).dbPassword;
  if (dbPass) {
    const encDbCreds = encryptCredentials(
      { username: (data as any).dbUsername || '', password: dbPass },
      tenantId,
    );
    dbPasswordEncrypted = JSON.stringify(encDbCreds);
  }

  const result = await tenantQuery(
    client,
    `INSERT INTO connections (
       tenant_id, name, connection_type, environment, ords_url, db_host, service_name,
       schema_name, workspace_name, db_port, db_username, db_sid,
       apex_workspace, apex_app_id, apex_base_url, apex_version,
       ords_username, description, db_password_encrypted,
       encrypted_credentials, status, tags, labels, is_active, consecutive_failures,
       last_check_at, last_latency_ms, change_log, created_at, updated_at
     )
     VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, true, 0, NOW(), $24, $25, NOW(), NOW())
     RETURNING *`,
    [
      tenantId,
      data.name,
      data.type,
      data.environment,
      (data as any).ordsBaseUrl || null,
      (data as any).host || null,
      (data as any).serviceName || null,
      (data as any).schemaName || null,
      (data as any).apexWorkspace || (data as any).workspaceName || null,
      (data as any).port || 1521,
      (data as any).dbUsername || null,
      (data as any).dbSid || null,
      (data as any).apexWorkspace || null,
      (data as any).apexAppId || null,
      (data as any).apexBaseUrl || null,
      (data as any).apexVersion || null,
      (data as any).ordsUsername || (data as any).username || null,
      (data as any).description || null,
      dbPasswordEncrypted,
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

  await logAudit(
    tenantId,
    actorId,
    'connection.created',
    connection.id,
    {
      name: data.name,
      type: data.type,
      environment: data.environment,
      testSuccess: testResult.success,
    },
    client,
  );

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
              schema_name, workspace_name, db_port, db_username, db_sid,
              apex_workspace, apex_app_id, apex_base_url, apex_version,
              ords_username, description,
              status, tags, labels, is_active, last_check_at, last_latency_ms,
              consecutive_failures, created_at, updated_at
       FROM connections
       WHERE ${whereClause}
       ORDER BY created_at DESC
       LIMIT $${paramIndex} OFFSET $${paramIndex + 1}`,
      [...params, query.limit, offset],
    ),
    tenantQuery(
      client,
      `SELECT COUNT(*)::int AS total FROM connections WHERE ${whereClause}`,
      params,
    ),
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
            schema_name, workspace_name, db_port, db_username, db_sid,
            apex_workspace, apex_app_id, apex_base_url, apex_version,
            ords_username, description,
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

// ── Get Connection Secrets ──────────────────────────────────────────────────
export async function getConnectionSecrets(
  tenantId: string,
  id: string,
  actorId: string,
  client?: PoolClient,
): Promise<ConnectionSecrets> {
  const result = await tenantQuery(
    client,
    `SELECT encrypted_credentials, db_password_encrypted
     FROM connections
     WHERE tenant_id = $1 AND id = $2 AND deleted_at IS NULL`,
    [tenantId, id],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Connection not found');
  }

  const row = result.rows[0];
  const ordsCredentials = row.encrypted_credentials
    ? decryptCredentials(row.encrypted_credentials as any, tenantId)
    : null;
  const dbCredentials = row.db_password_encrypted
    ? decryptCredentials(row.db_password_encrypted as any, tenantId)
    : null;

  await logAudit(
    tenantId,
    actorId,
    'connection.secrets.viewed',
    id,
    {
      ordsPasswordReturned: Boolean(ordsCredentials?.password),
      dbPasswordReturned: Boolean(dbCredentials?.password),
    },
    client,
  );

  return {
    ordsPassword: ordsCredentials?.password ?? null,
    dbPassword: dbCredentials?.password ?? null,
  };
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

  const addSetClause = (column: string, value: unknown) => {
    setClauses.push(`${column} = $${paramIndex}`);
    params.push(value);
    paramIndex++;
  };

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

    addSetClause('name', data.name);
  }

  if (data.environment !== undefined) {
    addSetClause('environment', data.environment);
  }

  if (data.tags !== undefined) {
    addSetClause('tags', data.tags);
  }

  if (data.labels !== undefined) {
    addSetClause('labels', JSON.stringify(data.labels));
  }

  if (data.description !== undefined) {
    addSetClause('description', data.description);
  }

  if (data.ordsBaseUrl !== undefined) {
    addSetClause('ords_url', data.ordsBaseUrl);
  }

  if (data.host !== undefined) {
    addSetClause('db_host', data.host);
  }

  if (data.port !== undefined) {
    addSetClause('db_port', data.port);
  }

  if (data.serviceName !== undefined) {
    addSetClause('service_name', data.serviceName);
  }

  if (data.schemaName !== undefined) {
    addSetClause('schema_name', data.schemaName);
  }

  if (data.workspaceName !== undefined) {
    addSetClause('workspace_name', data.workspaceName);
  }

  if (data.apexWorkspace !== undefined) {
    addSetClause('apex_workspace', data.apexWorkspace);
    if (data.workspaceName === undefined) {
      addSetClause('workspace_name', data.apexWorkspace);
    }
  }

  if (data.apexAppId !== undefined) {
    addSetClause('apex_app_id', data.apexAppId);
  }

  if (data.apexBaseUrl !== undefined) {
    addSetClause('apex_base_url', data.apexBaseUrl);
  }

  if (data.apexVersion !== undefined) {
    addSetClause('apex_version', data.apexVersion);
  }

  if (data.ordsUsername !== undefined) {
    addSetClause('ords_username', data.ordsUsername);
  }

  if (data.dbUsername !== undefined) {
    addSetClause('db_username', data.dbUsername);
  }

  if (data.dbSid !== undefined) {
    addSetClause('db_sid', data.dbSid);
  }

  if (
    data.username !== undefined ||
    (data.password !== undefined && data.password !== 'unchanged')
  ) {
    const currentCredsResult = await tenantQuery(
      client,
      `SELECT encrypted_credentials
       FROM connections
       WHERE tenant_id = $1 AND id = $2 AND deleted_at IS NULL`,
      [tenantId, id],
    );

    if (currentCredsResult.rowCount === 0) {
      throw new NotFoundError('Connection not found');
    }

    const currentCredentials = decryptCredentials(
      currentCredsResult.rows[0].encrypted_credentials as any,
      tenantId,
    );
    const encryptedCreds = encryptCredentials(
      {
        username: data.username ?? currentCredentials.username,
        password:
          data.password !== undefined && data.password !== 'unchanged'
            ? data.password
            : currentCredentials.password,
      },
      tenantId,
    );
    addSetClause('encrypted_credentials', encryptedCreds);
  }

  if (data.dbPassword !== undefined) {
    const encryptedDbPassword = encryptCredentials(
      { username: data.dbUsername ?? '', password: data.dbPassword },
      tenantId,
    );
    addSetClause('db_password_encrypted', encryptedDbPassword);
  }

  // Append to change_log
  setClauses.push(`change_log = change_log || $${paramIndex}::jsonb`);
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
               schema_name, workspace_name, db_port, db_username, db_sid,
               apex_workspace, apex_app_id, apex_base_url, apex_version,
               ords_username, description,
               status, tags, labels, is_active, last_check_at, last_latency_ms,
               consecutive_failures, created_at, updated_at`,
    params,
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Connection not found');
  }

  const connection = rowToProfile(result.rows[0]);

  await logAudit(
    tenantId,
    actorId,
    'connection.updated',
    id,
    data as Record<string, unknown>,
    client,
  );

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

// ── Test Database Connection From Form ───────────────────────────────────────
export async function testDatabaseConnection(
  tenantId: string,
  input: DatabaseTestInput,
  client?: PoolClient,
): Promise<TestResult> {
  let host = input.host;
  let port = input.port ?? 1521;
  let serviceName = input.serviceName;
  let username = input.username;
  let password = input.password;

  if (input.connectionId) {
    const result = await tenantQuery(
      client,
      `SELECT db_host, db_port, service_name, db_username, db_password_encrypted
       FROM connections
       WHERE tenant_id = $1 AND id = $2 AND deleted_at IS NULL`,
      [tenantId, input.connectionId],
    );

    if (result.rowCount === 0) {
      throw new NotFoundError('Connection not found');
    }

    const saved = result.rows[0];
    host = host || (saved.db_host as string | undefined);
    port = port || ((saved.db_port as number | undefined) ?? 1521);
    serviceName = serviceName || (saved.service_name as string | undefined);
    username = username || (saved.db_username as string | undefined);

    if (!password && saved.db_password_encrypted) {
      const savedCredentials = decryptCredentials(saved.db_password_encrypted as any, tenantId);
      password = savedCredentials.password;
      username = username || savedCredentials.username;
    }
  }

  if (!host || !serviceName || !username || !password) {
    return {
      success: false,
      latencyMs: 0,
      message:
        'Completa host, service name, usuario y contraseña de BD. En edición, guarda una contraseña BD al menos una vez para poder probarla sin volver a escribirla.',
    };
  }

  return testJdbcConnection({
    host,
    port,
    serviceName,
    username,
    password,
  });
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
