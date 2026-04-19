prompt --application/pages/page_00021
begin
wwv_flow_api.create_page(
 p_id=>21
,p_user_interface_id=>wwv_flow_api.id(237318207209524256)
,p_name=>unistr('Registro Responsables Veh\00EDculo ')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Registro Responsables Veh\00EDculo')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20220216092730'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(135897844495816987)
,p_plug_name=>'Responsables'
,p_region_name=>'rspnsble'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(87958220525988320)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(135897844495816987)
,p_button_name=>'BTN_AGRGAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_api.id(237296259540524233)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(87982891692116201)
,p_branch_action=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(87958220525988320)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87958614390988325)
,p_name=>'P21_PRNCPAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(135897844495816987)
,p_item_default=>'S'
,p_prompt=>'Principal'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Si;S,No;N'
,p_field_template=>wwv_flow_api.id(237296017260524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87959006580988330)
,p_name=>'P21_RSPNSBL_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(135897844495816987)
,p_prompt=>'Tipo Responsable'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select r.dscrpcion_rspnsble_tpo as d,',
'       r.cdgo_rspnsble_tpo as r',
'from df_s_responsables_tipo r;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237296017260524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87959455657988330)
,p_name=>'P21_TPO_IDNTFCCION_R'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(135897844495816987)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion_idntfccion_tpo as d,',
'        a.cdgo_idntfccion_tpo as r',
'from df_s_identificaciones_tipo a; '))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237296017260524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87959807193988331)
,p_name=>'P21_IDNTFCCION_R'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(135897844495816987)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P21_SEQ_ID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(237296017260524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87960226723988331)
,p_name=>'P21_PRMER_NMBRE_R'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(135897844495816987)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(237296017260524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87960663936988331)
,p_name=>'P21_SGNDO_NMBRE_R'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(135897844495816987)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295687231524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87961094722988332)
,p_name=>'P21_PRMER_APLLDO_R'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(135897844495816987)
,p_prompt=>'Primer Apellido '
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237296017260524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87961496410988332)
,p_name=>'P21_SGNDO_APELLIDO_R'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(135897844495816987)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295687231524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87961815646988332)
,p_name=>'P21_DPRTMNTO_R'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(135897844495816987)
,p_prompt=>'Departamento'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_dprtmnto as d,',
'        a.id_dprtmnto as r',
'from df_s_departamentos a;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(237296017260524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87962237951988332)
,p_name=>'P21_MNCPIO_R'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(135897844495816987)
,p_prompt=>'Municipio'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_mncpio as d,',
'        a.id_mncpio as r',
'from df_s_municipios a',
'where a.id_dprtmnto = :P21_DPRTMNTO_R;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P21_DPRTMNTO_R'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237296017260524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87962680610988332)
,p_name=>'P21_DRCCION_R'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(135897844495816987)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>200
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(237296017260524231)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87963048439988333)
,p_name=>'P21_TLFNO_R'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(135897844495816987)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>11
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(237295687231524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87963424623988333)
,p_name=>'P21_EMAIL_R'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(135897844495816987)
,p_prompt=>'Correo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(237295687231524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87963870195988335)
,p_name=>'P21_ACTVO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(135897844495816987)
,p_item_default=>'S'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87964266848988335)
,p_name=>'P21_SEQ_ID'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(135897844495816987)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87964656482988335)
,p_name=>'P21_ID_SJTO_RSPNSBLE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(135897844495816987)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(87965111364988342)
,p_validation_name=>'Valida correo'
,p_validation_sequence=>10
,p_validation=>'regexp_like (:P21_EMAIL_R, ''^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Ingrese un correo valido.'
,p_associated_item=>wwv_flow_api.id(87963424623988333)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(87965566063988352)
,p_validation_name=>'Valida tipo responsable'
,p_validation_sequence=>20
,p_validation=>'P21_RSPNSBL_TPO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(87958220525988320)
,p_associated_item=>wwv_flow_api.id(87959006580988330)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(87965959389988352)
,p_validation_name=>'Valida el tipo de identificacion'
,p_validation_sequence=>30
,p_validation=>'P21_TPO_IDNTFCCION_R'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(87958220525988320)
,p_associated_item=>wwv_flow_api.id(87959455657988330)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(87966380096988352)
,p_validation_name=>'Valida el primer nombre'
,p_validation_sequence=>40
,p_validation=>'P21_PRMER_NMBRE_R'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(87958220525988320)
,p_associated_item=>wwv_flow_api.id(87960226723988331)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(87966716756988352)
,p_validation_name=>'Valida el primer apellido'
,p_validation_sequence=>50
,p_validation=>'P21_PRMER_APLLDO_R'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(87958220525988320)
,p_associated_item=>wwv_flow_api.id(87961094722988332)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(87967146051988353)
,p_validation_name=>'Valida departamento'
,p_validation_sequence=>60
,p_validation=>'P21_DPRTMNTO_R'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(87958220525988320)
,p_associated_item=>wwv_flow_api.id(87961815646988332)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(87967592195988353)
,p_validation_name=>'Valida municipio'
,p_validation_sequence=>70
,p_validation=>'P21_MNCPIO_R'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(87958220525988320)
,p_associated_item=>wwv_flow_api.id(87962237951988332)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(87967941971988353)
,p_validation_name=>unistr('Valida direcci\00F3n ')
,p_validation_sequence=>80
,p_validation=>'P21_DRCCION_R'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(87958220525988320)
,p_associated_item=>wwv_flow_api.id(87962680610988332)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(87984328767116216)
,p_validation_name=>unistr('Tel\00E9fono valido')
,p_validation_sequence=>90
,p_validation=>'return pkg_gn_generalidades.fnc_vl_expresion(p_cdgo_exp => ''CC1'' , p_vlor => :P21_TLFNO_R ,p_cdgo_clnte => :F_CDGO_CLNTE);'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(87958220525988320)
,p_associated_item=>wwv_flow_api.id(87963048439988333)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(87970169135988369)
,p_name=>'Carga responsable'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P21_IDNTFCCION_R'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(87970610498988370)
,p_event_id=>wwv_flow_api.id(87970169135988369)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(87984496161116217)
,p_name=>'Al cambiar telefono'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P21_TLFNO_R'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(''P21_TLFNO_R'').length == 8'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(87984526346116218)
,p_event_id=>wwv_flow_api.id(87984496161116217)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log($v(''P21_TLFNO_R'').length);',
'var regex = /^\([0-9]{1}\)-[0-9]{7}$/;',
'var pass = $v(''P21_TLFNO_R'');',
'if (!regex.test(pass)) {',
'    var x = $v(''P21_TLFNO_R'').substr(0, 1);',
'    var y = $v(''P21_TLFNO_R'').substr(1,7)',
'    var z = ''(''+x+'')-''+y; ',
'    console.log(''Z: ''+z);',
'    apex.item(''P21_TLFNO_R'').setValue(z);',
'    apex.message.clearErrors();',
'   ',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(87969059642988368)
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
'    into :P21_PRNCPAL,',
'         :P21_TPO_IDNTFCCION_R,',
'         :P21_IDNTFCCION_R,',
'         :P21_PRMER_NMBRE_R,',
'         :P21_SGNDO_NMBRE_R,',
'         :P21_PRMER_APLLDO_R,',
'         :P21_SGNDO_APELLIDO_R,',
'         :P21_DPRTMNTO_R,',
'         :P21_MNCPIO_R,',
'         :P21_DRCCION_R,',
'         :P21_TLFNO_R,',
'         :P21_EMAIL_R,',
'         :P21_RSPNSBL_TPO,',
'         :P21_ID_SJTO_RSPNSBLE,',
'         :P21_ACTVO',
'    from APEX_collections',
'    where collection_name = ''RESPONSABLES_V''',
'    and SEQ_ID = :P21_SEQ_ID;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P21_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(87969354028988368)
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
'    into    :P21_TPO_IDNTFCCION_R,',
'            :P21_PRMER_NMBRE_R,',
'            :P21_SGNDO_NMBRE_R,',
'            :P21_PRMER_APLLDO_R,',
'            :P21_SGNDO_APELLIDO_R,',
'            :P21_DPRTMNTO_R,',
'            :P21_MNCPIO_R,',
'            :P21_DRCCION_R,',
'            :P21_TLFNO_R,',
'            :P21_EMAIL_R',
'    from si_c_terceros t',
'   where t.cdgo_clnte         = :F_CDGO_CLNTE',
'     and t.cdgo_idntfccion_tpo = :P21_TPO_IDNTFCCION_R',
'     and t.idntfccion          = :P21_IDNTFCCION_R;',
'    ',
'',
'exception',
'    when no_data_found then',
'        --:P21_TPO_IDNTFCCION_R := null;',
'        :P21_PRMER_NMBRE_R := null;',
'        :P21_SGNDO_NMBRE_R := null;',
'        :P21_PRMER_APLLDO_R := null;',
'        :P21_SGNDO_APELLIDO_R := null;',
'        :P21_DPRTMNTO_R := null;',
'        :P21_MNCPIO_R := null;',
'        :P21_DRCCION_R := null;',
'        :P21_TLFNO_R := null;',
'        :P21_EMAIL_R := null;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P21_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(87969717639988368)
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
'    where id_sjto_rspnsble = :P21_ID_SJTO_RSPNSBLE;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_DSCTVAR, BTN_ACTVAR'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(87968688983988355)
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
'        where t.cdgo_idntfccion_tpo = :P21_TPO_IDNTFCCION_R;',
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
'        where d.id_dprtmnto = :P21_DPRTMNTO_R;',
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
'        where m.id_mncpio = :P21_MNCPIO_R;',
'    exception',
'        when no_data_found then',
'            v_dscrpcion_mncpio := null;',
'    end;',
'    ',
'    if :P21_SEQ_ID is null then',
'    ',
'        begin',
'            select count(*)',
'            into v_rgstros',
'            from APEX_collections r',
'            where collection_name = ''RESPONSABLES_V''',
'            and r.c004 = :P21_IDNTFCCION_R;',
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
'            where collection_name = ''RESPONSABLES_V''',
'            and r.c001 = ''S'';',
'        ',
'            if v_prncpal > 0 and :P21_PRNCPAL = ''S'' then',
'                raise_application_error(-20003,  ''Sr(a). '' || :F_NMBRE_USRIO || '', solo puede ingresar un responsable principal. Por favor valide e intente nuevamente'' );  ',
'            end if;',
'        end;',
'        ',
'        begin',
'            APEX_COLLECTION.ADD_MEMBER(p_collection_name => ''RESPONSABLES_V'',',
'                                       p_c001    => :P21_PRNCPAL,',
'                                       p_c002    => :P21_TPO_IDNTFCCION_R,',
'                                       p_c003    =>  v_dscrpcion_idntfccion,',
'                                       p_c004    => :P21_IDNTFCCION_R,',
'                                       p_c005    => :P21_PRMER_NMBRE_R,',
'                                       p_c006    => :P21_SGNDO_NMBRE_R,',
'                                       p_c007    => :P21_PRMER_APLLDO_R,',
'                                       p_c008    => :P21_SGNDO_APELLIDO_R,',
'                                       p_c009    => :P21_DPRTMNTO_R,',
'                                       p_c010    =>  v_dscrpcion_dprtmnto,',
'                                       p_c011    => :P21_MNCPIO_R,',
'                                       p_c012    =>  v_dscrpcion_mncpio,',
'                                       p_c013    => :P21_DRCCION_R,',
'                                       p_c014    => :P21_TLFNO_R,',
'                                       p_c015    => :P21_EMAIL_R,',
'                                       p_c016    => :P21_RSPNSBL_TPO,',
'                                       p_c018    => :P21_ID_SJTO_RSPNSBLE,',
'                                       p_c019    => :P21_ACTVO);',
'        end;                               ',
'    else',
'    ',
'        begin',
'            select count(*)',
'            into v_prncpal',
'            from APEX_collections r',
'            where collection_name = ''RESPONSABLES_V''',
'            and r.c001 = ''S''',
'            and r.c004 <> :P21_IDNTFCCION_R;',
'        ',
'            if v_prncpal > 0 and :P21_PRNCPAL = ''S'' then',
'                raise_application_error(-20003,  ''Sr(a). '' || :F_NMBRE_USRIO || '', solo puede ingresar un responsable principal. Por favor valide e intente nuevamente'' );  ',
'            end if;',
'        end;',
'    ',
'        begin',
'            ',
'            APEX_COLLECTION.UPDATE_MEMBER (p_collection_name => ''RESPONSABLES_V'',',
'                                            p_seq     => :P21_SEQ_ID,',
'                                            p_c001    => :P21_PRNCPAL,',
'                                            P_c002    => :P21_TPO_IDNTFCCION_R,',
'                                            p_c003    =>  v_dscrpcion_idntfccion,',
'                                            p_c004    => :P21_IDNTFCCION_R,',
'                                            p_c005    => :P21_PRMER_NMBRE_R,',
'                                            p_c006    => :P21_SGNDO_NMBRE_R,',
'                                            p_c007    => :P21_PRMER_APLLDO_R,',
'                                            p_c008    => :P21_SGNDO_APELLIDO_R,',
'                                            p_c009    => :P21_DPRTMNTO_R,',
'                                            p_c010    =>  v_dscrpcion_dprtmnto,',
'                                            p_c011    => :P21_MNCPIO_R,',
'                                            p_c012    =>  v_dscrpcion_mncpio,',
'                                            p_c013    => :P21_DRCCION_R,',
'                                            p_c014    => :P21_TLFNO_R,',
'                                            p_c015    => :P21_EMAIL_R,',
'                                            p_c016    => :P21_RSPNSBL_TPO,',
'                                            p_c018    => :P21_ID_SJTO_RSPNSBLE,',
'                                            p_c019    => :P21_ACTVO);',
'        ',
'        end;',
'    end if;',
'              ',
'                               ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(87958220525988320)
,p_process_success_message=>'Responsable agregado exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(87968283074988353)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar la modal'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(87958220525988320)
);
end;
/
