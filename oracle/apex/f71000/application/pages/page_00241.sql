prompt --application/pages/page_00241
begin
wwv_flow_api.create_page(
 p_id=>241
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Registro de Fracciones'
,p_page_mode=>'MODAL'
,p_step_title=>'Registro de Fracciones'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(177318053164050589)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'50%'
,p_last_updated_by=>'ACONDE'
,p_last_upd_yyyymmddhh24miss=>'20240527103807'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35763207054174874)
,p_plug_name=>'Fracciones Registradas'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_ttlo_jdcial_frccn',
'      ,a.id_ttlo_jdcial',
'      ,a.id_impsto',
'      ,decode(a.id_impsto, a.id_impsto, b.nmbre_impsto, ''-'') as nmbre_impsto',
'      ,a.id_impsto_sbmpsto',
'      ,decode(a.id_impsto_sbmpsto, a.id_impsto_sbmpsto, c.nmbre_impsto_sbmpsto, ''-'') as nmbre_impsto_sbmpsto',
'      ,a.orden',
'      ,a.vlor',
'      --, to_char(nvl(a.vlor,0) , ''999G999G999G999G990'') vlor',
'      ,a.obsrvcn',
'from gf_g_titulos_jdcl_frccnmnto a',
'left join df_c_impuestos b on b.id_impsto = a.id_impsto',
'left join df_i_impuestos_subimpuesto c on c.id_impsto_sbmpsto = a.id_impsto_sbmpsto',
'where a.id_ttlo_jdcial = :P243_ID_TTLO_JDCIAL',
'order by orden'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gf_g_titulos_jdcl_frccnmnto a ',
'where a.id_ttlo_jdcial = :P243_ID_TTLO_JDCIAL'))
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>210
,p_prn_height=>297
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(35766499553184351)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_detail_link=>'f?p=&APP_ID.:241:&SESSION.::&DEBUG.:RP:P241_ID_TTLO_JDCIAL_FRCCN:#ID_TTLO_JDCIAL_FRCCN#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'BVILLEGAS'
,p_internal_uid=>35766499553184351
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18894123084363026)
,p_db_column_name=>'ID_TTLO_JDCIAL'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Ttlo Jdcial'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18828025351825219)
,p_db_column_name=>'ID_TTLO_JDCIAL_FRCCN'
,p_display_order=>180
,p_column_identifier=>'Y'
,p_column_label=>'Id Ttlo Jdcial Frccn'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18828106124825220)
,p_db_column_name=>'ID_IMPSTO'
,p_display_order=>190
,p_column_identifier=>'Z'
,p_column_label=>'Id Impsto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18828288010825221)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>200
,p_column_identifier=>'AA'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18828361489825222)
,p_db_column_name=>'ID_IMPSTO_SBMPSTO'
,p_display_order=>210
,p_column_identifier=>'AB'
,p_column_label=>'Id Impsto Sbmpsto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18828675992825225)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>220
,p_column_identifier=>'AE'
,p_column_label=>'Subtributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18828487666825223)
,p_db_column_name=>'ORDEN'
,p_display_order=>230
,p_column_identifier=>'AC'
,p_column_label=>'Orden'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18828549984825224)
,p_db_column_name=>'OBSRVCN'
,p_display_order=>240
,p_column_identifier=>'AD'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21701062260917901)
,p_db_column_name=>'VLOR'
,p_display_order=>250
,p_column_identifier=>'AG'
,p_column_label=>'Valor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(35845242974503351)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'189027'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'ORDEN:NMBRE_IMPSTO:NMBRE_IMPSTO_SBMPSTO:OBSRVCN:VLOR'
,p_sort_column_1=>'FCHA_CNSTTCION'
,p_sort_direction_1=>'DESC'
,p_sum_columns_on_break=>'VLOR'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52306435363743727)
,p_plug_name=>unistr('<b>T\00EDtulo No. &P241_NMRO_TTLO_JDCIAL.  </b>')
,p_region_template_options=>'#DEFAULT#:t-Region--accent1:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'GF_G_TITULOS_JDCL_FRCCNMNTO'
,p_include_rowid_column=>false
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18833053437852299)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(52306435363743727)
,p_button_name=>'UPDATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P241_ID_TTLO_JDCIAL_FRCCN'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18834286068852300)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(52306435363743727)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18833828401852300)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(52306435363743727)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P241_ID_TTLO_JDCIAL_FRCCN'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18833461532852300)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(52306435363743727)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_condition=>'P241_ID_TTLO_JDCIAL_FRCCN'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18946966372705001)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(52306435363743727)
,p_button_name=>'BTN_NUEVO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nueva'
,p_button_position=>'REGION_TEMPLATE_HELP'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-file-new'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(21694192672822201)
,p_branch_name=>'Ir a mi'
,p_branch_action=>'f?p=&APP_ID.:241:&SESSION.::&DEBUG.:RP:P241_ID_TTLO_JDCIAL:&P241_ID_TTLO_JDCIAL.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18826595946825204)
,p_name=>'P241_ID_TTLO_JDCIAL_FRCCN'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(52306435363743727)
,p_item_source_plug_id=>wwv_flow_api.id(52306435363743727)
,p_source=>'ID_TTLO_JDCIAL_FRCCN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18826691080825205)
,p_name=>'P241_ID_IMPSTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(52306435363743727)
,p_item_source_plug_id=>wwv_flow_api.id(52306435363743727)
,p_prompt=>'<b>Tributo</b>'
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
,p_colspan=>6
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18826780553825206)
,p_name=>'P241_ID_IMPSTO_SBMPSTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(52306435363743727)
,p_item_source_plug_id=>wwv_flow_api.id(52306435363743727)
,p_prompt=>'<b>Sub Tributo</b>'
,p_source=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_impsto_sbmpsto d,',
'        id_impsto_sbmpsto  r',
'   from df_i_impuestos_subimpuesto',
'   where id_impsto = :P241_ID_IMPSTO',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P241_ID_IMPSTO'
,p_ajax_items_to_submit=>'P241_ID_IMPSTO,P241_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18826845089825207)
,p_name=>'P241_ORDEN'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(52306435363743727)
,p_item_source_plug_id=>wwv_flow_api.id(52306435363743727)
,p_prompt=>'<b>Orden</b>'
,p_source=>'ORDEN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event,''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18826922279825208)
,p_name=>'P241_OBSRVCN'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(52306435363743727)
,p_item_source_plug_id=>wwv_flow_api.id(52306435363743727)
,p_prompt=>unistr('<b>Observaci\00F3n</b>')
,p_source=>'OBSRVCN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>145
,p_cMaxlength=>1000
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18827235645825211)
,p_name=>'P241_NMRO_TTLO_JDCIAL'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(52306435363743727)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18837817272852328)
,p_name=>'P241_VLOR'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(52306435363743727)
,p_item_source_plug_id=>wwv_flow_api.id(52306435363743727)
,p_prompt=>'<b>Valor</b>'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
,p_source=>'VLOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>15
,p_tag_attributes=>'onkeypress="return validarExpresion(event,''numeroEntero'');"'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'1'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21093090998780402)
,p_name=>'P241_VLOR_TTLO_JDCIAL'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(52306435363743727)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21093649184780408)
,p_name=>'P241_VLOR_TTLO_FRCC_CLCLDO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(52306435363743727)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21101579377063606)
,p_name=>'P241_ID_TTLO_JDCIAL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(52306435363743727)
,p_item_source_plug_id=>wwv_flow_api.id(52306435363743727)
,p_item_default=>'P243_ID_TTLO_JDCIAL'
,p_item_default_type=>'ITEM'
,p_source=>'ID_TTLO_JDCIAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21209448421564102)
,p_name=>'P241_TTAL_FRCNES'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(52306435363743727)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21801761484565610)
,p_name=>'P241_VLOR_TTLO_PNDNTE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(52306435363743727)
,p_format_mask=>'999G999G999G999G999G999G990'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22056362039148602)
,p_name=>'P241_VLOR_TTLO_PNDNTE_TXT'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(52306435363743727)
,p_item_default=>'P241_VLOR_TTLO_PNDNTE'
,p_item_default_type=>'ITEM'
,p_prompt=>'<b>Saldo Pendiente Por Fraccionar</b>'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>7
,p_grid_column=>4
,p_grid_label_column_span=>3
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(21093165549780403)
,p_computation_sequence=>20
,p_computation_item=>'P241_VLOR_TTLO_JDCIAL'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(sum(a.vlor),0) valor',
'from gf_g_titulos_judicial a',
'where a.id_ttlo_jdcial = :P243_ID_TTLO_JDCIAL',
';'))
,p_compute_when=>'P243_ID_TTLO_JDCIAL'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(21093755109780409)
,p_computation_sequence=>30
,p_computation_item=>'P241_VLOR_TTLO_FRCC_CLCLDO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(sum(a.vlor),0) valor',
'from gf_g_titulos_jdcl_frccnmnto a',
'where a.id_ttlo_jdcial = :P243_ID_TTLO_JDCIAL',
';',
''))
,p_compute_when_type=>'NEVER'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(18827674137825215)
,p_computation_sequence=>20
,p_computation_item=>'P241_NMRO_TTLO_JDCIAL'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_ttlo_jdcial',
'from gf_g_titulos_judicial a',
'where a.id_ttlo_jdcial = :P243_ID_TTLO_JDCIAL;'))
,p_compute_when=>'P243_ID_TTLO_JDCIAL'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(21101469647063605)
,p_computation_sequence=>30
,p_computation_item=>'P241_VLOR'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select 0 from dual'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(21163792743242601)
,p_computation_sequence=>40
,p_computation_item=>'P241_ORDEN'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select 0 from dual'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(21093297270780404)
,p_validation_name=>'Total de fraccionamiento no debe ser  mayor al valor del titulo'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if  to_number(:P241_VLOR_TTLO_FRCC_CLCLDO) +  to_number(:P241_VLOR) > to_number(:P241_VLOR_TTLO_JDCIAL) then',
'        return false;',
'    else',
'        return true;',
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'El total del fraccionamiento no puede ser mayor al valor del Titulo Judicial.'
,p_validation_condition=>'CREATE,UPDATE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(21156621091198401)
,p_validation_name=>'Validar que el orden no se repita'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gf_g_titulos_jdcl_frccnmnto a ',
'where a.id_ttlo_jdcial = :P243_ID_TTLO_JDCIAL',
'    and a.orden = :P241_ORDEN;'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'El orden del fraccionamiento ya existe, por favor revise.'
,p_validation_condition=>'CREATE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(21209579324564103)
,p_validation_name=>'Total de fracciones debe ser mayor a 1'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if (to_number(:P241_VLOR_TTLO_FRCC_CLCLDO) +  to_number(:P241_VLOR) = to_number(:P241_VLOR_TTLO_JDCIAL)) and :P241_TTAL_FRCNES + 1  < 2 then',
'        return false;',
'    else',
'        return true;',
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('Debe fraccionar el titulo en m\00E1s de una(1) fracci\00F3n.  Favor verifique')
,p_validation_condition=>'CREATE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(18856055051852381)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(18834286068852300)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(18856581621852392)
,p_event_id=>wwv_flow_api.id(18856055051852381)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(18903915790371765)
,p_name=>'Al cerrar la modal'
,p_event_sequence=>50
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(18904395519371765)
,p_event_id=>wwv_flow_api.id(18903915790371765)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(35763207054174874)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(18938795162821889)
,p_name=>unistr('Al cambiar el Valor del impuesto Refrescar la regi\00F3n de deuda')
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P241_ID_IMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(18939132077821889)
,p_event_id=>wwv_flow_api.id(18938795162821889)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(52306435363743727)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(18940009962824931)
,p_name=>'Al cambiar el valor del Subimpuesto'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P241_ID_IMPSTO_SBMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(18940980423824932)
,p_event_id=>wwv_flow_api.id(18940009962824931)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P241_ID_IMPSTO_SBMPSTO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(18940485468824932)
,p_event_id=>wwv_flow_api.id(18940009962824931)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21101224277063603)
,p_name=>'Al cambiar item P241_VLOR'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P241_VLOR'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21101358866063604)
,p_event_id=>wwv_flow_api.id(21101224277063603)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P241_VLOR'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21156736319198402)
,p_name=>'Al cambiar P241_ORDEN'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P241_ORDEN'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21156883076198403)
,p_event_id=>wwv_flow_api.id(21156736319198402)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P241_ORDEN'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18854491205852380)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Secuencia DML'
,p_process_sql_clob=>':P241_ID_TTLO_JDCIAL_FRCCN:= sq_gf_g_titulos_jdcl_frccnmnto.nextval;'
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(18833828401852300)
,p_process_when=>'P241_ID_TTLO_JDCIAL_FRCCN'
,p_process_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18845016952852349)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(52306435363743727)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Proceso DML  GF_G_TITULOS_JDCL_FRCCNMNTO'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('\00A1Fracci\00F3n Registrada!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21694371660822203)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar Modal'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE,CANCEL'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21209336636564101)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar valor y cantidad de fracciones'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(sum(a.vlor),0) valor, count(1)',
'into :P241_VLOR_TTLO_FRCC_CLCLDO, :P241_TTAL_FRCNES',
'from gf_g_titulos_jdcl_frccnmnto a',
'where a.id_ttlo_jdcial = :P243_ID_TTLO_JDCIAL',
';',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21801688062565609)
,p_process_sequence=>20
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar saldo pendiente del t\00EDtulo')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select :P241_VLOR_TTLO_JDCIAL - :P241_VLOR_TTLO_FRCC_CLCLDO',
'into  :P241_VLOR_TTLO_PNDNTE ',
'from dual;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(22056467392148603)
,p_process_sequence=>30
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Formato Saldo Pendiente de Titulo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT to_char(:P241_VLOR_TTLO_PNDNTE , ''FM$999G999G999G999G999G999G990'') ',
'INTO :P241_VLOR_TTLO_PNDNTE_TXT',
'FROM DUAL;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18844693658852341)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(52306435363743727)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Registrar TJ'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
