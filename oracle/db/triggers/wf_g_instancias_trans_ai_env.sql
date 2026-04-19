
  CREATE OR REPLACE EDITIONABLE TRIGGER "WF_G_INSTANCIAS_TRANS_AI_ENV"
  FOR INSERT OR UPDATE ON wf_g_instancias_transicion
  COMPOUND TRIGGER

  -- 1. Estructura para guardar en memoria qué pasó en cada fila
  TYPE t_registro IS RECORD(
    id_trnscion    wf_g_instancias_transicion.id_instncia_trnscion%TYPE,
    id_fljo        wf_g_instancias_transicion.id_instncia_fljo%TYPE,
    id_usrio_new   wf_g_instancias_transicion.id_usrio%TYPE,
    id_usrio_old   wf_g_instancias_transicion.id_usrio%TYPE,
    tipo_operacion VARCHAR2(10) -- 'INSERT' o 'UPDATE'
    );

  TYPE t_lista IS TABLE OF t_registro INDEX BY PLS_INTEGER;
  v_lista t_lista;

  -- Variables globales
  v_cdgo_clnte   df_s_clientes.cdgo_clnte%TYPE;
  v_plsql_block  VARCHAR2(4000);
  v_job_number   BINARY_INTEGER;
  v_json_prmtros VARCHAR2(4000);
  v_enviar       BOOLEAN;
  v_usrio_hist   NUMBER;

  -- =================================================================
  -- PASO 1: Capturar datos (Row Level) - Aquí NO consultamos, solo guardamos
  -- =================================================================
  AFTER EACH ROW IS
    v_idx NUMBER := v_lista.COUNT + 1;
  BEGIN
    v_lista(v_idx).id_trnscion := :new.id_instncia_trnscion;
    v_lista(v_idx).id_fljo := :new.id_instncia_fljo;
    v_lista(v_idx).id_usrio_new := :new.id_usrio;

    IF UPDATING THEN
      v_lista(v_idx).id_usrio_old := :old.id_usrio;
      v_lista(v_idx).tipo_operacion := 'UPDATE';
    ELSE
      v_lista(v_idx).tipo_operacion := 'INSERT';
    END IF;
  END AFTER EACH ROW;

  -- =================================================================
  -- PASO 2: Procesar lógica (Statement Level) - Aquí validamos historia
  -- =================================================================
  AFTER STATEMENT IS
  BEGIN
    -- 2.1 Buscamos cliente activo (una sola vez)
    BEGIN
      SELECT t.cdgo_clnte
        INTO v_cdgo_clnte
        FROM df_s_clientes t
       WHERE t.actvo = 'S'
         AND ROWNUM = 1;
    EXCEPTION
      WHEN OTHERS THEN
        v_cdgo_clnte := NULL;
    END;

    -- Si hay cliente, procesamos
    IF v_cdgo_clnte IS NOT NULL THEN

      -- Recorremos las filas afectadas (normalmente 1)
      FOR i IN 1 .. v_lista.COUNT LOOP
        v_enviar := FALSE;

        -------------------------------------------------------------
        -- CASO A: ES UN UPDATE
        -- Regla: Solo enviar si el usuario cambió respecto al anterior (:OLD)
        -------------------------------------------------------------
        IF v_lista(i).tipo_operacion = 'UPDATE' THEN

          IF NVL(v_lista(i).id_usrio_old, -999) <>
             NVL(v_lista(i).id_usrio_new, -999) THEN
            v_enviar := TRUE;
          END IF;

          -------------------------------------------------------------
          -- CASO B: ES UN INSERT
          -- Regla: Buscar el ÚLTIMO registro histórico.
          -- Si el usuario insertado es IGUAL al último histórico -> NO ENVIAR (Silencio)
          -------------------------------------------------------------
        ELSIF v_lista(i).tipo_operacion = 'INSERT' THEN

          v_usrio_hist := NULL;
          BEGIN
            -- Busca el registro inmediatamente anterior a este insert
            SELECT id_usrio
              INTO v_usrio_hist
              FROM (SELECT id_usrio
                      FROM wf_g_instancias_transicion
                     WHERE id_instncia_fljo = v_lista(i).id_fljo
                       AND id_instncia_trnscion < v_lista(i).id_trnscion
                     ORDER BY id_instncia_trnscion DESC)
             WHERE ROWNUM = 1;
          EXCEPTION
            WHEN NO_DATA_FOUND THEN
              v_usrio_hist := -999; -- Es el primer registro de la historia
          END;

          -- Si el usuario NUEVO es DIFERENTE al HISTÓRICO, enviamos.
          -- Si son iguales, v_enviar se queda en FALSE (evitamos duplicado)
          IF NVL(v_lista(i).id_usrio_new, -888) <> v_usrio_hist THEN
            v_enviar := TRUE;
          END IF;

        END IF;

        -------------------------------------------------------------
        -- EJECUCIÓN DEL JOB (Solo si v_enviar es TRUE)
        -------------------------------------------------------------
        IF v_enviar THEN
          v_json_prmtros := '{ "id_instncia_trnscion" : ' || v_lista(i).id_trnscion || ' }';

          v_plsql_block := 'BEGIN ' ||
                           '  pkg_ma_envios.prc_co_envio_programado(' ||
                           '    p_cdgo_clnte   => ' || v_cdgo_clnte || ', ' ||
                           '    p_idntfcdor    => ''asignacionInstancia'', ' ||
                           '    p_json_prmtros => ''' || v_json_prmtros || '''' ||
                           '  ); ' || 'END;';

          DBMS_JOB.SUBMIT(job       => v_job_number,
                          what      => v_plsql_block,
                          next_date => SYSDATE);
        END IF;

      END LOOP;
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      NULL;
  END AFTER STATEMENT;

END;


/
ALTER TRIGGER "WF_G_INSTANCIAS_TRANS_AI_ENV" ENABLE;

