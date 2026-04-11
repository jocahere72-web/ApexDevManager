# Functional Design -- U11: Intelligence & Observability

## Document Information

| Field | Value |
|-------|-------|
| **Unit** | U11 -- Intelligence & Observability |
| **Sprint** | S10 (Fase 3, Weeks 22-23) |
| **Duration** | 2 weeks |
| **Modules** | M15 (Usage & Cost Intelligence) + M17 (Product Intelligence Dashboard + Observability + Incidents) |
| **Stories** | US-036, US-037, US-040, US-041, US-042, US-057 |
| **Components** | C18 (Cost Tracker), C19 (Dashboard Aggregator) |
| **Status** | AI-DLC Generated -- For Review |
| **Date** | 2026-04-10 |

---

## 1. M15 -- Usage & Cost Intelligence

### 1.1 Token Tracking per Claude API Call

Every call to the Claude API through AI Studio (M4) records token usage with full attribution context.

#### Token Usage Record

```typescript
interface TokenUsageRecord {
  id: string;                    // UUID
  tenant_id: string;
  user_id: string;
  module: string;                // Source module (e.g., 'ai-studio', 'code-factory', 'test-generator')
  action: string;                // Specific action (e.g., 'code_review', 'generate_test', 'explain_code')
  model: string;                 // Claude model variant
  input_tokens: number;
  output_tokens: number;
  total_tokens: number;          // input + output
  cost_usd: number;              // Calculated cost
  request_id: string;            // Correlation to AI request
  connection_id: string | null;  // Target APEX connection (if applicable)
  app_id: number | null;         // Target APEX application (if applicable)
  duration_ms: number;           // API call duration
  cached_tokens: number;         // Prompt cache hits
  created_at: Date;
}
```

#### Token Tracking Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| TK-R01 | Track every call | Every Claude API call MUST be recorded, regardless of success/failure |
| TK-R02 | Tenant attribution | Every usage record must include tenant_id |
| TK-R03 | User attribution | Every usage record must include user_id |
| TK-R04 | Module attribution | Every usage record must identify the source module |
| TK-R05 | Async recording | Token usage is recorded asynchronously (fire-and-forget) to not impact API latency |
| TK-R06 | Batch insert | Usage records are batched (100 records or 5 seconds, whichever comes first) |

### 1.2 Cost Calculation

Cost is calculated based on model-specific per-token rates. Rates are configurable and stored in a pricing table.

#### Cost Calculation Formula

```
cost_usd = (input_tokens * input_rate) + (output_tokens * output_rate) - (cached_tokens * cache_discount_rate)
```

#### Pricing Configuration

```typescript
interface ModelPricing {
  id: string;
  model: string;                 // e.g., 'claude-sonnet-4-20250514'
  input_rate_per_1k: number;     // USD per 1,000 input tokens
  output_rate_per_1k: number;    // USD per 1,000 output tokens
  cache_discount_rate: number;   // Discount for cached tokens
  effective_from: Date;
  effective_to: Date | null;     // null = current rate
}
```

### 1.3 Dashboard: Monthly Spend vs Quota and Projection

The cost dashboard provides real-time visibility into tenant spending against their plan quota.

#### Dashboard Panels

| Panel | Data | Visualization |
|-------|------|---------------|
| Monthly Spend | Current month total cost | Large number with trend arrow |
| Budget Bar | Spent / quota percentage | Progress bar (green/yellow/red) |
| Projection | Estimated month-end spend based on current rate | Projected number with confidence range |
| Daily Trend | Daily cost for current month | Line chart (Recharts) |
| By Module | Cost breakdown per module | Donut chart |
| By User | Cost per user (top 10) | Horizontal bar chart |
| By Model | Cost per Claude model variant | Stacked bar chart |

#### Projection Algorithm

```typescript
function projectMonthEnd(currentSpend: number, daysElapsed: number, daysInMonth: number): ProjectionResult {
  const dailyRate = currentSpend / daysElapsed;
  const projectedTotal = dailyRate * daysInMonth;
  const confidence = daysElapsed >= 7 ? 'high' : daysElapsed >= 3 ? 'medium' : 'low';
  return { projectedTotal, dailyRate, confidence };
}
```

### 1.4 Budget Alerts

Budget alerts fire when tenant spending crosses configured thresholds.

#### Alert Thresholds

| Threshold | Event | Notification Channel | Latency |
|-----------|-------|---------------------|---------|
| 50% | `COST_THRESHOLD_WARNING` | in_app | Best effort |
| 75% | `COST_THRESHOLD_WARNING` | in_app + email | < 5 min |
| 90% | `COST_THRESHOLD_EXCEEDED` | in_app + email | < 5 min |
| 100% | `COST_BUDGET_EXHAUSTED` | in_app + email + admin | < 5 min |

#### Alert Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| BA-R01 | Alert once per threshold | Each threshold fires only once per billing period |
| BA-R02 | Email delivery | Email notifications must be delivered within 5 minutes of threshold crossing |
| BA-R03 | No hard block at 100% | Reaching 100% triggers alert but does NOT block API calls (soft limit) |
| BA-R04 | Admin visibility | Admin users see all tenant budget statuses |
| BA-R05 | Alert reset | Alerts reset at the start of each billing period |
| BA-R06 | Budget configuration | Budget is set per tenant based on SaaS plan tier |

### 1.5 Margin Tracking (Admin Only)

Platform administrators see revenue vs costs to track business margins.

#### Margin Dashboard

```typescript
interface MarginSummary {
  period: DateRange;
  totalRevenue: number;          // Sum of subscription fees
  totalCosts: number;            // Claude API costs + OCI infrastructure costs
  claudeApiCosts: number;        // Subset: Claude API only
  ociInfraCosts: number;         // Subset: OCI compute, DB, networking
  grossMargin: number;           // revenue - costs
  grossMarginPercent: number;    // (revenue - costs) / revenue * 100
  byTenant: TenantMargin[];
}

interface TenantMargin {
  tenantId: string;
  tenantName: string;
  plan: string;
  monthlyFee: number;
  claudeCosts: number;
  margin: number;
  marginPercent: number;
}
```

---

## 2. M17 -- Product Intelligence Dashboard

### 2.1 Executive Dashboard

The Executive Dashboard provides C-level visibility into the APEX Dev Manager portfolio with four main panels and a portfolio health heat map.

#### Executive Dashboard Panels

**Productivity Panel**:
| Metric | Source | Calculation |
|--------|--------|-------------|
| Changes per developer per week | M6 Change Manager | COUNT changes / COUNT active developers |
| AI-assisted changes % | M4 AI Studio + M6 | COUNT ai_source changes / total changes |
| Avg cycle time (idea to deploy) | M8 PRD Builder + M9 Release Manager | AVG(deploy_date - prd_created_date) |
| Lines of code generated | M16 Code Factory | SUM(lines_generated) |

**Quality Panel**:
| Metric | Source | Calculation |
|--------|--------|-------------|
| Test coverage % | M13 Test Studio | AVG(coverage_percentage) across apps |
| Test pass rate % | M13 Test Studio | SUM(passed) / SUM(total_tests) |
| Defect density | M13 + M6 | COUNT(failed_tests) / COUNT(changes) |
| Code review acceptance rate | M10 AI Governance | COUNT(approved) / COUNT(reviews) |

**AI Performance Panel**:
| Metric | Source | Calculation |
|--------|--------|-------------|
| AI requests today | M15 Usage Intelligence | COUNT(token_usage) today |
| AI success rate | M4 AI Studio | COUNT(successful) / COUNT(total) |
| Avg response time | M4 AI Studio | AVG(duration_ms) |
| Token efficiency | M15 | AVG(useful_output_tokens / total_tokens) |

**Client Activity Panel**:
| Metric | Source | Calculation |
|--------|--------|-------------|
| Active tenants (30d) | M0 Auth | COUNT DISTINCT tenant_id with login in 30 days |
| Active users (7d) | M0 Auth | COUNT DISTINCT user_id with login in 7 days |
| Feature adoption | All modules | Percentage of features used per tenant |
| Avg session duration | M0 Auth | AVG(logout_at - login_at) |

**Portfolio Health Heat Map**:
- Grid: Applications (rows) vs Health Dimensions (columns: test coverage, error rate, deployment frequency, AI usage, documentation coverage)
- Color: Green (healthy) / Yellow (warning) / Red (critical)
- Composite health score: 0-100 per application

**Export to PDF**:
- Executive report PDF generation using server-side rendering
- Sections: KPIs, trends, health map, recommendations
- Branded header/footer with tenant logo and date range

### 2.2 Operational Command Center

The Operational Command Center provides real-time monitoring for DevOps and technical leadership.

#### Ecosystem Status Board

```typescript
interface EcosystemStatus {
  overall: 'green' | 'yellow' | 'red';
  services: ServiceStatus[];
  lastUpdated: Date;
}

interface ServiceStatus {
  name: string;                  // e.g., 'API Gateway', 'PostgreSQL', 'Redis', 'ORDS'
  status: 'green' | 'yellow' | 'red';
  latencyP50Ms: number;
  latencyP95Ms: number;
  latencyP99Ms: number;
  errorRatePercent: number;
  uptimePercent: number;         // Last 30 days
  lastIncident: Date | null;
}
```

#### Operational Panels

| Panel | Data Points | Update Frequency |
|-------|-------------|-----------------|
| Ecosystem Status | Service health grid (green/yellow/red) | Real-time (SSE) |
| Critical Incidents | Active incidents with severity + age | Real-time (SSE) |
| Active Releases | In-progress deployments with stage | Real-time (SSE) |
| Pending Changes | Changes awaiting review/approval | 1 min |
| App Performance | Response times (P50/P95/P99), error rates | 30 sec (SSE) |
| Top Errors | Most frequent errors (last 24h) | 5 min |
| Top Risks | Highest risk changes pending | 5 min |
| Active Users | Currently logged-in users count | 1 min |
| Environment Health | DEV/QA/STAGING/PROD status per tenant | 1 min |
| AI Alerts | Safety engine alerts, high-cost queries | Real-time (SSE) |
| Technical Debt | Known issues, deprecated components | Daily |
| Failed Releases | Recent failed deployments | 5 min |
| Budget Consumption | Cost vs budget per tenant | 15 min |

### 2.3 Incident Panel

#### Incident Lifecycle

```
  detect       triage        investigate      resolve       postmortem
    |            |               |                |              |
    v            v               v                v              v
+----------+ +----------+ +--------------+ +-----------+ +-------------+
| detected | | triaged  | | investigating| | resolved  | | postmortem  |
+----------+ +----------+ +--------------+ +-----------+ +-------------+
                                                               |
                                                               v
                                                          +---------+
                                                          | closed  |
                                                          +---------+
```

#### Incident Entity

```typescript
interface Incident {
  id: string;
  tenant_id: string;
  title: string;
  description: string;
  severity: IncidentSeverity;
  status: IncidentStatus;
  source: 'auto_detected' | 'manual';
  affected_services: string[];
  affected_tenants: string[];    // For platform-wide incidents
  assigned_to: string | null;
  detected_at: Date;
  triaged_at: Date | null;
  resolved_at: Date | null;
  postmortem_at: Date | null;
  closed_at: Date | null;
  mttr_minutes: number | null;   // Mean Time to Resolve
  root_cause: string | null;
  resolution_notes: string | null;
  timeline: IncidentTimelineEntry[];
  created_at: Date;
  updated_at: Date;
}

type IncidentSeverity = 'critical' | 'high' | 'medium' | 'low';
type IncidentStatus = 'detected' | 'triaged' | 'investigating' | 'resolved' | 'postmortem' | 'closed';
```

#### Severity Definitions and Escalation

| Severity | Definition | Response Time | Escalation |
|----------|-----------|---------------|------------|
| Critical | Service down, data loss risk | 15 min | Immediate: admin + devops |
| High | Major feature degraded | 30 min | 30 min: tech_lead |
| Medium | Minor feature impacted | 2 hours | 4 hours: tech_lead |
| Low | Cosmetic / non-blocking | Next business day | None |

#### MTTR Tracking

```typescript
// MTTR = resolved_at - detected_at (in minutes)
// Tracked per severity level
interface MTTRMetrics {
  overall: { avg: number; p50: number; p95: number };
  bySeverity: Record<IncidentSeverity, { avg: number; p50: number; p95: number; count: number }>;
  trend: { period: string; avgMttr: number }[];  // Last 6 months
}
```

---

## 3. Data Models

### 3.1 Usage & Cost Tables

#### `token_usage`

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Usage record ID |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant attribution |
| user_id | UUID | FK users(id), NOT NULL | User attribution |
| module | VARCHAR(50) | NOT NULL | Source module identifier |
| action | VARCHAR(100) | NOT NULL | Specific action identifier |
| model | VARCHAR(100) | NOT NULL | Claude model variant |
| input_tokens | INTEGER | NOT NULL | Input tokens consumed |
| output_tokens | INTEGER | NOT NULL | Output tokens consumed |
| total_tokens | INTEGER | NOT NULL | Total tokens |
| cached_tokens | INTEGER | DEFAULT 0 | Prompt cache hits |
| cost_usd | DECIMAL(10,6) | NOT NULL | Calculated cost |
| request_id | VARCHAR(100) | | Correlation ID |
| connection_id | UUID | FK connections(id) | Target connection |
| app_id | INTEGER | | Target application |
| duration_ms | INTEGER | | API call duration |
| success | BOOLEAN | DEFAULT true | Call success status |
| created_at | TIMESTAMPTZ | DEFAULT now() | Record timestamp |

**Indexes**: `(tenant_id, created_at DESC)`, `(tenant_id, user_id, created_at DESC)`, `(tenant_id, module, created_at DESC)`, `(model, created_at DESC)`
**RLS**: `tenant_id = current_setting('app.current_tenant')`
**Partitioning**: Monthly by `created_at`

#### `cost_budgets`

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Budget ID |
| tenant_id | UUID | FK tenants(id), NOT NULL, UNIQUE | One budget per tenant |
| monthly_budget_usd | DECIMAL(10,2) | NOT NULL | Monthly budget amount |
| alert_thresholds | INTEGER[] | DEFAULT '{50,75,90,100}' | Alert threshold percentages |
| notify_roles | TEXT[] | DEFAULT '{admin}' | Roles to notify |
| notify_channels | TEXT[] | DEFAULT '{in_app,email}' | Notification channels |
| is_hard_limit | BOOLEAN | DEFAULT false | Block API calls at 100% |
| created_at | TIMESTAMPTZ | DEFAULT now() | Creation timestamp |
| updated_at | TIMESTAMPTZ | DEFAULT now() | Last update |

**RLS**: `tenant_id = current_setting('app.current_tenant')`

#### `cost_alerts`

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Alert ID |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant |
| threshold_percent | INTEGER | NOT NULL | Threshold that was crossed |
| spent_usd | DECIMAL(10,2) | NOT NULL | Spend at time of alert |
| budget_usd | DECIMAL(10,2) | NOT NULL | Budget at time of alert |
| billing_period | VARCHAR(7) | NOT NULL | Format: YYYY-MM |
| notified_at | TIMESTAMPTZ | DEFAULT now() | Alert timestamp |
| notification_sent | BOOLEAN | DEFAULT false | Email/notification delivered |
| created_at | TIMESTAMPTZ | DEFAULT now() | Record timestamp |

**Indexes**: `(tenant_id, billing_period, threshold_percent)` UNIQUE
**RLS**: `tenant_id = current_setting('app.current_tenant')`

#### `model_pricing`

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Pricing ID |
| model | VARCHAR(100) | NOT NULL | Claude model identifier |
| input_rate_per_1k | DECIMAL(10,6) | NOT NULL | USD per 1K input tokens |
| output_rate_per_1k | DECIMAL(10,6) | NOT NULL | USD per 1K output tokens |
| cache_discount_rate | DECIMAL(10,6) | DEFAULT 0 | Cache discount rate |
| effective_from | DATE | NOT NULL | Start date |
| effective_to | DATE | | End date (null = current) |
| created_at | TIMESTAMPTZ | DEFAULT now() | Creation timestamp |

**Indexes**: `(model, effective_from DESC)` -- No RLS (platform-wide pricing)

### 3.2 Dashboard & Incident Tables

#### `incidents`

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Incident ID |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant scope |
| title | VARCHAR(200) | NOT NULL | Incident title |
| description | TEXT | | Detailed description |
| severity | VARCHAR(10) | NOT NULL, CHECK IN ('critical', 'high', 'medium', 'low') | Severity level |
| status | VARCHAR(20) | NOT NULL, DEFAULT 'detected', CHECK IN ('detected', 'triaged', 'investigating', 'resolved', 'postmortem', 'closed') | Lifecycle status |
| source | VARCHAR(20) | NOT NULL, CHECK IN ('auto_detected', 'manual') | Detection source |
| affected_services | TEXT[] | DEFAULT '{}' | Affected service names |
| assigned_to | UUID | FK users(id) | Assigned responder |
| detected_at | TIMESTAMPTZ | NOT NULL, DEFAULT now() | Detection time |
| triaged_at | TIMESTAMPTZ | | Triage time |
| resolved_at | TIMESTAMPTZ | | Resolution time |
| postmortem_at | TIMESTAMPTZ | | Postmortem completion |
| closed_at | TIMESTAMPTZ | | Closure time |
| mttr_minutes | INTEGER | | Calculated MTTR |
| root_cause | TEXT | | Root cause analysis |
| resolution_notes | TEXT | | Resolution description |
| created_at | TIMESTAMPTZ | DEFAULT now() | Record creation |
| updated_at | TIMESTAMPTZ | DEFAULT now() | Last update |

**Indexes**: `(tenant_id, status)`, `(tenant_id, severity, status)`, `(tenant_id, detected_at DESC)`
**RLS**: `tenant_id = current_setting('app.current_tenant')`

#### `incident_timeline`

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Entry ID |
| incident_id | UUID | FK incidents(id), NOT NULL | Parent incident |
| tenant_id | UUID | FK tenants(id), NOT NULL | Tenant scope |
| action | VARCHAR(50) | NOT NULL | Action type (status_change, comment, assignment, escalation) |
| description | TEXT | NOT NULL | Entry description |
| actor_id | UUID | FK users(id) | User who performed action |
| metadata | JSONB | DEFAULT '{}' | Additional data |
| created_at | TIMESTAMPTZ | DEFAULT now() | Entry timestamp |

**Indexes**: `(incident_id, created_at)`
**RLS**: `tenant_id = current_setting('app.current_tenant')`

### 3.3 Dashboard Aggregation Views

```sql
-- Daily cost aggregation (materialized view, refreshed every 15 min)
CREATE MATERIALIZED VIEW mv_daily_costs AS
SELECT
  tenant_id,
  date_trunc('day', created_at)::date AS cost_date,
  module,
  model,
  SUM(input_tokens) AS total_input_tokens,
  SUM(output_tokens) AS total_output_tokens,
  SUM(cost_usd) AS total_cost,
  COUNT(*) AS request_count
FROM token_usage
GROUP BY tenant_id, date_trunc('day', created_at), module, model;

-- Dashboard KPI aggregation (materialized view, refreshed every 5 min)
CREATE MATERIALIZED VIEW mv_dashboard_kpis AS
SELECT
  t.id AS tenant_id,
  (SELECT COUNT(*) FROM token_usage tu WHERE tu.tenant_id = t.id AND tu.created_at >= CURRENT_DATE) AS ai_requests_today,
  (SELECT COALESCE(AVG(duration_ms), 0) FROM token_usage tu WHERE tu.tenant_id = t.id AND tu.created_at >= CURRENT_DATE) AS avg_ai_latency_ms,
  (SELECT COUNT(DISTINCT user_id) FROM audit_events ae WHERE ae.tenant_id = t.id AND ae.created_at >= NOW() - INTERVAL '7 days') AS active_users_7d,
  (SELECT COUNT(*) FROM incidents i WHERE i.tenant_id = t.id AND i.status NOT IN ('resolved', 'closed')) AS open_incidents
FROM tenants t;
```

---

## 4. Error Codes

| Error Code | HTTP | Condition |
|------------|------|-----------|
| COST_BUDGET_NOT_FOUND | 404 | No budget configured for tenant |
| COST_BUDGET_EXCEEDED | 422 | Budget at 100% and hard limit enabled |
| COST_INVALID_THRESHOLD | 422 | Alert threshold not in valid range |
| COST_PRICING_NOT_FOUND | 404 | No pricing for specified model |
| INCIDENT_NOT_FOUND | 404 | Incident ID does not exist |
| INCIDENT_INVALID_TRANSITION | 422 | Invalid status transition |
| INCIDENT_ALREADY_RESOLVED | 409 | Attempting to modify resolved incident |
| DASHBOARD_EXPORT_FAILED | 500 | PDF export generation failed |
| DASHBOARD_METRIC_NOT_FOUND | 404 | Custom metric does not exist |

---

## 5. API Endpoints

### 5.1 M15 Usage & Cost Endpoints

| Method | Path | Auth | Description |
|--------|------|------|-------------|
| GET | `/api/v1/costs/summary` | authenticate() | Get cost summary for current tenant |
| GET | `/api/v1/costs/daily` | authenticate() | Get daily cost breakdown |
| GET | `/api/v1/costs/by-user` | authorize(['admin', 'tech_lead']) | Cost per user |
| GET | `/api/v1/costs/by-module` | authenticate() | Cost per module |
| GET | `/api/v1/costs/by-model` | authenticate() | Cost per model |
| GET | `/api/v1/costs/projection` | authenticate() | Month-end projection |
| GET | `/api/v1/costs/budget` | authenticate() | Get budget status |
| PUT | `/api/v1/costs/budget` | authorize(['admin']) | Configure budget |
| GET | `/api/v1/costs/alerts` | authenticate() | List cost alerts |
| GET | `/api/v1/costs/analytics` | authorize(['admin', 'tech_lead']) | Cost analytics with trends |
| GET | `/api/v1/admin/margins` | authorize(['admin']) | Margin tracking (platform admin) |
| GET | `/api/v1/admin/margins/by-tenant` | authorize(['admin']) | Per-tenant margin breakdown |

### 5.2 M17 Dashboard Endpoints

| Method | Path | Auth | Description |
|--------|------|------|-------------|
| GET | `/api/v1/dashboard/executive` | authorize(['admin', 'tech_lead']) | Executive dashboard data |
| GET | `/api/v1/dashboard/executive/export` | authorize(['admin', 'tech_lead']) | Export executive report as PDF |
| GET | `/api/v1/dashboard/operational` | authorize(['admin', 'tech_lead', 'devops_engineer']) | Operational command center data |
| GET | `/api/v1/dashboard/operational/stream` | authorize(['admin', 'tech_lead', 'devops_engineer']) | SSE stream for real-time updates |
| GET | `/api/v1/dashboard/kpis` | authenticate() | KPI summary |
| GET | `/api/v1/dashboard/metrics/:category` | authenticate() | Metrics by category |
| GET | `/api/v1/dashboard/health/:appId` | authenticate() | Application health score |
| GET | `/api/v1/dashboard/health-map` | authorize(['admin', 'tech_lead']) | Portfolio health heat map |

### 5.3 Incident Endpoints

| Method | Path | Auth | Description |
|--------|------|------|-------------|
| GET | `/api/v1/incidents` | authenticate() | List incidents |
| POST | `/api/v1/incidents` | authorize(['admin', 'tech_lead', 'devops_engineer']) | Create incident |
| GET | `/api/v1/incidents/:id` | authenticate() | Get incident details |
| PATCH | `/api/v1/incidents/:id` | authorize(['admin', 'tech_lead', 'devops_engineer']) | Update incident |
| POST | `/api/v1/incidents/:id/triage` | authorize(['admin', 'tech_lead', 'devops_engineer']) | Triage incident |
| POST | `/api/v1/incidents/:id/resolve` | authorize(['admin', 'tech_lead', 'devops_engineer']) | Resolve incident |
| POST | `/api/v1/incidents/:id/postmortem` | authorize(['admin', 'tech_lead']) | Complete postmortem |
| POST | `/api/v1/incidents/:id/close` | authorize(['admin', 'tech_lead']) | Close incident |
| GET | `/api/v1/incidents/:id/timeline` | authenticate() | Get incident timeline |
| POST | `/api/v1/incidents/:id/timeline` | authorize(['admin', 'tech_lead', 'devops_engineer']) | Add timeline entry |
| GET | `/api/v1/incidents/metrics` | authorize(['admin', 'tech_lead', 'devops_engineer']) | MTTR and incident metrics |

---

## 6. Real-Time Data Feeds (SSE)

The Operational Command Center uses Server-Sent Events (SSE) for real-time data updates.

#### SSE Architecture

```
Browser                     API Server                   Redis Pub/Sub
  |                            |                             |
  |-- GET /dashboard/          |                             |
  |   operational/stream ----->|                             |
  |   Accept: text/event-      |                             |
  |   stream                   |                             |
  |                            |-- SUBSCRIBE metrics ------->|
  |                            |                             |
  |                            |  [On metric update]         |
  |                            |<-- PUBLISH metric_update ---|
  |<-- event: metric_update ---|                             |
  |    data: { ... }           |                             |
  |                            |                             |
  |<-- event: incident --------|  [On incident change]       |
  |    data: { ... }           |                             |
  |                            |                             |
  |<-- event: heartbeat -------|  [Every 30 seconds]         |
  |    data: { ts }            |                             |
```

#### SSE Event Types

| Event | Payload | Frequency |
|-------|---------|-----------|
| `metric_update` | `{ category, metricName, value, timestamp }` | On change |
| `incident` | `{ id, title, severity, status, action }` | On change |
| `release_update` | `{ releaseId, stage, status }` | On change |
| `service_status` | `{ serviceName, status, latency }` | Every 30s |
| `heartbeat` | `{ timestamp }` | Every 30s |

---

## 7. Events Emitted

| Event | Trigger | Payload |
|-------|---------|---------|
| `TOKEN_USAGE_RECORDED` | Token usage batch inserted | `{ tenantId, count, totalTokens }` |
| `COST_THRESHOLD_WARNING` | Spend crosses 50% or 75% | `{ tenantId, threshold, spent, budget }` |
| `COST_THRESHOLD_EXCEEDED` | Spend crosses 90% | `{ tenantId, threshold, spent, budget }` |
| `COST_BUDGET_EXHAUSTED` | Spend reaches 100% | `{ tenantId, spent, budget }` |
| `INCIDENT_CREATED` | New incident detected/reported | `{ incidentId, severity, title }` |
| `INCIDENT_STATUS_CHANGED` | Incident status transitions | `{ incidentId, fromStatus, toStatus }` |
| `INCIDENT_ESCALATED` | Incident escalated to higher role | `{ incidentId, severity, escalatedTo }` |
| `INCIDENT_RESOLVED` | Incident resolved | `{ incidentId, mttrMinutes }` |

---

## 8. Non-Functional Considerations

| Aspect | Requirement |
|--------|-------------|
| Token usage recording latency | < 50ms (async, fire-and-forget) |
| Token usage batch size | 100 records or 5 seconds |
| Cost dashboard data freshness | Materialized views refreshed every 15 min |
| Budget alert email delivery | < 5 minutes from threshold crossing |
| SSE connection limit | 100 concurrent SSE connections per tenant |
| SSE heartbeat interval | Every 30 seconds |
| PDF export generation time | < 30 seconds |
| Incident MTTR tracking | Accurate to the minute |
| Token usage retention | 12 months (partitioned monthly) |
| Dashboard KPI refresh | Materialized view refreshed every 5 minutes |
