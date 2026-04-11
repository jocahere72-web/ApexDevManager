# Code Generation Plan -- U7: Change Tracking & Schema

## Document Information

| Field | Value |
|-------|-------|
| **Unit** | U7 -- Change Tracking and Schema |
| **Sprint** | S6 (Fase 2) |
| **Modules** | M6 (Change Manager), M7 (Schema Inspector) |
| **Stories** | US-018, US-019, US-020, US-021, US-051 |
| **Status** | AI-DLC Generated -- For Review |
| **Date** | 2026-04-10 |

---

## Prerequisites

Before starting code generation, verify prior unit deliverables:
- [ ] U2 Auth module is operational (JWT, RBAC middleware)
- [ ] Connection Manager (M1) provides active ORDS connections
- [ ] MCP Connector (C22) can query APEX dictionary views and Oracle metadata views
- [ ] U5 AI Engine is operational (for Claude auto-documentation)
- [ ] Full-text search (pg_tsvector) is available in PostgreSQL

---

## Plan Checklist

### 1. Database Migrations

- [ ] `migrations/021_change_log.sql`
  - [ ] Create `change_log` table (id, tenant_id, connection_id, app_id, component_type, component_id, component_name, operation, code_before, code_after, summary, risk_level, source, rollback_of, release_id, user_id, metadata, created_at)
  - [ ] Add CHECK constraint for `operation IN ('create', 'update', 'delete', 'rollback')`
  - [ ] Add CHECK constraint for `risk_level IN ('BAJO', 'MEDIO', 'ALTO', 'CRITICO')`
  - [ ] Add CHECK constraint for `source IN ('manual', 'ai_generated', 'import', 'rollback')`
  - [ ] Create index `idx_change_log_tenant` ON (tenant_id)
  - [ ] Create index `idx_change_log_tenant_connection` ON (tenant_id, connection_id, created_at DESC)
  - [ ] Create index `idx_change_log_user` ON (user_id, created_at DESC)
  - [ ] Create index `idx_change_log_component` ON (component_type, component_id)
  - [ ] Create index `idx_change_log_release` ON (release_id) WHERE release_id IS NOT NULL
  - [ ] Create index `idx_change_log_operation` ON (tenant_id, operation)
  - [ ] Create GIN index `idx_change_log_search` ON (to_tsvector('english', component_name || ' ' || COALESCE(summary, '')))
  - [ ] Enable RLS on `change_log`
  - [ ] Create `change_log_tenant_isolation` policy

- [ ] `migrations/022_schema_cache.sql`
  - [ ] Create `schema_cache` table (id, tenant_id, connection_id, schema_name, cache_type, cache_data, refreshed_at, expires_at)
  - [ ] Create UNIQUE index on (connection_id, schema_name, cache_type)
  - [ ] Create index on (expires_at) for cache cleanup
  - [ ] Enable RLS on `schema_cache`
  - [ ] Create `schema_cache_tenant_isolation` policy

- [ ] `migrations/023_schema_documentation.sql`
  - [ ] Create `schema_documentation` table (id, tenant_id, connection_id, schema_name, table_name, documentation, generated_by, version, created_at, updated_at)
  - [ ] Create UNIQUE index on (connection_id, schema_name, table_name)
  - [ ] Enable RLS on `schema_documentation`
  - [ ] Create `schema_documentation_tenant_isolation` policy

---

### 2. Shared Types (packages/shared-types)

- [ ] `packages/shared-types/src/changes.ts`
  - [ ] `ChangeOperation` union type ('create' | 'update' | 'delete' | 'rollback')
  - [ ] `ChangeSource` union type ('manual' | 'ai_generated' | 'import' | 'rollback')
  - [ ] `RiskLevel` union type ('BAJO' | 'MEDIO' | 'ALTO' | 'CRITICO')
  - [ ] `ChangeRecord` interface
  - [ ] `UnifiedDiff` interface (hunks, stats)
  - [ ] `DiffHunk` interface
  - [ ] `RollbackResult` interface
  - [ ] `ChangeReport` interface
  - [ ] `ChangeFilter` interface
  - [ ] `ChangeExportFormat` union type ('csv' | 'json')

- [ ] `packages/shared-types/src/schema.ts`
  - [ ] `SchemaTable` interface (name, owner, row_count, tablespace)
  - [ ] `SchemaColumn` interface (name, data_type, nullable, default, comment)
  - [ ] `SchemaConstraint` interface (name, type, columns, referenced_table)
  - [ ] `SchemaForeignKey` interface (name, source_columns, target_table, target_columns)
  - [ ] `SchemaIndex` interface (name, columns, unique)
  - [ ] `TableDocumentation` interface
  - [ ] `TableUsage` interface (page_id, page_name, usage_type)
  - [ ] `ERDiagramRequest` interface
  - [ ] `SchemaSearchResult` interface

---

### 3. M6 Change Manager Module (apps/api/src/modules/changes/)

- [ ] `src/modules/changes/changes.validation.ts`
  - [ ] `RecordChangeSchema` (Zod) -- componentType, componentId, componentName, appId, connectionId, operation, codeBefore?, codeAfter, source, metadata?
  - [ ] `ListChangesQuerySchema` (Zod) -- page, limit, connectionId?, userId?, fromDate?, toDate?, operation?, componentType?, riskLevel?, releaseId?, search?
  - [ ] `RollbackSchema` (Zod) -- changeId
  - [ ] `ExportChangesSchema` (Zod) -- format ('csv'|'json'), fromDate, toDate (max 90 days), connectionId?, userId?

- [ ] `src/modules/changes/diff.service.ts`
  - [ ] `generateDiff(before: string, after: string): UnifiedDiff` -- compute unified diff with hunks
  - [ ] `getDiffStats(diff: UnifiedDiff): DiffStats` -- additions, deletions, modifications
  - [ ] `formatSideBySide(diff: UnifiedDiff): SideBySideDiff` -- convert to side-by-side format
  - [ ] Uses `diff` npm library

- [ ] `src/modules/changes/changes.service.ts`
  - [ ] `recordChange(data: RecordChangeInput, userId: string): Promise<ChangeRecord>` -- insert change_log row, generate summary via Claude, classify risk
  - [ ] `getChange(changeId: string): Promise<ChangeRecord>` -- single change with diff
  - [ ] `listChanges(query: ListChangesQuery): Promise<PaginatedResult<ChangeRecord>>` -- paginated, filtered, full-text search
  - [ ] `getDiff(changeId: string): Promise<UnifiedDiff>` -- compute diff from code_before/code_after
  - [ ] `rollback(changeId: string, userId: string): Promise<RollbackResult>` -- fetch code_before, apply via MCP, record rollback change
  - [ ] `exportChanges(query: ExportQuery): Promise<Buffer>` -- generate CSV or JSON export
  - [ ] `getChangeReport(filters: ReportFilter): Promise<ChangeReport>` -- aggregated stats
  - [ ] `linkToRelease(changeIds: string[], releaseId: string): Promise<void>` -- set release_id on changes
  - [ ] Conflict detection: warn if component modified after target change

- [ ] `src/modules/changes/changes.controller.ts`
  - [ ] `POST /api/v1/changes` -- record a change (internal, called by other modules)
  - [ ] `GET /api/v1/changes` -- list changes (paginated, filtered)
  - [ ] `GET /api/v1/changes/:id` -- get single change with diff
  - [ ] `GET /api/v1/changes/:id/diff` -- get diff only
  - [ ] `POST /api/v1/changes/:id/rollback` -- rollback to code_before
  - [ ] `POST /api/v1/changes/export` -- export CSV or JSON
  - [ ] `GET /api/v1/changes/report` -- aggregated report
  - [ ] `POST /api/v1/changes/link-release` -- link changes to release
  - [ ] Wire routes with authenticate() + authorize (varies by endpoint)

---

### 4. M7 Schema Inspector Module (apps/api/src/modules/schema/)

- [ ] `src/modules/schema/schema.validation.ts`
  - [ ] `ListTablesSchema` (Zod) -- connectionId, schemaName?, search?
  - [ ] `GetTableDetailsSchema` (Zod) -- connectionId, schemaName, tableName
  - [ ] `GenerateERDSchema` (Zod) -- connectionId, schemaName, tableNames (1-20 array)
  - [ ] `DocumentTableSchema` (Zod) -- connectionId, schemaName, tableName
  - [ ] `UpdateDocumentationSchema` (Zod) -- documentation text
  - [ ] `TableUsageSchema` (Zod) -- connectionId, tableName

- [ ] `src/modules/schema/schema-query.service.ts`
  - [ ] `listTables(connectionId: string, schemaName?: string, search?: string): Promise<SchemaTable[]>` -- query ALL_TABLES via MCP
  - [ ] `getTableColumns(connectionId: string, schemaName: string, tableName: string): Promise<SchemaColumn[]>` -- query ALL_TAB_COLUMNS
  - [ ] `getTableConstraints(connectionId: string, schemaName: string, tableName: string): Promise<SchemaConstraint[]>` -- query ALL_CONSTRAINTS
  - [ ] `getForeignKeys(connectionId: string, schemaName: string, tableName: string): Promise<SchemaForeignKey[]>` -- query ALL_CONSTRAINTS + ALL_CONS_COLUMNS
  - [ ] `getTableIndexes(connectionId: string, schemaName: string, tableName: string): Promise<SchemaIndex[]>` -- query ALL_INDEXES + ALL_IND_COLUMNS
  - [ ] `getTableTriggers(connectionId: string, schemaName: string, tableName: string): Promise<SchemaTrigger[]>` -- query ALL_TRIGGERS
  - [ ] `searchSchema(connectionId: string, search: string): Promise<SchemaSearchResult[]>` -- search table names, column names, comments

- [ ] `src/modules/schema/schema-cache.service.ts`
  - [ ] `getCachedMetadata(connectionId: string, schemaName: string, cacheType: string): Promise<JSONB | null>` -- check schema_cache
  - [ ] `setCachedMetadata(connectionId: string, schemaName: string, cacheType: string, data: JSONB, ttlHours: number): Promise<void>` -- upsert cache
  - [ ] `invalidateCache(connectionId: string, schemaName?: string): Promise<void>` -- clear cache entries
  - [ ] `cleanupExpiredCache(): Promise<number>` -- scheduled cleanup job

- [ ] `src/modules/schema/schema-diagram.service.ts`
  - [ ] `generateERDiagram(connectionId: string, schemaName: string, tableNames: string[]): Promise<string>` -- build Mermaid ER diagram from FK relationships
  - [ ] `autoIncludeReferencedTables(tableNames: string[], fks: SchemaForeignKey[]): string[]` -- add FK-referenced tables
  - [ ] Enforce max 20 tables per diagram

- [ ] `src/modules/schema/schema-doc.service.ts`
  - [ ] `generateDocumentation(connectionId: string, schemaName: string, tableName: string): Promise<string>` -- fetch metadata + sample data, send to Claude, generate doc
  - [ ] `getDocumentation(connectionId: string, schemaName: string, tableName: string): Promise<TableDocumentation | null>` -- retrieve from schema_documentation
  - [ ] `updateDocumentation(connectionId: string, schemaName: string, tableName: string, content: string): Promise<void>` -- user edit
  - [ ] `maskSensitiveColumns(sampleData: Record<string, unknown>[], columns: SchemaColumn[]): Record<string, unknown>[]` -- mask password/SSN/credit card/token columns
  - [ ] Cache generated docs for 24 hours

- [ ] `src/modules/schema/schema-usage.service.ts`
  - [ ] `getTableUsageInAPEX(connectionId: string, tableName: string): Promise<TableUsage[]>` -- query APEX dictionary views for table references
  - [ ] Query sources: APEX_APPLICATION_PAGE_REGIONS, APEX_APPLICATION_LOVS, APEX_APPLICATION_PAGE_PROC, APEX_APPLICATION_PAGE_DA_ACTS
  - [ ] Regex-based matching for table name in SQL source text

- [ ] `src/modules/schema/schema.controller.ts`
  - [ ] `GET /api/v1/schema/tables` -- list tables (with search)
  - [ ] `GET /api/v1/schema/tables/:tableName` -- table details (columns, constraints, FKs, indexes)
  - [ ] `GET /api/v1/schema/tables/:tableName/usage` -- APEX page usage
  - [ ] `POST /api/v1/schema/erd` -- generate ER diagram
  - [ ] `POST /api/v1/schema/tables/:tableName/document` -- generate AI documentation
  - [ ] `GET /api/v1/schema/tables/:tableName/documentation` -- get stored documentation
  - [ ] `PUT /api/v1/schema/tables/:tableName/documentation` -- update documentation
  - [ ] `POST /api/v1/schema/search` -- schema-wide search
  - [ ] `POST /api/v1/schema/refresh` -- refresh cache for connection
  - [ ] Wire routes with authenticate() + authorize(['admin','developer','tech_lead','qa_analyst'])

---

### 5. React UI Components (apps/web/src/)

- [ ] `src/features/changes/pages/ChangeLogPage.tsx`
  - [ ] Data table with change records
  - [ ] Multi-filter bar (connection, developer, date, operation, risk, release, search)
  - [ ] Sort by date (default DESC)
  - [ ] Export button (CSV/JSON)

- [ ] `src/features/changes/components/DiffViewer.tsx`
  - [ ] Unified diff view with syntax highlighting (PL/SQL)
  - [ ] Side-by-side toggle
  - [ ] Line numbers (old/new)
  - [ ] Hunk headers
  - [ ] Addition/deletion stats badge

- [ ] `src/features/changes/components/RollbackDialog.tsx`
  - [ ] Confirmation modal
  - [ ] Show target code_before preview
  - [ ] Conflict warning if component modified since target change
  - [ ] Rollback result display

- [ ] `src/features/changes/components/ChangeDetailPanel.tsx`
  - [ ] Change metadata display (user, timestamp, operation, risk, source)
  - [ ] Diff viewer integration
  - [ ] Rollback button
  - [ ] Link to release (if linked)

- [ ] `src/features/changes/hooks/useChanges.ts`
  - [ ] React Query hooks for list, get, rollback, export
  - [ ] Filter state management

- [ ] `src/features/schema/pages/SchemaInspectorPage.tsx`
  - [ ] Connection selector
  - [ ] Table list with search
  - [ ] Table detail panel (columns, constraints, FKs, indexes)

- [ ] `src/features/schema/components/TableDetailView.tsx`
  - [ ] Tab layout: Columns | Constraints | Foreign Keys | Indexes | Triggers | Documentation | APEX Usage
  - [ ] Column table with type, nullable, default, comment
  - [ ] Constraint/FK/Index tables

- [ ] `src/features/schema/components/ERDiagramViewer.tsx`
  - [ ] Table multi-select for diagram scope
  - [ ] Mermaid diagram renderer
  - [ ] Export PNG/SVG buttons
  - [ ] Auto-include referenced tables toggle

- [ ] `src/features/schema/components/TableDocumentation.tsx`
  - [ ] AI-generated documentation display
  - [ ] Generate / Regenerate button
  - [ ] Edit mode with Markdown editor
  - [ ] Version history

- [ ] `src/features/schema/components/TableUsageView.tsx`
  - [ ] List of APEX pages referencing the table
  - [ ] Usage type badge (report source, form source, LOV, process, DA)
  - [ ] Link to page in Application Explorer

- [ ] `src/features/schema/hooks/useSchema.ts`
  - [ ] React Query hooks for tables, table details, diagram, documentation, usage
  - [ ] Cache management hooks

---

### 6. Unit Tests (apps/api/tests/)

- [ ] `tests/modules/changes/diff.service.test.ts`
  - [ ] Generate unified diff for code changes
  - [ ] Diff stats (additions, deletions, modifications)
  - [ ] Side-by-side conversion
  - [ ] Empty before content (create operation)
  - [ ] Identical content produces empty diff

- [ ] `tests/modules/changes/changes.service.test.ts`
  - [ ] Record change creates change_log entry
  - [ ] List changes with pagination
  - [ ] Filter by connection, user, date, operation, risk
  - [ ] Full-text search on component name
  - [ ] Rollback fetches code_before and applies via MCP
  - [ ] Rollback creates new change record with source='rollback'
  - [ ] Rollback conflict detection
  - [ ] Export CSV format
  - [ ] Export JSON format
  - [ ] Export rejects date range > 90 days
  - [ ] Link changes to release

- [ ] `tests/modules/changes/changes.controller.test.ts`
  - [ ] GET /changes as developer -> 200 (paginated)
  - [ ] GET /changes/:id -> 200
  - [ ] GET /changes/:id/diff -> 200
  - [ ] POST /changes/:id/rollback as developer -> 200
  - [ ] POST /changes/export as admin -> 200
  - [ ] POST /changes/export date range > 90 days -> 400

- [ ] `tests/modules/schema/schema-query.service.test.ts`
  - [ ] List tables from schema
  - [ ] Get table columns
  - [ ] Get table constraints
  - [ ] Get foreign keys with referenced tables
  - [ ] Search tables by name
  - [ ] Search by column name
  - [ ] Search results < 2s (mocked)

- [ ] `tests/modules/schema/schema-cache.service.test.ts`
  - [ ] Set and retrieve cached metadata
  - [ ] Cache miss returns null
  - [ ] Invalidate cache clears entries
  - [ ] Expired cache not returned

- [ ] `tests/modules/schema/schema-diagram.service.test.ts`
  - [ ] Generate Mermaid ER for 3 related tables
  - [ ] Auto-include FK-referenced tables
  - [ ] Reject > 20 tables
  - [ ] Correct Mermaid syntax in output

- [ ] `tests/modules/schema/schema-doc.service.test.ts`
  - [ ] Generate documentation via Claude
  - [ ] Mask sensitive columns in sample data
  - [ ] Store documentation in schema_documentation
  - [ ] User update overwrites AI doc
  - [ ] Cache for 24 hours

- [ ] `tests/modules/schema/schema-usage.service.test.ts`
  - [ ] Detect table usage in report regions
  - [ ] Detect table usage in form regions
  - [ ] Detect table usage in LOVs
  - [ ] Detect table usage in processes
  - [ ] Regex matches table in complex SQL

- [ ] `tests/modules/schema/schema.controller.test.ts`
  - [ ] GET /schema/tables as developer -> 200
  - [ ] GET /schema/tables/:name -> 200
  - [ ] POST /schema/erd with valid tables -> 200
  - [ ] POST /schema/erd with > 20 tables -> 400
  - [ ] POST /schema/tables/:name/document -> 200
  - [ ] GET /schema/tables/:name/usage -> 200

---

### 7. Integration Tests

- [ ] `tests/integration/change-tracking.integration.test.ts`
  - [ ] Record change, view diff, rollback, verify new change created
  - [ ] Filter changes by connection and date range
  - [ ] Export changes as CSV and JSON
  - [ ] Full-text search on component name
  - [ ] Rollback conflict detection (component modified after target)

- [ ] `tests/integration/schema-inspector.integration.test.ts`
  - [ ] Browse tables, view columns and constraints
  - [ ] Generate ER diagram for related tables
  - [ ] Generate AI documentation for table
  - [ ] Search schema by column name
  - [ ] Get table usage in APEX pages
  - [ ] Cache hit on second request

---

## File Summary

| Category | File Count |
|----------|------------|
| Database migrations | 3 |
| Shared types | 2 |
| Change Manager module | 4 |
| Schema Inspector module | 6 |
| React UI components | 11 |
| Unit tests | 9 |
| Integration tests | 2 |
| **Total** | **37** |

---

## Execution Order

The plan should be executed in the following order to respect dependencies:

1. Database migrations (021-023) -- schema must exist before service code
2. Shared types -- interfaces used by both modules
3. Diff service -- standalone utility, no dependencies
4. Change Manager services (diff.service -> changes.service -> changes.controller)
5. Schema Inspector services (schema-query -> schema-cache -> schema-diagram + schema-doc + schema-usage -> schema.controller)
6. React UI components (Change Log pages, then Schema Inspector pages)
7. Unit tests (parallel per module)
8. Integration tests (sequential, requires running DB + MCP + AI service)
