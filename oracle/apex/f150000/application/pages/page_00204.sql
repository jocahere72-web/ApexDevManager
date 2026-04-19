prompt --application/pages/page_00204
begin
wwv_flow_api.create_page(
 p_id=>204
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Resumen - Liquidaci\00F3n de Rentas')
,p_step_title=>unistr('Resumen - Liquidaci\00F3n de Rentas')
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'HMARTINEZ'
,p_last_upd_yyyymmddhh24miss=>'20201229081111'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20135170826519193)
,p_plug_name=>'Resumen'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_api.id(252183924525651399)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(4794665765814946)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(252197199379651439)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10589055332173193)
,p_plug_name=>'Tab Selector'
,p_parent_plug_id=>wwv_flow_api.id(20135170826519193)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10588492327173187)
,p_plug_name=>'Adjuntos'
,p_parent_plug_id=>wwv_flow_api.id(10589055332173193)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select seq_id',
'        , c002       file_name',
'        , c001       obsrvcion',
'     from apex_collections    c',
'    where collection_name     = ''ADJUNTOS_RENTA'''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P200_INDCDOR_RQRE_AUTRZCION'
,p_plug_display_when_cond2=>'S'
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
 p_id=>wwv_flow_api.id(10588589996173188)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>10588589996173188
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5457938702602873)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5458312090602873)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Adjunto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5458798924602873)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(10615237007703242)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'54591'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SEQ_ID:FILE_NAME:OBSRVCION'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10589227237173194)
,p_plug_name=>'Conceptos'
,p_parent_plug_id=>wwv_flow_api.id(10589055332173193)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select distinct a.cdgo_cncpto || '' - '' || a.dscrpcion_cncpto  dscrpcion_cncpto',
'        , a.vlor_lqddo',
'        , a.vlor_intres_mra',
'        , a.vlor_ttal vlor_ttal',
'        , a.fcha_vncmnto',
'        , a.dias_mra',
'        , a.txto_trfa',
'     from table (pkg_gi_rentas.fnc_cl_concepto_preliquidacion(p_cdgo_clnte 				=> :F_CDGO_CLNTE',
'                                                            , p_id_impsto               => :P200_ID_IMPSTO',
'                                                            , p_id_impsto_sbmpsto       => :P200_ID_IMPSTO_SBMPSTO  ',
'                                                            , p_id_impsto_acto		 	=> :P200_ID_IMPSTO_ACTO',
'                                                            , p_id_sjto_impsto          => :P200_ID_SJTO_IMPSTO',
'                                                            , p_json_cncptos			=> null',
'                                                            , p_vlor_bse				=> to_number(:P202_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'                                                            , p_indcdor_usa_extrnjro	=> nvl(:P200_INDCDOR_EXTRNJRO, ''N'')',
'                                                            , p_indcdor_usa_mxto		=> nvl(:P200_INDCDOR_MXTO, ''N'')',
'                                                            , p_fcha_expdcion			=> to_date(:P202_FCHA_EXPDCION)',
'                                                            , p_fcha_vncmnto            => to_date(:P202_FCHA_VNCMNTO )',
'                                                            , p_indcdor_lqdccion_adcnal => ''N''',
'                                                            , p_id_rnta_antrior		    => null',
'                                                            , p_indcdor_cntrto_gslna    => ''N''))',
'                                                           a',
' where a.cdgo_clnte        = :F_CDGO_CLNTE',
'   and a.vlor_lqddo        > 0',
'   and a.id_impsto_acto    = :P200_ID_IMPSTO_ACTO'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10589618136173198)
,p_name=>'DSCRPCION_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>108
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
 p_id=>wwv_flow_api.id(10589750039173200)
,p_name=>'VLOR_LQDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_LQDDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor <br>Liquidado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FML999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(10589942742173201)
,p_name=>'VLOR_INTRES_MRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES_MRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Interes de<br> Mora'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FML999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(10589986110173202)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor <br>Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FML999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(10590096209173203)
,p_name=>'FCHA_VNCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_VNCMNTO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha de<br> Vencimiento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_display_condition_type=>'SQL_EXPRESSION'
,p_display_condition=>':DIAS_MORA > 0'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10590205349173204)
,p_name=>'DIAS_MRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DIAS_MRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('D\00EDas de Mora')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
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
,p_display_condition_type=>'SQL_EXPRESSION'
,p_display_condition=>':DIAS_MORA > 0'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10590317972173205)
,p_name=>'TXTO_TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TXTO_TRFA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tarifa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>200
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(10589445107173196)
,p_internal_uid=>10589445107173196
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
 p_id=>wwv_flow_api.id(10629570786788563)
,p_interactive_grid_id=>wwv_flow_api.id(10589445107173196)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(10629719138788563)
,p_report_id=>wwv_flow_api.id(10629570786788563)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10630660266788577)
,p_view_id=>wwv_flow_api.id(10629719138788563)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(10589618136173198)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>432.36699999999996
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10631716075788581)
,p_view_id=>wwv_flow_api.id(10629719138788563)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(10589750039173200)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10632165842788583)
,p_view_id=>wwv_flow_api.id(10629719138788563)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(10589942742173201)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10632732463788584)
,p_view_id=>wwv_flow_api.id(10629719138788563)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(10589986110173202)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10633204191788586)
,p_view_id=>wwv_flow_api.id(10629719138788563)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(10590096209173203)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10633737715788587)
,p_view_id=>wwv_flow_api.id(10629719138788563)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(10590205349173204)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10634232426788589)
,p_view_id=>wwv_flow_api.id(10629719138788563)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(10590317972173205)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(84482362933549263)
,p_plug_name=>unistr('Informaci\00F3n B\00E1sica')
,p_region_name=>'informacion_basica'
,p_parent_plug_id=>wwv_flow_api.id(20135170826519193)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:t-Form--large'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5455748217602868)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(20135170826519193)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de cancelar? Al cancelar se perder todos los cambios que no se han guardado'',''CANCEL'');'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-calendar-times-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5456108925602871)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(20135170826519193)
,p_button_name=>'BTN_LIQUIDAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Liquidar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P200_INDCDOR_RQRE_AUTRZCION'
,p_button_condition2=>'N'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-cog'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5456959594602872)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(20135170826519193)
,p_button_name=>'BTN_REGISTRAR_LIQUIDACION'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Registrar Liquidaci\00F3n')
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿Esta seguro de registrar su solicitud liquidaciÃ³n?'',''BTN_REGISTRAR_LIQUIDACION'');'
,p_button_condition=>'P200_INDCDOR_RQRE_AUTRZCION'
,p_button_condition2=>'S'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5456573615602871)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(20135170826519193)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(252201877336651464)
,p_button_image_alt=>'Anterior'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5473238433602890)
,p_branch_name=>'Ir a Inicio'
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,200,201,202,204::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5456959594602872)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(77077936438293044)
,p_branch_name=>unistr('Ir a la P\00E1gina de inicio')
,p_branch_action=>'P200_BRANCH'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_PAGE_IDENT_BY_ITEM'
,p_branch_when_button_id=>wwv_flow_api.id(5455748217602868)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5472813461602890)
,p_branch_name=>unistr('Ir a Proyecci\00F3n')
,p_branch_action=>'f?p=&APP_ID.:202:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5456573615602871)
,p_branch_sequence=>20
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P200_INDCDOR_RQRE_AUTRZCION'
,p_branch_condition_text=>'N'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5473679720602890)
,p_branch_name=>'Ir a Adjuntos'
,p_branch_action=>'f?p=&APP_ID.:203:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5456573615602871)
,p_branch_sequence=>30
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P200_INDCDOR_RQRE_ADJNTO'
,p_branch_condition_text=>'S'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5463534023602880)
,p_name=>'P204_IDNTFCCION_SJTO_FRMTDA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(84482362933549263)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5463930851602881)
,p_name=>'P204_UBCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(84482362933549263)
,p_prompt=>unistr('Ubicaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5464312304602882)
,p_name=>'P204_DRCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(84482362933549263)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5464734514602882)
,p_name=>'P204_CDGO_SJTO_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(84482362933549263)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5465107059602882)
,p_name=>'P204_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(84482362933549263)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select ''['' || id_impsto_sbmpsto || '']'' || nmbre_impsto_sbmpsto          d ',
'        , id_impsto_sbmpsto             r       ',
'     from df_i_impuestos_subimpuesto    a',
'    where cdgo_clnte                    = :F_CDGO_CLNTE',
'      and id_impsto                     = :P200_ID_IMPSTO',
'      and id_impsto_sbmpsto             = :P200_ID_IMPSTO_SBMPSTO',
'      and indcdor_lqdcion_pblco         = ''S''',
'      and actvo                         = ''S''',
' order by nmbre_impsto_sbmpsto'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5465597782602882)
,p_name=>'P204_ID_IMPSTO_ACTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(84482362933549263)
,p_prompt=>'Acto'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select ''['' || id_impsto_acto || '']'' || nmbre_impsto_acto      d',
'        , id_impsto_acto         r',
'     from df_i_impuestos_acto    a',
'    where id_impsto_sbmpsto      = :P200_ID_IMPSTO_SBMPSTO',
'      and id_impsto_acto         = :P200_ID_IMPSTO_ACTO',
'      and actvo                  = ''S''',
' order by nmbre_impsto_acto',
'   '))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P204_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5465907944602883)
,p_name=>'P204_FCHA_EXPDCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(84482362933549263)
,p_prompt=>'&P200_LBEL_ITEM_FCHA.'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5466348627602883)
,p_name=>'P204_BSE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(84482362933549263)
,p_prompt=>'Base Gravable'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5466755570602883)
,p_name=>'P204_INDCDOR_EXTRNJRO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(84482362933549263)
,p_prompt=>unistr('\00BFExtranjero?')
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>1
,p_display_when=>'P200_INDCDOR_USA_EXTRNJRO'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5467108687602883)
,p_name=>'P204_INDCDOR_MXTO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(84482362933549263)
,p_prompt=>unistr('\00BFMixto?')
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>1
,p_display_when=>'P200_INDCDOR_USA_MXTO'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5467516214602883)
,p_name=>'P204_ID_RPRTE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(84482362933549263)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5467994018602884)
,p_name=>'P204_RSPSTA'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(84482362933549263)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5468334376602884)
,p_name=>'P204_ID_RNTA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(84482362933549263)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5468738084602884)
,p_name=>'P204_CNCPTOS'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(84482362933549263)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5469103757602884)
,p_name=>'P204_ID_LQDCION'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(84482362933549263)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5469525549602885)
,p_name=>'P204_ID_DCMNTO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(84482362933549263)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5469907165602885)
,p_name=>'P204_NMRO_DCMNTO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(84482362933549263)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75049680489310048)
,p_name=>'P204_NMBRE_RZON_SCIAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(84482362933549263)
,p_prompt=>unistr('Nombre / Raz\00F3n Social')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78952389968533303)
,p_name=>'P204_FCHA_VNCMNTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(84482362933549263)
,p_prompt=>'Fecha Pago'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(5470409788602886)
,p_computation_sequence=>10
,p_computation_item=>'P204_CNCPTOS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select json_arrayagg(json_object( key ''ID_IMPSTO_ACTO_CNCPTO'' is a.id_impsto_acto_cncpto',
'                                   , key ''ID_IMPSTO_ACTO''        is a.id_impsto_acto',
'                                   , key ''GNRA_INTRES_MRA''       is a.gnra_intres_mra',
'                                   , key ''FCHA_VNCMNTO''          is to_char(a.fcha_vncmnto, ''dd/mm/yyyy'')',
'                                   , key ''DIAS_MRA''              is nvl(a.dias_mra,''0'')',
'                                   , key ''BSE_CNCPTO''            is a.bse_grvble',
'                                   , key ''VLOR_INDCDOR''          is nvl(a.vlor_cdgo_indcdor_tpo,''0'')',
'                                   , key ''VLOR_TRFA''             is nvl(a.vlor_trfa,''0'')',
'                                   , key ''VLOR''                  is nvl(a.vlor_trfa_clcldo,''0'')',
'                                   , key ''TXTO_TRFA''             is a.txto_trfa',
'                                   , key ''VLOR_LQDDO''            is a.vlor_lqddo',
'                                   , key ''VLOR_PGDO''            is a.vlor_pgdo',
'                                   , key ''VLOR_INTRES_MRA''       is a.vlor_intres_mra',
'                                   , key ''VLOR_TTAL''             is a.vlor_ttal',
'                                 )',
'                      )cncptos',
' from table (pkg_gi_rentas.fnc_cl_concepto_preliquidacion(p_cdgo_clnte 				=> :F_CDGO_CLNTE',
'                                                        , p_id_impsto               => :P200_ID_IMPSTO',
'                                                        , p_id_impsto_sbmpsto       => :P200_ID_IMPSTO_SBMPSTO  ',
'                                                        , p_id_impsto_acto		 	=> :P200_ID_IMPSTO_ACTO',
'                                                        , p_id_sjto_impsto          => :P200_ID_SJTO_IMPSTO',
'                                                        , p_json_cncptos			=> null',
'                                                        , p_vlor_bse				=> to_number(:P202_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'                                                        , p_indcdor_usa_extrnjro	=> nvl(:P200_INDCDOR_EXTRNJRO, ''N'')',
'                                                        , p_indcdor_usa_mxto		=> nvl(:P200_INDCDOR_MXTO, ''N'')',
'                                                        , p_fcha_expdcion			=> to_date(:P202_FCHA_EXPDCION)',
'                                                        , p_fcha_vncmnto            => to_date(:P202_FCHA_VNCMNTO )',
'                                                        , p_indcdor_lqdccion_adcnal => ''N''',
'                                                        , p_id_rnta_antrior		    => null',
'                                                        , p_indcdor_cntrto_gslna    => ''N'')) a',
'     where vlor_lqddo > 0',
'       and :P200_ID_IMPSTO_ACTO_CNCPTO is not null',
'       and a.id_impsto_acto    = :P200_ID_IMPSTO_ACTO'))
);
end;
/
begin
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5470886660602886)
,p_validation_name=>'Validar que la proyeccion no sea nula'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.cdgo_impsto_acto ',
'        , a.cdgo_cncpto || '' - '' || a.dscrpcion_cncpto  dscrpcion_cncpto',
'        , a.vlor_trfa',
'        , a.vlor_lqddo',
'        , a.vlor_intres_mra',
'        , a.vlor_ttal vlor_ttal',
'        , a.fcha_vncmnto',
'        , a.dias_mra',
'        , a.txto_trfa',
'     from table (pkg_gi_rentas.fnc_cl_concepto_preliquidacion(p_cdgo_clnte 				=> :F_CDGO_CLNTE',
'                                                            , p_id_impsto               => :P200_ID_IMPSTO',
'                                                            , p_id_impsto_sbmpsto       => :P200_ID_IMPSTO_SBMPSTO  ',
'                                                            , p_id_impsto_acto		 	=> :P200_ID_IMPSTO_ACTO',
'                                                            , p_id_sjto_impsto          => :P200_ID_SJTO_IMPSTO',
'                                                            , p_json_cncptos			=> null',
'                                                            , p_vlor_bse				=> to_number(:P202_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'                                                            , p_indcdor_usa_extrnjro	=> nvl(:P200_INDCDOR_EXTRNJRO, ''N'')',
'                                                            , p_indcdor_usa_mxto		=> nvl(:P200_INDCDOR_MXTO, ''N'')',
'                                                            , p_fcha_expdcion			=> to_date(:P202_FCHA_EXPDCION)',
'                                                            , p_fcha_vncmnto            => to_date(:P202_FCHA_VNCMNTO )',
'                                                            , p_indcdor_lqdccion_adcnal => ''N''',
'                                                            , p_id_rnta_antrior		    => null',
'                                                            , p_indcdor_cntrto_gslna    => ''N''))',
'                                                           a',
' where a.cdgo_clnte        = :F_CDGO_CLNTE',
'   and a.vlor_lqddo        > 0',
'   and a.id_impsto_acto    = :P200_ID_IMPSTO_ACTO'))
,p_validation_type=>'EXISTS'
,p_error_message=>unistr('Proyecci\00F3n no valida')
,p_always_execute=>'Y'
,p_validation_condition=>'BTN_LIQUIDAR,BTN_REGISTRAR_LIQUIDACION'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5263819784897638)
,p_name=>'Liquidacion de Rentas'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(5456108925602871)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5263974421897639)
,p_event_id=>wwv_flow_api.id(5263819784897638)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function Liquidacion_Rentas() { ',
'    var v_app_id = $v(''pFlowId''),',
'        v_page_id = $v(''pFlowStepId''),',
'        v_session = $v(''pInstance'');',
' ',
'    var rs = await apex.server.process(''Liquidacion de Rentas'');',
'    //var url = `f?p=${v_app_id}:${v_page_id}:${v_session}:PRINT_REPORT=re_c_recibo_pago_rentas:NO:RP:::`;',
'    var url = `f?p=${v_app_id}:${v_page_id}:${v_session}:APPLICATION_PROCESS=Descargar_Documento:NO:RP:::`;       ',
'    ',
'    if (rs.type == ''OK'') {',
'        let $waitPopup = apex.widget.waitPopup();',
'        let a = document.createElement("a");',
'        document.body.appendChild(a);',
'        let v_blob = await fecth_async(url);',
'',
'        let v_url = window.URL.createObjectURL(v_blob);',
'        a.download = rs.nmbre_rprte + ".pdf";',
'        a.href = v_url;',
'        a.click();',
'        document.body.removeChild(a);',
'        window.URL.revokeObjectURL(v_url);',
'        window.location.href = `f?p=${v_app_id}:${1}:${v_session}::NO:RP,200,201,202,203,204:::`;    ',
'        $waitPopup.remove();',
'    }',
'    else {',
'        // First clear the errors',
'        apex.message.clearErrors();',
'',
'        // Now show new errors',
'        apex.message.showErrors([',
'            {',
'                type:       "error",',
'                location:   [ "page"],',
'                message:    rs.msg,',
'                unsafe:     false',
'            }',
'        ]);',
'    }',
'    ',
'    ',
'}',
' ',
unistr('apex.message.confirm( "\00BFEsta Seguro que desea realizar la liquidaci\00F3n?", function( okPressed ) {'),
'    if( okPressed ) {',
'        Liquidacion_Rentas();',
'    }',
'});',
'',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5471558764602887)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar Rentas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	v_cdgo_rspsta		number;',
'	v_mnsje_rspsta		varchar2(2000)	:= ''Inicio'';',
'',
'begin',
'	-- Se registra el sujeto impuesto si no existe para rentas',
'    if (:P200_ID_SJTO_IMPSTO is null or :P200_ID_SJTO_IMPSTO = 0) and  :P200_ID_SJTO is not null then ',
'        begin ',
'            pkg_si_novedades_persona.prc_rg_sjto_impsto_sjto_exstnt (p_cdgo_clnte        => :F_CDGO_CLNTE,',
'                                                                     p_id_sjto           => :P200_ID_SJTO,',
'                                                                     p_id_impsto         => :P200_ID_IMPSTO,',
'                                                                     p_id_usrio          => :F_ID_USRIO,',
'                                                                     o_id_sjto_impsto    => :P200_ID_IMPSTO_SBMPSTO,',
'                                                                     o_cdgo_rspsta		 => v_cdgo_rspsta,',
'                                                                     o_mnsje_rspsta		 => v_mnsje_rspsta);',
'        exception',
'            when others then ',
'                rollback;',
'		        raise_application_error(-20001, v_mnsje_rspsta);',
'        end;',
'    end if;',
'    ',
'	',
'    if :P200_ID_IMPSTO_SBMPSTO is not null and :P200_ID_IMPSTO_SBMPSTO > 0 then',
'        pkg_gi_rentas.prc_rg_proyeccion_renta(p_cdgo_clnte				=> :F_CDGO_CLNTE',
'                                            , p_id_usrio				=> :F_ID_USRIO ',
'                                            , p_actos_cncpto			=> :P204_CNCPTOS',
'                                            , p_id_impsto				=> :P200_ID_IMPSTO',
'                                            , p_id_impsto_sbmpsto		=> :P200_ID_IMPSTO_SBMPSTO',
'                                            , p_id_sjto_impsto			=> :P200_ID_SJTO_IMPSTO',
'                                            , p_id_sbmpsto_ascda		=> :P201_ID_SBMPSTO_ASCDA',
'                                            , p_txto_ascda				=> :P201_TXTO_ASCDA',
'                                            , p_fcha_expdcion			=> nvl(:P202_FCHA_EXPDCION, sysdate)',
'                                            , p_vlor_bse_grvble			=> to_number(:P202_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'                                            , p_indcdor_usa_mxto		=> nvl(:P200_INDCDOR_EXTRNJRO, ''N'')',
'                                            , p_indcdor_usa_extrnjro	=> nvl(:P200_INDCDOR_MXTO, ''N'')',
'                                            , p_id_rnta					=> :P204_ID_RNTA',
'                                            , p_fcha_vncmnto_dcmnto		=> :P202_FCHA_VNCMNTO',
'                                            ,  p_entrno					=> ''PBLCO''',
'                                            , o_id_rnta					=> :P204_ID_RNTA',
'                                            , o_cdgo_rspsta				=> v_cdgo_rspsta',
'                                            , o_mnsje_rspsta			=> v_mnsje_rspsta',
'                                            );',
'',
'        if(v_cdgo_rspsta = 0) then',
unistr('            :P204_RSPSTA := ''\00A1Preliquidaci\00F3n Generada Satisfactoriamente!'';'),
'        else',
'            rollback;',
'                raise_application_error(-20001, v_mnsje_rspsta);',
'        end if;',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(5456959594602872)
,p_process_when=>'BTN_REGISTRAR_LIQUIDACION'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>unistr('Su Solicitud de liquidaci\00F3n ha sido registrada con exito. A continuaci\00F3n un funcionario debe revisar y aprobar su liquidaci\00F3n. Al ser aprobada su liquidaci\00F3n usted podra descargar el recibo de pago desde la opci\00F3n de "Consulta de liquidaciones de Ren')
||'tas Varias".'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5471105944602886)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Informaci\00F3n de Sujeto Impuiestos')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if :P200_ID_SJTO_IMPSTO is not null and :P200_ID_SJTO is null then ',
'        select a.idntfccion_sjto_frmtda',
'             , upper(a.nmbre_pais || '' '' || a.nmbre_dprtmnto || '' '' || a.nmbre_mncpio)',
'             , a.drccion',
'             , a.cdgo_sjto_tpo',
'             , b.nmbre_rzon_scial',
'             , :P200_ID_IMPSTO_SBMPSTO',
'             , :P200_ID_IMPSTO_ACTO',
'             , :P202_FCHA_EXPDCION',
'             , :P202_VLOR_BSE_GRVBLE || '' '' || :P202_LBEL_ITEM_VLOR_BSE_GRVBLE bse',
'             , :P200_INDCDOR_EXTRNJRO',
'             , :P200_INDCDOR_MXTO',
'             , :P202_FCHA_VNCMNTO',
'          into :P204_IDNTFCCION_SJTO_FRMTDA',
'             , :P204_UBCCION',
'             , :P204_DRCCION',
'             , :P204_CDGO_SJTO_TPO',
'             , :P204_NMBRE_RZON_SCIAL',
'             , :P204_ID_IMPSTO_SBMPSTO',
'             , :P204_ID_IMPSTO_ACTO',
'             , :P204_FCHA_EXPDCION',
'             , :P204_BSE',
'             , :P204_INDCDOR_EXTRNJRO',
'             , :P204_INDCDOR_MXTO',
'             , :P204_FCHA_VNCMNTO',
'           from V_SI_I_SUJETOS_IMPUESTO    a',
'           join si_i_personas              b on a.id_sjto_impsto = b.id_sjto_impsto',
'          where a.id_sjto_impsto           = :P200_ID_SJTO_IMPSTO;',
'    ',
'    elsif :P200_ID_SJTO is not null and (:P200_ID_SJTO_IMPSTO is null or :P200_ID_SJTO_IMPSTO = 0 ) then ',
'        select a.idntfccion_sjto_frmtda',
'             , upper(a.nmbre_pais || '' '' || a.nmbre_dprtmnto || '' '' || a.nmbre_mncpio)',
'             , a.drccion',
'             , a.cdgo_sjto_tpo',
'             , b.nmbre_rzon_scial',
'             , :P200_ID_IMPSTO_SBMPSTO',
'             , :P200_ID_IMPSTO_ACTO',
'             , :P202_FCHA_EXPDCION',
'             , :P202_VLOR_BSE_GRVBLE || '' '' || :P202_LBEL_ITEM_VLOR_BSE_GRVBLE bse',
'             , :P200_INDCDOR_EXTRNJRO',
'             , :P200_INDCDOR_MXTO',
'          into :P204_IDNTFCCION_SJTO_FRMTDA',
'             , :P204_UBCCION',
'             , :P204_DRCCION',
'             , :P204_CDGO_SJTO_TPO',
'             , :P204_NMBRE_RZON_SCIAL',
'             , :P204_ID_IMPSTO_SBMPSTO',
'             , :P204_ID_IMPSTO_ACTO',
'             , :P204_FCHA_EXPDCION',
'             , :P204_BSE',
'             , :P204_INDCDOR_EXTRNJRO',
'             , :P204_INDCDOR_MXTO',
'           from V_SI_I_SUJETOS_IMPUESTO    a',
'           join si_i_personas              b on a.id_sjto_impsto = b.id_sjto_impsto',
'          where a.id_sjto_impsto           = (select max(id_sjto_impsto) from si_i_sujetos_impuesto where id_sjto = :P200_ID_SJTO) ;',
'    else',
'        :P204_IDNTFCCION_SJTO_FRMTDA    := null;',
'        :P204_UBCCION                   := null;',
'        :P204_DRCCION                   := null;',
'        :P204_CDGO_SJTO_TPO             := null;',
'        :P204_NMBRE_RZON_SCIAL          := null;',
'        :P204_ID_IMPSTO_SBMPSTO         := null;',
'        :P204_ID_IMPSTO_ACTO            := null;',
'        :P204_FCHA_EXPDCION             := null;',
'        :P204_BSE                       := null;',
'        :P204_INDCDOR_EXTRNJRO          := null;',
'        :P204_INDCDOR_MXTO              := null;',
'    end if;',
'exception',
'    when others then',
'        :P204_IDNTFCCION_SJTO_FRMTDA    := null;',
'        :P204_UBCCION                   := null;',
'        :P204_DRCCION                   := null;',
'        :P204_CDGO_SJTO_TPO             := null;',
'        :P204_NMBRE_RZON_SCIAL          := null;',
'        :P204_ID_IMPSTO_SBMPSTO         := null;',
'        :P204_ID_IMPSTO_ACTO            := null;',
'        :P204_FCHA_EXPDCION             := null;',
'        :P204_BSE                       := null;',
'        :P204_INDCDOR_EXTRNJRO          := null;',
'        :P204_INDCDOR_MXTO              := null;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(79882104270484505)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Conusltar reporte de reibos de rentas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.id_rprte',
'      into :P204_ID_RPRTE',
'      from gn_d_reportes   a',
'       join gn_d_reporte_cliente    b on a.id_rprte = b.id_rprte',
'       and cdgo_clnte              = :F_CDGO_CLNTE',
'     where cdgo_rprte_grpo = ''RRV'' ',
'       and a.indcdor_gnrco = ''N'';',
'exception',
'    when no_data_found then ',
'         select a.id_rprte',
'          into :P204_ID_RPRTE',
'          from gn_d_reportes   a',
'         where a.cdgo_rprte_grpo = ''RRV''  ',
'           and a.indcdor_gnrco = ''S''',
'           and rownum            = 1;',
'    when others then ',
'        :P149_ID_RPRTE := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5263728446897637)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Liquidacion de Rentas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	v_cdgo_rspsta		  number;',
'	v_mnsje_rspsta		  varchar2(2000);',
'',
'begin',
'	if (:P200_ID_SJTO_IMPSTO is null or :P200_ID_SJTO_IMPSTO = 0) and  :P200_ID_SJTO is not null then ',
'        begin ',
'            pkg_si_novedades_persona.prc_rg_sjto_impsto_sjto_exstnt (p_cdgo_clnte        => :F_CDGO_CLNTE,',
'                                                                     p_id_sjto           => :P200_ID_SJTO,',
'                                                                     p_id_impsto         => :P200_ID_IMPSTO,',
'                                                                     p_id_impsto_sbmpsto => :P200_ID_IMPSTO_SBMPSTO,',
'                                                                     p_id_usrio          => :F_ID_USRIO,',
'                                                                     o_id_sjto_impsto    => :P200_ID_SJTO_IMPSTO,',
'                                                                     o_cdgo_rspsta		 => v_cdgo_rspsta,',
'                                                                     o_mnsje_rspsta		 => v_mnsje_rspsta);',
'            if v_cdgo_rspsta <> 0 then',
unistr('                :P204_RSPSTA := ''\00A1Error al Registrar el Sujeto!'';'),
'                apex_json.open_object;',
'                apex_json.write(''type'', ''ERROR'');',
'                apex_json.write(''msg'', ''Error al Registrar el Sujeto'' || v_mnsje_rspsta);        ',
'                apex_json.close_object;',
'            end if;',
'        exception',
'            when others then ',
'                apex_json.open_object;',
'                apex_json.write(''type'', ''ERROR'');',
'                apex_json.write(''msg'', sqlerrm);        ',
'                apex_json.close_object;		        ',
'        end;',
'    end if;',
'    ',
'    if :P200_ID_SJTO_IMPSTO is not null and :P200_ID_SJTO_IMPSTO > 0 then',
unistr('        -- Registro de la proyecci\00F3n de rentas'),
'        pkg_gi_rentas.prc_re_liquidacion_renta (p_cdgo_clnte                => :F_CDGO_CLNTE',
'                                              , p_id_impsto                 => :P200_ID_IMPSTO',
'                                              , p_id_impsto_sbmpsto         => :P200_ID_IMPSTO_SBMPSTO',
'                                              , p_id_sjto_impsto            => :P200_ID_SJTO_IMPSTO',
'                                              , p_json_impsto_acto_cncpto   => :P204_CNCPTOS',
'                                              , p_id_sbmpsto_ascda          => :P201_ID_SBMPSTO_ASCDA',
'                                              , p_txto_ascda                => :P201_TXTO_ASCDA',
'                                              , p_fcha_expdcion             => nvl(:P202_FCHA_EXPDCION, sysdate)',
'                                              , p_vlor_bse_grvble           => to_number(:P202_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'                                              , p_indcdor_usa_extrnjro      => nvl(:P200_INDCDOR_EXTRNJRO, ''N'')',
'                                              , p_indcdor_usa_mxto          => nvl(:P200_INDCDOR_MXTO, ''N'')',
'                                              , p_fcha_vncmnto_dcmnto       => :P202_FCHA_VNCMNTO',
'                                              , p_id_usrio                  => :F_ID_USRIO',
'                                              , p_entrno                    => ''PBLCO''',
'                                              , p_id_rnta                   => :P204_ID_RNTA',
'                                              , o_id_dcmnto                 => :P204_ID_DCMNTO',
'                                              , o_nmro_dcmnto               => :P204_NMRO_DCMNTO',
'                                              , o_cdgo_rspsta               => v_cdgo_rspsta',
'                                              , o_mnsje_rspsta              => v_mnsje_rspsta',
'                                             );',
'        ',
'        if v_cdgo_rspsta = 0 then',
unistr('            :P204_RSPSTA := ''\00A1Liquidaci\00F3n Generada Satisfactoriamente!'';'),
'            apex_json.open_object;',
'            apex_json.write(''type'', ''OK'');    ',
unistr('            apex_json.write(''nmbre_rprte'', ''Liquidaci\00F3n_'' || :P204_NMRO_DCMNTO);    '),
'            apex_json.close_object;',
'        else',
'            :P204_RSPSTA     := v_mnsje_rspsta;',
'            :P204_ID_RNTA    := null;',
'            apex_json.open_object;',
'            apex_json.write(''type'', ''ERROR'');',
'            apex_json.write(''msg'', v_mnsje_rspsta);        ',
'            apex_json.close_object;',
'        end if;',
'    end if; ',
'    ',
'    exception ',
'        when others then ',
'            apex_json.open_object;',
'            apex_json.write(''type'', ''ERROR'');',
'            apex_json.write(''msg'', sqlerrm);        ',
'            apex_json.close_object;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(78953905703533319)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Descargar_Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_gn_d_reportes     gn_d_reportes%rowtype;',
'    v_blob              blob;',
'    ',
'begin',
'    apex_util.set_session_state(''F_CDGO_CLNTE'', :F_CDGO_CLNTE);',
'    apex_util.set_session_state(''F_FRMTO_MNDA'', ''FM$999G999G999G999G999G999G990'');',
'    ',
'    apex_session.attach( p_app_id     => 66000',
'                       , p_page_id    => 2',
'                       , p_session_id => v(''APP_SESSION'') );',
'',
'    --BUSCAMOS LOS DATOS DE PLANTILLA DE REPORTES',
'    select /*+ RESULT_CACHE */',
'           r.*',
'      into v_gn_d_reportes ',
'      from gn_d_reportes r',
'     where r.id_rprte = :P204_ID_RPRTE;',
'',
'    --SETEAMOS EN SESSION LOS ITEMS NECESARIOS PARA GENERAR EL ARCHIVO     ',
'    apex_util.set_session_state(''F_CDGO_CLNTE'', :F_CDGO_CLNTE);',
'    apex_util.set_session_state(''F_FRMTO_MNDA'', ''FM$999G999G999G999G999G999G990'');',
'    apex_util.set_session_state(''P2_PRMTRO_1'', to_number(:P204_ID_RNTA));',
'    apex_util.set_session_state(''P2_PRMTRO_2'', to_number(:P204_ID_DCMNTO));',
'',
'    v_blob := apex_util.get_print_document( p_application_id     => 66000, ',
'                                            p_report_query_name  => v_gn_d_reportes.nmbre_cnslta,',
'                                            p_report_layout_name => v_gn_d_reportes.nmbre_plntlla,',
'                                            p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla,',
'                                            p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo );',
'    htp.init;',
'    owa_util.mime_header(''application/pdf'', FALSE );',
'    htp.p(''Content-length: '' ||dbms_lob.getlength(v_blob));',
'    htp.p(''Content-Disposition: attachment; filename="DOCUMENTO_"'' );',
'    htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'    owa_util.http_header_close;',
'    wpg_docload.download_file(v_blob);',
'    apex_application.stop_apex_engine;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
