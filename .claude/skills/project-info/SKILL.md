---
name: project-info
description: Show APEX Dev Manager project knowledge — modules, units, components, dependencies, epics, and architecture
user-invocable: true
allowed-tools: Bash(python3 scripts/*) Bash(git *) Read Glob Grep
argument-hint: "[module|unit|component|epic|roadmap|arch|all] [ID]"
---

# Project Info — APEX Dev Manager

Display detailed knowledge about the APEX Dev Manager project: modules, units, components, dependencies, Linear epics, and architecture.

## Project Overview

**APEX Dev Manager** is an AI-native enterprise platform for governance, development, and operation of Oracle APEX ecosystems on OCI. Greenfield monorepo deployed as a monolith on OKE (Oracle Kubernetes Engine).

- **Tech Stack**: React 18 + Vite + TypeScript (frontend), Node.js + Express + TypeScript (backend), PostgreSQL 16 + Redis, OCI (OKE, Vault, Logging)
- **Team**: 2-3 developers
- **Timeline**: 29 weeks (Apr-Nov 2026), 4 phases (Fase 0-3)
- **Monorepo**: pnpm workspaces

---

## Modules (M0-M18)

| ID | Module | Description | Unit | Priority |
|----|--------|-------------|------|----------|
| M0 | Authentication & Session Management | JWT RS256, refresh rotation, RBAC 9 roles, RLS tenant isolation | U2 | Urgent |
| M1 | Connection Manager | ORDS/JDBC connections, OCI Vault credentials, health checks, pool mgmt | U2 (BE) + U3 (UI) | Urgent |
| M2 | Application Explorer | MCP-based APEX metadata tree, cross-env comparison, component details | U3 | Urgent |
| M3 | Code Editor Studio | Monaco-based PL/SQL editor, syntax highlighting, autocomplete, diff view | U4 | Urgent |
| M4 | AI Studio | Claude API chat, context-aware code generation, prompt templates | U5 | Urgent |
| M5 | PRD-to-Page Generator | AI converts PRD sections into APEX pages with components | U6 | High |
| M6 | Change Manager | Track object modifications, change sets, conflict detection | U7 | High |
| M7 | Schema Inspector | Database schema browser, ERD visualization, DDL generation | U7 | High |
| M8 | PRD Builder | Structured PRD creation with sections, versioning, export | U6 | High |
| M9 | Release & Deployment Manager | Pipeline DEV→QA→STAGING→PROD, rollback, blue-green | U8 | Urgent |
| M10 | AI Governance & Safety Engine | Prompt audit, cost tracking, safety filters, tenant quotas | U5 (stub) + U8 (full) | Urgent |
| M11 | Dependency & Impact Analyzer | Cross-object dependency graph, impact assessment before changes | U9 | High |
| M12 | Auto Documentation Studio | AI-generated docs from code/schema, export PDF/Confluence | U9 | High |
| M13 | Test Automation Studio | AI-generated test cases, execution, coverage reporting | U10 | High |
| M14 | GENESYS Knowledge Engine | RAG over APEX docs, contextual help, learning paths | U10 | High |
| M15 | Usage & Cost Intelligence | OCI cost tracking, usage analytics, optimization suggestions | U11 | Medium |
| M16 | Full Code Generation Factory | End-to-end code gen from specs, template library, batch gen | U12 | Medium |
| M17 | Product Intelligence Dashboard + Observability + Incidents | Dashboards, alerting, incident management | U11 | High |
| M18 | Accelerators Marketplace | Reusable templates, community sharing, ratings | U12 | Medium |

---

## Units of Work (U1-U13)

| Unit | Name | Sprint | Weeks | Modules | Linear Epics | Key Stories |
|------|------|--------|-------|---------|--------------|-------------|
| U1 | Foundation Infrastructure | Fase 0 | 1-3 (3w) | Infra cross-cutting | NUE-33 (EP-000) | US-001, US-002 |
| U2 | Auth & Core Backend | S1 | 4-5 (2w) | M0, M1-backend | NUE-34 (EP-001), NUE-35 (EP-002) | US-003 to US-007 |
| U3 | Connection UI & Explorer | S2 | 6-7 (2w) | M1-UI, M2 | NUE-35, NUE-36 (EP-003) | US-006 (UI), US-007 (UI), US-008, US-009, US-047 |
| U4 | Code Editor | S3 | 8-9 (2w) | M3 | NUE-37 (EP-004) | US-010, US-011, US-012 |
| U5 | AI Engine | S4 | 10-11 (2w) | M4, M10-stub | NUE-38 (EP-005), NUE-44 (EP-011) | US-013, US-014, US-015, US-050 |
| U6 | PRD Suite | S5 | 12-13 (2w) | M8, M5 | NUE-39 (EP-006), NUE-40 (EP-007) | US-016, US-017, US-018, US-019 |
| U7 | Change & Schema | S6 | 14-15 (2w) | M6, M7 | NUE-41 (EP-008), NUE-42 (EP-009) | US-020, US-021, US-022, US-023, US-024 |
| U8 | Release & Safety | S7-S8 | 16-19 (4w) | M9, M10-full | NUE-43 (EP-010), NUE-44 (EP-011) | US-025 to US-031 |
| U9 | Analysis & Docs | S9 | 20-21 (2w) | M11, M12 | NUE-45 (EP-012), NUE-46 (EP-013) | US-032, US-033, US-034, US-035 |
| U10 | Testing & Knowledge | S10 | 22-23 (2w) | M13, M14 | NUE-47 (EP-014), NUE-48 (EP-015) | US-036, US-037, US-038, US-039 |
| U11 | Intelligence & Observability | S11 | 24-25 (2w) | M15, M17 | NUE-49 (EP-016), NUE-51 (EP-018) | US-040, US-041, US-042, US-043 |
| U12 | Factory & Marketplace | S12 | 26-27 (2w) | M16, M18 | NUE-50 (EP-017), NUE-52 (EP-019) | US-044, US-045, US-046, US-048 |
| U13 | SaaS Readiness | Post-S12 | 28-29 (2w) | All (hardening) | NUE-53 (EP-020) | US-049 to US-057 |

---

## Unit Dependencies

```
U1 Foundation
  └── U2 Auth & Core
        ├── U3 Explorer UI
        │     ├── U4 Editor
        │     │     ├── U5 AI Engine
        │     │     │     ├── U6 PRD Suite
        │     │     │     │     └── U12 Factory & Market
        │     │     │     └── U10 Testing & Knowledge
        │     │     ├── U7 Change & Schema
        │     │     │     ├── U8 Release & Safety
        │     │     │     └── U9 Analysis & Docs
        │     └── U11 Intelligence & Observability
        └── U13 SaaS Readiness (depends on ALL units)
```

**Critical Path**: U1 → U2 → U3 → U4 → U5 → U7 → U8 → U12 → U13 (20 weeks minimum)

---

## 25 Components (6 Layers)

| Layer | Components |
|-------|-----------|
| **Experience** | C01 API Gateway, C02 Tenant Resolver |
| **Application Services** | C03 Auth Service, C04 Connection Service, C05 Explorer Service, C06 Editor Service, C07 AI Service, C08 PRD Service, C09 Change Manager Service, C10 Schema Service, C11 Release Service, C12 AI Governance Service |
| **Domain** | C13 Dependency Analyzer, C14 Auto Docs Service, C15 Test Studio Service, C16 Knowledge Engine, C17 Usage Intelligence, C18 Code Factory, C19 Marketplace Service, C20 Dashboard Service |
| **Oracle Integration** | C22 MCP Connector, C23 ORDS Client, C24 DB Direct Client |
| **Infrastructure** | C21 Audit Service, C25 Event Bus |

---

## Code Organization

```
apex-dev-manager/
├── apps/
│   ├── web/                    # React 18 + Vite + TypeScript
│   │   └── src/features/       # One folder per module (auth/, connections/, editor/, etc.)
│   └── api/                    # Node.js + Express + TypeScript
│       └── src/modules/        # One folder per module (auth/, connections/, editor/, etc.)
├── packages/
│   └── shared-types/           # Shared TypeScript types
├── infra/
│   ├── terraform/              # OCI infrastructure
│   ├── helm/                   # Kubernetes charts
│   └── docker/                 # Dockerfiles
└── package.json                # pnpm workspaces root
```

---

## Phase Gates

| Gate | After Unit | Key Criteria |
|------|-----------|-------------|
| **FASE 0** | U1 | OKE healthy, CI/CD green, PostgreSQL + Redis operational |
| **FASE 1** | U5 | Auth → Connect → Browse → Edit → AI chat end-to-end |
| **FASE 2** | U10 | Pipeline DEV → QA → STAGING, tests passing |
| **FASE 3** | U13 | Multi-tenant isolation, SSO, DR < 5min RTO, SLAs met |

---

## Milestones

| Milestone | Target | Criteria |
|-----------|--------|---------|
| **M-0: Infra Ready** | End Week 3 (May 2026) | OKE operational, CI/CD green, DB + Redis healthy |
| **M-1: Core MVP** | End Week 11 (Jun 2026) | Auth + Connections + Explorer + Editor + AI functional |
| **M-2: Full ALM** | End Week 21 (Sep 2026) | All Fase 2 modules operational |
| **M-3: SaaS Launch** | End Week 29 (Nov 2026) | Multi-tenant verified, SSO, DR tested |

---

## Usage

This skill responds to queries about the project. Examples:

```
/project-info                    → Full overview
/project-info modules            → List all 19 modules with details
/project-info unit U5            → Details for Unit 5 (AI Engine)
/project-info module M3          → Details for Module 3 (Code Editor)
/project-info epic NUE-38        → Map epic to unit, module, and stories
/project-info roadmap            → Timeline and milestones
/project-info deps               → Dependency graph
/project-info arch               → Architecture layers and components
/project-info component C07      → Details for AI Service component
/project-info current            → What unit/module should be worked on next
```

## Steps

1. **Parse the query** to determine what information the user wants.

2. **If no argument or "all"**: Show the full project overview (modules table + units table + dependency graph + milestones).

3. **If "modules"**: Show the complete modules table with descriptions, units, and priorities.

4. **If "unit <ID>"**: Read the unit details from `aidlc-docs/inception/application-design/unit-of-work.md` and show: name, sprint, modules, stories, components, deliverables, entry/exit criteria, risks, team assignment.

5. **If "module <ID>"**: Show module description, which unit it belongs to, related components, backend/frontend paths, and Linear epic.

6. **If "epic <ID>"**: Fetch the epic from Linear and cross-reference with the unit/module mapping above.
   ```bash
   python3 scripts/linear_client.py get <EPIC_ID> --full
   ```

7. **If "roadmap"**: Show the timeline, milestones, and phase gates.

8. **If "deps" or "dependencies"**: Show the unit dependency tree and critical path.

9. **If "arch" or "architecture"**: Show the 6-layer component architecture.

10. **If "component <ID>"**: Read component details from `aidlc-docs/inception/application-design/components.md`.

11. **If "current"**: Check Linear for issues "In Progress" or the first "Todo" unit, and recommend what to work on next.
    ```bash
    python3 scripts/linear_client.py list --state "In Progress"
    ```

## Rules

- Always cross-reference information from the embedded knowledge above with the actual files in `aidlc-docs/` for the most detailed data.
- When showing units, always include the Linear epic IDs (NUE-XX) so the user can reference them with `/start-issue`.
- When showing the roadmap, calculate weeks relative to the start date (Apr 14, 2026).
- If the user asks about something not covered here, check the docs in `aidlc-docs/inception/` and `aidlc-docs/construction/`.
