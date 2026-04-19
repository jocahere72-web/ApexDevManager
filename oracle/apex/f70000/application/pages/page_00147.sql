prompt --application/pages/page_00147
begin
wwv_flow_api.create_page(
 p_id=>147
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Reversa de solicitud de rentas con exenci\00F3n ')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Reversa de solicitud de rentas con exenci\00F3n ')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20200824104503'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(172830298706389719)
,p_plug_name=>unistr('Reversa de Solicitud de Exenci\00F3n ')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(86506948889596469)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(172830298706389719)
,p_button_name=>'BTN_CANCELAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar / Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(86507333393596480)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(172830298706389719)
,p_button_name=>'BTN_REVERSAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Reversar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro que desea reversar esta solicitud de ExenciÃ³n?'', ''BTN_REVERSAR'');'
,p_icon_css_classes=>'fa-remove'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(86509407517596495)
,p_branch_name=>'Ir a Inicio'
,p_branch_action=>'f?p=&APP_ID.:135:&SESSION.::&DEBUG.:RP,147::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86507718607596483)
,p_name=>'P147_OBSRVCION_RVRSA'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(172830298706389719)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>1000
,p_cHeight=>1
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(86508430978596493)
,p_name=>'Cerrar Modal'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(86506948889596469)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(86508921138596494)
,p_event_id=>wwv_flow_api.id(86508430978596493)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(86508173665596493)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Reversa Solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(1000);',
'    v_id_exncion_slctud    number;',
'begin',
'      ',
'   pkg_gi_rentas.prc_gn_reversar_etapa_slctud(p_cdgo_clnte				=> :F_CDGO_CLNTE',
'                                             , p_id_rnta				=> :P136_ID_RNTA',
'                                             , p_id_usrio				=> :F_ID_USRIO',
'                                             , p_obsrvcion				=> nvl(:P147_OBSRVCION_RVRSA, ''Reversa de tarea'')',
'                                             , o_cdgo_rspsta			=> v_cdgo_rspsta',
'                                             , o_mnsje_rspsta			=> v_mnsje_rspsta);',
'    if v_cdgo_rspsta != 0 then ',
'        null;',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(86507333393596480)
,p_process_success_message=>unistr('\00A1Solicitud de Exenci\00F3n Rechazada Exitosamente!')
);
end;
/
