prompt --application/pages/page_00164
begin
wwv_flow_api.create_page(
 p_id=>164
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Revisar atributos'
,p_step_title=>'Revisar atributos'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NCARRASQUILLA'
,p_last_upd_yyyymmddhh24miss=>'20201015101332'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(92954433702064503)
,p_plug_name=>'Tributos-SubTributos'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(92957266955064531)
,p_plug_name=>'Combo Mensaje'
,p_parent_plug_id=>wwv_flow_api.id(92954433702064503)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(94004434892670914)
,p_plug_name=>'ValidaFormato'
,p_parent_plug_id=>wwv_flow_api.id(92954433702064503)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92957330995064532)
,p_name=>'P164_ID_IMPUESTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(92957266955064531)
,p_prompt=>'Id Impuesto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92957460489064533)
,p_name=>'P164_MENSAJE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(92957266955064531)
,p_prompt=>'Mensaje'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94004597710670915)
,p_name=>'P164_VALOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(94004434892670914)
,p_prompt=>'Valor a revisar'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event,''numeroEntero'');" onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:2});"'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(92957508683064534)
,p_name=>'Al cambiar impuetso'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P164_ID_IMPUESTO'
,p_condition_element=>'P164_ID_IMPUESTO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92957848345064537)
,p_event_id=>wwv_flow_api.id(92957508683064534)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'   IF (:P164_ID_IMPUESTO = 16 ) THEN',
'       :P164_MENSAJE := ''ERROR'';',
'   ELSE',
'       :P164_MENSAJE := ''NUEVOS'';',
'   END IF;',
'END;',
''))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
end;
/
