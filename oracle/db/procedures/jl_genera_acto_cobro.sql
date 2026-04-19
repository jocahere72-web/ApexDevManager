
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_GENERA_ACTO_COBRO" (p_cdgo_clnte             number,
                                                 p_id_prcsos_jrdco_dcmnto number) is
  v_blob      blob;
  v_documento clob;
begin

  for r1 in (select a.id_dcmnto,
                    c.id_prcsos_jrdco_dcmnto,
                    c.id_prcsos_jrdco,
                    b.id_plntlla,
                    e.nmbre_cnslta,
                    e.nmbre_plntlla,
                    c.id_acto
               from cb_g_procesos_jrdco_dcmnto c
               join gn_g_actos a
                 on a.id_acto = c.id_acto
               join cb_g_prcsos_jrdc_dcmnt_plnt b
                 on b.id_prcsos_jrdco_dcmnto = c.id_prcsos_jrdco_dcmnto
               join gn_d_plantillas d
                 on d.id_plntlla = b.id_plntlla
               join gn_d_reportes e
                 on e.id_rprte = d.id_rprte
              where c.id_acto is not null
                and c.id_prcsos_jrdco_dcmnto = p_id_prcsos_jrdco_dcmnto
             /*     and c.id_acto_tpo = 26
               and exists
             (select 1
                      from cb_g_procesos_juridico j
                     where j.id_prcsos_jrdco = c.id_prcsos_jrdco
                       and j.id_prcso_jrdco_lte = 188)*/
             ) loop

    -- se genera el html nuevamente
    v_documento := pkg_gn_generalidades.fnc_ge_dcmnto('{"id_prcsos_jrdco":"' ||
                                                      r1.id_prcsos_jrdco ||
                                                      '","id_prcsos_jrdco_dcmnto":"' ||
                                                      r1.id_prcsos_jrdco_dcmnto || '"}',
                                                      r1.id_plntlla);

    update cb_g_prcsos_jrdc_dcmnt_plnt p
       set p.dcmnto = v_documento
     where p.id_prcsos_jrdco_dcmnto = r1.id_prcsos_jrdco_dcmnto;

    if v('APP_SESSION') is null then

      apex_session.create_session(p_app_id   => 66000,
                                  p_page_id  => 71,
                                  p_username => '1111111112');
    end if;

    apex_session.attach(p_app_id     => 66000,
                        p_page_id    => 71,
                        p_session_id => v('APP_SESSION'));

    apex_util.set_session_state('F_CDGO_CLNTE', p_cdgo_clnte);

    apex_util.set_session_state('P71_JSON',
                                '{"ID_PRCSOS_JRDCO_DCMNTO":"' ||
                                r1.id_prcsos_jrdco_dcmnto ||
                                '","ID_PRCSOS_JRDCO":"' ||
                                r1.id_prcsos_jrdco ||
                                '","NMBRE_RPRTE":"JOSE"}');

    v_blob := apex_util.get_print_document(p_application_id     => 66000,
                                           p_report_query_name  => r1.nmbre_cnslta,
                                           p_report_layout_name => r1.nmbre_plntlla,
                                           p_report_layout_type => 'rtf',
                                           p_document_format    => 'PDF');

    dbms_output.put_line('Tamaño: ' || dbms_lob.getlength(v_blob));

    if r1.id_dcmnto is not null then

      update gd_g_documentos g
         set g.file_blob = v_blob
       where g.id_dcmnto = r1.id_dcmnto;

    else
      pkg_gn_generalidades.prc_ac_acto(p_file_blob       => v_blob,
                                       p_id_acto         => r1.id_acto,
                                       p_ntfccion_atmtca => 'N');
    end if;
    commit;

  end loop;

end jl_genera_acto_cobro;
/

