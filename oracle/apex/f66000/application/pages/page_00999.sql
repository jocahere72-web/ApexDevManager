prompt --application/pages/page_00999
begin
wwv_flow_api.create_page(
 p_id=>999
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>'Reporte Deudores Morosos'
,p_step_title=>'Reporte Deudores Morosos'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JGONZALEZ'
,p_last_upd_yyyymmddhh24miss=>'20221202101510'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(138776725973604401)
,p_plug_name=>unistr('Par\00E1metros  de B\00FAsqueda ')
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
 p_id=>wwv_flow_api.id(138777664581604410)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(138776725973604401)
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
 p_id=>wwv_flow_api.id(138778452663604418)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(138776725973604401)
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
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(138778770482604421)
,p_branch_name=>'Imprimir'
,p_branch_action=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.:RP:P37_ID_RPRTE:&P999_ID_RPRTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(138777664581604410)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138776858136604402)
,p_name=>'P999_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(138776725973604401)
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
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138776958079604403)
,p_name=>'P999_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(138776725973604401)
,p_prompt=>'Sub-Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P999_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P999_ID_IMPSTO'
,p_ajax_items_to_submit=>'P999_ID_IMPSTO_SBMPSTO'
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
 p_id=>wwv_flow_api.id(138777015009604404)
,p_name=>'P999_VGNCIA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(138776725973604401)
,p_prompt=>'Vigencia'
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
,p_attribute_10=>'16%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138777144413604405)
,p_name=>'P999_JSON'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(138776725973604401)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138777201034604406)
,p_name=>'P999_ID_RPRTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(138776725973604401)
,p_prompt=>'Reporte'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_rprte d ,',
'       a.id_rprte    r',
'  from gn_d_reportes a',
'  join gn_d_reporte_cliente    b on a.id_rprte = b.id_rprte',
'                                and cdgo_clnte = 23001',
' where cdgo_rprte_grpo = ''ECI''',
'   and a.indcdor_gnrco = ''N''',
'   and b.actvo         = ''S''',
'   and a.id_rprte in (669)',
'union all   ',
'select a.nmbre_rprte d ,',
'       a.id_rprte    r',
'  from gn_d_reportes a',
' where a.cdgo_rprte_grpo = ''ECI''',
'   and a.indcdor_gnrco   = ''S''',
'   and a.actvo           = ''S''          ',
'   and a.id_rprte in (669)',
'   '))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(138777781432604411)
,p_name=>'Al seleccionar reporte'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P999_ID_RPRTE'
,p_condition_element=>'P999_ID_RPRTE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(138777828939604412)
,p_event_id=>wwv_flow_api.id(138777781432604411)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(138777664581604410)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(138778278505604416)
,p_event_id=>wwv_flow_api.id(138777781432604411)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(138777664581604410)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(138778616171604420)
,p_process_sequence=>10
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
'    --:P29_ID_RPRTE_PRMTRO := :F_APP_ID  || :F_ID_USRIO || :P9_ID_RPRTE || to_char( systimestamp , ''DDMMYYYYHHMISSFF3'' );',
'     --Busca el Nombre del Reporte',
'     select nmbre_rprte',
'       into v_nmbre_rprte',
'       from gn_d_reportes ',
'      where id_rprte = :P37_ID_RPRTE;',
'      ',
'    v_object.put(''cdgo_clnte'', :CDGO_CLNTE);',
'    v_object.put(''id_impsto'', :P999_ID_IMPSTO);',
'    v_object.put(''id_impsto_sbmpsto'',:P999_ID_IMPSTO_SBMPSTO);',
'    v_object.put(''vgncia'',:P999_VGNCIA);',
'    v_object.put(''nmbre_rprte'',v_nmbre_rprte);',
'    v_object.put(''sldottal'', :P999_sldottal);',
' ',
'    ',
'    v_json    := v_object.to_clob(); ',
'    :P999_JSON := v_json;',
'    apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );    ',
'    apex_util.set_session_state(''P37_JSON'', v_json);',
'        ',
'exception',
'     when no_data_found then',
'          null;',
'end;',
'',
'        '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
