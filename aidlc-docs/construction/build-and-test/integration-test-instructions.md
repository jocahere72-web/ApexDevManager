# Integration Test Instructions - APEX Dev Manager

## Overview

Integration tests verify the interaction between components, services, and external systems. They run against real PostgreSQL and Redis instances (via Testcontainers or Docker Compose).

| Aspect | Detail |
|--------|--------|
| Framework | Mocha + Chai + Supertest (API), Playwright (E2E) |
| Infrastructure | Testcontainers (PostgreSQL 16, Redis 7) |
| Run Command (API) | `pnpm --filter api test:integration` |
| Run Command (E2E) | `pnpm test:e2e` |
| Prerequisites | Docker running, ports 5432/6379 available |

## API Integration Tests (Supertest)

### Prerequisites

```bash
# Ensure Docker is running (Testcontainers will start PostgreSQL and Redis)
docker info

# Or start services manually
docker-compose up -d postgres redis

# Run integration tests
pnpm --filter api test:integration
```

### Test Structure

```
apps/api/
  tests/
    integration/
      setup.ts                     # Testcontainers setup, migrations, seed
      auth/
        auth.integration.test.ts
      connections/
        connections.integration.test.ts
      explorer/
        explorer.integration.test.ts
      changes/
        changes.integration.test.ts
      releases/
        releases.integration.test.ts
      ai/
        ai.integration.test.ts
      governance/
        governance.integration.test.ts
      tenants/
        tenant-isolation.integration.test.ts
      prd-builder/
        prd.integration.test.ts
      change-log/
        change-log.integration.test.ts
      notifications/
        notifications.integration.test.ts
      risk/
        risk.integration.test.ts
```

### Module-by-Module Integration Tests

#### Auth Module (U1)

**File**: `auth/auth.integration.test.ts`

| Test Case | Method | Endpoint | Expected |
|-----------|--------|----------|----------|
| Successful login with valid credentials | POST | `/api/auth/login` | 200, returns JWT + refresh token |
| Login with wrong password | POST | `/api/auth/login` | 401, error message |
| Account lockout after 5 failed attempts | POST | `/api/auth/login` | 429 on 6th attempt |
| Token refresh with valid refresh token | POST | `/api/auth/refresh` | 200, new JWT + new refresh token |
| Token refresh with revoked token | POST | `/api/auth/refresh` | 401, family revocation triggered |
| Token family revocation | POST | `/api/auth/refresh` | All tokens in family invalidated |
| Logout invalidates refresh token | POST | `/api/auth/logout` | 204, refresh token revoked |
| Access protected route without token | GET | `/api/connections` | 401 |
| Access protected route with expired token | GET | `/api/connections` | 401, token expired error |
| Role-based access control (developer cannot manage users) | GET | `/api/admin/users` | 403 |
| Role-based access control (admin can manage users) | GET | `/api/admin/users` | 200 |

#### Connections Module (U2)

**File**: `connections/connections.integration.test.ts`

| Test Case | Method | Endpoint | Expected |
|-----------|--------|----------|----------|
| Create connection | POST | `/api/connections` | 201, credentials encrypted in DB |
| List connections (tenant scoped) | GET | `/api/connections` | 200, only current tenant connections |
| Get connection by ID | GET | `/api/connections/:id` | 200, password field masked |
| Update connection | PUT | `/api/connections/:id` | 200, re-encrypts if password changed |
| Soft delete connection | DELETE | `/api/connections/:id` | 204, isDeleted=true, not removed from DB |
| Restore soft-deleted connection | POST | `/api/connections/:id/restore` | 200, isDeleted=false |
| Health check - healthy connection | GET | `/api/connections/:id/health` | 200, status: healthy |
| Health check - unreachable host | GET | `/api/connections/:id/health` | 200, status: unhealthy, error details |
| Health check result cached in Redis | GET | `/api/connections/:id/health` | Cached result returned within TTL |
| Duplicate connection name within tenant | POST | `/api/connections` | 409, conflict |

#### Explorer Module (U3)

**File**: `explorer/explorer.integration.test.ts`

| Test Case | Method | Endpoint | Expected |
|-----------|--------|----------|----------|
| Load schema tree root | GET | `/api/explorer/:connId/tree` | 200, top-level schema nodes |
| Load child nodes (lazy) | GET | `/api/explorer/:connId/tree/:nodeId/children` | 200, child objects |
| Search schema objects | GET | `/api/explorer/:connId/search?q=EMP` | 200, matching objects |
| Search with type filter | GET | `/api/explorer/:connId/search?q=EMP&type=TABLE` | 200, filtered results |
| Sync metadata | POST | `/api/explorer/:connId/sync` | 200, metadata refreshed |
| Offline mode - cached data | GET | `/api/explorer/:connId/tree` | 200, returns cached when DB unreachable |
| Object detail (table DDL) | GET | `/api/explorer/:connId/objects/:objectId` | 200, full DDL + metadata |

#### Changes Module (U4)

**File**: `changes/changes.integration.test.ts`

| Test Case | Method | Endpoint | Expected |
|-----------|--------|----------|----------|
| Apply DDL change | POST | `/api/changes` | 201, change recorded in log |
| Apply DML change | POST | `/api/changes` | 201, change recorded |
| Preview change (dry run) | POST | `/api/changes/preview` | 200, diff without applying |
| Rollback single change | POST | `/api/changes/:id/rollback` | 200, rollback DDL generated and applied |
| Rollback batch of changes | POST | `/api/changes/rollback` | 200, reversed in dependency order |
| View diff for change | GET | `/api/changes/:id/diff` | 200, before/after comparison |
| Export changes as SQL script | GET | `/api/changes/export?format=sql` | 200, downloadable SQL file |
| Export changes as JSON | GET | `/api/changes/export?format=json` | 200, structured JSON |
| Conflict detection (concurrent edit) | POST | `/api/changes` | 409, conflict details |

#### Releases Module (U5)

**File**: `releases/releases.integration.test.ts`

| Test Case | Method | Endpoint | Expected |
|-----------|--------|----------|----------|
| Create release | POST | `/api/releases` | 201, draft status |
| Add changes to release | POST | `/api/releases/:id/changes` | 200, changes linked |
| Submit release for approval | POST | `/api/releases/:id/submit` | 200, status: pending_approval |
| Approve release | POST | `/api/releases/:id/approve` | 200, approval recorded |
| Reject release | POST | `/api/releases/:id/reject` | 200, status: rejected, reason stored |
| Deploy release (all approvals met) | POST | `/api/releases/:id/deploy` | 200, pipeline initiated |
| Deploy release (missing approvals) | POST | `/api/releases/:id/deploy` | 403, insufficient approvals |
| Rollback release | POST | `/api/releases/:id/rollback` | 200, all changes reversed |
| Create hotfix release | POST | `/api/releases/hotfix` | 201, expedited pipeline |
| Release pipeline status | GET | `/api/releases/:id/pipeline` | 200, stage statuses |
| List releases with filters | GET | `/api/releases?status=deployed` | 200, filtered list |

#### AI Module (U7, U8)

**File**: `ai/ai.integration.test.ts`

| Test Case | Method | Endpoint | Expected |
|-----------|--------|----------|----------|
| Send chat message | POST | `/api/ai/chat` | 200, AI response with context |
| Chat with schema context | POST | `/api/ai/chat` | 200, response references actual schema objects |
| Apply AI suggestion | POST | `/api/ai/apply` | 200, change created from suggestion |
| Safety validation - blocks DROP TABLE | POST | `/api/ai/chat` | 200, response flagged as destructive |
| Safety validation - blocks TRUNCATE | POST | `/api/ai/apply` | 403, destructive operation blocked |
| Safety validation - allows safe ALTER | POST | `/api/ai/apply` | 200, change applied |
| Chat history persistence | GET | `/api/ai/chat/history` | 200, previous messages returned |
| Rate limiting on AI endpoints | POST | `/api/ai/chat` (burst) | 429 after limit exceeded |

#### PRD Builder Module (U9)

**File**: `prd-builder/prd.integration.test.ts`

| Test Case | Method | Endpoint | Expected |
|-----------|--------|----------|----------|
| Create PRD document | POST | `/api/prd` | 201, empty PRD created |
| Update PRD sections | PUT | `/api/prd/:id/sections` | 200, sections saved |
| Generate PRD content with AI | POST | `/api/prd/:id/generate` | 200, AI-assisted content |
| Export PRD as PDF | GET | `/api/prd/:id/export?format=pdf` | 200, PDF binary |
| Export PRD as Markdown | GET | `/api/prd/:id/export?format=md` | 200, Markdown content |
| Send PRD to M5 (Release Pipeline) | POST | `/api/prd/:id/send-to-release` | 200, linked to release |
| List PRDs with filters | GET | `/api/prd?status=draft` | 200, filtered list |
| PRD template CRUD | POST/GET/PUT/DELETE | `/api/prd/templates` | Standard CRUD responses |

#### Change Log Module (U6)

**File**: `change-log/change-log.integration.test.ts`

| Test Case | Method | Endpoint | Expected |
|-----------|--------|----------|----------|
| Query change log with pagination | GET | `/api/change-log?page=1&limit=20` | 200, paginated results |
| Filter by date range | GET | `/api/change-log?from=...&to=...` | 200, filtered entries |
| Filter by user | GET | `/api/change-log?userId=...` | 200, user-specific entries |
| Filter by object type | GET | `/api/change-log?objectType=TABLE` | 200, type-filtered entries |
| Composite filters | GET | `/api/change-log?userId=...&objectType=...&from=...` | 200, multi-filtered |
| Change log immutability (no update endpoint) | PUT | `/api/change-log/:id` | 405, method not allowed |
| Change log immutability (no delete endpoint) | DELETE | `/api/change-log/:id` | 405, method not allowed |

#### Risk Module (U10)

**File**: `risk/risk.integration.test.ts`

| Test Case | Method | Endpoint | Expected |
|-----------|--------|----------|----------|
| Impact analysis for table change | GET | `/api/risk/impact/:objectId` | 200, dependency graph |
| Impact analysis with 50+ dependencies | GET | `/api/risk/impact/:objectId` | 200, completes within 3s |
| Risk classification for change | POST | `/api/risk/classify` | 200, risk level + rationale |
| Risk classification - high risk (DROP) | POST | `/api/risk/classify` | 200, risk: critical |
| Risk classification - low risk (ADD COLUMN) | POST | `/api/risk/classify` | 200, risk: low |

#### Notifications Module (U11)

**File**: `notifications/notifications.integration.test.ts`

| Test Case | Method | Endpoint | Expected |
|-----------|--------|----------|----------|
| List user notifications | GET | `/api/notifications` | 200, user's notifications |
| Mark notification as read | PUT | `/api/notifications/:id/read` | 200 |
| Mark all as read | PUT | `/api/notifications/read-all` | 200 |
| Notification preferences | GET/PUT | `/api/notifications/preferences` | 200 |
| Notification triggered on release approval | - | (internal) | Notification created for release owner |
| Notification triggered on change conflict | - | (internal) | Notification created for change author |

#### Governance Module (U13)

**File**: `governance/governance.integration.test.ts`

| Test Case | Method | Endpoint | Expected |
|-----------|--------|----------|----------|
| Audit trail query | GET | `/api/governance/audit` | 200, complete audit entries |
| Compliance report generation | GET | `/api/governance/compliance/report` | 200, compliance summary |
| Traceability: requirement to deployment | GET | `/api/governance/traceability/:requirementId` | 200, full chain |
| Compliance policy evaluation | POST | `/api/governance/compliance/evaluate` | 200, pass/fail per policy |

### Cross-Tenant Isolation Tests (MANDATORY)

**File**: `tenants/tenant-isolation.integration.test.ts`

This is the **most critical** integration test suite. It verifies that PostgreSQL RLS policies correctly isolate tenant data across ALL endpoints.

#### Test Setup

```typescript
// Create two tenants with users
const tenantA = { id: 'tenant-A', token: generateToken('tenant-A', 'developer') };
const tenantB = { id: 'tenant-B', token: generateToken('tenant-B', 'developer') };

// Seed data for both tenants
await seedTenantData('tenant-A');
await seedTenantData('tenant-B');
```

#### Isolation Test Matrix

Every resource endpoint is tested for cross-tenant isolation:

| Resource | List Isolation | Detail Isolation | Mutation Isolation |
|----------|---------------|------------------|--------------------|
| Connections | Tenant A sees only own | 403 on Tenant B resource | Cannot modify Tenant B resource |
| Schema Explorer | Scoped to tenant connections | 403 on cross-tenant connection | N/A |
| Changes | Tenant A sees only own | 403 on Tenant B change | Cannot rollback Tenant B change |
| Releases | Tenant A sees only own | 403 on Tenant B release | Cannot approve Tenant B release |
| Change Log | Tenant A sees only own | 403 on Tenant B entry | N/A (immutable) |
| PRD Documents | Tenant A sees only own | 403 on Tenant B PRD | Cannot edit Tenant B PRD |
| AI Chat History | Tenant A sees only own | 403 on Tenant B history | N/A |
| Notifications | Tenant A sees only own | 403 on Tenant B notification | Cannot mark Tenant B as read |
| Users | Tenant A sees only own | 403 on Tenant B user | Cannot modify Tenant B user |
| Audit Logs | Tenant A sees only own | 403 on Tenant B entry | N/A (immutable) |

#### Isolation Test Pattern

```typescript
describe('Cross-Tenant Isolation - Connections', () => {
  let connA: Connection;
  let connB: Connection;

  before(async () => {
    connA = await createConnection('tenant-A');
    connB = await createConnection('tenant-B');
  });

  it('GET /api/connections - Tenant A cannot see Tenant B connections', async () => {
    const res = await request(app)
      .get('/api/connections')
      .set('Authorization', `Bearer ${tenantA.token}`)
      .expect(200);

    expect(res.body).to.satisfy((conns: Connection[]) =>
      conns.every(c => c.tenantId === 'tenant-A')
    );
    expect(res.body.map((c: Connection) => c.id)).to.not.include(connB.id);
  });

  it('GET /api/connections/:id - Tenant A cannot access Tenant B connection', async () => {
    await request(app)
      .get(`/api/connections/${connB.id}`)
      .set('Authorization', `Bearer ${tenantA.token}`)
      .expect(403);
  });

  it('PUT /api/connections/:id - Tenant A cannot modify Tenant B connection', async () => {
    await request(app)
      .put(`/api/connections/${connB.id}`)
      .set('Authorization', `Bearer ${tenantA.token}`)
      .send({ name: 'hacked' })
      .expect(403);
  });

  it('DELETE /api/connections/:id - Tenant A cannot delete Tenant B connection', async () => {
    await request(app)
      .delete(`/api/connections/${connB.id}`)
      .set('Authorization', `Bearer ${tenantA.token}`)
      .expect(403);
  });
});
```

## E2E Tests (Playwright)

### Prerequisites

```bash
# Install Playwright browsers
npx playwright install --with-deps chromium

# Start full stack
docker-compose up -d
pnpm --filter api dev &
pnpm --filter web dev &

# Run E2E tests
pnpm test:e2e
```

### Playwright Configuration

```typescript
// playwright.config.ts
export default defineConfig({
  testDir: './tests/e2e',
  timeout: 60000,
  retries: 2,
  workers: 1,  // Sequential to avoid data conflicts
  use: {
    baseURL: 'http://localhost:5173',
    screenshot: 'only-on-failure',
    video: 'retain-on-failure',
    trace: 'retain-on-failure',
  },
  projects: [
    { name: 'chromium', use: { ...devices['Desktop Chrome'] } },
  ],
});
```

### Critical E2E Flows

#### Flow 1: Login, Navigate, Edit, Apply, Verify Change Log

```
1. Navigate to login page
2. Enter valid credentials (developer role)
3. Verify dashboard loads
4. Navigate to Schema Explorer
5. Select a connection
6. Browse to a table
7. Edit table (add column)
8. Apply change
9. Verify success notification
10. Navigate to Change Log
11. Verify new entry appears with correct details
```

#### Flow 2: Create Release, Approve, Deploy, Verify

```
1. Login as Release Manager
2. Navigate to Releases
3. Create new release
4. Add pending changes to release
5. Submit for approval
6. Logout
7. Login as DBA (approver)
8. Navigate to pending approvals
9. Approve release
10. Verify release status changes to approved
11. Login as Release Manager
12. Deploy release
13. Verify pipeline stages complete
14. Verify deployed changes in Change Log
```

#### Flow 3: PRD Builder, Generate, Validate, Export, Send to M5

```
1. Login as Developer
2. Navigate to PRD Builder
3. Create new PRD from template
4. Fill in required sections
5. Use AI to generate technical sections
6. Validate PRD completeness
7. Export as PDF (verify download)
8. Send to Release Pipeline (M5)
9. Verify PRD linked to release
```

#### Flow 4: AI Chat, Apply Suggestion, Verify Change Log

```
1. Login as Developer
2. Open AI Chat panel
3. Select a connection context
4. Ask: "Add an index on EMPLOYEES.DEPARTMENT_ID"
5. Verify AI suggests CREATE INDEX DDL
6. Click "Apply Suggestion"
7. Verify confirmation dialog shows preview
8. Confirm apply
9. Verify success notification
10. Navigate to Change Log
11. Verify AI-originated change logged with source=AI
```

#### Flow 5: Connection CRUD and Health Check

```
1. Login as DBA
2. Navigate to Connections
3. Create new connection (fill form)
4. Verify connection appears in list
5. Click health check button
6. Verify health status badge updates
7. Edit connection (change name)
8. Verify name updated
9. Delete connection (soft delete)
10. Verify connection removed from active list
11. Navigate to deleted connections
12. Restore connection
13. Verify connection back in active list
```

#### Flow 6: Multi-Role Governance Flow

```
1. Login as Developer - make changes
2. Login as Release Manager - create release
3. Login as DBA - approve release
4. Login as Auditor - verify full audit trail
5. Verify traceability from change to deployment
6. Verify compliance report includes all actions
```

### E2E Test Data Management

```typescript
// tests/e2e/fixtures/global-setup.ts
async function globalSetup() {
  // Reset test database to known state
  await resetDatabase();

  // Create test tenants
  await createTenant('e2e-tenant-001');

  // Create test users for each role
  const roles = [
    'admin', 'developer', 'tech_lead',
    'release_manager', 'knowledge_editor', 'marketplace_publisher',
    'qa_analyst', 'devops_engineer', 'auditor'
  ];

  for (const role of roles) {
    await createUser({
      email: `${role}@e2e-test.com`,
      password: 'E2eTest123!',
      role,
      tenantId: 'e2e-tenant-001',
    });
  }

  // Create test Oracle connection (mock)
  await createTestConnection('e2e-tenant-001');
}
```

## Running All Integration Tests

```bash
# API integration tests only
pnpm --filter api test:integration

# E2E tests only
pnpm test:e2e

# All integration tests (API + E2E)
pnpm test:integration:all

# E2E with headed browser (for debugging)
pnpm test:e2e -- --headed

# E2E specific test
pnpm test:e2e -- --grep "Login flow"

# Generate HTML report
pnpm test:e2e -- --reporter=html
npx playwright show-report
```

## CI Integration

Integration tests run in the CI pipeline after unit tests pass:

```yaml
# In build_spec.yaml
- type: Command
  name: "Integration Tests"
  command: |
    # Start test services
    docker-compose -f docker-compose.test.yml up -d
    # Wait for services
    ./scripts/wait-for-services.sh
    # Run API integration tests
    pnpm --filter api test:integration
    # Run E2E tests (headless)
    pnpm test:e2e
    # Cleanup
    docker-compose -f docker-compose.test.yml down
```
