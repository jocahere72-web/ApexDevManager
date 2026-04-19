#!/bin/bash
# ============================================================
# Export ALL database objects from GENESYS schema (baseline)
# Usage: ./oracle/scripts/export-db-all.sh [SCHEMA]
#
# Exports each object type using DBMS_METADATA in a single
# SQLcl session per type for efficiency.
# ============================================================
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
SQLCL="${SQLCL_PATH:-/Users/jherrera/sqlcl/bin/sql}"
CONN="genesys/qHWp2UNEAigrMT9jk4I2-+@99.0.4.235:1521/GENESYS01"
SCHEMA="${1:-GENESYS}"

DB_DIR="${REPO_ROOT}/oracle/db"

echo "=== Full ${SCHEMA} schema export ==="
echo "=== This may take several minutes ==="

WORK_DIR=$(mktemp -d)
trap "rm -rf ${WORK_DIR}" EXIT

# Create output directories
mkdir -p "${DB_DIR}"/{packages,procedures,functions,views,tables,triggers,types,sequences,indexes,synonyms,grants}

# Generate a PL/SQL script that exports all objects using DBMS_METADATA
cat > "${WORK_DIR}/export_all.sql" <<'EOSQL'
SET LONG 1000000
SET LONGCHUNKSIZE 1000000
SET PAGESIZE 0
SET LINESIZE 32767
SET TRIMSPOOL ON
SET FEEDBACK OFF
SET HEADING OFF
SET ECHO OFF
SET TERMOUT ON
SET VERIFY OFF

-- Disable storage/tablespace/schema in metadata
BEGIN
  DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'STORAGE', FALSE);
  DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'TABLESPACE', FALSE);
  DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'SEGMENT_ATTRIBUTES', FALSE);
  DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'EMIT_SCHEMA', FALSE);
  DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'SQLTERMINATOR', TRUE);
END;
/

EOSQL

# Function to add export block for a given object type
add_export_block() {
    local OBJ_TYPE="$1"
    local DDL_TYPE="$2"
    local OUT_DIR="$3"
    local EXT="$4"

    cat >> "${WORK_DIR}/export_all.sql" <<EOSQL
PROMPT Exporting ${OBJ_TYPE}s...

DECLARE
  v_ddl CLOB;
  v_name VARCHAR2(128);
  CURSOR c_objs IS
    SELECT object_name FROM all_objects
    WHERE owner = '${SCHEMA}' AND object_type = '${OBJ_TYPE}'
    ORDER BY object_name;
BEGIN
  FOR r IN c_objs LOOP
    BEGIN
      v_ddl := DBMS_METADATA.GET_DDL('${DDL_TYPE}', r.object_name, '${SCHEMA}');
      v_name := LOWER(r.object_name);
      -- Write to file using SPOOL workaround: insert into temp table
      INSERT INTO export_temp (obj_type, obj_name, obj_ddl) VALUES ('${OUT_DIR}', v_name || '.${EXT}', v_ddl);
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('WARN: Cannot export ${OBJ_TYPE} ' || r.object_name || ': ' || SQLERRM);
    END;
  END LOOP;
  COMMIT;
END;
/

EOSQL
}

# We need a temp table approach since SPOOL can't dynamically change filenames in PL/SQL.
# Instead, we'll generate individual SPOOL commands from a query of object names.

# Rewrite: generate a script that SPOOLs each object individually
cat > "${WORK_DIR}/export_all.sql" <<EOSQL
SET LONG 1000000
SET LONGCHUNKSIZE 1000000
SET PAGESIZE 0
SET LINESIZE 32767
SET TRIMSPOOL ON
SET FEEDBACK OFF
SET HEADING OFF
SET ECHO OFF
SET VERIFY OFF

BEGIN
  DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'STORAGE', FALSE);
  DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'TABLESPACE', FALSE);
  DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'SEGMENT_ATTRIBUTES', FALSE);
  DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'EMIT_SCHEMA', FALSE);
  DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'SQLTERMINATOR', TRUE);
END;
/

-- Generate spool script for all objects
SET SERVEROUTPUT ON SIZE UNLIMITED
SET FEEDBACK OFF

SPOOL ${WORK_DIR}/spool_commands.sql

-- Packages (spec)
SELECT 'SPOOL ${WORK_DIR}/packages/' || LOWER(object_name) || '.pks' || CHR(10) ||
       'SELECT DBMS_METADATA.GET_DDL(''PACKAGE_SPEC'', ''' || object_name || ''', ''${SCHEMA}'') FROM DUAL;' || CHR(10) ||
       'SPOOL OFF' AS cmd
FROM all_objects WHERE owner = '${SCHEMA}' AND object_type = 'PACKAGE' ORDER BY object_name;

-- Packages (body)
SELECT 'SPOOL ${WORK_DIR}/packages/' || LOWER(object_name) || '.pkb' || CHR(10) ||
       'SELECT DBMS_METADATA.GET_DDL(''PACKAGE_BODY'', ''' || object_name || ''', ''${SCHEMA}'') FROM DUAL;' || CHR(10) ||
       'SPOOL OFF' AS cmd
FROM all_objects WHERE owner = '${SCHEMA}' AND object_type = 'PACKAGE BODY' ORDER BY object_name;

-- Procedures
SELECT 'SPOOL ${WORK_DIR}/procedures/' || LOWER(object_name) || '.sql' || CHR(10) ||
       'SELECT DBMS_METADATA.GET_DDL(''PROCEDURE'', ''' || object_name || ''', ''${SCHEMA}'') FROM DUAL;' || CHR(10) ||
       'SPOOL OFF' AS cmd
FROM all_objects WHERE owner = '${SCHEMA}' AND object_type = 'PROCEDURE' ORDER BY object_name;

-- Functions
SELECT 'SPOOL ${WORK_DIR}/functions/' || LOWER(object_name) || '.sql' || CHR(10) ||
       'SELECT DBMS_METADATA.GET_DDL(''FUNCTION'', ''' || object_name || ''', ''${SCHEMA}'') FROM DUAL;' || CHR(10) ||
       'SPOOL OFF' AS cmd
FROM all_objects WHERE owner = '${SCHEMA}' AND object_type = 'FUNCTION' ORDER BY object_name;

-- Views
SELECT 'SPOOL ${WORK_DIR}/views/' || LOWER(object_name) || '.sql' || CHR(10) ||
       'SELECT DBMS_METADATA.GET_DDL(''VIEW'', ''' || object_name || ''', ''${SCHEMA}'') FROM DUAL;' || CHR(10) ||
       'SPOOL OFF' AS cmd
FROM all_objects WHERE owner = '${SCHEMA}' AND object_type = 'VIEW' ORDER BY object_name;

-- Triggers
SELECT 'SPOOL ${WORK_DIR}/triggers/' || LOWER(object_name) || '.sql' || CHR(10) ||
       'SELECT DBMS_METADATA.GET_DDL(''TRIGGER'', ''' || object_name || ''', ''${SCHEMA}'') FROM DUAL;' || CHR(10) ||
       'SPOOL OFF' AS cmd
FROM all_objects WHERE owner = '${SCHEMA}' AND object_type = 'TRIGGER' ORDER BY object_name;

-- Tables
SELECT 'SPOOL ${WORK_DIR}/tables/' || LOWER(object_name) || '.sql' || CHR(10) ||
       'SELECT DBMS_METADATA.GET_DDL(''TABLE'', ''' || object_name || ''', ''${SCHEMA}'') FROM DUAL;' || CHR(10) ||
       'SPOOL OFF' AS cmd
FROM all_objects WHERE owner = '${SCHEMA}' AND object_type = 'TABLE'
AND object_name NOT LIKE 'SYS_%' AND object_name NOT LIKE 'BIN$%'
ORDER BY object_name;

-- Sequences
SELECT 'SPOOL ${WORK_DIR}/sequences/' || LOWER(object_name) || '.sql' || CHR(10) ||
       'SELECT DBMS_METADATA.GET_DDL(''SEQUENCE'', ''' || object_name || ''', ''${SCHEMA}'') FROM DUAL;' || CHR(10) ||
       'SPOOL OFF' AS cmd
FROM all_objects WHERE owner = '${SCHEMA}' AND object_type = 'SEQUENCE' ORDER BY object_name;

-- Types
SELECT 'SPOOL ${WORK_DIR}/types/' || LOWER(object_name) || '.sql' || CHR(10) ||
       'SELECT DBMS_METADATA.GET_DDL(''TYPE_SPEC'', ''' || object_name || ''', ''${SCHEMA}'') FROM DUAL;' || CHR(10) ||
       'SPOOL OFF' AS cmd
FROM all_objects WHERE owner = '${SCHEMA}' AND object_type = 'TYPE' ORDER BY object_name;

-- Synonyms
SELECT 'SPOOL ${WORK_DIR}/synonyms/' || LOWER(object_name) || '.sql' || CHR(10) ||
       'SELECT DBMS_METADATA.GET_DDL(''SYNONYM'', ''' || object_name || ''', ''${SCHEMA}'') FROM DUAL;' || CHR(10) ||
       'SPOOL OFF' AS cmd
FROM all_objects WHERE owner = '${SCHEMA}' AND object_type = 'SYNONYM' ORDER BY object_name;

SPOOL OFF

exit
EOSQL

echo "=== Phase 1: Generating export script ==="

# Create subdirs in work dir
mkdir -p "${WORK_DIR}"/{packages,procedures,functions,views,tables,triggers,types,sequences,synonyms}

# Run phase 1: generate spool commands
${SQLCL} "${CONN}" @"${WORK_DIR}/export_all.sql"

# Check if spool_commands.sql was generated
if [ ! -f "${WORK_DIR}/spool_commands.sql" ]; then
    echo "ERROR: Failed to generate spool commands"
    exit 1
fi

echo "=== Phase 2: Executing exports ==="

# Run phase 2: execute the generated spool commands
${SQLCL} "${CONN}" <<EOSQL
SET LONG 1000000
SET LONGCHUNKSIZE 1000000
SET PAGESIZE 0
SET LINESIZE 32767
SET TRIMSPOOL ON
SET FEEDBACK OFF
SET HEADING OFF
SET ECHO OFF
SET VERIFY OFF

BEGIN
  DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'STORAGE', FALSE);
  DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'TABLESPACE', FALSE);
  DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'SEGMENT_ATTRIBUTES', FALSE);
  DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'EMIT_SCHEMA', FALSE);
  DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'SQLTERMINATOR', TRUE);
END;
/

@${WORK_DIR}/spool_commands.sql

exit
EOSQL

echo "=== Phase 3: Copying to oracle/db/ ==="

# Copy exported files to oracle/db/
for TYPE in packages procedures functions views tables triggers types sequences synonyms; do
    if [ -d "${WORK_DIR}/${TYPE}" ]; then
        DEST="${DB_DIR}/${TYPE}"
        mkdir -p "${DEST}"
        FILE_COUNT=$(find "${WORK_DIR}/${TYPE}" -type f 2>/dev/null | wc -l | tr -d ' ')
        if [ "${FILE_COUNT}" -gt 0 ]; then
            cp "${WORK_DIR}/${TYPE}"/* "${DEST}/" 2>/dev/null || true
            echo "  ${TYPE}: ${FILE_COUNT} files"
        fi
    fi
done

# Count total exported files
TOTAL=$(find "${DB_DIR}" -type f \( -name "*.sql" -o -name "*.pks" -o -name "*.pkb" \) 2>/dev/null | wc -l | tr -d ' ')

echo ""
echo "=== Baseline export complete ==="
echo "Total files: ${TOTAL}"
