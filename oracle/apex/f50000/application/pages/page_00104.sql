prompt --application/pages/page_00104
begin
wwv_flow_api.create_page(
 p_id=>104
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>unistr('C\00E1lculo Clasificaci\00F3n ')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('C\00E1lculo Clasificaci\00F3n ')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'320'
,p_dialog_width=>'70%'
,p_protection_level=>'C'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20201222101359'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2524041272004448)
,p_plug_name=>unistr('C\00E1lculo Clasificaci\00F3n ')
,p_region_template_options=>'#DEFAULT#:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(29530253509068499)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2524787675004449)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29532093730068500)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2525112477004450)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2524787675004449)
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
 p_id=>wwv_flow_api.id(2524677245004449)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(2524787675004449)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de eliminar este cÃ¡lculo de clasificaciÃ³n?'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P104_ID_PRDIO_CLCLO_CLSFCCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2524590034004449)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(2524787675004449)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P104_ID_PRDIO_CLCLO_CLSFCCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2524484331004449)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(2524787675004449)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P104_ID_PRDIO_CLCLO_CLSFCCION'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(26636394985962706)
,p_branch_name=>unistr('Ir a P\00E1gina 45')
,p_branch_action=>'f?p=&APP_ID.:45:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2527554408004455)
,p_name=>'P104_ID_PRDIO_CLCLO_CLSFCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2524041272004448)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_PRDIO_CLCLO_CLSFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2527933385004469)
,p_name=>'P104_CDGO_CLNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(2524041272004448)
,p_use_cache_before_default=>'NO'
,p_item_default=>'&F_CDGO_CLNTE.'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2528368843004470)
,p_name=>'P104_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(2524041272004448)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tributo'
,p_source=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Tributo asociado a la clasificaci\00F3n del nuevo predio. Ejemplo Impuesto Predial Unificado')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2528738632004470)
,p_name=>'P104_CDGO_PRDIO_CLSFCCION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(2524041272004448)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Clasificaci\00F3n del Predio')
,p_source=>'CDGO_PRDIO_CLSFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_CLASIFICACION_PREDIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_prdio_clsfccion d,',
'       cdgo_prdio_clsfccion  r   ',
'  from df_s_predios_clasificacion',
'  order by cdgo_prdio_clsfccion'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Clase del predio al que se le definir\00E1n las caracter\00EDsticas. Ejemplo Rural.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2529158363004470)
,p_name=>'P104_CRCTER_INCIAL'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(2524041272004448)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Car\00E1cter Inicial')
,p_source=>'CRCTER_INCIAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>3
,p_cMaxlength=>2
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Digite el/los caracter(es) iniciales necesarios para identificar la clase del nuevo predio en la referencia catastral. Ejemplo 00.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2529568079004470)
,p_name=>'P104_CRCTER_FNAL'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(2524041272004448)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Car\00E1cter Final')
,p_source=>'CRCTER_FNAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>3
,p_cMaxlength=>2
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Digite el/los caracter(es) finales necesarios para identificar la clase del nuevo predio en la referencia catastral. Ejemplo 03.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2529977563004471)
,p_name=>'P104_FCHA_INCIAL'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(2524041272004448)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Inicial'
,p_source=>'FCHA_INCIAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>255
,p_tag_attributes=>'onkeydown="return false" '
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione la fecha inicial del rango de fechas en el que la clase determinada ser\00E1 valida con las caracter\00EDsticas definidas, con formato DD/MM/YYYY Ejemplo 01/01/2019.')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2530747383004473)
,p_name=>'P104_FCHA_FNAL'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(2524041272004448)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Final'
,p_source=>'FCHA_FNAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>255
,p_tag_attributes=>'onkeydown="return false" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Seleccione la fecha final del rango de fechas en el que la clase determinada ser\00E1 valida con las caracteristicas definidas, '),
'con formato DD/MM/YYYY Ejemplo 31/12/2019'))
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2531519504004473)
,p_name=>'P104_NMRO_CRCTER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(2524041272004448)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00FAmero Car\00E1cter')
,p_source=>'NMRO_CRCTER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_cMaxlength=>1
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Identifica la cantidad de caracteres a tomar de la referencia catastral para determinar la clase del nuevo predio. Ingrese un n\00FAmero del 1 al 3')
,p_attribute_01=>'1'
,p_attribute_02=>'3'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2530493412004472)
,p_validation_name=>'P104_FCHA_INCIAL must be timestamp'
,p_validation_sequence=>70
,p_validation=>'P104_FCHA_INCIAL'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# Debe ingresar una fecha valida.'
,p_associated_item=>wwv_flow_api.id(2529977563004471)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2531288485004473)
,p_validation_name=>'P104_FCHA_FNAL must be timestamp'
,p_validation_sequence=>80
,p_validation=>'P104_FCHA_FNAL'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# Debe ingresar una fecha valida.'
,p_associated_item=>wwv_flow_api.id(2530747383004473)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2366939650084737)
,p_validation_name=>'Validar_fecha_final'
,p_validation_sequence=>90
,p_validation=>'to_date(:P104_FCHA_INCIAL,''dd/mm/rr'')  < to_date(:P104_FCHA_FNAL,''dd/mm/rr'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Fecha Final no puede ser menor que Fecha Inicial'
,p_associated_item=>wwv_flow_api.id(2530747383004473)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2367195584084739)
,p_validation_name=>'Validar_caracter_final'
,p_validation_sequence=>100
,p_validation=>'(:P104_CRCTER_INCIAL <= :P104_CRCTER_FNAL)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Caracter Final no puede ser menor que Caracter Inicial'
,p_associated_item=>wwv_flow_api.id(2529568079004470)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(34797495871791449)
,p_validation_name=>'Validar Registro Existente'
,p_validation_sequence=>110
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'   from gi_d_predios_clclo_clsfccion a',
'  where a.cdgo_clnte           = :F_CDGO_CLNTE',
'    and a.id_impsto            = :P104_ID_IMPSTO',
'    and a.cdgo_prdio_clsfccion = :P104_CDGO_PRDIO_CLSFCCION',
'    /*and :P104_CRCTER_INCIAL    between a.crcter_incial and a.crcter_fnal',
'    and to_date(:P104_FCHA_INCIAL,''dd/mm/rr'')      between a.fcha_incial   and a.fcha_fnal*/'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'El rango de caracteres seleccionado ya se encuentra registrado en el rango de la fecha seleccionada, favor valide e intente nuevamente.'
,p_validation_condition_type=>'NEVER'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2525235702004450)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(2525112477004450)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2526035227004454)
,p_event_id=>wwv_flow_api.id(2525235702004450)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2532318833004475)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from GI_D_PREDIOS_CLCLO_CLSFCCION'
,p_attribute_02=>'GI_D_PREDIOS_CLCLO_CLSFCCION'
,p_attribute_03=>'P104_ID_PRDIO_CLCLO_CLSFCCION'
,p_attribute_04=>'ID_PRDIO_CLCLO_CLSFCCION'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2532726296004476)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of GI_D_PREDIOS_CLCLO_CLSFCCION'
,p_attribute_02=>'GI_D_PREDIOS_CLCLO_CLSFCCION'
,p_attribute_03=>'P104_ID_PRDIO_CLCLO_CLSFCCION'
,p_attribute_04=>'ID_PRDIO_CLCLO_CLSFCCION'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Se han guardado los cambios'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2533165467004476)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(2524677245004449)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2533519497004477)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CANCEL'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
