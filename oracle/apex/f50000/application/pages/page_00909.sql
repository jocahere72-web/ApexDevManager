prompt --application/pages/page_00909
begin
wwv_flow_api.create_page(
 p_id=>909
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Scanner'
,p_page_mode=>'MODAL'
,p_step_title=>'Scanner'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/js/jspdf.debug.js',
'#IMAGE_PREFIX#javascript/infortributos/Scanner/js/scan.js?v=1.10.1'))
,p_javascript_code=>'var file_blob;'
,p_javascript_code_onload=>'init();'
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Scanner/css/style.css?v=1'
,p_step_template=>wwv_flow_api.id(29518229835068493)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_last_updated_by=>'MCARO'
,p_last_upd_yyyymmddhh24miss=>'20191107112356'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16360992969116578)
,p_plug_name=>'Contenido'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_display_point=>'BODY'
,p_plug_source=>'<div id="visor" class="pdfobject-container" ></div>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(100850017624024553)
,p_plug_name=>'opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(131910341027475147)
,p_plug_name=>'configuraciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8787991137037260)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(131910341027475147)
,p_button_name=>'btn_back'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(29604517744068538)
,p_button_image_alt=>'Anterior'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8784898352037256)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(100850017624024553)
,p_button_name=>'BTN_SCANNER'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Escanear'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-print'
,p_grid_column_attributes=>'style="margin-bottom:5px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8785259236037256)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(100850017624024553)
,p_button_name=>'BTN_SAVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_column_attributes=>'style="margin-bottom:5px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8784099954037253)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(100850017624024553)
,p_button_name=>'btn_clear'
,p_button_static_id=>'btn_clear'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Limpiar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-trash'
,p_grid_column_attributes=>'style="margin-bottom:5px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8788320772037262)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(131910341027475147)
,p_button_name=>'btn_next'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(29604517744068538)
,p_button_image_alt=>'Siguiente'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-angle-right'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8784445719037255)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(100850017624024553)
,p_button_name=>'btn_delete'
,p_button_static_id=>'btn_delete'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(8798648570037278)
,p_branch_action=>'f?p=&P18_APP_ID.:&P18_APP_PAGE_ID.:&SESSION.::&DEBUG.:RP,&P18_APP_PAGE_ID.::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7579325152079348)
,p_name=>'P909_TIPO_HOJA'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(100850017624024553)
,p_prompt=>'Tipo de hoja'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Carta;letter,Oficio;legal'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione...'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8786090983037258)
,p_name=>'P909_APP_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(100850017624024553)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8786408452037259)
,p_name=>'P909_APP_PAGE_ID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(100850017624024553)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8786838548037259)
,p_name=>'P909_AGRGAR_ARCHVO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(100850017624024553)
,p_item_default=>'N'
,p_prompt=>unistr('\00BFAgregar Archivo?')
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8787283804037259)
,p_name=>'P909_ARCHIVO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(100850017624024553)
,p_prompt=>'Archivo'
,p_display_as=>'NATIVE_FILE'
,p_field_template=>wwv_flow_api.id(29603863518068537)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
,p_attribute_11=>'image/*'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8788700295037262)
,p_name=>'P909_ACTUAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(131910341027475147)
,p_item_default=>'0'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(29603863518068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8789111713037265)
,p_name=>'P909_TOTAL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(131910341027475147)
,p_item_default=>'0'
,p_prompt=>'de'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(29603863518068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8794019386037275)
,p_name=>'al hacer clic en el boton scanner'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8784898352037256)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8794589340037276)
,p_event_id=>wwv_flow_api.id(8794019386037275)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'ws.send("1100");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8794986100037276)
,p_name=>'al hacer clic en el boton Guardar'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8785259236037256)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8795434195037276)
,p_event_id=>wwv_flow_api.id(8794986100037276)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'savePDF();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8795865882037276)
,p_name=>'al hacer clic en el boton back'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8787991137037260)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8796357303037276)
,p_event_id=>wwv_flow_api.id(8795865882037276)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'moveTo(''L'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8796792797037277)
,p_name=>'al hacer clic en el boton siguiente'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8788320772037262)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8797287118037277)
,p_event_id=>wwv_flow_api.id(8796792797037277)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'moveTo(''R'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8797660741037277)
,p_name=>'al presionar enter'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P909_ACTUAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8798119325037277)
,p_event_id=>wwv_flow_api.id(8797660741037277)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'move();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8789998243037273)
,p_name=>unistr('al hacer clic en el bot\00F3n borrar')
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8784099954037253)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8790498591037274)
,p_event_id=>wwv_flow_api.id(8789998243037273)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'clear();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8790863465037274)
,p_name=>unistr('al hacer clic en el bot\00F3n eliminar')
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8784445719037255)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8791378430037274)
,p_event_id=>wwv_flow_api.id(8790863465037274)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'remove();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8791785796037274)
,p_name=>'al cambiar la agregar archivo'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P909_AGRGAR_ARCHVO'
,p_condition_element=>'P909_AGRGAR_ARCHVO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'N'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8792250263037275)
,p_event_id=>wwv_flow_api.id(8791785796037274)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P909_ARCHIVO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8792794675037275)
,p_event_id=>wwv_flow_api.id(8791785796037274)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P909_ARCHIVO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8793129521037275)
,p_name=>'al seleccionar un archivo'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P909_ARCHIVO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8793623061037275)
,p_event_id=>wwv_flow_api.id(8793129521037275)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'agregarArchivo(this);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8789516702037272)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'procesarArchivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_file_blob             blob             := empty_blob();',
'    v_apex_file_name   varchar2(4000)   := apex_application.g_f01(1);',
'    v_file_name        varchar2(4000)   := apex_application.g_x01;',
'    v_file_mimetype    varchar2(4000)   := apex_application.g_x02;',
'    v_app_id           number           := apex_application.g_x03;',
'    v_app_page_id      number           := apex_application.g_x04;',
'    ',
'    v_app_id_a         number := :APP_ID;',
'    v_app_page_id_a    number := :APP_PAGE_ID;',
'    ',
'begin',
'    apex_session.attach ( p_app_id     => v_app_id, p_page_id    => v_app_page_id, p_session_id => :APP_SESSION );',
'    apex_collection.create_or_truncate_collection(p_collection_name => ''SCANNER'');',
'    ',
'    begin',
'        select blob_content',
'          into v_file_blob',
'          from apex_application_files',
'         where name = v_apex_file_name;',
'    ',
'    exception ',
'        when others then ',
'            apex_json.open_object;',
'            apex_json.write(''type'', ''ERROR'' );',
'            apex_json.write(''msg'' , sqlerrm );',
'            apex_json.close_object;',
'    end;',
'     ',
'    delete from apex_application_files where name = v_apex_file_name; ',
'    apex_collection.add_member( p_collection_name => ''SCANNER''',
'						      , p_c001 			  => v_file_name',
'			                  , p_c002            => v_file_mimetype',
'                              , p_blob001         => v_file_blob );',
'    ',
'    apex_session.attach ( p_app_id     => v_app_id_a , p_page_id  => v_app_page_id_a, p_session_id => :APP_SESSION );',
'    apex_json.open_object;',
'    apex_json.write(''type'',''OK'');',
'    if v_app_id is not null and v_app_page_id is not null then',
'        apex_json.write(''url'', apex_util.prepare_url( p_url => ''f?p='' || v_app_id || '':''|| v_app_page_id || '':''|| v(''APP_SESSION'') ||'':::::'', p_checksum_type => ''session''));',
'    end if;',
'    apex_json.close_object;',
'',
' exception ',
'    when others then ',
'        apex_json.open_object;',
'        apex_json.write(''type'', ''ERROR'' );',
'        apex_json.write(''msg'' , sqlerrm );',
'        apex_json.close_object;   ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
