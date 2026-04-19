
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_GNRAR_ACTO_NVDAD" (P_ID_NVDAD_PRSNA NUMBER) is
  cursor c1 is
    select t.cdgo_clnte,
           t.id_sjto_impsto,
           t.id_nvdad_prsna,
           i.idntfccion_sjto,
           r.nmbre_rzon_scial,
           t.fcha_rgstro,
           t.cdgo_nvdad_tpo,
           t.id_acto,
           t.dcmnto_html,
           d.id_dcmnto
      from SI_G_NOVEDADES_PERSONA t
      join v_si_i_sujetos_impuesto i
        on i.id_sjto_impsto = t.id_sjto_impsto
      join SI_I_PERSONAS r
        on t.id_sjto_impsto = r.id_sjto_impsto
      join gn_g_actos a
        on a.id_acto = t.id_acto
      join gd_g_documentos d
        on d.id_dcmnto = a.id_dcmnto
     where t.id_sjto_impsto is not null
       and t.Id_Acto IS NOT NULL
       AND T.ID_NVDAD_PRSNA = P_ID_NVDAD_PRSNA
     order by t.fcha_rgstro;

  v_id_plntlla number := 176;

  v_blob          blob;
  v_gn_d_reportes gn_d_reportes%rowtype;
  v_error         exception;

begin

  for r1 in c1 loop

    begin
      select b.*
        into v_gn_d_reportes
        from gn_d_plantillas a
        join gn_d_reportes b
          on a.id_rprte = b.id_rprte
       where a.cdgo_clnte = r1.cdgo_clnte
         and a.id_plntlla = v_id_plntlla;

    exception
      when no_data_found then
        raise v_error;
      when others then
        raise v_error;
    end; -- Fin Consultamos los datos del reporte

    if v('APP_SESSION') is null then

      apex_session.create_session(p_app_id   => 66000,
                                  p_page_id  => 37,
                                  p_username => '1111111112');
    end if;

    apex_util.set_session_state('P37_JSON',
                                '{"id_nvdad_prsna":"' || r1.id_nvdad_prsna || '"}');
    apex_util.set_session_state('F_CDGO_CLNTE', r1.cdgo_clnte);
    apex_util.set_session_state('P37_ID_RPRTE', v_gn_d_reportes.id_rprte);

    begin
      v_blob := apex_util.get_print_document(p_application_id     => 66000,
                                             p_report_query_name  => v_gn_d_reportes.nmbre_cnslta,
                                             p_report_layout_name => v_gn_d_reportes.nmbre_plntlla,
                                             p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla,
                                             p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo);
    exception
      when others then
        raise v_error;
    end;

    if v_blob is not null then
      -- Generaci¿n blob
      begin
        pkg_gn_generalidades.prc_ac_acto(p_file_blob       => v_blob,
                                         p_id_acto         => r1.id_acto,
                                         p_ntfccion_atmtca => 'N');
        commit;
      exception
        when others then
          raise v_error;
      end;
    else
      raise v_error;
    end if;
  end loop;

end JL_GNRAR_ACTO_NVDAD;
/

