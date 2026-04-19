prompt --application/pages/page_00010
begin
wwv_flow_api.create_page(
 p_id=>10
,p_user_interface_id=>wwv_flow_api.id(71889596252951620)
,p_name=>unistr('Pagina Impresi\00F3n')
,p_step_title=>unistr('Pagina Impresi\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'MCARO'
,p_last_upd_yyyymmddhh24miss=>'20190214162925'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(74540952223637202)
,p_plug_name=>'Impresion'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74541040332637203)
,p_name=>'P10_ID_RPRTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(74540952223637202)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84199299358248601)
,p_name=>'P10_ID_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(74540952223637202)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84199384535248602)
,p_name=>'P10_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(74540952223637202)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74541135497637204)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Imprimir'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    apex_session.attach( p_app_id     => 66000,',
'                         p_page_id    => 2,',
'                         p_session_id => v(''APP_SESSION'') );',
'    ',
'    ',
'    apex_util.set_session_state(''P2_XML'', ''<data><id_impsto>''|| :P10_ID_IMPSTO || ''</id_impsto><id_impsto_sbmpsto>'' || :P10_ID_IMPSTO_SBMPSTO || ''</id_impsto_sbmpsto></data>'');',
'    apex_util.set_session_state(''F_CDGO_CLNTE'', :F_CDGO_CLNTE);                          ',
'    ',
'    for c_gn_d_reportes in (select r.*',
'                            from gn_d_reportes r',
'                           where r.id_rprte = :P10_ID_RPRTE',
'                         )',
'    loop',
'        apex_util.set_session_state(''P2_ID_RPRTE'', c_gn_d_reportes.id_rprte);   ',
'        begin',
'            apex_util.download_print_document ( ',
'                                                p_file_name           => c_gn_d_reportes.nmbre_rprte',
'                                              , p_content_disposition => ''attachment''',
'                                              , p_application_id      => 66000',
'                                              , p_report_query_name   => c_gn_d_reportes.nmbre_cnslta ',
'                                              , p_report_layout_name  => c_gn_d_reportes.nmbre_plntlla ',
'                                              , p_report_layout_type  => c_gn_d_reportes.cdgo_frmto_plntlla',
'                                              , p_document_format     => c_gn_d_reportes.cdgo_frmto_tpo ',
'                                          );',
'        exception',
'             when others then',
'                null;',
'        end; ',
'    end loop;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
