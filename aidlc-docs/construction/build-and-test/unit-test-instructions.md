# Unit Test Instructions - APEX Dev Manager

## Overview

| Aspect | Backend (API) | Frontend (Web) |
|--------|---------------|----------------|
| Framework | Mocha + Chai | Jest + React Testing Library |
| Mocking | Sinon, Testcontainers | MSW (Mock Service Worker) |
| Coverage Tool | c8 (Istanbul) | Jest built-in (Istanbul) |
| Coverage Target | >70% line coverage | >70% for business logic components |
| AI-Generated Code Target | >80% line coverage | >80% line coverage |
| Run Command | `pnpm --filter api test` | `pnpm --filter web test` |
| Coverage Command | `pnpm --filter api test:coverage` | `pnpm --filter web test:coverage` |

## Backend Tests (Mocha + Chai)

### Test Structure

```
apps/api/
  tests/
    setup.ts                    # Global test setup (Sinon sandbox, env vars)
    fixtures/                   # Shared test fixtures
      tenant.fixture.ts
      user.fixture.ts
      connection.fixture.ts
    helpers/
      db-helper.ts              # Testcontainers PostgreSQL setup
      auth-helper.ts            # JWT token generation for tests
      tenant-context.ts         # Tenant context injection
    modules/
      auth/
        auth.service.test.ts
        auth.controller.test.ts
        token.service.test.ts
      connections/
        connection.service.test.ts
        connection.controller.test.ts
        encryption.service.test.ts
        health-check.service.test.ts
      explorer/
        tree.service.test.ts
        search.service.test.ts
        sync.service.test.ts
        metadata-cache.service.test.ts
      changes/
        change.service.test.ts
        diff.service.test.ts
        rollback.service.test.ts
        export.service.test.ts
      releases/
        release.service.test.ts
        pipeline.service.test.ts
        approval.service.test.ts
        hotfix.service.test.ts
      ai/
        chat.service.test.ts
        safety.service.test.ts
        apply.service.test.ts
        context-builder.service.test.ts
      governance/
        audit.service.test.ts
        compliance.service.test.ts
        traceability.service.test.ts
      tenants/
        tenant.service.test.ts
        rls.service.test.ts
        billing.service.test.ts
      admin/
        user-management.service.test.ts
        role.service.test.ts
        settings.service.test.ts
      prd-builder/
        prd.service.test.ts
        template.service.test.ts
        export.service.test.ts
      risk/
        risk-classification.service.test.ts
        impact-analysis.service.test.ts
      notifications/
        notification.service.test.ts
        channel.service.test.ts
      change-log/
        change-log.service.test.ts
        filter.service.test.ts
```

### Running Backend Tests

```bash
# Run all unit tests
pnpm --filter api test

# Run with coverage report
pnpm --filter api test:coverage

# Run specific module tests
pnpm --filter api test -- --grep "AuthService"

# Run specific test file
pnpm --filter api test -- tests/modules/auth/auth.service.test.ts

# Run in watch mode (development)
pnpm --filter api test:watch
```

### Backend Test Configuration

```typescript
// .mocharc.yml
spec: "tests/**/*.test.ts"
require:
  - "ts-node/register"
  - "tests/setup.ts"
timeout: 10000
recursive: true
exit: true
```

### Key Test Suites by Unit

#### U1 - Foundation and Auth
- **auth.service.test.ts**: Login validation, password hashing, account lockout after 5 failed attempts, token generation, token family revocation
- **token.service.test.ts**: JWT creation, refresh token rotation, expiry validation, family-based revocation
- **rls.service.test.ts**: Row-level security policy enforcement, tenant context propagation, cross-tenant query blocking

#### U2 - Connection Management
- **connection.service.test.ts**: CRUD operations, soft delete, restore, connection string validation
- **encryption.service.test.ts**: AES-256 encryption/decryption of credentials, key rotation
- **health-check.service.test.ts**: Oracle DB connectivity check, timeout handling, retry logic, status caching

#### U3 - Schema Explorer
- **tree.service.test.ts**: Tree node construction from Oracle metadata, lazy loading, node type mapping
- **search.service.test.ts**: Full-text search across schema objects, result ranking, search filters
- **metadata-cache.service.test.ts**: Cache invalidation, TTL management, cache warming

#### U4 - Change Management
- **change.service.test.ts**: DDL/DML application, change validation, conflict detection
- **diff.service.test.ts**: Schema diff generation, before/after comparison
- **rollback.service.test.ts**: Single change rollback, batch rollback, dependency-aware ordering

#### U5 - Release Pipeline
- **release.service.test.ts**: Release creation, status transitions, version numbering
- **pipeline.service.test.ts**: Pipeline stage execution, gate validation, parallel stage support
- **approval.service.test.ts**: Approval workflow, quorum calculation, escalation rules
- **hotfix.service.test.ts**: Hotfix branch creation, cherry-pick logic, expedited approval

#### U6 - Change Log and Audit
- **change-log.service.test.ts**: Log entry creation, immutability enforcement, query with pagination
- **filter.service.test.ts**: Date range filtering, user filtering, object type filtering, composite filters

#### U7 - AI Chat
- **chat.service.test.ts**: Message handling, context window management, streaming response assembly
- **safety.service.test.ts**: SQL injection detection, destructive operation blocking, allowlist validation
- **context-builder.service.test.ts**: Schema context extraction, relevant object selection, token budget management

#### U8 - AI Apply
- **apply.service.test.ts**: AI suggestion to DDL conversion, change preview generation, validation before apply

#### U9 - PRD Builder
- **prd.service.test.ts**: PRD document creation, section management, AI-assisted content generation
- **template.service.test.ts**: Template CRUD, variable substitution, version management
- **export.service.test.ts**: PDF export, Markdown export, M5 integration payload formatting

#### U10 - Impact Analysis and Risk
- **impact-analysis.service.test.ts**: Dependency graph traversal, affected object identification (50+ dependency target)
- **risk-classification.service.test.ts**: Risk score calculation, category assignment, threshold configuration

#### U11 - Notifications
- **notification.service.test.ts**: Notification creation, delivery, read status, batch operations
- **channel.service.test.ts**: In-app channel, email channel, webhook channel, preference management

#### U12 - Documentation (M12)
- Module documentation generation tests are covered within each module's test suite.

#### U13 - Governance and Compliance
- **compliance.service.test.ts**: Policy evaluation, compliance report generation, violation tracking
- **traceability.service.test.ts**: End-to-end traceability from requirement to deployment, link validation
- **audit.service.test.ts**: Audit trail completeness, tamper detection, export functionality

### Backend Mocking Strategy

```typescript
// Example: Mocking database with Sinon
import sinon from 'sinon';
import { ConnectionService } from '../../src/modules/connections/connection.service';
import { ConnectionRepository } from '../../src/modules/connections/connection.repository';

describe('ConnectionService', () => {
  let sandbox: sinon.SinonSandbox;
  let connectionRepository: sinon.SinonStubbedInstance<ConnectionRepository>;
  let service: ConnectionService;

  beforeEach(() => {
    sandbox = sinon.createSandbox();
    connectionRepository = sandbox.createStubInstance(ConnectionRepository);
    service = new ConnectionService(connectionRepository);
  });

  afterEach(() => {
    sandbox.restore();
  });

  it('should create a connection with encrypted credentials', async () => {
    connectionRepository.create.resolves({ id: '1', name: 'test-conn' });
    const result = await service.create({
      name: 'test-conn',
      host: 'db.example.com',
      port: 1521,
      password: 'plaintext'
    }, 'tenant-001');
    expect(connectionRepository.create.calledOnce).to.be.true;
    // Verify password was encrypted before storage
    const callArgs = connectionRepository.create.firstCall.args[0];
    expect(callArgs.password).to.not.equal('plaintext');
  });
});
```

```typescript
// Example: Testcontainers for PostgreSQL integration
import { PostgreSqlContainer } from '@testcontainers/postgresql';

let pgContainer: PostgreSqlContainer;

before(async () => {
  pgContainer = await new PostgreSqlContainer('postgres:16')
    .withDatabase('apexdev_test')
    .withUsername('test')
    .withPassword('test')
    .start();
  process.env.DATABASE_URL = pgContainer.getConnectionUri();
});

after(async () => {
  await pgContainer.stop();
});
```

### Tenant Isolation in Unit Tests

Every service test suite MUST include tenant isolation checks:

```typescript
describe('Tenant Isolation', () => {
  it('should only return resources belonging to the current tenant', async () => {
    // Create resources in tenant A and tenant B
    await service.create(resourceData, 'tenant-A');
    await service.create(resourceData, 'tenant-B');

    // Query as tenant A
    const results = await service.findAll('tenant-A');

    // Verify only tenant A resources returned
    expect(results.every(r => r.tenantId === 'tenant-A')).to.be.true;
  });

  it('should reject access to another tenant resource by ID', async () => {
    const resource = await service.create(resourceData, 'tenant-B');

    // Attempt access as tenant A
    try {
      await service.findById(resource.id, 'tenant-A');
      expect.fail('Should have thrown');
    } catch (err) {
      expect(err.status).to.equal(403);
    }
  });
});
```

## Frontend Tests (Jest + React Testing Library)

### Test Structure

```
apps/web/
  src/
    features/
      auth/
        __tests__/
          LoginForm.test.tsx
          useAuth.test.ts
      connections/
        __tests__/
          ConnectionList.test.tsx
          ConnectionForm.test.tsx
          HealthBadge.test.tsx
      explorer/
        __tests__/
          SchemaTree.test.tsx
          ObjectDetail.test.tsx
          SearchBar.test.tsx
      changes/
        __tests__/
          ChangeEditor.test.tsx
          DiffViewer.test.tsx
          RollbackDialog.test.tsx
      releases/
        __tests__/
          ReleasePipeline.test.tsx
          ApprovalPanel.test.tsx
          ReleaseForm.test.tsx
      ai/
        __tests__/
          ChatPanel.test.tsx
          SuggestionCard.test.tsx
          ApplyConfirmDialog.test.tsx
      prd-builder/
        __tests__/
          PrdEditor.test.tsx
          TemplateSelector.test.tsx
          ExportMenu.test.tsx
      governance/
        __tests__/
          AuditLog.test.tsx
          ComplianceDashboard.test.tsx
      admin/
        __tests__/
          UserManagement.test.tsx
          RoleEditor.test.tsx
          TenantSettings.test.tsx
      notifications/
        __tests__/
          NotificationCenter.test.tsx
          PreferencesForm.test.tsx
      change-log/
        __tests__/
          ChangeLogTable.test.tsx
          FilterPanel.test.tsx
      risk/
        __tests__/
          ImpactGraph.test.tsx
          RiskBadge.test.tsx
    shared/
      __tests__/
        Layout.test.tsx
        Navigation.test.tsx
        ErrorBoundary.test.tsx
        TenantContext.test.tsx
```

### Running Frontend Tests

```bash
# Run all unit tests
pnpm --filter web test

# Run with coverage report
pnpm --filter web test:coverage

# Run specific test file
pnpm --filter web test -- --testPathPattern="LoginForm"

# Run in watch mode
pnpm --filter web test:watch

# Update snapshots (if any)
pnpm --filter web test -- -u
```

### Frontend Mocking with MSW

```typescript
// tests/mocks/handlers.ts
import { rest } from 'msw';

export const handlers = [
  // Auth
  rest.post('/api/auth/login', (req, res, ctx) => {
    return res(ctx.json({ token: 'mock-jwt', refreshToken: 'mock-refresh' }));
  }),

  // Connections
  rest.get('/api/connections', (req, res, ctx) => {
    return res(ctx.json([
      { id: '1', name: 'dev-db', status: 'healthy', tenantId: 'tenant-001' },
      { id: '2', name: 'staging-db', status: 'degraded', tenantId: 'tenant-001' },
    ]));
  }),

  // Explorer
  rest.get('/api/explorer/:connectionId/tree', (req, res, ctx) => {
    return res(ctx.json({
      nodes: [
        { id: 'schemas', label: 'Schemas', type: 'folder', children: [] },
      ]
    }));
  }),

  // AI Chat
  rest.post('/api/ai/chat', (req, res, ctx) => {
    return res(ctx.json({
      message: 'Here is a suggested ALTER TABLE statement...',
      suggestion: { type: 'ddl', sql: 'ALTER TABLE ...' }
    }));
  }),
];
```

```typescript
// Example: Component test with MSW
import { render, screen, waitFor } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import { ConnectionList } from '../ConnectionList';
import { TestProviders } from '../../../../tests/TestProviders';

describe('ConnectionList', () => {
  it('should display connections and their health status', async () => {
    render(
      <TestProviders>
        <ConnectionList />
      </TestProviders>
    );

    await waitFor(() => {
      expect(screen.getByText('dev-db')).toBeInTheDocument();
      expect(screen.getByText('staging-db')).toBeInTheDocument();
    });

    expect(screen.getByTestId('health-badge-1')).toHaveTextContent('healthy');
    expect(screen.getByTestId('health-badge-2')).toHaveTextContent('degraded');
  });

  it('should open create dialog on button click', async () => {
    render(
      <TestProviders>
        <ConnectionList />
      </TestProviders>
    );

    await userEvent.click(screen.getByRole('button', { name: /add connection/i }));
    expect(screen.getByRole('dialog')).toBeInTheDocument();
  });
});
```

## Test Data Management

### Factory Functions

```typescript
// tests/factories/user.factory.ts
export function createTestUser(overrides: Partial<User> = {}): User {
  return {
    id: randomUUID(),
    email: `user-${randomUUID().slice(0, 8)}@test.com`,
    firstName: 'Test',
    lastName: 'User',
    role: 'developer',
    tenantId: 'tenant-001',
    isActive: true,
    createdAt: new Date(),
    ...overrides,
  };
}

// tests/factories/tenant.factory.ts
export function createTestTenant(overrides: Partial<Tenant> = {}): Tenant {
  return {
    id: `tenant-${randomUUID().slice(0, 8)}`,
    name: 'Test Tenant',
    plan: 'professional',
    maxUsers: 50,
    maxConnections: 10,
    isActive: true,
    createdAt: new Date(),
    ...overrides,
  };
}

// tests/factories/connection.factory.ts
export function createTestConnection(overrides: Partial<Connection> = {}): Connection {
  return {
    id: randomUUID(),
    name: `conn-${randomUUID().slice(0, 8)}`,
    host: 'localhost',
    port: 1521,
    serviceName: 'ORCL',
    username: 'test_user',
    tenantId: 'tenant-001',
    status: 'healthy',
    isDeleted: false,
    createdAt: new Date(),
    ...overrides,
  };
}
```

### Database Cleanup Between Tests

```typescript
// tests/helpers/db-helper.ts
export async function cleanDatabase(db: Knex): Promise<void> {
  // Disable RLS for cleanup
  await db.raw('SET app.current_tenant_id = \'system\'');

  // Truncate in dependency order
  const tables = [
    'notifications',
    'audit_logs',
    'change_logs',
    'release_approvals',
    'release_changes',
    'releases',
    'changes',
    'connections',
    'user_roles',
    'users',
    // Tenants last (FK references)
    // Do NOT truncate tenants or roles (seeded data)
  ];

  for (const table of tables) {
    await db.raw(`TRUNCATE TABLE ${table} CASCADE`);
  }
}
```

### Test Lifecycle

```typescript
// Backend: tests/setup.ts
before(async () => {
  // Start testcontainers PostgreSQL
  // Run migrations
  // Seed base data (roles)
});

beforeEach(async () => {
  // Clean transactional data
  // Reset Sinon sandbox
});

afterEach(async () => {
  // Restore Sinon sandbox
});

after(async () => {
  // Stop testcontainers
});
```

## Coverage Requirements

### Coverage Thresholds (Enforced in CI)

```json
// apps/api/.c8rc.json
{
  "check-coverage": true,
  "lines": 70,
  "functions": 65,
  "branches": 60,
  "statements": 70,
  "reporter": ["text", "lcov", "html"],
  "exclude": [
    "tests/**",
    "src/migrations/**",
    "src/seeds/**",
    "src/**/*.d.ts"
  ]
}
```

```json
// apps/web/jest.config.ts (coverageThreshold)
{
  "coverageThreshold": {
    "global": {
      "lines": 70,
      "functions": 65,
      "branches": 60,
      "statements": 70
    }
  }
}
```

### AI-Generated Code Coverage

Code generated by AI (U7, U8) must meet the >80% coverage target. These files are identified by the `@ai-generated` JSDoc tag and are tracked separately in the coverage report.

### Coverage Exclusions

The following are excluded from coverage calculations:
- Migration files (`src/migrations/**`)
- Seed files (`src/seeds/**`)
- Type declaration files (`*.d.ts`)
- Test files and fixtures
- Configuration files
