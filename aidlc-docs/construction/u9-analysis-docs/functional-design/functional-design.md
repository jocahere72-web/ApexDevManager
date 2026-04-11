# Functional Design -- U9: Analysis & Documentation

## Document Information

| Field | Value |
|-------|-------|
| **Unit** | U9 -- Analysis and Documentation |
| **Sprint** | S8 (Fase 2) |
| **Duration** | 2 weeks |
| **Modules** | M11 (Dependency & Impact Analyzer), M12 (Auto Documentation Studio) |
| **Stories** | US-027, US-028, US-029, US-030, US-053, US-054 |
| **Components** | C13 (Impact Analyzer), C14 (Documentation Generator) |
| **Status** | AI-DLC Generated -- For Review |
| **Date** | 2026-04-10 |

---

## 1. M11 -- Dependency & Impact Analyzer

### 1.1 Dependency Types

The analyzer tracks six core dependency types between APEX components.

| Dependency Type | Source | Target | Detection Method |
|-----------------|--------|--------|-----------------|
| Page -> SharedComponent | APEX Page | Shared Component (LOV, Auth Scheme, Template) | APEX_APPLICATION_PAGE_REGIONS, APEX_APPLICATION_ITEMS (lov_named_lov) |
| Process -> Package | Page Process / App Process | PL/SQL Package | Parse SQL for package references (schema.package.procedure) |
| DA -> Item | Dynamic Action | Page Item | APEX_APPLICATION_PAGE_DA (when_element, affected_elements) |
| Report -> Table | Report Region | Database Table/View | Parse SQL source in APEX_APPLICATION_PAGE_REGIONS |
| Page -> Authorization | Page / Region / Item | Authorization Scheme | APEX_APPLICATION_PAGES (authorization_scheme), region/item auth |
| Package -> Package | PL/SQL Package | PL/SQL Package | Parse package body for cross-package calls |

### 1.2 Graph Building from APEX Dictionary Views

The dependency graph is built by querying APEX dictionary views and parsing SQL/PL/SQL content.

#### Graph Building Flow

```
Scheduler/User     Impact Analyzer      MCP Connector       APEX Dictionary       PostgreSQL
  |                     |                    |                    |                    |
  |-- sync graph ------>|                    |                    |                    |
  |                     |-- query pages ---->|                    |                    |
  |                     |                    |-- APEX_APP_PAGES ->|                    |
  |                     |                    |<-- pages list -----|                    |
  |                     |                    |                    |                    |
  |                     |-- query regions -->|                    |                    |
  |                     |                    |-- APEX_APP_REGIONS>|                    |
  |                     |                    |<-- regions --------|                    |
  |                     |                    |                    |                    |
  |                     |-- query processes->|                    |                    |
  |                     |                    |-- APEX_APP_PROC -->|                    |
  |                     |                    |<-- processes ------|                    |
  |                     |                    |                    |                    |
  |                     |-- query DAs ------>|                    |                    |
  |                     |                    |-- APEX_APP_DA ---->|                    |
  |                     |                    |<-- dynamic acts ---|                    |
  |                     |                    |                    |                    |
  |                     |-- parse SQL ------->|  (extract refs)   |                    |
  |                     |                    |                    |                    |
  |                     |-- build graph ---->|                    |                    |
  |                     |-- store graph ---->|                    |-- save nodes/edges>|
  |                     |                    |                    |                    |
  |<-- sync complete ---|                    |                    |                    |
```

#### APEX Dictionary Views Used

| View | Purpose |
|------|---------|
| APEX_APPLICATION_PAGES | Page list with auth schemes |
| APEX_APPLICATION_PAGE_REGIONS | Regions with SQL source and table_name |
| APEX_APPLICATION_PAGE_ITEMS | Items with LOV references |
| APEX_APPLICATION_PAGE_PROC | Processes with SQL source |
| APEX_APPLICATION_PAGE_DA | Dynamic actions with when/affected elements |
| APEX_APPLICATION_PAGE_DA_ACTS | DA action details |
| APEX_APPLICATION_LOVS | LOV definitions with SQL source |
| APEX_APPLICATION_AUTH | Authorization schemes |
| APEX_APPLICATION_COMPUTATIONS | Computation SQL |
| APEX_APPLICATION_PAGE_VAL | Validation SQL |
| ALL_DEPENDENCIES | Oracle-level package dependencies |
| ALL_SOURCE | PL/SQL source code for cross-package analysis |

### 1.3 Impact Analysis Performance

| Rule ID | Rule | Details |
|---------|------|---------|
| IMP-R01 | Response time | Impact analysis must complete in < 3 seconds for 50 dependencies |
| IMP-R02 | Graph caching | Dependency graph cached in PostgreSQL; queries run against cached graph |
| IMP-R03 | Lazy loading | Only load full component details when expanding a node |
| IMP-R04 | Depth limit | Default traversal depth: 5 levels; configurable up to 10 |
| IMP-R05 | Fan-out limit | Warn if a node has > 50 direct dependencies |

### 1.4 Graph Sync

| Rule ID | Rule | Details |
|---------|------|---------|
| IMP-R06 | Hourly sync | Background job refreshes graph every 60 minutes |
| IMP-R07 | On-demand sync | Manual refresh button triggers immediate sync |
| IMP-R08 | Incremental sync | Compare APEX dictionary timestamps; only re-parse changed components |
| IMP-R09 | Sync per connection | Each ORDS connection has its own graph |
| IMP-R10 | Sync status | Track last sync time, duration, component count |

### 1.5 Governance Integration

| Rule ID | Rule | Details |
|---------|------|---------|
| IMP-R11 | Block without review | ALTO/CRITICO changes require impact review before proceeding |
| IMP-R12 | Impact report | Auto-generate impact report attached to change record |
| IMP-R13 | Risk escalation | If impact radius > 10, escalate risk by one level |
| IMP-R14 | Regression suggestion | Auto-suggest regression test plan based on affected components |

### 1.6 Regression Plan Suggestion

Claude analyzes the affected components and suggests a regression test plan.

| Rule ID | Rule | Details |
|---------|------|---------|
| IMP-R15 | Plan structure | Test plan includes: affected pages, test scenarios, priority, estimated effort |
| IMP-R16 | Scenario generation | Claude generates test scenarios based on component type and usage |
| IMP-R17 | Priority assignment | Direct dependencies = HIGH, transitive = MEDIUM/LOW |
| IMP-R18 | Test suite linkage | If test suites exist for affected components, reference them |

---

## 2. M12 -- Auto Documentation Studio

### 2.1 Document Types

| Doc Type | Description | Trigger | Output |
|----------|-------------|---------|--------|
| Technical (Component) | Code-level docs for PL/SQL packages, procedures | Manual or on change approval | Markdown |
| Functional (Page) | Business-level page documentation | Manual or on change approval | Markdown |
| Release Notes | Summary of release changes | On release creation | Markdown |
| Module Manual | Comprehensive module documentation | Manual | Markdown |
| Mermaid Diagrams | ERD, flow, sequence, component diagrams | Manual | Mermaid code + rendered image |

### 2.2 Auto-Doc on Change Approval

When a change is approved, documentation is automatically regenerated for the affected component.

#### Auto-Doc Flow

```
Change Manager       Doc Studio         Claude AI            PostgreSQL
  |                      |                  |                    |
  |-- change approved -->|                  |                    |
  |  (event bus)         |                  |                    |
  |                      |-- fetch component ->                  |
  |                      |   metadata        |                    |
  |                      |                  |                    |
  |                      |-- generate doc -->|                    |
  |                      |<-- documentation -|                    |
  |                      |                  |                    |
  |                      |-- store doc ----->|                    |
  |                      |                  |-- INSERT/UPDATE -->|
  |                      |                  |                    |
  |                      |  [IF previous version exists]         |
  |                      |-- version++ ----->|                    |
```

#### Auto-Doc Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| DOC-R01 | Auto-trigger | Documentation regenerated on change_approved event |
| DOC-R02 | Component types | Auto-doc supported for: PL/SQL packages, APEX pages, authorization schemes |
| DOC-R03 | Skip trivial | Skip auto-doc for changes with < 5 lines of diff |
| DOC-R04 | Rate limit | Max 10 auto-docs per minute per tenant |
| DOC-R05 | Queue | Auto-doc jobs queued via Bull; processed async |

### 2.3 Editable with Version History

| Rule ID | Rule | Details |
|---------|------|---------|
| DOC-R06 | User edits | Users can edit any generated documentation |
| DOC-R07 | Version tracking | Each edit creates a new version; previous versions retained |
| DOC-R08 | Version diff | Users can diff between documentation versions |
| DOC-R09 | Restore version | Users can restore any previous version |
| DOC-R10 | Author tracking | Track who made each edit (AI or user_id) |

### 2.4 Technical Documentation (Component)

Claude generates technical documentation for PL/SQL packages.

#### Generated Sections

| Section | Description |
|---------|-------------|
| Overview | Package purpose and responsibility |
| Public API | Procedure/function signatures with descriptions |
| Parameters | Parameter descriptions, types, constraints |
| Dependencies | Other packages/tables referenced |
| Business Rules | Business logic encoded in the package |
| Error Handling | Exception handling patterns |
| Example Usage | Example calls with sample parameters |

### 2.5 Functional Documentation (Page)

Claude generates functional documentation for APEX pages.

#### Generated Sections

| Section | Description |
|---------|-------------|
| Page Purpose | What the page does from a business perspective |
| User Interactions | How users interact with the page |
| Data Sources | Tables and views used |
| Regions | Region descriptions and layout |
| Processes | Server-side processes and their triggers |
| Validations | Validation rules applied |
| Dynamic Actions | Client-side behavior |
| Authorization | Who can access the page |

### 2.6 Mermaid Diagram Generation

| Diagram Type | Source | Description |
|-------------|--------|-------------|
| ERD | Database schema | Entity-relationship diagram from table/FK metadata |
| Flow | Page processes | Process flow showing execution order and conditions |
| Sequence | Page interactions | User-system interaction sequence |
| Component | Application | Component dependency diagram |
| State | Workflow | State machine diagram for workflow entities |

#### Diagram Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| DOC-R11 | Mermaid syntax | All diagrams use valid Mermaid syntax |
| DOC-R12 | Diagram scope | User selects scope (page, module, application) |
| DOC-R13 | Auto-layout | Direction configurable (TB, LR) |
| DOC-R14 | Complexity limit | Warn if diagram exceeds 50 nodes |
| DOC-R15 | Export formats | PNG, SVG, Mermaid source code |

### 2.7 Export to .docx

| Rule ID | Rule | Details |
|---------|------|---------|
| DOC-R16 | Export format | Generate .docx from Markdown documentation |
| DOC-R17 | Template | Use configurable .docx template with company branding |
| DOC-R18 | Embedded diagrams | Mermaid diagrams rendered as PNG and embedded in .docx |
| DOC-R19 | Table of contents | Auto-generate TOC in .docx |
| DOC-R20 | Metadata | Include title, version, author, date in document properties |

---

## 3. Data Models

### 3.1 dependency_nodes

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Node identifier |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant isolation |
| connection_id | UUID | FK connections(id), NOT NULL | Source connection |
| app_id | INTEGER | NOT NULL | APEX application ID |
| component_type | VARCHAR(50) | NOT NULL | Page, Process, Package, DA, Item, Report, Authorization |
| component_id | INTEGER | NOT NULL | APEX component ID |
| component_name | VARCHAR(255) | NOT NULL | Display name |
| metadata | JSONB | | Additional component metadata |
| last_synced_at | TIMESTAMPTZ | NOT NULL | When node was last synced |
| created_at | TIMESTAMPTZ | DEFAULT NOW() | Creation timestamp |

**Indexes:**
- UNIQUE `uq_dep_nodes_conn_comp` ON (connection_id, app_id, component_type, component_id)
- `idx_dep_nodes_tenant` ON (tenant_id)
- `idx_dep_nodes_connection` ON (connection_id, app_id)
- `idx_dep_nodes_type` ON (connection_id, component_type)

**RLS:** `dependency_nodes_tenant_isolation` USING (tenant_id::text = current_setting('app.current_tenant', true))

### 3.2 dependency_edges

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Edge identifier |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant isolation |
| connection_id | UUID | FK connections(id), NOT NULL | Source connection |
| source_node_id | UUID | FK dependency_nodes(id), NOT NULL | Source node |
| target_node_id | UUID | FK dependency_nodes(id), NOT NULL | Target node |
| dependency_type | VARCHAR(30) | NOT NULL | 'calls', 'references', 'uses_data', 'triggers', 'authorizes' |
| weight | SMALLINT | NOT NULL, DEFAULT 1 | Dependency strength (1-10) |
| detection_method | VARCHAR(50) | NOT NULL | How the edge was detected |
| metadata | JSONB | | Additional edge metadata (line number, SQL fragment) |
| last_synced_at | TIMESTAMPTZ | NOT NULL | When edge was last verified |
| created_at | TIMESTAMPTZ | DEFAULT NOW() | Creation timestamp |

**Indexes:**
- UNIQUE `uq_dep_edges_src_tgt_type` ON (source_node_id, target_node_id, dependency_type)
- `idx_dep_edges_tenant` ON (tenant_id)
- `idx_dep_edges_source` ON (source_node_id)
- `idx_dep_edges_target` ON (target_node_id)
- `idx_dep_edges_connection` ON (connection_id)

**RLS:** `dependency_edges_tenant_isolation` USING (tenant_id::text = current_setting('app.current_tenant', true))

### 3.3 dependency_sync_status

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Sync record identifier |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant isolation |
| connection_id | UUID | FK connections(id), NOT NULL | Source connection |
| app_id | INTEGER | NOT NULL | APEX application ID |
| status | VARCHAR(20) | NOT NULL | 'running', 'completed', 'failed' |
| total_nodes | INTEGER | | Nodes discovered |
| total_edges | INTEGER | | Edges discovered |
| nodes_added | INTEGER | DEFAULT 0 | New nodes |
| nodes_removed | INTEGER | DEFAULT 0 | Removed nodes |
| edges_added | INTEGER | DEFAULT 0 | New edges |
| edges_removed | INTEGER | DEFAULT 0 | Removed edges |
| duration_ms | INTEGER | | Sync duration in milliseconds |
| error_message | TEXT | | Error if failed |
| started_at | TIMESTAMPTZ | NOT NULL | Sync start timestamp |
| completed_at | TIMESTAMPTZ | | Sync completion timestamp |

**Indexes:**
- `idx_dep_sync_connection` ON (connection_id, started_at DESC)
- `idx_dep_sync_tenant` ON (tenant_id)

**RLS:** `dependency_sync_status_tenant_isolation` USING (tenant_id::text = current_setting('app.current_tenant', true))

### 3.4 component_documentation

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Doc identifier |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant isolation |
| connection_id | UUID | FK connections(id), NOT NULL | Source connection |
| app_id | INTEGER | NOT NULL | APEX application ID |
| component_type | VARCHAR(50) | NOT NULL | Page, Package, etc. |
| component_id | INTEGER | NOT NULL | APEX component ID |
| component_name | VARCHAR(255) | NOT NULL | Component display name |
| doc_type | VARCHAR(20) | NOT NULL | 'technical', 'functional', 'release_notes', 'module_manual', 'diagram' |
| content | TEXT | NOT NULL | Markdown content |
| mermaid_code | TEXT | | Mermaid diagram source (for diagram type) |
| version | SMALLINT | NOT NULL, DEFAULT 1 | Version counter |
| is_current | BOOLEAN | NOT NULL, DEFAULT TRUE | Whether this is the active version |
| generated_by | VARCHAR(10) | NOT NULL | 'ai' or 'user' |
| change_id | UUID | FK change_log(id) | Triggering change (for auto-docs) |
| created_at | TIMESTAMPTZ | DEFAULT NOW() | Creation timestamp |
| updated_at | TIMESTAMPTZ | DEFAULT NOW() | Last update |

**Indexes:**
- `idx_comp_doc_conn_comp` ON (connection_id, component_type, component_id, doc_type) WHERE is_current = TRUE
- `idx_comp_doc_tenant` ON (tenant_id)
- `idx_comp_doc_change` ON (change_id) WHERE change_id IS NOT NULL

**RLS:** `component_documentation_tenant_isolation` USING (tenant_id::text = current_setting('app.current_tenant', true))

---

## 4. Error Codes

| Code | HTTP | Description |
|------|------|-------------|
| IMP_GRAPH_NOT_FOUND | 404 | No dependency graph for this connection/app |
| IMP_SYNC_IN_PROGRESS | 409 | Graph sync already running for this connection |
| IMP_SYNC_FAILED | 500 | Graph sync failed |
| IMP_ANALYSIS_TIMEOUT | 504 | Impact analysis exceeded 3 seconds |
| IMP_DEPTH_EXCEEDED | 400 | Traversal depth exceeds maximum (10) |
| IMP_COMPONENT_NOT_FOUND | 404 | Component not found in dependency graph |
| DOC_GENERATION_FAILED | 422 | Claude documentation generation failed |
| DOC_COMPONENT_NOT_FOUND | 404 | Component not found for documentation |
| DOC_VERSION_NOT_FOUND | 404 | Documentation version does not exist |
| DOC_EXPORT_FAILED | 500 | .docx export failed |
| DOC_DIAGRAM_TOO_COMPLEX | 400 | Diagram exceeds 50-node limit |
| DOC_RATE_LIMITED | 429 | Auto-doc rate limit exceeded (10/min) |
