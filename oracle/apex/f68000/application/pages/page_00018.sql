prompt --application/pages/page_00018
begin
wwv_flow_api.create_page(
 p_id=>18
,p_user_interface_id=>wwv_flow_api.id(71889596252951620)
,p_name=>'Scanner 2'
,p_page_mode=>'MODAL'
,p_step_title=>'Scanner 2'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/js/jspdf.debug.js',
'#IMAGE_PREFIX#javascript/infortributos/Scanner/js/scan.js?v=4'))
,p_javascript_code=>'var file_blob;'
,p_javascript_code_onload=>'init();'
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Scanner/css/style.css?v=1'
,p_step_template=>wwv_flow_api.id(71782047861951540)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_attributes=>'id:"hshasksaas"'
,p_dialog_css_classes=>'prueba'
,p_last_updated_by=>'MCARO'
,p_last_upd_yyyymmddhh24miss=>'20190725164021'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7577869324079333)
,p_plug_name=>'Contenido'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
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
 p_id=>wwv_flow_api.id(92066893978987308)
,p_plug_name=>'opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(123127217382437902)
,p_plug_name=>'configuraciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(92066610626987306)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(92066893978987308)
,p_button_name=>'BTN_SCANNER'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_image_alt=>'Escanear'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-print'
,p_grid_column_attributes=>'style="margin-bottom:5px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(123127378839437903)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(123127217382437902)
,p_button_name=>'btn_back'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(71867586854951593)
,p_button_image_alt=>'Anterior'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(92066733037987307)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(92066893978987308)
,p_button_name=>'BTN_SAVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
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
 p_id=>wwv_flow_api.id(3756678226064201)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(92066893978987308)
,p_button_name=>'btn_clear'
,p_button_static_id=>'btn_clear'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_image_alt=>'Limpiar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-trash-o'
,p_grid_column_attributes=>'style="margin-bottom:5px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3756944553064204)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(92066893978987308)
,p_button_name=>'btn_delete'
,p_button_static_id=>'btn_delete'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_image_alt=>'Borrar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-trash'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(123127509963437905)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(123127217382437902)
,p_button_name=>'btn_next'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(71867586854951593)
,p_button_image_alt=>'Siguiente'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-angle-right'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(123127191138437901)
,p_branch_action=>'f?p=&P18_APP_ID.:&P18_APP_PAGE_ID.:&SESSION.::&DEBUG.:RP,&P18_APP_PAGE_ID.::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7578535626079340)
,p_name=>'P18_AGRGAR_ARCHVO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(92066893978987308)
,p_item_default=>'N'
,p_prompt=>'Agregar Archivo'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Si;S,No;N'
,p_field_template=>wwv_flow_api.id(71867060529951592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7578893278079343)
,p_name=>'P18_ARCHIVO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(92066893978987308)
,p_prompt=>'Archivo'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(71867177152951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92066907720987309)
,p_name=>'P18_TIPO_HOJA'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(92066893978987308)
,p_prompt=>'Tipo de hoja'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Carta;letter,Oficio;legal'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione ...'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(71867355103951593)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92067250785987312)
,p_name=>'P18_APP_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(92066893978987308)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92067304169987313)
,p_name=>'P18_APP_PAGE_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(92066893978987308)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123127423369437904)
,p_name=>'P18_TOTAL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(123127217382437902)
,p_item_default=>'0'
,p_prompt=>'de'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123127621930437906)
,p_name=>'P18_ACTUAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(123127217382437902)
,p_item_default=>'0'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(92067074645987310)
,p_name=>'al hacer clic en el boton scanner'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(92066610626987306)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92067198630987311)
,p_event_id=>wwv_flow_api.id(92067074645987310)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'ws.send("1100");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(92067438227987314)
,p_name=>'al hacer clic en el boton Guardar'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(92066733037987307)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92067502832987315)
,p_event_id=>wwv_flow_api.id(92067438227987314)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'savePDF();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(123127707691437907)
,p_name=>'al hacer clic en el boton back'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(123127378839437903)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(123127840216437908)
,p_event_id=>wwv_flow_api.id(123127707691437907)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'moveTo(''L'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(123127986532437909)
,p_name=>'al hacer clic en el boton siguiente'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(123127509963437905)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(123128013169437910)
,p_event_id=>wwv_flow_api.id(123127986532437909)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'moveTo(''R'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(123128150229437911)
,p_name=>'al presionar enter'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P18_ACTUAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(123128241162437912)
,p_event_id=>wwv_flow_api.id(123128150229437911)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'move();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3756782972064202)
,p_name=>unistr('al hacer clic en el bot\00F3n borrar')
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(3756678226064201)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3756869230064203)
,p_event_id=>wwv_flow_api.id(3756782972064202)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'clear();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3757087431064205)
,p_name=>unistr('al hacer clic en el bot\00F3n eliminar')
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(3756944553064204)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3757193889064206)
,p_event_id=>wwv_flow_api.id(3757087431064205)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'remove();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7578628822079341)
,p_name=>'al cambiar la agregar archivo'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P18_AGRGAR_ARCHVO'
,p_condition_element=>'P18_AGRGAR_ARCHVO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'N'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7578796115079342)
,p_event_id=>wwv_flow_api.id(7578628822079341)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P18_TIPO_HOJA,P18_ARCHIVO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7578984107079344)
,p_event_id=>wwv_flow_api.id(7578628822079341)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P18_ARCHIVO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7579074791079345)
,p_name=>'al seleccionar un archivo'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P18_ARCHIVO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7579132135079346)
,p_event_id=>wwv_flow_api.id(7579074791079345)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'agregarArchivo(this);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(92067652925987316)
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
'begin',
'    apex_session.attach( p_app_id     => v_app_id ',
'                       , p_page_id    => v_app_page_id',
'                       , p_session_id => v(''APP_SESSION'') );',
'    ',
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
'    delete from muerto;',
'    insert into muerto(archivo) values (v_file_blob);',
'    apex_collection.add_member( p_collection_name => ''SCANNER''',
'						      , p_c001 			  => v_file_name',
'			                  , p_c002            => v_file_mimetype',
'                              , p_blob001         => v_file_blob );',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''type'',''OK'');',
'    apex_json.write(''url'', apex_util.prepare_url( p_url => ''f?p='' || v_app_id || '':''|| v_app_page_id || '':''|| v(''APP_SESSION'') ||'':::::'', p_checksum_type => ''session''));',
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
