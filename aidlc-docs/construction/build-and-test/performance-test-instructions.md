# Performance Test Instructions - APEX Dev Manager

## Overview

| Aspect | Detail |
|--------|--------|
| Load Test Tool | k6 (Grafana) |
| Security Scan Tool | OWASP ZAP |
| Database Profiling | PostgreSQL EXPLAIN ANALYZE |
| Target Environment | QA or Staging (never production for load tests) |
| Baseline Users | 100 concurrent |
| Spike Users | 200 concurrent |
| Soak Duration | 4 hours |

## Load Tests (k6)

### Prerequisites

```bash
# Install k6
brew install k6          # macOS
# or
docker pull grafana/k6   # Docker

# Ensure target environment is running
curl http://<target-host>/api/health
```

### Test Structure

```
tests/
  performance/
    k6/
      config/
        thresholds.js        # Shared threshold definitions
        options.js            # Shared option profiles
      scenarios/
        api-crud.js           # CRUD operation benchmarks
        tree-load.js          # Schema tree loading
        ai-chat.js            # AI chat TTFT
        impact-analysis.js    # Impact analysis performance
        risk-classification.js # Risk classification speed
        change-log-query.js   # Change log with filters
        auth-flow.js          # Login/refresh cycle
        release-pipeline.js   # Release pipeline operations
        concurrent-tenants.js # Multi-tenant concurrent access
      soak/
        soak-test.js          # 4-hour sustained load
      spike/
        spike-test.js         # 200-user burst
      helpers/
        auth.js               # Token generation for k6
        data.js               # Test data generators
```

### Performance Targets (SLOs)

| Scenario | Metric | Target | Critical Threshold |
|----------|--------|--------|--------------------|
| API CRUD operations | p95 latency | <200ms | <500ms |
| Application tree load (50+ pages) | p95 latency | <3s | <5s |
| AI chat TTFT (time to first token) | p95 latency | <2s | <4s |
| Impact analysis (50 dependencies) | p95 latency | <3s | <5s |
| Risk classification | p95 latency | <500ms | <1s |
| Change log query with filters | p95 latency | <500ms | <1s |
| Auth login | p95 latency | <300ms | <600ms |
| Token refresh | p95 latency | <100ms | <300ms |
| Error rate (all endpoints) | % | <1% | <5% |
| Throughput (all endpoints) | req/s | >500 | >200 |

### Scenario Scripts

#### API CRUD Operations

```javascript
// tests/performance/k6/scenarios/api-crud.js
import http from 'k6/http';
import { check, sleep } from 'k6';
import { getAuthToken } from '../helpers/auth.js';

export const options = {
  stages: [
    { duration: '1m', target: 20 },   // Ramp up
    { duration: '3m', target: 100 },   // Sustain 100 users
    { duration: '1m', target: 0 },     // Ramp down
  ],
  thresholds: {
    'http_req_duration{endpoint:connections_list}': ['p(95)<200'],
    'http_req_duration{endpoint:connections_create}': ['p(95)<200'],
    'http_req_duration{endpoint:connections_update}': ['p(95)<200'],
    'http_req_duration{endpoint:connections_delete}': ['p(95)<200'],
    'http_req_failed': ['rate<0.01'],
  },
};

export default function () {
  const token = getAuthToken();
  const headers = { Authorization: `Bearer ${token}`, 'Content-Type': 'application/json' };

  // List connections
  let res = http.get(`${__ENV.BASE_URL}/api/connections`, {
    headers,
    tags: { endpoint: 'connections_list' },
  });
  check(res, { 'list 200': (r) => r.status === 200 });

  // Create connection
  res = http.post(`${__ENV.BASE_URL}/api/connections`, JSON.stringify({
    name: `perf-conn-${Date.now()}`,
    host: 'db.example.com',
    port: 1521,
    serviceName: 'ORCL',
    username: 'perf_user',
    password: 'perf_pass',
  }), { headers, tags: { endpoint: 'connections_create' } });
  check(res, { 'create 201': (r) => r.status === 201 });

  const connId = res.json('id');
  if (connId) {
    // Update connection
    res = http.put(`${__ENV.BASE_URL}/api/connections/${connId}`, JSON.stringify({
      name: `perf-conn-updated-${Date.now()}`,
    }), { headers, tags: { endpoint: 'connections_update' } });
    check(res, { 'update 200': (r) => r.status === 200 });

    // Delete connection
    res = http.del(`${__ENV.BASE_URL}/api/connections/${connId}`, null, {
      headers, tags: { endpoint: 'connections_delete' },
    });
    check(res, { 'delete 204': (r) => r.status === 204 });
  }

  sleep(1);
}
```

#### Schema Tree Load (50+ Pages)

```javascript
// tests/performance/k6/scenarios/tree-load.js
export const options = {
  stages: [
    { duration: '30s', target: 50 },
    { duration: '3m', target: 100 },
    { duration: '30s', target: 0 },
  ],
  thresholds: {
    'http_req_duration{endpoint:tree_root}': ['p(95)<3000'],
    'http_req_duration{endpoint:tree_children}': ['p(95)<2000'],
    'http_req_duration{endpoint:search}': ['p(95)<1000'],
    'http_req_failed': ['rate<0.01'],
  },
};

export default function () {
  const headers = { Authorization: `Bearer ${getAuthToken()}` };
  const connId = __ENV.TEST_CONNECTION_ID;

  // Load root tree (50+ schema objects)
  let res = http.get(`${__ENV.BASE_URL}/api/explorer/${connId}/tree`, {
    headers, tags: { endpoint: 'tree_root' },
  });
  check(res, {
    'tree 200': (r) => r.status === 200,
    'tree has nodes': (r) => r.json('nodes').length > 0,
  });

  // Load child nodes (simulate drilling into schemas)
  const nodes = res.json('nodes');
  if (nodes && nodes.length > 0) {
    res = http.get(`${__ENV.BASE_URL}/api/explorer/${connId}/tree/${nodes[0].id}/children`, {
      headers, tags: { endpoint: 'tree_children' },
    });
    check(res, { 'children 200': (r) => r.status === 200 });
  }

  // Search
  res = http.get(`${__ENV.BASE_URL}/api/explorer/${connId}/search?q=EMP`, {
    headers, tags: { endpoint: 'search' },
  });
  check(res, { 'search 200': (r) => r.status === 200 });

  sleep(2);
}
```

#### AI Chat TTFT

```javascript
// tests/performance/k6/scenarios/ai-chat.js
export const options = {
  stages: [
    { duration: '30s', target: 10 },
    { duration: '3m', target: 50 },
    { duration: '30s', target: 0 },
  ],
  thresholds: {
    'http_req_duration{endpoint:ai_chat}': ['p(95)<2000'],
    'http_req_failed': ['rate<0.05'],  // AI services may have higher error rates
  },
};

export default function () {
  const headers = {
    Authorization: `Bearer ${getAuthToken()}`,
    'Content-Type': 'application/json',
  };

  const res = http.post(`${__ENV.BASE_URL}/api/ai/chat`, JSON.stringify({
    message: 'Show me the structure of the EMPLOYEES table',
    connectionId: __ENV.TEST_CONNECTION_ID,
  }), { headers, tags: { endpoint: 'ai_chat' } });

  check(res, {
    'chat 200': (r) => r.status === 200,
    'has response': (r) => r.json('message') !== undefined,
  });

  sleep(3);
}
```

#### Impact Analysis (50 Dependencies)

```javascript
// tests/performance/k6/scenarios/impact-analysis.js
export const options = {
  stages: [
    { duration: '30s', target: 20 },
    { duration: '3m', target: 50 },
    { duration: '30s', target: 0 },
  ],
  thresholds: {
    'http_req_duration{endpoint:impact}': ['p(95)<3000'],
    'http_req_failed': ['rate<0.01'],
  },
};

export default function () {
  const headers = { Authorization: `Bearer ${getAuthToken()}` };

  // Use a pre-seeded object with 50+ dependencies
  const objectId = __ENV.IMPACT_TEST_OBJECT_ID;
  const res = http.get(`${__ENV.BASE_URL}/api/risk/impact/${objectId}`, {
    headers, tags: { endpoint: 'impact' },
  });

  check(res, {
    'impact 200': (r) => r.status === 200,
    'has dependencies': (r) => r.json('dependencies').length >= 50,
  });

  sleep(2);
}
```

#### Risk Classification

```javascript
// tests/performance/k6/scenarios/risk-classification.js
export const options = {
  stages: [
    { duration: '30s', target: 50 },
    { duration: '3m', target: 100 },
    { duration: '30s', target: 0 },
  ],
  thresholds: {
    'http_req_duration{endpoint:risk}': ['p(95)<500'],
    'http_req_failed': ['rate<0.01'],
  },
};

export default function () {
  const headers = {
    Authorization: `Bearer ${getAuthToken()}`,
    'Content-Type': 'application/json',
  };

  const changes = [
    { type: 'ALTER_TABLE', sql: 'ALTER TABLE employees ADD COLUMN middle_name VARCHAR2(100)' },
    { type: 'DROP_TABLE', sql: 'DROP TABLE temp_staging' },
    { type: 'CREATE_INDEX', sql: 'CREATE INDEX idx_emp_dept ON employees(department_id)' },
  ];

  const change = changes[Math.floor(Math.random() * changes.length)];
  const res = http.post(`${__ENV.BASE_URL}/api/risk/classify`, JSON.stringify(change), {
    headers, tags: { endpoint: 'risk' },
  });

  check(res, {
    'risk 200': (r) => r.status === 200,
    'has risk level': (r) => ['low', 'medium', 'high', 'critical'].includes(r.json('riskLevel')),
  });

  sleep(1);
}
```

#### Change Log Query with Filters

```javascript
// tests/performance/k6/scenarios/change-log-query.js
export const options = {
  stages: [
    { duration: '30s', target: 50 },
    { duration: '3m', target: 100 },
    { duration: '30s', target: 0 },
  ],
  thresholds: {
    'http_req_duration{endpoint:changelog_filtered}': ['p(95)<500'],
    'http_req_duration{endpoint:changelog_paginated}': ['p(95)<500'],
    'http_req_failed': ['rate<0.01'],
  },
};

export default function () {
  const headers = { Authorization: `Bearer ${getAuthToken()}` };

  // Paginated query
  let res = http.get(`${__ENV.BASE_URL}/api/change-log?page=1&limit=50`, {
    headers, tags: { endpoint: 'changelog_paginated' },
  });
  check(res, { 'paginated 200': (r) => r.status === 200 });

  // Filtered query (composite filters)
  res = http.get(
    `${__ENV.BASE_URL}/api/change-log?objectType=TABLE&from=2026-01-01&to=2026-04-10&page=1&limit=20`,
    { headers, tags: { endpoint: 'changelog_filtered' } }
  );
  check(res, { 'filtered 200': (r) => r.status === 200 });

  sleep(1);
}
```

### Running Load Tests

```bash
# Individual scenario
k6 run --env BASE_URL=http://localhost:3001 \
       --env TEST_CONNECTION_ID=<conn-id> \
       tests/performance/k6/scenarios/api-crud.js

# All scenarios sequentially
for scenario in tests/performance/k6/scenarios/*.js; do
  k6 run --env BASE_URL=http://localhost:3001 \
         --env TEST_CONNECTION_ID=<conn-id> \
         "$scenario"
done

# With k6 Cloud (for distributed load)
k6 cloud tests/performance/k6/scenarios/api-crud.js

# Output to JSON for analysis
k6 run --out json=results.json tests/performance/k6/scenarios/api-crud.js

# Output to InfluxDB for Grafana dashboards
k6 run --out influxdb=http://localhost:8086/k6 tests/performance/k6/scenarios/api-crud.js
```

### Soak Test (4 Hours)

```javascript
// tests/performance/k6/soak/soak-test.js
export const options = {
  stages: [
    { duration: '5m', target: 50 },     // Ramp up
    { duration: '3h50m', target: 50 },   // Sustain 50 users for ~4 hours
    { duration: '5m', target: 0 },       // Ramp down
  ],
  thresholds: {
    'http_req_duration': ['p(95)<500', 'p(99)<1000'],
    'http_req_failed': ['rate<0.01'],
    'iteration_duration': ['p(95)<10000'],
  },
};

// Monitors for:
// - Memory leaks (gradual latency increase)
// - Connection pool exhaustion
// - Redis connection leaks
// - Database connection leaks
// - Log file growth
```

```bash
# Run soak test
k6 run --env BASE_URL=http://<staging-host> \
       tests/performance/k6/soak/soak-test.js

# Monitor during soak test (in separate terminals)
kubectl top pods -n apex-dev --watch
kubectl logs -f deployment/apex-api -n apex-dev | grep -i "error\|warn\|pool"
```

### Spike Test (200 Users)

```javascript
// tests/performance/k6/spike/spike-test.js
export const options = {
  stages: [
    { duration: '1m', target: 50 },     // Normal load
    { duration: '30s', target: 200 },    // Spike to 200
    { duration: '5m', target: 200 },     // Sustain spike
    { duration: '30s', target: 50 },     // Back to normal
    { duration: '2m', target: 50 },      // Recovery observation
    { duration: '30s', target: 0 },      // Ramp down
  ],
  thresholds: {
    'http_req_duration': ['p(95)<2000'],  // Relaxed during spike
    'http_req_failed': ['rate<0.05'],     // Allow 5% errors during spike
  },
};

// Validates:
// - System recovers gracefully after spike
// - No cascading failures
// - Rate limiting activates correctly
// - HPA scales up (on OKE)
```

```bash
k6 run --env BASE_URL=http://<staging-host> \
       tests/performance/k6/spike/spike-test.js
```

### Multi-Tenant Concurrent Access

```javascript
// tests/performance/k6/scenarios/concurrent-tenants.js
export const options = {
  scenarios: {
    tenant_a: {
      executor: 'constant-vus',
      vus: 50,
      duration: '5m',
      env: { TENANT_ID: 'perf-tenant-A' },
    },
    tenant_b: {
      executor: 'constant-vus',
      vus: 50,
      duration: '5m',
      env: { TENANT_ID: 'perf-tenant-B' },
    },
  },
  thresholds: {
    'http_req_duration': ['p(95)<500'],
    'http_req_failed': ['rate<0.01'],
    // Verify no cross-tenant data leakage
    'checks': ['rate>0.99'],
  },
};

// Each VU operates within its own tenant
// Checks verify that responses only contain data for the correct tenant
```

## Database Performance

### PostgreSQL Query Analysis

Run `EXPLAIN ANALYZE` on critical queries to verify index usage and execution plans:

```sql
-- Connection listing with RLS
SET app.current_tenant_id = 'tenant-001';
EXPLAIN ANALYZE
SELECT * FROM connections
WHERE is_deleted = false
ORDER BY created_at DESC
LIMIT 20;
-- Target: Index Scan, <10ms execution

-- Change log composite filter query
EXPLAIN ANALYZE
SELECT * FROM change_logs
WHERE tenant_id = 'tenant-001'
  AND object_type = 'TABLE'
  AND created_at BETWEEN '2026-01-01' AND '2026-04-10'
ORDER BY created_at DESC
LIMIT 50;
-- Target: Index Scan on composite index, <50ms execution

-- Impact analysis dependency graph
EXPLAIN ANALYZE
WITH RECURSIVE deps AS (
  SELECT object_id, dependent_object_id, 1 as depth
  FROM object_dependencies
  WHERE object_id = '<target-object>'
  UNION ALL
  SELECT d.object_id, od.dependent_object_id, d.depth + 1
  FROM deps d
  JOIN object_dependencies od ON d.dependent_object_id = od.object_id
  WHERE d.depth < 10
)
SELECT DISTINCT dependent_object_id FROM deps;
-- Target: <500ms for 50+ dependencies

-- Audit log query with tenant RLS
EXPLAIN ANALYZE
SELECT * FROM audit_logs
WHERE tenant_id = 'tenant-001'
ORDER BY created_at DESC
LIMIT 100;
-- Target: Index Scan, <20ms execution
```

### Required Indexes

Verify the following indexes exist and are used:

```sql
-- Core indexes for performance
CREATE INDEX idx_connections_tenant_active ON connections(tenant_id, is_deleted) WHERE is_deleted = false;
CREATE INDEX idx_change_logs_tenant_date ON change_logs(tenant_id, created_at DESC);
CREATE INDEX idx_change_logs_composite ON change_logs(tenant_id, object_type, created_at DESC);
CREATE INDEX idx_audit_logs_tenant_date ON audit_logs(tenant_id, created_at DESC);
CREATE INDEX idx_releases_tenant_status ON releases(tenant_id, status);
CREATE INDEX idx_notifications_user_read ON notifications(user_id, is_read) WHERE is_read = false;
CREATE INDEX idx_object_deps_object ON object_dependencies(object_id);
CREATE INDEX idx_object_deps_dependent ON object_dependencies(dependent_object_id);
```

### RLS Policy Performance Impact

Measure the overhead of Row-Level Security policies:

```sql
-- Baseline: Query WITHOUT RLS
SET row_security = off;
EXPLAIN ANALYZE SELECT * FROM connections LIMIT 100;

-- With RLS: Query WITH RLS
SET row_security = on;
SET app.current_tenant_id = 'tenant-001';
EXPLAIN ANALYZE SELECT * FROM connections LIMIT 100;

-- Acceptable overhead: <10% increase in execution time
```

### Connection Pooling Validation (PgBouncer)

```bash
# Verify PgBouncer configuration
pgbouncer -d /etc/pgbouncer/pgbouncer.ini

# Check pool status
psql -h localhost -p 6432 -U pgbouncer pgbouncer -c "SHOW POOLS;"

# Verify limits
psql -h localhost -p 6432 -U pgbouncer pgbouncer -c "SHOW CONFIG;" | grep -E "max_client|pool_size|reserve"
```

Expected PgBouncer settings:

| Setting | Value |
|---------|-------|
| `max_client_conn` | 200 |
| `default_pool_size` | 100 |
| `reserve_pool_size` | 10 |
| `pool_mode` | transaction |
| `server_idle_timeout` | 600 |

Under load test, verify:
- No `FATAL: too many connections` errors
- Connection wait times <100ms (p95)
- Pool utilization stays below 80%

## Security Tests (OWASP ZAP)

### Prerequisites

```bash
# Install OWASP ZAP
brew install zaproxy     # macOS
# or
docker pull ghcr.io/zaproxy/zaproxy:stable

# Ensure target API is running
curl http://localhost:3001/api/health
```

### Automated Scan Configuration

```bash
# Full automated scan
docker run --rm --network host \
  ghcr.io/zaproxy/zaproxy:stable \
  zap-api-scan.py \
  -t http://localhost:3001/api/openapi.json \
  -f openapi \
  -r zap-report.html \
  -c zap-config.conf
```

### ZAP Configuration (`zap-config.conf`)

```
# Scan policies
10016   IGNORE  # Web Browser XSS Protection Not Enabled (API-only)
10021   IGNORE  # X-Content-Type-Options (handled by helmet)
10038   WARN    # Content Security Policy
10098   WARN    # Cross-Domain Misconfiguration

# Authentication
replacer.full_list(0).description=Auth Token
replacer.full_list(0).enabled=true
replacer.full_list(0).matchtype=REQ_HEADER
replacer.full_list(0).matchstr=Authorization
replacer.full_list(0).regex=false
replacer.full_list(0).replacement=Bearer <valid-test-token>
```

### Security Test Categories

#### SQL Injection Testing

```
Target endpoints:
- GET /api/explorer/:connId/search?q=<injection>
- GET /api/change-log?objectType=<injection>
- POST /api/ai/chat (message field)
- GET /api/connections?name=<injection>

Payloads tested:
- Classic: ' OR '1'='1
- Union-based: ' UNION SELECT * FROM users --
- Time-based: '; WAITFOR DELAY '0:0:5' --
- Stacked: '; DROP TABLE users --

Expected: All return 400 Bad Request or sanitized response
```

#### XSS Testing

```
Target endpoints (input fields):
- POST /api/connections (name field)
- POST /api/prd (content fields)
- POST /api/ai/chat (message field)
- POST /api/releases (description field)

Payloads tested:
- <script>alert(1)</script>
- <img src=x onerror=alert(1)>
- javascript:alert(1)
- "><svg onload=alert(1)>

Expected: All input sanitized, no reflected XSS in responses
```

#### Authentication Bypass Testing

```
Tests:
- Access endpoints without Authorization header -> 401
- Access endpoints with expired token -> 401
- Access endpoints with malformed token -> 401
- Access endpoints with token from different tenant -> 403
- Brute force login (>5 attempts) -> 429
- Token reuse after logout -> 401
- Refresh token reuse after rotation -> 401 (family revoked)
```

#### Rate Limiting Validation

```
Limit: 1000 requests/minute per tenant

Test:
1. Send 1000 requests within 60 seconds from same tenant
2. Verify all succeed (200)
3. Send request 1001
4. Verify rate limit response (429)
5. Verify rate limit header: X-RateLimit-Remaining: 0
6. Verify retry-after header present
7. Wait for window reset
8. Verify requests succeed again
```

### Running Security Tests

```bash
# Quick scan (5-10 minutes)
docker run --rm --network host \
  ghcr.io/zaproxy/zaproxy:stable \
  zap-baseline.py \
  -t http://localhost:3001 \
  -r zap-baseline-report.html

# Full API scan (30-60 minutes)
docker run --rm --network host \
  ghcr.io/zaproxy/zaproxy:stable \
  zap-api-scan.py \
  -t http://localhost:3001/api/openapi.json \
  -f openapi \
  -r zap-full-report.html \
  -c zap-config.conf

# View report
open zap-full-report.html
```

### Security Test Pass Criteria

| Category | Criteria |
|----------|----------|
| Critical Findings | 0 allowed |
| High Findings | 0 allowed |
| Medium Findings | Must be reviewed and documented; false positives excluded |
| Low Findings | Documented, remediation planned |
| Informational | Logged for awareness |

## Performance Test Results Documentation

After each performance test run, document results in:

```
aidlc-docs/construction/build-and-test/results/
  performance-run-<date>.md
```

Include:
- Test date and environment
- k6 summary output (all scenarios)
- Database EXPLAIN ANALYZE results
- PgBouncer pool statistics
- OWASP ZAP report summary
- Pass/fail determination per SLO
- Action items for any failures
