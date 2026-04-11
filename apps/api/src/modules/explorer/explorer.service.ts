import { pool } from '../../config/database.js';
import { logger } from '../../lib/logger.js';
import { NotFoundError, AppError } from '../../lib/errors.js';
import { MCPClient, type MCPConnectionConfig } from '../../integrations/mcp/mcp-client.js';
import * as mcpAdapter from '../../integrations/mcp/mcp-apex-adapter.js';
import * as ordsFallback from '../../integrations/mcp/ords-fallback.js';
import { ExplorerCacheService } from './explorer.cache.js';
import { decryptCredentials } from '../connections/encryption.service.js';
import type {
  ApexApplication,
  ApexPage,
  ApexComponent,
  ApexComponentType,
  ApexSearchObjectType,
  ApexSearchResult,
} from '../../integrations/mcp/mcp-apex-adapter.js';
import type { OrdsConnectionInfo } from '../../integrations/mcp/ords-fallback.js';

// ── Types ────────────────────────────────────────────────────────────────────

export interface ApplicationTree {
  application: ApexApplication;
  pages: Array<ApexPage & { components?: ApexComponent[] }>;
}

export interface SyncStatus {
  connectionId: string;
  lastSyncAt: Date | null;
  cachedKeys: number;
  status: 'idle' | 'syncing' | 'error';
  error?: string;
}

interface ConnectionRow {
  id: string;
  tenant_id: string;
  type: 'ords' | 'jdbc';
  config: Record<string, unknown>;
  encrypted_credentials: {
    iv: string;
    encrypted: string;
    authTag: string;
    keyId: string;
  };
  workspace_id?: number;
}

// ── Sync tracking ────────────────────────────────────────────────────────────

const syncTracking = new Map<string, {
  status: 'syncing' | 'idle' | 'error';
  lastSyncAt: Date | null;
  error?: string;
}>();

// ── Cache singleton ──────────────────────────────────────────────────────────

const cache = new ExplorerCacheService();

// ── Helpers ──────────────────────────────────────────────────────────────────

async function getConnectionDetails(
  tenantId: string,
  connectionId: string,
): Promise<ConnectionRow> {
  const result = await pool.query(
    `SELECT id, tenant_id, type, config, encrypted_credentials
     FROM connections
     WHERE tenant_id = $1 AND id = $2 AND deleted_at IS NULL AND is_active = true`,
    [tenantId, connectionId],
  );

  if (result.rowCount === 0) {
    throw new NotFoundError('Connection not found or inactive');
  }

  return result.rows[0] as ConnectionRow;
}

function buildMCPConfig(conn: ConnectionRow): MCPConnectionConfig {
  const creds = decryptCredentials(conn.encrypted_credentials, conn.tenant_id);
  const config = conn.config as Record<string, unknown>;

  // MCP server URL is expected in the connection config
  const mcpBaseUrl = (config.mcpBaseUrl ?? config.ordsBaseUrl ?? '') as string;

  return {
    baseUrl: mcpBaseUrl,
    username: creds.username,
    password: creds.password,
    schema: config.schema as string | undefined,
  };
}

function buildOrdsConfig(conn: ConnectionRow): OrdsConnectionInfo {
  const creds = decryptCredentials(conn.encrypted_credentials, conn.tenant_id);
  const config = conn.config as Record<string, unknown>;

  return {
    ordsBaseUrl: (config.ordsBaseUrl ?? '') as string,
    username: creds.username,
    password: creds.password,
  };
}

function getWorkspaceId(conn: ConnectionRow): number {
  const config = conn.config as Record<string, unknown>;
  return Number(config.workspaceId ?? config.workspace_id ?? 0);
}

/**
 * Try MCP first, fall back to ORDS on failure.
 * Returns the result from whichever source succeeds.
 */
async function withMcpFallback<T>(
  conn: ConnectionRow,
  mcpFn: (client: MCPClient) => Promise<T>,
  ordsFn: (ordsConn: OrdsConnectionInfo) => Promise<T>,
): Promise<T> {
  // Try MCP first
  const mcpConfig = buildMCPConfig(conn);
  if (mcpConfig.baseUrl) {
    const client = new MCPClient(mcpConfig);
    try {
      await client.connect();
      const result = await mcpFn(client);
      return result;
    } catch (err) {
      logger.warn(
        { err, connectionId: conn.id },
        'MCP query failed, falling back to ORDS',
      );
      // Fall through to ORDS
    }
  }

  // ORDS fallback
  const ordsConfig = buildOrdsConfig(conn);
  if (!ordsConfig.ordsBaseUrl) {
    throw new AppError(
      'No MCP or ORDS endpoint configured for this connection',
      400,
      'NO_ENDPOINT_CONFIGURED',
    );
  }

  return ordsFn(ordsConfig);
}

// ── Service Functions ────────────────────────────────────────────────────────

/**
 * List APEX applications for a connection.
 * Checks cache first, then MCP, then ORDS fallback.
 */
export async function listApplications(
  tenantId: string,
  connectionId: string,
): Promise<ApexApplication[]> {
  // Check cache
  const cached = await cache.getApps(tenantId, connectionId);
  if (cached) {
    logger.debug({ tenantId, connectionId }, 'Explorer: apps cache hit');
    return cached;
  }

  const conn = await getConnectionDetails(tenantId, connectionId);
  const workspaceId = getWorkspaceId(conn);

  const apps = await withMcpFallback(
    conn,
    (client) => mcpAdapter.listApplications(client, workspaceId),
    (ordsConn) => ordsFallback.listApplications(ordsConn, workspaceId),
  );

  // Cache result
  await cache.setApps(tenantId, connectionId, apps);

  logger.info(
    { tenantId, connectionId, count: apps.length },
    'Explorer: applications listed',
  );

  return apps;
}

/**
 * List pages for an APEX application.
 * Checks cache first, then MCP, then ORDS fallback.
 */
export async function listPages(
  tenantId: string,
  connectionId: string,
  appId: number,
): Promise<ApexPage[]> {
  // Check cache
  const cached = await cache.getPages(tenantId, connectionId, appId);
  if (cached) {
    logger.debug({ tenantId, connectionId, appId }, 'Explorer: pages cache hit');
    return cached;
  }

  const conn = await getConnectionDetails(tenantId, connectionId);

  const pages = await withMcpFallback(
    conn,
    (client) => mcpAdapter.listPages(client, appId),
    (ordsConn) => ordsFallback.listPages(ordsConn, appId),
  );

  // Cache result
  await cache.setPages(tenantId, connectionId, appId, pages);

  logger.info(
    { tenantId, connectionId, appId, count: pages.length },
    'Explorer: pages listed',
  );

  return pages;
}

/**
 * List components on a page with an optional type filter.
 * Checks cache first, then MCP, then ORDS fallback.
 */
export async function listComponents(
  tenantId: string,
  connectionId: string,
  pageId: number,
  type: ApexComponentType = 'regions',
): Promise<ApexComponent[]> {
  // Check cache
  const cached = await cache.getComponents(tenantId, connectionId, pageId, type);
  if (cached) {
    logger.debug({ tenantId, connectionId, pageId, type }, 'Explorer: components cache hit');
    return cached;
  }

  const conn = await getConnectionDetails(tenantId, connectionId);

  const components = await withMcpFallback(
    conn,
    (client) => mcpAdapter.listComponents(client, pageId, type),
    (ordsConn) => ordsFallback.listComponents(ordsConn, pageId, type),
  );

  // Cache result
  await cache.setComponents(tenantId, connectionId, pageId, components, type);

  logger.info(
    { tenantId, connectionId, pageId, type, count: components.length },
    'Explorer: components listed',
  );

  return components;
}

/**
 * Build a full application tree: application + pages + components per page.
 */
export async function getApplicationTree(
  tenantId: string,
  connectionId: string,
  appId: number,
): Promise<ApplicationTree> {
  // Fetch application info from the apps list
  const apps = await listApplications(tenantId, connectionId);
  const application = apps.find((a) => a.applicationId === appId);

  if (!application) {
    throw new NotFoundError(`Application ${appId} not found`);
  }

  // Fetch all pages
  const pages = await listPages(tenantId, connectionId, appId);

  // Fetch components for each page (regions by default)
  const pagesWithComponents = await Promise.all(
    pages.map(async (page) => {
      try {
        const components = await listComponents(
          tenantId,
          connectionId,
          page.pageId,
          'regions',
        );
        return { ...page, components };
      } catch (err) {
        logger.warn(
          { err, pageId: page.pageId },
          'Explorer: failed to fetch components for page in tree',
        );
        return { ...page, components: [] };
      }
    }),
  );

  return {
    application,
    pages: pagesWithComponents,
  };
}

/**
 * Search across APEX objects.
 * Checks cache first, then MCP, then ORDS fallback.
 */
export async function searchObjects(
  tenantId: string,
  connectionId: string,
  term: string,
  objectTypes?: ApexSearchObjectType[],
  limit = 50,
  offset = 0,
): Promise<{ results: ApexSearchResult[]; total: number }> {
  // Check cache
  const cached = await cache.getSearchResults(tenantId, connectionId, term, objectTypes);
  if (cached) {
    logger.debug({ tenantId, connectionId, term }, 'Explorer: search cache hit');
    const sliced = cached.slice(offset, offset + limit);
    return { results: sliced, total: cached.length };
  }

  const conn = await getConnectionDetails(tenantId, connectionId);

  const allResults = await withMcpFallback(
    conn,
    (client) => mcpAdapter.searchObjects(client, term, objectTypes),
    (ordsConn) => ordsFallback.searchObjects(ordsConn, term, objectTypes),
  );

  // Cache full results
  await cache.setSearchResults(tenantId, connectionId, term, allResults, objectTypes);

  // Apply pagination
  const sliced = allResults.slice(offset, offset + limit);

  logger.info(
    { tenantId, connectionId, term, totalResults: allResults.length },
    'Explorer: search completed',
  );

  return { results: sliced, total: allResults.length };
}

/**
 * Invalidate cache for a connection and re-fetch applications.
 */
export async function syncConnection(
  tenantId: string,
  connectionId: string,
): Promise<{ invalidatedKeys: number }> {
  const trackingKey = `${tenantId}:${connectionId}`;

  syncTracking.set(trackingKey, {
    status: 'syncing',
    lastSyncAt: null,
  });

  try {
    // Invalidate all cached data for this connection
    const invalidatedKeys = await cache.invalidateConnection(tenantId, connectionId);

    // Re-fetch apps to warm the cache
    await listApplications(tenantId, connectionId);

    syncTracking.set(trackingKey, {
      status: 'idle',
      lastSyncAt: new Date(),
    });

    logger.info(
      { tenantId, connectionId, invalidatedKeys },
      'Explorer: connection synced',
    );

    return { invalidatedKeys };
  } catch (err) {
    const error = err as Error;
    syncTracking.set(trackingKey, {
      status: 'error',
      lastSyncAt: new Date(),
      error: error.message,
    });
    throw err;
  }
}

/**
 * Get the sync status for a connection.
 */
export async function getSyncStatus(
  tenantId: string,
  connectionId: string,
): Promise<SyncStatus> {
  const trackingKey = `${tenantId}:${connectionId}`;
  const tracking = syncTracking.get(trackingKey);
  const cachedKeys = await cache.getCacheSize(tenantId, connectionId);

  return {
    connectionId,
    lastSyncAt: tracking?.lastSyncAt ?? null,
    cachedKeys,
    status: tracking?.status ?? 'idle',
    error: tracking?.error,
  };
}
