# Component Dependency Matrix - APEX Dev Manager

## Overview

This document maps all dependencies between the 25 application components across four dependency types:
- **Build-time**: Module imports (TypeScript `import` statements)
- **Runtime**: Calls made during request processing
- **Data**: Shared PostgreSQL tables or Oracle schemas
- **Event**: Publish/subscribe via Event Bus (C25)

---

## Build-Time Dependencies (Imports)

Components that import types, interfaces, or utilities from other components at compile time.

| Component | Imports From |
|---|---|
| **C01 API Gateway** | C02, C03 |
| **C02 Tenant Resolver** | C03 |
| **C03 Auth Service** | -- |
| **C04 Connection Service** | C22, C23, C24 |
| **C05 Explorer Service** | C04, C22 |
| **C06 Editor Service** | C04, C05, C10, C22 |
| **C07 AI Orchestration** | C04, C05, C08, C09, C18 |
| **C08 Safety Engine** | -- |
| **C09 Knowledge Engine** | -- |
| **C10 Change Tracker** | C04, C22 |
| **C11 Release Engine** | C04, C10, C12, C13, C21 |
| **C12 Test Runner** | C04, C22 |
| **C13 Impact Analyzer** | C04, C05, C22 |
| **C14 Doc Generator** | C05, C07, C22 |
| **C15 PRD Processor** | C07, C09 |
| **C16 Page Generator** | C05, C07, C08, C17, C22 |
| **C17 Code Factory** | C04, C07, C08, C09, C10, C22 |
| **C18 Cost Tracker** | -- |
| **C19 Dashboard Aggregator** | C10, C11, C12, C18 |
| **C20 Marketplace** | C04, C09, C22 |
| **C21 Notification Service** | -- |
| **C22 MCP Connector** | C04 |
| **C23 ORDS Client** | C04 |
| **C24 DB Direct Client** | C04 |
| **C25 Event Bus** | -- |

**Legend**: `--` means no build-time dependencies on other application components (may still depend on shared libraries/types).

---

## Runtime Dependencies (Calls at Runtime)

Services called synchronously during request handling. Arrow indicates direction of the call (caller -> callee).

| Caller | Calls (Runtime) | Call Pattern |
|---|---|---|
| **C01 API Gateway** | C02, C03 | Every request: authenticate then resolve tenant |
| **C02 Tenant Resolver** | C03 | Validate JWT claims |
| **C04 Connection Service** | C22, C23, C24 | Delegate to available Oracle access tier |
| **C05 Explorer Service** | C04, C22 | Fetch APEX metadata via connection |
| **C06 Editor Service** | C04, C05, C10, C22 | Fetch source, acquire lock, record change |
| **C07 AI Orchestration** | C04, C05, C08, C09, C18 | Build context, sanitize, validate, track cost |
| **C08 Safety Engine** | -- | Standalone (called by others) |
| **C09 Knowledge Engine** | -- | Standalone (called by others) |
| **C10 Change Tracker** | C04, C22 | Fetch before-snapshot from Oracle |
| **C11 Release Engine** | C04, C10, C12, C13, C22, C23 | Orchestrate promotion pipeline |
| **C12 Test Runner** | C04, C22 | Execute utPLSQL via Oracle connection |
| **C13 Impact Analyzer** | C04, C05, C22 | Query dependency metadata |
| **C14 Doc Generator** | C05, C07, C22 | Fetch metadata, use AI for narrative |
| **C15 PRD Processor** | C07, C09 | AI parsing, rule enrichment |
| **C16 Page Generator** | C05, C07, C08, C17, C22 | Full generation pipeline |
| **C17 Code Factory** | C04, C07, C08, C09, C10, C22 | Full generation pipeline |
| **C18 Cost Tracker** | -- | Standalone (called by others, event-driven) |
| **C19 Dashboard Aggregator** | C10, C11, C12, C18 | Query metrics from services |
| **C20 Marketplace** | C04, C09, C22 | Install packages, import rules |
| **C21 Notification Service** | -- | Standalone (event-driven) |
| **C22 MCP Connector** | C04 | Connection lifecycle |
| **C23 ORDS Client** | C04 | Connection lifecycle |
| **C24 DB Direct Client** | C04 | Connection lifecycle |
| **C25 Event Bus** | -- | Infrastructure (called by all) |

---

## Runtime Dependency Matrix (Condensed)

Read as: row **depends on** column at runtime.

| | C01 | C02 | C03 | C04 | C05 | C06 | C07 | C08 | C09 | C10 | C11 | C12 | C13 | C14 | C15 | C16 | C17 | C18 | C19 | C20 | C21 | C22 | C23 | C24 | C25 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| **C01** | | X | X | | | | | | | | | | | | | | | | | | | | | | |
| **C02** | | | X | | | | | | | | | | | | | | | | | | | | | | |
| **C04** | | | | | | | | | | | | | | | | | | | | | | X | X | X | |
| **C05** | | | | X | | | | | | | | | | | | | | | | | | X | | | |
| **C06** | | | | X | X | | | | | X | | | | | | | | | | | | X | | | |
| **C07** | | | | X | X | | | X | X | | | | | | | | | X | | | | | | | |
| **C10** | | | | X | | | | | | | | | | | | | | | | | | X | | | |
| **C11** | | | | X | | | | | | X | | X | X | | | | | | | | X | X | X | | |
| **C12** | | | | X | | | | | | | | | | | | | | | | | | X | | | |
| **C13** | | | | X | X | | | | | | | | | | | | | | | | | X | | | |
| **C14** | | | | | X | | X | | | | | | | | | | | | | | | X | | | |
| **C15** | | | | | | | X | | X | | | | | | | | | | | | | | | | |
| **C16** | | | | | X | | X | X | | | | | | | | | X | | | | | X | | | |
| **C17** | | | | X | | | X | X | X | X | | | | | | | | | | | | X | | | |
| **C19** | | | | | | | | | | X | X | X | | | | | | X | | | | | | | |
| **C20** | | | | X | | | | | X | | | | | | | | | | | | | X | | | |

---

## Data Dependencies (Shared PostgreSQL Tables)

Components that read from or write to the same PostgreSQL tables. All tables are tenant-scoped via RLS.

| Table / Schema | Writers | Readers | Notes |
|---|---|---|---|
| `tenants` | C02 | C01, C02, C03, C18 | Tenant configuration and subscription |
| `users` | C03 | C01, C02, C03, C06, C21 | User accounts and roles |
| `sessions` | C03 | C01, C03 | Active user sessions |
| `refresh_tokens` | C03 | C03 | Refresh token rotation tracking |
| `connections` | C04 | C04, C05, C06, C10, C11, C12, C13, C20 | Oracle connection configs |
| `editor_sessions` | C06 | C06 | Active editor sessions and locks |
| `changes` | C10 | C10, C11, C19 | Change history log |
| `change_snapshots` | C10 | C10, C11 | Before/after content snapshots |
| `releases` | C11 | C11, C19 | Release definitions |
| `release_pipeline` | C11 | C11, C19 | Pipeline stage tracking |
| `test_cases` | C12 | C12 | Test case definitions |
| `test_runs` | C12 | C12, C11, C19 | Test execution results |
| `test_coverage` | C12 | C12, C19 | Coverage data |
| `knowledge_rules` | C09 | C07, C09, C15, C17, C20 | Knowledge base rules |
| `safety_rules` | C08 | C07, C08, C17 | Safety validation rules |
| `approval_gates` | C08 | C08, C11 | Pending approvals |
| `token_usage` | C18 | C18, C19 | AI token consumption log |
| `budget_config` | C18 | C07, C18 | Per-tenant budget limits |
| `notifications` | C21 | C21 | Notification log |
| `notification_preferences` | C21 | C21 | Per-user preferences |
| `webhook_configs` | C21 | C21 | Registered webhooks |
| `prd_documents` | C15 | C15, C16 | PRD storage |
| `accelerators` | C20 | C20 | Marketplace catalog (local cache) |
| `installed_accelerators` | C20 | C20, C09 | Per-tenant installations |
| `dashboard_metrics` | C19 | C19 | Aggregated metric snapshots |
| `custom_metrics` | C19 | C19 | Custom metric definitions |
| `codegen_history` | C17 | C17, C19 | Code generation audit trail |
| `page_gen_previews` | C16 | C16 | Page generation preview cache |

---

## Event Dependencies (Publish / Subscribe via C25)

| Event Topic | Publisher | Subscribers |
|---|---|---|
| `change.recorded` | C10 | C19, C21 |
| `change.rollback` | C10 | C19, C21 |
| `release.created` | C11 | C19, C21 |
| `release.promoted` | C11 | C12, C19, C21 |
| `release.failed` | C11 | C19, C21 |
| `release.rollback` | C11 | C19, C21 |
| `test.completed` | C12 | C11, C19, C21 |
| `test.failed` | C12 | C11, C19, C21 |
| `ai.request.completed` | C07 | C18, C19 |
| `ai.request.failed` | C07 | C18, C19, C21 |
| `budget.threshold_reached` | C18 | C21 |
| `budget.exceeded` | C18 | C07, C21 |
| `safety.violation_detected` | C08 | C21 |
| `safety.approval_required` | C08 | C21 |
| `safety.approval_resolved` | C08 | C07, C17 |
| `marketplace.installed` | C20 | C09, C19, C21 |
| `marketplace.uninstalled` | C20 | C09, C19, C21 |
| `marketplace.published` | C20 | C21 |
| `session.created` | C06 | C19 |
| `session.closed` | C06 | C19 |
| `connection.health_changed` | C04 | C19, C21 |
| `connection.failover` | C04 | C19, C21 |
| `user.login` | C03 | C19 |
| `user.logout` | C03 | C19 |
| `user.locked` | C03 | C21 |
| `codegen.completed` | C17 | C19 |
| `codegen.applied` | C17 | C10, C19 |
| `page.generated` | C16 | C19 |
| `page.applied` | C16 | C10, C19 |
| `doc.generated` | C14 | C19 |
| `prd.ingested` | C15 | C19 |
| `prd.validated` | C15 | C19 |

---

## Event Publisher/Subscriber Summary

### Publishers (components that emit events)

| Component | Events Published |
|---|---|
| C03 Auth Service | `user.login`, `user.logout`, `user.locked` |
| C04 Connection Service | `connection.health_changed`, `connection.failover` |
| C06 Editor Service | `session.created`, `session.closed` |
| C07 AI Orchestration | `ai.request.completed`, `ai.request.failed` |
| C08 Safety Engine | `safety.violation_detected`, `safety.approval_required`, `safety.approval_resolved` |
| C10 Change Tracker | `change.recorded`, `change.rollback` |
| C11 Release Engine | `release.created`, `release.promoted`, `release.failed`, `release.rollback` |
| C12 Test Runner | `test.completed`, `test.failed` |
| C14 Doc Generator | `doc.generated` |
| C15 PRD Processor | `prd.ingested`, `prd.validated` |
| C16 Page Generator | `page.generated`, `page.applied` |
| C17 Code Factory | `codegen.completed`, `codegen.applied` |
| C18 Cost Tracker | `budget.threshold_reached`, `budget.exceeded` |
| C20 Marketplace | `marketplace.installed`, `marketplace.uninstalled`, `marketplace.published` |

### Subscribers (components that react to events)

| Component | Events Subscribed |
|---|---|
| C07 AI Orchestration | `budget.exceeded`, `safety.approval_resolved` |
| C09 Knowledge Engine | `marketplace.installed`, `marketplace.uninstalled` |
| C10 Change Tracker | `codegen.applied`, `page.applied` |
| C11 Release Engine | `test.completed`, `test.failed` |
| C12 Test Runner | `release.promoted` |
| C17 Code Factory | `safety.approval_resolved` |
| C18 Cost Tracker | `ai.request.completed`, `ai.request.failed` |
| C19 Dashboard Aggregator | `change.recorded`, `change.rollback`, `release.created`, `release.promoted`, `release.failed`, `release.rollback`, `test.completed`, `test.failed`, `ai.request.completed`, `ai.request.failed`, `session.created`, `session.closed`, `connection.health_changed`, `connection.failover`, `user.login`, `user.logout`, `codegen.completed`, `codegen.applied`, `page.generated`, `page.applied`, `doc.generated`, `prd.ingested`, `prd.validated`, `marketplace.installed`, `marketplace.uninstalled` |
| C21 Notification Service | `change.recorded`, `change.rollback`, `release.created`, `release.promoted`, `release.failed`, `release.rollback`, `test.failed`, `ai.request.failed`, `budget.threshold_reached`, `budget.exceeded`, `safety.violation_detected`, `safety.approval_required`, `connection.health_changed`, `connection.failover`, `user.locked`, `marketplace.installed`, `marketplace.uninstalled`, `marketplace.published` |

---

## Dependency Depth Analysis

Components ranked by total dependency count (sum of build-time + runtime + data + event dependencies). Higher values indicate higher coupling and greater impact if changed.

| Rank | Component | Build Deps | Runtime Deps | Data Tables | Event Topics | Total | Risk |
|---|---|---|---|---|---|---|---|
| 1 | C17 Code Factory | 6 | 7 | 2 | 3 | 18 | HIGH |
| 2 | C11 Release Engine | 5 | 7 | 2 | 6 | 20 | HIGH |
| 3 | C16 Page Generator | 5 | 6 | 1 | 2 | 14 | HIGH |
| 4 | C07 AI Orchestration | 5 | 5 | 0 | 4 | 14 | HIGH |
| 5 | C06 Editor Service | 4 | 5 | 1 | 2 | 12 | MEDIUM |
| 6 | C19 Dashboard Aggregator | 4 | 4 | 2 | 25 | 35 | MEDIUM |
| 7 | C21 Notification Service | 0 | 0 | 3 | 18 | 21 | LOW |
| 8 | C13 Impact Analyzer | 3 | 4 | 0 | 0 | 7 | MEDIUM |
| 9 | C14 Doc Generator | 3 | 3 | 0 | 1 | 7 | LOW |
| 10 | C20 Marketplace | 3 | 3 | 2 | 3 | 11 | MEDIUM |
| 11 | C10 Change Tracker | 2 | 2 | 2 | 4 | 10 | MEDIUM |
| 12 | C15 PRD Processor | 2 | 2 | 1 | 2 | 7 | LOW |
| 13 | C12 Test Runner | 2 | 2 | 3 | 3 | 10 | MEDIUM |
| 14 | C05 Explorer Service | 2 | 2 | 0 | 0 | 4 | LOW |
| 15 | C04 Connection Service | 3 | 3 | 1 | 2 | 9 | MEDIUM |
| 16 | C01 API Gateway | 2 | 2 | 0 | 0 | 4 | LOW |
| 17 | C02 Tenant Resolver | 1 | 1 | 1 | 0 | 3 | LOW |
| 18 | C03 Auth Service | 0 | 0 | 3 | 3 | 6 | LOW |
| 19 | C08 Safety Engine | 0 | 0 | 2 | 3 | 5 | LOW |
| 20 | C09 Knowledge Engine | 0 | 0 | 1 | 2 | 3 | LOW |
| 21 | C18 Cost Tracker | 0 | 0 | 2 | 4 | 6 | LOW |
| 22 | C22 MCP Connector | 1 | 1 | 0 | 0 | 2 | LOW |
| 23 | C23 ORDS Client | 1 | 1 | 0 | 0 | 2 | LOW |
| 24 | C24 DB Direct Client | 1 | 1 | 0 | 0 | 2 | LOW |
| 25 | C25 Event Bus | 0 | 0 | 0 | 0 | 0 | LOW |

**Notes:**
- C19 (Dashboard Aggregator) has the highest total due to subscribing to nearly all event topics, but its risk is MEDIUM because it is a read-only consumer with no upstream impact.
- C17 (Code Factory) and C11 (Release Engine) are the most tightly coupled operational components and represent the highest change-impact risk.
- C25 (Event Bus) has zero dependencies -- it is the foundational infrastructure layer.
- C08, C09, C18, C21 are standalone services with no runtime dependencies on other services, making them easy to test and deploy independently.

---

## Circular Dependency Check

No circular runtime dependencies exist. The following potential cycles are avoided by design:

| Potential Cycle | Resolution |
|---|---|
| C07 -> C08 -> C07 | C08 (Safety) does not call C07. C07 calls C08 for validation. Safety approval resolution uses events, not direct calls. |
| C11 -> C12 -> C11 | C12 (Test Runner) does not call C11 directly. Test results are communicated via `test.completed` events, which C11 subscribes to. |
| C16 -> C17 -> C16 | C17 (Code Factory) does not call C16. C16 calls C17 for artifact generation within pages. |
| C10 -> C17 -> C10 | C17 records changes via C10 (direct call). C10 receives `codegen.applied` events from C17 but these are for audit logging, not circular invocation. |
