prompt --application/pages/page_00070
begin
wwv_flow_api.create_page(
 p_id=>70
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Parametrizaci\00F3n Desembargo Masivo')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Parametrizaci\00F3n Desembargo Masivo')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'ELAFAURIE'
,p_last_upd_yyyymmddhh24miss=>'20200107131301'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(106184235992264783)
,p_plug_name=>unistr('Parametrizaci\00F3n Desembargo Masivo')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17335434580919364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(106184875132264785)
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
 p_id=>wwv_flow_api.id(106185221961264785)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(106184875132264785)
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
 p_id=>wwv_flow_api.id(106184730567264785)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(106184875132264785)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P70_ID_PRMTROS_DSMBRGO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(106184620296264785)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(106184875132264785)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P70_ID_PRMTROS_DSMBRGO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(106184538386264785)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(106184875132264785)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P70_ID_PRMTROS_DSMBRGO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105082987373319323)
,p_name=>'P70_DSCRPCION_PRMTROS'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(106184235992264783)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Descripci\00F3n de Parametrizaci\00F3n')
,p_source=>'DSCRPCION_PRMTROS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>500
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Ingrese una breve descripci\00F3n para la parametrizaci\00F3n del desembargo masivo')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106187695074264790)
,p_name=>'P70_ID_PRMTROS_DSMBRGO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(106184235992264783)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Prmtros Dsmbrgo'
,p_source=>'ID_PRMTROS_DSMBRGO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(17408571111919398)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106188001345264818)
,p_name=>'P70_CDGO_CLNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(106184235992264783)
,p_use_cache_before_default=>'NO'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106188471075264832)
,p_name=>'P70_TPO_CRTRA'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(106184235992264783)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo de Cartera'
,p_source=>'TPO_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Cartera Total;CT,Cartera de Embargo;CE'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tipo de cartera '
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106188812616264832)
,p_name=>'P70_TPOS_MDDA_CTLAR'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(106184235992264783)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipos de Medida Cautelar'
,p_source=>'TPOS_MDDA_CTLAR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion,id_tpos_mdda_ctlar',
'from mc_d_tipos_mdda_ctlar',
'where cdgo_clnte = :F_CDGO_CLNTE;'))
,p_field_template=>wwv_flow_api.id(17408849104919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el/los tipo(s) de medida(s) cautelar(es) que correspondan a la parametrizaci\00F3n del desembargo masivo.')
,p_attribute_01=>'2'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106189238764264832)
,p_name=>'P70_CSLES_DSMBRGO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(106184235992264783)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Causales de Desembargo'
,p_source=>'CSLES_DSMBRGO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_csal,id_csles_dsmbrgo',
'from mc_d_causales_desembargo',
'WHERE cdgo_clnte = :F_CDGO_CLNTE',
'and dsmbrgo_msvo = ''S'';'))
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408849104919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el/los tipo(s) de causal(es) de desembargo(s) que correspondan a la parametrizaci\00F3n del desembargo masivo.')
,p_attribute_01=>'2'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(106185335585264785)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(106185221961264785)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(106186197502264787)
,p_event_id=>wwv_flow_api.id(106185335585264785)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(106190059912264841)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from MC_D_PARAMETROS_DESEMBARGO'
,p_attribute_02=>'MC_D_PARAMETROS_DESEMBARGO'
,p_attribute_03=>'P70_ID_PRMTROS_DSMBRGO'
,p_attribute_04=>'ID_PRMTROS_DSMBRGO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(106190489115264842)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of MC_D_PARAMETROS_DESEMBARGO'
,p_attribute_02=>'MC_D_PARAMETROS_DESEMBARGO'
,p_attribute_03=>'P70_ID_PRMTROS_DSMBRGO'
,p_attribute_04=>'ID_PRMTROS_DSMBRGO'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n procesada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(106190835500264843)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(106184730567264785)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(106191295054264843)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
