prompt --application/pages/page_00086
begin
wwv_flow_api.create_page(
 p_id=>86
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Modificar Secuestre y/o Auxiliar de Secuestre'
,p_page_mode=>'MODAL'
,p_step_title=>'Modificar Secuestre y/o Auxiliar'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'350'
,p_last_updated_by=>'ABRACHE'
,p_last_upd_yyyymmddhh24miss=>'20200130183032'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(113873031733361806)
,p_plug_name=>'Datos secuestre'
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
 p_id=>wwv_flow_api.id(113873339863361809)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(113873031733361806)
,p_button_name=>'btn_Actualizar_Datos'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Actualizar Datos'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(113873677635361812)
,p_branch_action=>'f?p=&APP_ID.:88:&SESSION.::&DEBUG.:RP,88::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(113873339863361809)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113873103583361807)
,p_name=>'P86_ID_SCSTRE_GSTION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(113873031733361806)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113873293991361808)
,p_name=>'P86_ID_SCSTRE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(113873031733361806)
,p_prompt=>'Secuestre'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select idntfccion||''-''||nmbre_cmplto as secuestre ,id_scstre',
'from v_mc_d_secuestres',
'where cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el funcionario que realizar\00E1 el proceso de secuestre, este funcionario debe pertenecer al listado de secuestres designados por la administraci\00F3n.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113873422518361810)
,p_name=>'P86_ID_SCSTRS_AUXLR'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(113873031733361806)
,p_prompt=>'Auxiliar de Secuestre'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select idntfccion||''-''||nmbre_trcro as secuestre ,id_scstrs_auxlr',
'from v_mc_d_secuestres_auxiliar',
'where cdgo_clnte = :F_CDGO_CLNTE;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el funcionario que realizar\00E1 el acompa\00F1amiento en el proceso de secuestre.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(113873502463361811)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cambiar secuestre o auxiliar  de secuestre'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'pkg_cb_medidas_cautelares.prc_ac_datos_medida_secuestre (p_id_scstre_gstion => :P86_ID_SCSTRE_GSTION,',
'                                                         p_id_scstre        => :P86_ID_SCSTRE,',
'                                                         p_id_scstrs_auxlr  => :P86_ID_SCSTRS_AUXLR);'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(113873339863361809)
);
end;
/
