
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_GNRAR_ACTO_RVCTRIA" (p_id_cnvnio NUMBER) is
  v_blob      blob;
  v_documento clob;

  v_cdgo_clnte number;
  v_id_acto    number;

  v_id_plntlla  number;
  v_id_acto_tpo number;
  v_id_rprte    number;
  v_id_impsto   number;
  v_id_dcmnto   number;

  v_nmbre_usrio varchar2(100);
begin

  if v('APP_SESSION') is null then

    apex_session.create_session(p_app_id   => 66000,
                                p_page_id  => 2,
                                p_username => '1111111112');
  end if;

  select a.cdgo_clnte,
         a.id_impsto,
         c.id_acto,
         d.id_plntlla,
         d.id_rprte,
         c.id_acto_tpo,
         c.id_dcmnto,
         b.nmbre_trcro
    into v_cdgo_clnte,
         v_id_impsto,
         v_id_acto,
         v_id_plntlla,
         v_id_rprte,
         v_id_acto_tpo,
         v_id_dcmnto,
         v_nmbre_usrio
    from v_gf_g_convenios a
    join v_gf_g_convenios_revocatoria b
      on b.id_cnvnio = a.id_cnvnio
    join gn_g_actos c
      on c.id_acto = b.id_acto
    join gf_g_convenios_documentos d
      on d.id_acto = c.id_acto
   where a.id_cnvnio = p_id_cnvnio;

  v_documento := pkg_gn_generalidades.fnc_ge_dcmnto('<COD_CLNTE>' ||
                                                    v_cdgo_clnte ||
                                                    '</COD_CLNTE><ID_CNVNIO>' ||
                                                    p_id_cnvnio ||
                                                    '</ID_CNVNIO><ID_PLNTLLA>' ||
                                                    v_id_plntlla ||
                                                    '</ID_PLNTLLA><ID_ACTO_TPO>' ||
                                                    v_id_acto_tpo ||
                                                    '</ID_ACTO_TPO>',
                                                    v_id_plntlla);

  update gf_g_convenios_documentos c
     set c.dcmnto = v_documento
   where c.id_cnvnio = p_id_cnvnio
     and c.id_acto = v_id_acto;

  commit;

  apex_session.attach(p_app_id     => 66000,
                      p_page_id    => 2,
                      p_session_id => v('APP_SESSION'));

  apex_util.set_session_state('F_CDGO_CLNTE', v_cdgo_clnte);
  apex_util.set_session_state('F_NMBRE_USRIO', v_nmbre_usrio);
  apex_util.set_session_state('F_FRMTO_MNDA',
                              'FM$999G999G999G999G999G999G990');

  apex_util.set_session_state('P2_XML',
                              '<data><id_acto>' || v_id_acto ||
                              '</id_acto><id_cnvnio>' || p_id_cnvnio ||
                              '</id_cnvnio><cod_clnte>' || v_cdgo_clnte ||
                              '</cod_clnte><p_id_rprte>' || v_id_rprte ||
                              '</p_id_rprte><id_plntlla>' || v_id_plntlla ||
                              '</id_plntlla><id_cnvnio_mdfccion>' ||
                              '</id_cnvnio_mdfccion><p_id_impsto>' ||
                              v_id_impsto || '</p_id_impsto></data>'); -- 10/03/2022 agregado para modificacion AP

  apex_util.set_session_state('P2_PRMTRO_1', p_id_cnvnio);

  v_blob := apex_util.get_print_document(p_application_id     => 66000,
                                         p_report_query_name  => 'gf_g_revocatoria_acuerdo',
                                         p_report_layout_name => 'gf_g_revocatoria_acuerdo',
                                         p_report_layout_type => 'rtf',
                                         p_document_format    => 'PDF');

  dbms_output.put_line('Tama?o: ' || dbms_lob.getlength(v_blob));

  update gd_g_documentos d
     set d.file_blob = v_blob
   where d.id_dcmnto = v_id_dcmnto;

  commit;

end JL_GNRAR_ACTO_RVCTRIA;
/

