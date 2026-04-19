prompt --application/pages/page_00067
begin
wwv_flow_api.create_page(
 p_id=>67
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Homologaciones Vehiculos'
,p_page_mode=>'MODAL'
,p_step_title=>'Homologaciones Vehiculos'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180918161353'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(97259062470107669)
,p_plug_name=>'Homologaciones Vehiculos'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29530253509068499)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(97259661156107673)
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
 p_id=>wwv_flow_api.id(97260083533107674)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(97259661156107673)
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
 p_id=>wwv_flow_api.id(97259542825107673)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(97259661156107673)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P67_ID_VHCLO_HMLGA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(97259456522107673)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(97259661156107673)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P67_ID_VHCLO_HMLGA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(97259346711107673)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(97259661156107673)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P67_ID_VHCLO_HMLGA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97262462050107694)
,p_name=>'P67_ID_VHCLO_HMLGA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(97259062470107669)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Vhclo Hmlga'
,p_source=>'ID_VHCLO_HMLGA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97262885505107710)
,p_name=>'P67_VGNCIA_DSDE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(97259062470107669)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Vigencia Inicial'
,p_source=>'VGNCIA_DSDE'
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
 p_id=>wwv_flow_api.id(97263205655107712)
,p_name=>'P67_VGNCIA_HSTA'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(97259062470107669)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Vigencia Final'
,p_source=>'VGNCIA_HSTA'
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
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97263614869107712)
,p_name=>'P67_CDGO_CLSE_ANTRIOR'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(97259062470107669)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Clase Anterior'
,p_source=>'CDGO_CLSE_ANTRIOR'
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
 p_id=>wwv_flow_api.id(97264007629107712)
,p_name=>'P67_CDGO_CLSE_NVA'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(97259062470107669)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Clase Nueva'
,p_source=>'CDGO_CLSE_NVA'
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
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97264474556107713)
,p_name=>'P67_ORDEN'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(97259062470107669)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Orden'
,p_source=>'ORDEN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>5
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(97260160102107674)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(97260083533107674)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(97260935264107687)
,p_event_id=>wwv_flow_api.id(97260160102107674)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(97265240192107715)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from DF_S_VEHICULOS_HOMOLOGA'
,p_attribute_02=>'DF_S_VEHICULOS_HOMOLOGA'
,p_attribute_03=>'P67_ID_VHCLO_HMLGA'
,p_attribute_04=>'ID_VHCLO_HMLGA'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(97265658618107716)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of DF_S_VEHICULOS_HOMOLOGA'
,p_attribute_02=>'DF_S_VEHICULOS_HOMOLOGA'
,p_attribute_03=>'P67_ID_VHCLO_HMLGA'
,p_attribute_04=>'ID_VHCLO_HMLGA'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(97266009082107716)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(97259542825107673)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(97266402616107716)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
