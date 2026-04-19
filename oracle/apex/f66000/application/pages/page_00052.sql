prompt --application/pages/page_00052
begin
wwv_flow_api.create_page(
 p_id=>52
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>'Convenios por Usuario'
,p_step_title=>'Convenios por Usuario'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_step_template=>wwv_flow_api.id(35710418378290397)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20200704102729'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(149693915153644580)
,p_plug_name=>unistr('Par\00E1metros')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(225366350119509247)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<br>',
'Funcionalidad que permite generar un Reporte de convenios por usuarios.',
unistr('	<br><br>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(75371125383470868)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(149693915153644580)
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74324465568173746)
,p_name=>'P52_ID_USRIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(149693915153644580)
,p_prompt=>unistr('Usuario Aprobaci\00F3n:')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trcro as d',
'     , id_usrio    as r',
'  from v_sg_g_usuarios',
' where cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35793844568290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74324556552173747)
,p_name=>'P52_NMRO_CNVNIO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(149693915153644580)
,p_prompt=>'Numero de Convenio:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793844568290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74324612976173748)
,p_name=>'P52_STADO_CNVNIO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(149693915153644580)
,p_prompt=>'Estado de  Convenio:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select dscrpcion         as d',
'      , cdgo_cnvnio_estdo as r',
'   from gf_d_convenios_estado'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35793844568290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75371594433470874)
,p_name=>'P52_FCHA_INCIAL'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(149693915153644580)
,p_prompt=>'Fecha Registro Inicial:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" ondblclick="this.value=''''"'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75371998688470877)
,p_name=>'P52_DCHA_FNAL'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(149693915153644580)
,p_prompt=>'Fecha Registro Final:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" ondblclick="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P52_FCHA_INCIAL.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75372313575470877)
,p_name=>'P52_ID_RPRTE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(149693915153644580)
,p_prompt=>'Reporte'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_rprte as d',
'             , id_rprte    as r',
'          from gn_d_reportes ',
'          where cdgo_rprte_grpo = ''CPU'''))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'30%'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(75373080776470890)
,p_name=>'Al cambiar reporte'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P52_ID_RPRTE'
,p_condition_element=>'P52_ID_RPRTE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(75373543443470890)
,p_event_id=>wwv_flow_api.id(75373080776470890)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(75371125383470868)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(75374026142470898)
,p_event_id=>wwv_flow_api.id(75373080776470890)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(75371125383470868)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(75372715151470885)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar_JSON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_nmbre_rprte gn_d_reportes.nmbre_rprte%type;',
'    v_object json_object_t := json_object_t();  ',
'    v_json                 clob;  ',
'begin    ',
'    select nmbre_rprte',
'      into v_nmbre_rprte',
'      from gn_d_reportes',
'     where id_rprte = :P52_ID_RPRTE;',
'     ',
'',
'   v_object.put(''nmbre_rprte'', v_nmbre_rprte); ',
'   v_object.put(''fcha_i'', :P52_FCHA_INCIAL);',
'   v_object.put(''fcha_f'', :P52_DCHA_FNAL);',
'   v_object.put(''id_usrio'', :P52_ID_USRIO);',
'   v_object.put(''cdgo_cnvnio_estdo'', :P52_STADO_CNVNIO);',
'   v_object.put(''nmro_cnvnio'', :P52_NMRO_CNVNIO);',
'   ',
'   v_json := v_object.to_clob();  ',
'   ',
'   apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );  ',
'   apex_util.set_session_state(''P37_JSON'', v_json);      ',
'   apex_util.set_session_state(''P37_ID_RPRTE'', :P52_ID_RPRTE);      ',
' ',
'exception',
'    when no_data_found then',
'         null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
