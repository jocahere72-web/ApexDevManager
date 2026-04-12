import { pool } from '../../config/database.js';
import { decryptCredentials } from './encryption.service.js';
import { PoolClient } from 'pg';
import { tenantQuery } from '../../lib/tenant-db.js';

export interface ResolvedConnection {
  id: string;
  tenantId: string;
  type: string;
  config: {
    ordsBaseUrl?: string;
    host?: string;
    serviceName?: string;
    schema?: string;
    workspaceName?: string;
  };
  encryptedCredentials: any;
}

export async function getConnectionForTenant(
  tenantId: string,
  connectionId: string,
  client?: PoolClient
): Promise<ResolvedConnection | null> {
  const result = await tenantQuery(client,
    `SELECT id, tenant_id, connection_type, ords_url, db_host, service_name,
            schema_name, workspace_name, encrypted_credentials
     FROM connections
     WHERE tenant_id = $1 AND id = $2 AND deleted_at IS NULL AND is_active = true`,
    [tenantId, connectionId]
  );
  if (result.rows.length === 0) return null;
  const row = result.rows[0];
  return {
    id: row.id,
    tenantId: row.tenant_id,
    type: row.connection_type,
    config: {
      ordsBaseUrl: row.ords_url,
      host: row.db_host,
      serviceName: row.service_name,
      schema: row.schema_name,
      workspaceName: row.workspace_name,
    },
    encryptedCredentials: row.encrypted_credentials,
  };
}
