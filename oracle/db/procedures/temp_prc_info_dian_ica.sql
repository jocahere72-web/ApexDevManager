
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_PRC_INFO_DIAN_ICA" (r_vgncia number) is

  cursor c1 is
    select case
             when length(a.idntfccion_sjto) > length(a.idntfccion_antrior) then
              a.idntfccion_sjto
             else
              a.idntfccion_antrior
           end idntfccion,
           f.nmbre_rzon_scial nmbre_rzon_scial,
           a.drccion drccion,
           a.id_sjto_impsto,
           sum(b.bse_grvble) bse_grvble,
           c.dscrpcion actvdad,
           a.tlfno,
           a.email,
           count(*) nmro_scrsles,
           g.nmbre_dclrcns_esqma_trfa_tpo tpo_actvdad
      from v_si_i_sujetos_impuesto a
      join si_i_personas f
        on f.id_sjto_impsto = a.id_sjto_impsto
      join gi_g_declaraciones b
        on b.id_sjto_impsto = a.id_sjto_impsto
      left join gi_d_dclrcns_esqma_trfa c
        on c.id_dclrcns_esqma_trfa = f.id_actvdad_ecnmca
      left join GI_D_DCLRCNS_ESQMA_TRFA_tpo g
        on g.id_dclrcns_esqma_trfa_tpo = c.id_dclrcns_esqma_trfa_tpo
     where a.id_impsto = 230012
       and to_char(b.fcha_prsntcion, 'YYYY') = r_vgncia
       and (b.indcdor_mgrdo <> 'C' or b.indcdor_mgrdo is null)
       and b.id_impsto = 230012
       and b.cdgo_dclrcion_estdo = 'APL'
       and b.id_impsto_sbmpsto = 2300122
     group by case
                when length(a.idntfccion_sjto) >
                     length(a.idntfccion_antrior) then
                 a.idntfccion_sjto
                else
                 a.idntfccion_antrior
              end,
              f.nmbre_rzon_scial,
              a.id_sjto_impsto,
              a.drccion,
              a.tlfno,
              a.email,
              c.dscrpcion,
              g.nmbre_dclrcns_esqma_trfa_tpo
     order by case
                when length(a.idntfccion_sjto) >
                     length(a.idntfccion_antrior) then
                 a.idntfccion_sjto
                else
                 a.idntfccion_antrior
              end;

  cursor c2(r_id_sjto_impsto number) is
    select b.id_sjto_impsto,
           sum(case
                 when e.dscrpcion like '8%' then
                  to_number(c.vlor_dsplay)
                 else
                  0
               end) brutos,
           sum(case
                 when e.dscrpcion like '10%' then
                  to_number(c.vlor_dsplay)
                 else
                  0
               end) brutos_municipio,
           sum(case
                 when e.dscrpcion like '20.%' then
                  to_number(c.vlor_dsplay)
                 else
                  0
               end) ica,
           sum(case
                 when e.dscrpcion like '21.%' then
                  to_number(c.vlor_dsplay)
                 else
                  0
               end) ayt,
           sum(case
                 when e.dscrpcion like '23.%' then
                  to_number(c.vlor_dsplay)
                 else
                  0
               end) bom
      from gi_g_declaraciones b
      join gi_g_declaraciones_detalle c
        on b.id_dclrcion = c.id_dclrcion
      join gi_d_formularios_region d
        on d.id_frmlrio_rgion = c.id_frmlrio_rgion
      join gi_d_frmlrios_rgion_atrbto e
        on e.id_frmlrio_rgion = d.id_frmlrio_rgion
       and e.id_frmlrio_rgion_atrbto = c.id_frmlrio_rgion_atrbto
     where to_char(b.fcha_prsntcion, 'YYYY') = r_vgncia
       and (b.indcdor_mgrdo <> 'C' or b.indcdor_mgrdo is null)
       and b.id_impsto = 230012
       and b.cdgo_dclrcion_estdo = 'APL'
       and b.id_sjto_impsto = r_id_sjto_impsto
       and (e.dscrpcion like '8. TOTAL INGRESOS ORDINARIOS%' or
            e.dscrpcion like '10. (=) TOTAL INGRESOS ORDINARIOS%' or
            e.dscrpcion like '20. TOTAL IMPUESTO%' or
            e.dscrpcion like '21. (+)  IMPUESTO DE AVISOS Y TABLEROS%' or
            e.dscrpcion like '23. (+) SOBRETASA ACTIVIDAD%')
       and b.nmro_cnsctvo <> 20120010822
       and b.id_impsto_sbmpsto = 2300122
     group by b.id_sjto_impsto;

  cursor c3(r_id_sjto_impsto number) is
    select b.id_sjto_impsto,
           sum(decode(c.id_cncpto, 621, c.vlor_sldo_cptal, 0)) sldo_ica,
           sum(decode(c.id_cncpto, 658, c.vlor_sldo_cptal, 0)) sldo_ayt,
           sum(decode(c.id_cncpto, 631, c.vlor_sldo_cptal, 0)) sldo_bom
      from gi_g_declaraciones b
      join v_gf_g_cartera_x_concepto c
        on c.id_sjto_impsto = b.id_sjto_impsto
       and c.id_prdo = b.id_prdo
       and c.vgncia = b.vgncia
     where to_char(b.fcha_prsntcion, 'YYYY') = 2020
       and (b.indcdor_mgrdo <> 'C' or b.indcdor_mgrdo is null)
       and b.id_impsto = 230012
       and b.cdgo_dclrcion_estdo = 'APL'
       and b.id_sjto_impsto = r_id_sjto_impsto
       and b.nmro_cnsctvo <> 20120010822
       and b.id_impsto_sbmpsto = 2300122
     group by b.id_sjto_impsto;

  v_brutos           number;
  v_brutos_fuera     number;
  v_brutos_municipio number;

  v_liq_ica number;
  v_liq_ayt number;
  v_liq_bom number;

  v_pag_ica number;
  v_pag_ayt number;
  v_pag_bom number;

  v_tpo_id varchar2(1);

begin

  delete from TEMP_INFO_DIAN_ICA t;
  commit;

  for r1 in c1 loop
    sitpr001('Procesando Nit: ' || r1.idntfccion, 'LOG_DECLARACIONES.TXT');

    v_brutos           := 0;
    v_brutos_municipio := 0;
    v_liq_ica          := 0;
    v_liq_ayt          := 0;
    v_liq_bom          := 0;
    v_brutos_fuera     := 0;
    v_pag_ica          := 0;
    v_pag_ayt          := 0;
    v_pag_bom          := 0;

    v_tpo_id := sitf_nit_cc(r1.idntfccion);
    for r2 in c2(r1.id_sjto_impsto) loop
      v_brutos           := r2.brutos;
      v_brutos_municipio := r2.brutos_municipio;
      v_brutos_fuera     := r2.brutos - r2.brutos_municipio;
      v_liq_ica          := r2.ica;
      v_liq_ayt          := r2.ayt;
      v_liq_bom          := r2.bom;
    end loop;

    for r3 in c3(r1.id_sjto_impsto) loop
      v_pag_ica := v_liq_ica - r3.sldo_ica;
      v_pag_ayt := v_liq_ayt - r3.sldo_ayt;
      v_pag_bom := v_liq_bom - r3.sldo_bom;
    end loop;
    begin
      insert into temp_info_dian_ica
        (tpo_dcmnto,
         idntfccion,
         rzon_scial,
         drccion,
         cdgo_dprtmnto,
         cdgo_mncpio,
         tlfno,
         email,
         actvdad_prncpal,
         actvdad_scndria,
         nmro_estblcmntos,
         ingrsos_brtos_mncpio,
         ingrsos_brtos_fra,
         ingrsos_grvbles_mncpio,
         ica,
         ica_pgdo,
         ayt,
         ayt_pgdo,
         bom,
         bom_pgdo,
         tpo_actvdad)
      values
        (v_tpo_id,
         r1.idntfccion,
         r1.nmbre_rzon_scial,
         r1.drccion,
         23,
         23001,
         r1.tlfno,
         substr(trim(r1.email), 1, 100),
         r1.actvdad,
         null,
         r1.nmro_scrsles,
         v_brutos_municipio,
         v_brutos_fuera,
         r1.bse_grvble,
         v_liq_ica,
         v_pag_ica,
         v_liq_ayt,
         v_pag_ayt,
         v_liq_bom,
         v_pag_bom,
         r1.tpo_actvdad);
      commit;
    exception
      when others then
        dbms_output.put_line(r1.id_sjto_impsto || ' - ' || sqlerrm);
        --raise;
    end;

  end loop;

end temp_prc_info_dian_ICA;
/

