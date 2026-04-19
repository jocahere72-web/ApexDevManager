prompt --application/pages/page_00069
begin
wwv_flow_api.create_page(
 p_id=>69
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>'Documentos Generados por Usuario'
,p_step_title=>'Documentos Generados por Usuario'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Form-label{',
'  font-weight: 700;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20210531164331'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(254953830577931691)
,p_plug_name=>unistr('Par\00E1metros ')
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
 p_id=>wwv_flow_api.id(97624554792271473)
,p_plug_name=>'Usuario'
,p_parent_plug_id=>wwv_flow_api.id(254953830577931691)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(35889529047293441)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(60529734382123702)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(254953830577931691)
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49245731193622712)
,p_name=>'P69_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(254953830577931691)
,p_prompt=>'Tributo'
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
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(60530120864123705)
,p_name=>'P69_FCHA_IN'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(254953830577931691)
,p_prompt=>'Fecha Desde'
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
 p_id=>wwv_flow_api.id(60530508021123706)
,p_name=>'P69_FCHA_FIN'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(254953830577931691)
,p_prompt=>'Fecha Hasta'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P69_FCHA_IN.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(60530964385123707)
,p_name=>'P69_ID_RPRTE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(254953830577931691)
,p_prompt=>'Reporte'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rprte as d',
'     , id_rprte    as r',
'  from gn_d_reportes   ',
' where cdgo_rprte_grpo = ''DGU'''))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'20%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(60531328387123707)
,p_name=>'P69_JSON'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(254953830577931691)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(60532022175123709)
,p_name=>'P69_ID_USRIO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(97624554792271473)
,p_prompt=>'Usuario'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''[''||idntfccion||''] - ''||prmer_nmbre ||'' ''|| sgndo_nmbre||'' ''||prmer_aplldo||'' ''||sgndo_aplldo as d',
'     , idntfccion as v',
'  from si_c_terceros',
' where cdgo_clnte     = :F_CDGO_CLNTE',
'   and indcdr_fncnrio = ''S'' '))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35793844568290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(60532413752123713)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar_JSON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_nmbre_rprte gn_d_reportes.nmbre_rprte%type;',
'     v_object json_object_t := json_object_t();  ',
'     v_nmbre_trcro          varchar2(100)  ;',
'     v_json                 clob;   ',
'begin    ',
'    /* select nmbre_rprte||''_''||to_char(SYSDATE,''YYYYMMDD'')',
'       into v_nmbre_rprte',
'       from gn_d_reportes ',
'      where id_rprte = :P69_ID_RPRTE;*/',
'   ',
'    select prmer_nmbre ||'' ''|| sgndo_nmbre||'' ''||prmer_aplldo||'' ''||sgndo_aplldo',
'      into v_nmbre_trcro',
'      from si_c_terceros',
'     where idntfccion     = :P69_ID_USRIO',
'       and indcdr_fncnrio = ''S'';',
' ',
'    v_object.put(''nmbre_rprte'',v_nmbre_rprte);',
'    v_object.put(''fcha_in'',:P69_FCHA_IN);',
'    v_object.put(''fcha_fin'',:P69_FCHA_FIN);',
'    v_object.put(''id_usrio'',:P69_ID_USRIO);',
'    v_object.put(''id_impsto'',:P69_ID_IMPSTO);',
'    v_object.put(''nmbre_trcro'',v_nmbre_trcro);',
'    ',
'    v_nmbre_rprte := ''DOCUMENTOS_''||v_nmbre_trcro||''_''||to_char(SYSDATE,''YYYYMMDD'');',
'    ',
'',
'    v_json   := v_object.to_clob();  ',
'',
'    :P69_JSON := v_json;',
'',
'    apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );   ',
'    apex_util.set_session_state(''P37_NMBRE_RPRTE'', v_nmbre_rprte);',
'    apex_util.set_session_state(''P37_JSON'', v_json);',
'    apex_util.set_session_state(''P37_ID_RPRTE'', :P69_ID_RPRTE);',
'   ',
'exception',
'     when no_data_found then',
'          null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
