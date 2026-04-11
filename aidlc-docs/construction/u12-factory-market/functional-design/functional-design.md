# Functional Design -- U12: Code Factory & Marketplace

## Document Information

| Field | Value |
|-------|-------|
| **Unit** | U12 -- Code Factory & Marketplace |
| **Sprint** | S11 (Fase 3, Weeks 24-25) |
| **Duration** | 2 weeks |
| **Modules** | M16 (Full Code Generation Factory) + M18 (Accelerators Marketplace) |
| **Stories** | US-038, US-039, US-043, US-044 |
| **Components** | C17 (Code Factory), C20 (Marketplace Service), C08 (Safety Engine -- consumed) |
| **Status** | AI-DLC Generated -- For Review |
| **Date** | 2026-04-10 |

---

## 1. M16 -- Full Code Generation Factory

### 1.1 Artifact Types

The Code Factory generates 8 distinct artifact types for Oracle APEX applications. Each artifact type has specific templates, validation rules, and deployment requirements.

| # | Artifact Type | Language | Deploy Via | Dependency Order |
|---|---------------|----------|-----------|-----------------|
| 1 | APEX Page | APEX Export/Import SQL | ORDS REST API | 8 (last) |
| 2 | Report (Interactive Report/Classic) | APEX SQL | ORDS REST API | 7 |
| 3 | List of Values (LOV) | APEX SQL | ORDS REST API | 6 |
| 4 | Dynamic Action (DA) | JavaScript + PL/SQL | ORDS REST API | 5 |
| 5 | PL/SQL Package (spec + body) | PL/SQL | ORDS SQL endpoint / JDBC | 4 |
| 6 | ORDS REST API | PL/SQL + ORDS module | ORDS Admin API | 3 |
| 7 | Database Job (DBMS_SCHEDULER) | PL/SQL | ORDS SQL endpoint / JDBC | 2 |
| 8 | Migration Script (DDL) | SQL | ORDS SQL endpoint / JDBC | 1 (first) |

### 1.2 Generation Pipeline

```
Specification Input
(PRD, natural language, or template)
       |
       v
  AI Generation (M4 + C17)
  - Parse specification
  - Select template (if template-based)
  - Generate code with M14 knowledge rules
  - Include utPLSQL test annotations (M13)
  - Include RF-XXX traceability comments
       |
       v
  Safety Check (M10 / C08)
  - Static analysis
  - SQL injection detection
  - Privilege escalation check
  - Naming convention validation
       |
       v
  Preview (diff visual)
  - Show generated code
  - Highlight changes vs existing code
  - Risk level indicator
  - Validation results
       |
       v
  User Review
  - Accept / Reject / Edit
       |
       v
  Apply via ORDS (through M10 Safety Engine)
  - Execute in dependency order
  - Compile and verify
  - Record in Change Manager (M6)
       |
       v
  Result
  - Compilation status
  - Change IDs
  - Generated test stubs
```

### 1.3 Preview with Diff Visual

Before applying generated code, users see a side-by-side diff view comparing the generated code against existing code (if any).

#### Preview Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| CF-R01 | Preview required | All generated code MUST be previewed before apply |
| CF-R02 | Preview expiry | Previews expire after 1 hour (must re-generate) |
| CF-R03 | Diff format | Unified diff format with syntax highlighting |
| CF-R04 | Risk indicator | Preview shows risk level (low/medium/high/critical) from Safety Engine |
| CF-R05 | Validation in preview | Syntax validation runs during preview (before apply) |

#### Preview Response

```typescript
interface CodePreview {
  previewId: string;
  artifacts: GeneratedCodeArtifact[];
  diffs: ArtifactDiff[];
  riskLevel: 'low' | 'medium' | 'high' | 'critical';
  validationResult: {
    valid: boolean;
    errors: { line: number; message: string }[];
    warnings: { line: number; message: string }[];
  };
  safetyCheck: {
    passed: boolean;
    findings: SafetyFinding[];
  };
  expiresAt: Date;               // 1 hour from creation
}

interface ArtifactDiff {
  artifactId: string;
  artifactName: string;
  existingCode: string | null;   // null if new artifact
  generatedCode: string;
  unifiedDiff: string;           // Unified diff format
  changeType: 'create' | 'modify';
}
```

### 1.4 Apply via ORDS through M10 Safety Engine

All code application flows through the AI Governance Safety Engine (M10) for final validation before execution.

#### Apply Sequence

```
Code Factory (C17)         Safety Engine (C08)        ORDS Client (C23)       Change Tracker (C10)
      |                          |                          |                        |
      |-- apply(previewId) ----->|                          |                        |
      |                          |-- final safety check --->|                        |
      |                          |                          |                        |
      |                          |  [IF check fails]        |                        |
      |<-- BLOCKED, findings ----|                          |                        |
      |                          |                          |                        |
      |                          |  [IF check passes]       |                        |
      |                          |-- execute SQL via ORDS -->|                        |
      |                          |                          |-- DDL/DML on Oracle --->|
      |                          |                          |<-- result --------------|
      |                          |                          |                        |
      |                          |-- record change -------->|----------------------->|
      |                          |                          |                        |
      |<-- CodeApplyResult ------|                          |                        |
```

#### Apply Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| CA-R01 | Dependency order | Artifacts applied in dependency order: DDL -> Jobs -> ORDS -> PL/SQL -> DA -> LOV -> Report -> Page |
| CA-R02 | Atomic rollback | If any artifact fails to compile, all applied artifacts in the batch are rolled back |
| CA-R03 | Compilation check | After each PL/SQL package apply, verify compilation status |
| CA-R04 | Change recording | Every applied artifact creates a change record in M6 |
| CA-R05 | Safety gate | If Safety Engine returns critical finding, apply is blocked |
| CA-R06 | Environment restriction | Apply only to DEV/QA environments; PROD requires Release Manager (M9) |

### 1.5 utPLSQL Comments in Generated PL/SQL Packages

All generated PL/SQL packages include utPLSQL test annotations as comments, enabling immediate test generation.

```sql
CREATE OR REPLACE PACKAGE BODY pkg_invoices AS

  -- %suite(Invoice Processing)
  -- %suitepath(app.invoices)

  PROCEDURE process_invoice(
    p_invoice_id IN NUMBER,
    p_amount     IN NUMBER,
    p_status     OUT VARCHAR2
  ) AS
    -- %test(Process valid invoice)
    -- %test(Reject negative amount)
    -- %test(Handle null invoice_id)
    -- RF-PRD-042: Invoice processing per Acuerdo 001 de 2024
  BEGIN
    -- Generated implementation
    ...
  END process_invoice;

END pkg_invoices;
/
```

### 1.6 Template-Based Generation with M18 Templates

The Code Factory can use templates from the Marketplace (M18) as generation blueprints.

```typescript
interface CodeTemplate {
  id: string;
  name: string;
  artifactType: ArtifactType;
  description: string;
  skeleton: string;              // Template with {{variable}} placeholders
  variables: TemplateVariable[];
  source: 'builtin' | 'marketplace';
  acceleratorId: string | null;  // Link to M18 accelerator
  domain: string | null;         // Domain (PREDIAL, ICA, etc.)
}

interface TemplateVariable {
  name: string;
  type: 'string' | 'number' | 'boolean' | 'enum';
  description: string;
  defaultValue: string | null;
  enumValues: string[] | null;
  required: boolean;
}
```

---

## 2. M18 -- Accelerators Marketplace

### 2.1 Base Accelerators

The Marketplace launches with 6 pre-built accelerators targeting Colombian government fiscal domains.

| # | Accelerator | Domain | Contents | Estimated Install Time |
|---|-------------|--------|----------|----------------------|
| 1 | Kit Predial | PREDIAL | DDL (12 tables), PL/SQL (8 packages), APEX pages (5), Reports (3), LOVs (10), Knowledge rules (40) | ~3 min |
| 2 | Kit ICA | ICA | DDL (10 tables), PL/SQL (6 packages), APEX pages (4), Reports (3), LOVs (8), Knowledge rules (35) | ~3 min |
| 3 | Dashboard Recaudo | TESORERIA | APEX pages (3 dashboard pages), Reports (6), PL/SQL (2 aggregation packages) | ~1 min |
| 4 | PQRS Ciudadano | Cross-domain | DDL (5 tables), PL/SQL (3 packages), APEX pages (4 public-facing), Workflow config | ~2 min |
| 5 | Kit Cobro Coactivo | CARTERA | DDL (8 tables), PL/SQL (5 packages), APEX pages (4), Reports (2), Knowledge rules (25) | ~2 min |
| 6 | Nomina Express | NOMINA | DDL (15 tables), PL/SQL (10 packages), APEX pages (6), Reports (4), Knowledge rules (30) | ~4 min |

### 2.2 Catalog with Filters

#### Catalog Entry

```typescript
interface AcceleratorCatalog {
  id: string;
  name: string;
  description: string;
  longDescription: string;
  domain: string;                // PREDIAL, ICA, TESORERIA, CARTERA, NOMINA, CROSS
  category: 'kit' | 'dashboard' | 'workflow' | 'integration' | 'template';
  type: 'template' | 'plugin' | 'rule_pack' | 'theme' | 'component';
  version: string;
  minApexVersion: string;       // Minimum APEX version required
  maxApexVersion: string | null; // Maximum APEX version (null = no max)
  publisher: string;
  publisherType: 'official' | 'community' | 'partner';
  rating: number;               // 0.0 - 5.0
  reviewCount: number;
  downloadCount: number;
  thumbnail: string;            // URL to thumbnail image
  screenshots: string[];        // URLs to screenshots
  tags: string[];
  installSize: number;          // Bytes
  price: 'free' | number;      // Free or price in USD
  createdAt: Date;
  updatedAt: Date;
}
```

#### Filter Options

| Filter | Type | Values |
|--------|------|--------|
| Domain | Select | PREDIAL, ICA, TESORERIA, CARTERA, NOMINA, CROSS |
| APEX Version | Select | 21.1, 22.1, 22.2, 23.1, 23.2, 24.1 |
| Category | Select | kit, dashboard, workflow, integration, template |
| Publisher Type | Select | official, community, partner |
| Rating | Range | 0-5 stars |
| Price | Select | free, paid |
| Search | Text | Full-text search on name, description, tags |
| Sort | Select | popularity, rating, date, name |

### 2.3 One-Click Install with Compatibility Validation

#### Installation Flow

```
User                    Marketplace (C20)        Compatibility        ORDS Client (C23)
  |                          |                     Checker                  |
  |-- install(accId) ------->|                       |                     |
  |                          |-- check version ----->|                     |
  |                          |<-- result ------------|                     |
  |                          |                       |                     |
  |                          |  [IF incompatible]    |                     |
  |<-- BLOCKED, reasons -----|                       |                     |
  |                          |                       |                     |
  |                          |  [IF compatible]      |                     |
  |                          |-- extract package     |                     |
  |                          |-- dependency order    |                     |
  |                          |-- execute artifacts --|-------------------->|
  |                          |                       |     DDL first       |
  |                          |                       |     then PL/SQL     |
  |                          |                       |     then APEX       |
  |                          |<-- results -----------|---------------------|
  |                          |                       |                     |
  |                          |  [IF any failure]     |                     |
  |                          |-- rollback all -------|-------------------->|
  |<-- FAILED, rolled back --|                       |                     |
  |                          |                       |                     |
  |                          |  [IF all succeed]     |                     |
  |                          |-- record install      |                     |
  |<-- InstallResult --------|                       |                     |
```

#### Installation Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| MI-R01 | Version check first | APEX version compatibility MUST be validated before installation |
| MI-R02 | Dependency order | Install artifacts in order: DDL -> PL/SQL -> ORDS -> APEX pages |
| MI-R03 | Atomic installation | If any artifact fails, rollback all previously installed artifacts |
| MI-R04 | Rollback record | Every installation creates a rollback manifest for uninstall |
| MI-R05 | Single install | An accelerator can only be installed once per application |
| MI-R06 | Knowledge rules | Knowledge rules from accelerator are imported with status = 'active' |
| MI-R07 | Install log | Full installation log recorded for troubleshooting |

### 2.4 Rollback on Installation Failure

When an installation fails partway through, the system automatically rolls back all applied artifacts using the rollback manifest created during installation.

```typescript
interface RollbackManifest {
  installId: string;
  acceleratorId: string;
  appId: number;
  appliedArtifacts: AppliedArtifact[];
  rollbackScripts: string[];     // Reverse-order rollback SQL
  createdAt: Date;
}

interface AppliedArtifact {
  artifactType: ArtifactType;
  objectName: string;
  appliedAt: Date;
  rollbackSql: string;          // DROP/DELETE statement
}
```

### 2.5 Publisher Role for Custom Accelerators

Users with the `marketplace_publisher` role can create and publish custom accelerators.

#### Publishing Flow

```
Publisher                  Marketplace (C20)        Review Queue         Admin
    |                          |                       |                  |
    |-- submit(package) ------>|                       |                  |
    |                          |-- validate package -->|                  |
    |                          |   (structure, meta)   |                  |
    |                          |                       |                  |
    |                          |  [IF invalid]         |                  |
    |<-- REJECTED, errors -----|                       |                  |
    |                          |                       |                  |
    |                          |  [IF valid]           |                  |
    |                          |-- queue for review -->|                  |
    |<-- pending_review -------|                       |                  |
    |                          |                       |                  |
    |                          |                       |-- notify admin -->|
    |                          |                       |                  |
    |                          |                       |<-- approve/reject-|
    |                          |<-- decision ----------|                  |
    |<-- published / rejected -|                       |                  |
```

### 2.6 Reviews and Ratings

```typescript
interface AcceleratorReview {
  id: string;
  accelerator_id: string;
  tenant_id: string;
  user_id: string;
  rating: number;                // 1-5
  title: string;
  comment: string;
  helpful_count: number;
  created_at: Date;
  updated_at: Date;
}
```

#### Review Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| RV-R01 | One review per user | Each user can submit only one review per accelerator |
| RV-R02 | Must install first | User must have installed the accelerator to review it |
| RV-R03 | Rating required | Rating (1-5) is mandatory; comment is optional |
| RV-R04 | Rating recalculation | Accelerator average rating recalculated on each new/updated review |
| RV-R05 | No self-review | Publisher cannot review their own accelerator |

---

## 3. Data Models

### 3.1 Code Factory Tables

Code Factory uses `code_gen_history` for tracking generation requests (stored alongside existing AI Studio tables). The primary code generation entities reuse the existing `changes` table from M6 for applied artifacts.

#### `code_gen_previews`

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Preview ID |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant scope |
| artifact_type | VARCHAR(30) | NOT NULL | Artifact type |
| name | VARCHAR(200) | NOT NULL | Artifact name |
| specification | TEXT | NOT NULL | Input specification |
| generated_code | TEXT | NOT NULL | Generated code |
| existing_code | TEXT | | Existing code (for diff) |
| unified_diff | TEXT | | Computed diff |
| template_id | UUID | | Template used |
| risk_level | VARCHAR(10) | CHECK IN ('low', 'medium', 'high', 'critical') | Safety assessment |
| safety_passed | BOOLEAN | NOT NULL | Safety check result |
| safety_findings | JSONB | DEFAULT '[]' | Safety findings |
| validation_result | JSONB | DEFAULT '{}' | Syntax validation |
| app_id | INTEGER | NOT NULL | Target application |
| connection_id | UUID | FK connections(id), NOT NULL | Target connection |
| tokens_input | INTEGER | | AI input tokens |
| tokens_output | INTEGER | | AI output tokens |
| status | VARCHAR(20) | DEFAULT 'pending', CHECK IN ('pending', 'applied', 'rejected', 'expired') | Preview status |
| expires_at | TIMESTAMPTZ | NOT NULL | 1 hour from creation |
| created_by | UUID | FK users(id) | Requestor |
| created_at | TIMESTAMPTZ | DEFAULT now() | Creation timestamp |

**Indexes**: `(tenant_id, app_id, created_at DESC)`, `(status, expires_at)`
**RLS**: `tenant_id = current_setting('app.current_tenant')`

#### `code_templates`

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Template ID |
| tenant_id | UUID | FK tenants(id) | Tenant scope (null = global) |
| name | VARCHAR(200) | NOT NULL | Template name |
| artifact_type | VARCHAR(30) | NOT NULL | Target artifact type |
| description | TEXT | | Template description |
| skeleton | TEXT | NOT NULL | Template with placeholders |
| variables | JSONB | DEFAULT '[]' | Variable definitions |
| source | VARCHAR(20) | DEFAULT 'builtin', CHECK IN ('builtin', 'marketplace', 'custom') | Template origin |
| accelerator_id | UUID | FK accelerators(id) | Source accelerator |
| domain | VARCHAR(20) | | Associated domain |
| is_active | BOOLEAN | DEFAULT true | Active flag |
| created_at | TIMESTAMPTZ | DEFAULT now() | Creation timestamp |
| updated_at | TIMESTAMPTZ | DEFAULT now() | Last update |

**Indexes**: `(tenant_id, artifact_type)`, `(source)`
**RLS**: `tenant_id = current_setting('app.current_tenant') OR tenant_id IS NULL`

### 3.2 Marketplace Tables

#### `accelerators`

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Accelerator ID |
| name | VARCHAR(200) | NOT NULL | Accelerator name |
| description | TEXT | NOT NULL | Short description |
| long_description | TEXT | | Detailed description |
| domain | VARCHAR(20) | NOT NULL | Target domain |
| category | VARCHAR(20) | NOT NULL, CHECK IN ('kit', 'dashboard', 'workflow', 'integration', 'template') | Category |
| type | VARCHAR(20) | NOT NULL, CHECK IN ('template', 'plugin', 'rule_pack', 'theme', 'component') | Type |
| version | VARCHAR(20) | NOT NULL | Semantic version |
| min_apex_version | VARCHAR(10) | NOT NULL | Minimum APEX version |
| max_apex_version | VARCHAR(10) | | Maximum APEX version |
| publisher_tenant_id | UUID | FK tenants(id), NOT NULL | Publisher tenant |
| publisher_user_id | UUID | FK users(id), NOT NULL | Publisher user |
| publisher_type | VARCHAR(20) | DEFAULT 'community', CHECK IN ('official', 'community', 'partner') | Publisher type |
| package_data | BYTEA | | Compressed package binary |
| package_hash | VARCHAR(64) | | SHA-256 hash of package |
| install_size | INTEGER | | Package size in bytes |
| thumbnail_url | VARCHAR(500) | | Thumbnail image URL |
| screenshots | TEXT[] | DEFAULT '{}' | Screenshot URLs |
| tags | TEXT[] | DEFAULT '{}' | Searchable tags |
| rating_avg | DECIMAL(3,2) | DEFAULT 0 | Average rating (0-5) |
| review_count | INTEGER | DEFAULT 0 | Number of reviews |
| download_count | INTEGER | DEFAULT 0 | Install count |
| price | DECIMAL(10,2) | DEFAULT 0 | Price in USD (0 = free) |
| status | VARCHAR(20) | DEFAULT 'pending_review', CHECK IN ('pending_review', 'published', 'rejected', 'deprecated') | Publication status |
| changelog | JSONB | DEFAULT '[]' | Version changelog |
| readme | TEXT | | README content |
| review_feedback | TEXT | | Admin review feedback |
| published_at | TIMESTAMPTZ | | Publication timestamp |
| created_at | TIMESTAMPTZ | DEFAULT now() | Creation timestamp |
| updated_at | TIMESTAMPTZ | DEFAULT now() | Last update |

**Indexes**: `(status) WHERE status = 'published'`, `(domain, category)`, `(tags)` GIN, `(rating_avg DESC)`, `(download_count DESC)`
**No RLS** (marketplace is platform-wide for published accelerators)

#### `accelerator_installs`

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Install ID |
| tenant_id | UUID | FK tenants(id), NOT NULL | Installing tenant |
| accelerator_id | UUID | FK accelerators(id), NOT NULL | Installed accelerator |
| app_id | INTEGER | NOT NULL | Target application |
| version | VARCHAR(20) | NOT NULL | Installed version |
| status | VARCHAR(20) | NOT NULL, CHECK IN ('installing', 'installed', 'failed', 'uninstalled') | Install status |
| rollback_manifest | JSONB | | Rollback data |
| install_log | TEXT | | Installation log |
| installed_by | UUID | FK users(id) | User who installed |
| installed_at | TIMESTAMPTZ | DEFAULT now() | Install timestamp |
| uninstalled_at | TIMESTAMPTZ | | Uninstall timestamp |

**Indexes**: `(tenant_id, accelerator_id, app_id)` UNIQUE WHERE `status = 'installed'`, `(tenant_id, app_id)`
**RLS**: `tenant_id = current_setting('app.current_tenant')`

#### `accelerator_reviews`

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Review ID |
| tenant_id | UUID | FK tenants(id), NOT NULL | Reviewer tenant |
| accelerator_id | UUID | FK accelerators(id), NOT NULL | Reviewed accelerator |
| user_id | UUID | FK users(id), NOT NULL | Reviewer |
| rating | INTEGER | NOT NULL, CHECK BETWEEN 1 AND 5 | Star rating |
| title | VARCHAR(200) | | Review title |
| comment | TEXT | | Review text |
| helpful_count | INTEGER | DEFAULT 0 | Helpful votes |
| created_at | TIMESTAMPTZ | DEFAULT now() | Creation timestamp |
| updated_at | TIMESTAMPTZ | DEFAULT now() | Last update |

**Indexes**: `(accelerator_id, created_at DESC)`, `(tenant_id, user_id, accelerator_id)` UNIQUE
**RLS**: `tenant_id = current_setting('app.current_tenant')` for write; no RLS for read (reviews are public)

---

## 4. Error Codes

| Error Code | HTTP | Condition |
|------------|------|-----------|
| CODEGEN_PREVIEW_NOT_FOUND | 404 | Preview ID does not exist |
| CODEGEN_PREVIEW_EXPIRED | 410 | Preview has expired (> 1 hour) |
| CODEGEN_SAFETY_BLOCKED | 422 | Safety Engine blocked the generation |
| CODEGEN_APPLY_FAILED | 500 | Artifact failed to compile/apply |
| CODEGEN_ROLLBACK_FAILED | 500 | Rollback after apply failure also failed |
| CODEGEN_TEMPLATE_NOT_FOUND | 404 | Template ID does not exist |
| CODEGEN_INVALID_ARTIFACT_TYPE | 422 | Unsupported artifact type |
| MARKETPLACE_ACCELERATOR_NOT_FOUND | 404 | Accelerator ID does not exist |
| MARKETPLACE_INCOMPATIBLE_VERSION | 422 | APEX version incompatible |
| MARKETPLACE_ALREADY_INSTALLED | 409 | Accelerator already installed on app |
| MARKETPLACE_INSTALL_FAILED | 500 | Installation failed (auto-rolled back) |
| MARKETPLACE_NOT_INSTALLED | 404 | Accelerator not installed on app |
| MARKETPLACE_REVIEW_EXISTS | 409 | User already reviewed this accelerator |
| MARKETPLACE_REVIEW_NOT_INSTALLED | 403 | Must install before reviewing |
| MARKETPLACE_SELF_REVIEW | 403 | Publisher cannot review own accelerator |
| MARKETPLACE_PUBLISH_INVALID_PACKAGE | 422 | Package structure validation failed |

---

## 5. API Endpoints

### 5.1 M16 Code Factory Endpoints

| Method | Path | Auth | Description |
|--------|------|------|-------------|
| POST | `/api/v1/code-factory/generate` | authorize(['admin', 'developer', 'tech_lead']) | Generate code (returns preview) |
| GET | `/api/v1/code-factory/preview/:id` | authenticate() | Get preview details |
| POST | `/api/v1/code-factory/preview/:id/apply` | authorize(['admin', 'developer', 'tech_lead']) | Apply previewed code |
| POST | `/api/v1/code-factory/preview/:id/reject` | authenticate() | Reject preview |
| POST | `/api/v1/code-factory/batch` | authorize(['admin', 'tech_lead']) | Batch generate multiple artifacts |
| GET | `/api/v1/code-factory/history` | authenticate() | Generation history |
| GET | `/api/v1/code-factory/templates` | authenticate() | List available templates |
| GET | `/api/v1/code-factory/templates/:id` | authenticate() | Get template details |

### 5.2 M18 Marketplace Endpoints

| Method | Path | Auth | Description |
|--------|------|------|-------------|
| GET | `/api/v1/marketplace/catalog` | authenticate() | Browse catalog with filters |
| GET | `/api/v1/marketplace/catalog/:id` | authenticate() | Get accelerator details |
| POST | `/api/v1/marketplace/catalog/:id/install` | authorize(['admin', 'developer', 'tech_lead']) | Install accelerator |
| POST | `/api/v1/marketplace/catalog/:id/uninstall` | authorize(['admin', 'tech_lead']) | Uninstall accelerator |
| POST | `/api/v1/marketplace/catalog/:id/check-compatibility` | authenticate() | Check version compatibility |
| GET | `/api/v1/marketplace/installs` | authenticate() | List installations for tenant |
| GET | `/api/v1/marketplace/installs/:id` | authenticate() | Get install details |
| GET | `/api/v1/marketplace/reviews/:acceleratorId` | authenticate() | Get reviews for accelerator |
| POST | `/api/v1/marketplace/reviews/:acceleratorId` | authenticate() | Submit review |
| PATCH | `/api/v1/marketplace/reviews/:reviewId` | authenticate() | Update own review |
| DELETE | `/api/v1/marketplace/reviews/:reviewId` | authenticate() | Delete own review |
| POST | `/api/v1/marketplace/publish` | authorize(['admin', 'marketplace_publisher']) | Publish accelerator |
| GET | `/api/v1/marketplace/my-packages` | authorize(['marketplace_publisher']) | List own published packages |
| GET | `/api/v1/marketplace/my-packages/:id/analytics` | authorize(['marketplace_publisher']) | Publisher analytics |
| POST | `/api/v1/marketplace/admin/review/:id` | authorize(['admin']) | Approve/reject submitted accelerator |

---

## 6. Events Emitted

| Event | Trigger | Payload |
|-------|---------|---------|
| `CODE_GENERATED` | Code generation preview created | `{ previewId, artifactType, appId, riskLevel }` |
| `CODE_APPLIED` | Code applied successfully | `{ previewId, artifactType, changeIds }` |
| `CODE_APPLY_FAILED` | Code application failed | `{ previewId, artifactType, error }` |
| `CODE_SAFETY_BLOCKED` | Safety Engine blocked generation | `{ previewId, findings }` |
| `ACCELERATOR_INSTALLED` | Accelerator installed | `{ installId, acceleratorId, appId }` |
| `ACCELERATOR_INSTALL_FAILED` | Installation failed | `{ acceleratorId, appId, error }` |
| `ACCELERATOR_UNINSTALLED` | Accelerator uninstalled | `{ installId, acceleratorId, appId }` |
| `ACCELERATOR_PUBLISHED` | Accelerator published to catalog | `{ acceleratorId, name, publisher }` |
| `ACCELERATOR_REVIEW_SUBMITTED` | Review submitted | `{ acceleratorId, rating, userId }` |

---

## 7. Non-Functional Considerations

| Aspect | Requirement |
|--------|-------------|
| Code generation time | < 30 seconds for single artifact, < 120 seconds for batch |
| Preview expiry | 1 hour |
| Safety check latency | < 5 seconds |
| Artifact apply timeout | 30 seconds per artifact |
| Marketplace catalog search | < 500ms response time |
| Accelerator install timeout | Max 5 minutes |
| Rollback on failure | Automatic, < 30 seconds |
| Package upload max size | 50 MB |
| Review rating precision | Integer 1-5 |
| Catalog page size | 20 items per page, max 100 |
