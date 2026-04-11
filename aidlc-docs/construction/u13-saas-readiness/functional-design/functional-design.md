# Functional Design -- U13: SaaS Readiness

## Document Information

| Field | Value |
|-------|-------|
| **Unit** | U13 -- SaaS Readiness |
| **Sprint** | S12 (Fase 3, Weeks 26-29, includes hardening) |
| **Duration** | 3-4 weeks |
| **Modules** | Cross-cutting SaaS capabilities |
| **Stories** | US-045, US-046, US-048 |
| **Components** | C02 (Tenant Resolver -- extended), C01 (API Gateway -- extended) |
| **Status** | AI-DLC Generated -- For Review |
| **Date** | 2026-04-10 |

---

## 1. SaaS Plan Management

### 1.1 Plan Definitions

APEX Dev Manager offers three subscription tiers with progressive capabilities.

| Feature | Starter ($199/mo) | Professional ($499/mo) | Enterprise (custom) |
|---------|-------------------|----------------------|---------------------|
| Connections | 2 | 10 | Unlimited |
| Users | 5 | 25 | Unlimited |
| AI tokens/month | 500K | 2M | Custom quota |
| Applications | 5 | 25 | Unlimited |
| Environments | DEV only | DEV, QA, STAGING | DEV, QA, STAGING, PROD |
| Test Studio | Basic (unit only) | Full (all test types) | Full + custom gates |
| Knowledge Engine | Read-only defaults | Full CRUD | Full + custom domains |
| Code Factory | 50 generations/mo | 200 generations/mo | Unlimited |
| Marketplace | Browse + free install | Browse + install all | Browse + install + publish |
| Dashboard | Basic KPIs | Executive + Operational | Full + custom dashboards |
| Release Manager | Manual only | Standard pipeline | Full with auto-deploy |
| Support | Community | Email (48h SLA) | Priority (4h SLA) |
| SSO/SAML/OIDC | No | OIDC only | SAML + OIDC |
| Multi-region DR | No | No | Available |

### 1.2 Plan Entity

```typescript
interface SaaSPlan {
  id: string;
  code: 'starter' | 'professional' | 'enterprise';
  name: string;
  monthlyPriceUsd: number | null;  // null = custom pricing
  features: PlanFeatures;
  isActive: boolean;
  createdAt: Date;
  updatedAt: Date;
}

interface PlanFeatures {
  maxConnections: number | null;       // null = unlimited
  maxUsers: number | null;
  maxTokensPerMonth: number | null;
  maxApplications: number | null;
  environments: string[];
  testTypes: string[];                 // Allowed test types
  knowledgeAccess: 'read_only' | 'full' | 'full_custom';
  codeFactoryGenerationsPerMonth: number | null;
  marketplaceAccess: 'browse_free' | 'full' | 'full_publish';
  dashboardLevel: 'basic' | 'executive' | 'full_custom';
  releaseManagerLevel: 'manual' | 'standard' | 'full';
  ssoProviders: string[];             // 'oidc', 'saml'
  multiRegionDR: boolean;
}
```

---

## 2. Feature Gating per Plan

### 2.1 Feature Gate Middleware

Feature gating enforces plan limits at the API layer. Every resource-creating endpoint passes through the feature gate middleware.

```
API Request
     |
     v
Auth Middleware (existing)
     |
     v
Tenant Resolver (existing)
     |
     v
Feature Gate Middleware (NEW)
  - Load tenant plan
  - Check resource count vs plan limit
  - Check feature access vs plan level
     |
     +-- IF allowed --> Continue to handler
     |
     +-- IF blocked --> 403 PLAN_LIMIT_EXCEEDED
```

#### Feature Gate Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| FG-R01 | Connection limit | Block connection creation when count >= plan.maxConnections |
| FG-R02 | User limit | Block user creation/invitation when count >= plan.maxUsers |
| FG-R03 | Token quota | Check budget before AI call; warn at 80%, soft-block at 100% |
| FG-R04 | App limit | Block application exploration/registration when count >= plan.maxApplications |
| FG-R05 | Environment restriction | Block access to environments not in plan.environments |
| FG-R06 | Test type restriction | Block test types not in plan.testTypes |
| FG-R07 | Code Factory limit | Block generation when monthly count >= plan.codeFactoryGenerationsPerMonth |
| FG-R08 | Marketplace restriction | Block publish if plan.marketplaceAccess != 'full_publish' |
| FG-R09 | Dashboard restriction | Block executive/operational dashboards based on plan.dashboardLevel |
| FG-R10 | SSO restriction | Block SSO configuration if provider not in plan.ssoProviders |
| FG-R11 | Graceful degradation | On plan downgrade, existing resources are retained but no new ones can be created |
| FG-R12 | Admin bypass | Platform admin bypasses all feature gates |

#### Feature Gate Response

```typescript
interface PlanLimitError {
  code: 'PLAN_LIMIT_EXCEEDED';
  feature: string;              // 'connections', 'users', 'ai_tokens', etc.
  currentCount: number;
  planLimit: number;
  planCode: string;
  upgradeUrl: string;           // Link to upgrade page
}
```

---

## 3. Tenant Provisioning Workflow

### 3.1 Provisioning Pipeline

New tenant provisioning must complete within 4 hours for full environment setup.

```
Signup Request
     |
     v
Step 1: Validate tenant data (< 1 sec)
  - Company name, admin email, plan selection
  - Domain uniqueness check
     |
     v
Step 2: Create tenant record (< 1 sec)
  - Insert into tenants table
  - Generate tenant slug
  - Set plan and quotas
     |
     v
Step 3: Create admin user (< 2 sec)
  - Hash password
  - Assign admin role
  - Send welcome email
     |
     v
Step 4: Initialize tenant schema (< 30 sec)
  - Seed knowledge domains (5 domains)
  - Seed default budget configuration
  - Create default notification preferences
     |
     v
Step 5: Provision infrastructure (< 4 hours)
  - Allocate connection pool slots
  - Configure rate limit tiers
  - Set up monitoring dashboards
  - Initialize audit log partition
     |
     v
Step 6: Verification (< 1 min)
  - Health check all provisioned resources
  - Send provisioning complete notification
     |
     v
TENANT READY
```

#### Provisioning Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| TP-R01 | Unique slug | Tenant slug must be globally unique |
| TP-R02 | Admin required | Every tenant must have at least one admin user |
| TP-R03 | Welcome email | Admin receives welcome email with login link |
| TP-R04 | Default plan | New tenants default to trial plan (Starter features, time-limited) |
| TP-R05 | Provisioning status | Track provisioning progress: pending -> in_progress -> completed -> active |
| TP-R06 | Timeout | If provisioning not completed within 4 hours, alert platform admin |
| TP-R07 | Idempotent | Provisioning steps are idempotent (safe to retry on failure) |

### 3.2 Provisioning Entity

```typescript
interface TenantProvisioningStatus {
  tenantId: string;
  status: 'pending' | 'in_progress' | 'completed' | 'failed';
  steps: ProvisioningStep[];
  startedAt: Date;
  completedAt: Date | null;
  error: string | null;
}

interface ProvisioningStep {
  name: string;
  status: 'pending' | 'in_progress' | 'completed' | 'failed' | 'skipped';
  startedAt: Date | null;
  completedAt: Date | null;
  error: string | null;
  retryCount: number;
}
```

---

## 4. Onboarding Flow

### 4.1 Onboarding Milestones

After provisioning, the onboarding flow guides new tenants through key activation steps.

```
Provisioning Complete
         |
         v
   +------------------+
   | 1. Provisioning   |  Status: completed (automatic)
   +------------------+
         |
         v
   +------------------+
   | 2. First          |  Action: Create first ORDS/JDBC connection
   |    Connection     |  Trigger: connection.created event
   +------------------+
         |
         v
   +------------------+
   | 3. First App      |  Action: Browse first APEX application via Explorer
   |    Explored       |  Trigger: app.explored event
   +------------------+
         |
         v
   +------------------+
   | 4. First AI       |  Action: Use AI Studio for any suggestion
   |    Suggestion     |  Trigger: ai.suggestion.completed event
   +------------------+
         |
         v
   +------------------+
   | 5. Day-7          |  Action: Scheduled check-in email
   |    Check-in       |  Trigger: cron job at day 7
   +------------------+
         |
         v
   ONBOARDING COMPLETE
```

#### Onboarding Entity

```typescript
interface TenantOnboarding {
  tenantId: string;
  milestones: OnboardingMilestone[];
  startedAt: Date;
  completedAt: Date | null;
  daysSinceSignup: number;
}

interface OnboardingMilestone {
  name: string;
  status: 'pending' | 'completed';
  completedAt: Date | null;
  triggerEvent: string;
}
```

#### Onboarding Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| OB-R01 | Progress tracking | Onboarding progress visible in admin dashboard |
| OB-R02 | Event-driven | Milestones complete automatically on corresponding events |
| OB-R03 | Day-7 email | Automated check-in email sent 7 days after signup |
| OB-R04 | Stale detection | If no milestone completed after 3 days, send nudge email |
| OB-R05 | In-app guide | First-time UI shows contextual tooltips guiding next milestone |

---

## 5. SSO/SAML/OIDC Integration (Fase 3)

### 5.1 Identity Provider Configuration

```typescript
interface IdentityProviderConfig {
  id: string;
  tenantId: string;
  type: 'saml' | 'oidc';
  name: string;                  // Display name (e.g., "Company Azure AD")
  enabled: boolean;

  // SAML-specific
  samlMetadataUrl: string | null;
  samlEntityId: string | null;
  samlSsoUrl: string | null;
  samlCertificate: string | null;

  // OIDC-specific
  oidcIssuerUrl: string | null;
  oidcClientId: string | null;
  oidcClientSecret: string | null;  // Encrypted in DB
  oidcScopes: string[];

  // Attribute mapping
  attributeMapping: {
    email: string;
    firstName: string;
    lastName: string;
    roles: string | null;        // Optional role mapping attribute
  };

  // Settings
  autoProvisionUsers: boolean;   // Create user on first SSO login
  defaultRole: string;           // Role for auto-provisioned users
  forceSSO: boolean;             // Disable password login when SSO enabled

  createdAt: Date;
  updatedAt: Date;
}
```

### 5.2 SSO Login Flow

```
User                    APEX Dev Manager         Identity Provider
  |                          |                         |
  |-- Navigate to login ---->|                         |
  |                          |                         |
  |<-- Show SSO button ------|                         |
  |                          |                         |
  |-- Click SSO login ------>|                         |
  |                          |-- Redirect to IdP ----->|
  |<-- Redirect -------------|                         |
  |                          |                         |
  |-- Authenticate at IdP ---|------------------------>|
  |                          |                         |
  |<-- Callback with token --|<-- SAML assertion ------|
  |                          |   or OIDC code          |
  |                          |                         |
  |                          |-- Validate token/       |
  |                          |   assertion             |
  |                          |                         |
  |                          |-- Map attributes        |
  |                          |-- Find or create user   |
  |                          |-- Issue JWT + refresh   |
  |                          |                         |
  |<-- Login success --------|                         |
  |   (JWT + refresh token)  |                         |
```

### 5.3 SSO Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| SSO-R01 | Plan restriction | OIDC: Professional + Enterprise; SAML: Enterprise only |
| SSO-R02 | Multiple providers | A tenant can configure multiple identity providers |
| SSO-R03 | Force SSO | When `forceSSO = true`, password login is disabled for non-admin users |
| SSO-R04 | Auto-provision | If `autoProvisionUsers = true`, new user created on first SSO login with defaultRole |
| SSO-R05 | Attribute mapping | Email is mandatory; firstName, lastName recommended; roles optional |
| SSO-R06 | JIT provisioning | Just-in-time user provisioning uses existing user if email matches |
| SSO-R07 | Audit logging | All SSO login events logged with IdP name, user email, outcome |
| SSO-R08 | Certificate rotation | SAML certificates can be rotated without downtime (support multiple active certs) |

---

## 6. Trial Period

### 6.1 Trial Configuration

| Plan | Trial Duration | Credit Card Required | Auto-Convert |
|------|---------------|---------------------|--------------|
| Starter | 30 days | No | Yes (to free tier on expiry) |
| Professional | 30 days | No | Yes (downgrade to Starter trial) |
| Enterprise POC | 60 days | No | No (manual conversion required) |

#### Trial Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| TR-R01 | One trial per plan | A tenant can trial each plan only once |
| TR-R02 | Trial notification | Email at day 7, day 14, day 25, day 29 (remaining time warnings) |
| TR-R03 | Trial expiry action | On expiry, downgrade to lowest free tier (retain data, restrict features) |
| TR-R04 | Enterprise POC | Requires manual approval from platform admin |
| TR-R05 | Trial extension | Platform admin can extend trial period |
| TR-R06 | Data retention | All data retained during and after trial (no deletion) |
| TR-R07 | Trial badge | UI shows "Trial - X days remaining" banner |

### 6.2 Trial Entity

```typescript
interface TenantTrial {
  tenantId: string;
  planCode: string;
  startDate: Date;
  endDate: Date;
  daysRemaining: number;
  status: 'active' | 'expired' | 'converted' | 'extended';
  convertedToPlan: string | null;
  extendedBy: string | null;
  extendedDays: number;
}
```

---

## 7. Billing Integration Readiness

### 7.1 Invoice Generation

Billing readiness prepares the platform for future integration with a payment processor (Stripe, PayU, or similar).

```typescript
interface Invoice {
  id: string;
  tenantId: string;
  invoiceNumber: string;         // Sequential: INV-2026-0001
  billingPeriod: string;         // YYYY-MM
  planCode: string;
  planName: string;
  baseAmount: number;            // Plan monthly fee
  usageCharges: UsageCharge[];   // Overage charges
  totalAmount: number;
  currency: 'USD';
  status: 'draft' | 'issued' | 'paid' | 'overdue' | 'void';
  issuedAt: Date | null;
  dueDate: Date | null;
  paidAt: Date | null;
  createdAt: Date;
}

interface UsageCharge {
  description: string;
  quantity: number;
  unitPrice: number;
  amount: number;
}
```

### 7.2 Usage Metering

```typescript
interface UsageMeter {
  tenantId: string;
  billingPeriod: string;
  meters: {
    aiTokensUsed: number;
    aiTokensQuota: number;
    codeGenCount: number;
    codeGenQuota: number;
    activeUsers: number;
    activeUsersQuota: number;
    activeConnections: number;
    activeConnectionsQuota: number;
    storageUsedMb: number;
    storageQuotaMb: number;
  };
  overages: {
    aiTokensOverage: number;
    codeGenOverage: number;
  };
  calculatedAt: Date;
}
```

---

## 8. Multi-Region Tenant Routing

### 8.1 Region Configuration

For Enterprise tenants with multi-region DR, tenant routing directs requests to the appropriate region.

```typescript
interface TenantRegionConfig {
  tenantId: string;
  primaryRegion: string;         // e.g., 'us-ashburn-1'
  secondaryRegion: string | null; // DR region
  routingPolicy: 'primary_only' | 'active_active' | 'failover';
  failoverEnabled: boolean;
  lastFailoverAt: Date | null;
  healthCheckUrl: string;
}
```

### 8.2 Routing Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| MR-R01 | Enterprise only | Multi-region routing available only for Enterprise plan |
| MR-R02 | Primary default | All requests route to primary region by default |
| MR-R03 | Failover trigger | Automatic failover when primary region health check fails for > 5 minutes |
| MR-R04 | Failback manual | Failback to primary region requires manual admin action |
| MR-R05 | Data sync | PostgreSQL streaming replication + Redis replication between regions |
| MR-R06 | DNS-based routing | OCI Traffic Management DNS steering for region routing |

---

## 9. Data Models

### 9.1 SaaS Tables

#### `saas_plans`

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Plan ID |
| code | VARCHAR(20) | NOT NULL, UNIQUE | Plan code (starter, professional, enterprise) |
| name | VARCHAR(100) | NOT NULL | Display name |
| monthly_price_usd | DECIMAL(10,2) | | Monthly price (null = custom) |
| features | JSONB | NOT NULL | PlanFeatures object |
| is_active | BOOLEAN | DEFAULT true | Active flag |
| created_at | TIMESTAMPTZ | DEFAULT now() | Creation timestamp |
| updated_at | TIMESTAMPTZ | DEFAULT now() | Last update |

**No RLS** (platform-wide plans)

#### `tenant_subscriptions`

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Subscription ID |
| tenant_id | UUID | FK tenants(id), NOT NULL | Subscriber tenant |
| plan_id | UUID | FK saas_plans(id), NOT NULL | Active plan |
| status | VARCHAR(20) | NOT NULL, CHECK IN ('trial', 'active', 'past_due', 'cancelled', 'expired') | Subscription status |
| trial_start | DATE | | Trial start date |
| trial_end | DATE | | Trial end date |
| billing_start | DATE | | Billing start date |
| current_period_start | DATE | | Current billing period start |
| current_period_end | DATE | | Current billing period end |
| custom_features | JSONB | | Enterprise custom overrides |
| cancelled_at | TIMESTAMPTZ | | Cancellation timestamp |
| created_at | TIMESTAMPTZ | DEFAULT now() | Creation timestamp |
| updated_at | TIMESTAMPTZ | DEFAULT now() | Last update |

**Indexes**: `(tenant_id)` UNIQUE WHERE `status IN ('trial', 'active')`, `(status, trial_end)` -- for trial expiry checks
**RLS**: `tenant_id = current_setting('app.current_tenant')`

#### `tenant_provisioning`

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Provisioning ID |
| tenant_id | UUID | FK tenants(id), NOT NULL, UNIQUE | Provisioned tenant |
| status | VARCHAR(20) | NOT NULL, DEFAULT 'pending', CHECK IN ('pending', 'in_progress', 'completed', 'failed') | Overall status |
| steps | JSONB | NOT NULL | Array of ProvisioningStep |
| started_at | TIMESTAMPTZ | DEFAULT now() | Start time |
| completed_at | TIMESTAMPTZ | | Completion time |
| error | TEXT | | Error details |
| created_at | TIMESTAMPTZ | DEFAULT now() | Record creation |

**Indexes**: `(status) WHERE status IN ('pending', 'in_progress')`

#### `tenant_onboarding`

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Onboarding ID |
| tenant_id | UUID | FK tenants(id), NOT NULL, UNIQUE | Onboarding tenant |
| milestones | JSONB | NOT NULL | Array of OnboardingMilestone |
| started_at | TIMESTAMPTZ | DEFAULT now() | Start time |
| completed_at | TIMESTAMPTZ | | All milestones complete |
| created_at | TIMESTAMPTZ | DEFAULT now() | Record creation |

**RLS**: `tenant_id = current_setting('app.current_tenant')`

#### `identity_providers`

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Provider ID |
| tenant_id | UUID | FK tenants(id), NOT NULL | Owner tenant |
| type | VARCHAR(10) | NOT NULL, CHECK IN ('saml', 'oidc') | Provider type |
| name | VARCHAR(100) | NOT NULL | Display name |
| enabled | BOOLEAN | DEFAULT false | Active flag |
| config | JSONB | NOT NULL | Provider-specific configuration (encrypted sensitive fields) |
| attribute_mapping | JSONB | NOT NULL | Attribute mapping rules |
| auto_provision_users | BOOLEAN | DEFAULT false | JIT user provisioning |
| default_role | VARCHAR(50) | DEFAULT 'developer' | Role for auto-provisioned users |
| force_sso | BOOLEAN | DEFAULT false | Disable password login |
| created_at | TIMESTAMPTZ | DEFAULT now() | Creation timestamp |
| updated_at | TIMESTAMPTZ | DEFAULT now() | Last update |

**Indexes**: `(tenant_id, type)`, `(tenant_id, enabled) WHERE enabled = true`
**RLS**: `tenant_id = current_setting('app.current_tenant')`

#### `invoices`

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Invoice ID |
| tenant_id | UUID | FK tenants(id), NOT NULL | Billed tenant |
| invoice_number | VARCHAR(20) | NOT NULL, UNIQUE | Sequential number |
| billing_period | VARCHAR(7) | NOT NULL | YYYY-MM format |
| plan_code | VARCHAR(20) | NOT NULL | Plan at time of invoice |
| base_amount | DECIMAL(10,2) | NOT NULL | Plan fee |
| usage_charges | JSONB | DEFAULT '[]' | Overage charges |
| total_amount | DECIMAL(10,2) | NOT NULL | Total amount |
| currency | VARCHAR(3) | DEFAULT 'USD' | Currency code |
| status | VARCHAR(20) | NOT NULL, DEFAULT 'draft', CHECK IN ('draft', 'issued', 'paid', 'overdue', 'void') | Invoice status |
| issued_at | TIMESTAMPTZ | | Issue date |
| due_date | DATE | | Payment due date |
| paid_at | TIMESTAMPTZ | | Payment date |
| created_at | TIMESTAMPTZ | DEFAULT now() | Record creation |

**Indexes**: `(tenant_id, billing_period)`, `(status, due_date)`
**RLS**: `tenant_id = current_setting('app.current_tenant')`

#### `usage_meters`

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, DEFAULT gen_random_uuid() | Meter ID |
| tenant_id | UUID | FK tenants(id), NOT NULL | Metered tenant |
| billing_period | VARCHAR(7) | NOT NULL | YYYY-MM format |
| meters | JSONB | NOT NULL | Current usage counters |
| overages | JSONB | DEFAULT '{}' | Overage amounts |
| calculated_at | TIMESTAMPTZ | DEFAULT now() | Last calculation |
| created_at | TIMESTAMPTZ | DEFAULT now() | Record creation |

**Indexes**: `(tenant_id, billing_period)` UNIQUE
**RLS**: `tenant_id = current_setting('app.current_tenant')`

---

## 10. Error Codes

| Error Code | HTTP | Condition |
|------------|------|-----------|
| PLAN_NOT_FOUND | 404 | Plan code does not exist |
| PLAN_LIMIT_EXCEEDED | 403 | Resource count exceeds plan limit |
| PLAN_FEATURE_UNAVAILABLE | 403 | Feature not available in current plan |
| SUBSCRIPTION_NOT_FOUND | 404 | No active subscription |
| SUBSCRIPTION_EXPIRED | 403 | Subscription/trial has expired |
| TRIAL_ALREADY_USED | 409 | Tenant already used trial for this plan |
| TRIAL_EXTENSION_DENIED | 403 | Trial extension not authorized |
| PROVISIONING_FAILED | 500 | Tenant provisioning step failed |
| PROVISIONING_TIMEOUT | 500 | Provisioning exceeded 4-hour limit |
| SSO_PROVIDER_NOT_FOUND | 404 | Identity provider not configured |
| SSO_PLAN_RESTRICTED | 403 | SSO type not available in current plan |
| SSO_VALIDATION_FAILED | 401 | SAML/OIDC token validation failed |
| SSO_USER_NOT_PROVISIONED | 403 | Auto-provision disabled and user not found |
| INVOICE_NOT_FOUND | 404 | Invoice ID does not exist |
| REGION_NOT_AVAILABLE | 403 | Multi-region not available in plan |

---

## 11. API Endpoints

### 11.1 Plan & Subscription Endpoints

| Method | Path | Auth | Description |
|--------|------|------|-------------|
| GET | `/api/v1/plans` | public | List available plans |
| GET | `/api/v1/plans/:code` | public | Get plan details |
| GET | `/api/v1/subscription` | authenticate() | Get current subscription |
| POST | `/api/v1/subscription/upgrade` | authorize(['admin']) | Upgrade plan |
| POST | `/api/v1/subscription/downgrade` | authorize(['admin']) | Downgrade plan |
| GET | `/api/v1/subscription/usage` | authenticate() | Get current usage meters |
| GET | `/api/v1/subscription/trial` | authenticate() | Get trial status |

### 11.2 Provisioning & Onboarding Endpoints

| Method | Path | Auth | Description |
|--------|------|------|-------------|
| POST | `/api/v1/tenants/provision` | authorize(['admin']) | Provision new tenant |
| GET | `/api/v1/tenants/provisioning-status` | authorize(['admin']) | Get provisioning status |
| GET | `/api/v1/onboarding` | authenticate() | Get onboarding progress |
| POST | `/api/v1/onboarding/complete-milestone` | authenticate() | Mark milestone complete |

### 11.3 SSO/Identity Provider Endpoints

| Method | Path | Auth | Description |
|--------|------|------|-------------|
| GET | `/api/v1/sso/providers` | authorize(['admin']) | List configured providers |
| POST | `/api/v1/sso/providers` | authorize(['admin']) | Add identity provider |
| PATCH | `/api/v1/sso/providers/:id` | authorize(['admin']) | Update provider config |
| DELETE | `/api/v1/sso/providers/:id` | authorize(['admin']) | Remove provider |
| POST | `/api/v1/sso/providers/:id/test` | authorize(['admin']) | Test provider connection |
| GET | `/api/v1/auth/sso/:providerId` | public | Initiate SSO login (redirect) |
| POST | `/api/v1/auth/sso/callback/saml` | public | SAML assertion callback |
| GET | `/api/v1/auth/sso/callback/oidc` | public | OIDC authorization code callback |

### 11.4 Billing Endpoints

| Method | Path | Auth | Description |
|--------|------|------|-------------|
| GET | `/api/v1/billing/invoices` | authorize(['admin']) | List invoices |
| GET | `/api/v1/billing/invoices/:id` | authorize(['admin']) | Get invoice details |
| GET | `/api/v1/billing/invoices/:id/pdf` | authorize(['admin']) | Download invoice PDF |
| GET | `/api/v1/billing/usage-meter` | authenticate() | Current period usage |

### 11.5 Admin Endpoints

| Method | Path | Auth | Description |
|--------|------|------|-------------|
| GET | `/api/v1/admin/tenants` | authorize(['admin']) | List all tenants (platform admin) |
| POST | `/api/v1/admin/tenants/:id/extend-trial` | authorize(['admin']) | Extend trial period |
| POST | `/api/v1/admin/tenants/:id/override-features` | authorize(['admin']) | Custom feature overrides |
| GET | `/api/v1/admin/tenants/:id/provisioning` | authorize(['admin']) | View provisioning details |
| GET | `/api/v1/admin/tenants/:id/onboarding` | authorize(['admin']) | View onboarding progress |

---

## 12. Events Emitted

| Event | Trigger | Payload |
|-------|---------|---------|
| `TENANT_PROVISIONED` | Tenant provisioning completes | `{ tenantId, planCode }` |
| `TENANT_PROVISIONING_FAILED` | Provisioning step fails | `{ tenantId, step, error }` |
| `SUBSCRIPTION_CREATED` | New subscription (trial or paid) | `{ tenantId, planCode, status }` |
| `SUBSCRIPTION_UPGRADED` | Plan upgraded | `{ tenantId, fromPlan, toPlan }` |
| `SUBSCRIPTION_DOWNGRADED` | Plan downgraded | `{ tenantId, fromPlan, toPlan }` |
| `TRIAL_EXPIRING` | Trial within 5 days of expiry | `{ tenantId, daysRemaining }` |
| `TRIAL_EXPIRED` | Trial period ended | `{ tenantId, planCode }` |
| `PLAN_LIMIT_REACHED` | 90% of any plan limit reached | `{ tenantId, feature, current, limit }` |
| `SSO_LOGIN_SUCCESS` | Successful SSO authentication | `{ tenantId, userId, provider }` |
| `SSO_LOGIN_FAILED` | Failed SSO authentication | `{ tenantId, provider, error }` |
| `ONBOARDING_MILESTONE_COMPLETED` | Onboarding milestone reached | `{ tenantId, milestone }` |
| `ONBOARDING_COMPLETED` | All milestones completed | `{ tenantId, daysToComplete }` |
| `INVOICE_ISSUED` | Invoice generated and sent | `{ tenantId, invoiceNumber, amount }` |

---

## 13. Non-Functional Considerations

| Aspect | Requirement |
|--------|-------------|
| Tenant provisioning (steps 1-4) | < 1 minute |
| Full provisioning with infrastructure | < 4 hours |
| Feature gate check latency | < 5ms (cached plan in Redis) |
| SSO login latency | < 3 seconds (including IdP redirect) |
| Trial expiry check | Cron job every hour |
| Invoice generation | Monthly, completed within 1 hour for all tenants |
| Usage meter refresh | Every 15 minutes |
| Plan cache TTL | 5 minutes in Redis |
| Onboarding event processing | < 1 second from trigger event |
| Multi-region failover time | < 5 minutes from detection |
