#!/bin/bash
# ============================================================
# Generate deploy scripts from git diff against main
# Usage: ./oracle/scripts/generate-deploy.sh <ISSUE_ID>
# Example: ./oracle/scripts/generate-deploy.sh IT_CP_F_06_0028200
#
# Compares current branch vs main to identify changed Oracle
# objects and generates a deploy folder skeleton.
# ============================================================
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
ISSUE_ID="${1:?Usage: $0 <ISSUE_ID>}"
DEPLOY_DIR="${REPO_ROOT}/deploy/${ISSUE_ID}"

echo "=== Generating deploy package for ${ISSUE_ID} ==="

# Get changed Oracle files vs main
CHANGED_FILES=$(git diff --name-only origin/main...HEAD -- oracle/ 2>/dev/null || \
                git diff --name-only main...HEAD -- oracle/ 2>/dev/null || true)

if [ -z "${CHANGED_FILES}" ]; then
    echo "No oracle/ changes detected vs main."
    echo "Make sure you have exported your DB/APEX changes first."
    exit 0
fi

# Create deploy structure
mkdir -p "${DEPLOY_DIR}/produccion"
mkdir -p "${DEPLOY_DIR}/backup"
mkdir -p "${DEPLOY_DIR}/changelog"

echo ""
echo "Changed Oracle objects:"
echo "${CHANGED_FILES}" | sed 's/^/  /'
echo ""

# Categorize changes
STEP=1
DDL_ITEMS=()
PKG_SPEC_ITEMS=()
PKG_BODY_ITEMS=()
PLSQL_ITEMS=()
VIEW_ITEMS=()
APEX_ITEMS=()

while IFS= read -r f; do
    [ -z "$f" ] && continue
    case "$f" in
        oracle/db/tables/*|oracle/db/indexes/*|oracle/db/sequences/*)
            DDL_ITEMS+=("$f") ;;
        oracle/db/packages/*.pks)
            PKG_SPEC_ITEMS+=("$f") ;;
        oracle/db/packages/*.pkb)
            PKG_BODY_ITEMS+=("$f") ;;
        oracle/db/procedures/*|oracle/db/functions/*|oracle/db/triggers/*)
            PLSQL_ITEMS+=("$f") ;;
        oracle/db/views/*)
            VIEW_ITEMS+=("$f") ;;
        oracle/apex/*)
            APEX_ITEMS+=("$f") ;;
    esac
done <<< "${CHANGED_FILES}"

# Generate numbered SQL scripts

# 1. DDL changes (tables, indexes, sequences) - needs manual ALTER statements
if [ ${#DDL_ITEMS[@]} -gt 0 ]; then
    SCRIPT="${DEPLOY_DIR}/produccion/$(printf '%02d' ${STEP})_ddl.sql"
    cat > "${SCRIPT}" <<EOSQL
-- ============================================================
-- DDL Changes - ${ISSUE_ID}
-- IMPORTANT: Write ALTER TABLE / CREATE INDEX statements here.
-- The files below show the FINAL state; you need the DELTA.
-- ============================================================
EOSQL
    for f in "${DDL_ITEMS[@]}"; do
        echo "-- Changed: ${f}" >> "${SCRIPT}"
    done
    echo "" >> "${SCRIPT}"
    echo "-- TODO: Write your DDL changes below" >> "${SCRIPT}"
    echo "-- Example: ALTER TABLE xxx ADD (column_name VARCHAR2(100));" >> "${SCRIPT}"
    ((STEP++))
fi

# 2. Package specs - copy directly (CREATE OR REPLACE)
for f in "${PKG_SPEC_ITEMS[@]}"; do
    OBJ_NAME=$(basename "$f" .pks)
    SCRIPT="${DEPLOY_DIR}/produccion/$(printf '%02d' ${STEP})_${OBJ_NAME}_spec.sql"
    cp "${REPO_ROOT}/${f}" "${SCRIPT}"
    echo "-- Deploy script generated from: ${f}" >> "${SCRIPT}"
    ((STEP++))
done

# 3. Package bodies - copy directly (CREATE OR REPLACE)
for f in "${PKG_BODY_ITEMS[@]}"; do
    OBJ_NAME=$(basename "$f" .pkb)
    SCRIPT="${DEPLOY_DIR}/produccion/$(printf '%02d' ${STEP})_${OBJ_NAME}_body.sql"
    cp "${REPO_ROOT}/${f}" "${SCRIPT}"
    echo "-- Deploy script generated from: ${f}" >> "${SCRIPT}"
    ((STEP++))
done

# 4. Views - copy directly (CREATE OR REPLACE)
for f in "${VIEW_ITEMS[@]}"; do
    OBJ_NAME=$(basename "$f" .sql)
    SCRIPT="${DEPLOY_DIR}/produccion/$(printf '%02d' ${STEP})_view_${OBJ_NAME}.sql"
    cp "${REPO_ROOT}/${f}" "${SCRIPT}"
    ((STEP++))
done

# 5. Other PL/SQL objects (procedures, functions, triggers)
for f in "${PLSQL_ITEMS[@]}"; do
    OBJ_NAME=$(basename "$f" .sql)
    SCRIPT="${DEPLOY_DIR}/produccion/$(printf '%02d' ${STEP})_${OBJ_NAME}.sql"
    cp "${REPO_ROOT}/${f}" "${SCRIPT}"
    ((STEP++))
done

# 6. APEX changes placeholder
if [ ${#APEX_ITEMS[@]} -gt 0 ]; then
    SCRIPT="${DEPLOY_DIR}/produccion/$(printf '%02d' ${STEP})_apex_changes.sql"
    cat > "${SCRIPT}" <<EOSQL
-- ============================================================
-- APEX Changes - ${ISSUE_ID}
-- Option A: Import the modified app via SQLcl:
--   apex import -file oracle/apex/fXXXXX/install.sql
-- Option B: Write targeted PL/SQL changes below
-- ============================================================
EOSQL
    # Group by app
    declare -A APEX_APPS
    for f in "${APEX_ITEMS[@]}"; do
        APP=$(echo "$f" | sed 's|oracle/apex/\(f[0-9]*\)/.*|\1|')
        APEX_APPS["${APP}"]=1
        echo "-- ${f}" >> "${SCRIPT}"
    done
    echo "" >> "${SCRIPT}"
    echo "-- Apps affected: ${!APEX_APPS[*]}" >> "${SCRIPT}"
    ((STEP++))
fi

# 99. Rollback
cat > "${DEPLOY_DIR}/produccion/99_rollback.sql" <<EOSQL
-- ============================================================
-- ROLLBACK - ${ISSUE_ID}
-- Execute these statements to revert the changes
-- ============================================================

-- TODO: Write rollback statements
-- For packages: compile previous version from backup
-- For DDL: ALTER TABLE DROP COLUMN / DROP INDEX
-- For APEX: import previous version
EOSQL

# Generate CHANGELOG
cat > "${DEPLOY_DIR}/changelog/CHANGELOG.md" <<EOMD
# ${ISSUE_ID}

**Fecha**: $(date '+%Y-%m-%d')
**Branch**: $(git branch --show-current 2>/dev/null || echo 'N/A')
**Autor**: $(git config user.name 2>/dev/null || echo 'N/A')

## Objetos modificados

### Base de datos
$(for f in "${DDL_ITEMS[@]}" "${PKG_SPEC_ITEMS[@]}" "${PKG_BODY_ITEMS[@]}" "${VIEW_ITEMS[@]}" "${PLSQL_ITEMS[@]}"; do
    [ -n "$f" ] && echo "- \`$(basename $f)\` (${f})"
done)

### APEX
$(for f in "${APEX_ITEMS[@]}"; do
    [ -n "$f" ] && echo "- ${f}"
done)

## Descripcion del cambio

TODO: Describir los cambios realizados

## Instrucciones de deploy

1. Ejecutar scripts en orden numerico en \`produccion/\`
2. Validar compilacion sin errores
3. Probar funcionalidad

## Rollback

Ejecutar \`produccion/99_rollback.sql\`
EOMD

echo ""
echo "=== Deploy package generated ==="
echo "Location: deploy/${ISSUE_ID}/"
echo ""
echo "Scripts generados:"
ls -1 "${DEPLOY_DIR}/produccion/"
echo ""
echo "NEXT STEPS:"
echo "  1. Review and complete TODO placeholders in produccion/*.sql"
echo "  2. Fill in changelog/CHANGELOG.md description"
echo "  3. git add deploy/${ISSUE_ID}/ && git commit"
