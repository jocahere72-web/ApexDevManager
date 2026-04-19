#!/bin/bash
# ============================================================
# Export a single APEX application in split format
# Usage: ./oracle/scripts/export-apex-app.sh <APP_ID> [CONN_STRING]
# Example: ./oracle/scripts/export-apex-app.sh 74000
# Example: ./oracle/scripts/export-apex-app.sh 330000 "tax_analytics/pass@host:1521/SID"
# ============================================================
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
SQLCL="${SQLCL_PATH:-/Users/jherrera/sqlcl/bin/sql}"
DEFAULT_CONN="genesys/qHWp2UNEAigrMT9jk4I2-+@99.0.4.235:1521/GENESYS01"

APP_ID="${1:?Usage: $0 <APP_ID> [CONN_STRING]}"
CONN="${2:-$DEFAULT_CONN}"
EXPORT_DIR="${REPO_ROOT}/oracle/apex"

echo "=== Exporting APEX App ${APP_ID} (split format) ==="

# Create temp working directory
WORK_DIR=$(mktemp -d)
trap "rm -rf ${WORK_DIR}" EXIT

cd "${WORK_DIR}"

# SQLcl APEX export with -split
# -skipExportDate: prevents timestamp noise in git diffs
# -expOriginalIds: preserves component IDs for conflict detection
${SQLCL} "${CONN}" <<EOSQL
apex export -applicationid ${APP_ID} -split -skipExportDate -expOriginalIds
exit
EOSQL

# The export creates f${APP_ID}/ in current directory
if [ ! -d "f${APP_ID}" ]; then
    echo "ERROR: Export directory f${APP_ID} not found. Check APP_ID and connection."
    exit 1
fi

# Remove old version and copy new
rm -rf "${EXPORT_DIR}/f${APP_ID}"
mkdir -p "${EXPORT_DIR}"
cp -r "f${APP_ID}" "${EXPORT_DIR}/f${APP_ID}"

FILE_COUNT=$(find "${EXPORT_DIR}/f${APP_ID}" -type f | wc -l | tr -d ' ')
echo "=== Export complete: oracle/apex/f${APP_ID}/ (${FILE_COUNT} files) ==="
