import { pool } from '../../config/database.js';
import { PoolClient } from 'pg';
import { tenantQuery } from '../../lib/tenant-db.js';
import { logger } from '../../lib/logger.js';
import { NotFoundError, AppError } from '../../lib/errors.js';
import { MCPClient, type MCPConnectionConfig } from '../../integrations/mcp/mcp-client.js';
import { decryptCredentials } from '../connections/encryption.service.js';
import { getConnectionForTenant, type ResolvedConnection } from '../connections/connections.repository.js';
import type {
  SchemaSnapshot,
  SchemaTable,
  SchemaColumn,
  SchemaIndex,
  DDLScript,
  SchemaDiff,
} from '@apex-dev-manager/shared-types';

// ── Row mapping ─────────────────────────────────────────────────────────────

interface SnapshotRow {
  id: string;
  tenant_id: string;
  connection_id: string;
  snapshot_data: { tables: SchemaTable[]; views: SchemaTable[] };
  tables_count: number;
  views_count: number;
  indexes_count: number;
  created_by: string | null;
  created_at: string;
}

function rowToSnapshot(row: SnapshotRow): SchemaSnapshot {
  return {
    id: row.id,
    tenantId: row.tenant_id,
    connectionId: row.connection_id,
    snapshotData: row.snapshot_data,
    tablesCount: row.tables_count,
    viewsCount: row.views_count,
    indexesCount: row.indexes_count,
    createdBy: row.created_by,
    createdAt: row.created_at,
  };
}

// ── Oracle identifier validation ────────────────────────────────────────────

const VALID_ORACLE_TYPES = ['TABLE', 'VIEW', 'PACKAGE', 'PACKAGE BODY', 'PROCEDURE', 'FUNCTION', 'TRIGGER', 'SEQUENCE', 'INDEX', 'SYNONYM', 'TYPE', 'TYPE BODY'];
function assertOracleIdentifier(name: string): string {
  const normalized = name.toUpperCase().replace(/[^A-Z0-9_$#]/g, '');
  if (!normalized || normalized.length > 128) throw new Error(`Invalid Oracle identifier: ${name}`);
  return normalized;
}
function assertOracleType(type: string): string {
  const normalized = type.toUpperCase();
  if (!VALID_ORACLE_TYPES.includes(normalized)) throw new Error(`Invalid Oracle type: ${type}`);
  return normalized;
}

// ── Helpers ──────────────────────────────────────────────────────────────────

async function getConnectionDetails(
  tenantId: string,
  connectionId: string,
): Promise<ResolvedConnection> {
  const conn = await getConnectionForTenant(tenantId, connectionId);
  if (!conn) throw new NotFoundError('Connection not found or inactive');
  return conn;
}

async function executeSqlViaOrds(
  tenantId: string,
  connectionId: string,
  sql: string,
): Promise<Record<string, unknown>[]> {
  const conn = await getConnectionDetails(tenantId, connectionId);
  const creds = decryptCredentials(conn.encryptedCredentials, conn.tenantId);
  const mcpConfig: MCPConnectionConfig = {
    baseUrl: (conn.config.ordsBaseUrl ?? '') as string,
    username: creds.username,
    password: creds.password,
    schema: conn.config.schema,
    tenantId,
    connectionId,
  };
  const mcp = new MCPClient(mcpConfig);
  try {
    await mcp.connect();
    const result = await mcp.query(sql);
    return result.rows ?? [];
  } finally {
    await mcp.disconnect();
  }
}

// ── Service functions ───────────────────────────────────────────────────────

export async function getSchema(
  tenantId: string,
  connectionId: string,
): Promise<{ tables: SchemaTable[]; views: SchemaTable[] }> {
  logger.info({ connectionId }, 'Fetching schema');

  // Fetch tables
  const tableRows = await executeSqlViaOrds(tenantId, connectionId, `
    SELECT table_name, owner
    FROM all_tables
    WHERE owner = SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA')
    ORDER BY table_name
  `);

  const tables: SchemaTable[] = [];
  for (const row of tableRows) {
    const tableName = row.table_name as string;
    const schema = row.owner as string;
    const columns = await getTableColumns(tenantId, connectionId, schema, tableName);
    const indexes = await getTableIndexes(tenantId, connectionId, schema, tableName);
    tables.push({ name: tableName, schema, columns, indexes });
  }

  // Fetch views
  const viewRows = await executeSqlViaOrds(tenantId, connectionId, `
    SELECT view_name, owner
    FROM all_views
    WHERE owner = SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA')
    ORDER BY view_name
  `);

  const views: SchemaTable[] = viewRows.map((row) => ({
    name: row.view_name as string,
    schema: row.owner as string,
    columns: [],
    indexes: [],
  }));

  return { tables, views };
}

async function getTableColumns(
  tenantId: string,
  connectionId: string,
  schema: string | undefined,
  tableName: string,
): Promise<SchemaColumn[]> {
  const schemaFilter = schema
    ? `owner = '${assertOracleIdentifier(schema)}'`
    : `owner = SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA')`;
  const rows = await executeSqlViaOrds(tenantId, connectionId, `
    SELECT column_name, data_type, nullable, data_default, column_id
    FROM all_tab_columns
    WHERE ${schemaFilter} AND table_name = '${assertOracleIdentifier(tableName)}'
    ORDER BY column_id
  `);

  return rows.map((row) => ({
    name: row.column_name as string,
    dataType: row.data_type as string,
    nullable: (row.nullable as string) === 'Y',
    defaultValue: (row.data_default as string) ?? null,
    isPrimaryKey: false,
    isForeignKey: false,
  }));
}

async function getTableIndexes(
  tenantId: string,
  connectionId: string,
  schema: string | undefined,
  tableName: string,
): Promise<SchemaIndex[]> {
  const schemaFilter = schema
    ? `i.table_owner = '${assertOracleIdentifier(schema)}'`
    : `i.table_owner = SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA')`;
  const rows = await executeSqlViaOrds(tenantId, connectionId, `
    SELECT i.index_name, i.uniqueness, i.index_type,
           LISTAGG(ic.column_name, ',') WITHIN GROUP (ORDER BY ic.column_position) as columns
    FROM all_indexes i
    JOIN all_ind_columns ic ON i.index_name = ic.index_name AND i.owner = ic.index_owner
    WHERE ${schemaFilter} AND i.table_name = '${assertOracleIdentifier(tableName)}'
    GROUP BY i.index_name, i.uniqueness, i.index_type
  `);

  return rows.map((row) => ({
    name: row.index_name as string,
    columns: (row.columns as string).split(','),
    isUnique: (row.uniqueness as string) === 'UNIQUE',
    indexType: row.index_type as string,
  }));
}

export async function getTable(
  tenantId: string,
  connectionId: string,
  tableName: string,
): Promise<SchemaTable> {
  const columns = await getTableColumns(tenantId, connectionId, undefined, tableName);
  const indexes = await getTableIndexes(tenantId, connectionId, undefined, tableName);

  return { name: tableName, schema: '', columns, indexes };
}

export async function getTableDDL(
  tenantId: string,
  connectionId: string,
  tableName: string,
): Promise<DDLScript> {
  const rows = await executeSqlViaOrds(tenantId, connectionId, `
    SELECT DBMS_METADATA.GET_DDL('TABLE', '${assertOracleIdentifier(tableName)}') AS ddl FROM DUAL
  `);

  return {
    objectType: 'TABLE',
    objectName: tableName,
    schema: '',
    ddl: (rows[0]?.ddl as string) ?? '',
  };
}

export async function compareSchemas(
  tenantId: string,
  snapshotIdA: string,
  snapshotIdB: string,
  client?: PoolClient,
): Promise<SchemaDiff> {
  const snapA = await getSnapshot(tenantId, snapshotIdA, client);
  const snapB = await getSnapshot(tenantId, snapshotIdB, client);

  const tablesA = new Map(snapA.snapshotData.tables.map((t) => [t.name, t]));
  const tablesB = new Map(snapB.snapshotData.tables.map((t) => [t.name, t]));

  const added: SchemaTable[] = [];
  const removed: SchemaTable[] = [];
  const modified: SchemaDiff['modified'] = [];

  // Tables in B but not in A = added
  for (const [name, table] of tablesB) {
    if (!tablesA.has(name)) {
      added.push(table);
    }
  }

  // Tables in A but not in B = removed
  for (const [name, table] of tablesA) {
    if (!tablesB.has(name)) {
      removed.push(table);
    }
  }

  // Tables in both = check for modifications
  for (const [name, tableA] of tablesA) {
    const tableB = tablesB.get(name);
    if (!tableB) continue;

    const colsA = new Map(tableA.columns.map((c) => [c.name, c]));
    const colsB = new Map(tableB.columns.map((c) => [c.name, c]));

    const addedColumns: SchemaColumn[] = [];
    const removedColumns: SchemaColumn[] = [];
    const modifiedColumns: { column: string; before: SchemaColumn; after: SchemaColumn }[] = [];

    for (const [colName, col] of colsB) {
      if (!colsA.has(colName)) addedColumns.push(col);
    }
    for (const [colName, col] of colsA) {
      if (!colsB.has(colName)) {
        removedColumns.push(col);
      } else {
        const colB = colsB.get(colName)!;
        if (col.dataType !== colB.dataType || col.nullable !== colB.nullable) {
          modifiedColumns.push({ column: colName, before: col, after: colB });
        }
      }
    }

    const idxA = new Set(tableA.indexes.map((i) => i.name));
    const idxB = new Set(tableB.indexes.map((i) => i.name));
    const addedIndexes = tableB.indexes.filter((i) => !idxA.has(i.name));
    const removedIndexes = tableA.indexes.filter((i) => !idxB.has(i.name));

    if (
      addedColumns.length > 0 ||
      removedColumns.length > 0 ||
      modifiedColumns.length > 0 ||
      addedIndexes.length > 0 ||
      removedIndexes.length > 0
    ) {
      modified.push({
        table: name,
        addedColumns,
        removedColumns,
        modifiedColumns,
        addedIndexes,
        removedIndexes,
      });
    }
  }

  return { added, removed, modified };
}

export async function createSnapshot(
  tenantId: string,
  connectionId: string,
  createdBy: string,
  client?: PoolClient,
): Promise<SchemaSnapshot> {
  const schema = await getSchema(tenantId, connectionId);

  const tablesCount = schema.tables.length;
  const viewsCount = schema.views.length;
  const indexesCount = schema.tables.reduce((sum, t) => sum + t.indexes.length, 0);

  const result = await tenantQuery(client,
    `INSERT INTO schema_snapshots (tenant_id, connection_id, snapshot_data, tables_count, views_count, indexes_count, created_by)
     VALUES ($1, $2, $3::jsonb, $4, $5, $6, $7)
     RETURNING *`,
    [tenantId, connectionId, JSON.stringify(schema), tablesCount, viewsCount, indexesCount, createdBy],
  );

  logger.info({ snapshotId: (result.rows[0] as SnapshotRow).id, tablesCount, viewsCount }, 'Schema snapshot created');
  return rowToSnapshot(result.rows[0] as SnapshotRow);
}

async function getSnapshot(tenantId: string, snapshotId: string, client?: PoolClient): Promise<SchemaSnapshot> {
  const result = await tenantQuery(client,
    `SELECT * FROM schema_snapshots WHERE tenant_id = $1 AND id = $2`,
    [tenantId, snapshotId],
  );
  if (result.rowCount === 0) {
    throw new NotFoundError('Schema snapshot not found');
  }
  return rowToSnapshot(result.rows[0] as SnapshotRow);
}

export async function listSnapshots(
  tenantId: string,
  connectionId?: string,
  limit = 20,
  offset = 0,
  client?: PoolClient,
): Promise<{ items: SchemaSnapshot[]; total: number }> {
  const conditions = ['tenant_id = $1'];
  const params: unknown[] = [tenantId];
  let idx = 2;

  if (connectionId) {
    conditions.push(`connection_id = $${idx++}`);
    params.push(connectionId);
  }

  const where = conditions.join(' AND ');
  const countResult = await tenantQuery(client,
    `SELECT COUNT(*) as count FROM schema_snapshots WHERE ${where}`,
    params,
  );

  const result = await tenantQuery(client,
    `SELECT * FROM schema_snapshots WHERE ${where} ORDER BY created_at DESC LIMIT $${idx++} OFFSET $${idx++}`,
    [...params, limit, offset],
  );

  return {
    items: (result.rows as SnapshotRow[]).map(rowToSnapshot),
    total: parseInt((countResult.rows[0] as { count: string }).count, 10),
  };
}

export async function generateERD(
  tenantId: string,
  connectionId: string,
): Promise<string> {
  const schema = await getSchema(tenantId, connectionId);

  // Generate Mermaid ERD
  const lines: string[] = ['erDiagram'];

  for (const table of schema.tables) {
    lines.push(`    ${table.name} {`);
    for (const col of table.columns) {
      const pk = col.isPrimaryKey ? 'PK' : '';
      const fk = col.isForeignKey ? 'FK' : '';
      const constraint = [pk, fk].filter(Boolean).join(',');
      lines.push(`        ${col.dataType} ${col.name}${constraint ? ` "${constraint}"` : ''}`);
    }
    lines.push('    }');
  }

  // Add relationships based on foreign keys
  for (const table of schema.tables) {
    for (const col of table.columns) {
      if (col.isForeignKey && col.referencesTable) {
        lines.push(`    ${col.referencesTable} ||--o{ ${table.name} : "${col.name}"`);
      }
    }
  }

  return lines.join('\n');
}
