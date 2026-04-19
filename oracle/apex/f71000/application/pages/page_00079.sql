prompt --application/pages/page_00079
begin
wwv_flow_api.create_page(
 p_id=>79
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Aprobaci\00F3n Convenio')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Aprobaci\00F3n Convenio')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'LOBREDOR'
,p_last_upd_yyyymmddhh24miss=>'20190227082608'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(146597250318204277)
,p_plug_name=>'Motivo Rechazo Solicitud  de Convenio'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(74051604836418012)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(146597250318204277)
,p_button_name=>'BTN_APROBAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aprobar Convenio'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74052061255418024)
,p_name=>'P79_NMRO_CNVNIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(146597250318204277)
,p_prompt=>unistr('Solicitud de Convenio n\00B0:')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74052892970418030)
,p_name=>'P79_ID_CNVNIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(146597250318204277)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74405449963784126)
,p_name=>'P79_RSPSTA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(146597250318204277)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89188904545064937)
,p_name=>'P79_FECHA_ACTUAL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(146597250318204277)
,p_item_default=>'TO_CHAR(SYSDATE, ''DD/MM/YYYY'')'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'<b>Fecha:</b>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74053665171418041)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Aprobar Convenio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    ',
'    pkg_gf_convenios.prc_ap_aprobar_acuerdo_pago ( p_cdgo_clnte   =>  :F_CDGO_CLNTE,',
'												   p_id_cnvnio    =>  :P79_ID_CNVNIO,												  ',
'												   p_mnsje		  =>  :P79_RSPSTA);',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(74051604836418012)
,p_process_when=>'P79_ID_CNVNIO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'&P79_RSPSTA.'
);
end;
/
