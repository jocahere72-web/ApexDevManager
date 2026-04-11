# Code Summary -- U2: Auth & Core Backend

## Document Information

| Field | Value |
|-------|-------|
| **Unit** | U2 -- Auth and Core Backend |
| **Sprint** | S1 (Fase 1, Weeks 4-5) |
| **Modules** | M0 (Authentication & Session Management), M1 Backend (Connection Manager) |
| **Stories** | US-003, US-004, US-005, US-006, US-007 |
| **Status** | AI-DLC Generated -- For Review |
| **Date** | 2026-04-10 |

---

## Deliverable Summary

| Metric | Value |
|--------|-------|
| Total files | 43 |
| Production files | 27 |
| Test files | 15 |
| Migration files | 3 (SQL) |
| Shared type packages | 3 |
| New API endpoints | 17 |
| New database tables | 4 (users, refresh_tokens, connections, audit_events) |
| RLS policies | 6 (2 per users/refresh_tokens, 1 connections, 2 audit_events) |

---

## Test Coverage Targets

| Module | Target Coverage | Scope |
|--------|----------------|-------|
| Auth service (password, token, auth) | >= 80% | Statements |
| Auth middleware | >= 90% | Statements |
| Users service | >= 75% | Statements |
| Connections service | >= 75% | Statements |
| Encryption service | >= 85% | Statements |
| Health check job | >= 75% | Statements |
| Shared middleware | >= 85% | Statements |
| **Overall U2** | **>= 70%** | **Statements (per PRD exit criteria)** |

---

## Acceptance Criteria Traceability

### M0-CA1: Authentication and Token Management

| Criteria | Description | Verification |
|----------|-------------|--------------|
| M0-CA1.1 | User authenticates and receives JWT + refresh token | `auth.integration.test.ts`: full login flow |
| M0-CA1.2 | JWT expires in 15 minutes, refresh token in 7 days | `token.service.test.ts`: expiry verification |
| M0-CA1.3 | Refresh token rotation with reuse detection | `token.service.test.ts`: family detection tests |
| M0-CA1.4 | Account lockout after 5 failed attempts (15 min) | `password.service.test.ts` + `auth.integration.test.ts` |
| M0-CA1.5 | Logout invalidates session | `auth.service.test.ts`: logout test |

### M0-CA2: Role-Based Access Control

| Criteria | Description | Verification |
|----------|-------------|--------------|
| M0-CA2.1 | 9 roles enforced via middleware | `auth.middleware.test.ts`: all role combinations |
| M0-CA2.2 | Permission matrix correctly blocks/allows | `auth.controller.test.ts` + `users.controller.test.ts` |
| M0-CA2.3 | Role changes take effect without re-auth | Roles read from DB on each request via JWT refresh |
| M0-CA2.4 | Admin-only user management | `users.controller.test.ts`: 403 for non-admin |

### M0-CA3: Audit Trail

| Criteria | Description | Verification |
|----------|-------------|--------------|
| M0-CA3.1 | All auth events logged (login, logout, failed) | `auth.service.test.ts`: audit event assertions |
| M0-CA3.2 | Events include timestamp, user, IP, outcome | `audit_events` table schema + service tests |
| M0-CA3.3 | Audit events are tenant-scoped | `tenant-isolation.test.ts` |
| M0-CA3.4 | Append-only (no UPDATE/DELETE RLS policies) | Migration 004: no UPDATE/DELETE policies |

### SEC-CA1: Security Baseline

| Criteria | Description | Verification |
|----------|-------------|--------------|
| SEC-CA1.1 | bcrypt password hashing (12 rounds) | `password.service.test.ts` |
| SEC-CA1.2 | RS256 JWT signing | `token.service.test.ts` |
| SEC-CA1.3 | AES-256-GCM credential encryption | `encryption.service.test.ts`: round-trip test |
| SEC-CA1.4 | PostgreSQL RLS tenant isolation | `tenant-isolation.test.ts`: cross-tenant blocked |
| SEC-CA1.5 | Rate limiting (1000 req/min/tenant) | `rate-limiter.test.ts` |
| SEC-CA1.6 | No plaintext credentials in logs or responses | `request-logger.test.ts` + `connections.controller.test.ts` |
| SEC-CA1.7 | Safe error responses (no stack traces) | `error-handler.test.ts` |

---

## API Endpoints Inventory

### Auth Endpoints (M0)

| Method | Path | Auth Required | Roles |
|--------|------|:-------------:|-------|
| POST | `/api/v1/auth/login` | No | -- |
| POST | `/api/v1/auth/refresh` | No | -- |
| POST | `/api/v1/auth/logout` | Yes | Any |
| GET | `/api/v1/auth/me` | Yes | Any |

### Users Endpoints (M0)

| Method | Path | Auth Required | Roles |
|--------|------|:-------------:|-------|
| POST | `/api/v1/users` | Yes | admin |
| GET | `/api/v1/users` | Yes | admin |
| GET | `/api/v1/users/:id` | Yes | admin, self |
| PATCH | `/api/v1/users/:id` | Yes | admin |
| DELETE | `/api/v1/users/:id` | Yes | admin |
| POST | `/api/v1/users/:id/unlock` | Yes | admin |
| POST | `/api/v1/users/invite` | Yes | admin |

### Connections Endpoints (M1)

| Method | Path | Auth Required | Roles |
|--------|------|:-------------:|-------|
| POST | `/api/v1/connections` | Yes | admin, developer, tech_lead, devops_engineer |
| GET | `/api/v1/connections` | Yes | Any authenticated |
| GET | `/api/v1/connections/:id` | Yes | Any authenticated |
| PATCH | `/api/v1/connections/:id` | Yes | admin, tech_lead, devops_engineer |
| DELETE | `/api/v1/connections/:id` | Yes | admin, devops_engineer |
| POST | `/api/v1/connections/:id/test` | Yes | admin, developer, tech_lead, qa_analyst, devops_engineer |
| GET | `/api/v1/connections/:id/health` | Yes | Any authenticated |
| GET | `/api/v1/connections/:id/health/history` | Yes | admin, devops_engineer, auditor |

---

## Technology Stack (U2-specific)

| Technology | Purpose | Version |
|------------|---------|---------|
| jsonwebtoken | JWT sign/verify (RS256) | ^9.0 |
| bcryptjs | Password hashing | ^2.4 |
| zod | Request validation | ^3.22 |
| bullmq | Health check scheduling | ^5.0 |
| node-oracledb | JDBC connection testing | ^6.0 |
| rate-limiter-flexible | Rate limiting | ^5.0 |
| oci-sdk (secrets) | OCI Vault integration | ^2.80 |
| pino | Structured logging | ^8.0 |
| ioredis | Redis client (sessions, rate limiting, Bull) | ^5.3 |

---

## Dependencies on U1 Foundation

| U1 Deliverable | U2 Usage |
|----------------|----------|
| PostgreSQL 16 + RLS foundation | Users, tokens, connections, audit tables |
| Redis cluster | Session storage, rate limiting counters, Bull queue |
| OCI Vault | Credential encryption DEK management |
| Express skeleton | Mount auth, users, connections routers |
| CI/CD pipeline | Run migrations, unit tests, integration tests |
| Docker/Helm | Containerize API with new modules |
| Monorepo scaffold | Place files in `apps/api/src/modules/` |

---

## Risk Mitigations Implemented

| Risk | Mitigation in U2 |
|------|-------------------|
| JWT/RBAC edge cases (9 roles) | Comprehensive permission matrix tests per controller |
| RLS tenant isolation leaks | Dedicated `tenant-isolation.test.ts` with cross-tenant assertions |
| Refresh token theft | Family-based reuse detection with full family invalidation |
| Credential exposure | AES-256-GCM envelope encryption; credentials never returned in API |
| Brute force attacks | Account lockout (5 attempts/15 min) + rate limiting (10 login/min/IP) |
| ORDS connectivity variability | Abstraction layer (ords.client.ts); 10-second timeout; health check retry |
