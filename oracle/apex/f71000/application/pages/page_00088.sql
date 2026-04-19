prompt --application/pages/page_00088
begin
wwv_flow_api.create_page(
 p_id=>88
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Visualizador de documentos'
,p_alias=>'PRUEBA'
,p_step_title=>'Visualizador de documentos'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JDIAZ'
,p_last_upd_yyyymmddhh24miss=>'20190220170746'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76545806852978414)
,p_plug_name=>'Nuevo'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76546083405978416)
,p_name=>'P88_PRM3'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(76545806852978414)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86368428004026801)
,p_name=>'P88_PRM1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(76545806852978414)
,p_prompt=>'Nuevo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86368513326026802)
,p_name=>'P88_PRM2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(76545806852978414)
,p_prompt=>'Nuevo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(76791793799124301)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Visualizar documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_mime      varchar2(48);',
'    v_length    number;',
'    v_file_name varchar2(2000);',
'    lob_loc     blob;',
'    ',
'begin',
'    execute immediate',
'        ''select /*+ result_cache */ a.file_mimetype ,a.file_blob ,a.file_name ,dbms_lob.getlength(a.file_blob)',
'         from   ''||:P88_PRM1||''  a',
'         where  ''||:P88_PRM2||''=''   ||:P88_PRM3',
'         into   v_mime          ,lob_loc     ,v_file_name ,v_length;',
'    htp.flush;',
'    htp.init;',
'    -- ',
'    owa_util.mime_header( nvl(v_mime,''application/octet''), false );',
'    --',
'    htp.p(''Content-length: '' || v_length);',
'    --',
'    htp.p(''Content-Disposition: inline; filename="''|| v_file_name || ''"'');',
'    --htp.p(''Content-Disposition: inline'');',
'    --htp.p(''title: Prueba'');   ',
'   ',
'    -- close the headers',
'    owa_util.http_header_close;',
'    --',
'    -- download the BLOB',
'    wpg_docload.download_file(lob_loc);',
'  ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(76820462844392801)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>unistr('Limpiar Sesi\00F3n')
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
