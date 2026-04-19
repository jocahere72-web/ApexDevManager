
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_CRR_RENTA_ALUMBRADO" (P_CDGO_CLNTE NUMBER) is

  CURSOR C1 IS
    SELECT T.*, ROWID
      FROM TEMP_CORR_RENTA_ALUMBRADO T
     WHERE T.PRCSDO = 'N'
     ORDER BY T.SCRSAL, T.VGNCIA, T.PRDO;

  V_ID_SJTO_IMPSTO NUMBER;
  V_ID_LQDCION     NUMBER;
  V_ID_RNTA        NUMBER;
  V_ID_DCMNTO      NUMBER;
  V_ID_RNTA_ACTO   NUMBER;
begin

  FOR R1 IN C1 LOOP
    V_ID_LQDCION := NULL;
    V_ID_RNTA    := NULL;

    --BUSCAMOS EL SUJETO IMPUESTO
    BEGIN
      SELECT S.ID_SJTO_IMPSTO
        INTO V_ID_SJTO_IMPSTO
        FROM SI_I_SUJETOS_SUCURSAL S
       WHERE S.ID_SJTO_SCRSAL = R1.SCRSAL;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.put_line('No se encontró la sucursal ' || R1.SCRSAL);
        EXIT;
    END;

    --ACTUALIZAMOS LA LIQUIDACION
    UPDATE GI_G_LIQUIDACIONES L
       SET L.BSE_GRVBLE = R1.BSE_GRVBLE, L.VLOR_TTAL = R1.VLOR_CNCPTO
     WHERE L.ID_SJTO_IMPSTO = V_ID_SJTO_IMPSTO
       AND L.ID_SJTO_SCRSAL = R1.SCRSAL
       AND L.VGNCIA = R1.VGNCIA
       AND L.ID_IMPSTO = P_CDGO_CLNTE || 3
       AND L.CDGO_LQDCION_ESTDO = 'L'
       AND L.CDGO_CLNTE = P_CDGO_CLNTE
       AND EXISTS (SELECT 1
              FROM df_i_periodos D
             WHERE D.ID_PRDO = L.ID_PRDO
               AND D.PRDO = R1.PRDO)
    RETURNING L.ID_LQDCION INTO V_ID_LQDCION;

    IF V_ID_LQDCION IS NULL THEN
      DBMS_OUTPUT.put_line('No se actualizó la LIQUIDACION para sucursal: ' ||
                           R1.SCRSAL || ', Vigencia: ' || r1.vgncia ||
                           ', Periodo: ' || r1.prdo);
      EXIT;
    END IF;

    --ACTUALIZAMOS EL DETALLE DE LA LIQUIDACION
    UPDATE GI_G_LIQUIDACIONES_CONCEPTO C
       SET C.BSE_CNCPTO  = R1.BSE_GRVBLE,
           C.VLOR_LQDDO  = R1.VLOR_CNCPTO,
           C.VLOR_CLCLDO = R1.VLOR_CNCPTO
     WHERE C.ID_LQDCION = V_ID_LQDCION;

    --ACTUALIZAMOS CARTERA
    UPDATE GF_G_MOVIMIENTOS_DETALLE D
       SET D.VLOR_DBE = R1.VLOR_CNCPTO
     WHERE D.VGNCIA = R1.VGNCIA
       AND D.ID_ORGEN = V_ID_LQDCION
       AND D.CDGO_MVMNTO_ORGN = 'LQ';

    --ACTUALIZAMOS EL CONSOLIDADO
    begin
      pkg_gf_movimientos_financiero.prc_ac_concepto_consolidado(p_cdgo_clnte     => P_CDGO_CLNTE,
                                                                p_id_sjto_impsto => V_ID_SJTO_IMPSTO);
    end;

    --ACTUALIZAMOS LA RENTA
    UPDATE GI_G_RENTAS t
       SET T.VLOR_BSE_GRVBLE = R1.BSE_GRVBLE, T.TXTO_ASCDA = R1.FCTRA
     WHERE T.ID_SJTO_IMPSTO = V_ID_SJTO_IMPSTO
       AND T.ID_LQDCION = V_ID_LQDCION
       AND T.ID_SJTO_SCRSAL = R1.SCRSAL
       AND T.CDGO_CLNTE = P_CDGO_CLNTE
    RETURNING T.ID_RNTA, T.ID_DCMNTO INTO V_ID_RNTA, V_ID_DCMNTO;

    IF V_ID_RNTA IS NULL OR V_ID_DCMNTO IS NULL THEN
      DBMS_OUTPUT.put_line('No se actualizó la RENTA para sucursal: ' ||
                           R1.SCRSAL || ', Vigencia: ' || r1.vgncia ||
                           ', Periodo: ' || r1.prdo);
      EXIT;
    END IF;

    --BUSCAMOS LA RENTA ACTO
    BEGIN
      SELECT S.ID_RNTA_ACTO
        INTO V_ID_RNTA_ACTO
        FROM gi_g_rentas_acto S
       WHERE S.ID_RNTA = V_ID_RNTA;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.put_line('No se encontró RENTA ACTO ' || R1.SCRSAL ||
                             ', Vigencia: ' || r1.vgncia || ', Periodo: ' ||
                             r1.prdo);
        EXIT;
    END;

    --ACTUALIZAMOS LA RENTAS DETALLE
    UPDATE gi_g_rentas_acto_concepto T
       SET T.BSE_CNCPTO = R1.BSE_GRVBLE, T.VLOR_LQDDO = R1.VLOR_CNCPTO
     WHERE T.ID_RNTA_ACTO = V_ID_RNTA_ACTO;

    --ACTUALIZAR EL DOCUMENTO
    UPDATE RE_g_documentos T
       SET T.VLOR_TTAL_DBE    = R1.VLOR_CNCPTO,
           T.VLOR_TTAL        = R1.VLOR_CNCPTO,
           T.VLOR_TTAL_DCMNTO = R1.VLOR_CNCPTO
     WHERE T.ID_DCMNTO = V_ID_DCMNTO;

    --ACTUALIZAMOS EL DOCUMENTO DETALLE
    UPDATE re_g_documentos_detalle T
       SET T.VLOR_DBE = R1.VLOR_CNCPTO
     WHERE T.ID_DCMNTO = V_ID_DCMNTO;

    UPDATE TEMP_CORR_RENTA_ALUMBRADO T
       SET T.PRCSDO = 'S'
     WHERE T.ROWID = R1.ROWID;

    COMMIT;

  END LOOP;

end TEMP_CRR_RENTA_ALUMBRADO;
/

