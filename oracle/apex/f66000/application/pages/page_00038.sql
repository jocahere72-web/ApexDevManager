prompt --application/pages/page_00038
begin
wwv_flow_api.create_page(
 p_id=>38
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>'Informe General de Industria y Comercio '
,p_step_title=>'Informe General de Industria y Comercio '
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
''))
,p_javascript_code_onload=>' ocultarAyudaD();'
,p_step_template=>wwv_flow_api.id(35710418378290397)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AHERNANDEZ'
,p_last_upd_yyyymmddhh24miss=>'20210127084902'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4508611319039901)
,p_plug_name=>'Parametros'
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
 p_id=>wwv_flow_api.id(4509921293039914)
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
'<br><br>',
'Funcionalidad que permite generar un Reporte General de Industria y Comercio.',
unistr('	<br><br>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4509782603039912)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(4508611319039901)
,p_button_name=>'btn_imprimir'
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
 p_id=>wwv_flow_api.id(4509824290039913)
,p_branch_name=>'Imprimir'
,p_branch_action=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.::P37_ID_RPRTE:&P38_ID_RPRTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4509782603039912)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4508942953039904)
,p_name=>'P38_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(4508611319039901)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and b.id_impsto = :P38_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'95%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4509150393039906)
,p_name=>'P38_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(4508611319039901)
,p_prompt=>'Sub Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P38_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P38_ID_IMPSTO'
,p_ajax_items_to_submit=>'P38_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'75%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4509213450039907)
,p_name=>'P38_TPO_RGMEN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(4508611319039901)
,p_prompt=>unistr('Tipo R\00E9gimen')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_sjto_tpo',
'     , a.id_sjto_tpo   ',
'from df_i_sujetos_tipo a',
'where a.cdgo_clnte = :F_CDGO_CLNTE ',
'  and a.id_impsto = :P38_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione'
,p_field_template=>wwv_flow_api.id(35793844568290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'79%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4509346379039908)
,p_name=>'P38_COD_SJTO_ESTDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(4508611319039901)
,p_prompt=>'Estado'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct dscrpcion_sjto_estdo  ',
'       ,cdgo_sjto_estdo',
'from v_si_i_sujetos_impuesto',
'where cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793844568290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'40%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4509429134039909)
,p_name=>'P38_JSON'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(4508611319039901)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4509605064039911)
,p_name=>'P38_ID_RPRTE'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(4508611319039901)
,p_prompt=>'Reporte'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rprte a',
'    , id_rprte     b ',
'from gn_d_reportes',
'where cdgo_rprte_grpo = ''IGT''',
' and actvo  = ''S'''))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4510226339039917)
,p_name=>'P38_FCHA_DSDE'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(4508611319039901)
,p_prompt=>'Fecha Desde'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4510300691039918)
,p_name=>'P38_FCHA_HSTA'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(4508611319039901)
,p_prompt=>'Fecha Hasta'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P38_FCHA_DSDE.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(4509031112039905)
,p_computation_sequence=>10
,p_computation_item=>'P38_ID_IMPSTO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_impsto',
'from df_c_impuestos',
'where cdgo_impsto = ''ICA''',
'and actvo = ''S'''))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4510044955039915)
,p_name=>'Al Seleccionar Reporte'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P38_ID_RPRTE'
,p_condition_element=>'P38_ID_RPRTE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4510111180039916)
,p_event_id=>wwv_flow_api.id(4510044955039915)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(4509782603039912)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4510447674039919)
,p_name=>'Al cambiar Fecha Inicio'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P38_FCHA_DSDE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4510584334039920)
,p_event_id=>wwv_flow_api.id(4510447674039919)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P38_FCHA_HSTA").datepicker( ''option'' , ''minDate'' , $("#P38_FCHA_DSDE").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4509513995039910)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar JSON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_nmbre_rprte    gn_d_reportes.nmbre_rprte%type;',
'    v_object         json_object_t := json_object_t();',
'    v_json           clob;',
'begin',
'',
'    --Buscamos El nombre del Reporte',
'     select nmbre_rprte',
'       into v_nmbre_rprte',
'       from gn_d_reportes ',
'      where id_rprte = :P38_ID_RPRTE;',
'      ',
unistr('    --A\00F1adimos datos al JSON  '),
'    v_object.put(''id_impsto'',        :P38_ID_IMPSTO);',
'    v_object.put(''id_impsto_sbmpsto'',:P38_ID_IMPSTO_SBMPSTO);',
'    v_object.put(''tpo_rgmen'',        :P38_TPO_RGMEN);',
'    v_object.put(''cdgo_sjto_estdo'',  :P38_COD_SJTO_ESTDO);',
'    v_object.put(''fcha_incial'',      :P38_FCHA_DSDE);',
'    v_object.put(''fcha_fnal'',        :P38_FCHA_HSTA);   ',
'    v_object.put(''nmbre_rprte'',      v_nmbre_rprte);',
'    ',
'    v_json := v_object.to_clob(); ',
'    :P14_JSON := v_json; ',
'    apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );',
'    APEX_UTIL.SET_SESSION_STATE(''P37_JSON'', v_json);',
'    ',
'exception',
'     when no_data_found then',
'          null;    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(4509782603039912)
);
end;
/
