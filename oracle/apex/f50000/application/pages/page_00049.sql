prompt --application/pages/page_00049
begin
wwv_flow_api.create_page(
 p_id=>49
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>unistr('C\00E1lculo Destino')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('C\00E1lculo Destino')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('var htmldb_delete_message=''\00BFEst\00E1 seguro que desea eliminar el registro?'';'),
'',
'',
''))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'70%'
,p_protection_level=>'C'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250115090121'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(339749025352015050)
,p_plug_name=>unistr('C\00E1lculo Destino')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(339749668838015053)
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
 p_id=>wwv_flow_api.id(47176270067893121)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(339749025352015050)
,p_button_name=>'Limpiar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny'
,p_button_template_id=>wwv_flow_api.id(29604517744068538)
,p_button_image_alt=>'Limpiar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-undo-alt'
,p_button_cattributes=>'style="margin-top: 10px;margin-left: -7px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column_span=>1
,p_grid_column=>6
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(47176506630893124)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(339749025352015050)
,p_button_name=>'Limpiar_2'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny'
,p_button_template_id=>wwv_flow_api.id(29604517744068538)
,p_button_image_alt=>'Limpiar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-undo-alt'
,p_button_cattributes=>'style="margin-top: 10px;margin-left: -7px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column_span=>1
,p_grid_column=>12
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(170072159764217611)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(339749668838015053)
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
 p_id=>wwv_flow_api.id(170072578180217613)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(339749668838015053)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P49_ID_PRDIO_CLCLO_DSTNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(170072913662217613)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(339749668838015053)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P49_ID_PRDIO_CLCLO_DSTNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(170073380218217613)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(339749668838015053)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P49_ID_PRDIO_CLCLO_DSTNO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(46599408820083239)
,p_branch_name=>'Ir pagina 48'
,p_branch_action=>'f?p=&APP_ID.:48:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(170072913662217613)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170065497245217597)
,p_name=>'P49_ID_PRDIO_CLCLO_DSTNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(339749025352015050)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_PRDIO_CLCLO_DSTNO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170065878401217600)
,p_name=>'P49_CDGO_CLNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(339749025352015050)
,p_use_cache_before_default=>'NO'
,p_item_default=>'&F_CDGO_CLNTE.'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170066253997217600)
,p_name=>'P49_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(339749025352015050)
,p_use_cache_before_default=>'NO'
,p_item_default=>'101'
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
,p_display_when=>'P49_ID_PRDIO_CLCLO_DSTNO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tributo de la lista'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170066603949217601)
,p_name=>'P49_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(339749025352015050)
,p_use_cache_before_default=>'NO'
,p_item_default=>'1011'
,p_prompt=>'Sub-Tributo'
,p_source=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where id_impsto = :P49_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P49_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_display_when=>'P49_ID_PRDIO_CLCLO_DSTNO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista Sub Tributo de la lista.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170067074058217601)
,p_name=>'P49_FCHA_INCIAL'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(339749025352015050)
,p_use_cache_before_default=>'NO'
,p_item_default=>'to_date(''01/01/2020'',''DD/MM/YYYY'')'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha Inicial'
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'FCHA_INCIAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>22
,p_cMaxlength=>255
,p_tag_attributes=>'onkeydown="return false"'
,p_colspan=>5
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Seleccione la fecha inicial del c\00E1culo')
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170067435100217601)
,p_name=>'P49_FCHA_FNAL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(339749025352015050)
,p_use_cache_before_default=>'NO'
,p_item_default=>'to_date(''31/12/2020'',''DD/MM/YYYY'')'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha Final'
,p_source=>'FCHA_FNAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>22
,p_cMaxlength=>255
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Seleccione la fecha final del c\00E1culo')
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170067816530217602)
,p_name=>'P49_CDGO_PRDIO_CLSFCCION'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(339749025352015050)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Clasificaci\00F3n del  Predio ')
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
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista la clasificaci\00F3n del predio ')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170068213283217602)
,p_name=>'P49_CDGO_DSTNO_IGAC'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(339749025352015050)
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
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el destino IGAC correspondiente.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170068687997217603)
,p_name=>'P49_INDCDOR_CLCLO_AREA'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(339749025352015050)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Indicador C\00E1lculo \00C1rea')
,p_source=>'INDCDOR_CLCLO_AREA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Valor;V,Porcentaje;P'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Seleccione de la lista el indicador del c\00E1lculo de \00E1rea. ')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170069067830217603)
,p_name=>'P49_ID_PRDIO_DSTNO'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(339749025352015050)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Destino del Predio '
,p_source=>'ID_PRDIO_DSTNO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''[''||NMTCNCO||''] ''||dscrpcion d ,',
'        id_prdio_dstno r',
'   from df_i_predios_destino ',
'    where cdgo_clnte = :F_CDGO_CLNTE ',
'      and id_impsto  = :P49_ID_IMPSTO',
'   order by dscrpcion'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P49_ID_IMPSTO'
,p_ajax_items_to_submit=>'P49_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el destino del predio.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170069482120217604)
,p_name=>'P49_AREA_TRRNO_MNMA'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(339749025352015050)
,p_use_cache_before_default=>'NO'
,p_item_default=>'0'
,p_prompt=>unistr('\00C1rea Terreno M\00EDnima')
,p_source=>'AREA_TRRNO_MNMA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>15
,p_cMaxlength=>12
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el \00E1rea de terreno m\00EDnima. Solo admite valores num\00E9ricos.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170069877378217604)
,p_name=>'P49_AREA_TRRNO_MXMA'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(339749025352015050)
,p_use_cache_before_default=>'NO'
,p_item_default=>'999999999999'
,p_prompt=>unistr('\00C1rea Terreno M\00E1xima')
,p_source=>'AREA_TRRNO_MXMA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>15
,p_cMaxlength=>12
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el \00E1rea de terreno m\00E1xima. Solo admite valores num\00E9ricos y el valor debe ser mayor al \00E1rea de terreno m\00EDnima.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170070211063217604)
,p_name=>'P49_AREA_CNSCTRDA_MNMA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(339749025352015050)
,p_use_cache_before_default=>'NO'
,p_item_default=>'1'
,p_prompt=>unistr('\00C1rea Construida M\00EDnima')
,p_source=>'AREA_CNSCTRDA_MNMA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>15
,p_cMaxlength=>12
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el \00E1rea de terreno construida m\00EDnima. Solo admite valores num\00E9ricos.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170070644742217604)
,p_name=>'P49_AREA_CNSCTRDA_MXMA'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(339749025352015050)
,p_use_cache_before_default=>'NO'
,p_item_default=>'999999999999'
,p_prompt=>unistr('\00C1rea Construida M\00E1xima')
,p_source=>'AREA_CNSCTRDA_MXMA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>15
,p_cMaxlength=>12
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el \00E1rea m\00E1xima de construcci\00F3n. Solo admite valores num\00E9ricos, el \00E1rea construida m\00E1xima no puede ser menor que \00E1rea construida m\00EDnima')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170071023367217604)
,p_name=>'P49_PRCNTJE_MNMO'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(339749025352015050)
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
 p_id=>wwv_flow_api.id(170071406817217606)
,p_name=>'P49_PRCNTJE_MXMO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(339749025352015050)
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
,p_help_text=>unistr('Ingrese el porcentaje m\00E1ximo ')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(170073879137217619)
,p_validation_name=>'P49_FCHA_INCIAL must be timestamp'
,p_validation_sequence=>50
,p_validation=>'P49_FCHA_INCIAL'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_api.id(170067074058217601)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(170074227514217619)
,p_validation_name=>'P49_FCHA_FNAL must be timestamp'
,p_validation_sequence=>60
,p_validation=>'P49_FCHA_FNAL'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_api.id(170067435100217601)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(162923279114449715)
,p_validation_name=>'Valida_fecha_Fin_mayor_a_fecha_menor'
,p_validation_sequence=>70
,p_validation=>'to_date(:P49_FCHA_INCIAL  ,''dd/mm/rr'')  < to_date(:P49_FCHA_FNAL,''dd/mm/rr'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Fecha Final no puede ser menor que Fecha Inicial'
,p_associated_item=>wwv_flow_api.id(170067435100217601)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(162923386561449716)
,p_validation_name=>'Validar area de terreno max'
,p_validation_sequence=>90
,p_validation=>'( nvl(:P49_AREA_TRRNO_MNMA ,0) <= nvl(:P49_AREA_TRRNO_MXMA,0))'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('\00C1rea Terreno M\00E1xima no puede ser Menor que \00C1rea Terreno M\00EDnima')
,p_associated_item=>wwv_flow_api.id(170069877378217604)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(162923468050449717)
,p_validation_name=>'Validar area construida max'
,p_validation_sequence=>100
,p_validation=>' ( nvl(:P49_AREA_CNSCTRDA_MNMA,0)  <= nvl(:P49_AREA_CNSCTRDA_MXMA,0) )'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('\00C1rea construida m\00E1xima no puede ser Menor que \00C1rea construida M\00EDnima')
,p_associated_item=>wwv_flow_api.id(170070644742217604)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(162923532808449718)
,p_validation_name=>'Porcentaje_max'
,p_validation_sequence=>110
,p_validation=>'( :P47_PRCNTJE_MNMO  < :P47_PRCNTJE_MXMO )'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('Porcentaje m\00E1ximo no puede ser Menor a Porc\00E9ntaje M\00EDnimo')
,p_associated_item=>wwv_flow_api.id(170071406817217606)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(46599286129083237)
,p_validation_name=>'Areas de Terreno no nulas'
,p_validation_sequence=>120
,p_validation=>' not (:P49_INDCDOR_CLCLO_AREA =''V'' and :P49_AREA_TRRNO_MNMA is null or :P49_AREA_CNSCTRDA_MNMA is null)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('\00C1reas de terreno y \00C1reas de construcci\00F3n m\00EDnimas y m\00E1ximas deben tener alg\00FAn valor.  ')
,p_validation_condition=>'P49_INDCDOR_CLCLO_AREA'
,p_validation_condition2=>'V'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(46599393037083238)
,p_validation_name=>unistr('Porcentaje m\00EDnimo no null')
,p_validation_sequence=>130
,p_validation=>' not (:P49_INDCDOR_CLCLO_AREA =''P'' and :P49_PRCNTJE_MNMO is null or :P49_PRCNTJE_MXMO is null)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('Porcentaje M\00EDnimo y M\00E1ximo deben tener alg\00FAn Valor.')
,p_validation_condition=>'P49_INDCDOR_CLCLO_AREA'
,p_validation_condition2=>'P'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(170071023367217604)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(46599500908083240)
,p_validation_name=>'Procentaje Max mayor que el Inicial'
,p_validation_sequence=>140
,p_validation=>'(:P49_PRCNTJE_MNMO <= :P49_PRCNTJE_MXMO)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('El Porcentaje M\00E1ximo no puede ser menor que el porcentaje M\00EDnimo. ')
,p_associated_item=>wwv_flow_api.id(170071406817217606)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(47175223140893111)
,p_validation_name=>'Validar rangos de Fecha'
,p_validation_sequence=>150
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
' v_id_prdio_clclo_dstno gi_d_predios_calculo_destino.id_prdio_clclo_dstno%type;',
'begin     ',
'  ',
'  --Verifica si el rango existe',
' select a.id_prdio_clclo_dstno',
'   into v_id_prdio_clclo_dstno',
'   from gi_d_predios_calculo_destino a',
'  where a.cdgo_clnte                   = :F_CDGO_CLNTE',
'    and a.id_impsto                    = :P49_ID_IMPSTO',
'    and a.id_impsto_sbmpsto            = :P49_ID_IMPSTO_SBMPSTO',
'    and a.cdgo_prdio_clsfccion         = :P49_CDGO_PRDIO_CLSFCCION',
'    and nvl( a.cdgo_dstno_igac , ''0'' ) = nvl( :P49_CDGO_DSTNO_IGAC , ''0'' )',
'	and a.indcdor_clclo_area           = :P49_INDCDOR_CLCLO_AREA',
'    and a.id_prdio_dstno               = :P49_ID_PRDIO_DSTNO',
'    and ( to_date( :P49_FCHA_INCIAL, ''DD/MM/YYYY'') between a.fcha_incial and nvl( a.fcha_fnal , sysdate )',
'       or to_date( :P49_FCHA_FNAL, ''DD/MM/YYYY'') between a.fcha_incial and nvl( a.fcha_fnal , sysdate ));',
'      ',
'   if( v_id_prdio_clclo_dstno = :P49_ID_PRDIO_CLCLO_DSTNO ) then ',
'       return true;',
'   else',
'       return false;    ',
'   end if;',
'   ',
'exception ',
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
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(47589552845065056)
,p_validation_name=>'Validar fecha fin'
,p_validation_sequence=>160
,p_validation=>'to_date(:P48_FECHA_INICIAL,''dd/mm/rr'')  < to_date(:P48_FECHA_FIN,''dd/mm/rr'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'La fecha fin debe ser mayor a la fecha inicial'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(170075671947217620)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(170072159764217611)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(170076158754217621)
,p_event_id=>wwv_flow_api.id(170075671947217620)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(162923652372449719)
,p_name=>'calculo_porcentaje_minimo'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P49_PRCNTJE_MNMO'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(162923775676449720)
,p_event_id=>wwv_flow_api.id(162923652372449719)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var x = ((parseFloat($v("P49_PRCNTJE_MNMO")) / 100 )).toString().replace(''.'','','');  ',
'console.log(x);',
'$s("P49_PRCNTJE_MNMO", x);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(162923810659449721)
,p_name=>'calculo_porcentaje_maximo'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P49_PRCNTJE_MXMO'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(162923947936449722)
,p_event_id=>wwv_flow_api.id(162923810659449721)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var x = ((parseFloat($v("P49_PRCNTJE_MXMO")) / 100 )).toString().replace(''.'','','');  ',
'console.log(x);',
'$s("P49_PRCNTJE_MXMO", x);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(46359640582318828)
,p_name=>'Valida campos visibles'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P49_INDCDOR_CLCLO_AREA'
,p_condition_element=>'P49_INDCDOR_CLCLO_AREA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'P'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(46359725704318829)
,p_event_id=>wwv_flow_api.id(46359640582318828)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P49_PRCNTJE_MNMO,P49_PRCNTJE_MXMO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(46359856714318830)
,p_event_id=>wwv_flow_api.id(46359640582318828)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P49_PRCNTJE_MNMO,P49_PRCNTJE_MXMO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(46360209033318834)
,p_event_id=>wwv_flow_api.id(46359640582318828)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P49_AREA_TRRNO_MNMA,P49_AREA_TRRNO_MXMA,P49_AREA_CNSCTRDA_MNMA,P49_AREA_CNSCTRDA_MXMA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(46360341600318835)
,p_event_id=>wwv_flow_api.id(46359640582318828)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P49_AREA_TRRNO_MNMA,P49_AREA_TRRNO_MXMA,P49_AREA_CNSCTRDA_MNMA,P49_AREA_CNSCTRDA_MXMA'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(46359935515318831)
,p_event_id=>wwv_flow_api.id(46359640582318828)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P49_PRCNTJE_MNMO,P49_PRCNTJE_MXMO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(46360187823318833)
,p_event_id=>wwv_flow_api.id(46359640582318828)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P49_AREA_TRRNO_MNMA,P49_AREA_TRRNO_MXMA,P49_AREA_CNSCTRDA_MNMA,P49_AREA_CNSCTRDA_MXMA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(47176337528893122)
,p_name=>'Limpiar fecha'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(47176270067893121)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(47176441153893123)
,p_event_id=>wwv_flow_api.id(47176337528893122)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P49_FCHA_INCIAL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(47176618771893125)
,p_name=>'Limpiar fecha fin'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(47176506630893124)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(47176789791893126)
,p_event_id=>wwv_flow_api.id(47176618771893125)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P49_FCHA_FNAL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(47590664629081372)
,p_name=>'Al cambiar fecha de inicio'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P49_FCHA_INCIAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(47591060139081378)
,p_event_id=>wwv_flow_api.id(47590664629081372)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P49_FCHA_FNAL").datepicker( ''option'' , ''minDate'' , $("#P49_FCHA_INCIAL").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(170074553828217619)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from GI_D_PREDIOS_CALCULO_DESTINO'
,p_attribute_02=>'GI_D_PREDIOS_CALCULO_DESTINO'
,p_attribute_03=>'P49_ID_PRDIO_CLCLO_DSTNO'
,p_attribute_04=>'ID_PRDIO_CLCLO_DSTNO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(170074967735217620)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of GI_D_PREDIOS_CALCULO_DESTINO'
,p_attribute_02=>'GI_D_PREDIOS_CALCULO_DESTINO'
,p_attribute_03=>'P49_ID_PRDIO_CLCLO_DSTNO'
,p_attribute_04=>'ID_PRDIO_CLCLO_DSTNO'
,p_attribute_09=>'P49_ID_PRDIO_CLCLO_DSTNO'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Se han guardado los cambios.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(170075285327217620)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(170072578180217613)
);
end;
/
