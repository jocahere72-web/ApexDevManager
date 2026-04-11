# Build Instructions - APEX Dev Manager

## Prerequisites

| Tool | Version | Purpose |
|------|---------|---------|
| Node.js | 20 LTS (20.x) | Runtime for API and build tooling |
| pnpm | 9.x | Monorepo package manager |
| Docker | 24+ | Containerization and local services |
| Docker Compose | v2.x | Local multi-service orchestration |
| PostgreSQL | 16.x | Primary database (local or Docker) |
| Redis | 7+ | Caching, sessions, rate limiting |
| Oracle Instant Client | 21c | Required by node-oracledb for Oracle DB connections |
| OCI CLI | Latest | Oracle Cloud Infrastructure management |
| kubectl | 1.28+ | Kubernetes cluster management |
| Helm | 3.x | Kubernetes package management |
| Playwright | Latest | E2E test browser binaries |

## Monorepo Structure

```
apex-dev-manager/
  apps/
    api/          # Node.js + Express backend (TypeScript)
    web/          # React 18 + Vite frontend (TypeScript)
  packages/
    shared-types/ # Shared TypeScript types and interfaces
  pnpm-workspace.yaml
  docker-compose.yml
  build_spec.yaml   # OCI DevOps build specification
  helm/
    apex-dev-manager/  # Helm chart
```

## Local Development Setup

### Step 1: Clone and Install Dependencies

```bash
git clone <repository-url> apex-dev-manager
cd apex-dev-manager
pnpm install
```

This installs all workspace dependencies across `apps/web`, `apps/api`, and `packages/shared-types`.

### Step 2: Environment Configuration

```bash
cp .env.example .env
```

Configure the following variables in `.env`:

```env
# Database
DATABASE_URL=postgresql://apexdev:apexdev@localhost:5432/apexdev
DATABASE_POOL_MIN=2
DATABASE_POOL_MAX=10

# Redis
REDIS_URL=redis://localhost:6379

# Auth
JWT_SECRET=<generate-with-openssl-rand-base64-64>
JWT_REFRESH_SECRET=<generate-with-openssl-rand-base64-64>
JWT_EXPIRATION=15m
JWT_REFRESH_EXPIRATION=7d

# Oracle DB (for managed connections)
ORACLE_CLIENT_DIR=/opt/oracle/instantclient_21_9

# AI Service
AI_SERVICE_URL=http://localhost:8080/ai
AI_API_KEY=<your-ai-service-key>

# Multi-Tenant
DEFAULT_TENANT_ID=dev-tenant-001

# OCI (for deployment only)
OCI_REGION=us-ashburn-1
OCI_COMPARTMENT_ID=<compartment-ocid>
OCI_VAULT_ID=<vault-ocid>

# App
NODE_ENV=development
API_PORT=3001
VITE_API_URL=http://localhost:3001/api
```

### Step 3: Start Infrastructure Services

```bash
docker-compose up -d postgres redis
```

Verify services are running:

```bash
docker-compose ps
# Both postgres and redis should show "Up" status

# Verify PostgreSQL connectivity
psql postgresql://apexdev:apexdev@localhost:5432/apexdev -c "SELECT 1;"

# Verify Redis connectivity
redis-cli ping
# Expected: PONG
```

### Step 4: Database Setup

```bash
# Run all migrations
pnpm db:migrate

# Seed development data (roles, default tenant, sample users)
pnpm db:seed
```

The seed script creates:
- Default development tenant
- 9 roles (admin, developer, tech_lead, release_manager, knowledge_editor, marketplace_publisher, qa_analyst, devops_engineer, auditor)
- Sample users for each role
- Sample Oracle DB connection (requires Oracle Instant Client for actual connectivity)

### Step 5: Build Shared Types

```bash
pnpm --filter shared-types build
```

This must complete before starting the API or Web apps, as both depend on `shared-types`.

### Step 6: Start Backend

```bash
pnpm --filter api dev
```

The API server starts on port 3001 with hot-reload enabled. Verify:

```bash
curl http://localhost:3001/api/health
# Expected: {"status":"ok","version":"...","timestamp":"..."}
```

### Step 7: Start Frontend

```bash
pnpm --filter web dev
```

The Vite dev server starts on port 5173 with HMR enabled. Open `http://localhost:5173` in a browser.

## Docker Build

### API Dockerfile (Multi-Stage)

```dockerfile
# Stage 1: Builder
FROM node:20-alpine AS builder
WORKDIR /app
COPY pnpm-lock.yaml pnpm-workspace.yaml package.json ./
COPY apps/api/package.json apps/api/
COPY packages/shared-types/package.json packages/shared-types/
RUN corepack enable && pnpm install --frozen-lockfile
COPY packages/shared-types/ packages/shared-types/
RUN pnpm --filter shared-types build
COPY apps/api/ apps/api/
RUN pnpm --filter api build

# Stage 2: Runner
FROM node:20-alpine AS runner
WORKDIR /app
RUN apk add --no-cache libaio
COPY --from=builder /app/apps/api/dist ./dist
COPY --from=builder /app/apps/api/package.json ./
COPY --from=builder /app/node_modules ./node_modules
EXPOSE 3001
USER node
CMD ["node", "dist/server.js"]
```

### Web Dockerfile (Multi-Stage with Nginx)

```dockerfile
# Stage 1: Builder
FROM node:20-alpine AS builder
WORKDIR /app
COPY pnpm-lock.yaml pnpm-workspace.yaml package.json ./
COPY apps/web/package.json apps/web/
COPY packages/shared-types/package.json packages/shared-types/
RUN corepack enable && pnpm install --frozen-lockfile
COPY packages/shared-types/ packages/shared-types/
RUN pnpm --filter shared-types build
COPY apps/web/ apps/web/
RUN pnpm --filter web build

# Stage 2: Nginx
FROM nginx:1.25-alpine AS runner
COPY --from=builder /app/apps/web/dist /usr/share/nginx/html
COPY apps/web/nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

### Full Local Stack via Docker Compose

```bash
# Build all images
docker-compose build

# Start all services
docker-compose up -d

# Verify all services
docker-compose ps

# View logs
docker-compose logs -f api
docker-compose logs -f web
```

The `docker-compose.yml` includes:
- `postgres`: PostgreSQL 16 with volume persistence
- `redis`: Redis 7 with AOF persistence
- `api`: APEX Dev Manager API
- `web`: APEX Dev Manager Web (Nginx)
- `pgbouncer`: Connection pooler (100 max connections)

## OKE Deployment (Oracle Kubernetes Engine)

### Helm Chart Installation

```bash
# Add required Helm repos (if any external charts are used)
helm repo update

# Install/upgrade per environment
helm upgrade --install apex-dev-manager ./helm/apex-dev-manager \
  --namespace apex-dev \
  --create-namespace \
  -f ./helm/apex-dev-manager/values-<env>.yaml \
  --set image.api.tag=<version>-<git-sha> \
  --set image.web.tag=<version>-<git-sha>
```

### Environment-Specific Values Files

| File | Environment | Notes |
|------|-------------|-------|
| `values-dev.yaml` | Development | Single replica, debug logging, relaxed limits |
| `values-qa.yaml` | QA | 2 replicas, info logging, standard limits |
| `values-staging.yaml` | Staging | 3 replicas, mirrors production config |
| `values-prod.yaml` | Production | 3+ replicas, warn logging, strict limits, HPA enabled |
| `values-dr.yaml` | DR (Secondary Region) | Mirrors prod, standby database connection |

### Secrets Injection from OCI Vault

Secrets are injected via the OCI Vault CSI driver. The Helm chart references secrets by their OCID:

```yaml
# In values-prod.yaml
secrets:
  vaultOCID: ocid1.vault.oc1...
  items:
    - name: DATABASE_URL
      secretOCID: ocid1.secret.oc1...
    - name: JWT_SECRET
      secretOCID: ocid1.secret.oc1...
    - name: REDIS_URL
      secretOCID: ocid1.secret.oc1...
    - name: AI_API_KEY
      secretOCID: ocid1.secret.oc1...
```

### Image Tagging Convention

```
<oci-region>.ocir.io/<tenancy-namespace>/apex-dev-manager/<service>:<version>-<git-sha>
```

Examples:
- `us-ashburn-1.ocir.io/mytenancy/apex-dev-manager/api:1.2.0-a1b2c3d`
- `us-ashburn-1.ocir.io/mytenancy/apex-dev-manager/web:1.2.0-a1b2c3d`

## CI/CD Pipeline (OCI DevOps)

### Build Specification (`build_spec.yaml`)

```yaml
version: 0.1
component: build
timeoutInSeconds: 1800
shell: bash

steps:
  - type: Command
    name: "Install Dependencies"
    command: |
      corepack enable
      pnpm install --frozen-lockfile

  - type: Command
    name: "Lint"
    command: |
      pnpm --filter shared-types build
      pnpm --filter api lint
      pnpm --filter web lint

  - type: Command
    name: "Unit Tests"
    command: |
      pnpm --filter api test:coverage
      pnpm --filter web test:coverage

  - type: Command
    name: "Build"
    command: |
      pnpm --filter api build
      pnpm --filter web build

  - type: Command
    name: "Security Scan"
    command: |
      pnpm audit --audit-level=high
      # Trivy container scan runs post-push

  - type: Command
    name: "Docker Build and Push"
    command: |
      docker build -t $API_IMAGE:$TAG -f apps/api/Dockerfile .
      docker build -t $WEB_IMAGE:$TAG -f apps/web/Dockerfile .
      docker push $API_IMAGE:$TAG
      docker push $WEB_IMAGE:$TAG
```

### Pipeline Stages

```
Source (Git Push/PR)
  --> Build (install, lint, test, build, scan)
    --> Push Images (OCIR)
      --> Deploy DEV (auto)
        --> Deploy QA (manual gate)
          --> Deploy STAGING (manual gate)
            --> Deploy PROD Primary (manual gate + approval)
              --> Deploy PROD DR (manual gate)
```

### Branch Strategy

| Branch | Deploys To | Trigger |
|--------|-----------|---------|
| `feature/*` | - | PR build only |
| `develop` | DEV | Auto on merge |
| `release/*` | QA, STAGING | Manual gate |
| `main` | PROD, DR | Manual gate + approval |
| `hotfix/*` | QA -> STAGING -> PROD | Expedited manual gates |

## Useful Commands Reference

```bash
# Monorepo commands
pnpm install                        # Install all dependencies
pnpm --filter api dev               # Start API dev server
pnpm --filter web dev               # Start Web dev server
pnpm --filter shared-types build    # Build shared types

# Database
pnpm db:migrate                     # Run pending migrations
pnpm db:migrate:rollback            # Rollback last migration
pnpm db:seed                        # Seed development data
pnpm db:reset                       # Drop, recreate, migrate, seed

# Testing
pnpm --filter api test              # Run API unit tests
pnpm --filter web test              # Run Web unit tests
pnpm --filter api test:coverage     # API tests with coverage
pnpm --filter web test:coverage     # Web tests with coverage
pnpm --filter api test:integration  # API integration tests
pnpm test:e2e                       # Playwright E2E tests

# Linting
pnpm --filter api lint              # Lint API code
pnpm --filter web lint              # Lint Web code
pnpm lint:fix                       # Auto-fix lint issues

# Docker
docker-compose up -d                # Start all services
docker-compose down                 # Stop all services
docker-compose logs -f <service>    # Follow service logs

# Kubernetes
kubectl get pods -n apex-dev        # List pods
kubectl logs -f <pod> -n apex-dev   # Follow pod logs
helm status apex-dev-manager -n apex-dev  # Helm release status
```
