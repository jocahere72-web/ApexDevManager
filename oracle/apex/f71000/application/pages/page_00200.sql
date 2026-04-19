prompt --application/pages/page_00200
begin
wwv_flow_api.create_page(
 p_id=>200
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Recaudo por Banco'
,p_step_title=>'Recaudo por Banco'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IG-controls {',
'    display: NONE;',
'    vertical-align: top;',
'    margin: 0;',
'    padding: 0;',
'    list-style: none;',
'}',
'',
'.a-IG-controlsContainer {',
'    padding: 8px;',
'    border-bottom: 1px solid #E0E0E0;',
'    overflow: hidden;',
'    DISPLAY: NONE;',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NARDILA'
,p_last_upd_yyyymmddhh24miss=>'20190329210633'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(36577812086045106)
,p_plug_name=>'Parametros'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(37361544403980938)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(36577812086045106)
,p_button_name=>'IMPRIMIR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padLeft:t-Button--padRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(37361669016980939)
,p_branch_name=>'Go To Page 2'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_XML:&P200_RPRTE.,<fechaI>&P200_FECHA_DESDE.</fechaI><fechaF>&P200_FECHA_HASTA.</fechaF><funcion>pkg_cb_proceso_juridico.prc_ac_acto(p_file_blob => Â¡file_blob !p_id_acto => 1)</funcion> &success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(37361544403980938)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(36577674566045104)
,p_name=>'P200_FECHA_DESDE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(36577812086045106)
,p_prompt=>'<b>Fecha Desde</b>'
,p_format_mask=>'DD-MON-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(36577712932045105)
,p_name=>'P200_FECHA_HASTA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(36577812086045106)
,p_prompt=>'<b>Fecha Hasta</b>'
,p_format_mask=>'DD-MON-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(37361468760980937)
,p_name=>'P200_RPRTE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(36577812086045106)
,p_prompt=>'Reporte'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rprte d ,',
'       id_rprte r',
'        from gn_d_reportes',
' where cdgo_rprte_grpo = ''RV1'''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(38189143782934642)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Creaci\00F3n Par\00E1metros')
,p_process_sql_clob=>':P200_XML := ''fechaI:''|| :P200_FECHA_DESDE || ''#fechaF:''|| :P200_FECHA_HASTA;'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(37361544403980938)
);
end;
/
