# Functional Design -- U6: PRD Suite

## Document Information

| Field | Value |
|-------|-------|
| **Unit** | U6 -- PRD Suite |
| **Sprint** | S5 (Fase 2) |
| **Duration** | 2 weeks |
| **Modules** | M8 (PRD Builder), M5 (PRD-to-Page Generator) |
| **Stories** | US-014, US-015, US-016, US-017 |
| **Components** | C15 (PRD Processor), C16 (Page Generator) |
| **Status** | AI-DLC Generated -- For Review |
| **Date** | 2026-04-10 |

---

## 1. M8 -- PRD Builder

### 1.1 Five-Stage PRD Workflow

The PRD Builder follows a five-stage pipeline: Ingest, Extract, Generate, Validate, Export. Each stage produces intermediate artifacts stored in the `prd_sessions` table and can be resumed if interrupted.

#### Stage Diagram

```
User                  PRD Builder          Claude AI            PostgreSQL
  |                       |                    |                    |
  |-- Upload files ------>|                    |                    |
  |                       |  [STAGE 1: INGEST] |                    |
  |                       |-- parse files ----->|                    |
  |                       |<-- parsed chunks ---|                    |
  |                       |-- store sources --->|------------------>|
  |                       |                    |                    |
  |                       |  [STAGE 2: EXTRACT] |                    |
  |                       |-- extract entities ->|                   |
  |                       |<-- actors, flows,   |                    |
  |                       |   rules, pages,     |                    |
  |                       |   tables            |                    |
  |                       |-- store extractions ->|----------------->|
  |                       |                    |                    |
  |                       |  [STAGE 3: GENERATE]|                    |
  |                       |-- generate PRD ----->|                   |
  |                       |<-- 10 sections ------|                   |
  |                       |-- store sections --->|------------------>|
  |                       |                    |                    |
  |<-- preview PRD -------|                    |                    |
  |-- edit sections ------>|                    |                    |
  |                       |  [STAGE 4: VALIDATE]|                    |
  |                       |-- validate PRD ----->|                   |
  |                       |<-- checklist --------|                   |
  |                       |-- store results ---->|------------------>|
  |<-- validation report --|                    |                    |
  |                       |                    |                    |
  |-- confirm export ----->|                    |                    |
  |                       |  [STAGE 5: EXPORT]  |                    |
  |                       |-- render .md + YAML -|                   |
  |<-- download .md -------|                    |                    |
  |                       |                    |                    |
  |-- [optional] Send to M5 ->                  |                    |
```

### 1.2 Stage 1: Ingest

Multi-format document ingestion supporting up to 10 files per session, 25 MB each.

#### Supported Formats

| Format | MIME Type | Parser |
|--------|-----------|--------|
| `.docx` | `application/vnd.openxmlformats-officedocument.wordprocessingml.document` | mammoth |
| `.pdf` | `application/pdf` | pdf-parse |
| `.png` | `image/png` | Claude vision API |
| `.jpg` / `.jpeg` | `image/jpeg` | Claude vision API |
| Plain text | `text/plain` | Direct string |
| Markdown | `text/markdown` | Direct string |

#### Ingest Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| PRD-R01 | Max files per session | 10 files |
| PRD-R02 | Max file size | 25 MB per file |
| PRD-R03 | Total session size | 100 MB across all files |
| PRD-R04 | Image resolution | Images downscaled to 2048px max dimension before Claude vision |
| PRD-R05 | Text extraction | .docx and .pdf text extracted server-side; images sent to Claude vision |
| PRD-R06 | Chunk strategy | Text split into 4000-token chunks with 200-token overlap |

#### Ingest Validation (Zod)

```typescript
const IngestSchema = z.object({
  sessionId: z.string().uuid().optional(),  // omit to create new session
  files: z.array(z.object({
    filename: z.string().max(255),
    mimeType: z.enum([
      'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
      'application/pdf',
      'image/png',
      'image/jpeg',
      'text/plain',
      'text/markdown',
    ]),
    size: z.number().max(25 * 1024 * 1024),
  })).min(1).max(10),
});
```

### 1.3 Stage 2: Extract

Claude analyzes ingested content to extract structured entities relevant to APEX/GENESYS development.

#### Extracted Entities

| Entity Type | Description | Example |
|-------------|-------------|---------|
| `actor` | User role or persona | "Loan Officer", "System Admin" |
| `flow` | Business process or workflow | "Loan Approval Flow" |
| `business_rule` | Validation or constraint | "Loan amount cannot exceed 5x annual income" |
| `apex_page` | APEX page suggestion | "Loan Application Form (Form + Report)" |
| `genesys_table` | Database table reference | "LOANS, LOAN_DOCUMENTS, BORROWERS" |

#### Extraction Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| PRD-R07 | Context window | All ingested chunks sent as context to Claude |
| PRD-R08 | Entity deduplication | Merge duplicate entities by semantic similarity |
| PRD-R09 | Confidence scoring | Each extracted entity includes confidence 0.0-1.0 |
| PRD-R10 | Low-confidence warning | Entities with confidence < 0.6 flagged for review |

### 1.4 Stage 3: Generate

Claude generates a complete PRD document with 10 mandatory sections.

#### Mandatory PRD Sections

| # | Section | Description |
|---|---------|-------------|
| 1 | Executive Summary | High-level overview of the application/feature |
| 2 | Business Objectives | Goals, KPIs, success metrics |
| 3 | Actors & Personas | User roles with responsibilities |
| 4 | Functional Requirements | Detailed feature specifications |
| 5 | Business Rules | Validation rules, constraints, calculations |
| 6 | Data Model | Tables, columns, relationships, constraints |
| 7 | APEX Page Inventory | Suggested pages with types and regions |
| 8 | Process Flows | Step-by-step workflow descriptions |
| 9 | Non-Functional Requirements | Performance, security, accessibility targets |
| 10 | Assumptions & Constraints | Boundaries and dependencies |

#### Generation Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| PRD-R11 | Section completeness | All 10 sections must be populated (empty = blocker) |
| PRD-R12 | Editable output | User can edit any section before validation |
| PRD-R13 | Streaming generation | Sections streamed progressively via SSE |
| PRD-R14 | Regenerate section | User can request regeneration of individual sections |
| PRD-R15 | Version tracking | Each edit creates a new section version |

### 1.5 Stage 4: Validate

Automated validation with a blocker/warning checklist applied to the generated PRD.

#### Validation Checklist

| Check ID | Check | Severity |
|----------|-------|----------|
| VAL-01 | All 10 sections present and non-empty | BLOCKER |
| VAL-02 | At least 1 actor defined | BLOCKER |
| VAL-03 | At least 1 functional requirement per actor | WARNING |
| VAL-04 | Data model references valid table names | WARNING |
| VAL-05 | Business rules reference existing entities | WARNING |
| VAL-06 | Page inventory includes page type for each page | BLOCKER |
| VAL-07 | Process flows reference defined actors | WARNING |
| VAL-08 | No orphan entities (referenced but undefined) | WARNING |
| VAL-09 | NFRs include measurable targets | WARNING |
| VAL-10 | Executive summary under 500 words | WARNING |

#### Validation Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| PRD-R16 | Blocker handling | PRD cannot be exported with unresolved blockers |
| PRD-R17 | Warning handling | Warnings are informational, do not block export |
| PRD-R18 | Re-validation | Validate runs automatically after any section edit |

### 1.6 Stage 5: Export

Export the validated PRD to Markdown with YAML frontmatter.

#### Export Format

```markdown
---
title: "Application PRD"
version: "1.0"
status: "validated"
created_at: "2026-04-10T12:00:00Z"
author: "user@tenant.com"
session_id: "uuid"
validation_score: 95
blockers: 0
warnings: 2
---

# 1. Executive Summary
...

# 2. Business Objectives
...
```

#### Export Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| PRD-R19 | YAML frontmatter | Include metadata: title, version, status, timestamps, validation score |
| PRD-R20 | Send to M5 button | Export result can be sent directly to M5 PRD-to-Page Generator |
| PRD-R21 | Download option | User can download .md file directly |

---

## 2. M5 -- PRD-to-Page Generator

### 2.1 Page Generation Flow

The PRD-to-Page Generator accepts a PRD (text or image) and produces an APEX page definition ready for deployment.

#### Sequence Diagram

```
User              Page Generator      Claude AI         MCP Connector      APEX (ORDS)
  |                    |                  |                  |                  |
  |-- submit PRD ----->|                  |                  |                  |
  |   (text or image)  |                  |                  |                  |
  |                    |-- validate conn ->|                  |                  |
  |                    |                  |                  |-- test ORDS ----->|
  |                    |                  |                  |<-- OK ------------|
  |                    |                  |                  |                  |
  |                    |-- generate def -->|                  |                  |
  |                    |<-- page def ------|                  |                  |
  |                    |                  |                  |                  |
  |                    |-- check collisions ->               |                  |
  |                    |                  |                  |-- query pages --->|
  |                    |                  |                  |<-- existing IDs --|
  |                    |                  |                  |                  |
  |                    |  [IF collision]   |                  |                  |
  |<-- collision dialog |                  |                  |                  |
  |-- choose action --->|                  |                  |                  |
  |   (overwrite/new/   |                  |                  |                  |
  |    cancel)          |                  |                  |                  |
  |                    |                  |                  |                  |
  |<-- preview ---------|                  |                  |                  |
  |-- approve ---------->|                  |                  |                  |
  |                    |-- apply page ---->|                  |                  |
  |                    |                  |                  |-- create page --->|
  |                    |                  |                  |<-- result --------|
  |<-- success ----------|                  |                  |                  |
```

### 2.2 Input Modes

| Mode | Description | Processing |
|------|-------------|------------|
| Text PRD | Markdown or plain text PRD content | Direct parsing by Claude |
| Image PRD | Screenshot or photo of requirements | Claude vision extraction, then generation |
| M8 PRD | Structured PRD from PRD Builder (via Send to M5) | Pre-parsed sections used directly |

### 2.3 Generated Page Definition

Claude generates a complete APEX page definition including:

```typescript
interface GeneratedPageDefinition {
  pageId: number;
  pageName: string;
  pageMode: 'normal' | 'modal' | 'drawer';
  pageGroup: string;
  authorizationScheme: string;
  regions: APEXRegion[];
  items: APEXItem[];
  buttons: APEXButton[];
  processes: APEXProcess[];
  dynamicActions: APEXDynamicAction[];
  computations: APEXComputation[];
  validations: APEXValidation[];
}

interface APEXRegion {
  name: string;
  type: 'static' | 'form' | 'interactive_report' | 'interactive_grid' |
        'classic_report' | 'chart' | 'list' | 'breadcrumb' | 'cards';
  source: string;           // SQL query or table name
  position: number;
  parentRegion?: string;
  template: string;
  displayCondition?: string;
}

interface APEXItem {
  name: string;
  type: 'text' | 'textarea' | 'number' | 'date' | 'select_list' |
        'checkbox' | 'radio' | 'hidden' | 'display_only' | 'file_upload';
  label: string;
  region: string;
  source: string;            // Column name or static
  required: boolean;
  validation?: string;
  defaultValue?: string;
  lovSource?: string;
}
```

### 2.4 Page Number Collision Handling

| Action | Behavior |
|--------|----------|
| Overwrite | Replace existing page with generated definition |
| New | Auto-assign next available page number |
| Cancel | Abort generation, return to editor |

#### Collision Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| PAGE-R01 | Collision detection | Query `APEX_APPLICATION_PAGES` for existing page IDs before generation |
| PAGE-R02 | Overwrite confirmation | Overwrite requires explicit user confirmation |
| PAGE-R03 | New page numbering | Next available ID = MAX(page_id) + 1 in target app |
| PAGE-R04 | Batch generation | When PRD defines multiple pages, check all IDs at once |

### 2.5 Preview Before Apply

Before applying the generated page to APEX, the user sees a structured preview.

#### Preview Contents

| Section | Description |
|---------|-------------|
| Page metadata | Name, ID, mode, group |
| Region tree | Hierarchical view of regions |
| Item summary | Table of items with types and regions |
| Process list | Processes with execution points |
| Validation list | Validations with conditions |
| Estimated complexity | Simple/Medium/Complex based on component count |

#### Preview Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| PAGE-R05 | Mandatory preview | Page cannot be applied without preview display |
| PAGE-R06 | Edit in preview | User can modify generated definition before apply |
| PAGE-R07 | Preview expiry | Preview valid for 30 minutes; re-generate if expired |

### 2.6 Connection Validation

| Rule ID | Rule | Details |
|---------|------|---------|
| PAGE-R08 | Connection required | Active ORDS connection must be validated before generation |
| PAGE-R09 | Schema validation | Target schema must exist and be accessible |
| PAGE-R10 | APEX workspace validation | Target workspace must be accessible |
| PAGE-R11 | Connection test | Latency must be < 5000ms or generation is blocked |

---

## 3. Data Models

### 3.1 prd_sessions

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Session identifier |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant isolation |
| app_id | INTEGER | NOT NULL | Target APEX application |
| title | VARCHAR(500) | NOT NULL | PRD title |
| status | VARCHAR(20) | NOT NULL, CHECK | Current stage: draft, ingesting, extracting, generating, validating, validated, exported |
| current_stage | SMALLINT | NOT NULL, DEFAULT 1 | Stage number 1-5 |
| extraction_data | JSONB | | Extracted entities (actors, flows, rules, pages, tables) |
| validation_score | SMALLINT | | 0-100 completeness score |
| validation_blockers | SMALLINT | DEFAULT 0 | Count of blocker issues |
| validation_warnings | SMALLINT | DEFAULT 0 | Count of warning issues |
| exported_at | TIMESTAMPTZ | | When PRD was exported |
| created_by | UUID | FK users(id), NOT NULL | Creator |
| created_at | TIMESTAMPTZ | DEFAULT NOW() | Creation timestamp |
| updated_at | TIMESTAMPTZ | DEFAULT NOW() | Last update |
| deleted_at | TIMESTAMPTZ | | Soft delete |

**Indexes:**
- `idx_prd_sessions_tenant` ON (tenant_id)
- `idx_prd_sessions_tenant_status` ON (tenant_id, status) WHERE deleted_at IS NULL
- UNIQUE `uq_prd_sessions_tenant_id` ON (tenant_id, id)

**RLS:** `prd_sessions_tenant_isolation` USING (tenant_id::text = current_setting('app.current_tenant', true))

### 3.2 prd_sources

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Source identifier |
| session_id | UUID | FK prd_sessions(id), NOT NULL | Parent session |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant isolation |
| filename | VARCHAR(255) | NOT NULL | Original filename |
| mime_type | VARCHAR(100) | NOT NULL | File MIME type |
| file_size | INTEGER | NOT NULL | File size in bytes |
| storage_key | VARCHAR(500) | NOT NULL | Object storage key |
| parsed_text | TEXT | | Extracted text content |
| chunk_count | SMALLINT | DEFAULT 0 | Number of text chunks |
| parse_status | VARCHAR(20) | NOT NULL, DEFAULT 'pending' | pending, parsing, parsed, failed |
| parse_error | TEXT | | Error message if parsing failed |
| created_at | TIMESTAMPTZ | DEFAULT NOW() | Upload timestamp |

**Indexes:**
- `idx_prd_sources_session` ON (session_id)
- `idx_prd_sources_tenant` ON (tenant_id)

**RLS:** `prd_sources_tenant_isolation` USING (tenant_id::text = current_setting('app.current_tenant', true))

### 3.3 prd_sections

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Section identifier |
| session_id | UUID | FK prd_sessions(id), NOT NULL | Parent session |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant isolation |
| section_number | SMALLINT | NOT NULL | Section order 1-10 |
| title | VARCHAR(255) | NOT NULL | Section title |
| content | TEXT | NOT NULL | Markdown content |
| version | SMALLINT | NOT NULL, DEFAULT 1 | Edit version counter |
| is_current | BOOLEAN | NOT NULL, DEFAULT TRUE | Whether this is the active version |
| generated_by | VARCHAR(10) | NOT NULL | 'ai' or 'user' |
| created_at | TIMESTAMPTZ | DEFAULT NOW() | Creation timestamp |

**Indexes:**
- `idx_prd_sections_session_number` ON (session_id, section_number) WHERE is_current = TRUE
- `idx_prd_sections_tenant` ON (tenant_id)
- UNIQUE `uq_prd_sections_session_number_version` ON (session_id, section_number, version)

**RLS:** `prd_sections_tenant_isolation` USING (tenant_id::text = current_setting('app.current_tenant', true))

### 3.4 prd_validation_results

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Result identifier |
| session_id | UUID | FK prd_sessions(id), NOT NULL | Parent session |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant isolation |
| check_id | VARCHAR(10) | NOT NULL | Validation check ID (VAL-01..VAL-10) |
| severity | VARCHAR(10) | NOT NULL, CHECK | 'blocker' or 'warning' |
| passed | BOOLEAN | NOT NULL | Whether check passed |
| message | TEXT | | Failure detail message |
| section_number | SMALLINT | | Related section number |
| created_at | TIMESTAMPTZ | DEFAULT NOW() | Validation timestamp |

**Indexes:**
- `idx_prd_validation_session` ON (session_id)
- `idx_prd_validation_severity` ON (session_id, severity) WHERE NOT passed

**RLS:** `prd_validation_results_tenant_isolation` USING (tenant_id::text = current_setting('app.current_tenant', true))

### 3.5 page_generation_jobs

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Job identifier |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant isolation |
| prd_session_id | UUID | FK prd_sessions(id) | Source PRD (nullable for text/image input) |
| connection_id | UUID | FK connections(id), NOT NULL | Target APEX connection |
| app_id | INTEGER | NOT NULL | Target APEX application ID |
| input_type | VARCHAR(10) | NOT NULL, CHECK | 'prd', 'text', 'image' |
| input_content | TEXT | | Text/image input content |
| status | VARCHAR(20) | NOT NULL, DEFAULT 'pending' | pending, generating, preview, applying, applied, failed |
| page_definition | JSONB | | Generated page definition |
| collision_action | VARCHAR(10) | | 'overwrite', 'new', 'cancel' |
| preview_expires_at | TIMESTAMPTZ | | Preview expiry (30 min from generation) |
| applied_page_id | INTEGER | | Final page ID after apply |
| error_message | TEXT | | Error if failed |
| created_by | UUID | FK users(id), NOT NULL | Creator |
| created_at | TIMESTAMPTZ | DEFAULT NOW() | Creation timestamp |
| updated_at | TIMESTAMPTZ | DEFAULT NOW() | Last update |

**Indexes:**
- `idx_page_gen_tenant` ON (tenant_id)
- `idx_page_gen_status` ON (tenant_id, status) WHERE status NOT IN ('applied', 'failed')
- `idx_page_gen_prd` ON (prd_session_id) WHERE prd_session_id IS NOT NULL

**RLS:** `page_generation_jobs_tenant_isolation` USING (tenant_id::text = current_setting('app.current_tenant', true))

---

## 4. Error Codes

| Code | HTTP | Description |
|------|------|-------------|
| PRD_SESSION_NOT_FOUND | 404 | PRD session does not exist |
| PRD_FILE_TOO_LARGE | 413 | File exceeds 25 MB limit |
| PRD_TOO_MANY_FILES | 400 | More than 10 files in session |
| PRD_UNSUPPORTED_FORMAT | 415 | File format not supported |
| PRD_PARSE_FAILED | 422 | Document parsing failed |
| PRD_EXTRACTION_FAILED | 422 | Claude entity extraction failed |
| PRD_GENERATION_FAILED | 422 | Claude PRD generation failed |
| PRD_VALIDATION_BLOCKERS | 422 | PRD has unresolved blockers, cannot export |
| PRD_EXPORT_FAILED | 500 | Export rendering failed |
| PAGE_CONNECTION_INVALID | 400 | Target connection not active or unreachable |
| PAGE_SCHEMA_NOT_FOUND | 404 | Target schema does not exist |
| PAGE_COLLISION_UNRESOLVED | 409 | Page ID collision not resolved |
| PAGE_PREVIEW_EXPIRED | 410 | Preview expired (>30 min) |
| PAGE_APPLY_FAILED | 500 | Failed to apply page via ORDS/MCP |
| PAGE_GENERATION_FAILED | 422 | Claude page generation failed |
