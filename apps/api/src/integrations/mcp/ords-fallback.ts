import { logger } from '../../lib/logger.js';
import { AppError } from '../../lib/errors.js';
import type {
  ApexApplication,
  ApexPage,
  ApexComponent,
  ApexComponentType,
  ApexSearchObjectType,
  ApexSearchResult,
} from './mcp-apex-adapter.js';

// ── Types ────────────────────────────────────────────────────────────────────

export interface OrdsConnectionInfo {
  ordsBaseUrl: string;
  username: string;
  password: string;
}

interface OrdsSqlResponse {
  items?: Record<string, unknown>[];
  resultSet?: {
    items?: Record<string, unknown>[];
  };
  count?: number;
  hasMore?: boolean;
}

// ── Constants ────────────────────────────────────────────────────────────────

const ORDS_TIMEOUT_MS = 30_000;

const COMPONENT_VIEW_MAP: Record<ApexComponentType, string> = {
  regions: 'APEX_APPLICATION_PAGE_REGIONS',
  items: 'APEX_APPLICATION_PAGE_ITEMS',
  buttons: 'APEX_APPLICATION_PAGE_BUTTONS',
  processes: 'APEX_APPLICATION_PAGE_PROC',
  computations: 'APEX_APPLICATION_PAGE_COMP',
  validations: 'APEX_APPLICATION_PAGE_VAL',
};

// ── Helper: Execute SQL via ORDS REST SQL endpoint ───────────────────────────

async function executeSql(
  conn: OrdsConnectionInfo,
  sql: string,
  binds?: Record<string, unknown>,
): Promise<Record<string, unknown>[]> {
  const baseUrl = conn.ordsBaseUrl.replace(/\/+$/, '');
  const url = `${baseUrl}/_/sql`;

  const credentials = Buffer.from(`${conn.username}:${conn.password}`).toString('base64');

  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), ORDS_TIMEOUT_MS);

  try {
    const response = await fetch(url, {
      method: 'POST',
      headers: {
        Authorization: `Basic ${credentials}`,
        'Content-Type': 'application/json',
        Accept: 'application/json',
      },
      body: JSON.stringify({
        statementText: sql,
        binds: binds ? Object.entries(binds).map(([name, value]) => ({
          name,
          data_type: typeof value === 'number' ? 'NUMBER' : 'VARCHAR2',
          value: String(value),
        })) : [],
      }),
      signal: controller.signal,
    });

    clearTimeout(timeoutId);

    if (!response.ok) {
      const body = await response.text().catch(() => '');
      throw new AppError(
        `ORDS SQL execution failed: HTTP ${response.status} ${body}`,
        502,
        'ORDS_QUERY_FAILED',
      );
    }

    const data = (await response.json()) as OrdsSqlResponse;
    return data.items ?? data.resultSet?.items ?? [];
  } catch (err) {
    clearTimeout(timeoutId);
    if (err instanceof AppError) throw err;

    const error = err as Error;
    if (error.name === 'AbortError') {
      throw new AppError(
        `ORDS request timed out after ${ORDS_TIMEOUT_MS}ms`,
        504,
        'ORDS_TIMEOUT',
      );
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
    applicationId: Number(row.APPLICATION_ID ?? row.application_id),
    applicationName: String(row.APPLICATION_NAME ?? row.application_name ?? ''),
    applicationGroup: (row.APPLICATION_GROUP ?? row.application_group ?? null) as string | null,
    owner: String(row.OWNER ?? row.owner ?? ''),
    workspaceId: Number(row.WORKSPACE_ID ?? row.workspace_id),
    workspaceName: String(row.WORKSPACE ?? row.workspace ?? ''),
    version: (row.VERSION ?? row.version ?? null) as string | null,
    pagesCount: row.PAGES !== undefined ? Number(row.PAGES) : (row.pages !== undefined ? Number(row.pages) : null),
    lastUpdatedBy: (row.LAST_UPDATED_BY ?? row.last_updated_by ?? null) as string | null,
    lastUpdatedOn: row.LAST_UPDATED_ON ?? row.last_updated_on
      ? new Date(String(row.LAST_UPDATED_ON ?? row.last_updated_on))
      : null,
  };
}

function mapPage(row: Record<string, unknown>): ApexPage {
  return {
    pageId: Number(row.PAGE_ID ?? row.page_id),
    pageName: String(row.PAGE_NAME ?? row.page_name ?? ''),
    pageAlias: (row.PAGE_ALIAS ?? row.page_alias ?? null) as string | null,
    pageMode: (row.PAGE_MODE ?? row.page_mode ?? null) as string | null,
    pageGroup: (row.PAGE_GROUP ?? row.page_group ?? null) as string | null,
    applicationId: Number(row.APPLICATION_ID ?? row.application_id),
    userInterfaceId: row.USER_INTERFACE_ID ?? row.user_interface_id
      ? Number(row.USER_INTERFACE_ID ?? row.user_interface_id)
      : null,
    pageFunction: (row.PAGE_FUNCTION ?? row.page_function ?? null) as string | null,
    regionsCount: row.REGIONS !== undefined ? Number(row.REGIONS) : (row.regions !== undefined ? Number(row.regions) : null),
    lastUpdatedBy: (row.LAST_UPDATED_BY ?? row.last_updated_by ?? null) as string | null,
    lastUpdatedOn: row.LAST_UPDATED_ON ?? row.last_updated_on
      ? new Date(String(row.LAST_UPDATED_ON ?? row.last_updated_on))
      : null,
  };
}

function mapComponent(row: Record<string, unknown>, componentType: string): ApexComponent {
  return {
    componentId: Number(
      row.REGION_ID ?? row.region_id ??
      row.ITEM_ID ?? row.item_id ??
      row.BUTTON_ID ?? row.button_id ??
      row.PROCESS_ID ?? row.process_id ??
      row.COMPUTATION_ID ?? row.computation_id ??
      row.VALIDATION_ID ?? row.validation_id ?? 0,
    ),
    componentName: String(
      row.REGION_NAME ?? row.region_name ??
      row.ITEM_NAME ?? row.item_name ??
      row.BUTTON_NAME ?? row.button_name ??
      row.PROCESS_NAME ?? row.process_name ??
      row.COMPUTATION_ITEM ?? row.computation_item ??
      row.VALIDATION_NAME ?? row.validation_name ?? '',
    ),
    componentType,
    pageId: Number(row.PAGE_ID ?? row.page_id),
    applicationId: Number(row.APPLICATION_ID ?? row.application_id),
    displaySequence: row.DISPLAY_SEQUENCE ?? row.display_sequence
      ? Number(row.DISPLAY_SEQUENCE ?? row.display_sequence)
      : null,
    sourceType: (row.SOURCE_TYPE ?? row.source_type ?? null) as string | null,
    conditionType: (row.CONDITION_TYPE ?? row.condition_type ?? null) as string | null,
    lastUpdatedBy: (row.LAST_UPDATED_BY ?? row.last_updated_by ?? null) as string | null,
    lastUpdatedOn: row.LAST_UPDATED_ON ?? row.last_updated_on
      ? new Date(String(row.LAST_UPDATED_ON ?? row.last_updated_on))
      : null,
  };
}

// ── ORDS Fallback Functions ──────────────────────────────────────────────────

/**
 * List APEX applications via ORDS REST SQL endpoint.
 * Same interface as mcp-apex-adapter.listApplications.
 * Accepts a workspace filter with optional id or name.
 */
export async function listApplications(
  conn: OrdsConnectionInfo,
  workspace: { id?: number; name?: string },
): Promise<ApexApplication[]> {
  logger.debug({ workspace }, 'ORDS fallback: listing applications');

  let sql: string;
  let binds: Record<string, unknown>;

  if (workspace.id !== undefined) {
    sql = `SELECT APPLICATION_ID, APPLICATION_NAME, APPLICATION_GROUP,
            OWNER, WORKSPACE_ID, WORKSPACE, VERSION, PAGES,
            LAST_UPDATED_BY, LAST_UPDATED_ON
     FROM APEX_APPLICATIONS
     WHERE WORKSPACE_ID = :workspace_id
     ORDER BY APPLICATION_NAME`;
    binds = { workspace_id: workspace.id };
  } else if (workspace.name !== undefined) {
    sql = `SELECT APPLICATION_ID, APPLICATION_NAME, APPLICATION_GROUP,
            OWNER, WORKSPACE_ID, WORKSPACE, VERSION, PAGES,
            LAST_UPDATED_BY, LAST_UPDATED_ON
     FROM APEX_APPLICATIONS
     WHERE WORKSPACE = :workspace_name
     ORDER BY APPLICATION_NAME`;
    binds = { workspace_name: workspace.name };
  } else {
    sql = `SELECT APPLICATION_ID, APPLICATION_NAME, APPLICATION_GROUP,
            OWNER, WORKSPACE_ID, WORKSPACE, VERSION, PAGES,
            LAST_UPDATED_BY, LAST_UPDATED_ON
     FROM APEX_APPLICATIONS
     ORDER BY APPLICATION_NAME`;
    binds = {};
  }

  const rows = await executeSql(conn, sql, binds);
  return rows.map(mapApplication);
}

/**
 * List pages for an APEX application via ORDS REST SQL endpoint.
 * Same interface as mcp-apex-adapter.listPages.
 */
export async function listPages(
  conn: OrdsConnectionInfo,
  appId: number,
): Promise<ApexPage[]> {
  logger.debug({ appId }, 'ORDS fallback: listing pages');

  const rows = await executeSql(
    conn,
    `SELECT PAGE_ID, PAGE_NAME, PAGE_ALIAS, PAGE_MODE, PAGE_GROUP,
            APPLICATION_ID, USER_INTERFACE_ID, PAGE_FUNCTION,
            LAST_UPDATED_BY, LAST_UPDATED_ON
     FROM APEX_APPLICATION_PAGES
     WHERE APPLICATION_ID = :app_id
     ORDER BY PAGE_ID`,
    { app_id: appId },
  );

  return rows.map(mapPage);
}

/**
 * List page components via ORDS REST SQL endpoint.
 * Same interface as mcp-apex-adapter.listComponents.
 */
export async function listComponents(
  conn: OrdsConnectionInfo,
  pageId: number,
  type: ApexComponentType,
): Promise<ApexComponent[]> {
  const viewName = COMPONENT_VIEW_MAP[type];
  if (!viewName) {
    throw new Error(`Unknown component type: ${type}`);
  }

  logger.debug({ pageId, type, viewName }, 'ORDS fallback: listing components');

  const rows = await executeSql(
    conn,
    `SELECT *
     FROM ${viewName}
     WHERE PAGE_ID = :page_id
     ORDER BY DISPLAY_SEQUENCE NULLS LAST`,
    { page_id: pageId },
  );

  return rows.map((row) => mapComponent(row, type));
}

/**
 * Search across APEX views via ORDS REST SQL endpoint.
 * Same interface as mcp-apex-adapter.searchObjects.
 */
export async function searchObjects(
  conn: OrdsConnectionInfo,
  term: string,
  objectTypes?: ApexSearchObjectType[],
): Promise<ApexSearchResult[]> {
  const searchTerm = `%${term.toUpperCase()}%`;
  const results: ApexSearchResult[] = [];

  const typesToSearch = objectTypes ?? ['applications', 'pages', 'regions', 'items'];

  logger.debug({ term, typesToSearch }, 'ORDS fallback: searching objects');

  if (typesToSearch.includes('applications')) {
    const rows = await executeSql(
      conn,
      `SELECT APPLICATION_ID, APPLICATION_NAME, WORKSPACE_ID, WORKSPACE
       FROM APEX_APPLICATIONS
       WHERE UPPER(APPLICATION_NAME) LIKE :search_term
       ORDER BY APPLICATION_NAME`,
      { search_term: searchTerm },
    );
    for (const row of rows) {
      results.push({
        objectType: 'applications',
        objectId: Number(row.APPLICATION_ID ?? row.application_id),
        objectName: String(row.APPLICATION_NAME ?? row.application_name),
        parentId: null,
        parentName: null,
        applicationId: Number(row.APPLICATION_ID ?? row.application_id),
        applicationName: String(row.APPLICATION_NAME ?? row.application_name),
        matchContext: null,
      });
    }
  }

  if (typesToSearch.includes('pages')) {
    const rows = await executeSql(
      conn,
      `SELECT p.PAGE_ID, p.PAGE_NAME, p.APPLICATION_ID,
              a.APPLICATION_NAME
       FROM APEX_APPLICATION_PAGES p
       JOIN APEX_APPLICATIONS a ON a.APPLICATION_ID = p.APPLICATION_ID
       WHERE UPPER(p.PAGE_NAME) LIKE :search_term
       ORDER BY a.APPLICATION_NAME, p.PAGE_ID`,
      { search_term: searchTerm },
    );
    for (const row of rows) {
      results.push({
        objectType: 'pages',
        objectId: Number(row.PAGE_ID ?? row.page_id),
        objectName: String(row.PAGE_NAME ?? row.page_name),
        parentId: Number(row.APPLICATION_ID ?? row.application_id),
        parentName: String(row.APPLICATION_NAME ?? row.application_name),
        applicationId: Number(row.APPLICATION_ID ?? row.application_id),
        applicationName: String(row.APPLICATION_NAME ?? row.application_name),
        matchContext: null,
      });
    }
  }

  if (typesToSearch.includes('regions')) {
    const rows = await executeSql(
      conn,
      `SELECT r.REGION_ID, r.REGION_NAME, r.PAGE_ID, r.APPLICATION_ID,
              a.APPLICATION_NAME
       FROM APEX_APPLICATION_PAGE_REGIONS r
       JOIN APEX_APPLICATIONS a ON a.APPLICATION_ID = r.APPLICATION_ID
       WHERE UPPER(r.REGION_NAME) LIKE :search_term
       ORDER BY a.APPLICATION_NAME, r.PAGE_ID`,
      { search_term: searchTerm },
    );
    for (const row of rows) {
      results.push({
        objectType: 'regions',
        objectId: Number(row.REGION_ID ?? row.region_id),
        objectName: String(row.REGION_NAME ?? row.region_name),
        parentId: Number(row.PAGE_ID ?? row.page_id),
        parentName: null,
        applicationId: Number(row.APPLICATION_ID ?? row.application_id),
        applicationName: String(row.APPLICATION_NAME ?? row.application_name),
        matchContext: null,
      });
    }
  }

  if (typesToSearch.includes('items')) {
    const rows = await executeSql(
      conn,
      `SELECT i.ITEM_ID, i.ITEM_NAME, i.PAGE_ID, i.APPLICATION_ID,
              a.APPLICATION_NAME
       FROM APEX_APPLICATION_PAGE_ITEMS i
       JOIN APEX_APPLICATIONS a ON a.APPLICATION_ID = i.APPLICATION_ID
       WHERE UPPER(i.ITEM_NAME) LIKE :search_term
       ORDER BY a.APPLICATION_NAME, i.PAGE_ID`,
      { search_term: searchTerm },
    );
    for (const row of rows) {
      results.push({
        objectType: 'items',
        objectId: Number(row.ITEM_ID ?? row.item_id),
        objectName: String(row.ITEM_NAME ?? row.item_name),
        parentId: Number(row.PAGE_ID ?? row.page_id),
        parentName: null,
        applicationId: Number(row.APPLICATION_ID ?? row.application_id),
        applicationName: String(row.APPLICATION_NAME ?? row.application_name),
        matchContext: null,
      });
    }
  }

  if (typesToSearch.includes('buttons')) {
    const rows = await executeSql(
      conn,
      `SELECT b.BUTTON_ID, b.BUTTON_NAME, b.PAGE_ID, b.APPLICATION_ID,
              a.APPLICATION_NAME
       FROM APEX_APPLICATION_PAGE_BUTTONS b
       JOIN APEX_APPLICATIONS a ON a.APPLICATION_ID = b.APPLICATION_ID
       WHERE UPPER(b.BUTTON_NAME) LIKE :search_term
       ORDER BY a.APPLICATION_NAME, b.PAGE_ID`,
      { search_term: searchTerm },
    );
    for (const row of rows) {
      results.push({
        objectType: 'buttons',
        objectId: Number(row.BUTTON_ID ?? row.button_id),
        objectName: String(row.BUTTON_NAME ?? row.button_name),
        parentId: Number(row.PAGE_ID ?? row.page_id),
        parentName: null,
        applicationId: Number(row.APPLICATION_ID ?? row.application_id),
        applicationName: String(row.APPLICATION_NAME ?? row.application_name),
        matchContext: null,
      });
    }
  }

  if (typesToSearch.includes('processes')) {
    const rows = await executeSql(
      conn,
      `SELECT p.PROCESS_ID, p.PROCESS_NAME, p.PAGE_ID, p.APPLICATION_ID,
              a.APPLICATION_NAME
       FROM APEX_APPLICATION_PAGE_PROC p
       JOIN APEX_APPLICATIONS a ON a.APPLICATION_ID = p.APPLICATION_ID
       WHERE UPPER(p.PROCESS_NAME) LIKE :search_term
       ORDER BY a.APPLICATION_NAME, p.PAGE_ID`,
      { search_term: searchTerm },
    );
    for (const row of rows) {
      results.push({
        objectType: 'processes',
        objectId: Number(row.PROCESS_ID ?? row.process_id),
        objectName: String(row.PROCESS_NAME ?? row.process_name),
        parentId: Number(row.PAGE_ID ?? row.page_id),
        parentName: null,
        applicationId: Number(row.APPLICATION_ID ?? row.application_id),
        applicationName: String(row.APPLICATION_NAME ?? row.application_name),
        matchContext: null,
      });
    }
  }

  return results;
}
