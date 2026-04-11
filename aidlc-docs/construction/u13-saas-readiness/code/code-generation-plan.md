# U13: SaaS Readiness — Code Generation Plan

## Unit Information

| Field | Value |
|---|---|
| **Unit** | U13 — SaaS Readiness |
| **Sprint** | S12 (Weeks 23-24) |
| **Modules** | SaaS Plans, Billing, Onboarding, SSO/SAML/OIDC |
| **Duration** | 2 weeks |
| **Dependencies** | U1, U2, U11 (M15 cost tracking) |

---

## Code Generation Steps

### 1. Database Migrations

- [ ] `migrations/054_saas_plans.sql`
  - [ ] Table `plans`: id, plan_name (starter|professional|enterprise), price_usd_monthly, max_connections, max_users, max_tokens_monthly, trial_days, features_json, is_active, created_at
  - [ ] Table `subscriptions`: id, tenant_id (FK), plan_id (FK), status (trial|active|suspended|cancelled), trial_ends_at, billing_cycle_start, billing_cycle_end, created_at, updated_at
  - [ ] Table `invoices`: id, tenant_id (FK), subscription_id (FK), period_start, period_end, amount_usd, tax_pct, total_usd, status (draft|issued|paid|overdue), issued_at, paid_at
  - [ ] Table `usage_meters`: id, tenant_id, meter_type (connections|users|tokens|storage), current_value, limit_value, period_start, updated_at
  - [ ] RLS policies for all tables
  - [ ] Seed data: 3 base plans (Starter, Professional, Enterprise)

- [ ] `migrations/055_onboarding_tracking.sql`
  - [ ] Table `onboarding_progress`: id, tenant_id, step_key (provisioning|first_connection|first_app|first_ai_suggestion|day7_checkin), status (pending|completed|skipped), completed_at, metadata_json
  - [ ] RLS policies

- [ ] `migrations/056_sso_configuration.sql`
  - [ ] Table `sso_configurations`: id, tenant_id, provider_type (saml|oidc), provider_name, metadata_url, client_id_encrypted, client_secret_encrypted, attribute_mapping_json, is_active, created_at, updated_at
  - [ ] RLS policies

### 2. Shared Types

- [ ] `packages/shared-types/src/saas.types.ts`
  - [ ] Plan, Subscription, Invoice, UsageMeter interfaces
  - [ ] OnboardingStep, OnboardingProgress interfaces
  - [ ] SSOConfiguration, SSOProvider interfaces
  - [ ] PlanFeatures, PlanLimits interfaces
  - [ ] SubscriptionStatus, InvoiceStatus enums

### 3. Backend — Plans & Subscriptions Module

- [ ] `apps/api/src/modules/plans/plans.controller.ts`
  - [ ] GET /api/plans — List available plans (public)
  - [ ] GET /api/plans/:id — Plan detail
  - [ ] POST /api/subscriptions — Create subscription (admin)
  - [ ] GET /api/subscriptions/current — Current tenant subscription
  - [ ] PATCH /api/subscriptions/:id — Upgrade/downgrade plan
  - [ ] POST /api/subscriptions/:id/cancel — Cancel subscription

- [ ] `apps/api/src/modules/plans/plans.service.ts`
  - [ ] listPlans(), getPlan()
  - [ ] createSubscription() — provision tenant, set limits, start trial
  - [ ] getCurrentSubscription()
  - [ ] changePlan() — prorate billing, adjust limits
  - [ ] cancelSubscription() — grace period, data retention

- [ ] `apps/api/src/modules/plans/feature-gate.middleware.ts`
  - [ ] checkFeatureAccess(feature: string) middleware
  - [ ] checkLimit(meter: string) middleware — reject if over limit
  - [ ] Feature gate mapping: plan → allowed features
  - [ ] Limit enforcement: connections, users, tokens per billing cycle

- [ ] `apps/api/src/modules/plans/usage-meter.service.ts`
  - [ ] incrementMeter(tenantId, meterType, amount)
  - [ ] getCurrentUsage(tenantId)
  - [ ] resetMeters() — Bull cron job at billing cycle start
  - [ ] checkLimit(tenantId, meterType) — boolean
  - [ ] getUsageSummary(tenantId) — all meters with % used

- [ ] `apps/api/src/modules/plans/plans.validation.ts`
  - [ ] Zod schemas for subscription creation, plan change, cancellation

### 4. Backend — Billing Module

- [ ] `apps/api/src/modules/billing/billing.controller.ts`
  - [ ] GET /api/billing/invoices — List invoices for tenant
  - [ ] GET /api/billing/invoices/:id — Invoice detail
  - [ ] GET /api/billing/usage — Current period usage summary
  - [ ] POST /api/billing/invoices/:id/mark-paid — Mark invoice paid (admin)

- [ ] `apps/api/src/modules/billing/billing.service.ts`
  - [ ] generateInvoice(tenantId, period) — calculate from usage + plan price
  - [ ] listInvoices(tenantId, filters)
  - [ ] getInvoiceDetail(invoiceId)
  - [ ] markPaid(invoiceId)
  - [ ] calculateTax(amount, tenantCountry) — 19% IVA for Colombia

- [ ] `apps/api/src/modules/billing/invoice-generator.job.ts`
  - [ ] Bull scheduled job: monthly invoice generation
  - [ ] Email notification on invoice issuance

### 5. Backend — Onboarding Module

- [ ] `apps/api/src/modules/onboarding/onboarding.controller.ts`
  - [ ] GET /api/onboarding/progress — Current tenant onboarding progress
  - [ ] POST /api/onboarding/complete-step — Mark step completed
  - [ ] GET /api/onboarding/checklist — Full checklist with status

- [ ] `apps/api/src/modules/onboarding/onboarding.service.ts`
  - [ ] initializeOnboarding(tenantId) — create 5 steps
  - [ ] completeStep(tenantId, stepKey) — auto-detect or manual
  - [ ] getProgress(tenantId) — steps with completion %
  - [ ] triggerDay7Checkin() — Bull scheduled job

- [ ] `apps/api/src/modules/onboarding/onboarding-triggers.ts`
  - [ ] Event listeners: CONNECTION_CREATED → complete first_connection
  - [ ] EXPLORER_FIRST_SYNC → complete first_app
  - [ ] AI_SUGGESTION_APPLIED → complete first_ai_suggestion

### 6. Backend — SSO Module (Fase 3)

- [ ] `apps/api/src/modules/sso/sso.controller.ts`
  - [ ] GET /api/sso/config — Get SSO configuration for tenant
  - [ ] POST /api/sso/config — Create/update SSO configuration (admin)
  - [ ] DELETE /api/sso/config — Remove SSO configuration
  - [ ] GET /api/sso/saml/metadata — SAML SP metadata endpoint
  - [ ] POST /api/sso/saml/acs — SAML Assertion Consumer Service
  - [ ] GET /api/sso/oidc/callback — OIDC callback endpoint

- [ ] `apps/api/src/modules/sso/sso.service.ts`
  - [ ] configureSAML(tenantId, metadata) — parse IdP metadata, store config
  - [ ] configureOIDC(tenantId, clientId, clientSecret, discoveryUrl)
  - [ ] processSAMLAssertion(samlResponse) — validate signature, extract claims, map attributes, create/update user, issue JWT
  - [ ] processOIDCCallback(code) — exchange code for tokens, validate, map claims

- [ ] `apps/api/src/modules/sso/saml.strategy.ts`
  - [ ] passport-saml integration with per-tenant configuration
  - [ ] Dynamic IdP resolution from sso_configurations table

- [ ] `apps/api/src/modules/sso/oidc.strategy.ts`
  - [ ] passport-openidconnect integration
  - [ ] Dynamic provider resolution per tenant

### 7. Backend — Tenant Provisioning

- [ ] `apps/api/src/modules/tenants/tenant-provisioning.service.ts`
  - [ ] provisionTenant(name, plan, adminEmail) — orchestrates:
    1. Create tenant record
    2. Create subscription (trial or paid)
    3. Initialize usage meters
    4. Create admin user account
    5. Initialize onboarding progress
    6. Create default environments (DEV, QA, STAGING, PROD)
    7. Send welcome email
    8. Log TENANT_PROVISIONED event
  - [ ] Target: < 4 hours (automated: < 60 seconds)

- [ ] `apps/api/src/modules/tenants/tenant-provisioning.validation.ts`
  - [ ] Zod schema for provisioning request

### 8. Frontend — SaaS Management UI

- [ ] `apps/web/src/features/billing/BillingDashboard.tsx`
  - [ ] Current plan display with upgrade CTA
  - [ ] Usage meters (connections, users, tokens) with progress bars
  - [ ] Invoice history table
  - [ ] Payment status indicators

- [ ] `apps/web/src/features/billing/PlanSelector.tsx`
  - [ ] Plan comparison cards (Starter, Professional, Enterprise)
  - [ ] Feature comparison table
  - [ ] Trial badge if applicable
  - [ ] Upgrade/downgrade confirmation modal

- [ ] `apps/web/src/features/billing/InvoiceDetail.tsx`
  - [ ] Invoice line items, tax calculation, total
  - [ ] Download PDF button
  - [ ] Payment status

- [ ] `apps/web/src/features/onboarding/OnboardingWizard.tsx`
  - [ ] Step-by-step progress indicator
  - [ ] Contextual help per step
  - [ ] Skip step option
  - [ ] Completion celebration

- [ ] `apps/web/src/features/sso/SSOConfiguration.tsx`
  - [ ] Provider type selector (SAML / OIDC)
  - [ ] Configuration form with metadata upload
  - [ ] Test connection button
  - [ ] Attribute mapping editor

- [ ] `apps/web/src/features/admin/TenantProvisioning.tsx`
  - [ ] Provisioning wizard (admin only)
  - [ ] Plan selection, admin account creation
  - [ ] Progress indicator during provisioning
  - [ ] Confirmation with credentials

### 9. Unit Tests

- [ ] `tests/modules/plans/plans.service.test.ts`
  - [ ] Plan CRUD operations
  - [ ] Subscription lifecycle (create, upgrade, downgrade, cancel)
  - [ ] Feature gate enforcement
  - [ ] Usage meter limits

- [ ] `tests/modules/billing/billing.service.test.ts`
  - [ ] Invoice generation with correct amounts
  - [ ] Tax calculation (19% IVA Colombia)
  - [ ] Proration on plan change

- [ ] `tests/modules/onboarding/onboarding.service.test.ts`
  - [ ] Step completion flow
  - [ ] Auto-detection triggers
  - [ ] Progress calculation

- [ ] `tests/modules/sso/sso.service.test.ts`
  - [ ] SAML assertion processing
  - [ ] OIDC callback handling
  - [ ] Attribute mapping
  - [ ] Per-tenant configuration isolation

- [ ] `tests/modules/tenants/provisioning.test.ts`
  - [ ] Full provisioning flow
  - [ ] Rollback on partial failure
  - [ ] Duplicate tenant detection

### 10. Integration Tests

- [ ] `tests/integration/saas-lifecycle.test.ts`
  - [ ] Provision → subscribe → use → upgrade → invoice → cancel
  - [ ] Feature gate enforcement across plan tiers
  - [ ] Usage meter accuracy

- [ ] `tests/integration/sso-flow.test.ts`
  - [ ] SAML login flow end-to-end (mock IdP)
  - [ ] OIDC login flow end-to-end (mock provider)
  - [ ] User creation from SSO claims

---

## File Summary

| Category | Files | Description |
|---|---|---|
| Migrations | 3 | Plans, onboarding, SSO tables |
| Shared Types | 1 | SaaS type definitions |
| Backend Services | 16 | Plans, billing, onboarding, SSO, provisioning |
| Frontend Components | 6 | Billing dashboard, plan selector, onboarding wizard, SSO config |
| Unit Tests | 5 | Service-level tests |
| Integration Tests | 2 | End-to-end SaaS lifecycle |
| **Total** | **33** | |

## Execution Order

1. Migrations (database schema)
2. Shared types
3. Plans + usage meter services (core dependency)
4. Feature gate middleware
5. Billing service + invoice generator
6. Onboarding service + triggers
7. Tenant provisioning orchestrator
8. SSO services (SAML + OIDC)
9. Frontend components
10. Tests

## Acceptance Criteria Traceability

| Criterion | Verification |
|---|---|
| Tenant provisioning < 4 hours | Automated provisioning completes in < 60 seconds |
| Feature gating per plan | Feature gate middleware blocks unauthorized features |
| Trial period enforcement | Subscription status transitions from trial to active/expired |
| SSO SAML 2.0 + OIDC | Both providers tested with mock IdP |
| IVA 19% calculation | Billing service correctly applies Colombian tax |
| Usage metering accuracy | Meters match actual Claude API token consumption |
