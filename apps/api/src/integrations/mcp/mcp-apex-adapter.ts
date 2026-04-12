import type { MCPClient, MCPQueryResult } from './mcp-client.js';

// ── APEX Domain Types ────────────────────────────────────────────────────────

export interface ApexApplication {
  applicationId: number;
  applicationName: string;
  applicationGroup: string | null;
  owner: string;
  workspaceId: number;
  workspaceName: string;
  version: string | null;
  pagesCount: number | null;
  lastUpdatedBy: string | null;
  lastUpdatedOn: Date | null;
}

export interface ApexPage {
  pageId: number;
  pageName: string;
  pageAlias: string | null;
  pageMode: string | null;
  pageGroup: string | null;
  applicationId: number;
  userInterfaceId: number | null;
  pageFunction: string | null;
  regionsCount: number | null;
  lastUpdatedBy: string | null;
  lastUpdatedOn: Date | null;
}

export interface ApexComponent {
  componentId: number;
  componentName: string;
  componentType: string;
  regionId?: number | unknown;
  pageId: number;
  applicationId: number;
  displaySequence: number | null;
  sourceType: string | null;
  conditionType: string | null;
  lastUpdatedBy: string | null;
  lastUpdatedOn: Date | null;
}

export type ApexComponentType = 'regions' | 'items' | 'buttons' | 'processes' | 'computations' | 'validations';

export type ApexSearchObjectType = 'applications' | 'pages' | 'regions' | 'items' | 'buttons' | 'processes';

export interface ApexSearchResult {
  objectType: ApexSearchObjectType;
  objectId: number;
  objectName: string;
  parentId: number | null;
  parentName: string | null;
  applicationId: number;
  applicationName: string;
  matchContext: string | null;
}

// ── View Mapping ─────────────────────────────────────────────────────────────

const COMPONENT_VIEW_MAP: Record<ApexComponentType, string> = {
  regions: 'APEX_APPLICATION_PAGE_REGIONS',
  items: 'APEX_APPLICATION_PAGE_ITEMS',
  buttons: 'APEX_APPLICATION_PAGE_BUTTONS',
  processes: 'APEX_APPLICATION_PAGE_PROC',
  computations: 'APEX_APPLICATION_PAGE_COMP',
  validations: 'APEX_APPLICATION_PAGE_VAL',
};

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

// ── Adapter Functions ────────────────────────────────────────────────────────

/**
 * List all APEX applications in a workspace via the MCP client.
 * Accepts a workspace filter with optional id or name.
 */
export async function listApplications(
  client: MCPClient,
  workspace: { id?: number; name?: string },
): Promise<ApexApplication[]> {
  let sql: string;
  let binds: unknown[];

  if (workspace.id !== undefined) {
    sql = `SELECT APPLICATION_ID, APPLICATION_NAME, APPLICATION_GROUP,
            OWNER, WORKSPACE_ID, WORKSPACE, VERSION, PAGES,
            LAST_UPDATED_BY, LAST_UPDATED_ON
     FROM APEX_APPLICATIONS
     WHERE WORKSPACE_ID = :1
     ORDER BY APPLICATION_NAME`;
    binds = [workspace.id];
  } else if (workspace.name !== undefined) {
    sql = `SELECT APPLICATION_ID, APPLICATION_NAME, APPLICATION_GROUP,
            OWNER, WORKSPACE_ID, WORKSPACE, VERSION, PAGES,
            LAST_UPDATED_BY, LAST_UPDATED_ON
     FROM APEX_APPLICATIONS
     WHERE WORKSPACE = :1
     ORDER BY APPLICATION_NAME`;
    binds = [workspace.name];
  } else {
    sql = `SELECT APPLICATION_ID, APPLICATION_NAME, APPLICATION_GROUP,
            OWNER, WORKSPACE_ID, WORKSPACE, VERSION, PAGES,
            LAST_UPDATED_BY, LAST_UPDATED_ON
     FROM APEX_APPLICATIONS
     ORDER BY APPLICATION_NAME`;
    binds = [];
  }

  const result: MCPQueryResult = await client.query(sql, binds);
  return result.rows.map(mapApplication);
}

/**
 * List all pages for a given APEX application via the MCP client.
 */
export async function listPages(
  client: MCPClient,
  appId: number,
): Promise<ApexPage[]> {
  const result: MCPQueryResult = await client.query(
    `SELECT PAGE_ID, PAGE_NAME, PAGE_ALIAS, PAGE_MODE, PAGE_GROUP,
            APPLICATION_ID, USER_INTERFACE_ID, PAGE_FUNCTION,
            LAST_UPDATED_BY, LAST_UPDATED_ON
     FROM APEX_APPLICATION_PAGES
     WHERE APPLICATION_ID = :1
     ORDER BY PAGE_ID`,
    [appId],
  );

  return result.rows.map(mapPage);
}

/**
 * List components of a specific type on a page via the MCP client.
 */
export async function listComponents(
  client: MCPClient,
  pageId: number,
  type: ApexComponentType,
): Promise<ApexComponent[]> {
  const viewName = COMPONENT_VIEW_MAP[type];
  if (!viewName) {
    throw new Error(`Unknown component type: ${type}`);
  }

  const result: MCPQueryResult = await client.query(
    `SELECT *
     FROM ${viewName}
     WHERE PAGE_ID = :1
     ORDER BY DISPLAY_SEQUENCE NULLS LAST`,
    [pageId],
  );

  return result.rows.map((row) => mapComponent(row, type));
}

/**
 * Search across APEX dictionary views for objects matching a term.
 */
export async function searchObjects(
  client: MCPClient,
  term: string,
  objectTypes?: ApexSearchObjectType[],
): Promise<ApexSearchResult[]> {
  const searchTerm = `%${term.toUpperCase()}%`;
  const results: ApexSearchResult[] = [];

  const typesToSearch = objectTypes ?? ['applications', 'pages', 'regions', 'items'];

  if (typesToSearch.includes('applications')) {
    const appResult = await client.query(
      `SELECT APPLICATION_ID, APPLICATION_NAME, WORKSPACE_ID, WORKSPACE
       FROM APEX_APPLICATIONS
       WHERE UPPER(APPLICATION_NAME) LIKE :1
       ORDER BY APPLICATION_NAME`,
      [searchTerm],
    );
    for (const row of appResult.rows) {
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
    const pageResult = await client.query(
      `SELECT p.PAGE_ID, p.PAGE_NAME, p.APPLICATION_ID,
              a.APPLICATION_NAME
       FROM APEX_APPLICATION_PAGES p
       JOIN APEX_APPLICATIONS a ON a.APPLICATION_ID = p.APPLICATION_ID
       WHERE UPPER(p.PAGE_NAME) LIKE :1
       ORDER BY a.APPLICATION_NAME, p.PAGE_ID`,
      [searchTerm],
    );
    for (const row of pageResult.rows) {
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
    const regionResult = await client.query(
      `SELECT r.REGION_ID, r.REGION_NAME, r.PAGE_ID, r.APPLICATION_ID,
              a.APPLICATION_NAME
       FROM APEX_APPLICATION_PAGE_REGIONS r
       JOIN APEX_APPLICATIONS a ON a.APPLICATION_ID = r.APPLICATION_ID
       WHERE UPPER(r.REGION_NAME) LIKE :1
       ORDER BY a.APPLICATION_NAME, r.PAGE_ID`,
      [searchTerm],
    );
    for (const row of regionResult.rows) {
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
    const itemResult = await client.query(
      `SELECT i.ITEM_ID, i.ITEM_NAME, i.PAGE_ID, i.APPLICATION_ID,
              a.APPLICATION_NAME
       FROM APEX_APPLICATION_PAGE_ITEMS i
       JOIN APEX_APPLICATIONS a ON a.APPLICATION_ID = i.APPLICATION_ID
       WHERE UPPER(i.ITEM_NAME) LIKE :1
       ORDER BY a.APPLICATION_NAME, i.PAGE_ID`,
      [searchTerm],
    );
    for (const row of itemResult.rows) {
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
    const btnResult = await client.query(
      `SELECT b.BUTTON_ID, b.BUTTON_NAME, b.PAGE_ID, b.APPLICATION_ID,
              a.APPLICATION_NAME
       FROM APEX_APPLICATION_PAGE_BUTTONS b
       JOIN APEX_APPLICATIONS a ON a.APPLICATION_ID = b.APPLICATION_ID
       WHERE UPPER(b.BUTTON_NAME) LIKE :1
       ORDER BY a.APPLICATION_NAME, b.PAGE_ID`,
      [searchTerm],
    );
    for (const row of btnResult.rows) {
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
    const procResult = await client.query(
      `SELECT p.PROCESS_ID, p.PROCESS_NAME, p.PAGE_ID, p.APPLICATION_ID,
              a.APPLICATION_NAME
       FROM APEX_APPLICATION_PAGE_PROC p
       JOIN APEX_APPLICATIONS a ON a.APPLICATION_ID = p.APPLICATION_ID
       WHERE UPPER(p.PROCESS_NAME) LIKE :1
       ORDER BY a.APPLICATION_NAME, p.PAGE_ID`,
      [searchTerm],
    );
    for (const row of procResult.rows) {
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
