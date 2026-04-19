prompt --application/pages/page_00007
begin
wwv_flow_api.create_page(
 p_id=>7
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>'Reporte de Acuerdos de Pago'
,p_step_title=>'Reporte de Acuerdos de Pago'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buttonCollapse(id){',
'if($(''#''+id).attr(''aria-expanded'') == ''true''){',
'$(''#''+id).click();',
'}',
'}'))
,p_javascript_code_onload=>'buttonCollapse(''t_Button_rightControlButton'');'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-GV-table th.a-GV-header, .a-GV-table th.a-GV-headerGroup {',
'    font-weight: 700;',
'    BACKGROUND: #e4e4e4;',
'}'))
,p_step_template=>wwv_flow_api.id(35710418378290397)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'HMARTINEZ'
,p_last_upd_yyyymmddhh24miss=>'20230929155034'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4012249680177901)
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
 p_id=>wwv_flow_api.id(55272701198516849)
,p_plug_name=>'Ayuda '
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
unistr('Esta funcionalidad permite filtrar los ajustes por impuesto, subimpuesto, identificaci\00F3n,estado,'),
'tipo de ajuste, usuario, valor y fechas dando clic en el boton consultar.',
'',
'Ademas permite imprimir el reporte de la consulta realizada escogiendo el tipo de reporte y dando clic en el boton imprimir.',
unistr('<br><br>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4013041959177909)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(4012249680177901)
,p_button_name=>'Imprimir'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padLeft:t-Button--padRight'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4013648231177915)
,p_branch_name=>'Imprimir'
,p_branch_action=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.:RP:P37_ID_RPRTE:&P7_RPRTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4013041959177909)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4012334030177902)
,p_name=>'P7_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(4012249680177901)
,p_prompt=>'<b>Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'60%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4012405683177903)
,p_name=>'P7_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>31
,p_item_plug_id=>wwv_flow_api.id(4012249680177901)
,p_prompt=>'<b>Sub-Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P7_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P7_ID_IMPSTO'
,p_ajax_items_to_submit=>'P7_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'60%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4012525263177904)
,p_name=>'P7_IDNTFCCION'
,p_item_sequence=>32
,p_item_plug_id=>wwv_flow_api.id(4012249680177901)
,p_prompt=>unistr('<b>Identificaci\00F3n</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4012687656177905)
,p_name=>'P7_FCHA_DSDE'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(4012249680177901)
,p_prompt=>'<b>Fecha Desde</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>' onkeydown="return false" '
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4012727484177906)
,p_name=>'P7_FCHA_HSTA'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(4012249680177901)
,p_prompt=>'<b>Fecha Hasta</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>' onkeydown="return false" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P7_FCHA_DSDE.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4012811973177907)
,p_name=>'P7_ESTDO'
,p_item_sequence=>33
,p_item_plug_id=>wwv_flow_api.id(4012249680177901)
,p_prompt=>'<b>Estado</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_cnvnio_estdo as r',
'  from gf_d_convenios_estado',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4012919317177908)
,p_name=>'P7_RPRTE'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(4012249680177901)
,p_prompt=>'<b>Reporte</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rprte d ,',
'       id_rprte r',
'        from gn_d_reportes',
' where cdgo_rprte_grpo = ''APG''',
'   and id_rprte not in (538, 671, 670, 664, 660, 654, 614);'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46169681488639628)
,p_name=>'P7_XML'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(4012249680177901)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(66685228864089815)
,p_name=>'P7_ID_RPRTE_PRMTRO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(4012249680177901)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4013199863177910)
,p_name=>'Al Cambiar Fecha inicio'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_FCHA_DSDE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4013289582177911)
,p_event_id=>wwv_flow_api.id(4013199863177910)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P7_FCHA_HSTA").datepicker( ''option'' , ''minDate'' , $("#P7_FCHA_DSDE").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4013377194177912)
,p_name=>'Activar Imprimir'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_RPRTE'
,p_condition_element=>'P7_RPRTE'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P7_RPRTE'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4013482604177913)
,p_event_id=>wwv_flow_api.id(4013377194177912)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(4013041959177909)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4013553331177914)
,p_event_id=>wwv_flow_api.id(4013377194177912)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(4013041959177909)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(66685188108089814)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar_JSON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_nmbre_rprte             gn_d_reportes.nmbre_rprte%type;',
'     v_object json_object_t := json_object_t(); ',
'     --v_id_rprte_prmtro         gn_t_reportes_parametro.id_rprte_prmtro%type;',
'     v_json                    clob;',
'begin          ',
'    ',
'    --:P7_ID_RPRTE_PRMTRO := :F_APP_ID  || :F_ID_USRIO || :P7_RPRTE || to_char( systimestamp , ''DDMMYYYYHHMISSFF3'' );',
'     ',
'     --Busca el Nombre del Reporte',
'     select nmbre_rprte',
'       into v_nmbre_rprte',
'       from gn_d_reportes ',
'      where id_rprte = :P7_RPRTE;',
'',
'    v_object.put(''fcha_incial''       ,:P7_FCHA_DSDE); ',
'    v_object.put(''fcha_fnal''         ,:P7_FCHA_HSTA);',
'    v_object.put(''id_impsto''         ,:P7_ID_IMPSTO);',
'    v_object.put(''id_impsto_sbmpsto'' ,:P7_ID_IMPSTO_SBMPSTO);',
'    v_object.put(''idntfccion''        ,:P7_IDNTFCCION);',
'    v_object.put(''stdo''              ,:P7_ESTDO);',
'    v_object.put(''nmbre_rprte''       ,v_nmbre_rprte);',
'    v_json   := v_object.to_clob();        ',
'         ',
'    apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );    ',
'    apex_util.set_session_state(''P37_JSON'', v_json);',
'    ',
'	exception',
'		 when no_data_found then',
'			  null;',
'	end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(4013041959177909)
);
end;
/
