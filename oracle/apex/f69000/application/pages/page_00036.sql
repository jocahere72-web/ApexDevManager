prompt --application/pages/page_00036
begin
wwv_flow_api.create_page(
 p_id=>36
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>'Detalle Responsable'
,p_page_mode=>'MODAL'
,p_step_title=>'Detalle Responsable'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(74223953760684848)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'70%'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20200601111915'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(188813561044786301)
,p_plug_name=>'Detalle de Responsable'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(70752253389701026)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(188813561044786301)
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12467490197898501)
,p_name=>'P36_ID_PAIS_NTFCCION'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(188813561044786301)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70721020868458137)
,p_name=>'P36_ID_NVDAD_PRSNA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(188813561044786301)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70721120195458138)
,p_name=>'P36_ID_NVDAD_PRSNA_RSPNSBLE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(188813561044786301)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70752664185701029)
,p_name=>'P36_SEQ_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(188813561044786301)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70753034329701043)
,p_name=>'P36_ID_SJTO_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(188813561044786301)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70753327030701043)
,p_name=>'P36_ID_SJTO_RSPNSBLE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(188813561044786301)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70753732890701043)
,p_name=>'P36_PRNCPAL_S_N'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(188813561044786301)
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
 p_id=>wwv_flow_api.id(70754141723701045)
,p_name=>'P36_CDGO_TPO_RSPNSBLE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(188813561044786301)
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
 p_id=>wwv_flow_api.id(70754523654701046)
,p_name=>'P36_CDGO_IDNTFCCION_TPO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(188813561044786301)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion_idntfccion_tpo as d,',
'        a.cdgo_idntfccion_tpo as r',
'from df_s_identificaciones_tipo a; '))
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
 p_id=>wwv_flow_api.id(70754929226701046)
,p_name=>'P36_IDNTFCCION'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(188813561044786301)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P36_SEQ_ID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70755345286701047)
,p_name=>'P36_PRMER_NMBRE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(188813561044786301)
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
 p_id=>wwv_flow_api.id(70755740248701047)
,p_name=>'P36_SGNDO_NMBRE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(188813561044786301)
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
 p_id=>wwv_flow_api.id(70756167244701047)
,p_name=>'P36_PRMER_APLLDO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(188813561044786301)
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
 p_id=>wwv_flow_api.id(70756594179701048)
,p_name=>'P36_SGNDO_APLLDO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(188813561044786301)
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
 p_id=>wwv_flow_api.id(70756984635701048)
,p_name=>'P36_ID_DPRTMNTO_NTFCCION'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(188813561044786301)
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
 p_id=>wwv_flow_api.id(70757317681701048)
,p_name=>'P36_ID_MNCPIO_NTFCCION'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(188813561044786301)
,p_prompt=>'Municipio'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_mncpio as d,',
'        a.id_mncpio as r',
'from df_s_municipios a',
'where a.id_dprtmnto = :P36_ID_DPRTMNTO_NTFCCION;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P36_ID_DPRTMNTO_NTFCCION'
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
 p_id=>wwv_flow_api.id(70757761587701054)
,p_name=>'P36_DRCCION_NTFCCION'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(188813561044786301)
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
 p_id=>wwv_flow_api.id(70758158614701054)
,p_name=>'P36_TLFNO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(188813561044786301)
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
 p_id=>wwv_flow_api.id(70758522688701055)
,p_name=>'P36_CLLAR'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(188813561044786301)
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
 p_id=>wwv_flow_api.id(70758919916701055)
,p_name=>'P36_EMAIL'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(188813561044786301)
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
 p_id=>wwv_flow_api.id(70759365905701055)
,p_name=>'P36_ACTVO'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(188813561044786301)
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
 p_id=>wwv_flow_api.id(70759713533701055)
,p_name=>'P36_ID_TRCRO'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(188813561044786301)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70760148654701056)
,p_name=>'P36_ORGEN_DCMNTO'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(188813561044786301)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70760574401701056)
,p_name=>'P36_PRCNTJE_PRTCPCION'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(188813561044786301)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(70720719965458134)
,p_name=>'Cerrar Modal'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(70752253389701026)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70720812908458135)
,p_event_id=>wwv_flow_api.id(70720719965458134)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(70720911223458136)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Llenar los Datos del Resposable'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if :P36_ID_NVDAD_PRSNA is null then',
'       select c001 id_sjto_rspnsble',
'            , c002 id_sjto_impsto',
'            , c003 cdgo_idntfccion_tpo',
'            , c004 idntfccion',
'            , c005 prmer_nmbre',
'            , c006 sgndo_nmbre',
'            , c007 prmer_aplldo',
'            , c008 sgndo_aplldo',
'            , c009 prncpal_s_n',
'            , c010 cdgo_tpo_rspnsble',
'            , c011 prcntje_prtcpcion',
'            , c012 orgen_dcmnto',
'            , c013 id_pais_ntfccion',
'            , c014 id_dprtmnto_ntfccion',
'            , c015 id_mncpio_ntfccion',
'            , c016 drccion_ntfccion',
'            , c017 email',
'            , c018 tlfno',
'            , c019 cllar',
'            , c020 actvo',
'            , c021 id_trcro',
'         into :P36_ID_SJTO_RSPNSBLE',
'            , :P36_ID_SJTO_IMPSTO',
'            , :P36_CDGO_IDNTFCCION_TPO',
'            , :P36_IDNTFCCION',
'            , :P36_PRMER_NMBRE',
'            , :P36_SGNDO_NMBRE',
'            , :P36_PRMER_APLLDO',
'            , :P36_SGNDO_APLLDO',
'            , :P36_PRNCPAL_S_N',
'            , :P36_CDGO_TPO_RSPNSBLE',
'            , :P36_PRCNTJE_PRTCPCION',
'            , :P36_ORGEN_DCMNTO',
'            , :P36_ID_PAIS_NTFCCION',
'            , :P36_ID_DPRTMNTO_NTFCCION',
'            , :P36_ID_MNCPIO_NTFCCION',
'            , :P36_DRCCION_NTFCCION',
'            , :P36_EMAIL',
'            , :P36_TLFNO',
'            , :P36_CLLAR',
'            , :P36_ACTVO',
'            , :P36_ID_TRCRO',
'         from apex_collections    a',
'        where collection_name     = ''RESPONSABLES''',
'          and seq_id              = :P36_ID_NVDAD_PRSNA_RSPNSBLE',
'          and n001                = :F_ID_INSTNCIA_FLJO;',
'',
'    else',
'        select id_sjto_rspnsble',
'             , null id_sjto_impsto',
'             , cdgo_idntfccion_tpo',
'             , idntfccion',
'             , prmer_nmbre',
'             , sgndo_nmbre',
'             , prmer_aplldo',
'             , sgndo_aplldo',
'             , prncpal_s_n',
'             , cdgo_tpo_rspnsble',
'             , prcntje_prtcpcion',
'             , orgen_dcmnto',
'             , id_pais_ntfccion',
'             , id_dprtmnto_ntfccion',
'             , id_mncpio_ntfccion',
'             , drccion_ntfccion',
'             , email',
'             , tlfno',
'             , cllar',
'             , actvo',
'             , id_trcro',
'         into :P36_ID_SJTO_RSPNSBLE',
'            , :P36_ID_SJTO_IMPSTO',
'            , :P36_CDGO_IDNTFCCION_TPO',
'            , :P36_IDNTFCCION',
'            , :P36_PRMER_NMBRE',
'            , :P36_SGNDO_NMBRE',
'            , :P36_PRMER_APLLDO',
'            , :P36_SGNDO_APLLDO',
'            , :P36_PRNCPAL_S_N',
'            , :P36_CDGO_TPO_RSPNSBLE',
'            , :P36_PRCNTJE_PRTCPCION',
'            , :P36_ORGEN_DCMNTO',
'            , :P36_ID_PAIS_NTFCCION',
'            , :P36_ID_DPRTMNTO_NTFCCION',
'            , :P36_ID_MNCPIO_NTFCCION',
'            , :P36_DRCCION_NTFCCION',
'            , :P36_EMAIL',
'            , :P36_TLFNO',
'            , :P36_CLLAR',
'            , :P36_ACTVO',
'            , :P36_ID_TRCRO',
'          from si_g_novddes_prsna_rspnsble    a',
'         where id_nvdad_prsna                 = :P36_ID_NVDAD_PRSNA',
'           and id_nvdad_prsna_rspnsble        = :P36_ID_NVDAD_PRSNA_RSPNSBLE;',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
