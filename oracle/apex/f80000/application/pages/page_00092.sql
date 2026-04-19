prompt --application/pages/page_00092
begin
wwv_flow_api.create_page(
 p_id=>92
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Asignaci\00F3n de Fecha de Diligencia de Seceustre')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Asignaci\00F3n de Fecha de Diligencia de Seceustre')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'400'
,p_dialog_width=>'350'
,p_last_updated_by=>'ABRACHE'
,p_last_upd_yyyymmddhh24miss=>'20200130182830'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(113250319388065808)
,p_plug_name=>'Body'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(113250694741065811)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(113250319388065808)
,p_button_name=>'btn_Asignar_Fecha'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Asignar Fecha'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-floppy-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(113250980957065814)
,p_branch_name=>unistr('Ir a P\00E1gina 88')
,p_branch_action=>'f?p=&APP_ID.:88:&SESSION.::&DEBUG.:RP,88::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(113250694741065811)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113250448143065809)
,p_name=>'P92_ID_SCSTRE_GSTION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(113250319388065808)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113250577053065810)
,p_name=>'P92_FCHA_GLGNCIA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(113250319388065808)
,p_prompt=>'Fecha para Diligencia de Secuestre'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione la fecha en que se realizar\00E1 la diligencia de secuestre.')
,p_attribute_02=>'-0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(113250816691065813)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Asignar Fecha de Diligencia'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PKG_CB_MEDIDAS_CAUTELARES.prc_ac_fecha_diligencia_scstre( p_id_scstre_gstion  => :P92_ID_SCSTRE_GSTION,',
'                                                          p_fcha_dlgncia      => :P92_FCHA_GLGNCIA);'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(113250694741065811)
);
end;
/
