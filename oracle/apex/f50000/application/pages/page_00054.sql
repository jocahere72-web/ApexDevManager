prompt --application/pages/page_00054
begin
wwv_flow_api.create_page(
 p_id=>54
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>unistr('Gesti\00F3n Funcionario')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Gesti\00F3n Funcionario')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('var htmldb_delete_message=''\00BFEst\00E1 seguro de eliminar el registro?'';'),
''))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20200714112427'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(96934791383715881)
,p_plug_name=>unistr('Gesti\00F3n Funcionario')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(31771481476501115)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(96934791383715881)
,p_button_name=>'BTN_NUEVO_TERCERO'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Tercero'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=60000:2:&SESSION.::&DEBUG.:RP,2::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>9
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(96935203815715883)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(96934791383715881)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P54_ID_FNCNRIO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(96935464861715883)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(96934791383715881)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(96935387159715883)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(96934791383715881)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P54_ID_FNCNRIO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(96935137924715883)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(96934791383715881)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P54_ID_FNCNRIO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11554681151496508)
,p_name=>'P54_FIRMA_FILE_BLOB'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(96934791383715881)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Firma del funcinorario'
,p_source=>'FIRMA_FILE_BLOB'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Representa la imagen digitalizada del funcionario'
,p_attribute_01=>'DB_COLUMN'
,p_attribute_02=>'FIRMA_FILE_MIMETYPE'
,p_attribute_03=>'FIRMA_FILE_NAME'
,p_attribute_06=>'Y'
,p_attribute_08=>'attachment'
,p_attribute_11=>'image/*'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76388078820575227)
,p_name=>'P54_ID_ENTDAD'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(96934791383715881)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Entidad'
,p_source=>'ID_ENTDAD'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_ENTIDADES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rzon_scial',
'        , id_entdad ',
'     from df_s_entidades ',
' order by nmbre_rzon_scial;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96937091386715912)
,p_name=>'P54_ID_FNCNRIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(96934791383715881)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_FNCNRIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96937426349715921)
,p_name=>'P54_CDGO_CLNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(96934791383715881)
,p_use_cache_before_default=>'NO'
,p_item_default=>'&F_CDGO_CLNTE.'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96937810621715923)
,p_name=>'P54_ID_TRCRO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(96934791383715881)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Funcionario'
,p_source=>'ID_TRCRO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_trcro || ''['' || idntfccion || '']'' d , ',
'       id_trcro r ',
' from v_si_c_terceros ',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and indcdr_fncnrio = ''S''',
'   and case when :P54_ID_TRCRO is null and id_trcro not in (select id_trcro from df_c_funcionarios where cdgo_clnte = :F_CDGO_CLNTE and actvo = ''S'')',
'                then 1 ',
'            when :P54_ID_TRCRO is not null and id_trcro in (select id_trcro from df_c_funcionarios where cdgo_clnte = :F_CDGO_CLNTE )',
'                then 1',
'            else 0',
'        end = 1',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el funcionario a ingresar en el sistema.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96938647495715923)
,p_name=>'P54_ID_OFCNA'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(96934791383715881)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Oficina'
,p_source=>'ID_OFCNA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_ofcna as d,',
'       id_ofcna as r',
'  from df_c_oficinas',
'where cdgo_clnte = :F_CDGO_CLNTE',
'      '))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccione Oficina-'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista la oficina de cobro a la que pertenece el funcionario seleccionado'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96940243027715924)
,p_name=>'P54_ID_CRGO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(96934791383715881)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Cargo'
,p_source=>'ID_CRGO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_CARGOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_crgo as d,',
'       id_crgo as r',
'  from df_c_cargos',
' where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el cargo correspondiente al funcionario seleccionado'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96941001101715925)
,p_name=>'P54_ACTVO'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(96934791383715881)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFActivo?')
,p_source=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Seleccione el estado del funcionario "Si" Activo y "No" para Inactivo'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(109627824406348420)
,p_name=>'Close_Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(96935464861715883)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(109627948888348421)
,p_event_id=>wwv_flow_api.id(109627824406348420)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(96941841270715926)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from DF_C_FUNCIONARIOS'
,p_attribute_02=>'DF_C_FUNCIONARIOS'
,p_attribute_03=>'P54_ID_FNCNRIO'
,p_attribute_04=>'ID_FNCNRIO'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(96942276938715926)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of DF_C_FUNCIONARIOS'
,p_attribute_02=>'DF_C_FUNCIONARIOS'
,p_attribute_03=>'P54_ID_FNCNRIO'
,p_attribute_04=>'ID_FNCNRIO'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(96942645086715927)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
