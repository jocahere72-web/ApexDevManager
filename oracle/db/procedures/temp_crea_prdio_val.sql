
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_CREA_PRDIO_VAL" (P_RSLCION_IGAC VARCHAR2,
                                                P_MNSJE           OUT VARCHAR2) is
  V_ID_SJTO_IMPSTO_PRDAL NUMBER;

begin
  for c_datos in (select rfrncia_igac, id_sjto_impsto
                    from si_g_resolucion_igac_t1
                   where rslcion = P_RSLCION_IGAC
                     and cncla_inscrbe = 'I') loop

    insert into muerto
      (v_001, v_002)
    values
      ('P_IGAC', c_datos.rfrncia_igac);
    commit;
    declare
      --RECORRER LOS PREDIOS DE VALORIZACI?N
      CURSOR c1 IS
        SELECT c.id_sjto
          FROM si_c_sujetos c
         WHERE c.idntfccion = c_datos.rfrncia_igac; --SUJETO PREDIAL
      CURSOR c2(r_id_sjto NUMBER) IS
        SELECT i.id_sjto_impsto
          FROM si_i_sujetos_impuesto i
         WHERE i.id_impsto = 230011
           AND i.id_sjto = r_id_sjto; --SUJETO VALORIZACION
      CURSOR c3(r_id_sjto NUMBER) IS
        SELECT i.id_sjto_impsto
          FROM si_i_sujetos_impuesto i
         WHERE i.id_impsto = 2300115
           AND i.id_sjto = r_id_sjto;

      CURSOR c4 IS
        SELECT i.id_sjto_impsto
          FROM v_si_i_sujetos_impuesto i
         WHERE i.id_impsto = 2300115
           AND i.idntfccion_sjto = c_datos.rfrncia_igac;
    begin
      BEGIN
        BEGIN
          p_mnsje := NULL;
          FOR r4 IN c4 LOOP
            p_mnsje := 'SUJETO IMPUESTO YA EXISTE EN VALORIZACION';
          END LOOP;
          IF p_mnsje IS NULL THEN
            FOR r1 IN c1 LOOP
              FOR r2 IN c2(r1.id_sjto) LOOP
                v_id_sjto_impsto_prdal := r2.id_sjto_impsto;
                INSERT INTO si_i_sujetos_impuesto
                  (id_sjto,
                   id_impsto,
                   estdo_blqdo,
                   id_pais_ntfccion,
                   id_dprtmnto_ntfccion,
                   id_mncpio_ntfccion,
                   drccion_ntfccion,
                   email,
                   tlfno,
                   fcha_rgstro,
                   id_usrio,
                   id_sjto_estdo,
                   fcha_ultma_nvdad,
                   fcha_cnclcion,
                   indcdor_sjto_mgrdo,
                   indcdor_mgrdo)
                  SELECT c.id_sjto,
                         2300115,
                         c.estdo_blqdo,
                         c.id_pais_ntfccion,
                         c.id_dprtmnto_ntfccion,
                         c.id_mncpio_ntfccion,
                         c.drccion_ntfccion,
                         c.email,
                         c.tlfno,
                         c.fcha_rgstro,
                         c.id_usrio,
                         c.id_sjto_estdo,
                         c.fcha_ultma_nvdad,
                         c.fcha_cnclcion,
                         c.indcdor_sjto_mgrdo,
                         c.indcdor_mgrdo
                    FROM si_i_sujetos_impuesto c
                   WHERE c.id_sjto = r1.id_sjto
                     AND c.id_impsto = 230011;

                COMMIT;
              END LOOP;

              FOR r3 IN c3(r1.id_sjto) LOOP
                --CREO RESPONSABLES
                INSERT INTO si_i_sujetos_responsable
                  (id_sjto_impsto,
                   cdgo_idntfccion_tpo,
                   idntfccion,
                   prmer_nmbre,
                   sgndo_nmbre,
                   prmer_aplldo,
                   sgndo_aplldo,
                   prncpal_s_n,
                   cdgo_tpo_rspnsble,
                   prcntje_prtcpcion,
                   orgen_dcmnto,
                   id_pais_ntfccion,
                   id_dprtmnto_ntfccion,
                   id_mncpio_ntfccion,
                   drccion_ntfccion,
                   email,
                   tlfno,
                   cllar,
                   actvo,
                   id_trcro,
                   indcdor_mgrdo)
                  SELECT r3.id_sjto_impsto,
                         t.cdgo_idntfccion_tpo,
                         t.idntfccion,
                         t.prmer_nmbre,
                         t.sgndo_nmbre,
                         t.prmer_aplldo,
                         t.sgndo_aplldo,
                         t.prncpal_s_n,
                         t.cdgo_tpo_rspnsble,
                         t.prcntje_prtcpcion,
                         t.orgen_dcmnto,
                         t.id_pais_ntfccion,
                         t.id_dprtmnto_ntfccion,
                         t.id_mncpio_ntfccion,
                         t.drccion_ntfccion,
                         t.email,
                         t.tlfno,
                         t.cllar,
                         t.actvo,
                         t.id_trcro,
                         t.indcdor_mgrdo
                    FROM si_i_sujetos_responsable t
                   WHERE id_sjto_impsto = v_id_sjto_impsto_prdal;
                --CREO EL PREDIO
                INSERT INTO si_i_predios
                  (id_sjto_impsto,
                   id_prdio_dstno,
                   cdgo_estrto,
                   cdgo_dstno_igac,
                   cdgo_prdio_clsfccion,
                   id_prdio_uso_slo,
                   avluo_ctstral,
                   avluo_cmrcial,
                   area_trrno,
                   area_cnstrda,
                   area_grvble,
                   mtrcla_inmblria,
                   indcdor_prdio_mncpio,
                   id_entdad,
                   id_brrio,
                   fcha_ultma_actlzcion,
                   bse_grvble,
                   dstncia,
                   lttud,
                   lngtud,
                   indcdor_mgrdo)
                  SELECT r3.id_sjto_impsto,
                         t.id_prdio_dstno,
                         t.cdgo_estrto,
                         t.cdgo_dstno_igac,
                         t.cdgo_prdio_clsfccion,
                         t.id_prdio_uso_slo,
                         t.avluo_ctstral,
                         t.avluo_cmrcial,
                         t.area_trrno,
                         t.area_cnstrda,
                         t.area_grvble,
                         t.mtrcla_inmblria,
                         t.indcdor_prdio_mncpio,
                         t.id_entdad,
                         t.id_brrio,
                         t.fcha_ultma_actlzcion,
                         t.bse_grvble,
                         t.dstncia,
                         t.lttud,
                         t.lngtud,
                         t.indcdor_mgrdo
                    FROM si_i_predios t
                   WHERE id_sjto_impsto = v_id_sjto_impsto_prdal;

              END LOOP;

              p_mnsje := 'SUJETO CREADO CON EXITO';
            END LOOP;

            COMMIT;
          END IF;

        END loop;
      end;
    end;
  end loop;
END temp_crea_prdio_val;
/

