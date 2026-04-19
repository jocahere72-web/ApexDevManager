#!/bin/bash
# ============================================================
# Export a single database object DDL
# Usage: ./oracle/scripts/export-db-object.sh <OBJECT_TYPE> <OBJECT_NAME> [SCHEMA]
#
# OBJECT_TYPE: PACKAGE | PROCEDURE | FUNCTION | VIEW | TRIGGER |
#              TABLE | SEQUENCE | TYPE | INDEX | SYNONYM
#
# Examples:
#   ./oracle/scripts/export-db-object.sh PACKAGE pkg_fi_fiscalizacion
#   ./oracle/scripts/export-db-object.sh VIEW v_fi_cobro_detalle
#   ./oracle/scripts/export-db-object.sh TABLE prescripciones
# ============================================================
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
SQLCL="${SQLCL_PATH:-/Users/jherrera/sqlcl/bin/sql}"
CONN="genesys/qHWp2UNEAigrMT9jk4I2-+@99.0.4.235:1521/GENESYS01"

OBJ_TYPE="${1:?Usage: $0 <OBJECT_TYPE> <OBJECT_NAME> [SCHEMA]}"
OBJ_NAME="${2:?Usage: $0 <OBJECT_TYPE> <OBJECT_NAME> [SCHEMA]}"
SCHEMA="${3:-GENESYS}"

OBJ_TYPE_UPPER=$(echo "${OBJ_TYPE}" | tr '[:lower:]' '[:upper:]')
OBJ_NAME_UPPER=$(echo "${OBJ_NAME}" | tr '[:lower:]' '[:upper:]')
OBJ_NAME_LOWER=$(echo "${OBJ_NAME}" | tr '[:upper:]' '[:lower:]')

DB_DIR="${REPO_ROOT}/oracle/db"
WORK_DIR=$(mktemp -d)
trap "rm -rf ${WORK_DIR}" EXIT

# --- PACKAGE: exports both spec (.pks) and body (.pkb) ---
if [ "${OBJ_TYPE_UPPER}" = "PACKAGE" ]; then
    mkdir -p "${DB_DIR}/packages"

    ${SQLCL} "${CONN}" <<EOSQL
SET LONG 1000000
SET LONGCHUNKSIZE 1000000
SET PAGESIZE 0
SET LINESIZE 32767
SET TRIMSPOOL ON
SET FEEDBACK OFF
SET HEADING OFF
SET ECHO OFF
SET TERMOUT OFF
SET VERIFY OFF

SPOOL ${WORK_DIR}/${OBJ_NAME_LOWER}.pks
SELECT DBMS_METADATA.GET_DDL('PACKAGE_SPEC', '${OBJ_NAME_UPPER}', '${SCHEMA}') FROM DUAL;
SPOOL OFF

SPOOL ${WORK_DIR}/${OBJ_NAME_LOWER}.pkb
SELECT DBMS_METADATA.GET_DDL('PACKAGE_BODY', '${OBJ_NAME_UPPER}', '${SCHEMA}') FROM DUAL;
SPOOL OFF

exit
EOSQL

    cp "${WORK_DIR}/${OBJ_NAME_LOWER}.pks" "${DB_DIR}/packages/"
    cp "${WORK_DIR}/${OBJ_NAME_LOWER}.pkb" "${DB_DIR}/packages/"
    echo "=== Exported: oracle/db/packages/${OBJ_NAME_LOWER}.pks + .pkb ==="
    exit 0
fi

# --- All other object types ---
case "${OBJ_TYPE_UPPER}" in
    PROCEDURE)  DIR="procedures"; DDL_TYPE="PROCEDURE" ;;
    FUNCTION)   DIR="functions";  DDL_TYPE="FUNCTION" ;;
    VIEW)       DIR="views";      DDL_TYPE="VIEW" ;;
    TRIGGER)    DIR="triggers";   DDL_TYPE="TRIGGER" ;;
    TABLE)      DIR="tables";     DDL_TYPE="TABLE" ;;
    SEQUENCE)   DIR="sequences";  DDL_TYPE="SEQUENCE" ;;
    TYPE)       DIR="types";      DDL_TYPE="TYPE" ;;
    INDEX)      DIR="indexes";    DDL_TYPE="INDEX" ;;
    SYNONYM)    DIR="synonyms";   DDL_TYPE="SYNONYM" ;;
    *)
        echo "ERROR: Unknown object type: ${OBJ_TYPE}"
        echo "Valid types: PACKAGE, PROCEDURE, FUNCTION, VIEW, TRIGGER, TABLE, SEQUENCE, TYPE, INDEX, SYNONYM"
        exit 1
        ;;
esac

DEST_DIR="${DB_DIR}/${DIR}"
mkdir -p "${DEST_DIR}"

${SQLCL} "${CONN}" <<EOSQL
SET LONG 1000000
SET LONGCHUNKSIZE 1000000
SET PAGESIZE 0
SET LINESIZE 32767
SET TRIMSPOOL ON
SET FEEDBACK OFF
SET HEADING OFF
SET ECHO OFF
SET TERMOUT OFF
SET VERIFY OFF

SPOOL ${WORK_DIR}/${OBJ_NAME_LOWER}.sql
SELECT DBMS_METADATA.GET_DDL('${DDL_TYPE}', '${OBJ_NAME_UPPER}', '${SCHEMA}') FROM DUAL;
SPOOL OFF

exit
EOSQL

cp "${WORK_DIR}/${OBJ_NAME_LOWER}.sql" "${DEST_DIR}/"
echo "=== Exported: oracle/db/${DIR}/${OBJ_NAME_LOWER}.sql ==="
