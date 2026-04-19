prompt --application/pages/page_00012
begin
wwv_flow_api.create_page(
 p_id=>12
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Revertir Proceso Jur\00EDdico')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Revertir Proceso Jur\00EDdico')
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.textarea {',
'    resize: none !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'MCARO'
,p_last_upd_yyyymmddhh24miss=>'20181107013359'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(37231190511151245)
,p_plug_name=>unistr('Revertir Proceso Jur\00EDdico')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(37734206019748104)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(37231190511151245)
,p_button_name=>'BTN_RVRTIR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>' Revertir'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-undo'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(37231242066151246)
,p_name=>'P12_PRCSOS_JRDCO_DCMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(37231190511151245)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(37231332208151247)
,p_name=>'P12_OBSRVCION'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(37231190511151245)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>90
,p_cMaxlength=>1000
,p_cHeight=>8
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(37231437465151248)
,p_name=>'P12_FLJO_TREA_ESTDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(37231190511151245)
,p_prompt=>'Tarea Estado'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion,',
'       id_fljo_trea_estdo ',
'  from wf_d_flujos_tarea_estado ',
' where id_fljo_trea = :P12_ID_FLJO_TREA',
'   and orden        < (select orden ',
'                         from wf_d_flujos_tarea_estado',
'                        where id_fljo_trea       = :P12_ID_FLJO_TREA',
'                          and id_fljo_trea_estdo = :P12_ID_ESTDO_ETPA)'))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(37733912721748101)
,p_name=>'P12_ID_FLJO_TREA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(37231190511151245)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(37734018647748102)
,p_name=>'P12_ID_ESTDO_ETPA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(37231190511151245)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(37734574234748107)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'revertir estado del documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'pkg_cb_proceso_juridico.prc_rv_estado_documento( p_id_prcsos_jrdco_dcmnto => :P12_PRCSOS_JRDCO_DCMNTO ,',
'                                                 p_id_fljo_trea           => :P12_ID_FLJO_TREA,',
'                                                 p_id_fljo_trea_estdo     => :P12_FLJO_TREA_ESTDO,',
'                                                 p_obsrvcion              => :P12_OBSRVCION,',
'                                                 p_id_usuario             => :F_ID_USRIO);'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(37734206019748104)
,p_process_success_message=>'Documento Revertido de forma exitosa!!'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(37734619054748108)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'cerrar cuadro de dialogo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
