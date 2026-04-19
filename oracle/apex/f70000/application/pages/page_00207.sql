prompt --application/pages/page_00207
begin
wwv_flow_api.create_page(
 p_id=>207
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Reliquidaci\00F3n Predial - Registrar')
,p_step_title=>unistr('Reliquidaci\00F3n Predial - Registrar')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20210519093117'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(111235204389888406)
,p_plug_name=>'Reliquidar Predial - Registrar'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'GI_G_PREDIOS_LIQUIDA'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(111627971079053202)
,p_plug_name=>'Datos Sujeto'
,p_parent_plug_id=>wwv_flow_api.id(111235204389888406)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'P207_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(111262200599361401)
,p_plug_name=>'Flujo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'F_ID_INSTNCIA_FLJO'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(111627863204053201)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(111235204389888406)
,p_button_name=>'Btn_cnsultar_x_idntfccion'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(111239506394888421)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(111235204389888406)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Actualizar'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   id_prdio_lqda',
'from     gi_g_predios_liquida',
'where    id_prdio_lqda = :P207_ID_PRDIO_LQDA;'))
,p_button_condition_type=>'EXISTS'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(111238389344888416)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(111235204389888406)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:207:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(111239939472888421)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(111235204389888406)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   id_prdio_lqda',
'from     gi_g_predios_liquida',
'where    id_prdio_lqda = :P207_ID_PRDIO_LQDA;'))
,p_button_condition_type=>'NOT_EXISTS'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(111239113359888421)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(111235204389888406)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   id_prdio_lqda',
'from     gi_g_predios_liquida',
'where    id_prdio_lqda = :P207_ID_PRDIO_LQDA;'))
,p_button_condition_type=>'EXISTS'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(111628386133053206)
,p_branch_name=>unistr('Ir a p\00E1gina 207')
,p_branch_action=>'f?p=&APP_ID.:207:&SESSION.::&DEBUG.:RP:P207_RFRNCIA_IGAC,P207_ID_PRDIO_LQDA:&P207_RFRNCIA_IGAC.,&P207_ID_PRDIO_LQDA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108641027705347250)
,p_name=>'P207_ID_INSTNCIA_FLJO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(111235204389888406)
,p_item_source_plug_id=>wwv_flow_api.id(111235204389888406)
,p_item_default=>'F_ID_INSTNCIA_FLJO'
,p_item_default_type=>'ITEM'
,p_source=>'ID_INSTNCIA_FLJO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111235558732888407)
,p_name=>'P207_ID_PRDIO_LQDA'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(111235204389888406)
,p_item_source_plug_id=>wwv_flow_api.id(111235204389888406)
,p_source=>'ID_PRDIO_LQDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111235964696888410)
,p_name=>'P207_RFRNCIA_IGAC'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(111235204389888406)
,p_item_source_plug_id=>wwv_flow_api.id(111235204389888406)
,p_item_default=>'P207_RFRNCIA_IGAC'
,p_item_default_type=>'ITEM'
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_source=>'RFRNCIA_IGAC'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>25
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111236361276888412)
,p_name=>'P207_TRFA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(111235204389888406)
,p_item_source_plug_id=>wwv_flow_api.id(111235204389888406)
,p_prompt=>'Tarifa'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'TRFA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>5
,p_cMaxlength=>5
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');" onkeyup="formatNumber(event,{thousand:''.'',decimal:'','',precision:2});"'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'0'
,p_attribute_02=>'9999'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111255716245324001)
,p_name=>'P207_ID_FLJO_TREA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(111235204389888406)
,p_item_source_plug_id=>wwv_flow_api.id(111235204389888406)
,p_item_default=>'F_ID_FLJO_TREA'
,p_item_default_type=>'ITEM'
,p_source=>'ID_FLJO_TREA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111270456754614202)
,p_name=>'P207_ESTDO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(111235204389888406)
,p_item_source_plug_id=>wwv_flow_api.id(111235204389888406)
,p_item_default=>'RGS'
,p_source=>'ESTDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111628103859053204)
,p_name=>'P207_ID_SJTO_IMPSTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(111235204389888406)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111628217852053205)
,p_name=>'P207_RSPSTA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(111235204389888406)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134554988291271503)
,p_name=>'P207_CDGO_CLNTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(111235204389888406)
,p_item_source_plug_id=>wwv_flow_api.id(111235204389888406)
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134614973400841302)
,p_name=>'P207_ID_USRIO_RGSTRO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(111235204389888406)
,p_item_source_plug_id=>wwv_flow_api.id(111235204389888406)
,p_item_default=>'F_ID_USRIO'
,p_item_default_type=>'ITEM'
,p_source=>'ID_USRIO_RGSTRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(111291184243721701)
,p_validation_name=>unistr('Valida Identificaci\00F3n')
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto number;',
'begin',
'    select b.id_sjto_impsto',
'      into v_id_sjto_impsto',
'      from si_c_sujetos a',
'      join si_i_sujetos_impuesto b on a.id_sjto      = b.id_sjto',
'     where idntfccion     = :P207_RFRNCIA_IGAC;',
'',
'     return TRUE;',
'exception',
'     when no_data_found then',
'     return FALSE;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'La referencia no existe en el sistema'
,p_always_execute=>'Y'
,p_validation_condition_type=>'NEVER'
,p_associated_item=>wwv_flow_api.id(111235964696888410)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(111628403763053207)
,p_validation_name=>'Valida que no sea nulo'
,p_validation_sequence=>20
,p_validation=>'P207_TRFA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Ingrese la tarifa'
,p_when_button_pressed=>wwv_flow_api.id(111239939472888421)
,p_associated_item=>wwv_flow_api.id(111236361276888412)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(111353847951220901)
,p_name=>'Validar referencia'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P207_RFRNCIA_IGAC'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(111353932194220902)
,p_event_id=>wwv_flow_api.id(111353847951220901)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.submit();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(111628083999053203)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consutar sujeto por Item de Parametro'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto   varchar2(500);',
'    v_id_impsto        number;',
'begin',
'    ',
'    select id_impsto',
'    into   v_id_impsto',
'    from   df_c_impuestos',
'    where  cdgo_clnte = :F_CDGO_CLNTE',
'    AND    cdgo_impsto = ''IPU'';',
'    ',
'    select id_sjto_impsto',
'      into v_id_sjto_impsto',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte    = :F_CDGO_CLNTE',
'       and id_impsto    = v_id_impsto',
'       and (idntfccion_sjto = :P207_RFRNCIA_IGAC or idntfccion_antrior = :P207_RFRNCIA_IGAC );      ',
'    ',
'    :P207_RSPSTA := '''';',
'    :P207_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'exception',
'    when no_data_found then ',
'    :P207_ID_SJTO_IMPSTO := null;',
'    :P207_RSPSTA := ''No Existe el Sujeto Impuesto'';',
'end;'))
,p_process_error_message=>'&P207_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'&P207_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(111241183435888425)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(111235204389888406)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Create Form'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P207_ID_SJTO_IMPSTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(111628546255053208)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Limpiar items'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    :P207_ID_PRDIO_LQDA  := null;',
'    :P207_RFRNCIA_IGAC   := null;',
'    :P207_ID_SJTO_IMPSTO := null;',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(111239113359888421)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(111240789135888424)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(111235204389888406)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Create Form'
);
end;
/
