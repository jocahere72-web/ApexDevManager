# Code Generation Plan -- U8: Release Pipeline & AI Safety

## Document Information

| Field | Value |
|-------|-------|
| **Unit** | U8 -- Release Pipeline and AI Safety |
| **Sprint** | S7 (Fase 2) |
| **Modules** | M9 (Release & Deployment Manager), M10 (AI Governance & Safety Engine -- full) |
| **Stories** | US-022, US-023, US-024, US-025 (full), US-026, US-049 |
| **Status** | AI-DLC Generated -- For Review |
| **Date** | 2026-04-10 |

---

## Prerequisites

Before starting code generation, verify prior unit deliverables:
- [ ] U2 Auth module is operational (JWT, RBAC middleware)
- [ ] U5 AI Engine is operational (Claude orchestration, M10 stub in place)
- [ ] U7 Change Manager is operational (change_log table, change recording)
- [ ] MCP Connector (C22) can deploy APEX components via ORDS
- [ ] Notification service (C21) can deliver real-time notifications
- [ ] SSE infrastructure is available (from U5 AI Engine)

---

## Plan Checklist

### 1. Database Migrations

- [ ] `migrations/024_releases.sql`
  - [ ] Create `releases` table (id, tenant_id, app_id, name, version, type, status, current_environment, description, justification, scheduled_at, deployed_at, rolled_back_at, rollback_of, created_by, created_at, updated_at)
  - [ ] Add CHECK constraint for `type IN ('standard', 'hotfix', 'rollback')`
  - [ ] Add CHECK constraint for `status IN ('draft', 'in_progress', 'awaiting_approval', 'deployed', 'rolled_back', 'failed')`
  - [ ] Add CHECK constraint for `current_environment IN ('dev', 'qa', 'staging', 'prod')`
  - [ ] Create indexes on (tenant_id), (tenant_id, app_id), (tenant_id, status)
  - [ ] Create UNIQUE partial index for active releases per app+env
  - [ ] Enable RLS on `releases`
  - [ ] Create `releases_tenant_isolation` policy

- [ ] `migrations/025_release_changes.sql`
  - [ ] Create `release_changes` table (id, release_id, tenant_id, change_id, component_type, component_id, component_name, snapshot_content, pre_release_content, created_at)
  - [ ] Create UNIQUE index on (release_id, change_id)
  - [ ] Create indexes on (release_id) and (tenant_id)
  - [ ] Enable RLS on `release_changes`
  - [ ] Create `release_changes_tenant_isolation` policy

- [ ] `migrations/026_pipeline_steps.sql`
  - [ ] Create `pipeline_steps` table (id, release_id, tenant_id, environment, status, approval_required, test_passed, test_failed, test_skipped, progress, started_at, completed_at, error_message)
  - [ ] Add CHECK constraint for `status IN ('pending', 'in_progress', 'passed', 'failed', 'skipped')`
  - [ ] Create indexes on (release_id, environment) and (tenant_id)
  - [ ] Enable RLS on `pipeline_steps`
  - [ ] Create `pipeline_steps_tenant_isolation` policy

- [ ] `migrations/027_approvals.sql`
  - [ ] Create `approvals` table (id, tenant_id, resource_type, resource_id, required_count, status, requested_by, expires_at, resolved_at, created_at)
  - [ ] Add CHECK constraint for `resource_type IN ('release', 'ai_output')`
  - [ ] Add CHECK constraint for `status IN ('pending', 'approved', 'rejected', 'expired')`
  - [ ] Create `approval_decisions` table (id, approval_id, tenant_id, approver_id, decision, reason, created_at)
  - [ ] Add CHECK constraint for `decision IN ('approved', 'rejected')`
  - [ ] Create UNIQUE index on (approval_id, approver_id)
  - [ ] Create indexes on (tenant_id), (resource_type, resource_id), (tenant_id, status)
  - [ ] Enable RLS on both tables
  - [ ] Create tenant isolation policies

- [ ] `migrations/028_release_notes.sql`
  - [ ] Create `release_notes` table (id, release_id, tenant_id, version, features, bug_fixes, breaking_changes, known_issues, generated_by, published, created_at, updated_at)
  - [ ] Create UNIQUE index on (release_id)
  - [ ] Enable RLS on `release_notes`
  - [ ] Create `release_notes_tenant_isolation` policy

- [ ] `migrations/029_ai_interactions.sql`
  - [ ] Create `ai_interactions` table (id, tenant_id, user_id, module, request_prompt, request_hash, response_content, model_id, input_tokens, output_tokens, risk_level, risk_score, sanitization_applied, removed_patterns, approval_status, approval_id, chain_hash, previous_id, created_at)
  - [ ] Add CHECK constraint for `risk_level IN ('BAJO', 'MEDIO', 'ALTO', 'CRITICO')`
  - [ ] Create indexes on (tenant_id, created_at), (user_id), (risk_level), (module), (chain_hash)
  - [ ] Enable RLS with INSERT-only + SELECT policies (no UPDATE/DELETE)
  - [ ] Create `ai_interactions_tenant_read` policy FOR SELECT
  - [ ] Create `ai_interactions_tenant_insert` policy FOR INSERT

- [ ] `migrations/030_safety_rules.sql`
  - [ ] Create `safety_rules` table (id, tenant_id, name, description, rule_type, pattern, severity, action, priority, enabled, is_system, created_by, created_at, updated_at)
  - [ ] Add CHECK constraint for `rule_type IN ('regex_pattern', 'semantic_check', 'operation_block')`
  - [ ] Add CHECK constraint for `severity IN ('info', 'warning', 'error', 'critical')`
  - [ ] Add CHECK constraint for `action IN ('flag', 'block', 'require_approval')`
  - [ ] Create indexes on (tenant_id) and (tenant_id, enabled, priority)
  - [ ] Enable RLS on `safety_rules`
  - [ ] Create `safety_rules_tenant_isolation` policy
  - [ ] Seed 20+ default system safety rules

---

### 2. Shared Types (packages/shared-types)

- [ ] `packages/shared-types/src/releases.ts`
  - [ ] `ReleaseType` union type ('standard' | 'hotfix' | 'rollback')
  - [ ] `ReleaseStatus` union type
  - [ ] `PipelineEnvironment` union type ('dev' | 'qa' | 'staging' | 'prod')
  - [ ] `PipelineStepStatus` union type
  - [ ] `Release` interface
  - [ ] `ReleaseChange` interface
  - [ ] `PipelineStep` interface
  - [ ] `ReleaseNotes` interface
  - [ ] `PromotionResult` interface
  - [ ] `ReleaseStatusEvent` interface (for SSE)

- [ ] `packages/shared-types/src/governance.ts`
  - [ ] `RiskLevel` union type ('BAJO' | 'MEDIO' | 'ALTO' | 'CRITICO')
  - [ ] `RiskClassification` interface (level, score, factors, requiresApproval)
  - [ ] `SanitizedInput` interface
  - [ ] `SafetyValidationResult` interface
  - [ ] `SafetyFinding` interface
  - [ ] `SafetyRule` interface
  - [ ] `AIInteraction` interface
  - [ ] `ApprovalRequest` interface
  - [ ] `ApprovalDecision` interface

---

### 3. M9 Release Manager Module (apps/api/src/modules/releases/)

- [ ] `src/modules/releases/releases.validation.ts`
  - [ ] `CreateReleaseSchema` (Zod) -- name, version, appId, changeIds[], description?, scheduledAt?
  - [ ] `CreateHotfixSchema` (Zod) -- extends CreateReleaseSchema + justification (required), max 5 changeIds
  - [ ] `PromoteReleaseSchema` (Zod) -- releaseId, targetEnvironment
  - [ ] `ApproveReleaseSchema` (Zod) -- releaseId, decision ('approved'|'rejected'), reason?
  - [ ] `ListReleasesQuerySchema` (Zod) -- page, limit, appId?, status?, type?, environment?

- [ ] `src/modules/releases/release-snapshot.service.ts`
  - [ ] `createSnapshot(releaseId: string, changeIds: string[]): Promise<void>` -- fetch current component content for each change, store in release_changes
  - [ ] `getSnapshot(releaseId: string): Promise<ReleaseChange[]>` -- retrieve snapshots
  - [ ] `getPreReleaseContent(releaseId: string): Promise<ReleaseChange[]>` -- content before release (for rollback)

- [ ] `src/modules/releases/release-pipeline.service.ts`
  - [ ] `initializePipeline(releaseId: string, type: ReleaseType): Promise<PipelineStep[]>` -- create 4 pipeline steps (or 2 for hotfix: dev, prod)
  - [ ] `promoteTo(releaseId: string, targetEnv: PipelineEnvironment, userId: string): Promise<PromotionResult>` -- validate stage order, run tests if QA, create approval if needed, deploy
  - [ ] `getStatus(releaseId: string): Promise<PipelineStep[]>` -- current pipeline state
  - [ ] `updateStepProgress(stepId: string, progress: number): Promise<void>` -- update progress 0-100
  - [ ] `failStep(stepId: string, error: string): Promise<void>` -- mark step as failed
  - [ ] Validate pipeline order (no skipping except hotfix)
  - [ ] Enforce max 1 active release per app per environment

- [ ] `src/modules/releases/release-approval.service.ts`
  - [ ] `requestApproval(releaseId: string, requiredCount: number, requestedBy: string): Promise<Approval>` -- create approval record, notify approvers
  - [ ] `submitDecision(approvalId: string, approverId: string, decision: ApprovalDecision): Promise<void>` -- record decision, check if all approvals received
  - [ ] `checkApprovalStatus(approvalId: string): Promise<ApprovalStatus>` -- current approval state
  - [ ] `expirePendingApprovals(): Promise<number>` -- scheduled job to expire after 72 hours
  - [ ] Self-approval prevention
  - [ ] Role validation (admin, tech_lead, devops_engineer)

- [ ] `src/modules/releases/release-notes.service.ts`
  - [ ] `generateNotes(releaseId: string): Promise<ReleaseNotes>` -- send change summaries to Claude, generate structured notes
  - [ ] `updateNotes(releaseId: string, notes: Partial<ReleaseNotes>): Promise<ReleaseNotes>` -- edit auto-generated notes
  - [ ] `publishNotes(releaseId: string): Promise<void>` -- mark notes as published

- [ ] `src/modules/releases/release-rollback.service.ts`
  - [ ] `rollback(releaseId: string, userId: string): Promise<RollbackResult>` -- restore all pre-release content via MCP, create rollback release
  - [ ] `validateRollbackWindow(releaseId: string): boolean` -- check 30-day window
  - [ ] Create new change records for each rolled-back component

- [ ] `src/modules/releases/release-sse.service.ts`
  - [ ] `streamStatus(releaseId: string): AsyncGenerator<ReleaseStatusEvent>` -- SSE stream for pipeline status
  - [ ] Events: stage_started, stage_completed, stage_failed, approval_requested, approval_received, deployment_complete, rollback_initiated

- [ ] `src/modules/releases/releases.service.ts`
  - [ ] `createRelease(data: CreateReleaseInput, userId: string): Promise<Release>` -- create release, snapshot changes, initialize pipeline
  - [ ] `createHotfix(data: CreateHotfixInput, userId: string): Promise<Release>` -- validate scope (max 5 components), create with hotfix pipeline
  - [ ] `getRelease(releaseId: string): Promise<Release>` -- with pipeline steps and changes
  - [ ] `listReleases(query: ListReleasesQuery): Promise<PaginatedResult<Release>>` -- paginated, filtered
  - [ ] `promote(releaseId: string, targetEnv: PipelineEnvironment, userId: string): Promise<PromotionResult>` -- delegate to pipeline service
  - [ ] `rollback(releaseId: string, userId: string): Promise<RollbackResult>` -- delegate to rollback service
  - [ ] `getStatus(releaseId: string): Promise<PipelineStep[]>` -- delegate to pipeline service

- [ ] `src/modules/releases/releases.controller.ts`
  - [ ] `POST /api/v1/releases` -- create release
  - [ ] `POST /api/v1/releases/hotfix` -- create hotfix release
  - [ ] `GET /api/v1/releases` -- list releases (paginated)
  - [ ] `GET /api/v1/releases/:id` -- get release details
  - [ ] `POST /api/v1/releases/:id/promote` -- promote to next environment
  - [ ] `POST /api/v1/releases/:id/approve` -- approve/reject release
  - [ ] `POST /api/v1/releases/:id/rollback` -- rollback release
  - [ ] `GET /api/v1/releases/:id/notes` -- get release notes
  - [ ] `POST /api/v1/releases/:id/notes/generate` -- generate release notes
  - [ ] `PUT /api/v1/releases/:id/notes` -- update release notes
  - [ ] `POST /api/v1/releases/:id/notes/publish` -- publish release notes
  - [ ] `GET /api/v1/releases/:id/status/stream` -- SSE pipeline status
  - [ ] Wire routes with authenticate() + authorize (varies by endpoint)

---

### 4. M10 AI Governance Module (apps/api/src/modules/governance/)

- [ ] `src/modules/governance/governance.validation.ts`
  - [ ] `CreateSafetyRuleSchema` (Zod) -- name, description?, ruleType, pattern, severity, action, priority?, enabled?
  - [ ] `UpdateSafetyRuleSchema` (Zod) -- name?, description?, pattern?, severity?, action?, priority?, enabled?
  - [ ] `ListRulesQuerySchema` (Zod) -- page, limit, ruleType?, severity?, enabled?
  - [ ] `ListInteractionsQuerySchema` (Zod) -- page, limit, userId?, module?, riskLevel?, fromDate?, toDate?

- [ ] `src/modules/governance/input-sanitizer.service.ts`
  - [ ] `sanitizeInput(input: AIInput): Promise<SanitizedInput>` -- run regex + semantic detection pipeline
  - [ ] `detectRegexThreats(prompt: string, rules: SafetyRule[]): ThreatResult[]` -- match prompt against regex rules
  - [ ] `detectSemanticThreats(prompt: string): Promise<ThreatResult[]>` -- Claude-based adversarial intent detection
  - [ ] `detectPII(prompt: string): PIIDetectionResult` -- SSN, credit card, password detection
  - [ ] `maskPII(prompt: string, piiLocations: PIILocation[]): string` -- replace PII with masked tokens
  - [ ] Log all threats immutably

- [ ] `src/modules/governance/output-validator.service.ts`
  - [ ] `validateOutput(output: AIOutput): Promise<SafetyValidationResult>` -- run validation pipeline
  - [ ] `validateSyntax(code: string): SyntaxResult` -- PL/SQL syntax check
  - [ ] `detectDangerousPatterns(code: string): PatternResult[]` -- DROP, TRUNCATE, GRANT, dynamic SQL
  - [ ] `classifyRisk(change: ProposedChange): Promise<RiskClassification>` -- weighted risk scoring (must complete in <500ms)
  - [ ] `checkComplianceRules(output: string, rules: SafetyRule[]): ComplianceResult` -- match against tenant rules

- [ ] `src/modules/governance/risk-classifier.service.ts`
  - [ ] `calculateRiskScore(factors: RiskFactors): number` -- weighted score 0-100
  - [ ] `classifyLevel(score: number): RiskLevel` -- map score to BAJO/MEDIO/ALTO/CRITICO
  - [ ] `determineApprovalRequirement(level: RiskLevel): { required: boolean; count: number }` -- approval logic
  - [ ] Weight factors: operation_type (30%), component_scope (20%), environment (25%), data_sensitivity (15%), rollback_complexity (10%)

- [ ] `src/modules/governance/governance-approval.service.ts`
  - [ ] `requestGovernanceApproval(interactionId: string, riskLevel: RiskLevel, requestedBy: string): Promise<Approval>` -- create approval for ALTO/CRITICO outputs
  - [ ] `submitDecision(approvalId: string, approverId: string, decision: ApprovalDecision): Promise<void>` -- record decision
  - [ ] `expirePendingApprovals(): Promise<number>` -- expire after 24 hours
  - [ ] Shared approval infrastructure with release approvals

- [ ] `src/modules/governance/audit-chain.service.ts`
  - [ ] `recordInteraction(interaction: AIInteractionInput): Promise<AIInteraction>` -- append to immutable log with hash chain
  - [ ] `computeChainHash(interaction: AIInteractionInput, previousHash: string): string` -- SHA-256 chain hash
  - [ ] `getInteractionHistory(query: InteractionQuery): Promise<PaginatedResult<AIInteraction>>` -- paginated query
  - [ ] `verifyChainIntegrity(fromId: string, toId: string): Promise<IntegrityResult>` -- verify hash chain
  - [ ] `getComplianceReport(filters: ComplianceFilter): Promise<ComplianceReport>` -- aggregated risk/usage report

- [ ] `src/modules/governance/safety-rules.service.ts`
  - [ ] `listRules(query: ListRulesQuery): Promise<PaginatedResult<SafetyRule>>` -- list with filters
  - [ ] `getRule(ruleId: string): Promise<SafetyRule>` -- single rule
  - [ ] `createRule(data: CreateRuleInput, userId: string): Promise<SafetyRule>` -- create custom rule
  - [ ] `updateRule(ruleId: string, data: UpdateRuleInput, userId: string): Promise<SafetyRule>` -- update rule
  - [ ] `deleteRule(ruleId: string, userId: string): Promise<void>` -- delete (prevent system rule deletion)
  - [ ] `getActiveRules(): Promise<SafetyRule[]>` -- enabled rules sorted by priority

- [ ] `src/modules/governance/governance.controller.ts`
  - [ ] `GET /api/v1/governance/rules` -- list safety rules
  - [ ] `GET /api/v1/governance/rules/:id` -- get single rule
  - [ ] `POST /api/v1/governance/rules` -- create custom rule
  - [ ] `PATCH /api/v1/governance/rules/:id` -- update rule
  - [ ] `DELETE /api/v1/governance/rules/:id` -- delete rule
  - [ ] `GET /api/v1/governance/interactions` -- list AI interactions (audit log)
  - [ ] `GET /api/v1/governance/interactions/:id` -- get single interaction
  - [ ] `POST /api/v1/governance/interactions/:id/approve` -- approve/reject ALTO/CRITICO output
  - [ ] `GET /api/v1/governance/compliance/report` -- compliance report
  - [ ] `POST /api/v1/governance/chain/verify` -- verify hash chain integrity
  - [ ] Wire routes with authenticate() + authorize (admin for rules, broader for interactions)

---

### 5. React UI Components (apps/web/src/)

- [ ] `src/features/releases/pages/ReleaseListPage.tsx`
  - [ ] Data table with releases (name, version, status, environment, type, date)
  - [ ] Filter by status, type, app
  - [ ] Create Release / Create Hotfix buttons

- [ ] `src/features/releases/pages/ReleaseDetailPage.tsx`
  - [ ] Pipeline visualization (4-stage progress bar)
  - [ ] Component list with snapshot status
  - [ ] Promote / Approve / Rollback action buttons
  - [ ] Real-time status via SSE
  - [ ] Release notes section

- [ ] `src/features/releases/components/PipelineVisualization.tsx`
  - [ ] Horizontal pipeline diagram (DEV -> QA -> STAGING -> PROD)
  - [ ] Stage status indicators (pending/active/passed/failed)
  - [ ] Progress bar per stage
  - [ ] Approval gate indicators

- [ ] `src/features/releases/components/CreateReleaseDialog.tsx`
  - [ ] Form: name, version, app selector, change selector (multi-select from change_log)
  - [ ] Description field
  - [ ] Schedule option
  - [ ] Hotfix toggle with justification field

- [ ] `src/features/releases/components/ApprovalPanel.tsx`
  - [ ] Approval status display
  - [ ] Approve / Reject buttons with reason field
  - [ ] Approver list with decision status
  - [ ] Expiry countdown

- [ ] `src/features/releases/components/ReleaseNotesEditor.tsx`
  - [ ] Auto-generated notes display (features, bug fixes, breaking changes, known issues)
  - [ ] Edit mode with Markdown
  - [ ] Regenerate button
  - [ ] Publish button

- [ ] `src/features/releases/hooks/useReleases.ts`
  - [ ] React Query hooks for CRUD, promote, approve, rollback
  - [ ] SSE hook for pipeline status streaming

- [ ] `src/features/governance/pages/GovernanceDashboardPage.tsx`
  - [ ] AI interaction audit log table
  - [ ] Risk distribution chart
  - [ ] Pending approvals queue
  - [ ] Compliance summary

- [ ] `src/features/governance/pages/SafetyRulesPage.tsx`
  - [ ] Rules data table with type, severity, action, enabled status
  - [ ] Create / Edit / Delete rule actions
  - [ ] Toggle enabled/disabled
  - [ ] System rules marked (non-deletable)

- [ ] `src/features/governance/components/InteractionDetailView.tsx`
  - [ ] Full prompt and response display
  - [ ] Risk score and classification
  - [ ] Sanitization details (removed patterns)
  - [ ] Approval status and decisions

- [ ] `src/features/governance/components/ComplianceReport.tsx`
  - [ ] Date range selector
  - [ ] Risk level breakdown chart
  - [ ] Module usage breakdown
  - [ ] Approval rate metrics
  - [ ] Export to PDF/CSV

- [ ] `src/features/governance/hooks/useGovernance.ts`
  - [ ] React Query hooks for rules CRUD, interactions, approvals, compliance

---

### 6. Unit Tests (apps/api/tests/)

- [ ] `tests/modules/releases/release-snapshot.service.test.ts`
  - [ ] Snapshot captures current component content
  - [ ] Snapshots are immutable
  - [ ] Pre-release content stored for rollback

- [ ] `tests/modules/releases/release-pipeline.service.test.ts`
  - [ ] Initialize standard pipeline (4 stages)
  - [ ] Initialize hotfix pipeline (2 stages)
  - [ ] Promote DEV -> QA succeeds
  - [ ] Promote skipping stages rejected
  - [ ] QA requires passing tests
  - [ ] Concurrent release detection
  - [ ] Progress updates 0-100

- [ ] `tests/modules/releases/release-approval.service.test.ts`
  - [ ] Create approval with 1 required
  - [ ] Create approval with 2 required
  - [ ] Self-approval rejected
  - [ ] Invalid role rejected
  - [ ] Approval expires after 72 hours
  - [ ] Rejection returns release to previous stage

- [ ] `tests/modules/releases/release-rollback.service.test.ts`
  - [ ] Rollback restores all components
  - [ ] Rollback creates new release record
  - [ ] Rollback window check (30 days)
  - [ ] Expired rollback window rejected

- [ ] `tests/modules/releases/release-notes.service.test.ts`
  - [ ] Generate notes from change summaries
  - [ ] Notes include features, bug fixes, breaking changes
  - [ ] Update notes
  - [ ] Publish notes

- [ ] `tests/modules/releases/releases.controller.test.ts`
  - [ ] POST /releases as developer -> 201
  - [ ] POST /releases/hotfix as developer -> 201
  - [ ] POST /releases/hotfix with > 5 changes -> 400
  - [ ] POST /releases/:id/promote as devops -> 200
  - [ ] POST /releases/:id/approve as admin -> 200
  - [ ] POST /releases/:id/approve as creator -> 403
  - [ ] POST /releases/:id/rollback -> 200
  - [ ] GET /releases/:id/status/stream -> SSE

- [ ] `tests/modules/governance/input-sanitizer.service.test.ts`
  - [ ] Detect SQL injection in prompt
  - [ ] Detect prompt injection attempt
  - [ ] Detect PII (SSN, credit card)
  - [ ] Mask PII in prompt
  - [ ] Clean prompt passes through
  - [ ] Threat logged immutably

- [ ] `tests/modules/governance/output-validator.service.test.ts`
  - [ ] Detect DROP TABLE in output
  - [ ] Detect TRUNCATE in output
  - [ ] Detect GRANT in output
  - [ ] Detect dynamic SQL injection
  - [ ] Clean PL/SQL passes validation
  - [ ] Risk classification in < 500ms

- [ ] `tests/modules/governance/risk-classifier.service.test.ts`
  - [ ] BAJO for low-risk CREATE in DEV
  - [ ] MEDIO for UPDATE in DEV
  - [ ] ALTO for DELETE in PROD
  - [ ] CRITICO for DROP in PROD
  - [ ] Weight factors sum to 100%
  - [ ] Score calculation matches formula

- [ ] `tests/modules/governance/audit-chain.service.test.ts`
  - [ ] Record interaction appends to log
  - [ ] Hash chain links to previous record
  - [ ] Verify chain integrity succeeds for valid chain
  - [ ] Verify chain integrity fails for tampered record
  - [ ] No UPDATE or DELETE possible (INSERT-only)

- [ ] `tests/modules/governance/safety-rules.service.test.ts`
  - [ ] Create custom rule
  - [ ] Update rule
  - [ ] Delete custom rule
  - [ ] Cannot delete system rule
  - [ ] List active rules sorted by priority
  - [ ] Toggle enabled/disabled

- [ ] `tests/modules/governance/governance.controller.test.ts`
  - [ ] GET /rules as admin -> 200
  - [ ] POST /rules as admin -> 201
  - [ ] POST /rules as developer -> 403
  - [ ] DELETE /rules/:id (system) -> 403
  - [ ] GET /interactions as admin -> 200
  - [ ] POST /interactions/:id/approve -> 200
  - [ ] GET /compliance/report -> 200

---

### 7. Integration Tests

- [ ] `tests/integration/release-pipeline.integration.test.ts`
  - [ ] Full pipeline: create release, promote DEV->QA->STAGING->PROD with approvals
  - [ ] Hotfix pipeline: create hotfix, promote DEV->PROD with double approval
  - [ ] Rollback: deploy then rollback, verify component restoration
  - [ ] Concurrent release prevention
  - [ ] Release notes generation and publication

- [ ] `tests/integration/governance.integration.test.ts`
  - [ ] Full flow: submit AI request, sanitize input, generate output, validate output, classify risk
  - [ ] ALTO change: approval required, approve, output released
  - [ ] CRITICO change: 2 approvals required, both approve, output released
  - [ ] Audit chain integrity verification across multiple interactions
  - [ ] Safety rule CRUD and enforcement

---

## File Summary

| Category | File Count |
|----------|------------|
| Database migrations | 7 |
| Shared types | 2 |
| Release Manager module | 9 |
| Governance module | 7 |
| React UI components | 12 |
| Unit tests | 12 |
| Integration tests | 2 |
| **Total** | **51** |

---

## Execution Order

The plan should be executed in the following order to respect dependencies:

1. Database migrations (024-030) -- schema must exist before service code
2. Shared types -- interfaces used by both modules
3. Release Manager services (release-snapshot -> release-pipeline -> release-approval -> release-notes -> release-rollback -> release-sse -> releases.service -> releases.controller)
4. Governance services (input-sanitizer + output-validator + risk-classifier -> governance-approval + audit-chain -> safety-rules -> governance.controller)
5. React UI components (Release pages, then Governance pages)
6. Unit tests (parallel per module)
7. Integration tests (sequential, requires running DB + MCP + AI service + notification service)
