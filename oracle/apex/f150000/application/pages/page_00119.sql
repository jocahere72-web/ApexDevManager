prompt --application/pages/page_00119
begin
wwv_flow_api.create_page(
 p_id=>119
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Responsables  - Solicitud de Novedad'
,p_page_mode=>'MODAL'
,p_step_title=>'Responsables  - Solicitud de Novedad'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20200619162033'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(191833084851365953)
,p_plug_name=>'Responsables'
,p_region_name=>'rspnsble'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--large'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(73771292621280695)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(191833084851365953)
,p_button_name=>'BNT_APLICAR_CAMBIOS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P119_SEQ_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(73771631309280697)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(191833084851365953)
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
 p_id=>wwv_flow_api.id(73772067316280698)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(191833084851365953)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P119_SEQ_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73772483028280702)
,p_name=>'P119_SEQ_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(191833084851365953)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73772826134280716)
,p_name=>'P119_ID_SJTO_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(191833084851365953)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73773249685280716)
,p_name=>'P119_ID_SJTO_RSPNSBLE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(191833084851365953)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73773698773280718)
,p_name=>'P119_PRNCPAL_S_N'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(191833084851365953)
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
 p_id=>wwv_flow_api.id(73774090423280720)
,p_name=>'P119_CDGO_TPO_RSPNSBLE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(191833084851365953)
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
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73774479994280721)
,p_name=>'P119_CDGO_IDNTFCCION_TPO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(191833084851365953)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.dscrpcion_idntfccion_tpo    d',
'        , a.cdgo_idntfccion_tpo         r',
'     from df_s_identificaciones_tipo    a',
' order by a.dscrpcion_idntfccion_tpo; '))
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
 p_id=>wwv_flow_api.id(73774889032280721)
,p_name=>'P119_IDNTFCCION'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(191833084851365953)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P119_SEQ_ID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73775274982280722)
,p_name=>'P119_PRMER_NMBRE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(191833084851365953)
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
 p_id=>wwv_flow_api.id(73775625877280722)
,p_name=>'P119_SGNDO_NMBRE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(191833084851365953)
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
 p_id=>wwv_flow_api.id(73776035328280722)
,p_name=>'P119_PRMER_APLLDO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(191833084851365953)
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
 p_id=>wwv_flow_api.id(73776421032280723)
,p_name=>'P119_SGNDO_APLLDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(191833084851365953)
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
 p_id=>wwv_flow_api.id(73776852737280723)
,p_name=>'P119_ID_PAIS_NTFCCION'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(191833084851365953)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73777235736280723)
,p_name=>'P119_ID_DPRTMNTO_NTFCCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(191833084851365953)
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
 p_id=>wwv_flow_api.id(73777670500280723)
,p_name=>'P119_ID_MNCPIO_NTFCCION'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(191833084851365953)
,p_item_default=>'select id_mncpio from df_s_clientes where cdgo_clnte = :F_CDGO_CLNTE'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Municipio'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_mncpio as d,',
'        a.id_mncpio as r',
'from df_s_municipios a',
'where a.id_dprtmnto = :P119_ID_DPRTMNTO_NTFCCION;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P119_ID_DPRTMNTO_NTFCCION'
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
 p_id=>wwv_flow_api.id(73778049170280724)
,p_name=>'P119_DRCCION_NTFCCION'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(191833084851365953)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumeroEspacio'');" onkeyup="campoMayuscula(this)"'
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
 p_id=>wwv_flow_api.id(73778430169280724)
,p_name=>'P119_TLFNO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(191833084851365953)
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
 p_id=>wwv_flow_api.id(73778806763280724)
,p_name=>'P119_CLLAR'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(191833084851365953)
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
 p_id=>wwv_flow_api.id(73779286600280724)
,p_name=>'P119_EMAIL'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(191833084851365953)
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
 p_id=>wwv_flow_api.id(73779625383280724)
,p_name=>'P119_ACTVO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(191833084851365953)
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
 p_id=>wwv_flow_api.id(73780049653280725)
,p_name=>'P119_ID_TRCRO'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(191833084851365953)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73780463858280725)
,p_name=>'P119_ORGEN_DCMNTO'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(191833084851365953)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73780826412280725)
,p_name=>'P119_PRCNTJE_PRTCPCION'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(191833084851365953)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(73747767417113419)
,p_validation_name=>'Validar que la Instancia del Flujo no sea nula'
,p_validation_sequence=>10
,p_validation=>'F_ID_INSTNCIA_FLJO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'No se puede registrar la solicitud'
,p_when_button_pressed=>wwv_flow_api.id(73772067316280698)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(73781374683280774)
,p_validation_name=>'Valida correo'
,p_validation_sequence=>20
,p_validation=>'regexp_like (:P119_EMAIL, ''^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Ingrese un correo valido.'
,p_associated_item=>wwv_flow_api.id(73779286600280724)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(73781670663280775)
,p_validation_name=>'Valida tipo responsable'
,p_validation_sequence=>30
,p_validation=>'P119_CDGO_TPO_RSPNSBLE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'CREATE,BTN_APLICAR_CAMBIOS'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(73774090423280720)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(73782054068280775)
,p_validation_name=>'Valida el tipo de identificacion'
,p_validation_sequence=>40
,p_validation=>'P119_CDGO_IDNTFCCION_TPO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'CREATE,BTN_APLICAR_CAMBIOS'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(73774479994280721)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(73782450702280775)
,p_validation_name=>'Valida el primer nombre'
,p_validation_sequence=>50
,p_validation=>'P119_PRMER_NMBRE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'CREATE,BTN_APLICAR_CAMBIOS'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(73775274982280722)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(73782865211280775)
,p_validation_name=>'Valida el primer apellido'
,p_validation_sequence=>60
,p_validation=>'P119_PRMER_APLLDO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'CREATE,BTN_APLICAR_CAMBIOS'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(73776035328280722)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(73783207500280775)
,p_validation_name=>'Valida departamento'
,p_validation_sequence=>70
,p_validation=>'P119_ID_DPRTMNTO_NTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'CREATE,BTN_APLICAR_CAMBIOS'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(73777235736280723)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(73783601836280776)
,p_validation_name=>'Valida municipio'
,p_validation_sequence=>80
,p_validation=>'P119_ID_MNCPIO_NTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'CREATE,BTN_APLICAR_CAMBIOS'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(73777670500280723)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(73784031224280776)
,p_validation_name=>unistr('Valida direcci\00F3n ')
,p_validation_sequence=>90
,p_validation=>'P119_DRCCION_NTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'CREATE,BTN_APLICAR_CAMBIOS'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(73778049170280724)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(73787501010280783)
,p_name=>'Carga responsable'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P119_IDNTFCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73788072997280784)
,p_event_id=>wwv_flow_api.id(73787501010280783)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(73788467554280784)
,p_name=>'Al hacer clic en Regresar Cerrar Modal'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(73771631309280697)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73788972303280786)
,p_event_id=>wwv_flow_api.id(73788467554280784)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(73785149695280779)
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
'     into :P119_ID_SJTO_RSPNSBLE',
'        , :P119_ID_SJTO_IMPSTO',
'        , :P119_CDGO_IDNTFCCION_TPO',
'        , :P119_IDNTFCCION',
'        , :P119_PRMER_NMBRE',
'        , :P119_SGNDO_NMBRE',
'        , :P119_PRMER_APLLDO',
'        , :P119_SGNDO_APLLDO',
'        , :P119_PRNCPAL_S_N',
'        , :P119_CDGO_TPO_RSPNSBLE',
'        , :P119_PRCNTJE_PRTCPCION',
'        , :P119_ORGEN_DCMNTO',
'        , :P119_ID_PAIS_NTFCCION',
'        , :P119_ID_DPRTMNTO_NTFCCION',
'        , :P119_ID_MNCPIO_NTFCCION',
'        , :P119_DRCCION_NTFCCION',
'        , :P119_EMAIL',
'        , :P119_TLFNO',
'        , :P119_CLLAR',
'        , :P119_ACTVO',
'        , :P119_ID_TRCRO',
'     from apex_collections    a',
'    where collection_name     = ''RESPONSABLES''',
'      and seq_id              = :P119_SEQ_ID',
'      and n001                = :F_ID_INSTNCIA_FLJO;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P119_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(73785511464280779)
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
'            t.email',
'    into    :P119_CDGO_IDNTFCCION_TPO,',
'            :P119_PRMER_NMBRE,',
'            :P119_SGNDO_NMBRE,',
'            :P119_PRMER_APLLDO,',
'            :P119_SGNDO_APLLDO,',
'            :P119_ID_DPRTMNTO_NTFCCION,',
'            :P119_ID_MNCPIO_NTFCCION,',
'            :P119_DRCCION_NTFCCION,',
'            :P119_TLFNO,',
'            :P119_EMAIL',
'    from si_c_terceros t',
'    where t.idntfccion   = :P119_IDNTFCCION',
'      and t.cdgo_clnte   = :F_CDGO_CLNTE',
'      and rownum         = 1;',
'',
'exception',
'    when others then',
'        :P119_CDGO_IDNTFCCION_TPO := null;',
'        :P119_PRMER_NMBRE := null;',
'        :P119_SGNDO_NMBRE := null;',
'        :P119_PRMER_APLLDO := null;',
'        :P119_SGNDO_APLLDO := null;',
'        :P119_ID_DPRTMNTO_NTFCCION := null;',
'        :P119_ID_MNCPIO_NTFCCION := null;',
'        :P119_DRCCION_NTFCCION := null;',
'        :P119_TLFNO := null;',
'        :P119_EMAIL := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P119_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(73784718536280779)
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
'    if :P119_SEQ_ID is null then',
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
'               and a.n001            = :F_ID_INSTNCIA_FLJO',
'               and a.c004            = :P119_IDNTFCCION;',
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
'               and a.n001            = :F_ID_INSTNCIA_FLJO',
'               and a.c009             = ''S''',
'               and a.c020             = ''S'';',
'        ',
'            if v_prncpal > 0 and :P119_PRNCPAL_S_N = ''S'' then',
'                raise_application_error(-20003,  ''Sr(a). '' || :F_NMBRE_USRIO || '', solo puede ingresar un responsable principal. Por favor valide e intente nuevamente'' );  ',
'            end if;',
'        end; -- FIN Se valida si ya existe un responsable principal',
'        ',
'        begin',
'            apex_collection.add_member(p_collection_name 	=> ''RESPONSABLES''',
'                                     , p_n001               => :F_ID_INSTNCIA_FLJO',
'                                     , p_c001				=> :P119_ID_SJTO_RSPNSBLE',
'									 , p_c002				=> :P119_ID_SJTO_IMPSTO',
'									 , p_c003				=> :P119_CDGO_IDNTFCCION_TPO',
'									 , p_c004				=> :P119_IDNTFCCION',
'									 , p_c005				=> :P119_PRMER_NMBRE',
'									 , p_c006				=> :P119_SGNDO_NMBRE',
'									 , p_c007				=> :P119_PRMER_APLLDO',
'									 , p_c008				=> :P119_SGNDO_APLLDO',
'									 , p_c009				=> :P119_PRNCPAL_S_N',
'									 , p_c010				=> :P119_CDGO_TPO_RSPNSBLE',
'									 , p_c011				=> :P119_PRCNTJE_PRTCPCION',
'									 , p_c012				=> :P119_ORGEN_DCMNTO',
'									 , p_c013				=> :P119_ID_PAIS_NTFCCION',
'									 , p_c014				=> :P119_ID_DPRTMNTO_NTFCCION',
'									 , p_c015				=> :P119_ID_MNCPIO_NTFCCION',
'									 , p_c016				=> :P119_DRCCION_NTFCCION',
'									 , p_c017				=> :P119_EMAIL',
'									 , p_c018				=> :P119_TLFNO',
'									 , p_c019				=> :P119_CLLAR',
'									 , p_c020				=> :P119_ACTVO',
'									 , p_c021				=> :P119_ID_TRCRO',
'									 , p_c022				=> ''NUEVO'');',
'        end;         ',
'    end if;                    ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(73772067316280698)
,p_process_when=>'P119_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NULL'
,p_process_success_message=>'Responsable agregado exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(73785928964280780)
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
'           and a.n001              = :F_ID_INSTNCIA_FLJO',
'           and a.c020              = ''S''',
'           and a.c009              = ''S''',
'           and a.c004              <> :P119_IDNTFCCION;',
'',
'        if v_prncpal > 0 and :P119_PRNCPAL_S_N = ''S'' then',
'            raise_application_error(-20003,  ''Sr(a). '' || :F_NMBRE_USRIO || '', solo puede ingresar un responsable principal. Por favor valide e intente nuevamente'' );  ',
'        end if;',
'    exception',
'        when others then ',
'            raise_application_error(-20003,  ''Sr(a). '' || :F_NMBRE_USRIO || '', ha ocurrido un error. Por favor valide e intente nuevamente'' || sqlerrm );  ',
'    end;',
'    ',
'    begin',
'         apex_collection.update_member (p_collection_name 	=> ''RESPONSABLES''',
'									 , p_seq     			=> :P119_SEQ_ID',
'                                     , p_n001               => :F_ID_INSTNCIA_FLJO',
'                                     , p_c001				=> :P119_ID_SJTO_RSPNSBLE',
'									 , p_c002				=> :P119_ID_SJTO_IMPSTO',
'									 , p_c003				=> :P119_CDGO_IDNTFCCION_TPO',
'									 , p_c004				=> :P119_IDNTFCCION',
'									 , p_c005				=> :P119_PRMER_NMBRE',
'									 , p_c006				=> :P119_SGNDO_NMBRE',
'									 , p_c007				=> :P119_PRMER_APLLDO',
'									 , p_c008				=> :P119_SGNDO_APLLDO',
'									 , p_c009				=> :P119_PRNCPAL_S_N',
'									 , p_c010				=> :P119_CDGO_TPO_RSPNSBLE',
'									 , p_c011				=> :P119_PRCNTJE_PRTCPCION',
'									 , p_c012				=> :P119_ORGEN_DCMNTO',
'									 , p_c013				=> :P119_ID_PAIS_NTFCCION',
'									 , p_c014				=> :P119_ID_DPRTMNTO_NTFCCION',
'									 , p_c015				=> :P119_ID_MNCPIO_NTFCCION',
'									 , p_c016				=> :P119_DRCCION_NTFCCION',
'									 , p_c017				=> :P119_EMAIL',
'									 , p_c018				=> :P119_TLFNO',
'									 , p_c019				=> :P119_CLLAR',
'									 , p_c020				=> :P119_ACTVO',
'									 , p_c021				=> :P119_ID_TRCRO',
'                                     , p_c022               => ''ACTUALIZADO'');',
'',
'    exception',
'        when others then ',
'            raise_application_error(-20003,  ''Sr(a). '' || :F_NMBRE_USRIO || '', ha ocurrido un error. Por favor valide e intente nuevamente'' );  ',
'    end;    ',
'end;    '))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(73771292621280695)
,p_process_when=>'P119_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'Responsable actualizado exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(73784357092280776)
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
