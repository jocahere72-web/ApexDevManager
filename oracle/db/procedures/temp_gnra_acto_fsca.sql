
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_GNRA_ACTO_FSCA" (p_cdgo_clnte   number,
                                                p_nmro_expdnte varchar2,
                                                p_id_acto_tpo  number) is
  v_xml        clob;
  v_json_envia json_object_t := json_object_t();

  v_blob     blob;
  l_blob_len integer;
  l_file     utl_file.file_type;
  l_buffer   raw(32767);
  l_pos      integer;
  l_amount   binary_integer := 32767;
  v_dcmnto   clob;

  v_id_sjto_impsto            number;
  v_id_rprte                  number;
  v_id_fsclzcion_expdnte      number;
  v_id_impsto                 number;
  v_id_acto                   number;
  v_id_plntlla                number;
  v_id_fsclzcion_expdnte_acto number;
  v_nmro_acto                 number;
  v_id_dcmnto                 number;
  v_report_query_name         varchar2(200);
  v_report_layout_name        varchar2(200);

  v_id_instncia_fljo number; --Instancia Flujo
  v_id_acto_tpo      number := p_id_acto_tpo; --Acto Tipo a Imprimir
  v_cdgo_clnte       number := p_cdgo_clnte; -- Cliente

begin

  select a.id_fsclzcion_expdnte,
         b.id_fsclzcion_expdnte_acto,
         c.id_impsto,
         c.id_sjto_impsto,
         b.id_acto,
         b.id_rprte,
         b.id_plntlla,
         d.nmro_acto,
         d.id_dcmnto,
         e.nmbre_cnslta,
         e.nmbre_plntlla,
         a.id_instncia_fljo
    into v_id_fsclzcion_expdnte,
         v_id_fsclzcion_expdnte_acto,
         v_id_impsto,
         v_id_sjto_impsto,
         v_id_acto,
         v_id_rprte,
         v_id_plntlla,
         v_nmro_acto,
         v_id_dcmnto,
         v_report_query_name,
         v_report_layout_name,
         v_id_instncia_fljo
    from fi_g_fiscalizacion_expdnte a
    join fi_g_fsclzcion_expdnte_acto b
      on b.id_fsclzcion_expdnte = a.id_fsclzcion_expdnte
    join fi_g_candidatos c
      on c.id_cnddto = a.id_cnddto
    join gn_g_actos d
      on d.id_acto = b.id_acto
    join gn_d_reportes e
      on e.id_rprte = b.id_rprte
   where a.nmro_expdnte = p_nmro_expdnte
     and b.id_acto_tpo = v_id_acto_tpo;

  apex_session.create_session(p_app_id   => 66000,
                              p_page_id  => 2,
                              p_username => '1111111112');

  v_xml := '<data>
                <id_fsclzcion_expdnte_acto>' ||
           v_id_fsclzcion_expdnte_acto || '</id_fsclzcion_expdnte_acto>
                <p_id_impsto>' || v_id_impsto ||
           '</p_id_impsto>
                <p_id_fsclzcion_expdnte>' ||
           v_id_fsclzcion_expdnte || '</p_id_fsclzcion_expdnte>
                <cdgo_srie>FI</cdgo_srie>
                <id_sjto_impsto>' || v_id_sjto_impsto ||
           '</id_sjto_impsto>
                <id_acto>' || v_id_acto ||
           '</id_acto>
                <cdgo_clnte>' || v_cdgo_clnte ||
           '</cdgo_clnte>



              </data>';

  apex_util.set_session_state('P2_XML', v_xml);
  apex_util.set_session_state('P2_ID_RPRTE', v_id_rprte);

  apex_util.set_session_state('F_CDGO_CLNTE', v_cdgo_clnte);
  apex_util.set_session_state('F_FRMTO_MNDA',
                              'FM$999G999G999G999G999G999G990');

  v_json_envia := json_object_t();
  v_json_envia.put('ID_SJTO_IMPSTO', v_id_sjto_impsto);
  v_json_envia.put('ID_INSTNCIA_FLJO', v_id_instncia_fljo);

  v_dcmnto := pkg_gn_generalidades.fnc_ge_dcmnto(p_xml        => v_json_envia.to_clob(),
                                                 p_id_plntlla => v_id_plntlla);

  update fi_g_fsclzcion_expdnte_acto t
     set t.dcmnto = v_dcmnto
   where t.id_fsclzcion_expdnte_acto = v_id_fsclzcion_expdnte_acto;
  commit;

  v_blob := apex_util.get_print_document(p_application_id     => 66000,
                                         p_report_query_name  => v_report_query_name, --Actualizar el nombre del query
                                         p_report_layout_name => v_report_layout_name, --Actualizar el nombre del reporte
                                         p_report_layout_type => 'rtf',
                                         p_document_format    => 'PDF');

  l_blob_len := dbms_lob.getlength(v_blob);

  dbms_output.put_line(l_blob_len);

  if l_blob_len > 0 then
    /*
      copy_blob_data_to_file(v_blob,
                             'LOGS', -- Ruta escritura del PDF
                             p_file_name => v_nmro_acto ||
                                            '.pdf');
    */
    update gd_g_documentos d
       set d.file_blob = v_blob
     where d.id_dcmnto = v_id_dcmnto;
    commit;
  end if;

end TEMP_GNRA_ACTO_FSCA;
/

