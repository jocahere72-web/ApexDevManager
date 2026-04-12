import { PoolClient } from 'pg';
import { pool } from '../config/database.js';

/**
 * Execute a query using a tenant-scoped client if available,
 * falling back to the shared pool for non-tenant contexts.
 */
export async function tenantQuery(
  client: PoolClient | undefined,
  text: string,
  params?: any[]
) {
  if (client) {
    return client.query(text, params);
  }
  return pool.query(text, params);
}
