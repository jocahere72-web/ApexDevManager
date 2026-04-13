import { logger } from '../../lib/logger.js';
import { tenantQuery } from '../../lib/tenant-db.js';
import { NotFoundError, ConflictError } from '../../lib/errors.js';
import type {
  CreateClientInput,
  UpdateClientInput,
  ListClientsQuery,
} from './clients.validation.js';
import type { PoolClient } from 'pg';

// ── Types ────────────────────────────────────────────────────────────────────
export interface ClientRow {
  id: string;
  tenantId: string;
  name: string;
  code: string;
  description: string | null;
  connectionId: string | null;
  connectionName: string | null;
  appId: number | null;
  contactName: string | null;
  contactEmail: string | null;
  isActive: boolean;
  createdBy: string | null;
  createdAt: string;
  updatedAt: string;
}

// ── Row mapper ──────────────────────────────────────────────────────────────
function rowToClient(row: Record<string, unknown>): ClientRow {
  return {
    id: row.id as string,
    tenantId: row.tenant_id as string,
    name: row.name as string,
    code: row.code as string,
    description: (row.description as string) ?? null,
    connectionId: (row.connection_id as string) ?? null,
    connectionName: (row.connection_name as string) ?? null,
    appId: (row.app_id as number) ?? null,
    contactName: (row.contact_name as string) ?? null,
    contactEmail: (row.contact_email as string) ?? null,
    isActive: row.is_active as boolean,
    createdBy: (row.created_by as string) ?? null,
    createdAt: (row.created_at as Date).toISOString(),
    updatedAt: (row.updated_at as Date).toISOString(),
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
       VALUES ($1, $2, 'client_management', $3, 'client', $4, $5, NOW())`,
      [tenantId, actorId, action, targetId, details ? JSON.stringify(details) : null],
    );
  } catch (err) {
    logger.error({ err, tenantId, actorId, action, targetId }, 'Failed to write audit log');
  }
}

// ── Select columns ──────────────────────────────────────────────────────────
const SELECT_COLS = `id, tenant_id, name, code, description, connection_id, app_id,
  contact_name, contact_email, is_active, created_by, created_at, updated_at`;

const SELECT_WITH_CONNECTION = `clients.id, clients.tenant_id, clients.name, clients.code, clients.description, clients.connection_id, clients.app_id,
  clients.contact_name, clients.contact_email, clients.is_active, clients.created_by, clients.created_at, clients.updated_at,
  conn.name AS connection_name`;

// ── Create Client ───────────────────────────────────────────────────────────
export async function createClient(
  tenantId: string,
  data: CreateClientInput,
  actorId: string,
  client?: PoolClient,
): Promise<ClientRow> {
  // Check for duplicate code within tenant
  const existing = await tenantQuery(
    client,
    `SELECT id FROM clients WHERE tenant_id = $1 AND code = $2`,
    [tenantId, data.code],
  );

  if (existing.rowCount && existing.rowCount > 0) {
    throw new ConflictError('A client with this code already exists');
  }

  const result = await tenantQuery(
    client,
    `INSERT INTO clients (tenant_id, name, code, description, connection_id, app_id, contact_name, contact_email, created_by)
     VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
     RETURNING ${SELECT_COLS}`,
    [
      tenantId,
      data.name,
      data.code,
      data.description ?? null,
      data.connectionId ?? null,
      data.appId ?? null,
      data.contactName ?? null,
      data.contactEmail ?? null,
      actorId,
    ],
  );

  const created = rowToClient(result.rows[0]);

  await logAudit(
    tenantId,
    actorId,
    'client.created',
    created.id,
    {
      name: data.name,
      code: data.code,
    },
    client,
  );

  logger.info({ tenantId, clientId: created.id, code: data.code }, 'Client created');

  return created;
}

// ── List Clients ────────────────────────────────────────────────────────────
export async function listClients(
  tenantId: string,
  query: ListClientsQuery,
  client?: PoolClient,
): Promise<{ clients: ClientRow[]; total: number }> {
  const conditions: string[] = ['clients.tenant_id = $1'];
  const params: unknown[] = [tenantId];
  let paramIndex = 2;

  if (query.search) {
    conditions.push(`(clients.name ILIKE $${paramIndex} OR clients.code ILIKE $${paramIndex})`);
    params.push(`%${query.search}%`);
    paramIndex++;
  }

  conditions.push(`clients.is_active = $${paramIndex}`);
  params.push(query.isActive ?? true);
  paramIndex++;

  const whereClause = conditions.join(' AND ');
  const offset = (query.page - 1) * query.limit;

  const [dataResult, countResult] = await Promise.all([
    tenantQuery(
      client,
      `SELECT ${SELECT_WITH_CONNECTION}
       FROM clients
       LEFT JOIN connections conn ON conn.id = clients.connection_id AND conn.tenant_id = clients.tenant_id
       WHERE ${whereClause}
       ORDER BY clients.name ASC
       LIMIT $${paramIndex} OFFSET $${paramIndex + 1}`,
      [...params, query.limit, offset],
    ),
    tenantQuery(client, `SELECT COUNT(*)::int AS total FROM clients WHERE ${whereClause}`, params),
  ]);

  return {
    clients: dataResult.rows.map(rowToClient),
    total: countResult.rows[0].total as number,
  };
}

// ── Get Client By ID ────────────────────────────────────────────────────────
export async function getClientById(
  tenantId: string,
  id: string,
  client?: PoolClient,
): Promise<ClientRow> {
  const result = await tenantQuery(
    client,
    `SELECT ${SELECT_WITH_CONNECTION}
     FROM clients
     LEFT JOIN connections conn ON conn.id = clients.connection_id AND conn.tenant_id = clients.tenant_id
     WHERE clients.tenant_id = $1 AND clients.id = $2`,
    [tenantId, id],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Client not found');
  }

  return rowToClient(result.rows[0]);
}

// ── Update Client ───────────────────────────────────────────────────────────
export async function updateClient(
  tenantId: string,
  id: string,
  data: UpdateClientInput,
  actorId: string,
  client?: PoolClient,
): Promise<ClientRow> {
  const setClauses: string[] = ['updated_at = NOW()'];
  const params: unknown[] = [tenantId, id];
  let paramIndex = 3;

  if (data.name !== undefined) {
    setClauses.push(`name = $${paramIndex}`);
    params.push(data.name);
    paramIndex++;
  }

  if (data.description !== undefined) {
    setClauses.push(`description = $${paramIndex}`);
    params.push(data.description);
    paramIndex++;
  }

  if (data.connectionId !== undefined) {
    setClauses.push(`connection_id = $${paramIndex}`);
    params.push(data.connectionId);
    paramIndex++;
  }

  if (data.appId !== undefined) {
    setClauses.push(`app_id = $${paramIndex}`);
    params.push(data.appId);
    paramIndex++;
  }

  if (data.contactName !== undefined) {
    setClauses.push(`contact_name = $${paramIndex}`);
    params.push(data.contactName);
    paramIndex++;
  }

  if (data.contactEmail !== undefined) {
    setClauses.push(`contact_email = $${paramIndex}`);
    params.push(data.contactEmail);
    paramIndex++;
  }

  const result = await tenantQuery(
    client,
    `UPDATE clients SET ${setClauses.join(', ')}
     WHERE tenant_id = $1 AND id = $2
     RETURNING ${SELECT_COLS}`,
    params,
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Client not found');
  }

  const updated = rowToClient(result.rows[0]);

  await logAudit(tenantId, actorId, 'client.updated', id, data as Record<string, unknown>, client);

  logger.info({ tenantId, clientId: id }, 'Client updated');

  return updated;
}

// ── Delete Client (soft) ────────────────────────────────────────────────────
export async function deleteClient(
  tenantId: string,
  id: string,
  actorId: string,
  client?: PoolClient,
): Promise<void> {
  const result = await tenantQuery(
    client,
    `UPDATE clients SET is_active = false, updated_at = NOW()
     WHERE tenant_id = $1 AND id = $2 AND is_active = true
     RETURNING id`,
    [tenantId, id],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Client not found');
  }

  await logAudit(tenantId, actorId, 'client.deleted', id, undefined, client);

  logger.info({ tenantId, clientId: id }, 'Client soft-deleted');
}
