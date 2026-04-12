import apiClient from '../lib/api-client';
import type {
  SchemaTable,
  SchemaSnapshot,
  DDLScript,
  SchemaDiff,
} from '@apex-dev-manager/shared-types';

// ---------------------------------------------------------------------------
// Get full schema for a connection
// ---------------------------------------------------------------------------

export async function getSchema(
  connectionId: string,
): Promise<{ tables: SchemaTable[]; views: SchemaTable[] }> {
  const { data } = await apiClient.get<{ data: { tables: SchemaTable[]; views: SchemaTable[] } }>(
    `/schema-inspector/schema/${connectionId}`,
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Get single table detail
// ---------------------------------------------------------------------------

export async function getTable(
  connectionId: string,
  tableName: string,
): Promise<SchemaTable> {
  const { data } = await apiClient.get<{ data: SchemaTable }>(
    `/schema-inspector/tables/${connectionId}/${tableName}`,
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Get table DDL
// ---------------------------------------------------------------------------

export async function getTableDDL(
  connectionId: string,
  tableName: string,
): Promise<DDLScript> {
  const { data } = await apiClient.get<{ data: DDLScript }>(
    `/schema-inspector/ddl/${connectionId}/${tableName}`,
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Compare two snapshots
// ---------------------------------------------------------------------------

export async function compareSchemas(
  snapshotIdA: string,
  snapshotIdB: string,
): Promise<SchemaDiff> {
  const { data } = await apiClient.post<{ data: SchemaDiff }>(
    '/schema-inspector/compare',
    { snapshotIdA, snapshotIdB },
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Create a schema snapshot
// ---------------------------------------------------------------------------

export async function createSnapshot(connectionId: string): Promise<SchemaSnapshot> {
  const { data } = await apiClient.post<{ data: SchemaSnapshot }>(
    '/schema-inspector/snapshot',
    { connectionId },
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// List snapshots
// ---------------------------------------------------------------------------

export async function listSnapshots(
  connectionId?: string,
  limit?: number,
  offset?: number,
): Promise<{ items: SchemaSnapshot[]; total: number }> {
  const { data } = await apiClient.get<{ data: { items: SchemaSnapshot[]; total: number } }>(
    '/schema-inspector/snapshots',
    { params: { connectionId, limit, offset } },
  );
  return data.data;
}

// ---------------------------------------------------------------------------
// Generate ERD
// ---------------------------------------------------------------------------

export async function generateERD(connectionId: string): Promise<string> {
  const { data } = await apiClient.get<{ data: { erd: string } }>(
    `/schema-inspector/erd/${connectionId}`,
  );
  return data.data.erd;
}
