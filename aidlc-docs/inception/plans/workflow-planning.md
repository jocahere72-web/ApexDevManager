# Workflow Planning — APEX Dev Manager

| Field | Value |
|-------|-------|
| **Project** | APEX Dev Manager |
| **Version** | 1.0 |
| **Date** | 2026-04-10 |
| **Status** | AI-DLC Generated — For Review |
| **Methodology** | AI-DLC (AI-Driven Development Life Cycle) |
| **Team Size** | Small (2-3 developers) |
| **Total Modules** | 19 (M0-M18) |
| **Total User Stories** | 57 across 21 epics |
| **Delivery Phases** | Fase 0 (3 weeks) + Fase 1 (8 weeks, S1-S4) + Fase 2 (10 weeks, S5-S9) + Fase 3 (8 weeks, S10-S12) |

---

## 1. Scope Analysis

### 1.1 Project Classification

| Dimension | Assessment |
|-----------|------------|
| **Project Type** | Greenfield — New Product |
| **Complexity** | Complex (enterprise SaaS, 19 modules, multi-tenant, AI-native, DR across OCI regions) |
| **Architecture** | React 18 + Node.js/Express + PostgreSQL 16 + Redis + OKE (Oracle Kubernetes Engine) |
| **AI Integration** | Claude API (Anthropic) primary + pluggable LLM router |
| **Multi-tenancy** | Shared DB with PostgreSQL RLS, tenant-scoped JWT |
| **Security** | 15 SECURITY rules enforced (OWASP-mapped), 9-role RBAC |
| **Infrastructure** | Two OCI regions with automated failover (DR) |
| **Target Market** | Colombian public sector municipalities, enterprise SaaS |

### 1.2 Impact Areas

| Impact Area | Affected | Rationale |
|-------------|----------|-----------|
| **User-Facing** | YES | 9 roles, 57 user stories, complete UI across 19 modules |
| **Structural** | YES | Greenfield architecture: monorepo, microservices on OKE, CI/CD pipelines |
| **Data Model** | YES | 50+ PostgreSQL tables with RLS, multi-tenant schema, audit trails |
| **API** | YES | RESTful API layer, ORDS integration, MCP Oracle APEX protocol |
| **NFR** | YES | Performance SLAs, security (OWASP), scalability (multi-tenant), DR, observability |

### 1.3 Complexity Factors

- **19 modules** with cross-cutting dependencies (M10 safety gates intercept all AI calls, M0 auth underpins everything)
- **Multi-tenant isolation** requiring RLS enforcement across all data access paths
- **AI integration** with anti-hallucination framework, prompt sanitization, confidence scoring
- **Two OCI regions** with automated failover and data replication
- **9 RBAC roles** with granular permission enforcement at API layer
- **APEX metadata awareness** via MCP protocol (live connection to Oracle APEX instances)
- **Small team** (2-3 devs) building an enterprise-grade platform

---

## 2. Stage Execution Plan

### 2.1 INCEPTION Phase

| Stage | Status | Depth | Rationale |
|-------|--------|-------|-----------|
| [x] Workspace Detection | EXECUTED | Standard | Greenfield detected, PRD v5.1 identified as input artifact |
| [x] Requirements Analysis | EXECUTED | Comprehensive | 18 questions answered, 623KB master spec generated covering all 19 modules |
| [x] User Stories | EXECUTED | Comprehensive | 57 stories across 21 epics, 9 roles, full traceability matrix |
| [~] Workflow Planning | EXECUTING | Comprehensive | This document. Complex project requires detailed unit decomposition and dependency mapping |
| [ ] Application Design | EXECUTE | Comprehensive | New components, service layer, data model, API contracts, multi-tenant patterns all require detailed design |
| [ ] Units Generation | EXECUTE | Comprehensive | 19 modules must be decomposed into 13 buildable units respecting dependencies and team capacity |

**Application Design Rationale**: Every module is new. The platform requires service layer design (auth service, connection service, AI orchestration service, deployment service), component interaction patterns (M10 as middleware for all AI calls, M6 change tracking across modules), data model design (50+ tables with RLS policies), and API contract definitions (REST endpoints, MCP protocol integration). Skipping this stage would create significant rework risk.

**Units Generation Rationale**: 19 modules cannot be built simultaneously by 2-3 developers. Strategic grouping into 13 units, respecting the module dependency graph and sprint roadmap, is essential for predictable delivery. Each unit must be independently deployable and testable.

### 2.2 CONSTRUCTION Phase (Per Unit)

| Stage | Execute/Skip | Depth | Rationale |
|-------|-------------|-------|-----------|
| Functional Design | EXECUTE | Varies per unit | Complex business logic in every unit: RBAC rules, change tracking, AI governance gates, deployment pipelines, cost attribution |
| NFR Requirements | EXECUTE | Comprehensive | Performance SLAs (P95 < 500ms API, P95 < 3s pages), security (15 OWASP rules), scalability (multi-tenant), DR (two regions), observability |
| NFR Design | EXECUTE | Comprehensive | Multi-tenant RLS patterns, Redis caching strategy, rate limiting, connection pooling, circuit breaker patterns, JWT rotation |
| Infrastructure Design | EXECUTE | Comprehensive | OKE cluster topology, VCN architecture, OCI services (Object Storage, Vault, Logging, Monitoring), PostgreSQL HA, Redis cluster, DR configuration |
| Code Generation | EXECUTE (always) | Varies per unit | Every unit produces deployable code |
| Build and Test | EXECUTE (always) | Comprehensive | CI/CD pipeline, unit tests (>70%), integration tests, security scans, AI regression suite, cross-tenant isolation verification |

**NFR Requirements depth justification**: The platform has explicit SLAs (P50/P95/P99 latencies per module), 15 security rules mapped to OWASP, multi-tenant isolation requirements verified by automated tests, and a DR architecture requiring automated failover. NFR cannot be treated as an afterthought.

**Infrastructure Design depth justification**: OKE cluster design, VCN with public/private subnets, OCI Vault for credential management, OCI Logging Service integration, PostgreSQL HA with streaming replication, Redis cluster for session/cache, and two-region DR with automated failover all require explicit design before code generation.

### 2.3 OPERATIONS Phase

| Stage | Status | Rationale |
|-------|--------|-----------|
| Operations | PLACEHOLDER | Future expansion. Build and test instructions cover deployment procedures for now. |

---

## 3. Unit Decomposition Strategy

### 3.1 Decomposition Principles

1. **Respect the module dependency graph**: Units are ordered so that foundation modules are built before dependent modules
2. **Align with sprint roadmap**: Each unit maps to one sprint (2 weeks), matching the established Fase 0/1/2/3 schedule
3. **Minimize cross-unit coupling**: Each unit is independently deployable and testable
4. **Team capacity constraint**: 2-3 developers per sprint means each unit should contain 1-2 modules plus supporting infrastructure
5. **Incremental value delivery**: Each unit produces a working increment that can be demonstrated

### 3.2 Unit Definitions

#### Unit 1: Foundation Infrastructure (Fase 0 — Weeks 1-3)

| Field | Value |
|-------|-------|
| **Sprint** | Pre-sprint (Fase 0) |
| **Duration** | 3 weeks |
| **Modules** | Cross-cutting infrastructure |
| **Stories** | US-001, US-002 |
| **Team** | 2-3 devs (full team) |

**Scope**:
- OKE cluster provisioning (primary region)
- VCN architecture (public/private subnets, security lists, NAT gateway)
- PostgreSQL 16 provisioned on OCI (HA configuration, RLS foundation)
- Redis cluster provisioned (session store + cache)
- CI/CD pipeline (GitHub Actions or OCI DevOps): build, test, deploy to DEV
- Project scaffolding: monorepo structure, React 18 app shell, Node.js/Express API skeleton
- Docker images (frontend, backend), Kubernetes manifests (Helm charts)
- OCI Vault configuration for secrets management
- OCI Logging Service integration
- Tenant provisioning schema (tenants table, RLS policies foundation)
- Environment baseline: DEV, QA, STAGING, PROD definitions
- Monitoring baseline: health check endpoints, Prometheus metrics

**Deliverable**: Empty but fully operational platform skeleton deployable to OKE with CI/CD, database, cache, logging, and monitoring infrastructure.

---

#### Unit 2: Auth and Core Backend (Fase 1 — Sprint S1)

| Field | Value |
|-------|-------|
| **Sprint** | S1 (Weeks 4-5) |
| **Duration** | 2 weeks |
| **Modules** | M0 (Authentication & Session Management) + M1 Backend (Connection Manager — backend only) |
| **Stories** | US-003, US-004, US-005, US-006, US-007 |
| **Dependencies** | Unit 1 (infrastructure, database, Redis) |

**Scope**:
- M0: JWT authentication (RS256), refresh token rotation, session management in Redis
- M0: RBAC engine (9 roles), permission enforcement middleware, account lockout
- M0: User CRUD (admin-only), invitation flow, audit event logging
- M1 Backend: Connection entity CRUD, ORDS/JDBC connection logic, AES-256 credential encryption
- M1 Backend: Connection health check service, OCI Vault integration for credential storage
- M1 Backend: Connection pool management (5 sessions per connection, 20 per tenant)
- Shared: Tenant context middleware (extract tenant from JWT, set RLS context)
- Shared: API error handling, request validation (Joi/Zod), rate limiting foundation

**Deliverable**: Authenticated API with RBAC, tenant isolation, and connection management backend.

---

#### Unit 3: Connection UI and Application Explorer (Fase 1 — Sprint S2)

| Field | Value |
|-------|-------|
| **Sprint** | S2 (Weeks 6-7) |
| **Duration** | 2 weeks |
| **Modules** | M1 UI (Connection Manager frontend) + M2 (Application Explorer) |
| **Stories** | US-006 (UI), US-007 (UI), US-008, US-009, US-047 |
| **Dependencies** | Unit 2 (M0 auth, M1 backend) |

**Scope**:
- M1 UI: Connection management screens (register, edit, delete, health dashboard)
- M1 UI: Connection wizard with validation feedback, connection list with status indicators
- M2: APEX metadata fetching via MCP Oracle APEX protocol
- M2: Application tree component (collapsible hierarchy: apps > pages > regions > items)
- M2: Component detail panel, tree search/filter, sync status indicators
- M2: Cross-environment comparison (side-by-side diff)
- M2: Offline mode with cached tree (read-only with staleness banner)
- Platform-wide search foundation (US-047)
- React component library foundation (design system tokens, layout components)

**Deliverable**: Developers can authenticate, register APEX connections, browse application structures, and compare environments.

---

#### Unit 4: Code Editor Studio (Fase 1 — Sprint S3)

| Field | Value |
|-------|-------|
| **Sprint** | S3 (Weeks 8-9) |
| **Duration** | 2 weeks |
| **Modules** | M3 (Code Editor Studio) |
| **Stories** | US-010, US-011, US-050 |
| **Dependencies** | Unit 3 (M1 connections, M2 explorer for navigation context) |

**Scope**:
- Monaco Editor integration (PL/SQL, SQL, JavaScript, CSS syntax highlighting)
- Auto-completion engine using APEX metadata (package/procedure/function names)
- Inline error detection (Oracle error codes from ORDS compilation)
- Diff view (before/after comparison for code changes)
- Apply changes via ORDS (execute PL/SQL, DDL against connected instance)
- Code review annotations (inline comments, resolution workflow, notifications)
- Editor sessions tracking (editor_sessions table: who is editing what)
- Real-time collaboration indicators (presence awareness for concurrent editors)
- Integration with M2 (open component from explorer in editor)

**Deliverable**: Full code editing experience with syntax support, compilation, and review capabilities.

---

#### Unit 5: AI Engine (Fase 1 — Sprint S4)

| Field | Value |
|-------|-------|
| **Sprint** | S4 (Weeks 10-11) |
| **Duration** | 2 weeks |
| **Modules** | M4 (AI Studio) + M10 stub (AI Governance — basic sanitization only) |
| **Stories** | US-012, US-013, US-052, US-025 (stub) |
| **Dependencies** | Unit 4 (M3 editor for code insertion), Unit 3 (M2 for application context), Unit 2 (M0 auth, M1 connections) |

**Scope**:
- M4: Claude API integration (chat completions with streaming)
- M4: Context assembly engine (gather APEX metadata, selected code, schema info for prompt context)
- M4: Prompt template library (code generation, explanation, review, refactoring)
- M4: Quick actions (generate, explain, review, optimize)
- M4: Chat interface with conversation history, follow-up context
- M4: Apply generated code in APEX via ORDS (with diff preview)
- M4: AI model selection configuration (admin UI for enabling/disabling providers)
- M4: Token consumption tracking (input/output/cache tokens per interaction)
- M10 Stub: Basic prompt sanitization (SQL injection pattern detection, system command removal)
- M10 Stub: Basic input/output logging to ai_interactions table
- Pluggable LLM router architecture (provider abstraction layer)

**Deliverable**: Developers can chat with AI, generate code grounded in APEX context, and apply results. Basic safety guardrails active.

---

#### Unit 6: PRD Suite (Fase 2 — Sprint S5)

| Field | Value |
|-------|-------|
| **Sprint** | S5 (Weeks 12-13) |
| **Duration** | 2 weeks |
| **Modules** | M8 (PRD Builder) + M5 (PRD-to-Page Generator) |
| **Stories** | US-014, US-015, US-016, US-017 |
| **Dependencies** | Unit 5 (M4 AI for requirements generation), Unit 3 (M2 explorer for page context) |

**Scope**:
- M8: PRD creation with guided templates (feature, enhancement, integration)
- M8: Requirement ID auto-assignment (RF-XXX), status tracking (draft/reviewed/approved)
- M8: Document import (text, Word, PDF, images) with AI-assisted parsing
- M8: Review workflow (submit, approve, reject, request changes)
- M8: AI-assisted requirements generation from feature descriptions
- M5: APEX page scaffold generation from approved PRD
- M5: Page collision detection and resolution
- M5: Wireframe preview before committing to APEX
- M5: Drag-and-drop layout customization in preview
- M5: Requirement traceability tags on generated components (RF-XXX metadata)
- M5 <-> M8 integration: approved PRD feeds directly into page generator

**Deliverable**: End-to-end flow from feature description to structured PRD to generated APEX page scaffolds.

---

#### Unit 7: Change Tracking and Schema (Fase 2 — Sprint S6)

| Field | Value |
|-------|-------|
| **Sprint** | S6 (Weeks 14-15) |
| **Duration** | 2 weeks |
| **Modules** | M6 (Change Manager) + M7 (Schema Inspector) |
| **Stories** | US-018, US-019, US-020, US-021, US-051 |
| **Dependencies** | Unit 4 (M3 editor for change tracking context), Unit 3 (M1/M2 for connections and metadata) |

**Scope**:
- M6: Change set entity (create, add/remove objects, change_set_id, manifest)
- M6: Centralized change_log (before/after state, applied_by, applied_at)
- M6: Visual diff (side-by-side comparison of changed objects)
- M6: Rollback capability (restore pre-change state)
- M6: Change set review workflow (submit, review, approve with notifications)
- M6: Change history with cursor-based pagination, filtering, CSV/JSON export
- M7: Schema object browser (tables, views, indexes, constraints, triggers, packages)
- M7: Column-level detail (data types, nullability, defaults, PK/FK relationships)
- M7: Visual entity-relationship diagram generation (interactive, exportable PNG/SVG)
- M7: ALTER script generation from visual schema modifications
- M7: Schema search with sub-second filtering
- Integration: M2 tree sync indicators reflecting change_log status

**Deliverable**: Complete change tracking with rollback and schema exploration with visual ER diagrams.

---

#### Unit 8: Release Pipeline and AI Safety (Fase 2 — Sprint S7)

| Field | Value |
|-------|-------|
| **Sprint** | S7 (Weeks 16-17) |
| **Duration** | 2 weeks |
| **Modules** | M9 (Release & Deployment Manager) + M10 full (AI Governance & Safety Engine) |
| **Stories** | US-022, US-023, US-024, US-049, US-025 (full), US-026 |
| **Dependencies** | Unit 7 (M6 change sets for deployment content), Unit 5 (M4/M10 stub to upgrade) |

**Scope**:
- M9: Pipeline configuration (DEV > QA > STAGING > PROD stages with approval gates)
- M9: Deployment execution (export change set, apply to target APEX instance via ORDS)
- M9: Rollback mechanism (restore pre-deployment state per object)
- M9: Hotfix track (expedited path with double approval: P0/P1/P2 classification)
- M9: Release notes generation (auto-generated from change set manifests)
- M9: Deployment audit trail (who approved, who executed, what changed, before/after)
- M9: Bulk export and backup (ZIP archive: APEX export SQL + DDL + seed data + manifest)
- M10 Full: Semantic prompt analysis (ML-based injection detection beyond basic patterns)
- M10 Full: Output validation (cross-reference AI output against live APEX metadata)
- M10 Full: Risk classification (LOW/MEDIUM/HIGH) with approval gates for HIGH risk
- M10 Full: Immutable AI interaction audit (append-only, no delete even by admin)
- M10 Full: Confidence scoring (flag low-confidence outputs for human review)
- M10 Full: Tenant-configurable safety rules

**Deliverable**: Complete CI/CD pipeline with approval gates and rollback. Full AI governance with semantic analysis and immutable audit.

---

#### Unit 9: Analysis and Documentation (Fase 2 — Sprint S8)

| Field | Value |
|-------|-------|
| **Sprint** | S8 (Weeks 18-19) |
| **Duration** | 2 weeks |
| **Modules** | M11 (Dependency & Impact Analyzer) + M12 (Auto Documentation Studio) |
| **Stories** | US-027, US-028, US-053, US-029, US-030, US-054 |
| **Dependencies** | Unit 7 (M7 schema data for dependency analysis), Unit 4 (M3 editor for doc generation context) |

**Scope**:
- M11: Object dependency graph (upstream/downstream visualization, interactive)
- M11: Impact analysis engine (< 3 seconds: scan packages, views, APEX pages for affected objects)
- M11: Impact severity classification (compile error, runtime error, data loss)
- M11: Regression plan suggestion (AI-assisted list of required test cases)
- M11: Security vulnerability scanner (check dependencies against CVE databases)
- M11: Integration with M3/M6 (impact check before applying changes from S8 onward)
- M12: PL/SQL package documentation generator (procedures, functions, parameters, return types)
- M12: Application-level documentation (page inventory, shared components, security scheme, data model)
- M12: Living documentation (auto-detect staleness when source code changes)
- M12: Mermaid diagram generation for data flows and component interactions
- M12: Export to Markdown and PDF
- M12: User-facing page documentation (field descriptions, navigation flows)

**Deliverable**: Dependency analysis with impact assessment and auto-generated living documentation.

---

#### Unit 10: Testing and Knowledge (Fase 2 — Sprint S9)

| Field | Value |
|-------|-------|
| **Sprint** | S9 (Weeks 20-21) |
| **Duration** | 2 weeks |
| **Modules** | M13 (Test Automation Studio) + M14 (GENESYS Knowledge Engine) |
| **Stories** | US-031, US-032, US-033, US-055, US-034, US-035, US-056 |
| **Dependencies** | Unit 9 (M11 for dependency-aware test generation), Unit 5 (M4 AI for test/knowledge generation) |

**Scope**:
- M13: utPLSQL test generation from PL/SQL packages (AI-assisted)
- M13: Test execution runner with pass/fail results, assertion details, coverage %
- M13: Test execution dashboard (trends, P/F ratios, coverage over last 30 runs)
- M13: Test case management (test suites linked to requirement IDs RF-XXX)
- M13: Requirements coverage matrix (identify untested requirements)
- M13: Synthetic test data generation (INSERT scripts respecting FK/PK/CHECK constraints)
- M13: Quality gates integration (block pipeline promotion if coverage < threshold)
- M14: Knowledge article CRUD (title, category, tags, content)
- M14: Article indexing for AI context retrieval (< 60 seconds after creation)
- M14: Version history for articles
- M14: GENESYS domain knowledge codification (naming conventions, security patterns, deployment workflows)
- M14: Article approval workflow (submit > review > approve/reject)
- M14: Knowledge analytics (top-referenced articles, content gaps, declining relevance)
- M14: AI Studio integration (cite knowledge articles in AI responses)

**Deliverable**: Automated test generation and execution with quality gates. Knowledge base powering contextual AI assistance.

---

#### Unit 11: Intelligence and Observability (Fase 3 — Sprint S10)

| Field | Value |
|-------|-------|
| **Sprint** | S10 (Weeks 22-23) |
| **Duration** | 2 weeks |
| **Modules** | M15 (Usage & Cost Intelligence) + M17 (Product Intelligence Dashboard + Observability + Incidents) |
| **Stories** | US-036, US-037, US-040, US-041, US-042, US-057 |
| **Dependencies** | Unit 5 (M4 token tracking data), Unit 2 (M0 user/tenant data), Unit 1 (OCI Logging/Monitoring) |

**Scope**:
- M15: Token consumption tracking (input/output/cache tokens per interaction, per tenant/user/module)
- M15: Cost calculation engine (cost per model, per tenant, per project)
- M15: Budget configuration (monthly quotas per tenant, per tier)
- M15: Budget alerts (80%/90%/100% threshold notifications)
- M15: Cost allocation reports (CSV export with team, project, resource type, unit cost)
- M15: Margin tracking (revenue vs Claude API + OCI costs)
- M17: Operational Command Center (real-time health, P50/P95/P99 latencies, error rates)
- M17: OCI observability integration (OCI Logging, Monitoring, APM)
- M17: Incident management (detect, triage, investigate, mitigate, resolve, postmortem)
- M17: Incident severity classification and escalation
- M17: Executive Dashboard (portfolio KPIs, velocity trends, quality scorecards, OKR progress)
- M17: Custom dashboard builder (drag-and-drop widgets from any module)
- M17: Application health scores (composite 0-100 based on error rate, latency, incidents)
- M17: PDF export for executive reports

**Deliverable**: Complete cost intelligence and operational/executive visibility layer.

---

#### Unit 12: Code Factory and Marketplace (Fase 3 — Sprint S11)

| Field | Value |
|-------|-------|
| **Sprint** | S11 (Weeks 24-25) |
| **Duration** | 2 weeks |
| **Modules** | M16 (Full Code Generation Factory) + M18 (Accelerators Marketplace) |
| **Stories** | US-038, US-039, US-043, US-044 |
| **Dependencies** | Unit 6 (M5/M8 PRD for generation input), Unit 5 (M4/M10 AI with safety), Unit 8 (M9 deployment) |

**Scope**:
- M16: End-to-end application generation from PRD (DDL + PL/SQL packages + APEX pages)
- M16: 8 artifact types: tables, sequences, constraints, packages, views, triggers, APEX pages, sample data
- M16: Generation preview (review before committing)
- M16: Deploy generated artifacts to DEV via ORDS (correct dependency order)
- M16: Code generation template customization (naming conventions, error handling, logging)
- M16: Requirement traceability in generated code (RF-XXX header comments)
- M16: M10 safety integration (all generation passes through governance engine)
- M18: Marketplace catalog (browse, search, filter by category)
- M18: Accelerator package structure (page templates, component libraries, integration connectors)
- M18: One-click install with APEX version compatibility validation
- M18: Package versioning and update notifications
- M18: Publisher portal (upload, metadata, review submission)
- M18: Publisher analytics (install count, ratings, feedback)

**Deliverable**: Full code generation from PRD to deployed application. Marketplace for reusable components.

---

#### Unit 13: SaaS Readiness (Fase 3 — Sprint S12)

| Field | Value |
|-------|-------|
| **Sprint** | S12 (Weeks 26-27, extended to Week 29) |
| **Duration** | 3-4 weeks (includes hardening) |
| **Modules** | Cross-cutting SaaS capabilities |
| **Stories** | US-045, US-046, US-048 |
| **Dependencies** | All prior units (SaaS readiness is a cross-cutting concern) |

**Scope**:
- Multi-tenant data isolation verification (automated RLS tests across all tables)
- Subscription tier management (Free, Pro, Enterprise) with feature gating
- Usage quota enforcement per tier (AI tokens, applications, connections, storage)
- SSO/SAML 2.0/OIDC integration (external identity provider support)
- Notification center (unified inbox: reviews, deployments, alerts, system events)
- Second OCI region provisioning (DR)
- Automated failover configuration and testing
- Data replication between regions (PostgreSQL streaming replication, Redis replication)
- Production hardening: load testing, security penetration testing, chaos engineering
- Tenant onboarding automation (self-service provisioning < 60 seconds)
- SaaS billing integration groundwork (usage metering for subscription tiers)
- End-to-end integration testing across all 19 modules
- Performance baseline verification (all SLAs met under multi-tenant load)

**Deliverable**: Production-ready SaaS platform with multi-tenant isolation, subscription management, SSO, DR, and verified SLAs.

---

## 4. Dependency Graph

### 4.1 Unit Dependency Map

```
Unit 1: Foundation Infrastructure
  |
  v
Unit 2: Auth & Core Backend (M0, M1-backend)
  |
  +---> Unit 3: Connection UI & Explorer (M1-UI, M2)
  |       |
  |       +---> Unit 4: Code Editor (M3)
  |       |       |
  |       |       +---> Unit 5: AI Engine (M4, M10-stub)
  |       |       |       |
  |       |       |       +---> Unit 6: PRD Suite (M8, M5)
  |       |       |       |       |
  |       |       |       |       +---> Unit 12: Factory & Marketplace (M16, M18)
  |       |       |       |
  |       |       |       +---> Unit 10: Testing & Knowledge (M13, M14)
  |       |       |
  |       |       +---> Unit 7: Change & Schema (M6, M7)
  |       |       |       |
  |       |       |       +---> Unit 8: Release & Safety (M9, M10-full)
  |       |       |       |
  |       |       |       +---> Unit 9: Analysis & Docs (M11, M12)
  |       |
  |       +---> Unit 11: Intelligence & Observability (M15, M17)
  |
  +---> Unit 13: SaaS Readiness (all units)
```

### 4.2 Dependency Matrix

| Unit | Depends On | Blocks |
|------|-----------|--------|
| U1 — Foundation | None | U2 |
| U2 — Auth & Core | U1 | U3, U11, U13 |
| U3 — Explorer | U2 | U4, U6, U7, U11 |
| U4 — Editor | U3 | U5, U7, U9 |
| U5 — AI Engine | U4 | U6, U8, U10, U12 |
| U6 — PRD Suite | U5, U3 | U12 |
| U7 — Change & Schema | U4, U3 | U8, U9 |
| U8 — Release & Safety | U7, U5 | U12 |
| U9 — Analysis & Docs | U7, U4 | (none critical) |
| U10 — Testing & Knowledge | U5, U9 | (none critical) |
| U11 — Intelligence | U2, U1 | (none critical) |
| U12 — Factory & Market | U6, U5, U8 | (none critical) |
| U13 — SaaS Readiness | All | None |

### 4.3 Critical Path

```
U1 --> U2 --> U3 --> U4 --> U5 --> U7 --> U8 --> U12 --> U13
                                    |
                                    +--> U6 --> U12
```

The critical path runs through the foundation, auth, editor, AI engine, change management, release pipeline, and code factory. Any delay on this path delays the entire project. Units 9, 10, and 11 have some scheduling flexibility.

---

## 5. Execution Visualization

### 5.1 Timeline — Gantt View

```
Phase    Sprint   Weeks     Unit                          Modules        Team
-------  -------  --------  ----------------------------  -------------  --------
Fase 0   Pre      W01-W03   U1  Foundation Infra          Cross-cutting  3 devs
         -------- --------- -------- FASE 0 GATE: Infra operational ----- --------
Fase 1   S1       W04-W05   U2  Auth & Core Backend       M0, M1-be     3 devs
         S2       W06-W07   U3  Connection UI & Explorer   M1-UI, M2     3 devs
         S3       W08-W09   U4  Code Editor Studio         M3            2-3 devs
         S4       W10-W11   U5  AI Engine                  M4, M10-stub  3 devs
         -------- --------- -------- FASE 1 GATE: Core platform MVP ------ --------
Fase 2   S5       W12-W13   U6  PRD Suite                  M8, M5        3 devs
         S6       W14-W15   U7  Change & Schema            M6, M7        3 devs
         S7       W16-W17   U8  Release & Safety           M9, M10-full  3 devs
         S8       W18-W19   U9  Analysis & Docs            M11, M12      2-3 devs
         S9       W20-W21   U10 Testing & Knowledge        M13, M14      2-3 devs
         -------- --------- -------- FASE 2 GATE: Full ALM platform ------- --------
Fase 3   S10      W22-W23   U11 Intelligence & Observ.     M15, M17      3 devs
         S11      W24-W25   U12 Factory & Marketplace      M16, M18      3 devs
         S12      W26-W29   U13 SaaS Readiness             Cross-cutting  3 devs
         -------- --------- -------- FASE 3 GATE: Production SaaS --------- --------
```

### 5.2 Sprint Calendar (2-week sprints)

```
2026
Apr  May  Jun  Jul  Aug  Sep  Oct  Nov
|W01 |W04 |W08 |W12 |W16 |W20 |W24 |W28 |
|W02 |W05 |W09 |W13 |W17 |W21 |W25 |W29 |
|W03 |W06 |W10 |W14 |W18 |W22 |W26 |    |
|    |W07 |W11 |W15 |W19 |W23 |W27 |    |
|    |    |    |    |    |    |    |    |
|<F0>|<----- Fase 1 ----->|             |
|    |    |    |<-------- Fase 2 ------>|
|    |    |    |    |    |    |<- F3 -->|

 U1   U2   U4   U6   U8   U10  U12
      U3   U5   U7   U9   U11  U13
```

### 5.3 Milestones

| Milestone | Target Date | Criteria |
|-----------|-------------|----------|
| **M-0: Infra Ready** | End Week 3 (May 2026) | OKE cluster operational, CI/CD green, DB + Redis healthy, monitoring active |
| **M-1: Core MVP** | End Week 11 (Jun 2026) | Auth + Connections + Explorer + Editor + AI Studio functional end-to-end |
| **M-2: Full ALM** | End Week 21 (Sep 2026) | All Fase 2 modules operational, deployment pipeline active, tests generating |
| **M-3: SaaS Launch** | End Week 29 (Nov 2026) | Multi-tenant isolation verified, SSO, DR tested, SLAs met, subscription mgmt |

---

## 6. Risk Assessment per Unit

### 6.1 Risk Register

| Unit | Risk | Likelihood | Impact | Mitigation |
|------|------|------------|--------|------------|
| **U1** | OKE provisioning delays (OCI service limits, IAM policies) | Medium | High | Pre-request OCI resource limits increase; have Terraform scripts tested in sandbox first |
| **U1** | PostgreSQL HA configuration complexity | Medium | Medium | Use OCI Database Service (managed) rather than self-managed; test failover in Fase 0 |
| **U2** | JWT/RBAC edge cases with 9 roles | Medium | Medium | Comprehensive permission matrix testing; automated RBAC integration tests from day 1 |
| **U2** | RLS policy correctness (tenant isolation) | High | Critical | Automated cross-tenant leakage tests in CI; dedicated RLS test suite |
| **U3** | MCP Oracle APEX protocol stability/completeness | High | High | Build abstraction layer; have fallback to direct ORDS calls; document MCP gaps early |
| **U3** | APEX metadata tree performance (large workspaces with 500+ pages) | Medium | Medium | Lazy-load tree nodes; implement metadata caching in Redis with TTL |
| **U4** | Monaco Editor integration complexity (PL/SQL auto-complete) | Medium | Medium | Start with basic syntax highlighting; add auto-complete incrementally using APEX metadata |
| **U5** | Claude API rate limits under multi-tenant load | High | High | Implement tenant-level rate limiting; queue management; budget alerts; pluggable LLM fallback |
| **U5** | AI hallucination in code generation (referencing non-existent objects) | High | High | M10 validation against live metadata; confidence scoring; mandatory human review for HIGH risk |
| **U6** | PRD-to-Page accuracy (AI generating incorrect APEX structures) | Medium | Medium | Preview + human review before commit; iterative refinement; template-based generation |
| **U7** | Change tracking completeness (capturing all object types) | Medium | High | Systematic APEX object type inventory; integration tests per object type |
| **U8** | Deployment rollback reliability | High | Critical | Snapshot-based rollback; test rollback in every deployment; blue-green deployment pattern |
| **U8** | M10 full semantic analysis false positives blocking legitimate prompts | Medium | Medium | Configurable sensitivity levels; admin override with audit; tuning period with monitoring |
| **U9** | Dependency graph accuracy for complex PL/SQL cross-references | Medium | Medium | Use Oracle DBA_DEPENDENCIES + static analysis; validate against manual analysis samples |
| **U10** | utPLSQL test generation quality (tests that always pass or are trivial) | Medium | Medium | AI prompt engineering for edge cases; human review of generated tests; coverage thresholds |
| **U11** | OCI Logging/Monitoring integration latency (data lag > 5 min SLA) | Low | Medium | Buffered ingestion; OCI service SLA validation; fallback to application-level metrics |
| **U12** | Full code generation producing non-functional applications | High | High | Staged generation (schema first, then packages, then pages); validation at each step; sandbox deployment |
| **U13** | DR failover time exceeds target | Medium | Critical | Regular DR drills (monthly); automated failover testing; DNS TTL optimization |
| **U13** | SSO integration complexity with diverse identity providers | Medium | Medium | Support SAML 2.0 + OIDC only; use battle-tested library (passport.js); test with 2-3 IdPs |

### 6.2 Risk Heat Map

```
                   Low Impact    Medium Impact    High Impact    Critical Impact
                  +-----------+----------------+--------------+----------------+
High Likelihood   |           | MCP protocol   | Claude rate  | RLS isolation  |
                  |           | M10 false pos  | limits       |                |
                  |           |                | AI hallucin. |                |
                  |           |                | M16 gen qual.|                |
                  +-----------+----------------+--------------+----------------+
Medium Likelihood |           | PG HA config   | Change track.| Deploy rollback|
                  |           | RBAC edge case | OKE delays   | DR failover    |
                  |           | Monaco PL/SQL  |              |                |
                  |           | PRD accuracy   |              |                |
                  |           | Dep. graph acc.|              |                |
                  |           | Test gen qual. |              |                |
                  |           | SSO complexity |              |                |
                  +-----------+----------------+--------------+----------------+
Low Likelihood    |           | OCI log lag    |              |                |
                  +-----------+----------------+--------------+----------------+
```

---

## 7. Recommended Depth per Stage

### 7.1 Construction Stage Depth by Unit

| Unit | Functional Design | NFR Requirements | NFR Design | Infrastructure Design | Code Generation |
|------|:--:|:--:|:--:|:--:|:--:|
| U1 — Foundation | Minimal | Comprehensive | Standard | **Comprehensive** | Standard |
| U2 — Auth & Core | **Comprehensive** | **Comprehensive** | **Comprehensive** | Standard | Standard |
| U3 — Explorer | Standard | Standard | Standard | Minimal | Standard |
| U4 — Editor | Standard | Standard | Standard | Minimal | Standard |
| U5 — AI Engine | **Comprehensive** | **Comprehensive** | **Comprehensive** | Standard | **Comprehensive** |
| U6 — PRD Suite | Standard | Standard | Standard | Minimal | Standard |
| U7 — Change & Schema | Standard | Standard | Standard | Minimal | Standard |
| U8 — Release & Safety | **Comprehensive** | **Comprehensive** | **Comprehensive** | Standard | **Comprehensive** |
| U9 — Analysis & Docs | Standard | Standard | Minimal | Minimal | Standard |
| U10 — Testing & Knowledge | Standard | Standard | Standard | Minimal | Standard |
| U11 — Intelligence | Standard | Standard | Standard | Standard | Standard |
| U12 — Factory & Market | **Comprehensive** | Standard | Standard | Minimal | **Comprehensive** |
| U13 — SaaS Readiness | Minimal | **Comprehensive** | **Comprehensive** | **Comprehensive** | Standard |

### 7.2 Depth Justification

**Comprehensive Functional Design** for:
- **U2 (Auth)**: RBAC with 9 roles, JWT lifecycle, RLS context propagation — security-critical business logic
- **U5 (AI Engine)**: Claude API integration, context assembly, pluggable LLM router, anti-hallucination — core differentiator
- **U8 (Release)**: Pipeline stages, approval gates, rollback, hotfix track, M10 full governance — deployment safety
- **U12 (Factory)**: End-to-end generation of 8 artifact types — highest complexity AI feature

**Comprehensive NFR** for:
- **U1, U2, U5, U8, U13**: These units define security boundaries, performance baselines, and reliability guarantees

**Comprehensive Infrastructure Design** for:
- **U1**: OKE cluster, VCN, database HA, Redis cluster — foundational infrastructure
- **U13**: Second region, DR failover, replication — production readiness

---

## 8. Quality Gates

### 8.1 Phase Gates

| Gate | Between | Required Criteria | Approver |
|------|---------|-------------------|----------|
| **FASE 0 GATE** | U1 → U2 | OKE cluster healthy, CI/CD pipeline green, PostgreSQL accepting connections, Redis cluster operational, monitoring endpoints responding, DEV environment accessible | Tech Lead |
| **FASE 1 GATE** | U5 → U6 | All M0-M4 functional tests pass, developer can authenticate + connect + browse + edit + chat with AI end-to-end, unit test coverage > 70% per module, zero P0/P1 defects open, RLS isolation tests pass | Tech Lead + PO |
| **FASE 2 GATE** | U10 → U11 | All M5-M14 functional tests pass, deployment pipeline promotes change sets through DEV > QA > STAGING, AI governance gates enforced, test coverage > 70%, integration tests pass, security scan clean | Tech Lead + PO |
| **FASE 3 GATE** | U13 (final) | All 19 modules operational, multi-tenant isolation verified, SSO functional with test IdP, DR failover < 5 min RTO, performance SLAs met (P95 < 500ms API, P95 < 3s UI), dual-approval deployment process verified, soak test (72h) passed | Tech Lead + PO + CTO |

### 8.2 Per-Unit Quality Criteria

| Criterion | Threshold | Enforcement Point |
|-----------|-----------|-------------------|
| Unit test coverage | >= 70% per module | CI pipeline — blocks merge |
| Integration test pass rate | 100% | CI pipeline — blocks merge |
| Security scan (OWASP) | Zero Critical/High findings | CI pipeline — blocks QA promotion |
| API response time | P95 < 500ms | Load test in STAGING |
| Cross-tenant isolation | Zero leakage in automated tests | CI pipeline — blocks merge |
| Code review | All PRs reviewed by at least 1 peer | GitHub branch protection |
| AI regression suite | 100% pass (after M10 full) | CI pipeline — blocks merge |
| Accessibility | WCAG 2.1 AA for all new UI | Manual review per sprint |

### 8.3 Definition of Done per Unit

A unit is "Done" when:

1. All user stories in the unit are implemented and pass their acceptance criteria
2. Unit test coverage >= 70% for all modules in the unit
3. Integration tests pass between the new unit and all previously completed units
4. Security scan reports zero Critical and High findings
5. API documentation (OpenAPI spec) is updated for new/changed endpoints
6. Database migration scripts are versioned and tested (up + down)
7. RLS policies verified for all new tables
8. Code reviewed and merged to develop branch
9. Successfully deployed to DEV and QA environments
10. No P0 or P1 defects open

---

## 9. Workflow Recommendations

### 9.1 Team Strategy for 2-3 Developers

Given the small team size and the breadth of the platform (19 modules, 57 stories), the following strategy maximizes throughput while managing risk:

**Pairing Rotation**:
- **Developer A** (Full-stack, backend-leaning): Leads backend services, API layer, database migrations, RLS policies
- **Developer B** (Full-stack, frontend-leaning): Leads React UI, component library, Monaco integration, dashboard design
- **Developer C** (Part-time or ramping up): Supports testing, documentation, infrastructure scripts, CI/CD maintenance
- Rotate pairs weekly within each sprint to distribute knowledge

**Parallel Work Within Sprints**:
- While units are sequential by dependency, within each unit the backend and frontend work can be parallelized
- Example (Unit 2): Dev A builds M0 auth API + M1 backend while Dev B builds login UI and connection management screens
- Example (Unit 5): Dev A builds Claude API integration while Dev B builds AI Studio chat interface

### 9.2 Risk Mitigation Priorities

1. **Start RLS testing immediately in U1**: Create the cross-tenant isolation test suite as part of foundation. Run it in CI from day one. This is the highest-impact risk.
2. **Build MCP abstraction layer early in U3**: Do not couple directly to MCP Oracle APEX protocol. Build an adapter that can fall back to ORDS. This protects against MCP instability.
3. **Implement Claude API rate limiting in U5**: Build tenant-level rate limiting before going multi-tenant. Include token budget enforcement from the start.
4. **Test deployment rollback exhaustively in U8**: Every deployment test must include a rollback test. Never ship rollback without verifying it works.
5. **Run DR drills before U13**: Do not wait until SaaS Readiness. Set up the second region in U11 or earlier and begin failover testing.

### 9.3 AI-DLC Stage Execution Approach

For the small team, the following approach optimizes the AI-DLC Construction loop:

**Batch Functional + NFR Design**: For standard-depth units (U3, U4, U6, U7, U9, U10, U11), combine Functional Design and NFR Requirements into a single design pass. This saves time without sacrificing quality for modules with well-understood patterns.

**Separate for Comprehensive Units**: For comprehensive-depth units (U2, U5, U8, U12, U13), execute all Construction stages separately. The complexity warrants the full treatment.

**Infrastructure Design Once**: Execute a comprehensive Infrastructure Design in U1 that covers the entire platform. Subsequent units reference the U1 infrastructure design and only document deltas (e.g., new OCI services needed, additional Kubernetes resources).

### 9.4 Recommended Next Steps

1. **Proceed to Application Design** (next AI-DLC stage): Define service layer architecture, component contracts, data model schema, API specifications, and multi-tenant patterns for the entire platform
2. **Proceed to Units Generation**: Formalize the 13 units defined in this document with detailed scope, acceptance criteria, and dependency contracts
3. **Begin Unit 1 (Foundation)**: After Application Design and Units Generation are approved, start the Construction phase with Unit 1

### 9.5 Execution Summary

| Metric | Value |
|--------|-------|
| **Total Units** | 13 |
| **Total Duration** | 29 weeks (~7 months) |
| **Total Sprints** | 12 (2-week) + 1 pre-sprint (3-week) |
| **Phases** | 4 (Fase 0, 1, 2, 3) |
| **Quality Gates** | 4 phase gates + per-unit DoD |
| **Construction Stages per Unit** | 5-6 (Functional, NFR Req, NFR Design, Infra Design, Code Gen, Build & Test) |
| **Critical Path Length** | 9 units (U1 > U2 > U3 > U4 > U5 > U7 > U8 > U12 > U13) |
| **Highest Risk Units** | U2 (RLS), U5 (AI), U8 (Deployment), U13 (DR) |
| **Team Allocation** | 2-3 full-time developers with weekly pair rotation |

---

*Document generated by AI-DLC Workflow Planning stage. All unit decompositions, dependencies, and depth recommendations are based on the APEX Dev Manager Enterprise Specification v1.0, 57 user stories across 21 epics, and the established Fase 0/1/2/3 delivery roadmap.*
