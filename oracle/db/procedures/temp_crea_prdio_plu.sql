
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_CREA_PRDIO_PLU" (P_RFRNCIA_CTSTRAL    VARCHAR2,
                                                P_MNSJE              OUT VARCHAR2,
                                                P_ID_SJTO_IMPSTO_PLU OUT NUMBER) is

  --RECORRER LOS PREDIOS DE VALORIZACI?N
  CURSOR C1 IS
    SELECT C.ID_SJTO
      FROM SI_C_SUJETOS C
     WHERE C.IDNTFCCION = P_RFRNCIA_CTSTRAL;

  --SUJETO PREDIAL
  CURSOR C2(R_ID_SJTO NUMBER) IS
    SELECT I.ID_SJTO_IMPSTO
      FROM SI_I_SUJETOS_IMPUESTO I
     WHERE I.ID_IMPSTO = 230011
       AND I.ID_SJTO = R_ID_SJTO;

  --SUJETO VALORIZACION
  CURSOR C3(R_ID_SJTO NUMBER) IS
    SELECT I.ID_SJTO_IMPSTO
      FROM SI_I_SUJETOS_IMPUESTO I
     WHERE I.ID_IMPSTO = 230019
       AND I.ID_SJTO = R_ID_SJTO;

  CURSOR C4 IS
    SELECT I.ID_SJTO_IMPSTO
      FROM V_SI_I_SUJETOS_IMPUESTO I
     WHERE I.ID_IMPSTO = 230019
       AND I.IDNTFCCION_SJTO = P_RFRNCIA_CTSTRAL;

  V_ID_SJTO_IMPSTO_PRDAL NUMBER;
begin

  P_MNSJE := NULL;

  FOR R4 IN C4 LOOP
    P_MNSJE              := 'SUJETO IMPUESTO YA EXISTE EN PLUSVALIA';
    P_ID_SJTO_IMPSTO_PLU := R4.ID_SJTO_IMPSTO;
  END LOOP;

  IF P_MNSJE IS NULL THEN

    FOR R1 IN C1 LOOP
      FOR R2 IN C2(R1.ID_SJTO) LOOP
        V_ID_SJTO_IMPSTO_PRDAL := R2.ID_SJTO_IMPSTO;
        INSERT INTO SI_I_SUJETOS_IMPUESTO
          (ID_SJTO,
           ID_IMPSTO,
           ESTDO_BLQDO,
           ID_PAIS_NTFCCION,
           ID_DPRTMNTO_NTFCCION,
           ID_MNCPIO_NTFCCION,
           DRCCION_NTFCCION,
           EMAIL,
           TLFNO,
           FCHA_RGSTRO,
           ID_USRIO,
           ID_SJTO_ESTDO,
           FCHA_ULTMA_NVDAD,
           FCHA_CNCLCION,
           INDCDOR_SJTO_MGRDO,
           INDCDOR_MGRDO)
          SELECT C.ID_SJTO,
                 230019,
                 C.ESTDO_BLQDO,
                 C.ID_PAIS_NTFCCION,
                 C.ID_DPRTMNTO_NTFCCION,
                 C.ID_MNCPIO_NTFCCION,
                 C.DRCCION_NTFCCION,
                 C.EMAIL,
                 C.TLFNO,
                 C.FCHA_RGSTRO,
                 C.ID_USRIO,
                 C.ID_SJTO_ESTDO,
                 C.FCHA_ULTMA_NVDAD,
                 C.FCHA_CNCLCION,
                 C.INDCDOR_SJTO_MGRDO,
                 C.INDCDOR_MGRDO
            FROM SI_I_SUJETOS_IMPUESTO C
           WHERE C.ID_SJTO = R1.ID_SJTO
             AND C.ID_IMPSTO = 230011;
        COMMIT;
      END LOOP;

      FOR R3 IN C3(R1.ID_SJTO) LOOP
        --CREO RESPONSABLES

        P_ID_SJTO_IMPSTO_PLU := R3.ID_SJTO_IMPSTO;

        INSERT INTO SI_I_SUJETOS_RESPONSABLE
          (ID_SJTO_IMPSTO,
           CDGO_IDNTFCCION_TPO,
           IDNTFCCION,
           PRMER_NMBRE,
           SGNDO_NMBRE,
           PRMER_APLLDO,
           SGNDO_APLLDO,
           PRNCPAL_S_N,
           CDGO_TPO_RSPNSBLE,
           PRCNTJE_PRTCPCION,
           ORGEN_DCMNTO,
           ID_PAIS_NTFCCION,
           ID_DPRTMNTO_NTFCCION,
           ID_MNCPIO_NTFCCION,
           DRCCION_NTFCCION,
           EMAIL,
           TLFNO,
           CLLAR,
           ACTVO,
           ID_TRCRO,
           INDCDOR_MGRDO)
          SELECT R3.ID_SJTO_IMPSTO,
                 T.CDGO_IDNTFCCION_TPO,
                 T.IDNTFCCION,
                 T.PRMER_NMBRE,
                 T.SGNDO_NMBRE,
                 T.PRMER_APLLDO,
                 T.SGNDO_APLLDO,
                 T.PRNCPAL_S_N,
                 T.CDGO_TPO_RSPNSBLE,
                 T.PRCNTJE_PRTCPCION,
                 T.ORGEN_DCMNTO,
                 T.ID_PAIS_NTFCCION,
                 T.ID_DPRTMNTO_NTFCCION,
                 T.ID_MNCPIO_NTFCCION,
                 T.DRCCION_NTFCCION,
                 T.EMAIL,
                 T.TLFNO,
                 T.CLLAR,
                 T.ACTVO,
                 T.ID_TRCRO,
                 T.INDCDOR_MGRDO
            FROM SI_I_SUJETOS_RESPONSABLE T
           WHERE ID_SJTO_IMPSTO = V_ID_SJTO_IMPSTO_PRDAL;

        --CREO EL PREDIO
        INSERT INTO SI_I_predios
          (ID_SJTO_IMPSTO,
           ID_PRDIO_DSTNO,
           CDGO_ESTRTO,
           CDGO_DSTNO_IGAC,
           CDGO_PRDIO_CLSFCCION,
           ID_PRDIO_USO_SLO,
           AVLUO_CTSTRAL,
           AVLUO_CMRCIAL,
           AREA_TRRNO,
           AREA_CNSTRDA,
           AREA_GRVBLE,
           MTRCLA_INMBLRIA,
           INDCDOR_PRDIO_MNCPIO,
           ID_ENTDAD,
           ID_BRRIO,
           FCHA_ULTMA_ACTLZCION,
           BSE_GRVBLE,
           DSTNCIA,
           LTTUD,
           LNGTUD,
           INDCDOR_MGRDO)
          select R3.ID_SJTO_IMPSTO,
                 T.ID_PRDIO_DSTNO,
                 T.CDGO_ESTRTO,
                 T.CDGO_DSTNO_IGAC,
                 T.CDGO_PRDIO_CLSFCCION,
                 T.ID_PRDIO_USO_SLO,
                 T.AVLUO_CTSTRAL,
                 T.AVLUO_CMRCIAL,
                 T.AREA_TRRNO,
                 T.AREA_CNSTRDA,
                 T.AREA_GRVBLE,
                 T.MTRCLA_INMBLRIA,
                 T.INDCDOR_PRDIO_MNCPIO,
                 T.ID_ENTDAD,
                 T.ID_BRRIO,
                 T.FCHA_ULTMA_ACTLZCION,
                 T.BSE_GRVBLE,
                 T.DSTNCIA,
                 T.LTTUD,
                 T.LNGTUD,
                 T.INDCDOR_MGRDO
            from SI_I_predios t
           where id_sjto_impsto = V_ID_SJTO_IMPSTO_PRDAL;

      END LOOP;

      P_MNSJE := 'SUJETO CREADO CON EXITO';

    END LOOP;
    COMMIT;
  END IF;
end TEMP_CREA_PRDIO_PLU;
/

