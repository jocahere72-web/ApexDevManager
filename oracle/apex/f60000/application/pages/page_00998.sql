prompt --application/pages/page_00998
begin
wwv_flow_api.create_page(
 p_id=>998
,p_user_interface_id=>wwv_flow_api.id(103265655096132800)
,p_name=>'Tercero Portal'
,p_page_mode=>'MODAL'
,p_step_title=>'Tercero Portal'
,p_autocomplete_on_off=>'ON'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>unistr('var htmldb_delete_message=''\00BFEst\00E1 seguro que deseea eliminar el registro?'';')
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'600'
,p_dialog_width=>'80%'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20221128161455'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(272013901366424393)
,p_plug_name=>'Tercero Portal'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29922468477317085)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(272014579994424397)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29924237099317086)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(138199869630117649)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(272014579994424397)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(138200259259117651)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(272014579994424397)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'(:P998_ID_TRCRO_PRTAL is not null) and (:P998_INDCDOR_PRCSDO = ''N'')'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(138200664970117651)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(272014579994424397)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P998_ID_TRCRO_PRTAL'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(138201033990117651)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(272014579994424397)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P998_ID_TRCRO_PRTAL'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138163672463103610)
,p_name=>'P998_INDCDOR_PRCSDO'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(272013901366424393)
,p_use_cache_before_default=>'NO'
,p_source=>'INDCDOR_PRCSDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138176676047117627)
,p_name=>'P998_ID_TRCRO_PRTAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(272013901366424393)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_TRCRO_PRTAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138177039099117632)
,p_name=>'P998_CDGO_CLNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(272013901366424393)
,p_use_cache_before_default=>'NO'
,p_item_default=>'&F_CDGO_CLNTE.'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138177429519117632)
,p_name=>'P998_CDGO_IDNTFCCION_TPO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(272013901366424393)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Tipo Identificaci\00F3n')
,p_source=>'CDGO_IDNTFCCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IDENTIFICACIONES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_IDNTFCCION_TPO as d,',
'       CDGO_IDNTFCCION_TPO as r',
'  from DF_S_IDENTIFICACIONES_TIPO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(29996430207317116)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el tipo de identificaci\00F3n.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138178348594117635)
,p_name=>'P998_IDNTFCCION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(272013901366424393)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00B0 Documento')
,p_source=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>25
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumero'')" onkeyup="campoMayuscula(this)" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29996430207317116)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero de identificaci\00F3n')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138179219239117636)
,p_name=>'P998_PRMER_NMBRE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(272013901366424393)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Primer Nombre'
,p_source=>'PRMER_NMBRE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"onkeypress="return validarExpresion(event, ''letra'');"'
,p_field_template=>wwv_flow_api.id(29996430207317116)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese el primer nombre'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138180106325117636)
,p_name=>'P998_SGNDO_NMBRE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(272013901366424393)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Segundo Nombre'
,p_source=>'SGNDO_NMBRE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"onkeypress="return validarExpresion(event, ''letra'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese el segundo nombre'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138181090944117637)
,p_name=>'P998_PRMER_APLLDO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(272013901366424393)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Primer Apellido'
,p_source=>'PRMER_APLLDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"onkeypress="return validarExpresion(event, ''letra'');"'
,p_field_template=>wwv_flow_api.id(29996430207317116)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese primer apellido'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138181934284117638)
,p_name=>'P998_SGNDO_APLLDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(272013901366424393)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Segundo Apellido'
,p_source=>'SGNDO_APLLDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"onkeypress="return validarExpresion(event, ''letra'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese segundo apellido'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138182801328117638)
,p_name=>'P998_ID_PAIS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(272013901366424393)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Pa\00EDs')
,p_source=>'ID_PAIS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_PAIS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_pais as d,',
'       id_pais  as r',
'  from df_s_paises',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el pa\00EDs de residencia')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138183783832117639)
,p_name=>'P998_ID_DPRTMNTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(272013901366424393)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Departamento'
,p_source=>'ID_DPRTMNTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_dprtmnto d , id_dprtmnto r from df_s_departamentos',
'where id_pais = :P998_ID_PAIS'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P998_ID_PAIS'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el departamento de residencia'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138184655411117639)
,p_name=>'P998_ID_MNCPIO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(272013901366424393)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Municipio'
,p_source=>'ID_MNCPIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_mncpio , id_mncpio from df_s_municipios',
'where id_dprtmnto = :P998_ID_DPRTMNTO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P998_ID_DPRTMNTO'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el municipio de residencia'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138185567421117640)
,p_name=>'P998_DRCCION'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(272013901366424393)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Direcci\00F3n')
,p_source=>'DRCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la direcci\00F3n de residencia ')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138186470399117640)
,p_name=>'P998_ID_PAIS_NTFCCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(272013901366424393)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Pa\00EDs Notificaci\00F3n')
,p_source=>'ID_PAIS_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_PAIS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_pais as d,',
'       id_pais  as r',
'  from df_s_paises',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Ingrese pa\00EDs de notificaci\00F3n')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138187359779117642)
,p_name=>'P998_ID_DPRTMNTO_NTFCCION'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(272013901366424393)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Departamento Notificaci\00F3n')
,p_source=>'ID_DPRTMNTO_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_dprtmnto d , id_dprtmnto r from df_s_departamentos',
'where id_pais = :P998_ID_PAIS_NTFCCION'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P998_ID_PAIS_NTFCCION'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Ingrese departamento de notificaci\00F3n')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138188260746117642)
,p_name=>'P998_ID_MNCPIO_NTFCCION'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(272013901366424393)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Municipio Notificaci\00F3n')
,p_source=>'ID_MNCPIO_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_mncpio d, id_mncpio r from df_s_municipios',
'where id_dprtmnto = :P998_ID_DPRTMNTO_NTFCCION'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P998_ID_DPRTMNTO_NTFCCION'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Ingrese municipio de notificaci\00F3n.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138189161731117643)
,p_name=>'P998_DRCCION_NTFCCION'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(272013901366424393)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Direcci\00F3n Notificaci\00F3n')
,p_source=>'DRCCION_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>29
,p_cMaxlength=>100
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese direcci\00F3n de notificaci\00F3n.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138190011771117643)
,p_name=>'P998_EMAIL'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(272013901366424393)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Email'
,p_source=>'EMAIL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>320
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Ingrese email en formato usuario@mail.com'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138190932417117644)
,p_name=>'P998_TLFNO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(272013901366424393)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Tel\00E9fono')
,p_source=>'TLFNO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>11
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese n\00FAmero telef\00F3nico. Solo permite n\00FAmeros.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138191867540117644)
,p_name=>'P998_CLLAR'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(272013901366424393)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Celular'
,p_source=>'CLLAR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138192295499117645)
,p_name=>'P998_SEXO'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(272013901366424393)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Genero'
,p_source=>'GNRO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'M'
,p_attribute_03=>'Masculino'
,p_attribute_04=>'F'
,p_attribute_05=>'Femenino'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138195643205117646)
,p_name=>'P998_ID_PAIS_ORGN'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(272013901366424393)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Pa\00EDs Origen')
,p_source=>'ID_PAIS_ORGN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_PAIS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_pais as d,',
'       id_pais  as r',
'  from df_s_paises',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el pa\00EDs de nacimiento')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200px'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138196553866117647)
,p_name=>'P998_NCNLDAD'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(272013901366424393)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nacionalidad'
,p_source=>'NCNLDAD'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese la nacionalidad.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138197431357117648)
,p_name=>'P998_FCHA_NCMNTO'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(272013901366424393)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Nacimiento'
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'FCHA_NCMNTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>10
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese la fecha de nacimiento en formato DD/MM/YYYY. Ejemplo 01/01/1900'
,p_attribute_03=>'+0d'
,p_attribute_04=>'focus'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(138203534858117654)
,p_validation_name=>'P998_FCHA_NCMNTO must be timestamp'
,p_validation_sequence=>250
,p_validation=>'P998_FCHA_NCMNTO'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_api.id(138197431357117648)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(138203900893117654)
,p_validation_name=>unistr('Validar Numero de Identificaci\00F3n no exista')
,p_validation_sequence=>260
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from v_si_c_terceros_portal',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and idntfccion = :P998_IDNTFCCION;'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>unistr('Ya existe un tercero con la identificaci\00F3n creada, por favor verifique!!!')
,p_when_button_pressed=>wwv_flow_api.id(138201033990117651)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(138201563744117652)
,p_validation_name=>'formato email'
,p_validation_sequence=>270
,p_validation=>'P998_EMAIL'
,p_validation2=>'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>'Sr(a). Usuario(a), el Email no cumple con el formato, favor ingresar Email de acuerdo a la estructura usuario@mail.com'
,p_associated_item=>wwv_flow_api.id(138190011771117643)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(138201962203117653)
,p_validation_name=>'Celular Valido'
,p_validation_sequence=>280
,p_validation=>'P998_CLLAR'
,p_validation2=>'^[3][0-9]{9}$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>unistr('El n\00FAmero debe iniciar por el n\00FAmero tres (3) seguido de 9 n\00FAmeros m\00E1s')
,p_associated_item=>wwv_flow_api.id(138191867540117644)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(138202368155117653)
,p_validation_name=>'Telefono Valido'
,p_validation_sequence=>290
,p_validation=>'P998_TLFNO'
,p_validation2=>'^(\([0-9]\)-[0-9]{7}$)|^[0-9]{8}$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>unistr('El n\00FAmero debe iniciar por el indicativo seguido de 7 n\00FAmeros m\00E1s o cumplir con el formato (C)-NNNNNNN')
,p_validation_condition_type=>'NEVER'
,p_associated_item=>wwv_flow_api.id(138190932417117644)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(138202733918117654)
,p_validation_name=>'Validar Telefono'
,p_validation_sequence=>300
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return pkg_gn_generalidades.fnc_vl_expresion( p_cdgo_exp   => ''CC1'' ',
'                                            , p_vlor       => :P998_TLFNO ',
'                                            , p_cdgo_clnte => :F_CDGO_CLNTE',
'                                            );'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'P998_TLFNO'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_associated_item=>wwv_flow_api.id(138190932417117644)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(138205844350117656)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(138199869630117649)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(138206325172117656)
,p_event_id=>wwv_flow_api.id(138205844350117656)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(138206757011117656)
,p_name=>'Cambiar elemento'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P998_TLFNO'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(''P998_TLFNO'').length == 8'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(138207264244117657)
,p_event_id=>wwv_flow_api.id(138206757011117656)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log($v(''P998_TLFNO'').length);',
'var regex = /^\([0-9]{1}\)-[0-9]{7}$/;',
'var pass = $v(''P998_TLFNO'');',
'if (!regex.test(pass)) {',
'    var x = $v(''P998_TLFNO'').substr(0, 1);',
'    var y = $v(''P998_TLFNO'').substr(1,7)',
'    var z = ''(''+x+'')-''+y; ',
'    console.log(''Z: ''+z);',
'    apex.item(''P998_TLFNO'').setValue(z);',
'    apex.message.clearErrors();',
'   ',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(138204217876117654)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from SI_C_TERCEROS_PORTAL'
,p_attribute_02=>'SI_C_TERCEROS_PORTAL'
,p_attribute_03=>'P998_ID_TRCRO_PRTAL'
,p_attribute_04=>'ID_TRCRO_PRTAL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(138204674268117655)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of SI_C_TERCEROS'
,p_attribute_02=>'SI_C_TERCEROS_PORTAL'
,p_attribute_03=>'P998_ID_TRCRO_PRTAL'
,p_attribute_04=>'ID_TRCRO_PRTAL'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Se han guardado los cambios.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(138205018787117655)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(138200259259117651)
,p_process_is_stateful_y_n=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(138205412404117655)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(138199869630117649)
,p_process_when=>'CREATE,SAVE,DELETE,CANCEL'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
