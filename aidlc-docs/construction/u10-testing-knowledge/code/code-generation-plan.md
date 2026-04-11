# Code Generation Plan -- U10: Testing & Knowledge

## Document Information

| Field | Value |
|-------|-------|
| **Unit** | U10 -- Testing & Knowledge |
| **Sprint** | S9 (Fase 2, Weeks 20-21) |
| **Modules** | M13 (Test Automation Studio) + M14 (GENESYS Knowledge Engine) |
| **Stories** | US-031, US-032, US-033, US-055, US-034, US-035, US-056 |
| **Status** | AI-DLC Generated -- For Review |
| **Date** | 2026-04-10 |

---

## Prerequisites

Before starting code generation, verify prior unit deliverables:
- [ ] U9 completed: Dependency Analyzer (M11/C13) operational for regression test selection
- [ ] U5 completed: AI Studio (M4) operational for AI-generated test cases
- [ ] U2 completed: Auth middleware, tenant resolver, audit logging available
- [ ] U8 completed: Release Manager (M9/C11) available for quality gate integration
- [ ] utPLSQL framework accessible via ORDS/JDBC on target Oracle environments
- [ ] Event bus (C25) operational for test and knowledge events

---

## Plan Checklist

### 1. Database Migrations

- [ ] `migrations/035_test_suites.sql`
  - [ ] Create `test_suites` table (id, tenant_id, app_id, name, description, type, is_smoke, tags, parallel_execution, timeout_seconds, is_active, created_by, created_at, updated_at)
  - [ ] CHECK constraint: `type IN ('unit', 'integration', 'regression', 'smoke', 'security')`
  - [ ] Create index on `(tenant_id, app_id)`
  - [ ] Create index on `(tenant_id, type)`
  - [ ] Create index on `(is_smoke) WHERE is_active = true`
  - [ ] Enable RLS: `tenant_id = current_setting('app.current_tenant')`

- [ ] `migrations/036_test_cases.sql`
  - [ ] Create `test_cases` table (id, tenant_id, suite_id, name, description, type, code, target_package, target_procedure, requirement_id, severity, tags, expected_duration_ms, is_active, last_run_status, last_run_at, generated_by_ai, created_by, created_at, updated_at)
  - [ ] CHECK constraint: `type IN ('unit', 'integration', 'e2e')`
  - [ ] CHECK constraint: `severity IN ('critical', 'major', 'normal', 'minor')`
  - [ ] Create index on `(tenant_id, suite_id)`
  - [ ] Create index on `(requirement_id)`
  - [ ] Create index on `(target_package)`
  - [ ] Enable RLS

- [ ] `migrations/037_test_runs.sql`
  - [ ] Create `test_runs` table (id, tenant_id, suite_id, app_id, environment_id, status, total_tests, passed, failed, errored, skipped, coverage_percentage, duration_ms, triggered_by, started_at, completed_at, started_by, created_at)
  - [ ] CHECK constraint: `status IN ('queued', 'running', 'completed', 'failed', 'cancelled')`
  - [ ] CHECK constraint: `triggered_by IN ('manual', 'ci_pipeline', 'deployment', 'regression')`
  - [ ] Create index on `(tenant_id, app_id, created_at DESC)`
  - [ ] Create index on `(status) WHERE status IN ('queued', 'running')`
  - [ ] Enable RLS
  - [ ] Partition by `created_at` (monthly)

- [ ] `migrations/038_test_results.sql`
  - [ ] Create `test_results` table (id, tenant_id, run_id, test_case_id, status, duration_ms, error_message, stack_trace, assertions JSONB, output_log, created_at)
  - [ ] CHECK constraint: `status IN ('passed', 'failed', 'errored', 'skipped')`
  - [ ] Create index on `(run_id)`
  - [ ] Create index on `(test_case_id, created_at DESC)`
  - [ ] Enable RLS
  - [ ] Partition by `created_at` (monthly)

- [ ] `migrations/039_knowledge_domains.sql`
  - [ ] Create `knowledge_domains` table (id, tenant_id, code, name, description, icon, rule_count, is_active, created_at, updated_at)
  - [ ] Create UNIQUE index on `(tenant_id, code)`
  - [ ] Enable RLS
  - [ ] Insert seed data for 5 domains: PREDIAL, ICA, TESORERIA, CARTERA, NOMINA

- [ ] `migrations/040_knowledge_rules.sql`
  - [ ] Create `knowledge_rules` table (id, tenant_id, domain_id, name, description, content, normative_source, normative_article, category, priority, tags, applicable_versions, status, version, previous_version_id, rejection_reason, deprecation_reason, created_by, approved_by, approved_at, created_at, updated_at)
  - [ ] CHECK constraint: `status IN ('draft', 'pending_approval', 'active', 'deprecated')`
  - [ ] CHECK constraint: `priority BETWEEN 1 AND 10`
  - [ ] CHECK constraint: `length(content) <= 10000`
  - [ ] Create index on `(tenant_id, domain_id, status)`
  - [ ] Create UNIQUE index on `(tenant_id, domain_id, name) WHERE status != 'deprecated'`
  - [ ] Create GIN index on `(tags)`
  - [ ] Create index on `(status) WHERE status = 'active'`
  - [ ] Enable RLS

- [ ] `migrations/041_knowledge_table_maps.sql`
  - [ ] Create `knowledge_table_maps` table (id, tenant_id, rule_id, table_name, column_name, relationship, description, created_at)
  - [ ] CHECK constraint: `relationship IN ('governs', 'validates', 'computes', 'restricts')`
  - [ ] Create index on `(tenant_id, rule_id)`
  - [ ] Create index on `(tenant_id, table_name)`
  - [ ] Enable RLS

---

### 2. Shared Types (packages/shared-types)

- [ ] `packages/shared-types/src/test-studio.ts`
  - [ ] `TestType` union type (`'unit' | 'integration' | 'regression' | 'smoke' | 'security'`)
  - [ ] `TestCaseType` union type (`'unit' | 'integration' | 'e2e'`)
  - [ ] `TestStatus` union type (`'passed' | 'failed' | 'errored' | 'skipped'`)
  - [ ] `TestRunStatus` union type (`'queued' | 'running' | 'completed' | 'failed' | 'cancelled'`)
  - [ ] `TestSeverity` union type (`'critical' | 'major' | 'normal' | 'minor'`)
  - [ ] `TestRunTrigger` union type (`'manual' | 'ci_pipeline' | 'deployment' | 'regression'`)
  - [ ] `TestSuite`, `TestCase`, `TestRun`, `TestResult` interfaces
  - [ ] `TestRunRequest`, `TestRunResult`, `TestCaseResult` interfaces
  - [ ] `TestGenRequest`, `TestGenResult`, `GeneratedTest` interfaces
  - [ ] `CoverageReport`, `QualityGateResult` interfaces

- [ ] `packages/shared-types/src/knowledge.ts`
  - [ ] `KnowledgeDomain` union type (`'PREDIAL' | 'ICA' | 'TESORERIA' | 'CARTERA' | 'NOMINA'`)
  - [ ] `RuleStatus` union type (`'draft' | 'pending_approval' | 'active' | 'deprecated'`)
  - [ ] `TableMapRelationship` union type (`'governs' | 'validates' | 'computes' | 'restricts'`)
  - [ ] `KnowledgeRule`, `KnowledgeDomainEntity`, `KnowledgeTableMap` interfaces
  - [ ] `DomainClassification` interface
  - [ ] `RuleFilter`, `DomainContext` interfaces
  - [ ] `RuleImportSource`, `ImportResult` interfaces

---

### 3. M13 Test Studio Backend Module (apps/api/src/modules/test-studio/)

- [ ] `src/modules/test-studio/test-studio.types.ts`
  - [ ] Re-export shared types with service-internal extensions
  - [ ] `TestSuiteRow`, `TestCaseRow`, `TestRunRow`, `TestResultRow` DB row interfaces

- [ ] `src/modules/test-studio/test-studio.validation.ts`
  - [ ] `CreateTestSuiteSchema` (Zod) -- name, appId, type, is_smoke, tags, timeout_seconds
  - [ ] `UpdateTestSuiteSchema` (Zod) -- name?, description?, is_smoke?, tags?, timeout_seconds?
  - [ ] `CreateTestCaseSchema` (Zod) -- name, suiteId, type, code, targetPackage?, requirementId?, severity?, tags
  - [ ] `UpdateTestCaseSchema` (Zod) -- name?, description?, code?, tags?, severity?
  - [ ] `RunTestSuiteSchema` (Zod) -- suiteId?, testIds?, appId, environmentId, tags?
  - [ ] `GenerateTestsSchema` (Zod) -- packageName, schemaName, connectionId, appId, testTypes, coverageTarget
  - [ ] `ListTestSuitesQuerySchema` (Zod) -- appId, type?, page, limit
  - [ ] `ListTestCasesQuerySchema` (Zod) -- suiteId?, tags?, page, limit
  - [ ] `ListTestRunsQuerySchema` (Zod) -- appId?, suiteId?, status?, page, limit

- [ ] `src/modules/test-studio/test-runner.service.ts`
  - [ ] `runTestSuite(request: TestRunRequest, actorId: string): Promise<TestRun>` -- queue test run, resolve test cases, emit TEST_RUN_STARTED
  - [ ] `executeTestRun(runId: string): Promise<void>` -- Bull job processor: iterate test cases, execute via ORDS/JDBC utPLSQL, record results, compute coverage, check quality gates, emit TEST_RUN_COMPLETED
  - [ ] `cancelTestRun(runId: string, actorId: string): Promise<void>` -- cancel queued/running test
  - [ ] `getTestResults(runId: string): Promise<TestRunResult>` -- aggregate results for a run
  - [ ] `getCoverage(appId: number): Promise<CoverageReport>` -- latest coverage per package
  - [ ] `checkQualityGates(runId: string): Promise<QualityGateResult>` -- evaluate pass rate, coverage, critical failures, smoke

- [ ] `src/modules/test-studio/test-case.service.ts`
  - [ ] `createTestCase(data: CreateTestCaseInput, actorId: string): Promise<TestCase>` -- validate, insert, log audit
  - [ ] `updateTestCase(id: string, data: UpdateTestCaseInput, actorId: string): Promise<TestCase>` -- update, log audit
  - [ ] `deleteTestCase(id: string, actorId: string): Promise<void>` -- soft-delete
  - [ ] `listTestCases(filters: TestCaseFilters): Promise<PaginatedResult<TestCase>>` -- filtered, paginated
  - [ ] `getTestCaseById(id: string): Promise<TestCase>`

- [ ] `src/modules/test-studio/test-suite.service.ts`
  - [ ] `createTestSuite(data: CreateTestSuiteInput, actorId: string): Promise<TestSuite>` -- validate naming, insert, log audit
  - [ ] `updateTestSuite(id: string, data: UpdateTestSuiteInput, actorId: string): Promise<TestSuite>`
  - [ ] `deleteTestSuite(id: string, actorId: string): Promise<void>` -- soft-delete (only if no active runs)
  - [ ] `listTestSuites(appId: number, filters?: TestSuiteFilters): Promise<TestSuite[]>`
  - [ ] `getTestSuiteById(id: string): Promise<TestSuite>`

- [ ] `src/modules/test-studio/test-generator.service.ts`
  - [ ] `generateTestCases(request: TestGenRequest, actorId: string): Promise<TestGenResult>` -- invoke AI Studio (M4) to analyze PL/SQL source, generate utPLSQL test cases, optionally generate test data
  - [ ] `getPackageSource(connectionId: string, packageName: string, schemaName: string): Promise<string>` -- fetch PL/SQL source via ORDS/JDBC

- [ ] `src/modules/test-studio/regression-selector.service.ts`
  - [ ] `selectRegressionTests(changeId: string): Promise<string[]>` -- query M11 impact graph, find linked test cases, add smoke tests, deduplicate

- [ ] `src/modules/test-studio/test-studio.controller.ts`
  - [ ] `GET /api/v1/test-suites` -- listTestSuites
  - [ ] `POST /api/v1/test-suites` -- createTestSuite
  - [ ] `GET /api/v1/test-suites/:id` -- getTestSuiteById
  - [ ] `PATCH /api/v1/test-suites/:id` -- updateTestSuite
  - [ ] `DELETE /api/v1/test-suites/:id` -- deleteTestSuite
  - [ ] `POST /api/v1/test-suites/:id/run` -- runTestSuite
  - [ ] `GET /api/v1/test-cases` -- listTestCases
  - [ ] `POST /api/v1/test-cases` -- createTestCase
  - [ ] `GET /api/v1/test-cases/:id` -- getTestCaseById
  - [ ] `PATCH /api/v1/test-cases/:id` -- updateTestCase
  - [ ] `DELETE /api/v1/test-cases/:id` -- deleteTestCase
  - [ ] `POST /api/v1/test-cases/generate` -- generateTestCases
  - [ ] `GET /api/v1/test-runs` -- listTestRuns
  - [ ] `GET /api/v1/test-runs/:id` -- getTestResults
  - [ ] `POST /api/v1/test-runs/:id/cancel` -- cancelTestRun
  - [ ] `GET /api/v1/test-runs/:id/quality-gates` -- checkQualityGates
  - [ ] `GET /api/v1/test-coverage/:appId` -- getCoverage

---

### 4. M14 Knowledge Engine Backend Module (apps/api/src/modules/knowledge-engine/)

- [ ] `src/modules/knowledge-engine/knowledge.types.ts`
  - [ ] Re-export shared types with service-internal extensions
  - [ ] `KnowledgeRuleRow`, `KnowledgeDomainRow`, `KnowledgeTableMapRow` DB row interfaces

- [ ] `src/modules/knowledge-engine/knowledge.validation.ts`
  - [ ] `CreateRuleSchema` (Zod) -- domain, name, content, normativeSource, normativeArticle?, category?, priority, tags?, applicableVersions?
  - [ ] `UpdateRuleSchema` (Zod) -- name?, content?, normativeSource?, category?, priority?, tags?
  - [ ] `SubmitRuleSchema` (Zod) -- (no body, action endpoint)
  - [ ] `ApproveRuleSchema` (Zod) -- (no body)
  - [ ] `RejectRuleSchema` (Zod) -- reason (required)
  - [ ] `DeprecateRuleSchema` (Zod) -- reason (required)
  - [ ] `ImportRulesSchema` (Zod) -- type, source, overwriteExisting
  - [ ] `ExportRulesQuerySchema` (Zod) -- format ('json' | 'yaml'), domain?
  - [ ] `ListRulesQuerySchema` (Zod) -- domain?, status?, tags?, search?, page, limit
  - [ ] `ClassifyDomainSchema` (Zod) -- text (string, max 5000)
  - [ ] `CreateTableMapSchema` (Zod) -- ruleId, tableName, columnName?, relationship, description?

- [ ] `src/modules/knowledge-engine/knowledge-rule.service.ts`
  - [ ] `createRule(data: CreateRuleInput, actorId: string): Promise<KnowledgeRule>` -- validate normative source, check unique name, insert as draft, log audit
  - [ ] `updateRule(id: string, data: UpdateRuleInput, actorId: string): Promise<KnowledgeRule>` -- create new version, link previous, increment version number, log audit
  - [ ] `deleteRule(id: string, actorId: string): Promise<void>` -- only draft status, log audit
  - [ ] `getRuleById(id: string): Promise<KnowledgeRule>`
  - [ ] `listRules(filters: RuleFilters): Promise<PaginatedResult<KnowledgeRule>>` -- filtered, paginated
  - [ ] `getRuleVersions(id: string): Promise<KnowledgeRule[]>` -- version history chain
  - [ ] `submitForApproval(id: string, actorId: string): Promise<KnowledgeRule>` -- transition draft -> pending_approval, emit event
  - [ ] `approveRule(id: string, actorId: string): Promise<KnowledgeRule>` -- validate not self-approval, transition to active, emit event, update domain rule_count
  - [ ] `rejectRule(id: string, reason: string, actorId: string): Promise<KnowledgeRule>` -- transition to draft with rejection_reason, emit event
  - [ ] `deprecateRule(id: string, reason: string, actorId: string): Promise<KnowledgeRule>` -- transition to deprecated, emit event, update domain rule_count

- [ ] `src/modules/knowledge-engine/knowledge-domain.service.ts`
  - [ ] `listDomains(): Promise<KnowledgeDomainEntity[]>` -- list all active domains with rule counts
  - [ ] `getDomainByCode(code: string): Promise<KnowledgeDomainEntity>`

- [ ] `src/modules/knowledge-engine/knowledge-context.service.ts`
  - [ ] `getRelevantRules(context: DomainContext): Promise<KnowledgeRule[]>` -- query active rules matching domain, tags, component type; order by priority DESC
  - [ ] `enrichContext(contextWindow: ContextWindow, rules: KnowledgeRule[]): ContextWindow` -- inject rule content as system instructions
  - [ ] `classifyDomain(text: string): Promise<DomainClassification>` -- AI-based domain classification with confidence score

- [ ] `src/modules/knowledge-engine/knowledge-import-export.service.ts`
  - [ ] `importRules(source: RuleImportSource, actorId: string): Promise<ImportResult>` -- bulk import from JSON/YAML/marketplace
  - [ ] `exportRules(format: 'json' | 'yaml', domain?: string): Promise<string>` -- export active rules

- [ ] `src/modules/knowledge-engine/knowledge-table-map.service.ts`
  - [ ] `createTableMap(data: CreateTableMapInput, actorId: string): Promise<KnowledgeTableMap>`
  - [ ] `listTableMaps(ruleId: string): Promise<KnowledgeTableMap[]>`
  - [ ] `deleteTableMap(id: string, actorId: string): Promise<void>`

- [ ] `src/modules/knowledge-engine/knowledge.controller.ts`
  - [ ] `GET /api/v1/knowledge/domains` -- listDomains
  - [ ] `GET /api/v1/knowledge/domains/:code` -- getDomainByCode
  - [ ] `GET /api/v1/knowledge/rules` -- listRules
  - [ ] `POST /api/v1/knowledge/rules` -- createRule
  - [ ] `GET /api/v1/knowledge/rules/:id` -- getRuleById
  - [ ] `PATCH /api/v1/knowledge/rules/:id` -- updateRule
  - [ ] `DELETE /api/v1/knowledge/rules/:id` -- deleteRule
  - [ ] `POST /api/v1/knowledge/rules/:id/submit` -- submitForApproval
  - [ ] `POST /api/v1/knowledge/rules/:id/approve` -- approveRule
  - [ ] `POST /api/v1/knowledge/rules/:id/reject` -- rejectRule
  - [ ] `POST /api/v1/knowledge/rules/:id/deprecate` -- deprecateRule
  - [ ] `GET /api/v1/knowledge/rules/:id/versions` -- getRuleVersions
  - [ ] `POST /api/v1/knowledge/rules/import` -- importRules
  - [ ] `GET /api/v1/knowledge/rules/export` -- exportRules
  - [ ] `POST /api/v1/knowledge/classify` -- classifyDomain
  - [ ] `GET /api/v1/knowledge/table-maps` -- listTableMaps
  - [ ] `POST /api/v1/knowledge/table-maps` -- createTableMap
  - [ ] `DELETE /api/v1/knowledge/table-maps/:id` -- deleteTableMap

---

### 5. M13 Test Studio Frontend (apps/web/src/features/test-studio/)

- [ ] `features/test-studio/api/test-studio.api.ts`
  - [ ] API client functions for all test-studio endpoints
  - [ ] TanStack Query hooks: `useTestSuites`, `useTestCases`, `useTestRuns`, `useTestRunResults`, `useCoverage`
  - [ ] Mutations: `useCreateTestSuite`, `useRunTestSuite`, `useGenerateTests`, `useCancelTestRun`

- [ ] `features/test-studio/pages/TestStudioPage.tsx`
  - [ ] Main page with tabs: Suites, Test Cases, Runs, Coverage
  - [ ] App selector dropdown
  - [ ] "Generate Tests" action button

- [ ] `features/test-studio/components/TestSuiteList.tsx`
  - [ ] Table: name, type, is_smoke badge, test count, last run status, actions
  - [ ] Filter by type, smoke designation
  - [ ] "Run Suite" button per row

- [ ] `features/test-studio/components/TestCaseEditor.tsx`
  - [ ] Form: name, type, suite, severity, requirement ID, tags
  - [ ] Monaco Editor for utPLSQL code with PL/SQL syntax highlighting
  - [ ] AI-generate button that calls test generator

- [ ] `features/test-studio/components/TestRunViewer.tsx`
  - [ ] Run summary: pass/fail/skip/error counts, coverage %, duration
  - [ ] Result list: test name, status badge, duration, expand for assertions
  - [ ] Quality gate status panel

- [ ] `features/test-studio/components/CoverageDashboard.tsx`
  - [ ] Coverage by package bar chart (Recharts)
  - [ ] Trend line chart (last 30 runs)
  - [ ] Uncovered lines table
  - [ ] Requirements coverage matrix

- [ ] `features/test-studio/components/TestGeneratorDialog.tsx`
  - [ ] Form: package name, schema, connection, test types checkboxes, coverage target slider
  - [ ] Preview generated tests before saving
  - [ ] Accept/reject individual generated test cases

---

### 6. M14 Knowledge Engine Frontend (apps/web/src/features/knowledge-engine/)

- [ ] `features/knowledge-engine/api/knowledge.api.ts`
  - [ ] API client functions for all knowledge endpoints
  - [ ] TanStack Query hooks: `useDomains`, `useRules`, `useRuleVersions`, `useTableMaps`
  - [ ] Mutations: `useCreateRule`, `useUpdateRule`, `useSubmitRule`, `useApproveRule`, `useRejectRule`, `useDeprecateRule`

- [ ] `features/knowledge-engine/pages/KnowledgeEnginePage.tsx`
  - [ ] Domain selector sidebar (5 domains with icons and rule counts)
  - [ ] Rule list panel with status filter tabs (draft, pending, active, deprecated)
  - [ ] Search bar with tag chips

- [ ] `features/knowledge-engine/components/RuleEditor.tsx`
  - [ ] Form: name, domain, category, priority, tags, applicable versions
  - [ ] Rich text editor for content (max 10,000 chars with counter)
  - [ ] Normative source input (required, with legal reference autocomplete)
  - [ ] Status badge and workflow action buttons (submit, approve, reject, deprecate)

- [ ] `features/knowledge-engine/components/RuleVersionHistory.tsx`
  - [ ] Version list with diffs between versions
  - [ ] Version comparison side-by-side view

- [ ] `features/knowledge-engine/components/DomainOverview.tsx`
  - [ ] Domain card with description, rule counts by status
  - [ ] Domain classification confidence meter

- [ ] `features/knowledge-engine/components/TableMapManager.tsx`
  - [ ] Table showing rule-to-table mappings
  - [ ] Add mapping form: table name, column, relationship type
  - [ ] Delete mapping action

- [ ] `features/knowledge-engine/components/RuleApprovalPanel.tsx`
  - [ ] Pending rules queue for reviewers
  - [ ] Approve / reject buttons with reason dialog
  - [ ] Rule content preview

---

### 7. Unit Tests (apps/api/tests/)

- [ ] `tests/modules/test-studio/test-suite.service.test.ts`
  - [ ] Create test suite with valid data
  - [ ] Create smoke suite sets is_smoke flag
  - [ ] Delete suite with active run fails
  - [ ] List suites filtered by type
  - [ ] List suites filtered by app_id

- [ ] `tests/modules/test-studio/test-case.service.test.ts`
  - [ ] Create test case linked to suite
  - [ ] Update test case code
  - [ ] Soft-delete test case
  - [ ] List test cases by suite
  - [ ] List test cases by requirement_id

- [ ] `tests/modules/test-studio/test-runner.service.test.ts`
  - [ ] Run test suite queues job and emits TEST_RUN_STARTED
  - [ ] Execute test run records results per test case
  - [ ] Coverage calculation aggregates per package
  - [ ] Quality gate passes when above thresholds
  - [ ] Quality gate fails when below coverage threshold
  - [ ] Quality gate fails when critical test failed
  - [ ] Cancel running test sets status to cancelled
  - [ ] Smoke suite timeout enforcement (60s)

- [ ] `tests/modules/test-studio/test-generator.service.test.ts`
  - [ ] Generate test cases from PL/SQL source
  - [ ] Generated tests include positive and boundary cases
  - [ ] Test data scripts generated when requested
  - [ ] Handles packages with no public methods gracefully

- [ ] `tests/modules/test-studio/regression-selector.service.test.ts`
  - [ ] Select regression tests from impact graph
  - [ ] Include smoke tests in selection
  - [ ] Deduplicate test case IDs
  - [ ] Empty impact returns smoke tests only

- [ ] `tests/modules/knowledge-engine/knowledge-rule.service.test.ts`
  - [ ] Create rule with normative source
  - [ ] Create rule without normative source fails (KNOWLEDGE_NORMATIVE_REQUIRED)
  - [ ] Update rule creates new version
  - [ ] Delete draft rule succeeds
  - [ ] Delete active rule fails
  - [ ] Duplicate name in same domain fails
  - [ ] Content exceeding 10,000 chars fails
  - [ ] Submit for approval transitions status
  - [ ] Self-approval forbidden
  - [ ] Approve transitions to active
  - [ ] Reject transitions to draft with reason
  - [ ] Deprecate transitions to deprecated

- [ ] `tests/modules/knowledge-engine/knowledge-context.service.test.ts`
  - [ ] Get relevant rules filters by domain and status
  - [ ] Enrich context injects rules as system instructions
  - [ ] Classify domain returns confidence score
  - [ ] Low confidence classification returns alternatives

- [ ] `tests/modules/knowledge-engine/knowledge-import-export.service.test.ts`
  - [ ] Import rules from JSON creates rules as draft
  - [ ] Export rules in JSON format
  - [ ] Export rules in YAML format
  - [ ] Import with overwrite updates existing rules

- [ ] `tests/modules/test-studio/test-studio.controller.test.ts`
  - [ ] POST /test-suites as qa_analyst -> 201
  - [ ] POST /test-suites as auditor -> 403
  - [ ] POST /test-suites/:id/run -> 202
  - [ ] GET /test-runs/:id -> 200 with results
  - [ ] POST /test-cases/generate -> 200 with generated tests
  - [ ] GET /test-coverage/:appId -> 200

- [ ] `tests/modules/knowledge-engine/knowledge.controller.test.ts`
  - [ ] POST /knowledge/rules with normative source -> 201
  - [ ] POST /knowledge/rules without normative source -> 422
  - [ ] POST /knowledge/rules/:id/approve as tech_lead -> 200
  - [ ] POST /knowledge/rules/:id/approve as creator -> 403
  - [ ] POST /knowledge/rules/:id/reject with reason -> 200
  - [ ] GET /knowledge/rules filtered by domain -> 200
  - [ ] POST /knowledge/classify -> 200 with domain classification

---

### 8. Integration Tests

- [ ] `tests/integration/test-studio.integration.test.ts`
  - [ ] Full lifecycle: create suite -> add test cases -> run suite -> view results -> check quality gates
  - [ ] AI-generate test cases -> review -> save -> run
  - [ ] Smoke suite auto-execution after deployment event
  - [ ] Quality gate blocks PROD when tests fail
  - [ ] Quality gate override with Tech Lead justification
  - [ ] Regression test selection from impact graph

- [ ] `tests/integration/knowledge-engine.integration.test.ts`
  - [ ] Full rule lifecycle: create (draft) -> submit -> approve -> active
  - [ ] Rule versioning: update creates new version, history preserved
  - [ ] Rejection flow: submit -> reject with reason -> back to draft
  - [ ] Deprecation flow: active -> deprecate with reason
  - [ ] Context enrichment: create active rule -> AI Studio receives rule in context
  - [ ] Domain classification: classify text -> correct domain returned
  - [ ] Import/export round-trip: export rules -> import in different tenant
  - [ ] Table map CRUD cycle

- [ ] `tests/integration/test-knowledge-cross.integration.test.ts`
  - [ ] Knowledge rules influence AI-generated test cases
  - [ ] Tenant isolation: Tenant A rules not visible to Tenant B

---

### 9. Route Registration

- [ ] `src/routes/index.ts`
  - [ ] Mount test-studio routes at `/api/v1/test-suites`, `/api/v1/test-cases`, `/api/v1/test-runs`, `/api/v1/test-coverage`
  - [ ] Mount knowledge-engine routes at `/api/v1/knowledge`

---

## File Summary

| Category | File Count |
|----------|------------|
| Database migrations | 7 |
| Shared types | 2 |
| Test Studio backend module | 7 |
| Knowledge Engine backend module | 7 |
| Test Studio frontend | 8 |
| Knowledge Engine frontend | 7 |
| Unit tests | 10 |
| Integration tests | 3 |
| Route registration | 1 |
| **Total** | **52** |

---

## Execution Order

1. Database migrations (035-041) -- schema must exist before service code
2. Shared types (test-studio.ts, knowledge.ts) -- interfaces used by all modules
3. Knowledge Engine backend (knowledge.types -> knowledge.validation -> knowledge-domain.service -> knowledge-rule.service -> knowledge-context.service -> knowledge-import-export.service -> knowledge-table-map.service -> knowledge.controller)
4. Test Studio backend (test-studio.types -> test-studio.validation -> test-suite.service -> test-case.service -> test-generator.service -> regression-selector.service -> test-runner.service -> test-studio.controller)
5. Route registration
6. Knowledge Engine frontend (api -> pages -> components)
7. Test Studio frontend (api -> pages -> components)
8. Unit tests (parallel per module)
9. Integration tests (sequential, requires running DB + Redis + AI Studio mock)

---

## Approval

**Please review this code generation plan.**

**Options**:
1. **Request Changes** - Modify the plan before execution
2. **Approve Plan** - Proceed to Part 2 (Code Generation execution)
