prompt --application/pages/page_00062
begin
wwv_flow_api.create_page(
 p_id=>62
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Detalle Lote Determinaci\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Detalle Lote Determinaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'90%'
,p_last_updated_by=>'1111111112'
,p_last_upd_yyyymmddhh24miss=>'20240717163154'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(47765770528414932)
,p_plug_name=>'Incosistencias'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from gi_g_determinaciones_error',
' where id_dtrmncion_lte = :P62_ID_DTRMNCION_LTE'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(47764853816414923)
,p_plug_name=>'Detalle de Inconsistencias'
,p_parent_plug_id=>wwv_flow_api.id(47765770528414932)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select idntfccion_sjto_frmtda,',
'        vgncia,',
'        prdo,',
'        dscrpcion_dtrmncion_error_tip,',
'        mnsje_error',
'  from v_gi_g_determinaciones_error',
' where id_dtrmncion_lte = :P62_ID_DTRMNCION_LTE',
' and   cdgo_dtrmncion_error_tip = :P62_ERROR_TPO'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P62_ID_DTRMNCION_LTE'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
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
 p_id=>wwv_flow_api.id(47764977574414924)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>47764977574414924
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48802301366045401)
,p_db_column_name=>'IDNTFCCION_SJTO_FRMTDA'
,p_display_order=>10
,p_column_identifier=>'G'
,p_column_label=>unistr('Identificaci\00F3n <br> Sujeto')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(47765226199414927)
,p_db_column_name=>'VGNCIA'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(47765318046414928)
,p_db_column_name=>'PRDO'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>'Periodo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(47765548446414930)
,p_db_column_name=>'MNSJE_ERROR'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'Mensaje'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48802407742045402)
,p_db_column_name=>'DSCRPCION_DTRMNCION_ERROR_TIP'
,p_display_order=>60
,p_column_identifier=>'H'
,p_column_label=>'Inconsistencia al ..'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(48682094488324825)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'486821'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'IDNTFCCION_SJTO_FRMTDA:VGNCIA:PRDO:MNSJE_ERROR:DSCRPCION_DTRMNCION_ERROR_TIP:'
,p_sort_column_1=>'IDNTFCCION_SJTO_FRMTDA'
,p_sort_direction_1=>'ASC NULLS LAST'
,p_sort_column_2=>'VGNCIA'
,p_sort_direction_2=>'ASC NULLS LAST'
,p_sort_column_3=>'PRDO'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(47765890884414933)
,p_name=>'Inconsistencias Critica'
,p_parent_plug_id=>wwv_flow_api.id(47765770528414932)
,p_template=>wwv_flow_api.id(164080387335707690)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--featured:t-Cards--spanHorizontally:t-Cards--animColorFill'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select ''Al '' || dscrpcion_dtrmncion_error_tip card_text,',
'        count(id_dtrmncion_error) card_title ,',
unistr('        ''Inconsistencias generadas al procesar el lote de determinaci\00F3n'' card_subtext ,'),
'         APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID ||'':62:'' || :APP_SESSION || ''::::P62_ERROR_TPO:''||cdgo_dtrmncion_error_tip||'' '' ) card_link',
'  from v_gi_g_determinaciones_error',
' where id_dtrmncion_lte = :P62_ID_DTRMNCION_LTE',
'group by dscrpcion_dtrmncion_error_tip, cdgo_dtrmncion_error_tip',
'order by cdgo_dtrmncion_error_tip desc'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P62_ID_DTRMNCION_LTE'
,p_query_row_template=>wwv_flow_api.id(164088115137707710)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(47766383206414938)
,p_query_column_id=>1
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>2
,p_column_heading=>'Card Text'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(47766221355414937)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Card Title'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(48802511129045403)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card Subtext'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(161127021501342309)
,p_query_column_id=>4
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>4
,p_column_heading=>'Card Link'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52515427033153539)
,p_plug_name=>unistr('Cr\00EDticas Iniciales')
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select dscrpcion_dtrmncion_sjto_estdo, ',
'        count(id_dtrmncion_sjto) ttl_sjtos',
'   from v_gi_g_determinacion_sujeto',
'   where id_dtrmncion_lte = :P62_ID_DTRMNCION_LTE',
'   group by dscrpcion_dtrmncion_sjto_estdo',
'   order by dscrpcion_dtrmncion_sjto_estdo;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
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
,p_plug_header=>unistr('Esta regi\00F3n detalla los registros que no se lograron determinar.')
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(52515511861153540)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>52515511861153540
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(52515665835153541)
,p_db_column_name=>'DSCRPCION_DTRMNCION_SJTO_ESTDO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(52515708721153542)
,p_db_column_name=>'TTL_SJTOS'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Total Sujetos'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(82380930461138831)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'823810'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_DTRMNCION_SJTO_ESTDO:TTL_SJTOS'
,p_sum_columns_on_break=>'TTL_SJTOS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(373121733741254776)
,p_plug_name=>unistr('Lote de Determinaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:margin-top-sm:margin-bottom-sm:margin-left-sm:margin-right-sm'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2376236284094023)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(373121733741254776)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2376053973094021)
,p_name=>'P62_NMRO_RGSTRO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(373121733741254776)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00B0 Registros')
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'NMRO_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica el n\00FAmero de sujetos del tributo que se obtuvieron del m\00E9todo de selecci\00F3n. ')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2376142147094022)
,p_name=>'P62_NMRO_SJTO_IMPSTO_VLDOS'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(373121733741254776)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00B0 Determinaciones Generadas')
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'NMRO_SJTO_IMPSTO_VLDOS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica el n\00FAmero de sujetos del tributo que fueron determinados.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2376534656094026)
,p_name=>'P62_ID_USRIO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(373121733741254776)
,p_use_cache_before_default=>'NO'
,p_prompt=>'<i><b>Lote No. &P62_ID_DTRMNCION_LTE.</b></i> creado por:'
,p_source=>'ID_USRIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_trcro, ',
'        id_usrio ',
'   from v_sg_g_usuarios ',
'  where cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Nombre del Usuario que gener\00F3 el Lote de Determinaci\00F3n')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2376635119094027)
,p_name=>'P62_FCHA_INCIO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(373121733741254776)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Inicio'
,p_format_mask=>'DD-MON-YYYY HH:MI:SS PM'
,p_source=>'FCHA_INCIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Fecha de Generaci\00F3n del Lote de Determinaci\00F3n')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2641526002824689)
,p_name=>'P62_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(373121733741254776)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tributo'
,p_source=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
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
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Tributo al que pertenece el lote de determinaci\00F3n')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2641971290824689)
,p_name=>'P62_ID_IMSPTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(373121733741254776)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Sub-Tributo'
,p_source=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_impsto_sbmpsto d, ',
'        id_impsto_sbmpsto r',
'   from df_i_impuestoS_subimpuesto ',
'  where cdgo_clnte = :F_CDGO_CLNTE ',
'    and id_impsto = :P62_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P62_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Sub-Tributo al que pertenece el lote de determinaci\00F3n')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2642303853824689)
,p_name=>'P62_VGNCIA_DSDE'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(373121733741254776)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Vigencia Desde'
,p_source=>'VGNCIA_DSDE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_help_text=>'Vigencia Desde: Esta vigencia es tenida en cuenta para seleccionar los sujetos del tributo que tengan deuda a partir de la vigencia seleccionada. '
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2642780463824690)
,p_name=>'P62_PRDO_DSDE'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(373121733741254776)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Periodo Desde'
,p_source=>'ID_PRDO_DSDE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_PERIODO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d,',
'         id_prdo r ',
'  from df_i_periodos',
' order by 1'))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_help_text=>'Periodo Desde: Este Periodo es tenido en cuenta para seleccionar los sujetos del tributo que tengan deuda a partir del Periodo seleccionado. '
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2643101495824690)
,p_name=>'P62_VGNCIA_HSTA'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(373121733741254776)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Vigencia Hasta'
,p_source=>'VGNCIA_HSTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_help_text=>'Vigencia Hasta: Esta vigencia es tenida en cuenta para seleccionar los sujetos del tributo que tengan deuda hasta la vigencia seleccionada. '
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2643595181824690)
,p_name=>'P62_PRDO_HSTA'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(373121733741254776)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Periodo Hasta'
,p_source=>'ID_PRDO_HSTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_PERIODO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d,',
'         id_prdo r ',
'  from df_i_periodos',
' order by 1'))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_help_text=>'Periodo Hasta: Este Periodo es tenido en cuenta para seleccionar los sujetos del tributo que tengan deuda hasta el periodo seleccionado. '
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2643913612824690)
,p_name=>'P62_DDA_DSDE'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(373121733741254776)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Deuda Desde'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'RNGO_DDA_DSDE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Valor de la Deuda incial. Este valor es tenido en cuenta para seleccionar los sujetos del tributo que tengan igual o mayor valor de deuda entre las vigencia-Periodo Inicial y Vigencia-Periodo Final seleccionadas. '
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2644377823824690)
,p_name=>'P62_DDA_HSTA'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(373121733741254776)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Deuda Hasta'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'RNGO_DDA_HSTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Valor de la Deuda Final. Este valor es tenido en cuenta para seleccionar los sujetos del tributo que tengan igual o menor valor de deuda entre las vigencia-Periodo Inicial y Vigencia-Periodo Final seleccionadas. '
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2644703354824691)
,p_name=>'P62_CDGO_DTRMNCION_TPO_SLCCION'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(373121733741254776)
,p_use_cache_before_default=>'NO'
,p_item_default=>'ACV'
,p_prompt=>unistr('Selecci\00F3n Pablaci\00F3n por:')
,p_source=>'CDGO_DTRMNCION_TPO_SLCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Archivo;ACV,SQL;SQL'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Indica el m\00E9todo que fue usado para seleccionar la poblaci\00F3n a determinar. ')
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2646395205824691)
,p_name=>'P62_ID_DTRMNCION_LTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(373121733741254776)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_DTRMNCION_LTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52515328706153538)
,p_name=>'P62_FCHA_FIN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(373121733741254776)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Fin'
,p_format_mask=>'DD-MON-YYYY HH:MI:SS PM'
,p_source=>'FCHA_FIN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Fecha de Generaci\00F3n del Lote de Determinaci\00F3n')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(161127173041342310)
,p_name=>'P62_ERROR_TPO'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(373121733741254776)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(161129013526342329)
,p_name=>'P62_NMRO_NO_VLDOS'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(373121733741254776)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00B0 Registros sin Determinaciones')
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'RGSTROS_NO_VLDOS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica el n\00FAmero de sujetos del tributo que NO fueron determinados.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2376390548094024)
,p_name=>unistr('Al hacer clic en el bot\00F3n regresarClose Dialog')
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(2376236284094023)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2376467515094025)
,p_event_id=>wwv_flow_api.id(2376390548094024)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2375411161094015)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from GI_G_DETERMINACIONES_LOTE'
,p_attribute_02=>'V_GI_G_DETERMINACIONES_LOTE'
,p_attribute_03=>'P62_ID_DTRMNCION_LTE'
,p_attribute_04=>'ID_DTRMNCION_LTE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
