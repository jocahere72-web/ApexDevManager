
  CREATE OR REPLACE EDITIONABLE FUNCTION "INITCAP_PERSONALIZADO" (input_text IN VARCHAR2)
RETURN VARCHAR2 IS
  words       SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST();
  formatted   VARCHAR2(4000);
  word        VARCHAR2(4000);
BEGIN
  -- Divide el texto en palabras usando espacio como delimitador
  SELECT CAST(COLLECT(REGEXP_SUBSTR(input_text, '[^ ]+', 1, LEVEL)) AS SYS.ODCIVARCHAR2LIST)
  INTO words
  FROM DUAL
  CONNECT BY REGEXP_SUBSTR(input_text, '[^ ]+', 1, LEVEL) IS NOT NULL;

  -- Recorre las palabras y aplica INITCAP o LOWER según corresponda
  FOR i IN 1..words.COUNT LOOP
    word := words(i);
    IF LENGTH(word) = 1 THEN
      words(i) := LOWER(word);
    ELSE
      words(i) := INITCAP(word);
    END IF;
  END LOOP;

  -- Junta las palabras de nuevo en un texto completo
  SELECT LISTAGG(column_value, ' ') WITHIN GROUP (ORDER BY ROWNUM)
  INTO formatted
  FROM TABLE(words);

  RETURN formatted;
END;
/

