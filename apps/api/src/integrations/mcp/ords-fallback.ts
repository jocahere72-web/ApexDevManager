import { logger } from '../../lib/logger.js';
import { AppError } from '../../lib/errors.js';
import type {
  ApexApplication,
  ApexPage,
  ApexComponent,
} from './mcp-apex-adapter.js';

// ── Types ────────────────────────────────────────────────────────────────────

export interface OrdsConnectionInfo {
  ordsBaseUrl: string;
  username: string;
  password: string;
}

// ── Helper: Fetch from ORDS REST endpoint ───────────────────────────────────

async function fetchOrds(
  conn: OrdsConnectionInfo,
  path: string,
): Promise<Record<string, unknown>[]> {
  const baseUrl = conn.ordsBaseUrl.replace(/\/+$/, '');
  const url = `${baseUrl}/apexdev${path}`;

  logger.debug({ url }, 'ORDS REST: fetching');

  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), 30_000);

  try {
    const response = await fetch(url, {
      method: 'GET',
      headers: { Accept: 'application/json' },
      signal: controller.signal,
    });

    clearTimeout(timeoutId);

    if (!response.ok) {
      const body = await response.text().catch(() => '');
      throw new AppError(
        `ORDS REST failed: HTTP ${response.status} ${body}`,
        502,
        'ORDS_QUERY_FAILED',
      );
    }

    const data = await response.json() as { items?: Record<string, unknown>[] };
    return data.items ?? [];
  } catch (err) {
    clearTimeout(timeoutId);
    if (err instanceof AppError) throw err;

    const error = err as Error;
    if (error.name === 'AbortError') {
      throw new AppError('ORDS request timed out', 504, 'ORDS_TIMEOUT');
    }

    throw new AppError(
      `ORDS connection failed: ${error.message}`,
      502,
      'ORDS_CONNECTION_FAILED',
    );
  }
}

// ── Row Mappers ──────────────────────────────────────────────────────────────

function mapApplication(row: Record<string, unknown>): ApexApplication {
  return {
    applicationId: Number(row.application_id ?? row.APPLICATION_ID ?? 0),
    applicationName: String(row.application_name ?? row.APPLICATION_NAME ?? ''),
    applicationGroup: null,
    owner: '',
    workspaceId: 0,
    workspaceName: '',
    version: null,
    pagesCount: row.pages !== undefined ? Number(row.pages) : null,
    lastUpdatedBy: null,
    lastUpdatedOn: row.last_updated_on
      ? new Date(String(row.last_updated_on))
      : null,
  };
}

function mapPage(row: Record<string, unknown>): ApexPage {
  return {
    pageId: Number(row.page_id ?? row.PAGE_ID ?? 0),
    pageName: String(row.page_name ?? row.PAGE_NAME ?? ''),
    pageAlias: null,
    pageMode: (row.page_mode ?? null) as string | null,
    pageGroup: (row.page_group ?? null) as string | null,
    applicationId: 0,
    userInterfaceId: null,
    pageFunction: null,
    regionsCount: null,
    lastUpdatedBy: null,
    lastUpdatedOn: row.last_updated_on
      ? new Date(String(row.last_updated_on))
      : null,
  };
}

function mapComponent(row: Record<string, unknown>, componentType: string): ApexComponent {
  return {
    componentId: Number(
      row.region_id ?? row.item_id ?? row.REGION_ID ?? row.ITEM_ID ?? 0,
    ),
    componentName: String(
      row.region_name ?? row.item_name ?? row.label ??
      row.REGION_NAME ?? row.ITEM_NAME ?? '',
    ),
    componentType,
    regionId: row.region_id ?? row.REGION_ID ?? undefined,
    pageId: 0,
    applicationId: 0,
    displaySequence: null,
    sourceType: (row.source_type ?? row.display_as ?? null) as string | null,
    conditionType: null,
    lastUpdatedBy: null,
    lastUpdatedOn: row.last_updated_on
      ? new Date(String(row.last_updated_on))
      : null,
  };
}

// ── ORDS REST Functions ─────────────────────────────────────────────────────

export async function listApplications(
  conn: OrdsConnectionInfo,
  _workspace: { id?: number; name?: string },
): Promise<ApexApplication[]> {
  logger.debug('ORDS REST: listing applications');
  const rows = await fetchOrds(conn, '/applications');
  return rows.map(mapApplication);
}

export async function listPages(
  conn: OrdsConnectionInfo,
  appId: number,
): Promise<ApexPage[]> {
  logger.debug({ appId }, 'ORDS REST: listing pages');
  const rows = await fetchOrds(conn, `/applications/${appId}/pages`);
  return rows.map(mapPage);
}

export async function listComponents(
  conn: OrdsConnectionInfo,
  appId: number,
  pageId: number,
  type?: string,
): Promise<ApexComponent[]> {
  logger.debug({ appId, pageId, type }, 'ORDS REST: listing components');

  const results: ApexComponent[] = [];

  // Fetch regions
  if (!type || type === 'regions') {
    const rows = await fetchOrds(conn, `/applications/${appId}/pages/${pageId}/regions`);
    results.push(...rows.map((r) => mapComponent(r, 'region')));
  }

  // Fetch items
  if (!type || type === 'items') {
    const rows = await fetchOrds(conn, `/applications/${appId}/pages/${pageId}/items`);
    results.push(...rows.map((r) => mapComponent(r, 'item')));
  }

  return results;
}

export async function searchObjects(
  conn: OrdsConnectionInfo,
  term: string,
  _objectTypes?: string[],
): Promise<{ objectType: string; objectId: number; objectName: string; appId: number }[]> {
  logger.debug({ term }, 'ORDS REST: searching objects');
  try {
    const rows = await fetchOrds(conn, `/search?q=${encodeURIComponent(term)}`);
    return rows.map((r) => ({
      objectType: String(r.object_type ?? ''),
      objectId: Number(r.object_id ?? 0),
      objectName: String(r.object_name ?? ''),
      appId: Number(r.app_id ?? 0),
    }));
  } catch {
    // Search might not work yet, return empty
    logger.warn('ORDS search endpoint failed, returning empty results');
    return [];
  }
}
