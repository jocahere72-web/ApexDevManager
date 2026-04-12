import { Queue, Worker, type Job } from 'bullmq';
import { pool } from '../../config/database.js';
import { logger } from '../../lib/logger.js';
import { decryptCredentials } from './encryption.service.js';
import { testOrdsConnection } from './ords.client.js';
import { testJdbcConnection } from './jdbc.client.js';
import type { ConnectionStatus } from './connections.validation.js';

// ── Types ────────────────────────────────────────────────────────────────────
interface HealthCheckPayload {
  timestamp: string;
}

interface ConnectionRow {
  id: string;
  tenant_id: string;
  connection_type: 'ords' | 'jdbc';
  encrypted_credentials: Record<string, unknown>;
  ords_url: string | null;
  db_host: string | null;
  service_name: string | null;
  status: ConnectionStatus;
  consecutive_failures: number;
}

// ── Constants ────────────────────────────────────────────────────────────────
const QUEUE_NAME = 'connection-health-check';
const JOB_NAME = 'check-all-connections';
const REPEAT_INTERVAL_MS = 5 * 60 * 1000; // 5 minutes
const CONCURRENCY_LIMIT = 10;
const DEGRADED_LATENCY_THRESHOLD_MS = 3000;
const DISCONNECTED_FAILURE_THRESHOLD = 3;

/**
 * Register the repeatable health check job.
 *
 * Creates a BullMQ queue and adds a repeatable job that runs every 5 minutes.
 * The job checks all active connections and updates their status in the database.
 */
export async function registerHealthCheckJob(redisUrl: string): Promise<{
  queue: Queue;
  worker: Worker;
}> {
  const connection = { url: redisUrl };

  const queue = new Queue<HealthCheckPayload>(QUEUE_NAME, {
    connection,
    defaultJobOptions: {
      removeOnComplete: { count: 100 },
      removeOnFail: { count: 50 },
      attempts: 1,
    },
  });

  // Add repeatable job (idempotent - won't duplicate if already exists)
  await queue.add(
    JOB_NAME,
    { timestamp: new Date().toISOString() },
    {
      repeat: { every: REPEAT_INTERVAL_MS },
      jobId: 'health-check-repeatable',
    },
  );

  const worker = new Worker<HealthCheckPayload>(
    QUEUE_NAME,
    async (job: Job<HealthCheckPayload>) => {
      await processHealthCheck(job);
    },
    {
      connection,
      concurrency: 1, // Only one health check cycle at a time
      limiter: {
        max: 1,
        duration: 60_000, // At most once per minute
      },
    },
  );

  worker.on('completed', (job) => {
    logger.info({ jobId: job.id }, 'Health check cycle completed');
  });

  worker.on('failed', (job, err) => {
    logger.error({ jobId: job?.id, err }, 'Health check cycle failed');
  });

  logger.info('Connection health check job registered (every 5 minutes)');

  return { queue, worker };
}

/**
 * Process a single health check cycle.
 *
 * Fetches all active (non-deleted) connections and tests each one
 * with a concurrency limit. Updates connection status based on results:
 * - latency < 3000ms -> connected
 * - latency >= 3000ms -> degraded
 * - failure + consecutive_failures >= 3 -> disconnected
 * - failure + consecutive_failures < 3 -> increments counter
 */
async function processHealthCheck(job: Job<HealthCheckPayload>): Promise<void> {
  logger.info({ jobId: job.id, timestamp: job.data.timestamp }, 'Starting health check cycle');

  // Fetch all active connections
  const result = await pool.query<ConnectionRow>(
    `SELECT id, tenant_id, connection_type, encrypted_credentials, ords_url, db_host, service_name, status, consecutive_failures
     FROM connections
     WHERE deleted_at IS NULL AND is_active = true`,
  );

  const connections = result.rows;
  logger.info({ connectionCount: connections.length }, 'Connections to check');

  if (connections.length === 0) {
    return;
  }

  // Process in batches with concurrency limit
  const batches: ConnectionRow[][] = [];
  for (let i = 0; i < connections.length; i += CONCURRENCY_LIMIT) {
    batches.push(connections.slice(i, i + CONCURRENCY_LIMIT));
  }

  for (const batch of batches) {
    await Promise.allSettled(batch.map((conn) => checkSingleConnection(conn)));
  }

  logger.info({ jobId: job.id, checkedCount: connections.length }, 'Health check cycle complete');
}

/**
 * Check a single connection and update its status in the database.
 */
async function checkSingleConnection(conn: ConnectionRow): Promise<void> {
  try {
    const creds = decryptCredentials(
      conn.encrypted_credentials as {
        iv: string;
        encrypted: string;
        authTag: string;
        keyId: string;
      },
      conn.tenant_id,
    );

    let testResult;

    if (conn.connection_type === 'ords') {
      testResult = await testOrdsConnection({
        ordsBaseUrl: conn.ords_url as string,
        username: creds.username,
        password: creds.password,
      });
    } else {
      testResult = await testJdbcConnection({
        host: conn.db_host as string,
        port: 1521,
        serviceName: conn.service_name as string,
        username: creds.username,
        password: creds.password,
      });
    }

    let newStatus: ConnectionStatus;
    let consecutiveFailures: number;

    if (testResult.success) {
      consecutiveFailures = 0;
      newStatus =
        testResult.latencyMs >= DEGRADED_LATENCY_THRESHOLD_MS ? 'degraded' : 'connected';
    } else {
      consecutiveFailures = conn.consecutive_failures + 1;
      newStatus =
        consecutiveFailures >= DISCONNECTED_FAILURE_THRESHOLD ? 'disconnected' : conn.status;
    }

    await pool.query(
      `UPDATE connections
       SET status = $1,
           consecutive_failures = $2,
           last_check_at = NOW(),
           last_latency_ms = $3,
           updated_at = NOW()
       WHERE id = $4`,
      [newStatus, consecutiveFailures, testResult.latencyMs, conn.id],
    );

    logger.debug(
      {
        connectionId: conn.id,
        type: conn.connection_type,
        oldStatus: conn.status,
        newStatus,
        latencyMs: testResult.latencyMs,
        success: testResult.success,
      },
      'Connection health check result',
    );
  } catch (err) {
    logger.error({ err, connectionId: conn.id }, 'Failed to check connection health');

    // Increment failure count on unexpected errors
    const newFailures = conn.consecutive_failures + 1;
    const newStatus =
      newFailures >= DISCONNECTED_FAILURE_THRESHOLD ? 'disconnected' : conn.status;

    await pool.query(
      `UPDATE connections
       SET status = $1,
           consecutive_failures = $2,
           last_check_at = NOW(),
           updated_at = NOW()
       WHERE id = $3`,
      [newStatus, newFailures, conn.id],
    );
  }
}
