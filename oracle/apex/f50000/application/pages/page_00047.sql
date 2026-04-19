prompt --application/pages/page_00047
begin
wwv_flow_api.create_page(
 p_id=>47
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>unistr('C\00E1lculo Uso Predio')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('C\00E1lculo Uso Predio')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'70%'
,p_protection_level=>'C'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250115084138'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(339623945522809430)
,p_plug_name=>unistr('C\00E1lculo Uso Predio')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29530253509068499)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(339624610694809435)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29532093730068500)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(47177388881893132)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(339623945522809430)
,p_button_name=>'Limpiar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny'
,p_button_template_id=>wwv_flow_api.id(29604517744068538)
,p_button_image_alt=>'Limpiar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-undo-alt'
,p_button_cattributes=>'style="margin-top: 10px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column_span=>1
,p_grid_column=>5
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(47177803662893137)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(339623945522809430)
,p_button_name=>'Limpiar_1'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny'
,p_button_template_id=>wwv_flow_api.id(29604517744068538)
,p_button_image_alt=>'Limpiar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-undo-alt'
,p_button_cattributes=>'style="margin-top: 10px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column_span=>1
,p_grid_column=>11
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(170031930694209934)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(339624610694809435)
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
 p_id=>wwv_flow_api.id(170032335478209935)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(339624610694809435)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro que desea eliminar el registro?'',''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P47_ID_PRDIO_CLCLO_USO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(170032793923209935)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(339624610694809435)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P47_ID_PRDIO_CLCLO_USO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(170033113051209936)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(339624610694809435)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P47_ID_PRDIO_CLCLO_USO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170025321145209919)
,p_name=>'P47_ID_PRDIO_CLCLO_USO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(339623945522809430)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Prdio Clclo Uso'
,p_source=>'ID_PRDIO_CLCLO_USO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170025696003209921)
,p_name=>'P47_CDGO_CLNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(339623945522809430)
,p_use_cache_before_default=>'NO'
,p_item_default=>'&F_CDGO_CLNTE.'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170026049112209921)
,p_name=>'P47_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(339623945522809430)
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
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_display_when=>'P47_ID_PRDIO_CLCLO_USO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tributo.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170026431854209923)
,p_name=>'P47_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(339623945522809430)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Sub-Tributo'
,p_source=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where id_impsto = :P47_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P47_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_display_when=>'P47_ID_PRDIO_CLCLO_USO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el sub tributo'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170026845526209924)
,p_name=>'P47_FCHA_INCIAL'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(339623945522809430)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Inicial'
,p_source=>'FCHA_INCIAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>10
,p_cMaxlength=>255
,p_tag_attributes=>' onkeydown="return false" '
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Seleccione la fecha inicial.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170027264646209925)
,p_name=>'P47_FCHA_FNAL'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(339623945522809430)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Final'
,p_source=>'FCHA_FNAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>10
,p_tag_attributes=>' onkeydown="return false" '
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Seleccione la fecha final'
,p_attribute_02=>'&P47_FCHA_INCIAL.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170027653062209926)
,p_name=>'P47_CDGO_PRDIO_CLSFCCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(339623945522809430)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Predio Clasificaci\00F3n')
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
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista la clasificaci\00F3n del predio.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170028008369209927)
,p_name=>'P47_CDGO_DSTNO_IGAC'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(339623945522809430)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Destino IGAC'
,p_source=>'CDGO_DSTNO_IGAC'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_DESTINOS_IGAC'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''[''||cdgo_dstno_igac||''] ''||nmbre_dstno_igac d,',
'       cdgo_dstno_igac r',
'  from df_s_destinos_igac',
' order by nmbre_dstno_igac'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el destino IGAC.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170028410321209927)
,p_name=>'P47_INDCDOR_CLCLO_AREA'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(339623945522809430)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Indicador C\00E1lculo \00C1rea')
,p_source=>'INDCDOR_CLCLO_AREA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Valor;V,Porcentaje;P'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista el indicador de c\00E1lculo de \00E1rea')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170028874925209931)
,p_name=>'P47_ID_PRDIO_USO_SLO'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(339623945522809430)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Predio Uso Suelo'
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
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el uso del suelo'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170029299073209932)
,p_name=>'P47_AREA_TRRNO_MNMA'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(339623945522809430)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00C1rea Terreno M\00EDnima')
,p_format_mask=>'9G999G999G999G999G999'
,p_source=>'AREA_TRRNO_MNMA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>15
,p_cMaxlength=>16
,p_tag_attributes=>'onkeyup="formatNumber(event,{ precision: 0, thousand: ''.'',decimal: '','' });"  onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el \00E1rea de terreno m\00EDnima.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170029659997209932)
,p_name=>'P47_AREA_TRRNO_MXMA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(339623945522809430)
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
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el \00E1rea de terreno m\00E1xima.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170030007104209933)
,p_name=>'P47_AREA_CNSCTRDA_MNMA'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(339623945522809430)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00C1rea Construida M\00EDnima')
,p_format_mask=>'9G999G999G999G999G999'
,p_source=>'AREA_CNSCTRDA_MNMA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>15
,p_cMaxlength=>16
,p_tag_attributes=>'onkeyup="formatNumber(event,{ precision: 0, thousand: ''.'',decimal: '','' });"  onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el \00E1rea de constr\00EDda m\00EDnima.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170030415113209933)
,p_name=>'P47_AREA_CNSCTRDA_MXMA'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(339623945522809430)
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
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el \00E1rea de constr\00EDda m\00E1xima.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170030891252209933)
,p_name=>'P47_PRCNTJE_MNMO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(339623945522809430)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Porcentaje M\00EDnimo')
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'PRCNTJE_MNMO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>15
,p_cMaxlength=>8
,p_tag_attributes=>'onkeyup="formatNumber(event,{ precision: 2, thousand: ''.'',decimal: '','' });"  onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el porcentaje m\00EDnimo.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170031200369209933)
,p_name=>'P47_PRCNTJE_MXMO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(339623945522809430)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Porcentaje M\00E1ximo')
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'PRCNTJE_MXMO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>15
,p_cMaxlength=>8
,p_tag_attributes=>'onkeyup="formatNumber(event,{ precision: 2, thousand: ''.'',decimal: '','' });"  onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el porcentaje m\00E1ximo.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170189170934550501)
,p_name=>'P47_FECHA_MIN'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(339623945522809430)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170189288465550502)
,p_name=>'P47_FECHA_MAX'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(339623945522809430)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170189348140550503)
,p_name=>'P47_VIGENCIA'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(339623945522809430)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(170033634304209951)
,p_validation_name=>'P47_FCHA_INCIAL must be timestamp'
,p_validation_sequence=>50
,p_validation=>'P47_FCHA_INCIAL'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'La #LABEL# ingresada no es valida. Por favor, verifique e intente nuevamente.'
,p_validation_condition_type=>'NEVER'
,p_associated_item=>wwv_flow_api.id(170026845526209924)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(170034087254209959)
,p_validation_name=>'P47_FCHA_FNAL must be timestamp'
,p_validation_sequence=>60
,p_validation=>'P47_FCHA_FNAL'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'La #LABEL# ingresada no es valida. Por favor, verifique e intente nuevamente.'
,p_validation_condition_type=>'NEVER'
,p_associated_item=>wwv_flow_api.id(170027264646209925)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(162922566862449708)
,p_validation_name=>'Valida_fecha_Fin_mayor_a_fecha_inicial'
,p_validation_sequence=>70
,p_validation=>'( :P47_FCHA_FNAL  >= :P47_FCHA_INCIAL)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'La Fecha Final no puede ser menor que Fecha Inicial.'
,p_associated_item=>wwv_flow_api.id(170027264646209925)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(170667206053120121)
,p_validation_name=>'Valida_area_terreno_max_mayor_a_area_terreno_min'
,p_validation_sequence=>80
,p_validation=>'(nvl(:P47_AREA_TRRNO_MNMA,0) <= nvl(:P47_AREA_TRRNO_MXMA,0))'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('\00C1rea terreno m\00E1xima no puede ser menor que \00C1rea terreno m\00EDnima.')
,p_associated_item=>wwv_flow_api.id(170029659997209932)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(170667327954120122)
,p_validation_name=>'Valida_area_construida_max_mayor_a_area_construida_min'
,p_validation_sequence=>90
,p_validation=>'( nvl(:P47_AREA_CNSCTRDA_MNMA  ,0)  <= nvl(:P47_AREA_CNSCTRDA_MXMA ,0) )'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('\00C1rea construida m\00E1xima no puede ser menor que \00C1rea construida m\00EDnima.')
,p_associated_item=>wwv_flow_api.id(170030415113209933)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(170668056619120129)
,p_validation_name=>'Valida_porcentaje_max_mayor_a_porcentaje_min'
,p_validation_sequence=>100
,p_validation=>'( :P47_PRCNTJE_MNMO  <= :P47_PRCNTJE_MXMO )'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('Porcentaje m\00E1ximo no puede ser menor a porcentaje m\00EDnimo.')
,p_associated_item=>wwv_flow_api.id(170031200369209933)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(26753567182609702)
,p_validation_name=>'Valida_campos_porcentual'
,p_validation_sequence=>110
,p_validation=>':P47_PRCNTJE_MNMO is not null and :P47_PRCNTJE_MXMO is not null'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('Para el calculo de \00E1rea por Porcentaje son requeridos los campos: Porcentaje M\00EDnimo y Porcentaje M\00E1ximo.')
,p_validation_condition=>'P47_INDCDOR_CLCLO_AREA'
,p_validation_condition2=>'P'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(170028410321209927)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(26753624091609703)
,p_validation_name=>'Valida_campos_valor'
,p_validation_sequence=>120
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    :P47_AREA_TRRNO_MNMA is not null',
'and :P47_AREA_TRRNO_MXMA is not null ',
'and :P47_AREA_CNSCTRDA_MNMA is not null ',
'and :P47_AREA_CNSCTRDA_MXMA is not null'))
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('Para el calculo de \00E1rea por Valor son requeridos los campos: \00C1rea Terreno M\00EDnima, \00C1rea Terreno M\00E1xima, \00C1rea Construida M\00EDnima y \00C1rea Construida M\00E1xima.')
,p_validation_condition=>'P47_INDCDOR_CLCLO_AREA'
,p_validation_condition2=>'V'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(170028410321209927)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(47502547126976620)
,p_validation_name=>'Validar rangos de Fecha'
,p_validation_sequence=>130
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
' v_gi_d_predios_calculo_uso gi_d_predios_calculo_uso.id_prdio_clclo_uso%type;',
'begin     ',
'  ',
'  --Verifica si el rango existe',
' select a.id_prdio_clclo_uso',
'   into v_gi_d_predios_calculo_uso',
'   from gi_d_predios_calculo_uso a',
'  where a.cdgo_clnte                   = :F_CDGO_CLNTE',
'    and a.id_impsto                    = :P47_ID_IMPSTO',
'    and a.id_impsto_sbmpsto            = :P47_ID_IMPSTO_SBMPSTO',
'    and a.cdgo_prdio_clsfccion         = :P47_CDGO_PRDIO_CLSFCCION',
'    and nvl( a.cdgo_dstno_igac , ''0'' ) = nvl( :P47_CDGO_DSTNO_IGAC , ''0'' )',
'	and a.indcdor_clclo_area           = :P47_INDCDOR_CLCLO_AREA',
'    and a.id_prdio_uso_slo               = :P47_ID_PRDIO_USO_SLO',
'    and ( to_date( :P47_FCHA_INCIAL, ''DD/MM/YYYY'') between a.fcha_incial and nvl( a.fcha_fnal , sysdate )',
'       or to_date( :P47_FCHA_FNAL, ''DD/MM/YYYY'') between a.fcha_incial and nvl( a.fcha_fnal , sysdate ));',
'      ',
'   if( v_gi_d_predios_calculo_uso = :P47_ID_PRDIO_CLCLO_USO ) then ',
'       return true;',
'   else',
'       return false;    ',
'   end if;',
'   ',
'exception ',
'',
'     when too_many_rows then ',
'          return false;',
'     when no_data_found then ',
'          return true;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('Rango de Fecha ya seleccionado para el tributo, destino IGAC, destino del predio e indicador de c\00E1lculo de \00E1rea, favor valide e intente nuevamente')
,p_always_execute=>'Y'
,p_validation_condition=>'SAVE,CREATE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(170035973619209961)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(170031930694209934)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(170036479025209965)
,p_event_id=>wwv_flow_api.id(170035973619209961)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(170667896932120127)
,p_name=>'calculo_porcentaje_minimo'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P47_PRCNTJE_MNMO'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(170667948947120128)
,p_event_id=>wwv_flow_api.id(170667896932120127)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var x = ((parseFloat($v("P47_PRCNTJE_MNMO")) / 100 )).toString().replace(''.'','','');  ',
'console.log(x);',
'$s("P47_PRCNTJE_MNMO", x);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(170668139225120130)
,p_name=>'calculo_porcentaje_maximo'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P47_PRCNTJE_MXMO'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(170668203609120131)
,p_event_id=>wwv_flow_api.id(170668139225120130)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var x = ((parseFloat($v("P47_PRCNTJE_MXMO")) / 100 )).toString().replace(''.'','','');  ',
'console.log(x);',
'$s("P47_PRCNTJE_MXMO", x);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(46925217251589177)
,p_name=>'Valida campos visibles'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P47_INDCDOR_CLCLO_AREA'
,p_condition_element=>'P47_INDCDOR_CLCLO_AREA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'P'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(46925679163589518)
,p_event_id=>wwv_flow_api.id(46925217251589177)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P47_PRCNTJE_MNMO,P47_PRCNTJE_MXMO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(46926001912589535)
,p_event_id=>wwv_flow_api.id(46925217251589177)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P47_PRCNTJE_MNMO,P47_PRCNTJE_MXMO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(46927080126589535)
,p_event_id=>wwv_flow_api.id(46925217251589177)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P47_AREA_TRRNO_MNMA,P47_AREA_TRRNO_MXMA,P47_AREA_CNSCTRDA_MNMA,P47_AREA_CNSCTRDA_MXMA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(46928080451589536)
,p_event_id=>wwv_flow_api.id(46925217251589177)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P47_AREA_TRRNO_MNMA,P47_AREA_TRRNO_MXMA,P47_AREA_CNSCTRDA_MNMA,P47_AREA_CNSCTRDA_MXMA'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(46926571913589535)
,p_event_id=>wwv_flow_api.id(46925217251589177)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P47_PRCNTJE_MNMO,P47_PRCNTJE_MXMO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(46927567520589535)
,p_event_id=>wwv_flow_api.id(46925217251589177)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P47_AREA_TRRNO_MNMA,P47_AREA_TRRNO_MXMA,P47_AREA_CNSCTRDA_MNMA,P47_AREA_CNSCTRDA_MXMA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(46599787654083242)
,p_name=>'Al cambiar fecha incio'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P47_FCHA_INCIAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(46599827678083243)
,p_event_id=>wwv_flow_api.id(46599787654083242)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P47_FCHA_FNAL").datepicker( ''option'' , ''minDate'' , $("#P47_FCHA_INCIAL").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(47177409994893133)
,p_name=>'Limpiar fecha '
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(47177388881893132)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(47177516625893134)
,p_event_id=>wwv_flow_api.id(47177409994893133)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P47_FCHA_INCIAL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(47178186845893140)
,p_name=>'Limpiar fecha fin'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(47177803662893137)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(47178260803893141)
,p_event_id=>wwv_flow_api.id(47178186845893140)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P47_FCHA_FNAL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(170034398905209960)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from GI_D_PREDIOS_CALCULO_USO'
,p_attribute_02=>'GI_D_PREDIOS_CALCULO_USO'
,p_attribute_03=>'P47_ID_PRDIO_CLCLO_USO'
,p_attribute_04=>'ID_PRDIO_CLCLO_USO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(170034724990209960)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of GI_D_PREDIOS_CALCULO_USO'
,p_attribute_02=>'GI_D_PREDIOS_CALCULO_USO'
,p_attribute_03=>'P47_ID_PRDIO_CLCLO_USO'
,p_attribute_04=>'ID_PRDIO_CLCLO_USO'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Se han guardado los cambios.'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(170035142768209960)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(170032335478209935)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(170035524522209961)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
