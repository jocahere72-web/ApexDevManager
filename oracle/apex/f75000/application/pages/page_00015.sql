prompt --application/pages/page_00015
begin
wwv_flow_api.create_page(
 p_id=>15
,p_user_interface_id=>wwv_flow_api.id(237318207209524256)
,p_name=>unistr('Gesti\00F3n de Excepciones a Veh\00EDculos')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Gesti\00F3n de Excepciones a Veh\00EDculos')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20201230100119'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(192854795665880122)
,p_plug_name=>'VEHICULOS EXCEPCION'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(237222694005524189)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(192855398659880165)
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
 p_id=>wwv_flow_api.id(83092030539298087)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(192855398659880165)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(237296397635524233)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(83092409877298088)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(192855398659880165)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(237296397635524233)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P15_ID_VHCLO_EXCPCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(83092818773298088)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(192855398659880165)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(237296397635524233)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P15_ID_VHCLO_EXCPCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(83093299667298088)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(192855398659880165)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(237296397635524233)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P15_ID_VHCLO_EXCPCION'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(91985265728340508)
,p_branch_name=>unistr('Ir a P\00E1gina 14')
,p_branch_action=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:RP,14::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'SAVE,DELETE,CREATE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83086175467298076)
,p_name=>'P15_ID_VHCLO_EXCPCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(192854795665880122)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_VHCLO_EXCPCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83086537635298077)
,p_name=>'P15_VGNCIA'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(192854795665880122)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Vigencia'
,p_source=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83086954772298077)
,p_name=>'P15_CDGO_VHCLO_MRCA'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(192854795665880122)
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
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83087370069298080)
,p_name=>'P15_CDGO_VHCLO_CLSE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(192854795665880122)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Clase'
,p_source=>'CDGO_VHCLO_CLSE'
,p_source_type=>'DB_COLUMN'
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
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83087768463298080)
,p_name=>'P15_CDGO_VHCLO_CRRCRIA'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(192854795665880122)
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
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83088190178298080)
,p_name=>'P15_CDGO_VHCLO_OPRCION'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(192854795665880122)
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
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83088503911298081)
,p_name=>'P15_CDGO_VHCLO_SRVCIO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(192854795665880122)
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
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83088940650298081)
,p_name=>'P15_CLNDRJE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(192854795665880122)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Cilindraje'
,p_source=>'CLNDRJE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>6
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83089367539298081)
,p_name=>'P15_GRPO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(192854795665880122)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Grupo'
,p_source=>'GRPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>3
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumero'')" onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83089714967298081)
,p_name=>'P15_ID_VHCLO_LNEA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(192854795665880122)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('L\00EDnea ')
,p_source=>'ID_VHCLO_LNEA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select dscrpcion_vhclo_lnea,',
'	     id_vhclo_lnea',
'    from df_s_vehiculos_linea',
'   where cdgo_vhclo_mrca = :P15_CDGO_VHCLO_MRCA',
'   order by dscrpcion_vhclo_lnea;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P15_CDGO_VHCLO_MRCA'
,p_ajax_items_to_submit=>'P15_CDGO_VHCLO_MRCA,P15_ID_VHCLO_LNEA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83090169398298081)
,p_name=>'P15_CPCDAD_DSDE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(192854795665880122)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Capacidad Desde'
,p_source=>'CPCDAD_DSDE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>8
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumero'')" onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83090501106298086)
,p_name=>'P15_CPCDAD_HSTA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(192854795665880122)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Capacidad Hasta'
,p_source=>'CPCDAD_HSTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>8
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumero'')" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83090972689298087)
,p_name=>'P15_MDLO_DSDE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(192854795665880122)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Modelo Desde'
,p_source=>'MDLO_DSDE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>4
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83091354137298087)
,p_name=>'P15_MDLO_HSTA'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(192854795665880122)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Modelo Hasta'
,p_source=>'MDLO_HSTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>4
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(85477627359506137)
,p_validation_name=>'Capacidad hasta mayor que capacidad desde'
,p_validation_sequence=>10
,p_validation=>'to_number(:P15_CPCDAD_HSTA) >= to_number(:P15_CPCDAD_DSDE)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Capacidad Hasta no puede ser inferior que Capacidad Desde'
,p_validation_condition=>'P15_CPCDAD_DSDE'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_associated_item=>wwv_flow_api.id(83090501106298086)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(91985367111340509)
,p_validation_name=>'Modelo hasta mayor que Modelo desde_1'
,p_validation_sequence=>20
,p_validation=>'to_number(:P15_MDLO_HSTA) >= to_number(:P15_MDLO_DSDE)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Modelo Hasta no puede ser inferior a Modelo Desde.'
,p_validation_condition=>'P15_MDLO_DSDE'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_associated_item=>wwv_flow_api.id(83091354137298087)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(83096026008298089)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(83092030539298087)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(83096561176298090)
,p_event_id=>wwv_flow_api.id(83096026008298089)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(83094458245298089)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from DF_S_VEHICULOS_EXCEPCION'
,p_attribute_02=>'DF_S_VEHICULOS_EXCEPCION'
,p_attribute_03=>'P15_ID_VHCLO_EXCPCION'
,p_attribute_04=>'ID_VHCLO_EXCPCION'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(83094852270298089)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of DF_S_VEHICULOS_EXCEPCION'
,p_attribute_02=>'DF_S_VEHICULOS_EXCEPCION'
,p_attribute_03=>'P15_ID_VHCLO_EXCPCION'
,p_attribute_04=>'ID_VHCLO_EXCPCION'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n Procesada. ')
);
end;
/
