
  CREATE OR REPLACE EDITIONABLE PROCEDURE "SITPR001" (P_TXTO   IN VARCHAR2,
                                     P_ARCHVO IN VARCHAR2) IS

  V_ARCHVO UTL_FILE.FILE_TYPE;

BEGIN

  -- EUD: 13/05/2008
  -- Objetivo: Generar archivos planos de los logs de procesos incluyendo fecha y hora de escritura en log
  -- Se dise?a este procedimiento almacenado sin llamar a la funcion SITFN001 para evitar recursividad
  -- y manejo de archivos de escritura concurrentes
  -- Modificado: 01/06/2016
  -- RDGM

  V_ARCHVO := UTL_FILE.FOPEN('LOGS', P_ARCHVO, 'a', 5000);
  UTL_FILE.PUT_LINE(V_ARCHVO,
                    TO_CHAR(SYSDATE, 'YYYYMMDD HH24:MI:SS') || '| ' ||
                    P_TXTO);
  UTL_FILE.FCLOSE(V_ARCHVO);
END;
/

