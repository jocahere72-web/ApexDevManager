#!/usr/bin/env bash
set -euo pipefail

# ==============================================================================
# Pre-Deploy Script for APEX Dev Manager
# Runs database migrations and validates readiness before deployment.
# ==============================================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MIGRATION_TIMEOUT="${MIGRATION_TIMEOUT:-120}"
HEALTH_RETRIES="${HEALTH_RETRIES:-10}"
HEALTH_RETRY_DELAY="${HEALTH_RETRY_DELAY:-5}"
API_URL="${API_INTERNAL_URL:-http://apex-api.apex.svc.cluster.local:3000}"

echo "============================================"
echo "  APEX Pre-Deploy: Starting"
echo "  Environment: ${DEPLOY_ENVIRONMENT:-unknown}"
echo "  Timestamp: $(date -u +"%Y-%m-%dT%H:%M:%SZ")"
echo "============================================"

# --------------------------------------------------------------------------
# Step 1: Run database migrations
# --------------------------------------------------------------------------
echo ""
echo "[1/2] Running database migrations..."

if ! timeout "${MIGRATION_TIMEOUT}" pnpm --filter @apex/api db:migrate 2>&1; then
  echo "ERROR: Database migration failed or timed out after ${MIGRATION_TIMEOUT}s"
  echo "Aborting deployment."
  exit 1
fi

echo "Database migrations completed successfully."

# --------------------------------------------------------------------------
# Step 2: Check health endpoint after migration
# --------------------------------------------------------------------------
echo ""
echo "[2/2] Verifying API health after migration..."

HEALTHY=false
for i in $(seq 1 "${HEALTH_RETRIES}"); do
  echo "  Health check attempt ${i}/${HEALTH_RETRIES}..."

  HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" \
    "${API_URL}/health" \
    --connect-timeout 5 \
    --max-time 10 2>/dev/null || echo "000")

  if [ "${HTTP_STATUS}" = "200" ]; then
    HEALTHY=true
    echo "  Health check passed (HTTP ${HTTP_STATUS})"
    break
  fi

  echo "  Health check returned HTTP ${HTTP_STATUS}, retrying in ${HEALTH_RETRY_DELAY}s..."
  sleep "${HEALTH_RETRY_DELAY}"
done

if [ "${HEALTHY}" != "true" ]; then
  echo ""
  echo "ERROR: API health check failed after ${HEALTH_RETRIES} attempts."
  echo "The API is not healthy after migration. Aborting deployment."
  exit 1
fi

echo ""
echo "============================================"
echo "  APEX Pre-Deploy: PASSED"
echo "  All pre-deploy checks completed successfully."
echo "============================================"
