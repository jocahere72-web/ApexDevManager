prompt --application/pages/page_20250_004
begin
wwv_flow_api.create_page(
 p_id=>2025013
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Responsables'
,p_page_mode=>'MODAL'
,p_step_title=>'Responsables'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var button = parent.$(''.ui-dialog-titlebar-close''); ',
'button.hide(); '))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250916094815'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69829918734064259)
,p_plug_name=>'Responsables'
,p_region_name=>'rspnsble'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5899673726424214)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(69829918734064259)
,p_button_name=>'BTN_CRRAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Cerrar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_icon_css_classes=>'fa-window-close'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(21890329171235583)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(69829918734064259)
,p_button_name=>'BTN_AGRGAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P2025013_ID_SJTO_RSPNSBLE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5899066989424208)
,p_name=>'P2025013_CDGO_TPO_RSPNSBLE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(69829918734064259)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5899165615424209)
,p_name=>'P2025013_ID_DPRTMNTO_NTFCCION'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(69829918734064259)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5899276114424210)
,p_name=>'P2025013_ID_MNCPIO_NTFCCION'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(69829918734064259)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5899324960424211)
,p_name=>'P2025013_CDGO_IDNTFCCION_TPO'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(69829918734064259)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5899572618424213)
,p_name=>'P2025013_ID_SJTO_IMPSTO'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(69829918734064259)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21890798171235583)
,p_name=>'P2025013_PRNCPAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(69829918734064259)
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
 p_id=>wwv_flow_api.id(21891149118235584)
,p_name=>'P2025013_RSPNSBL_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(69829918734064259)
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
 p_id=>wwv_flow_api.id(21891579919235584)
,p_name=>'P2025013_TPO_IDNTFCCION_R'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(69829918734064259)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion_idntfccion_tpo as d,',
'        a.cdgo_idntfccion_tpo as r',
'from df_s_identificaciones_tipo a',
'order by a.dscrpcion_idntfccion_tpo; '))
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21891961966235584)
,p_name=>'P2025013_IDNTFCCION_R'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(69829918734064259)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21892348672235584)
,p_name=>'P2025013_PRMER_NMBRE_R'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(69829918734064259)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21892781473235585)
,p_name=>'P2025013_SGNDO_NMBRE_R'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(69829918734064259)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21893132790235585)
,p_name=>'P2025013_PRMER_APLLDO_R'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(69829918734064259)
,p_prompt=>'Primer Aperllido'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21893543450235585)
,p_name=>'P2025013_SGNDO_APELLIDO_R'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(69829918734064259)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21893922257235585)
,p_name=>'P2025013_DPRTMNTO_R'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(69829918734064259)
,p_prompt=>'Departamento'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_dprtmnto as d,',
'        a.id_dprtmnto as r',
'from df_s_departamentos a;'))
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21894356173235585)
,p_name=>'P2025013_MNCPIO_R'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(69829918734064259)
,p_prompt=>'Municipio'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_mncpio as d,',
'        a.id_mncpio as r',
'from df_s_municipios a',
'where a.id_dprtmnto = :P2025013_DPRTMNTO_R;'))
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21894712225235586)
,p_name=>'P2025013_DRCCION_R'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(69829918734064259)
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
 p_id=>wwv_flow_api.id(21895199313235586)
,p_name=>'P2025013_TLFNO_R'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(69829918734064259)
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
 p_id=>wwv_flow_api.id(21895506643235586)
,p_name=>'P2025013_EMAIL_R'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(69829918734064259)
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
 p_id=>wwv_flow_api.id(21895944905235586)
,p_name=>'P2025013_ACTVO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(69829918734064259)
,p_item_default=>'S'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21896304730235586)
,p_name=>'P2025013_SEQ_ID'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(69829918734064259)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21896726783235587)
,p_name=>'P2025013_ID_SJTO_RSPNSBLE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(69829918734064259)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(21897239211235587)
,p_validation_name=>'Valida correo'
,p_validation_sequence=>10
,p_validation=>'regexp_like (:P2025013_EMAIL_R, ''^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Ingrese un correo valido.'
,p_associated_item=>wwv_flow_api.id(21895506643235586)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(21897652605235588)
,p_validation_name=>'Valida tipo responsable'
,p_validation_sequence=>20
,p_validation=>'P2025013_RSPNSBL_TPO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(21890329171235583)
,p_associated_item=>wwv_flow_api.id(21891149118235584)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(21900039626235589)
,p_validation_name=>unistr('Valida direcci\00F3n ')
,p_validation_sequence=>80
,p_validation=>'P2025013_DRCCION_R'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(21890329171235583)
,p_associated_item=>wwv_flow_api.id(21894712225235586)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5898943447424207)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Informaci\00F3n Sujetos Responsable')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'a.id_sjto_impsto,',
'a.prncpal_s_n,',
'a.CDGO_TPO_RSPNSBLE,',
'b.DSCRPCION_IDNTFCCION_TPO,',
'a.IDNTFCCION,',
'a.PRMER_NMBRE,',
'a.SGNDO_NMBRE,',
'a.PRMER_APLLDO,',
'a.SGNDO_APLLDO,',
'b.NMBRE_DPRTMNTO,',
'b.NMBRE_MNCPIO,',
'a.DRCCION_NTFCCION,',
'a.TLFNO,',
'a.EMAIL,',
'a.ACTVO,',
'a.CDGO_IDNTFCCION_TPO,',
'a.ID_MNCPIO_NTFCCION,',
'a.ID_DPRTMNTO_NTFCCION,',
'a.CDGO_TPO_RSPNSBLE',
'into',
':P2025013_ID_SJTO_IMPSTO,',
':P2025013_PRNCPAL,',
':P2025013_RSPNSBL_TPO,',
':P2025013_TPO_IDNTFCCION_R,',
':P2025013_IDNTFCCION_R,',
':P2025013_PRMER_NMBRE_R,',
':P2025013_SGNDO_NMBRE_R,',
':P2025013_PRMER_APLLDO_R,',
':P2025013_SGNDO_APELLIDO_R,',
':P2025013_DPRTMNTO_R,',
':P2025013_MNCPIO_R,',
':P2025013_DRCCION_R,',
':P2025013_TLFNO_R,',
':P2025013_EMAIL_R,',
':P2025013_ACTVO,',
':P2025013_CDGO_IDNTFCCION_TPO,',
':P2025013_ID_MNCPIO_NTFCCION,',
':P2025013_ID_DPRTMNTO_NTFCCION,',
':P2025013_CDGO_TPO_RSPNSBLE',
'from si_i_sujetos_responsable a ',
'inner join v_si_i_sujetos_responsable b on a.id_sjto_rspnsble = b.id_sjto_rspnsble',
'where a.id_sjto_rspnsble = :P2025013_ID_SJTO_RSPNSBLE',
';'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P2025013_ID_SJTO_RSPNSBLE'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5899497316424212)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualizar datos Sujetos Responsable'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(4000);',
'    ',
'begin                                                                                                                     ',
'      ',
'        pkg_si_sujeto_impuesto.prc_ac_sujeto_responsable_portal(',
'                                                                  p_cdgo_clnte           => :F_CDGO_CLNTE,',
'                                                                  p_idntfccion           => :P2025013_IDNTFCCION_R,',
'                                                                  p_id_sjto_rspnsble     => :P2025013_ID_SJTO_RSPNSBLE,',
'                                                                  p_id_sjto_impsto       => :P2025013_ID_SJTO_IMPSTO,',
'                                                                  p_cdgo_idntfccion_tpo  => :P2025013_CDGO_IDNTFCCION_TPO,',
'                                                                  p_prncpal_s_n          => :P2025013_PRNCPAL,',
'                                                                  p_cdgo_tpo_rspnsble    => :P2025013_RSPNSBL_TPO,',
'                                                                  p_drccion_ntfccion     => :P2025013_DRCCION_R,',
'                                                                  p_email                => :P2025013_EMAIL_R,',
'                                                                  p_tlfno                => :P2025013_TLFNO_R,',
'                                                                  p_cllar                => :P2025013_CLLAR_R,',
'                                                                  p_accion               => ''A'',',
'                                                                  p_id_usrio			 => :F_ID_USRIO,	',
'                                                                  o_cdgo_rspsta          => v_cdgo_rspsta,',
'                                                                  o_mnsje_rspsta         => v_mnsje_rspsta',
'                                                                ) ;    ',
'',
'',
unistr('    -- Verificaci\00F3n del c\00F3digo de respuesta'),
'    if v_cdgo_rspsta != 0 then',
unistr('        raise_application_error(-20001, ''Error: '' || v_mnsje_rspsta || '' (C\00F3digo: '' || v_cdgo_rspsta || '')'');'),
'        ',
'     else ',
'        apex_application.g_print_success_message := ''Responsable actualizado exitosamente.'';   ',
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
,p_process_when_button_id=>wwv_flow_api.id(21890329171235583)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21900381810235589)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar la modal'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(5899673726424214)
);
end;
/
