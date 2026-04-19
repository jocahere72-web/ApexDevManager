prompt --application/pages/page_00020
begin
wwv_flow_api.create_page(
 p_id=>20
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>'Resoluciones por Cambio de Estrato'
,p_step_title=>'Resoluciones por Cambio de Estrato'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_step_template=>wwv_flow_api.id(35710418378290397)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20200401073539'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80527118425332994)
,p_plug_name=>unistr('Par\00E1metros ')
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
 p_id=>wwv_flow_api.id(80527204475332995)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<br><br>',
'Funcionalidad que permite generar un Reporte con las resoluciones de cambio de estrato de un predio.',
unistr('	<br><br>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(40761951811467979)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(80527118425332994)
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
 p_id=>wwv_flow_api.id(40768623432468041)
,p_branch_name=>'Imprimir'
,p_branch_action=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.:RP:P37_ID_RPRTE:&P20_ID_RPRTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(40761951811467979)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40762340767467996)
,p_name=>'P20_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(80527118425332994)
,p_prompt=>'Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'  and b.cdgo_sjto_tpo =''P''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40762734538468001)
,p_name=>'P20_ID_IMPSTP_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(80527118425332994)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P20_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P20_ID_IMPSTO'
,p_ajax_items_to_submit=>'P20_ID_IMPSTP_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40763140501468001)
,p_name=>'P20_NMRO_DCMNTO_SPRTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(80527118425332994)
,p_prompt=>unistr('No Resoluci\00F3n:')
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>' onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_field_template=>wwv_flow_api.id(35793844568290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40763548009468002)
,p_name=>'P20_NMBRE_TRCRO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(80527118425332994)
,p_prompt=>'Usuario:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trcro',
'     , id_usrio',
'from   v_sg_g_usuarios',
'where cdgo_clnte = :F_CDGO_CLNTE '))
,p_lov_display_null=>'YES'
,p_tag_attributes=>' onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793844568290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40763995299468002)
,p_name=>'P20_FCHA_INCIO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(80527118425332994)
,p_prompt=>'Fecha Inicial:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40764309108468002)
,p_name=>'P20_FCHA_FNAL'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(80527118425332994)
,p_prompt=>'Fecha Final:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P20_FCHA_INCIO.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40764713580468002)
,p_name=>'P20_JSON'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(80527118425332994)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40765189938468003)
,p_name=>'P20_ID_RPRTE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(80527118425332994)
,p_prompt=>'Reporte'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rprte d ',
'     , id_rprte r   ',
'  from gn_d_reportes',
' where cdgo_rprte_grpo = ''NVP''',
'   and id_rprte=522'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'30%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(66684739490089810)
,p_name=>'P20_ID_RPRTE_PRMTRO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(80527118425332994)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(40766264114468013)
,p_name=>'Al cambiar fecha inicio'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P20_FCHA_INCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40766713855468028)
,p_event_id=>wwv_flow_api.id(40766264114468013)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P20_FCHA_FNAL").datepicker( ''option'' , ''minDate'' , $("#P20_FCHA_INCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(40767170470468031)
,p_name=>'Nuevo'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P20_ID_RPRTE'
,p_condition_element=>'P20_ID_RPRTE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40767656313468035)
,p_event_id=>wwv_flow_api.id(40767170470468031)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(40761951811467979)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40768122927468038)
,p_event_id=>wwv_flow_api.id(40767170470468031)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(40761951811467979)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40765878976468007)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar JSON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_nmbre_rprte gn_d_reportes.nmbre_rprte%type;',
'    v_object json_object_t := json_object_t();',
'    v_json                    clob;',
'begin          ',
'    ',
'    --:P20_ID_RPRTE_PRMTRO := :F_APP_ID  || :F_ID_USRIO || :P9_ID_RPRTE || to_char( systimestamp , ''DDMMYYYYHHMISSFF3'' );',
'    ',
'     --Busca el Nombre del Reporte',
'     select nmbre_rprte',
'       into v_nmbre_rprte',
'       from gn_d_reportes ',
'      where id_rprte = :P20_ID_RPRTE;',
'  ',
'    v_object.put(''id_impsto'', :P20_ID_IMPSTO);',
'    v_object.put(''id_impsto_sbmpsto'', :P20_ID_IMPSTP_SBMPSTO);',
'    v_object.put(''nmro_dcmnto'', :P20_NMRO_DCMNTO_SPRTE);',
'    v_object.put(''fcha_incio'',:P20_FCHA_INCIO);',
'    v_object.put(''fcha_fnal'',:P20_FCHA_FNAL); ',
'    v_object.put(''nmbre'',:P20_NMBRE_TRCRO); ',
'    v_object.put(''v_nmbre_rprte'',v_nmbre_rprte); ',
'    v_json   := v_object.to_clob();    ',
'    ',
'    apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );    ',
'    apex_util.set_session_state(''P37_JSON'', v_json); ',
'    ',
'exception',
'     when no_data_found then',
'          null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(40761951811467979)
);
end;
/
