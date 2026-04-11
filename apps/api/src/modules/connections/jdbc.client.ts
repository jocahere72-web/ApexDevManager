import { logger } from '../../lib/logger.js';
import type { TestResult } from './connections.validation.js';

// ── Types ────────────────────────────────────────────────────────────────────
export interface JdbcConfig {
  host: string;
  port: number;
  serviceName: string;
  username: string;
  password: string;
}

// ── Constants ────────────────────────────────────────────────────────────────
const CONNECTION_TIMEOUT_MS = 10_000;

/**
 * Attempt to load the oracledb module.
 *
 * oracledb is an optional dependency - JDBC testing requires it,
 * but the application can start without it if only ORDS connections
 * are used.
 */
async function getOracleDb(): Promise<typeof import('oracledb') | null> {
  try {
    const oracledb = await import('oracledb');
    return oracledb.default ?? oracledb;
  } catch {
    logger.warn(
      'oracledb module not available. JDBC connection testing is disabled. ' +
        'Install oracledb to enable: npm install oracledb',
    );
    return null;
  }
}

/**
 * Test a JDBC (Oracle) connection by executing a simple query.
 *
 * Uses oracledb's thin client to connect, runs `SELECT 1 FROM DUAL`,
 * measures latency, and returns a structured result. Gracefully
 * handles the case where oracledb is not installed.
 */
export async function testJdbcConnection(config: JdbcConfig): Promise<TestResult> {
  const startTime = performance.now();

  const oracledb = await getOracleDb();

  if (!oracledb) {
    return {
      success: false,
      latencyMs: Math.round(performance.now() - startTime),
      message:
        'oracledb driver is not installed. Install it with: npm install oracledb',
    };
  }

  let connection: Awaited<ReturnType<typeof oracledb.getConnection>> | null = null;

  try {
    const connectString = `${config.host}:${config.port}/${config.serviceName}`;

    connection = await oracledb.getConnection({
      user: config.username,
      password: config.password,
      connectString,
      // Use thin mode (no Oracle Client needed)
    });

    // Set a statement timeout
    const result = await connection.execute('SELECT 1 FROM DUAL', [], {
      outFormat: oracledb.OUT_FORMAT_OBJECT,
    });

    const latencyMs = Math.round(performance.now() - startTime);

    if (latencyMs > CONNECTION_TIMEOUT_MS) {
      return {
        success: false,
        latencyMs,
        message: `Connection succeeded but took ${latencyMs}ms (exceeds ${CONNECTION_TIMEOUT_MS}ms timeout)`,
      };
    }

    logger.debug(
      { host: config.host, port: config.port, serviceName: config.serviceName, latencyMs },
      'JDBC connection test succeeded',
    );

    return {
      success: true,
      latencyMs,
      message: 'Connection successful',
      details: {
        rowCount: result.rows?.length ?? 0,
        connectString,
      },
    };
  } catch (err) {
    const latencyMs = Math.round(performance.now() - startTime);
    const error = err as Error;

    logger.warn(
      { err, host: config.host, port: config.port, serviceName: config.serviceName },
      'JDBC connection test failed',
    );

    return {
      success: false,
      latencyMs,
      message: `Connection failed: ${error.message}`,
    };
  } finally {
    if (connection) {
      try {
        await connection.close();
      } catch (closeErr) {
        logger.warn({ err: closeErr }, 'Failed to close JDBC test connection');
      }
    }
  }
}
