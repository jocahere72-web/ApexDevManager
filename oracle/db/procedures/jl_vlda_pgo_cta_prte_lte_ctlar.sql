
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_VLDA_PGO_CTA_PRTE_LTE_CTLAR" (p_id_embrgos_smu_lte IN NUMBER,
                                                           p_elmna_rspnsble     in varchar2 default 'N') IS

  -- El cursor ahora utiliza el parámetro de entrada para ser más flexible.
  CURSOR c1 IS
    SELECT c.cdgo_clnte,
           c.id_impsto,
           c.id_impsto_sbmpsto,
           c.id_sjto_impsto,
           b.idntfccion_sjto,
           b.idntfccion_rspnsble,
           b.prmer_nmbre AS nombre,
           c.vgncia,
           c.id_mvmnto_fncro,
           b.id_sjto_rspnsble,
           a.id_embrgos_smu_sjto
      FROM mc_g_embargos_simu_sujeto a
      JOIN mc_g_embargos_smu_mvmnto c
        ON c.id_embrgos_smu_sjto = a.id_embrgos_smu_sjto
      JOIN v_si_i_sujetos_responsable b
        ON b.cdgo_clnte = c.cdgo_clnte
       AND b.id_sjto_impsto = c.id_sjto_impsto
       AND b.idntfccion_rspnsble <> '0'
     WHERE a.id_embrgos_smu_lte = p_id_embrgos_smu_lte
     GROUP BY c.cdgo_clnte,
              c.id_impsto,
              c.id_impsto_sbmpsto,
              c.vgncia,
              c.id_sjto_impsto,
              b.idntfccion_sjto,
              b.idntfccion_rspnsble,
              b.prmer_nmbre,
              c.id_mvmnto_fncro,
              b.id_sjto_rspnsble,
              a.id_embrgos_smu_sjto
     ORDER BY c.id_sjto_impsto, b.idntfccion_sjto, b.idntfccion_rspnsble;

BEGIN

  FOR r1 IN c1 LOOP

    IF jl_fnc_vlda_pgo_cta_prte(p_idntfccion      => r1.idntfccion_rspnsble,
                                p_id_mvmnto_fncro => r1.id_mvmnto_fncro) THEN

      dbms_output.put_line('PAGO SU CUOTA PARTE SUJETO: ' ||
                           r1.idntfccion_sjto || ' RESPONSABLE: ' ||
                           r1.idntfccion_rspnsble || ' - ' || r1.nombre ||
                           ' VIGENCIA: ' || r1.vgncia);

      if p_elmna_rspnsble = 'S' then
        delete from mc_g_embargos_simu_rspnsble a
         where a.idntfccion = r1.idntfccion_rspnsble
           and a.id_embrgos_smu_sjto = r1.id_embrgos_smu_sjto;
      end if;
    END IF;

  END LOOP;

EXCEPTION
  WHEN OTHERS THEN
    dbms_output.put_line('--- ERROR INESPERADO ---');
    dbms_output.put_line(SQLERRM);
    dbms_output.put_line('------------------------');
    RAISE;
END jl_vlda_pgo_cta_prte_lte_ctlar;
/

