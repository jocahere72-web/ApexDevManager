# Infrastructure Design - U1: Foundation of APEX Dev Manager

**Unit**: U1 - Foundation
**Phase**: Construction - Infrastructure Design
**Date**: 2026-04-10
**Status**: Draft

---

## 1. OCI Resource Architecture

### 1.1 Tenancy Structure

```
OCI Tenancy: apex-dev-manager
|
+-- Compartment: apex-network
|   +-- VCNs, Subnets, Gateways, Security Lists, NSGs
|
+-- Compartment: apex-dev
|   +-- OKE Cluster (dev)
|   +-- Database (dev)
|   +-- Cache (dev)
|   +-- DevOps projects
|
+-- Compartment: apex-staging
|   +-- OKE Cluster (staging)
|   +-- Database (staging)
|   +-- Cache (staging)
|
+-- Compartment: apex-prod
|   +-- OKE Cluster (prod)
|   +-- Database (prod, primary)
|   +-- Cache (prod)
|   +-- Vault, Logging, Monitoring
|
+-- Compartment: apex-dr
|   +-- OKE Cluster (standby, scaled to 0)
|   +-- Database (standby replica)
|   +-- Cache (standby)
|
+-- Compartment: apex-shared
    +-- OCI Container Registry (OCIR)
    +-- OCI DevOps Project
    +-- OCI Vault (master keys)
    +-- OCI Notifications
    +-- OCI Traffic Management (DNS failover)
```

### 1.2 Region Strategy

| Role | Region | OCI Region ID | Purpose |
|------|--------|---------------|---------|
| Primary | Sao Paulo | `sa-saopaulo-1` | All production workloads |
| Standby | Santiago | `sa-santiago-1` | DR failover target |

### 1.3 Tagging Strategy

All resources tagged with:

| Tag Key | Example Value | Purpose |
|---------|---------------|---------|
| `project` | `apex-dev-manager` | Cost tracking |
| `environment` | `dev`, `staging`, `prod` | Environment identification |
| `unit` | `u1-foundation` | Unit traceability |
| `managed-by` | `terraform` | IaC tracking |
| `owner` | `platform-team` | Ownership |

**Terraform Reference**: `oci_identity_compartment`, `oci_identity_tag_namespace`, `oci_identity_tag`

---

## 2. Network Architecture (VCN)

### 2.1 VCN Design

| Attribute | Value |
|-----------|-------|
| VCN Name | `apex-vcn` |
| CIDR Block | `10.0.0.0/16` |
| DNS Label | `apexvcn` |
| Region | `sa-saopaulo-1` (replicated to `sa-santiago-1`) |

### 2.2 Subnet Layout

| Subnet | CIDR | Type | Purpose | Availability |
|--------|------|------|---------|--------------|
| `sn-public-lb` | `10.0.1.0/24` | Public | Load Balancer, WAF | Regional |
| `sn-private-oke` | `10.0.2.0/24` | Private | OKE worker nodes | Regional |
| `sn-private-db` | `10.0.3.0/24` | Private | PostgreSQL, Redis | Regional |
| `sn-private-mgmt` | `10.0.4.0/24` | Private | Bastion, CI/CD agents | Regional |

### 2.3 Gateways

| Gateway | Purpose | Configuration |
|---------|---------|---------------|
| Internet Gateway | Public subnet egress/ingress | Attached to `sn-public-lb` route table |
| NAT Gateway | Private subnet egress | Attached to `sn-private-oke`, `sn-private-db` route tables |
| Service Gateway | OCI service access (no internet) | Access to OCI Object Storage, OCIR, Vault |

### 2.4 Security Lists and Network Security Groups (NSGs)

#### NSG: `nsg-load-balancer`

| Direction | Protocol | Source/Dest | Port | Description |
|-----------|----------|-------------|------|-------------|
| Ingress | TCP | 0.0.0.0/0 | 443 | HTTPS from internet |
| Ingress | TCP | 0.0.0.0/0 | 80 | HTTP redirect to HTTPS |
| Egress | TCP | 10.0.2.0/24 | 3000 | To API backend (OKE) |
| Egress | TCP | 10.0.2.0/24 | 8080 | To web frontend (OKE) |

#### NSG: `nsg-oke-workers`

| Direction | Protocol | Source/Dest | Port | Description |
|-----------|----------|-------------|------|-------------|
| Ingress | TCP | 10.0.1.0/24 | 3000 | From LB to API |
| Ingress | TCP | 10.0.1.0/24 | 8080 | From LB to web |
| Ingress | TCP | 10.0.2.0/24 | All | Intra-node communication |
| Ingress | TCP | OKE Control Plane | 6443 | Kubernetes API |
| Egress | TCP | 10.0.3.0/24 | 5432 | To PostgreSQL |
| Egress | TCP | 10.0.3.0/24 | 6379 | To Redis |
| Egress | TCP | 0.0.0.0/0 (NAT) | 443 | To OCIR, external APIs |

#### NSG: `nsg-database`

| Direction | Protocol | Source/Dest | Port | Description |
|-----------|----------|-------------|------|-------------|
| Ingress | TCP | 10.0.2.0/24 | 5432 | PostgreSQL from OKE |
| Ingress | TCP | 10.0.2.0/24 | 6379 | Redis from OKE |
| Ingress | TCP | 10.0.4.0/24 | 5432 | PostgreSQL from mgmt |
| Egress | TCP | OCI Services | 443 | Backup to Object Storage |

### 2.5 Network Diagram

```
                         Internet
                            |
                    +-------+-------+
                    | Internet GW   |
                    +-------+-------+
                            |
              +-------------+-------------+
              |  sn-public-lb (10.0.1.0/24) |
              |  +---------------------+    |
              |  | OCI Load Balancer   |    |
              |  | + WAF Policy        |    |
              |  | + SSL Termination   |    |
              |  +---------------------+    |
              +-------------+-------------+
                            |
                    +-------+-------+
                    |  NAT Gateway  |
                    +-------+-------+
                            |
              +-------------+-------------+
              | sn-private-oke (10.0.2.0/24)|
              |  +--------+  +--------+   |
              |  | Worker1 |  | Worker2 |  |
              |  | (api,   |  | (api,   |  |
              |  |  web)   |  |  web)   |  |
              |  +--------+  +--------+   |
              +-------------+-------------+
                            |
              +-------------+-------------+
              | sn-private-db (10.0.3.0/24) |
              |  +----------+ +----------+ |
              |  |PostgreSQL | |  Redis   | |
              |  |  (PG 16) | |  (4GB)   | |
              |  +----------+ +----------+ |
              +---------------------------+
                            |
                    +-------+-------+
                    | Service GW    |
                    +-------+-------+
                            |
                    OCI Services (OCIR, Vault, Object Storage)
```

**Terraform References**: `oci_core_vcn`, `oci_core_subnet`, `oci_core_internet_gateway`, `oci_core_nat_gateway`, `oci_core_service_gateway`, `oci_core_network_security_group`, `oci_core_network_security_group_security_rule`

---

## 3. OKE Cluster Configuration

### 3.1 Cluster Specification

| Attribute | Value |
|-----------|-------|
| Cluster Name | `apex-oke-cluster` |
| Kubernetes Version | `1.29.x` (latest stable) |
| Cluster Type | Enhanced (managed control plane) |
| Endpoint | Private |
| Pod Security | Pod Security Standards (Restricted) |
| Network Type | Flannel overlay |

### 3.2 Node Pool Configuration

| Attribute | Dev | Staging | Prod |
|-----------|-----|---------|------|
| Node Shape | `VM.Standard.E4.Flex` | `VM.Standard.E4.Flex` | `VM.Standard.E4.Flex` |
| OCPU | 2 | 2 | 4 |
| Memory (GB) | 16 | 16 | 32 |
| Node Count | 2 | 2 | 3 |
| Boot Volume (GB) | 50 | 50 | 100 |
| Placement | Single AD | Single AD | Multi-AD |

### 3.3 Namespace Architecture

| Namespace | Purpose | Environment |
|-----------|---------|-------------|
| `apex-dev` | Development workloads | Dev |
| `apex-qa` | QA/testing workloads | QA |
| `apex-staging` | Pre-production | Staging |
| `apex-prod` | Production workloads | Prod |
| `apex-system` | Ingress controller, monitoring agents | All |
| `apex-jobs` | Bull queue workers, cron jobs | Per-env |

### 3.4 Resource Quotas per Namespace

```yaml
apiVersion: v1
kind: ResourceQuota
metadata:
  name: apex-namespace-quota
spec:
  hard:
    requests.cpu: "8"
    requests.memory: "16Gi"
    limits.cpu: "16"
    limits.memory: "32Gi"
    pods: "50"
    services: "20"
    persistentvolumeclaims: "10"
```

### 3.5 Limit Ranges

```yaml
apiVersion: v1
kind: LimitRange
metadata:
  name: apex-limit-range
spec:
  limits:
    - type: Container
      default:
        cpu: "500m"
        memory: "512Mi"
      defaultRequest:
        cpu: "100m"
        memory: "128Mi"
      max:
        cpu: "2"
        memory: "2Gi"
      min:
        cpu: "50m"
        memory: "64Mi"
```

### 3.6 Horizontal Pod Autoscaler (HPA)

#### API Service HPA

```yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: apex-api-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: apex-api
  minReplicas: 2
  maxReplicas: 10
  metrics:
    - type: Resource
      resource:
        name: cpu
        target:
          type: Utilization
          averageUtilization: 70
    - type: Resource
      resource:
        name: memory
        target:
          type: Utilization
          averageUtilization: 80
  behavior:
    scaleUp:
      stabilizationWindowSeconds: 60
      policies:
        - type: Pods
          value: 2
          periodSeconds: 60
    scaleDown:
      stabilizationWindowSeconds: 300
      policies:
        - type: Pods
          value: 1
          periodSeconds: 120
```

#### Web Service HPA

```yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: apex-web-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: apex-web
  minReplicas: 2
  maxReplicas: 6
  metrics:
    - type: Resource
      resource:
        name: cpu
        target:
          type: Utilization
          averageUtilization: 70
```

### 3.7 Ingress Controller (NGINX)

| Attribute | Value |
|-----------|-------|
| Controller | NGINX Ingress Controller |
| Version | `1.10.x` |
| Deployment | Helm chart (`ingress-nginx/ingress-nginx`) |
| Service Type | `LoadBalancer` (OCI LB integration) |
| SSL | Terminated at OCI LB, re-encrypted to ingress optional |
| Rate Limiting | 100 req/s per IP (global), 50 req/s per IP (API) |

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: apex-ingress
  annotations:
    nginx.ingress.kubernetes.io/rate-limit: "100"
    nginx.ingress.kubernetes.io/rate-limit-window: "1s"
    nginx.ingress.kubernetes.io/proxy-body-size: "10m"
    nginx.ingress.kubernetes.io/ssl-redirect: "true"
spec:
  ingressClassName: nginx
  rules:
    - host: apex.example.com
      http:
        paths:
          - path: /api
            pathType: Prefix
            backend:
              service:
                name: apex-api
                port:
                  number: 3000
          - path: /
            pathType: Prefix
            backend:
              service:
                name: apex-web
                port:
                  number: 8080
```

**Terraform References**: `oci_containerengine_cluster`, `oci_containerengine_node_pool`

---

## 4. Database (PostgreSQL 16)

### 4.1 OCI Database Service for PostgreSQL

| Attribute | Primary (Sao Paulo) | Standby (Santiago) |
|-----------|---------------------|--------------------|
| Service | OCI Database with PostgreSQL | OCI Database with PostgreSQL |
| Version | PostgreSQL 16 | PostgreSQL 16 |
| Shape | `PostgreSQL.VM.Standard.E4.Flex.2.32GB` | `PostgreSQL.VM.Standard.E4.Flex.2.32GB` |
| OCPU | 2 | 2 |
| Memory | 32 GB | 32 GB |
| Storage | 256 GB (auto-expand) | 256 GB (auto-expand) |
| IOPS | 3000 (baseline) | 3000 (baseline) |
| HA Configuration | Single instance (dev), 2-node HA (prod) | Read replica (async) |
| Subnet | `sn-private-db` | `sn-private-db` (Santiago VCN) |

### 4.2 Connection Pooling (PgBouncer)

PgBouncer deployed as a sidecar or dedicated pod in OKE.

| Parameter | Value |
|-----------|-------|
| Pool Mode | `transaction` |
| Max Client Connections | 200 |
| Default Pool Size | 25 |
| Min Pool Size | 5 |
| Reserve Pool Size | 5 |
| Reserve Pool Timeout | 3s |
| Server Idle Timeout | 300s |
| Query Timeout | 30s |
| Max DB Connections (total) | 100 |

```ini
; pgbouncer.ini
[databases]
apex_dev = host=<pg-host> port=5432 dbname=apex_dev
apex_prod = host=<pg-host> port=5432 dbname=apex_prod

[pgbouncer]
listen_addr = 0.0.0.0
listen_port = 6432
auth_type = scram-sha-256
pool_mode = transaction
max_client_conn = 200
default_pool_size = 25
min_pool_size = 5
reserve_pool_size = 5
reserve_pool_timeout = 3
server_idle_timeout = 300
query_timeout = 30
```

### 4.3 Backup Strategy

| Backup Type | Frequency | Retention | Storage |
|-------------|-----------|-----------|---------|
| WAL Archiving | Continuous (real-time) | 7 days | OCI Object Storage |
| Automated Snapshot | Daily at 02:00 UTC | 14 days | OCI Block Storage Backup |
| Weekly Full Backup | Sunday 03:00 UTC | 30 days | OCI Object Storage |
| Monthly Full Backup | 1st of month 04:00 UTC | 12 months | OCI Object Storage (Archive tier) |
| Cross-Region Copy | Daily (after snapshot) | 7 days | OCI Object Storage (Santiago) |

Point-in-time recovery: Any point within last 7 days using WAL archives.

### 4.4 Database Schema Strategy

Multi-tenant schema using Row-Level Security (RLS):

```sql
-- RLS policy template applied to all tenant-scoped tables
CREATE POLICY tenant_isolation_policy ON {table_name}
    USING (tenant_id = current_setting('app.current_tenant_id')::UUID);

ALTER TABLE {table_name} ENABLE ROW LEVEL SECURITY;
ALTER TABLE {table_name} FORCE ROW LEVEL SECURITY;

-- Application sets tenant context per request
SET app.current_tenant_id = '<tenant-uuid>';
```

### 4.5 Initial Database Tables (U1 Foundation)

| Table | Purpose | Key Columns |
|-------|---------|-------------|
| `tenants` | Multi-tenant organization | `id`, `name`, `slug`, `plan`, `settings`, `created_at` |
| `users` | User accounts | `id`, `tenant_id`, `email`, `password_hash`, `role`, `status` |
| `refresh_tokens` | JWT refresh tokens | `id`, `user_id`, `token_hash`, `expires_at`, `revoked_at` |
| `audit_events` | System audit trail | `id`, `tenant_id`, `user_id`, `action`, `resource`, `details`, `ip_address`, `created_at` |
| `connections` | External service connections | `id`, `tenant_id`, `type`, `name`, `config_encrypted`, `status` |
| `environments` | Deployment environments | `id`, `tenant_id`, `name`, `type`, `config`, `status` |

**Terraform Reference**: `oci_psql_db_system`

---

## 5. Redis (OCI Cache with Redis)

### 5.1 OCI Cache Configuration

| Attribute | Value |
|-----------|-------|
| Service | OCI Cache with Redis |
| Node Type | `CACHE.VM.Standard.E4.Flex` |
| Memory | 4 GB |
| Redis Version | 7.x |
| Cluster Mode | Standalone (dev), Replicated (prod) |
| Subnet | `sn-private-db` |
| Port | 6379 |
| TLS | Enabled (in-transit encryption) |
| Authentication | AUTH token from OCI Vault |

### 5.2 Key Namespace Design

| Prefix | Purpose | TTL | Example Key |
|--------|---------|-----|-------------|
| `sess:` | User session data | 24h | `sess:{session-id}` |
| `cache:comp:` | Component cache | 15min | `cache:comp:{tenant}:{component-id}` |
| `cache:mcp:` | MCP metadata cache | 30min | `cache:mcp:{tenant}:{server-id}` |
| `bull:` | Bull job queues | No TTL (persistent) | `bull:email-queue:waiting` |
| `rate:` | Rate limiting counters | 1min | `rate:{tenant}:{endpoint}` |
| `lock:` | Distributed locks | 30s | `lock:{resource}:{id}` |

### 5.3 Persistence Configuration

```
# Redis persistence for queue durability
appendonly yes
appendfsync everysec
auto-aof-rewrite-percentage 100
auto-aof-rewrite-min-size 64mb

# Memory policy
maxmemory-policy allkeys-lru
```

### 5.4 Bull Queue Configuration

| Queue Name | Purpose | Concurrency | Retry | Backoff |
|------------|---------|-------------|-------|---------|
| `audit-events` | Async audit log writes | 5 | 3 | Exponential (1s, 2s, 4s) |
| `notifications` | Email/webhook notifications | 3 | 3 | Exponential (5s, 10s, 20s) |
| `connection-sync` | External service sync | 2 | 5 | Exponential (10s, 30s, 60s) |
| `scheduled-tasks` | Cron-like scheduled work | 1 | 3 | Fixed (60s) |

**Terraform Reference**: `oci_redis_redis_cluster`

---

## 6. OCI Vault

### 6.1 Vault Configuration

| Attribute | Value |
|-----------|-------|
| Vault Name | `apex-vault` |
| Vault Type | Virtual Private Vault |
| Compartment | `apex-shared` |
| Region | `sa-saopaulo-1` (replicated to Santiago) |

### 6.2 Master Encryption Key

| Attribute | Value |
|-----------|-------|
| Key Name | `apex-master-key` |
| Algorithm | AES |
| Key Length | 256 bits |
| Protection Mode | HSM |
| Rotation | Automatic, every 90 days |

### 6.3 Secrets Inventory

| Secret Name | Purpose | Rotation |
|-------------|---------|----------|
| `apex-db-password` | PostgreSQL admin password | 90 days |
| `apex-db-app-password` | PostgreSQL app user password | 90 days |
| `apex-redis-auth-token` | Redis AUTH token | 90 days |
| `apex-jwt-secret` | JWT signing secret | 180 days |
| `apex-jwt-refresh-secret` | JWT refresh token secret | 180 days |
| `apex-encryption-key` | Application-level encryption | 180 days |
| `apex-ocir-token` | Container Registry auth token | 90 days |

### 6.4 Access Policies

```hcl
# OKE workload identity access to Vault secrets
resource "oci_identity_policy" "oke_vault_access" {
  name           = "apex-oke-vault-policy"
  compartment_id = var.tenancy_ocid
  statements = [
    "Allow dynamic-group apex-oke-workload to read secret-family in compartment apex-shared",
    "Allow dynamic-group apex-oke-workload to use keys in compartment apex-shared where target.key.id = '<master-key-ocid>'"
  ]
}

# Dynamic group for OKE pods
resource "oci_identity_dynamic_group" "oke_workload" {
  name           = "apex-oke-workload"
  compartment_id = var.tenancy_ocid
  matching_rule  = "ALL {resource.type = 'cluster', resource.compartment.id = '<compartment-ocid>'}"
}
```

**Terraform References**: `oci_kms_vault`, `oci_kms_key`, `oci_vault_secret`

---

## 7. OCI Logging and Monitoring

### 7.1 Log Group Configuration

| Attribute | Value |
|-----------|-------|
| Log Group Name | `apex-dev-manager` |
| Compartment | Per environment |
| Retention | 30 days (dev), 90 days (staging), 180 days (prod) |

### 7.2 Log Sources

| Log Name | Source | Type | Description |
|----------|--------|------|-------------|
| `apex-api-stdout` | OKE (apex-api pods) | Custom | Application logs (JSON structured) |
| `apex-api-stderr` | OKE (apex-api pods) | Custom | Error logs |
| `apex-web-access` | OKE (apex-web pods) | Custom | NGINX access logs |
| `apex-oke-audit` | OKE Cluster | Service | Kubernetes audit logs |
| `apex-lb-access` | Load Balancer | Service | LB access logs |
| `apex-lb-error` | Load Balancer | Service | LB error logs |
| `apex-vcn-flow` | VCN Flow Logs | Service | Network flow logs |
| `apex-waf-logs` | WAF | Service | WAF blocked/allowed requests |

### 7.3 Unified Monitoring Agent

Deployed as DaemonSet on OKE nodes:

```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: oci-logging-agent
  namespace: apex-system
spec:
  selector:
    matchLabels:
      app: oci-logging-agent
  template:
    spec:
      containers:
        - name: fluentd
          image: iad.ocir.io/oracle/oci-logging-analytics-fluentd:latest
          env:
            - name: LOG_GROUP_ID
              value: "<log-group-ocid>"
          volumeMounts:
            - name: varlog
              mountPath: /var/log
              readOnly: true
      volumes:
        - name: varlog
          hostPath:
            path: /var/log
```

### 7.4 Alarm Definitions

| Alarm Name | Metric | Condition | Severity | Action |
|------------|--------|-----------|----------|--------|
| `apex-cpu-high` | `CpuUtilization` | > 80% for 5 min | Critical | ONS Topic: `apex-alerts-critical` |
| `apex-memory-high` | `MemoryUtilization` | > 85% for 5 min | Critical | ONS Topic: `apex-alerts-critical` |
| `apex-error-rate` | Custom: `error_count / request_count` | > 1% for 3 min | Warning | ONS Topic: `apex-alerts-warning` |
| `apex-latency-p95` | Custom: `response_time_p95` | > 3000ms for 5 min | Warning | ONS Topic: `apex-alerts-warning` |
| `apex-disk-usage` | `DiskUtilization` | > 85% for 10 min | Warning | ONS Topic: `apex-alerts-warning` |
| `apex-db-connections` | `ActiveConnections` | > 80 for 5 min | Warning | ONS Topic: `apex-alerts-warning` |
| `apex-pod-restart` | `kube_pod_container_status_restarts_total` | > 3 in 15 min | Critical | ONS Topic: `apex-alerts-critical` |
| `apex-oke-node-down` | `NodeStatus` | NotReady for 3 min | Critical | ONS Topic: `apex-alerts-critical` |

### 7.5 Notification Topics

| Topic Name | Protocol | Subscribers | Purpose |
|------------|----------|-------------|---------|
| `apex-alerts-critical` | Email, Slack webhook | Team lead, on-call | Critical production issues |
| `apex-alerts-warning` | Email | Dev team | Warning-level alerts |
| `apex-alerts-info` | Email | Dev team | Informational (deployments, scaling events) |

**Terraform References**: `oci_logging_log_group`, `oci_logging_log`, `oci_monitoring_alarm`, `oci_ons_notification_topic`, `oci_ons_subscription`

---

## 8. Load Balancer and WAF

### 8.1 OCI Load Balancer

| Attribute | Value |
|-----------|-------|
| Name | `apex-lb` |
| Type | Flexible |
| Min Bandwidth | 10 Mbps |
| Max Bandwidth | 100 Mbps |
| Subnet | `sn-public-lb` |
| IP Type | Public (ephemeral, reserved in prod) |

### 8.2 Listeners

| Listener | Port | Protocol | Backend Set |
|----------|------|----------|-------------|
| `https-listener` | 443 | HTTPS | `apex-backend` |
| `http-listener` | 80 | HTTP | Redirect to HTTPS (301) |

### 8.3 SSL/TLS Configuration

| Attribute | Value |
|-----------|-------|
| Certificate | OCI Certificates Service (Let's Encrypt or custom CA) |
| TLS Version | TLS 1.2 minimum, TLS 1.3 preferred |
| Cipher Suite | `oci-wider-compatible-ssl-cipher-suite-v1` |
| HSTS | Enabled (`max-age=31536000; includeSubDomains`) |

### 8.4 Backend Sets

| Backend Set | Port | Health Check | Policy |
|-------------|------|--------------|--------|
| `apex-api-backend` | 3000 | `GET /health` (interval: 10s, timeout: 5s) | Round Robin |
| `apex-web-backend` | 8080 | `GET /` (interval: 30s, timeout: 5s) | Round Robin |

### 8.5 WAF Policy

| Rule Set | Description | Action |
|----------|-------------|--------|
| OWASP CRS 3.x | Core Rule Set | Block (anomaly score > 5) |
| SQL Injection | SQLi detection | Block |
| XSS Protection | Cross-site scripting | Block |
| Rate Limiting | Global: 1000 req/min per IP | 429 Response |
| Geo-Blocking | Optional: restrict to LATAM | Block (configurable) |
| Bot Management | Known bad bots | Block |
| Custom: API Auth | Missing auth on `/api/*` (except `/api/health`) | Log (monitor mode initially) |

**Terraform References**: `oci_load_balancer_load_balancer`, `oci_load_balancer_backend_set`, `oci_load_balancer_listener`, `oci_waf_web_app_firewall`, `oci_waf_web_app_firewall_policy`

---

## 9. CI/CD Pipeline (OCI DevOps)

### 9.1 OCI DevOps Project

| Attribute | Value |
|-----------|-------|
| Project Name | `apex-dev-manager` |
| Compartment | `apex-shared` |
| Notification Topic | `apex-alerts-info` |

### 9.2 Code Repository

| Attribute | Value |
|-----------|-------|
| Repository | OCI DevOps Code Repository or external Git (GitHub/GitLab) |
| Branching Strategy | `main` (prod), `develop` (dev), `release/*` (staging) |
| Protected Branches | `main`, `release/*` (require PR, no direct push) |

### 9.3 Build Pipeline

```
Trigger (git push)
    |
    v
+-------------------+
| Stage 1: Lint     |
| - eslint          |
| - prettier check  |
| - tsc --noEmit    |
+-------------------+
    |
    v
+-------------------+
| Stage 2: Test     |
| - jest (frontend) |
| - mocha (backend) |
| - coverage check  |
|   (>= 80%)        |
+-------------------+
    |
    v
+-------------------+
| Stage 3: Build    |
| - pnpm build      |
| - docker build    |
|   (multi-stage)   |
+-------------------+
    |
    v
+-------------------+
| Stage 4: Scan     |
| - trivy (CVE)     |
| - npm audit       |
| - SAST scan       |
+-------------------+
    |
    v
+-------------------+
| Stage 5: Push     |
| - Push images to  |
|   OCIR with tags  |
|   (commit SHA +   |
|    branch + latest)|
+-------------------+
```

### 9.4 Build Specification (`build_spec.yaml`)

```yaml
version: 0.1
component: build
timeoutInSeconds: 1800
shell: bash

env:
  variables:
    REGISTRY: "gru.ocir.io/<namespace>/apex"
  exportedVariables:
    - IMAGE_TAG
    - API_IMAGE
    - WEB_IMAGE

steps:
  - type: Command
    name: "Install Dependencies"
    command: |
      pnpm install --frozen-lockfile

  - type: Command
    name: "Lint"
    command: |
      pnpm run lint

  - type: Command
    name: "Type Check"
    command: |
      pnpm run typecheck

  - type: Command
    name: "Test"
    command: |
      pnpm run test -- --coverage
      # Fail if coverage below threshold

  - type: Command
    name: "Build"
    command: |
      pnpm run build
      export IMAGE_TAG=${OCI_BUILD_RUN_ID:0:12}
      export API_IMAGE="${REGISTRY}/api:${IMAGE_TAG}"
      export WEB_IMAGE="${REGISTRY}/web:${IMAGE_TAG}"

  - type: Command
    name: "Docker Build and Push"
    command: |
      docker build -t ${API_IMAGE} -f apps/api/Dockerfile .
      docker build -t ${WEB_IMAGE} -f apps/web/Dockerfile .
      docker push ${API_IMAGE}
      docker push ${WEB_IMAGE}

  - type: Command
    name: "Security Scan"
    command: |
      trivy image --exit-code 1 --severity HIGH,CRITICAL ${API_IMAGE}
      trivy image --exit-code 1 --severity HIGH,CRITICAL ${WEB_IMAGE}

outputArtifacts:
  - name: helm-chart
    type: BINARY
    location: deploy/helm
```

### 9.5 Deploy Pipeline

| Stage | Environment | Trigger | Approval |
|-------|-------------|---------|----------|
| Deploy to Dev | `apex-dev` namespace | Auto (on `develop` push) | None |
| Deploy to QA | `apex-qa` namespace | Manual trigger | None |
| Deploy to Staging | `apex-staging` namespace | Auto (on `release/*` push) | None |
| Deploy to Prod | `apex-prod` namespace | Manual trigger | Required (team lead) |

Deploy stage executes:
```bash
helm upgrade --install apex-api ./deploy/helm/apex-api \
  --namespace ${NAMESPACE} \
  --set image.repository=${API_IMAGE} \
  --set image.tag=${IMAGE_TAG} \
  --values ./deploy/helm/apex-api/values-${ENV}.yaml \
  --wait --timeout 5m
```

### 9.6 Artifact Storage

| Artifact | Registry | Naming Convention |
|----------|----------|-------------------|
| API Docker Image | `gru.ocir.io/<ns>/apex/api` | `:<commit-sha>`, `:latest`, `:<branch>` |
| Web Docker Image | `gru.ocir.io/<ns>/apex/web` | `:<commit-sha>`, `:latest`, `:<branch>` |
| Helm Charts | OCI Artifact Registry | `apex-api-<version>.tgz`, `apex-web-<version>.tgz` |

**Terraform References**: `oci_devops_project`, `oci_devops_build_pipeline`, `oci_devops_deploy_pipeline`, `oci_artifacts_container_repository`

---

## 10. DR Configuration

### 10.1 DR Strategy: Active-Passive with DNS Failover

| Attribute | Value |
|-----------|-------|
| Strategy | Active-Passive |
| Primary Region | `sa-saopaulo-1` |
| Standby Region | `sa-santiago-1` |
| RTO Target | < 4 hours |
| RPO Target | < 1 hour |
| Failover Trigger | Manual (with monitoring alerts) |

### 10.2 DR Architecture

```
                    OCI Traffic Management
                    (DNS Steering Policy)
                           |
              +------------+------------+
              |                         |
    sa-saopaulo-1 (Active)    sa-santiago-1 (Standby)
    +-------------------+    +-------------------+
    | OKE Cluster       |    | OKE Cluster       |
    | (3 nodes, active) |    | (0 nodes, scaled  |
    |                   |    |  down)             |
    | PostgreSQL        |    | PostgreSQL         |
    | (primary, R/W)    |----| (replica, R/O)    |
    |                   |    |  async replication |
    | Redis             |    | Redis              |
    | (active)          |    | (standby, cold)   |
    | Load Balancer     |    | Load Balancer      |
    | (active)          |    | (provisioned)     |
    +-------------------+    +-------------------+
```

### 10.3 OCI Traffic Management

```hcl
resource "oci_dns_steering_policy" "apex_failover" {
  compartment_id = var.shared_compartment_id
  display_name   = "apex-failover-policy"
  template       = "FAILOVER"

  rules {
    rule_type = "FILTER"
    default_answer_data {
      answer_condition = "answer.pool == 'primary'"
      should_keep      = true
    }
  }

  rules {
    rule_type = "HEALTH"
  }

  rules {
    rule_type = "PRIORITY"
    default_answer_data {
      answer_condition = "answer.pool == 'primary'"
      value            = 1
    }
    default_answer_data {
      answer_condition = "answer.pool == 'standby'"
      value            = 2
    }
  }

  answers {
    name  = "saopaulo"
    rtype = "A"
    rdata = "<primary-lb-ip>"
    pool  = "primary"
  }

  answers {
    name  = "santiago"
    rtype = "A"
    rdata = "<standby-lb-ip>"
    pool  = "standby"
  }
}
```

### 10.4 Component DR Details

| Component | Primary (Sao Paulo) | Standby (Santiago) | Replication |
|-----------|---------------------|--------------------|-------------|
| OKE Cluster | 3 nodes, all workloads | 0 nodes (scale up on failover) | Helm charts in OCIR (cross-region) |
| PostgreSQL | Primary (R/W) | Read replica (async) | Streaming replication, lag < 60s |
| Redis | Active, 4GB | Cold standby | No replication (rebuilt on failover) |
| Load Balancer | Active, serving traffic | Provisioned, no backends | N/A |
| Secrets (Vault) | Primary vault | Vault replica | Cross-region replication (auto) |
| Images (OCIR) | Primary registry | Replicated registry | Cross-region replication |

### 10.5 Failover Runbook

#### Pre-Failover Checklist

- [ ] Confirm primary region is truly unavailable (not a transient issue)
- [ ] Notify team via Slack/PagerDuty
- [ ] Check PostgreSQL replica lag (must be < RPO target)
- [ ] Verify standby region resources are accessible

#### Failover Steps

| Step | Action | Command/Procedure | Duration |
|------|--------|-------------------|----------|
| 1 | Scale up standby OKE nodes | `oci ce node-pool update --node-pool-id <id> --size 3` | ~15 min |
| 2 | Promote PostgreSQL replica | `oci psql db-system failover --db-system-id <standby-id>` | ~10 min |
| 3 | Start Redis in standby | Scale Redis deployment replicas to 1 | ~5 min |
| 4 | Deploy latest app version | `helm upgrade --install apex-api ... --namespace apex-prod` | ~10 min |
| 5 | Verify health checks | `curl https://<standby-lb>/api/health` | ~5 min |
| 6 | Update DNS steering | Update Traffic Management to prefer standby pool | ~5 min (+ DNS propagation) |
| 7 | Verify end-to-end | Run smoke tests against standby endpoint | ~10 min |
| 8 | Monitor for 30 min | Watch error rates, latency, logs | 30 min |

**Estimated Total Failover Time**: ~90 minutes (within 4-hour RTO)

#### Failback Procedure

| Step | Action | Duration |
|------|--------|----------|
| 1 | Restore primary region infrastructure | ~30 min |
| 2 | Rebuild PostgreSQL primary from standby | ~60 min |
| 3 | Resync data (PostgreSQL replication catchup) | ~30 min |
| 4 | Verify primary health | ~15 min |
| 5 | Switch DNS back to primary | ~5 min (+ propagation) |
| 6 | Scale down standby to 0 nodes | ~5 min |

### 10.6 DR Testing Schedule

| Test Type | Frequency | Scope |
|-----------|-----------|-------|
| Tabletop Exercise | Quarterly | Walk through runbook with team |
| Component Failover | Monthly | Test individual component failover (DB, DNS) |
| Full DR Drill | Semi-annually | Complete failover to standby region |

**Terraform References**: `oci_dns_steering_policy`, `oci_dns_steering_policy_attachment`, `oci_health_checks_http_monitor`

---

## 11. Terraform Module Structure

```
terraform/
  modules/
    networking/         # VCN, subnets, gateways, NSGs
      main.tf
      variables.tf
      outputs.tf
    oke/                # OKE cluster, node pools
      main.tf
      variables.tf
      outputs.tf
    database/           # PostgreSQL, PgBouncer config
      main.tf
      variables.tf
      outputs.tf
    redis/              # OCI Cache with Redis
      main.tf
      variables.tf
      outputs.tf
    vault/              # OCI Vault, keys, secrets
      main.tf
      variables.tf
      outputs.tf
    logging/            # Log groups, logs, alarms
      main.tf
      variables.tf
      outputs.tf
    load-balancer/      # LB, WAF, SSL
      main.tf
      variables.tf
      outputs.tf
    devops/             # Build/deploy pipelines
      main.tf
      variables.tf
      outputs.tf
    dr/                 # Traffic Management, cross-region
      main.tf
      variables.tf
      outputs.tf
  environments/
    dev/
      main.tf           # Calls modules with dev values
      terraform.tfvars
      backend.tf        # OCI Object Storage backend
    staging/
      main.tf
      terraform.tfvars
      backend.tf
    prod/
      main.tf
      terraform.tfvars
      backend.tf
```

### 11.1 State Management

| Attribute | Value |
|-----------|-------|
| Backend | OCI Object Storage |
| Bucket | `apex-terraform-state` |
| State Locking | OCI Object Storage (versioned) |
| State File Per Env | `env:/<environment>/terraform.tfstate` |

---

## Approval

**Infrastructure Design Status**: Draft - Pending Review

**Options**:
1. **Request Changes** - Provide feedback for modifications
2. **Continue to Next Stage** - Approve and proceed to Code Generation
