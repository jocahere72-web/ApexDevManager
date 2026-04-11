# Functional Design -- U7: Change Tracking & Schema

## Document Information

| Field | Value |
|-------|-------|
| **Unit** | U7 -- Change Tracking and Schema |
| **Sprint** | S6 (Fase 2) |
| **Duration** | 2 weeks |
| **Modules** | M6 (Change Manager), M7 (Schema Inspector) |
| **Stories** | US-018, US-019, US-020, US-021, US-051 |
| **Components** | C10 (Change Tracker), C05 (Explorer Service -- partial) |
| **Status** | AI-DLC Generated -- For Review |
| **Date** | 2026-04-10 |

---

## 1. M6 -- Change Manager

### 1.1 Change Log as Canonical Source of Truth

The `change_log` table is the single source of truth for all modifications made to APEX components through the platform. Every create, update, delete, and rollback operation is recorded with full before/after content snapshots.

#### Change Recording Flow

```
User / AI Engine     Change Manager       PostgreSQL         MCP Connector       APEX (ORDS)
  |                       |                    |                  |                  |
  |-- modify component -->|                    |                  |                  |
  |                       |-- fetch current --->|                  |                  |
  |                       |                    |                  |-- GET component ->|
  |                       |                    |                  |<-- code_before ---|
  |                       |                    |                  |                  |
  |                       |-- apply change ---->|                  |                  |
  |                       |                    |                  |-- PUT component ->|
  |                       |                    |                  |<-- success -------|
  |                       |                    |                  |                  |
  |                       |-- record change --->|                  |                  |
  |                       |   (code_before,     |                  |                  |
  |                       |    code_after,       |                  |                  |
  |                       |    metadata)         |                  |                  |
  |                       |<-- change_id --------|                  |                  |
  |<-- confirmation ------|                    |                  |                  |
```

### 1.2 Diff Visualization

The platform renders unified diffs comparing `code_before` and `code_after` for each change record.

#### Diff Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| CHG-R01 | Diff algorithm | Unified diff format (similar to `git diff`) using `diff` library |
| CHG-R02 | Syntax highlighting | Diff rendered with PL/SQL syntax highlighting in the UI |
| CHG-R03 | Side-by-side mode | User can toggle between unified and side-by-side diff views |
| CHG-R04 | Hunk context | 3 lines of context around each change hunk |
| CHG-R05 | Line numbers | Both old and new line numbers displayed |
| CHG-R06 | Stats | Addition/deletion/modification counts per diff |

### 1.3 Rollback via ORDS

Rollback restores the `code_before` content of a change by pushing it back to the APEX instance via ORDS/MCP.

#### Rollback Flow

```
User              Change Manager       PostgreSQL         MCP Connector       APEX (ORDS)
  |                    |                    |                  |                  |
  |-- request rollback ->                   |                  |                  |
  |                    |-- get change ------>|                  |                  |
  |                    |<-- code_before -----|                  |                  |
  |                    |                    |                  |                  |
  |                    |-- fetch current --->|                  |                  |
  |                    |                    |                  |-- GET component ->|
  |                    |                    |                  |<-- current code --|
  |                    |                    |                  |                  |
  |                    |-- apply restore --->|                  |                  |
  |                    |                    |                  |-- PUT code_before>|
  |                    |                    |                  |<-- success -------|
  |                    |                    |                  |                  |
  |                    |-- record rollback ->|                  |                  |
  |                    |   (source: rollback)|                  |                  |
  |<-- rollback result --|                    |                  |                  |
```

#### Rollback Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| CHG-R07 | Rollback creates new change | Rollback is itself a change record with source='rollback' |
| CHG-R08 | Rollback chain | Stores reference to original change_id being rolled back |
| CHG-R09 | Connection required | Active ORDS connection must be validated before rollback |
| CHG-R10 | Conflict detection | If component was modified since the target change, warn user |
| CHG-R11 | Rollback of rollback | Allowed -- treated as a normal change restoration |

### 1.4 Filtering & Search

Users can filter the change log by multiple dimensions.

| Filter | Type | Description |
|--------|------|-------------|
| connection_id | UUID | Filter by target APEX connection |
| developer (user_id) | UUID | Filter by who made the change |
| date range | TIMESTAMPTZ | From/to date range |
| operation | ENUM | 'create', 'update', 'delete', 'rollback' |
| component_type | ENUM | Page, Process, Package, DA, Item, etc. |
| risk_level | ENUM | BAJO, MEDIO, ALTO, CRITICO |
| release_id | UUID | Filter by associated release |
| search | TEXT | Full-text search on component name or summary |

### 1.5 Export

| Format | Description |
|--------|-------------|
| CSV | Flat export with one row per change (no code content) |
| JSON | Full export including code_before/code_after content |

#### Export Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| CHG-R12 | CSV columns | change_id, timestamp, user, component_type, component_name, operation, risk_level, summary |
| CHG-R13 | JSON structure | Array of full ChangeRecord objects |
| CHG-R14 | Date range required | Export requires date range to prevent unbounded queries |
| CHG-R15 | Max export window | Maximum 90 days per export |

### 1.6 Release Integration

Changes can be associated with a release_id for grouping and tracking.

| Rule ID | Rule | Details |
|---------|------|---------|
| CHG-R16 | Release linkage | Changes linked to release via release_id FK (nullable) |
| CHG-R17 | Release filter | Change log filterable by release |
| CHG-R18 | Unlinked changes | Changes without release_id are "unreleased" |

---

## 2. M7 -- Schema Inspector

### 2.1 GENESYS Schema Exploration

The Schema Inspector provides read-only browsing of the Oracle/GENESYS database schema accessible through configured connections.

#### Schema Browser Flow

```
User              Schema Inspector     MCP Connector       Oracle DB (ORDS)
  |                    |                  |                      |
  |-- select conn ----->|                  |                      |
  |-- browse tables --->|                  |                      |
  |                    |-- query metadata ->|                      |
  |                    |                  |-- ALL_TABLES -------->|
  |                    |                  |<-- table list --------|
  |<-- table list ------|                  |                      |
  |                    |                  |                      |
  |-- select table ---->|                  |                      |
  |                    |-- query columns -->|                      |
  |                    |                  |-- ALL_TAB_COLUMNS --->|
  |                    |                  |<-- columns -----------|
  |                    |-- query constraints ->                    |
  |                    |                  |-- ALL_CONSTRAINTS --->|
  |                    |                  |<-- constraints -------|
  |                    |-- query FKs ------>|                      |
  |                    |                  |-- ALL_CONS_COLUMNS -->|
  |                    |                  |<-- FK details --------|
  |<-- table details --|                  |                      |
```

### 2.2 Schema Browsing Capabilities

| Capability | Source View | Description |
|------------|-------------|-------------|
| Tables | ALL_TABLES | List all tables with row counts, tablespace |
| Columns | ALL_TAB_COLUMNS | Column name, data type, nullable, default, comments |
| Constraints | ALL_CONSTRAINTS | PK, UK, FK, CHECK constraints |
| Foreign Keys | ALL_CONS_COLUMNS + ALL_CONSTRAINTS | FK relationships with referenced table/column |
| Indexes | ALL_INDEXES + ALL_IND_COLUMNS | Index name, columns, uniqueness |
| Triggers | ALL_TRIGGERS | Trigger name, type, event, status |
| Comments | ALL_COL_COMMENTS | Column-level documentation |

### 2.3 FK Relationship Visualization

Generate Mermaid ER diagrams showing foreign key relationships between tables.

#### Visualization Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| SCH-R01 | Diagram scope | User selects 1-20 tables for diagram |
| SCH-R02 | Auto-include referenced | FK-referenced tables auto-included in diagram |
| SCH-R03 | Mermaid output | Rendered as Mermaid ER diagram in the UI |
| SCH-R04 | Column display | Show PK, FK, and up to 5 non-key columns per table |
| SCH-R05 | Relationship labels | Show FK constraint name and cardinality |
| SCH-R06 | Export diagram | Download as PNG or SVG |

#### Example Mermaid Output

```
erDiagram
    LOANS ||--o{ LOAN_DOCUMENTS : "has"
    LOANS {
        NUMBER loan_id PK
        NUMBER borrower_id FK
        NUMBER amount
        DATE created_at
    }
    LOAN_DOCUMENTS {
        NUMBER document_id PK
        NUMBER loan_id FK
        VARCHAR2 doc_type
        BLOB content
    }
    BORROWERS ||--o{ LOANS : "applies for"
    BORROWERS {
        NUMBER borrower_id PK
        VARCHAR2 name
        VARCHAR2 email
    }
```

### 2.4 Table Search

| Rule ID | Rule | Details |
|---------|------|---------|
| SCH-R07 | Search scope | Search across table names, column names, and comments |
| SCH-R08 | Search mode | Case-insensitive LIKE search with wildcard support |
| SCH-R09 | Results | Return table name, match location (table name/column/comment), and context |
| SCH-R10 | Performance | Search results in < 2 seconds for schemas with up to 2000 tables |

### 2.5 Claude Auto-Documentation

Claude generates natural-language documentation for tables based on their structure and data patterns.

#### Auto-Documentation Flow

```
User              Schema Inspector     Claude AI            MCP Connector       Oracle DB
  |                    |                  |                      |                  |
  |-- document table -->|                  |                      |                  |
  |                    |-- fetch metadata ->|                      |                  |
  |                    |                  |                      |-- columns/FKs --->|
  |                    |                  |                      |<-- metadata ------|
  |                    |-- sample data ---->|                      |                  |
  |                    |                  |                      |-- SELECT TOP 5 -->|
  |                    |                  |                      |<-- sample rows ---|
  |                    |                  |                      |                  |
  |                    |-- generate doc --->|                      |                  |
  |                    |<-- documentation --|                      |                  |
  |<-- table doc -------|                  |                      |                  |
```

#### Auto-Documentation Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| SCH-R11 | Sample data | Fetch up to 5 sample rows (sanitized) for context |
| SCH-R12 | Data masking | Mask columns matching patterns: *PASSWORD*, *SSN*, *CREDIT_CARD*, *TOKEN* |
| SCH-R13 | Doc structure | Purpose, column descriptions, relationships, usage notes |
| SCH-R14 | Cache duration | Generated docs cached for 24 hours per table |
| SCH-R15 | Manual override | User can edit generated documentation |

### 2.6 Table Usage in APEX Pages

Show which APEX pages reference a given table (as report source, form source, LOV source, or process target).

#### Usage Detection

| Usage Type | Detection Method |
|------------|-----------------|
| Report source | Query APEX_APPLICATION_PAGE_REGIONS for SQL source containing table name |
| Form source | Query APEX_APPLICATION_PAGE_REGIONS for table_name attribute |
| LOV source | Query APEX_APPLICATION_LOVS for SQL containing table name |
| Process target | Query APEX_APPLICATION_PAGE_PROC for SQL containing table name |
| Dynamic action | Query APEX_APPLICATION_PAGE_DA_ACTS for SQL containing table name |

#### Usage Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| SCH-R16 | Cross-app search | Search across all apps in the connection's workspace |
| SCH-R17 | Pattern matching | Use regex to find table references in SQL, not just exact match |
| SCH-R18 | Cache | Usage results cached per connection, invalidated on schema refresh |

---

## 3. Data Models

### 3.1 change_log

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Change identifier |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant isolation |
| connection_id | UUID | FK connections(id), NOT NULL | Target APEX connection |
| app_id | INTEGER | NOT NULL | APEX application ID |
| component_type | VARCHAR(50) | NOT NULL | Page, Process, Package, DA, Item, etc. |
| component_id | INTEGER | NOT NULL | APEX component ID |
| component_name | VARCHAR(255) | NOT NULL | Component display name |
| operation | VARCHAR(20) | NOT NULL, CHECK | 'create', 'update', 'delete', 'rollback' |
| code_before | TEXT | | Content before change (NULL for create) |
| code_after | TEXT | NOT NULL | Content after change |
| summary | TEXT | | AI-generated change summary |
| risk_level | VARCHAR(10) | NOT NULL, DEFAULT 'BAJO' | BAJO, MEDIO, ALTO, CRITICO |
| source | VARCHAR(20) | NOT NULL | 'manual', 'ai_generated', 'import', 'rollback' |
| rollback_of | UUID | FK change_log(id) | Reference to change being rolled back |
| release_id | UUID | FK releases(id) | Associated release (nullable) |
| user_id | UUID | FK users(id), NOT NULL | Who made the change |
| metadata | JSONB | | Additional metadata (line counts, file paths, etc.) |
| created_at | TIMESTAMPTZ | DEFAULT NOW() | Change timestamp |

**Indexes:**
- `idx_change_log_tenant` ON (tenant_id)
- `idx_change_log_tenant_connection` ON (tenant_id, connection_id, created_at DESC)
- `idx_change_log_user` ON (user_id, created_at DESC)
- `idx_change_log_component` ON (component_type, component_id)
- `idx_change_log_release` ON (release_id) WHERE release_id IS NOT NULL
- `idx_change_log_operation` ON (tenant_id, operation)
- `idx_change_log_created_at` ON (created_at DESC)
- GIN index `idx_change_log_search` ON (to_tsvector('english', component_name || ' ' || COALESCE(summary, '')))

**RLS:** `change_log_tenant_isolation` USING (tenant_id::text = current_setting('app.current_tenant', true))

### 3.2 schema_cache

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Cache entry identifier |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant isolation |
| connection_id | UUID | FK connections(id), NOT NULL | Source connection |
| schema_name | VARCHAR(128) | NOT NULL | Oracle schema name |
| cache_type | VARCHAR(20) | NOT NULL | 'tables', 'columns', 'constraints', 'fks', 'indexes' |
| cache_data | JSONB | NOT NULL | Cached metadata |
| refreshed_at | TIMESTAMPTZ | NOT NULL, DEFAULT NOW() | When cache was last refreshed |
| expires_at | TIMESTAMPTZ | NOT NULL | Cache expiry |

**Indexes:**
- UNIQUE `uq_schema_cache_conn_type` ON (connection_id, schema_name, cache_type)
- `idx_schema_cache_tenant` ON (tenant_id)
- `idx_schema_cache_expires` ON (expires_at)

**RLS:** `schema_cache_tenant_isolation` USING (tenant_id::text = current_setting('app.current_tenant', true))

### 3.3 schema_documentation

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Doc identifier |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant isolation |
| connection_id | UUID | FK connections(id), NOT NULL | Source connection |
| schema_name | VARCHAR(128) | NOT NULL | Oracle schema name |
| table_name | VARCHAR(128) | NOT NULL | Table name |
| documentation | TEXT | NOT NULL | Generated/edited documentation |
| generated_by | VARCHAR(10) | NOT NULL | 'ai' or 'user' |
| version | SMALLINT | NOT NULL, DEFAULT 1 | Version counter |
| created_at | TIMESTAMPTZ | DEFAULT NOW() | Creation timestamp |
| updated_at | TIMESTAMPTZ | DEFAULT NOW() | Last update |

**Indexes:**
- UNIQUE `uq_schema_doc_conn_table` ON (connection_id, schema_name, table_name) -- latest version only
- `idx_schema_doc_tenant` ON (tenant_id)

**RLS:** `schema_documentation_tenant_isolation` USING (tenant_id::text = current_setting('app.current_tenant', true))

---

## 4. Error Codes

| Code | HTTP | Description |
|------|------|-------------|
| CHG_NOT_FOUND | 404 | Change record does not exist |
| CHG_ROLLBACK_CONFLICT | 409 | Component modified since target change |
| CHG_ROLLBACK_FAILED | 500 | Rollback ORDS operation failed |
| CHG_EXPORT_TOO_LARGE | 400 | Export date range exceeds 90 days |
| CHG_CONNECTION_INVALID | 400 | Target connection not active |
| SCH_CONNECTION_INVALID | 400 | Target connection not active |
| SCH_TABLE_NOT_FOUND | 404 | Table does not exist in schema |
| SCH_QUERY_TIMEOUT | 504 | Schema query exceeded timeout |
| SCH_DOC_GENERATION_FAILED | 422 | Claude documentation generation failed |
| SCH_DIAGRAM_TOO_LARGE | 400 | Too many tables selected for diagram (>20) |
| SCH_CACHE_EXPIRED | 410 | Cache entry expired, refresh required |
