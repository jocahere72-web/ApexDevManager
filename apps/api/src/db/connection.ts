import pg from 'pg';
import { logger } from '../logger.js';

const { Client } = pg;

let directClient: pg.Client | null = null;

/**
 * Get a direct PostgreSQL connection (bypasses PgBouncer).
 * Used exclusively for running migrations where session-level
 * features (advisory locks, temp tables) are required.
 */
export async function getDirectConnection(): Promise<pg.Client> {
  if (directClient) {
    return directClient;
  }

  const databaseUrl = process.env.DATABASE_URL;
  if (!databaseUrl) {
    throw new Error('DATABASE_URL environment variable is not set');
  }

  directClient = new Client({
    connectionString: databaseUrl,
    connectionTimeoutMillis: 10000,
  });

  await directClient.connect();
  logger.info('Direct database connection established for migrations');

  return directClient;
}

/**
 * Close the direct database connection.
 * Should be called after migration operations complete.
 */
export async function closeDirectConnection(): Promise<void> {
  if (directClient) {
    await directClient.end();
    directClient = null;
    logger.info('Direct database connection closed');
  }
}
