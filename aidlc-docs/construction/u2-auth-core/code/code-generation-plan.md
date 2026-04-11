# Code Generation Plan -- U2: Auth & Core Backend

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

## Prerequisites

Before starting code generation, verify U1 Foundation deliverables:
- [ ] PostgreSQL 16 is running with `tenants` table and RLS foundation
- [ ] Redis cluster is operational
- [ ] Monorepo scaffold exists (`apps/api/`, `apps/web/`, `packages/shared-types/`)
- [ ] CI/CD pipeline is green
- [ ] OCI Vault is configured and accessible from API pods
- [ ] Express skeleton with health check endpoint is deployed

---

## Plan Checklist

### 1. Database Migrations

- [ ] `migrations/008_users_and_auth.sql`
  - [ ] Create `users` table (id, tenant_id, email, password_hash, display_name, roles, is_active, failed_attempts, locked_until, last_login_at, created_at, updated_at, deleted_at)
  - [ ] Create UNIQUE index on `(tenant_id, email)` WHERE `deleted_at IS NULL`
  - [ ] Create index on `users(tenant_id)`
  - [ ] Enable RLS on `users`
  - [ ] Create `users_tenant_isolation` policy: `USING (tenant_id::text = current_setting('app.current_tenant', true))`
  - [ ] Create `refresh_tokens` table (id, token_hash, user_id, tenant_id, family_id, is_used, used_at, expires_at, created_at, replaced_by)
  - [ ] Create index on `refresh_tokens(token_hash)`
  - [ ] Create index on `refresh_tokens(family_id)`
  - [ ] Create index on `refresh_tokens(user_id, tenant_id)`
  - [ ] Enable RLS on `refresh_tokens`
  - [ ] Create `refresh_tokens_tenant_isolation` policy

- [ ] `migrations/009_connections.sql`
  - [ ] Create `connections` table (id, tenant_id, name, type, environment, ords_base_url, host, port, service_name, pool_min, pool_max, pool_increment, schema_name, workspace_name, encrypted_credentials, status, last_check_at, last_latency_ms, last_error, consecutive_failures, tags, labels, change_log, is_active, created_by, created_at, updated_at, deleted_at)
  - [ ] Create UNIQUE index on `(tenant_id, name)` WHERE `deleted_at IS NULL`
  - [ ] Create index on `connections(tenant_id, environment)`
  - [ ] Create index on `connections(status)` WHERE `is_active = TRUE`
  - [ ] Enable RLS on `connections`
  - [ ] Create `connections_tenant_isolation` policy
  - [ ] Add CHECK constraint for `type IN ('ords', 'jdbc')`
  - [ ] Add CHECK constraint for `environment IN ('dev', 'test', 'staging', 'prod')`
  - [ ] Add CHECK constraint for `status IN ('connected', 'degraded', 'disconnected', 'unknown')`

- [ ] `migrations/010_audit_events.sql`
  - [ ] Create `audit_events` table (id, tenant_id, user_id, event_type, resource_type, resource_id, action, details, ip_address, user_agent, correlation_id, created_at)
  - [ ] Create index on `audit_events(tenant_id, created_at)`
  - [ ] Create index on `audit_events(event_type, created_at)`
  - [ ] Create index on `audit_events(user_id)`
  - [ ] Enable RLS on `audit_events`
  - [ ] Create SELECT-only policy `audit_events_tenant_read`
  - [ ] Create INSERT-only policy `audit_events_tenant_insert`
  - [ ] No UPDATE or DELETE policies (append-only enforcement)

---

### 2. Shared Types (packages/shared-types)

- [ ] `packages/shared-types/src/auth.ts`
  - [ ] `Role` union type (9 roles)
  - [ ] `LoginRequest` interface
  - [ ] `AuthResponse` interface
  - [ ] `TokenPayload` interface
  - [ ] `UserProfile` interface
  - [ ] `SessionData` interface

- [ ] `packages/shared-types/src/connections.ts`
  - [ ] `ConnectionType` union (`'ords' | 'jdbc'`)
  - [ ] `ConnectionEnvironment` union (`'dev' | 'test' | 'staging' | 'prod'`)
  - [ ] `ConnectionStatus` union (`'connected' | 'degraded' | 'disconnected' | 'unknown'`)
  - [ ] `ConnectionConfig` interface (discriminated by type)
  - [ ] `TestResult` interface
  - [ ] `PoolStats` interface
  - [ ] `ConnectionHealth` interface
  - [ ] `ChangeLogEntry` interface

- [ ] `packages/shared-types/src/errors.ts`
  - [ ] `ErrorCode` enum (all codes from functional design Section 4)
  - [ ] `ErrorResponse` interface
  - [ ] `ValidationErrorDetail` interface

---

### 3. M0 Auth Module (apps/api/src/modules/auth/)

- [ ] `src/modules/auth/auth.types.ts`
  - [ ] Re-export shared types with service-internal extensions
  - [ ] `RefreshTokenRecord` interface (DB row)
  - [ ] `LockoutStatus` interface

- [ ] `src/modules/auth/auth.validation.ts`
  - [ ] `LoginSchema` (Zod) -- email, password, tenantId, mfaCode?
  - [ ] `RefreshTokenSchema` (Zod) -- refreshToken string
  - [ ] `ForgotPasswordSchema` (Zod) -- email
  - [ ] `ResetPasswordSchema` (Zod) -- token, newPassword

- [ ] `src/modules/auth/password.service.ts`
  - [ ] `hashPassword(plain: string): Promise<string>` -- bcrypt, 12 rounds
  - [ ] `verifyPassword(plain: string, hash: string): Promise<boolean>` -- bcrypt compare
  - [ ] `checkLockout(userId: string): Promise<LockoutStatus>` -- query failed_attempts + locked_until
  - [ ] `incrementFailedAttempts(userId: string): Promise<{ locked: boolean; attemptsRemaining: number }>` -- increment + auto-lock at 5
  - [ ] `resetFailedAttempts(userId: string): Promise<void>` -- reset to 0, clear locked_until
  - [ ] `lockAccount(userId: string, reason: string): Promise<void>` -- manual lock by admin
  - [ ] `unlockAccount(userId: string): Promise<void>` -- manual unlock by admin

- [ ] `src/modules/auth/token.service.ts`
  - [ ] `generateAccessToken(payload: TokenPayload): string` -- RS256 JWT, 15 min expiry
  - [ ] `generateRefreshToken(userId: string, tenantId: string, familyId?: string): Promise<string>` -- random token, store SHA-256 hash
  - [ ] `verifyAccessToken(token: string): TokenPayload` -- verify RS256 signature + expiry
  - [ ] `rotateRefreshToken(oldTokenRaw: string): Promise<{ accessToken: string; refreshToken: string }>` -- family detection logic
  - [ ] `invalidateFamily(familyId: string): Promise<void>` -- mark all tokens in family as used, clear Redis sessions
  - [ ] `cleanupExpiredTokens(): Promise<number>` -- scheduled cleanup of expired refresh tokens

- [ ] `src/modules/auth/auth.service.ts`
  - [ ] `login(credentials: LoginRequest): Promise<AuthResponse>` -- orchestrates: find user, check lockout, verify password, issue tokens, create session, log audit
  - [ ] `refresh(refreshToken: string): Promise<AuthResponse>` -- delegates to token.service.rotateRefreshToken
  - [ ] `logout(sessionId: string): Promise<void>` -- invalidate Redis session, log audit
  - [ ] `validateToken(token: string): Promise<TokenPayload>` -- delegates to token.service.verifyAccessToken
  - [ ] `getMe(userId: string): Promise<UserProfile>` -- fetch current user profile

- [ ] `src/modules/auth/auth.controller.ts`
  - [ ] `POST /api/v1/auth/login` -- validate body with LoginSchema, call auth.service.login
  - [ ] `POST /api/v1/auth/refresh` -- validate body with RefreshTokenSchema, call auth.service.refresh
  - [ ] `POST /api/v1/auth/logout` -- requires auth, call auth.service.logout
  - [ ] `GET /api/v1/auth/me` -- requires auth, call auth.service.getMe
  - [ ] Wire routes to Express Router with appropriate middleware

- [ ] `src/modules/auth/auth.middleware.ts`
  - [ ] `authenticate(): RequestHandler` -- extract Bearer token from Authorization header, verify JWT, attach user to req
  - [ ] `authorize(roles: Role[]): RequestHandler` -- check req.user.roles against required roles, 403 if denied
  - [ ] `optionalAuth(): RequestHandler` -- same as authenticate but does not reject unauthenticated requests

---

### 4. M0 Users Module (apps/api/src/modules/users/)

- [ ] `src/modules/users/users.validation.ts`
  - [ ] `CreateUserSchema` (Zod) -- email, displayName, roles[], password (12+ chars, complexity)
  - [ ] `UpdateUserSchema` (Zod) -- displayName?, roles?, isActive?
  - [ ] `ListUsersQuerySchema` (Zod) -- page, limit, search?, role?, isActive?
  - [ ] `InviteUserSchema` (Zod) -- email, roles[]

- [ ] `src/modules/users/users.service.ts`
  - [ ] `createUser(data: CreateUserInput, actorId: string): Promise<UserProfile>` -- hash password, insert, log audit
  - [ ] `listUsers(tenantId: string, query: ListUsersQuery): Promise<PaginatedResult<UserProfile>>` -- paginated, filtered
  - [ ] `getUserById(id: string): Promise<UserProfile>` -- single user by ID
  - [ ] `updateUser(id: string, data: UpdateUserInput, actorId: string): Promise<UserProfile>` -- update fields, last-admin guard, log audit
  - [ ] `softDeleteUser(id: string, actorId: string): Promise<void>` -- set deleted_at, log audit
  - [ ] `unlockUser(id: string, actorId: string): Promise<void>` -- delegates to password.service.unlockAccount

- [ ] `src/modules/users/users.controller.ts`
  - [ ] `POST /api/v1/users` -- admin only, validate CreateUserSchema
  - [ ] `GET /api/v1/users` -- admin only, validate ListUsersQuerySchema
  - [ ] `GET /api/v1/users/:id` -- admin or self
  - [ ] `PATCH /api/v1/users/:id` -- admin only, validate UpdateUserSchema
  - [ ] `DELETE /api/v1/users/:id` -- admin only (soft delete)
  - [ ] `POST /api/v1/users/:id/unlock` -- admin only

---

### 5. M1 Connections Module (apps/api/src/modules/connections/)

- [ ] `src/modules/connections/connections.validation.ts`
  - [ ] `CreateConnectionSchema` (Zod) -- discriminated union on type ('ords' | 'jdbc')
  - [ ] `UpdateConnectionSchema` (Zod) -- name?, environment?, tags?, labels?, pool config?
  - [ ] `ListConnectionsQuerySchema` (Zod) -- page, limit, environment?, status?, tag?, search?
  - [ ] `TestConnectionParamsSchema` (Zod) -- id UUID

- [ ] `src/modules/connections/encryption.service.ts`
  - [ ] `encryptCredentials(credentials: { username: string; password: string }, tenantId: string): Promise<EncryptedBlob>` -- get/generate DEK from OCI Vault, AES-256-GCM encrypt
  - [ ] `decryptCredentials(blob: EncryptedBlob, tenantId: string): Promise<{ username: string; password: string }>` -- decrypt DEK via OCI Vault, AES-256-GCM decrypt
  - [ ] `rotateDEK(tenantId: string): Promise<void>` -- generate new DEK, re-encrypt all tenant connections
  - [ ] Error handling: wrap OCI Vault errors with CONN_DECRYPT_FAILED code

- [ ] `src/modules/connections/ords.client.ts`
  - [ ] `testOrdsConnection(config: OrdsConnectionParams): Promise<TestResult>` -- GET `{ordsBaseUrl}/_/catalog`, parse APEX version, measure latency
  - [ ] `getOrdsMetadata(config: OrdsConnectionParams): Promise<OrdsMetadata>` -- fetch ORDS metadata for validation
  - [ ] Timeout: 10 seconds
  - [ ] Error mapping: network errors -> CONN_ORDS_UNREACHABLE

- [ ] `src/modules/connections/jdbc.client.ts`
  - [ ] `testJdbcConnection(config: JdbcConnectionParams): Promise<TestResult>` -- oracledb.getConnection, execute `SELECT 1 FROM DUAL`, measure latency
  - [ ] `getJdbcPoolStats(connectionId: string): Promise<PoolStats>` -- retrieve pool statistics from node-oracledb
  - [ ] Timeout: 10 seconds
  - [ ] Error mapping: network errors -> CONN_JDBC_UNREACHABLE

- [ ] `src/modules/connections/health-check.job.ts`
  - [ ] `registerHealthCheckJob(queue: Queue): void` -- define repeatable Bull job (every 5 min)
  - [ ] `processHealthCheck(job: Job): Promise<void>` -- list active connections, test each (concurrency 10), update status
  - [ ] Status transition logic: connected / degraded (>3000ms) / disconnected (3 consecutive failures)
  - [ ] Emit events on status change: `CONNECTION_STATUS_CHANGED`, `CONNECTION_DEGRADED`
  - [ ] Skip soft-deleted and disabled connections

- [ ] `src/modules/connections/connections.service.ts`
  - [ ] `createConnection(data: CreateConnectionInput, actorId: string): Promise<ConnectionResponse>` -- encrypt credentials, test connection, insert, schedule health check, append change_log, log audit
  - [ ] `listConnections(tenantId: string, query: ListConnectionsQuery): Promise<PaginatedResult<ConnectionResponse>>` -- paginated, filtered by status/env/tag
  - [ ] `getConnectionById(id: string): Promise<ConnectionResponse>` -- single connection (never return encrypted_credentials)
  - [ ] `updateConnection(id: string, data: UpdateConnectionInput, actorId: string): Promise<ConnectionResponse>` -- re-encrypt if credentials changed, append change_log, log audit
  - [ ] `softDeleteConnection(id: string, actorId: string): Promise<void>` -- set deleted_at, cancel health check job, append change_log, log audit
  - [ ] `testConnection(id: string): Promise<TestResult>` -- decrypt credentials, test via ords.client or jdbc.client
  - [ ] `getHealthStatus(id: string): Promise<ConnectionHealth>` -- latest health check data
  - [ ] `getHealthHistory(id: string, days: number): Promise<HealthHistoryEntry[]>` -- last N days of health records

- [ ] `src/modules/connections/connections.controller.ts`
  - [ ] `POST /api/v1/connections` -- authorize(['admin','developer','tech_lead','devops_engineer']), validate CreateConnectionSchema
  - [ ] `GET /api/v1/connections` -- authenticate(), validate ListConnectionsQuerySchema
  - [ ] `GET /api/v1/connections/:id` -- authenticate()
  - [ ] `PATCH /api/v1/connections/:id` -- authorize(['admin','tech_lead','devops_engineer']), validate UpdateConnectionSchema
  - [ ] `DELETE /api/v1/connections/:id` -- authorize(['admin','devops_engineer'])
  - [ ] `POST /api/v1/connections/:id/test` -- authorize(['admin','developer','tech_lead','qa_analyst','devops_engineer'])
  - [ ] `GET /api/v1/connections/:id/health` -- authenticate()
  - [ ] `GET /api/v1/connections/:id/health/history` -- authorize(['admin','devops_engineer','auditor'])

---

### 6. Shared Middleware (apps/api/src/middleware/)

- [ ] `src/middleware/tenant-resolver.ts`
  - [ ] `tenantScope(): RequestHandler` -- extract `tenantId` from `req.user` (set by auth middleware), call `SET app.current_tenant` on the DB connection via pool wrapper
  - [ ] Reject requests with missing tenantId (AUTH_TENANT_MISMATCH)
  - [ ] Attach `req.tenantId` for downstream use

- [ ] `src/middleware/rate-limiter.ts`
  - [ ] `createRateLimiter(config: RateLimitConfig): RequestHandler` -- factory function
  - [ ] Default configs: tenant (1000/min), login (10/min per IP), unauthenticated (30/min per IP)
  - [ ] Implementation: `rate-limiter-flexible` with Redis store
  - [ ] Response: 429 with `Retry-After` header

- [ ] `src/middleware/request-logger.ts`
  - [ ] `requestLogger(): RequestHandler` -- structured JSON log per request
  - [ ] Fields: correlationId, timestamp, method, path, statusCode, durationMs, tenantId, userId
  - [ ] Generate correlationId if not in `X-Correlation-ID` header
  - [ ] Attach `req.correlationId` for downstream use
  - [ ] Never log request bodies (security)

- [ ] `src/middleware/error-handler.ts`
  - [ ] `globalErrorHandler(): ErrorRequestHandler` -- catch-all Express error handler
  - [ ] Map known error classes (ForbiddenError, NotFoundError, ValidationError, etc.) to ErrorResponse
  - [ ] Unknown errors: 500 + INTERNAL_ERROR, log full stack trace, return safe message
  - [ ] Include correlationId in error response
  - [ ] Custom error classes: `AppError`, `ForbiddenError`, `NotFoundError`, `ConflictError`, `ValidationError`, `LockedError`, `RateLimitError`

---

### 7. Unit Tests (apps/api/tests/)

- [ ] `tests/modules/auth/password.service.test.ts`
  - [ ] Hash and verify password (bcrypt 12 rounds)
  - [ ] Lockout after 5 failed attempts
  - [ ] Lockout expiry after 15 minutes
  - [ ] Reset counter on successful login
  - [ ] Admin manual lock/unlock

- [ ] `tests/modules/auth/token.service.test.ts`
  - [ ] Generate valid RS256 JWT with correct claims
  - [ ] Verify valid token returns payload
  - [ ] Reject expired token
  - [ ] Reject tampered token
  - [ ] Refresh token rotation (new token issued, old marked used)
  - [ ] Reuse detection invalidates entire family
  - [ ] Cleanup expired tokens

- [ ] `tests/modules/auth/auth.service.test.ts`
  - [ ] Successful login returns tokens and user profile
  - [ ] Invalid password returns 401 and increments attempts
  - [ ] Locked account returns 423
  - [ ] Refresh with valid token returns new tokens
  - [ ] Logout invalidates session
  - [ ] getMe returns current user profile

- [ ] `tests/modules/auth/auth.controller.test.ts`
  - [ ] POST /login with valid credentials -> 200
  - [ ] POST /login with invalid credentials -> 401
  - [ ] POST /login with locked account -> 423
  - [ ] POST /refresh with valid token -> 200
  - [ ] POST /refresh with reused token -> 401
  - [ ] POST /logout -> 204
  - [ ] GET /me with valid JWT -> 200
  - [ ] GET /me without JWT -> 401

- [ ] `tests/modules/auth/auth.middleware.test.ts`
  - [ ] authenticate() passes valid JWT to next()
  - [ ] authenticate() rejects missing token -> 401
  - [ ] authenticate() rejects expired token -> 401
  - [ ] authorize(['admin']) passes admin user
  - [ ] authorize(['admin']) rejects developer user -> 403

- [ ] `tests/modules/users/users.service.test.ts`
  - [ ] Create user with valid data
  - [ ] Create user with duplicate email -> ConflictError
  - [ ] List users with pagination
  - [ ] Update user roles
  - [ ] Last-admin guard prevents removing last admin
  - [ ] Soft delete sets deleted_at

- [ ] `tests/modules/users/users.controller.test.ts`
  - [ ] POST /users as admin -> 201
  - [ ] POST /users as developer -> 403
  - [ ] GET /users as admin -> 200 (paginated)
  - [ ] PATCH /users/:id as admin -> 200
  - [ ] DELETE /users/:id as admin -> 204

- [ ] `tests/modules/connections/encryption.service.test.ts`
  - [ ] Encrypt and decrypt credentials round-trip
  - [ ] Different IV per encryption
  - [ ] OCI Vault error handling -> CONN_DECRYPT_FAILED

- [ ] `tests/modules/connections/connections.service.test.ts`
  - [ ] Create ORDS connection with successful test
  - [ ] Create JDBC connection with successful test
  - [ ] Create connection with failed test -> CONN_TEST_FAILED
  - [ ] List connections filtered by environment
  - [ ] Update connection re-encrypts credentials
  - [ ] Soft delete sets deleted_at and cancels health job
  - [ ] Test connection decrypts and tests
  - [ ] Change log appended on each mutation

- [ ] `tests/modules/connections/health-check.job.test.ts`
  - [ ] Health check updates status for each connection
  - [ ] Degraded status on high latency (>3000ms)
  - [ ] Disconnected after 3 consecutive failures
  - [ ] Status change emits event
  - [ ] Skips soft-deleted connections

- [ ] `tests/modules/connections/connections.controller.test.ts`
  - [ ] POST /connections as developer -> 201
  - [ ] POST /connections as auditor -> 403
  - [ ] GET /connections as any auth role -> 200
  - [ ] PATCH /connections/:id as admin -> 200
  - [ ] DELETE /connections/:id as admin -> 204
  - [ ] POST /connections/:id/test as developer -> 200
  - [ ] GET /connections/:id/health -> 200

---

### 8. Middleware Tests

- [ ] `tests/middleware/tenant-resolver.test.ts`
  - [ ] Sets app.current_tenant from JWT
  - [ ] Rejects missing tenantId -> 403

- [ ] `tests/middleware/rate-limiter.test.ts`
  - [ ] Allows requests under limit
  - [ ] Returns 429 when limit exceeded
  - [ ] Includes Retry-After header

- [ ] `tests/middleware/error-handler.test.ts`
  - [ ] Maps ForbiddenError to 403
  - [ ] Maps NotFoundError to 404
  - [ ] Maps unknown errors to 500 with safe message
  - [ ] Includes correlationId

- [ ] `tests/middleware/request-logger.test.ts`
  - [ ] Generates correlationId if not provided
  - [ ] Uses existing X-Correlation-ID header
  - [ ] Logs structured JSON

---

### 9. Integration Tests

- [ ] `tests/integration/auth.integration.test.ts`
  - [ ] Full login flow: create user, login, receive tokens, refresh, logout
  - [ ] Account lockout: 5 failed attempts, verify 423, wait 15 min (mock time), verify unlock
  - [ ] Refresh token family detection: use old token after rotation, verify family invalidation
  - [ ] JWT expiry and refresh cycle

- [ ] `tests/integration/connections.integration.test.ts`
  - [ ] Full CRUD cycle: create ORDS connection, read, update, soft-delete
  - [ ] Full CRUD cycle: create JDBC connection, read, update, soft-delete
  - [ ] Connection test with mock ORDS/JDBC endpoints
  - [ ] Health check job execution with mock targets
  - [ ] Change log verification across mutations

- [ ] `tests/integration/tenant-isolation.test.ts`
  - [ ] Create users in Tenant A and Tenant B
  - [ ] Verify Tenant A cannot read Tenant B users
  - [ ] Verify Tenant A cannot read Tenant B connections
  - [ ] Verify audit events are tenant-scoped
  - [ ] Verify RLS policies prevent cross-tenant access even with direct SQL

---

### 10. API Route Registration

- [ ] `src/routes/index.ts`
  - [ ] Mount auth routes at `/api/v1/auth`
  - [ ] Mount users routes at `/api/v1/users`
  - [ ] Mount connections routes at `/api/v1/connections`
  - [ ] Apply global middleware: requestLogger, rateLimiter, errorHandler

---

## File Summary

| Category | File Count |
|----------|------------|
| Database migrations | 3 |
| Shared types | 3 |
| Auth module | 7 |
| Users module | 3 |
| Connections module | 7 |
| Shared middleware | 4 |
| Unit tests | 12 |
| Integration tests | 3 |
| Route registration | 1 |
| **Total** | **43** |

---

## Execution Order

The plan should be executed in the following order to respect dependencies:

1. Database migrations (008, 009, 010) -- schema must exist before service code
2. Shared types -- interfaces used by all modules
3. Shared middleware (error-handler, request-logger) -- used by all controllers
4. Auth module (password.service -> token.service -> auth.service -> auth.middleware -> auth.controller)
5. Shared middleware (tenant-resolver, rate-limiter) -- depends on auth middleware
6. Users module (users.service -> users.controller)
7. Connections module (encryption.service -> ords.client + jdbc.client -> health-check.job -> connections.service -> connections.controller)
8. Route registration
9. Unit tests (parallel per module)
10. Integration tests (sequential, requires running DB + Redis)
