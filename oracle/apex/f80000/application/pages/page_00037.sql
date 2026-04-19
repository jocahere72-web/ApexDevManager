prompt --application/pages/page_00037
begin
wwv_flow_api.create_page(
 p_id=>37
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Embargo Responsables'
,p_page_mode=>'MODAL'
,p_step_title=>'Embargo Responsables'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'function mayuscula(this_){',
'    var id = this_.triggeringElement;',
'    $(id).val($(id).val().toUpperCase());',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_attributes=>'id:"DialogResponsables"'
,p_protection_level=>'C'
,p_last_updated_by=>'JAGUAS'
,p_last_upd_yyyymmddhh24miss=>'20220215152214'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(105473224417405141)
,p_plug_name=>'Embargo Responsables'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17335434580919364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(105473901883405142)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17336422472919364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(74279748196484359)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(105473901883405142)
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
 p_id=>wwv_flow_api.id(74280128758484359)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(105473901883405142)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P37_ID_EMBRGOS_SMU_RSPNSBLE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(74280543846484360)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(105473901883405142)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P37_ID_EMBRGOS_SMU_RSPNSBLE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(74280905114484360)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(105473901883405142)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P37_ID_EMBRGOS_SMU_RSPNSBLE'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74272202403484351)
,p_name=>'P37_ID_EMBRGOS_SMU_RSPNSBLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(105473224417405141)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_EMBRGOS_SMU_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74272640074484353)
,p_name=>'P37_ID_EMBRGOS_SMU_SJTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(105473224417405141)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_EMBRGOS_SMU_SJTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74273059031484353)
,p_name=>'P37_CDGO_IDNTFCCION_TPO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(105473224417405141)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Tipo Identificaci\00F3n ')
,p_source=>'CDGO_IDNTFCCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IDENTIFICACIONES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_IDNTFCCION_TPO as d,',
'       CDGO_IDNTFCCION_TPO as r',
'  from DF_S_IDENTIFICACIONES_TIPO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Tipo de Identificaci\00F3n del Responsable asociado a la cartera del sujeto seleccionado.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74273448446484353)
,p_name=>'P37_IDNTFCCION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(105473224417405141)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Identificaci\00F3n')
,p_source=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>25
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Identificaci\00F3n del Responsable asociado a la cartera del sujeto seleccionado.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74273873139484354)
,p_name=>'P37_PRNCPAL_S_N'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(105473224417405141)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Principal'
,p_source=>'PRNCPAL_S_N'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Si;S,No;N'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Estado que indica si es o no el responsable principal asociado a la cartera del sujeto seleccionado.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74274277607484354)
,p_name=>'P37_PRMER_NMBRE'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(105473224417405141)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Primer Nombre'
,p_source=>'PRMER_NMBRE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Primer nombre del Responsable asociado a la cartera del sujeto seleccionado.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74274679507484354)
,p_name=>'P37_SGNDO_NMBRE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(105473224417405141)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Segundo Nombre'
,p_source=>'SGNDO_NMBRE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Segundo nombre del Responsable asociado a la cartera del sujeto seleccionado.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74275035125484354)
,p_name=>'P37_PRMER_APLLDO'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(105473224417405141)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Primer Apellido'
,p_source=>'PRMER_APLLDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Primer apellido del Responsable asociado a la cartera del sujeto seleccionado.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74275470626484354)
,p_name=>'P37_SGNDO_APLLDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(105473224417405141)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Segundo Apellido'
,p_source=>'SGNDO_APLLDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Segundo apellido del Responsable asociado a la cartera del sujeto seleccionado.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74275880363484355)
,p_name=>'P37_CDGO_TPO_RSPNSBLE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(105473224417405141)
,p_use_cache_before_default=>'NO'
,p_source=>'CDGO_TPO_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74276273013484355)
,p_name=>'P37_PRCNTJE_PRTCPCION'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(105473224417405141)
,p_use_cache_before_default=>'NO'
,p_source=>'PRCNTJE_PRTCPCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74276625392484356)
,p_name=>'P37_ID_PAIS_NTFCCION'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(105473224417405141)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Pa\00EDs Notificaci\00F3n')
,p_source=>'ID_PAIS_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_PAIS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_pais as d,',
'       id_pais  as r',
'  from df_s_paises',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Pa\00EDs de notificaci\00F3n del Responsable asociado a la cartera del sujeto seleccionado.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74277069083484356)
,p_name=>'P37_ID_DPRTMNTO_NTFCCION'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(105473224417405141)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Departamento Notificaci\00F3n')
,p_source=>'ID_DPRTMNTO_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    nmbre_dprtmnto,',
'    id_dprtmnto',
'from',
'    df_s_departamentos',
'where',
'    id_pais =:p37_id_pais_ntfccion;'))
,p_lov_cascade_parent_items=>'P37_ID_PAIS_NTFCCION'
,p_ajax_items_to_submit=>'P37_ID_DPRTMNTO_NTFCCION'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Departamento del Responsable asociado a la cartera del sujeto seleccionado.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74277453772484357)
,p_name=>'P37_ID_MNCPIO_NTFCCION'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(105473224417405141)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr(' Municipio Notificaci\00F3n')
,p_source=>'ID_MNCPIO_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    nmbre_mncpio,',
'    id_mncpio',
'from',
'    df_s_municipios',
'where',
'    id_dprtmnto =:P37_ID_DPRTMNTO_NTFCCION;'))
,p_lov_cascade_parent_items=>'P37_ID_DPRTMNTO_NTFCCION'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Municipio del Responsable asociado a la cartera del sujeto seleccionado.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74277817019484357)
,p_name=>'P37_DRCCION_NTFCCION'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(105473224417405141)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Direcci\00F3n Notificaci\00F3n')
,p_source=>'DRCCION_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Direcci\00F3n de Notificaci\00F3n del Responsable asociado a la cartera del sujeto seleccionado.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74278293874484357)
,p_name=>'P37_TLFNO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(105473224417405141)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Tel\00E9fono')
,p_source=>'TLFNO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Tel\00E9fono del Responsable asociado a la cartera del sujeto seleccionado.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEL'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74278697193484357)
,p_name=>'P37_CLLAR'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(105473224417405141)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Celular'
,p_source=>'CLLAR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Numero celular o m\00F3vil del Responsable asociado a la cartera del sujeto seleccionado.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEL'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74279029945484357)
,p_name=>'P37_EMAIL'
,p_is_required=>true
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(105473224417405141)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Email'
,p_source=>'EMAIL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>320
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Correo electr\00F3nico o E-mail del Responsable asociado a la cartera del sujeto seleccionado.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'EMAIL'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(74282566027484369)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(74279748196484359)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(74283075502484369)
,p_event_id=>wwv_flow_api.id(74282566027484369)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(74283480887484370)
,p_name=>'al soltar la tecla'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P37_TLFNO'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(74283969065484370)
,p_event_id=>wwv_flow_api.id(74283480887484370)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P37_ID_EMBRGOS_SMU_RSPNSBLE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(74285249240484371)
,p_name=>'al_soltar_la_tecla'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P37_PRMER_NMBRE,P37_SGNDO_NMBRE,P37_PRMER_APLLDO,P37_SGNDO_APLLDO'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(74285616332484371)
,p_event_id=>wwv_flow_api.id(74285249240484371)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'mayuscula(this);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(74284376041484370)
,p_name=>unistr('Al Cambiar la Identificaci\00F3n')
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P37_IDNTFCCION,P37_CDGO_IDNTFCCION_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P37_ID_EMBRGOS_SMU_RSPNSBLE'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(74284845702484370)
,p_event_id=>wwv_flow_api.id(74284376041484370)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.server.process(''Consultar_Terceros'', {',
'    pageItems: ''#P37_IDNTFCCION,#P37_CDGO_IDNTFCCION_TPO''',
'} ).then(function(resp) {',
'        Object.keys(resp).forEach((f) => {        ',
'            apex.item(''P37_'' + f).setValue(('''' + resp[f]).trim());',
'        });    ',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74281309877484367)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from MC_G_EMBARGOS_SIMU_RSPNSBLE'
,p_attribute_02=>'MC_G_EMBARGOS_SIMU_RSPNSBLE'
,p_attribute_03=>'P37_ID_EMBRGOS_SMU_RSPNSBLE'
,p_attribute_04=>'ID_EMBRGOS_SMU_RSPNSBLE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74281753503484368)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of MC_G_EMBARGOS_SIMU_RSPNSBLE'
,p_attribute_02=>'MC_G_EMBARGOS_SIMU_RSPNSBLE'
,p_attribute_03=>'P37_ID_EMBRGOS_SMU_RSPNSBLE'
,p_attribute_04=>'ID_EMBRGOS_SMU_RSPNSBLE'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_process_error_message=>unistr('Error al intentar procesar informaci\00F3n!!')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n procesada!!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74282199808484368)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar_Terceros'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_prmer_nmbre   si_c_terceros.prmer_nmbre%type;',
'    v_sgndo_nmbre   si_c_terceros.sgndo_nmbre%type;',
'    v_prmer_aplldo  si_c_terceros.prmer_aplldo%type;',
'    v_sgndo_aplldo  si_c_terceros.sgndo_aplldo%type;',
'    v_id_pais       si_c_terceros.id_pais%type;',
'    v_id_dprtmnto   si_c_terceros.id_dprtmnto%type;',
'    v_id_mncpio     si_c_terceros.id_mncpio%type;',
'    v_drccion       si_c_terceros.drccion%type;',
'    v_email         si_c_terceros.email%type;',
'    v_tlfno         si_c_terceros.tlfno%type;',
'',
'begin',
'    select prmer_nmbre,',
'           sgndo_nmbre,',
'           prmer_aplldo,',
'           sgndo_aplldo,',
'           id_pais,',
'           id_dprtmnto,',
'           id_mncpio,',
'           drccion,',
'           email,',
'           tlfno',
'      into v_prmer_nmbre,',
'           v_sgndo_nmbre,',
'           v_prmer_aplldo,',
'           v_sgndo_aplldo,',
'           v_id_pais,',
'           v_id_dprtmnto,',
'           v_id_mncpio,',
'           v_drccion,',
'           v_email,',
'           v_tlfno',
'      from si_c_terceros ',
'     where idntfccion          = :P37_IDNTFCCION ',
'       and cdgo_idntfccion_tpo = :P37_CDGO_IDNTFCCION_TPO;',
'       ',
'        apex_json.initialize_output( p_http_cache => false );',
'        owa_util.mime_header(''application/json'', false);',
'        owa_util.http_header_close;',
'        apex_json.open_object();',
'        apex_json.write(''PRMER_NMBRE'', v_prmer_nmbre);',
'        apex_json.write(''SGNDO_NMBRE'', v_sgndo_nmbre);',
'        apex_json.write(''PRMER_APLLDO'', v_prmer_aplldo);',
'        apex_json.write(''SGNDO_APLLDO'', v_sgndo_aplldo);',
'        apex_json.write(''ID_PAIS_NTFCCION'', v_id_pais);',
'        apex_json.write(''ID_DPRTMNTO_NTFCCION'', v_id_dprtmnto);',
'        apex_json.write(''ID_MNCPIO_NTFCCION'', v_id_mncpio);',
'        apex_json.write(''DRCCION_NTFCCION'', v_drccion);',
'        apex_json.write(''EMAIL'', v_email);',
'        apex_json.write(''TLFNO'', v_tlfno);',
'        apex_json.close_all();',
'       ',
'exception ',
'    when others then',
'        apex_json.open_object();',
'        apex_json.write(''PRMER_NMBRE'', '' '');',
'        apex_json.write(''SGNDO_NMBRE'', '' '');',
'        apex_json.write(''PRMER_APLLDO'', '' '');',
'        apex_json.write(''SGNDO_APLLDO'', '' '');',
'        apex_json.write(''ID_PAIS_NTFCCION'', '' '');',
'        apex_json.write(''ID_DPRTMNTO_NTFCCION'', '' '');',
'        apex_json.write(''ID_MNCPIO_NTFCCION'', '' '');',
'        apex_json.write(''DRCCION_NTFCCION'', '' '');',
'        apex_json.close_all();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P37_ID_EMBRGOS_SMU_RSPNSBLE'
,p_process_when_type=>'ITEM_IS_NULL'
);
end;
/
