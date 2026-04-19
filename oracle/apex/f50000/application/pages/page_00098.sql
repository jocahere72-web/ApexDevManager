prompt --application/pages/page_00098
begin
wwv_flow_api.create_page(
 p_id=>98
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>unistr('Gesti\00F3n de grupos de veh\00EDculos')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Gesti\00F3n de grupos de veh\00EDculos')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
''))
,p_javascript_code=>unistr('var htmldb_delete_message=''"\00BFEst\00E1 seguro de eliminar el registro?"'';')
,p_javascript_code_onload=>'mostrarAyudaD();'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'ELAFAURIE'
,p_last_upd_yyyymmddhh24miss=>'20191209174051'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(99935354184052595)
,p_plug_name=>unistr('Gesti\00F3n de grupos de veh\00EDculos')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29530253509068499)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(99936088736052599)
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
 p_id=>wwv_flow_api.id(99936433765052599)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(99936088736052599)
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
 p_id=>wwv_flow_api.id(99935931741052599)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(99936088736052599)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P98_ID_VHCLO_GRPO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(99935864471052599)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(99936088736052599)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P98_ID_VHCLO_GRPO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(99935739005052599)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(99936088736052599)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P98_ID_VHCLO_GRPO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96898917725650736)
,p_name=>'P98_CLSE_VHCLO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(99935354184052595)
,p_prompt=>unistr('Clase de Veh\00EDculo')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_CLASES_VEHICULOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NMBRE_VHCLO_CLSE  as d,',
'       CDGO_VHCLO_CLSE   as r',
'  from DF_S_VEHICULOS_CLASE',
' order by 1',
' ',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista la clase de veh\00EDculo.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99938855482052606)
,p_name=>'P98_ID_VHCLO_GRPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(99935354184052595)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_VHCLO_GRPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99939201605052631)
,p_name=>'P98_VGNCIA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(99935354184052595)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Vigencia'
,p_source=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>5
,p_grid_column=>4
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Vigencia Seleccionada'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99939671382052634)
,p_name=>'P98_ID_VHCLO_CLSE_CTGRIA'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(99935354184052595)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Categor\00EDa')
,p_source=>'ID_VHCLO_CLSE_CTGRIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select nmbre_vhclo_ctgtria,',
'         id_vhclo_clse_ctgria',
'  from v_df_s_vehiculos_clase_ctgria',
' where vgncia = :P98_VGNCIA',
'   and cdgo_vhclo_clse = :P98_CLSE_VHCLO',
' order by nmbre_vhclo_ctgtria;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P98_CLSE_VHCLO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista la categor\00EDa del veh\00EDculo.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99940081100052634)
,p_name=>'P98_CDGO_VHCLO_MRCA'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(99935354184052595)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Marca'
,p_source=>'CDGO_VHCLO_MRCA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_MARCAS_VEHICULOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_vhclo_mrca as d,',
'       cdgo_vhclo_mrca  as r',
'  from df_s_vehiculos_marca',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista la marca del veh\00EDculo')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99940406271052634)
,p_name=>'P98_ID_VHCLO_LNEA'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(99935354184052595)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('L\00EDnea')
,p_source=>'ID_VHCLO_LNEA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select dscrpcion_vhclo_lnea,',
'	     id_vhclo_lnea',
'  from df_s_vehiculos_linea',
' where vgncia = :P98_VGNCIA',
'   and cdgo_vhclo_mrca = :P98_CDGO_VHCLO_MRCA',
'order by dscrpcion_vhclo_lnea;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P98_CDGO_VHCLO_MRCA'
,p_ajax_items_to_submit=>'P98_VGNCIA'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Seleccione de la lista la l\00EDnea del veh\00EDculo')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99940826427052635)
,p_name=>'P98_CLNDRJE_DSDE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(99935354184052595)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Cilindraje Inicial'
,p_source=>'CLNDRJE_DSDE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>12
,p_cMaxlength=>6
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');" '
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione de la lista el cilindraje inicial del veh\00EDculo')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99941239499052635)
,p_name=>'P98_CLNDRJE_HSTA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(99935354184052595)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Cilindraje Final'
,p_source=>'CLNDRJE_HSTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>12
,p_cMaxlength=>6
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione de la lista el cilindraje final del veh\00EDculo')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99941650701052635)
,p_name=>'P98_CPCDAD_DSDE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(99935354184052595)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Capacidad Inicial'
,p_format_mask=>'999G999D99'
,p_source=>'CPCDAD_DSDE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_cMaxlength=>8
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroComa'');" onkeyup="formatNumber(event,{ precision: 2, thousand: ''.'',decimal: '','' });"'
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione de la lista la capacidad inicial del veh\00EDculo')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99942021271052637)
,p_name=>'P98_CPCDAD_HSTA'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(99935354184052595)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Capacidad Final'
,p_format_mask=>'999G999D99'
,p_source=>'CPCDAD_HSTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_cMaxlength=>8
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroComa'');" onkeyup="formatNumber(event,{ precision: 2, thousand: ''.'',decimal: '','' });" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione de la lista la capacidad final del veh\00EDculo.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99942494627052637)
,p_name=>'P98_CDGO_VHCLO_SRVCIO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(99935354184052595)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Servicio'
,p_source=>'CDGO_VHCLO_SRVCIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SERVICIO_VEHICULOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_SRVCIO  as d,',
'       CDGO_VHCLO_SRVCIO as r',
'  from DF_S_VEHICULOS_SERVICIO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista el tipo de servicio del veh\00EDculo.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99942813463052638)
,p_name=>'P98_CDGO_VHCLO_OPRCION'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(99935354184052595)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Operaci\00F3n')
,p_source=>'CDGO_VHCLO_OPRCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_OPERACION_VEHICULOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_OPRCION as d,',
'       CDGO_VHCLO_OPRCION as r',
'  from DF_S_VEHICULOS_OPERACION',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista la operaci\00F3n del veh\00EDculo.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99943249316052638)
,p_name=>'P98_CDGO_VHCLO_CRRCRIA'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(99935354184052595)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Carrocer\00EDa')
,p_source=>'CDGO_VHCLO_CRRCRIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_CARROCERIA'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_CRROCRIA as d,',
'       CDGO_VHCLO_CRRCRIA as r',
'  from DF_S_VEHICULOS_CARROCERIA',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista el tipo de carrocer\00EDa del veh\00EDculo.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99943623987052638)
,p_name=>'P98_GRPO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(99935354184052595)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Grupo'
,p_source=>'GRPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>5
,p_cMaxlength=>3
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"  onkeypress="return validarExpresion(event, ''letraNumero'');"'
,p_colspan=>5
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el nombre del grupo al que corresponden los veh\00EDculos.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(109556093034986203)
,p_validation_name=>'Cilindraje final mayor que cilindraje inicial'
,p_validation_sequence=>10
,p_validation=>'TO_NUMBER(:P98_CLNDRJE_HSTA) > TO_NUMBER(:P98_CLNDRJE_DSDE)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'El cilindraje final debe ser mayor que el cilindraje inicial'
,p_validation_condition=>'SAVE, CREATE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(99941239499052635)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(109556129744986204)
,p_validation_name=>'Capacidad final mayor que capacidad inicial'
,p_validation_sequence=>20
,p_validation=>'TO_NUMBER(:P98_CPCDAD_HSTA ,''FM99999999999D99'' ) > TO_NUMBER(:P98_CPCDAD_DSDE ,''FM99999999999D99'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'La capacidad final debe ser mayor que la capacidad inicial'
,p_validation_condition=>'SAVE, CREATE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(99942021271052637)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(99936553653052599)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(99936433765052599)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(99937303649052604)
,p_event_id=>wwv_flow_api.id(99936553653052599)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(99944469716052641)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from DF_S_VEHICULOS_GRUPO'
,p_attribute_02=>'DF_S_VEHICULOS_GRUPO'
,p_attribute_03=>'P98_ID_VHCLO_GRPO'
,p_attribute_04=>'ID_VHCLO_GRPO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(99944859849052644)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of DF_S_VEHICULOS_GRUPO'
,p_attribute_02=>'DF_S_VEHICULOS_GRUPO'
,p_attribute_03=>'P98_ID_VHCLO_GRPO'
,p_attribute_04=>'ID_VHCLO_GRPO'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(99945215710052644)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(99935931741052599)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(99945619326052644)
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
