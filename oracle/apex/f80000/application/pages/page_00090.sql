prompt --application/pages/page_00090
begin
wwv_flow_api.create_page(
 p_id=>90
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Diligencia de Secuestre'
,p_page_mode=>'MODAL'
,p_step_title=>'Diligencia de Secuestre'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'500'
,p_protection_level=>'C'
,p_last_updated_by=>'ABRACHE'
,p_last_upd_yyyymmddhh24miss=>'20200331180823'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(113195341135408566)
,p_plug_name=>'Diligencia de Secuestre'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17335434580919364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(113196080910408571)
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
 p_id=>wwv_flow_api.id(113196416566408572)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(113196080910408571)
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
 p_id=>wwv_flow_api.id(113195987760408571)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(113196080910408571)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P90_ID_SCSTRE_DLGNCIA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(113195889715408571)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(113196080910408571)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P90_ID_SCSTRE_DLGNCIA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(113195719437408571)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(113196080910408571)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P90_ID_SCSTRE_DLGNCIA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(120208115908208401)
,p_branch_action=>'f?p=&APP_ID.:88:&SESSION.::&DEBUG.:RP,88::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113198887133408576)
,p_name=>'P90_ID_SCSTRE_DLGNCIA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(113195341135408566)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Scstre Dlgncia'
,p_source=>'ID_SCSTRE_DLGNCIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(17408571111919398)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113199243358408596)
,p_name=>'P90_ID_SCSTRE_GSTION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(113195341135408566)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_SCSTRE_GSTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113199639292408599)
,p_name=>'P90_FCHA_DLGNCIA'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(113195341135408566)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Diligencia'
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'FCHA_DLGNCIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Seleccione la fecha en que se realizo la diligencia de secuestre.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113200893247408600)
,p_name=>'P90_HNRRIOS_SCSTRE'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(113195341135408566)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Honorarios Secuestre'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_source=>'HNRRIOS_SCSTRE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese los honorarios del secuestre.'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113201271428408602)
,p_name=>'P90_OBSRVCION'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(113195341135408566)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Observaci\00F3n Diligencia')
,p_source=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>2000
,p_cHeight=>4
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese una observaci\00F3n del desarrollo de la diligencia de secuestre.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113201674501408602)
,p_name=>'P90_ID_FNCNRIO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(113195341135408566)
,p_use_cache_before_default=>'NO'
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_id_fncnrio v_sg_g_usuarios.id_fncnrio%type;',
'',
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
 p_id=>wwv_flow_api.id(116934273503382749)
,p_name=>'P90_HNRRIOS_SCSTRE_VLD'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(113195341135408566)
,p_prompt=>unistr('Honorarios Secuestre - Validaci\00F3n')
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese los honorarios del secuestre para validaci\00F3n.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(116934370789382750)
,p_validation_name=>'valor mayor a 0 honorarios secuestre validacion'
,p_validation_sequence=>10
,p_validation=>':P90_HNRRIOS_SCSTRE_VLD > 0'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'#LABEL# debe ser mayor a 0.'
,p_associated_item=>wwv_flow_api.id(116934273503382749)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(122607810543713901)
,p_validation_name=>'valor mayor a 0 honorarios secuestre'
,p_validation_sequence=>20
,p_validation=>':P90_HNRRIOS_SCSTRE > 0'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'#LABEL# debe ser mayor a 0.'
,p_associated_item=>wwv_flow_api.id(113200893247408600)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(122607988380713902)
,p_validation_name=>'Valores de honorarios iguales'
,p_validation_sequence=>30
,p_validation=>':P90_HNRRIOS_SCSTRE = :P90_HNRRIOS_SCSTRE_VLD'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Los valores de los Honorarios no son iguales.'
,p_associated_item=>wwv_flow_api.id(116934273503382749)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(113196533162408572)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(113196416566408572)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(113197387831408573)
,p_event_id=>wwv_flow_api.id(113196533162408572)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(113202490373408604)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from MC_G_SECUESTRE_DILIGENCIA'
,p_attribute_02=>'MC_G_SECUESTRE_DILIGENCIA'
,p_attribute_03=>'P90_ID_SCSTRE_DLGNCIA'
,p_attribute_04=>'ID_SCSTRE_DLGNCIA'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(113202805095408606)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of MC_G_SECUESTRE_DILIGENCIA'
,p_attribute_02=>'MC_G_SECUESTRE_DILIGENCIA'
,p_attribute_03=>'P90_ID_SCSTRE_DLGNCIA'
,p_attribute_04=>'ID_SCSTRE_DLGNCIA'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n procesada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(113203276549408607)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(113195987760408571)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(113203666077408607)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
end;
/
