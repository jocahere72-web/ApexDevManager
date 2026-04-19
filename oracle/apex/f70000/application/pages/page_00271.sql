prompt --application/pages/page_00271
begin
wwv_flow_api.create_page(
 p_id=>271
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Responsables - Registro de Sujeto Impuesto'
,p_page_mode=>'MODAL'
,p_step_title=>'Responsables - Registro de Sujeto Impuesto'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_dialog_chained=>'N'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250204175815'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(551421446167456135)
,p_plug_name=>'Responsables'
,p_region_name=>'rspnsble'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(186594096707545441)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(551421446167456135)
,p_button_name=>'BNT_APLICAR_CAMBIOS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P271_SEQ_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(186594489133545442)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(551421446167456135)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Regresar / Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(186594899057545442)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(551421446167456135)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_execute_validations=>'N'
,p_button_condition=>'P271_SEQ_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186595216037545445)
,p_name=>'P271_SEQ_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(551421446167456135)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186595634658545447)
,p_name=>'P271_ID_SJTO_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(551421446167456135)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186596044303545447)
,p_name=>'P271_ID_SJTO_RSPNSBLE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(551421446167456135)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186596470228545447)
,p_name=>'P271_PRNCPAL_S_N'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(551421446167456135)
,p_item_default=>'S'
,p_prompt=>'Principal'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(5646119019866897)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186596831452545448)
,p_name=>'P271_CDGO_TPO_RSPNSBLE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(551421446167456135)
,p_prompt=>'Tipo Responsable'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select r.dscrpcion_rspnsble_tpo as d,',
'       r.cdgo_rspnsble_tpo as r',
'from df_s_responsables_tipo r;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186597258178545498)
,p_name=>'P271_CDGO_IDNTFCCION_TPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(551421446167456135)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion_idntfccion_tpo as d,',
'        a.cdgo_idntfccion_tpo as r',
'from df_s_identificaciones_tipo a',
'order by 1; '))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186597662248545499)
,p_name=>'P271_IDNTFCCION'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(551421446167456135)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P271_SEQ_ID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186598083035545550)
,p_name=>'P271_PRMER_NMBRE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(551421446167456135)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186598431398545551)
,p_name=>'P271_SGNDO_NMBRE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(551421446167456135)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186598822045545551)
,p_name=>'P271_PRMER_APLLDO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(551421446167456135)
,p_prompt=>'Primer Aperllido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186599222843545552)
,p_name=>'P271_SGNDO_APLLDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(551421446167456135)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186599671772545552)
,p_name=>'P271_ID_PAIS_NTFCCION'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(551421446167456135)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186600054971545553)
,p_name=>'P271_ID_DPRTMNTO_NTFCCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(551421446167456135)
,p_item_default=>'select id_dprtmnto from df_s_clientes where cdgo_clnte = :F_CDGO_CLNTE'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Departamento'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_dprtmnto as d,',
'        a.id_dprtmnto as r',
'from df_s_departamentos a;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186600450960545571)
,p_name=>'P271_ID_MNCPIO_NTFCCION'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(551421446167456135)
,p_item_default=>'select id_mncpio from df_s_clientes where cdgo_clnte = :F_CDGO_CLNTE'
,p_item_default_type=>'SQL_QUERY_COLON'
,p_prompt=>'Municipio'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_mncpio as d,',
'        a.id_mncpio as r',
'from df_s_municipios a',
'where a.id_dprtmnto = :P271_ID_DPRTMNTO_NTFCCION;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P271_ID_DPRTMNTO_NTFCCION'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186600824932545571)
,p_name=>'P271_DRCCION_NTFCCION'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(551421446167456135)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186601234267545571)
,p_name=>'P271_TLFNO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(551421446167456135)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186601625225545572)
,p_name=>'P271_CLLAR'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(551421446167456135)
,p_prompt=>'Celular'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186602093988545572)
,p_name=>'P271_EMAIL'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(551421446167456135)
,p_prompt=>'Correo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186602428309545572)
,p_name=>'P271_ACTVO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(551421446167456135)
,p_item_default=>'S'
,p_prompt=>unistr('\00BFActivo?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(5646119019866897)||'.'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186602876980545573)
,p_name=>'P271_ID_TRCRO'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(551421446167456135)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186603236385545573)
,p_name=>'P271_ORGEN_DCMNTO'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(551421446167456135)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186603603104545573)
,p_name=>'P271_PRCNTJE_PRTCPCION'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(551421446167456135)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(186604131299545578)
,p_validation_name=>'Valida correo'
,p_validation_sequence=>20
,p_validation=>'regexp_like (:P271_EMAIL, ''^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Ingrese un correo valido.'
,p_associated_item=>wwv_flow_api.id(186602093988545572)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(186604554763545580)
,p_validation_name=>'Valida tipo responsable'
,p_validation_sequence=>30
,p_validation=>'P271_CDGO_TPO_RSPNSBLE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'CREATE,BTN_APLICAR_CAMBIOS'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_when_button_pressed=>wwv_flow_api.id(186594899057545442)
,p_associated_item=>wwv_flow_api.id(186596831452545448)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(186604994202545580)
,p_validation_name=>'Valida el tipo de identificacion'
,p_validation_sequence=>40
,p_validation=>'P271_CDGO_IDNTFCCION_TPO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'CREATE,BTN_APLICAR_CAMBIOS'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_when_button_pressed=>wwv_flow_api.id(186594899057545442)
,p_associated_item=>wwv_flow_api.id(186597258178545498)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(186605313264545581)
,p_validation_name=>'Valida el primer nombre'
,p_validation_sequence=>50
,p_validation=>'P271_PRMER_NMBRE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'CREATE,BTN_APLICAR_CAMBIOS'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_when_button_pressed=>wwv_flow_api.id(186594899057545442)
,p_associated_item=>wwv_flow_api.id(186598083035545550)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(186605708153545581)
,p_validation_name=>'Valida el primer apellido'
,p_validation_sequence=>60
,p_validation=>'P271_PRMER_APLLDO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'CREATE,BTN_APLICAR_CAMBIOS'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_when_button_pressed=>wwv_flow_api.id(186594899057545442)
,p_associated_item=>wwv_flow_api.id(186598822045545551)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(186606120865545581)
,p_validation_name=>'Valida departamento'
,p_validation_sequence=>70
,p_validation=>'P271_ID_DPRTMNTO_NTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'CREATE,BTN_APLICAR_CAMBIOS'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_when_button_pressed=>wwv_flow_api.id(186594899057545442)
,p_associated_item=>wwv_flow_api.id(186600054971545553)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(186606575738545581)
,p_validation_name=>'Valida municipio'
,p_validation_sequence=>80
,p_validation=>'P271_ID_MNCPIO_NTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'CREATE,BTN_APLICAR_CAMBIOS'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_when_button_pressed=>wwv_flow_api.id(186594899057545442)
,p_associated_item=>wwv_flow_api.id(186600450960545571)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(186606910706545582)
,p_validation_name=>unistr('Valida direcci\00F3n ')
,p_validation_sequence=>90
,p_validation=>'P271_DRCCION_NTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'CREATE,BTN_APLICAR_CAMBIOS'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_when_button_pressed=>wwv_flow_api.id(186594899057545442)
,p_associated_item=>wwv_flow_api.id(186600824932545571)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(186609290346545594)
,p_name=>'Carga responsable'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P271_IDNTFCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(186609771044545600)
,p_event_id=>wwv_flow_api.id(186609290346545594)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(186610099119545601)
,p_name=>'Al hacer clic en Regresar Cerrar Modal'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(186594489133545442)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(186610571492545652)
,p_event_id=>wwv_flow_api.id(186610099119545601)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(186608015872545590)
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
'     into :P271_ID_SJTO_RSPNSBLE',
'        , :P271_ID_SJTO_IMPSTO',
'        , :P271_CDGO_IDNTFCCION_TPO',
'        , :P271_IDNTFCCION',
'        , :P271_PRMER_NMBRE',
'        , :P271_SGNDO_NMBRE',
'        , :P271_PRMER_APLLDO',
'        , :P271_SGNDO_APLLDO',
'        , :P271_PRNCPAL_S_N',
'        , :P271_CDGO_TPO_RSPNSBLE',
'        , :P271_PRCNTJE_PRTCPCION',
'        , :P271_ORGEN_DCMNTO',
'        , :P271_ID_PAIS_NTFCCION',
'        , :P271_ID_DPRTMNTO_NTFCCION',
'        , :P271_ID_MNCPIO_NTFCCION',
'        , :P271_DRCCION_NTFCCION',
'        , :P271_EMAIL',
'        , :P271_TLFNO',
'        , :P271_CLLAR',
'        , :P271_ACTVO',
'        , :P271_ID_TRCRO',
'     from apex_collections    a',
'    where collection_name     = ''RESPONSABLES''',
'      and seq_id              = :P271_SEQ_ID;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P271_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(186608449851545591)
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
'    into    :P271_CDGO_IDNTFCCION_TPO,',
'            :P271_PRMER_NMBRE,',
'            :P271_SGNDO_NMBRE,',
'            :P271_PRMER_APLLDO,',
'            :P271_SGNDO_APLLDO,',
'            :P271_ID_DPRTMNTO_NTFCCION,',
'            :P271_ID_MNCPIO_NTFCCION,',
'            :P271_DRCCION_NTFCCION,',
'            :P271_TLFNO,',
'            :P271_EMAIL,',
'            :P271_CLLAR',
'    from si_c_terceros t',
'    where t.idntfccion   = :P271_IDNTFCCION',
'      and t.cdgo_clnte   = :F_CDGO_CLNTE',
'      and rownum         = 1;',
'',
'exception',
'    when others then',
'        :P271_CDGO_IDNTFCCION_TPO := null;',
'        :P271_PRMER_NMBRE := null;',
'        :P271_SGNDO_NMBRE := null;',
'        :P271_PRMER_APLLDO := null;',
'        :P271_SGNDO_APLLDO := null;',
'        :P271_ID_DPRTMNTO_NTFCCION := null;',
'        :P271_ID_MNCPIO_NTFCCION := null;',
'        :P271_DRCCION_NTFCCION := null;',
'        :P271_TLFNO := null;',
'        :P271_EMAIL := null;',
'        :P271_CLLAR    := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P271_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(186607627723545588)
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
'    if :P271_SEQ_ID is null then',
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
'               and a.c004            = :P271_IDNTFCCION;',
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
'            if v_prncpal > 0 and :P271_PRNCPAL_S_N = ''S'' then',
'                raise_application_error(-20001,  ''Solo puede ingresar un responsable principal. Por favor valide e intente nuevamente'' );  ',
'            end if;',
'        end; -- FIN Se valida si ya existe un responsable principal',
'        ',
'        begin',
'            apex_collection.add_member(p_collection_name 	=> ''RESPONSABLES''',
'                                     , p_c001				=> :P271_ID_SJTO_RSPNSBLE',
'									 , p_c002				=> :P271_ID_SJTO_IMPSTO',
'									 , p_c003				=> :P271_CDGO_IDNTFCCION_TPO',
'									 , p_c004				=> :P271_IDNTFCCION',
'									 , p_c005				=> :P271_PRMER_NMBRE',
'									 , p_c006				=> :P271_SGNDO_NMBRE',
'									 , p_c007				=> :P271_PRMER_APLLDO',
'									 , p_c008				=> :P271_SGNDO_APLLDO',
'									 , p_c009				=> :P271_PRNCPAL_S_N',
'									 , p_c010				=> :P271_CDGO_TPO_RSPNSBLE',
'									 , p_c011				=> :P271_PRCNTJE_PRTCPCION',
'									 , p_c012				=> :P271_ORGEN_DCMNTO',
'									 , p_c013				=> :P271_ID_PAIS_NTFCCION',
'									 , p_c014				=> :P271_ID_DPRTMNTO_NTFCCION',
'									 , p_c015				=> :P271_ID_MNCPIO_NTFCCION',
'									 , p_c016				=> :P271_DRCCION_NTFCCION',
'									 , p_c017				=> :P271_EMAIL',
'									 , p_c018				=> :P271_TLFNO',
'									 , p_c019				=> :P271_CLLAR',
'									 , p_c020				=> :P271_ACTVO',
'									 , p_c021				=> :P271_ID_TRCRO',
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
,p_process_when_button_id=>wwv_flow_api.id(186594899057545442)
,p_process_when=>'P271_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NULL'
,p_process_success_message=>'Responsable agregado exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(186608873626545591)
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
'           and a.c004              <> :P271_IDNTFCCION;',
'',
'        if v_prncpal > 0 and :P271_PRNCPAL_S_N = ''S'' then',
'            raise_application_error(-20003,  ''Sr(a). '' || :F_NMBRE_USRIO || '', solo puede ingresar un responsable principal. Por favor valide e intente nuevamente'' );  ',
'        end if;',
'    exception',
'        when others then ',
'            raise_application_error(-20003,  ''Sr(a). '' || :F_NMBRE_USRIO || '', ha ocurrido un error. Por favor valide e intente nuevamente'' || sqlerrm );  ',
'    end;',
'    ',
'    begin',
'         apex_collection.update_member (p_collection_name 	=> ''RESPONSABLES''',
'									 , p_seq     			=> :P271_SEQ_ID',
'                                     , p_c001				=> :P271_ID_SJTO_RSPNSBLE',
'									 , p_c002				=> :P271_ID_SJTO_IMPSTO',
'									 , p_c003				=> :P271_CDGO_IDNTFCCION_TPO',
'									 , p_c004				=> :P271_IDNTFCCION',
'									 , p_c005				=> :P271_PRMER_NMBRE',
'									 , p_c006				=> :P271_SGNDO_NMBRE',
'									 , p_c007				=> :P271_PRMER_APLLDO',
'									 , p_c008				=> :P271_SGNDO_APLLDO',
'									 , p_c009				=> :P271_PRNCPAL_S_N',
'									 , p_c010				=> :P271_CDGO_TPO_RSPNSBLE',
'									 , p_c011				=> :P271_PRCNTJE_PRTCPCION',
'									 , p_c012				=> :P271_ORGEN_DCMNTO',
'									 , p_c013				=> :P271_ID_PAIS_NTFCCION',
'									 , p_c014				=> :P271_ID_DPRTMNTO_NTFCCION',
'									 , p_c015				=> :P271_ID_MNCPIO_NTFCCION',
'									 , p_c016				=> :P271_DRCCION_NTFCCION',
'									 , p_c017				=> :P271_EMAIL',
'									 , p_c018				=> :P271_TLFNO',
'									 , p_c019				=> :P271_CLLAR',
'									 , p_c020				=> :P271_ACTVO',
'									 , p_c021				=> :P271_ID_TRCRO',
'                                     , p_c022               => ''ACTUALIZADO'');',
'',
'    exception',
'        when others then ',
'            raise_application_error(-20003,  ''Sr(a). '' || :F_NMBRE_USRIO || '', ha ocurrido un error. Por favor valide e intente nuevamente'' );  ',
'    end;    ',
'end;    '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(186594096707545441)
,p_process_when=>'P271_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'Responsable actualizado exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(186607247227545582)
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
