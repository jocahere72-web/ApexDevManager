#!/usr/bin/env bash
set -euo pipefail

# ==============================================================================
# Rollback Script for APEX Dev Manager
# Rolls back Helm releases to the previous revision and verifies health.
# ==============================================================================

HELM_NAMESPACE="${HELM_NAMESPACE:-apex}"
HELM_RELEASE_NAME="${HELM_RELEASE_NAME:-apex}"
HEALTH_RETRIES="${HEALTH_RETRIES:-15}"
HEALTH_RETRY_DELAY="${HEALTH_RETRY_DELAY:-10}"
API_URL="${API_EXTERNAL_URL:-http://localhost:3000}"
OCI_TOPIC_OCID="${OCI_NOTIFICATION_TOPIC_OCID:-}"
ROLLBACK_TIMEOUT="${ROLLBACK_TIMEOUT:-300}"

echo "============================================"
echo "  APEX Rollback: Starting"
echo "  Environment: ${DEPLOY_ENVIRONMENT:-unknown}"
echo "  Timestamp: $(date -u +"%Y-%m-%dT%H:%M:%SZ")"
echo "============================================"

# --------------------------------------------------------------------------
# Step 1: Capture current revision info before rollback
# --------------------------------------------------------------------------
echo ""
echo "[1/4] Capturing current revision info..."

API_CURRENT_REV=$(helm history "${HELM_RELEASE_NAME}-api" \
  --namespace "${HELM_NAMESPACE}" \
  --max 1 \
  --output json 2>/dev/null | jq -r '.[0].revision' || echo "unknown")

WEB_CURRENT_REV=$(helm history "${HELM_RELEASE_NAME}-web" \
  --namespace "${HELM_NAMESPACE}" \
  --max 1 \
  --output json 2>/dev/null | jq -r '.[0].revision' || echo "unknown")

echo "  API current revision: ${API_CURRENT_REV}"
echo "  Web current revision: ${WEB_CURRENT_REV}"

# --------------------------------------------------------------------------
# Step 2: Rollback Helm releases to previous revision
# --------------------------------------------------------------------------
echo ""
echo "[2/4] Rolling back API to previous revision..."

if ! helm rollback "${HELM_RELEASE_NAME}-api" 0 \
  --namespace "${HELM_NAMESPACE}" \
  --timeout "${ROLLBACK_TIMEOUT}s" \
  --wait; then
  echo "ERROR: API rollback failed."
  exit 1
fi

echo "API rollback completed."

echo ""
echo "Rolling back Web to previous revision..."

if ! helm rollback "${HELM_RELEASE_NAME}-web" 0 \
  --namespace "${HELM_NAMESPACE}" \
  --timeout "${ROLLBACK_TIMEOUT}s" \
  --wait; then
  echo "ERROR: Web rollback failed."
  exit 1
fi

echo "Web rollback completed."

# --------------------------------------------------------------------------
# Step 3: Verify health after rollback
# --------------------------------------------------------------------------
echo ""
echo "[3/4] Verifying health after rollback..."

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
  echo "CRITICAL: Health check failed after rollback!"
  echo "Manual intervention required."

  if [ -n "${OCI_TOPIC_OCID}" ]; then
    oci ons message publish \
      --topic-id "${OCI_TOPIC_OCID}" \
      --title "APEX Rollback CRITICAL - ${DEPLOY_ENVIRONMENT:-unknown}" \
      --body "Rollback completed but health check failed. Manual intervention required. Environment: ${DEPLOY_ENVIRONMENT:-unknown}" \
      2>/dev/null || echo "WARNING: Failed to send OCI notification."
  fi

  exit 1
fi

# --------------------------------------------------------------------------
# Step 4: Notify team of rollback
# --------------------------------------------------------------------------
echo ""
echo "[4/4] Sending rollback notification..."

if [ -n "${OCI_TOPIC_OCID}" ]; then
  ROLLBACK_MSG="APEX rolled back successfully in ${DEPLOY_ENVIRONMENT:-unknown}.
API: revision ${API_CURRENT_REV} -> previous
Web: revision ${WEB_CURRENT_REV} -> previous
Timestamp: $(date -u +"%Y-%m-%dT%H:%M:%SZ")
Health: OK
Action: Investigate the failed deployment before re-deploying."

  oci ons message publish \
    --topic-id "${OCI_TOPIC_OCID}" \
    --title "APEX Rollback SUCCESS - ${DEPLOY_ENVIRONMENT:-unknown}" \
    --body "${ROLLBACK_MSG}" \
    2>/dev/null || echo "WARNING: Failed to send OCI notification."

  echo "Notification sent."
else
  echo "No OCI_NOTIFICATION_TOPIC_OCID configured. Skipping notification."
fi

echo ""
echo "============================================"
echo "  APEX Rollback: COMPLETED"
echo "  Services rolled back and verified."
echo "============================================"
