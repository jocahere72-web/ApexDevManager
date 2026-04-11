# Functional Design -- U3: Connection UI and Application Explorer

## Document Information

| Field | Value |
|-------|-------|
| **Unit** | U3 -- Connection UI and Application Explorer |
| **Sprint** | S2 (Fase 1) |
| **Duration** | 2 weeks (Weeks 6-7) |
| **Modules** | M1 UI (Connection Manager frontend) + M2 (Application Explorer) |
| **Stories** | US-006 (UI), US-007 (UI), US-008, US-009, US-047 |
| **Components** | C04 (UI layer), C05 (Explorer Service), C22 (MCP Connector) |
| **Status** | AI-DLC Generated -- For Review |
| **Date** | 2026-04-10 |

---

## 1. M1 UI -- Connection Manager Frontend

### 1.1 Connection List View

The Connection List view is the primary landing screen for M1. It displays all registered APEX connections for the current tenant with real-time health status indicators, filtering, and search.

#### UI Wireframe Description

```
+-------------------------------------------------------------------+
| Connection Manager                            [+ New Connection]   |
+-------------------------------------------------------------------+
| [Search connections...]  | Environment: [All v] | Status: [All v] |
+-------------------------------------------------------------------+
| Name           | Type | Environment | Status      | Last Checked  |
|----------------|------|-------------|-------------|---------------|
| APEX-DEV-01    | ORDS | dev         | (G) Online  | 2 min ago     |
| APEX-QA-01     | JDBC | test        | (Y) Degraded| 5 min ago     |
| APEX-PROD-01   | ORDS | prod        | (G) Online  | 1 min ago     |
| APEX-STAGING   | ORDS | staging     | (R) Offline | 10 min ago    |
+-------------------------------------------------------------------+
| Tags: [oracle] [hr-app] [x] Clear                                |
+-------------------------------------------------------------------+
| Showing 4 of 12 connections                   [< 1 2 3 >]         |
+-------------------------------------------------------------------+

Status indicators:
  (G) = Green circle -- connected
  (Y) = Yellow circle -- degraded (>3000ms latency)
  (R) = Red circle -- disconnected
  (?) = Grey circle -- unknown (never tested)
```

#### Connection List Component Props

```typescript
interface ConnectionListProps {
  connections: ConnectionListItem[];
  pagination: PaginationState;
  filters: ConnectionFilters;
  onFilterChange: (filters: ConnectionFilters) => void;
  onPageChange: (page: number) => void;
  onConnectionClick: (id: string) => void;
  onNewConnection: () => void;
}

interface ConnectionListItem {
  id: string;
  name: string;
  type: 'ords' | 'jdbc';
  environment: 'dev' | 'test' | 'staging' | 'prod';
  status: 'connected' | 'degraded' | 'disconnected' | 'unknown';
  lastCheckAt: string | null;
  lastLatencyMs: number | null;
  tags: string[];
}

interface ConnectionFilters {
  search: string;
  environment: string | null;
  status: string | null;
  tags: string[];
}
```

#### Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| CONN-UI-R01 | Status badge color | Green = connected, Yellow = degraded, Red = disconnected, Grey = unknown |
| CONN-UI-R02 | Auto-refresh | Connection list polls every 30 seconds for status updates |
| CONN-UI-R03 | Search scope | Search filters on name, tags, and labels (case-insensitive) |
| CONN-UI-R04 | Pagination | Default 10 per page, max 50 |
| CONN-UI-R05 | Tag display | Max 3 tags visible inline; "+N more" tooltip for overflow |

---

### 1.2 Connection Detail View

The detail view shows full information for a single connection including health history, pool stats, and change log.

#### UI Wireframe Description

```
+-------------------------------------------------------------------+
| < Back to List    APEX-DEV-01                   [Edit] [Test] [x]  |
+-------------------------------------------------------------------+
| General          | Health         | Change Log                      |
+-------------------------------------------------------------------+
| Name:       APEX-DEV-01                                            |
| Type:       ORDS                                                   |
| Environment: dev                                                   |
| ORDS URL:   https://apex.example.com/ords/dev                      |
| Workspace:  HR_WORKSPACE                                           |
| Schema:     HR                                                     |
| Status:     (G) Connected -- 142ms                                 |
| Tags:       [oracle] [hr-app] [Add tag...]                        |
| Created:    2026-04-01 by admin@company.com                        |
| Last Modified: 2026-04-09 by dev@company.com                       |
+-------------------------------------------------------------------+
| Health History (Last 7 days)                                       |
| [=========G=========][=G=][Y][=G=][=G=][=G=][=G=]                  |
|  Mon   Tue   Wed   Thu   Fri   Sat   Sun                           |
|                                                                    |
| Avg Latency: 145ms | Uptime: 99.2% | Failures: 2                  |
+-------------------------------------------------------------------+
```

---

### 1.3 Connection Form (Create / Edit)

The connection form supports both ORDS and JDBC connection types with discriminated fields. The form validates inputs and performs a live connection test before submission.

#### Sequence Diagram

```
User                  Connection Form         Validation         API            APEX Instance
  |                        |                      |                |                |
  |-- fill form fields --->|                      |                |                |
  |                        |-- validate fields --->|                |                |
  |                        |<-- validation result -|                |                |
  |                        |                      |                |                |
  |-- click "Test" ------->|                      |                |                |
  |                        |-- POST /test -------->|                |                |
  |                        |                      |                |-- connect ----->|
  |                        |                      |                |<-- result ------|
  |                        |<-- test result -------|                |                |
  |                        |                      |                |                |
  |  [IF test passed]      |                      |                |                |
  |-- click "Save" ------->|                      |                |                |
  |                        |-- POST /connections ->|                |                |
  |                        |<-- 201 Created -------|                |                |
  |<-- redirect to detail -|                      |                |                |
```

#### Form Validation (Zod -- Frontend)

```typescript
const ConnectionFormSchema = z.discriminatedUnion('type', [
  z.object({
    type: z.literal('ords'),
    name: z.string().min(3).max(100),
    environment: z.enum(['dev', 'test', 'staging', 'prod']),
    ordsBaseUrl: z.string().url().startsWith('https://'),
    workspaceName: z.string().min(1).max(128),
    schemaName: z.string().min(1).max(128),
    username: z.string().min(1).max(128),
    password: z.string().min(8).max(256),
    tags: z.array(z.string().max(50)).max(20).optional(),
  }),
  z.object({
    type: z.literal('jdbc'),
    name: z.string().min(3).max(100),
    environment: z.enum(['dev', 'test', 'staging', 'prod']),
    host: z.string().min(1).max(255),
    port: z.number().int().min(1).max(65535),
    serviceName: z.string().min(1).max(128),
    schemaName: z.string().min(1).max(128),
    username: z.string().min(1).max(128),
    password: z.string().min(8).max(256),
    poolMin: z.number().int().min(1).max(10).default(2),
    poolMax: z.number().int().min(1).max(20).default(5),
    poolIncrement: z.number().int().min(1).max(5).default(1),
    tags: z.array(z.string().max(50)).max(20).optional(),
  }),
]);
```

#### Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| CONN-FORM-R01 | Test before save | Connection must pass a test before save is enabled |
| CONN-FORM-R02 | HTTPS enforcement | ORDS base URL must use HTTPS (no HTTP) |
| CONN-FORM-R03 | Credential masking | Password fields are never pre-populated on edit |
| CONN-FORM-R04 | Duplicate name | Name must be unique per tenant; form shows inline error if duplicate |
| CONN-FORM-R05 | Tag autocomplete | Tags suggest existing tenant tags as user types |

---

### 1.4 Health Status Badge Component

A reusable badge component used across Connection List, Connection Detail, and the global sidebar.

```typescript
interface HealthBadgeProps {
  status: 'connected' | 'degraded' | 'disconnected' | 'unknown';
  latencyMs?: number;
  lastCheckedAt?: string;
  size?: 'sm' | 'md' | 'lg';
}
```

| Status | Color | Icon | Tooltip |
|--------|-------|------|---------|
| connected | `green-500` | Filled circle | "Connected -- {latencyMs}ms" |
| degraded | `yellow-500` | Warning triangle | "Degraded -- {latencyMs}ms (>3000ms)" |
| disconnected | `red-500` | X circle | "Disconnected since {lastCheckedAt}" |
| unknown | `gray-400` | Question mark | "Never tested" |

---

### 1.5 Soft Delete Confirmation

When a user deletes a connection, a confirmation modal is displayed with the connection name and affected applications.

```
+---------------------------------------------+
| Delete Connection                           |
+---------------------------------------------+
| Are you sure you want to delete             |
| "APEX-DEV-01"?                              |
|                                              |
| This connection is used by:                  |
|   - HR Application (App 100)                |
|   - Finance Dashboard (App 200)             |
|                                              |
| The connection will be soft-deleted and      |
| can be restored within 30 days.              |
|                                              |
|          [Cancel]   [Delete Connection]       |
+---------------------------------------------+
```

---

## 2. M2 -- Application Explorer

### 2.1 Application Tree Component

The Application Explorer presents APEX metadata as a navigable tree using the following APEX dictionary views:

| Dictionary View | Tree Level | Key Columns |
|-----------------|-----------|-------------|
| `APEX_APPLICATIONS` | Root | application_id, application_name, alias, version |
| `APEX_APPLICATION_PAGES` | Level 1 | page_id, page_name, page_mode, page_group |
| `APEX_APPLICATION_PAGE_REGIONS` | Level 2 | region_id, region_name, region_type, source_type |
| `APEX_APPLICATION_PAGE_ITEMS` | Level 2 | item_id, item_name, item_type, display_type |
| `APEX_APPLICATION_PAGE_PROCESSES` | Level 2 | process_id, process_name, process_type, process_point |
| `APEX_APPLICATION_PAGE_DA` | Level 2 | dynamic_action_id, dynamic_action_name, event, condition_type |

#### Tree Structure

```
Workspace: HR_WORKSPACE
  +-- Application: HR Portal (100)
  |   +-- Pages
  |   |   +-- Page 1: Home
  |   |   |   +-- Regions
  |   |   |   |   +-- Welcome Banner (Static Content)
  |   |   |   |   +-- Employee List (Interactive Report)
  |   |   |   +-- Items
  |   |   |   |   +-- P1_SEARCH (Text Field)
  |   |   |   |   +-- P1_DEPARTMENT (Select List)
  |   |   |   +-- Processes
  |   |   |   |   +-- Set Department Filter (PL/SQL)
  |   |   |   +-- Dynamic Actions
  |   |   |       +-- On Change Department (Change)
  |   |   +-- Page 2: Employee Detail
  |   |   |   +-- ...
  |   +-- Shared Components
  |       +-- LOVs
  |       +-- Templates
  |       +-- Authentication Schemes
  +-- Application: Finance Dashboard (200)
      +-- ...
```

#### Lazy Loading Strategy

```
User clicks tree node       ExplorerStore           Explorer API         MCP/ORDS         Redis
       |                        |                       |                   |               |
       |-- expand app node ---->|                       |                   |               |
       |                        |-- check cache ------->|                   |               |
       |                        |                       |-- check Redis --->|               |
       |                        |                       |                   |-- HIT ------->|
       |                        |                       |<-- cached data ---|               |
       |                        |<-- pages[] -----------|                   |               |
       |<-- render child nodes -|                       |                   |               |
       |                        |                       |                   |               |
       |-- expand page node --->|                       |                   |               |
       |                        |-- check cache ------->|                   |               |
       |                        |                       |-- check Redis --->|               |
       |                        |                       |                   |-- MISS ------>|
       |                        |                       |-- fetch via MCP ->|               |
       |                        |                       |<-- components ----|               |
       |                        |                       |-- cache in Redis -|-------------->|
       |                        |<-- components[] ------|                   |               |
       |<-- render child nodes -|                       |                   |               |
```

Nodes are loaded on expand. Only the application list is fetched eagerly on first render. Pages are fetched when an application node is expanded. Components (regions, items, processes, dynamic actions) are fetched when a page node is expanded.

#### Tree Component Interface

```typescript
interface ApplicationTreeProps {
  connectionId: string;
  onNodeSelect: (node: TreeNode) => void;
  onNodeContextMenu: (node: TreeNode, event: React.MouseEvent) => void;
  searchTerm?: string;
  selectedNodeId?: string;
}

interface TreeNode {
  id: string;                              // e.g., "app:100", "page:100:1", "region:100:1:42"
  type: 'workspace' | 'application' | 'page' | 'region' | 'item' | 'process' | 'dynamic_action' | 'shared_component';
  label: string;
  icon: string;
  children?: TreeNode[];
  isLoading?: boolean;
  isExpanded?: boolean;
  metadata: Record<string, unknown>;
}
```

---

### 2.2 Search and Filter

The explorer supports both local filtering (within loaded nodes) and server-side search (across all APEX objects).

#### Search Flow

```
User types in search         Debounce (300ms)        Explorer API         Backend
       |                          |                       |                  |
       |-- "emp" --------------->|                       |                  |
       |                          |-- fire after 300ms -->|                  |
       |                          |                       |-- GET /explorer/search?term=emp
       |                          |                       |<-- SearchResult[] |
       |                          |<-- results -----------|                  |
       |<-- highlight matches ---|                       |                  |
```

#### Search Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| EXP-SEARCH-R01 | Debounce | 300ms debounce on keystroke before API call |
| EXP-SEARCH-R02 | Minimum length | At least 2 characters to trigger server search |
| EXP-SEARCH-R03 | Result grouping | Results grouped by object type (pages, regions, items, etc.) |
| EXP-SEARCH-R04 | Result limit | Max 50 results per search (paginated) |
| EXP-SEARCH-R05 | Highlight | Matched substring highlighted in result name |
| EXP-SEARCH-R06 | Navigate to node | Clicking a result auto-expands tree to that node |

---

### 2.3 MCP Connector for Metadata Reads

The backend uses MCP (Model Context Protocol) as the primary connector for reading APEX metadata from the Oracle database. ORDS serves as fallback when MCP is unavailable.

#### MCP Connector Architecture

```
Explorer Service (C05)
       |
       +-- MCPConnector
       |     |-- connect(connectionConfig): MCPSession
       |     |-- query(view: string, filters: object): Result[]
       |     |-- disconnect(session: MCPSession): void
       |     +-- health(): MCPHealthStatus
       |
       +-- ORDSFallback (when MCP unavailable)
             |-- fetchViaREST(view: string, filters: object): Result[]
             +-- health(): ORDSHealthStatus
```

#### MCP Query Mapping

| Explorer Operation | MCP Tool/Query | Fallback ORDS Endpoint |
|-------------------|----------------|----------------------|
| List applications | `apex.listApplications(workspaceId)` | `GET /ords/{schema}/_/sql` with APEX_APPLICATIONS query |
| List pages | `apex.listPages(appId)` | `GET /ords/{schema}/_/sql` with APEX_APPLICATION_PAGES query |
| List regions | `apex.listComponents(pageId, 'regions')` | `GET /ords/{schema}/_/sql` with APEX_APPLICATION_PAGE_REGIONS query |
| List items | `apex.listComponents(pageId, 'items')` | `GET /ords/{schema}/_/sql` with APEX_APPLICATION_PAGE_ITEMS query |
| List processes | `apex.listComponents(pageId, 'processes')` | `GET /ords/{schema}/_/sql` with APEX_APPLICATION_PAGE_PROCESSES query |
| List dynamic actions | `apex.listComponents(pageId, 'da')` | `GET /ords/{schema}/_/sql` with APEX_APPLICATION_PAGE_DA query |
| Search objects | `apex.search(term, objectTypes)` | `GET /ords/{schema}/_/sql` with UNION ALL search query |

---

### 2.4 Component Caching Strategy

All metadata fetched from APEX dictionary views is cached in Redis to reduce database load and improve tree rendering performance.

#### Cache Architecture

| Cache Key Pattern | TTL | Invalidation |
|-------------------|-----|--------------|
| `explorer:{tenantId}:{connId}:apps` | 1 hour | Manual refresh, connection re-test |
| `explorer:{tenantId}:{connId}:pages:{appId}` | 1 hour | Manual refresh, on component edit |
| `explorer:{tenantId}:{connId}:components:{pageId}` | 1 hour | Manual refresh, on component edit |
| `explorer:{tenantId}:{connId}:tree:{appId}` | 1 hour | Manual refresh (full tree) |
| `explorer:{tenantId}:{connId}:search:{hash}` | 5 min | Short TTL for search results |

#### Cache Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| CACHE-R01 | TTL | 1 hour for tree data, 5 minutes for search results |
| CACHE-R02 | Invalidation on edit | When a component is modified via Editor (U4), its page cache is invalidated |
| CACHE-R03 | Manual refresh | User can click "Refresh" to force cache invalidation for current app |
| CACHE-R04 | Cache miss behavior | On cache miss, fetch from MCP/ORDS, cache result, return |
| CACHE-R05 | Stale indicator | If cached data is older than 30 minutes, show subtle "cached" indicator |
| CACHE-R06 | Max cache size | Per-tenant cache limited to 50MB (evict LRU when exceeded) |

---

### 2.5 Offline Mode

When the APEX connection is unavailable (status = disconnected), the explorer falls back to a read-only cached view with clear visual indicators.

#### Offline Behavior

| Feature | Online | Offline |
|---------|--------|---------|
| Tree navigation | Live data + cache | Cached data only |
| Search | Server-side search | Local filter on cached nodes |
| Component detail | Live data | Cached properties (if previously viewed) |
| Context menu actions | All enabled | "Open in Editor" disabled, "Copy" enabled |
| Visual indicator | None | Yellow banner: "Offline -- showing cached data from {timestamp}" |

#### LocalStorage Cache for Offline

When a user navigates the tree, viewed nodes are persisted to `localStorage` as a secondary cache for offline scenarios where Redis is also unreachable (frontend-only offline mode).

```typescript
interface OfflineCache {
  tenantId: string;
  connectionId: string;
  lastSyncAt: string;
  trees: Record<string, ApplicationTree>;       // keyed by appId
  totalSizeBytes: number;
}
```

| Rule ID | Rule | Details |
|---------|------|---------|
| OFFLINE-R01 | localStorage limit | Max 5MB per connection (browser limit consideration) |
| OFFLINE-R02 | Sync indicator | Show last sync timestamp in offline banner |
| OFFLINE-R03 | Auto-sync on reconnect | When connection recovers, refresh cached data automatically |
| OFFLINE-R04 | Stale data warning | If cached data is older than 24 hours, show warning dialog |

---

### 2.6 Sync Indicators

The explorer sidebar includes visual indicators showing cache freshness and sync status.

```
+-------------------------------------------+
| Application Explorer        [Refresh] [?] |
+-------------------------------------------+
| Connection: APEX-DEV-01  (G) Online       |
| Last synced: 12 min ago  [Syncing...]     |
+-------------------------------------------+
| [tree content here]                        |
+-------------------------------------------+
```

| Indicator | Condition | Visual |
|-----------|-----------|--------|
| Fresh | Synced < 5 min ago | Green dot, "Just synced" |
| Recent | Synced 5-30 min ago | No indicator (normal) |
| Stale | Synced 30-60 min ago | Yellow dot, "Cached 45m ago" |
| Very stale | Synced > 60 min ago | Orange dot, "Last sync: 2h ago" |
| Syncing | Fetch in progress | Spinner, "Syncing..." |
| Offline | Connection down | Red banner |

---

## 3. State Management (Zustand)

### 3.1 Connection Store

```typescript
interface ConnectionStore {
  // State
  connections: ConnectionListItem[];
  selectedConnection: ConnectionDetail | null;
  filters: ConnectionFilters;
  pagination: PaginationState;
  isLoading: boolean;
  error: string | null;

  // Actions
  fetchConnections: (filters?: ConnectionFilters) => Promise<void>;
  fetchConnectionById: (id: string) => Promise<void>;
  createConnection: (data: CreateConnectionInput) => Promise<string>;
  updateConnection: (id: string, data: UpdateConnectionInput) => Promise<void>;
  deleteConnection: (id: string) => Promise<void>;
  testConnection: (id: string) => Promise<TestResult>;
  setFilters: (filters: Partial<ConnectionFilters>) => void;
  setPage: (page: number) => void;
}
```

### 3.2 Explorer Store

```typescript
interface ExplorerStore {
  // State
  trees: Record<string, TreeNode>;           // keyed by connectionId
  selectedNode: TreeNode | null;
  searchResults: SearchResult[];
  searchTerm: string;
  isSearching: boolean;
  syncStatus: Record<string, SyncStatus>;    // keyed by connectionId
  offlineMode: boolean;

  // Actions
  fetchApplications: (connectionId: string) => Promise<void>;
  expandNode: (nodeId: string) => Promise<void>;
  collapseNode: (nodeId: string) => void;
  selectNode: (node: TreeNode) => void;
  search: (term: string) => Promise<void>;
  refreshTree: (connectionId: string, appId?: number) => Promise<void>;
  syncOfflineCache: (connectionId: string) => Promise<void>;
}
```

---

## 4. API Endpoints (Explorer Backend)

| Method | Path | Auth | Description |
|--------|------|------|-------------|
| `GET` | `/api/v1/explorer/apps/:connectionId` | authenticate() | List applications for a connection |
| `GET` | `/api/v1/explorer/pages/:connectionId/:appId` | authenticate() | List pages for an application |
| `GET` | `/api/v1/explorer/components/:connectionId/:pageId` | authenticate() | List all components for a page |
| `GET` | `/api/v1/explorer/tree/:connectionId/:appId` | authenticate() | Full application tree (cached) |
| `GET` | `/api/v1/explorer/search` | authenticate() | Search across APEX objects |
| `POST` | `/api/v1/explorer/sync/:connectionId` | authenticate() | Force sync/refresh cache |
| `GET` | `/api/v1/explorer/sync-status/:connectionId` | authenticate() | Get sync status |

### Explorer API Validation

```typescript
const ListAppsParamsSchema = z.object({
  connectionId: z.string().uuid(),
});

const ListPagesParamsSchema = z.object({
  connectionId: z.string().uuid(),
  appId: z.coerce.number().int().positive(),
});

const ListComponentsParamsSchema = z.object({
  connectionId: z.string().uuid(),
  pageId: z.coerce.number().int().positive(),
});

const SearchQuerySchema = z.object({
  connectionId: z.string().uuid(),
  term: z.string().min(2).max(200),
  objectTypes: z.array(z.enum(['page', 'region', 'item', 'process', 'dynamic_action'])).optional(),
  appId: z.coerce.number().int().positive().optional(),
  limit: z.coerce.number().int().min(1).max(50).default(20),
  offset: z.coerce.number().int().min(0).default(0),
});
```

---

## 5. Error Handling

| Error Code | HTTP Status | Condition | User Message |
|------------|-------------|-----------|-------------|
| `EXP_CONNECTION_UNAVAILABLE` | 503 | Target APEX connection is offline | "Connection is currently unavailable. Showing cached data." |
| `EXP_MCP_TIMEOUT` | 504 | MCP query exceeded 30s timeout | "Metadata fetch timed out. Please try again." |
| `EXP_CACHE_MISS` | 200 (partial) | Redis cache miss, live fetch triggered | (Transparent to user, slightly slower response) |
| `EXP_APP_NOT_FOUND` | 404 | Application ID does not exist | "Application not found in this workspace." |
| `EXP_SEARCH_TOO_SHORT` | 400 | Search term < 2 characters | "Please enter at least 2 characters to search." |
| `CONN_UI_DUPLICATE_NAME` | 409 | Connection name already exists for tenant | "A connection with this name already exists." |
| `CONN_UI_TEST_FAILED` | 422 | Connection test failed during form submission | "Connection test failed: {error}. Please verify your settings." |

---

## 6. Security Considerations

| Concern | Mitigation |
|---------|-----------|
| Connection credentials exposed in UI | Credentials are never returned by API; password fields masked |
| SQL injection via search term | Search terms parameterized; Zod validation enforces max length |
| Cross-tenant tree access | All explorer queries scoped by tenantId via RLS; connectionId validated against tenant |
| MCP session hijacking | MCP sessions are short-lived, scoped to a single request |
| Cached data leakage | Redis cache keys include tenantId; localStorage keyed by tenantId + connectionId |
| CSRF on connection mutations | CSRF token required on POST/PATCH/DELETE; sameSite cookie policy |
