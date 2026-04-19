
  CREATE OR REPLACE EDITIONABLE FUNCTION "JL_GET_MAXLEN" (p_table IN VARCHAR2,
                                         p_col   IN VARCHAR2,
                                         p_owner IN VARCHAR2 DEFAULT USER)
  RETURN NUMBER IS
  v_len NUMBER;
BEGIN
  SELECT data_length
    INTO v_len
    FROM all_tab_columns
   WHERE owner = UPPER(p_owner)
     AND table_name = UPPER(p_table)
     AND column_name = UPPER(p_col);

  RETURN v_len; -- en bytes (BYTE semantics)
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN NULL; -- columna no existe
  WHEN OTHERS THEN
    RETURN NULL; -- cualquier otro error
END;
/

