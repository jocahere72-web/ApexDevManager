prompt --application/pages/page_00391
begin
wwv_flow_api.create_page(
 p_id=>391
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Registro T\00EDtulo')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Registro T\00EDtulo')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(177318053164050589)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_width=>'60%'
,p_last_updated_by=>'ACONDE'
,p_last_upd_yyyymmddhh24miss=>'20240619170815'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(33473993877891585)
,p_plug_name=>unistr('<b>T\00EDtulo No. </b>&P391_NMRO_TTLO_JDCIAL.')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'GF_G_TITULOS_JUDICIAL'
,p_include_rowid_column=>false
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16973682860729403)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(33473993877891585)
,p_button_name=>'UPDATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P391_ID_TTLO_JDCIAL'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16974762942729414)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(33473993877891585)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16891844649106617)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(33473993877891585)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(29529773815046794)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(33473993877891585)
,p_button_name=>'BTN_RGSTRO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P391_ID_TTLO_JDCIAL'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16973798062729404)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(33473993877891585)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_condition=>'P391_ID_TTLO_JDCIAL'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16892238325106623)
,p_name=>'P391_IDNTFCCION_DMNDNTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(33473993877891585)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmro_idntfccion',
'  from df_s_clientes',
' where cdgo_clnte = :F_CDGO_CLNTE;'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>unistr('<b>Identificaci\00F3n Demandante</b>')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16892525209106641)
,p_name=>'P391_NMBRE_DMNDNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(33473993877891585)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_clnte',
'  from df_s_clientes',
' where cdgo_clnte = :F_CDGO_CLNTE;'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'<b>Nombre Demandante</b>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16892932801106642)
,p_name=>'P391_ID_TTLO_JDCIAL_AREA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(33473993877891585)
,p_item_source_plug_id=>wwv_flow_api.id(33473993877891585)
,p_prompt=>unistr('<b>\00C1rea</b>')
,p_source=>'ID_TTLO_JDCIAL_AREA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_area as d,',
'       id_area as r',
'  from df_c_areas',
' order by 2 asc'))
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16893311193106642)
,p_name=>'P391_ID_TTLO_JDCIAL'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(33473993877891585)
,p_item_source_plug_id=>wwv_flow_api.id(33473993877891585)
,p_source=>'ID_TTLO_JDCIAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16893723145106643)
,p_name=>'P391_CDGO_CLNTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(33473993877891585)
,p_item_source_plug_id=>wwv_flow_api.id(33473993877891585)
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16894176320106647)
,p_name=>'P391_ID_TTLO_JDCIAL_CRGDO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(33473993877891585)
,p_item_source_plug_id=>wwv_flow_api.id(33473993877891585)
,p_source=>'ID_TTLO_JDCIAL_CRGDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16894578721106648)
,p_name=>'P391_NMRO_TTLO_JDCIAL'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(33473993877891585)
,p_item_source_plug_id=>wwv_flow_api.id(33473993877891585)
,p_prompt=>unistr('<b>N\00FAmero T\00EDtulo Judicial</b>')
,p_source=>'NMRO_TTLO_JDCIAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cMaxlength=>20
,p_tag_attributes=>'onkeypress="return validarExpresion(event,''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16894926285106648)
,p_name=>'P391_FCHA_CNSTTCION'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(33473993877891585)
,p_item_source_plug_id=>wwv_flow_api.id(33473993877891585)
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>unistr('<b>Fecha Constituci\00F3n</b>')
,p_format_mask=>'DD/MM/YYYY'
,p_source=>'FCHA_CNSTTCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'-0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16895384375106648)
,p_name=>'P391_VLOR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(33473993877891585)
,p_item_source_plug_id=>wwv_flow_api.id(33473993877891585)
,p_prompt=>'<b>Valor</b>'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
,p_source=>'VLOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cMaxlength=>20
,p_tag_attributes=>'onkeypress="return validarExpresion(event,''numeroEntero'');" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16895744573106648)
,p_name=>'P391_CDGO_IDNTFCCION_TPO_DMNDDO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(33473993877891585)
,p_item_source_plug_id=>wwv_flow_api.id(33473993877891585)
,p_prompt=>unistr('<b>Tipo Identificaci\00F3n Demandado</b>')
,p_source=>'CDGO_IDNTFCCION_TPO_DMNDDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_idntfccion_tpo as d,',
'       cdgo_idntfccion_tpo as r',
'  from df_s_identificaciones_tipo',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16896134995106648)
,p_name=>'P391_IDNTFCCION_DMNDDO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(33473993877891585)
,p_item_source_plug_id=>wwv_flow_api.id(33473993877891585)
,p_prompt=>unistr('<b>Identificaci\00F3n Demandado</b>')
,p_source=>'IDNTFCCION_DMNDDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cMaxlength=>20
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16896568652106649)
,p_name=>'P391_NMBRE_DMNDDO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(33473993877891585)
,p_item_source_plug_id=>wwv_flow_api.id(33473993877891585)
,p_prompt=>'<b>Nombre Demandado</b>'
,p_source=>'NMBRE_DMNDDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16896937372106651)
,p_name=>'P391_ID_BNCO_CNSGNNTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(33473993877891585)
,p_item_source_plug_id=>wwv_flow_api.id(33473993877891585)
,p_prompt=>'<b>Entidad Consignante</b>'
,p_source=>'ID_BNCO_CNSGNNTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select cdgo_bnco || '' - '' || nmbre_bnco as d',
'         , id_bnco as r',
'      from df_c_bancos',
'     where cdgo_clnte = :F_CDGO_CLNTE',
'       and rcddor = ''S''',
'       and cdgo_bnco = 40',
'  order by cdgo_bnco'))
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16897339817106651)
,p_name=>'P391_CDGO_ENTDAD_CNSGNNTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(33473993877891585)
,p_item_source_plug_id=>wwv_flow_api.id(33473993877891585)
,p_source=>'CDGO_ENTDAD_CNSGNNTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16897784999106652)
,p_name=>'P391_ID_BNCO_RCDDR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(33473993877891585)
,p_item_source_plug_id=>wwv_flow_api.id(33473993877891585)
,p_prompt=>'<b>Entidad Recaudadora</b>'
,p_source=>'ID_BNCO_RCDDR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select cdgo_bnco || '' - '' || nmbre_bnco as d',
'         , id_bnco as r',
'      from df_c_bancos',
'     where cdgo_clnte = :F_CDGO_CLNTE',
'       and rcddor = ''S''',
'  order by cdgo_bnco'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16898178811106652)
,p_name=>'P391_CDGO_ENTDAD_RCDDR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(33473993877891585)
,p_item_source_plug_id=>wwv_flow_api.id(33473993877891585)
,p_source=>'CDGO_ENTDAD_RCDDR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16898520948106652)
,p_name=>'P391_NMRO_TTLO_PDRE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(33473993877891585)
,p_item_source_plug_id=>wwv_flow_api.id(33473993877891585)
,p_prompt=>unistr('<b>N\00FAmero T\00EDtulo Judicial Padre</b>')
,p_source=>'NMRO_TTLO_PDRE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cMaxlength=>20
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16898950931106653)
,p_name=>'P391_ID_TTLO_PDRE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(33473993877891585)
,p_item_source_plug_id=>wwv_flow_api.id(33473993877891585)
,p_source=>'ID_TTLO_PDRE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16899300091106653)
,p_name=>'P391_CDGO_TTLO_JDCIAL_ESTDO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(33473993877891585)
,p_item_source_plug_id=>wwv_flow_api.id(33473993877891585)
,p_item_default=>'RGS'
,p_source=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16899702966106653)
,p_name=>'P391_ID_EMBRGO_RSLCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(33473993877891585)
,p_item_source_plug_id=>wwv_flow_api.id(33473993877891585)
,p_source=>'ID_EMBRGO_RSLCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16900155724106653)
,p_name=>'P391_ID_INSTNCIA_FLJO_PDRE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(33473993877891585)
,p_item_source_plug_id=>wwv_flow_api.id(33473993877891585)
,p_source=>'ID_INSTNCIA_FLJO_PDRE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16900559316106654)
,p_name=>'P391_ID_INSTNCIA_FLJO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(33473993877891585)
,p_item_source_plug_id=>wwv_flow_api.id(33473993877891585)
,p_source=>'ID_INSTNCIA_FLJO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16900993867106654)
,p_name=>'P391_ID_SLCTUD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(33473993877891585)
,p_item_source_plug_id=>wwv_flow_api.id(33473993877891585)
,p_source=>'ID_SLCTUD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16901319047106654)
,p_name=>'P391_RSPSTA'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(33473993877891585)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16973454657729401)
,p_name=>'P391_CNSCTVO_EMBRGO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(33473993877891585)
,p_item_source_plug_id=>wwv_flow_api.id(33473993877891585)
,p_prompt=>'<b>Consecutivo Embargo</b>'
,p_source=>'CNSCTVO_EMBRGO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.cnsctvo_embrgo||'' - ''||to_char(a.fcha_rgstro_embrgo,''DD/MM/YYYY'') ||'' - ''||b.nmbre_trcro as d',
'     , a.cnsctvo_embrgo as r',
'from v_mc_g_embargos_resolucion a',
'join mc_g_embargos_responsable c on c.id_embrgos_crtra = a.id_embrgos_crtra',
'join v_sg_g_usuarios b on b.id_fncnrio = a.id_fncnrio',
'--where ltrim(c.idntfccion, 0) = ltrim(:P391_IDNTFCCION_DMNDDO, 0)',
';'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P391_IDNTFCCION_DMNDDO'
,p_ajax_items_to_submit=>'P391_IDNTFCCION_DMNDDO,P391_CNSCTVO_EMBRGO,P391_ID_FNCNRIO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19041002189849604)
,p_name=>'P391_ID_FNCNRIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(33473993877891585)
,p_item_source_plug_id=>wwv_flow_api.id(33473993877891585)
,p_prompt=>'<b>Funcionario</b>'
,p_source=>'ID_FNCNRIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_trcro as d, a.id_fncnrio as r',
'  from v_mc_g_embargos_resolucion a',
'  join v_sg_g_usuarios b',
'    on b.id_fncnrio = a.id_fncnrio',
' where b.actvo = ''S''',
'   and b.id_fncnrio != 700012',
' group by b.nmbre_trcro, a.id_fncnrio',
' order by a.id_fncnrio;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P391_CNSCTVO_EMBRGO'
,p_ajax_items_to_submit=>'P391_CNSCTVO_EMBRGO,P391_ID_FNCNRIO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29410203199156743)
,p_name=>'P391_JSON_TTLOS'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(33473993877891585)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29410321218156744)
,p_name=>'P391_ID_USRIO_RGSTRO'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(33473993877891585)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29530058175057306)
,p_name=>'P391_NMRO_SJTOS'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(33473993877891585)
,p_display_as=>'NATIVE_HIDDEN'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(16973539500729402)
,p_computation_sequence=>10
,p_computation_item=>'P391_ID_EMBRGO_RSLCION'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_embrgos_rslcion',
'from mc_g_embargos_resolucion',
'where cnsctvo_embrgo = :P391_CNSCTVO_EMBRGO'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(16919630617106736)
,p_computation_sequence=>40
,p_computation_item=>'P391_CDGO_ENTDAD_CNSGNNTE'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.cdgo_bnco ',
'  from df_c_bancos a',
' where a.id_bnco = :P391_ID_BNCO_CNSGNNTE'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(16919986619106739)
,p_computation_sequence=>40
,p_computation_item=>'P391_CDGO_ENTDAD_RCDDR'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.cdgo_bnco ',
'  from df_c_bancos a',
' where a.id_bnco = :P391_ID_BNCO_RCDDR'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(16920396727106740)
,p_computation_sequence=>40
,p_computation_item=>'P391_ID_TTLO_PDRE'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_ttlo_jdcial',
'from gf_g_titulos_judicial',
'where nmro_ttlo_jdcial = :P391_NMRO_TTLO_PDRE'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(18989534077319625)
,p_validation_name=>'Valor solo admite numeros'
,p_validation_sequence=>20
,p_validation=>'P391_VLOR'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>unistr('Valor solo admite n\00FAmeros.')
,p_always_execute=>'Y'
,p_validation_condition_type=>'NEVER'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(19000792201616211)
,p_validation_name=>unistr('Identificaci\00F3n solo admite numeros')
,p_validation_sequence=>30
,p_validation=>'P391_IDNTFCCION_DMNDDO'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>unistr('Identificaci\00F3n solo admite n\00FAmeros.')
,p_always_execute=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(19000806818616212)
,p_validation_name=>'Titulo padre solo admite numeros'
,p_validation_sequence=>50
,p_validation=>'P391_NMRO_TTLO_PDRE'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>unistr('N\00FAmero t\00EDtulo padre solo admite n\00FAmeros.')
,p_always_execute=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(18983021851209303)
,p_validation_name=>'Numero titulo solo admite numeros'
,p_validation_sequence=>60
,p_validation=>'P391_NMRO_TTLO_JDCIAL'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>unistr('N\00FAmero t\00EDtulo solo admite n\00FAmeros.')
,p_always_execute=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(19000975939616213)
,p_validation_name=>'Banco recaudador debe seleccionarse'
,p_validation_sequence=>80
,p_validation=>'P391_ID_BNCO_RCDDR'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Banco Recaudador no puede estar vac\00EDo, por favor seleccione un banco.')
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_api.id(16897784999106652)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(19040999389849603)
,p_validation_name=>unistr('N\00FAmero titulo debe ser unico')
,p_validation_sequence=>90
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_ttlo_jdcial',
'from gf_g_titulos_judicial a',
'where a.nmro_ttlo_jdcial = :P391_NMRO_TTLO_JDCIAL'))
,p_validation_type=>'EXISTS'
,p_error_message=>unistr('N\00FAmero t\00EDtulo judicial ya existe.')
,p_always_execute=>'Y'
,p_validation_condition_type=>'NEVER'
,p_associated_item=>wwv_flow_api.id(16894578721106648)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(16974831367729415)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(16974762942729414)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(16974983184729416)
,p_event_id=>wwv_flow_api.id(16974831367729415)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(18999759509616201)
,p_name=>unistr('Al cambiar tipo de identificaci\00F3n')
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P391_IDNTFCCION_DMNDDO,P391_CDGO_IDNTFCCION_TPO_DMNDDO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(18999887156616202)
,p_event_id=>wwv_flow_api.id(18999759509616201)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function Buscar_Demandado() {',
'    let $waitPopup = apex.widget.waitPopup();',
'    try {',
'        await apex.server.process("Buscar_Demandado", {',
'            pageItems: "#P391_CDGO_IDNTFCCION_TPO_DMNDDO,#P391_IDNTFCCION_DMNDDO"',
'        }).then(function (resp) {',
'            Object.keys(resp).forEach((f) => {',
'                apex.item(''P391_'' + f).setValue(('''' + resp[f]).trim());',
'            });',
'        }',
'        );',
'',
'',
'    } catch (error) {',
'        console.log(error);',
'    } finally {',
'        if ($waitPopup)',
'            $waitPopup.remove();',
'    }',
'}',
'',
'Buscar_Demandado();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(29532535881458702)
,p_name=>'Al dar clic BTN_RGSTRO'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(29529773815046794)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29532662814458703)
,p_event_id=>wwv_flow_api.id(29532535881458702)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('function fnc_guardarT\00EDtulos() {'),
'    try {',
'        ',
'        jsonTitulos();',
'        ',
'        apex.server.process("registrarTitulos", {',
'            pageItems: "#F_CDGO_CLNTE, #P391_JSON_TTLOS"',
'        }, {',
'            success: function (data) {',
'                ',
'                if (data.o_cdgo_rspsta != 0) {',
'                    console.log(''RESPUESTA: '' + data.o_cdgo_rspsta);',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors([',
'                        {',
'                            type: "error",',
'                            location: "page",',
'                            message: data.o_mnsje_rspsta,',
'                            unsafe: false',
'                        }',
'                    ]);',
'                } else {',
unistr('                    apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                    apex.submit();',
'                }',
'            }',
'        })',
'    } catch (e) {',
'        console.log(e);',
'    }',
'} ',
'',
'',
unistr('apex.message.confirm("\00BFEst\00E1 seguro de registar el t\00EDtulo con estos datos?", function (okPressed) {'),
'    if (okPressed) {',
unistr('        fnc_guardarT\00EDtulos();'),
'    }',
'}); '))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16920604269106740)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Secuencia DML'
,p_process_sql_clob=>':P391_ID_TTLO_JDCIAL := sq_gf_g_titulos_judicial.nextval;'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(16891844649106617)
,p_process_when=>'P391_ID_TTLO_JDCIAL'
,p_process_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16902128870106661)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(33473993877891585)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Registrar  TJ'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(16891844649106617)
,p_process_when=>'P391_ID_TTLO_JDCIAL'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>unistr('\00A1T\00EDtulo Registrado!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16973880794729405)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(33473993877891585)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Actualizar TJ'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'N'
,p_attribute_08=>'N'
,p_process_error_message=>unistr('N\00FAmero t\00EDtulo judicial ya existe.')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(16973682860729403)
,p_process_when=>'P391_ID_TTLO_JDCIAL'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>unistr('\00A1T\00EDtulo Actualizado!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16973938761729406)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(33473993877891585)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Eliminar TJ'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'N'
,p_attribute_08=>'N'
,p_process_error_message=>unistr('No se puede borrar este t\00EDtulo, contiene flujos asociados.')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(16973798062729404)
,p_process_when=>'P391_ID_TTLO_JDCIAL'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>unistr('\00A1T\00EDtulo Eliminado!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16975040971729417)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar items'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(16973798062729404)
,p_process_success_message=>unistr('\00A1T\00EDtulo Eliminado!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(29532779156458704)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'registroTraza'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_titulo       gf_g_titulos_judicial%rowtype;',
'  o_cdgo_rspsta  number;',
'  o_mnsje_rspsta varchar2(1000);',
'',
'begin',
'',
'  begin',
'    select *--id_ttlo_jdcial, cdgo_ttlo_jdcial_estdo, id_usrio_rgstro',
'      into v_titulo',
'      from gf_g_titulos_judicial',
'     where nmro_ttlo_jdcial = :P391_NMRO_TTLO_JDCIAL;',
'  exception',
'    when no_data_found then',
'      raise;',
'  end;',
'',
'  if v_titulo.id_ttlo_jdcial is not null then',
'  ',
'    pkg_gf_titulos_judicial.prc_rg_titulo_finaliza_traza(p_cdgo_clnte     => :F_CDGO_CLNTE,',
'                                                         p_id_ttlo_jdcial => v_titulo.id_ttlo_jdcial,',
'                                                         p_id_usrio       => v_titulo.id_usrio_rgstro,',
'                                                         p_cdgo_ttlo_nvo  => ''ACT'',',
unistr('                                                         p_obsrvcion      => ''Actualizaci\00F3n de t\00EDtulo judicial'','),
'                                                         p_id_fljo_trea   => null,',
'                                                         o_cdgo_rspsta    => o_cdgo_rspsta,',
'                                                         o_mnsje_rspsta   => o_mnsje_rspsta);',
'  ',
'  end if;',
'',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(16973682860729403)
,p_process_when=>'P391_ID_TTLO_JDCIAL'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16921038648106740)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registro Traza'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'    v_cdgo_rspsta            number;',
'    v_id_instncia_fljo       number;',
'    v_id_fljo_trea_orgen     number;',
'    v_type_rspsta            varchar2(1);',
'    v_mnsje_rspsta           varchar2(200); ',
'    v_error_msg              number;  ',
'    ',
'begin',
'    pkg_gf_titulos_judicial.prc_rg_titulos_traza(p_cdgo_clnte                 =>    :F_CDGO_CLNTE,',
'                                                 p_id_ttlo_jdcial             =>    :P391_ID_TTLO_JDCIAL,',
'                                                 p_cdgo_ttlo_jdcial_estdo     =>    :P391_CDGO_TTLO_JDCIAL_ESTDO, ',
unistr('                                                 p_obsrvcion                  =>    ''T\00CDTULO No. ''||:P391_NMRO_TTLO_JDCIAL ||'' REGISTRADO'','),
'                                                 p_id_usrio                   =>    :F_ID_USRIO,',
'                                                 o_cdgo_rspsta                =>    v_cdgo_rspsta,',
'                                                 o_mnsje_rspsta               =>    :P391_RSPSTA);',
'    /*begin',
'                        ',
'         select a.id_instncia_fljo,',
'                b.id_fljo_trea_orgen',
'            into v_id_instncia_fljo,',
'                 v_id_fljo_trea_orgen ',
'            from gf_g_titulos_judicial a',
'            join wf_g_instancias_transicion b on a.id_instncia_fljo = b.id_instncia_fljo ',
'            and b.id_estdo_trnscion in (1,2)',
'            where id_ttlo_jdcial = :P391_ID_TTLO_JDCIAL;',
'    ',
'            pkg_pl_workflow_1_0.prc_rg_instancias_transicion(p_id_instncia_fljo => v_id_instncia_fljo,',
'                                                             p_id_fljo_trea		=> v_id_fljo_trea_orgen,',
'                                                             p_json				=> ''[]'' ,',
'                                                             o_type				=> v_type_rspsta,',
'                                                             o_mnsje			=> v_mnsje_rspsta,',
'                                                             o_id_fljo_trea		=> v_error_msg,',
'                                                             o_error			=> v_error_msg);',
'             if v_type_rspsta = ''S'' then',
'                raise_application_error( -20001 , v_mnsje_rspsta); ',
'             end if;         ',
'    end;    ',
'    ',
'     apex_util.set_session_state(''F_ID_FLJO_TREA'','''');*/',
'     ',
'    if v_cdgo_rspsta != 0 then',
unistr('        raise_application_error(-20001, ''Error al Registrar el T\00EDtulo'');'),
'    end if;    ',
'',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_process_success_message=>'&P391_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16921440037106741)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16901710485106655)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(33473993877891585)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Registrar TJ'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19000587623616209)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Buscar_Demandado'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_nmbre_dmnddo   gf_g_titulos_judicial.nmbre_dmnddo%type;',
'begin',
'     select a.nmbre_rzon_scial',
'      into v_nmbre_dmnddo',
'      from v_si_i_sujetos_responsable a',
'     where a.cdgo_idntfccion_tpo = :P391_CDGO_IDNTFCCION_TPO_DMNDDO',
'       and a.idntfccion_rspnsble = :P391_IDNTFCCION_DMNDDO',
'       and rownum = 1;',
'   ',
'        apex_json.open_object; ',
'        apex_json.write(''NMBRE_DMNDDO'', v_nmbre_dmnddo);',
'        apex_json.close_all;',
'       ',
'exception ',
'    when others then',
'        apex_json.open_object;',
'        apex_json.write(''NMBRE_DMNDDO'', '' '');',
'        apex_json.close_all;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(29532430574458701)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'registrarTitulos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_cdgo_rspsta   number;',
'    v_mnsje_rspsta  varchar2(4000);',
'    v_accion        varchar2(100);',
'    v_id_ttlo_jdcial number;',
'    v_exception     exception;',
'begin',
'',
'    v_cdgo_rspsta:= 0;',
'    v_mnsje_rspsta:= ''OK'';   ',
'    ',
'  ',
'    pkg_gf_titulos_judicial.prc_rg_titulos_judiciales(p_cdgo_clnte     => :F_CDGO_CLNTE,',
'                                                      p_json_ttlos     => :P391_JSON_TTLOS,',
'                                                      o_id_ttlo_jdcial => v_id_ttlo_jdcial,',
'                                                      o_cdgo_rspsta    => v_cdgo_rspsta,',
'                                                      o_mnsje_rspsta   => v_mnsje_rspsta);',
'                                                    ',
'',
'    if v_cdgo_rspsta = 0 then',
'        commit;',
'    else',
'        raise v_exception;     ',
'    end if;',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'',
'exception',
'   when v_exception then',
'        rollback;',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.close_object;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
