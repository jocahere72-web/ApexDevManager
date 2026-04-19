prompt --application/pages/page_00081
begin
wwv_flow_api.create_page(
 p_id=>81
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'imprimir'
,p_step_title=>'imprimir'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20190128140013'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(73549039173728609)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Imprimir'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    ',
'begin',
'    for c_rportes in ( select *',
'                         from gn_d_reportes r',
'                        where r.id_rprte in ''202,20'') loop',
'         ',
'         apex_util.download_print_document (p_file_name           => c_rportes.nmbre_rprte',
'                                          , p_content_disposition => ''attachment''',
'                                          , p_application_id      => 66000',
'                                          , p_report_query_name   => c_rportes.nmbre_cnslta ',
'                                          , p_report_layout_name  => c_rportes.nmbre_plntlla ',
'                                          , p_report_layout_type  => c_rportes.cdgo_frmto_plntlla',
'                                          , p_document_format     => c_rportes.cdgo_frmto_tpo ',
'                                          );',
'    end loop;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
