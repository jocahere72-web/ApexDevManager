# Code Generation Plan - U1: Foundation of APEX Dev Manager

**Unit**: U1 - Foundation
**Phase**: Construction - Code Generation (Part 1: Planning)
**Date**: 2026-04-10
**Status**: Pending Approval

---

## Plan Overview

This plan covers the complete foundation scaffold for APEX Dev Manager: monorepo setup, frontend/backend scaffolding, shared packages, containerization, Helm charts, Terraform modules, database migrations, core middleware, CI/CD pipelines, and seed data.

**Estimated Files**: ~120 files
**Estimated Duration**: 3 weeks (Fase 0)

---

## Code Generation Steps

### 1. Initialize Monorepo with pnpm Workspaces

- [ ] **Monorepo root configuration**
  - [ ] `package.json` - Root package with pnpm workspace config, shared scripts (`lint`, `test`, `build`, `typecheck`, `dev`)
  - [ ] `pnpm-workspace.yaml` - Workspace definition (`apps/*`, `packages/*`)
  - [ ] `.npmrc` - pnpm configuration (strict-peer-dependencies, auto-install-peers)
  - [ ] `turbo.json` - Turborepo pipeline config for parallel builds (build, lint, test, typecheck)
  - [ ] `.gitignore` - Node modules, dist, coverage, env files, Terraform state
  - [ ] `.nvmrc` - Node.js version pin (v20 LTS)
  - [ ] `.editorconfig` - Editor consistency (indent size, charset, EOL)

### 2. Create React 18 + Vite + TypeScript Frontend Scaffold (apps/web)

- [ ] **Frontend project structure**
  - [ ] `apps/web/package.json` - Dependencies: React 18, Vite 5, TypeScript 5, React Router 6, Axios, TanStack Query
  - [ ] `apps/web/tsconfig.json` - TypeScript config with strict mode, path aliases (`@/`)
  - [ ] `apps/web/vite.config.ts` - Vite config with React plugin, path aliases, proxy to API dev server
  - [ ] `apps/web/index.html` - HTML entry point
  - [ ] `apps/web/src/main.tsx` - React entry point with StrictMode
  - [ ] `apps/web/src/App.tsx` - Root App component with Router setup
  - [ ] `apps/web/src/vite-env.d.ts` - Vite type declarations
  - [ ] `apps/web/src/routes/index.tsx` - Route definitions (placeholder)
  - [ ] `apps/web/src/layouts/MainLayout.tsx` - Main layout shell (placeholder)
  - [ ] `apps/web/src/pages/DashboardPage.tsx` - Dashboard placeholder
  - [ ] `apps/web/src/pages/LoginPage.tsx` - Login placeholder
  - [ ] `apps/web/src/lib/api-client.ts` - Axios instance with interceptors (base URL, auth header, error handling)
  - [ ] `apps/web/src/lib/query-client.ts` - TanStack Query client config
  - [ ] `apps/web/src/hooks/useAuth.ts` - Auth hook placeholder
  - [ ] `apps/web/src/types/index.ts` - Re-export from shared-types

### 3. Create Node.js + Express + TypeScript Backend Scaffold (apps/api)

- [ ] **Backend project structure**
  - [ ] `apps/api/package.json` - Dependencies: Express 4, TypeScript 5, pg, ioredis, bullmq, helmet, cors, compression, dotenv, zod, pino, uuid
  - [ ] `apps/api/tsconfig.json` - TypeScript config with strict mode, path aliases, ES2022 target
  - [ ] `apps/api/src/index.ts` - Entry point: create Express app, connect DB/Redis, start server
  - [ ] `apps/api/src/app.ts` - Express app factory: middleware registration, route mounting
  - [ ] `apps/api/src/config/index.ts` - Environment config loader with zod validation (DB, Redis, JWT, OCI settings)
  - [ ] `apps/api/src/config/database.ts` - PostgreSQL pool configuration (PgBouncer connection)
  - [ ] `apps/api/src/config/redis.ts` - Redis/ioredis connection factory
  - [ ] `apps/api/src/routes/index.ts` - Root router: mount health, auth, and API routes
  - [ ] `apps/api/src/routes/health.ts` - Health check routes (`/health`, `/ready`)
  - [ ] `apps/api/src/types/index.ts` - Re-export from shared-types plus server-specific types
  - [ ] `apps/api/src/types/express.d.ts` - Express type augmentation (req.tenantId, req.userId, req.correlationId)

### 4. Create Shared Types Package (packages/shared-types)

- [ ] **Shared types package**
  - [ ] `packages/shared-types/package.json` - Package config with TypeScript build
  - [ ] `packages/shared-types/tsconfig.json` - TypeScript config (declaration: true)
  - [ ] `packages/shared-types/src/index.ts` - Barrel export
  - [ ] `packages/shared-types/src/tenant.ts` - Tenant interface and types
  - [ ] `packages/shared-types/src/user.ts` - User interface, roles enum, auth types
  - [ ] `packages/shared-types/src/connection.ts` - Connection interface and types
  - [ ] `packages/shared-types/src/environment.ts` - Environment interface and types
  - [ ] `packages/shared-types/src/audit.ts` - Audit event interface and types
  - [ ] `packages/shared-types/src/api-response.ts` - Standard API response envelope types (success, error, paginated)
  - [ ] `packages/shared-types/src/common.ts` - Common types (UUID, ISO date string, pagination params)

### 5. Set Up ESLint + Prettier Configuration

- [ ] **Linting and formatting**
  - [ ] `eslint.config.mjs` - Root ESLint flat config: TypeScript rules, React rules, import ordering
  - [ ] `.prettierrc` - Prettier config: single quotes, trailing commas, 100 print width, 2-space indent
  - [ ] `.prettierignore` - Ignore dist, coverage, node_modules, generated files
  - [ ] `apps/web/eslint.config.mjs` - Frontend-specific ESLint (extends root + React hooks, JSX a11y)
  - [ ] `apps/api/eslint.config.mjs` - Backend-specific ESLint (extends root + Node rules)

### 6. Set Up Jest (Frontend) + Mocha/Chai (Backend) Test Frameworks

- [ ] **Test configuration**
  - [ ] `apps/web/vitest.config.ts` - Vitest config (jsdom environment, setup files, coverage thresholds >= 80%)
  - [ ] `apps/web/src/test/setup.ts` - Test setup: testing-library matchers, MSW setup
  - [ ] `apps/web/src/__tests__/App.test.tsx` - Smoke test for App component
  - [ ] `apps/api/.mocharc.yml` - Mocha config: TypeScript loader, timeout, recursive
  - [ ] `apps/api/test/setup.ts` - Test setup: chai assertions, sinon stubs, test DB connection
  - [ ] `apps/api/test/health.test.ts` - Health endpoint integration tests
  - [ ] `apps/api/test/helpers/db.ts` - Test database helper (create/teardown test DB, run migrations)
  - [ ] `apps/api/test/helpers/factory.ts` - Test data factory (tenant, user, connection builders)

### 7. Create Dockerfile for API (Multi-Stage Build)

- [ ] **API container**
  - [ ] `apps/api/Dockerfile` - Multi-stage: (1) pnpm install + build, (2) production node:20-alpine with non-root user, health check, minimal image
  - [ ] `apps/api/.dockerignore` - Exclude node_modules, test, coverage, docs

### 8. Create Dockerfile for Web (NGINX Serve)

- [ ] **Web container**
  - [ ] `apps/web/Dockerfile` - Multi-stage: (1) pnpm install + vite build, (2) nginx:alpine serving dist, custom nginx.conf with SPA routing, gzip, security headers
  - [ ] `apps/web/.dockerignore` - Exclude node_modules, test, coverage
  - [ ] `apps/web/nginx.conf` - NGINX config: SPA fallback, gzip, cache static assets, security headers (X-Frame-Options, X-Content-Type-Options, CSP)

### 9. Create Helm Chart with Values per Environment

- [ ] **Helm chart structure**
  - [ ] `deploy/helm/apex-api/Chart.yaml` - Chart metadata (name, version, appVersion)
  - [ ] `deploy/helm/apex-api/values.yaml` - Default values (image, replicas, resources, env vars, probes)
  - [ ] `deploy/helm/apex-api/templates/_helpers.tpl` - Template helpers (name, labels, selectors)
  - [ ] `deploy/helm/apex-api/templates/deployment.yaml` - API deployment with probes, resource limits, env from secrets
  - [ ] `deploy/helm/apex-api/templates/service.yaml` - ClusterIP service
  - [ ] `deploy/helm/apex-api/templates/hpa.yaml` - HPA template (configurable via values)
  - [ ] `deploy/helm/apex-api/templates/configmap.yaml` - Non-secret config
  - [ ] `deploy/helm/apex-api/templates/secret.yaml` - Secret references (from OCI Vault via CSI driver)
  - [ ] `deploy/helm/apex-api/templates/serviceaccount.yaml` - Service account with OCI workload identity annotations
  - [ ] `deploy/helm/apex-web/Chart.yaml` - Web chart metadata
  - [ ] `deploy/helm/apex-web/values.yaml` - Default values
  - [ ] `deploy/helm/apex-web/templates/deployment.yaml` - Web deployment
  - [ ] `deploy/helm/apex-web/templates/service.yaml` - ClusterIP service
  - [ ] `deploy/helm/apex-web/templates/ingress.yaml` - NGINX Ingress resource

### 10. Create Terraform Modules for OCI Resources

- [ ] **Terraform modules** (structure only, key resource definitions)
  - [ ] `terraform/modules/networking/main.tf` - VCN, subnets, gateways, NSGs, security rules
  - [ ] `terraform/modules/networking/variables.tf` - CIDR blocks, compartment ID, region
  - [ ] `terraform/modules/networking/outputs.tf` - VCN ID, subnet IDs, NSG IDs
  - [ ] `terraform/modules/oke/main.tf` - OKE cluster, node pool, RBAC
  - [ ] `terraform/modules/oke/variables.tf` - K8s version, node shape, count
  - [ ] `terraform/modules/oke/outputs.tf` - Cluster ID, kubeconfig endpoint
  - [ ] `terraform/modules/database/main.tf` - PostgreSQL DB system, backup config
  - [ ] `terraform/modules/database/variables.tf` - Shape, storage, passwords
  - [ ] `terraform/modules/database/outputs.tf` - Connection string, IP
  - [ ] `terraform/modules/redis/main.tf` - OCI Cache with Redis
  - [ ] `terraform/modules/redis/variables.tf` - Memory size, node type
  - [ ] `terraform/modules/redis/outputs.tf` - Endpoint, port
  - [ ] `terraform/modules/vault/main.tf` - Vault, master key, secrets
  - [ ] `terraform/modules/vault/variables.tf` - Key algorithm, rotation
  - [ ] `terraform/modules/vault/outputs.tf` - Vault ID, key ID
  - [ ] `terraform/modules/load-balancer/main.tf` - LB, listeners, backend sets, WAF
  - [ ] `terraform/modules/load-balancer/variables.tf` - Bandwidth, cert, WAF rules
  - [ ] `terraform/modules/load-balancer/outputs.tf` - LB IP, LB ID
  - [ ] `terraform/modules/logging/main.tf` - Log group, logs, alarms, notifications
  - [ ] `terraform/modules/logging/variables.tf` - Retention, thresholds
  - [ ] `terraform/modules/logging/outputs.tf` - Log group ID
  - [ ] `terraform/modules/devops/main.tf` - DevOps project, build/deploy pipelines
  - [ ] `terraform/modules/devops/variables.tf` - Repo URL, branch triggers
  - [ ] `terraform/modules/devops/outputs.tf` - Pipeline IDs
  - [ ] `terraform/modules/dr/main.tf` - Traffic Management, health checks
  - [ ] `terraform/modules/dr/variables.tf` - Primary/standby IPs, DNS name
  - [ ] `terraform/modules/dr/outputs.tf` - Steering policy ID
  - [ ] `terraform/environments/dev/main.tf` - Dev environment module calls
  - [ ] `terraform/environments/dev/terraform.tfvars` - Dev-specific values
  - [ ] `terraform/environments/dev/backend.tf` - OCI Object Storage backend
  - [ ] `terraform/environments/prod/main.tf` - Prod environment module calls
  - [ ] `terraform/environments/prod/terraform.tfvars` - Prod-specific values
  - [ ] `terraform/environments/prod/backend.tf` - OCI Object Storage backend

### 11. Create Database Migration Framework (node-pg-migrate)

- [ ] **Migration framework**
  - [ ] `apps/api/src/db/migrate.ts` - Migration runner CLI entry point
  - [ ] `apps/api/src/db/connection.ts` - Migration-specific DB connection (bypasses PgBouncer, direct to PG)
  - [ ] `apps/api/migrations/.gitkeep` - Migrations directory placeholder

### 12. Create Initial Migration: Base Tables

- [ ] **Foundation tables migration**
  - [ ] `apps/api/migrations/001_create-extensions.ts` - Enable uuid-ossp, pgcrypto extensions
  - [ ] `apps/api/migrations/002_create-tenants.ts` - `tenants` table: id (UUID PK), name, slug (unique), plan, settings (JSONB), status, created_at, updated_at
  - [ ] `apps/api/migrations/003_create-users.ts` - `users` table: id (UUID PK), tenant_id (FK), email, password_hash (VARCHAR 60), name (VARCHAR 100), role (VARCHAR 50: admin|developer|tech_lead|release_manager|knowledge_editor|marketplace_publisher|qa_analyst|devops_engineer|auditor), is_active (BOOLEAN), failed_attempts (INTEGER), locked_until (TIMESTAMP), last_login_at, created_at, updated_at, deleted_at + RLS policy + unique(tenant_id, email) index
  - [ ] `apps/api/migrations/004_create-refresh-tokens.ts` - `refresh_tokens` table: id (UUID PK), tenant_id (FK), user_id (FK), token_hash, family_id (UUID), is_revoked (BOOLEAN), expires_at, created_at, used_at + index on token_hash + RLS policy
  - [ ] `apps/api/migrations/005_create-audit-events.ts` - `audit_events` table: id (UUID PK), tenant_id (FK), user_id (FK nullable), event_type, action, entity_type, entity_id, event_payload (JSONB), ip_address, user_agent, created_at + partitioned by created_at (monthly) + RLS policy (append-only, no delete)
  - [ ] `apps/api/migrations/006_create-connections.ts` - `connections` table: id (UUID PK), tenant_id (FK), connection_type (ords|jdbc), name, ords_url, db_host, service_name, secret_ref (OCI Vault), health_status, last_health_check_at, deleted_at (soft delete), created_at, updated_at + RLS policy
  - [ ] `apps/api/migrations/007_create-environments.ts` - `environments` table: id (UUID PK), tenant_id (FK), name, type (enum: dev/qa/staging/prod), config (JSONB), status, created_at, updated_at + RLS policy

### 13. Implement Health Check Endpoints

- [ ] **Health checks**
  - [ ] `apps/api/src/routes/health.ts` - `/health` (liveness: returns 200 if process alive), `/ready` (readiness: checks DB connection + Redis connection, returns 200 or 503 with details)

### 14. Implement Structured Logging Middleware

- [ ] **Logging**
  - [ ] `apps/api/src/middleware/request-logger.ts` - Request/response logging middleware: log method, path, status, duration, correlation ID, tenant ID; JSON format via pino
  - [ ] `apps/api/src/lib/logger.ts` - Pino logger factory: JSON output, log level from env, child loggers with context (correlationId, tenantId, userId)
  - [ ] `apps/api/src/middleware/correlation-id.ts` - Middleware to extract or generate X-Correlation-ID header, attach to req object

### 15. Implement Error Handling Middleware

- [ ] **Error handling**
  - [ ] `apps/api/src/middleware/error-handler.ts` - Global error handler: catch all errors, map to safe API responses, log full error internally, return sanitized error to client (no stack traces in prod), handle known error types (ValidationError, AuthError, NotFoundError, etc.)
  - [ ] `apps/api/src/lib/errors.ts` - Custom error classes: AppError (base), ValidationError (400), AuthenticationError (401), AuthorizationError (403), NotFoundError (404), ConflictError (409), RateLimitError (429), InternalError (500)
  - [ ] `apps/api/src/middleware/not-found.ts` - 404 handler for unmatched routes

### 16. Set Up OCI DevOps Build Pipeline YAML

- [ ] **Build pipeline**
  - [ ] `build_spec.yaml` - OCI DevOps build spec: install deps, lint, typecheck, test, build Docker images, security scan, push to OCIR

### 17. Set Up OCI DevOps Deploy Pipeline YAML

- [ ] **Deploy pipeline**
  - [ ] `deploy/deploy-spec.yaml` - OCI DevOps deploy spec: helm upgrade with environment-specific values
  - [ ] `deploy/scripts/pre-deploy.sh` - Pre-deploy: run DB migrations, verify health
  - [ ] `deploy/scripts/post-deploy.sh` - Post-deploy: smoke tests, notify team
  - [ ] `deploy/scripts/rollback.sh` - Rollback: helm rollback, notify team

### 18. Create Environment-Specific Helm Values

- [ ] **Helm values per environment**
  - [ ] `deploy/helm/apex-api/values-dev.yaml` - Dev: 1 replica, debug logging, relaxed resource limits, mock secrets
  - [ ] `deploy/helm/apex-api/values-qa.yaml` - QA: 2 replicas, info logging, moderate resources
  - [ ] `deploy/helm/apex-api/values-staging.yaml` - Staging: 2 replicas, info logging, prod-like resources
  - [ ] `deploy/helm/apex-api/values-prod.yaml` - Prod: 2-10 replicas (HPA), warn logging, full resources, real Vault secrets
  - [ ] `deploy/helm/apex-web/values-dev.yaml` - Dev web values
  - [ ] `deploy/helm/apex-web/values-prod.yaml` - Prod web values

### 19. Create Seed Data Script for Development Environment

- [ ] **Seed data**
  - [ ] `apps/api/src/db/seed.ts` - Seed script: create default tenant ("APEX Demo"), admin user (admin@apex.local / hashed password), sample connection, sample environment, sample audit events
  - [ ] `apps/api/src/db/seed-data/tenants.json` - Default tenant data
  - [ ] `apps/api/src/db/seed-data/users.json` - Default users for all 9 roles (admin, developer, tech_lead, release_manager, knowledge_editor, marketplace_publisher, qa_analyst, devops_engineer, auditor)

---

## Execution Order

The steps above will be executed in the listed order (1-19). Dependencies:

- Steps 1-5 have no dependencies (project scaffolding)
- Step 6 depends on Steps 2-3 (test targets must exist)
- Steps 7-8 depend on Steps 2-3 (build targets must exist)
- Step 9 depends on Steps 7-8 (Docker images for Helm)
- Step 10 depends on infrastructure-design.md (Terraform resource specs)
- Steps 11-12 depend on Step 3 (API project must exist)
- Steps 13-15 depend on Step 3 (API middleware)
- Steps 16-17 depend on Steps 7-9 (build artifacts and Helm charts)
- Step 18 depends on Step 9 (Helm chart must exist)
- Step 19 depends on Steps 11-12 (DB and migrations must exist)

---

## Approval

**Please review this code generation plan.**

**Options**:
1. **Request Changes** - Modify the plan before execution
2. **Approve Plan** - Proceed to Part 2 (Code Generation execution)
