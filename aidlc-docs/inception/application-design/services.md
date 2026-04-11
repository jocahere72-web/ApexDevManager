# Service Orchestration - APEX Dev Manager

## Overview

This document defines the service orchestration layer: how services compose to fulfill end-to-end business flows, communication patterns, transaction boundaries, error handling, and resilience strategies.

---

## Service Registry

| Service ID | Service Name | Base URL | Health Endpoint | Port | Protocol |
|---|---|---|---|---|---|
| C01 | API Gateway | `/` | `/health` | 3000 | HTTP/HTTPS |
| C03 | Auth Service | `/api/v1/auth` | `/api/v1/auth/health` | 3001 | HTTP |
| C04 | Connection Service | `/api/v1/connections` | `/api/v1/connections/health` | 3002 | HTTP |
| C05 | Explorer Service | `/api/v1/explorer` | `/api/v1/explorer/health` | 3003 | HTTP |
| C06 | Editor Service | `/api/v1/editor` | `/api/v1/editor/health` | 3004 | HTTP |
| C07 | AI Orchestration | `/api/v1/ai` | `/api/v1/ai/health` | 3005 | HTTP/WS |
| C08 | Safety Engine | `/api/v1/safety` | `/api/v1/safety/health` | 3006 | HTTP |
| C09 | Knowledge Engine | `/api/v1/knowledge` | `/api/v1/knowledge/health` | 3007 | HTTP |
| C10 | Change Tracker | `/api/v1/changes` | `/api/v1/changes/health` | 3008 | HTTP |
| C11 | Release Engine | `/api/v1/releases` | `/api/v1/releases/health` | 3009 | HTTP |
| C12 | Test Runner | `/api/v1/tests` | `/api/v1/tests/health` | 3010 | HTTP |
| C13 | Impact Analyzer | `/api/v1/impact` | `/api/v1/impact/health` | 3011 | HTTP |
| C14 | Doc Generator | `/api/v1/docs` | `/api/v1/docs/health` | 3012 | HTTP |
| C15 | PRD Processor | `/api/v1/prd` | `/api/v1/prd/health` | 3013 | HTTP |
| C16 | Page Generator | `/api/v1/pages` | `/api/v1/pages/health` | 3014 | HTTP |
| C17 | Code Factory | `/api/v1/codegen` | `/api/v1/codegen/health` | 3015 | HTTP |
| C18 | Cost Tracker | `/api/v1/costs` | `/api/v1/costs/health` | 3016 | HTTP |
| C19 | Dashboard Aggregator | `/api/v1/dashboard` | `/api/v1/dashboard/health` | 3017 | HTTP/WS |
| C20 | Marketplace | `/api/v1/marketplace` | `/api/v1/marketplace/health` | 3018 | HTTP |
| C21 | Notification Service | `/api/v1/notifications` | `/api/v1/notifications/health` | 3019 | HTTP |
| C22 | MCP Connector | Internal only | N/A | N/A | MCP Protocol |
| C23 | ORDS Client | Internal only | N/A | N/A | HTTP (outbound) |
| C24 | DB Direct Client | Internal only | N/A | N/A | Oracle Net |
| C25 | Event Bus | Internal only | `/eventbus/health` | 6379 | Redis |

**Internal services** (C22, C23, C24, C25) are consumed as libraries/modules, not as standalone HTTP services. They are injected via dependency injection and do not expose external endpoints.

---

## Orchestration Patterns

### Pattern 1: Request/Response (Synchronous)

Used for operations requiring immediate results.

```
Client -> API Gateway -> Target Service -> Response
```

**Applied to:**
- Explorer tree navigation (C05)
- Component source retrieval (C06)
- Knowledge rule CRUD (C09)
- Dashboard KPIs (C19)
- Marketplace catalog browsing (C20)
- Authentication (C03)

**Characteristics:**
- Timeout: 30 seconds default, 60 seconds for AI operations
- Response includes correlation ID for tracing
- All requests pass through API Gateway (C01) for auth, rate limiting, tenant resolution

---

### Pattern 2: Request/Async-Response (Streaming)

Used for long-running AI operations that stream results.

```
Client -> API Gateway -> AI Orchestration -> [stream chunks] -> Client
                            |
                            +-> Safety Engine (pre-validation)
                            +-> Knowledge Engine (context enrichment)
                            +-> Cost Tracker (usage recording)
```

**Applied to:**
- AI code generation (C07)
- AI analysis and explanation (C07)
- Documentation generation (C14)

**Characteristics:**
- WebSocket or Server-Sent Events (SSE) for streaming
- Client receives incremental chunks
- Final chunk includes metadata (tokens used, safety check result)
- Timeout: 120 seconds for streaming operations

---

### Pattern 3: Event-Driven (Asynchronous)

Used for side effects and cross-cutting concerns that don't need synchronous coordination.

```
Service A -> Event Bus (publish) -> Service B (subscribe, react)
                                 -> Service C (subscribe, react)
```

**Applied to:**
- Change notifications: Change Tracker (C10) publishes `change.recorded`, Notification Service (C21) and Dashboard Aggregator (C19) subscribe
- Cost alerts: Cost Tracker (C18) publishes `budget.threshold_reached`, Notification Service (C21) subscribes
- Release events: Release Engine (C11) publishes `release.promoted`, Test Runner (C12) and Notification Service (C21) subscribe
- Safety alerts: Safety Engine (C08) publishes `safety.violation_detected`, Notification Service (C21) subscribes

**Event Topics:**

| Topic | Publisher(s) | Subscriber(s) |
|---|---|---|
| `change.recorded` | C10 | C19, C21 |
| `change.rollback` | C10 | C19, C21 |
| `release.created` | C11 | C19, C21 |
| `release.promoted` | C11 | C12, C19, C21 |
| `release.failed` | C11 | C19, C21 |
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
| `marketplace.published` | C20 | C21 |
| `session.created` | C06 | C19 |
| `session.closed` | C06 | C19 |
| `connection.health_changed` | C04 | C19, C21 |
| `user.login` | C03 | C19 |
| `user.locked` | C03 | C21 |

---

### Pattern 4: Saga (Distributed Transaction)

Used for multi-step operations requiring compensating actions on failure.

#### Saga 1: AI Code Generation and Apply

```
Step 1: AI Orchestration (C07) - Generate code
Step 2: Safety Engine (C08) - Validate output and classify risk
Step 3: [If high-risk] Safety Engine (C08) - Create approval gate, WAIT
Step 4: Code Factory (C17) - Preview and diff
Step 5: [User approval] Code Factory (C17) - Apply to Oracle
Step 6: Change Tracker (C10) - Record change with before/after snapshot
Step 7: Cost Tracker (C18) - Record token usage

Compensating actions (on failure at any step):
- Step 5 fails: No compensation needed (preview only)
- Step 5 applied but Step 6 fails: Rollback via Change Tracker (C10)
- Step 7 fails: Async retry via Event Bus (non-critical)
```

#### Saga 2: Release Promotion

```
Step 1: Release Engine (C11) - Validate release readiness
Step 2: Impact Analyzer (C13) - Analyze impact on target environment
Step 3: Test Runner (C12) - Execute regression suite
Step 4: [If tests pass] Release Engine (C11) - Apply changes to target environment
Step 5: Change Tracker (C10) - Record all applied changes
Step 6: Notification Service (C21) - Notify stakeholders

Compensating actions:
- Step 3 fails: Mark release as blocked, notify
- Step 4 fails: Rollback all changes via Change Tracker (C10)
- Step 5 fails: Log to dead-letter queue, manual reconciliation
```

#### Saga 3: Page Generation from PRD

```
Step 1: PRD Processor (C15) - Parse and validate PRD
Step 2: AI Orchestration (C07) - Generate page specification
Step 3: Safety Engine (C08) - Validate generated spec
Step 4: Page Generator (C16) - Check collisions and generate page definition
Step 5: [User preview and approval]
Step 6: Page Generator (C16) - Apply page via MCP/ORDS
Step 7: Change Tracker (C10) - Record change
Step 8: Cost Tracker (C18) - Record AI usage

Compensating actions:
- Step 4 collision: Auto-resolve or prompt user
- Step 6 fails: No rollback needed (preview was not applied)
- Step 6 partial: Rollback applied components via Change Tracker
```

---

## End-to-End Service Flows

### Flow 1: User Browses APEX Application Tree

```
1. Client -> API Gateway (C01): GET /api/v1/explorer/tree/100
2. API Gateway -> Auth Service (C03): Validate JWT
3. API Gateway -> Tenant Resolver (C02): Resolve tenant, set RLS context
4. API Gateway -> Explorer Service (C05): getApplicationTree(100)
5. Explorer Service -> Connection Service (C04): getConnection(tenantId, envId)
6. Connection Service -> MCP Connector (C22): createSession()
7. Explorer Service -> MCP Connector (C22): invoke('list_pages', {appId: 100})
8. Explorer Service: Build tree, cache result
9. Response -> Client: ApplicationTree JSON
```

### Flow 2: AI Generates PL/SQL Package

```
1. Client -> API Gateway (C01): POST /api/v1/ai/generate
2. Auth + Tenant resolution
3. API Gateway -> AI Orchestration (C07): generate(request)
4. AI Orchestration -> Cost Tracker (C18): checkBudget(tenantId)
5. AI Orchestration -> Knowledge Engine (C09): getRelevantRules(context)
6. AI Orchestration -> Explorer Service (C05): getComponentDetails (for schema context)
7. AI Orchestration -> Safety Engine (C08): sanitizeInput(input)
8. AI Orchestration -> Claude API: Send grounded prompt
9. AI Orchestration -> Safety Engine (C08): validateOutput(response)
10. AI Orchestration -> Safety Engine (C08): classifyRisk(change)
11. [If high risk] -> Approval gate created, user notified
12. AI Orchestration -> Event Bus (C25): publish('ai.request.completed')
13. Response -> Client: AIGenerateResponse (streamed via SSE)
```

### Flow 3: Release Promotion to Production

```
1. Client -> API Gateway (C01): POST /api/v1/releases/{id}/promote
2. Auth + Tenant + Role check (release_manager required)
3. Release Engine (C11): Validate release state
4. Release Engine -> Impact Analyzer (C13): analyzeImpact(changes)
5. Release Engine -> Test Runner (C12): runTestSuite({suiteId, envId})
6. [Async] Test Runner executes, publishes 'test.completed'
7. Release Engine receives test results
8. [If quality gates pass] Release Engine -> Connection Service (C04): get prod connection
9. Release Engine -> MCP Connector (C22) / ORDS Client (C23): Apply changes
10. Release Engine -> Change Tracker (C10): Record all changes
11. Release Engine -> Event Bus (C25): publish('release.promoted')
12. Notification Service (C21): Notify stakeholders
13. Dashboard Aggregator (C19): Update release KPIs
```

### Flow 4: Marketplace Accelerator Installation

```
1. Client -> API Gateway (C01): POST /api/v1/marketplace/install/{id}
2. Auth + Tenant resolution
3. Marketplace Service (C20): Fetch accelerator package
4. Marketplace Service -> checkCompatibility(acceleratorId, apexVersion)
5. Marketplace Service -> Connection Service (C04): getConnection()
6. Marketplace Service -> MCP Connector (C22): Install components
7. [If rule pack] Marketplace Service -> Knowledge Engine (C09): importRules()
8. Marketplace Service -> Change Tracker (C10): Record installation
9. Marketplace Service -> Event Bus (C25): publish('marketplace.installed')
10. Response -> Client: InstallResult
```

---

## Transaction Boundaries

### PostgreSQL Transactions (Application Database)

| Scope | Services | Isolation Level | Notes |
|---|---|---|---|
| User authentication | C03 | READ COMMITTED | Short-lived, single-row operations |
| Change recording | C10 | SERIALIZABLE | Must guarantee consistent before/after snapshots |
| Release state transitions | C11 | SERIALIZABLE | Prevent concurrent promotion of same release |
| Cost recording | C18 | READ COMMITTED | Eventual consistency acceptable |
| Knowledge rule updates | C09 | READ COMMITTED | Optimistic locking with version column |
| Notification persistence | C21 | READ COMMITTED | Idempotent writes |
| Editor session/lock management | C06 | SERIALIZABLE | Prevent double-locking |
| Test result storage | C12 | READ COMMITTED | Append-only pattern |

### Oracle Database Transactions (APEX Target)

| Scope | Services | Pattern | Notes |
|---|---|---|---|
| Component CRUD | C06, C17 | Single statement auto-commit via ORDS | Each ORDS call is atomic |
| Page generation | C16 | Multi-statement via MCP session | MCP session provides transaction boundary |
| Batch code apply | C17 | Saga with compensating actions | Each artifact applied individually; rollback on failure |
| Release apply | C11 | Ordered DDL/DML execution | Export/import model via MCP |
| Test execution | C12 | Read-only transaction | utPLSQL runs in autonomous transaction |

### Cross-Database Consistency

The system spans two databases (PostgreSQL for application state, Oracle for APEX metadata). There is **no distributed transaction** across them. Instead:

1. **Oracle first, PostgreSQL second**: Apply change to Oracle, then record in PostgreSQL. If PostgreSQL fails, the dead-letter queue captures the event for retry.
2. **Idempotent operations**: All PostgreSQL recording operations are idempotent (upsert with change ID as key).
3. **Reconciliation job**: Background job runs every 15 minutes to detect Oracle changes not recorded in PostgreSQL (drift detection).

---

## Error Handling and Retry Policies

### Retry Configuration by Service Category

| Category | Services | Max Retries | Backoff | Backoff Multiplier | Timeout |
|---|---|---|---|---|---|
| **Oracle Operations** | C04, C22, C23, C24 | 3 | 1000ms | 2.0 | 30s |
| **AI Operations** | C07 | 2 | 2000ms | 2.0 | 120s |
| **Internal Services** | C03, C05, C06, C08-C21 | 2 | 500ms | 1.5 | 30s |
| **Event Publishing** | C25 | 5 | 500ms | 2.0 | 10s |
| **Notifications** | C21 | 3 | 1000ms | 2.0 | 15s |

### Retryable vs Non-Retryable Errors

**Retryable:**
- Connection timeout (ETIMEDOUT)
- Service unavailable (503)
- Too many requests (429) -- with respect to Retry-After header
- Oracle temporary failure (ORA-00018, ORA-00020)
- Redis connection lost (ECONNRESET)
- Claude API rate limit (429)

**Non-Retryable:**
- Authentication failure (401)
- Authorization failure (403)
- Validation error (400)
- Not found (404)
- Oracle permanent error (ORA-00942 table not found, ORA-06550 compilation error)
- Budget exceeded

### Error Response Format

All services return errors in a standardized format:

```typescript
interface ErrorResponse {
  error: {
    code: string;              // Machine-readable: 'CONNECTION_TIMEOUT', 'BUDGET_EXCEEDED'
    message: string;           // Human-readable description
    details?: Record<string, unknown>;
    correlationId: string;     // For tracing across services
    timestamp: string;         // ISO 8601
    retryable: boolean;
    retryAfter?: number;       // Seconds until retry is appropriate
  };
}
```

### Error Propagation Rules

1. **Downstream errors**: Services catch downstream errors and translate them to their own error domain. They do not leak implementation details.
2. **Partial failures**: For batch operations, return partial results with per-item error details.
3. **Circuit breaker open**: Return 503 with `retryAfter` indicating estimated recovery time.
4. **Dead-letter queue**: Failed event handlers route events to dead-letter queue. Alerts fire after 3 consecutive failures on the same event.

---

## Circuit Breaker Configuration

Circuit breakers protect the system from cascading failures when downstream services become unhealthy.

### Circuit Breaker Settings

| Protected Service | Failure Threshold | Success Threshold | Timeout | Half-Open Max | Monitor Window |
|---|---|---|---|---|---|
| **Oracle DB (C04)** | 5 failures | 3 successes | 60s | 2 requests | 30s |
| **Claude API (C07)** | 3 failures | 2 successes | 120s | 1 request | 60s |
| **MCP Server (C22)** | 5 failures | 3 successes | 60s | 2 requests | 30s |
| **ORDS (C23)** | 5 failures | 3 successes | 60s | 2 requests | 30s |
| **Redis/Event Bus (C25)** | 10 failures | 5 successes | 30s | 3 requests | 15s |
| **Notification Channels** | 5 failures | 2 successes | 45s | 1 request | 30s |

### Circuit Breaker States

```
CLOSED (normal operation)
  |
  | failure threshold reached
  v
OPEN (all requests fail fast with 503)
  |
  | timeout expires
  v
HALF-OPEN (limited requests allowed)
  |                    |
  | success threshold  | any failure
  v                    v
CLOSED               OPEN
```

### Fallback Strategies

| Circuit | Fallback Behavior |
|---|---|
| **Oracle DB** | Queue write operations; serve cached data for reads; switch to DB Direct Client (C24) if MCP/ORDS circuit open |
| **Claude API** | Return cached similar responses if available; queue request for retry; notify user of delay |
| **MCP Server** | Fall back to ORDS Client (C23); if ORDS also open, fall back to DB Direct Client (C24) |
| **ORDS** | Fall back to DB Direct Client (C24) |
| **Redis/Event Bus** | In-memory event queue with disk spillover; process when Redis recovers |
| **Notification Channels** | Queue notifications in PostgreSQL; process when channel recovers |

### Oracle Access Fallback Chain

The system maintains a three-tier fallback chain for Oracle database access:

```
Primary:   MCP Connector (C22) -- Full APEX metadata API
  |
  | circuit open
  v
Secondary: ORDS Client (C23) -- REST-based CRUD
  |
  | circuit open
  v
Tertiary:  DB Direct Client (C24) -- node-oracledb direct SQL
```

The Connection Service (C04) manages this fallback automatically. Services request a connection and receive whichever tier is currently available. The connection object abstracts the underlying protocol.

---

## Health Check Aggregation

### Liveness vs Readiness

- **Liveness** (`/health`): Service process is running and responsive. Returns 200 if the process can handle HTTP. Does not check downstream dependencies.
- **Readiness** (`/ready`): Service is ready to handle traffic. Checks critical downstream dependencies (database, Redis, etc.). Returns 503 if any critical dependency is unavailable.

### Aggregate Health (API Gateway)

The API Gateway (C01) aggregates health from all services:

```
GET /health -> Gateway process health only
GET /health/detailed -> All service health statuses

Response:
{
  "status": "healthy | degraded | unhealthy",
  "services": {
    "auth": { "status": "healthy", "latencyMs": 2 },
    "explorer": { "status": "healthy", "latencyMs": 5 },
    "ai": { "status": "degraded", "latencyMs": 450, "note": "Claude API slow" },
    ...
  },
  "infrastructure": {
    "postgresql": "healthy",
    "redis": "healthy",
    "oracle": "healthy"
  }
}
```

### Health Check Intervals

| Component | Interval | Timeout | Consecutive Failures Before Unhealthy |
|---|---|---|---|
| PostgreSQL | 10s | 5s | 3 |
| Redis | 5s | 3s | 3 |
| Oracle (per connection) | 30s | 10s | 2 |
| Claude API | 60s | 15s | 2 |
| MCP Server | 30s | 10s | 2 |
| Inter-service | 15s | 5s | 3 |

---

## Service Communication Security

### Internal Service Communication

- All inter-service HTTP calls use mTLS within the OKE cluster
- Services validate the calling service's identity via service mesh (Istio sidecar)
- Internal calls include `X-Request-ID` and `X-Correlation-ID` headers for tracing
- Tenant context propagated via `X-Tenant-ID` header on internal calls

### External Communication

- All external traffic terminates TLS at the OCI Load Balancer
- API Gateway enforces JWT authentication on all `/api/v1/*` routes
- Claude API calls use API key stored in OCI Vault, rotated every 90 days
- Oracle ORDS calls use OAuth2 client credentials per tenant
