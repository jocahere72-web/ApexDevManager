import pg from 'pg';

const { Pool } = pg;

let testPool: pg.Pool | null = null;

/**
 * Connect to the test database using TEST_DATABASE_URL.
 * Returns the pool instance for use in test queries.
 */
export async function setupTestDb(): Promise<pg.Pool> {
  const connectionString = process.env.TEST_DATABASE_URL;

  if (!connectionString) {
    throw new Error('TEST_DATABASE_URL environment variable is required for integration tests');
  }

  testPool = new Pool({
    connectionString,
    max: 5,
  });

  // Verify connectivity
  const client = await testPool.connect();
  client.release();

  return testPool;
}

/**
 * Close the test database pool and clean up.
 */
export async function teardownTestDb(): Promise<void> {
  if (testPool) {
    await testPool.end();
    testPool = null;
  }
}

/**
 * Get the current test pool instance.
 * Throws if setupTestDb has not been called.
 */
export function getTestPool(): pg.Pool {
  if (!testPool) {
    throw new Error('Test database not initialized. Call setupTestDb() first.');
  }
  return testPool;
}
