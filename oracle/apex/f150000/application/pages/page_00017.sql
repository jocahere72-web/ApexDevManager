prompt --application/pages/page_00017
begin
wwv_flow_api.create_page(
 p_id=>17
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Recuperar Contrase\00F1a')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Recuperar Contrase\00F1a')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js',
'#IMAGE_PREFIX#javascript/infortributos/Portal/js/app.js?v=&APP_SESSION.',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'))
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'30%'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20210206114714'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(70494674412757204)
,p_plug_name=>'Recuperar'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(70495546139757213)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(70494674412757204)
,p_button_name=>'BTN_RCPRAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Recuperar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70496098078757218)
,p_name=>'P17_CDGO_CLNTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(70494674412757204)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70995220809847472)
,p_name=>'P17_CDGO_IDNTFCCION_TPO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(70494674412757204)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:N\00DAMERO DE IDENTIFICACI\00D3N TRIBUTARIA;N,C\00C9DULA DE EXTRANJER\00CDA;E,C\00C9DULA DE CIUDADAN\00CDA;C')
,p_cHeight=>1
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70995572846853991)
,p_name=>'P17_IDNTFCCION'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(70494674412757204)
,p_prompt=>unistr(' Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>25
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(70496161536757219)
,p_computation_sequence=>10
,p_computation_item=>'P17_CDGO_CLNTE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'F_CDGO_CLNTE'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(70495785502757215)
,p_name=>unistr('al hacer clic en el bot\00F3n recuperar')
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(70495546139757213)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70495803275757216)
,p_event_id=>wwv_flow_api.id(70495785502757215)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'portal.recuperar();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(70495675557757214)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'recuperar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_json_t        json_object_t;',
'    v_json          json_object_t;',
'    v_sql           clob; ',
'    v_array_t       json_array_t;',
'    v_keys          json_key_list;',
'    v_body          json_object_t := json_object_t();',
'    ',
'    ',
'',
'begin',
'    v_body.put(''cliente'',             :F_CDGO_CLNTE);',
'    v_body.put(''identificacion'',      :P17_IDNTFCCION);',
'    v_body.put(''tipo_identificacion'', :P17_CDGO_IDNTFCCION_TPO);',
'    ',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/json'';',
'    v_json := json_object_t(apex_web_service.make_rest_request( p_url          => :F_DRCCION_SRVDOR_PRVDO || ''portal/recuperar''',
'                                                              , p_http_method  => ''POST''',
'                                                              , p_body         => v_body.stringify )); ',
'    ',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''type'', ''OK'');  ',
'    apex_json.write(''size'' , v_json.get_string(''msg''));    ',
'    apex_json.close_object;',
'                                                                     ',
'    exception',
'        when others then',
'            null;    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
