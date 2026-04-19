prompt --application/pages/page_00098
begin
wwv_flow_api.create_page(
 p_id=>98
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Evidencia de Diligencia de Secuestre'
,p_page_mode=>'MODAL'
,p_step_title=>'Evidencia de Diligencia de Secuestre'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'450'
,p_protection_level=>'C'
,p_last_updated_by=>'ABRACHE'
,p_last_upd_yyyymmddhh24miss=>'20200331181047'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(114133130954206106)
,p_plug_name=>'Evidencia de Diligencia de Secuestre'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17335434580919364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(114133896861206108)
,p_plug_name=>'Botones'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17336422472919364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(114134252930206108)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(114133896861206108)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(114133704097206108)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(114133896861206108)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P98_ID_SCSTR_DLGNCIA_ARCHVS'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(114133613105206108)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(114133896861206108)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P98_ID_SCSTR_DLGNCIA_ARCHVS'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(114133538138206108)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(114133896861206108)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P98_ID_SCSTR_DLGNCIA_ARCHVS'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(114029140656954316)
,p_branch_name=>unistr('Ir a P\00E1gina 88')
,p_branch_action=>'f?p=&APP_ID.:88:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'CREATE,SAVE,DELETE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(114136615446206112)
,p_name=>'P98_ID_SCSTR_DLGNCIA_ARCHVS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(114133130954206106)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Scstr Dlgncia Archvs'
,p_source=>'ID_SCSTR_DLGNCIA_ARCHVS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(17408571111919398)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(114137059128206131)
,p_name=>'P98_ID_SCSTRE_DLGNCIA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(114133130954206106)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha de Diligencia de Secuestre'
,p_source=>'ID_SCSTRE_DLGNCIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select fcha_dlgncia,id_scstre_dlgncia',
'from mc_g_secuestre_diligencia ',
'where id_scstre_gstion = :P98_ID_SCSTRE_GSTION',
''))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Fecha en que se realizo la diligencia de secuestre.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(114137403756206137)
,p_name=>'P98_FCHA_INGRSO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(114133130954206106)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha de Evidencia'
,p_source=>'FCHA_INGRSO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Seleccione la fecha de registro de evidencia de la diligencia de secuestre.'
,p_attribute_03=>'+1d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(114137827918206137)
,p_name=>'P98_BLOB_DLGNCIA'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(114133130954206106)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Archivo de Evidencia'
,p_source=>'BLOB_DLGNCIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>60
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione el archivo que servir\00E1 como evidencia  de la diligencia de secuestre.')
,p_attribute_01=>'DB_COLUMN'
,p_attribute_02=>'MIME_TYPE_DLGNCIA'
,p_attribute_03=>'FILENAME_DLGNCIA'
,p_attribute_06=>'Y'
,p_attribute_08=>'attachment'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(114139038057206139)
,p_name=>'P98_ID_FNCNRIO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(114133130954206106)
,p_use_cache_before_default=>'NO'
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_id_fncnrio v_sg_g_usuarios.id_fncnrio%type;',
'begin',
'    select id_fncnrio',
'      into v_id_fncnrio',
'      from v_sg_g_usuarios ',
'     where id_usrio = :F_ID_USRIO;',
'         ',
'    return v_id_fncnrio;',
'         ',
'end;'))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_source=>'ID_FNCNRIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(115638257734722902)
,p_name=>'P98_ID_SCSTRE_GSTION'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(114133130954206106)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(122608239279713905)
,p_computation_sequence=>10
,p_computation_item=>'P98_ID_SCSTRE_DLGNCIA'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_scstre_dlgncia',
'from mc_g_secuestre_diligencia a',
'where a.id_scstre_gstion = :P98_ID_SCSTRE_GSTION;'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(114134376277206108)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(114134252930206108)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(114135179153206110)
,p_event_id=>wwv_flow_api.id(114134376277206108)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(114139745144206142)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from MC_G_SCSTR_DLGNCIA_ARCHVS'
,p_attribute_02=>'MC_G_SCSTR_DLGNCIA_ARCHVS'
,p_attribute_03=>'P98_ID_SCSTR_DLGNCIA_ARCHVS'
,p_attribute_04=>'ID_SCSTR_DLGNCIA_ARCHVS'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(114140142789206143)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of MC_G_SCSTR_DLGNCIA_ARCHVS'
,p_attribute_02=>'MC_G_SCSTR_DLGNCIA_ARCHVS'
,p_attribute_03=>'P98_ID_SCSTR_DLGNCIA_ARCHVS'
,p_attribute_04=>'ID_SCSTR_DLGNCIA_ARCHVS'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n procesada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(114140511927206143)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(114133704097206108)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(114140996465206143)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
end;
/
