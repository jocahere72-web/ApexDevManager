import type Redis from 'ioredis';
import { redis } from '../../config/redis.js';
import { logger } from '../../lib/logger.js';
import type { ApexApplication, ApexPage, ApexComponent, ApexSearchResult } from '../../integrations/mcp/mcp-apex-adapter.js';

// ── TTL Constants (seconds) ──────────────────────────────────────────────────

const TTL_APPS = 3600;          // 1 hour
const TTL_PAGES = 3600;         // 1 hour
const TTL_COMPONENTS = 3600;    // 1 hour
const TTL_SEARCH = 300;         // 5 minutes

// ── Key Builders ─────────────────────────────────────────────────────────────

function appsKey(tenantId: string, connectionId: string): string {
  return `explorer:${tenantId}:${connectionId}:apps`;
}

function pagesKey(tenantId: string, connectionId: string, appId: number): string {
  return `explorer:${tenantId}:${connectionId}:pages:${appId}`;
}

function componentsKey(
  tenantId: string,
  connectionId: string,
  pageId: number,
  type?: string,
): string {
  const suffix = type ? `:${type}` : '';
  return `explorer:${tenantId}:${connectionId}:components:${pageId}${suffix}`;
}

function searchKey(
  tenantId: string,
  connectionId: string,
  term: string,
  objectTypes?: string[],
): string {
  const typeSuffix = objectTypes ? `:${objectTypes.sort().join(',')}` : '';
  return `explorer:${tenantId}:${connectionId}:search:${term.toLowerCase()}${typeSuffix}`;
}

function connectionPattern(tenantId: string, connectionId: string): string {
  return `explorer:${tenantId}:${connectionId}:*`;
}

// ── ExplorerCacheService ─────────────────────────────────────────────────────

/**
 * Redis-backed cache for APEX explorer data.
 * Uses the shared Redis instance from config/redis.ts.
 */
export class ExplorerCacheService {
  private readonly client: Redis;

  constructor(redisClient?: Redis) {
    this.client = redisClient ?? redis;
  }

  // ── Applications ───────────────────────────────────────────────────────

  async getApps(tenantId: string, connectionId: string): Promise<ApexApplication[] | null> {
    try {
      const data = await this.client.get(appsKey(tenantId, connectionId));
      if (!data) return null;
      return JSON.parse(data) as ApexApplication[];
    } catch (err) {
      logger.warn({ err, tenantId, connectionId }, 'Explorer cache: failed to get apps');
      return null;
    }
  }

  async setApps(
    tenantId: string,
    connectionId: string,
    apps: ApexApplication[],
  ): Promise<void> {
    try {
      await this.client.set(
        appsKey(tenantId, connectionId),
        JSON.stringify(apps),
        'EX',
        TTL_APPS,
      );
    } catch (err) {
      logger.warn({ err, tenantId, connectionId }, 'Explorer cache: failed to set apps');
    }
  }

  // ── Pages ──────────────────────────────────────────────────────────────

  async getPages(
    tenantId: string,
    connectionId: string,
    appId: number,
  ): Promise<ApexPage[] | null> {
    try {
      const data = await this.client.get(pagesKey(tenantId, connectionId, appId));
      if (!data) return null;
      return JSON.parse(data) as ApexPage[];
    } catch (err) {
      logger.warn({ err, tenantId, connectionId, appId }, 'Explorer cache: failed to get pages');
      return null;
    }
  }

  async setPages(
    tenantId: string,
    connectionId: string,
    appId: number,
    pages: ApexPage[],
  ): Promise<void> {
    try {
      await this.client.set(
        pagesKey(tenantId, connectionId, appId),
        JSON.stringify(pages),
        'EX',
        TTL_PAGES,
      );
    } catch (err) {
      logger.warn({ err, tenantId, connectionId, appId }, 'Explorer cache: failed to set pages');
    }
  }

  // ── Components ─────────────────────────────────────────────────────────

  async getComponents(
    tenantId: string,
    connectionId: string,
    pageId: number,
    type?: string,
  ): Promise<ApexComponent[] | null> {
    try {
      const data = await this.client.get(componentsKey(tenantId, connectionId, pageId, type));
      if (!data) return null;
      return JSON.parse(data) as ApexComponent[];
    } catch (err) {
      logger.warn({ err, tenantId, connectionId, pageId }, 'Explorer cache: failed to get components');
      return null;
    }
  }

  async setComponents(
    tenantId: string,
    connectionId: string,
    pageId: number,
    components: ApexComponent[],
    type?: string,
  ): Promise<void> {
    try {
      await this.client.set(
        componentsKey(tenantId, connectionId, pageId, type),
        JSON.stringify(components),
        'EX',
        TTL_COMPONENTS,
      );
    } catch (err) {
      logger.warn({ err, tenantId, connectionId, pageId }, 'Explorer cache: failed to set components');
    }
  }

  // ── Search Results ─────────────────────────────────────────────────────

  async getSearchResults(
    tenantId: string,
    connectionId: string,
    term: string,
    objectTypes?: string[],
  ): Promise<ApexSearchResult[] | null> {
    try {
      const data = await this.client.get(searchKey(tenantId, connectionId, term, objectTypes));
      if (!data) return null;
      return JSON.parse(data) as ApexSearchResult[];
    } catch (err) {
      logger.warn({ err, tenantId, connectionId, term }, 'Explorer cache: failed to get search results');
      return null;
    }
  }

  async setSearchResults(
    tenantId: string,
    connectionId: string,
    term: string,
    results: ApexSearchResult[],
    objectTypes?: string[],
  ): Promise<void> {
    try {
      await this.client.set(
        searchKey(tenantId, connectionId, term, objectTypes),
        JSON.stringify(results),
        'EX',
        TTL_SEARCH,
      );
    } catch (err) {
      logger.warn({ err, tenantId, connectionId, term }, 'Explorer cache: failed to set search results');
    }
  }

  // ── Invalidation ───────────────────────────────────────────────────────

  /**
   * Invalidate all cached data for a specific connection.
   * Uses SCAN to find matching keys and deletes them in batches.
   */
  async invalidateConnection(tenantId: string, connectionId: string): Promise<number> {
    const pattern = connectionPattern(tenantId, connectionId);
    let deletedCount = 0;
    let cursor = '0';

    try {
      do {
        const [nextCursor, keys] = await this.client.scan(
          cursor,
          'MATCH',
          pattern,
          'COUNT',
          100,
        );
        cursor = nextCursor;

        if (keys.length > 0) {
          await this.client.del(...keys);
          deletedCount += keys.length;
        }
      } while (cursor !== '0');

      logger.info(
        { tenantId, connectionId, deletedCount },
        'Explorer cache: connection invalidated',
      );

      return deletedCount;
    } catch (err) {
      logger.error(
        { err, tenantId, connectionId },
        'Explorer cache: failed to invalidate connection',
      );
      return deletedCount;
    }
  }

  // ── Stats ──────────────────────────────────────────────────────────────

  /**
   * Get approximate count of cached keys for a connection.
   */
  async getCacheSize(tenantId: string, connectionId: string): Promise<number> {
    const pattern = connectionPattern(tenantId, connectionId);
    let count = 0;
    let cursor = '0';

    try {
      do {
        const [nextCursor, keys] = await this.client.scan(
          cursor,
          'MATCH',
          pattern,
          'COUNT',
          100,
        );
        cursor = nextCursor;
        count += keys.length;
      } while (cursor !== '0');

      return count;
    } catch (err) {
      logger.warn({ err, tenantId, connectionId }, 'Explorer cache: failed to get cache size');
      return 0;
    }
  }
}
