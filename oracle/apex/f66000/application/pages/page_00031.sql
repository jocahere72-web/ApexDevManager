prompt --application/pages/page_00031
begin
wwv_flow_api.create_page(
 p_id=>31
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>'Reporte Procesos de Cobro  por Fechas'
,p_step_title=>'Reporte Procesos de Cobro  por Fechas'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
''))
,p_step_template=>wwv_flow_api.id(35710418378290397)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20210531161735'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(46166980724639601)
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
 p_id=>wwv_flow_api.id(46167085779639602)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'<br>',
'Funcionalidad que permite generar un Reporte de los procesos de cobro que han obtenido recaudos.',
unistr('	<br><br>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(46167463246639606)
,p_plug_name=>'Procesos'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P31_PRCOS_CRRDOS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(46169046523639622)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(46168520377639617)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(46167085779639602)
,p_button_name=>'Btn_Imprimir'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(46168193036639613)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(46166980724639601)
,p_button_name=>'Btn_Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(46168856686639620)
,p_branch_name=>'Imprimir'
,p_branch_action=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.:RP:P37_ID_RPRTE:&P31_ID_RPRTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(46168520377639617)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46167161040639603)
,p_name=>'P31_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(46166980724639601)
,p_prompt=>'Tributo:'
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
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46167211224639604)
,p_name=>'P31_FCHA_DSDE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(46166980724639601)
,p_prompt=>'Fecha Inicial:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>15
,p_tag_attributes=>' onkeydown="return false" '
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46167395724639605)
,p_name=>'P31_FCHA_FNAL'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(46166980724639601)
,p_prompt=>'Fecha Final'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>15
,p_tag_attributes=>' onkeydown="return false" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P31_FCHA_DSDE.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46167540931639607)
,p_name=>'P31_PRCSOS_ABRTOS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(46167463246639606)
,p_prompt=>'Procesos Abiertos:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46167681226639608)
,p_name=>'P31_RCDO_PRCOS_ABRTOS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(46167463246639606)
,p_prompt=>'Recaudos Procesos Abiertos'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46167745677639609)
,p_name=>'P31_PRCOS_CRRDOS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(46167463246639606)
,p_prompt=>'Procesos Cerrados'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46167875997639610)
,p_name=>'P31_RCDOS_PRCSOS_CRRDOS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(46167463246639606)
,p_prompt=>'Recaudos procesos Cerrados'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46167956717639611)
,p_name=>'P31_PRCSOS_RCDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(46167463246639606)
,p_prompt=>'Procesos con Pago'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46168030375639612)
,p_name=>'P31_RCDO_PRCSOS_RCDO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(46167463246639606)
,p_prompt=>'Total recaudado'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46168341995639615)
,p_name=>'P31_JSON'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(46167463246639606)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46168945279639621)
,p_name=>'P31_ID_RPRTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(46167085779639602)
,p_prompt=>'Reporte:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rprte d',
'     , id_rprte r',
'     from gn_d_reportes',
'    where id_rprte = 529'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(66685026181089813)
,p_name=>'P31_ID_RPRTE_PRMTRO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(46166980724639601)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(46168699594639618)
,p_name=>'Al cambiar fecha desde'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P31_FCHA_DSDE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(46168717190639619)
,p_event_id=>wwv_flow_api.id(46168699594639618)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P31_FCHA_FNAL'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P31_FCHA_FNAL").datepicker( ''option'' , ''minDate'' , $("#P31_FCHA_DSDE").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(46169248335639624)
,p_name=>'Al cambiar Reporte'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P31_ID_RPRTE'
,p_condition_element=>'P31_ID_RPRTE'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(46169358274639625)
,p_event_id=>wwv_flow_api.id(46169248335639624)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(46168520377639617)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(46169468176639626)
,p_event_id=>wwv_flow_api.id(46169248335639624)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(46168520377639617)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(46168287359639614)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Calcular Procesos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'         --Procesos abiertos total y cantidad 	  ',
'		select count(b.id_prcsos_jrdco),to_char(nvl(sum(b.mnto_rcdo),0),''FM$999G999G999G999G999G999G990'') into :P31_PRCSOS_ABRTOS,:P31_RCDO_PRCOS_ABRTOS',
'        from (',
'         select a.id_prcsos_jrdco,',
'                pkg_cb_proceso_juridico.fnc_mt_mnto_rcdo_prcso_jrdco(a.id_prcsos_jrdco,:P31_FCHA_DSDE,:P31_FCHA_FNAL,:P31_ID_IMPSTO,:F_CDGO_CLNTE) as mnto_rcdo',
'           from cb_g_procesos_juridico a',
'          where a.cdgo_prcsos_jrdco_estdo = ''A'') b',
'          where b.mnto_rcdo > 0;         ',
'          --Procesos Cerrados total y cantidad',
'        select count(b.id_prcsos_jrdco),to_char(nvl(sum(b.mnto_rcdo),0),''FM$999G999G999G999G999G999G990'') into :P31_PRCOS_CRRDOS,:P31_RCDOS_PRCSOS_CRRDOS',
'        from (',
'         select a.id_prcsos_jrdco,',
'                pkg_cb_proceso_juridico.fnc_mt_mnto_rcdo_prcso_jrdco(a.id_prcsos_jrdco,:P31_FCHA_DSDE,:P31_FCHA_FNAL,:P31_ID_IMPSTO,:F_CDGO_CLNTE) as mnto_rcdo',
'           from cb_g_procesos_juridico a',
'          where a.cdgo_prcsos_jrdco_estdo = ''C'') b',
'          where b.mnto_rcdo > 0;',
'          --Procesos con pago total y cantidad',
'        select count(b.id_prcsos_jrdco),to_char(nvl(sum(b.mnto_rcdo),0),''FM$999G999G999G999G999G999G990'') INTO :P31_PRCSOS_RCDO,:P31_RCDO_PRCSOS_RCDO',
'        from (',
'         select a.id_prcsos_jrdco,',
'                pkg_cb_proceso_juridico.fnc_mt_mnto_rcdo_prcso_jrdco(a.id_prcsos_jrdco,:P31_FCHA_DSDE,:P31_FCHA_FNAL,:P31_ID_IMPSTO,:F_CDGO_CLNTE) as mnto_rcdo',
'           from cb_g_procesos_juridico a',
'          where a.cdgo_prcsos_jrdco_estdo IN (''A'',''C'')) b',
'          where b.mnto_rcdo > 0;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(46168193036639613)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(46168490413639616)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar_JSON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
' v_nmbre_rprte gn_d_reportes.nmbre_rprte%type;',
' v_object json_object_t := json_object_t();',
' v_json                    clob;',
'begin          ',
'    ',
'   -- :P31_ID_RPRTE_PRMTRO := :F_APP_ID  || :F_ID_USRIO || :P9_ID_RPRTE || to_char( systimestamp , ''DDMMYYYYHHMISSFF3'' );',
' --buscar el nombre del reporte',
'   select nmbre_rprte ',
'     into v_nmbre_rprte',
'     from gn_d_reportes',
'    where id_rprte = :P31_ID_RPRTE;',
'    ',
'    ',
'    v_object.put(''id_impsto'',:P31_ID_IMPSTO);',
'    v_object.put(''fcha_dsde'',:P31_FCHA_DSDE);',
'    v_object.put(''fcha_fnal'',:P31_FCHA_FNAL);',
'    v_object.put(''cdgo_clnte'',:F_CDGO_CLNTE);',
'    v_object.put(''nmbre_rprte'',v_nmbre_rprte);',
'    v_json   := v_object.to_clob();        ',
'    apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );    ',
'    apex_util.set_session_state(''P37_JSON'', v_json);      ',
'    ',
'exception     ',
'    when no_data_found then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(46168520377639617)
);
end;
/
