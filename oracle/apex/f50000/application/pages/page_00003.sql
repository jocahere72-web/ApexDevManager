prompt --application/pages/page_00003
begin
wwv_flow_api.create_page(
 p_id=>3
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>unistr('Gesti\00F3n Excepciones Vehiculos')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Gesti\00F3n Excepciones Vehiculos')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180918161352'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(109769248751582047)
,p_plug_name=>'VEHICULOS EXCEPCION'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29530253509068499)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(109769851745582090)
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
 p_id=>wwv_flow_api.id(109770241345582090)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(109769851745582090)
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
 p_id=>wwv_flow_api.id(109769729602582090)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(109769851745582090)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P3_ID_VHCLO_EXCPCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(109769680682582090)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(109769851745582090)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P3_ID_VHCLO_EXCPCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(109769591277582090)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(109769851745582090)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P3_ID_VHCLO_EXCPCION'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109772634002582163)
,p_name=>'P3_ID_VHCLO_EXCPCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(109769248751582047)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Vhclo Excpcion'
,p_source=>'ID_VHCLO_EXCPCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109772924185582202)
,p_name=>'P3_VGNCIA'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(109769248751582047)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Vigencia'
,p_source=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109773319696582204)
,p_name=>'P3_CDGO_VHCLO_MRCA'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(109769248751582047)
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
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109773794683582205)
,p_name=>'P3_ID_VHCLO_LNEA'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(109769248751582047)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Linea'
,p_source=>'ID_VHCLO_LNEA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_LINEA_VEHICULOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_LNEA as d,',
'       ID_VHCLO_LNEA as r',
'  from DF_S_VEHICULOS_LINEA',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109774151509582205)
,p_name=>'P3_CDGO_VHCLO_CLSE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(109769248751582047)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Clase'
,p_source=>'CDGO_VHCLO_CLSE'
,p_source_type=>'DB_COLUMN'
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
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109774522661582205)
,p_name=>'P3_CDGO_VHCLO_CRRCRIA'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(109769248751582047)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Carroceria'
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
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109774933116582205)
,p_name=>'P3_CLNDRJE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(109769248751582047)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Cilindraje'
,p_source=>'CLNDRJE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109775365483582205)
,p_name=>'P3_CDGO_VHCLO_OPRCION'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(109769248751582047)
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
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109775760540582206)
,p_name=>'P3_CDGO_VHCLO_SRVCIO'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(109769248751582047)
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
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109776124155582206)
,p_name=>'P3_CPCDAD_DSDE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(109769248751582047)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Capacidad Desde'
,p_source=>'CPCDAD_DSDE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109776545729582211)
,p_name=>'P3_CPCDAD_HSTA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(109769248751582047)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Capacidad Hasta'
,p_source=>'CPCDAD_HSTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109776913640582212)
,p_name=>'P3_MDLO_DSDE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(109769248751582047)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Modelo Desde'
,p_source=>'MDLO_DSDE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109777364362582212)
,p_name=>'P3_MDLO_HSTA'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(109769248751582047)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Modelo Hasta'
,p_source=>'MDLO_HSTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109777781577582212)
,p_name=>'P3_GRPO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(109769248751582047)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Grupo'
,p_source=>'GRPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(109770362519582090)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(109770241345582090)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(109771158057582103)
,p_event_id=>wwv_flow_api.id(109770362519582090)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(109783020276582221)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from DF_S_VEHICULOS_EXCEPCION'
,p_attribute_02=>'DF_S_VEHICULOS_EXCEPCION'
,p_attribute_03=>'P3_ID_VHCLO_EXCPCION'
,p_attribute_04=>'ID_VHCLO_EXCPCION'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(109783449262582221)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of DF_S_VEHICULOS_EXCEPCION'
,p_attribute_02=>'DF_S_VEHICULOS_EXCEPCION'
,p_attribute_03=>'P3_ID_VHCLO_EXCPCION'
,p_attribute_04=>'ID_VHCLO_EXCPCION'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(98711521335428920)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(109783893119582222)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(109769729602582090)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(98711909214428921)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(109784240479582222)
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
