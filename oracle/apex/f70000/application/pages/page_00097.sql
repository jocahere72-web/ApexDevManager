prompt --application/pages/page_00097
begin
wwv_flow_api.create_page(
 p_id=>97
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Responsables'
,p_page_mode=>'MODAL'
,p_step_title=>'Responsables'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'HMARTINEZ'
,p_last_upd_yyyymmddhh24miss=>'20201228113435'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(47940166814828678)
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
 p_id=>wwv_flow_api.id(33669247739769683)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(47940166814828678)
,p_button_name=>'BTN_AGRGAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33337889087989409)
,p_name=>'P97_SEQ_ID'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(47940166814828678)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33644614995670769)
,p_name=>'P97_PRNCPAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(47940166814828678)
,p_item_default=>'S'
,p_prompt=>'Principal'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Si;S,No;N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33645039446670791)
,p_name=>'P97_RSPNSBL_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(47940166814828678)
,p_prompt=>'Tipo Responsable'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select r.dscrpcion_rspnsble_tpo as d,',
'       r.cdgo_rspnsble_tpo as r',
'from df_s_responsables_tipo r',
'order by r.dscrpcion_rspnsble_tpo;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33645466869670793)
,p_name=>'P97_TPO_IDNTFCCION_R'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(47940166814828678)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion_idntfccion_tpo as d,',
'        a.cdgo_idntfccion_tpo as r',
'from df_s_identificaciones_tipo a',
'order by a.dscrpcion_idntfccion_tpo; '))
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
 p_id=>wwv_flow_api.id(33645875054670793)
,p_name=>'P97_IDNTFCCION_R'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(47940166814828678)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P97_SEQ_ID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33646284462670794)
,p_name=>'P97_PRMER_NMBRE_R'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(47940166814828678)
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
 p_id=>wwv_flow_api.id(33646680365670795)
,p_name=>'P97_SGNDO_NMBRE_R'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(47940166814828678)
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
 p_id=>wwv_flow_api.id(33647008770670797)
,p_name=>'P97_PRMER_APLLDO_R'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(47940166814828678)
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
 p_id=>wwv_flow_api.id(33647449624670797)
,p_name=>'P97_SGNDO_APELLIDO_R'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(47940166814828678)
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
 p_id=>wwv_flow_api.id(33647824085670797)
,p_name=>'P97_DPRTMNTO_R'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(47940166814828678)
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
 p_id=>wwv_flow_api.id(33648283399670797)
,p_name=>'P97_MNCPIO_R'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(47940166814828678)
,p_prompt=>'Municipio'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_mncpio as d,',
'        a.id_mncpio as r',
'from df_s_municipios a',
'where a.id_dprtmnto = :P97_DPRTMNTO_R;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P97_DPRTMNTO_R'
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
 p_id=>wwv_flow_api.id(33648664375670798)
,p_name=>'P97_DRCCION_R'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(47940166814828678)
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
 p_id=>wwv_flow_api.id(33649037603670798)
,p_name=>'P97_TLFNO_R'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(47940166814828678)
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
 p_id=>wwv_flow_api.id(33649487772670798)
,p_name=>'P97_EMAIL_R'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(47940166814828678)
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
 p_id=>wwv_flow_api.id(55424821223788404)
,p_name=>'P97_ID_SJTO_RSPNSBLE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(47940166814828678)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55425121108788407)
,p_name=>'P97_ACTVO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(47940166814828678)
,p_item_default=>'S'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(33338489338989415)
,p_validation_name=>'Valida correo'
,p_validation_sequence=>10
,p_validation=>'regexp_like (:P97_EMAIL_R, ''^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Ingrese un correo valido.'
,p_associated_item=>wwv_flow_api.id(33649487772670798)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(33338576065989416)
,p_validation_name=>'Valida tipo responsable'
,p_validation_sequence=>20
,p_validation=>'P97_RSPNSBL_TPO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(33669247739769683)
,p_associated_item=>wwv_flow_api.id(33645039446670791)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(33338684119989417)
,p_validation_name=>'Valida el tipo de identificacion'
,p_validation_sequence=>30
,p_validation=>'P97_TPO_IDNTFCCION_R'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(33669247739769683)
,p_associated_item=>wwv_flow_api.id(33645466869670793)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(33338750835989418)
,p_validation_name=>'Valida el primer nombre'
,p_validation_sequence=>40
,p_validation=>'P97_PRMER_NMBRE_R'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(33669247739769683)
,p_associated_item=>wwv_flow_api.id(33646284462670794)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(33338893701989419)
,p_validation_name=>'Valida el primer apellido'
,p_validation_sequence=>50
,p_validation=>'P97_PRMER_APLLDO_R'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(33669247739769683)
,p_associated_item=>wwv_flow_api.id(33647008770670797)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(33338954989989420)
,p_validation_name=>'Valida departamento'
,p_validation_sequence=>60
,p_validation=>'P97_DPRTMNTO_R'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(33669247739769683)
,p_associated_item=>wwv_flow_api.id(33647824085670797)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(33339018445989421)
,p_validation_name=>'Valida municipio'
,p_validation_sequence=>70
,p_validation=>'P97_MNCPIO_R'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(33669247739769683)
,p_associated_item=>wwv_flow_api.id(33648283399670797)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(33339194187989422)
,p_validation_name=>unistr('Valida direcci\00F3n ')
,p_validation_sequence=>80
,p_validation=>'P97_DRCCION_R'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(33669247739769683)
,p_associated_item=>wwv_flow_api.id(33648664375670798)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(33338047413989411)
,p_name=>'Carga responsable'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P97_IDNTFCCION_R'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(33338161301989412)
,p_event_id=>wwv_flow_api.id(33338047413989411)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(33337931207989410)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Carga registro de la colecci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'',
'begin',
'',
'    select  ',
'        c001 as prncpal,',
'        c002 as tpo_idntfccion_r,',
'        c004 as idntfccion_r,',
'        c005 as prmer_nmbre_r,',
'        c006 as sgndo_nmbre_r,',
'        c007 as prmer_aplldo_r,',
'        c008 as sgndo_apellido_r,',
'        c009 as dprtmnto_r,',
'        c011 as mncpio_r,',
'        c013 as drccion_r,',
'        c014 as tlfno_r,',
'        c015 as email_r,',
'        c016 as tpo_rspnsble,',
'        c018 as id_sjto_rspnsble,',
'        c019 as actvo',
'    into :P97_PRNCPAL,',
'         :P97_TPO_IDNTFCCION_R,',
'         :P97_IDNTFCCION_R,',
'         :P97_PRMER_NMBRE_R,',
'         :P97_SGNDO_NMBRE_R,',
'         :P97_PRMER_APLLDO_R,',
'         :P97_SGNDO_APELLIDO_R,',
'         :P97_DPRTMNTO_R,',
'         :P97_MNCPIO_R,',
'         :P97_DRCCION_R,',
'         :P97_TLFNO_R,',
'         :P97_EMAIL_R,',
'         :P97_RSPNSBL_TPO,',
'         :P97_ID_SJTO_RSPNSBLE,',
'         :P97_ACTVO',
'    from APEX_collections',
'    where collection_name = ''RESPONSABLES''',
'    and SEQ_ID = :P97_SEQ_ID;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P97_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(33672400863822447)
,p_process_sequence=>20
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
'    into    :P97_TPO_IDNTFCCION_R,',
'            :P97_PRMER_NMBRE_R,',
'            :P97_SGNDO_NMBRE_R,',
'            :P97_PRMER_APLLDO_R,',
'            :P97_SGNDO_APELLIDO_R,',
'            :P97_DPRTMNTO_R,',
'            :P97_MNCPIO_R,',
'            :P97_DRCCION_R,',
'            :P97_TLFNO_R,',
'            :P97_EMAIL_R',
'    from si_c_terceros t',
'    where t.idntfccion = :P97_IDNTFCCION_R',
'    and t.cdgo_clnte   = :F_CDGO_CLNTE;',
'',
'exception',
'    when no_data_found then',
'        :P97_TPO_IDNTFCCION_R := null;',
'        :P97_PRMER_NMBRE_R := null;',
'        :P97_SGNDO_NMBRE_R := null;',
'        :P97_PRMER_APLLDO_R := null;',
'        :P97_SGNDO_APELLIDO_R := null;',
'        :P97_DPRTMNTO_R := null;',
'        :P97_MNCPIO_R := null;',
'        :P97_DRCCION_R := null;',
'        :P97_TLFNO_R := null;',
'        :P97_EMAIL_R := null;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P97_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(55424671698788402)
,p_process_sequence=>40
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Desactiva Responsable'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_actvo varchar2(1) := ''S'';',
'',
'begin',
'',
'    if :request = ''BTN_DSCTVAR'' then    ',
'        v_actvo := ''N'';',
'    end if;',
'',
'',
'    update si_i_sujetos_responsable',
'    set actvo = v_actvo',
'    where id_sjto_rspnsble = :P97_ID_SJTO_RSPNSBLE;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_DSCTVAR, BTN_ACTVAR'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(33337726055989408)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Agrega responsable'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_dscrpcion_idntfccion  varchar2(100);',
'    v_dscrpcion_dprtmnto    varchar2(100);',
'    v_dscrpcion_mncpio      varchar2(100);',
'    v_prncpal               number;',
'    v_rgstros               number;',
'begin',
'',
'    begin',
'        select t.dscrpcion_idntfccion_tpo ',
'        into v_dscrpcion_idntfccion',
'        from df_s_identificaciones_tipo t',
'        where t.cdgo_idntfccion_tpo = :P97_TPO_IDNTFCCION_R;',
'    exception ',
'        when no_data_found then',
'            v_dscrpcion_idntfccion := null;',
'    end;',
'    ',
'    ',
'    begin',
'        select d.nmbre_dprtmnto',
'        into v_dscrpcion_dprtmnto',
'        from df_s_departamentos d',
'        where d.id_dprtmnto = :P97_DPRTMNTO_R;',
'    exception',
'        when no_data_found then',
'            v_dscrpcion_dprtmnto := null;',
'    end;',
'    ',
'    ',
'    begin',
'        select  m.nmbre_mncpio',
'        into v_dscrpcion_mncpio',
'        from df_s_municipios m',
'        where m.id_mncpio = :P97_MNCPIO_R;',
'    exception',
'        when no_data_found then',
'            v_dscrpcion_mncpio := null;',
'    end;',
'    ',
'    if :P97_SEQ_ID is null then',
'    ',
'        begin',
'            select count(*)',
'            into v_rgstros',
'            from APEX_collections r',
'            where collection_name = ''RESPONSABLES''',
'            and r.c004 = :P97_IDNTFCCION_R;',
'        ',
'            if v_rgstros > 0 then',
'                raise_application_error(-20003, ''Sr(a). '' || :F_NMBRE_USRIO || '', el responsable ya se encuentra agregado. Por favor valide e intente nuevamente'');  ',
'            end if;',
'        end;',
'        ',
'        ',
'        begin',
'            select count(*)',
'            into v_prncpal',
'            from APEX_collections r',
'            where collection_name = ''RESPONSABLES''',
'            and r.c001 = ''S'';',
'        ',
'            if v_prncpal > 0 and :P97_PRNCPAL = ''S'' then',
'                raise_application_error(-20003,  ''Sr(a). '' || :F_NMBRE_USRIO || '', solo puede ingresar un responsable principal. Por favor valide e intente nuevamente'' );  ',
'            end if;',
'        end;',
'        ',
'        begin',
'            APEX_COLLECTION.ADD_MEMBER(p_collection_name => ''RESPONSABLES'',',
'                                       p_c001    => :P97_PRNCPAL,',
'                                       p_c002    => :P97_TPO_IDNTFCCION_R,',
'                                       p_c003    =>  v_dscrpcion_idntfccion,',
'                                       p_c004    => :P97_IDNTFCCION_R,',
'                                       p_c005    => :P97_PRMER_NMBRE_R,',
'                                       p_c006    => :P97_SGNDO_NMBRE_R,',
'                                       p_c007    => :P97_PRMER_APLLDO_R,',
'                                       p_c008    => :P97_SGNDO_APELLIDO_R,',
'                                       p_c009    => :P97_DPRTMNTO_R,',
'                                       p_c010    =>  v_dscrpcion_dprtmnto,',
'                                       p_c011    => :P97_MNCPIO_R,',
'                                       p_c012    =>  v_dscrpcion_mncpio,',
'                                       p_c013    => :P97_DRCCION_R,',
'                                       p_c014    => :P97_TLFNO_R,',
'                                       p_c015    => :P97_EMAIL_R,',
'                                       p_c016    => :P97_RSPNSBL_TPO,',
'                                       p_c018    => :P97_ID_SJTO_RSPNSBLE,',
'                                       p_c019    => :P97_ACTVO);',
'        end;                               ',
'    else',
'    ',
'        begin',
'            select count(*)',
'            into v_prncpal',
'            from APEX_collections r',
'            where collection_name = ''RESPONSABLES''',
'            and r.c001 = ''S''',
'            and r.c004 <> :P97_IDNTFCCION_R;',
'        ',
'            if v_prncpal > 0 and :P97_PRNCPAL = ''S'' then',
'                raise_application_error(-20003,  ''Sr(a). '' || :F_NMBRE_USRIO || '', solo puede ingresar un responsable principal. Por favor valide e intente nuevamente'' );  ',
'            end if;',
'        end;',
'    ',
'        begin',
'            ',
'            APEX_COLLECTION.UPDATE_MEMBER (p_collection_name => ''RESPONSABLES'',',
'                                            p_seq     => :P97_SEQ_ID,',
'                                            p_c001    => :P97_PRNCPAL,',
'                                            P_c002    => :P97_TPO_IDNTFCCION_R,',
'                                            p_c003    =>  v_dscrpcion_idntfccion,',
'                                            p_c004    => :P97_IDNTFCCION_R,',
'                                            p_c005    => :P97_PRMER_NMBRE_R,',
'                                            p_c006    => :P97_SGNDO_NMBRE_R,',
'                                            p_c007    => :P97_PRMER_APLLDO_R,',
'                                            p_c008    => :P97_SGNDO_APELLIDO_R,',
'                                            p_c009    => :P97_DPRTMNTO_R,',
'                                            p_c010    =>  v_dscrpcion_dprtmnto,',
'                                            p_c011    => :P97_MNCPIO_R,',
'                                            p_c012    =>  v_dscrpcion_mncpio,',
'                                            p_c013    => :P97_DRCCION_R,',
'                                            p_c014    => :P97_TLFNO_R,',
'                                            p_c015    => :P97_EMAIL_R,',
'                                            p_c016    => :P97_RSPNSBL_TPO,',
'                                            p_c018    => :P97_ID_SJTO_RSPNSBLE,',
'                                            p_c019    => :P97_ACTVO);',
'        ',
'        end;',
'    end if;',
'              ',
'                               ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(33669247739769683)
,p_process_success_message=>'Responsable agregado exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13622080736830439)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar la modal'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(33669247739769683)
);
end;
/
