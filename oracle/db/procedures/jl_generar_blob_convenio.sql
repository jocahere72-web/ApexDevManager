
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_GENERAR_BLOB_CONVENIO" (P_nmro_cnvnio       NUMBER,
                                                     p_report_query_name VARCHAR2 DEFAULT 'gf_g_aplccion_acrdo_ctas_2022') is
  v_blob blob;

  l_blob_len integer;
  l_file     utl_file.file_type;
  l_buffer   raw(32767);
  l_pos      integer;
  l_amount   binary_integer := 32767;
begin

  for r1 in (select a.cdgo_clnte,
                    a.id_cnvnio,
                    b.id_acto,
                    c.id_dcmnto,
                    a.nmro_cnvnio,
                    d.nmbre_trcro nmbre_usuario
               from gf_g_convenios a
               join gn_g_actos b
                 on b.id_acto = a.id_acto
               join gd_g_documentos c
                 on c.id_dcmnto = b.id_dcmnto
               join v_sg_g_usuarios d
                 on d.id_usrio = a.id_usrio_aprbcion
              where a.cdgo_cnvnio_estdo = 'APL'
                   --and a.id_cnvnio_tpo IN (5)
                and a.nmro_cnvnio = P_nmro_cnvnio
              order by a.id_cnvnio) loop

    if v('APP_SESSION') is null then

      apex_session.create_session(p_app_id   => 66000,
                                  p_page_id  => 2,
                                  p_username => '1111111112');
    end if;

    apex_session.attach(p_app_id     => 66000,
                        p_page_id    => 2,
                        p_session_id => v('APP_SESSION'));

    apex_util.set_session_state('F_CDGO_CLNTE', r1.cdgo_clnte);
    apex_util.set_session_state('F_NMBRE_USRIO', r1.nmbre_usuario);
    apex_util.set_session_state('p2_prmtro_1', r1.id_cnvnio);
    apex_util.set_session_state('F_FRMTO_MNDA',
                                'FM$999G999G999G999G999G999G990');

    v_blob := apex_util.get_print_document(p_application_id     => 66000,
                                           p_report_query_name  => p_report_query_name,
                                           p_report_layout_name => p_report_query_name,
                                           p_report_layout_type => 'rtf',
                                           p_document_format    => 'PDF');

    l_blob_len := dbms_lob.getlength(v_blob);
    dbms_output.put_line('Tamaño: ' || l_blob_len);
    if l_blob_len > 0 then
      update gd_g_documentos d
         set d.file_blob = v_blob
       where d.id_dcmnto = r1.id_dcmnto;
      commit;
    end if;

  end loop;

end JL_GENERAR_BLOB_CONVENIO;
/

