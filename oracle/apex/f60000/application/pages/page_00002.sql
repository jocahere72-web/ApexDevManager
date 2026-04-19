prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(103265655096132800)
,p_name=>'Tercero'
,p_page_mode=>'MODAL'
,p_step_title=>'Tercero'
,p_autocomplete_on_off=>'ON'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>unistr('var htmldb_delete_message=''\00BFEst\00E1 seguro que deseea eliminar el registro?'';')
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'600'
,p_dialog_width=>'80%'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20200822201056'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(133837894274306768)
,p_plug_name=>'Tercero'
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
 p_id=>wwv_flow_api.id(133838572902306772)
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
 p_id=>wwv_flow_api.id(133838936531306772)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(133838572902306772)
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
 p_id=>wwv_flow_api.id(133838459062306772)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(133838572902306772)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P2_ID_TRCRO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(133838318716306772)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(133838572902306772)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P2_ID_TRCRO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(133838214216306772)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(133838572902306772)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P2_ID_TRCRO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76091460612885033)
,p_name=>'P2_CDGO_TRCRO_TPO'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo de Tercero'
,p_source=>'CDGO_TRCRO_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_TERCERO_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_trcro_tpo as r',
'  from df_s_terceros_tipo',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(85474166710506102)
,p_name=>'P2_SEXO'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
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
 p_id=>wwv_flow_api.id(133841633427306839)
,p_name=>'P2_ID_TRCRO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Trcro'
,p_source=>'ID_TRCRO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(133842009355306865)
,p_name=>'P2_CDGO_CLNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
,p_use_cache_before_default=>'NO'
,p_item_default=>'&F_CDGO_CLNTE.'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(133842304626306869)
,p_name=>'P2_CDGO_IDNTFCCION_TPO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
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
 p_id=>wwv_flow_api.id(133842790821306870)
,p_name=>'P2_IDNTFCCION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
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
 p_id=>wwv_flow_api.id(133843102152306870)
,p_name=>'P2_PRMER_NMBRE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
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
 p_id=>wwv_flow_api.id(133843599489306870)
,p_name=>'P2_SGNDO_NMBRE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
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
 p_id=>wwv_flow_api.id(133843911173306871)
,p_name=>'P2_PRMER_APLLDO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
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
 p_id=>wwv_flow_api.id(133844390686306871)
,p_name=>'P2_SGNDO_APLLDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
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
 p_id=>wwv_flow_api.id(133844783952306871)
,p_name=>'P2_DRCCION'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
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
 p_id=>wwv_flow_api.id(133845168291306871)
,p_name=>'P2_ID_PAIS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
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
 p_id=>wwv_flow_api.id(133845533817306872)
,p_name=>'P2_ID_DPRTMNTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Departamento'
,p_source=>'ID_DPRTMNTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_dprtmnto d , id_dprtmnto r from df_s_departamentos',
'where id_pais = :P2_ID_PAIS'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P2_ID_PAIS'
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
 p_id=>wwv_flow_api.id(133845934239306872)
,p_name=>'P2_ID_MNCPIO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Municipio'
,p_source=>'ID_MNCPIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_mncpio , id_mncpio from df_s_municipios',
'where id_dprtmnto = :P2_ID_DPRTMNTO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P2_ID_DPRTMNTO'
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
 p_id=>wwv_flow_api.id(133846344809306872)
,p_name=>'P2_DRCCION_NTFCCION'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
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
 p_id=>wwv_flow_api.id(133846759094306873)
,p_name=>'P2_ID_PAIS_NTFCCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
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
 p_id=>wwv_flow_api.id(133847170244306874)
,p_name=>'P2_ID_DPRTMNTO_NTFCCION'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Departamento Notificaci\00F3n')
,p_source=>'ID_DPRTMNTO_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_dprtmnto d , id_dprtmnto r from df_s_departamentos',
'where id_pais = :P2_ID_PAIS_NTFCCION'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P2_ID_PAIS_NTFCCION'
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
 p_id=>wwv_flow_api.id(133847530738306874)
,p_name=>'P2_ID_MNCPIO_NTFCCION'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Municipio Notificaci\00F3n')
,p_source=>'ID_MNCPIO_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_mncpio d, id_mncpio r from df_s_municipios',
'where id_dprtmnto = :P2_ID_DPRTMNTO_NTFCCION'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P2_ID_DPRTMNTO_NTFCCION'
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
 p_id=>wwv_flow_api.id(133847902875306874)
,p_name=>'P2_EMAIL'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
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
 p_id=>wwv_flow_api.id(133848334771306875)
,p_name=>'P2_TLFNO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
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
 p_id=>wwv_flow_api.id(133848705530306875)
,p_name=>'P2_GRFRNCCION'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
,p_use_cache_before_default=>'NO'
,p_source=>'GRFRNCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(133849564186306876)
,p_name=>'P2_FILE_BLOB'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Archivo'
,p_source=>'FILE_BLOB'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>60
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Haga clic y seleccione en su disco local el archivo que desea adjuntar.'
,p_attribute_01=>'DB_COLUMN'
,p_attribute_06=>'Y'
,p_attribute_08=>'attachment'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(133849964363306876)
,p_name=>'P2_FILE_NAME'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
,p_use_cache_before_default=>'NO'
,p_source=>'FILE_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(133850324917306876)
,p_name=>'P2_FILE_MIMETYPE'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
,p_use_cache_before_default=>'NO'
,p_source=>'FILE_MIMETYPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(133850763303306877)
,p_name=>'P2_CLLAR'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
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
 p_id=>wwv_flow_api.id(133851121392306877)
,p_name=>'P2_NCNLDAD'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
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
 p_id=>wwv_flow_api.id(133851548088306877)
,p_name=>'P2_FCHA_NCMNTO'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(133852396613306878)
,p_name=>'P2_ID_PAIS_ORGN'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
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
 p_id=>wwv_flow_api.id(133852752017306878)
,p_name=>'P2_ID_PRFSION'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Profesi\00F3n')
,p_source=>'ID_PRFSION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>'select nmbre_prfsion d, id_prfsion R from df_s_profesiones'
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista la profesi\00F3n correspondiente')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(133853143126306878)
,p_name=>'P2_INDCDOR_CNTRBYNTE'
,p_is_required=>true
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFContribuyente?')
,p_source=>'INDCDOR_CNTRBYNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29996430207317116)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(133853550107306879)
,p_name=>'P2_INDCDR_FNCNRIO'
,p_is_required=>true
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(133837894274306768)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFFuncionario?')
,p_source=>'INDCDR_FNCNRIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(29996430207317116)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(133849231699306876)
,p_validation_name=>'P2_GRFRNCCION must be timestamp'
,p_validation_sequence=>190
,p_validation=>'P2_GRFRNCCION'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_api.id(133848705530306875)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(133852014902306878)
,p_validation_name=>'P2_FCHA_NCMNTO must be timestamp'
,p_validation_sequence=>250
,p_validation=>'P2_FCHA_NCMNTO'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_api.id(133851548088306877)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(146572410410615236)
,p_validation_name=>unistr('Validar Numero de Identificaci\00F3n no exista')
,p_validation_sequence=>260
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from v_si_c_terceros',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and idntfccion = :P2_IDNTFCCION;'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>unistr('Ya existe un tercero con la identificaci\00F3n creada, por favor verifique!!!')
,p_when_button_pressed=>wwv_flow_api.id(133838214216306772)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(22330176838400720)
,p_validation_name=>'formato email'
,p_validation_sequence=>270
,p_validation=>'P2_EMAIL'
,p_validation2=>'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>'Sr(a). Usuario(a), el Email no cumple con el formato, favor ingresar Email de acuerdo a la estructura usuario@mail.com'
,p_associated_item=>wwv_flow_api.id(133847902875306874)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(85474253225506103)
,p_validation_name=>'Celular Valido'
,p_validation_sequence=>280
,p_validation=>'P2_CLLAR'
,p_validation2=>'^[3][0-9]{9}$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>unistr('El n\00FAmero debe iniciar por el n\00FAmero tres (3) seguido de 9 n\00FAmeros m\00E1s')
,p_associated_item=>wwv_flow_api.id(133850763303306877)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(85474347120506104)
,p_validation_name=>'Telefono Valido'
,p_validation_sequence=>290
,p_validation=>'P2_TLFNO'
,p_validation2=>'^(\([0-9]\)-[0-9]{7}$)|^[0-9]{8}$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>unistr('El n\00FAmero debe iniciar por el indicativo seguido de 7 n\00FAmeros m\00E1s o cumplir con el formato (C)-NNNNNNN')
,p_validation_condition_type=>'NEVER'
,p_associated_item=>wwv_flow_api.id(133848334771306875)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(85474860557506109)
,p_validation_name=>'Validar Telefono'
,p_validation_sequence=>300
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return pkg_gn_generalidades.fnc_vl_expresion( p_cdgo_exp   => ''CC1'' ',
'                                            , p_vlor       => :P2_TLFNO ',
'                                            , p_cdgo_clnte => :F_CDGO_CLNTE',
'                                            );'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'P2_TLFNO'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_associated_item=>wwv_flow_api.id(133848334771306875)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(133839014205306772)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(133838936531306772)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(133839847793306775)
,p_event_id=>wwv_flow_api.id(133839014205306772)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(85474665269506107)
,p_name=>'Cambiar elemento'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_TLFNO'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(''P2_TLFNO'').length == 8'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(85474793717506108)
,p_event_id=>wwv_flow_api.id(85474665269506107)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log($v(''P2_TLFNO'').length);',
'var regex = /^\([0-9]{1}\)-[0-9]{7}$/;',
'var pass = $v(''P2_TLFNO'');',
'if (!regex.test(pass)) {',
'    var x = $v(''P2_TLFNO'').substr(0, 1);',
'    var y = $v(''P2_TLFNO'').substr(1,7)',
'    var z = ''(''+x+'')-''+y; ',
'    console.log(''Z: ''+z);',
'    apex.item(''P2_TLFNO'').setValue(z);',
'    apex.message.clearErrors();',
'   ',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(133854315387306881)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from SI_C_TERCEROS'
,p_attribute_02=>'SI_C_TERCEROS'
,p_attribute_03=>'P2_ID_TRCRO'
,p_attribute_04=>'ID_TRCRO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(133854780464306881)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of SI_C_TERCEROS'
,p_attribute_02=>'SI_C_TERCEROS'
,p_attribute_03=>'P2_ID_TRCRO'
,p_attribute_04=>'ID_TRCRO'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Se han guardado los cambios.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(133855103578306881)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(133838459062306772)
,p_process_is_stateful_y_n=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(133855578372306881)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(133838936531306772)
,p_process_when=>'CREATE,SAVE,DELETE,CANCEL'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
