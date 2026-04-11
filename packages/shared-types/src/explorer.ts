// ---------------------------------------------------------------------------
// Explorer Types -- APEX Application Object Model
// ---------------------------------------------------------------------------

/** Sync freshness indicator */
export type SyncFreshness = 'fresh' | 'stale' | 'syncing' | 'error';

/** Represents the synchronisation status of a connection's cached tree */
export interface SyncStatus {
  connectionId: string;
  freshness: SyncFreshness;
  lastSyncAt: string | null;
  nextSyncAt: string | null;
  /** Number of objects currently cached */
  cachedObjectCount: number;
  errorMessage?: string;
}

// ---------------------------------------------------------------------------
// APEX domain objects
// ---------------------------------------------------------------------------

export interface ApexWorkspace {
  id: string;
  connectionId: string;
  name: string;
  schema: string;
  applications: ApexApplication[];
}

export interface ApexApplication {
  id: string;
  workspaceId: string;
  applicationId: number;
  name: string;
  alias?: string;
  version?: string;
  pagesCount: number;
  lastModified: string;
  modifiedBy: string;
}

export type ApexPageMode = 'Normal' | 'Modal Dialog' | 'Non-Modal Dialog' | 'Drawer';

export interface ApexPage {
  id: string;
  applicationId: string;
  pageNumber: number;
  name: string;
  title?: string;
  pageMode: ApexPageMode;
  templateName?: string;
  pageGroup?: string;
  regionsCount: number;
  lastModified: string;
  modifiedBy: string;
}

export type ApexRegionType =
  | 'Static Content'
  | 'Interactive Report'
  | 'Interactive Grid'
  | 'Classic Report'
  | 'Chart'
  | 'Form'
  | 'Cards'
  | 'List'
  | 'PL/SQL Dynamic Content'
  | string;

export interface ApexRegion {
  id: string;
  pageId: string;
  name: string;
  regionType: ApexRegionType;
  source?: string;
  displayPosition: string;
  displaySequence: number;
  lastModified: string;
  modifiedBy: string;
}

export type ApexItemType =
  | 'Text Field'
  | 'Textarea'
  | 'Select List'
  | 'Checkbox'
  | 'Radio Group'
  | 'Date Picker'
  | 'Number Field'
  | 'Hidden'
  | 'Display Only'
  | string;

export interface ApexItem {
  id: string;
  regionId: string;
  name: string;
  itemType: ApexItemType;
  label?: string;
  displaySequence: number;
  isRequired: boolean;
  lastModified: string;
  modifiedBy: string;
}

export interface ApexProcess {
  id: string;
  pageId: string;
  name: string;
  processType: string;
  executionPoint: 'Before Header' | 'After Submit' | 'On Demand' | string;
  source?: string;
  conditionType?: string;
  lastModified: string;
  modifiedBy: string;
}

export interface ApexDynamicAction {
  id: string;
  pageId: string;
  name: string;
  event: string;
  triggeringElement?: string;
  conditionType?: string;
  actionCount: number;
  lastModified: string;
  modifiedBy: string;
}

// ---------------------------------------------------------------------------
// Generic tree structures
// ---------------------------------------------------------------------------

export type TreeNodeType =
  | 'workspace'
  | 'application'
  | 'page'
  | 'region'
  | 'item'
  | 'process'
  | 'dynamic_action';

export interface TreeNode {
  id: string;
  parentId: string | null;
  label: string;
  nodeType: TreeNodeType;
  /** The underlying APEX object – present when the node has been loaded */
  data?: ApexApplication | ApexPage | ApexRegion | ApexItem | ApexProcess | ApexDynamicAction;
  children: TreeNode[];
  /** `true` while child nodes are being fetched */
  isLoading: boolean;
  /** `true` when this node's children have been fully fetched at least once */
  isLoaded: boolean;
  /** `true` when the data originates from the local offline cache */
  isCached: boolean;
}

export interface ApplicationTree {
  connectionId: string;
  applicationId: string;
  root: TreeNode;
  fetchedAt: string;
}

// ---------------------------------------------------------------------------
// Search
// ---------------------------------------------------------------------------

export interface SearchQuery {
  connectionId: string;
  term: string;
  /** Optional filter by object type */
  objectTypes?: TreeNodeType[];
  limit?: number;
  offset?: number;
}

export interface SearchResultItem {
  id: string;
  nodeType: TreeNodeType;
  label: string;
  /** Breadcrumb path, e.g. "HR App > Page 10 > Employees Region" */
  path: string;
  /** Indices into `label` where the search term matched (for highlighting) */
  matchRanges: Array<{ start: number; end: number }>;
}

export interface SearchResult {
  query: SearchQuery;
  totalCount: number;
  items: SearchResultItem[];
}

// ---------------------------------------------------------------------------
// Component detail — union helper
// ---------------------------------------------------------------------------

export type ApexComponentDetail =
  | { type: 'application'; data: ApexApplication }
  | { type: 'page'; data: ApexPage }
  | { type: 'region'; data: ApexRegion }
  | { type: 'item'; data: ApexItem }
  | { type: 'process'; data: ApexProcess }
  | { type: 'dynamic_action'; data: ApexDynamicAction };
