prompt --application/pages/page_00058
begin
wwv_flow_api.create_page(
 p_id=>58
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>unistr('Estado de Cartera de Plusval\00EDa')
,p_step_title=>unistr('Estado de Cartera de Plusval\00EDa')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_step_template=>wwv_flow_api.id(35710418378290397)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NCARRASQUILLA'
,p_last_upd_yyyymmddhh24miss=>'20200924170331'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(179434606597744139)
,p_plug_name=>unistr('Par\00E1metros  de B\00FAsqueda ')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(179435069874744144)
,p_plug_name=>unistr('Informaci\00F3n ')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P58_ID_SJTO_IMPSTO'
,p_attribute_01=>'P58_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(179437124058744164)
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
'Funcionalidad que permite generar un Reporte del estado de cuenta de un contribuyente.',
unistr('	<br><br>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(92626191797177513)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(179434606597744139)
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(92625752925177498)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(179434606597744139)
,p_button_name=>'Btn_Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(92626404466177513)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(179434606597744139)
,p_button_name=>'Btn_Consultar_prm'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_image_alt=>unistr('Consultar Par\00E1metros ')
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(92636073627177616)
,p_branch_name=>'Imprimir'
,p_branch_action=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.:RP:P37_ID_RPRTE:&P58_ID_RPRTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(92626191797177513)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(92636459839177622)
,p_branch_name=>unistr('Ir a P\00E1gina 3')
,p_branch_action=>'f?p=71000:3:&SESSION.::&DEBUG.:RP:P3_NMRO_APP	,P3_NMRO_PGNA,P3_NMBRE_ITEM,P3_ID_IMPSTO,P3_NMBRE_ITEM_IMPSTO,P3_NMBRE_ITEM_SBIMPSTO	,P3_IMPSTO_SBMPSTO:&APP_ID.,&APP_PAGE_ID.,P58_ID_SJTO_IMPSTO,&P58_ID_IMPSTO.,P58_ID_IMPSTO,P58_ID_IMPSTO_SBMPSTO,&P58_ID_IMPSTO_SBMPSTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(92626404466177513)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92626826820177516)
,p_name=>'P58_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(179434606597744139)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92627238721177526)
,p_name=>'P58_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(179434606597744139)
,p_prompt=>'Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_impsto  d',
'     , a.id_impsto r ',
'  from df_c_impuestos     a ',
' where a.cdgo_clnte       = :F_CDGO_CLNTE',
'   and a.cdgo_impsto = ''PLU'';'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92627628754177527)
,p_name=>'P58_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(179434606597744139)
,p_prompt=>'Sub-Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P58_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P58_ID_IMPSTO'
,p_ajax_items_to_submit=>'P58_ID_IMPSTO_SBMPSTO'
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
 p_id=>wwv_flow_api.id(92628039461177527)
,p_name=>'P58_IDNTIFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(179434606597744139)
,p_prompt=>unistr('Identificaci\00F3n:')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(35793844568290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92628466134177534)
,p_name=>'P58_RSPSTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(179434606597744139)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92628803454177534)
,p_name=>'P58_VGNCIA_DSD'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(179434606597744139)
,p_prompt=>'Vigencia Desde:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select vgncia d',
'     , vgncia r',
'  from df_s_vigencias'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92629281137177534)
,p_name=>'P58_VGNCIA_HSTA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(179434606597744139)
,p_prompt=>'Vigencia Hasta:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select vgncia d',
'     , vgncia r',
'  from df_s_vigencias'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92629623952177534)
,p_name=>'P58_JSON'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(179434606597744139)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92630006160177535)
,p_name=>'P58_ID_RPRTE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(179434606597744139)
,p_prompt=>'Reporte'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rprte d ',
'     , id_rprte r   ',
'  from gn_d_reportes',
' where cdgo_rprte_grpo = ''PLU''',
'   and id_rprte=588'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92630479041177536)
,p_name=>'P58_ID_RPRTE_PRMTRO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(179434606597744139)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(92631564550177559)
,p_validation_name=>'sujeto impuesto no nulo'
,p_validation_sequence=>10
,p_validation=>'P58_ID_SJTO_IMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Primero debe realizar una consulta por par\00E1metros o por identificaci\00F3n.')
,p_when_button_pressed=>wwv_flow_api.id(92626191797177513)
,p_associated_item=>wwv_flow_api.id(92626826820177516)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(92631999547177576)
,p_validation_name=>'Fecha hasta mayor que fecha desde '
,p_validation_sequence=>20
,p_validation=>'(:P58_VGNCIA_DSD <= :P58_VGNCIA_HSTA)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'La vigencia hasta debe ser mayor que la vigencia desde.'
,p_associated_item=>wwv_flow_api.id(92629281137177534)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(92632378558177576)
,p_validation_name=>'Identificacion no vacia'
,p_validation_sequence=>30
,p_validation=>'P58_IDNTIFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Primero debe introducir una Identificaci\00F3n.')
,p_when_button_pressed=>wwv_flow_api.id(92625752925177498)
,p_associated_item=>wwv_flow_api.id(92628039461177527)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(92632799275177577)
,p_validation_name=>'Vigncia_dsd no null'
,p_validation_sequence=>40
,p_validation=>'P58_VGNCIA_DSD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar La Vigencia Desde.'
,p_when_button_pressed=>wwv_flow_api.id(92626191797177513)
,p_associated_item=>wwv_flow_api.id(92628803454177534)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(92633109210177577)
,p_validation_name=>'Vgncia_hsta no null'
,p_validation_sequence=>50
,p_validation=>'P58_VGNCIA_HSTA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar la Vigencia Hasta.'
,p_when_button_pressed=>wwv_flow_api.id(92626191797177513)
,p_associated_item=>wwv_flow_api.id(92629281137177534)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(92634677875177604)
,p_name=>'Al seleccionar reporte'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P58_ID_RPRTE'
,p_condition_element=>'P58_ID_RPRTE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92635162646177608)
,p_event_id=>wwv_flow_api.id(92634677875177604)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(92626191797177513)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92635668970177615)
,p_event_id=>wwv_flow_api.id(92634677875177604)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(92626191797177513)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(92634247071177590)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Impesto,Sb_impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    select a.idntfccion_sjto,',
'    id_impsto,',
'    ( select min( b.id_impsto_sbmpsto) from df_i_impuestos_subimpuesto b where b.id_impsto = a.id_impsto ) as id_impsto_sbmpsto',
'    into  :P58_IDNTIFCCION,',
'          :P58_ID_IMPSTO,',
'          :P58_ID_IMPSTO_SBMPSTO',
'    from v_si_i_sujetos_impuesto a',
'     where a.cdgo_clnte      = :F_CDGO_CLNTE',
'       and a.id_sjto_impsto  = :P58_ID_SJTO_IMPSTO;',
'',
'exception ',
'    when no_data_found then ',
'        apex_util.set_session_state(''P58_IDNTIFCCION'',  '''');',
'end;',
'',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(92633426137177577)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Por identificaci\00F3n ')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto   varchar2(500);',
'    v_vlor_sldo_cptal  number;',
'begin',
'   ',
'    select id_sjto_impsto',
'      into v_id_sjto_impsto',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte        = :F_CDGO_CLNTE',
'       and id_impsto         = :P58_ID_IMPSTO',
'       and idntfccion_sjto   = :P58_IDNTIFCCION;',
'',
'    :P58_RSPSTA := '''';',
'    :P58_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'',
'    exception when no_data_found then ',
'          :P58_ID_SJTO_IMPSTO := null;',
unistr('          :P58_RSPSTA := ''No se encontr\00F3 el Sujeto Tributo.'';'),
'end;   '))
,p_process_error_message=>'&P58_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(92625752925177498)
,p_process_success_message=>'&P58_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(92633880668177590)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar JSON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_nmbre_rprte gn_d_reportes.nmbre_rprte%type;',
'    v_object json_object_t := json_object_t();',
'    v_json                 clob;   ',
'begin',
'    ',
'    --:P58_ID_RPRTE_PRMTRO := :F_APP_ID  || :F_ID_USRIO || :P58_ID_RPRTE || to_char( systimestamp , ''DDMMYYYYHHMISSFF3'' );',
'     --Busca el Nombre del Reporte',
'     select nmbre_rprte',
'       into v_nmbre_rprte',
'       from gn_d_reportes ',
'      where id_rprte = :P58_ID_RPRTE;',
'  ',
'    v_object.put(''id_impsto'', :P58_ID_IMPSTO);',
'    v_object.put(''id_impsto_sbmpsto'',:P58_ID_IMPSTO_SBMPSTO);',
'    v_object.put(''id_sjto_impsto'', :P58_ID_SJTO_IMPSTO);',
'    v_object.put(''vgncia_dsd'',:P58_VGNCIA_DSD);',
'    v_object.put(''vgncia_hsta'',:P58_VGNCIA_HSTA);',
'    v_object.put(''nmbre_rprte'',v_nmbre_rprte);',
'    ',
'    v_json    := v_object.to_clob();  ',
'    apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );    ',
'    apex_util.set_session_state(''P37_JSON'', v_json);      ',
'    ',
'exception',
'     when no_data_found then',
'          null;',
'end;',
'',
'',
'        ',
'        ',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(92626191797177513)
);
end;
/
