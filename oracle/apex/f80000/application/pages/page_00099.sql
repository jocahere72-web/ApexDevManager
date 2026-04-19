prompt --application/pages/page_00099
begin
wwv_flow_api.create_page(
 p_id=>99
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Finalizaci\00F3n de secuestre')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Finalizaci\00F3n de secuestre')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'380'
,p_protection_level=>'C'
,p_last_updated_by=>'ABRACHE'
,p_last_upd_yyyymmddhh24miss=>'20200331182053'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(114383654950937255)
,p_plug_name=>unistr('Finalizaci\00F3n de secuestre')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17335434580919364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(114384373581937263)
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
 p_id=>wwv_flow_api.id(114384715557937263)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(114384373581937263)
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
 p_id=>wwv_flow_api.id(114384290025937263)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(114384373581937263)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P99_ID_SCSTRE_FNLZCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(114384198087937263)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(114384373581937263)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P99_ID_SCSTRE_FNLZCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(114384023027937263)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(114384373581937263)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P99_ID_SCSTRE_FNLZCION'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(114030024769954325)
,p_branch_name=>unistr('Ir a P\00E1gina 88')
,p_branch_action=>'f?p=&APP_ID.:88:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'CREATE,SAVE,DELETE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(114387151450937267)
,p_name=>'P99_ID_SCSTRE_FNLZCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(114383654950937255)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Scstre Fnlzcion'
,p_source=>'ID_SCSTRE_FNLZCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(17408571111919398)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(114387590629937284)
,p_name=>'P99_ID_SCSTRE_GSTION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(114383654950937255)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_SCSTRE_GSTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(114387959604937286)
,p_name=>'P99_FCHA_FNLZCION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(114383654950937255)
,p_use_cache_before_default=>'NO'
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>unistr('Fecha de Finalizaci\00F3n')
,p_source=>'FCHA_FNLZCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>18
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Seleccione la fecha en que se finaliza la medida de secuestre.'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(114388384702937286)
,p_name=>'P99_ID_CSL_FNLZCION'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(114383654950937255)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Causal de Finalizaci\00F3n')
,p_source=>'ID_CSL_FNLZCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_csal||''-''||dscrpcion_csal as causal,id_csl_fnlzcion',
'from mc_d_causales_finalizacion',
'where cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el causal para la finalizaci\00F3n de la medida de secuestre.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(114390382993937290)
,p_name=>'P99_ID_FNCNRIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(114383654950937255)
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
 p_id=>wwv_flow_api.id(114390728523937290)
,p_name=>'P99_OBSRVCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(114383654950937255)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Observaci\00F3n de Finalizaci\00F3n')
,p_source=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>40
,p_cMaxlength=>2000
,p_cHeight=>7
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la observaci\00F3n del porque se finaliza una medida de secuestre.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(114384821568937263)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(114384715557937263)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(114385664798937265)
,p_event_id=>wwv_flow_api.id(114384821568937263)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(114391509336937292)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from MC_G_SECUESTRE_FINALIZACION'
,p_attribute_02=>'MC_G_SECUESTRE_FINALIZACION'
,p_attribute_03=>'P99_ID_SCSTRE_FNLZCION'
,p_attribute_04=>'ID_SCSTRE_FNLZCION'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(114391974029937293)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of MC_G_SECUESTRE_FINALIZACION'
,p_attribute_02=>'MC_G_SECUESTRE_FINALIZACION'
,p_attribute_03=>'P99_ID_SCSTRE_FNLZCION'
,p_attribute_04=>'ID_SCSTRE_FNLZCION'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n procesada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(115340604798655103)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cambiar estado de la medida de secuestre'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'pkg_cb_medidas_cautelares.prc_ac_estado_medida_secuestre (p_cdgo_clnte         => :F_CDGO_CLNTE,',
'                                                          p_id_scstre_gstion   => :P99_ID_SCSTRE_GSTION);'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(114384023027937263)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(114392366056937293)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(114384290025937263)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(114392789891937293)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
end;
/
