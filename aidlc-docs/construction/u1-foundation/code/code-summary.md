# Code Summary - U1: Foundation of APEX Dev Manager

**Unit**: U1 - Foundation
**Phase**: Construction - Code Generation Summary
**Date**: 2026-04-10
**Status**: Planned (Pre-Generation)

---

## 1. What U1 Foundation Delivers

U1 Foundation establishes the complete infrastructure skeleton and application scaffolding for APEX Dev Manager. Upon completion, the team has a fully operational development environment with automated CI/CD, a deployable (empty) application, and all infrastructure provisioned via Terraform.

### Deliverables

| Category | Deliverable | Description |
|----------|-------------|-------------|
| **Monorepo** | pnpm workspace with Turborepo | Parallel builds, shared configs, workspace dependencies |
| **Frontend** | React 18 + Vite + TypeScript scaffold | SPA shell with routing, API client, auth hook placeholder |
| **Backend** | Node.js + Express + TypeScript scaffold | API server with config, routing, DB/Redis connections |
| **Shared** | shared-types package | TypeScript interfaces shared between frontend and backend |
| **Database** | PostgreSQL 16 with migrations | 7 foundation tables with RLS policies, PgBouncer pooling |
| **Cache** | Redis with Bull queues | Session cache, component cache, job queues configured |
| **Infrastructure** | Terraform modules (9 modules) | OCI resources: VCN, OKE, DB, Redis, Vault, LB, WAF, Logging, DR |
| **Containers** | Multi-stage Dockerfiles | Production-optimized images for API (Node) and Web (NGINX) |
| **Orchestration** | Helm charts with env values | Kubernetes deployments, services, HPA, ingress for all envs |
| **CI/CD** | OCI DevOps pipelines | Build (lint/test/build/scan/push) and Deploy (helm upgrade) |
| **Observability** | Structured logging + alarms | JSON logs with correlation IDs, OCI alarms for CPU/memory/errors |
| **Security** | Vault integration + WAF | Secret management, OWASP CRS WAF rules, TLS, security headers |
| **DR** | Active-passive cross-region | DNS failover, PostgreSQL replication, standby OKE cluster |

---

## 2. File Inventory

### 2.1 Monorepo Root (~7 files)

| File | Purpose |
|------|---------|
| `package.json` | Root package, workspace scripts |
| `pnpm-workspace.yaml` | Workspace definition |
| `.npmrc` | pnpm configuration |
| `turbo.json` | Turborepo pipeline |
| `.gitignore` | Git ignore rules |
| `.nvmrc` | Node.js version pin |
| `.editorconfig` | Editor settings |

### 2.2 Frontend - apps/web (~15 files)

| File | Purpose |
|------|---------|
| `package.json` | Frontend dependencies |
| `tsconfig.json` | TypeScript configuration |
| `vite.config.ts` | Vite build configuration |
| `vitest.config.ts` | Test configuration |
| `eslint.config.mjs` | ESLint rules |
| `index.html` | HTML entry |
| `Dockerfile` | Production container |
| `.dockerignore` | Docker ignore |
| `nginx.conf` | NGINX serving config |
| `src/main.tsx` | React entry |
| `src/App.tsx` | Root component |
| `src/routes/index.tsx` | Route definitions |
| `src/layouts/MainLayout.tsx` | Layout shell |
| `src/lib/api-client.ts` | Axios API client |
| `src/lib/query-client.ts` | TanStack Query setup |

### 2.3 Backend - apps/api (~25 files)

| File | Purpose |
|------|---------|
| `package.json` | Backend dependencies |
| `tsconfig.json` | TypeScript configuration |
| `.mocharc.yml` | Mocha test config |
| `Dockerfile` | Production container |
| `.dockerignore` | Docker ignore |
| `src/index.ts` | Server entry point |
| `src/app.ts` | Express app factory |
| `src/config/index.ts` | Environment config |
| `src/config/database.ts` | PostgreSQL pool |
| `src/config/redis.ts` | Redis connection |
| `src/routes/index.ts` | Route mounting |
| `src/routes/health.ts` | Health endpoints |
| `src/middleware/request-logger.ts` | Request logging |
| `src/middleware/correlation-id.ts` | Correlation ID |
| `src/middleware/error-handler.ts` | Global error handler |
| `src/middleware/not-found.ts` | 404 handler |
| `src/lib/logger.ts` | Pino logger factory |
| `src/lib/errors.ts` | Custom error classes |
| `src/db/migrate.ts` | Migration runner |
| `src/db/connection.ts` | Migration DB connection |
| `src/db/seed.ts` | Development seed script |
| `migrations/001-007` | 7 foundation migration files (extensions, tenants, users, refresh_tokens, audit_events, connections, environments). Global migration range: 001-056 across all 13 units. |

### 2.4 Shared Types - packages/shared-types (~10 files)

| File | Purpose |
|------|---------|
| `package.json` | Package config |
| `tsconfig.json` | TypeScript config |
| `src/index.ts` | Barrel export |
| `src/tenant.ts` | Tenant types |
| `src/user.ts` | User types |
| `src/connection.ts` | Connection types |
| `src/environment.ts` | Environment types |
| `src/audit.ts` | Audit event types |
| `src/api-response.ts` | API response envelope |
| `src/common.ts` | Shared utility types |

### 2.5 Helm Charts - deploy/helm (~20 files)

| File | Purpose |
|------|---------|
| `apex-api/Chart.yaml` | API chart metadata |
| `apex-api/values.yaml` | Default values |
| `apex-api/values-{env}.yaml` | 4 environment overrides |
| `apex-api/templates/*.yaml` | 6 template files (deployment, service, HPA, configmap, secret, SA) |
| `apex-web/Chart.yaml` | Web chart metadata |
| `apex-web/values.yaml` | Default values |
| `apex-web/values-{env}.yaml` | 2 environment overrides |
| `apex-web/templates/*.yaml` | 4 template files (deployment, service, ingress) |

### 2.6 Terraform - terraform/ (~30 files)

| File | Purpose |
|------|---------|
| `modules/networking/*.tf` | VCN, subnets, gateways (3 files) |
| `modules/oke/*.tf` | OKE cluster, node pools (3 files) |
| `modules/database/*.tf` | PostgreSQL DB system (3 files) |
| `modules/redis/*.tf` | OCI Cache (3 files) |
| `modules/vault/*.tf` | Vault, keys, secrets (3 files) |
| `modules/load-balancer/*.tf` | LB, WAF, SSL (3 files) |
| `modules/logging/*.tf` | Log groups, alarms (3 files) |
| `modules/devops/*.tf` | CI/CD pipelines (3 files) |
| `modules/dr/*.tf` | Traffic Management (3 files) |
| `environments/dev/*.tf` | Dev environment (3 files) |
| `environments/prod/*.tf` | Prod environment (3 files) |

### 2.7 CI/CD and Deploy Scripts (~5 files)

| File | Purpose |
|------|---------|
| `build_spec.yaml` | OCI DevOps build pipeline |
| `deploy/deploy-spec.yaml` | OCI DevOps deploy pipeline |
| `deploy/scripts/pre-deploy.sh` | Pre-deploy checks |
| `deploy/scripts/post-deploy.sh` | Post-deploy verification |
| `deploy/scripts/rollback.sh` | Rollback procedure |

### 2.8 Test Files (~6 files)

| File | Purpose |
|------|---------|
| `apps/web/src/test/setup.ts` | Frontend test setup |
| `apps/web/src/__tests__/App.test.tsx` | App smoke test |
| `apps/api/test/setup.ts` | Backend test setup |
| `apps/api/test/health.test.ts` | Health endpoint tests |
| `apps/api/test/helpers/db.ts` | Test DB helper |
| `apps/api/test/helpers/factory.ts` | Test data factory |

**Total: ~120 files**

---

## 3. Architecture Decisions

### ADR-001: Monorepo with pnpm Workspaces

**Decision**: Use pnpm workspaces with Turborepo for monorepo management.
**Rationale**: Small team (2-3 devs) benefits from shared code, atomic commits across frontend/backend, and simplified dependency management. Turborepo adds parallel build execution without configuration overhead.
**Alternatives Considered**: Nx (too heavy for team size), separate repos (coordination overhead), yarn workspaces (pnpm is faster and stricter).

### ADR-002: Vitest for Frontend, Mocha/Chai for Backend

**Decision**: Use Vitest for frontend tests and Mocha/Chai for backend tests.
**Rationale**: Vitest integrates natively with Vite (shared config, fast HMR-based test execution). Mocha/Chai is lighter weight for backend unit/integration tests and widely used in Node.js ecosystem. Both support TypeScript natively.
**Alternatives Considered**: Jest for both (slower with TypeScript, requires babel/swc transforms).

### ADR-003: Row-Level Security for Multi-Tenancy

**Decision**: Use PostgreSQL RLS policies for tenant data isolation rather than schema-per-tenant.
**Rationale**: Simpler operational model (single schema), easier migrations, works well for expected tenant count. Application sets `app.current_tenant_id` per request. All tenant-scoped tables enforce RLS.
**Alternatives Considered**: Schema-per-tenant (migration complexity), application-level filtering (risk of data leaks).

### ADR-004: PgBouncer for Connection Pooling

**Decision**: Deploy PgBouncer in transaction mode between OKE and PostgreSQL.
**Rationale**: OKE pods scale dynamically (2-10 replicas); without pooling, each pod maintains its own connection pool, potentially exhausting PostgreSQL's max_connections. PgBouncer in transaction mode multiplexes connections efficiently.
**Alternatives Considered**: Application-level pooling only (doesn't solve cross-pod connection pressure), PgPool-II (more complex, session-level features not needed).

### ADR-005: Active-Passive DR with Manual Failover

**Decision**: Active-passive DR with manual failover trigger (not automatic).
**Rationale**: For a 2-3 person team, automatic failover introduces risk of split-brain scenarios and false positives. Manual failover with clear runbook and monitoring alerts is safer and simpler. RTO < 4 hours is acceptable for the current business requirements.
**Alternatives Considered**: Active-active (operational complexity too high for team size), no DR (unacceptable risk).

### ADR-006: OCI DevOps over GitHub Actions / GitLab CI

**Decision**: Use OCI DevOps for CI/CD pipelines.
**Rationale**: Native integration with OCI services (OCIR, OKE, Vault), no external service dependencies, included in OCI pricing. Reduces attack surface by keeping CI/CD within OCI tenancy.
**Alternatives Considered**: GitHub Actions (external dependency, secrets management complexity), GitLab CI (additional service to manage).

### ADR-007: Helm for Kubernetes Deployments

**Decision**: Use Helm charts with environment-specific values files.
**Rationale**: Industry standard for Kubernetes deployments, supports templating for environment differences, built-in rollback capability, integrates with OCI DevOps deploy stages.
**Alternatives Considered**: Kustomize (less templating power), raw manifests (no environment parameterization), ArgoCD (overkill for team size).

---

## 4. Verification Checklist

### 4.1 Infrastructure Verification

- [ ] Terraform `plan` runs without errors for dev environment
- [ ] Terraform `apply` provisions VCN, subnets, and gateways
- [ ] OKE cluster is accessible via kubeconfig
- [ ] OKE namespaces (apex-dev, apex-qa, apex-staging, apex-prod) are created
- [ ] PostgreSQL DB system is running and accepting connections
- [ ] Redis cache is running and accepting connections
- [ ] OCI Vault is created with master encryption key
- [ ] All secrets are stored in Vault
- [ ] Load Balancer is provisioned with health checks passing
- [ ] WAF policy is attached to Load Balancer
- [ ] OCI Logging agent is running on OKE nodes
- [ ] Alarms are configured and notification topics created
- [ ] DNS steering policy is configured for failover

### 4.2 Application Verification

- [ ] `pnpm install` completes without errors
- [ ] `pnpm run build` builds all packages and apps
- [ ] `pnpm run lint` passes with no errors
- [ ] `pnpm run typecheck` passes with no errors
- [ ] `pnpm run test` passes with all tests green
- [ ] Frontend Vite dev server starts and serves placeholder page
- [ ] Backend Express server starts and responds to `/health`
- [ ] Backend `/ready` endpoint checks DB and Redis connectivity
- [ ] Structured logging outputs JSON with correlation IDs
- [ ] Error handling returns safe error responses (no stack traces)
- [ ] Custom error classes work correctly (400, 401, 403, 404, 409, 429, 500)

### 4.3 Database Verification

- [ ] Migrations run successfully against fresh database
- [ ] All 7 tables are created with correct schemas
- [ ] RLS policies are enabled on all tenant-scoped tables
- [ ] Indexes are created (email uniqueness, token hash, audit date partitioning)
- [ ] Seed script populates development data
- [ ] PgBouncer connects and proxies queries correctly

### 4.4 Container Verification

- [ ] API Docker image builds successfully (multi-stage)
- [ ] Web Docker image builds successfully (multi-stage)
- [ ] API container starts and health check passes
- [ ] Web container serves frontend with correct NGINX config
- [ ] Images are pushed to OCIR successfully
- [ ] Image sizes are reasonable (API < 200MB, Web < 50MB)

### 4.5 Deployment Verification

- [ ] Helm chart lints without errors (`helm lint`)
- [ ] Helm install to dev namespace succeeds
- [ ] Pods are running with correct resource limits
- [ ] HPA scales based on CPU/memory thresholds
- [ ] Ingress routes `/api` to backend and `/` to frontend
- [ ] Environment-specific values are applied correctly

### 4.6 CI/CD Verification

- [ ] Build pipeline triggers on git push
- [ ] Lint stage catches errors
- [ ] Test stage runs and reports coverage
- [ ] Security scan (Trivy) runs against images
- [ ] Deploy pipeline executes helm upgrade
- [ ] Rollback script works correctly

### 4.7 DR Verification

- [ ] PostgreSQL standby replica is receiving WAL streams
- [ ] Traffic Management health check monitors primary region
- [ ] Standby OKE cluster can scale up (manual test)
- [ ] Failover runbook is documented and accessible

---

## 5. Post-Foundation Next Steps

After U1 Foundation is complete, the following units build on this infrastructure:

| Next Unit | Builds On | Key Addition |
|-----------|-----------|--------------|
| U2: Authentication | Users table, JWT secrets, Redis sessions | Auth flow, JWT middleware, RBAC |
| U3: Tenant Management | Tenants table, RLS policies | Tenant CRUD, onboarding, settings |
| U4: Connection Manager | Connections table, Vault secrets | External service integrations |
| U5: MCP Integration | Redis cache, Bull queues | MCP server discovery and execution |

---

## Approval

**Code Summary Status**: Planned

This summary will be updated after code generation execution (Part 2) to reflect actual files created and any deviations from the plan.
