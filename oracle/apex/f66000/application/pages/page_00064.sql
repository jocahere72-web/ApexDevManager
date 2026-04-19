prompt --application/pages/page_00064
begin
wwv_flow_api.create_page(
 p_id=>64
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>unistr('Estad\00EDsticas de PQR por Funcionarios')
,p_step_title=>unistr('Estad\00EDsticas de PQR por Funcionarios')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_step_template=>wwv_flow_api.id(35710418378290397)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JVARGAS'
,p_last_upd_yyyymmddhh24miss=>'20240117151231'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(146671837837626617)
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
 p_id=>wwv_flow_api.id(146671942244626618)
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
'Funcionalidad que permite generar un reporte de estadisticas de PQR por funcionarios.',
unistr('	<br><br>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(106091308232651854)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(146671837837626617)
,p_button_name=>'Btn_Imprimir'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(106096222681651927)
,p_branch_name=>'Imprimir'
,p_branch_action=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.:RP:P37_ID_RPRTE:&P64_ID_RPRTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(106091308232651854)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106091776763651868)
,p_name=>'P64_FCHA_INCIAL'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(146671837837626617)
,p_prompt=>'Fecha Inicial: '
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" '
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106092058692651891)
,p_name=>'P64_FCHA_FNAL'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(146671837837626617)
,p_prompt=>'Fecha Final: '
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106092493887651891)
,p_name=>'P64_ID_USURIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(146671837837626617)
,p_prompt=>'Usuario: '
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trcro as d',
'     , id_usrio    as v',
'  from v_sg_g_usuarios',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_fncnrio is not null',
'   and nmbre_crgo not in (''NOTARIO'')',
'  -- and actvo = ''S''',
' order by nmbre_trcro'))
,p_lov_display_null=>'YES'
,p_tag_attributes=>' onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_field_template=>wwv_flow_api.id(35793844568290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'24%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106092832122651892)
,p_name=>'P64_JSON'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(146671837837626617)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106093241583651894)
,p_name=>'P64_ID_RPRTE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(146671837837626617)
,p_prompt=>'Reporte:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rprte d ',
'     , id_rprte r   ',
'  from gn_d_reportes',
' where cdgo_rprte_grpo = ''PQE''',
''))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(106094758468651922)
,p_name=>'Al cambiar Reporte'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P64_ID_RPRTE'
,p_condition_element=>'P64_ID_RPRTE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(106095259604651926)
,p_event_id=>wwv_flow_api.id(106094758468651922)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(106091308232651854)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(106095752648651927)
,p_event_id=>wwv_flow_api.id(106094758468651922)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(106091308232651854)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(106094348221651917)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar JSON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  declare',
'     v_nmbre_rprte          gn_d_reportes.nmbre_rprte%type;',
'     v_nmbre_trcro          si_c_terceros.prmer_nmbre%type;',
'     v_object json_object_t := json_object_t();',
'     v_json                 clob;   ',
'begin',
'     --Busca el Nombre del Reporte',
'     select nmbre_rprte',
'       into v_nmbre_rprte',
'       from gn_d_reportes ',
'      where id_rprte = :P64_ID_RPRTE;',
'    ',
'    begin      ',
'       select t.prmer_nmbre || '' '' || t.prmer_aplldo nombre ',
'         into v_nmbre_trcro',
'         from sg_g_usuarios u',
'         join si_c_terceros t',
'           on t.id_trcro = u.id_trcro',
'        where u.id_usrio = :P64_ID_USURIO;   ',
'    exception',
'        when others then ',
'            null;',
'    end;',
'    ',
'   v_object.put(''id_usrio'', :P64_ID_USURIO);',
'   v_object.put(''fcha_incial'', :P64_FCHA_INCIAL);',
'   v_object.put(''fcha_fnal'', :P64_FCHA_FNAL);   ',
'   v_object.put(''nmbre_rprte'',v_nmbre_rprte); ',
'  ',
'   v_json    := v_object.to_clob();  ',
'   :P64_JSON := v_json;',
'   apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );    ',
'   apex_util.set_session_state(''P37_NMBRE_RPRTE'', v_nmbre_rprte||''_''||v_nmbre_trcro);',
'   apex_util.set_session_state(''P37_JSON'', v_json);        ',
'   ',
'  ',
'exception',
'     when no_data_found then',
'          null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(106091308232651854)
);
end;
/
