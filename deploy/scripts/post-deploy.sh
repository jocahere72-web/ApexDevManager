#!/usr/bin/env bash
set -euo pipefail

# ==============================================================================
# Post-Deploy Script for APEX Dev Manager
# Waits for rollout completion, runs smoke tests, and sends notifications.
# ==============================================================================

HELM_NAMESPACE="${HELM_NAMESPACE:-apex}"
HELM_RELEASE_NAME="${HELM_RELEASE_NAME:-apex}"
ROLLOUT_TIMEOUT="${ROLLOUT_TIMEOUT:-300s}"
SMOKE_RETRIES="${SMOKE_RETRIES:-15}"
SMOKE_RETRY_DELAY="${SMOKE_RETRY_DELAY:-10}"
API_URL="${API_EXTERNAL_URL:-http://localhost:3000}"
OCI_TOPIC_OCID="${OCI_NOTIFICATION_TOPIC_OCID:-}"

echo "============================================"
echo "  APEX Post-Deploy: Starting"
echo "  Environment: ${DEPLOY_ENVIRONMENT:-unknown}"
echo "  Timestamp: $(date -u +"%Y-%m-%dT%H:%M:%SZ")"
echo "============================================"

# --------------------------------------------------------------------------
# Step 1: Wait for rollout to complete
# --------------------------------------------------------------------------
echo ""
echo "[1/3] Waiting for API deployment rollout..."

if ! kubectl rollout status deployment/${HELM_RELEASE_NAME}-api \
  --namespace "${HELM_NAMESPACE}" \
  --timeout="${ROLLOUT_TIMEOUT}"; then
  echo "ERROR: API deployment rollout failed or timed out."
  exit 1
fi

echo "API deployment rollout completed."

echo ""
echo "[1/3] Waiting for Web deployment rollout..."

if ! kubectl rollout status deployment/${HELM_RELEASE_NAME}-web \
  --namespace "${HELM_NAMESPACE}" \
  --timeout="${ROLLOUT_TIMEOUT}"; then
  echo "ERROR: Web deployment rollout failed or timed out."
  exit 1
fi

echo "Web deployment rollout completed."

# --------------------------------------------------------------------------
# Step 2: Run smoke tests
# --------------------------------------------------------------------------
echo ""
echo "[2/3] Running smoke tests..."

SMOKE_PASSED=false
for i in $(seq 1 "${SMOKE_RETRIES}"); do
  echo "  Smoke test attempt ${i}/${SMOKE_RETRIES}..."

  HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" \
    "${API_URL}/health" \
    --connect-timeout 5 \
    --max-time 10 2>/dev/null || echo "000")

  if [ "${HTTP_STATUS}" = "200" ]; then
    SMOKE_PASSED=true
    echo "  Smoke test passed (HTTP ${HTTP_STATUS})"
    break
  fi

  echo "  Smoke test returned HTTP ${HTTP_STATUS}, retrying in ${SMOKE_RETRY_DELAY}s..."
  sleep "${SMOKE_RETRY_DELAY}"
done

if [ "${SMOKE_PASSED}" != "true" ]; then
  echo ""
  echo "ERROR: Smoke tests failed after ${SMOKE_RETRIES} attempts."
  echo "The deployment may be unhealthy."

  # Send failure notification
  if [ -n "${OCI_TOPIC_OCID}" ]; then
    oci ons message publish \
      --topic-id "${OCI_TOPIC_OCID}" \
      --title "APEX Deploy FAILED - ${DEPLOY_ENVIRONMENT:-unknown}" \
      --body "Smoke tests failed after deployment to ${DEPLOY_ENVIRONMENT:-unknown} environment. Immediate attention required." \
      2>/dev/null || echo "WARNING: Failed to send OCI notification."
  fi

  exit 1
fi

# --------------------------------------------------------------------------
# Step 3: Send success notification via OCI Notification Service
# --------------------------------------------------------------------------
echo ""
echo "[3/3] Sending deployment notification..."

if [ -n "${OCI_TOPIC_OCID}" ]; then
  DEPLOY_MSG="APEX deployed successfully to ${DEPLOY_ENVIRONMENT:-unknown}.
Build: ${OCI_BUILD_RUN_ID:-unknown}
Timestamp: $(date -u +"%Y-%m-%dT%H:%M:%SZ")
Health: OK"

  oci ons message publish \
    --topic-id "${OCI_TOPIC_OCID}" \
    --title "APEX Deploy SUCCESS - ${DEPLOY_ENVIRONMENT:-unknown}" \
    --body "${DEPLOY_MSG}" \
    2>/dev/null || echo "WARNING: Failed to send OCI notification."

  echo "Notification sent."
else
  echo "No OCI_NOTIFICATION_TOPIC_OCID configured. Skipping notification."
fi

echo ""
echo "============================================"
echo "  APEX Post-Deploy: PASSED"
echo "  Deployment verified successfully."
echo "============================================"
