
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_GENERAR_BLOB_CONVENIO" is

  v_blob blob;

  l_blob_len integer;
  l_file     utl_file.file_type;
  l_buffer   raw(32767);
  l_pos      integer;
  l_amount   binary_integer := 32767;
begin

  for r1 in (select a.id_cnvnio, b.id_acto, c.id_dcmnto, a.nmro_cnvnio
               from gf_g_convenios a
               join gn_g_actos b
                 on b.id_acto = a.id_acto
               join gd_g_documentos c
                 on c.id_dcmnto = b.id_dcmnto
              where a.cdgo_cnvnio_estdo = 'APL'
                   --and a.id_cnvnio_tpo IN (5)
                and a.nmro_cnvnio in (20260000018)
              order by a.id_cnvnio) loop

    if v('APP_SESSION') is null then

      apex_session.create_session(p_app_id   => 66000,
                                  p_page_id  => 2,
                                  p_username => '1111111112');
    end if;

    /*
      update gf_g_convenios a
         set a.fcha_slctud          = to_date('20211230', 'yyyymmdd'),
             a.fcha_elbrcion_cnvnio = to_date('20211230', 'yyyymmdd'),
             a.fcha_aprbcion        = to_date('20211230', 'yyyymmdd'),
             a.fcha_aplccion        = to_date('20211230', 'yyyymmdd')
       where a.id_cnvnio = r1.id_cnvnio;

      update gn_g_actos b
         set b.fcha                = to_date('20211230', 'yyyymmdd'),
             b.fcha_incio_ntfccion = to_date('20211230', 'yyyymmdd'),
             b.nmro_acto           = r1.nmro_cnvnio,
             b.nmro_acto_dsplay    = '2021-' || r1.nmro_cnvnio
       where b.id_acto = r1.id_acto;

      commit;
    */
    apex_session.attach(p_app_id     => 66000,
                        p_page_id    => 2,
                        p_session_id => v('APP_SESSION'));

    apex_util.set_session_state('F_CDGO_CLNTE', 23001);
    apex_util.set_session_state('p2_prmtro_1', r1.id_cnvnio);
    apex_util.set_session_state('F_FRMTO_MNDA',
                                'FM$999G999G999G999G999G999G990');

    v_blob := apex_util.get_print_document(p_application_id     => 66000,
                                           p_report_query_name  => 'gf_g_aplicacion_acuerdo_rtf',
                                           p_report_layout_name => 'gf_g_aplicacion_acuerdo_rtf',
                                           p_report_layout_type => 'rtf',
                                           p_document_format    => 'PDF');

    l_blob_len := dbms_lob.getlength(v_blob);

    if l_blob_len > 0 then
      update gd_g_documentos d
         set d.file_blob = v_blob, d.fcha = to_date('20211230', 'yyyymmdd')
       where d.id_dcmnto = r1.id_dcmnto;

      l_pos := 1;
      --guardar pdf en el disco
      l_file := utl_file.fopen('ETL_CARGA',
                               r1.nmro_cnvnio || '.pdf',
                               'WB',
                               32767);

      while l_pos < l_blob_len loop
        dbms_lob.read(v_blob, l_amount, l_pos, l_buffer);
        utl_file.put_raw(l_file, l_buffer, true);
        l_pos := l_pos + l_amount;
      end loop;

      l_blob_len := 0;

      utl_file.fclose(l_file);

    end if;
    commit;
  end loop;

end temp_generar_blob_convenio;
/

