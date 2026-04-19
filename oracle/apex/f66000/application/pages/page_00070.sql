prompt --application/pages/page_00070
begin
wwv_flow_api.create_page(
 p_id=>70
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>'Recaudos Conciliados'
,p_step_title=>'Recaudos Conciliados'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Form-label{',
'  font-weight: 700;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20210629092230'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(162703691249025942)
,p_plug_name=>'Reportes'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(64818561353884165)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(162703691249025942)
,p_button_name=>'Btn_Imprimir'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(64823981296884197)
,p_branch_name=>'Imprimir_JSON'
,p_branch_action=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.:RP:P37_ID_RPRTE:&P70_ID_RPRTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(64818561353884165)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(64818911919884170)
,p_name=>'P70_FCHA_INCIO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(162703691249025942)
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha Inicio'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(64819305189884175)
,p_name=>'P70_FCHA_FIN'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(162703691249025942)
,p_prompt=>'Fecha Fin'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P70_FCHA_INCIO.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(64820974443884177)
,p_name=>'P70_ID_RPRTE'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(162703691249025942)
,p_prompt=>'Reporte'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rprte d ',
'     , id_rprte r   ',
'  from gn_d_reportes',
' where cdgo_rprte_grpo = ''REC'''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Reporte'
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(64821353589884178)
,p_name=>'P70_JSON'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(162703691249025942)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(64821778199884178)
,p_name=>'P70_ID_RPRTE_PRMTRO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(162703691249025942)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(64822944589884193)
,p_name=>'Al Cambiar Fecha Inicio'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P70_FCHA_INCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(64823419327884195)
,p_event_id=>wwv_flow_api.id(64822944589884193)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P70_FCHA_FIN").datepicker( ''option'' , ''minDate'' , $("#P70_FCHA_INCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(64822570971884192)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar JSON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_nmbre_rprte             gn_d_reportes.nmbre_rprte%type;',
'     v_object json_object_t := json_object_t(); ',
'     v_json                    clob;',
'begin          ',
'     --Busca el Nombre del Reporte',
'     select nmbre_rprte',
'       into v_nmbre_rprte',
'       from gn_d_reportes ',
'      where id_rprte = :P70_ID_RPRTE;',
'      ',
unistr('    --A\00F1adimos datos al JSON '),
'    v_object.put(''fcha_incial'', :P70_FCHA_INCIO);',
'    v_object.put(''fcha_fnal'', :P70_FCHA_FIN);   ',
'    v_object.put(''nmbre_rprte'', v_nmbre_rprte);',
'    ',
'    v_json := v_object.to_clob();',
'    --seteamos el JSON en la pagina de impresion',
'    apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );    ',
'    apex_util.set_session_state(''P37_JSON'', v_json);   ',
'         ',
'exception',
'     when no_data_found then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(64818561353884165)
);
end;
/
