
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_PRC_LIQUIDAR_CONCEPTOS_ICA" (p_id_declaracion IN NUMBER) IS
  -- Variables Débitos (Deudas)
  v_r20_ica_generado   NUMBER := 0;
  v_r21_avisos         NUMBER := 0;
  v_r23_bomberil       NUMBER := 0;
  v_r30_anticipo_nuevo NUMBER := 0;

  -- Variables auxiliares Sanciones (Sin inicializar para detectar NULL)
  v_aux_sancion_4762 NUMBER;
  v_aux_sancion_4763 NUMBER;
  v_r31_sanciones    NUMBER := 0;

  -- Variables Créditos
  v_r26_exenciones      NUMBER := 0;
  v_r27_retenciones     NUMBER := 0;
  v_r28_autoretenciones NUMBER := 0;
  v_r29_anticipo_viejo  NUMBER := 0;
  v_r32_saldo_favor_ant NUMBER := 0;

  -- Control de saldos
  v_total_creditos   NUMBER := 0;
  v_bolsa_disponible NUMBER := 0;

  -- Finales
  v_con_001_ica       NUMBER := 0;
  v_con_002_avisos    NUMBER := 0;
  v_con_003_bomberil  NUMBER := 0;
  v_con_004_sanciones NUMBER := 0;
  v_con_2057_anticipo NUMBER := 0;

BEGIN
  -- 1. EXTRACCIÓN DE DATOS CON VALIDACIÓN NUMÉRICA
  -- Agregamos AND REGEXP_LIKE(TO_CHAR(VLOR), '^[0-9]+$') para asegurar que solo leemos números.
  -- Si 'VLOR' tiene letras (ej: "MANUAL"), la condición falla y devuelve NULL, evitando el error.

  SELECT
  -- DEUDAS
   NVL(MAX(CASE
             WHEN ID_FRMLRIO_RGION_ATRBTO = 4720 AND
                  REGEXP_LIKE(TO_CHAR(VLOR), '^[0-9\.]+$') THEN
              TO_NUMBER(TO_CHAR(VLOR))
           END),
       0),
   NVL(MAX(CASE
             WHEN ID_FRMLRIO_RGION_ATRBTO = 4721 AND
                  REGEXP_LIKE(TO_CHAR(VLOR), '^[0-9\.]+$') THEN
              TO_NUMBER(TO_CHAR(VLOR))
           END),
       0),
   NVL(MAX(CASE
             WHEN ID_FRMLRIO_RGION_ATRBTO = 4733 AND
                  REGEXP_LIKE(TO_CHAR(VLOR), '^[0-9\.]+$') THEN
              TO_NUMBER(TO_CHAR(VLOR))
           END),
       0),
   NVL(MAX(CASE
             WHEN ID_FRMLRIO_RGION_ATRBTO = 4760 AND
                  REGEXP_LIKE(TO_CHAR(VLOR), '^[0-9\.]+$') THEN
              TO_NUMBER(TO_CHAR(VLOR))
           END),
       0),

   -- SANCIONES (Aquí está el arreglo crítico para el 4762)
   MAX(CASE
         WHEN ID_FRMLRIO_RGION_ATRBTO = 4762 AND
              REGEXP_LIKE(TO_CHAR(VLOR), '^[0-9\.]+$') THEN
          TO_NUMBER(TO_CHAR(VLOR))
       END),
   MAX(CASE
         WHEN ID_FRMLRIO_RGION_ATRBTO = 4763 AND
              REGEXP_LIKE(TO_CHAR(VLOR), '^[0-9\.]+$') THEN
          TO_NUMBER(TO_CHAR(VLOR))
       END),

   -- CRÉDITOS
   NVL(MAX(CASE
             WHEN ID_FRMLRIO_RGION_ATRBTO = 4756 AND
                  REGEXP_LIKE(TO_CHAR(VLOR), '^[0-9\.]+$') THEN
              TO_NUMBER(TO_CHAR(VLOR))
           END),
       0),
   NVL(MAX(CASE
             WHEN ID_FRMLRIO_RGION_ATRBTO = 4757 AND
                  REGEXP_LIKE(TO_CHAR(VLOR), '^[0-9\.]+$') THEN
              TO_NUMBER(TO_CHAR(VLOR))
           END),
       0),
   NVL(MAX(CASE
             WHEN ID_FRMLRIO_RGION_ATRBTO = 4758 AND
                  REGEXP_LIKE(TO_CHAR(VLOR), '^[0-9\.]+$') THEN
              TO_NUMBER(TO_CHAR(VLOR))
           END),
       0),
   NVL(MAX(CASE
             WHEN ID_FRMLRIO_RGION_ATRBTO = 4759 AND
                  REGEXP_LIKE(TO_CHAR(VLOR), '^[0-9\.]+$') THEN
              TO_NUMBER(TO_CHAR(VLOR))
           END),
       0),
   NVL(MAX(CASE
             WHEN ID_FRMLRIO_RGION_ATRBTO = 4773 AND
                  REGEXP_LIKE(TO_CHAR(VLOR), '^[0-9\.]+$') THEN
              TO_NUMBER(TO_CHAR(VLOR))
           END),
       0)
    INTO v_r20_ica_generado,
         v_r21_avisos,
         v_r23_bomberil,
         v_r30_anticipo_nuevo,
         v_aux_sancion_4762,
         v_aux_sancion_4763,
         v_r26_exenciones,
         v_r27_retenciones,
         v_r28_autoretenciones,
         v_r29_anticipo_viejo,
         v_r32_saldo_favor_ant
    FROM gi_g_declaraciones_detalle
   WHERE ID_DCLRCION = p_id_declaracion
     AND ID_FRMLRIO_RGION = 1012;

  -- 1.1 LÓGICA DE SELECCIÓN DE SANCIÓN
  -- Si 4762 tenía texto ("MANUAL"), v_aux_sancion_4762 llegó como NULL gracias al REGEXP_LIKE.
  -- Por lo tanto, el código saltará automáticamente al ELSIF para usar el 4763.

  IF v_aux_sancion_4762 IS NOT NULL THEN
    v_r31_sanciones := v_aux_sancion_4762;
  ELSIF v_aux_sancion_4763 IS NOT NULL THEN
    v_r31_sanciones := v_aux_sancion_4763;
  ELSE
    v_r31_sanciones := 0;
  END IF;

  -- 2. CÁLCULO BOLSA (Resto del código igual...)
  v_total_creditos := v_r26_exenciones + v_r27_retenciones +
                      v_r28_autoretenciones + v_r29_anticipo_viejo +
                      v_r32_saldo_favor_ant;

  v_bolsa_disponible := v_total_creditos;

  -- 3. APLICACIÓN EN CASCADA

  -- PASO A: ICA (001)
  IF v_bolsa_disponible >= v_r20_ica_generado THEN
    v_con_001_ica      := 0;
    v_bolsa_disponible := v_bolsa_disponible - v_r20_ica_generado;
  ELSE
    v_con_001_ica      := v_r20_ica_generado - v_bolsa_disponible;
    v_bolsa_disponible := 0;
  END IF;

  -- PASO B: AVISOS (002)
  IF v_bolsa_disponible > 0 THEN
    IF v_bolsa_disponible >= v_r21_avisos THEN
      v_con_002_avisos   := 0;
      v_bolsa_disponible := v_bolsa_disponible - v_r21_avisos;
    ELSE
      v_con_002_avisos   := v_r21_avisos - v_bolsa_disponible;
      v_bolsa_disponible := 0;
    END IF;
  ELSE
    v_con_002_avisos := v_r21_avisos;
  END IF;

  -- PASO C: BOMBERIL (003)
  IF v_bolsa_disponible > 0 THEN
    IF v_bolsa_disponible >= v_r23_bomberil THEN
      v_con_003_bomberil := 0;
      v_bolsa_disponible := v_bolsa_disponible - v_r23_bomberil;
    ELSE
      v_con_003_bomberil := v_r23_bomberil - v_bolsa_disponible;
      v_bolsa_disponible := 0;
    END IF;
  ELSE
    v_con_003_bomberil := v_r23_bomberil;
  END IF;

  -- PASO D: SANCIONES (004)
  IF v_bolsa_disponible > 0 THEN
    IF v_bolsa_disponible >= v_r31_sanciones THEN
      v_con_004_sanciones := 0;
      v_bolsa_disponible  := v_bolsa_disponible - v_r31_sanciones;
    ELSE
      v_con_004_sanciones := v_r31_sanciones - v_bolsa_disponible;
      v_bolsa_disponible  := 0;
    END IF;
  ELSE
    v_con_004_sanciones := v_r31_sanciones;
  END IF;

  -- PASO E: ANTICIPO (2057)
  IF v_bolsa_disponible > 0 THEN
    IF v_bolsa_disponible >= v_r30_anticipo_nuevo THEN
      v_con_2057_anticipo := 0;
      v_bolsa_disponible  := v_bolsa_disponible - v_r30_anticipo_nuevo;
    ELSE
      v_con_2057_anticipo := v_r30_anticipo_nuevo - v_bolsa_disponible;
      v_bolsa_disponible  := 0;
    END IF;
  ELSE
    v_con_2057_anticipo := v_r30_anticipo_nuevo;
  END IF;

  -- 4. LOG RESULTADOS
  DBMS_OUTPUT.PUT_LINE('=== LIQUIDACION ID: ' || p_id_declaracion ||
                       ' ===');
  DBMS_OUTPUT.PUT_LINE('Sancion 4762 (Valida): ' || v_aux_sancion_4762);
  DBMS_OUTPUT.PUT_LINE('Sancion 4763 (Valida): ' || v_aux_sancion_4763);
  DBMS_OUTPUT.PUT_LINE('Sancion Final Usada: ' || v_r31_sanciones);
  DBMS_OUTPUT.PUT_LINE('-------------------------------------------');
  DBMS_OUTPUT.PUT_LINE('VALORES NETOS A GENERAR (DEUDA):');
  DBMS_OUTPUT.PUT_LINE('19  - 001  - ICA:               ' || v_con_001_ica);
  DBMS_OUTPUT.PUT_LINE('546 - 002  - AVISOS:            ' ||
                       v_con_002_avisos);
  DBMS_OUTPUT.PUT_LINE('547 - 003  - BOMBERIL:          ' ||
                       v_con_003_bomberil);
  DBMS_OUTPUT.PUT_LINE('548 - 004  - SANCIONES:         ' ||
                       v_con_004_sanciones);
  DBMS_OUTPUT.PUT_LINE('659 - 2057 - ANTICIPO:          ' ||
                       v_con_2057_anticipo);
  DBMS_OUTPUT.PUT_LINE('-------------------------------------------');
  DBMS_OUTPUT.PUT_LINE('TOTAL A PAGAR: ' ||
                       (v_con_001_ica + v_con_002_avisos +
                       v_con_003_bomberil + v_con_004_sanciones +
                       v_con_2057_anticipo));

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

