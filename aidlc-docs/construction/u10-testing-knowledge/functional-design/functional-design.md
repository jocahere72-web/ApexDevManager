# Functional Design -- U10: Testing & Knowledge

## Document Information

| Field | Value |
|-------|-------|
| **Unit** | U10 -- Testing & Knowledge |
| **Sprint** | S9 (Fase 2, Weeks 20-21) |
| **Duration** | 2 weeks |
| **Modules** | M13 (Test Automation Studio) + M14 (GENESYS Knowledge Engine) |
| **Stories** | US-031, US-032, US-033, US-055, US-034, US-035, US-056 |
| **Components** | C12 (Test Runner), C09 (Knowledge Engine), C13 (Impact Analyzer -- consumed) |
| **Status** | AI-DLC Generated -- For Review |
| **Date** | 2026-04-10 |

---

## 1. M13 -- Test Automation Studio

### 1.1 Test Type Taxonomy

The Test Automation Studio supports five categories of automated testing for Oracle APEX applications, each targeting a different layer of application quality.

| Test Type | Framework | Scope | Execution Target |
|-----------|-----------|-------|------------------|
| Unit PL/SQL | utPLSQL | Individual PL/SQL packages, procedures, functions | Oracle DB via ORDS/JDBC |
| Integration APEX | APEX-native + ORDS | Cross-component interactions (page processes, computations, DAs) | APEX runtime via ORDS |
| Regression | utPLSQL + APEX | Subset of existing tests selected by M11 impact graph | Oracle DB + APEX |
| Smoke | utPLSQL + APEX | Minimal suite validating deployment health | Oracle DB + APEX |
| Security | Custom SQL + ORDS | Privilege escalation, SQL injection, XSS in page items | Oracle DB + APEX |

### 1.2 AI-Generated Test Cases

The AI Studio (M4) analyzes PL/SQL source code to generate test cases automatically. The generation pipeline follows this flow:

```
PL/SQL Source Code
       |
       v
  Code Analyzer (M4)
  - Parse package spec/body
  - Identify public methods
  - Extract parameter types
  - Detect boundary conditions
  - Identify exception handlers
       |
       v
  Test Case Generator (M4 + C12)
  - Positive path tests
  - Null parameter tests
  - Boundary value tests
  - Exception path tests
  - Concurrency tests (if applicable)
       |
       v
  utPLSQL Test Package
  - %suitepath annotation
  - %test annotations
  - %beforeall / %afterall setup
  - Assertion statements
       |
       v
  Review & Edit (UI)
       |
       v
  Save to test_cases table
```

#### AI Generation Request

```typescript
interface TestGenRequest {
  packageName: string;
  schemaName: string;
  connectionId: string;
  appId: number;
  testTypes: ('positive' | 'negative' | 'boundary' | 'null' | 'exception')[];
  coverageTarget: number;       // 0-100, target coverage %
  includeTestData: boolean;     // Generate INSERT scripts for test data
}
```

#### AI Generation Response

```typescript
interface TestGenResult {
  generatedTests: GeneratedTest[];
  estimatedCoverage: number;
  testDataScripts: string[];    // INSERT statements
  warnings: string[];
}

interface GeneratedTest {
  testName: string;
  testType: 'positive' | 'negative' | 'boundary' | 'null' | 'exception';
  description: string;
  utplsqlCode: string;
  targetProcedure: string;
  assertions: { expected: string; actual: string }[];
}
```

### 1.3 Test Suites with Smoke Designation

Test suites group test cases and support a `is_smoke` flag. Smoke suites are executed automatically after every deployment as a health check.

#### Test Suite Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| TEST-R01 | Suite naming | `TS_{APP_ID}_{TYPE}_{NAME}` (e.g., `TS_100_UNIT_PKG_INVOICES`) |
| TEST-R02 | Smoke designation | Suites marked `is_smoke = true` run after every deployment |
| TEST-R03 | Smoke time limit | Smoke suites must complete within 60 seconds |
| TEST-R04 | Suite ownership | Each suite belongs to exactly one application |
| TEST-R05 | Requirement linkage | Test cases can be linked to RF-XXX requirement IDs |
| TEST-R06 | Tag-based selection | Test cases support tags for selective execution |
| TEST-R07 | Parallel execution | Suites can opt into parallel test execution |

### 1.4 Test Runs with Pass/Fail/Skip Tracking

#### Test Run Sequence

```
User / CI Pipeline           Test Runner (C12)            Oracle DB (via ORDS/JDBC)
       |                          |                              |
       |-- runTestSuite(req) ---->|                              |
       |                          |-- resolve test cases ------->|
       |                          |<-- test case list -----------|
       |                          |                              |
       |                          |-- FOR EACH test case:        |
       |                          |   |-- execute utPLSQL ------>|
       |                          |   |<-- result + assertions --|
       |                          |   |-- record result -------->|  (test_results)
       |                          |                              |
       |                          |-- compute coverage --------->|
       |                          |<-- coverage data ------------|
       |                          |                              |
       |                          |-- check quality gates ------>|
       |                          |<-- gate results -------------|
       |                          |                              |
       |<-- TestRunResult --------|                              |
```

#### Test Result Statuses

| Status | Condition |
|--------|-----------|
| `passed` | All assertions satisfied, no exceptions |
| `failed` | One or more assertions not satisfied |
| `errored` | Unexpected exception during execution |
| `skipped` | Precondition not met or manually skipped |

### 1.5 Quality Gate: Block PROD Deployment

Quality gates integrate with the Release Manager (M9) to block production promotions when test coverage or pass rate falls below configured thresholds.

#### Quality Gate Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| QG-R01 | Coverage threshold | Configurable per application (default: 70%) |
| QG-R02 | Pass rate threshold | Configurable per application (default: 95%) |
| QG-R03 | No critical failures | Zero test cases with `severity = 'critical'` in `failed` status |
| QG-R04 | Smoke must pass | All smoke suites must pass before PROD promotion |
| QG-R05 | Tech Lead override | Tech Lead can justify and bypass a failed gate; justification logged in audit_events |
| QG-R06 | Gate check event | `QUALITY_GATE_CHECKED` event emitted with pass/fail + details |
| QG-R07 | Block mechanism | Release Engine (C11) queries `checkQualityGates(runId)` before allowing PROD deployment |

#### Tech Lead Justification Flow

```
Tech Lead               Release Engine (C11)         Test Runner (C12)        Audit
    |                          |                          |                     |
    |-- approve release ------>|                          |                     |
    |                          |-- checkQualityGates ---->|                     |
    |                          |<-- { passed: false } ----|                     |
    |                          |                          |                     |
    |<-- GATE FAILED ----------|                          |                     |
    |   "Tests failed. Provide |                          |                     |
    |    justification to      |                          |                     |
    |    override."            |                          |                     |
    |                          |                          |                     |
    |-- override(reason) ----->|                          |                     |
    |                          |-- log override -------------------------------->|
    |                          |-- proceed deployment     |                     |
    |<-- release approved -----|                          |                     |
```

### 1.6 Regression Test Selection from M11 Impact Graph

When a code change is recorded, the Dependency Analyzer (M11/C13) provides a list of affected components. The Test Runner uses this to select regression tests.

#### Regression Selection Algorithm

```typescript
async function selectRegressionTests(changeId: string): Promise<string[]> {
  // 1. Get impact report from M11
  const impact = await impactAnalyzer.getRegressionPlan(changeId);

  // 2. Collect all affected component IDs
  const affectedIds = impact.testSuites;

  // 3. Find test cases linked to affected components
  // SELECT tc.* FROM test_cases tc
  //   JOIN test_case_components tcc ON tc.id = tcc.test_case_id
  //   WHERE tcc.component_id = ANY($affectedIds)
  //   AND tc.is_active = true

  // 4. Add smoke tests
  // 5. Deduplicate and return ordered test list
  return selectedTestIds;
}
```

---

## 2. M14 -- GENESYS Knowledge Engine

### 2.1 Domain Architecture

The GENESYS Knowledge Engine manages domain-specific rules for 5 Colombian government fiscal domains. Each domain encapsulates business rules, legal references, and operational procedures that enrich AI Studio context.

| Domain | Code | Description | Rule Count (Initial) |
|--------|------|-------------|---------------------|
| Predial | `PREDIAL` | Property tax (impuesto predial) management | ~40 |
| ICA | `ICA` | Industry and commerce tax (Industria y Comercio) | ~35 |
| Tesoreria | `TESORERIA` | Treasury and cash management | ~30 |
| Cartera | `CARTERA` | Portfolio and accounts receivable | ~25 |
| Nomina | `NOMINA` | Payroll and human resources | ~30 |

### 2.2 Rule Management (CRUD, Versioning)

#### Rule Entity

```typescript
interface KnowledgeRule {
  id: string;                    // UUID
  domain: KnowledgeDomain;
  category: string;              // Sub-category within domain
  name: string;
  description: string;
  content: string;               // Rule text / business logic description
  normativeSource: string;       // MANDATORY: Legal reference (ley, decreto, acuerdo)
  normativeArticle: string;      // Specific article or section
  priority: number;              // 1-10
  tags: string[];
  applicableVersions: string[];  // APEX versions where rule applies
  status: RuleStatus;
  version: number;               // Auto-incremented on each update
  previousVersionId: string | null;
  createdBy: string;
  approvedBy: string | null;
  createdAt: Date;
  updatedAt: Date;
}

type KnowledgeDomain = 'PREDIAL' | 'ICA' | 'TESORERIA' | 'CARTERA' | 'NOMINA';

type RuleStatus = 'draft' | 'pending_approval' | 'active' | 'deprecated';
```

#### Rule Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| KR-R01 | Normative source required | Every rule MUST have a `normativeSource` (legal reference) |
| KR-R02 | Version on update | Each update creates a new version; previous version linked via `previousVersionId` |
| KR-R03 | No delete of active | Active rules cannot be deleted; they must be deprecated first |
| KR-R04 | Domain required | Every rule must belong to exactly one domain |
| KR-R05 | Priority range | Priority must be 1-10 (10 = highest) |
| KR-R06 | Unique name per domain | Rule name must be unique within its domain |
| KR-R07 | Content max length | Rule content must not exceed 10,000 characters |

### 2.3 Approval Workflow

Rules follow a lifecycle from draft to active status, requiring review and approval before they become available to the AI Studio.

```
  +-------+     submit()     +------------------+    approve()    +--------+
  | draft | --------------->| pending_approval | ------------->| active |
  +-------+                 +------------------+               +--------+
      ^                           |                                |
      |         reject()          |          deprecate()           |
      +---------------------------+            +------------------+
                                               |
                                               v
                                         +------------+
                                         | deprecated |
                                         +------------+
```

#### Approval Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| KA-R01 | Self-approval forbidden | Creator cannot approve their own rule |
| KA-R02 | Approval roles | Only `admin`, `tech_lead`, or `knowledge_editor` can approve |
| KA-R03 | Rejection requires reason | Rejecting a rule sets status back to `draft` with a rejection comment |
| KA-R04 | Approval event | `KNOWLEDGE_RULE_APPROVED` event emitted on approval |
| KA-R05 | Deprecation reason | Deprecating a rule requires a reason (e.g., superseded by new regulation) |
| KA-R06 | Active rules only in context | Only `active` rules are injected into AI Studio context |

### 2.4 Context Enrichment for AI Studio

When the AI Studio (M4) processes a request, the Knowledge Engine provides relevant domain rules to enrich the context window.

#### Context Enrichment Flow

```
AI Studio (M4)              Knowledge Engine (C09)         PostgreSQL
     |                            |                            |
     |-- getRelevantRules({       |                            |
     |     domain: 'PREDIAL',     |                            |
     |     componentType: 'pkg',  |                            |
     |     tags: ['impuesto']     |                            |
     |   }) ---------------------->|                            |
     |                            |-- query active rules ------>|
     |                            |   WHERE domain = 'PREDIAL'  |
     |                            |   AND status = 'active'     |
     |                            |   AND tags @> '{impuesto}'  |
     |                            |   ORDER BY priority DESC    |
     |                            |<-- matching rules ----------|
     |                            |                            |
     |<-- Rule[] ----------------|                            |
     |                            |                            |
     |-- enrichContext(ctx, rules) |                            |
     |   Inject rules into        |                            |
     |   context window as        |                            |
     |   system instructions      |                            |
```

### 2.5 Domain Classification

The Knowledge Engine uses AI-based classification to auto-detect the domain of incoming requests with >85% accuracy target.

#### Classification Logic

```typescript
interface DomainClassification {
  domain: KnowledgeDomain;
  confidence: number;           // 0.0 - 1.0 (must be > 0.85)
  alternativeDomains: { domain: KnowledgeDomain; confidence: number }[];
  classificationMethod: 'keyword' | 'ai' | 'explicit';
}

// Classification priority:
// 1. Explicit domain from user request (confidence = 1.0)
// 2. AI-based NLP classification (confidence varies)
// 3. Keyword matching fallback (confidence = 0.7-0.9)
```

#### Classification Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| KC-R01 | Confidence threshold | Domain must be classified with >85% confidence to auto-apply |
| KC-R02 | Ambiguous classification | If confidence < 85%, prompt user to confirm domain |
| KC-R03 | Multi-domain support | A request can span multiple domains; all relevant rules are included |
| KC-R04 | Fallback | If classification fails entirely, use all active rules (performance penalty accepted) |

---

## 3. Data Models

### 3.1 Test Automation Tables

#### `test_suites`

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Suite identifier |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant scope |
| app_id | INTEGER | NOT NULL | Target APEX application ID |
| name | VARCHAR(200) | NOT NULL | Suite display name |
| description | TEXT | | Suite description |
| type | VARCHAR(20) | NOT NULL, CHECK IN ('unit', 'integration', 'regression', 'smoke', 'security') | Test type |
| is_smoke | BOOLEAN | DEFAULT false | Auto-run after deployment |
| tags | TEXT[] | DEFAULT '{}' | Filterable tags |
| parallel_execution | BOOLEAN | DEFAULT false | Allow parallel test execution |
| timeout_seconds | INTEGER | DEFAULT 300 | Max execution time |
| is_active | BOOLEAN | DEFAULT true | Soft enable/disable |
| created_by | UUID | FK users(id) | Creator |
| created_at | TIMESTAMPTZ | DEFAULT now() | Creation timestamp |
| updated_at | TIMESTAMPTZ | DEFAULT now() | Last update timestamp |

**Indexes**: `(tenant_id, app_id)`, `(tenant_id, type)`, `(is_smoke) WHERE is_active = true`
**RLS**: `tenant_id = current_setting('app.current_tenant')`

#### `test_cases`

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Test case identifier |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant scope |
| suite_id | UUID | FK test_suites(id), NOT NULL | Parent suite |
| name | VARCHAR(200) | NOT NULL | Test name |
| description | TEXT | | Test description |
| type | VARCHAR(20) | NOT NULL, CHECK IN ('unit', 'integration', 'e2e') | Test case type |
| code | TEXT | NOT NULL | utPLSQL test code |
| target_package | VARCHAR(128) | | PL/SQL package under test |
| target_procedure | VARCHAR(128) | | Specific procedure under test |
| requirement_id | VARCHAR(20) | | Linked RF-XXX requirement |
| severity | VARCHAR(10) | DEFAULT 'normal', CHECK IN ('critical', 'major', 'normal', 'minor') | Test severity |
| tags | TEXT[] | DEFAULT '{}' | Filterable tags |
| expected_duration_ms | INTEGER | | Expected execution time |
| is_active | BOOLEAN | DEFAULT true | Soft enable/disable |
| last_run_status | VARCHAR(10) | CHECK IN ('passed', 'failed', 'errored', 'skipped') | Cached last result |
| last_run_at | TIMESTAMPTZ | | Cached last run time |
| generated_by_ai | BOOLEAN | DEFAULT false | AI-generated flag |
| created_by | UUID | FK users(id) | Creator |
| created_at | TIMESTAMPTZ | DEFAULT now() | Creation timestamp |
| updated_at | TIMESTAMPTZ | DEFAULT now() | Last update timestamp |

**Indexes**: `(tenant_id, suite_id)`, `(requirement_id)`, `(target_package)`
**RLS**: `tenant_id = current_setting('app.current_tenant')`

#### `test_runs`

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Run identifier |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant scope |
| suite_id | UUID | FK test_suites(id) | Suite executed (null if ad-hoc) |
| app_id | INTEGER | NOT NULL | Target application |
| environment_id | UUID | FK connections(id), NOT NULL | Execution environment |
| status | VARCHAR(20) | NOT NULL, CHECK IN ('queued', 'running', 'completed', 'failed', 'cancelled') | Run status |
| total_tests | INTEGER | DEFAULT 0 | Total test count |
| passed | INTEGER | DEFAULT 0 | Passed count |
| failed | INTEGER | DEFAULT 0 | Failed count |
| errored | INTEGER | DEFAULT 0 | Errored count |
| skipped | INTEGER | DEFAULT 0 | Skipped count |
| coverage_percentage | DECIMAL(5,2) | | Code coverage % |
| duration_ms | INTEGER | | Total execution time |
| triggered_by | VARCHAR(20) | CHECK IN ('manual', 'ci_pipeline', 'deployment', 'regression') | Trigger source |
| started_at | TIMESTAMPTZ | | Execution start time |
| completed_at | TIMESTAMPTZ | | Execution end time |
| started_by | UUID | FK users(id) | User who triggered |
| created_at | TIMESTAMPTZ | DEFAULT now() | Record creation |

**Indexes**: `(tenant_id, app_id, created_at DESC)`, `(tenant_id, suite_id)`, `(status) WHERE status IN ('queued', 'running')`
**RLS**: `tenant_id = current_setting('app.current_tenant')`
**Partitioning**: Monthly by `created_at`

#### `test_results`

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Result identifier |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant scope |
| run_id | UUID | FK test_runs(id), NOT NULL | Parent run |
| test_case_id | UUID | FK test_cases(id), NOT NULL | Executed test case |
| status | VARCHAR(10) | NOT NULL, CHECK IN ('passed', 'failed', 'errored', 'skipped') | Result status |
| duration_ms | INTEGER | | Execution time |
| error_message | TEXT | | Error message (if failed/errored) |
| stack_trace | TEXT | | Stack trace (if errored) |
| assertions | JSONB | DEFAULT '[]' | Array of `{ expected, actual, passed }` |
| output_log | TEXT | | DBMS_OUTPUT captured |
| created_at | TIMESTAMPTZ | DEFAULT now() | Record creation |

**Indexes**: `(run_id)`, `(test_case_id, created_at DESC)`
**RLS**: `tenant_id = current_setting('app.current_tenant')`
**Partitioning**: Monthly by `created_at`

### 3.2 Knowledge Engine Tables

#### `knowledge_domains`

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Domain identifier |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant scope |
| code | VARCHAR(20) | NOT NULL | Domain code (PREDIAL, ICA, etc.) |
| name | VARCHAR(100) | NOT NULL | Display name |
| description | TEXT | | Domain description |
| icon | VARCHAR(50) | | UI icon identifier |
| rule_count | INTEGER | DEFAULT 0 | Cached rule count |
| is_active | BOOLEAN | DEFAULT true | Active flag |
| created_at | TIMESTAMPTZ | DEFAULT now() | Creation timestamp |
| updated_at | TIMESTAMPTZ | DEFAULT now() | Last update timestamp |

**Indexes**: `(tenant_id, code)` UNIQUE
**RLS**: `tenant_id = current_setting('app.current_tenant')`

#### `knowledge_rules`

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Rule identifier |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant scope |
| domain_id | UUID | FK knowledge_domains(id), NOT NULL | Parent domain |
| name | VARCHAR(200) | NOT NULL | Rule name |
| description | TEXT | | Rule description |
| content | TEXT | NOT NULL, CHECK length <= 10000 | Rule text |
| normative_source | VARCHAR(500) | NOT NULL | Legal reference (ley, decreto, acuerdo) |
| normative_article | VARCHAR(200) | | Specific article/section |
| category | VARCHAR(100) | | Sub-category |
| priority | INTEGER | NOT NULL, CHECK BETWEEN 1 AND 10 | Priority (10 = highest) |
| tags | TEXT[] | DEFAULT '{}' | Searchable tags |
| applicable_versions | TEXT[] | DEFAULT '{}' | APEX versions |
| status | VARCHAR(20) | NOT NULL, DEFAULT 'draft', CHECK IN ('draft', 'pending_approval', 'active', 'deprecated') | Lifecycle status |
| version | INTEGER | NOT NULL, DEFAULT 1 | Version number |
| previous_version_id | UUID | FK knowledge_rules(id) | Link to prior version |
| rejection_reason | TEXT | | Reason if rejected |
| deprecation_reason | TEXT | | Reason if deprecated |
| created_by | UUID | FK users(id), NOT NULL | Author |
| approved_by | UUID | FK users(id) | Approver |
| approved_at | TIMESTAMPTZ | | Approval timestamp |
| created_at | TIMESTAMPTZ | DEFAULT now() | Creation timestamp |
| updated_at | TIMESTAMPTZ | DEFAULT now() | Last update timestamp |

**Indexes**: `(tenant_id, domain_id, status)`, `(tenant_id, domain_id, name)` UNIQUE WHERE `status != 'deprecated'`, `(tags)` GIN, `(status) WHERE status = 'active'`
**RLS**: `tenant_id = current_setting('app.current_tenant')`

#### `knowledge_table_maps`

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Map identifier |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant scope |
| rule_id | UUID | FK knowledge_rules(id), NOT NULL | Associated rule |
| table_name | VARCHAR(128) | NOT NULL | Oracle table name |
| column_name | VARCHAR(128) | | Specific column (optional) |
| relationship | VARCHAR(50) | NOT NULL, CHECK IN ('governs', 'validates', 'computes', 'restricts') | How rule relates to table |
| description | TEXT | | Mapping description |
| created_at | TIMESTAMPTZ | DEFAULT now() | Creation timestamp |

**Indexes**: `(tenant_id, rule_id)`, `(tenant_id, table_name)`
**RLS**: `tenant_id = current_setting('app.current_tenant')`

---

## 4. Error Codes

| Error Code | HTTP | Condition |
|------------|------|-----------|
| TEST_SUITE_NOT_FOUND | 404 | Suite ID does not exist |
| TEST_CASE_NOT_FOUND | 404 | Test case ID does not exist |
| TEST_RUN_NOT_FOUND | 404 | Run ID does not exist |
| TEST_RUN_IN_PROGRESS | 409 | Attempting to re-run a suite that is already running |
| TEST_EXECUTION_FAILED | 500 | Unrecoverable error during test execution |
| TEST_TIMEOUT | 408 | Test suite exceeded timeout_seconds |
| QUALITY_GATE_FAILED | 422 | Quality gate check did not pass |
| KNOWLEDGE_RULE_NOT_FOUND | 404 | Rule ID does not exist |
| KNOWLEDGE_RULE_DUPLICATE_NAME | 409 | Rule name already exists in domain |
| KNOWLEDGE_NORMATIVE_REQUIRED | 422 | Normative source is missing |
| KNOWLEDGE_SELF_APPROVAL | 403 | Creator attempting to approve own rule |
| KNOWLEDGE_INVALID_TRANSITION | 422 | Invalid status transition (e.g., draft -> active without approval) |
| KNOWLEDGE_DOMAIN_NOT_FOUND | 404 | Domain code does not exist |
| KNOWLEDGE_CONTENT_TOO_LONG | 422 | Content exceeds 10,000 characters |
| DOMAIN_CLASSIFICATION_LOW_CONFIDENCE | 422 | Classification confidence below 85% threshold |

---

## 5. API Endpoints

### 5.1 M13 Test Automation Endpoints

| Method | Path | Auth | Description |
|--------|------|------|-------------|
| GET | `/api/v1/test-suites` | authenticate() | List test suites for an app |
| POST | `/api/v1/test-suites` | authorize(['admin', 'developer', 'tech_lead', 'qa_analyst']) | Create test suite |
| GET | `/api/v1/test-suites/:id` | authenticate() | Get suite details |
| PATCH | `/api/v1/test-suites/:id` | authorize(['admin', 'developer', 'tech_lead', 'qa_analyst']) | Update suite |
| DELETE | `/api/v1/test-suites/:id` | authorize(['admin', 'tech_lead']) | Soft-delete suite |
| POST | `/api/v1/test-suites/:id/run` | authorize(['admin', 'developer', 'tech_lead', 'qa_analyst']) | Execute test suite |
| GET | `/api/v1/test-cases` | authenticate() | List test cases (filtered by suite, tags) |
| POST | `/api/v1/test-cases` | authorize(['admin', 'developer', 'tech_lead', 'qa_analyst']) | Create test case |
| GET | `/api/v1/test-cases/:id` | authenticate() | Get test case details |
| PATCH | `/api/v1/test-cases/:id` | authorize(['admin', 'developer', 'tech_lead', 'qa_analyst']) | Update test case |
| DELETE | `/api/v1/test-cases/:id` | authorize(['admin', 'tech_lead']) | Soft-delete test case |
| POST | `/api/v1/test-cases/generate` | authorize(['admin', 'developer', 'tech_lead', 'qa_analyst']) | AI-generate test cases |
| GET | `/api/v1/test-runs` | authenticate() | List test runs |
| GET | `/api/v1/test-runs/:id` | authenticate() | Get run details with results |
| POST | `/api/v1/test-runs/:id/cancel` | authorize(['admin', 'tech_lead']) | Cancel running test |
| GET | `/api/v1/test-runs/:id/quality-gates` | authenticate() | Check quality gate results |
| GET | `/api/v1/test-coverage/:appId` | authenticate() | Get coverage report for app |

### 5.2 M14 Knowledge Engine Endpoints

| Method | Path | Auth | Description |
|--------|------|------|-------------|
| GET | `/api/v1/knowledge/domains` | authenticate() | List knowledge domains |
| GET | `/api/v1/knowledge/domains/:code` | authenticate() | Get domain details |
| GET | `/api/v1/knowledge/rules` | authenticate() | List rules (filtered by domain, status, tags) |
| POST | `/api/v1/knowledge/rules` | authorize(['admin', 'tech_lead', 'knowledge_editor']) | Create rule |
| GET | `/api/v1/knowledge/rules/:id` | authenticate() | Get rule details |
| PATCH | `/api/v1/knowledge/rules/:id` | authorize(['admin', 'tech_lead', 'knowledge_editor']) | Update rule (creates new version) |
| DELETE | `/api/v1/knowledge/rules/:id` | authorize(['admin']) | Delete draft rule |
| POST | `/api/v1/knowledge/rules/:id/submit` | authorize(['admin', 'tech_lead', 'knowledge_editor']) | Submit for approval |
| POST | `/api/v1/knowledge/rules/:id/approve` | authorize(['admin', 'tech_lead']) | Approve rule |
| POST | `/api/v1/knowledge/rules/:id/reject` | authorize(['admin', 'tech_lead']) | Reject rule (back to draft) |
| POST | `/api/v1/knowledge/rules/:id/deprecate` | authorize(['admin', 'tech_lead']) | Deprecate active rule |
| GET | `/api/v1/knowledge/rules/:id/versions` | authenticate() | Get version history |
| POST | `/api/v1/knowledge/rules/import` | authorize(['admin']) | Bulk import rules |
| GET | `/api/v1/knowledge/rules/export` | authorize(['admin', 'tech_lead']) | Export rules (JSON/YAML) |
| POST | `/api/v1/knowledge/classify` | authenticate() | Classify domain from text |
| GET | `/api/v1/knowledge/table-maps` | authenticate() | List table mappings for a rule |
| POST | `/api/v1/knowledge/table-maps` | authorize(['admin', 'tech_lead', 'knowledge_editor']) | Create table mapping |
| DELETE | `/api/v1/knowledge/table-maps/:id` | authorize(['admin', 'tech_lead']) | Delete table mapping |

---

## 6. Events Emitted

| Event | Trigger | Payload |
|-------|---------|---------|
| `TEST_RUN_STARTED` | Test suite execution begins | `{ runId, suiteId, appId, triggeredBy }` |
| `TEST_RUN_COMPLETED` | Test suite execution finishes | `{ runId, passed, failed, coverage }` |
| `TEST_CASE_FAILED` | Individual test case fails | `{ runId, testCaseId, errorMessage }` |
| `QUALITY_GATE_CHECKED` | Quality gate evaluated | `{ runId, appId, passed, gates }` |
| `QUALITY_GATE_OVERRIDDEN` | Tech Lead overrides failed gate | `{ runId, userId, justification }` |
| `KNOWLEDGE_RULE_SUBMITTED` | Rule submitted for approval | `{ ruleId, domain, submittedBy }` |
| `KNOWLEDGE_RULE_APPROVED` | Rule approved and activated | `{ ruleId, domain, approvedBy }` |
| `KNOWLEDGE_RULE_REJECTED` | Rule rejected | `{ ruleId, domain, rejectedBy, reason }` |
| `KNOWLEDGE_RULE_DEPRECATED` | Rule deprecated | `{ ruleId, domain, reason }` |

---

## 7. Non-Functional Considerations

| Aspect | Requirement |
|--------|-------------|
| Test execution concurrency | Max 10 concurrent test runs per tenant |
| Test result retention | 90 days (partitioned monthly, auto-purge) |
| Knowledge rule indexing | New/updated active rules available to AI Studio within 60 seconds |
| Domain classification accuracy | >85% correct domain detection |
| Rule content max size | 10,000 characters per rule |
| Smoke test time limit | 60 seconds max per smoke suite |
| Coverage calculation | Per-package line coverage via utPLSQL reporter |
