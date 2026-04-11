# Code Generation Plan -- U3: Connection UI and Application Explorer

## Document Information

| Field | Value |
|-------|-------|
| **Unit** | U3 -- Connection UI and Application Explorer |
| **Sprint** | S2 (Fase 1, Weeks 6-7) |
| **Modules** | M1 UI (Connection Manager frontend) + M2 (Application Explorer) |
| **Stories** | US-006 (UI), US-007 (UI), US-008, US-009, US-047 |
| **Status** | AI-DLC Generated -- For Review |
| **Date** | 2026-04-10 |

---

## Prerequisites

Before starting code generation, verify U2 Auth & Core Backend deliverables:
- [ ] JWT authentication with RS256 signing is operational
- [ ] RBAC middleware is functional for all 9 roles
- [ ] Connection backend CRUD endpoints are live (`/api/v1/connections`)
- [ ] Connection health check job is running
- [ ] Redis is operational for caching
- [ ] MCP Oracle APEX protocol documentation reviewed
- [ ] Design system tokens defined (colors, typography, spacing)

---

## Plan Checklist

### 1. Shared Types (packages/shared-types)

- [ ] `packages/shared-types/src/explorer.ts`
  - [ ] `ApexWorkspace` interface (workspaceId, workspaceName, schema, applicationCount)
  - [ ] `ApexApplication` interface (applicationId, applicationName, alias, version, pageCount, lastUpdated, lastUpdatedBy)
  - [ ] `ApexPage` interface (pageId, pageName, pageMode, pageTemplate, pageGroup, regionCount, itemCount, lastUpdated)
  - [ ] `ApexComponent` interface (componentId, componentName, componentType, sourceType, parentId)
  - [ ] `TreeNode` interface (id, type, label, icon, children, isLoading, isExpanded, metadata)
  - [ ] `ApplicationTree` interface (application, pages with components, sharedComponents)
  - [ ] `SearchQuery` interface (term, objectTypes, appId, limit, offset)
  - [ ] `SearchResult` interface (objectType, objectId, objectName, parentName, matchContext, relevanceScore)
  - [ ] `SyncStatus` interface (connectionId, lastSyncAt, status, itemsCached)
  - [ ] Re-export from `index.ts`

---

### 2. React Components for Connection Manager (apps/web/src/features/connections/)

- [ ] `components/ConnectionList.tsx`
  - [ ] Render paginated table of connections with status badges
  - [ ] Filter bar: search input, environment dropdown, status dropdown
  - [ ] Tag filter chips with clear action
  - [ ] "New Connection" button (role-gated: admin, developer, tech_lead, devops_engineer)
  - [ ] Click row navigates to detail view
  - [ ] Auto-refresh every 30 seconds via TanStack Query refetchInterval

- [ ] `components/ConnectionDetail.tsx`
  - [ ] General tab: connection properties, tags, created/modified info
  - [ ] Health tab: health history visualization (7-day bar), avg latency, uptime %, failure count
  - [ ] Change Log tab: paginated list of change log entries
  - [ ] Action buttons: Edit, Test Now, Delete (role-gated)

- [ ] `components/ConnectionForm.tsx`
  - [ ] Discriminated form: ORDS fields vs JDBC fields based on type toggle
  - [ ] Zod validation with react-hook-form integration
  - [ ] "Test Connection" button with loading spinner and result feedback
  - [ ] Save button disabled until test passes
  - [ ] Tag input with autocomplete from existing tenant tags
  - [ ] Edit mode: pre-fill fields (except password)

- [ ] `components/HealthBadge.tsx`
  - [ ] Reusable status badge component (connected/degraded/disconnected/unknown)
  - [ ] Configurable size (sm, md, lg)
  - [ ] Tooltip with latency and last checked time

- [ ] `components/DeleteConnectionModal.tsx`
  - [ ] Confirmation dialog showing connection name
  - [ ] List of applications using this connection
  - [ ] Soft-delete disclaimer (restorable within 30 days)
  - [ ] Cancel and Delete actions

---

### 3. React Application Explorer Tree Component (apps/web/src/features/explorer/)

- [ ] `components/ApplicationExplorer.tsx`
  - [ ] Sidebar panel with connection selector dropdown
  - [ ] Tree component with expand/collapse behavior
  - [ ] Lazy-loading: fetch children on node expand
  - [ ] Loading skeleton for expanding nodes
  - [ ] Selected node highlighting
  - [ ] Context menu (right-click): Open in Editor, Copy Name, Refresh
  - [ ] Sync status indicator in header (fresh/stale/syncing/offline)
  - [ ] Offline banner when connection is disconnected

- [ ] `components/TreeNode.tsx`
  - [ ] Recursive tree node renderer
  - [ ] Icon per node type (app, page, region, item, process, dynamic_action)
  - [ ] Expand/collapse arrow
  - [ ] Click to select, double-click to expand
  - [ ] Dimmed style for offline-cached nodes

- [ ] `components/ExplorerSearch.tsx`
  - [ ] Search input with 300ms debounce
  - [ ] Minimum 2 characters to trigger search
  - [ ] Results grouped by object type
  - [ ] Matched substring highlighting
  - [ ] Click result to navigate and expand tree to that node
  - [ ] "No results" empty state

- [ ] `components/ComponentDetailPanel.tsx`
  - [ ] Right-side panel showing properties of selected tree node
  - [ ] Dynamic content based on node type (page properties, region properties, etc.)
  - [ ] "Open in Editor" action button
  - [ ] Metadata display: last modified, modified by, type-specific fields

---

### 4. API Client Services (apps/web/src/services/)

- [ ] `services/connections.api.ts`
  - [ ] `fetchConnections(filters, pagination): Promise<PaginatedResult<ConnectionListItem>>`
  - [ ] `fetchConnectionById(id): Promise<ConnectionDetail>`
  - [ ] `createConnection(data): Promise<{ id: string }>`
  - [ ] `updateConnection(id, data): Promise<ConnectionDetail>`
  - [ ] `deleteConnection(id): Promise<void>`
  - [ ] `testConnection(id): Promise<TestResult>`
  - [ ] `fetchHealthHistory(id, days): Promise<HealthHistoryEntry[]>`

- [ ] `services/explorer.api.ts`
  - [ ] `fetchApplications(connectionId): Promise<ApexApplication[]>`
  - [ ] `fetchPages(connectionId, appId): Promise<ApexPage[]>`
  - [ ] `fetchComponents(connectionId, pageId): Promise<ApexComponent[]>`
  - [ ] `fetchApplicationTree(connectionId, appId): Promise<ApplicationTree>`
  - [ ] `searchExplorer(connectionId, query): Promise<SearchResult[]>`
  - [ ] `syncConnection(connectionId): Promise<void>`
  - [ ] `fetchSyncStatus(connectionId): Promise<SyncStatus>`

---

### 5. State Management -- Zustand Stores (apps/web/src/stores/)

- [ ] `stores/connectionStore.ts`
  - [ ] State: connections[], selectedConnection, filters, pagination, isLoading, error
  - [ ] Actions: fetchConnections, fetchConnectionById, createConnection, updateConnection, deleteConnection, testConnection, setFilters, setPage
  - [ ] TanStack Query integration for cache and auto-refresh

- [ ] `stores/explorerStore.ts`
  - [ ] State: trees (by connectionId), selectedNode, searchResults, searchTerm, isSearching, syncStatus, offlineMode
  - [ ] Actions: fetchApplications, expandNode, collapseNode, selectNode, search, refreshTree, syncOfflineCache
  - [ ] LocalStorage persistence for offline cache (via Zustand persist middleware)

---

### 6. MCP Connector Integration (apps/api/src/integrations/)

- [ ] `integrations/mcp/mcp-client.ts`
  - [ ] `MCPClient` class: connect, disconnect, health, query
  - [ ] Connection pooling: reuse MCP sessions per tenant connection
  - [ ] Timeout: 30 seconds per query
  - [ ] Error mapping: MCP errors to application error codes
  - [ ] Retry: 1 retry on transient failures

- [ ] `integrations/mcp/mcp-apex-adapter.ts`
  - [ ] `listApplications(session, workspaceId): Promise<ApexApplication[]>`
  - [ ] `listPages(session, appId): Promise<ApexPage[]>`
  - [ ] `listComponents(session, pageId, type): Promise<ApexComponent[]>`
  - [ ] `searchObjects(session, term, objectTypes): Promise<SearchResult[]>`
  - [ ] Map MCP response format to application interfaces

- [ ] `integrations/mcp/ords-fallback.ts`
  - [ ] Same interface as mcp-apex-adapter but queries via ORDS REST SQL endpoint
  - [ ] SQL queries against APEX dictionary views (parameterized)
  - [ ] Used when MCP session fails or is unavailable

---

### 7. Explorer API Endpoints (apps/api/src/modules/explorer/)

- [ ] `src/modules/explorer/explorer.validation.ts`
  - [ ] `ListAppsParamsSchema` (Zod) -- connectionId UUID
  - [ ] `ListPagesParamsSchema` (Zod) -- connectionId UUID, appId positive integer
  - [ ] `ListComponentsParamsSchema` (Zod) -- connectionId UUID, pageId positive integer
  - [ ] `SearchQuerySchema` (Zod) -- connectionId UUID, term min 2 chars, objectTypes optional array, limit, offset

- [ ] `src/modules/explorer/explorer.service.ts`
  - [ ] `listApplications(connectionId, tenantId): Promise<ApexApplication[]>` -- check cache, fetch via MCP/ORDS, cache result
  - [ ] `listPages(connectionId, appId, tenantId): Promise<ApexPage[]>` -- check cache, fetch, cache
  - [ ] `listComponents(connectionId, pageId, tenantId): Promise<ApexComponent[]>` -- check cache, fetch, cache
  - [ ] `getApplicationTree(connectionId, appId, tenantId): Promise<ApplicationTree>` -- assemble full tree from cached/live data
  - [ ] `searchObjects(connectionId, query, tenantId): Promise<SearchResult[]>` -- short-TTL cache, server-side search
  - [ ] `syncConnection(connectionId, tenantId): Promise<void>` -- invalidate all caches for connection, re-fetch apps
  - [ ] `getSyncStatus(connectionId, tenantId): Promise<SyncStatus>` -- return last sync time and cached item count

- [ ] `src/modules/explorer/explorer.controller.ts`
  - [ ] `GET /api/v1/explorer/apps/:connectionId` -- authenticate(), validate params, call service
  - [ ] `GET /api/v1/explorer/pages/:connectionId/:appId` -- authenticate(), validate params, call service
  - [ ] `GET /api/v1/explorer/components/:connectionId/:pageId` -- authenticate(), validate params, call service
  - [ ] `GET /api/v1/explorer/tree/:connectionId/:appId` -- authenticate(), validate params, call service
  - [ ] `GET /api/v1/explorer/search` -- authenticate(), validate query, call service
  - [ ] `POST /api/v1/explorer/sync/:connectionId` -- authenticate(), validate params, call service
  - [ ] `GET /api/v1/explorer/sync-status/:connectionId` -- authenticate(), validate params, call service
  - [ ] Mount routes on Express Router

---

### 8. Redis Caching Layer (apps/api/src/modules/explorer/)

- [ ] `src/modules/explorer/explorer.cache.ts`
  - [ ] `ExplorerCacheService` class
  - [ ] `getApps(tenantId, connId): Promise<ApexApplication[] | null>` -- key: `explorer:{tenantId}:{connId}:apps`
  - [ ] `setApps(tenantId, connId, apps, ttl=3600): Promise<void>`
  - [ ] `getPages(tenantId, connId, appId): Promise<ApexPage[] | null>` -- key: `explorer:{tenantId}:{connId}:pages:{appId}`
  - [ ] `setPages(tenantId, connId, appId, pages, ttl=3600): Promise<void>`
  - [ ] `getComponents(tenantId, connId, pageId): Promise<ApexComponent[] | null>`
  - [ ] `setComponents(tenantId, connId, pageId, components, ttl=3600): Promise<void>`
  - [ ] `getSearchResults(tenantId, connId, queryHash): Promise<SearchResult[] | null>` -- TTL 5 min
  - [ ] `setSearchResults(tenantId, connId, queryHash, results, ttl=300): Promise<void>`
  - [ ] `invalidateConnection(tenantId, connId): Promise<void>` -- delete all keys for connection
  - [ ] `invalidatePage(tenantId, connId, pageId): Promise<void>` -- delete page components cache
  - [ ] `getCacheSize(tenantId): Promise<number>` -- estimate tenant cache size in bytes

---

### 9. Offline Mode with localStorage Cache (apps/web/src/features/explorer/)

- [ ] `lib/offlineCache.ts`
  - [ ] `saveTreeToLocal(tenantId, connectionId, appId, tree): void` -- persist to localStorage with size check
  - [ ] `loadTreeFromLocal(tenantId, connectionId, appId): ApplicationTree | null`
  - [ ] `clearLocalCache(tenantId, connectionId): void`
  - [ ] `getLocalCacheSize(tenantId, connectionId): number` -- bytes used
  - [ ] `isLocalCacheStale(tenantId, connectionId, maxAgeMs): boolean`
  - [ ] Max 5MB per connection (pruning LRU when exceeded)

- [ ] `hooks/useOfflineMode.ts`
  - [ ] Detect connection status from connectionStore
  - [ ] Switch explorerStore to offline mode when disconnected
  - [ ] Auto-sync when connection recovers
  - [ ] Return offlineMode flag, lastSyncAt, staleness level

---

### 10. Unit Tests

#### Frontend Tests (apps/web/src/__tests__/features/)

- [ ] `connections/ConnectionList.test.tsx`
  - [ ] Renders connection list with correct status badges
  - [ ] Filters by environment and status
  - [ ] Search filters list in real time
  - [ ] Pagination controls work
  - [ ] "New Connection" button visible for authorized roles
  - [ ] "New Connection" button hidden for auditor role

- [ ] `connections/ConnectionForm.test.tsx`
  - [ ] Form validates required fields
  - [ ] ORDS fields appear when type is ORDS
  - [ ] JDBC fields appear when type is JDBC
  - [ ] Test button triggers API call and shows result
  - [ ] Save disabled until test passes
  - [ ] Edit mode pre-fills existing values

- [ ] `connections/HealthBadge.test.tsx`
  - [ ] Renders correct color for each status
  - [ ] Tooltip shows latency and last checked
  - [ ] Sizes render correctly (sm, md, lg)

- [ ] `connections/DeleteConnectionModal.test.tsx`
  - [ ] Shows connection name and affected applications
  - [ ] Cancel closes modal without action
  - [ ] Delete calls API and closes modal

- [ ] `explorer/ApplicationExplorer.test.tsx`
  - [ ] Renders application tree for selected connection
  - [ ] Expanding node triggers lazy load
  - [ ] Selected node is highlighted
  - [ ] Offline banner shown when connection is disconnected
  - [ ] Sync indicator shows correct freshness state

- [ ] `explorer/ExplorerSearch.test.tsx`
  - [ ] Debounces search input (300ms)
  - [ ] Does not search with < 2 characters
  - [ ] Groups results by object type
  - [ ] Highlights matched substring
  - [ ] Clicking result selects node in tree

- [ ] `explorer/offlineCache.test.ts`
  - [ ] Saves and loads tree from localStorage
  - [ ] Respects 5MB size limit
  - [ ] Detects stale cache correctly
  - [ ] Clears cache for specific connection

#### Backend Tests (apps/api/tests/)

- [ ] `tests/modules/explorer/explorer.service.test.ts`
  - [ ] Lists applications (cache hit path)
  - [ ] Lists applications (cache miss, fetches from MCP, caches)
  - [ ] Lists pages for application
  - [ ] Lists components for page
  - [ ] Search returns grouped results
  - [ ] Sync invalidates cache and re-fetches
  - [ ] Falls back to ORDS when MCP unavailable

- [ ] `tests/modules/explorer/explorer.cache.test.ts`
  - [ ] Set and get apps cache
  - [ ] Set and get pages cache with TTL
  - [ ] Invalidate connection clears all related keys
  - [ ] Invalidate page clears only page components
  - [ ] Search cache has 5-minute TTL

- [ ] `tests/modules/explorer/explorer.controller.test.ts`
  - [ ] GET /explorer/apps/:connId returns 200 with apps list
  - [ ] GET /explorer/apps/:connId returns 401 without auth
  - [ ] GET /explorer/pages/:connId/:appId returns pages
  - [ ] GET /explorer/search returns grouped results
  - [ ] GET /explorer/search with 1-char term returns 400
  - [ ] POST /explorer/sync/:connId returns 200

- [ ] `tests/integrations/mcp/mcp-client.test.ts`
  - [ ] Connects to MCP endpoint successfully
  - [ ] Query returns mapped results
  - [ ] Timeout after 30 seconds
  - [ ] Retry on transient failure
  - [ ] Falls back to ORDS on MCP failure

---

## File Summary

| Category | File Count |
|----------|------------|
| Shared types | 1 |
| Connection UI components | 5 |
| Explorer components | 4 |
| API client services | 2 |
| Zustand stores | 2 |
| MCP integration (backend) | 3 |
| Explorer backend (validation, service, controller) | 3 |
| Redis cache layer | 1 |
| Offline mode (frontend) | 2 |
| Frontend tests | 8 |
| Backend tests | 4 |
| **Total** | **35** |

---

## Execution Order

1. Shared types (explorer.ts) -- interfaces used by frontend and backend
2. MCP integration (mcp-client, mcp-apex-adapter, ords-fallback) -- prerequisite for explorer service
3. Redis cache layer (explorer.cache.ts) -- prerequisite for explorer service
4. Explorer backend (validation -> service -> controller) -- depends on MCP + cache
5. API client services (connections.api.ts, explorer.api.ts) -- depends on backend endpoints
6. Zustand stores (connectionStore, explorerStore) -- depends on API services
7. Connection UI components (HealthBadge -> ConnectionList -> ConnectionDetail -> ConnectionForm -> DeleteModal)
8. Explorer components (TreeNode -> ApplicationExplorer -> ExplorerSearch -> ComponentDetailPanel)
9. Offline mode (offlineCache, useOfflineMode) -- depends on explorer store
10. Frontend tests (parallel per component)
11. Backend tests (parallel per module)

---

## Approval

**Please review this code generation plan.**

**Options**:
1. **Request Changes** -- Modify the plan before execution
2. **Approve Plan** -- Proceed to Part 2 (Code Generation execution)
