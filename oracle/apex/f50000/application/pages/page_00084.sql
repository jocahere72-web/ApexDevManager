prompt --application/pages/page_00084
begin
wwv_flow_api.create_page(
 p_id=>84
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>unistr('Gesti\00F3n de Clases de Actividades Econ\00F3micas')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Gesti\00F3n de Clases de Actividades Econ\00F3micas')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function isNumber(item) {',
'  $(item).on(''input'', function () { ',
'    this.value = this.value.replace(/[^0-9]/g,'''');',
'  });',
'};',
'',
unistr('var htmldb_delete_message = ''\00BFEst\00E1 seguro de eliminar el registro?'';')))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'ELAFAURIE'
,p_last_upd_yyyymmddhh24miss=>'20200102180032'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(99075519742845383)
,p_plug_name=>unistr('Gesti\00F3n de clases de actividades econ\00F3micas')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29530253509068499)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(99076284662845385)
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
 p_id=>wwv_flow_api.id(99076685007845386)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(99076284662845385)
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
 p_id=>wwv_flow_api.id(99076138418845385)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(99076284662845385)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P84_ID_ACTVDAD_ECNMCA_CLS'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(99076089174845385)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(99076284662845385)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P84_ID_ACTVDAD_ECNMCA_CLS'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(99075955522845385)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(99076284662845385)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P84_ID_ACTVDAD_ECNMCA_CLS'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99079067249845392)
,p_name=>'P84_ID_ACTVDAD_ECNMCA_CLS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(99075519742845383)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Actvdad Ecnmca Cls'
,p_source=>'ID_ACTVDAD_ECNMCA_CLS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99079490147845420)
,p_name=>'P84_CDGO_CLNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(99075519742845383)
,p_use_cache_before_default=>'NO'
,p_item_default=>'&F_CDGO_CLNTE.'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99079851977845421)
,p_name=>'P84_CDGO_ACTVDAD_ECNMCA_CLS'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(99075519742845383)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('C\00F3digo')
,p_source=>'CDGO_ACTVDAD_ECNMCA_CLS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>10
,p_cMaxlength=>10
,p_tag_attributes=>'onkeyup="campoMayuscula(this)" onkeypress="return validarExpresion(event, ''letraNumero'');"'
,p_grid_column=>1
,p_grid_label_column_span=>3
,p_read_only_when=>'P84_ID_ACTVDAD_ECNMCA_CLS'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el c\00F3digo de la actividad econ\00F3mica. M\00E1ximo 10 caracteres')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99080286626845421)
,p_name=>'P84_DSCRPCION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(99075519742845383)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Descripci\00F3n')
,p_source=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>200
,p_cHeight=>4
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_grid_column=>1
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la descripci\00F3n de la actividad econ\00F3mica. M\00E1ximo 200 caracteres')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99080615491845423)
,p_name=>'P84_TRFA'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(99075519742845383)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tarifa'
,p_format_mask=>'0D000'
,p_source=>'TRFA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>5
,p_cMaxlength=>4
,p_tag_attributes=>' onkeyup="formatNumber(event,{ precision: 3, thousand: ''.'',decimal: '','' });"  onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese de la tarifa correspondiente el valor debe estar comprendido entre  0 y 1, acepta 3 decimales.'
,p_attribute_02=>'1'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99081005095845424)
,p_name=>'P84_FCHA_DSDE'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(99075519742845383)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Inicial'
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'FCHA_DSDE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>10
,p_tag_attributes=>'onkeydown="return false"'
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la fecha de inicio de la  vigencia de la clase de actividad econ\00F3mica.')
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99081867997845425)
,p_name=>'P84_FCHA_HSTA'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(99075519742845383)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Final'
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'FCHA_HSTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>10
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la fecha fin de la  vigencia de la clase de actividad econ\00F3mica.')
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99082692760845426)
,p_name=>'P84_ID_SJTO_TPO'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(99075519742845383)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo Sujeto'
,p_source=>'ID_SJTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select b.nmbre_impsto || '' - '' || a.nmbre_sjto_tpo,',
'         a.id_sjto_tpo',
'    from df_i_sujetos_tipo a',
'    join df_c_impuestos    b on a.id_impsto = b.id_impsto',
'   where a.cdgo_clnte    =   :F_CDGO_CLNTE',
'     and (',
'          to_date(to_char(systimestamp,''dd/mm/yyyy''),''dd/mm/yyyy'') ',
'          between',
'          to_date(to_char(fcha_dsde,''dd/mm/yyyy''),''dd/mm/yyyy'') ',
'          and',
'          to_date(to_char(fcha_hsta,''dd/mm/yyyy''),''dd/mm/yyyy'') ',
'         )',
'order by b.nmbre_impsto, a.nmbre_sjto_tpo;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_column=>1
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista el tipo de sujeto relacionado a la clase de actividad econ\00F3mica')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99083055647845426)
,p_name=>'P84_ID_INDCDOR_ECNMCO'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(99075519742845383)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Indicador Econ\00F3mico')
,p_source=>'ID_INDCDOR_ECNMCO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_INDICADORES_ECONOMICOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select initcap(t.nmbre_indcdor_tpo),',
'       i.id_indcdor_ecnmco',
'  from df_s_indicadores_economico i, df_s_indicadores_tipo t',
' where i.cdgo_indcdor_tpo = t.cdgo_indcdor_tpo',
'   and (',
'        to_date(to_char(systimestamp,''dd/mm/yyyy''),''dd/mm/yyyy'') ',
'        between',
'       to_date(to_char(fcha_dsde,''dd/mm/yyyy''),''dd/mm/yyyy'') ',
'       and',
'       to_date(to_char(fcha_hsta,''dd/mm/yyyy''),''dd/mm/yyyy'') ',
'       )',
' order by t.nmbre_indcdor_tpo'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_column=>1
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista el indicador econ\00F3mico a aplicar en la clase de actividad econ\00F3mica')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(99081556830845425)
,p_validation_name=>'P84_FCHA_DSDE must be timestamp'
,p_validation_sequence=>60
,p_validation=>'P84_FCHA_DSDE'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_api.id(99081005095845424)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(99082310516845425)
,p_validation_name=>'P84_FCHA_HSTA must be timestamp'
,p_validation_sequence=>70
,p_validation=>'P84_FCHA_HSTA'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_api.id(99081867997845425)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(99167104475940304)
,p_validation_name=>'La fecha final debe ser mayor o igual a la fecha final'
,p_validation_sequence=>100
,p_validation=>'to_date(:P84_FCHA_HSTA,''dd/mm/yyyy'') >= to_date(:P84_FCHA_DSDE,''dd/mm/yyyy'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'La fecha final debe ser mayor o igual a la fecha final'
,p_validation_condition=>'SAVE, CREATE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(99076717873845386)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(99076685007845386)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(99077563429845388)
,p_event_id=>wwv_flow_api.id(99076717873845386)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(47179127854893150)
,p_name=>'Al cambiar fecha de inicio'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_FCHA_DSDE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(47852916934794601)
,p_event_id=>wwv_flow_api.id(47179127854893150)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P84_FCHA_HSTA").datepicker( ''option'' , ''minDate'' , $("#P84_FCHA_DSDE").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(99083819464845428)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from DF_C_ACTIVIDADES_ECNMCA_CLS'
,p_attribute_02=>'DF_C_ACTIVIDADES_ECNMCA_CLS'
,p_attribute_03=>'P84_ID_ACTVDAD_ECNMCA_CLS'
,p_attribute_04=>'ID_ACTVDAD_ECNMCA_CLS'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(99084244157845428)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of DF_C_ACTIVIDADES_ECNMCA_CLS'
,p_attribute_02=>'DF_C_ACTIVIDADES_ECNMCA_CLS'
,p_attribute_03=>'P84_ID_ACTVDAD_ECNMCA_CLS'
,p_attribute_04=>'ID_ACTVDAD_ECNMCA_CLS'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(99084650005845428)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(99076138418845385)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(99085087752845428)
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
