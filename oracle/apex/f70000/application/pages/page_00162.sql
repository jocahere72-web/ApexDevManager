prompt --application/pages/page_00162
begin
wwv_flow_api.create_page(
 p_id=>162
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Contratos Adicionales'
,p_page_mode=>'MODAL'
,p_step_title=>'Contratos Adicionales'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IG-controlsContainer {',
'display: none;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'90%'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20200928161523'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(291615442179153471)
,p_plug_name=>'Tab Selector'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(92437002138950414)
,p_plug_name=>'Conceptos'
,p_region_name=>'Conceptos'
,p_parent_plug_id=>wwv_flow_api.id(291615442179153471)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select ''['' || d.cdgo_cncpto || ''] '' || d.dscrpcion_cncpto dscrpcion_cncpto',
'        , a.vlor_lqddo',
'        , a.vlor_intres',
'        , a.vlor_lqddo + a.vlor_intres vlor_ttal',
'        , a.fcha_vncmnto',
'        , a.txto_trfa',
'        , a.id_impsto_acto_cncpto',
'     from gi_g_rentas_acto_concepto         a',
'     join gi_g_rentas_acto                  b on a.id_rnta_acto     = b.id_rnta_acto',
'     join gi_g_rentas                       c on b.id_rnta          = c.id_rnta',
'     join v_df_i_impuestos_acto_concepto    d on a.id_impsto_acto_cncpto    = d.id_impsto_acto_cncpto',
'    where c.id_rnta                         = :P162_ID_RNTA ; '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(92437477863950418)
,p_name=>'DSCRPCION_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>106
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(92437515095950419)
,p_name=>'VLOR_LQDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_LQDDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor <br> Liquidado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G990'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(92437690549950420)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor <br> Interes'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G990'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(92437728396950421)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor <br> Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G990'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(92437804705950422)
,p_name=>'FCHA_VNCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_VNCMNTO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(92437992188950423)
,p_name=>'TXTO_TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TXTO_TRFA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tarifa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>20
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(92438077023950424)
,p_name=>'ID_IMPSTO_ACTO_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_ACTO_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(92437399727950417)
,p_internal_uid=>92437399727950417
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(92772721805523503)
,p_interactive_grid_id=>wwv_flow_api.id(92437399727950417)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(92772889383523504)
,p_report_id=>wwv_flow_api.id(92772721805523503)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92773342322523508)
,p_view_id=>wwv_flow_api.id(92772889383523504)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(92437477863950418)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>356
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92773897374523512)
,p_view_id=>wwv_flow_api.id(92772889383523504)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(92437515095950419)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>122
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92774317786523514)
,p_view_id=>wwv_flow_api.id(92772889383523504)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(92437690549950420)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>152
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92774819566523516)
,p_view_id=>wwv_flow_api.id(92772889383523504)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(92437728396950421)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>139
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92775390909523520)
,p_view_id=>wwv_flow_api.id(92772889383523504)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(92437804705950422)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92775802315523521)
,p_view_id=>wwv_flow_api.id(92772889383523504)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(92437992188950423)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>104
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92776326819523523)
,p_view_id=>wwv_flow_api.id(92772889383523504)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(92438077023950424)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(120948001324)
,p_view_id=>wwv_flow_api.id(92772889383523504)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(92437515095950419)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(209208003751)
,p_view_id=>wwv_flow_api.id(92772889383523504)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(92437690549950420)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(275339004337)
,p_view_id=>wwv_flow_api.id(92772889383523504)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(92437728396950421)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(92440372455950447)
,p_plug_name=>'Adjuntos'
,p_parent_plug_id=>wwv_flow_api.id(291615442179153471)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select id_rnta_adjnto',
'        , id_sbmpto_adjnto_tpo',
'        , file_name',
'        , obsrvcion',
'        , 1 descargar',
'        , 2 ver',
'     from gi_g_rentas_adjnto     a',
'    where id_rnta                = :P162_ID_RNTA'))
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
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(92440403340950448)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'JPRADA'
,p_internal_uid=>92440403340950448
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92440507347950449)
,p_db_column_name=>'ID_RNTA_ADJNTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Rnta Adjnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92440698021950450)
,p_db_column_name=>'ID_SBMPTO_ADJNTO_TPO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tipo de Adjunto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(84660955306007784)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92802225823750001)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92802350529750002)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Observci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92802474976750003)
,p_db_column_name=>'DESCARGAR'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'DOWNLOAD:GI_G_RENTAS_ADJNTO:FILE_BLOB:ID_RNTA_ADJNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class=" fa fa-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92802565516750004)
,p_db_column_name=>'VER'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Ver'
,p_column_link=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_CLAVE_PRIMARIA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_VALOR:GI_G_RENTAS_ADJNTO,ID_RNTA_ADJNTO,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,#ID_RNTA_ADJNTO#'
,p_column_linktext=>'<center><span class=" fa fa-eye fa-1x fa-spin"></span></center>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(92809472367750292)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'928095'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_RNTA_ADJNTO:ID_SBMPTO_ADJNTO_TPO:FILE_NAME:OBSRVCION:DESCARGAR:VER'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(92802647835750005)
,p_plug_name=>unistr('Recaudo Liquidaci\00F3n de Rentas')
,p_parent_plug_id=>wwv_flow_api.id(291615442179153471)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P162_INDCDOR_RNTA_PGADA'
,p_plug_display_when_cond2=>'S'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(92802790741750006)
,p_plug_name=>'<b>Conceptos de Recaudo</b>'
,p_parent_plug_id=>wwv_flow_api.id(92802647835750005)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select case',
'        when cdgo_cncpto_tpo = ''D'' then',
'        ''DESCUENTO DE '' || a.dscrpcion_rlcnal || '' ['' || (a.prcntje_dscnto * 100)|| ''%]''',
'        else',
'        dscrpcion',
'        end as dscrpcion',
'        , sum(a.vlor_dbe) vlor_dbe',
'        , sum(a.vlor_hber) vlor_hber',
'    from v_re_g_documentos_detalle a',
'    where id_dcmnto = :P162_ID_DCMNTO',
'    group by a.cdgo_cncpto_tpo',
'        , a.dscrpcion_rlcnal',
'        , a.dscrpcion',
'        , a.prcntje_dscnto',
'    order by a.cdgo_cncpto_tpo '))
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
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(92802865444750007)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'JPRADA'
,p_internal_uid=>92802865444750007
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92802917557750008)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92803098855750009)
,p_db_column_name=>'VLOR_DBE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Valor debe'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92803175768750010)
,p_db_column_name=>'VLOR_HBER'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Valor Haber'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(92814638870865518)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'928147'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION:VLOR_DBE:VLOR_HBER:APXWS_CC_001'
,p_sum_columns_on_break=>'VLOR_DBE:VLOR_HBER:APXWS_CC_001'
);
wwv_flow_api.create_worksheet_computation(
 p_id=>wwv_flow_api.id(92923569772498493)
,p_report_id=>wwv_flow_api.id(92814638870865518)
,p_db_column_name=>'APXWS_CC_001'
,p_column_identifier=>'C01'
,p_computation_expr=>'B- C'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_column_type=>'NUMBER'
,p_column_label=>'Total'
,p_report_label=>'Total'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(400193369696206042)
,p_plug_name=>unistr('\00C1rbol de Men\00FA')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select case when connect_by_isleaf = 1 then 0 when level = 1 then 1 else -1 end as status',
'        , level',
'        , ascda',
'        , case when connect_by_isleaf = 1 then  ''fa-folder-o''  else ''fa-folders'' end icon',
'        , apex_util.prepare_url(''f?p='' || :app_id || '':'' || :app_page_id || '':'' || :app_session || ''::NO::P162_ID_RNTA:'' || id_rnta ) as link',
'  from (',
'         select  null id_rnta_pdre ',
'                , a.id_rnta id_rnta',
'                , b.dscrpcion || '': '' || a.txto_ascda ascda',
'              from gi_g_rentas                                  a',
'                   left join gi_d_subimpuestos_asociada		    b on a.id_sbmpsto_ascda		= b.id_sbmpsto_ascda',
'             where a.id_rnta        = :P162_ID_RNTA_ANTRIOR  ',
'                and a.cdgo_rnta_estdo       in (''APB'', ''LQD'')',
'        union',
'         select a.id_rnta_antrior id_rnta_pdre',
'              , a.id_rnta id_rnta',
'              , b.dscrpcion || '': '' || a.txto_ascda ascda',
'         from gi_g_rentas                               a',
'              left join gi_d_subimpuestos_asociada		b on a.id_sbmpsto_ascda		= b.id_sbmpsto_ascda',
'         where a.id_rnta_antrior         = :P162_ID_RNTA_ANTRIOR  ',
'                 and a.cdgo_rnta_estdo       in (''APB'', ''LQD'') ',
'      ) ',
' start with id_rnta_pdre is null',
'connect by prior id_rnta = id_rnta_pdre;'))
,p_plug_source_type=>'NATIVE_JSTREE'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'S'
,p_attribute_04=>'DB'
,p_attribute_08=>'fa'
,p_attribute_10=>'ASCDA'
,p_attribute_11=>'LEVEL'
,p_attribute_15=>'STATUS'
,p_attribute_20=>'ASCDA'
,p_attribute_22=>'ASCDA'
,p_attribute_23=>'LEVEL'
,p_attribute_24=>'LINK'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(401675521709001038)
,p_plug_name=>unistr('Informaci\00F3n del Contrato')
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--hiddenOverflow:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92436888539950412)
,p_name=>'P162_NMRO_RNTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(401675521709001038)
,p_prompt=>unistr('N\00FAmero de Liquidaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92714013495323620)
,p_name=>'P162_ID_RNTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(401675521709001038)
,p_source=>'P162_ID_RNTA'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92726800304323739)
,p_name=>'P162_NODO_SELECCIONADO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(400193369696206042)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92803205514750011)
,p_name=>'P162_FCHA_RCDO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(92802647835750005)
,p_prompt=>'Fecha de Recaudo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92803364459750012)
,p_name=>'P162_FCHA_APLCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(92802647835750005)
,p_prompt=>unistr('Fecha de Aplicaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92803427803750013)
,p_name=>'P162_ID_USRIO_APLCO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(92802647835750005)
,p_prompt=>'Usuario Aplico Recaudo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_USUARIOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trcro || ''['' || user_name || '']''  as d,',
'       id_usrio as r',
'  from v_sg_g_usuarios',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92803584506750014)
,p_name=>'P162_DSCRPCION_RCDO_ORGEN_CNTROL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(92802647835750005)
,p_prompt=>'Origen Recaudo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92803634470750015)
,p_name=>'P162_DSCRPCION_FRMA_PGO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(92802647835750005)
,p_prompt=>'Forma de pago'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92803778311750016)
,p_name=>'P162_VLOR'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(92802647835750005)
,p_prompt=>'Valor Pagado'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92803906778750018)
,p_name=>'P162_TXTO_ASCDA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(401675521709001038)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92804081240750019)
,p_name=>'P162_FCHA_EXPDCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(401675521709001038)
,p_prompt=>unistr('Fecha de Suscripci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92804104201750020)
,p_name=>'P162_VLOR_BSE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(401675521709001038)
,p_prompt=>'Base'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92804231072750021)
,p_name=>'P162_BSE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(401675521709001038)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92804338155750022)
,p_name=>'P162_CDGO_RNTA_ESTDO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(401675521709001038)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92804433229750023)
,p_name=>'P162_DSCRPCION_RNTA_ESTDO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(401675521709001038)
,p_prompt=>'Estado '
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92804518879750024)
,p_name=>'P162_ID_DCMNTO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(401675521709001038)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92804614819750025)
,p_name=>'P162_NMRO_DCMNTO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(401675521709001038)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92804726319750026)
,p_name=>'P162_INDCDOR_RNTA_PGADA'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(401675521709001038)
,p_prompt=>'Pagada'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(5646119019866897)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92804861697750027)
,p_name=>'P162_ID_LQDCION'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(401675521709001038)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92807041457750049)
,p_name=>'P162_ID_RNTA_ANTRIOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(400193369696206042)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(92731871886323838)
,p_name=>'Al cambiar  TIP_DESTINO a 1'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P162_DSTNO_TPO'
,p_condition_element=>'P162_DSTNO_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'1'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92732392287323838)
,p_event_id=>wwv_flow_api.id(92731871886323838)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P162_NMRO_PGNA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92732845635323838)
,p_event_id=>wwv_flow_api.id(92731871886323838)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P162_URL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92733360753323839)
,p_event_id=>wwv_flow_api.id(92731871886323838)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P162_URL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92733841786323839)
,p_event_id=>wwv_flow_api.id(92731871886323838)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P162_NMRO_PGNA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(92729690492323799)
,p_name=>'Mostrar Paginas de breadcrum'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P162_INDCDOR_MSTRAR_BREADCRUM'
,p_condition_element=>'P162_INDCDOR_MSTRAR_BREADCRUM'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'1'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92730120339323814)
,p_event_id=>wwv_flow_api.id(92729690492323799)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P162_PGNAS_BREADCRUM'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92730610400323830)
,p_event_id=>wwv_flow_api.id(92729690492323799)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P162_PGNAS_BREADCRUM'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(92728807095323798)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Fetch Row from GI_G_RENTAS'
,p_attribute_02=>'GI_G_RENTAS'
,p_attribute_03=>'P162_ID_RNTA'
,p_attribute_04=>'ID_RNTA'
,p_attribute_09=>'P162_ID_RNTA'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(92729218090323798)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Automatic Row Processing (DML)'
,p_attribute_02=>'GI_G_RENTAS'
,p_attribute_03=>'P162_ID_RNTA'
,p_attribute_04=>'ID_RNTA'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n procesada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(92728450246323798)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Reset Page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(92803845231750017)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Informaci\00F3n de Renta')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'   select  a.nmro_rnta',
'        , dscrpcion_ascda  || '': '' || a.txto_ascda',
'        , a.fcha_expdcion',
'        , (select txto_bse_grvble',
'             from df_i_impuestos_acto m ',
'             join gi_g_rentas_acto    n on m.id_impsto_acto = n.id_impsto_acto',
'            where n.id_rnta           = a.id_rnta',
'            and rownum = 1) txto_bse_grvble',
'        , to_char(a.vlor_bse_grvble, :F_FRMTO_MNDA) vlor_bse_grvble',
'         , a.cdgo_rnta_estdo',
'        , a.dscrpcion_rnta_estdo',
'        , a.id_dcmnto',
'        , a.nmro_dcmnto',
'        , a.indcdor_rnta_pgda',
'     into :P162_NMRO_RNTA',
'        , :P162_TXTO_ASCDA',
'        , :P162_FCHA_EXPDCION',
'        , :P162_BSE',
'        , :P162_VLOR_BSE',
'        , :P162_CDGO_RNTA_ESTDO',
'        , :P162_DSCRPCION_RNTA_ESTDO',
'        , :P162_ID_DCMNTO',
'        , :P162_NMRO_DCMNTO',
'        , :P162_INDCDOR_RNTA_PGADA',
'     from v_gi_g_rentas     a',
'     join v_si_i_sujetos_impuesto    b on a.id_sjto_impsto  = b.id_sjto_impsto',
'     join si_i_personas              c on b.id_sjto_impsto  = c.id_sjto_impsto',
'     join gi_g_rentas_acto           d on a.id_rnta         = d.id_rnta',
'    where a.id_rnta                  = :P162_ID_RNTA;',
'',
'exception',
'    when others then',
'		:P162_NMRO_RNTA				:= null;',
'		:P162_TXTO_ASCDA            := null;',
'		:P162_FCHA_EXPDCION         := null;',
'		:P162_BSE                   := null;',
'		:P162_VLOR_BSE              := null;',
'		:P162_CDGO_RNTA_ESTDO       := null;',
'		:P162_DSCRPCION_RNTA_ESTDO  := null;',
'		:P162_ID_DCMNTO             := null;',
'		:P162_NMRO_DCMNTO           := null;',
'		:P162_INDCDOR_RNTA_PGADA    := null;',
'        ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(92438937326950433)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Informaci\00F3n de Recaudo de rentas')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select to_char(fcha_rcdo, ''DD/MM/YYYY'')                 fcha_rcdo',
'        , to_char(fcha_apliccion, ''DD/MM/YYYY HH:MI AM'')   fcha_aplccion',
'        , to_char(vlor , :F_FRMTO_MNDA) vlor',
'        , dscrpcion_frma_pgo',
'        , id_usrio_aplco',
'        , dscrpcion_rcdo_orgen_cntrol',
'     into :P162_FCHA_RCDO',
'        , :P162_FCHA_APLCCION',
'        , :P162_VLOR',
'        , :P162_DSCRPCION_FRMA_PGO',
'        , :P162_ID_USRIO_APLCO',
'        , :P162_DSCRPCION_RCDO_ORGEN_CNTROL',
'     from v_re_g_recaudos ',
'    where nmro_dcmnto         =  :P162_NMRO_DCMNTO   ',
'        and cdgo_rcdo_estdo   = ''AP'';'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'        from v_re_g_recaudos ',
'    where nmro_dcmnto         =  :P162_NMRO_DCMNTO ',
'        and cdgo_rcdo_estdo   = ''AP''; '))
,p_process_when_type=>'EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(92804994362750028)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Automatic Row Fetch'
,p_attribute_02=>'GI_G_RENTAS'
,p_attribute_03=>'P162_ID_RNTA'
,p_attribute_04=>'ID_RNTA'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
end;
/
