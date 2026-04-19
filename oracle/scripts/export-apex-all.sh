#!/bin/bash
# ============================================================
# Export ALL APEX applications in split format (baseline)
# Usage: ./oracle/scripts/export-apex-all.sh
# ============================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# All Taxation Smart APEX apps (GENESYS schema)
APPS=(50000 60000 62000 63000 64000 65000 66000 67000 68000 69000
      70000 71000 72000 73000 74000 75000 80000 140000 150000
      220000 900000)

FAILED=()
EXPORTED=0

for APP_ID in "${APPS[@]}"; do
    echo ""
    echo "========================================"
    echo "Exporting App ${APP_ID}..."
    echo "========================================"
    if "${SCRIPT_DIR}/export-apex-app.sh" "${APP_ID}"; then
        ((EXPORTED++))
    else
        FAILED+=("${APP_ID}")
        echo "WARNING: Failed to export App ${APP_ID}"
    fi
done

# App 330000 (Infoanalitica) - different schema: TAX_ANALYTICS
# Uncomment and set the correct connection string to export this app:
# echo ""
# echo "========================================"
# echo "Exporting App 330000 (TAX_ANALYTICS)..."
# echo "========================================"
# "${SCRIPT_DIR}/export-apex-app.sh" 330000 "tax_analytics/PASSWORD@99.0.4.235:1521/GENESYS01"

echo ""
echo "========================================"
echo "=== Export Summary ==="
echo "Exported: ${EXPORTED}/${#APPS[@]} apps"
if [ ${#FAILED[@]} -gt 0 ]; then
    echo "Failed: ${FAILED[*]}"
fi
echo "========================================"
