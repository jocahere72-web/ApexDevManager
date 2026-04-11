# Units of Work — APEX Dev Manager

## Document Information

| Field | Value |
|-------|-------|
| **Project** | APEX Dev Manager |
| **Version** | 1.0 |
| **Date** | 2026-04-10 |
| **Status** | AI-DLC Generated -- For Review |
| **Total Units** | 13 (U1-U13) |
| **Total Modules** | 19 (M0-M18) |
| **Total User Stories** | 57 across 21 epics |
| **Team Size** | 2-3 developers |
| **Duration** | 29 weeks (Fase 0 + 12 sprints) |

---

## 1. Code Organization Strategy

This is a greenfield monorepo deployed as a monolith on OKE (Oracle Kubernetes Engine) with a logical modular internal structure.

```
apex-dev-manager/
├── apps/
│   ├── web/                    # React 18 + Vite + TypeScript
│   │   ├── src/
│   │   │   ├── components/     # Shared UI components
│   │   │   ├── features/       # Feature modules (one per M0-M18)
│   │   │   │   ├── auth/                # M0 - Authentication
│   │   │   │   ├── connections/         # M1 - Connection Manager
│   │   │   │   ├── explorer/            # M2 - Application Explorer
│   │   │   │   ├── editor/              # M3 - Code Editor Studio
│   │   │   │   ├── ai-studio/           # M4 - AI Studio
│   │   │   │   ├── prd-to-page/         # M5 - PRD-to-Page Generator
│   │   │   │   ├── change-manager/      # M6 - Change Manager
│   │   │   │   ├── schema-inspector/    # M7 - Schema Inspector
│   │   │   │   ├── prd-builder/         # M8 - PRD Builder
│   │   │   │   ├── release-manager/     # M9 - Release & Deployment
│   │   │   │   ├── ai-governance/       # M10 - AI Governance
│   │   │   │   ├── dependency-analyzer/ # M11 - Dependency Analyzer
│   │   │   │   ├── auto-docs/           # M12 - Auto Documentation
│   │   │   │   ├── test-studio/         # M13 - Test Automation
│   │   │   │   ├── knowledge-engine/    # M14 - Knowledge Engine
│   │   │   │   ├── usage-intelligence/  # M15 - Usage & Cost
│   │   │   │   ├── code-factory/        # M16 - Code Generation Factory
│   │   │   │   ├── dashboards/          # M17 - Product Intelligence
│   │   │   │   └── marketplace/         # M18 - Accelerators Marketplace
│   │   │   ├── hooks/
│   │   │   ├── services/       # API client services
│   │   │   ├── stores/         # State management
│   │   │   └── types/
│   │   └── package.json
│   └── api/                    # Node.js + Express + TypeScript
│       ├── src/
│       │   ├── modules/        # Module services (one per M0-M18)
│       │   │   ├── auth/                # M0
│       │   │   ├── connections/         # M1
│       │   │   ├── explorer/            # M2
│       │   │   ├── editor/              # M3
│       │   │   ├── ai-studio/           # M4
│       │   │   ├── prd-to-page/         # M5
│       │   │   ├── change-manager/      # M6
│       │   │   ├── schema-inspector/    # M7
│       │   │   ├── prd-builder/         # M8
│       │   │   ├── release-manager/     # M9
│       │   │   ├── ai-governance/       # M10
│       │   │   ├── dependency-analyzer/ # M11
│       │   │   ├── auto-docs/           # M12
│       │   │   ├── test-studio/         # M13
│       │   │   ├── knowledge-engine/    # M14
│       │   │   ├── usage-intelligence/  # M15
│       │   │   ├── code-factory/        # M16
│       │   │   ├── dashboards/          # M17
│       │   │   └── marketplace/         # M18
│       │   ├── middleware/     # Auth, tenant, rate limiting
│       │   ├── integrations/  # MCP, ORDS, node-oracledb
│       │   ├── events/        # Event bus, handlers
│       │   ├── shared/        # Shared utilities, types
│       │   └── config/
│       └── package.json
├── packages/
│   └── shared-types/          # Shared TypeScript types
├── infra/
│   ├── terraform/             # OCI infrastructure
│   ├── helm/                  # Kubernetes charts
│   └── docker/                # Dockerfiles
├── docs/                      # Developer documentation
├── scripts/                   # Build/deploy scripts
└── package.json               # Monorepo root (pnpm workspaces)
```

### Module-to-Directory Mapping

| Module | Backend Path | Frontend Path |
|--------|-------------|---------------|
| M0 | `api/src/modules/auth/` | `web/src/features/auth/` |
| M1 | `api/src/modules/connections/` | `web/src/features/connections/` |
| M2 | `api/src/modules/explorer/` | `web/src/features/explorer/` |
| M3 | `api/src/modules/editor/` | `web/src/features/editor/` |
| M4 | `api/src/modules/ai-studio/` | `web/src/features/ai-studio/` |
| M5 | `api/src/modules/prd-to-page/` | `web/src/features/prd-to-page/` |
| M6 | `api/src/modules/change-manager/` | `web/src/features/change-manager/` |
| M7 | `api/src/modules/schema-inspector/` | `web/src/features/schema-inspector/` |
| M8 | `api/src/modules/prd-builder/` | `web/src/features/prd-builder/` |
| M9 | `api/src/modules/release-manager/` | `web/src/features/release-manager/` |
| M10 | `api/src/modules/ai-governance/` | `web/src/features/ai-governance/` |
| M11 | `api/src/modules/dependency-analyzer/` | `web/src/features/dependency-analyzer/` |
| M12 | `api/src/modules/auto-docs/` | `web/src/features/auto-docs/` |
| M13 | `api/src/modules/test-studio/` | `web/src/features/test-studio/` |
| M14 | `api/src/modules/knowledge-engine/` | `web/src/features/knowledge-engine/` |
| M15 | `api/src/modules/usage-intelligence/` | `web/src/features/usage-intelligence/` |
| M16 | `api/src/modules/code-factory/` | `web/src/features/code-factory/` |
| M17 | `api/src/modules/dashboards/` | `web/src/features/dashboards/` |
| M18 | `api/src/modules/marketplace/` | `web/src/features/marketplace/` |

---

## 2. Unit Definitions

---

### U1: Foundation Infrastructure

| Field | Value |
|-------|-------|
| **Unit ID** | U1 |
| **Name** | Foundation Infrastructure |
| **Sprint / Phase** | Pre-sprint (Fase 0) |
| **Duration** | 3 weeks (Weeks 1-3) |
| **Modules** | Cross-cutting infrastructure (no specific module) |
| **User Stories** | US-001, US-002 |

#### Components Involved

| Component | Description |
|-----------|-------------|
| OKE Cluster | Oracle Kubernetes Engine cluster (primary region) |
| VCN Architecture | Public/private subnets, security lists, NAT gateway |
| PostgreSQL 16 | OCI Database Service with HA, RLS foundation |
| Redis Cluster | Session store + cache layer |
| CI/CD Pipeline | GitHub Actions or OCI DevOps: build, test, deploy |
| Monorepo Scaffold | pnpm workspaces, React 18 shell, Node.js/Express skeleton |
| Docker/Helm | Container images + Kubernetes manifests |
| OCI Vault | Secrets management |
| OCI Logging | Centralized logging service |
| Monitoring | Health check endpoints, Prometheus metrics |

#### Key Deliverables

- [ ] OKE cluster provisioned and accessible
- [ ] VCN with public/private subnets configured
- [ ] PostgreSQL 16 with HA, tenant table, RLS policies foundation
- [ ] Redis cluster for sessions and caching
- [ ] CI/CD pipeline: build, lint, test, deploy to DEV (green pipeline)
- [ ] Monorepo scaffolding: React 18 app shell + Node.js/Express API skeleton
- [ ] Docker images (frontend, backend) building successfully
- [ ] Helm charts for OKE deployment
- [ ] OCI Vault configured for secrets
- [ ] OCI Logging integration active
- [ ] Health check endpoints returning 200
- [ ] Environment baseline: DEV, QA, STAGING, PROD definitions
- [ ] Prometheus metrics endpoint exposed

#### Entry Criteria

- OCI tenancy provisioned with sufficient resource limits
- GitHub repository created
- Team access configured (OCI IAM, GitHub)
- OCI service limits pre-requested (compute, networking, database)

#### Exit Criteria (Definition of Done)

- [ ] Empty platform skeleton deploys to OKE via CI/CD without manual intervention
- [ ] PostgreSQL database is accessible from OKE pods with RLS enabled
- [ ] Redis cluster responds to ping from OKE pods
- [ ] Health check endpoint returns 200 from both frontend and backend
- [ ] CI/CD pipeline runs build + lint + unit test stages (all green)
- [ ] Helm chart produces a working deployment via `helm install`
- [ ] OCI Vault stores at least one test secret retrievable by API pods
- [ ] Monitoring dashboard shows basic metrics (pod health, response times)

#### Technical Risks

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| OKE provisioning delays (OCI service limits) | Medium | High | Pre-request resource limits; test Terraform in sandbox |
| PostgreSQL HA configuration complexity | Medium | Medium | Use OCI Database Service (managed); test failover in Fase 0 |
| CI/CD pipeline reliability | Low | Medium | Start simple (build+test); add stages incrementally |

#### Team Assignment

| Developer | Focus Area |
|-----------|-----------|
| Dev 1 (Lead) | OKE, VCN, Terraform, Helm charts |
| Dev 2 | PostgreSQL, Redis, OCI Vault, monitoring |
| Dev 3 | Monorepo scaffolding, CI/CD pipeline, Docker images |

---

### U2: Auth and Core Backend

| Field | Value |
|-------|-------|
| **Unit ID** | U2 |
| **Name** | Auth and Core Backend |
| **Sprint / Phase** | S1 (Fase 1) |
| **Duration** | 2 weeks (Weeks 4-5) |
| **Modules** | M0 (Authentication & Session Management) + M1 Backend (Connection Manager -- backend only) |
| **User Stories** | US-003, US-004, US-005, US-006, US-007 |

#### Components Involved

| Component | Description |
|-----------|-------------|
| JWT Auth Service | RS256 token issuance, refresh rotation |
| RBAC Engine | 9-role permission system, middleware enforcement |
| Session Manager | Redis-backed session storage |
| User Service | CRUD, invitation flow, audit event logging |
| Connection Service (BE) | Connection entity CRUD, ORDS/JDBC connection logic |
| Credential Vault | AES-256 encryption, OCI Vault integration |
| Tenant Middleware | JWT tenant extraction, RLS context setting |
| Rate Limiter | Foundation rate limiting middleware |

#### Key Deliverables

- [ ] JWT authentication with RS256 signing and refresh token rotation
- [ ] RBAC engine with 9 roles and permission enforcement middleware
- [ ] Session management in Redis (create, validate, invalidate)
- [ ] User CRUD (admin-only) with invitation flow
- [ ] Audit event logging (auth events: login, logout, failed attempts)
- [ ] Connection entity CRUD with validation
- [ ] ORDS/JDBC connection establishment logic
- [ ] AES-256 credential encryption with OCI Vault storage
- [ ] Connection health check service
- [ ] Connection pool management (5 sessions/connection, 20/tenant)
- [ ] Tenant context middleware (extract from JWT, set RLS context)
- [ ] API error handling framework and request validation (Zod)
- [ ] Rate limiting foundation

#### Entry Criteria

- [ ] U1 completed: OKE cluster, PostgreSQL, Redis, CI/CD all operational
- [ ] Database schema for tenants, users, roles, permissions, connections tables defined

#### Exit Criteria (Definition of Done)

- [ ] User can authenticate via JWT and receive valid access + refresh tokens
- [ ] Refresh token rotation works (old refresh token invalidated after use)
- [ ] RBAC middleware blocks unauthorized API calls (verified by tests for all 9 roles)
- [ ] Tenant A cannot access Tenant B data (cross-tenant isolation test passes)
- [ ] Connection to an APEX instance can be created, validated, and stored
- [ ] Connection credentials are encrypted at rest in OCI Vault
- [ ] Connection health check returns status within 5 seconds
- [ ] Audit log captures all auth events with timestamp, user, IP, outcome
- [ ] API error responses follow consistent format
- [ ] Rate limiting rejects requests exceeding threshold with 429 status
- [ ] All unit tests pass (>70% coverage for new code)

#### Technical Risks

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| JWT/RBAC edge cases with 9 roles | Medium | Medium | Comprehensive permission matrix testing |
| RLS policy correctness (tenant isolation) | High | Critical | Automated cross-tenant leakage tests in CI |
| ORDS connectivity variability | Medium | Medium | Build abstraction layer; timeout handling |

#### Team Assignment

| Developer | Focus Area |
|-----------|-----------|
| Dev 1 (Lead) | JWT auth, RBAC engine, tenant middleware |
| Dev 2 | Connection service, credential vault, health checks |
| Dev 3 | User service, audit logging, rate limiting, API framework |

---

### U3: Connection UI and Application Explorer

| Field | Value |
|-------|-------|
| **Unit ID** | U3 |
| **Name** | Connection UI and Application Explorer |
| **Sprint / Phase** | S2 (Fase 1) |
| **Duration** | 2 weeks (Weeks 6-7) |
| **Modules** | M1 UI (Connection Manager frontend) + M2 (Application Explorer) |
| **User Stories** | US-006 (UI), US-007 (UI), US-008, US-009, US-047 |

#### Components Involved

| Component | Description |
|-----------|-------------|
| Connection UI | Registration wizard, edit/delete, health dashboard |
| Connection List | Status indicators, search, filtering |
| MCP Client | APEX metadata fetching via MCP Oracle APEX protocol |
| Application Tree | Collapsible hierarchy (apps > pages > regions > items) |
| Component Detail Panel | Properties display for selected tree node |
| Tree Search | Real-time search/filter across tree nodes |
| Cross-Env Comparison | Side-by-side diff between environments |
| Global Search | Platform-wide search bar (foundation) |
| Design System | React component library foundation (tokens, layouts) |

#### Key Deliverables

- [ ] Connection management screens (register, edit, delete, health dashboard)
- [ ] Connection wizard with validation feedback
- [ ] Connection list with real-time status indicators
- [ ] MCP Oracle APEX protocol client integration
- [ ] Application tree component (collapsible, lazy-loaded)
- [ ] Component detail panel with property display
- [ ] Tree search with real-time filtering
- [ ] Cross-environment comparison (side-by-side diff)
- [ ] Offline mode with cached tree (read-only, staleness banner)
- [ ] Platform-wide search foundation (US-047)
- [ ] React component library foundation (design tokens, layout components)

#### Entry Criteria

- [ ] U2 completed: JWT auth, RBAC, Connection backend all operational
- [ ] MCP Oracle APEX protocol documentation reviewed
- [ ] Design system tokens defined (colors, typography, spacing)

#### Exit Criteria (Definition of Done)

- [ ] Developer can register an APEX connection via the UI wizard
- [ ] Connection health dashboard shows status for all registered connections
- [ ] Application tree renders within 3 seconds for a workspace with 50+ pages
- [ ] Tree search filters nodes in real time as user types
- [ ] Component detail panel shows properties when a node is clicked
- [ ] Cross-environment comparison displays side-by-side diff correctly
- [ ] Global search returns results grouped by artifact type within 2 seconds
- [ ] Offline mode renders cached tree with staleness banner
- [ ] All new React components follow design system tokens
- [ ] Frontend unit tests pass (>70% coverage for new components)

#### Technical Risks

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| MCP Oracle APEX protocol stability | High | High | Abstraction layer; ORDS fallback; document gaps early |
| Tree performance for large workspaces (500+ pages) | Medium | Medium | Lazy-load nodes; Redis metadata caching with TTL |
| Design system scope creep | Low | Low | Limit to foundation tokens; iterate in later units |

#### Team Assignment

| Developer | Focus Area |
|-----------|-----------|
| Dev 1 (Lead) | MCP client, Application Explorer tree, comparison |
| Dev 2 | Connection UI screens, wizard, health dashboard |
| Dev 3 | Design system foundation, global search, offline mode |

---

### U4: Code Editor Studio

| Field | Value |
|-------|-------|
| **Unit ID** | U4 |
| **Name** | Code Editor Studio |
| **Sprint / Phase** | S3 (Fase 1) |
| **Duration** | 2 weeks (Weeks 8-9) |
| **Modules** | M3 (Code Editor Studio) |
| **User Stories** | US-010, US-011, US-050 |

#### Components Involved

| Component | Description |
|-----------|-------------|
| Monaco Editor | PL/SQL, SQL, JavaScript, CSS syntax highlighting |
| Auto-Complete Engine | APEX metadata-driven suggestions |
| Error Detection | Inline Oracle error codes from ORDS compilation |
| Diff View | Before/after code comparison |
| ORDS Executor | Apply PL/SQL and DDL changes via ORDS |
| Review Annotations | Inline comments, resolution workflow |
| Editor Sessions | Tracking concurrent editors (editor_sessions table) |
| Presence Indicators | Real-time collaboration awareness |

#### Key Deliverables

- [ ] Monaco Editor integration with PL/SQL, SQL, JS, CSS syntax highlighting
- [ ] Auto-completion using APEX metadata (package/procedure/function names)
- [ ] Inline error detection (Oracle error codes from ORDS compilation)
- [ ] Diff view for before/after code comparison
- [ ] Apply changes via ORDS (execute PL/SQL, DDL against connected instance)
- [ ] Code review annotations (inline comments, resolution workflow, notifications)
- [ ] Editor sessions tracking (who is editing what)
- [ ] Real-time collaboration indicators (presence awareness)
- [ ] Integration with M2 (open component from explorer in editor)

#### Entry Criteria

- [ ] U3 completed: Connection UI, Application Explorer, MCP client operational
- [ ] Monaco Editor npm package evaluated and integration approach defined
- [ ] ORDS compilation API endpoints identified and tested

#### Exit Criteria (Definition of Done)

- [ ] Editor renders PL/SQL code with syntax highlighting within 2 seconds
- [ ] Auto-completion dropdown appears when typing `package_name.`
- [ ] Syntax errors are underlined with Oracle error code in problems panel
- [ ] Diff view displays old/new code side-by-side
- [ ] Changes can be applied to connected APEX instance via ORDS
- [ ] Tech lead can add inline review comments on selected lines
- [ ] Developer sees gutter icons for unresolved review comments
- [ ] Presence indicator shows when another developer edits the same file
- [ ] Clicking a node in Application Explorer opens it in the editor
- [ ] All unit tests pass (>70% coverage for editor services)

#### Technical Risks

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| Monaco Editor PL/SQL auto-complete complexity | Medium | Medium | Start with basic syntax; add auto-complete incrementally |
| ORDS compilation API latency | Medium | Low | Async compilation with progress indicator |
| WebSocket stability for presence indicators | Medium | Medium | Graceful degradation; polling fallback |

#### Team Assignment

| Developer | Focus Area |
|-----------|-----------|
| Dev 1 (Lead) | Monaco Editor integration, auto-completion, error detection |
| Dev 2 | ORDS executor, diff view, M2 integration |
| Dev 3 | Review annotations, editor sessions, presence indicators |

---

### U5: AI Engine

| Field | Value |
|-------|-------|
| **Unit ID** | U5 |
| **Name** | AI Engine |
| **Sprint / Phase** | S4 (Fase 1) |
| **Duration** | 2 weeks (Weeks 10-11) |
| **Modules** | M4 (AI Studio) + M10 stub (AI Governance -- basic sanitization) |
| **User Stories** | US-012, US-013, US-052, US-025 (stub) |

#### Components Involved

| Component | Description |
|-----------|-------------|
| Claude API Client | Chat completions with streaming |
| Context Assembly Engine | Gather APEX metadata, code, schema for prompt context |
| Prompt Template Library | Code generation, explanation, review, refactoring |
| Quick Actions | Generate, explain, review, optimize buttons |
| Chat Interface | Conversation history with follow-up context |
| Code Applier | Insert generated code in APEX via ORDS with diff preview |
| Model Config UI | Admin UI for enabling/disabling LLM providers |
| Token Tracker | Input/output/cache token counting per interaction |
| Prompt Sanitizer (M10 stub) | SQL injection pattern detection, system command removal |
| Interaction Logger (M10 stub) | Basic logging to ai_interactions table |
| LLM Router | Pluggable provider abstraction layer |

#### Key Deliverables

- [ ] Claude API integration (chat completions with streaming)
- [ ] Context assembly engine (APEX metadata + code + schema context)
- [ ] Prompt template library (generate, explain, review, refactor)
- [ ] Quick actions (generate, explain, review, optimize)
- [ ] Chat interface with conversation history and follow-up context
- [ ] Apply generated code in APEX via ORDS with diff preview
- [ ] AI model selection configuration (admin UI)
- [ ] Token consumption tracking per interaction
- [ ] M10 stub: Basic prompt sanitization
- [ ] M10 stub: Basic input/output logging to ai_interactions table
- [ ] Pluggable LLM router architecture

#### Entry Criteria

- [ ] U4 completed: Code Editor operational for code insertion target
- [ ] U3 completed: Application Explorer available for context assembly
- [ ] U2 completed: Auth and connections operational
- [ ] Claude API key provisioned and rate limits understood
- [ ] ai_interactions table schema defined

#### Exit Criteria (Definition of Done)

- [ ] Developer can submit a natural language prompt and receive a streaming PL/SQL response
- [ ] Context assembly includes relevant APEX metadata when application is selected
- [ ] Generated code can be inserted at cursor position in Code Editor
- [ ] Chat maintains conversation context across follow-up questions
- [ ] Admin can enable/disable AI model providers
- [ ] Token consumption is tracked per interaction (input, output, cache)
- [ ] Prompt sanitization blocks SQL injection patterns
- [ ] All AI interactions are logged in ai_interactions table
- [ ] LLM router can switch between providers without code changes
- [ ] Response time < 15 seconds for standard code generation requests
- [ ] All unit tests pass (>70% coverage for AI services)

#### Technical Risks

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| Claude API rate limits under multi-tenant load | High | High | Tenant-level rate limiting; queue management; budget alerts |
| AI hallucination (referencing non-existent objects) | High | High | M10 validation against metadata; confidence scoring |
| Context window management for large schemas | Medium | Medium | Selective context assembly; summarization for large schemas |

#### Team Assignment

| Developer | Focus Area |
|-----------|-----------|
| Dev 1 (Lead) | Claude API client, LLM router, context assembly |
| Dev 2 | Chat interface, prompt templates, quick actions |
| Dev 3 | M10 stub (sanitization, logging), token tracking, model config UI |

---

### U6: PRD Suite

| Field | Value |
|-------|-------|
| **Unit ID** | U6 |
| **Name** | PRD Suite |
| **Sprint / Phase** | S5 (Fase 2) |
| **Duration** | 2 weeks (Weeks 12-13) |
| **Modules** | M8 (PRD Builder) + M5 (PRD-to-Page Generator) |
| **User Stories** | US-014, US-015, US-016, US-017 |

#### Components Involved

| Component | Description |
|-----------|-------------|
| PRD Editor | Guided template creation (feature, enhancement, integration) |
| Requirement Tracker | Auto-assignment RF-XXX IDs, status tracking |
| Document Importer | Text, Word, PDF, image import with AI parsing |
| Review Workflow | Submit, approve, reject, request changes |
| AI Requirements Gen | Generate requirements from feature descriptions |
| Page Scaffold Generator | APEX page generation from approved PRD |
| Collision Detector | Detect conflicting page/component IDs |
| Wireframe Preview | Visual preview before committing to APEX |
| Layout Customizer | Drag-and-drop region placement |
| Traceability Engine | RF-XXX tags on generated components |

#### Key Deliverables

- [ ] PRD creation with guided templates (feature, enhancement, integration)
- [ ] Requirement ID auto-assignment (RF-XXX) with status tracking
- [ ] Document import (text, Word, PDF, images) with AI-assisted parsing
- [ ] Review workflow (submit, approve, reject, request changes)
- [ ] AI-assisted requirements generation from feature descriptions
- [ ] APEX page scaffold generation from approved PRD
- [ ] Page collision detection and resolution
- [ ] Wireframe preview before committing to APEX
- [ ] Drag-and-drop layout customization in preview
- [ ] Requirement traceability tags on generated components

#### Entry Criteria

- [ ] U5 completed: AI Studio operational for requirements generation
- [ ] U3 completed: Application Explorer available for page context
- [ ] PRD template structures defined and reviewed

#### Exit Criteria (Definition of Done)

- [ ] Tech lead can create a PRD from a template with auto-assigned RF-XXX IDs
- [ ] AI generates functional and non-functional requirements from a feature description within 20 seconds
- [ ] Review workflow notifies reviewers and tracks approval status
- [ ] Developer can generate APEX page scaffolds from an approved PRD within 30 seconds
- [ ] Generated components have RF-XXX traceability metadata tags
- [ ] Wireframe preview renders correctly before APEX commit
- [ ] Page collision detection identifies conflicting component IDs
- [ ] All unit tests pass (>70% coverage for new code)

#### Technical Risks

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| PRD-to-Page accuracy (incorrect APEX structures) | Medium | Medium | Preview + human review; template-based generation |
| Document import reliability (PDF/image parsing) | Medium | Low | Start with text/Word; add PDF/image incrementally |
| Complex review workflow state management | Low | Low | State machine pattern; comprehensive state transition tests |

#### Team Assignment

| Developer | Focus Area |
|-----------|-----------|
| Dev 1 (Lead) | M5 page scaffold generator, collision detection, traceability |
| Dev 2 | M8 PRD editor, templates, requirement tracker |
| Dev 3 | AI requirements generation, document import, review workflow |

---

### U7: Change Tracking and Schema

| Field | Value |
|-------|-------|
| **Unit ID** | U7 |
| **Name** | Change Tracking and Schema |
| **Sprint / Phase** | S6 (Fase 2) |
| **Duration** | 2 weeks (Weeks 14-15) |
| **Modules** | M6 (Change Manager) + M7 (Schema Inspector) |
| **User Stories** | US-018, US-019, US-020, US-021, US-051 |

#### Components Involved

| Component | Description |
|-----------|-------------|
| Change Set Service | Create, manage, track change sets |
| Change Log | Centralized before/after state tracking |
| Visual Diff | Side-by-side comparison of changed objects |
| Rollback Engine | Restore pre-change state |
| Change Review | Submit, review, approve workflow with notifications |
| Change History | Paginated history with CSV/JSON export |
| Schema Browser | Categorized object list (tables, views, indexes, etc.) |
| Column Inspector | Data types, nullability, defaults, PK/FK details |
| ER Diagram Generator | Interactive entity-relationship diagrams |
| ALTER Script Generator | DDL from visual schema modifications |
| Schema Search | Sub-second filtering across all object categories |

#### Key Deliverables

- [ ] Change set entity (create, add/remove objects, unique change_set_id)
- [ ] Centralized change_log (before/after state, applied_by, applied_at)
- [ ] Visual diff (side-by-side comparison)
- [ ] Rollback capability (restore pre-change state)
- [ ] Change set review workflow (submit, review, approve with notifications)
- [ ] Change history with cursor-based pagination, filtering, CSV/JSON export
- [ ] Schema object browser (tables, views, indexes, constraints, triggers, packages)
- [ ] Column-level detail (data types, nullability, defaults, PK/FK)
- [ ] Visual ER diagram generation (interactive, exportable PNG/SVG)
- [ ] ALTER script generation from visual schema modifications
- [ ] Schema search with sub-second filtering
- [ ] M2 tree sync indicators reflecting change_log status

#### Entry Criteria

- [ ] U4 completed: Code Editor operational for change tracking context
- [ ] U3 completed: Connection Manager and Application Explorer operational
- [ ] change_sets, change_log, schema_cache table schemas defined

#### Exit Criteria (Definition of Done)

- [ ] Developer can create a change set, add modified objects, and see manifest
- [ ] Visual diff correctly shows before/after for all APEX object types
- [ ] Rollback restores pre-change state and verifies restoration
- [ ] Review workflow notifies tech lead and blocks promotion until approved
- [ ] Schema browser displays all object categories with correct counts
- [ ] Column detail shows data types, nullability, PK/FK relationships
- [ ] ER diagram renders correctly for selected tables (exportable to PNG/SVG)
- [ ] ALTER scripts execute successfully against connected schema
- [ ] Schema search returns results within 1 second
- [ ] All unit tests pass (>70% coverage for new code)

#### Technical Risks

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| Change tracking completeness (all APEX object types) | Medium | High | Systematic APEX object type inventory; per-type integration tests |
| ER diagram rendering for large schemas (200+ tables) | Medium | Medium | Virtualized rendering; limit visible nodes; zoom controls |
| ALTER script correctness | Medium | High | Validate scripts in sandbox before execution; preview mode |

#### Team Assignment

| Developer | Focus Area |
|-----------|-----------|
| Dev 1 (Lead) | M6 change set service, change log, rollback engine |
| Dev 2 | M7 schema browser, column inspector, schema search |
| Dev 3 | Visual diff, ER diagram generator, ALTER script generator |

---

### U8: Release Pipeline and AI Safety

| Field | Value |
|-------|-------|
| **Unit ID** | U8 |
| **Name** | Release Pipeline and AI Safety |
| **Sprint / Phase** | S7 (Fase 2) |
| **Duration** | 2 weeks (Weeks 16-17) |
| **Modules** | M9 (Release & Deployment Manager) + M10 full (AI Governance & Safety Engine) |
| **User Stories** | US-022, US-023, US-024, US-049, US-025 (full), US-026 |

#### Components Involved

| Component | Description |
|-----------|-------------|
| Pipeline Configurator | Multi-stage pipeline with approval gates |
| Deployment Executor | Export change set, apply to target APEX via ORDS |
| Rollback Service | Restore pre-deployment state per object |
| Hotfix Track | Expedited path with double approval (P0/P1/P2) |
| Release Notes Generator | Auto-generated from change set manifests |
| Deployment Audit | Who approved, executed, what changed |
| Bulk Export | ZIP archive (APEX SQL + DDL + seed data + manifest) |
| Semantic Analyzer (M10) | ML-based injection detection |
| Output Validator (M10) | Cross-reference AI output against live APEX metadata |
| Risk Classifier (M10) | LOW/MEDIUM/HIGH with approval gates |
| Immutable Audit (M10) | Append-only AI interaction log |
| Confidence Scorer (M10) | Flag low-confidence outputs for human review |

#### Key Deliverables

- [ ] Pipeline configuration (DEV > QA > STAGING > PROD with approval gates)
- [ ] Deployment execution (export change set, apply via ORDS)
- [ ] Rollback mechanism (restore pre-deployment state per object)
- [ ] Hotfix track (expedited path with double approval)
- [ ] Release notes auto-generation from change set manifests
- [ ] Deployment audit trail (approver, executor, objects, before/after)
- [ ] Bulk export and backup (ZIP archive)
- [ ] M10 full: Semantic prompt analysis (ML-based injection detection)
- [ ] M10 full: Output validation against live APEX metadata
- [ ] M10 full: Risk classification (LOW/MEDIUM/HIGH) with approval gates
- [ ] M10 full: Immutable AI interaction audit (append-only)
- [ ] M10 full: Confidence scoring for AI outputs
- [ ] M10 full: Tenant-configurable safety rules

#### Entry Criteria

- [ ] U7 completed: Change sets available for deployment content
- [ ] U5 completed: M4/M10 stub operational (upgrade to full M10)
- [ ] Pipeline stage definitions (DEV, QA, STAGING, PROD) agreed upon
- [ ] ORDS deployment API endpoints verified for all environments

#### Exit Criteria (Definition of Done)

- [ ] Release manager can configure a multi-stage pipeline with approval gates
- [ ] Deployment applies change sets to target environment via ORDS successfully
- [ ] Rollback restores pre-deployment state and confirms completion
- [ ] Hotfix track allows expedited deployment with double approval
- [ ] Release notes are generated automatically from change set manifests
- [ ] Deployment audit captures full trail (approver, executor, objects, timestamps)
- [ ] Bulk export produces valid ZIP with APEX SQL, DDL, seed data, manifest
- [ ] M10 semantic analysis catches injection patterns missed by basic sanitizer
- [ ] M10 output validator flags references to non-existent schema objects
- [ ] M10 risk classification correctly categorizes AI outputs
- [ ] M10 audit log is append-only (verified by attempting delete)
- [ ] All unit tests pass (>70% coverage for new code)

#### Technical Risks

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| ORDS deployment API reliability across environments | Medium | High | Retry with exponential backoff; per-object error handling |
| ML-based injection detection accuracy (false positives) | Medium | Medium | Start with rule-based; ML layer optional; tuning pipeline |
| Rollback completeness for complex deployments | Medium | High | Per-object rollback tracking; atomic rollback groups |

#### Team Assignment

| Developer | Focus Area |
|-----------|-----------|
| Dev 1 (Lead) | M9 pipeline configurator, deployment executor, rollback |
| Dev 2 | M10 full: semantic analysis, output validation, risk classification |
| Dev 3 | Release notes, deployment audit, bulk export, hotfix track |

---

### U9: Analysis and Documentation

| Field | Value |
|-------|-------|
| **Unit ID** | U9 |
| **Name** | Analysis and Documentation |
| **Sprint / Phase** | S8 (Fase 2) |
| **Duration** | 2 weeks (Weeks 18-19) |
| **Modules** | M11 (Dependency & Impact Analyzer) + M12 (Auto Documentation Studio) |
| **User Stories** | US-027, US-028, US-053, US-029, US-030, US-054 |

#### Components Involved

| Component | Description |
|-----------|-------------|
| Dependency Graph Engine | Upstream/downstream object visualization |
| Impact Analysis Engine | Scan packages, views, APEX pages for affected objects |
| Severity Classifier | Compile error, runtime error, data loss classification |
| Regression Planner | AI-assisted test case suggestions |
| CVE Scanner | Security vulnerability checking against CVE databases |
| PL/SQL Doc Generator | Parse package specs for procedures, functions, params |
| App-Level Doc Generator | Page inventory, shared components, security, data model |
| Living Doc Tracker | Auto-detect staleness when source changes |
| Mermaid Diagram Gen | Data flow and component interaction diagrams |
| Doc Exporter | Markdown and PDF output |
| User Page Doc Gen | Field descriptions, navigation flows |

#### Key Deliverables

- [ ] Object dependency graph (upstream/downstream, interactive)
- [ ] Impact analysis engine (< 3 seconds scan time)
- [ ] Impact severity classification (compile error, runtime error, data loss)
- [ ] AI-assisted regression plan suggestions
- [ ] Security vulnerability scanner (CVE database checking)
- [ ] M3/M6 integration (impact check before applying changes)
- [ ] PL/SQL package documentation generator
- [ ] Application-level documentation generator
- [ ] Living documentation (auto-detect staleness)
- [ ] Mermaid diagram generation for data flows
- [ ] Export to Markdown and PDF
- [ ] User-facing page documentation generation

#### Entry Criteria

- [ ] U7 completed: Schema Inspector (M7) data available for dependency analysis
- [ ] U4 completed: Code Editor (M3) context for documentation generation
- [ ] CVE database API access configured

#### Exit Criteria (Definition of Done)

- [ ] Developer can view dependency graph for any PL/SQL package within 3 seconds
- [ ] Impact analysis identifies all affected objects for a proposed change
- [ ] Severity classification correctly categorizes impact types
- [ ] Security scan checks dependencies against CVE databases
- [ ] PL/SQL doc generator produces Markdown with procedures, functions, parameters
- [ ] Application-level documentation covers page inventory and shared components
- [ ] Living documentation flags stale docs when source code changes
- [ ] Mermaid diagrams render correctly in documentation output
- [ ] Export to PDF produces properly formatted documents
- [ ] All unit tests pass (>70% coverage for new code)

#### Technical Risks

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| Dependency graph accuracy for complex PL/SQL | Medium | Medium | Parse both spec and body; test against real APEX schemas |
| Impact analysis performance for large schemas | Medium | Medium | Index-based scanning; caching of dependency maps |
| PDF generation quality (formatting, diagrams) | Low | Low | Puppeteer-based PDF; fallback to Markdown-only |

#### Team Assignment

| Developer | Focus Area |
|-----------|-----------|
| Dev 1 (Lead) | M11 dependency graph, impact analysis, severity classifier |
| Dev 2 | M12 PL/SQL doc generator, app-level docs, living docs |
| Dev 3 | CVE scanner, regression planner, Mermaid diagrams, PDF export |

---

### U10: Testing and Knowledge

| Field | Value |
|-------|-------|
| **Unit ID** | U10 |
| **Name** | Testing and Knowledge |
| **Sprint / Phase** | S9 (Fase 2) |
| **Duration** | 2 weeks (Weeks 20-21) |
| **Modules** | M13 (Test Automation Studio) + M14 (GENESYS Knowledge Engine) |
| **User Stories** | US-031, US-032, US-033, US-055, US-034, US-035, US-056 |

#### Components Involved

| Component | Description |
|-----------|-------------|
| utPLSQL Generator | AI-assisted unit test generation for PL/SQL packages |
| Test Runner | Execute tests with pass/fail results, assertion details, coverage |
| Test Dashboard | Trend charts, P/F ratios, coverage over last 30 runs |
| Test Case Manager | Suites linked to requirement IDs (RF-XXX) |
| Requirements Coverage Matrix | Identify untested requirements |
| Test Data Generator | Synthetic INSERT scripts respecting constraints |
| Quality Gates | Block pipeline if coverage < threshold |
| Knowledge Editor | Article CRUD with title, category, tags, content |
| Article Indexer | Index for AI context retrieval (< 60 seconds) |
| Article Versioning | Version history with diff |
| Article Approval | Submit, review, approve/reject workflow |
| Knowledge Analytics | Top-referenced articles, content gaps |
| AI Studio Integration | Cite knowledge articles in AI responses |

#### Key Deliverables

- [ ] utPLSQL test generation from PL/SQL packages (AI-assisted)
- [ ] Test execution runner with pass/fail, assertion details, coverage %
- [ ] Test execution dashboard (trends, P/F ratios, coverage charts)
- [ ] Test case management (suites linked to RF-XXX requirement IDs)
- [ ] Requirements coverage matrix (identify untested requirements)
- [ ] Synthetic test data generation (INSERT scripts)
- [ ] Quality gates integration (block pipeline promotion if coverage < threshold)
- [ ] Knowledge article CRUD (title, category, tags, content)
- [ ] Article indexing for AI context retrieval (< 60 seconds)
- [ ] Article version history
- [ ] GENESYS domain knowledge codification
- [ ] Article approval workflow (submit, review, approve/reject)
- [ ] Knowledge analytics (top-referenced, content gaps, declining relevance)
- [ ] AI Studio integration (cite knowledge articles in responses)

#### Entry Criteria

- [ ] U9 completed: Dependency Analyzer (M11) available for dependency-aware test generation
- [ ] U5 completed: AI Studio (M4) operational for test/knowledge generation
- [ ] utPLSQL framework documentation reviewed

#### Exit Criteria (Definition of Done)

- [ ] QA analyst can generate unit tests for a PL/SQL package with positive/boundary/null cases
- [ ] Test runner displays pass/fail with assertion details and coverage percentage
- [ ] Dashboard shows trends and coverage over last 30 runs
- [ ] Test suites can be linked to RF-XXX requirement IDs
- [ ] Coverage matrix identifies requirements without linked tests
- [ ] Synthetic test data generates valid INSERT scripts (zero constraint violations)
- [ ] Quality gates block pipeline promotion when coverage < configured threshold
- [ ] Knowledge editor can create, update, and version articles
- [ ] New articles are indexed and available to AI within 60 seconds
- [ ] Article approval workflow notifies reviewers and tracks status
- [ ] AI Studio cites relevant knowledge articles in responses
- [ ] All unit tests pass (>70% coverage for new code)

#### Technical Risks

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| utPLSQL integration complexity | Medium | Medium | Start with basic test templates; iterate on AI generation |
| Knowledge indexing latency (< 60s requirement) | Low | Medium | Async indexing pipeline; Redis caching for hot articles |
| Test data constraint satisfaction for complex schemas | Medium | Medium | Topological sort for FK dependencies; constraint solver |

#### Team Assignment

| Developer | Focus Area |
|-----------|-----------|
| Dev 1 (Lead) | M13 utPLSQL generator, test runner, test dashboard |
| Dev 2 | M14 knowledge editor, indexer, approval workflow |
| Dev 3 | Test case management, coverage matrix, test data gen, knowledge analytics |

---

### U11: Intelligence and Observability

| Field | Value |
|-------|-------|
| **Unit ID** | U11 |
| **Name** | Intelligence and Observability |
| **Sprint / Phase** | S10 (Fase 3) |
| **Duration** | 2 weeks (Weeks 22-23) |
| **Modules** | M15 (Usage & Cost Intelligence) + M17 (Product Intelligence Dashboard + Observability + Incidents) |
| **User Stories** | US-036, US-037, US-040, US-041, US-042, US-057 |

#### Components Involved

| Component | Description |
|-----------|-------------|
| Token Consumption Tracker | Per interaction, tenant, user, module tracking |
| Cost Calculator | Cost per model, tenant, project |
| Budget Manager | Monthly quotas per tenant/tier with alerts |
| Cost Allocation Reports | CSV export with team, project, resource breakdown |
| Margin Tracker | Revenue vs Claude API + OCI costs |
| Operational Dashboard | Real-time health, P50/P95/P99 latencies, error rates |
| OCI Observability Client | OCI Logging, Monitoring, APM integration |
| Incident Manager | Detect, triage, investigate, mitigate, resolve, postmortem |
| Incident Severity Engine | Classification and escalation rules |
| Executive Dashboard | Portfolio KPIs, velocity, quality scorecards, OKR progress |
| Custom Dashboard Builder | Drag-and-drop widgets from any module |
| Health Score Engine | Composite 0-100 per application |
| PDF Report Exporter | Executive report generation |

#### Key Deliverables

- [ ] Token consumption tracking (per interaction, tenant, user, module)
- [ ] Cost calculation engine (cost per model, tenant, project)
- [ ] Budget configuration (monthly quotas per tenant/tier)
- [ ] Budget alerts (80%/90%/100% threshold notifications)
- [ ] Cost allocation reports (CSV export)
- [ ] Margin tracking (revenue vs costs)
- [ ] Operational Command Center (real-time health, latencies, error rates)
- [ ] OCI observability integration (Logging, Monitoring, APM)
- [ ] Incident management (detect, triage, investigate, mitigate, resolve)
- [ ] Incident severity classification and escalation
- [ ] Executive Dashboard (KPIs, velocity, quality scorecards)
- [ ] Custom dashboard builder (drag-and-drop widgets)
- [ ] Application health scores (composite 0-100)
- [ ] PDF export for executive reports

#### Entry Criteria

- [ ] U5 completed: Token tracking data from AI Studio available
- [ ] U2 completed: User/tenant data for cost attribution
- [ ] U1 completed: OCI Logging/Monitoring infrastructure available
- [ ] OCI APM agent configuration documented

#### Exit Criteria (Definition of Done)

- [ ] Admin can view token consumption per tenant/user/module for a date range
- [ ] Cost calculation correctly computes costs per model provider
- [ ] Budget alerts fire at 80%/90%/100% thresholds
- [ ] Cost allocation CSV exports with correct team/project breakdown
- [ ] Operational dashboard shows real-time P50/P95/P99 latencies
- [ ] Incidents can be created, tracked through lifecycle, and closed
- [ ] Executive dashboard shows portfolio KPIs and quality scorecards
- [ ] Custom dashboard can be built by dragging widgets
- [ ] Health scores computed correctly based on error rate, latency, incidents
- [ ] PDF export produces properly formatted executive reports
- [ ] All unit tests pass (>70% coverage for new code)

#### Technical Risks

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| OCI APM integration complexity | Medium | Medium | Start with custom metrics; add APM incrementally |
| Real-time dashboard performance | Medium | Medium | WebSocket for updates; aggregate historical data |
| Cost calculation accuracy across providers | Low | Medium | Provider-specific rate cards; reconciliation reports |

#### Team Assignment

| Developer | Focus Area |
|-----------|-----------|
| Dev 1 (Lead) | M17 operational dashboard, OCI observability, incident management |
| Dev 2 | M15 cost calculation, budget management, margin tracking |
| Dev 3 | Executive dashboard, custom builder, health scores, PDF export |

---

### U12: Code Factory and Marketplace

| Field | Value |
|-------|-------|
| **Unit ID** | U12 |
| **Name** | Code Factory and Marketplace |
| **Sprint / Phase** | S11 (Fase 3) |
| **Duration** | 2 weeks (Weeks 24-25) |
| **Modules** | M16 (Full Code Generation Factory) + M18 (Accelerators Marketplace) |
| **User Stories** | US-038, US-039, US-043, US-044 |

#### Components Involved

| Component | Description |
|-----------|-------------|
| Full Code Generator | End-to-end app generation from PRD (DDL + PL/SQL + APEX) |
| Artifact Type Manager | 8 types: tables, sequences, constraints, packages, views, triggers, pages, sample data |
| Generation Preview | Review all artifacts before committing |
| Deployment Orchestrator | Deploy in correct dependency order via ORDS |
| Template Customizer | Naming conventions, error handling, logging templates |
| Traceability Inserter | RF-XXX header comments in generated code |
| Marketplace Catalog | Browse, search, filter by category |
| Package Structure Manager | Templates, component libraries, integration connectors |
| One-Click Installer | APEX version compatibility validation + install |
| Package Versioner | Versioning, update notifications |
| Publisher Portal | Upload, metadata, review submission |
| Publisher Analytics | Install count, ratings, feedback |

#### Key Deliverables

- [ ] End-to-end application generation from PRD (DDL + PL/SQL + APEX pages)
- [ ] 8 artifact types: tables, sequences, constraints, packages, views, triggers, pages, sample data
- [ ] Generation preview (review before committing)
- [ ] Deploy generated artifacts to DEV via ORDS (correct dependency order)
- [ ] Code generation template customization
- [ ] Requirement traceability in generated code (RF-XXX header comments)
- [ ] M10 safety integration (all generation passes through governance)
- [ ] Marketplace catalog (browse, search, filter)
- [ ] Accelerator package structure (templates, component libraries, connectors)
- [ ] One-click install with APEX version compatibility validation
- [ ] Package versioning and update notifications
- [ ] Publisher portal (upload, metadata, review submission)
- [ ] Publisher analytics (install count, ratings, feedback)

#### Entry Criteria

- [ ] U6 completed: PRD Builder (M8) and PRD-to-Page (M5) available for generation input
- [ ] U5 completed: AI Studio (M4) and M10 safety operational
- [ ] U8 completed: Release Manager (M9) available for deployment integration
- [ ] Marketplace data model and package format defined

#### Exit Criteria (Definition of Done)

- [ ] Developer can generate a complete APEX application from an approved PRD within 120 seconds
- [ ] Generated artifacts include all 8 types with correct dependency ordering
- [ ] Generation preview shows all artifacts before commitment
- [ ] Deployment applies artifacts in correct dependency order (DDL before PL/SQL before APEX)
- [ ] Template customization is reflected in all generated code
- [ ] RF-XXX traceability comments present in generated artifacts
- [ ] All generation passes through M10 governance engine
- [ ] Marketplace catalog displays packages with search and filtering
- [ ] One-click install validates APEX version compatibility before installation
- [ ] Publisher can upload, version, and track analytics for packages
- [ ] All unit tests pass (>70% coverage for new code)

#### Technical Risks

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| End-to-end generation accuracy for complex PRDs | High | High | Template-based generation; mandatory preview; iterative refinement |
| Dependency ordering for deployment | Medium | High | Topological sort algorithm; pre-validated dependency graph |
| Marketplace package compatibility across APEX versions | Medium | Medium | Version compatibility matrix; automated compatibility testing |

#### Team Assignment

| Developer | Focus Area |
|-----------|-----------|
| Dev 1 (Lead) | M16 full code generator, artifact types, deployment orchestrator |
| Dev 2 | M18 marketplace catalog, one-click install, publisher portal |
| Dev 3 | Template customizer, traceability, preview, publisher analytics |

---

### U13: SaaS Readiness

| Field | Value |
|-------|-------|
| **Unit ID** | U13 |
| **Name** | SaaS Readiness |
| **Sprint / Phase** | S12 (Fase 3) |
| **Duration** | 3-4 weeks (Weeks 26-29, includes hardening) |
| **Modules** | Cross-cutting SaaS capabilities |
| **User Stories** | US-045, US-046, US-048 |

#### Components Involved

| Component | Description |
|-----------|-------------|
| RLS Verification Suite | Automated cross-tenant isolation tests for all tables |
| Subscription Manager | Tier management (Free, Pro, Enterprise) with feature gating |
| Usage Quota Enforcer | Per-tier limits (AI tokens, apps, connections, storage) |
| SSO/SAML/OIDC Integrator | External identity provider support |
| Notification Center | Unified inbox for reviews, deployments, alerts, system events |
| DR Provisioner | Second OCI region setup |
| Failover Controller | Automated failover configuration and testing |
| Replication Manager | PostgreSQL streaming + Redis replication |
| Load Test Suite | Performance testing under multi-tenant load |
| Security Test Suite | Penetration testing automation |
| Tenant Onboarding | Self-service provisioning (< 60 seconds) |
| Billing Foundation | Usage metering for subscription tiers |

#### Key Deliverables

- [ ] Multi-tenant data isolation verification (automated RLS tests across all tables)
- [ ] Subscription tier management (Free, Pro, Enterprise) with feature gating
- [ ] Usage quota enforcement per tier (AI tokens, applications, connections, storage)
- [ ] SSO/SAML 2.0/OIDC integration (external identity providers)
- [ ] Notification center (unified inbox)
- [ ] Second OCI region provisioning (DR)
- [ ] Automated failover configuration and testing
- [ ] Data replication between regions (PostgreSQL streaming, Redis replication)
- [ ] Production hardening: load testing, security penetration testing
- [ ] Tenant onboarding automation (self-service provisioning < 60 seconds)
- [ ] SaaS billing integration groundwork (usage metering)
- [ ] End-to-end integration testing across all 19 modules
- [ ] Performance baseline verification (all SLAs under multi-tenant load)

#### Entry Criteria

- [ ] All prior units (U1-U12) completed and deployed to STAGING
- [ ] All 19 modules functional and passing unit tests
- [ ] Second OCI region tenancy provisioned
- [ ] Load testing tool selected (k6, Artillery, or similar)
- [ ] SSO identity provider configured for testing (SAML 2.0 + OIDC)

#### Exit Criteria (Definition of Done)

- [ ] Automated RLS tests pass for every table with tenant_id column
- [ ] Cross-tenant data leakage test confirms zero leakage paths
- [ ] Subscription tiers correctly gate features per tier
- [ ] Usage quotas enforce limits and alert at 80%/90%/100%
- [ ] SSO login works via SAML 2.0 and OIDC providers
- [ ] Notification center aggregates events from all modules
- [ ] Second OCI region is provisioned and receiving replicated data
- [ ] Automated failover completes within 5 minutes
- [ ] Failover recovery restores full functionality
- [ ] Load test confirms all SLAs met (P95 < 500ms API, P95 < 3s pages)
- [ ] Security penetration test reveals no Critical or High findings
- [ ] Tenant onboarding provisions a new tenant in < 60 seconds
- [ ] End-to-end integration tests pass across all 19 modules
- [ ] All production readiness criteria met

#### Technical Risks

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| Cross-tenant leakage in edge cases | Medium | Critical | Exhaustive RLS testing; chaos engineering (random tenant switching) |
| DR failover reliability | High | Critical | Scheduled failover drills; automated verification; manual fallback |
| SLA compliance under multi-tenant load | Medium | High | Progressive load testing; horizontal scaling; Redis cache tuning |
| SSO integration variability (SAML vs OIDC) | Medium | Medium | Use battle-tested library (passport.js); test with multiple providers |

#### Team Assignment

| Developer | Focus Area |
|-----------|-----------|
| Dev 1 (Lead) | DR provisioning, failover, replication, load testing |
| Dev 2 | RLS verification, subscription tiers, usage quotas, billing |
| Dev 3 | SSO/SAML/OIDC, notification center, tenant onboarding, e2e tests |

---

## 3. Summary

### Unit Timeline Overview

| Unit | Name | Sprint | Weeks | Duration | Modules | Stories |
|------|------|--------|-------|----------|---------|---------|
| U1 | Foundation Infrastructure | Fase 0 | W01-W03 | 3 weeks | Cross-cutting | 2 |
| U2 | Auth and Core Backend | S1 | W04-W05 | 2 weeks | M0, M1-BE | 5 |
| U3 | Connection UI and Explorer | S2 | W06-W07 | 2 weeks | M1-UI, M2 | 5 |
| U4 | Code Editor Studio | S3 | W08-W09 | 2 weeks | M3 | 3 |
| U5 | AI Engine | S4 | W10-W11 | 2 weeks | M4, M10-stub | 4 |
| U6 | PRD Suite | S5 | W12-W13 | 2 weeks | M8, M5 | 4 |
| U7 | Change Tracking and Schema | S6 | W14-W15 | 2 weeks | M6, M7 | 5 |
| U8 | Release Pipeline and AI Safety | S7 | W16-W17 | 2 weeks | M9, M10-full | 6 |
| U9 | Analysis and Documentation | S8 | W18-W19 | 2 weeks | M11, M12 | 6 |
| U10 | Testing and Knowledge | S9 | W20-W21 | 2 weeks | M13, M14 | 7 |
| U11 | Intelligence and Observability | S10 | W22-W23 | 2 weeks | M15, M17 | 6 |
| U12 | Code Factory and Marketplace | S11 | W24-W25 | 2 weeks | M16, M18 | 4 |
| U13 | SaaS Readiness | S12 | W26-W29 | 3-4 weeks | Cross-cutting | 3 |
| **Total** | | | | **29 weeks** | **19 modules** | **57 stories** |

### Phase Gates

| Gate | After Unit | Criteria |
|------|-----------|----------|
| **Fase 0 Gate** | U1 | Infrastructure operational: OKE, PostgreSQL, Redis, CI/CD, monitoring |
| **Fase 1 Gate** | U5 | Core MVP: Auth + Connections + Explorer + Editor + AI Studio end-to-end |
| **Fase 2 Gate** | U10 | Full ALM: All Fase 2 modules operational, pipeline active, tests generating |
| **Fase 3 Gate** | U13 | SaaS Launch: Multi-tenant verified, SSO, DR tested, SLAs met |
