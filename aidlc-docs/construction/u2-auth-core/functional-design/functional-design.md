# Functional Design -- U2: Auth & Core Backend

## Document Information

| Field | Value |
|-------|-------|
| **Unit** | U2 -- Auth and Core Backend |
| **Sprint** | S1 (Fase 1) |
| **Duration** | 2 weeks (Weeks 4-5) |
| **Modules** | M0 (Authentication & Session Management), M1 Backend (Connection Manager) |
| **Stories** | US-003, US-004, US-005, US-006, US-007 |
| **Components** | C01 (partial), C02, C03, C04, C25 (partial) |
| **Status** | AI-DLC Generated -- For Review |
| **Date** | 2026-04-10 |

---

## 1. M0 -- Authentication & Session Management

### 1.1 Login Flow

The login flow handles credential verification, account lockout enforcement, JWT issuance, and refresh token generation. All login attempts are logged as audit events regardless of outcome.

#### Sequence Diagram

```
Client              API Gateway         Auth Service         PostgreSQL          Redis
  |                     |                    |                    |                 |
  |-- POST /auth/login ->|                    |                    |                 |
  |                     |-- validate req ---->|                    |                 |
  |                     |                    |-- find user ------->|                 |
  |                     |                    |<-- user row --------|                 |
  |                     |                    |                    |                 |
  |                     |                    |-- check lockout --->|                 |
  |                     |                    |<-- lockout status --|                 |
  |                     |                    |                    |                 |
  |                     |                    |  [IF locked]        |                 |
  |                     |<-- 423 Locked -----|                    |                 |
  |<-- 423 ------------|                    |                    |                 |
  |                     |                    |                    |                 |
  |                     |                    |  [IF not locked]    |                 |
  |                     |                    |-- bcrypt.compare -->|                 |
  |                     |                    |                    |                 |
  |                     |                    |  [IF password wrong]|                 |
  |                     |                    |-- incr attempts --->|                 |
  |                     |                    |-- log failed ------>|                 |
  |                     |<-- 401 Unauthorized-|                    |                 |
  |<-- 401 ------------|                    |                    |                 |
  |                     |                    |                    |                 |
  |                     |                    |  [IF password OK]   |                 |
  |                     |                    |-- reset attempts -->|                 |
  |                     |                    |-- gen JWT --------->|  (sign RS256)   |
  |                     |                    |-- gen refresh ------>|                 |
  |                     |                    |-- store session --->|---------------->|
  |                     |                    |-- log success ----->|                 |
  |                     |<-- AuthResponse ---|                    |                 |
  |<-- 200 + tokens ---|                    |                    |                 |
```

#### Login Request Validation (Zod)

```typescript
const LoginSchema = z.object({
  email: z.string().email().max(255),
  password: z.string().min(8).max(128),
  tenantId: z.string().uuid(),
  mfaCode: z.string().length(6).optional(),
});
```

#### Login Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| AUTH-R01 | Password verification | bcrypt compare with 12-round hash |
| AUTH-R02 | Account lockout | Lock after 5 consecutive failed attempts |
| AUTH-R03 | Lockout duration | 15 minutes from last failed attempt |
| AUTH-R04 | JWT lifetime | Access token expires in 15 minutes |
| AUTH-R05 | Refresh token lifetime | 7 days, rotated on each use |
| AUTH-R06 | JWT algorithm | RS256 (asymmetric) |
| AUTH-R07 | JWT claims | sub, tenantId, roles, permissions, iat, exp |
| AUTH-R08 | Session storage | Redis with TTL matching refresh token |
| AUTH-R09 | Audit logging | Every login attempt logged with IP, user-agent, outcome |
| AUTH-R10 | Multi-tenant | tenantId is mandatory; user must belong to tenant |

---

### 1.2 Token Refresh Flow with Family Detection

Refresh tokens use a rotation strategy with family-based reuse detection. Each refresh token belongs to a "family" (the original login session). If a previously-used refresh token is presented, the entire family is invalidated (potential token theft).

#### Sequence Diagram

```
Client              API Gateway         Token Service        PostgreSQL          Redis
  |                     |                    |                    |                 |
  |-- POST /auth/refresh ->                  |                    |                 |
  |                     |-- forward -------->|                    |                 |
  |                     |                    |-- lookup token --->|                 |
  |                     |                    |<-- token row ------|                 |
  |                     |                    |                    |                 |
  |                     |                    |  [IF token not found]               |
  |                     |<-- 401 Invalid ----|                    |                 |
  |<-- 401 ------------|                    |                    |                 |
  |                     |                    |                    |                 |
  |                     |                    |  [IF token already used]            |
  |                     |                    |-- ALERT: reuse! -->|                 |
  |                     |                    |-- invalidate ------>|                 |
  |                     |                    |   entire family    |                 |
  |                     |                    |-- clear sessions ->|---------------->|
  |                     |                    |-- log security --->|                 |
  |                     |<-- 401 + forced    |                    |                 |
  |                     |   re-auth          |                    |                 |
  |<-- 401 ------------|                    |                    |                 |
  |                     |                    |                    |                 |
  |                     |                    |  [IF token valid & unused]          |
  |                     |                    |-- mark old used -->|                 |
  |                     |                    |-- gen new refresh ->|                |
  |                     |                    |-- gen new JWT ----->|  (sign RS256)  |
  |                     |                    |-- update session ->|---------------->|
  |                     |<-- new tokens -----|                    |                 |
  |<-- 200 + tokens ---|                    |                    |                 |
```

#### Refresh Token Data Model

```
refresh_tokens
  id              UUID PK
  token_hash      VARCHAR(64)       -- SHA-256 of the token (never store raw)
  user_id         UUID FK -> users
  tenant_id       UUID FK -> tenants
  family_id       UUID              -- groups tokens from same login session
  is_used         BOOLEAN DEFAULT FALSE
  used_at         TIMESTAMP
  expires_at      TIMESTAMP         -- login time + 7 days
  created_at      TIMESTAMP
  replaced_by     UUID FK -> refresh_tokens  -- chain tracking
```

#### Family Detection Rules

| Rule ID | Rule | Action |
|---------|------|--------|
| TKN-R01 | Valid unused token | Mark as used, issue new token in same family |
| TKN-R02 | Previously-used token (reuse) | Invalidate ALL tokens in the family |
| TKN-R03 | Expired token | Return 401, require re-authentication |
| TKN-R04 | Unknown token hash | Return 401, log suspicious activity |
| TKN-R05 | Family invalidation | Delete all Redis sessions for affected user |
| TKN-R06 | Token chain depth | Max 672 rotations per family (7 days / 15 min) |

---

### 1.3 Account Lockout Flow

```
                    Auth Service                 PostgreSQL
                         |                           |
   login attempt ------->|                           |
                         |-- SELECT failed_attempts ->|
                         |<-- { count, locked_until } |
                         |                           |
                    [IF locked_until > NOW()]        |
                         |-- return 423 Locked        |
                         |   (include retry_after)    |
                         |                           |
                    [IF count >= 5 AND locked_until <= NOW()]
                         |-- reset counter ---------->|
                         |   (lockout expired)        |
                         |                           |
                    [IF password wrong]               |
                         |-- UPDATE failed_attempts +1|
                         |                           |
                    [IF failed_attempts == 5]         |
                         |-- SET locked_until -------->|
                         |   = NOW() + 15 min         |
                         |-- emit ACCOUNT_LOCKED ----->|  (event bus)
                         |-- log lockout event ------->|
                         |-- return 423 Locked         |
                         |                           |
                    [IF password correct]             |
                         |-- reset counter to 0 ----->|
                         |-- clear locked_until ------>|
                         |-- proceed with login        |
```

#### Lockout Rules

| Rule ID | Rule | Value |
|---------|------|-------|
| LOCK-R01 | Max failed attempts | 5 consecutive |
| LOCK-R02 | Lockout duration | 15 minutes |
| LOCK-R03 | Counter reset | On successful login |
| LOCK-R04 | Lockout scope | Per user, not per tenant |
| LOCK-R05 | Admin override | Admin can manually unlock via `unlockAccount(userId)` |
| LOCK-R06 | Notification | Emit `ACCOUNT_LOCKED` event for notification service |

---

### 1.4 User Management (Admin Only)

User CRUD operations are restricted to users with the `admin` role. All mutations are logged as audit events.

#### Endpoints

| Method | Path | Auth | Description |
|--------|------|------|-------------|
| POST | `/api/v1/users` | admin | Create user with role assignment |
| GET | `/api/v1/users` | admin | List users in tenant (paginated) |
| GET | `/api/v1/users/:id` | admin, self | Get user profile |
| PATCH | `/api/v1/users/:id` | admin | Update user roles, status, display name |
| DELETE | `/api/v1/users/:id` | admin | Soft-delete user (deactivate) |
| POST | `/api/v1/users/:id/unlock` | admin | Unlock locked account |
| POST | `/api/v1/users/invite` | admin | Send invitation email |

#### Create User Validation

```typescript
const CreateUserSchema = z.object({
  email: z.string().email().max(255),
  displayName: z.string().min(2).max(100),
  roles: z.array(z.enum([
    'admin', 'developer', 'tech_lead', 'release_manager',
    'knowledge_editor', 'marketplace_publisher', 'qa_analyst',
    'devops_engineer', 'auditor'
  ])).min(1).max(9),
  password: z.string().min(12).max(128)
    .regex(/[A-Z]/, 'Must contain uppercase')
    .regex(/[a-z]/, 'Must contain lowercase')
    .regex(/[0-9]/, 'Must contain digit')
    .regex(/[^A-Za-z0-9]/, 'Must contain special character'),
});
```

#### Update User Validation

```typescript
const UpdateUserSchema = z.object({
  displayName: z.string().min(2).max(100).optional(),
  roles: z.array(z.enum([
    'admin', 'developer', 'tech_lead', 'release_manager',
    'knowledge_editor', 'marketplace_publisher', 'qa_analyst',
    'devops_engineer', 'auditor'
  ])).min(1).max(9).optional(),
  isActive: z.boolean().optional(),
});
```

#### User Data Model

```
users
  id              UUID PK DEFAULT gen_random_uuid()
  tenant_id       UUID FK -> tenants NOT NULL
  email           VARCHAR(255) NOT NULL
  password_hash   VARCHAR(60) NOT NULL          -- bcrypt, 60 chars
  name            VARCHAR(100) NOT NULL
  role            VARCHAR(50) NOT NULL          -- single role per user: admin|developer|tech_lead|release_manager|knowledge_editor|marketplace_publisher|qa_analyst|devops_engineer|auditor
  is_active       BOOLEAN DEFAULT TRUE
  failed_attempts INTEGER DEFAULT 0
  locked_until    TIMESTAMP
  last_login_at   TIMESTAMP
  created_at      TIMESTAMP DEFAULT NOW()
  updated_at      TIMESTAMP DEFAULT NOW()
  deleted_at      TIMESTAMP                      -- soft delete

  UNIQUE(tenant_id, email)
```

#### User Business Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| USR-R01 | Email uniqueness | Unique per tenant (same email can exist in different tenants) |
| USR-R02 | Min password strength | 12 chars, uppercase, lowercase, digit, special |
| USR-R03 | Soft delete | Set `deleted_at`, never physically remove |
| USR-R04 | Role assignment | Only admin can assign roles; at least 1 role required |
| USR-R05 | Self-service | Users can update own `displayName` and password only |
| USR-R06 | Last admin guard | Cannot remove admin role if user is the last admin in tenant |
| USR-R07 | RLS enforcement | All queries filtered by `tenant_id = current_setting('app.current_tenant')` |

---

### 1.5 RBAC Enforcement Middleware

#### Role-Permission Matrix

| Permission | admin | developer | tech_lead | release_manager | knowledge_editor | marketplace_publisher | qa_analyst | devops_engineer | auditor |
|------------|:-----:|:---------:|:---------:|:---------------:|:----------------:|:---------------------:|:----------:|:---------------:|:-------:|
| users:create | X | | | | | | | | |
| users:read | X | | X | | | | | | X |
| users:update | X | | | | | | | | |
| users:delete | X | | | | | | | | |
| auth:manage | X | | | | | | | | |
| connections:create | X | X | X | | | | | X | |
| connections:read | X | X | X | X | | | X | X | X |
| connections:update | X | | X | | | | | X | |
| connections:delete | X | | | | | | | X | |
| connections:test | X | X | X | | | | X | X | |
| audit:read | X | | | | | | | | X |
| audit:export | X | | | | | | | | X |

#### Middleware Chain

```
Request
  |
  v
[1. Rate Limiter] -- 429 if exceeded
  |
  v
[2. JWT Verification] -- 401 if invalid/expired
  |
  v
[3. Tenant Resolver] -- Sets app.current_tenant on DB connection
  |
  v
[4. RBAC Check] -- 403 if role lacks permission
  |
  v
[5. Request Validation] -- 400 if body/params invalid
  |
  v
[6. Route Handler]
  |
  v
[7. Response Serialization]
  |
  v
[8. Audit Logging] -- async, non-blocking
```

#### RBAC Middleware Implementation Pattern

```typescript
// Usage in route definition
router.post('/users',
  authenticate(),              // step 2: JWT verification
  tenantScope(),               // step 3: tenant context
  authorize(['admin']),        // step 4: RBAC check
  validate(CreateUserSchema),  // step 5: request validation
  usersController.create       // step 6: handler
);

// authorize factory
function authorize(requiredRoles: Role[]): RequestHandler {
  return (req, res, next) => {
    const userRoles = req.user.roles;
    const hasRole = requiredRoles.some(r => userRoles.includes(r));
    if (!hasRole) {
      throw new ForbiddenError('Insufficient permissions');
    }
    next();
  };
}
```

---

### 1.6 Password Hashing

| Parameter | Value |
|-----------|-------|
| Algorithm | bcrypt |
| Salt rounds | 12 |
| Max input length | 72 bytes (bcrypt limit) |
| Pre-hash | SHA-256 for inputs > 72 bytes, then bcrypt the hash |

---

### 1.7 Session Management

Sessions are stored in Redis for fast lookup and automatic expiration.

#### Session Data Structure (Redis)

```
Key:    session:{sessionId}
Value:  JSON {
  userId: string,
  tenantId: string,
  roles: string[],
  familyId: string,        // refresh token family
  createdAt: number,       // epoch ms
  lastActivity: number,    // epoch ms
  ipAddress: string,
  userAgent: string
}
TTL:    604800 (7 days, matching refresh token lifetime)
```

#### Session Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| SES-R01 | Creation | On successful login |
| SES-R02 | Refresh | TTL reset on each token refresh |
| SES-R03 | Invalidation | On logout, account lock, or family invalidation |
| SES-R04 | Concurrent sessions | Max 5 per user (oldest evicted) |
| SES-R05 | Activity tracking | `lastActivity` updated on each API call |

---

## 2. M1 -- Connection Manager (Backend)

### 2.1 Connection Registration Flow

#### Sequence Diagram -- ORDS Connection

```
Client              API Gateway         Connection Service   Encryption Service   PostgreSQL     OCI Vault
  |                     |                    |                    |                  |               |
  |-- POST /connections ->                   |                    |                  |               |
  |   { type: "ords",   |                    |                    |                  |               |
  |     ordsBaseUrl,     |                    |                    |                  |               |
  |     schema,          |                    |                    |                  |               |
  |     credentials }    |                    |                    |                  |               |
  |                     |-- validate + auth ->|                    |                  |               |
  |                     |                    |-- encrypt creds --->|                  |               |
  |                     |                    |                    |-- get DEK ------->|-------------->|
  |                     |                    |                    |<-- DEK ----------|<--------------|
  |                     |                    |                    |-- AES-256-GCM -->|               |
  |                     |                    |<-- encrypted blob --|                  |               |
  |                     |                    |                    |                  |               |
  |                     |                    |-- test connection ->|  (ORDS client)   |               |
  |                     |                    |   GET {ordsUrl}/_/  |                  |               |
  |                     |                    |   catalog           |                  |               |
  |                     |                    |<-- APEX version ----|                  |               |
  |                     |                    |                    |                  |               |
  |                     |                    |-- INSERT connection |---------------->|               |
  |                     |                    |<-- connection id --|                  |               |
  |                     |                    |                    |                  |               |
  |                     |                    |-- schedule health ->|  (Bull queue)    |               |
  |                     |                    |-- log audit ------->|---------------->|               |
  |                     |<-- 201 Created ----|                    |                  |               |
  |<-- 201 + connId ---|                    |                    |                  |               |
```

#### Sequence Diagram -- JDBC Connection

```
Client              API Gateway         Connection Service   Encryption Service   PostgreSQL     OCI Vault
  |                     |                    |                    |                  |               |
  |-- POST /connections ->                   |                    |                  |               |
  |   { type: "jdbc",   |                    |                    |                  |               |
  |     host, port,      |                    |                    |                  |               |
  |     serviceName,     |                    |                    |                  |               |
  |     schema,          |                    |                    |                  |               |
  |     credentials }    |                    |                    |                  |               |
  |                     |-- validate + auth ->|                    |                  |               |
  |                     |                    |-- encrypt creds --->|                  |               |
  |                     |                    |                    |-- get DEK ------->|-------------->|
  |                     |                    |                    |<-- DEK ----------|<--------------|
  |                     |                    |                    |-- AES-256-GCM -->|               |
  |                     |                    |<-- encrypted blob --|                  |               |
  |                     |                    |                    |                  |               |
  |                     |                    |-- test connection ->|  (node-oracledb) |               |
  |                     |                    |   oracledb.getConn  |                  |               |
  |                     |                    |   (host:port/svc)   |                  |               |
  |                     |                    |<-- server version --|                  |               |
  |                     |                    |                    |                  |               |
  |                     |                    |-- INSERT connection |---------------->|               |
  |                     |                    |<-- connection id --|                  |               |
  |                     |                    |                    |                  |               |
  |                     |                    |-- schedule health ->|  (Bull queue)    |               |
  |                     |                    |-- log audit ------->|---------------->|               |
  |                     |<-- 201 Created ----|                    |                  |               |
  |<-- 201 + connId ---|                    |                    |                  |               |
```

#### Connection Registration Validation

```typescript
const CreateConnectionSchema = z.discriminatedUnion('type', [
  z.object({
    type: z.literal('ords'),
    name: z.string().min(3).max(100),
    ordsBaseUrl: z.string().url().max(500),
    schema: z.string().min(1).max(128),
    workspaceName: z.string().min(1).max(128),
    environment: z.enum(['dev', 'test', 'staging', 'prod']),
    credentials: z.object({
      username: z.string().min(1).max(128),
      password: z.string().min(1).max(256),
    }),
    tags: z.array(z.string().max(50)).max(10).optional(),
    labels: z.record(z.string().max(50), z.string().max(100)).optional(),
  }),
  z.object({
    type: z.literal('jdbc'),
    name: z.string().min(3).max(100),
    host: z.string().min(1).max(255),
    port: z.number().int().min(1).max(65535),
    serviceName: z.string().min(1).max(128),
    schema: z.string().min(1).max(128),
    workspaceName: z.string().min(1).max(128),
    environment: z.enum(['dev', 'test', 'staging', 'prod']),
    credentials: z.object({
      username: z.string().min(1).max(128),
      password: z.string().min(1).max(256),
    }),
    poolMin: z.number().int().min(0).max(5).default(1),
    poolMax: z.number().int().min(1).max(5).default(5),
    poolIncrement: z.number().int().min(1).max(2).default(1),
    tags: z.array(z.string().max(50)).max(10).optional(),
    labels: z.record(z.string().max(50), z.string().max(100)).optional(),
  }),
]);
```

---

### 2.2 Credential Encryption Flow

All connection credentials are encrypted at rest using envelope encryption with OCI Vault.

#### Envelope Encryption Architecture

```
+-------------------------------+
|         OCI Vault             |
|  +-------------------------+  |
|  | Master Key (CMK)        |  |
|  | - AES-256               |  |
|  | - OCID reference        |  |
|  | - Auto-rotated 90 days  |  |
|  +-------------------------+  |
|            |                   |
|    Encrypt/Decrypt DEK        |
|            |                   |
+-------------------------------+
             |
             v
+-------------------------------+
|    Encryption Service         |
|  +-------------------------+  |
|  | Data Encryption Key     |  |
|  | (DEK)                   |  |
|  | - Generated per tenant  |  |
|  | - Encrypted by CMK      |  |
|  | - Stored alongside data |  |
|  +-------------------------+  |
|            |                   |
|    AES-256-GCM encrypt        |
|            |                   |
+-------------------------------+
             |
             v
+-------------------------------+
|    PostgreSQL Storage         |
|  +-------------------------+  |
|  | encrypted_credentials   |  |
|  | (JSONB):                |  |
|  |   encrypted_dek: bytes  |  |
|  |   iv: bytes             |  |
|  |   ciphertext: bytes     |  |
|  |   auth_tag: bytes       |  |
|  |   algorithm: string     |  |
|  +-------------------------+  |
+-------------------------------+
```

#### Encryption Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| ENC-R01 | Algorithm | AES-256-GCM (authenticated encryption) |
| ENC-R02 | IV | 12 bytes, cryptographically random, unique per encryption |
| ENC-R03 | DEK lifetime | One DEK per tenant, rotated when CMK rotates |
| ENC-R04 | DEK storage | Encrypted DEK stored alongside ciphertext |
| ENC-R05 | CMK rotation | OCI Vault auto-rotation every 90 days |
| ENC-R06 | Plaintext credentials | Never stored, never logged, never returned in API responses |
| ENC-R07 | Decryption | Only at connection-test time and health-check time; result immediately discarded |

---

### 2.3 Health Check Scheduling

Connection health checks run as a Bull queue job every 5 minutes.

#### Health Check Flow

```
Bull Scheduler (Redis)          Connection Service         Target DB/ORDS       PostgreSQL
       |                              |                         |                   |
  [every 5 min] ------------------>   |                         |                   |
       |                              |-- list active conns --->|------------------>|
       |                              |<-- connections[] -------|                   |
       |                              |                         |                   |
       |                     [for each connection]              |                   |
       |                              |-- decrypt creds ------->|                   |
       |                              |-- test connectivity --->|                   |
       |                              |   (ORDS: GET /_/catalog)|                   |
       |                              |   (JDBC: SELECT 1)      |                   |
       |                              |<-- result + latency ----|                   |
       |                              |                         |                   |
       |                              |-- UPDATE status ------->|------------------>|
       |                              |   { status, latency,    |                   |
       |                              |     last_check_at,      |                   |
       |                              |     error_message }     |                   |
       |                              |                         |                   |
       |                     [IF status changed]                |                   |
       |                              |-- emit event ---------->|  (event bus)      |
       |                              |   CONNECTION_STATUS_     |                   |
       |                              |   CHANGED               |                   |
       |                              |                         |                   |
       |                     [IF latency > threshold]           |                   |
       |                              |-- mark DEGRADED ------->|------------------>|
       |                              |-- emit event ---------->|  (event bus)      |
       |                              |   CONNECTION_DEGRADED    |                   |
```

#### Health Check Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| HC-R01 | Interval | Every 5 minutes (configurable per connection) |
| HC-R02 | Timeout | 10 seconds per connection test |
| HC-R03 | Status values | `connected`, `degraded`, `disconnected`, `unknown` |
| HC-R04 | Degraded threshold | Latency > 3000ms |
| HC-R05 | Disconnected | 3 consecutive failed checks |
| HC-R06 | Concurrency | Max 10 health checks in parallel (Bull concurrency) |
| HC-R07 | Retry | Failed check retried once after 30 seconds |
| HC-R08 | Disabled connections | Skip soft-deleted and manually disabled connections |

---

### 2.4 Connection Test Flow

On-demand connection test triggered by user action (separate from scheduled health check).

#### Endpoints

| Method | Path | Auth | Description |
|--------|------|------|-------------|
| POST | `/api/v1/connections` | admin, developer, tech_lead, devops_engineer | Register connection |
| GET | `/api/v1/connections` | all authenticated roles | List connections in tenant |
| GET | `/api/v1/connections/:id` | all authenticated roles | Get connection detail |
| PATCH | `/api/v1/connections/:id` | admin, tech_lead, devops_engineer | Update connection |
| DELETE | `/api/v1/connections/:id` | admin, devops_engineer | Soft-delete connection |
| POST | `/api/v1/connections/:id/test` | admin, developer, tech_lead, qa_analyst, devops_engineer | Test connectivity |
| GET | `/api/v1/connections/:id/health` | all authenticated roles | Get latest health status |
| GET | `/api/v1/connections/:id/health/history` | admin, devops_engineer, auditor | Health history (30 days) |

#### Test Connection Response

```typescript
interface TestResult {
  success: boolean;
  latencyMs: number;
  serverVersion: string;      // e.g., "Oracle Database 19c"
  apexVersion?: string;       // e.g., "23.2" (ORDS only)
  connectionType: 'ords' | 'jdbc';
  timestamp: string;          // ISO 8601
  error?: {
    code: string;
    message: string;           // sanitized, no credentials
  };
}
```

---

### 2.5 Soft Delete and Change Log Preservation

Connections use soft delete to preserve audit history and change_log integrity.

#### Soft Delete Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| DEL-R01 | Mechanism | Set `deleted_at = NOW()`, `is_active = FALSE` |
| DEL-R02 | Query filtering | Default queries exclude `deleted_at IS NOT NULL` |
| DEL-R03 | Change log | All mutations append to `change_log` JSONB array |
| DEL-R04 | Cascade | Health check jobs cancelled for soft-deleted connections |
| DEL-R05 | Admin restore | Admin can restore by setting `deleted_at = NULL` |
| DEL-R06 | Hard delete | Never; credentials purged after 90 days via scheduled job |
| DEL-R07 | RLS | Soft-deleted records still scoped to tenant |

#### Change Log Entry Format

```typescript
interface ChangeLogEntry {
  timestamp: string;          // ISO 8601
  userId: string;             // who made the change
  action: 'created' | 'updated' | 'deleted' | 'restored' | 'tested' | 'credentials_rotated';
  changes: Record<string, { old: any; new: any }>;  // field-level diff
  ipAddress: string;
}
```

---

### 2.6 Tag and Label Management

Connections support free-form tags and key-value labels for organization.

#### Rules

| Rule ID | Rule | Details |
|---------|------|---------|
| TAG-R01 | Tags | Array of strings, max 10 per connection, max 50 chars each |
| TAG-R02 | Labels | Key-value pairs, max 20 per connection |
| TAG-R03 | Label keys | Max 50 chars, alphanumeric + hyphens + underscores |
| TAG-R04 | Label values | Max 100 chars, any printable characters |
| TAG-R05 | Search | Connections searchable by tag and label key/value |
| TAG-R06 | Tenant scope | Tags and labels scoped to tenant via RLS |

---

### 2.7 Connection Data Model

```
connections
  id                      UUID PK DEFAULT gen_random_uuid()
  tenant_id               UUID FK -> tenants NOT NULL
  name                    VARCHAR(100) NOT NULL
  type                    VARCHAR(10) NOT NULL CHECK (type IN ('ords', 'jdbc'))
  environment             VARCHAR(10) NOT NULL CHECK (environment IN ('dev','test','staging','prod'))

  -- ORDS-specific
  ords_base_url           VARCHAR(500)

  -- JDBC-specific
  host                    VARCHAR(255)
  port                    INTEGER
  service_name            VARCHAR(128)
  pool_min                INTEGER DEFAULT 1
  pool_max                INTEGER DEFAULT 5
  pool_increment          INTEGER DEFAULT 1

  -- Common
  schema_name             VARCHAR(128) NOT NULL
  workspace_name          VARCHAR(128) NOT NULL
  encrypted_credentials   JSONB NOT NULL          -- envelope-encrypted blob

  -- Status
  status                  VARCHAR(20) DEFAULT 'unknown'
                          CHECK (status IN ('connected','degraded','disconnected','unknown'))
  last_check_at           TIMESTAMP
  last_latency_ms         INTEGER
  last_error              TEXT
  consecutive_failures    INTEGER DEFAULT 0

  -- Organization
  tags                    TEXT[] DEFAULT '{}'
  labels                  JSONB DEFAULT '{}'

  -- Audit
  change_log              JSONB DEFAULT '[]'
  is_active               BOOLEAN DEFAULT TRUE
  created_by              UUID FK -> users
  created_at              TIMESTAMP DEFAULT NOW()
  updated_at              TIMESTAMP DEFAULT NOW()
  deleted_at              TIMESTAMP                -- soft delete

  UNIQUE(tenant_id, name)
```

---

## 3. Database Migrations

### 3.1 Migration 002: Users and Auth

Tables created:
- `users` -- with RLS policy on `tenant_id`
- `refresh_tokens` -- with RLS policy on `tenant_id`

RLS Policies:
```sql
-- users: tenant isolation
CREATE POLICY users_tenant_isolation ON users
  USING (tenant_id::text = current_setting('app.current_tenant', true));

-- refresh_tokens: tenant isolation
CREATE POLICY refresh_tokens_tenant_isolation ON refresh_tokens
  USING (tenant_id::text = current_setting('app.current_tenant', true));
```

### 3.2 Migration 003: Connections

Tables created:
- `connections` -- with RLS policy on `tenant_id`

RLS Policies:
```sql
CREATE POLICY connections_tenant_isolation ON connections
  USING (tenant_id::text = current_setting('app.current_tenant', true));
```

### 3.3 Migration 004: Audit Events

Tables created:
- `audit_events` -- append-only, no UPDATE or DELETE policies

```
audit_events
  id              UUID PK DEFAULT gen_random_uuid()
  tenant_id       UUID FK -> tenants NOT NULL
  user_id         UUID FK -> users
  event_type      VARCHAR(50) NOT NULL
  resource_type   VARCHAR(50) NOT NULL
  resource_id     UUID
  action          VARCHAR(50) NOT NULL
  details         JSONB DEFAULT '{}'
  ip_address      INET
  user_agent      TEXT
  correlation_id  UUID
  created_at      TIMESTAMP DEFAULT NOW()
```

RLS Policy:
```sql
-- Read-only tenant isolation (no UPDATE, no DELETE)
CREATE POLICY audit_events_tenant_read ON audit_events
  FOR SELECT USING (tenant_id::text = current_setting('app.current_tenant', true));

CREATE POLICY audit_events_tenant_insert ON audit_events
  FOR INSERT WITH CHECK (tenant_id::text = current_setting('app.current_tenant', true));

-- No UPDATE or DELETE policies = effectively append-only via RLS
```

---

## 4. Error Codes

| Code | HTTP | Description |
|------|------|-------------|
| AUTH_INVALID_CREDENTIALS | 401 | Email or password incorrect |
| AUTH_TOKEN_EXPIRED | 401 | JWT has expired |
| AUTH_TOKEN_INVALID | 401 | JWT signature verification failed |
| AUTH_REFRESH_INVALID | 401 | Refresh token not found or expired |
| AUTH_REFRESH_REUSED | 401 | Refresh token reuse detected, family invalidated |
| AUTH_ACCOUNT_LOCKED | 423 | Account locked due to failed attempts |
| AUTH_FORBIDDEN | 403 | User lacks required role/permission |
| AUTH_TENANT_MISMATCH | 403 | User does not belong to requested tenant |
| USER_NOT_FOUND | 404 | User ID does not exist |
| USER_EMAIL_EXISTS | 409 | Email already registered in this tenant |
| USER_LAST_ADMIN | 409 | Cannot remove admin role from last admin |
| CONN_NOT_FOUND | 404 | Connection ID does not exist |
| CONN_NAME_EXISTS | 409 | Connection name already exists in tenant |
| CONN_TEST_FAILED | 422 | Connection test failed (details in response) |
| CONN_ORDS_UNREACHABLE | 502 | ORDS endpoint unreachable |
| CONN_JDBC_UNREACHABLE | 502 | Oracle DB host unreachable |
| CONN_DECRYPT_FAILED | 500 | Failed to decrypt credentials (vault error) |
| CONN_POOL_EXHAUSTED | 503 | Connection pool limit reached |
| RATE_LIMIT_EXCEEDED | 429 | Request rate limit exceeded |
| VALIDATION_ERROR | 400 | Request body validation failed (Zod errors) |
| INTERNAL_ERROR | 500 | Unexpected server error (details hidden) |

---

## 5. Data Flow Summary

### Authentication Data Flow

```
[Browser] --HTTPS--> [API Gateway :3000]
                        |
                   [Rate Limiter]
                        |
                   [Auth Controller]
                        |
            +-----------+-----------+
            |                       |
     [Auth Service]          [Token Service]
            |                       |
     [Password Service]      [Redis Sessions]
            |                       |
     [PostgreSQL users]      [PostgreSQL refresh_tokens]
            |
     [Audit Events]
```

### Connection Manager Data Flow

```
[Browser] --HTTPS--> [API Gateway :3000]
                        |
                   [Auth Middleware]
                        |
                   [Tenant Resolver]
                        |
                   [Connection Controller]
                        |
            +-----------+-----------+-----------+
            |           |           |           |
     [Connection   [Encryption   [ORDS       [JDBC
      Service]      Service]     Client]     Client]
            |           |           |           |
     [PostgreSQL] [OCI Vault]  [ORDS REST]  [Oracle DB]
            |
     [Bull Queue] --every 5 min--> [Health Check Job]
```

---

## 6. Cross-Cutting Concerns

### 6.1 Tenant Isolation via PostgreSQL RLS

Every table with `tenant_id` has Row-Level Security enabled. The tenant context is set per database connection:

```sql
SET app.current_tenant = '{tenant_id}';
```

The `tenant-resolver` middleware extracts `tenantId` from the JWT and injects it before any query executes.

### 6.2 Rate Limiting

| Scope | Limit | Window |
|-------|-------|--------|
| Per tenant | 1000 requests | 1 minute |
| Per user (login) | 10 attempts | 1 minute |
| Per IP (unauthenticated) | 30 requests | 1 minute |

Implementation: Redis-based sliding window counter via `rate-limiter-flexible`.

### 6.3 Request Logging

All requests are logged with a structured JSON format including:
- Correlation ID (UUID, passed in `X-Correlation-ID` header or generated)
- Timestamp, method, path, status code, duration
- Tenant ID, user ID (from JWT if available)
- Request body hash (never the actual body for security)

### 6.4 Error Response Format

```typescript
interface ErrorResponse {
  error: {
    code: string;           // machine-readable error code
    message: string;        // human-readable message (safe for display)
    details?: any;          // validation errors, field-level details
    correlationId: string;  // for support reference
  };
  status: number;
}
```
