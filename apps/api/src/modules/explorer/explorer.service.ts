import { pool } from '../../config/database.js';
import { PoolClient } from 'pg';
import { logger } from '../../lib/logger.js';
import { NotFoundError, AppError } from '../../lib/errors.js';
import { MCPClient, type MCPConnectionConfig } from '../../integrations/mcp/mcp-client.js';
import * as mcpAdapter from '../../integrations/mcp/mcp-apex-adapter.js';
import * as ordsFallback from '../../integrations/mcp/ords-fallback.js';
import { ExplorerCacheService } from './explorer.cache.js';
import { decryptCredentials } from '../connections/encryption.service.js';
import {
  getConnectionForTenant,
  type ResolvedConnection,
} from '../connections/connections.repository.js';
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

// ── Sync tracking ────────────────────────────────────────────────────────────

const syncTracking = new Map<
  string,
  {
    status: 'syncing' | 'idle' | 'error';
    lastSyncAt: Date | null;
    error?: string;
  }
>();

// ── Cache singleton ──────────────────────────────────────────────────────────

const cache = new ExplorerCacheService();

// ── Helpers ──────────────────────────────────────────────────────────────────

async function getConnectionDetails(
  tenantId: string,
  connectionId: string,
  client?: PoolClient,
): Promise<ResolvedConnection> {
  const conn = await getConnectionForTenant(tenantId, connectionId, client);
  if (!conn) throw new NotFoundError('Connection not found or inactive');
  return conn;
}

function buildMCPConfig(conn: ResolvedConnection): MCPConnectionConfig {
  const creds = decryptCredentials(conn.encryptedCredentials, conn.tenantId);

  // MCP server URL is expected in the connection config
  const mcpBaseUrl = (conn.config.ordsBaseUrl ?? '') as string;

  return {
    baseUrl: mcpBaseUrl,
    username: creds.username,
    password: creds.password,
    schema: conn.config.schema,
    tenantId: conn.tenantId,
    connectionId: conn.id,
  };
}

function buildOrdsConfig(conn: ResolvedConnection): OrdsConnectionInfo {
  const creds = decryptCredentials(conn.encryptedCredentials, conn.tenantId);

  return {
    ordsBaseUrl: (conn.config.ordsBaseUrl ?? '') as string,
    username: creds.username,
    password: creds.password,
  };
}

function getWorkspaceFilter(conn: ResolvedConnection): { id?: number; name?: string } {
  const ws = conn.config.workspaceName;
  if (!ws) return {};
  const asNum = Number(ws);
  if (!isNaN(asNum)) return { id: asNum };
  return { name: String(ws) };
}

/**
 * Try MCP first, fall back to ORDS on failure.
 * Returns the result from whichever source succeeds.
 */
async function withMcpFallback<T>(
  conn: ResolvedConnection,
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
      logger.warn({ err, connectionId: conn.id }, 'MCP query failed, falling back to ORDS');
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
  client?: PoolClient,
): Promise<ApexApplication[]> {
  // Check cache
  const cached = await cache.getApps(tenantId, connectionId);
  if (cached && cached.length > 0) {
    logger.debug({ tenantId, connectionId }, 'Explorer: apps cache hit');
    return cached;
  }
  if (cached) {
    logger.info({ tenantId, connectionId }, 'Explorer: empty apps cache ignored; refetching');
  }

  const conn = await getConnectionDetails(tenantId, connectionId, client);
  const workspaceFilter = getWorkspaceFilter(conn);

  const apps = await withMcpFallback(
    conn,
    (mcpClient) => mcpAdapter.listApplications(mcpClient, workspaceFilter),
    (ordsConn) => ordsFallback.listApplications(ordsConn, workspaceFilter),
  );

  // Cache result
  await cache.setApps(tenantId, connectionId, apps);

  logger.info({ tenantId, connectionId, count: apps.length }, 'Explorer: applications listed');

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
  client?: PoolClient,
): Promise<ApexPage[]> {
  // Check cache
  const cached = await cache.getPages(tenantId, connectionId, appId);
  if (cached) {
    logger.debug({ tenantId, connectionId, appId }, 'Explorer: pages cache hit');
    return cached;
  }

  const conn = await getConnectionDetails(tenantId, connectionId, client);

  const pages = await withMcpFallback(
    conn,
    (client) => mcpAdapter.listPages(client, appId),
    (ordsConn) => ordsFallback.listPages(ordsConn, appId),
  );

  // Cache result
  await cache.setPages(tenantId, connectionId, appId, pages);

  logger.info({ tenantId, connectionId, appId, count: pages.length }, 'Explorer: pages listed');

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
  type?: ApexComponentType,
  appId?: number,
  client?: PoolClient,
): Promise<ApexComponent[]> {
  const cacheAppId = appId ?? 0;

  // Check cache
  const cached = await cache.getComponents(tenantId, connectionId, cacheAppId, pageId, type);
  if (cached) {
    logger.debug(
      { tenantId, connectionId, appId: cacheAppId, pageId, type },
      'Explorer: components cache hit',
    );
    return cached;
  }

  const conn = await getConnectionDetails(tenantId, connectionId, client);

  const components = await withMcpFallback(
    conn,
    (client) => mcpAdapter.listComponents(client, pageId, type as any),
    (ordsConn) => ordsFallback.listComponents(ordsConn, appId ?? 0, Number(pageId), type as any),
  );

  // Cache result
  await cache.setComponents(tenantId, connectionId, cacheAppId, pageId, components, type);

  logger.info(
    { tenantId, connectionId, appId: cacheAppId, pageId, type, count: components.length },
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
  client?: PoolClient,
): Promise<ApplicationTree> {
  // Fetch application info from the apps list
  const apps = await listApplications(tenantId, connectionId, client);
  const application = apps.find((a) => a.applicationId === appId);

  if (!application) {
    throw new NotFoundError(`Application ${appId} not found`);
  }

  // Fetch all pages
  const pages = await listPages(tenantId, connectionId, appId, client);

  // Fetch components for each page (regions by default)
  const pagesWithComponents = await Promise.all(
    pages.map(async (page) => {
      try {
        const components = await listComponents(
          tenantId,
          connectionId,
          page.pageId,
          'regions',
          appId,
          client,
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
  client?: PoolClient,
): Promise<{ results: ApexSearchResult[]; total: number }> {
  // Check cache
  const cached = await cache.getSearchResults(tenantId, connectionId, term, objectTypes);
  if (cached) {
    logger.debug({ tenantId, connectionId, term }, 'Explorer: search cache hit');
    const sliced = cached.slice(offset, offset + limit);
    return { results: sliced, total: cached.length };
  }

  const conn = await getConnectionDetails(tenantId, connectionId, client);

  const allResults: any[] = await withMcpFallback(
    conn,
    (client) => mcpAdapter.searchObjects(client, term, objectTypes),
    (ordsConn) => ordsFallback.searchObjects(ordsConn, term, objectTypes) as any,
  );

  // Cache full results
  await cache.setSearchResults(tenantId, connectionId, term, allResults as any, objectTypes);

  // Apply pagination
  const sliced = allResults.slice(offset, offset + limit);

  logger.info(
    { tenantId, connectionId, term, totalResults: allResults.length },
    'Explorer: search completed',
  );

  return { results: sliced as any, total: allResults.length };
}

/**
 * Invalidate cache for a connection and re-fetch applications.
 */
export async function syncConnection(
  tenantId: string,
  connectionId: string,
  client?: PoolClient,
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
    await listApplications(tenantId, connectionId, client);

    syncTracking.set(trackingKey, {
      status: 'idle',
      lastSyncAt: new Date(),
    });

    logger.info({ tenantId, connectionId, invalidatedKeys }, 'Explorer: connection synced');

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
  _client?: PoolClient,
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
