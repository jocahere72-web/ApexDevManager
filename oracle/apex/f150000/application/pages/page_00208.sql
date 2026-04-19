prompt --application/pages/page_00208
begin
wwv_flow_api.create_page(
 p_id=>208
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Responsables - Registro de Sujeto Impuesto'
,p_page_mode=>'MODAL'
,p_step_title=>'Resposables - Registro de Sujeto Impuesto'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_dialog_chained=>'N'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'HMARTINEZ'
,p_last_upd_yyyymmddhh24miss=>'20201228174748'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(364827986685910707)
,p_plug_name=>'Responsables'
,p_region_name=>'rspnsble'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(84826124890570358)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(364827986685910707)
,p_button_name=>'BNT_APLICAR_CAMBIOS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P208_SEQ_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(84826514546570360)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(364827986685910707)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Regresar / Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(84826978511570360)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(364827986685910707)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P208_SEQ_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84827312880570362)
,p_name=>'P208_SEQ_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(364827986685910707)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84827721578570366)
,p_name=>'P208_ID_SJTO_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(364827986685910707)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84828195243570366)
,p_name=>'P208_ID_SJTO_RSPNSBLE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(364827986685910707)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84828564114570366)
,p_name=>'P208_PRNCPAL_S_N'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(364827986685910707)
,p_item_default=>'S'
,p_prompt=>'Principal'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(252387114161917710)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84828959527570366)
,p_name=>'P208_CDGO_TPO_RSPNSBLE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(364827986685910707)
,p_prompt=>'Tipo Responsable'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select r.dscrpcion_rspnsble_tpo as d,',
'       r.cdgo_rspnsble_tpo as r',
'from df_s_responsables_tipo r;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84829392080570370)
,p_name=>'P208_CDGO_IDNTFCCION_TPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(364827986685910707)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion_idntfccion_tpo as d,',
'        a.cdgo_idntfccion_tpo as r',
'from df_s_identificaciones_tipo a',
'order by 1; '))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84829788097570370)
,p_name=>'P208_IDNTFCCION'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(364827986685910707)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P208_SEQ_ID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84830155225570372)
,p_name=>'P208_PRMER_NMBRE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(364827986685910707)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84830542228570373)
,p_name=>'P208_SGNDO_NMBRE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(364827986685910707)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84830902855570373)
,p_name=>'P208_PRMER_APLLDO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(364827986685910707)
,p_prompt=>'Primer Aperllido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84831301011570373)
,p_name=>'P208_SGNDO_APLLDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(364827986685910707)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84831760961570373)
,p_name=>'P208_ID_PAIS_NTFCCION'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(364827986685910707)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84832155949570373)
,p_name=>'P208_ID_DPRTMNTO_NTFCCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(364827986685910707)
,p_item_default=>'select id_dprtmnto from df_s_clientes where cdgo_clnte = :F_CDGO_CLNTE'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Departamento'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_dprtmnto as d,',
'        a.id_dprtmnto as r',
'from df_s_departamentos a;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84832561560570374)
,p_name=>'P208_ID_MNCPIO_NTFCCION'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(364827986685910707)
,p_item_default=>'select id_mncpio from df_s_clientes where cdgo_clnte = :F_CDGO_CLNTE'
,p_item_default_type=>'SQL_QUERY_COLON'
,p_prompt=>'Municipio'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_mncpio as d,',
'        a.id_mncpio as r',
'from df_s_municipios a',
'where a.id_dprtmnto = :P208_ID_DPRTMNTO_NTFCCION;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P208_ID_DPRTMNTO_NTFCCION'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84832979355570374)
,p_name=>'P208_DRCCION_NTFCCION'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(364827986685910707)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84833398506570374)
,p_name=>'P208_TLFNO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(364827986685910707)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84833724549570374)
,p_name=>'P208_CLLAR'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(364827986685910707)
,p_prompt=>'Celular'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84834116653570374)
,p_name=>'P208_EMAIL'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(364827986685910707)
,p_prompt=>'Correo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84834582176570375)
,p_name=>'P208_ACTVO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(364827986685910707)
,p_item_default=>'S'
,p_prompt=>unistr('\00BFActivo?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(252387114161917710)||'.'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84834979568570375)
,p_name=>'P208_ID_TRCRO'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(364827986685910707)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84835394231570375)
,p_name=>'P208_ORGEN_DCMNTO'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(364827986685910707)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84835720264570376)
,p_name=>'P208_PRCNTJE_PRTCPCION'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(364827986685910707)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(84836630504570387)
,p_validation_name=>'Valida correo'
,p_validation_sequence=>20
,p_validation=>'regexp_like (:P208_EMAIL, ''^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Ingrese un correo valido.'
,p_associated_item=>wwv_flow_api.id(84834116653570374)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(84837037888570387)
,p_validation_name=>'Valida tipo responsable'
,p_validation_sequence=>30
,p_validation=>'P208_CDGO_TPO_RSPNSBLE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'CREATE,BTN_APLICAR_CAMBIOS'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(84828959527570366)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(84837494124570387)
,p_validation_name=>'Valida el tipo de identificacion'
,p_validation_sequence=>40
,p_validation=>'P208_CDGO_IDNTFCCION_TPO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'CREATE,BTN_APLICAR_CAMBIOS'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(84829392080570370)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(84837840094570387)
,p_validation_name=>'Valida el primer nombre'
,p_validation_sequence=>50
,p_validation=>'P208_PRMER_NMBRE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'CREATE,BTN_APLICAR_CAMBIOS'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(84830155225570372)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(84838285754570387)
,p_validation_name=>'Valida el primer apellido'
,p_validation_sequence=>60
,p_validation=>'P208_PRMER_APLLDO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'CREATE,BTN_APLICAR_CAMBIOS'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(84830902855570373)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(84838616417570388)
,p_validation_name=>'Valida departamento'
,p_validation_sequence=>70
,p_validation=>'P208_ID_DPRTMNTO_NTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'CREATE,BTN_APLICAR_CAMBIOS'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(84832155949570373)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(84839087532570388)
,p_validation_name=>'Valida municipio'
,p_validation_sequence=>80
,p_validation=>'P208_ID_MNCPIO_NTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'CREATE,BTN_APLICAR_CAMBIOS'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(84832561560570374)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(84839478859570389)
,p_validation_name=>unistr('Valida direcci\00F3n ')
,p_validation_sequence=>90
,p_validation=>'P208_DRCCION_NTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'CREATE,BTN_APLICAR_CAMBIOS'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(84832979355570374)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(84841761548570392)
,p_name=>'Carga responsable'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P208_IDNTFCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(84842222843570393)
,p_event_id=>wwv_flow_api.id(84841761548570392)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(84842650097570394)
,p_name=>'Al hacer clic en Regresar Cerrar Modal'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(84826514546570360)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(84843186676570394)
,p_event_id=>wwv_flow_api.id(84842650097570394)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(84840517068570390)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Coonsulta en la coleccion los datos del responsable '
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'',
'begin',
'   select c001 id_sjto_rspnsble',
'        , c002 id_sjto_impsto',
'        , c003 cdgo_idntfccion_tpo',
'        , c004 idntfccion',
'        , c005 prmer_nmbre',
'        , c006 sgndo_nmbre',
'        , c007 prmer_aplldo',
'        , c008 sgndo_aplldo',
'        , c009 prncpal_s_n',
'        , c010 cdgo_tpo_rspnsble',
'        , c011 prcntje_prtcpcion',
'        , c012 orgen_dcmnto',
'        , c013 id_pais_ntfccion',
'        , c014 id_dprtmnto_ntfccion',
'        , c015 id_mncpio_ntfccion',
'        , c016 drccion_ntfccion',
'        , c017 email',
'        , c018 tlfno',
'        , c019 cllar',
'        , c020 actvo',
'        , c021 id_trcro',
'     into :P208_ID_SJTO_RSPNSBLE',
'        , :P208_ID_SJTO_IMPSTO',
'        , :P208_CDGO_IDNTFCCION_TPO',
'        , :P208_IDNTFCCION',
'        , :P208_PRMER_NMBRE',
'        , :P208_SGNDO_NMBRE',
'        , :P208_PRMER_APLLDO',
'        , :P208_SGNDO_APLLDO',
'        , :P208_PRNCPAL_S_N',
'        , :P208_CDGO_TPO_RSPNSBLE',
'        , :P208_PRCNTJE_PRTCPCION',
'        , :P208_ORGEN_DCMNTO',
'        , :P208_ID_PAIS_NTFCCION',
'        , :P208_ID_DPRTMNTO_NTFCCION',
'        , :P208_ID_MNCPIO_NTFCCION',
'        , :P208_DRCCION_NTFCCION',
'        , :P208_EMAIL',
'        , :P208_TLFNO',
'        , :P208_CLLAR',
'        , :P208_ACTVO',
'        , :P208_ID_TRCRO',
'     from apex_collections    a',
'    where collection_name     = ''RESPONSABLES''',
'      and seq_id              = :P208_SEQ_ID;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P208_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(84840969324570391)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Carga Tercero'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    ',
'    select  t.cdgo_idntfccion_tpo,',
'            t.prmer_nmbre,',
'            t.sgndo_nmbre,',
'            t.prmer_aplldo,',
'            t.sgndo_aplldo,',
'            t.id_dprtmnto,',
'            t.id_mncpio,',
'            t.drccion,',
'            t.tlfno,',
'            t.email,',
'            t.cllar',
'    into    :P208_CDGO_IDNTFCCION_TPO,',
'            :P208_PRMER_NMBRE,',
'            :P208_SGNDO_NMBRE,',
'            :P208_PRMER_APLLDO,',
'            :P208_SGNDO_APLLDO,',
'            :P208_ID_DPRTMNTO_NTFCCION,',
'            :P208_ID_MNCPIO_NTFCCION,',
'            :P208_DRCCION_NTFCCION,',
'            :P208_TLFNO,',
'            :P208_EMAIL,',
'            :P208_CLLAR',
'    from si_c_terceros t',
'    where t.idntfccion   = :P208_IDNTFCCION',
'      and t.cdgo_clnte   = :F_CDGO_CLNTE',
'      and rownum         = 1;',
'',
'exception',
'    when others then',
'        :P208_CDGO_IDNTFCCION_TPO := null;',
'        :P208_PRMER_NMBRE := null;',
'        :P208_SGNDO_NMBRE := null;',
'        :P208_PRMER_APLLDO := null;',
'        :P208_SGNDO_APLLDO := null;',
'        :P208_ID_DPRTMNTO_NTFCCION := null;',
'        :P208_ID_MNCPIO_NTFCCION := null;',
'        :P208_DRCCION_NTFCCION := null;',
'        :P208_TLFNO := null;',
'        :P208_EMAIL := null;',
'        :P208_CLLAR    := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P208_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(84840189401570390)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Agrega responsable'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_prncpal               number;',
'    v_rgstros               number;',
'begin',
'',
'    if :P208_SEQ_ID is null then',
'        ',
'        if (not apex_collection.collection_exists(p_collection_name => ''RESPONSABLES'') ) then',
'            apex_collection.create_collection( p_collection_name => ''RESPONSABLES'');',
'        end if;',
'        ',
'        -- Se valida si el resposable ya esta registrado',
'        begin',
'            select count(*)',
'              into v_rgstros',
'             from apex_collections   a',
'             where collection_name   = ''RESPONSABLES''',
'               and a.c004            = :P208_IDNTFCCION;',
'        ',
'            if v_rgstros > 0 then',
'                raise_application_error(-20003, ''Sr(a). '' || :F_NMBRE_USRIO || '', el responsable ya se encuentra agregado. Por favor valide e intente nuevamente'');  ',
'            end if;',
'        end;-- FIN Se valida si el resposable ya esta registrado',
'        ',
'        -- Se valida si ya existe un responsable principal',
'        begin',
'            select count(*)',
'              into v_prncpal',
'              from apex_collections   a',
'             where collection_name    = ''RESPONSABLES''',
'               and a.c009             = ''S''',
'               and a.c020             = ''S'';',
'        ',
'            if v_prncpal > 0 and :P208_PRNCPAL_S_N = ''S'' then',
'                raise_application_error(-20001,  ''Solo puede ingresar un responsable principal. Por favor valide e intente nuevamente'' );  ',
'            end if;',
'        end; -- FIN Se valida si ya existe un responsable principal',
'        ',
'        begin',
'            apex_collection.add_member(p_collection_name 	=> ''RESPONSABLES''',
'                                     , p_c001				=> :P208_ID_SJTO_RSPNSBLE',
'									 , p_c002				=> :P208_ID_SJTO_IMPSTO',
'									 , p_c003				=> :P208_CDGO_IDNTFCCION_TPO',
'									 , p_c004				=> :P208_IDNTFCCION',
'									 , p_c005				=> :P208_PRMER_NMBRE',
'									 , p_c006				=> :P208_SGNDO_NMBRE',
'									 , p_c007				=> :P208_PRMER_APLLDO',
'									 , p_c008				=> :P208_SGNDO_APLLDO',
'									 , p_c009				=> :P208_PRNCPAL_S_N',
'									 , p_c010				=> :P208_CDGO_TPO_RSPNSBLE',
'									 , p_c011				=> :P208_PRCNTJE_PRTCPCION',
'									 , p_c012				=> :P208_ORGEN_DCMNTO',
'									 , p_c013				=> :P208_ID_PAIS_NTFCCION',
'									 , p_c014				=> :P208_ID_DPRTMNTO_NTFCCION',
'									 , p_c015				=> :P208_ID_MNCPIO_NTFCCION',
'									 , p_c016				=> :P208_DRCCION_NTFCCION',
'									 , p_c017				=> :P208_EMAIL',
'									 , p_c018				=> :P208_TLFNO',
'									 , p_c019				=> :P208_CLLAR',
'									 , p_c020				=> :P208_ACTVO',
'									 , p_c021				=> :P208_ID_TRCRO',
'									 , p_c022				=> ''NUEVO'');',
'        exception',
'            when others then ',
'                raise_application_error(-20003,  ''Sr(a). '' || :F_NMBRE_USRIO || sqlerrm );  ',
'',
'        end;         ',
'    end if; ',
'exception',
'    when others then ',
'        raise_application_error(-20003,  ''Sr(a). '' || :F_NMBRE_USRIO || sqlerrm );  ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(84826978511570360)
,p_process_when=>'P208_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NULL'
,p_process_success_message=>'Responsable agregado exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(84841365556570391)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update Responsable'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_prncpal        number := 0; ',
'begin',
'    begin',
'        select count(*)',
'          into v_prncpal',
'          from apex_collections    a',
'         where collection_name     = ''RESPONSABLES''',
'           and a.c020              = ''S''',
'           and a.c009              = ''S''',
'           and a.c004              <> :P208_IDNTFCCION;',
'',
'        if v_prncpal > 0 and :P208_PRNCPAL_S_N = ''S'' then',
'            raise_application_error(-20003,  ''Sr(a). '' || :F_NMBRE_USRIO || '', solo puede ingresar un responsable principal. Por favor valide e intente nuevamente'' );  ',
'        end if;',
'    exception',
'        when others then ',
'            raise_application_error(-20003,  ''Sr(a). '' || :F_NMBRE_USRIO || '', ha ocurrido un error. Por favor valide e intente nuevamente'' || sqlerrm );  ',
'    end;',
'    ',
'    begin',
'         apex_collection.update_member (p_collection_name 	=> ''RESPONSABLES''',
'									 , p_seq     			=> :P208_SEQ_ID',
'                                     , p_c001				=> :P208_ID_SJTO_RSPNSBLE',
'									 , p_c002				=> :P208_ID_SJTO_IMPSTO',
'									 , p_c003				=> :P208_CDGO_IDNTFCCION_TPO',
'									 , p_c004				=> :P208_IDNTFCCION',
'									 , p_c005				=> :P208_PRMER_NMBRE',
'									 , p_c006				=> :P208_SGNDO_NMBRE',
'									 , p_c007				=> :P208_PRMER_APLLDO',
'									 , p_c008				=> :P208_SGNDO_APLLDO',
'									 , p_c009				=> :P208_PRNCPAL_S_N',
'									 , p_c010				=> :P208_CDGO_TPO_RSPNSBLE',
'									 , p_c011				=> :P208_PRCNTJE_PRTCPCION',
'									 , p_c012				=> :P208_ORGEN_DCMNTO',
'									 , p_c013				=> :P208_ID_PAIS_NTFCCION',
'									 , p_c014				=> :P208_ID_DPRTMNTO_NTFCCION',
'									 , p_c015				=> :P208_ID_MNCPIO_NTFCCION',
'									 , p_c016				=> :P208_DRCCION_NTFCCION',
'									 , p_c017				=> :P208_EMAIL',
'									 , p_c018				=> :P208_TLFNO',
'									 , p_c019				=> :P208_CLLAR',
'									 , p_c020				=> :P208_ACTVO',
'									 , p_c021				=> :P208_ID_TRCRO',
'                                     , p_c022               => ''ACTUALIZADO'');',
'',
'    exception',
'        when others then ',
'            raise_application_error(-20003,  ''Sr(a). '' || :F_NMBRE_USRIO || '', ha ocurrido un error. Por favor valide e intente nuevamente'' );  ',
'    end;    ',
'end;    '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(84826124890570358)
,p_process_when=>'P208_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'Responsable actualizado exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(84839797152570389)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar la modal'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,BNT_APLICAR_CAMBIOS'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>unistr('Acci\00F3n Procesada con Exito')
);
end;
/
