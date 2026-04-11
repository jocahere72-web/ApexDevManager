# Code Generation Plan -- U9: Analysis & Documentation

## Document Information

| Field | Value |
|-------|-------|
| **Unit** | U9 -- Analysis and Documentation |
| **Sprint** | S8 (Fase 2) |
| **Modules** | M11 (Dependency & Impact Analyzer), M12 (Auto Documentation Studio) |
| **Stories** | US-027, US-028, US-029, US-030, US-053, US-054 |
| **Status** | AI-DLC Generated -- For Review |
| **Date** | 2026-04-10 |

---

## Prerequisites

Before starting code generation, verify prior unit deliverables:
- [ ] U2 Auth module is operational (JWT, RBAC middleware)
- [ ] U5 AI Engine is operational (Claude orchestration)
- [ ] U7 Change Manager is operational (change_log table, events)
- [ ] MCP Connector (C22) can query APEX dictionary views
- [ ] Bull queue infrastructure is available (from U5)
- [ ] Event bus (C25) is operational for change_approved events

---

## Plan Checklist

### 1. Database Migrations

- [ ] `migrations/031_dependency_nodes.sql`
  - [ ] Create `dependency_nodes` table (id, tenant_id, connection_id, app_id, component_type, component_id, component_name, metadata, last_synced_at, created_at)
  - [ ] Create UNIQUE index on (connection_id, app_id, component_type, component_id)
  - [ ] Create indexes on (tenant_id), (connection_id, app_id), (connection_id, component_type)
  - [ ] Enable RLS on `dependency_nodes`
  - [ ] Create `dependency_nodes_tenant_isolation` policy

- [ ] `migrations/032_dependency_edges.sql`
  - [ ] Create `dependency_edges` table (id, tenant_id, connection_id, source_node_id, target_node_id, dependency_type, weight, detection_method, metadata, last_synced_at, created_at)
  - [ ] Add CHECK constraint for `dependency_type IN ('calls', 'references', 'uses_data', 'triggers', 'authorizes')`
  - [ ] Create UNIQUE index on (source_node_id, target_node_id, dependency_type)
  - [ ] Create indexes on (tenant_id), (source_node_id), (target_node_id), (connection_id)
  - [ ] Enable RLS on `dependency_edges`
  - [ ] Create `dependency_edges_tenant_isolation` policy

- [ ] `migrations/033_dependency_sync_status.sql`
  - [ ] Create `dependency_sync_status` table (id, tenant_id, connection_id, app_id, status, total_nodes, total_edges, nodes_added, nodes_removed, edges_added, edges_removed, duration_ms, error_message, started_at, completed_at)
  - [ ] Add CHECK constraint for `status IN ('running', 'completed', 'failed')`
  - [ ] Create indexes on (connection_id, started_at DESC) and (tenant_id)
  - [ ] Enable RLS on `dependency_sync_status`
  - [ ] Create `dependency_sync_status_tenant_isolation` policy

- [ ] `migrations/034_component_documentation.sql`
  - [ ] Create `component_documentation` table (id, tenant_id, connection_id, app_id, component_type, component_id, component_name, doc_type, content, mermaid_code, version, is_current, generated_by, change_id, created_at, updated_at)
  - [ ] Add CHECK constraint for `doc_type IN ('technical', 'functional', 'release_notes', 'module_manual', 'diagram')`
  - [ ] Create index on (connection_id, component_type, component_id, doc_type) WHERE is_current = TRUE
  - [ ] Create indexes on (tenant_id) and (change_id)
  - [ ] Enable RLS on `component_documentation`
  - [ ] Create `component_documentation_tenant_isolation` policy

---

### 2. Shared Types (packages/shared-types)

- [ ] `packages/shared-types/src/dependencies.ts`
  - [ ] `DependencyType` union type ('calls' | 'references' | 'uses_data' | 'triggers' | 'authorizes')
  - [ ] `DependencyNode` interface
  - [ ] `DependencyEdge` interface
  - [ ] `DependencyGraph` interface (nodes, edges, rootId, depth)
  - [ ] `ImpactReport` interface
  - [ ] `AffectedComponent` interface
  - [ ] `RegressionPlan` interface
  - [ ] `SyncStatus` interface

- [ ] `packages/shared-types/src/documentation.ts`
  - [ ] `DocType` union type ('technical' | 'functional' | 'release_notes' | 'module_manual' | 'diagram')
  - [ ] `ComponentDocumentation` interface
  - [ ] `DocumentationVersion` interface
  - [ ] `DiagramRequest` interface
  - [ ] `MermaidDiagram` interface
  - [ ] `DocExportFormat` union type ('markdown' | 'docx')
  - [ ] `DocumentationBundle` interface

---

### 3. M11 Impact Analyzer Module (apps/api/src/modules/impact/)

- [ ] `src/modules/impact/impact.validation.ts`
  - [ ] `AnalyzeImpactSchema` (Zod) -- connectionId, appId, componentType, componentId, changeType ('modify'|'delete'|'rename')
  - [ ] `GetGraphSchema` (Zod) -- connectionId, appId, componentType?, componentId?, depth? (max 10)
  - [ ] `SyncGraphSchema` (Zod) -- connectionId, appId
  - [ ] `RegressionPlanSchema` (Zod) -- connectionId, appId, componentType, componentId

- [ ] `src/modules/impact/graph-builder.service.ts`
  - [ ] `buildGraph(connectionId: string, appId: number): Promise<GraphBuildResult>` -- query all APEX dictionary views, parse SQL, create nodes and edges
  - [ ] `parsePageDependencies(pages: APEXPage[], regions: APEXRegion[]): DependencyEdge[]` -- extract table refs, auth refs from pages
  - [ ] `parseProcessDependencies(processes: APEXProcess[]): DependencyEdge[]` -- extract package calls from SQL
  - [ ] `parseDynamicActionDependencies(das: APEXDA[]): DependencyEdge[]` -- extract item refs from DA when/affected
  - [ ] `parsePackageDependencies(packages: OraclePackage[]): DependencyEdge[]` -- extract cross-package calls from ALL_DEPENDENCIES + ALL_SOURCE
  - [ ] `parseLOVDependencies(lovs: APEXLOV[]): DependencyEdge[]` -- extract table refs from LOV SQL
  - [ ] `parseAuthDependencies(pages: APEXPage[]): DependencyEdge[]` -- extract auth scheme refs
  - [ ] Regex-based SQL parsing for table and package references

- [ ] `src/modules/impact/graph-sync.service.ts`
  - [ ] `syncGraph(connectionId: string, appId: number): Promise<SyncResult>` -- full or incremental graph sync
  - [ ] `incrementalSync(connectionId: string, appId: number, since: Date): Promise<SyncResult>` -- only re-parse changed components
  - [ ] `scheduleHourlySync(connectionId: string, appId: number): void` -- register Bull repeatable job (every 60 min)
  - [ ] `cancelSync(connectionId: string, appId: number): void` -- cancel scheduled sync
  - [ ] `getSyncHistory(connectionId: string, appId: number): Promise<SyncStatus[]>` -- past sync results
  - [ ] Record sync status in dependency_sync_status table

- [ ] `src/modules/impact/impact-analysis.service.ts`
  - [ ] `analyzeImpact(connectionId: string, appId: number, componentType: string, componentId: number, changeType: string): Promise<ImpactReport>` -- traverse graph, find affected components (must complete in <3s)
  - [ ] `getAffectedComponents(nodeId: string, depth: number): Promise<AffectedComponent[]>` -- BFS/DFS traversal of dependency graph
  - [ ] `calculateImpactRadius(affectedComponents: AffectedComponent[]): number` -- count unique affected components
  - [ ] `classifyImpactRisk(radius: number, componentTypes: string[]): RiskLevel` -- escalate if radius > 10
  - [ ] `blockWithoutReview(changeId: string, impactReport: ImpactReport): Promise<boolean>` -- enforce ALTO/CRITICO review requirement

- [ ] `src/modules/impact/regression-planner.service.ts`
  - [ ] `generateRegressionPlan(connectionId: string, appId: number, componentType: string, componentId: number): Promise<RegressionPlan>` -- send affected components to Claude, generate test plan
  - [ ] `linkExistingTests(affectedComponents: AffectedComponent[]): TestSuiteLink[]` -- find existing test suites for affected components
  - [ ] `prioritizeTests(plan: RegressionPlan): RegressionPlan` -- direct deps = HIGH, transitive = MEDIUM/LOW

- [ ] `src/modules/impact/impact.controller.ts`
  - [ ] `POST /api/v1/impact/analyze` -- analyze impact of proposed change
  - [ ] `GET /api/v1/impact/graph` -- get dependency graph (with optional filters)
  - [ ] `GET /api/v1/impact/graph/:nodeId` -- get subgraph for specific component
  - [ ] `POST /api/v1/impact/sync` -- trigger manual graph sync
  - [ ] `GET /api/v1/impact/sync/status` -- get sync status and history
  - [ ] `POST /api/v1/impact/regression-plan` -- generate regression test plan
  - [ ] Wire routes with authenticate() + authorize(['admin','developer','tech_lead','qa_analyst'])

---

### 4. M12 Auto Documentation Module (apps/api/src/modules/documentation/)

- [ ] `src/modules/documentation/documentation.validation.ts`
  - [ ] `GenerateDocSchema` (Zod) -- connectionId, appId, componentType, componentId, docType ('technical'|'functional')
  - [ ] `GenerateModuleManualSchema` (Zod) -- connectionId, appId
  - [ ] `GenerateDiagramSchema` (Zod) -- connectionId, appId, diagramType ('erd'|'flow'|'sequence'|'component'|'state'), scopeType, scopeId, direction?
  - [ ] `UpdateDocSchema` (Zod) -- content (Markdown)
  - [ ] `ExportDocSchema` (Zod) -- format ('markdown'|'docx'), connectionId, appId, componentType?, componentId?
  - [ ] `ListDocsQuerySchema` (Zod) -- page, limit, connectionId, appId?, componentType?, docType?

- [ ] `src/modules/documentation/doc-generator.service.ts`
  - [ ] `generateTechnicalDoc(connectionId: string, appId: number, componentType: string, componentId: number): Promise<ComponentDocumentation>` -- fetch PL/SQL source via MCP, send to Claude, generate technical doc
  - [ ] `generateFunctionalDoc(connectionId: string, appId: number, pageId: number): Promise<ComponentDocumentation>` -- fetch page metadata via MCP, send to Claude, generate functional doc
  - [ ] `generateModuleManual(connectionId: string, appId: number): Promise<DocumentationBundle>` -- generate comprehensive module documentation
  - [ ] `regenerateDoc(docId: string): Promise<ComponentDocumentation>` -- regenerate existing doc (create new version)
  - [ ] Store results in component_documentation with version tracking

- [ ] `src/modules/documentation/diagram-generator.service.ts`
  - [ ] `generateERD(connectionId: string, appId: number, tableNames?: string[]): Promise<MermaidDiagram>` -- build Mermaid ER diagram
  - [ ] `generateFlowDiagram(connectionId: string, appId: number, processId: number): Promise<MermaidDiagram>` -- process flow diagram
  - [ ] `generateSequenceDiagram(connectionId: string, appId: number, pageId: number): Promise<MermaidDiagram>` -- page interaction sequence
  - [ ] `generateComponentDiagram(connectionId: string, appId: number): Promise<MermaidDiagram>` -- app-level component dependencies
  - [ ] `generateStateDiagram(connectionId: string, appId: number, entityName: string): Promise<MermaidDiagram>` -- workflow state machine
  - [ ] Validate Mermaid syntax before storing
  - [ ] Enforce 50-node complexity limit

- [ ] `src/modules/documentation/auto-doc.service.ts`
  - [ ] `handleChangeApproved(event: ChangeApprovedEvent): Promise<void>` -- event handler for change_approved events
  - [ ] `shouldAutoDocument(change: ChangeRecord): boolean` -- skip trivial changes (< 5 lines diff)
  - [ ] `queueAutoDoc(change: ChangeRecord): Promise<void>` -- add to Bull queue
  - [ ] `processAutoDocJob(job: Job): Promise<void>` -- generate doc for changed component
  - [ ] Rate limiting: max 10 auto-docs per minute per tenant

- [ ] `src/modules/documentation/doc-version.service.ts`
  - [ ] `getVersionHistory(docId: string): Promise<DocumentationVersion[]>` -- list all versions
  - [ ] `getVersion(docId: string, version: number): Promise<ComponentDocumentation>` -- get specific version
  - [ ] `restoreVersion(docId: string, version: number, userId: string): Promise<ComponentDocumentation>` -- restore previous version (creates new version)
  - [ ] `diffVersions(docId: string, versionA: number, versionB: number): Promise<string>` -- diff between versions

- [ ] `src/modules/documentation/doc-export.service.ts`
  - [ ] `exportToMarkdown(docs: ComponentDocumentation[]): Promise<Buffer>` -- bundle docs as Markdown ZIP
  - [ ] `exportToDocx(docs: ComponentDocumentation[], template?: Buffer): Promise<Buffer>` -- generate .docx with embedded diagrams
  - [ ] `renderMermaidToPNG(mermaidCode: string): Promise<Buffer>` -- render Mermaid to PNG for .docx embedding
  - [ ] Auto-generate table of contents
  - [ ] Apply template branding if provided

- [ ] `src/modules/documentation/documentation.controller.ts`
  - [ ] `POST /api/v1/docs/generate` -- generate technical or functional doc
  - [ ] `POST /api/v1/docs/module-manual` -- generate module manual
  - [ ] `POST /api/v1/docs/diagram` -- generate Mermaid diagram
  - [ ] `GET /api/v1/docs` -- list documentation (paginated, filtered)
  - [ ] `GET /api/v1/docs/:id` -- get specific documentation
  - [ ] `PUT /api/v1/docs/:id` -- update documentation content
  - [ ] `GET /api/v1/docs/:id/versions` -- get version history
  - [ ] `GET /api/v1/docs/:id/versions/:version` -- get specific version
  - [ ] `POST /api/v1/docs/:id/versions/:version/restore` -- restore version
  - [ ] `POST /api/v1/docs/export` -- export documentation to markdown or .docx
  - [ ] Wire routes with authenticate() + authorize(['admin','developer','tech_lead','qa_analyst'])

---

### 5. React UI Components (apps/web/src/)

- [ ] `src/features/impact/pages/ImpactAnalyzerPage.tsx`
  - [ ] Connection + app selector
  - [ ] Component selector (type + ID or search)
  - [ ] Change type selector (modify/delete/rename)
  - [ ] Analyze button
  - [ ] Impact report display

- [ ] `src/features/impact/components/DependencyGraphViewer.tsx`
  - [ ] Interactive graph visualization (D3.js or react-force-graph)
  - [ ] Node coloring by component type
  - [ ] Edge labels for dependency type
  - [ ] Zoom, pan, and click-to-expand
  - [ ] Depth slider (1-10)

- [ ] `src/features/impact/components/ImpactReportPanel.tsx`
  - [ ] Impact radius summary
  - [ ] Risk level badge
  - [ ] Affected components table (name, type, impact type, risk)
  - [ ] Breaking changes list
  - [ ] Regression plan summary

- [ ] `src/features/impact/components/SyncStatusPanel.tsx`
  - [ ] Last sync time and duration
  - [ ] Node/edge counts
  - [ ] Manual sync button
  - [ ] Sync history list

- [ ] `src/features/impact/hooks/useImpact.ts`
  - [ ] React Query hooks for analyze, graph, sync, regression plan

- [ ] `src/features/documentation/pages/DocumentationStudioPage.tsx`
  - [ ] Connection + app selector
  - [ ] Doc type selector
  - [ ] Component browser (tree or list)
  - [ ] Generate / View documentation

- [ ] `src/features/documentation/components/DocViewer.tsx`
  - [ ] Markdown renderer with syntax highlighting
  - [ ] Edit mode toggle (Markdown editor)
  - [ ] Version selector dropdown
  - [ ] Regenerate button
  - [ ] Export button (Markdown / .docx)

- [ ] `src/features/documentation/components/DiagramPanel.tsx`
  - [ ] Diagram type selector
  - [ ] Scope selector (app/page/process)
  - [ ] Mermaid renderer
  - [ ] Direction toggle (TB/LR)
  - [ ] Export PNG/SVG buttons

- [ ] `src/features/documentation/components/VersionHistoryPanel.tsx`
  - [ ] Version list with author and timestamp
  - [ ] Version diff viewer
  - [ ] Restore button

- [ ] `src/features/documentation/components/ModuleManualViewer.tsx`
  - [ ] Table of contents sidebar
  - [ ] Chapter navigation
  - [ ] Diagram integration
  - [ ] Export full manual

- [ ] `src/features/documentation/hooks/useDocumentation.ts`
  - [ ] React Query hooks for generate, list, update, versions, export, diagrams

---

### 6. Unit Tests (apps/api/tests/)

- [ ] `tests/modules/impact/graph-builder.service.test.ts`
  - [ ] Parse page dependencies from regions
  - [ ] Parse process dependencies (package calls)
  - [ ] Parse DA dependencies (item references)
  - [ ] Parse LOV dependencies (table references)
  - [ ] Parse auth dependencies
  - [ ] Cross-package dependency detection

- [ ] `tests/modules/impact/graph-sync.service.test.ts`
  - [ ] Full sync creates nodes and edges
  - [ ] Incremental sync only processes changed components
  - [ ] Sync status recorded correctly
  - [ ] Concurrent sync prevented (409)

- [ ] `tests/modules/impact/impact-analysis.service.test.ts`
  - [ ] Analyze impact for single-level dependency
  - [ ] Analyze transitive dependencies (multi-level)
  - [ ] Response time < 3s for 50 dependencies (mocked)
  - [ ] Depth limit enforcement (max 10)
  - [ ] Risk escalation when radius > 10
  - [ ] Block without review for ALTO/CRITICO

- [ ] `tests/modules/impact/regression-planner.service.test.ts`
  - [ ] Generate regression plan from affected components
  - [ ] Link existing test suites
  - [ ] Priority assignment (HIGH for direct, MEDIUM/LOW for transitive)

- [ ] `tests/modules/impact/impact.controller.test.ts`
  - [ ] POST /impact/analyze as developer -> 200
  - [ ] GET /impact/graph as developer -> 200
  - [ ] POST /impact/sync as developer -> 200
  - [ ] POST /impact/sync when already running -> 409
  - [ ] POST /impact/regression-plan -> 200

- [ ] `tests/modules/documentation/doc-generator.service.test.ts`
  - [ ] Generate technical doc for PL/SQL package
  - [ ] Generate functional doc for APEX page
  - [ ] Generate module manual
  - [ ] Regenerate creates new version
  - [ ] Previous version marked is_current = FALSE

- [ ] `tests/modules/documentation/diagram-generator.service.test.ts`
  - [ ] Generate ERD with valid Mermaid syntax
  - [ ] Generate flow diagram
  - [ ] Generate sequence diagram
  - [ ] Generate component diagram
  - [ ] Reject diagram with > 50 nodes
  - [ ] Valid Mermaid syntax validation

- [ ] `tests/modules/documentation/auto-doc.service.test.ts`
  - [ ] Handle change_approved event triggers auto-doc
  - [ ] Skip trivial changes (< 5 lines diff)
  - [ ] Rate limiting enforced (10/min)
  - [ ] Job queued via Bull

- [ ] `tests/modules/documentation/doc-version.service.test.ts`
  - [ ] Get version history
  - [ ] Get specific version
  - [ ] Restore previous version creates new version
  - [ ] Diff between versions

- [ ] `tests/modules/documentation/doc-export.service.test.ts`
  - [ ] Export to Markdown bundle
  - [ ] Export to .docx with embedded diagrams
  - [ ] Render Mermaid to PNG
  - [ ] Table of contents generation

- [ ] `tests/modules/documentation/documentation.controller.test.ts`
  - [ ] POST /docs/generate as developer -> 200
  - [ ] POST /docs/diagram as developer -> 200
  - [ ] GET /docs -> 200 (paginated)
  - [ ] PUT /docs/:id -> 200
  - [ ] GET /docs/:id/versions -> 200
  - [ ] POST /docs/:id/versions/:v/restore -> 200
  - [ ] POST /docs/export -> 200

---

### 7. Integration Tests

- [ ] `tests/integration/impact-analysis.integration.test.ts`
  - [ ] Full flow: sync graph, analyze impact, generate regression plan
  - [ ] Incremental sync detects new component
  - [ ] Impact analysis across multiple dependency types
  - [ ] Governance integration: ALTO change blocked without review

- [ ] `tests/integration/documentation.integration.test.ts`
  - [ ] Generate technical doc, edit, view version history, restore
  - [ ] Auto-doc triggered by change approval event
  - [ ] Generate Mermaid diagram, export as PNG
  - [ ] Export module manual as .docx
  - [ ] Version diff across multiple edits

---

## File Summary

| Category | File Count |
|----------|------------|
| Database migrations | 4 |
| Shared types | 2 |
| Impact Analyzer module | 5 |
| Documentation module | 6 |
| React UI components | 11 |
| Unit tests | 11 |
| Integration tests | 2 |
| **Total** | **41** |

---

## Execution Order

The plan should be executed in the following order to respect dependencies:

1. Database migrations (031-034) -- schema must exist before service code
2. Shared types -- interfaces used by both modules
3. Impact Analyzer services (graph-builder -> graph-sync -> impact-analysis -> regression-planner -> impact.controller)
4. Documentation services (doc-generator + diagram-generator -> auto-doc + doc-version + doc-export -> documentation.controller)
5. React UI components (Impact Analyzer pages, then Documentation Studio pages)
6. Unit tests (parallel per module)
7. Integration tests (sequential, requires running DB + MCP + AI service + event bus)
