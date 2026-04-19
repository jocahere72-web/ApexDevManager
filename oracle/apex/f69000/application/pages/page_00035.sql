prompt --application/pages/page_00035
begin
wwv_flow_api.create_page(
 p_id=>35
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>'Responsables Sujeto Responsable'
,p_page_mode=>'MODAL'
,p_step_title=>'Responsables Sujeto Responsable'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(74223836934679730)
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function actualizar_temporal(p_this){  ',
'    ',
'    var item_nmbre =  p_this.triggeringElement.name;',
'    var item_vlor =  apex.item(item_nmbre).getValue();',
'    ',
'    ',
'    apex.server.process(''actualizar_temporal'', {',
'        f01: item_nmbre,',
'        f02: item_vlor',
'    }, {',
'        success: function (data) { ',
'                if (data.type === ''OK'') {',
'                    window.localStorage.clear();',
'                    window.location.href = data.url;',
'                }else{',
'                    apex.message.showErrors({',
'                        type: apex.message.TYPE.ERROR,',
'                        location: ["page"],',
'                        message: data.msg,',
'                        unsafe: false',
'                    });',
'                }',
'            },',
'            error: function () {',
'                console.log(arguments);',
'            }',
'        }); ',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20240311162554'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(118062415116085292)
,p_plug_name=>'Responsables'
,p_region_name=>'rspnsble'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(70122860564256619)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(118062415116085292)
,p_button_name=>'BNT_APLICAR_CAMBIOS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P35_SEQ_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(70522791013301924)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(118062415116085292)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>'Regresar / Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(70102751359135803)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(118062415116085292)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P35_SEQ_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12435058911684201)
,p_name=>'P35_ID_PAIS_NTFCCION'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(118062415116085292)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70123294758256621)
,p_name=>'P35_PRNCPAL_S_N'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(118062415116085292)
,p_item_default=>'S'
,p_prompt=>'Principal'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO'
,p_lov=>'.'||wwv_flow_api.id(105710618312748017)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70123610848256625)
,p_name=>'P35_CDGO_TPO_RSPNSBLE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(118062415116085292)
,p_prompt=>'Tipo Responsable'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select r.dscrpcion_rspnsble_tpo as d,',
'       r.cdgo_rspnsble_tpo as r',
'from df_s_responsables_tipo r;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70124061277256627)
,p_name=>'P35_CDGO_IDNTFCCION_TPO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(118062415116085292)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion_idntfccion_tpo as d,',
'        a.cdgo_idntfccion_tpo as r',
'from df_s_identificaciones_tipo a',
'order by dscrpcion_idntfccion_tpo ; '))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70124471427256628)
,p_name=>'P35_IDNTFCCION'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(118062415116085292)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P35_SEQ_ID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70124880492256629)
,p_name=>'P35_PRMER_NMBRE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(118062415116085292)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70125268203256629)
,p_name=>'P35_SGNDO_NMBRE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(118062415116085292)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70125616853256629)
,p_name=>'P35_PRMER_APLLDO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(118062415116085292)
,p_prompt=>'Primer Aperllido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70126049472256629)
,p_name=>'P35_SGNDO_APLLDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(118062415116085292)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70126449891256630)
,p_name=>'P35_ID_DPRTMNTO_NTFCCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(118062415116085292)
,p_prompt=>'Departamento'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_dprtmnto as d,',
'        a.id_dprtmnto as r',
'from df_s_departamentos a;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70126811577256630)
,p_name=>'P35_ID_MNCPIO_NTFCCION'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(118062415116085292)
,p_prompt=>'Municipio'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_mncpio as d,',
'        a.id_mncpio as r',
'from df_s_municipios a',
'where a.id_dprtmnto = :P35_ID_DPRTMNTO_NTFCCION;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P35_ID_DPRTMNTO_NTFCCION'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70127228912256630)
,p_name=>'P35_DRCCION_NTFCCION'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(118062415116085292)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70127634258256630)
,p_name=>'P35_TLFNO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(118062415116085292)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70128031649256631)
,p_name=>'P35_EMAIL'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(118062415116085292)
,p_prompt=>'Correo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70128453565256631)
,p_name=>'P35_ACTVO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(118062415116085292)
,p_item_default=>'S'
,p_prompt=>unistr('\00BFActivo?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO'
,p_lov=>'.'||wwv_flow_api.id(105710618312748017)||'.'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70128890289256631)
,p_name=>'P35_SEQ_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(118062415116085292)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70129281128256631)
,p_name=>'P35_ID_SJTO_RSPNSBLE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(118062415116085292)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70520431899301901)
,p_name=>'P35_CLLAR'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(118062415116085292)
,p_prompt=>'Celular'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70520542169301902)
,p_name=>'P35_ID_TRCRO'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(118062415116085292)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70652058282896401)
,p_name=>'P35_ORGEN_DCMNTO'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(118062415116085292)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70652126052896402)
,p_name=>'P35_PRCNTJE_PRTCPCION'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(118062415116085292)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70652207030896403)
,p_name=>'P35_ID_SJTO_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(118062415116085292)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(70129742271256632)
,p_validation_name=>'Valida correo'
,p_validation_sequence=>10
,p_validation=>'regexp_like (:P35_EMAIL, ''^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Ingrese un correo valido.'
,p_associated_item=>wwv_flow_api.id(70128031649256631)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(70130114192256638)
,p_validation_name=>'Valida tipo responsable'
,p_validation_sequence=>20
,p_validation=>'P35_CDGO_TPO_RSPNSBLE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(70122860564256619)
,p_associated_item=>wwv_flow_api.id(70123610848256625)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(70130516567256638)
,p_validation_name=>'Valida el tipo de identificacion'
,p_validation_sequence=>30
,p_validation=>'P35_CDGO_IDNTFCCION_TPO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(70122860564256619)
,p_associated_item=>wwv_flow_api.id(70124061277256627)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(70130968592256638)
,p_validation_name=>'Valida el primer nombre'
,p_validation_sequence=>40
,p_validation=>'P35_PRMER_NMBRE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(70122860564256619)
,p_associated_item=>wwv_flow_api.id(70124880492256629)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(70131360814256644)
,p_validation_name=>'Valida el primer apellido'
,p_validation_sequence=>50
,p_validation=>'P35_PRMER_APLLDO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(70122860564256619)
,p_associated_item=>wwv_flow_api.id(70125616853256629)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(70131765798256644)
,p_validation_name=>'Valida departamento'
,p_validation_sequence=>60
,p_validation=>'P35_ID_DPRTMNTO_NTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(70122860564256619)
,p_associated_item=>wwv_flow_api.id(70126449891256630)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(70132133451256644)
,p_validation_name=>'Valida municipio'
,p_validation_sequence=>70
,p_validation=>'P35_ID_MNCPIO_NTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(70122860564256619)
,p_associated_item=>wwv_flow_api.id(70126811577256630)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(70132563614256645)
,p_validation_name=>unistr('Valida direcci\00F3n ')
,p_validation_sequence=>80
,p_validation=>'P35_DRCCION_NTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(70122860564256619)
,p_associated_item=>wwv_flow_api.id(70127228912256630)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6389090667405001)
,p_validation_name=>'validar formato de celular valido'
,p_validation_sequence=>90
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if length(:P55_CLLAR) != 10 then ',
unistr('        return ''El n\00FAmero de celular ingresado no es valido, por favor ingrese 10 n\00FAmeros'';    '),
'    elsif substr(:P55_CLLAR, 1, 1) != ''3'' then',
unistr('        return ''El n\00FAmero de celular ingresado no es valido, debe iniciar con 3'';    '),
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_api.id(70520431899301901)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6389123100405002)
,p_validation_name=>'validar formato de tefelono valido'
,p_validation_sequence=>100
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if length(:P55_TLFNO) != 7 then ',
unistr('        return ''El n\00FAmero de tel\00E9fono ingresado no es valido, por favor ingrese 7 n\00FAmeros'';  '),
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_api.id(70127634258256630)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(70134809975256647)
,p_name=>'Carga responsable'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P35_IDNTFCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70135388129256649)
,p_event_id=>wwv_flow_api.id(70134809975256647)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(70522813691301925)
,p_name=>'Al hacer clic en Regresar Cerrar Modal'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(70522791013301924)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70522945542301926)
,p_event_id=>wwv_flow_api.id(70522813691301925)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(70523349118301930)
,p_name=>'Al cambiar actualizar en la temporal el nuevo valor'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P35_SEQ_ID,P35_ID_SJTO_RSPNSBLE,P35_PRNCPAL_S_N,P35_CDGO_TPO_RSPNSBLE,P35_IDNTFCCION,P35_PRMER_NMBRE,P35_SGNDO_NMBRE,P35_PRMER_APLLDO,P35_SGNDO_APLLDO,P35_ID_DPRTMNTO_NTFCCION,P35_ID_MNCPIO_NTFCCION,P35_DRCCION_NTFCCION,P35_TLFNO,P35_CLLAR,P35_EMAIL,'
||'P35_ACTVO,P35_ID_TRCRO,P35_CDGO_IDNTFCCION_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70523423927301931)
,p_event_id=>wwv_flow_api.id(70523349118301930)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'actualizar_temporal(this);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(70133618924256646)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta en la coleccion los datos del responsable '
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
'     into :P35_ID_SJTO_RSPNSBLE',
'        , :P35_ID_SJTO_IMPSTO',
'        , :P35_CDGO_IDNTFCCION_TPO',
'        , :P35_IDNTFCCION',
'        , :P35_PRMER_NMBRE',
'        , :P35_SGNDO_NMBRE',
'        , :P35_PRMER_APLLDO',
'        , :P35_SGNDO_APLLDO',
'        , :P35_PRNCPAL_S_N',
'        , :P35_CDGO_TPO_RSPNSBLE',
'        , :P35_PRCNTJE_PRTCPCION',
'        , :P35_ORGEN_DCMNTO',
'        , :P35_ID_PAIS_NTFCCION',
'        , :P35_ID_DPRTMNTO_NTFCCION',
'        , :P35_ID_MNCPIO_NTFCCION',
'        , :P35_DRCCION_NTFCCION',
'        , :P35_EMAIL',
'        , :P35_TLFNO',
'        , :P35_CLLAR',
'        , :P35_ACTVO',
'        , :P35_ID_TRCRO',
'     from apex_collections    a',
'    where collection_name     = ''RESPONSABLES''',
'      and seq_id              = :P35_SEQ_ID',
'      and n001                = :F_ID_INSTNCIA_FLJO;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P35_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(70523274602301929)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Llenar temporal con los datos del sujeto responsable'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_tmpral    number;',
'    v_error        varchar2(1000);',
'    v_estdo        varchar2(100);',
'begin',
'   ',
'   begin',
'       select nvl(count(1),0)',
'         into v_id_tmpral',
'         from gn_g_temporal      a',
'        where -- a.id_ssion         = :APP_SESSION and',
'            a.n001             = :F_ID_INSTNCIA_FLJO',
'          and a.c005             = ''RESPONSABLE''',
'          and a.n002             = :P35_SEQ_ID;',
'    exception ',
'        when others then ',
'            v_id_tmpral    := null;',
'    end;',
'    ',
'    insert into muerto2 (v_001, v_002, t_001) values (''PARAMETROS :P35_SEQ_ID '',:P35_SEQ_ID,SYSDATE); commit;',
'    ',
'    ',
'    if :P35_SEQ_ID is null then ',
'        v_estdo    := ''NUEVO'';',
'    else',
'        v_estdo    := ''ACTUALIZACION'';',
'    end if;',
'    if v_id_tmpral = 0 then ',
'       for c_items in (select item_name',
'                          , label',
'                          ,apex_util.get_session_state(item_name) session_value',
'                      from apex_application_page_items',
'                     where application_id                 = :APP_ID',
'                       and page_id                        = :APP_PAGE_ID) loop',
'',
'        insert into gn_g_temporal (id_ssion,                 n001,                    n002,                      c001,                ',
'                                   c002,                     c003,                    c004,                      c005,',
'                                   c006)',
'                           values (:APP_SESSION,             :F_ID_INSTNCIA_FLJO,     :P35_SEQ_ID,               c_items.item_name,   ',
'                                   c_items.session_value,    c_items.session_value,   c_items.label,             ''RESPONSABLE'',',
'                                   v_estdo);',
'        end loop;',
'    end if;',
'    ',
'    ',
'',
'exception',
'    when others then ',
'        v_error    := sqlcode || '' -- '' || sqlerrm;',
'        insert into gti_aux (col1, col2) values (''Error'', v_error); commit;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
' from gn_g_temporal      a',
'where --a.id_ssion         = :APP_SESSION and',
'      a.n001             = :F_ID_INSTNCIA_FLJO',
'  and a.c005             = ''RESPONSABLE''',
'  and a.n001             = :P35_SEQ_ID ',
'  and :P35_SEQ_ID        is not null;'))
,p_process_when_type=>'EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(70134001336256647)
,p_process_sequence=>40
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
'    into    :P35_CDGO_IDNTFCCION_TPO,',
'            :P35_PRMER_NMBRE,',
'            :P35_SGNDO_NMBRE,',
'            :P35_PRMER_APLLDO,',
'            :P35_SGNDO_APLLDO,',
'            :P35_ID_DPRTMNTO_NTFCCION,',
'            :P35_ID_MNCPIO_NTFCCION,',
'            :P35_DRCCION_NTFCCION,',
'            :P35_TLFNO,',
'            :P35_EMAIL',
'    from si_c_terceros t',
'    where t.idntfccion = :P35_IDNTFCCION',
'    and t.cdgo_clnte   = :F_CDGO_CLNTE;',
'',
'exception',
'    when no_data_found then',
'        :P35_CDGO_IDNTFCCION_TPO := null;',
'        :P35_PRMER_NMBRE := null;',
'        :P35_SGNDO_NMBRE := null;',
'        :P35_PRMER_APLLDO := null;',
'        :P35_SGNDO_APLLDO := null;',
'        :P35_ID_DPRTMNTO_NTFCCION := null;',
'        :P35_ID_MNCPIO_NTFCCION := null;',
'        :P35_DRCCION_NTFCCION := null;',
'        :P35_TLFNO := null;',
'        :P35_EMAIL := null;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P35_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(70133237852256646)
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
'    if :P35_SEQ_ID is null then',
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
'               and a.c004            = :P35_IDNTFCCION;',
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
'            if v_prncpal > 0 and :P35_PRNCPAL_S_N = ''S'' then',
'                raise_application_error(-20003,  ''Sr(a). '' || :F_NMBRE_USRIO || '', solo puede ingresar un responsable principal. Por favor valide e intente nuevamente'' );  ',
'            end if;',
'        end; -- FIN Se valida si ya existe un responsable principal',
'        ',
'        begin',
'            apex_collection.add_member(p_collection_name 	=> ''RESPONSABLES''',
'                                     , p_n001               => :F_ID_INSTNCIA_FLJO',
'                                     , p_c001				=> :P35_ID_SJTO_RSPNSBLE',
'									 , p_c002				=> :P35_ID_SJTO_IMPSTO',
'									 , p_c003				=> :P35_CDGO_IDNTFCCION_TPO',
'									 , p_c004				=> :P35_IDNTFCCION',
'									 , p_c005				=> :P35_PRMER_NMBRE',
'									 , p_c006				=> :P35_SGNDO_NMBRE',
'									 , p_c007				=> :P35_PRMER_APLLDO',
'									 , p_c008				=> :P35_SGNDO_APLLDO',
'									 , p_c009				=> :P35_PRNCPAL_S_N',
'									 , p_c010				=> :P35_CDGO_TPO_RSPNSBLE',
'									 , p_c011				=> :P35_PRCNTJE_PRTCPCION',
'									 , p_c012				=> :P35_ORGEN_DCMNTO',
'									 , p_c013				=> :P35_ID_PAIS_NTFCCION',
'									 , p_c014				=> :P35_ID_DPRTMNTO_NTFCCION',
'									 , p_c015				=> :P35_ID_MNCPIO_NTFCCION',
'									 , p_c016				=> :P35_DRCCION_NTFCCION',
'									 , p_c017				=> :P35_EMAIL',
'									 , p_c018				=> :P35_TLFNO',
'									 , p_c019				=> :P35_CLLAR',
'									 , p_c020				=> :P35_ACTVO',
'									 , p_c021				=> :P35_ID_TRCRO',
'									 , p_c022				=> ''NUEVO'');',
'',
'        insert into gn_g_temporal   (id_ssion								,n001								,c001										,c002				',
'                                    ,c003									,c004								,c005										,c006				',
'                                    ,c007									,c008								,c009										,c010				',
'                                    ,c011									,c012								,c013										,c014				',
'                                    ,c015									,c016								,c017										,c018				',
'                                    ,c019									,c020								,c021										,c022',
'                                    ,c023)								',
'                            values (:F_ID_INSTNCIA_FLJO						,:F_ID_INSTNCIA_FLJO				,:P35_ID_SJTO_RSPNSBLE						,:P35_ID_SJTO_IMPSTO',
'                                    ,:P35_CDGO_IDNTFCCION_TPO				,:P35_IDNTFCCION					,:P35_PRMER_NMBRE							,:P35_SGNDO_NMBRE',
'                                    ,:P35_PRMER_APLLDO						,:P35_SGNDO_APLLDO					,:P35_PRNCPAL_S_N							,:P35_CDGO_TPO_RSPNSBLE',
'                                    ,:P35_PRCNTJE_PRTCPCION					,:P35_ORGEN_DCMNTO					,:P35_ID_PAIS_NTFCCION						,:P35_ID_DPRTMNTO_NTFCCION',
'                                    ,:P35_ID_MNCPIO_NTFCCION				,:P35_DRCCION_NTFCCION				,:P35_EMAIL									,:P35_TLFNO',
'                                    ,:P35_CLLAR								,:P35_ACTVO							,:P35_ID_TRCRO								,''NUEVO''',
'                                    ,''RESPONSABLE_NOVEDADES_PERSONA'');',
'                                ',
'        end;         ',
'    end if;                    ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(70102751359135803)
,p_process_when=>'P35_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NULL'
,p_process_success_message=>'Responsable agregado exitosamente'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(70617782573826401)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Llenar temporal con los datos del nuevo sujeto responsable'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_tmpral    number;',
'    v_error        varchar2(1000);',
'    v_estdo        varchar2(100);',
'    v_seq_id       number;',
'begin',
'   ',
'   begin',
'       select nvl(count(1),0)',
'         into v_id_tmpral',
'         from gn_g_temporal      a',
'        where --a.id_ssion         = :APP_SESSION and',
'            a.n001             = :F_ID_INSTNCIA_FLJO',
'          and a.c005             = ''RESPONSABLE''',
'          and a.c004            = :P35_IDNTFCCION;',
'    exception ',
'        when others then ',
'            v_id_tmpral    := 0;',
'    end;',
'    ',
'    if :P35_SEQ_ID is null then ',
'        v_estdo    := ''NUEVO'';',
'    else',
'        v_estdo    := ''ACTUALIZACION'';',
'    end if;',
'    ',
'     begin',
'        select seq_id',
'          into v_seq_id',
'         from apex_collections   a',
'         where collection_name   = ''RESPONSABLES''',
'           and a.n001            = :F_ID_INSTNCIA_FLJO',
'           and a.c004            = :P35_IDNTFCCION',
'           and a.n001            is null;',
'     end;',
'     ',
'    if v_id_tmpral = 0 then ',
'       for c_items in (select item_name',
'                          , label',
'                          ,apex_util.get_session_state(item_name) session_value',
'                      from apex_application_page_items',
'                     where application_id                 = :APP_ID',
'                       and page_id                        = :APP_PAGE_ID) loop',
'',
'        insert into gn_g_temporal (id_ssion,                 n001,                    n002,                      c001,                ',
'                                   c002,                     c003,                    c004,                      c005,',
'                                   c006)',
'                           values (:APP_SESSION,             :F_ID_INSTNCIA_FLJO,     v_seq_id,                  c_items.item_name,   ',
'                                   c_items.session_value,    c_items.session_value,   c_items.label,             ''RESPONSABLE'',',
'                                   v_estdo);',
'        end loop;',
'    end if;',
'    ',
'    ',
'',
'exception',
'    when others then ',
'        v_error    := sqlcode || '' -- '' || sqlerrm;',
'        insert into gti_aux (col1, col2) values (''Error'', v_error); commit;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_process_success_message=>'Responsable agregado exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(70520603851301903)
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
'           and a.c004              <> :P35_IDNTFCCION;',
'',
'        if v_prncpal > 0 and :P35_PRNCPAL_S_N = ''S'' then',
'            raise_application_error(-20003,  ''Sr(a). '' || :F_NMBRE_USRIO || '', solo puede ingresar un responsable principal. Por favor valide e intente nuevamente'' );  ',
'        end if;',
'    exception',
'        when others then ',
'            raise_application_error(-20003,  ''Sr(a). '' || :F_NMBRE_USRIO || '', ha ocurrido un error. Por favor valide e intente nuevamente'' || sqlerrm );  ',
'    end;',
'    ',
'    begin',
'         apex_collection.update_member (p_collection_name 	=> ''RESPONSABLES''',
'									 , p_seq     			=> :P35_SEQ_ID',
'                                     , p_n001               => :F_ID_INSTNCIA_FLJO',
'                                     , p_c001				=> :P35_ID_SJTO_RSPNSBLE',
'									 , p_c002				=> :P35_ID_SJTO_IMPSTO',
'									 , p_c003				=> :P35_CDGO_IDNTFCCION_TPO',
'									 , p_c004				=> :P35_IDNTFCCION',
'									 , p_c005				=> :P35_PRMER_NMBRE',
'									 , p_c006				=> :P35_SGNDO_NMBRE',
'									 , p_c007				=> :P35_PRMER_APLLDO',
'									 , p_c008				=> :P35_SGNDO_APLLDO',
'									 , p_c009				=> :P35_PRNCPAL_S_N',
'									 , p_c010				=> :P35_CDGO_TPO_RSPNSBLE',
'									 , p_c011				=> :P35_PRCNTJE_PRTCPCION',
'									 , p_c012				=> :P35_ORGEN_DCMNTO',
'									 , p_c013				=> :P35_ID_PAIS_NTFCCION',
'									 , p_c014				=> :P35_ID_DPRTMNTO_NTFCCION',
'									 , p_c015				=> :P35_ID_MNCPIO_NTFCCION',
'									 , p_c016				=> :P35_DRCCION_NTFCCION',
'									 , p_c017				=> :P35_EMAIL',
'									 , p_c018				=> :P35_TLFNO',
'									 , p_c019				=> :P35_CLLAR',
'									 , p_c020				=> :P35_ACTVO',
'									 , p_c021				=> :P35_ID_TRCRO',
'                                     , p_c022               => ''ACTUALIZADO'');',
'',
'                                    update gn_g_temporal ',
'                                    set   c001		= :P35_ID_SJTO_RSPNSBLE		',
'                                         ,c002		= :P35_ID_SJTO_IMPSTO		',
'                                         ,c003		= :P35_CDGO_IDNTFCCION_TPO		',
'                                         ,c004		= :P35_IDNTFCCION		',
'                                         ,c005		= :P35_PRMER_NMBRE		',
'                                         ,c006		= :P35_SGNDO_NMBRE		',
'                                         ,c007		= :P35_PRMER_APLLDO		',
'                                         ,c008		= :P35_SGNDO_APLLDO		',
'                                         ,c009		= :P35_PRNCPAL_S_N		',
'                                         ,c010		= :P35_CDGO_TPO_RSPNSBLE		',
'                                         ,c011		= :P35_PRCNTJE_PRTCPCION		',
'                                         ,c012		= :P35_ORGEN_DCMNTO		',
'                                         ,c013		= :P35_ID_PAIS_NTFCCION		',
'                                         ,c014		= :P35_ID_DPRTMNTO_NTFCCION		',
'                                         ,c015		= :P35_ID_MNCPIO_NTFCCION		',
'                                         ,c016		= :P35_DRCCION_NTFCCION		',
'                                         ,c017		= :P35_EMAIL		',
'                                         ,c018		= :P35_TLFNO		',
'                                         ,c019		= :P35_CLLAR		',
'                                         ,c020		= :P35_ACTVO ',
'                                         ,c021		= :P35_ID_TRCRO',
'                                         ,c022      = ''ACTUALIZADO''	 ',
'                                    where n001		= :F_ID_INSTNCIA_FLJO',
'                                        and c004	= :P35_IDNTFCCION',
'                                        and c023    = ''RESPONSABLE_NOVEDADES_PERSONA'';',
'',
'                               ',
'',
'    exception',
'        when others then ',
'            raise_application_error(-20003,  ''Sr(a). '' || :F_NMBRE_USRIO || '', ha ocurrido un error. Por favor valide e intente nuevamente'' );  ',
'    end;    ',
'end;    '))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(70122860564256619)
,p_process_when=>'P35_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'Responsable actualizado exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(70132836640256645)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar la modal'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,BNT_APLICAR_CAMBIOS'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>unistr('Acci\00F3n Procesada con Exito')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(70523547919301932)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'actualizar_temporal'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_tmpral                gn_g_temporal.id_tmpral%type;',
'    ',
'    v_item_nmbre               varchar2(1000) := apex_application.g_f01(1);',
'    v_item_vlor                varchar2(1000) := apex_application.g_f02(1);',
'    ',
'    v_error                    varchar2(1000);',
'    v_nmro                     number;',
'begin',
'    ',
'    begin',
'        begin',
'           select a.id_tmpral',
'             into v_id_tmpral',
'             from gn_g_temporal      a',
'            where --a.id_ssion         = :APP_SESSION and',
'                a.n001             = :F_ID_INSTNCIA_FLJO',
'              and a.c005             = ''RESPONSABLE''',
'              and a.n002             = :P35_SEQ_ID',
'              and a.c001             = v_item_nmbre;',
'        exception ',
'            when others then ',
'                v_id_tmpral    := null;',
'        end;',
'        ',
'        ',
'        if v_id_tmpral is not null then ',
'        ',
'            update gn_g_temporal    a',
'              set c003              = v_item_vlor',
'                , c006              = ''ACTUALIZACION''',
'             where --a.id_ssion       = :APP_SESSION and',
'                a.n001           = :F_ID_INSTNCIA_FLJO',
'               and a.c005           = ''RESPONSABLE''',
'               and a.n002           = :P35_SEQ_ID',
'               and a.c001           = v_item_nmbre;',
'            v_nmro := sql%rowcount;',
'            /*insert into gti_aux(col1, col2) values (''v_item_nmbre'', v_item_nmbre);',
'            insert into gti_aux(col1, col2) values (''v_item_vlor'', v_item_vlor);*/',
'            commit;',
'            ',
'        else',
'            insert into gn_g_temporal (id_ssion,                 n001,                    n002,                      c001,                ',
'                                       c002,                     c003,                    c004,                      c005,',
'                                       c006)',
'                               values (:APP_SESSION,             :F_ID_INSTNCIA_FLJO,     :P35_SEQ_ID,               v_item_nmbre,   ',
'                                       v_item_vlor,              v_item_vlor,             v_item_nmbre,             ''RESPONSABLE'',',
'                                       ''NUEVO'');',
'',
'            commit;',
'        end if;',
'    ',
'    exception ',
'        when others then ',
'            null;',
'  end;',
'  ',
'  ',
'exception',
'    when others then ',
'        v_error    := sqlcode || '' -  ''|| sqlerrm;',
'         insert into gti_aux(col1, col2) values (''Error'', v_error);',
'         commit;        ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P35_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
