# Code Generation Plan -- U11: Intelligence & Observability

## Document Information

| Field | Value |
|-------|-------|
| **Unit** | U11 -- Intelligence & Observability |
| **Sprint** | S10 (Fase 3, Weeks 22-23) |
| **Modules** | M15 (Usage & Cost Intelligence) + M17 (Product Intelligence Dashboard + Observability + Incidents) |
| **Stories** | US-036, US-037, US-040, US-041, US-042, US-057 |
| **Status** | AI-DLC Generated -- For Review |
| **Date** | 2026-04-10 |

---

## Prerequisites

Before starting code generation, verify prior unit deliverables:
- [ ] U5 completed: AI Studio (M4) operational with token tracking hooks
- [ ] U2 completed: Auth middleware, tenant resolver, audit logging available
- [ ] U1 completed: Redis operational for SSE pub/sub, PostgreSQL for materialized views
- [ ] Event bus (C25) operational for cost and incident events
- [ ] Notification service (C21) available for budget alert emails
- [ ] Recharts library added to frontend dependencies

---

## Plan Checklist

### 1. Database Migrations

- [ ] `migrations/042_token_usage.sql`
  - [ ] Create `token_usage` table (id, tenant_id, user_id, module, action, model, input_tokens, output_tokens, total_tokens, cached_tokens, cost_usd, request_id, connection_id, app_id, duration_ms, success, created_at)
  - [ ] Create index on `(tenant_id, created_at DESC)`
  - [ ] Create index on `(tenant_id, user_id, created_at DESC)`
  - [ ] Create index on `(tenant_id, module, created_at DESC)`
  - [ ] Create index on `(model, created_at DESC)`
  - [ ] Enable RLS
  - [ ] Partition by `created_at` (monthly)

- [ ] `migrations/043_cost_budgets.sql`
  - [ ] Create `cost_budgets` table (id, tenant_id UNIQUE, monthly_budget_usd, alert_thresholds, notify_roles, notify_channels, is_hard_limit, created_at, updated_at)
  - [ ] Enable RLS

- [ ] `migrations/044_cost_alerts.sql`
  - [ ] Create `cost_alerts` table (id, tenant_id, threshold_percent, spent_usd, budget_usd, billing_period, notified_at, notification_sent, created_at)
  - [ ] Create UNIQUE index on `(tenant_id, billing_period, threshold_percent)`
  - [ ] Enable RLS

- [ ] `migrations/045_model_pricing.sql`
  - [ ] Create `model_pricing` table (id, model, input_rate_per_1k, output_rate_per_1k, cache_discount_rate, effective_from, effective_to, created_at)
  - [ ] Create index on `(model, effective_from DESC)`
  - [ ] No RLS (platform-wide)
  - [ ] Seed data for current Claude model pricing

- [ ] `migrations/046_incidents.sql`
  - [ ] Create `incidents` table (id, tenant_id, title, description, severity, status, source, affected_services, assigned_to, detected_at, triaged_at, resolved_at, postmortem_at, closed_at, mttr_minutes, root_cause, resolution_notes, created_at, updated_at)
  - [ ] CHECK constraint: `severity IN ('critical', 'high', 'medium', 'low')`
  - [ ] CHECK constraint: `status IN ('detected', 'triaged', 'investigating', 'resolved', 'postmortem', 'closed')`
  - [ ] CHECK constraint: `source IN ('auto_detected', 'manual')`
  - [ ] Create index on `(tenant_id, status)`
  - [ ] Create index on `(tenant_id, severity, status)`
  - [ ] Create index on `(tenant_id, detected_at DESC)`
  - [ ] Enable RLS

- [ ] `migrations/047_incident_timeline.sql`
  - [ ] Create `incident_timeline` table (id, incident_id, tenant_id, action, description, actor_id, metadata JSONB, created_at)
  - [ ] Create index on `(incident_id, created_at)`
  - [ ] Enable RLS

- [ ] `migrations/048_dashboard_views.sql`
  - [ ] Create materialized view `mv_daily_costs` (tenant_id, cost_date, module, model, total_input_tokens, total_output_tokens, total_cost, request_count)
  - [ ] Create materialized view `mv_dashboard_kpis` (tenant_id, ai_requests_today, avg_ai_latency_ms, active_users_7d, open_incidents)
  - [ ] Create indexes on both materialized views
  - [ ] Create refresh function and pg_cron schedule (mv_daily_costs every 15 min, mv_dashboard_kpis every 5 min)

---

### 2. Shared Types (packages/shared-types)

- [ ] `packages/shared-types/src/cost-intelligence.ts`
  - [ ] `TokenUsageRecord` interface
  - [ ] `CostSummary`, `CostAnalytics` interfaces
  - [ ] `BudgetStatus`, `BudgetCheckResult`, `BudgetAlertConfig` interfaces
  - [ ] `ModelPricing` interface
  - [ ] `MarginSummary`, `TenantMargin` interfaces
  - [ ] `ProjectionResult` interface

- [ ] `packages/shared-types/src/dashboard.ts`
  - [ ] `KPIDashboard` interface
  - [ ] `MetricCategory` union type
  - [ ] `MetricSet`, `Metric`, `MetricUpdate` interfaces
  - [ ] `EcosystemStatus`, `ServiceStatus` interfaces
  - [ ] `ReportType` union type
  - [ ] `Report` interface
  - [ ] `HealthScore` interface

- [ ] `packages/shared-types/src/incidents.ts`
  - [ ] `IncidentSeverity`, `IncidentStatus` union types
  - [ ] `Incident`, `IncidentTimelineEntry` interfaces
  - [ ] `MTTRMetrics` interface
  - [ ] `CreateIncidentInput`, `UpdateIncidentInput` interfaces

---

### 3. M15 Usage & Cost Backend Module (apps/api/src/modules/usage-intelligence/)

- [ ] `src/modules/usage-intelligence/cost.types.ts`
  - [ ] Re-export shared types with service-internal extensions
  - [ ] `TokenUsageRow`, `CostBudgetRow`, `CostAlertRow`, `ModelPricingRow` DB row interfaces

- [ ] `src/modules/usage-intelligence/cost.validation.ts`
  - [ ] `RecordUsageSchema` (Zod) -- internal, validated at service boundary
  - [ ] `CostSummaryQuerySchema` (Zod) -- period (from, to), groupBy?
  - [ ] `ConfigureBudgetSchema` (Zod) -- monthlyBudgetUsd, alertThresholds[], notifyRoles[], notifyChannels[], isHardLimit?
  - [ ] `CostAnalyticsQuerySchema` (Zod) -- granularity, period?, groupBy?

- [ ] `src/modules/usage-intelligence/token-tracker.service.ts`
  - [ ] `recordUsage(usage: TokenUsageInput): Promise<void>` -- calculate cost, add to batch buffer
  - [ ] `flushBatch(): Promise<void>` -- bulk insert buffered records (triggered at 100 records or 5 sec interval)
  - [ ] `startBatchTimer(): void` -- initialize 5-second flush interval
  - [ ] `calculateCost(model: string, inputTokens: number, outputTokens: number, cachedTokens: number): Promise<number>` -- lookup pricing, apply formula

- [ ] `src/modules/usage-intelligence/cost-summary.service.ts`
  - [ ] `getCostSummary(tenantId: string, period?: DateRange): Promise<CostSummary>` -- aggregate from mv_daily_costs
  - [ ] `getDailyCosts(tenantId: string, period: DateRange): Promise<DailyCost[]>` -- daily breakdown
  - [ ] `getCostByUser(tenantId: string, period?: DateRange): Promise<UserCost[]>` -- per-user breakdown
  - [ ] `getCostByModule(tenantId: string, period?: DateRange): Promise<ModuleCost[]>` -- per-module breakdown
  - [ ] `getCostByModel(tenantId: string, period?: DateRange): Promise<ModelCost[]>` -- per-model breakdown
  - [ ] `getProjection(tenantId: string): Promise<ProjectionResult>` -- month-end projection

- [ ] `src/modules/usage-intelligence/budget.service.ts`
  - [ ] `getBudgetStatus(tenantId: string): Promise<BudgetStatus>` -- current spend vs budget
  - [ ] `configureBudget(tenantId: string, config: BudgetAlertConfig, actorId: string): Promise<void>` -- upsert budget config
  - [ ] `checkBudget(tenantId: string): Promise<BudgetCheckResult>` -- check if within budget
  - [ ] `evaluateAlerts(tenantId: string): Promise<void>` -- check thresholds, fire events if crossed, send notifications
  - [ ] `getAlertHistory(tenantId: string): Promise<CostAlert[]>` -- list past alerts

- [ ] `src/modules/usage-intelligence/margin.service.ts`
  - [ ] `getMarginSummary(period: DateRange): Promise<MarginSummary>` -- admin only, platform-wide
  - [ ] `getMarginByTenant(period: DateRange): Promise<TenantMargin[]>` -- per-tenant breakdown

- [ ] `src/modules/usage-intelligence/cost.controller.ts`
  - [ ] `GET /api/v1/costs/summary` -- getCostSummary
  - [ ] `GET /api/v1/costs/daily` -- getDailyCosts
  - [ ] `GET /api/v1/costs/by-user` -- getCostByUser
  - [ ] `GET /api/v1/costs/by-module` -- getCostByModule
  - [ ] `GET /api/v1/costs/by-model` -- getCostByModel
  - [ ] `GET /api/v1/costs/projection` -- getProjection
  - [ ] `GET /api/v1/costs/budget` -- getBudgetStatus
  - [ ] `PUT /api/v1/costs/budget` -- configureBudget
  - [ ] `GET /api/v1/costs/alerts` -- getAlertHistory
  - [ ] `GET /api/v1/costs/analytics` -- getCostAnalytics
  - [ ] `GET /api/v1/admin/margins` -- getMarginSummary
  - [ ] `GET /api/v1/admin/margins/by-tenant` -- getMarginByTenant

---

### 4. M17 Dashboard Backend Module (apps/api/src/modules/dashboards/)

- [ ] `src/modules/dashboards/dashboard.types.ts`
  - [ ] Re-export shared types with service-internal extensions
  - [ ] `IncidentRow`, `IncidentTimelineRow` DB row interfaces

- [ ] `src/modules/dashboards/dashboard.validation.ts`
  - [ ] `ExecutiveDashboardQuerySchema` (Zod) -- period?
  - [ ] `ExportReportSchema` (Zod) -- format ('pdf'), period
  - [ ] `HealthScoreQuerySchema` (Zod) -- appId
  - [ ] `MetricCategorySchema` (Zod) -- category enum
  - [ ] `CreateIncidentSchema` (Zod) -- title, description?, severity, source, affectedServices?
  - [ ] `UpdateIncidentSchema` (Zod) -- title?, description?, severity?, assignedTo?
  - [ ] `TriageIncidentSchema` (Zod) -- assignedTo, priority?
  - [ ] `ResolveIncidentSchema` (Zod) -- resolutionNotes
  - [ ] `PostmortemSchema` (Zod) -- rootCause, resolutionNotes
  - [ ] `TimelineEntrySchema` (Zod) -- action, description, metadata?

- [ ] `src/modules/dashboards/executive-dashboard.service.ts`
  - [ ] `getExecutiveDashboard(tenantId: string, period?: DateRange): Promise<ExecutiveDashboard>` -- aggregate KPIs from all modules
  - [ ] `getProductivityPanel(tenantId: string): Promise<ProductivityPanel>`
  - [ ] `getQualityPanel(tenantId: string): Promise<QualityPanel>`
  - [ ] `getAIPerformancePanel(tenantId: string): Promise<AIPerformancePanel>`
  - [ ] `getClientActivityPanel(tenantId: string): Promise<ClientActivityPanel>`
  - [ ] `getPortfolioHealthMap(tenantId: string): Promise<HealthMapEntry[]>`

- [ ] `src/modules/dashboards/operational-dashboard.service.ts`
  - [ ] `getOperationalData(tenantId: string): Promise<OperationalDashboard>` -- compile all operational panels
  - [ ] `getEcosystemStatus(tenantId: string): Promise<EcosystemStatus>` -- service health check
  - [ ] `getActiveReleases(tenantId: string): Promise<ActiveRelease[]>`
  - [ ] `getPendingChanges(tenantId: string): Promise<PendingChange[]>`
  - [ ] `getTopErrors(tenantId: string, hours: number): Promise<ErrorEntry[]>`
  - [ ] `getTopRisks(tenantId: string): Promise<RiskEntry[]>`

- [ ] `src/modules/dashboards/sse.service.ts`
  - [ ] `createSSEStream(tenantId: string, res: Response): void` -- establish SSE connection, subscribe to Redis pub/sub channels
  - [ ] `publishMetricUpdate(tenantId: string, update: MetricUpdate): void` -- publish to Redis channel
  - [ ] `publishIncidentUpdate(tenantId: string, incident: Incident): void`
  - [ ] `startHeartbeat(res: Response): NodeJS.Timer` -- 30-second heartbeat
  - [ ] `cleanupConnection(connectionId: string): void` -- unsubscribe and close

- [ ] `src/modules/dashboards/health-score.service.ts`
  - [ ] `getHealthScore(appId: number, tenantId: string): Promise<HealthScore>` -- composite 0-100 score
  - [ ] `getHealthMap(tenantId: string): Promise<HealthMapEntry[]>` -- all apps with dimension scores
  - [ ] `calculateDimensionScore(dimension: string, appId: number): Promise<number>` -- individual dimension calculation

- [ ] `src/modules/dashboards/pdf-export.service.ts`
  - [ ] `generateExecutiveReport(tenantId: string, period: DateRange): Promise<Buffer>` -- render executive dashboard as PDF
  - [ ] Server-side rendering using Puppeteer or @react-pdf/renderer

- [ ] `src/modules/dashboards/incident.service.ts`
  - [ ] `createIncident(data: CreateIncidentInput, actorId: string): Promise<Incident>` -- insert, emit INCIDENT_CREATED, add timeline entry
  - [ ] `getIncidentById(id: string): Promise<Incident>`
  - [ ] `listIncidents(tenantId: string, filters?: IncidentFilters): Promise<PaginatedResult<Incident>>`
  - [ ] `updateIncident(id: string, data: UpdateIncidentInput, actorId: string): Promise<Incident>`
  - [ ] `triageIncident(id: string, data: TriageInput, actorId: string): Promise<Incident>` -- transition to triaged, assign
  - [ ] `resolveIncident(id: string, data: ResolveInput, actorId: string): Promise<Incident>` -- transition to resolved, calculate MTTR
  - [ ] `completePostmortem(id: string, data: PostmortemInput, actorId: string): Promise<Incident>`
  - [ ] `closeIncident(id: string, actorId: string): Promise<Incident>`
  - [ ] `addTimelineEntry(incidentId: string, entry: TimelineEntryInput, actorId: string): Promise<IncidentTimelineEntry>`
  - [ ] `getTimeline(incidentId: string): Promise<IncidentTimelineEntry[]>`
  - [ ] `getMTTRMetrics(tenantId: string): Promise<MTTRMetrics>`

- [ ] `src/modules/dashboards/dashboard.controller.ts`
  - [ ] `GET /api/v1/dashboard/executive` -- getExecutiveDashboard
  - [ ] `GET /api/v1/dashboard/executive/export` -- generateExecutiveReport (returns PDF)
  - [ ] `GET /api/v1/dashboard/operational` -- getOperationalData
  - [ ] `GET /api/v1/dashboard/operational/stream` -- SSE endpoint
  - [ ] `GET /api/v1/dashboard/kpis` -- getKPIs (from mv_dashboard_kpis)
  - [ ] `GET /api/v1/dashboard/metrics/:category` -- getMetrics
  - [ ] `GET /api/v1/dashboard/health/:appId` -- getHealthScore
  - [ ] `GET /api/v1/dashboard/health-map` -- getHealthMap

- [ ] `src/modules/dashboards/incident.controller.ts`
  - [ ] `GET /api/v1/incidents` -- listIncidents
  - [ ] `POST /api/v1/incidents` -- createIncident
  - [ ] `GET /api/v1/incidents/:id` -- getIncidentById
  - [ ] `PATCH /api/v1/incidents/:id` -- updateIncident
  - [ ] `POST /api/v1/incidents/:id/triage` -- triageIncident
  - [ ] `POST /api/v1/incidents/:id/resolve` -- resolveIncident
  - [ ] `POST /api/v1/incidents/:id/postmortem` -- completePostmortem
  - [ ] `POST /api/v1/incidents/:id/close` -- closeIncident
  - [ ] `GET /api/v1/incidents/:id/timeline` -- getTimeline
  - [ ] `POST /api/v1/incidents/:id/timeline` -- addTimelineEntry
  - [ ] `GET /api/v1/incidents/metrics` -- getMTTRMetrics

---

### 5. M15 Cost Dashboard Frontend (apps/web/src/features/usage-intelligence/)

- [ ] `features/usage-intelligence/api/cost.api.ts`
  - [ ] API client functions for all cost endpoints
  - [ ] TanStack Query hooks: `useCostSummary`, `useDailyCosts`, `useCostByUser`, `useCostByModule`, `useBudgetStatus`, `useProjection`
  - [ ] Mutations: `useConfigureBudget`

- [ ] `features/usage-intelligence/pages/CostDashboardPage.tsx`
  - [ ] Main cost dashboard with period selector
  - [ ] Grid layout for cost panels

- [ ] `features/usage-intelligence/components/CostOverview.tsx`
  - [ ] Monthly spend large number with trend arrow
  - [ ] Budget progress bar (green/yellow/red based on %)
  - [ ] Projection card with confidence indicator

- [ ] `features/usage-intelligence/components/CostTrendChart.tsx`
  - [ ] Recharts LineChart: daily cost for current month
  - [ ] Budget line overlay
  - [ ] Projection dashed line

- [ ] `features/usage-intelligence/components/CostBreakdownCharts.tsx`
  - [ ] Recharts PieChart: cost by module
  - [ ] Recharts BarChart: cost by user (top 10)
  - [ ] Recharts StackedBarChart: cost by model

- [ ] `features/usage-intelligence/components/BudgetConfigDialog.tsx`
  - [ ] Form: monthly budget, thresholds, notification channels
  - [ ] Current budget display with edit toggle

- [ ] `features/usage-intelligence/components/AlertHistory.tsx`
  - [ ] Table: threshold, amount, date, notification status

---

### 6. M17 Dashboard Frontend (apps/web/src/features/dashboards/)

- [ ] `features/dashboards/api/dashboard.api.ts`
  - [ ] API client functions for dashboard and incident endpoints
  - [ ] TanStack Query hooks: `useExecutiveDashboard`, `useOperationalDashboard`, `useKPIs`, `useHealthMap`, `useIncidents`, `useMTTRMetrics`
  - [ ] SSE hook: `useOperationalStream` (EventSource connection with reconnect logic)
  - [ ] Mutations: `useCreateIncident`, `useTriageIncident`, `useResolveIncident`

- [ ] `features/dashboards/pages/ExecutiveDashboardPage.tsx`
  - [ ] Four-panel layout: Productivity, Quality, AI Performance, Client Activity
  - [ ] Portfolio health heat map
  - [ ] Cost summary panel
  - [ ] "Export to PDF" button

- [ ] `features/dashboards/pages/OperationalDashboardPage.tsx`
  - [ ] Ecosystem status board (service health grid)
  - [ ] Live metrics panels with SSE updates
  - [ ] Incident sidebar
  - [ ] Active releases panel

- [ ] `features/dashboards/pages/IncidentPage.tsx`
  - [ ] Incident list with severity/status filters
  - [ ] Incident detail view with timeline
  - [ ] Create incident dialog

- [ ] `features/dashboards/components/ProductivityPanel.tsx`
  - [ ] Changes per dev/week metric card
  - [ ] AI-assisted changes percentage
  - [ ] Cycle time trend (Recharts)

- [ ] `features/dashboards/components/QualityPanel.tsx`
  - [ ] Test coverage gauge (Recharts RadialBarChart)
  - [ ] Pass rate percentage
  - [ ] Defect density trend

- [ ] `features/dashboards/components/AIPerformancePanel.tsx`
  - [ ] Requests today counter
  - [ ] Success rate gauge
  - [ ] Avg response time sparkline

- [ ] `features/dashboards/components/ClientActivityPanel.tsx`
  - [ ] Active tenants / users counters
  - [ ] Feature adoption heat map
  - [ ] Session duration trend

- [ ] `features/dashboards/components/HealthHeatMap.tsx`
  - [ ] Grid component: apps x dimensions
  - [ ] Color-coded cells (green/yellow/red)
  - [ ] Tooltip with score details

- [ ] `features/dashboards/components/EcosystemStatusBoard.tsx`
  - [ ] Service cards with green/yellow/red status
  - [ ] Latency P50/P95/P99 display
  - [ ] Uptime percentage

- [ ] `features/dashboards/components/IncidentTimeline.tsx`
  - [ ] Vertical timeline with action entries
  - [ ] Status transition badges
  - [ ] Add comment form

- [ ] `features/dashboards/components/MTTRChart.tsx`
  - [ ] Recharts BarChart: MTTR by severity
  - [ ] Trend line over 6 months

---

### 7. Unit Tests (apps/api/tests/)

- [ ] `tests/modules/usage-intelligence/token-tracker.service.test.ts`
  - [ ] Record usage adds to batch buffer
  - [ ] Flush batch inserts all buffered records
  - [ ] Cost calculation uses correct model pricing
  - [ ] Cached tokens reduce cost
  - [ ] Batch timer triggers flush after 5 seconds

- [ ] `tests/modules/usage-intelligence/cost-summary.service.test.ts`
  - [ ] Get cost summary aggregates from materialized view
  - [ ] Daily costs return correct date breakdown
  - [ ] Cost by user returns top consumers
  - [ ] Cost by module returns correct grouping
  - [ ] Projection calculates based on current rate

- [ ] `tests/modules/usage-intelligence/budget.service.test.ts`
  - [ ] Get budget status returns correct percentages
  - [ ] Configure budget upserts correctly
  - [ ] Alert evaluation fires event at threshold
  - [ ] Alert fires only once per threshold per period
  - [ ] No hard block when is_hard_limit = false
  - [ ] Hard block when is_hard_limit = true and budget exhausted

- [ ] `tests/modules/usage-intelligence/margin.service.test.ts`
  - [ ] Margin summary calculates revenue minus costs
  - [ ] Per-tenant margin breakdown is correct

- [ ] `tests/modules/dashboards/executive-dashboard.service.test.ts`
  - [ ] Productivity panel aggregates from Change Manager data
  - [ ] Quality panel aggregates from Test Studio data
  - [ ] AI Performance panel aggregates from token usage
  - [ ] Client Activity panel counts distinct users/tenants
  - [ ] Health map returns dimension scores per app

- [ ] `tests/modules/dashboards/operational-dashboard.service.test.ts`
  - [ ] Ecosystem status checks all services
  - [ ] Top errors returns most frequent errors
  - [ ] Active releases returns in-progress deployments

- [ ] `tests/modules/dashboards/incident.service.test.ts`
  - [ ] Create incident emits INCIDENT_CREATED event
  - [ ] Triage transitions to triaged status
  - [ ] Resolve calculates MTTR correctly
  - [ ] Invalid status transition fails
  - [ ] Timeline entries added on status changes
  - [ ] Postmortem sets root cause
  - [ ] Close incident sets closed_at
  - [ ] MTTR metrics aggregate by severity

- [ ] `tests/modules/dashboards/sse.service.test.ts`
  - [ ] SSE stream sends heartbeat every 30 seconds
  - [ ] Metric updates published via Redis pub/sub
  - [ ] Connection cleanup unsubscribes from channels

- [ ] `tests/modules/dashboards/health-score.service.test.ts`
  - [ ] Health score 0-100 computed from dimensions
  - [ ] Red status when score < 40
  - [ ] Green status when score >= 70

- [ ] `tests/modules/dashboards/pdf-export.service.test.ts`
  - [ ] PDF generation returns valid Buffer
  - [ ] PDF includes KPI sections

- [ ] `tests/modules/usage-intelligence/cost.controller.test.ts`
  - [ ] GET /costs/summary as any auth user -> 200
  - [ ] GET /costs/by-user as developer -> 403
  - [ ] GET /costs/by-user as admin -> 200
  - [ ] PUT /costs/budget as admin -> 200
  - [ ] PUT /costs/budget as developer -> 403
  - [ ] GET /admin/margins as admin -> 200
  - [ ] GET /admin/margins as developer -> 403

- [ ] `tests/modules/dashboards/dashboard.controller.test.ts`
  - [ ] GET /dashboard/executive as admin -> 200
  - [ ] GET /dashboard/executive as developer -> 403
  - [ ] GET /dashboard/operational/stream returns SSE headers
  - [ ] GET /dashboard/health/:appId as auth user -> 200

- [ ] `tests/modules/dashboards/incident.controller.test.ts`
  - [ ] POST /incidents as devops_engineer -> 201
  - [ ] POST /incidents as developer -> 403
  - [ ] POST /incidents/:id/triage -> 200
  - [ ] POST /incidents/:id/resolve -> 200
  - [ ] GET /incidents/:id/timeline -> 200

---

### 8. Integration Tests

- [ ] `tests/integration/cost-intelligence.integration.test.ts`
  - [ ] Full lifecycle: record usage -> view summary -> configure budget -> trigger alert -> view alert history
  - [ ] Budget alert fires email notification within threshold
  - [ ] Projection accuracy after 7+ days of data
  - [ ] Margin tracking shows correct revenue vs costs
  - [ ] Tenant isolation: Tenant A costs not visible to Tenant B

- [ ] `tests/integration/dashboard.integration.test.ts`
  - [ ] Executive dashboard aggregates data from multiple modules
  - [ ] Health map reflects test coverage, error rates, and deployment frequency
  - [ ] PDF export generates valid PDF with correct data
  - [ ] SSE stream delivers real-time updates on metric changes

- [ ] `tests/integration/incident.integration.test.ts`
  - [ ] Full incident lifecycle: detect -> triage -> investigate -> resolve -> postmortem -> close
  - [ ] MTTR calculation matches detected_at to resolved_at delta
  - [ ] Escalation triggers notification to correct roles
  - [ ] Timeline captures all status transitions and comments
  - [ ] Auto-detection creates incident from error rate threshold

---

### 9. Route Registration

- [ ] `src/routes/index.ts`
  - [ ] Mount usage-intelligence routes at `/api/v1/costs`, `/api/v1/admin/margins`
  - [ ] Mount dashboard routes at `/api/v1/dashboard`
  - [ ] Mount incident routes at `/api/v1/incidents`

---

## File Summary

| Category | File Count |
|----------|------------|
| Database migrations | 7 |
| Shared types | 3 |
| Usage Intelligence backend module | 6 |
| Dashboard backend module | 9 |
| Usage Intelligence frontend | 7 |
| Dashboard frontend | 13 |
| Unit tests | 13 |
| Integration tests | 3 |
| Route registration | 1 |
| **Total** | **62** |

---

## Execution Order

1. Database migrations (042-048) -- schema and materialized views must exist first
2. Shared types (cost-intelligence.ts, dashboard.ts, incidents.ts) -- interfaces used by all modules
3. Usage Intelligence backend (cost.types -> cost.validation -> token-tracker.service -> cost-summary.service -> budget.service -> margin.service -> cost.controller)
4. Dashboard backend (dashboard.types -> dashboard.validation -> executive-dashboard.service -> operational-dashboard.service -> health-score.service -> incident.service -> sse.service -> pdf-export.service -> dashboard.controller -> incident.controller)
5. Route registration
6. Usage Intelligence frontend (api -> pages -> components)
7. Dashboard frontend (api -> pages -> components)
8. Unit tests (parallel per module)
9. Integration tests (sequential, requires running DB + Redis + SSE)

---

## Approval

**Please review this code generation plan.**

**Options**:
1. **Request Changes** - Modify the plan before execution
2. **Approve Plan** - Proceed to Part 2 (Code Generation execution)
