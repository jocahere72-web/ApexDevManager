
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_MIGRA_RECAUDOS_2026_3" (P_CDGO_CLNTE IN VARCHAR2,
                                                      P_ID_USRIO   IN NUMBER,
                                                      O_MNSJE      OUT VARCHAR2) IS

  CURSOR C0 IS
    SELECT TRUNC(A.FCHA_PGO) FCHA_PGO,
           A.ID_BNCO,
           A.ID_BNCO_CNTA,
           COUNT(*) CNTDAD,
           SUM(A.VLOR_PGO) VLOR_PGO
      FROM MIGRA.MG_G_INTERMEDIA_IPU_RECAUDO_2026_MAESTRO A
     WHERE A.ESTDO_RGSTRO = 'L'
     GROUP BY TRUNC(A.FCHA_PGO), A.ID_BNCO, A.ID_BNCO_CNTA
     ORDER BY TRUNC(A.FCHA_PGO), A.ID_BNCO, A.ID_BNCO_CNTA;

  CURSOR C1(R_FCHA_PGO DATE, R_ID_BNCO NUMBER, R_ID_BNCO_CNTA NUMBER) IS
    SELECT *
      FROM MIGRA.MG_G_INTERMEDIA_IPU_RECAUDO_2026_MAESTRO A
     WHERE TRUNC(A.FCHA_PGO) = TRUNC(R_FCHA_PGO)
       AND A.ID_BNCO = R_ID_BNCO
       AND A.ID_BNCO_CNTA = R_ID_BNCO_CNTA
       AND A.ESTDO_RGSTRO = 'L'
     ORDER BY A.NMRO_DCMNTO;

  CURSOR C2(R_ID_INTRMDIA_MSTRO NUMBER) IS
    SELECT VGNCIA,
           ID_PRDO,
           ID_CNCPTO_CPTAL,
           SUM(PGDO_CPTAL) PGDO_CPTAL,
           SUM(PGDO_INTRES) PGDO_INTRES,
           SUM(PGDO_CPTAL) + SUM(PGDO_INTRES) PGDO_CNCPTO
      FROM (SELECT VGNCIA,
                   ID_PRDO,
                   ID_CNCPTO_CPTAL,
                   A.TPO_CNCPTO,
                   DECODE(A.TPO_CNCPTO, 'C', SUM(A.VLOR_PGDO), 0) PGDO_CPTAL,
                   DECODE(A.TPO_CNCPTO, 'I', SUM(A.VLOR_PGDO), 0) PGDO_INTRES
              FROM MIGRA.MG_G_INTERMEDIA_IPU_RECAUDO_2026_DETALLE A
             WHERE A.ID_INTRMDIA_MSTRO = R_ID_INTRMDIA_MSTRO
             GROUP BY VGNCIA, ID_PRDO, A.TPO_CNCPTO, ID_CNCPTO_CPTAL)
     GROUP BY VGNCIA, ID_PRDO, ID_CNCPTO_CPTAL
     ORDER BY VGNCIA, ID_PRDO, ID_CNCPTO_CPTAL;

  V_CDGO_CLNTE        DF_S_CLIENTES.CDGO_CLNTE%TYPE;
  V_ID_IMPSTO         DF_C_IMPUESTOS.ID_IMPSTO%TYPE;
  V_ID_IMPSTO_SBMPSTO DF_I_IMPUESTOS_SUBIMPUESTO.ID_IMPSTO_SBMPSTO%TYPE;
  V_ID_IMPSTO_ACTO    DF_I_IMPUESTOS_ACTO.ID_IMPSTO_ACTO%TYPE;

  V_ID_RCDO_CNTROL RE_G_RECAUDOS_CONTROL.ID_RCDO_CNTROL%TYPE;
  V_ID_RCDO        RE_G_RECAUDOS.ID_RCDO%TYPE;

  V_CNTDOR NUMBER;
  V_TXTO   VARCHAR2(4000);

  V_MNSJE_ERROR VARCHAR2(4000);

  V_ARCHVO       VARCHAR2(200);
  V_ARCHVO_CMMIT VARCHAR2(200);
  V_ARCHVO_ERROR VARCHAR2(200);
  V_FCHA_HRA     VARCHAR2(50);

BEGIN

  V_FCHA_HRA := TO_CHAR(SYSDATE, 'yyyymmdd_hh24miss');

  V_ARCHVO       := 'PRC_MIGRA_RECAUDOS_2026_2_' || V_FCHA_HRA ||
                    '_log.txt';
  V_ARCHVO_CMMIT := 'PRC_MIGRA_RECAUDOS_2026_2_' || V_FCHA_HRA ||
                    '_cmmit.txt';
  V_ARCHVO_ERROR := 'PRC_MIGRA_RECAUDOS_2026_2_' || V_FCHA_HRA ||
                    '_error.txt';

  SITPR001('Entrando a PRC_MIGRA_RECAUDOS_2026_2', V_ARCHVO);

  V_CDGO_CLNTE := NULL;

  BEGIN
    SELECT A.CDGO_CLNTE
      INTO V_CDGO_CLNTE
      FROM DF_S_CLIENTES A
     WHERE A.CDGO_CLNTE = P_CDGO_CLNTE;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      SITPR001('Error (1) en clientes: ' || SQLCODE || '-' || SQLERRM,
               V_ARCHVO_ERROR);
    WHEN OTHERS THEN
      SITPR001('Error (2) en clientes: ' || SQLCODE || '-' || SQLERRM,
               V_ARCHVO_ERROR);
  END;

  IF V_CDGO_CLNTE IS NULL THEN

    O_MNSJE := 'Error en cliente, no existe en el sistema!';
    RETURN;
  END IF;

  BEGIN
    SELECT A.ID_IMPSTO, B.ID_IMPSTO_SBMPSTO
      INTO V_ID_IMPSTO, V_ID_IMPSTO_SBMPSTO
      FROM DF_C_IMPUESTOS A
      JOIN DF_I_IMPUESTOS_SUBIMPUESTO B
        ON A.ID_IMPSTO = B.ID_IMPSTO
     WHERE A.CDGO_CLNTE = P_CDGO_CLNTE
       AND A.CDGO_IMPSTO = 'IPU'
       AND B.CDGO_IMPSTO_SBMPSTO = 'IPU';
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      SITPR001('Error (1) en impuesto-subimpuesto: ' || SQLCODE || '-' ||
               SQLERRM,
               V_ARCHVO_ERROR);
    WHEN OTHERS THEN
      SITPR001('Error (2) en impuesto-subimpuesto: ' || SQLCODE || '-' ||
               SQLERRM,
               V_ARCHVO_ERROR);
  END;

  IF V_ID_IMPSTO IS NULL OR V_ID_IMPSTO_SBMPSTO IS NULL THEN

    O_MNSJE := 'Error en impuesto-subImpuesto, no existe en el sistema!';
    RETURN;
  END IF;

  V_ID_IMPSTO_ACTO := NULL;

  BEGIN
    SELECT IA.ID_IMPSTO_ACTO
      INTO V_ID_IMPSTO_ACTO
      FROM DF_I_IMPUESTOS_ACTO IA
     WHERE IA.ID_IMPSTO = V_ID_IMPSTO
       AND IA.ID_IMPSTO_SBMPSTO = V_ID_IMPSTO_SBMPSTO;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      SITPR001('Error (1) en impuesto acto: ' || SQLCODE || '-' || SQLERRM,
               V_ARCHVO_ERROR);
    WHEN OTHERS THEN
      SITPR001('Error (2) en impuesto acto: ' || SQLCODE || '-' || SQLERRM,
               V_ARCHVO_ERROR);
  END;

  IF V_ID_IMPSTO_ACTO IS NULL THEN

    O_MNSJE := 'Error en impuesto acto, no existe en el sistema!';
    RETURN;
  END IF;

  V_CNTDOR := 0;

  FOR R0 IN C0 LOOP

    BEGIN
      INSERT INTO RE_G_RECAUDOS_CONTROL
        (CDGO_CLNTE,
         ID_IMPSTO,
         ID_IMPSTO_SBMPSTO,
         ID_BNCO,
         ID_BNCO_CNTA,
         FCHA_CNTROL,
         OBSRVCION,
         CNTDAD_RCDOS,
         VLOR_RCDOS,
         CDGO_RCDO_ORGEN,
         ID_PRCSO_CRGA,
         ID_USRIO,
         FCHA_RGSTRO)
      VALUES
        (P_CDGO_CLNTE,
         V_ID_IMPSTO,
         V_ID_IMPSTO_SBMPSTO,
         R0.ID_BNCO,
         R0.ID_BNCO_CNTA,
         R0.FCHA_PGO,
         'MIGRADO',
         R0.CNTDAD,
         R0.VLOR_PGO,
         'AC',
         NULL,
         P_ID_USRIO,
         R0.FCHA_PGO)
      RETURNING ID_RCDO_CNTROL INTO V_ID_RCDO_CNTROL;
    EXCEPTION
      WHEN OTHERS THEN
        V_ID_RCDO_CNTROL := NULL;
        V_MNSJE_ERROR    := ' . No se pudo registrar control: ' ||
                            R0.FCHA_PGO || '(' || R0.ID_BNCO || '), ' || '(' ||
                            R0.ID_BNCO_CNTA || '), ' || ': ' || SQLCODE || '-' ||
                            SQLERRM;
        SITPR001(V_MNSJE_ERROR, V_ARCHVO_ERROR);
        CONTINUE;
    END;

    FOR R1 IN C1(R0.FCHA_PGO, R0.ID_BNCO, R0.ID_BNCO_CNTA) LOOP
      SITPR001('Procesando recaudo: ' || R1.NMRO_DCMNTO, V_ARCHVO);

      BEGIN
        INSERT INTO RE_G_RECAUDOS
          (ID_RCDO_CNTROL,
           ID_SJTO_IMPSTO,
           CDGO_RCDO_ORGN_TPO,
           ID_ORGEN,
           NMRO_DCMNTO,
           FCHA_RCDO,
           FCHA_INGRSO_BNCO,
           VLOR,
           OBSRVCION,
           CDGO_FRMA_PGO,
           CDGO_RCDO_ESTDO,
           FCHA_APLICCION,
           MNSJE_RSPSTA,
           ID_USRIO_APLCO,
           ID_SLDO_FVOR,
           ID_CNVNIO)
        VALUES
          (V_ID_RCDO_CNTROL,
           R1.ID_SJTO_IMPSTO,
           'DC',
           0,
           R1.NMRO_DCMNTO,
           R1.FCHA_PGO,
           R1.FCHA_PGO,
           R1.VLOR_PGO,
           'Migrado, usuario: ' || R1.USRIO,
           'EF',
           'AP',
           R1.FCHA_APLCCION,
           'Aplicado',
           P_ID_USRIO,
           NULL,
           R1.ID_CNVNIO)
        RETURNING ID_RCDO INTO V_ID_RCDO;
      EXCEPTION
        WHEN OTHERS THEN
          DELETE FROM RE_G_RECAUDOS_CONTROL C
           WHERE C.ID_RCDO_CNTROL = V_ID_RCDO_CNTROL;
          V_ID_RCDO     := NULL;
          V_MNSJE_ERROR := 'Error: ' || SQLCODE || '-' || SQLERRM;
          UPDATE MIGRA.MG_G_INTERMEDIA_IPU_RECAUDO_2026_MAESTRO A
             SET A.ESTDO_RGSTRO = 'E', A.MNSJE_ERROR = V_MNSJE_ERROR
           WHERE A.ID_INTRMDIA = R1.ID_INTRMDIA;
          CONTINUE;
      END;

      FOR R2 IN C2(R1.ID_INTRMDIA) LOOP
        --CREAR EL DETALLE
        BEGIN
          INSERT INTO RE_G_RECAUDOS_DETALLE
            (ID_RCDO,
             VGNCIA,
             ID_PRDO,
             ID_CNCPTO,
             VLOR_APLCA_CPTAL,
             VLOR_APLCA_INTRES,
             VLOR_TTAL_APLCDO,
             OBSRVCION)
          VALUES
            (V_ID_RCDO,
             R2.VGNCIA,
             R2.ID_PRDO,
             R2.ID_CNCPTO_CPTAL,
             R2.PGDO_CPTAL,
             R2.PGDO_INTRES,
             R2.PGDO_CNCPTO,
             NULL);

        EXCEPTION
          WHEN OTHERS THEN
            V_MNSJE_ERROR := 'Error: ' || SQLCODE || '-' || SQLERRM;

            DELETE FROM RE_G_RECAUDOS_DETALLE C
             WHERE C.ID_RCDO = V_ID_RCDO;

            DELETE FROM RE_G_RECAUDOS C WHERE C.ID_RCDO = V_ID_RCDO;

            DELETE FROM RE_G_RECAUDOS_CONTROL C
             WHERE C.ID_RCDO_CNTROL = V_ID_RCDO_CNTROL;

            UPDATE MIGRA.MG_G_INTERMEDIA_IPU_RECAUDO_2026_MAESTRO A
               SET A.ESTDO_RGSTRO = 'E', A.MNSJE_ERROR = V_MNSJE_ERROR
             WHERE A.ID_INTRMDIA = R1.ID_INTRMDIA;
            EXIT;
        END;
      END LOOP;

      UPDATE MIGRA.MG_G_INTERMEDIA_IPU_RECAUDO_2026_MAESTRO A
         SET A.ID_RCDO = V_ID_RCDO, A.ESTDO_RGSTRO = 'S'
       WHERE A.ID_INTRMDIA = R1.ID_INTRMDIA;

      V_CNTDOR := V_CNTDOR + 1;

      IF MOD(V_CNTDOR, 100) = 0 THEN
        V_TXTO := 'Se han procesado ' || V_CNTDOR || ' registros';

        COMMIT;
        SITPR001(V_TXTO, V_ARCHVO_CMMIT);
      END IF;
    END LOOP;
  END LOOP;
  V_TXTO := 'Se procesaron ' || V_CNTDOR || ' registros ';
  SITPR001(V_TXTO, V_ARCHVO_CMMIT);
  COMMIT;

END PRC_MIGRA_RECAUDOS_2026_3;
/

