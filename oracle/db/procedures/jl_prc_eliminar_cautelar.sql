
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_PRC_ELIMINAR_CAUTELAR" (p_id_embrgos_crtra   number,
                                                     p_id_embrgos_smu_lte number) is
begin
  for r1 in (select distinct a.id_embrgos_crtra,
                             a.id_instncia_fljo,
                             a.id_sjto,
                             e.id_acto,
                             b.id_dcmnto,
                             c.id_acto_ofcio,
                             f.id_dcmnto id_dmcnto_ofcio,
                             e.id_lte_mdda_ctlar,
                             (select max(t.id_sjto_impsto)
                                from mc_g_embargos_cartera_detalle t
                               where t.id_embrgos_crtra = a.id_embrgos_crtra) id_sjto_impsto
               from mc_g_embargos_resolucion e
               join v_mc_g_embargos_cartera a
                 on a.id_embrgos_crtra = e.id_embrgos_crtra
               left join gn_g_actos b
                 on b.id_acto = e.id_acto
               left join mc_g_solicitudes_y_oficios c
                 on c.id_embrgos_crtra = a.id_embrgos_crtra
               left join gn_g_actos f
                 on f.id_acto = c.id_acto_ofcio
              where --a.id_embrgos_crtra = p_id_embrgos_crtra
              to_char(a.fcha_ingrso, 'yyyymmdd') = '20250724') loop

    delete from mc_g_embargos_sjto
     where id_embrgos_crtra = r1.id_embrgos_crtra;

    delete from mc_g_embargos_cartera_detalle
     where id_embrgos_crtra = r1.id_embrgos_crtra;

    delete from mc_g_embrgs_rslcion_rspnsbl
     where id_embrgos_rspnsble in
           (select id_embrgos_rspnsble
              from mc_g_embargos_responsable
             where id_embrgos_crtra = r1.id_embrgos_crtra);

    delete from mc_g_embargos_responsable
     where id_embrgos_crtra = r1.id_embrgos_crtra;

    delete from mc_g_embargos_bienes_detalle
     where id_embrgos_bnes in
           (select id_embrgos_bnes
              from mc_g_embargos_bienes
             where id_slctd_ofcio in
                   (select id_slctd_ofcio
                      from mc_g_solicitudes_y_oficios
                     where id_embrgos_crtra = r1.id_embrgos_crtra));

    delete from mc_g_embargos_bienes
     where id_slctd_ofcio in
           (select id_slctd_ofcio
              from mc_g_solicitudes_y_oficios
             where id_embrgos_crtra = r1.id_embrgos_crtra);

    delete from mc_g_solicitudes_y_oficios
     where id_embrgos_crtra = r1.id_embrgos_crtra;

    delete from mc_g_embargos_resolucion
     where id_embrgos_crtra = r1.id_embrgos_crtra;

    delete from mc_g_embrgos_crt_prc_jrd t
     where id_embrgos_crtra = r1.id_embrgos_crtra;

    delete from mc_g_embargos_cartera
     where id_embrgos_crtra = r1.id_embrgos_crtra;
    /*
      delete from mc_g_lotes_mdda_ctlar_dtlle d
       where d.id_lte_mdda_ctlar = r1.id_lte_mdda_ctlar;

      delete from mc_g_lotes_mdda_ctlar
       where id_lte_mdda_ctlar = r1.id_lte_mdda_ctlar;
    */
    update mc_g_embargos_simu_sujeto a
       set indcdor_prcsdo = 'N'
     where id_embrgos_smu_lte = p_id_embrgos_smu_lte
       and a.id_sjto = r1.id_sjto;

    delete from wf_g_instancias_participante
     where id_fljo_trnscion = r1.id_instncia_fljo;

    delete from wf_g_instncias_trnscn_estdo
     where id_instncia_trnscion in
           (select id_instncia_trnscion
              from wf_g_instancias_transicion
             where id_instncia_fljo = r1.id_instncia_fljo);

    delete from wf_g_instancias_transicion
     where id_instncia_fljo = r1.id_instncia_fljo;

    delete from wf_g_instancias_flujo
     where id_instncia_fljo = r1.id_instncia_fljo;

    -- borrado acto resulción
    update gn_g_actos a
       set a.id_dcmnto = null
     where a.id_acto = r1.id_acto;

    delete from gd_g_documentos a where a.id_dcmnto = r1.id_dcmnto;

    delete from gn_g_actos_responsable a where a.id_acto = r1.id_acto;

    delete from gn_g_actos_vigencia a where a.id_acto = r1.id_acto;

    delete from gn_g_actos_sujeto_impuesto a where a.id_acto = r1.id_acto;

    delete from gn_g_actos a where a.id_acto = r1.id_acto;

    --borrado acto oficio
    update gn_g_actos a
       set a.id_dcmnto = null
     where a.id_acto = r1.id_acto_ofcio;

    delete from gd_g_documentos a where a.id_dcmnto = r1.id_dmcnto_ofcio;

    delete from gn_g_actos_responsable a
     where a.id_acto = r1.id_acto_ofcio;

    delete from gn_g_actos_vigencia a where a.id_acto = r1.id_acto_ofcio;

    delete from gn_g_actos_sujeto_impuesto a
     where a.id_acto = r1.id_acto_ofcio;

    --eliminar al sujeto del oficio de desembargo
    delete from gn_g_actos_sujeto_impuesto a
     where a.id_acto = r1.id_acto_ofcio
       and a.id_sjto_impsto = r1.id_sjto_impsto;

    begin
      delete from gn_g_actos a where a.id_acto = r1.id_acto_ofcio;
    exception
      when others then
        null;
    end;

  end loop;
end jl_prc_eliminar_cautelar;
/

