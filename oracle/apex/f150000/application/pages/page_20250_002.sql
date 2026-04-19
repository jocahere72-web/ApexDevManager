prompt --application/pages/page_20250_002
begin
wwv_flow_api.create_page(
 p_id=>2025011
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Registrar Responsables'
,p_page_mode=>'MODAL'
,p_step_title=>'Registrar Responsables'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'HGOMEZ'
,p_last_upd_yyyymmddhh24miss=>'20250717160036'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(53868872387533960)
,p_plug_name=>'Responsables'
,p_region_name=>'rspnsble'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5929343226705292)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(53868872387533960)
,p_button_name=>'BTN_AGRGAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P2025011_ID_SJTO_RSPNSBLE is null and :P2025011_ID_SJTO_IMPSTO is not null ',
'and not exists(select * from si_i_sujetos_responsable where',
'               cdgo_idntfccion_tpo = :P2025011_TPO_IDNTFCCION_R ',
'               and idntfccion = :P2025011_IDNTFCCION_R and id_sjto_impsto = :P2025011_ID_SJTO_IMPSTO);'))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-user-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5900034933424218)
,p_name=>'P2025011_ID_SJTO_IMPSTO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(53868872387533960)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5929731097705295)
,p_name=>'P2025011_PRNCPAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(53868872387533960)
,p_item_default=>'S'
,p_prompt=>'Principal'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Si;S,No;N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5930111869705296)
,p_name=>'P2025011_RSPNSBL_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(53868872387533960)
,p_prompt=>'Tipo Responsable'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select r.dscrpcion_rspnsble_tpo as d,',
'       r.cdgo_rspnsble_tpo as r',
'from df_s_responsables_tipo r',
'order by r.dscrpcion_rspnsble_tpo;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5930529703705296)
,p_name=>'P2025011_TPO_IDNTFCCION_R'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(53868872387533960)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion_idntfccion_tpo as d,',
'        a.cdgo_idntfccion_tpo as r',
'from df_s_identificaciones_tipo a',
'order by a.dscrpcion_idntfccion_tpo; '))
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
 p_id=>wwv_flow_api.id(5930980698705297)
,p_name=>'P2025011_IDNTFCCION_R'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(53868872387533960)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P2025011_SEQ_ID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5931339295705297)
,p_name=>'P2025011_PRMER_NMBRE_R'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(53868872387533960)
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
 p_id=>wwv_flow_api.id(5931798181705297)
,p_name=>'P2025011_SGNDO_NMBRE_R'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(53868872387533960)
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
 p_id=>wwv_flow_api.id(5932101476705298)
,p_name=>'P2025011_PRMER_APLLDO_R'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(53868872387533960)
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
 p_id=>wwv_flow_api.id(5932531128705298)
,p_name=>'P2025011_SGNDO_APELLIDO_R'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(53868872387533960)
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
 p_id=>wwv_flow_api.id(5932918177705298)
,p_name=>'P2025011_DPRTMNTO_R'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(53868872387533960)
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
 p_id=>wwv_flow_api.id(5933396452705298)
,p_name=>'P2025011_MNCPIO_R'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(53868872387533960)
,p_prompt=>'Municipio'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_mncpio as d,',
'        a.id_mncpio as r',
'from df_s_municipios a',
'where a.id_dprtmnto = :P2025011_DPRTMNTO_R;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P2025011_DPRTMNTO_R'
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
 p_id=>wwv_flow_api.id(5933780481705298)
,p_name=>'P2025011_DRCCION_R'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(53868872387533960)
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
 p_id=>wwv_flow_api.id(5934158433705299)
,p_name=>'P2025011_TLFNO_R'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(53868872387533960)
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
 p_id=>wwv_flow_api.id(5934577615705299)
,p_name=>'P2025011_EMAIL_R'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(53868872387533960)
,p_prompt=>'Correo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5934961432705299)
,p_name=>'P2025011_ACTVO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(53868872387533960)
,p_item_default=>'S'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5935389457705299)
,p_name=>'P2025011_SEQ_ID'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(53868872387533960)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5935710838705300)
,p_name=>'P2025011_ID_SJTO_RSPNSBLE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(53868872387533960)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5936248861705307)
,p_validation_name=>'Valida correo'
,p_validation_sequence=>10
,p_validation=>'regexp_like (:P2025011_EMAIL_R, ''^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Ingrese un correo valido.'
,p_associated_item=>wwv_flow_api.id(5934577615705299)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5936658669705307)
,p_validation_name=>'Valida tipo responsable'
,p_validation_sequence=>20
,p_validation=>'P2025011_RSPNSBL_TPO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(5929343226705292)
,p_associated_item=>wwv_flow_api.id(5930111869705296)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5937052256705308)
,p_validation_name=>'Valida el tipo de identificacion'
,p_validation_sequence=>30
,p_validation=>'P2025011_TPO_IDNTFCCION_R'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(5929343226705292)
,p_associated_item=>wwv_flow_api.id(5930529703705296)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5937414368705308)
,p_validation_name=>'Valida el primer nombre'
,p_validation_sequence=>40
,p_validation=>'P2025011_PRMER_NMBRE_R'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(5929343226705292)
,p_associated_item=>wwv_flow_api.id(5931339295705297)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5937821548705308)
,p_validation_name=>'Valida el primer apellido'
,p_validation_sequence=>50
,p_validation=>'P2025011_PRMER_APLLDO_R'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(5929343226705292)
,p_associated_item=>wwv_flow_api.id(5932101476705298)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5938214506705308)
,p_validation_name=>'Valida departamento'
,p_validation_sequence=>60
,p_validation=>'P2025011_DPRTMNTO_R'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(5929343226705292)
,p_associated_item=>wwv_flow_api.id(5932918177705298)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5938699065705308)
,p_validation_name=>'Valida municipio'
,p_validation_sequence=>70
,p_validation=>'P2025011_MNCPIO_R'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(5929343226705292)
,p_associated_item=>wwv_flow_api.id(5933396452705298)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5939042266705308)
,p_validation_name=>unistr('Valida direcci\00F3n ')
,p_validation_sequence=>80
,p_validation=>'P2025011_DRCCION_R'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(5929343226705292)
,p_associated_item=>wwv_flow_api.id(5933780481705298)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(12573815333394524)
,p_validation_name=>'valor no nulo'
,p_validation_sequence=>90
,p_validation=>':P2025011_EMAIL_R is not null'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Agregar email'
,p_when_button_pressed=>wwv_flow_api.id(5929343226705292)
,p_associated_item=>wwv_flow_api.id(5934577615705299)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5941386646705311)
,p_name=>'Carga responsable'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2025011_IDNTFCCION_R'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5941818846705312)
,p_event_id=>wwv_flow_api.id(5941386646705311)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5900661746424224)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Carga Responsable'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    ',
'    select  t.cdgo_idntfccion_tpo,',
'            t.prmer_nmbre,',
'            t.sgndo_nmbre,',
'            t.prmer_aplldo,',
'            t.sgndo_aplldo,',
'            t.id_dprtmnto_ntfccion,',
'            t.id_mncpio_ntfccion,',
'            t.drccion_ntfccion,',
'            t.tlfno,',
'            t.email',
'    into    :P2025011_TPO_IDNTFCCION_R,',
'            :P2025011_PRMER_NMBRE_R,',
'            :P2025011_SGNDO_NMBRE_R,',
'            :P2025011_PRMER_APLLDO_R,',
'            :P2025011_SGNDO_APELLIDO_R,',
'            :P2025011_DPRTMNTO_R,',
'            :P2025011_MNCPIO_R,',
'            :P2025011_DRCCION_R,',
'            :P2025011_TLFNO_R,',
'            :P2025011_EMAIL_R',
'    from si_c_terceros t',
'    where t.idntfccion = :P2025011_IDNTFCCION_R',
'   ;',
'',
'exception',
'    when no_data_found then',
'        :P2025011_TPO_IDNTFCCION_R := null;',
'        :P2025011_PRMER_NMBRE_R := null;',
'        :P2025011_SGNDO_NMBRE_R := null;',
'        :P2025011_PRMER_APLLDO_R := null;',
'        :P2025011_SGNDO_APELLIDO_R := null;',
'        :P2025011_DPRTMNTO_R := null;',
'        :P2025011_MNCPIO_R := null;',
'        :P2025011_DRCCION_R := null;',
'        :P2025011_TLFNO_R := null;',
'        :P2025011_EMAIL_R := null;',
'',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P2025011_IDNTFCCION_R'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5900127561424219)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar Responsable'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(4000);',
'    ',
'begin                                                                                                                     ',
'      ',
'        pkg_si_sujeto_impuesto.prc_ac_sujeto_responsable_portal(',
'                                                                  p_cdgo_clnte           => :F_CDGO_CLNTE,',
'                                                                  p_idntfccion           => :P2025011_IDNTFCCION_R,',
'                                                                  p_id_sjto_rspnsble     => :P2025011_ID_SJTO_RSPNSBLE,',
'                                                                  p_id_sjto_impsto       => :P2025011_ID_SJTO_IMPSTO,',
'                                                                  p_cdgo_idntfccion_tpo  => :P2025011_TPO_IDNTFCCION_R,',
'                                                                  p_prncpal_s_n          => :P2025011_PRNCPAL,',
'                                                                  p_prmer_nmbre          => :P2025011_PRMER_NMBRE_R,',
'                                                                  p_sgndo_nmbre          => :P2025011_SGNDO_NMBRE_R,',
'                                                                  p_prmer_aplldo         => :P2025011_PRMER_APLLDO_R,',
'                                                                  p_sgndo_aplldo         => :P2025011_SGNDO_APELLIDO_R,',
'                                                                  p_cdgo_tpo_rspnsble    => :P2025011_RSPNSBL_TPO,',
'                                                                  p_drccion_ntfccion     => :P2025011_DRCCION_R,',
'                                                                  p_email                => :P2025011_EMAIL_R,',
'                                                                  p_tlfno                => :P2025011_TLFNO_R,',
'                                                                  p_accion               => ''I'',',
'                                                                  p_id_usrio			 => :F_ID_USRIO,',
'                                                                  p_id_pais_ntfccion     => 5,',
'                                                                  p_id_dprtmnto_ntfccion => :P2025011_DPRTMNTO_R,',
'                                                                  p_id_mncpio_ntfccion   => :P2025011_MNCPIO_R,',
'                                                                  p_indcdor_cntrbynte    => ''N'',',
'                                                                  p_indcdr_fncnrio       => ''N'',',
'                                                                  p_actvo                => :P2025011_ACTVO,',
'                                                                  o_cdgo_rspsta          => v_cdgo_rspsta,',
'                                                                  o_mnsje_rspsta         => v_mnsje_rspsta',
'                                                                ) ;    ',
'',
'',
'',
unistr('    -- Verificaci\00F3n del c\00F3digo de respuesta'),
'    if v_cdgo_rspsta != 0 then',
unistr('        raise_application_error(-20001, ''Error: '' || v_mnsje_rspsta || '' (C\00F3digo: '' || v_cdgo_rspsta || '')'');'),
'',
'    end if;',
'    ',
'    ',
'exception',
'    when others then',
'        raise_application_error(-20002, ''Error en el procesamiento: '' || sqlerrm);',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(5929343226705292)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5900321940424221)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(5929343226705292)
);
end;
/
