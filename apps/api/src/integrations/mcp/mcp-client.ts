import { logger } from '../../lib/logger.js';
import { AppError, InternalError } from '../../lib/errors.js';

// ── Types ────────────────────────────────────────────────────────────────────

export interface MCPConnectionConfig {
  /** MCP server base URL (e.g. http://mcp-server:8080) */
  baseUrl: string;
  /** Database username for the MCP session */
  username: string;
  /** Database password for the MCP session */
  password: string;
  /** Optional Oracle schema to set as current */
  schema?: string;
}

export interface MCPQueryResult {
  columns: string[];
  rows: Record<string, unknown>[];
  rowCount: number;
}

export interface MCPHealthStatus {
  healthy: boolean;
  latencyMs: number;
  serverVersion?: string;
  message: string;
}

// ── Error Codes ──────────────────────────────────────────────────────────────

const MCP_ERROR_CODES = {
  CONNECTION_FAILED: 'MCP_CONNECTION_FAILED',
  QUERY_FAILED: 'MCP_QUERY_FAILED',
  TIMEOUT: 'MCP_TIMEOUT',
  AUTH_FAILED: 'MCP_AUTH_FAILED',
  SERVER_ERROR: 'MCP_SERVER_ERROR',
  DISCONNECTED: 'MCP_DISCONNECTED',
} as const;

/** Transient error codes that warrant a retry */
const TRANSIENT_ERRORS = new Set([
  'ECONNRESET',
  'ECONNREFUSED',
  'ETIMEDOUT',
  'EPIPE',
  'EAI_AGAIN',
  'UND_ERR_SOCKET',
  'FETCH_ERROR',
]);

// ── Constants ────────────────────────────────────────────────────────────────

const DEFAULT_TIMEOUT_MS = 30_000;
const MAX_RETRIES = 1;

// ── Tenant Connection Pool ───────────────────────────────────────────────────

interface PoolEntry {
  config: MCPConnectionConfig;
  sessionToken: string | null;
  lastUsed: number;
}

const tenantPools = new Map<string, PoolEntry>();

/** Evict idle pool entries older than 10 minutes */
function evictStaleEntries(): void {
  const cutoff = Date.now() - 10 * 60 * 1000;
  for (const [key, entry] of tenantPools) {
    if (entry.lastUsed < cutoff) {
      tenantPools.delete(key);
      logger.debug({ poolKey: key }, 'MCP: evicted stale pool entry');
    }
  }
}

// Run eviction every 5 minutes
setInterval(evictStaleEntries, 5 * 60 * 1000).unref();

// ── Helper: Map error to app error code ──────────────────────────────────────

function mapErrorToAppError(err: unknown, context: string): AppError {
  const error = err as Error & { code?: string };

  if (error.name === 'AbortError') {
    return new AppError(
      `MCP request timed out: ${context}`,
      504,
      MCP_ERROR_CODES.TIMEOUT,
    );
  }

  if (error.code && TRANSIENT_ERRORS.has(error.code)) {
    return new AppError(
      `MCP connection failed: ${error.message}`,
      502,
      MCP_ERROR_CODES.CONNECTION_FAILED,
    );
  }

  return new AppError(
    `MCP error: ${error.message}`,
    502,
    MCP_ERROR_CODES.SERVER_ERROR,
  );
}

function isTransientError(err: unknown): boolean {
  const error = err as Error & { code?: string };
  if (error.name === 'AbortError') return true;
  if (error.code && TRANSIENT_ERRORS.has(error.code)) return true;
  return false;
}

// ── MCPClient ────────────────────────────────────────────────────────────────

/**
 * Client for communicating with an MCP (Multi-Cloud Platform) server
 * over HTTP. Manages per-tenant connection pooling, timeouts, and
 * automatic retry on transient failures.
 */
export class MCPClient {
  private readonly config: MCPConnectionConfig;
  private readonly baseUrl: string;
  private readonly poolKey: string;
  private connected = false;

  constructor(connectionConfig: MCPConnectionConfig) {
    this.config = connectionConfig;
    this.baseUrl = connectionConfig.baseUrl.replace(/\/+$/, '');
    this.poolKey = `${this.baseUrl}:${connectionConfig.username}`;
  }

  // ── Lifecycle ────────────────────────────────────────────────────────────

  /**
   * Establish a session with the MCP server.
   * Reuses existing pooled sessions when available.
   */
  async connect(): Promise<void> {
    // Check pool for existing session
    const existing = tenantPools.get(this.poolKey);
    if (existing?.sessionToken) {
      existing.lastUsed = Date.now();
      this.connected = true;
      logger.debug({ poolKey: this.poolKey }, 'MCP: reusing pooled session');
      return;
    }

    const credentials = Buffer.from(
      `${this.config.username}:${this.config.password}`,
    ).toString('base64');

    const controller = new AbortController();
    const timeoutId = setTimeout(() => controller.abort(), DEFAULT_TIMEOUT_MS);

    try {
      const response = await fetch(`${this.baseUrl}/session`, {
        method: 'POST',
        headers: {
          Authorization: `Basic ${credentials}`,
          'Content-Type': 'application/json',
          Accept: 'application/json',
        },
        body: JSON.stringify({ schema: this.config.schema }),
        signal: controller.signal,
      });

      clearTimeout(timeoutId);

      if (response.status === 401 || response.status === 403) {
        throw new AppError(
          'MCP authentication failed',
          401,
          MCP_ERROR_CODES.AUTH_FAILED,
        );
      }

      if (!response.ok) {
        const body = await response.text().catch(() => '');
        throw new AppError(
          `MCP session creation failed: HTTP ${response.status} ${body}`,
          502,
          MCP_ERROR_CODES.CONNECTION_FAILED,
        );
      }

      const data = (await response.json()) as { sessionToken?: string };
      const sessionToken = data.sessionToken ?? null;

      tenantPools.set(this.poolKey, {
        config: this.config,
        sessionToken,
        lastUsed: Date.now(),
      });

      this.connected = true;
      logger.info({ poolKey: this.poolKey }, 'MCP: session established');
    } catch (err) {
      clearTimeout(timeoutId);
      if (err instanceof AppError) throw err;
      throw mapErrorToAppError(err, 'connect');
    }
  }

  /**
   * Disconnect the MCP session and remove from the pool.
   */
  async disconnect(): Promise<void> {
    const entry = tenantPools.get(this.poolKey);
    if (!entry) {
      this.connected = false;
      return;
    }

    try {
      const headers: Record<string, string> = { Accept: 'application/json' };
      if (entry.sessionToken) {
        headers['X-Session-Token'] = entry.sessionToken;
      }

      const controller = new AbortController();
      const timeoutId = setTimeout(() => controller.abort(), 5_000);

      await fetch(`${this.baseUrl}/session`, {
        method: 'DELETE',
        headers,
        signal: controller.signal,
      });

      clearTimeout(timeoutId);
    } catch (err) {
      logger.warn({ err, poolKey: this.poolKey }, 'MCP: error during disconnect');
    } finally {
      tenantPools.delete(this.poolKey);
      this.connected = false;
      logger.debug({ poolKey: this.poolKey }, 'MCP: session closed');
    }
  }

  // ── Query ────────────────────────────────────────────────────────────────

  /**
   * Execute a SQL query against the MCP server.
   * Retries once on transient failures.
   */
  async query(sql: string, params?: unknown[]): Promise<MCPQueryResult> {
    if (!this.connected) {
      throw new AppError(
        'MCP client is not connected',
        500,
        MCP_ERROR_CODES.DISCONNECTED,
      );
    }

    let lastError: unknown;

    for (let attempt = 0; attempt <= MAX_RETRIES; attempt++) {
      try {
        return await this.executeQuery(sql, params);
      } catch (err) {
        lastError = err;

        if (err instanceof AppError && !isTransientError(err)) {
          throw err;
        }

        if (attempt < MAX_RETRIES && isTransientError(err)) {
          logger.warn(
            { attempt, sql: sql.substring(0, 100) },
            'MCP: transient failure, retrying',
          );
          continue;
        }
      }
    }

    if (lastError instanceof AppError) throw lastError;
    throw mapErrorToAppError(lastError, 'query');
  }

  private async executeQuery(
    sql: string,
    params?: unknown[],
  ): Promise<MCPQueryResult> {
    const entry = tenantPools.get(this.poolKey);
    const headers: Record<string, string> = {
      'Content-Type': 'application/json',
      Accept: 'application/json',
    };

    if (entry?.sessionToken) {
      headers['X-Session-Token'] = entry.sessionToken;
    }

    const credentials = Buffer.from(
      `${this.config.username}:${this.config.password}`,
    ).toString('base64');
    headers['Authorization'] = `Basic ${credentials}`;

    const controller = new AbortController();
    const timeoutId = setTimeout(() => controller.abort(), DEFAULT_TIMEOUT_MS);

    try {
      const response = await fetch(`${this.baseUrl}/query`, {
        method: 'POST',
        headers,
        body: JSON.stringify({ sql, binds: params ?? [] }),
        signal: controller.signal,
      });

      clearTimeout(timeoutId);

      if (!response.ok) {
        const body = await response.text().catch(() => '');

        if (response.status === 401 || response.status === 403) {
          // Session may have expired; remove from pool so next call reconnects
          tenantPools.delete(this.poolKey);
          this.connected = false;
          throw new AppError(
            'MCP session expired or unauthorized',
            401,
            MCP_ERROR_CODES.AUTH_FAILED,
          );
        }

        throw new AppError(
          `MCP query failed: HTTP ${response.status} ${body}`,
          502,
          MCP_ERROR_CODES.QUERY_FAILED,
        );
      }

      const data = (await response.json()) as {
        columns?: string[];
        rows?: Record<string, unknown>[];
        rowCount?: number;
      };

      // Update pool last-used timestamp
      if (entry) entry.lastUsed = Date.now();

      return {
        columns: data.columns ?? [],
        rows: data.rows ?? [],
        rowCount: data.rowCount ?? (data.rows?.length ?? 0),
      };
    } catch (err) {
      clearTimeout(timeoutId);
      if (err instanceof AppError) throw err;
      throw mapErrorToAppError(err, 'executeQuery');
    }
  }

  // ── Health ───────────────────────────────────────────────────────────────

  /**
   * Check the health of the MCP server.
   */
  async health(): Promise<MCPHealthStatus> {
    const startTime = performance.now();

    const controller = new AbortController();
    const timeoutId = setTimeout(() => controller.abort(), 5_000);

    try {
      const response = await fetch(`${this.baseUrl}/health`, {
        method: 'GET',
        headers: { Accept: 'application/json' },
        signal: controller.signal,
      });

      clearTimeout(timeoutId);
      const latencyMs = Math.round(performance.now() - startTime);

      if (!response.ok) {
        return {
          healthy: false,
          latencyMs,
          message: `MCP server returned HTTP ${response.status}`,
        };
      }

      const data = (await response.json()) as { version?: string };

      return {
        healthy: true,
        latencyMs,
        serverVersion: data.version,
        message: 'MCP server is healthy',
      };
    } catch (err) {
      clearTimeout(timeoutId);
      const latencyMs = Math.round(performance.now() - startTime);
      const error = err as Error;

      return {
        healthy: false,
        latencyMs,
        message: `MCP health check failed: ${error.message}`,
      };
    }
  }

  // ── Accessors ────────────────────────────────────────────────────────────

  get isConnected(): boolean {
    return this.connected;
  }
}
