# Application Components - APEX Dev Manager

## Component Inventory

This document defines all 25 application components across the 6 architectural layers. Each component specifies its responsibilities, dependencies, and exposed interfaces.

---

### C01 - API Gateway

| Attribute | Value |
|---|---|
| **ID** | C01 |
| **Layer** | Experience |
| **Responsibility** | Central entry point for all HTTP requests. Handles request routing, rate limiting, CORS policy enforcement, request/response logging, and authentication middleware delegation. |
| **Dependencies** | C02 (Tenant Resolver), C03 (Auth Service), C25 (Event Bus) |

**Exposed Interfaces:**

| Method/Endpoint | Description |
|---|---|
| `POST /api/v1/*` | Route all API requests to downstream services |
| `GET /health` | Gateway health check |
| `GET /ready` | Readiness probe for OKE |
| `middleware.rateLimit(config)` | Apply rate limiting per tenant/IP |
| `middleware.cors(config)` | CORS policy enforcement |
| `middleware.authenticate(req)` | Delegate JWT validation to Auth Service |

---

### C02 - Tenant Resolver

| Attribute | Value |
|---|---|
| **ID** | C02 |
| **Layer** | Experience |
| **Responsibility** | Extract tenant identifier from JWT claims, inject tenant context into database connections via `SET app.current_tenant`, enforce PostgreSQL RLS policies, and validate tenant subscription status. |
| **Dependencies** | C03 (Auth Service), C25 (Event Bus) |

**Exposed Interfaces:**

| Method/Endpoint | Description |
|---|---|
| `resolveTenant(jwt: string): TenantContext` | Extract and validate tenant from token |
| `injectTenantContext(conn: PoolClient, tenantId: string): void` | Set RLS context on DB connection |
| `validateTenantSubscription(tenantId: string): SubscriptionStatus` | Check tenant plan and limits |
| `middleware.tenantScope(req, res, next)` | Express middleware for tenant injection |

---

### C03 - Auth Service

| Attribute | Value |
|---|---|
| **ID** | C03 |
| **Layer** | Application Services |
| **Responsibility** | JWT issuance and validation, refresh token rotation with reuse detection, account lockout after failed attempts, RBAC enforcement for 9 roles, session management, and password policy enforcement. |
| **Dependencies** | C25 (Event Bus) |

**Exposed Interfaces:**

| Method/Endpoint | Description |
|---|---|
| `POST /auth/login` | Authenticate user, issue JWT + refresh token |
| `POST /auth/refresh` | Rotate refresh token |
| `POST /auth/logout` | Invalidate session |
| `POST /auth/forgot-password` | Initiate password reset |
| `authorize(roles: Role[]): Middleware` | RBAC middleware factory |
| `validateToken(token: string): TokenPayload` | Verify and decode JWT |
| `checkPermission(userId, resource, action): boolean` | Fine-grained permission check |

---

### C04 - Connection Service

| Attribute | Value |
|---|---|
| **ID** | C04 |
| **Layer** | Oracle Integration |
| **Responsibility** | Manage ORDS and JDBC connection pools per tenant/environment, perform health checks and connection validation, integrate with OCI Vault for credential retrieval, and handle connection failover between regions. |
| **Dependencies** | C22 (MCP Connector), C23 (ORDS Client), C24 (DB Direct Client), C25 (Event Bus) |

**Exposed Interfaces:**

| Method/Endpoint | Description |
|---|---|
| `getConnection(tenantId, envId): OracleConnection` | Acquire pooled connection |
| `releaseConnection(conn): void` | Return connection to pool |
| `testConnection(config: ConnectionConfig): TestResult` | Validate connection parameters |
| `POST /connections` | Register new APEX environment |
| `GET /connections/:id/health` | Connection health status |
| `refreshCredentials(connId): void` | Rotate credentials from OCI Vault |

---

### C05 - Explorer Service

| Attribute | Value |
|---|---|
| **ID** | C05 |
| **Layer** | Application Services |
| **Responsibility** | Navigate Oracle APEX dictionary views (apex_applications, apex_application_pages, etc.), build hierarchical tree structures for workspace/app/page/component browsing, cache frequently accessed metadata, and support search/filter across APEX objects. |
| **Dependencies** | C04 (Connection Service), C22 (MCP Connector), C25 (Event Bus) |

**Exposed Interfaces:**

| Method/Endpoint | Description |
|---|---|
| `GET /explorer/workspaces` | List APEX workspaces |
| `GET /explorer/apps/:workspaceId` | List applications in workspace |
| `GET /explorer/pages/:appId` | List pages in application |
| `GET /explorer/components/:pageId` | List components on page |
| `GET /explorer/tree/:appId` | Full application tree (cached) |
| `GET /explorer/search` | Search across APEX objects |
| `invalidateCache(appId): void` | Clear cached tree for app |

---

### C06 - Editor Service

| Attribute | Value |
|---|---|
| **ID** | C06 |
| **Layer** | Application Services |
| **Responsibility** | Backend support for Monaco editor instances, manage editor sessions with locking, handle PL/SQL and JavaScript component CRUD operations, provide syntax validation, and support collaborative editing awareness (who is editing what). |
| **Dependencies** | C04 (Connection Service), C05 (Explorer Service), C10 (Change Tracker), C22 (MCP Connector), C25 (Event Bus) |

**Exposed Interfaces:**

| Method/Endpoint | Description |
|---|---|
| `POST /editor/sessions` | Create editor session with lock |
| `PUT /editor/sessions/:id` | Save component changes |
| `DELETE /editor/sessions/:id` | Release editor session and lock |
| `GET /editor/component/:type/:id` | Fetch component source |
| `POST /editor/validate` | Validate PL/SQL/JS syntax |
| `GET /editor/locks/:componentId` | Check lock status |

---

### C07 - AI Orchestration Service

| Attribute | Value |
|---|---|
| **ID** | C07 |
| **Layer** | AI Orchestration |
| **Responsibility** | Build context windows from schema metadata, APEX dictionary, and knowledge rules. Manage prompt engineering with schema grounding. Route requests to Claude API with appropriate model selection. Handle streaming responses, retries, and fallback strategies. |
| **Dependencies** | C04 (Connection Service), C05 (Explorer Service), C08 (Safety Engine), C09 (Knowledge Engine), C18 (Cost Tracker), C25 (Event Bus) |

**Exposed Interfaces:**

| Method/Endpoint | Description |
|---|---|
| `POST /ai/generate` | Generate code/content with AI |
| `POST /ai/analyze` | Analyze code for improvements |
| `POST /ai/explain` | Explain existing code |
| `buildContext(request: AIRequest): ContextWindow` | Assemble grounded context |
| `routeToModel(request, context): ModelSelection` | Select optimal Claude model |
| `streamResponse(request): AsyncIterable<Chunk>` | Stream AI response |

---

### C08 - Safety Engine

| Attribute | Value |
|---|---|
| **ID** | C08 |
| **Layer** | AI Orchestration |
| **Responsibility** | Sanitize all inputs before AI processing, validate AI outputs against safety rules, classify generated changes by risk level (low/medium/high/critical), enforce approval gates for high-risk changes, and maintain safety audit trail. |
| **Dependencies** | C25 (Event Bus) |

**Exposed Interfaces:**

| Method/Endpoint | Description |
|---|---|
| `sanitizeInput(input: AIInput): SanitizedInput` | Clean and validate input |
| `validateOutput(output: AIOutput): ValidationResult` | Validate AI-generated content |
| `classifyRisk(change: Change): RiskLevel` | Assess change risk level |
| `requireApproval(change, riskLevel): ApprovalGate` | Create approval gate |
| `GET /safety/rules` | List active safety rules |
| `POST /safety/rules` | Create/update safety rule |

---

### C09 - Knowledge Engine

| Attribute | Value |
|---|---|
| **ID** | C09 |
| **Layer** | AI Orchestration |
| **Responsibility** | Manage domain-specific knowledge rules and best practices, classify rules by domain (PL/SQL, APEX pages, security, performance), enrich AI context with relevant rules, and support CRUD operations on knowledge base entries. |
| **Dependencies** | C25 (Event Bus) |

**Exposed Interfaces:**

| Method/Endpoint | Description |
|---|---|
| `GET /knowledge/rules` | List rules with filters |
| `POST /knowledge/rules` | Create knowledge rule |
| `PUT /knowledge/rules/:id` | Update knowledge rule |
| `DELETE /knowledge/rules/:id` | Delete knowledge rule |
| `getRelevantRules(context: DomainContext): Rule[]` | Retrieve contextually relevant rules |
| `enrichContext(context: ContextWindow, rules: Rule[]): ContextWindow` | Add rules to AI context |

---

### C10 - Change Tracker

| Attribute | Value |
|---|---|
| **ID** | C10 |
| **Layer** | Application Services |
| **Responsibility** | Record all changes made to APEX components with before/after snapshots, generate unified diffs, support rollback to any previous state, maintain change history per tenant/app/component, and provide change audit reports. |
| **Dependencies** | C04 (Connection Service), C22 (MCP Connector), C25 (Event Bus) |

**Exposed Interfaces:**

| Method/Endpoint | Description |
|---|---|
| `recordChange(change: ChangeRecord): string` | Log a change, return changeId |
| `GET /changes/:componentId` | Change history for component |
| `GET /changes/:changeId/diff` | Get diff for specific change |
| `POST /changes/:changeId/rollback` | Rollback to previous state |
| `GET /changes/report` | Change audit report with filters |
| `getSnapshot(componentId, timestamp): Snapshot` | Point-in-time component state |

---

### C11 - Release Engine

| Attribute | Value |
|---|---|
| **ID** | C11 |
| **Layer** | Application Services |
| **Responsibility** | Orchestrate release pipelines across environments (dev, test, staging, prod), manage environment promotion workflows, support hotfix tracks with cherry-pick, enforce release approval gates, and track release history. |
| **Dependencies** | C04 (Connection Service), C10 (Change Tracker), C12 (Test Runner), C13 (Impact Analyzer), C21 (Notification Service), C25 (Event Bus) |

**Exposed Interfaces:**

| Method/Endpoint | Description |
|---|---|
| `POST /releases` | Create new release |
| `POST /releases/:id/promote` | Promote to next environment |
| `POST /releases/:id/hotfix` | Create hotfix track |
| `GET /releases/:id/status` | Release pipeline status |
| `POST /releases/:id/approve` | Approve release gate |
| `POST /releases/:id/rollback` | Rollback release |

---

### C12 - Test Runner

| Attribute | Value |
|---|---|
| **ID** | C12 |
| **Layer** | Application Services |
| **Responsibility** | Manage test case definitions and suites, execute utPLSQL test packages against Oracle DB, collect and aggregate test results, enforce quality gates (coverage thresholds, pass rates), and integrate with release pipelines. |
| **Dependencies** | C04 (Connection Service), C22 (MCP Connector), C25 (Event Bus) |

**Exposed Interfaces:**

| Method/Endpoint | Description |
|---|---|
| `POST /tests/run` | Execute test suite |
| `GET /tests/results/:runId` | Get test run results |
| `POST /tests/cases` | Create test case |
| `GET /tests/coverage/:appId` | Code coverage report |
| `checkQualityGates(runId): QualityGateResult` | Evaluate quality gates |
| `GET /tests/suites` | List test suites |

---

### C13 - Impact Analyzer

| Attribute | Value |
|---|---|
| **ID** | C13 |
| **Layer** | Application Services |
| **Responsibility** | Build dependency graphs across APEX components (pages, regions, processes, computations, LOVs, etc.), calculate impact radius for proposed changes, generate regression test plans, and provide visualization of dependency chains. |
| **Dependencies** | C04 (Connection Service), C05 (Explorer Service), C22 (MCP Connector), C25 (Event Bus) |

**Exposed Interfaces:**

| Method/Endpoint | Description |
|---|---|
| `POST /impact/analyze` | Analyze impact of proposed change |
| `GET /impact/graph/:componentId` | Get dependency graph |
| `GET /impact/regression-plan/:changeId` | Generate regression test plan |
| `buildDependencyGraph(appId): DependencyGraph` | Full app dependency graph |
| `calculateImpactRadius(componentId, changeType): ImpactReport` | Impact assessment |

---

### C14 - Documentation Generator

| Attribute | Value |
|---|---|
| **ID** | C14 |
| **Layer** | Application Services |
| **Responsibility** | Auto-generate documentation from APEX application code, produce Mermaid diagrams for data models and process flows, generate module-level manuals, and support export in multiple formats (Markdown, HTML, PDF). |
| **Dependencies** | C05 (Explorer Service), C07 (AI Orchestration Service), C22 (MCP Connector), C25 (Event Bus) |

**Exposed Interfaces:**

| Method/Endpoint | Description |
|---|---|
| `POST /docs/generate/:appId` | Generate full app documentation |
| `POST /docs/diagram/:type` | Generate Mermaid diagram |
| `GET /docs/:appId/manual` | Get module manual |
| `POST /docs/export` | Export docs in specified format |
| `generateERD(appId): MermaidDiagram` | Entity-relationship diagram |
| `generateFlowDiagram(processId): MermaidDiagram` | Process flow diagram |

---

### C15 - PRD Processor

| Attribute | Value |
|---|---|
| **ID** | C15 |
| **Layer** | Application Services |
| **Responsibility** | Ingest product requirement documents (Word, PDF, Markdown), parse and structure requirements, generate PRD documents in standardized format, validate requirements for completeness and consistency, and feed structured PRDs to downstream generators. |
| **Dependencies** | C07 (AI Orchestration Service), C09 (Knowledge Engine), C25 (Event Bus) |

**Exposed Interfaces:**

| Method/Endpoint | Description |
|---|---|
| `POST /prd/ingest` | Upload and parse requirement document |
| `POST /prd/generate` | Generate PRD from structured input |
| `POST /prd/validate` | Validate PRD completeness |
| `GET /prd/:id` | Retrieve PRD |
| `GET /prd/:id/requirements` | Extract requirements list |
| `transformToStructured(raw: RawDocument): StructuredPRD` | Parse raw doc to PRD |

---

### C16 - Page Generator

| Attribute | Value |
|---|---|
| **ID** | C16 |
| **Layer** | Application Services |
| **Responsibility** | Generate APEX pages from PRD specifications, handle page ID collision detection and resolution, generate page regions/items/buttons/processes, support template-based and AI-driven generation modes, and preview before apply. |
| **Dependencies** | C05 (Explorer Service), C07 (AI Orchestration Service), C08 (Safety Engine), C17 (Code Factory), C22 (MCP Connector), C25 (Event Bus) |

**Exposed Interfaces:**

| Method/Endpoint | Description |
|---|---|
| `POST /pages/generate` | Generate page from PRD/spec |
| `POST /pages/preview` | Preview generated page definition |
| `POST /pages/apply` | Apply generated page to APEX |
| `GET /pages/collisions/:appId` | Check for page ID collisions |
| `resolveCollisions(appId, pageIds): Resolution` | Auto-resolve collisions |

---

### C17 - Code Factory

| Attribute | Value |
|---|---|
| **ID** | C17 |
| **Layer** | Application Services |
| **Responsibility** | Generate multiple artifact types: PL/SQL packages, triggers, views, APEX page processes, dynamic actions, computations, validations, and LOVs. Support preview/diff before apply, and maintain generation history. |
| **Dependencies** | C04 (Connection Service), C07 (AI Orchestration Service), C08 (Safety Engine), C09 (Knowledge Engine), C10 (Change Tracker), C22 (MCP Connector), C25 (Event Bus) |

**Exposed Interfaces:**

| Method/Endpoint | Description |
|---|---|
| `POST /codegen/generate` | Generate code artifact |
| `POST /codegen/preview` | Preview with diff against current |
| `POST /codegen/apply` | Apply generated code |
| `POST /codegen/batch` | Batch generate multiple artifacts |
| `GET /codegen/history` | Generation history |
| `GET /codegen/templates` | Available generation templates |

---

### C18 - Cost Tracker

| Attribute | Value |
|---|---|
| **ID** | C18 |
| **Layer** | Observability |
| **Responsibility** | Record token usage per AI request (input/output tokens), calculate costs per model/tenant, monitor budget consumption against tenant limits, trigger alerts on threshold breaches, and provide cost analytics dashboards. |
| **Dependencies** | C25 (Event Bus) |

**Exposed Interfaces:**

| Method/Endpoint | Description |
|---|---|
| `recordUsage(usage: TokenUsage): void` | Log token consumption |
| `GET /costs/summary/:tenantId` | Cost summary for tenant |
| `GET /costs/budget/:tenantId` | Budget status and remaining |
| `POST /costs/alerts` | Configure cost alert thresholds |
| `checkBudget(tenantId): BudgetStatus` | Pre-request budget check |
| `GET /costs/analytics` | Cost analytics with breakdowns |

---

### C19 - Dashboard Aggregator

| Attribute | Value |
|---|---|
| **ID** | C19 |
| **Layer** | Application Services |
| **Responsibility** | Collect metrics from all services, calculate KPIs (code quality, release velocity, AI usage, test coverage), provide real-time WebSocket feeds for dashboard updates, and support custom metric definitions. |
| **Dependencies** | C10 (Change Tracker), C11 (Release Engine), C12 (Test Runner), C18 (Cost Tracker), C25 (Event Bus) |

**Exposed Interfaces:**

| Method/Endpoint | Description |
|---|---|
| `GET /dashboard/kpis` | Current KPI values |
| `GET /dashboard/metrics/:category` | Metrics by category |
| `WS /dashboard/feed` | Real-time metric WebSocket feed |
| `POST /dashboard/custom-metrics` | Define custom metric |
| `GET /dashboard/reports/:type` | Pre-built reports |

---

### C20 - Marketplace Service

| Attribute | Value |
|---|---|
| **ID** | C20 |
| **Layer** | Application Services |
| **Responsibility** | Manage accelerator catalog (templates, plugins, rule packs), handle installation and uninstallation with dependency resolution, validate compatibility with target APEX version, support publishing workflow for marketplace contributors, and manage ratings/reviews. |
| **Dependencies** | C04 (Connection Service), C09 (Knowledge Engine), C22 (MCP Connector), C25 (Event Bus) |

**Exposed Interfaces:**

| Method/Endpoint | Description |
|---|---|
| `GET /marketplace/catalog` | Browse accelerator catalog |
| `POST /marketplace/install/:id` | Install accelerator |
| `DELETE /marketplace/uninstall/:id` | Uninstall accelerator |
| `POST /marketplace/publish` | Submit accelerator for publishing |
| `GET /marketplace/compatibility/:id` | Check version compatibility |
| `GET /marketplace/:id/reviews` | Get ratings and reviews |

---

### C21 - Notification Service

| Attribute | Value |
|---|---|
| **ID** | C21 |
| **Layer** | Application Services |
| **Responsibility** | Event-driven notification dispatch, support multiple channels (in-app, email, webhooks), manage notification preferences per user, handle notification templates, and maintain delivery status tracking. |
| **Dependencies** | C25 (Event Bus) |

**Exposed Interfaces:**

| Method/Endpoint | Description |
|---|---|
| `send(notification: Notification): void` | Dispatch notification |
| `GET /notifications` | List user notifications |
| `PUT /notifications/:id/read` | Mark as read |
| `PUT /notifications/preferences` | Update preferences |
| `POST /notifications/webhooks` | Register webhook endpoint |
| `GET /notifications/templates` | List notification templates |

---

### C22 - MCP Connector

| Attribute | Value |
|---|---|
| **ID** | C22 |
| **Layer** | Oracle Integration |
| **Responsibility** | Protocol adapter for MCP Oracle APEX. Translate internal service requests to MCP protocol calls. Handle MCP session lifecycle, manage tool invocations, and provide unified interface for APEX operations. |
| **Dependencies** | C04 (Connection Service) |

**Exposed Interfaces:**

| Method/Endpoint | Description |
|---|---|
| `invoke(tool: string, params: Record<string, any>): MCPResult` | Execute MCP tool |
| `listTools(): MCPToolDefinition[]` | List available MCP tools |
| `createSession(config: MCPConfig): MCPSession` | Initialize MCP session |
| `closeSession(sessionId): void` | Terminate MCP session |
| `healthCheck(): MCPHealth` | MCP server health status |

---

### C23 - ORDS Client

| Attribute | Value |
|---|---|
| **ID** | C23 |
| **Layer** | Oracle Integration |
| **Responsibility** | Execute write operations via Oracle REST Data Services. Handle ORDS module/template routing, manage ORDS authentication (OAuth2, Basic), and provide typed wrappers for common ORDS patterns. |
| **Dependencies** | C04 (Connection Service) |

**Exposed Interfaces:**

| Method/Endpoint | Description |
|---|---|
| `execute(method, path, body): ORDSResponse` | Generic ORDS call |
| `post(module, template, body): ORDSResponse` | ORDS POST operation |
| `put(module, template, body): ORDSResponse` | ORDS PUT operation |
| `delete(module, template, params): ORDSResponse` | ORDS DELETE operation |
| `batch(operations: ORDSOp[]): ORDSBatchResult` | Batch ORDS operations |

---

### C24 - DB Direct Client

| Attribute | Value |
|---|---|
| **ID** | C24 |
| **Layer** | Oracle Integration |
| **Responsibility** | Fallback path using node-oracledb for direct SQL execution when ORDS/MCP is unavailable or insufficient. Manage thick/thin client mode, handle LOB types, and support PL/SQL anonymous block execution. |
| **Dependencies** | C04 (Connection Service) |

**Exposed Interfaces:**

| Method/Endpoint | Description |
|---|---|
| `execute(sql: string, binds: any[]): QueryResult` | Execute SQL statement |
| `executeMany(sql, bindsArray): BatchResult` | Batch SQL execution |
| `callProcedure(name, params): ProcedureResult` | Call PL/SQL procedure |
| `executePlSqlBlock(block: string): PlSqlResult` | Execute anonymous PL/SQL block |
| `getConnection(): OracleDBConnection` | Acquire direct connection |

---

### C25 - Event Bus

| Attribute | Value |
|---|---|
| **ID** | C25 |
| **Layer** | Data & Persistence |
| **Responsibility** | Redis-backed publish/subscribe event system. Handle event publishing, subscription management, event replay for missed events, dead-letter queue for failed handlers, and event schema validation. |
| **Dependencies** | None (foundational infrastructure) |

**Exposed Interfaces:**

| Method/Endpoint | Description |
|---|---|
| `publish(topic: string, event: DomainEvent): void` | Publish event to topic |
| `subscribe(topic: string, handler: EventHandler): Subscription` | Subscribe to topic |
| `unsubscribe(subscriptionId: string): void` | Remove subscription |
| `replay(topic, fromTimestamp): AsyncIterable<DomainEvent>` | Replay events from timestamp |
| `getDeadLetterQueue(): DomainEvent[]` | Retrieve failed events |
| `healthCheck(): EventBusHealth` | Redis connection health |

---

## Layer Summary

| Layer | Components |
|---|---|
| **Experience** | C01 (API Gateway), C02 (Tenant Resolver) |
| **Application Services** | C03 (Auth Service), C05 (Explorer), C06 (Editor), C10 (Change Tracker), C11 (Release Engine), C12 (Test Runner), C13 (Impact Analyzer), C14 (Doc Generator), C15 (PRD Processor), C16 (Page Generator), C17 (Code Factory), C19 (Dashboard Aggregator), C20 (Marketplace), C21 (Notification Service) |
| **AI Orchestration** | C07 (AI Orchestration), C08 (Safety Engine), C09 (Knowledge Engine) |
| **Oracle Integration** | C04 (Connection Service), C22 (MCP Connector), C23 (ORDS Client), C24 (DB Direct Client) |
| **Data & Persistence** | C25 (Event Bus) |
| **Observability** | C18 (Cost Tracker) |
