prompt --application/pages/page_00035
begin
wwv_flow_api.create_page(
 p_id=>35
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Nuevo lote de selecci\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Nuevo lote de selecci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'400'
,p_protection_level=>'C'
,p_last_updated_by=>'PSOTTER'
,p_last_upd_yyyymmddhh24miss=>'20220531081540'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(73981940476838810)
,p_plug_name=>unistr('Nuevo lote de selecci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(73982461871838812)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(73981940476838810)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P35_ID_EMBRGOS_SMU_LTE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-floppy-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(73982678904838812)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(73981940476838810)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(73982306242838812)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(73981940476838810)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P35_ID_EMBRGOS_SMU_LTE'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(73982569742838812)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(73981940476838810)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(73984236159838821)
,p_branch_name=>unistr('Ir a P\00E1gina 34')
,p_branch_action=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.::P34_ID_EMBRGOS_SMU_LTE:&P35_ID_EMBRGOS_SMU_LTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73984698187838822)
,p_name=>'P35_ID_EMBRGOS_SMU_LTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(73981940476838810)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73985002942838844)
,p_name=>'P35_CDGO_CLNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(73981940476838810)
,p_use_cache_before_default=>'NO'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73985486302838846)
,p_name=>'P35_FCHA_LTE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(73981940476838810)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Lote'
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'FCHA_LTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cMaxlength=>255
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_colspan=>4
,p_read_only_when=>'P35_ID_EMBRGOS_SMU_LTE'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione la fecha del nuevo lote de selecci\00F3n')
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73986200091838852)
,p_name=>'P35_ID_TPOS_MDDA_CTLAR'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(73981940476838810)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo de Medida Cautelar'
,p_source=>'ID_TPOS_MDDA_CTLAR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion,id_tpos_mdda_ctlar',
'from mc_d_tipos_mdda_ctlar',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and actvo = ''S'';'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P35_ID_EMBRGOS_SMU_LTE'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista el tipo de medida cautelar que corresponde al nuevo lote de selecci\00F3n.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73986620272838853)
,p_name=>'P35_ID_FNCNRIO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(73981940476838810)
,p_use_cache_before_default=>'NO'
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_id_fncnrio v_sg_g_usuarios.id_fncnrio%type;',
'begin',
'',
'    select u.id_fncnrio',
'      into v_id_fncnrio',
'      from v_sg_g_usuarios u',
'     where u.id_usrio = :f_id_usrio;',
'     ',
'     return v_id_fncnrio;',
'',
'end;'))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_source=>'ID_FNCNRIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73987034960838853)
,p_name=>'P35_OBSRVCION'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(73981940476838810)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Observaci\00F3n')
,p_source=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>100
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrtese la observaci\00F3n que considere correspondiente al lote de selecci\00F3n ')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(73985919376838851)
,p_validation_name=>'P35_FCHA_LTE must be timestamp'
,p_validation_sequence=>30
,p_validation=>'P35_FCHA_LTE'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>unistr('#LABEL# debe ser un registro de hora v\00E1lido.')
,p_associated_item=>wwv_flow_api.id(73985486302838846)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(73987879208838855)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from MC_G_EMBARGOS_SIMU_LOTE'
,p_attribute_02=>'MC_G_EMBARGOS_SIMU_LOTE'
,p_attribute_03=>'P35_ID_EMBRGOS_SMU_LTE'
,p_attribute_04=>'ID_EMBRGOS_SMU_LTE'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(73988256513838856)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of MC_G_EMBARGOS_SIMU_LOTE'
,p_attribute_02=>'MC_G_EMBARGOS_SIMU_LOTE'
,p_attribute_03=>'P35_ID_EMBRGOS_SMU_LTE'
,p_attribute_04=>'ID_EMBRGOS_SMU_LTE'
,p_attribute_09=>'P35_ID_EMBRGOS_SMU_LTE'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n procesada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(73988619414838856)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(73982569742838812)
);
end;
/
