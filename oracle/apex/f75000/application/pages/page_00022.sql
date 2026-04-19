prompt --application/pages/page_00022
begin
wwv_flow_api.create_page(
 p_id=>22
,p_user_interface_id=>wwv_flow_api.id(237318207209524256)
,p_name=>unistr('Gesti\00F3n de Grupos a Veh\00EDculos')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Gesti\00F3n de Grupos a Veh\00EDculos')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
''))
,p_javascript_code=>unistr('var htmldb_delete_message=''"\00BFEst\00E1 seguro de eliminar el registro?"'';')
,p_javascript_code_onload=>'mostrarAyudaD();'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'ELAFAURIE'
,p_last_upd_yyyymmddhh24miss=>'20210104155026'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(186603786724599403)
,p_plug_name=>unistr('Gesti\00F3n de Grupos de Veh\00EDculos')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(237222694005524189)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(186604521276599407)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(237223716104524190)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(86681460683546841)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(186604521276599407)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(237296397635524233)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(86681888876546842)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(186604521276599407)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(237296397635524233)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P22_ID_VHCLO_GRPO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(86682201029546842)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(186604521276599407)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(237296397635524233)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P22_ID_VHCLO_GRPO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(86682652516546843)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(186604521276599407)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(237296397635524233)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P22_ID_VHCLO_GRPO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(95193556914075736)
,p_branch_name=>unistr('Ir a P\00E1gina 7')
,p_branch_action=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'CANCEL,DELETE,SAVE,CREATE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86669078979546822)
,p_name=>'P22_ID_VHCLO_GRPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(186603786724599403)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_VHCLO_GRPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86669450419546824)
,p_name=>'P22_VGNCIA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(186603786724599403)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Vigencia'
,p_source=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>6
,p_grid_column=>4
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Vigencia Seleccionada'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86670382608546830)
,p_name=>'P22_GRPO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(186603786724599403)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Grupo'
,p_source=>'GRPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>50
,p_cMaxlength=>10
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_field_template=>wwv_flow_api.id(237296017260524231)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero del grupo al que corresponden los veh\00EDculos.')
,p_attribute_03=>'left'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86671288099546831)
,p_name=>'P22_CDGO_VHCLO_SRVCIO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(186603786724599403)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Servicio'
,p_source=>'CDGO_VHCLO_SRVCIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_SERVICIO_VEHICULOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_SRVCIO  as d,',
'       CDGO_VHCLO_SRVCIO as r',
'  from DF_S_VEHICULOS_SERVICIO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(237295687231524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista el tipo de servicio del veh\00EDculo.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86672165219546832)
,p_name=>'P22_CLSE_VHCLO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(186603786724599403)
,p_prompt=>unistr('Clase de Veh\00EDculo')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_CLASES_VEHICULOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_CLSE  as d,',
'       CDGO_VHCLO_CLSE   as r',
'  from DF_S_VEHICULOS_CLASE',
' order by 1',
' ',
''))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(237296017260524231)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista la clase de veh\00EDculo.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86673076927546833)
,p_name=>'P22_ID_VHCLO_CLSE_CTGRIA'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(186603786724599403)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Categor\00EDa')
,p_source=>'ID_VHCLO_CLSE_CTGRIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select dscrpcion_vhclo_ctgtria',
'       , id_vhclo_clse_ctgria',
'    from v_df_s_vehiculos_clase_ctgria',
'   where vgncia          = :P22_VGNCIA',
'     and cdgo_vhclo_clse = :P22_CLSE_VHCLO',
'   order by dscrpcion_vhclo_ctgtria;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P22_CLSE_VHCLO,P22_VGNCIA'
,p_ajax_items_to_submit=>'P22_ID_VHCLO_CLSE_CTGRIA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237296017260524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista la categor\00EDa del veh\00EDculo.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86673972880546834)
,p_name=>'P22_CDGO_VHCLO_MRCA'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(186603786724599403)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Marca'
,p_source=>'CDGO_VHCLO_MRCA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_MARCAS_VEHICULOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_vhclo_mrca as d,',
'       cdgo_vhclo_mrca  as r',
'  from df_s_vehiculos_marca',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(237296017260524231)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista la marca del veh\00EDculo')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86674823327546834)
,p_name=>'P22_ID_VHCLO_LNEA'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(186603786724599403)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('L\00EDnea')
,p_source=>'ID_VHCLO_LNEA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select dscrpcion_vhclo_lnea,',
'	 id_vhclo_lnea',
'    from df_s_vehiculos_linea',
'   where cdgo_vhclo_mrca = :P22_CDGO_VHCLO_MRCA',
'   order by dscrpcion_vhclo_lnea;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P22_CDGO_VHCLO_MRCA'
,p_ajax_items_to_submit=>'P22_VGNCIA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237296017260524231)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Seleccione de la lista la l\00EDnea del veh\00EDculo')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86675773896546834)
,p_name=>'P22_CDGO_VHCLO_CRRCRIA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(186603786724599403)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Carrocer\00EDa')
,p_source=>'CDGO_VHCLO_CRRCRIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_CARROCERIA'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_CRROCRIA as d,',
'       CDGO_VHCLO_CRRCRIA as r',
'  from DF_S_VEHICULOS_CARROCERIA',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(237295687231524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista el tipo de carrocer\00EDa del veh\00EDculo.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86676658447546835)
,p_name=>'P22_CDGO_VHCLO_OPRCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(186603786724599403)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Operaci\00F3n')
,p_source=>'CDGO_VHCLO_OPRCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_OPERACION_VEHICULOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_OPRCION as d,',
'       CDGO_VHCLO_OPRCION as r',
'  from DF_S_VEHICULOS_OPERACION',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295687231524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista la operaci\00F3n del veh\00EDculo.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86677509225546835)
,p_name=>'P22_CLNDRJE_DSDE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(186603786724599403)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Cilindraje Inicial'
,p_source=>'CLNDRJE_DSDE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>12
,p_cMaxlength=>6
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');" '
,p_field_template=>wwv_flow_api.id(237295687231524231)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione de la lista el cilindraje inicial del veh\00EDculo')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86678405365546837)
,p_name=>'P22_CLNDRJE_HSTA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(186603786724599403)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Cilindraje Final'
,p_source=>'CLNDRJE_HSTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>12
,p_cMaxlength=>6
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295687231524231)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione de la lista el cilindraje final del veh\00EDculo')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86679349937546838)
,p_name=>'P22_CPCDAD_DSDE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(186603786724599403)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Capacidad Inicial'
,p_source=>'CPCDAD_DSDE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>12
,p_cMaxlength=>8
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumero'')" onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(237295687231524231)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione de la lista la capacidad inicial del veh\00EDculo')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86680208064546839)
,p_name=>'P22_CPCDAD_HSTA'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(186603786724599403)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Capacidad Final'
,p_source=>'CPCDAD_HSTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>12
,p_cMaxlength=>8
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumero'')" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295687231524231)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione de la lista la capacidad final del veh\00EDculo.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(86683104806546853)
,p_validation_name=>'Cilindraje final mayor que cilindraje inicial'
,p_validation_sequence=>10
,p_validation=>'TO_NUMBER(:P22_CLNDRJE_HSTA) >= TO_NUMBER(:P22_CLNDRJE_DSDE)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'El cilindraje final debe ser mayor que el cilindraje inicial'
,p_validation_condition=>'SAVE, CREATE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(86678405365546837)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(86683534920546853)
,p_validation_name=>'Capacidad final mayor que capacidad inicial'
,p_validation_sequence=>20
,p_validation=>'TO_NUMBER(:P22_CPCDAD_HSTA) >= TO_NUMBER(:P22_CPCDAD_DSDE)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'La capacidad final debe ser mayor que la capacidad inicial'
,p_validation_condition=>'SAVE, CREATE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(86680208064546839)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(86685499683546854)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(86681460683546841)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(86685926090546855)
,p_event_id=>wwv_flow_api.id(86685499683546854)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(86683846274546853)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from DF_S_VEHICULOS_GRUPO'
,p_attribute_02=>'DF_S_VEHICULOS_GRUPO'
,p_attribute_03=>'P22_ID_VHCLO_GRPO'
,p_attribute_04=>'ID_VHCLO_GRPO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(86684264250546853)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of DF_S_VEHICULOS_GRUPO'
,p_attribute_02=>'DF_S_VEHICULOS_GRUPO'
,p_attribute_03=>'P22_ID_VHCLO_GRPO'
,p_attribute_04=>'ID_VHCLO_GRPO'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n Procesada.  ')
);
end;
/
