# Functional Design -- U8: Release Pipeline & AI Safety

## Document Information

| Field | Value |
|-------|-------|
| **Unit** | U8 -- Release Pipeline and AI Safety |
| **Sprint** | S7 (Fase 2) |
| **Duration** | 2 weeks |
| **Modules** | M9 (Release & Deployment Manager), M10 (AI Governance & Safety Engine -- full) |
| **Stories** | US-022, US-023, US-024, US-025 (full), US-026, US-049 |
| **Components** | C11 (Release Engine), C08 (Safety Engine) |
| **Status** | AI-DLC Generated -- For Review |
| **Date** | 2026-04-10 |

---

## 1. M9 -- Release & Deployment Manager

### 1.1 Pipeline: DEV -> QA -> STAGING -> PROD

The Release Manager orchestrates promotion of changes through a four-stage pipeline. Each stage has configurable approval gates, test requirements, and rollback capabilities.

#### Pipeline Flow

```
                    DEV           QA          STAGING        PROD
                     |             |              |            |
  Create Release --->|             |              |            |
  (snapshot changes) |             |              |            |
                     |-- promote ->|              |            |
                     |             |-- run tests ->|            |
                     |             |              |            |
                     |             |  [IF tests pass]          |
                     |             |-- promote --->|            |
                     |             |              |            |
                     |             |              |  [IF approval required]
                     |             |              |-- request -->|
                     |             |              |   approval   |
                     |             |              |<- approved --|
                     |             |              |-- promote -->|
                     |             |              |            |-- deploy
                     |             |              |            |-- smoke test
                     |             |              |            |-- complete
```

#### Pipeline Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| REL-R01 | Pipeline order | DEV -> QA -> STAGING -> PROD; stages cannot be skipped (except hotfix) |
| REL-R02 | Stage gate | Each promotion requires successful completion of previous stage |
| REL-R03 | Test requirement | QA stage requires passing test suite before promotion |
| REL-R04 | Approval gate | STAGING -> PROD requires approval (configurable 0, 1, or 2 approvers) |
| REL-R05 | Self-approval denied | Release creator cannot approve their own release |
| REL-R06 | Concurrent releases | Max 1 active release per app per environment |
| REL-R07 | Timeout | Pending approvals expire after 72 hours |

### 1.2 Release Creation with Component Snapshots

When a release is created, the system snapshots the current state of all included components.

#### Snapshot Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| REL-R08 | Snapshot content | Full code/definition of each component at release creation time |
| REL-R09 | Snapshot immutability | Snapshots are immutable after creation |
| REL-R10 | Change linkage | Release references specific change_log IDs |
| REL-R11 | Component locking | Components in an active release cannot be modified (warning + override) |
| REL-R12 | Snapshot storage | Stored in `release_changes` table with component content |

### 1.3 Approval Workflow

Configurable approval gates with 0, 1, or 2 required approvers.

#### Approval Flow

```
Release Creator      Release Manager       Approver(s)          PostgreSQL
  |                       |                    |                    |
  |-- promote to PROD --->|                    |                    |
  |                       |-- check config ---->|                    |
  |                       |   (how many         |                    |
  |                       |    approvers?)      |                    |
  |                       |                    |                    |
  |                       |  [IF 0 approvers]   |                    |
  |                       |-- auto-deploy ----->|                    |
  |                       |                    |                    |
  |                       |  [IF 1+ approvers]  |                    |
  |                       |-- create approval ->|                    |
  |                       |   request           |                    |
  |                       |-- notify approvers ->                    |
  |                       |                    |-- review          |
  |                       |                    |-- approve/reject ->|
  |                       |                    |                    |
  |                       |  [IF all approved]  |                    |
  |                       |-- proceed deploy -->|                    |
```

#### Approval Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| REL-R13 | Approver roles | Only admin, tech_lead, devops_engineer can approve |
| REL-R14 | Approval expiry | Pending approvals expire after 72 hours |
| REL-R15 | Rejection handling | Rejection returns release to STAGING with rejection reason |
| REL-R16 | Approval audit | All approval/rejection actions logged immutably |

### 1.4 Hotfix Track

Hotfixes bypass QA and STAGING stages with stricter safety controls.

#### Hotfix Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| REL-R17 | Hotfix path | DEV -> PROD (skip QA and STAGING) |
| REL-R18 | Double approval | Hotfixes always require 2 approvers regardless of config |
| REL-R19 | Hotfix justification | Mandatory text justification field |
| REL-R20 | Auto-rollback | If smoke test fails after hotfix deploy, automatic rollback |
| REL-R21 | Hotfix flag | Hotfixes are flagged in release history for audit |
| REL-R22 | Scope limit | Hotfixes limited to max 5 components |

### 1.5 Rollback

Restore all components from their snapshot state.

#### Rollback Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| REL-R23 | Full rollback | Rollback restores ALL components in the release to their pre-release state |
| REL-R24 | Rollback window | Rollback available for 30 days after deployment |
| REL-R25 | Rollback chain | Rollback creates a new release record with type='rollback' |
| REL-R26 | Partial rollback | Not supported; rollback is all-or-nothing |
| REL-R27 | Rollback notification | Notify all stakeholders on rollback |

### 1.6 Release Notes Auto-Generation

Claude generates release notes from the change records included in a release.

| Rule ID | Rule | Details |
|---------|------|---------|
| REL-R28 | Auto-generation | Claude analyzes change summaries and generates structured release notes |
| REL-R29 | Note sections | Features, Bug Fixes, Breaking Changes, Known Issues |
| REL-R30 | Editable | Auto-generated notes are editable before publishing |
| REL-R31 | Version format | Semantic versioning (MAJOR.MINOR.PATCH) |

### 1.7 Real-Time Status

| Rule ID | Rule | Details |
|---------|------|---------|
| REL-R32 | Delivery mechanism | SSE (Server-Sent Events) for real-time pipeline status |
| REL-R33 | Status events | stage_started, stage_completed, stage_failed, approval_requested, approval_received, deployment_complete, rollback_initiated |
| REL-R34 | Progress tracking | 0-100% progress per stage |
| REL-R35 | Event persistence | All status events persisted in pipeline_steps table |

---

## 2. M10 -- AI Governance & Safety Engine (Full)

### 2.1 Input Sanitization

All AI inputs are sanitized before reaching the Claude API.

#### Sanitization Pipeline

```
User Input      Input Sanitizer       Safety Engine        Claude API
  |                  |                     |                    |
  |-- raw prompt --->|                     |                    |
  |                  |-- regex scan ------>|                    |
  |                  |   (injection        |                    |
  |                  |    patterns)        |                    |
  |                  |                     |                    |
  |                  |-- semantic scan --->|                    |
  |                  |   (intent           |                    |
  |                  |    classification)  |                    |
  |                  |                     |                    |
  |                  |  [IF threats found] |                    |
  |                  |<-- BLOCK + log -----|                    |
  |<-- rejected -----|                     |                    |
  |                  |                     |                    |
  |                  |  [IF clean]         |                    |
  |                  |-- sanitized ------->|                    |
  |                  |                     |-- forward -------->|
  |                  |                     |<-- response -------|
```

#### Sanitization Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| GOV-R01 | Regex patterns | Detect SQL injection, prompt injection, system prompt override attempts |
| GOV-R02 | Semantic detection | Claude-based intent classification for adversarial prompts |
| GOV-R03 | PII detection | Detect and flag SSN, credit card numbers, passwords in prompts |
| GOV-R04 | Sanitized output | Return cleaned prompt with removed/masked patterns |
| GOV-R05 | Threat logging | All detected threats logged immutably with original input |

### 2.2 Output Validation

All AI-generated outputs are validated before presenting to the user or applying to APEX.

#### Validation Pipeline

| Step | Check | Details |
|------|-------|---------|
| 1 | Syntax validation | Generated PL/SQL parses without errors |
| 2 | Pattern detection | No DROP TABLE, TRUNCATE, GRANT, dynamic SQL injection |
| 3 | Risk classification | Score 0-100 based on operation type, scope, environment |
| 4 | Compliance check | Verify output follows tenant safety rules |

#### Output Validation Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| GOV-R06 | Validation latency | Risk classification must complete in < 500 ms |
| GOV-R07 | Dangerous operations | DROP, TRUNCATE, ALTER TABLE DROP COLUMN always classified CRITICO |
| GOV-R08 | DML scope | UPDATE/DELETE without WHERE clause classified ALTO |
| GOV-R09 | Grant detection | GRANT/REVOKE statements classified ALTO |
| GOV-R10 | Dynamic SQL | EXECUTE IMMEDIATE with concatenated variables classified ALTO |

### 2.3 Risk Levels

| Level | Score Range | Action | Approval Required |
|-------|-------------|--------|-------------------|
| BAJO | 0-25 | Auto-approve, log | No |
| MEDIO | 26-50 | Auto-approve, log with warning | No |
| ALTO | 51-75 | Block until approved | Yes (1 approver) |
| CRITICO | 76-100 | Block until approved | Yes (2 approvers) |

#### Risk Classification Factors

| Factor | Weight | Description |
|--------|--------|-------------|
| Operation type | 30% | CREATE=5, UPDATE=15, DELETE=25, DROP=30 |
| Component scope | 20% | Single item=5, Page=10, Package=15, Schema-wide=20 |
| Environment | 25% | DEV=5, QA=10, STAGING=15, PROD=25 |
| Data sensitivity | 15% | Non-sensitive=5, PII=10, Financial=15 |
| Rollback complexity | 10% | Easy=2, Moderate=5, Difficult=10 |

### 2.4 Immutable Audit Log

| Rule ID | Rule | Details |
|---------|------|---------|
| GOV-R11 | Append-only | INSERT-only policy on ai_interactions table; no UPDATE or DELETE |
| GOV-R12 | Admin restriction | Even admin role cannot delete audit records |
| GOV-R13 | Retention | Minimum 2-year retention, configurable per tenant |
| GOV-R14 | Tamper detection | SHA-256 hash chain linking each record to previous |
| GOV-R15 | Log content | Full request prompt, response, risk score, decision, approver |

### 2.5 Approval Workflow for ALTO/CRITICO Changes

```
AI Engine           Safety Engine        Approval Queue       Approver
  |                      |                    |                  |
  |-- output generated ->|                    |                  |
  |                      |-- classify risk -->|                  |
  |                      |                    |                  |
  |                      |  [BAJO/MEDIO]      |                  |
  |                      |-- auto-approve ---->|                  |
  |<-- output released --|                    |                  |
  |                      |                    |                  |
  |                      |  [ALTO]            |                  |
  |                      |-- create gate ----->|                  |
  |                      |                    |-- notify 1 ------>|
  |                      |                    |<-- decision ------|
  |                      |  [IF approved]     |                  |
  |<-- output released --|                    |                  |
  |                      |                    |                  |
  |                      |  [CRITICO]         |                  |
  |                      |-- create gate ----->|                  |
  |                      |                    |-- notify 2 ------>|
  |                      |                    |<-- decision 1 ----|
  |                      |                    |<-- decision 2 ----|
  |                      |  [IF both approved]|                  |
  |<-- output released --|                    |                  |
```

#### Approval Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| GOV-R16 | Approval expiry | Pending approvals expire after 24 hours |
| GOV-R17 | Rejection handling | Rejected outputs are logged but never applied |
| GOV-R18 | Approver roles | admin, tech_lead, devops_engineer can approve |
| GOV-R19 | Self-approval denied | Requestor cannot approve their own changes |
| GOV-R20 | Approval notification | Real-time notification to eligible approvers |

### 2.6 Safety Rules Configuration

| Rule ID | Rule | Details |
|---------|------|---------|
| GOV-R21 | Tenant-scoped rules | Each tenant can define custom safety rules |
| GOV-R22 | Rule types | regex_pattern, semantic_check, operation_block |
| GOV-R23 | Default rules | Platform ships with 20+ default safety rules |
| GOV-R24 | Rule priority | Rules evaluated in priority order; first match wins for severity escalation |
| GOV-R25 | Rule toggle | Rules can be enabled/disabled without deletion |
| GOV-R26 | Rule audit | All rule changes logged in audit trail |

---

## 3. Data Models

### 3.1 releases

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Release identifier |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant isolation |
| app_id | INTEGER | NOT NULL | Target APEX application |
| name | VARCHAR(255) | NOT NULL | Release name |
| version | VARCHAR(50) | NOT NULL | Semantic version (MAJOR.MINOR.PATCH) |
| type | VARCHAR(20) | NOT NULL, DEFAULT 'standard' | 'standard', 'hotfix', 'rollback' |
| status | VARCHAR(20) | NOT NULL, DEFAULT 'draft' | draft, in_progress, awaiting_approval, deployed, rolled_back, failed |
| current_environment | VARCHAR(10) | NOT NULL, DEFAULT 'dev' | Current pipeline position |
| description | TEXT | | Release description |
| justification | TEXT | | Required for hotfix type |
| scheduled_at | TIMESTAMPTZ | | Scheduled deployment time |
| deployed_at | TIMESTAMPTZ | | Actual deployment time |
| rolled_back_at | TIMESTAMPTZ | | Rollback timestamp |
| rollback_of | UUID | FK releases(id) | For rollback type, references original release |
| created_by | UUID | FK users(id), NOT NULL | Release creator |
| created_at | TIMESTAMPTZ | DEFAULT NOW() | Creation timestamp |
| updated_at | TIMESTAMPTZ | DEFAULT NOW() | Last update |

**Indexes:**
- `idx_releases_tenant` ON (tenant_id)
- `idx_releases_tenant_app` ON (tenant_id, app_id, created_at DESC)
- `idx_releases_status` ON (tenant_id, status) WHERE status NOT IN ('deployed', 'rolled_back', 'failed')
- UNIQUE `uq_releases_app_env_active` ON (app_id, current_environment) WHERE status = 'in_progress'

**RLS:** `releases_tenant_isolation` USING (tenant_id::text = current_setting('app.current_tenant', true))

### 3.2 release_changes

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Row identifier |
| release_id | UUID | FK releases(id), NOT NULL | Parent release |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant isolation |
| change_id | UUID | FK change_log(id), NOT NULL | Linked change record |
| component_type | VARCHAR(50) | NOT NULL | Component type at snapshot |
| component_id | INTEGER | NOT NULL | Component ID at snapshot |
| component_name | VARCHAR(255) | NOT NULL | Component name at snapshot |
| snapshot_content | TEXT | NOT NULL | Component content at release creation |
| pre_release_content | TEXT | | Content before release (for rollback) |
| created_at | TIMESTAMPTZ | DEFAULT NOW() | Snapshot timestamp |

**Indexes:**
- `idx_release_changes_release` ON (release_id)
- `idx_release_changes_tenant` ON (tenant_id)
- UNIQUE `uq_release_changes_release_change` ON (release_id, change_id)

**RLS:** `release_changes_tenant_isolation` USING (tenant_id::text = current_setting('app.current_tenant', true))

### 3.3 pipeline_steps

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Step identifier |
| release_id | UUID | FK releases(id), NOT NULL | Parent release |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant isolation |
| environment | VARCHAR(10) | NOT NULL | dev, qa, staging, prod |
| status | VARCHAR(20) | NOT NULL, DEFAULT 'pending' | pending, in_progress, passed, failed, skipped |
| approval_required | BOOLEAN | NOT NULL, DEFAULT FALSE | Whether approval needed |
| test_passed | INTEGER | | Tests passed count |
| test_failed | INTEGER | | Tests failed count |
| test_skipped | INTEGER | | Tests skipped count |
| progress | SMALLINT | DEFAULT 0 | 0-100 progress percentage |
| started_at | TIMESTAMPTZ | | Step start timestamp |
| completed_at | TIMESTAMPTZ | | Step completion timestamp |
| error_message | TEXT | | Error if failed |

**Indexes:**
- `idx_pipeline_steps_release` ON (release_id, environment)
- `idx_pipeline_steps_tenant` ON (tenant_id)

**RLS:** `pipeline_steps_tenant_isolation` USING (tenant_id::text = current_setting('app.current_tenant', true))

### 3.4 approvals

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Approval identifier |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant isolation |
| resource_type | VARCHAR(20) | NOT NULL | 'release' or 'ai_output' |
| resource_id | UUID | NOT NULL | ID of release or ai_interaction |
| required_count | SMALLINT | NOT NULL | Number of approvals required (1 or 2) |
| status | VARCHAR(20) | NOT NULL, DEFAULT 'pending' | pending, approved, rejected, expired |
| requested_by | UUID | FK users(id), NOT NULL | Who requested approval |
| expires_at | TIMESTAMPTZ | NOT NULL | Approval expiry |
| resolved_at | TIMESTAMPTZ | | When final decision made |
| created_at | TIMESTAMPTZ | DEFAULT NOW() | Creation timestamp |

**Indexes:**
- `idx_approvals_tenant` ON (tenant_id)
- `idx_approvals_resource` ON (resource_type, resource_id)
- `idx_approvals_status` ON (tenant_id, status) WHERE status = 'pending'

**RLS:** `approvals_tenant_isolation` USING (tenant_id::text = current_setting('app.current_tenant', true))

### 3.5 approval_decisions

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Decision identifier |
| approval_id | UUID | FK approvals(id), NOT NULL | Parent approval |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant isolation |
| approver_id | UUID | FK users(id), NOT NULL | Who approved/rejected |
| decision | VARCHAR(10) | NOT NULL, CHECK | 'approved' or 'rejected' |
| reason | TEXT | | Approval/rejection reason |
| created_at | TIMESTAMPTZ | DEFAULT NOW() | Decision timestamp |

**Indexes:**
- `idx_approval_decisions_approval` ON (approval_id)
- UNIQUE `uq_approval_decisions_approver` ON (approval_id, approver_id)

**RLS:** `approval_decisions_tenant_isolation` USING (tenant_id::text = current_setting('app.current_tenant', true))

### 3.6 release_notes

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Notes identifier |
| release_id | UUID | FK releases(id), NOT NULL, UNIQUE | Parent release |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant isolation |
| version | VARCHAR(50) | NOT NULL | Release version |
| features | JSONB | NOT NULL, DEFAULT '[]' | Array of feature descriptions |
| bug_fixes | JSONB | NOT NULL, DEFAULT '[]' | Array of bug fix descriptions |
| breaking_changes | JSONB | NOT NULL, DEFAULT '[]' | Array of breaking changes |
| known_issues | JSONB | NOT NULL, DEFAULT '[]' | Array of known issues |
| generated_by | VARCHAR(10) | NOT NULL | 'ai' or 'user' |
| published | BOOLEAN | DEFAULT FALSE | Whether notes are published |
| created_at | TIMESTAMPTZ | DEFAULT NOW() | Creation timestamp |
| updated_at | TIMESTAMPTZ | DEFAULT NOW() | Last update |

**RLS:** `release_notes_tenant_isolation` USING (tenant_id::text = current_setting('app.current_tenant', true))

### 3.7 ai_interactions

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Interaction identifier |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant isolation |
| user_id | UUID | FK users(id), NOT NULL | Requesting user |
| module | VARCHAR(50) | NOT NULL | Source module (M4, M5, M8, etc.) |
| request_prompt | TEXT | NOT NULL | Full request prompt |
| request_hash | VARCHAR(64) | NOT NULL | SHA-256 of request for dedup |
| response_content | TEXT | NOT NULL | Full AI response |
| model_id | VARCHAR(100) | NOT NULL | Claude model used |
| input_tokens | INTEGER | NOT NULL | Input token count |
| output_tokens | INTEGER | NOT NULL | Output token count |
| risk_level | VARCHAR(10) | NOT NULL | BAJO, MEDIO, ALTO, CRITICO |
| risk_score | SMALLINT | NOT NULL | 0-100 risk score |
| sanitization_applied | BOOLEAN | NOT NULL, DEFAULT FALSE | Whether input was sanitized |
| removed_patterns | JSONB | | Patterns removed during sanitization |
| approval_status | VARCHAR(20) | | NULL (no approval needed), pending, approved, rejected |
| approval_id | UUID | FK approvals(id) | Linked approval (for ALTO/CRITICO) |
| chain_hash | VARCHAR(64) | NOT NULL | SHA-256 hash linking to previous record |
| previous_id | UUID | FK ai_interactions(id) | Previous record in hash chain |
| created_at | TIMESTAMPTZ | DEFAULT NOW() | Interaction timestamp |

**Indexes:**
- `idx_ai_interactions_tenant` ON (tenant_id, created_at DESC)
- `idx_ai_interactions_user` ON (user_id, created_at DESC)
- `idx_ai_interactions_risk` ON (tenant_id, risk_level)
- `idx_ai_interactions_module` ON (tenant_id, module)
- `idx_ai_interactions_chain` ON (chain_hash)

**RLS Policy (INSERT-only for non-admin):**
- `ai_interactions_tenant_read` USING (tenant_id::text = current_setting('app.current_tenant', true)) FOR SELECT
- `ai_interactions_tenant_insert` WITH CHECK (tenant_id::text = current_setting('app.current_tenant', true)) FOR INSERT
- No UPDATE or DELETE policies (append-only enforcement)

### 3.8 safety_rules

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Rule identifier |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant isolation |
| name | VARCHAR(255) | NOT NULL | Rule name |
| description | TEXT | | Rule description |
| rule_type | VARCHAR(20) | NOT NULL, CHECK | 'regex_pattern', 'semantic_check', 'operation_block' |
| pattern | TEXT | NOT NULL | Regex pattern or rule expression |
| severity | VARCHAR(10) | NOT NULL, CHECK | 'info', 'warning', 'error', 'critical' |
| action | VARCHAR(20) | NOT NULL, CHECK | 'flag', 'block', 'require_approval' |
| priority | SMALLINT | NOT NULL, DEFAULT 100 | Lower = higher priority |
| enabled | BOOLEAN | NOT NULL, DEFAULT TRUE | Whether rule is active |
| is_system | BOOLEAN | NOT NULL, DEFAULT FALSE | System rules cannot be deleted |
| created_by | UUID | FK users(id) | Creator (NULL for system rules) |
| created_at | TIMESTAMPTZ | DEFAULT NOW() | Creation timestamp |
| updated_at | TIMESTAMPTZ | DEFAULT NOW() | Last update |

**Indexes:**
- `idx_safety_rules_tenant` ON (tenant_id)
- `idx_safety_rules_enabled` ON (tenant_id, enabled, priority) WHERE enabled = TRUE

**RLS:** `safety_rules_tenant_isolation` USING (tenant_id::text = current_setting('app.current_tenant', true))

---

## 4. Error Codes

| Code | HTTP | Description |
|------|------|-------------|
| REL_NOT_FOUND | 404 | Release does not exist |
| REL_INVALID_PROMOTION | 400 | Cannot promote (stage order violation or tests failing) |
| REL_APPROVAL_REQUIRED | 403 | Promotion requires approval |
| REL_SELF_APPROVAL | 403 | Cannot approve own release |
| REL_APPROVAL_EXPIRED | 410 | Approval request has expired |
| REL_CONCURRENT_RELEASE | 409 | Active release already exists for app+environment |
| REL_ROLLBACK_EXPIRED | 400 | Rollback window (30 days) has expired |
| REL_HOTFIX_SCOPE | 400 | Hotfix exceeds 5 component limit |
| REL_HOTFIX_APPROVAL | 403 | Hotfix requires 2 approvers |
| GOV_INPUT_BLOCKED | 403 | Input sanitization detected threat |
| GOV_OUTPUT_BLOCKED | 403 | Output validation blocked (ALTO/CRITICO) |
| GOV_APPROVAL_REQUIRED | 403 | Change requires governance approval |
| GOV_APPROVAL_EXPIRED | 410 | Governance approval has expired (24h) |
| GOV_SELF_APPROVAL | 403 | Cannot approve own AI output |
| GOV_RULE_NOT_FOUND | 404 | Safety rule does not exist |
| GOV_SYSTEM_RULE | 403 | Cannot delete system safety rule |
| GOV_VALIDATION_TIMEOUT | 504 | Risk classification exceeded 500ms |
