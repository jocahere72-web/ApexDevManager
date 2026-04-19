prompt --application/pages/page_00009
begin
wwv_flow_api.create_page(
 p_id=>9
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Proceso Responsables'
,p_page_mode=>'MODAL'
,p_step_title=>'Proceso Responsables'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'function mayuscula(this_){',
'    var id = this_.triggeringElement;',
'    $(id).val($(id).val().toUpperCase());',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_attributes=>'id:"DialogResponsables"'
,p_protection_level=>'C'
,p_last_updated_by=>'ABRACHE'
,p_last_upd_yyyymmddhh24miss=>'20200327105038'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(31201693518920809)
,p_plug_name=>'Proceso Responsables'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17335434580919364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(31202370984920810)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17336422472919364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(31202728724920811)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(31202370984920810)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(31202265257920810)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(31202370984920810)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro que desea eliminar el registro?'',''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P9_ID_PRCSOS_SMU_RSPNSBLE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(31202148281920810)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(31202370984920810)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P9_ID_PRCSOS_SMU_RSPNSBLE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(31202099165920810)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(31202370984920810)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P9_ID_PRCSOS_SMU_RSPNSBLE'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31205178052920814)
,p_name=>'P9_ID_PRCSOS_SMU_RSPNSBLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(31201693518920809)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_PRCSOS_SMU_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31205529672920827)
,p_name=>'P9_ID_PRCSOS_SMU_SJTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(31201693518920809)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_PRCSOS_SMU_SJTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31205949553920829)
,p_name=>'P9_CDGO_IDNTFCCION_TPO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(31201693518920809)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Tipo Identificaci\00F3n ')
,p_source=>'CDGO_IDNTFCCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IDENTIFICACIONES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_IDNTFCCION_TPO as d,',
'       CDGO_IDNTFCCION_TPO as r',
'  from DF_S_IDENTIFICACIONES_TIPO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Ingrese el tipo de identificaci\00F3n que corresponda al responsable del proceso.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31206313769920830)
,p_name=>'P9_IDNTFCCION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(31201693518920809)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Identificaci\00F3n')
,p_source=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>25
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumero'')" onkeyup="campoMayuscula(this)" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero de identificaci\00F3n que corresponda al responsable del proceso.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31206656846920830)
,p_name=>'P9_PRMER_NMBRE'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(31201693518920809)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Primer Nombre'
,p_source=>'PRMER_NMBRE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Diligencie el primer nombre del responsable del proceso.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31207030476920830)
,p_name=>'P9_SGNDO_NMBRE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(31201693518920809)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Segundo Nombre'
,p_source=>'SGNDO_NMBRE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Diligencie el segundo nombre del responsable del proceso.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31207476467920830)
,p_name=>'P9_PRMER_APLLDO'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(31201693518920809)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Primer Apellido'
,p_source=>'PRMER_APLLDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Diligencie el primer apellido del responsable del proceso.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31207858518920830)
,p_name=>'P9_SGNDO_APLLDO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(31201693518920809)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Segundo Apellido'
,p_source=>'SGNDO_APLLDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Diligencie el segundo apellido del responsable del proceso.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31208224905920831)
,p_name=>'P9_PRNCPAL_S_N'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(31201693518920809)
,p_use_cache_before_default=>'NO'
,p_item_default=>'S'
,p_prompt=>'Principal'
,p_source=>'PRNCPAL_S_N'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione "S\00ED" para indicar que el responsable es principal y "No" para indicar que es secundario.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31208649806920831)
,p_name=>'P9_CDGO_TPO_RSPNSBLE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(31201693518920809)
,p_use_cache_before_default=>'NO'
,p_source=>'CDGO_TPO_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31209064876920831)
,p_name=>'P9_PRCNTJE_PRTCPCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(31201693518920809)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Porcentaje Participaci\00F3n')
,p_source=>'PRCNTJE_PRTCPCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')" onkeyup="formatNumber(event,{ precision: 2, thousand: ''.'',decimal: '','' });" '
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>10
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indique el porcentaje de participaci\00F3n que tiene el responsable del proceso. ingresar un avalor entre 0 y 100%')
,p_attribute_02=>'100'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35103566286394015)
,p_name=>'P9_ID_PAIS_NTFCCION'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(31201693518920809)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Pa\00EDs Notificaci\00F3n')
,p_source=>'ID_PAIS_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_PAIS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_pais as d,',
'       id_pais  as r',
'  from df_s_paises',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Seleccione de la lista el pa\00EDs de notificaci\00F3n perteneciente al responsable del proceso.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35103625109394016)
,p_name=>'P9_ID_DPRTMNTO_NTFCCION'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(31201693518920809)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Departamento Notificaci\00F3n')
,p_source=>'ID_DPRTMNTO_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    nmbre_dprtmnto,',
'    id_dprtmnto',
'from',
'    df_s_departamentos',
'where',
'    id_pais =:p9_id_pais_ntfccion;'))
,p_lov_cascade_parent_items=>'P9_ID_PAIS_NTFCCION'
,p_ajax_items_to_submit=>'P9_ID_DPRTMNTO_NTFCCION'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista el departamento de notificaci\00F3n perteneciente al responsable del proceso..')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35103759445394017)
,p_name=>'P9_ID_MNCPIO_NTFCCION'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(31201693518920809)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr(' Municipio Notificaci\00F3n')
,p_source=>'ID_MNCPIO_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    nmbre_mncpio,',
'    id_mncpio',
'from',
'    df_s_municipios',
'where',
'    id_dprtmnto =:P9_ID_DPRTMNTO_NTFCCION;'))
,p_lov_cascade_parent_items=>'P9_ID_DPRTMNTO_NTFCCION'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el municipio de notificaci\00F3n  perteneciente al responsable del proceso.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35103887842394018)
,p_name=>'P9_DRCCION_NTFCCION'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(31201693518920809)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Direcci\00F3n Notificaci\00F3n')
,p_source=>'DRCCION_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Diligencie la direcci\00F3n de notificaci\00F3n  perteneciente al responsable del proceso.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35103939886394019)
,p_name=>'P9_TLFNO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(31201693518920809)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Tel\00E9fono')
,p_source=>'TLFNO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Diligencie el n\00FAmero tel\00E9fono perteneciente al responsable del proceso.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEL'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35104018185394020)
,p_name=>'P9_CLLAR'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(31201693518920809)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Celular'
,p_source=>'CLLAR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Diligencie el n\00FAmero de celular perteneciente al responsable del proceso.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEL'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(36273645294852310)
,p_name=>'P9_EMAIL'
,p_is_required=>true
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(31201693518920809)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Email'
,p_source=>'EMAIL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>320
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Diligencie el correo electr\00F3nico perteneciente al responsable del proceso.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(54429649178813806)
,p_validation_name=>'Valida email'
,p_validation_sequence=>10
,p_validation=>'P9_EMAIL'
,p_validation2=>'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>'El Email no cumple con el formato, favor ingresar Email de acuerdo a la estructura'
,p_associated_item=>wwv_flow_api.id(36273645294852310)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(31202898990920811)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(31202728724920811)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(31203644980920812)
,p_event_id=>wwv_flow_api.id(31202898990920811)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(44107927531046709)
,p_name=>'al_soltar_la_tecla'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_PRMER_NMBRE,P9_SGNDO_NMBRE,P9_PRMER_APLLDO,P9_SGNDO_APLLDO'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(44108041885046710)
,p_event_id=>wwv_flow_api.id(44107927531046709)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'mayuscula(this);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(44110042781046730)
,p_name=>unistr('Al Cambiar la Identificaci\00F3n')
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_IDNTFCCION,P9_CDGO_IDNTFCCION_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P9_ID_PRCSOS_SMU_RSPNSBLE'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(44110189494046731)
,p_event_id=>wwv_flow_api.id(44110042781046730)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.server.process(''Consultar_Terceros'', {',
'    pageItems: ''#P9_IDNTFCCION,#P9_CDGO_IDNTFCCION_TPO''',
'} ).then(function(resp) {',
'        Object.keys(resp).forEach((f) => {        ',
'            apex.item(''P9_'' + f).setValue(('''' + resp[f]).trim());',
'        });    ',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(31209809479920833)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from CB_G_PROCESO_SIMU_RSPNSBLE'
,p_attribute_02=>'CB_G_PROCESOS_SIMU_RSPNSBLE'
,p_attribute_03=>'P9_ID_PRCSOS_SMU_RSPNSBLE'
,p_attribute_04=>'ID_PRCSOS_SMU_RSPNSBLE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(31210225656920834)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of CB_G_PROCESO_SIMU_RSPNSBLE'
,p_attribute_02=>'CB_G_PROCESOS_SIMU_RSPNSBLE'
,p_attribute_03=>'P9_ID_PRCSOS_SMU_RSPNSBLE'
,p_attribute_04=>'ID_PRCSOS_SMU_RSPNSBLE'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n procesada!!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(82861295230223446)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar Cuadro de Dialogo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(44110211134046732)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar_Terceros'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_prmer_nmbre   si_c_terceros.prmer_nmbre%type;',
'    v_sgndo_nmbre   si_c_terceros.sgndo_nmbre%type;',
'    v_prmer_aplldo  si_c_terceros.prmer_aplldo%type;',
'    v_sgndo_aplldo  si_c_terceros.sgndo_aplldo%type;',
'    v_id_pais       si_c_terceros.id_pais%type;',
'    v_id_dprtmnto   si_c_terceros.id_dprtmnto%type;',
'    v_id_mncpio     si_c_terceros.id_mncpio%type;',
'    v_drccion       si_c_terceros.drccion%type;',
'    v_email         si_c_terceros.email%type;',
'    v_tlfno         si_c_terceros.tlfno%type;',
'',
'begin',
'    select prmer_nmbre,',
'           sgndo_nmbre,',
'           prmer_aplldo,',
'           sgndo_aplldo,',
'           id_pais,',
'           id_dprtmnto,',
'           id_mncpio,',
'           drccion,',
'           email,',
'           tlfno',
'      into v_prmer_nmbre,',
'           v_sgndo_nmbre,',
'           v_prmer_aplldo,',
'           v_sgndo_aplldo,',
'           v_id_pais,',
'           v_id_dprtmnto,',
'           v_id_mncpio,',
'           v_drccion,',
'           v_email,',
'           v_tlfno',
'      from si_c_terceros ',
'     where idntfccion          = :P9_IDNTFCCION ',
'       and cdgo_idntfccion_tpo = :P9_CDGO_IDNTFCCION_TPO;',
'       ',
'        apex_json.initialize_output( p_http_cache => false );',
'        owa_util.mime_header(''application/json'', false);',
'        owa_util.http_header_close;',
'        apex_json.open_object();',
'        apex_json.write(''PRMER_NMBRE'', v_prmer_nmbre);',
'        apex_json.write(''SGNDO_NMBRE'', v_sgndo_nmbre);',
'        apex_json.write(''PRMER_APLLDO'', v_prmer_aplldo);',
'        apex_json.write(''SGNDO_APLLDO'', v_sgndo_aplldo);',
'        apex_json.write(''ID_PAIS_NTFCCION'', v_id_pais);',
'        apex_json.write(''ID_DPRTMNTO_NTFCCION'', v_id_dprtmnto);',
'        apex_json.write(''ID_MNCPIO_NTFCCION'', v_id_mncpio);',
'        apex_json.write(''DRCCION_NTFCCION'', v_drccion);',
'        apex_json.write(''EMAIL'', v_email);',
'        apex_json.write(''TLFNO'', v_tlfno);',
'        apex_json.close_all();',
'       ',
'exception ',
'    when others then',
'        apex_json.open_object();',
'        apex_json.write(''PRMER_NMBRE'', '' '');',
'        apex_json.write(''SGNDO_NMBRE'', '' '');',
'        apex_json.write(''PRMER_APLLDO'', '' '');',
'        apex_json.write(''SGNDO_APLLDO'', '' '');',
'        apex_json.write(''ID_PAIS_NTFCCION'', '' '');',
'        apex_json.write(''ID_DPRTMNTO_NTFCCION'', '' '');',
'        apex_json.write(''ID_MNCPIO_NTFCCION'', '' '');',
'        apex_json.write(''DRCCION_NTFCCION'', '' '');',
'        apex_json.close_all();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P9_ID_PRCSOS_SMU_RSPNSBLE'
,p_process_when_type=>'ITEM_IS_NULL'
);
end;
/
