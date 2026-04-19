prompt --application/pages/page_00110
begin
wwv_flow_api.create_page(
 p_id=>110
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Sanciones'
,p_page_mode=>'MODAL'
,p_step_title=>'Sanciones'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=132'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'800'
,p_dialog_width=>'900'
,p_protection_level=>'C'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20201222102021'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(38028701555254004)
,p_plug_name=>'Sanciones'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'GI_D_SANCIONES'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(37083865475919006)
,p_plug_name=>unistr('Informaci\00F3n General de la sanci\00F3n ')
,p_parent_plug_id=>wwv_flow_api.id(38028701555254004)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(37083935126919007)
,p_plug_name=>'Porcentajes'
,p_parent_plug_id=>wwv_flow_api.id(38028701555254004)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(37084028559919008)
,p_plug_name=>unistr('Valor M\00EDnimo')
,p_parent_plug_id=>wwv_flow_api.id(38028701555254004)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(37085123788919019)
,p_plug_name=>'Vigencia-Periodo'
,p_parent_plug_id=>wwv_flow_api.id(38028701555254004)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(38037937411254046)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(38028701555254004)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P110_ID_SNCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(38036769813254040)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(38028701555254004)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:111:&SESSION.::&DEBUG.:RP,111::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(38038398463254046)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(38028701555254004)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P110_ID_SNCION'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(38037507302254046)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(38028701555254004)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P110_ID_SNCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(38038636232254046)
,p_branch_name=>unistr('Ir a P\00E1gina 111')
,p_branch_action=>'f?p=&APP_ID.:111:&SESSION.::&DEBUG.:111::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(37084491481919012)
,p_name=>'P110_ID_IMPSTO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(37083865475919006)
,p_item_source_plug_id=>wwv_flow_api.id(38028701555254004)
,p_prompt=>'Tributo'
,p_source=>'ID_IMPSTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(37084586319919013)
,p_name=>'P110_ID_IMPSTO_SBMPSTO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(37083865475919006)
,p_item_source_plug_id=>wwv_flow_api.id(38028701555254004)
,p_prompt=>'Sub-Tributo'
,p_source=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select initcap(NMBRE_IMPSTO_SBMPSTO)  as d, ID_IMPSTO_SBMPSTO as r',
'  from DF_I_IMPUESTOS_SUBIMPUESTO',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'  and  id_impsto = :P110_ID_IMPSTO',
' order by 1'))
,p_lov_cascade_parent_items=>'P110_ID_IMPSTO'
,p_ajax_items_to_submit=>'P110_ID_IMPSTO,P110_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(37085377451919021)
,p_name=>'P110_PRCNTJE_TRFA_INGRSO_BRTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(37083935126919007)
,p_item_source_plug_id=>wwv_flow_api.id(38028701555254004)
,p_prompt=>'% de la Tarifa x Ingresos Brutos'
,p_format_mask=>'990D999'
,p_source=>'PRCNTJE_TRFA_INGRSO_BRTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_cMaxlength=>5
,p_tag_attributes=>'onkeypress="return  validarExpresion(event, ''numeroEntero'')"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:4});"'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_help_text=>unistr('Se refiere al porcentaje sobre los ingresos brutos con que se hace el calculo de la sanci\00F3n.')
,p_attribute_01=>'0'
,p_attribute_02=>'1'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(37085590394919023)
,p_name=>'P110_AUMNT_PRCNTJ_X_DCLRCN_INC_EXTM'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(37083935126919007)
,p_item_source_plug_id=>wwv_flow_api.id(38028701555254004)
,p_prompt=>unistr('% Aumento x Declaraci\00F3n Inicial Extempor\00E1nea')
,p_format_mask=>'990D999'
,p_source=>'AUMNT_PRCNTJ_X_DCLRCN_INC_EXTM'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_cMaxlength=>5
,p_tag_attributes=>'onkeypress="return  validarExpresion(event, ''numeroEntero'')"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:4});"'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_help_text=>unistr('Se refiere al aumento en el porcentaje que se aplica para generar la sanci\00F3n si la declaraci\00F3n es por correcci\00F3n y la declaraci\00F3n inicial fue presentada con extemporaneidad')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38029193184254007)
,p_name=>'P110_ID_SNCION'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(38028701555254004)
,p_item_source_plug_id=>wwv_flow_api.id(38028701555254004)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Sncion'
,p_source=>'ID_SNCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38029524923254018)
,p_name=>'P110_CDGO_CLNTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(38028701555254004)
,p_item_source_plug_id=>wwv_flow_api.id(38028701555254004)
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38029803817254026)
,p_name=>'P110_VGNCIA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(37085123788919019)
,p_item_source_plug_id=>wwv_flow_api.id(38028701555254004)
,p_prompt=>'Vigencia'
,p_source=>'VGNCIA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38030235707254026)
,p_name=>'P110_ID_PRDO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(37085123788919019)
,p_item_source_plug_id=>wwv_flow_api.id(38028701555254004)
,p_prompt=>'Periodo'
,p_source=>'ID_PRDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select  dscrpcion d, id_prdo r ',
'  from df_i_periodos',
'  where vgncia = :P110_VGNCIA',
'  and cdgo_clnte = :F_CDGO_CLNTE',
'  and id_impsto = :P110_ID_IMPSTO',
'  and id_impsto_sbmpsto = :P110_ID_IMPSTO_SBMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P110_VGNCIA'
,p_ajax_items_to_submit=>'P110_VGNCIA,P110_ID_PRDO,P110_ID_IMPSTO,P110_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38030683822254026)
,p_name=>'P110_CDGO_SNCION_TPO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(37083865475919006)
,p_item_source_plug_id=>wwv_flow_api.id(38028701555254004)
,p_prompt=>unistr('Tipo de Sanci\00F3n')
,p_source=>'CDGO_SNCION_TPO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d,',
'        cdgo_sncion_tpo r ',
'  from gi_d_sanciones_tipo',
' order by cdgo_sncion_tpo'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38031047167254027)
,p_name=>'P110_PRCNTJE_TRFA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(37083935126919007)
,p_item_source_plug_id=>wwv_flow_api.id(38028701555254004)
,p_prompt=>'% de la Tarifa '
,p_format_mask=>'990D999'
,p_source=>'PRCNTJE_TRFA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_cMaxlength=>5
,p_tag_attributes=>'onkeypress="return  validarExpresion(event, ''numeroEntero'')"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:4});"'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_help_text=>unistr('Se refiere al porcentaje sobre la base con que se hace el calculo de la sanci\00F3n.')
,p_attribute_01=>'0'
,p_attribute_02=>'1'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38031404918254027)
,p_name=>'P110_PRCNTJE_MXMO_INGR_BRT'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(37083935126919007)
,p_item_source_plug_id=>wwv_flow_api.id(38028701555254004)
,p_prompt=>unistr('% M\00E1ximo por  Ingresos  Brutos.')
,p_format_mask=>'990D999'
,p_source=>'PRCNTJE_MXMO_INGR_BRT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_cMaxlength=>5
,p_tag_attributes=>'onkeypress="return  validarExpresion(event, ''numeroEntero'')"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:4});"'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_help_text=>unistr('Porcentaje que se le aplica a los ingresos brutos para calcular el tope m\00E1ximo de la sanci\00F3n.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38031835747254030)
,p_name=>'P110_PRCNTJE_MXMO_IMPST_CRG'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(37083935126919007)
,p_item_source_plug_id=>wwv_flow_api.id(38028701555254004)
,p_prompt=>unistr('% M\00E1ximo por Impuesto a Cargo')
,p_source=>'PRCNTJE_MXMO_IMPST_CRG'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_cMaxlength=>5
,p_tag_attributes=>'onkeypress="return  validarExpresion(event, ''numeroEntero'')"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:4});"'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_help_text=>unistr('Porcentaje que se le aplica al Impuesto a cargo para calcular el tope m\00E1ximo de la sanci\00F3n.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38032250623254031)
,p_name=>'P110_UNDAD_VLOR_SNCION_MNMO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(37084028559919008)
,p_item_source_plug_id=>wwv_flow_api.id(38028701555254004)
,p_prompt=>unistr('Unidad Valor M\00EDnimo Sanci\00F3n')
,p_source=>'UNDAD_VLOR_SNCION_MNMO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Fijo;Fijo,Indicador;Indicador'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Si el valor m\00EDnimo de la sanci\00F3n se calcula a partir de un valor fijo  o en unidades UVT u otro indicador econ\00F3mico.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38032615562254031)
,p_name=>'P110_ID_INDCDOR_ECNMCO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(37084028559919008)
,p_item_source_plug_id=>wwv_flow_api.id(38028701555254004)
,p_prompt=>unistr('Indicador Econ\00F3mico')
,p_source=>'ID_INDCDOR_ECNMCO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_indcdor_tpo d,',
'        id_indcdor_ecnmco r ',
'  from df_s_indicadores_economico',
' order by 1;'))
,p_lov_cascade_parent_items=>'P110_UNDAD_VLOR_SNCION_MNMO'
,p_ajax_items_to_submit=>'P110_UNDAD_VLOR_SNCION_MNMO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Indicador econ\00F3mico con el cual se va a calcular el valor m\00EDnimo de la sanci\00F3n.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38033073316254034)
,p_name=>'P110_VLOR_SNCION_MNMO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(37084028559919008)
,p_item_source_plug_id=>wwv_flow_api.id(38028701555254004)
,p_prompt=>unistr('Valor M\00EDnimo de la Sanci\00F3n')
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'VLOR_SNCION_MNMO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:0});"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_help_text=>unistr('Valor m\00EDnimo de la sanci\00F3n puede ser un valor fijo o en unidades de UVT u otro indicador econ\00F3mico.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39061536965456401)
,p_name=>'P110_PRCNTJE_TRFA_EMPL'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(37083935126919007)
,p_item_source_plug_id=>wwv_flow_api.id(38028701555254004)
,p_prompt=>'% de la Tarifa Emplazamiento'
,p_format_mask=>'990D999'
,p_source=>'PRCNTJE_TRFA_EMPL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_cMaxlength=>5
,p_tag_attributes=>'onkeypress="return  validarExpresion(event, ''numeroEntero'')"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:4});"'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_help_text=>unistr('Se refiere al porcentaje sobre la base con que se hace el calculo de la sanci\00F3n cuando exista un emplazamiento.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39061638407456402)
,p_name=>'P110_PRCNTJE_TRFA_INGRSO_BRTO_EMPL'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(37083935126919007)
,p_item_source_plug_id=>wwv_flow_api.id(38028701555254004)
,p_prompt=>'% de la Tarifa x Ingresos Brutos Emplazamiento'
,p_format_mask=>'990D999'
,p_source=>'PRCNTJE_TRFA_INGRSO_BRTO_EMPL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_cMaxlength=>5
,p_tag_attributes=>'onkeypress="return  validarExpresion(event, ''numeroEntero'')"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:4});"'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_help_text=>unistr('Se refiere al porcentaje sobre los ingresos brutos con que se hace el calculo de la sanci\00F3n cuando existe un emplazamiento.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39061791761456403)
,p_name=>'P110_PRCNTJE_MXMO_INGR_BRT_EMPL'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(37083935126919007)
,p_item_source_plug_id=>wwv_flow_api.id(38028701555254004)
,p_prompt=>unistr('% M\00E1ximo por  Ingresos Brutos  Emplazamiento')
,p_format_mask=>'990D999'
,p_source=>'PRCNTJE_MXMO_INGR_BRT_EMPL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_cMaxlength=>5
,p_tag_attributes=>'onkeypress="return  validarExpresion(event, ''numeroEntero'')"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:4});"'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_help_text=>unistr('Se refiere al porcentaje que se le aplica a los ingresos brutos para calcular el tope m\00E1ximo de la sanci\00F3n cuando existe un emplazamiento.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39061894285456404)
,p_name=>'P110_PRCNTJE_MXMO_IMPST_CRG_EMPL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(37083935126919007)
,p_item_source_plug_id=>wwv_flow_api.id(38028701555254004)
,p_prompt=>unistr('% M\00E1ximo por Impuesto a Cargo  Emplazamiento')
,p_source=>'PRCNTJE_MXMO_IMPST_CRG_EMPL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_cMaxlength=>5
,p_tag_attributes=>'onkeypress="return  validarExpresion(event, ''numeroEntero'')"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:4});"'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_help_text=>unistr('Se refiere al porcentaje que se le aplica al Impuesto a cargo para calcular el tope maximo de la sanci\00F3n cuando existe un emplazamiento.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(37084632946919014)
,p_validation_name=>'Nuevo'
,p_validation_sequence=>10
,p_validation=>'(:P110_PRCNTJE_TRFA >=0) and(:P110_PRCNTJE_TRFA <=1)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'EL porcentaje de la tarifa debe ser menor o igual al 100%.'
,p_associated_item=>wwv_flow_api.id(38031047167254027)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(37084165277919009)
,p_name=>'Mostrar Indicador Economico'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P110_UNDAD_VLOR_SNCION_MNMO'
,p_condition_element=>'P110_UNDAD_VLOR_SNCION_MNMO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Indicador'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(37084244292919010)
,p_event_id=>wwv_flow_api.id(37084165277919009)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P110_ID_INDCDOR_ECNMCO_F'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(37084344396919011)
,p_event_id=>wwv_flow_api.id(37084165277919009)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P110_ID_INDCDOR_ECNMCO_F'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(38039593382254052)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(38028701555254004)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Procesar pantalla Crear Pantalla'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Sanci\00F3n creada satisfactoriamente.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(38039137226254050)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(38028701555254004)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Inicializar pantalla Crear Pantalla'
);
end;
/
