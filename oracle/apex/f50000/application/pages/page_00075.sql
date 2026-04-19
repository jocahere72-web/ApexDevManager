prompt --application/pages/page_00075
begin
wwv_flow_api.create_page(
 p_id=>75
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Esquema Predio'
,p_page_mode=>'MODAL'
,p_step_title=>'Esquema Predio'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
''))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'70%'
,p_protection_level=>'C'
,p_last_updated_by=>'JGONZALEZ'
,p_last_upd_yyyymmddhh24miss=>'20240131113114'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(172366674824486216)
,p_plug_name=>'Esquema Predio'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29530253509068499)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(172367339978486222)
,p_plug_name=>'Botones'
,p_region_template_options=>'#DEFAULT#:margin-top-lg'
,p_plug_template=>wwv_flow_api.id(29532093730068500)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(172367664456486223)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(172367339978486222)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(172367234067486222)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(172367339978486222)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro que desea eliminar el registro?'',''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P75_ID_PRDIO_ESQMA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(172367108625486222)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(172367339978486222)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P75_ID_PRDIO_ESQMA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(172367073988486222)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(172367339978486222)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P75_ID_PRDIO_ESQMA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56955115376600308)
,p_name=>'P75_ID_INDCDOR_ECNMCO'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(172366674824486216)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Indicador Econ\00F3mico')
,p_source=>'ID_INDCDOR_ECNMCO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select initcap(t.nmbre_indcdor_tpo) ||'' '' || to_char(fcha_dsde, ''dd/mm/yyyy'') || ''-'' || to_char(fcha_hsta, ''dd/mm/yyyy''),',
'       i.id_indcdor_ecnmco',
'  from df_s_indicadores_economico i, df_s_indicadores_tipo t',
' where i.cdgo_indcdor_tpo = t.cdgo_indcdor_tpo',
'   -- and fcha_dsde between :P75_FCHA_INCIAL and :PFCHA_FNAL',
'  order by fcha_hsta desc'))
,p_lov_display_null=>'YES'
,p_cSize=>100
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista el indicador econ\00F3mico.')
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56955562047600312)
,p_name=>'P75_TRFA_1'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(172366674824486216)
,p_source=>'P75_TRFA'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'Ingrese la tarifa.'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172370079481486252)
,p_name=>'P75_ID_PRDIO_ESQMA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(172366674824486216)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Prdio Esqma'
,p_source=>'ID_PRDIO_ESQMA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172370495736486292)
,p_name=>'P75_CDGO_CLNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(172366674824486216)
,p_use_cache_before_default=>'NO'
,p_item_default=>'&F_CDGO_CLNTE.'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172370858881486300)
,p_name=>'P75_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(172366674824486216)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tributo'
,p_source=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>3
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tributo.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172371247685486301)
,p_name=>'P75_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(172366674824486216)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Sub-Tributo'
,p_source=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NMBRE_IMPSTO_SBMPSTO  as d,',
'       ID_IMPSTO_SBMPSTO as r',
'  from DF_I_IMPUESTOS_SUBIMPUESTO',
' where  ID_IMPSTO = :P75_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P75_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>4
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el subtributo.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172371629993486302)
,p_name=>'P75_FCHA_INCIAL'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(172366674824486216)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Inicial'
,p_source=>'FCHA_INCIAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>255
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Seleccione la fecha inicial.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172372428034486310)
,p_name=>'P75_FCHA_FNAL'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(172366674824486216)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Final'
,p_source=>'FCHA_FNAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>255
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Seleccione la fecha final.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172373259717486310)
,p_name=>'P75_CDGO_PRDIO_CLSFCCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(172366674824486216)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Clasificaci\00F3n Predio')
,p_source=>'CDGO_PRDIO_CLSFCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_CLASIFICACION_PREDIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_prdio_clsfccion d,',
'       cdgo_prdio_clsfccion  r   ',
'  from df_s_predios_clasificacion',
'  order by cdgo_prdio_clsfccion'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista la clasificaci\00F3n del predio.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172373686418486315)
,p_name=>'P75_ID_PRDIO_USO_SLO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(172366674824486216)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Uso Suelo Predio'
,p_source=>'ID_PRDIO_USO_SLO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_PREDIO_USO_SUELO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d ,',
'       id_prdio_uso_slo r',
'  from df_c_predios_uso_suelo',
' where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el uso del predio.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172374081241486315)
,p_name=>'P75_ID_PRDIO_DSTNO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(172366674824486216)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Destino Predio'
,p_source=>'ID_PRDIO_DSTNO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmtcnco',
'    || ''-'' || a.dscrpcion,',
'    a.id_prdio_dstno',
'  from df_i_predios_destino a',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.id_impsto  = :P75_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P75_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el destino del predio '
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172374405254486316)
,p_name=>'P75_CDGO_ESTRTO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(172366674824486216)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Estrato'
,p_source=>'CDGO_ESTRTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_ESTRATO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_estrto d,',
'        cdgo_estrto r',
'   from df_s_estratos',
'   order by r;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el estrato del predio.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172374844675486316)
,p_name=>'P75_AREA_TRRNO_MNMA'
,p_is_required=>true
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(172366674824486216)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00C1rea Terreno M\00EDnima')
,p_format_mask=>'9G999G999G999G999G999'
,p_source=>'AREA_TRRNO_MNMA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>15
,p_cMaxlength=>16
,p_tag_attributes=>'onkeyup="formatNumber(event,{ precision: 0, thousand: ''.'',decimal: '','' });"  onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el \00E1rea del terreno m\00EDnima.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172375284424486323)
,p_name=>'P75_AREA_TRRNO_MXMA'
,p_is_required=>true
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(172366674824486216)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00C1rea Terreno M\00E1xima')
,p_format_mask=>'9G999G999G999G999G999'
,p_source=>'AREA_TRRNO_MXMA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>15
,p_cMaxlength=>16
,p_tag_attributes=>'onkeyup="formatNumber(event,{ precision: 0, thousand: ''.'',decimal: '','' });"  onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el \00E1rea del terreno m\00E1xima.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172375619270486323)
,p_name=>'P75_AREA_CNSCTRDA_MNMA'
,p_is_required=>true
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(172366674824486216)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00C1rea Construida M\00EDnima')
,p_format_mask=>'9G999G999G999G999G999'
,p_source=>'AREA_CNSCTRDA_MNMA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>15
,p_cMaxlength=>16
,p_tag_attributes=>'onkeyup="formatNumber(event,{ precision: 0, thousand: ''.'',decimal: '','' });"  onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el \00E1rea del construida m\00EDnima.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172376076205486323)
,p_name=>'P75_AREA_CNSCTRDA_MXMA'
,p_is_required=>true
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(172366674824486216)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00C1rea Construida M\00E1xima')
,p_format_mask=>'9G999G999G999G999G999'
,p_source=>'AREA_CNSCTRDA_MXMA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>15
,p_cMaxlength=>16
,p_tag_attributes=>'onkeyup="formatNumber(event,{ precision: 0, thousand: ''.'',decimal: '','' });"  onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el \00E1rea del construida m\00E1xima.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172376402557486324)
,p_name=>'P75_BSE_MNMA'
,p_is_required=>true
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(172366674824486216)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Base M\00EDnima')
,p_format_mask=>'9G999G999G999G999G999'
,p_source=>'BSE_MNMA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>15
,p_cMaxlength=>16
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la base m\00EDnima.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172376891835486324)
,p_name=>'P75_BSE_MXMA'
,p_is_required=>true
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(172366674824486216)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Base M\00E1xima')
,p_format_mask=>'9G999G999G999G999G999'
,p_source=>'BSE_MXMA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>15
,p_cMaxlength=>16
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la base m\00E1xima.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172377254325486324)
,p_name=>'P75_TRFA'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(172366674824486216)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tarifa'
,p_source=>'TRFA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_AUTONUMERIC'
,p_cSize=>15
,p_cMaxlength=>7
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese la tarifa.'
,p_attribute_01=>'P75_TRFA_1'
,p_attribute_02=>'1000000'
,p_attribute_03=>'0'
,p_attribute_07=>','
,p_attribute_08=>','
,p_attribute_09=>'2'
,p_attribute_10=>'null'
,p_attribute_11=>'null'
,p_attribute_12=>'null'
,p_attribute_13=>'3'
,p_attribute_14=>'.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172377608636486325)
,p_name=>'P75_TXTO_TRFA'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(172366674824486216)
,p_use_cache_before_default=>'NO'
,p_source=>'TXTO_TRFA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>unistr('Ingrese la observaci\00F3n que corresponda a la tarifa.')
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(172372111175486308)
,p_validation_name=>'P75_FCHA_INCIAL must be timestamp'
,p_validation_sequence=>50
,p_validation=>'P75_FCHA_INCIAL'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_validation_condition_type=>'NEVER'
,p_associated_item=>wwv_flow_api.id(172371629993486302)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(172372963614486310)
,p_validation_name=>'P75_FCHA_FNAL must be timestamp'
,p_validation_sequence=>60
,p_validation=>'P75_FCHA_FNAL'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_validation_condition_type=>'NEVER'
,p_associated_item=>wwv_flow_api.id(172372428034486310)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(172355056153465813)
,p_validation_name=>'Valida_fecha_fin_no_menor_fecha_inicial'
,p_validation_sequence=>70
,p_validation=>'( :P75_FCHA_INCIAL  < :P75_FCHA_FNAL)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'La Fecha Final No puede ser Menor que la Fecha Inicial'
,p_associated_item=>wwv_flow_api.id(172372428034486310)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(172355541717465818)
,p_validation_name=>'Area_Const_max_no_menor_Area_Const_min'
,p_validation_sequence=>90
,p_validation=>'to_number(nvl(:P75_AREA_CNSCTRDA_MNMA,0), ''9G999G999G999G999G999'') <= to_number(nvl(:P75_AREA_CNSCTRDA_MXMA,0), ''9G999G999G999G999G999'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('\00C1rea Construida M\00E1xima no puede ser menor Area construida M\00EDnima')
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_api.id(172376076205486323)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(172355621838465819)
,p_validation_name=>'base_max_no_menor_base_min'
,p_validation_sequence=>100
,p_validation=>'to_number(nvl(:P75_BSE_MNMA,0), ''9G999G999G999G999G999'') <= to_number(nvl(:P75_BSE_MXMA,0), ''9G999G999G999G999G999'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('Base M\00E1xima no puede ser menor Base M\00EDnima')
,p_associated_item=>wwv_flow_api.id(172376891835486324)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(47179061007893149)
,p_validation_name=>'Area de terreno mayo que la min'
,p_validation_sequence=>110
,p_validation=>'to_number(nvl(:P75_AREA_TRRNO_MNMA,0), ''9G999G999G999G999G999'') <= to_number(nvl(:P75_AREA_TRRNO_MXMA,0), ''9G999G999G999G999G999'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('El \00E1rea de terreno m\00E1xima debe ser mayor al \00E1rea de terreno m\00EDnima.')
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_api.id(172375284424486323)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(172367759666486223)
,p_name=>'Closed Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(172367664456486223)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(172368567288486242)
,p_event_id=>wwv_flow_api.id(172367759666486223)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(172354630751465809)
,p_name=>'Set_Texto_Tarifa'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P75_TRFA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(172354794245465810)
,p_event_id=>wwv_flow_api.id(172354630751465809)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$s("P75_TXTO_TRFA", $v("P75_TRFA") + '' / 1000'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(47178352219893142)
,p_name=>'Al cambiar fecha de inicio'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P75_FCHA_INCIAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(47178454519893143)
,p_event_id=>wwv_flow_api.id(47178352219893142)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P75_FCHA_FNAL").datepicker( ''option'' , ''minDate'' , $("#P75_FCHA_INCIAL").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(172378413657486334)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from GI_D_PREDIOS_ESQUEMA'
,p_attribute_02=>'GI_D_PREDIOS_ESQUEMA'
,p_attribute_03=>'P75_ID_PRDIO_ESQMA'
,p_attribute_04=>'ID_PRDIO_ESQMA'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(172378830604486339)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of GI_D_PREDIOS_ESQUEMA'
,p_attribute_02=>'GI_D_PREDIOS_ESQUEMA'
,p_attribute_03=>'P75_ID_PRDIO_ESQMA'
,p_attribute_04=>'ID_PRDIO_ESQMA'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n realizada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(172379265477486339)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(172367234067486222)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(47854684427794618)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE,SAVE,CREATE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>unistr('Acci\00F3n Realizada con \00E9xito.')
);
end;
/
