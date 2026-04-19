prompt --application/pages/page_00184
begin
wwv_flow_api.create_page(
 p_id=>184
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Subsanar Solicitudes'
,p_step_title=>'Subsanar Solicitudes'
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IG-controlsContainer {',
'    display: none;',
'}'))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'NCARRASQUILLA'
,p_last_upd_yyyymmddhh24miss=>'20201209104808'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(179630177861596655)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>',
unistr('    <p align="center"><b>Liquidaci\00F3n de Rentas Varias.</b> <br> <br> '),
'      Resumen<br><br>  </p>',
unistr('      <p align="justify">En este paso se muestra el resumen de toda la informaci\00F3n ingresada para realizar el proceso de liquidaci\00F3n.</p>'),
'    ',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(197650618258661534)
,p_plug_name=>'Resumen'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_api.id(164085715180707699)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(76379350032438234)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(164098974360707738)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(188104502764315534)
,p_plug_name=>'Tab Selector'
,p_parent_plug_id=>wwv_flow_api.id(197650618258661534)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(188103939759315528)
,p_plug_name=>'Adjuntos'
,p_parent_plug_id=>wwv_flow_api.id(188104502764315534)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select seq_id',
'        ,  dscrpcion dscrpcion_adjnto_tpo',
'        , c002                           file_name',
'        , c001                           obsrvcion',
'     from apex_collections               a',
'	 join table (pkg_gi_rentas.fnc_tipos_adjunto (p_cdgo_clnte          => :F_CDGO_CLNTE,',
'												  p_id_impsto           => :P138_ID_IMPSTO,',
'												  p_id_impsto_sbmpsto   => :P138_ID_IMPSTO_SBMPSTO,',
'												  p_id_impsto_acto      => :P139_ID_IMPSTO_ACTO )) b   on a.n001    = b.id_adjnto_tpo',
'    -- join gi_d_subimpuestos_adjnto_tp    b on a.n001    = b.id_sbmpto_adjnto_tpo',
'    where collection_name                = ''ADJUNTOS_RENTA'''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P138_INDCDOR_RQRE_ADJNTO'
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
 p_id=>wwv_flow_api.id(188104037428315529)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>188104037428315529
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100680198612063421)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100681381848063426)
,p_db_column_name=>'DSCRPCION_ADJNTO_TPO'
,p_display_order=>20
,p_column_identifier=>'D'
,p_column_label=>'Tipo de Adjunto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100680581346063425)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Adjunto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100680939220063425)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(188130684439845583)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1006817'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_ADJNTO_TPO:FILE_NAME:OBSRVCION:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(188104674669315535)
,p_plug_name=>'Conceptos'
,p_parent_plug_id=>wwv_flow_api.id(188104502764315534)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select distinct --rownum',
'          a.cdgo_cncpto || '' - '' || a.dscrpcion_cncpto  dscrpcion_cncpto',
'        , a.vlor_lqddo',
'        , a.vlor_intres_mra',
'        , a.vlor_ttal vlor_ttal',
'        , a.fcha_vncmnto',
'        , a.dias_mra        ',
'        , a.txto_trfa',
'        , a.vlor_pgdo',
'     from table (pkg_gi_rentas.fnc_cl_select_cncptos_lqdcion(p_cdgo_clnte 				=> :F_CDGO_CLNTE',
'                                                           , p_id_impsto                => :P138_ID_IMPSTO',
'                                                           , p_id_impsto_sbmpsto        => :P138_ID_IMPSTO_SBMPSTO  ',
'                                                           , p_id_sjto_impsto           => :P138_ID_SJTO_IMPSTO',
'                                                           , p_json						=> :P139_CNCPTOS',
'                                                           , p_vlor_bse					=> to_number(:P141_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'                                                           , p_indcdor_usa_extrnjro		=> nvl(:P139_INDCDOR_USA_EXTRNJRO, ''N'')',
'                                                           , p_indcdor_usa_mxto			=> nvl(:P139_INDCDOR_USA_MXTO, ''N'')',
'                                                           , p_fcha_expdcion            => :P141_FCHA_EXPDCION',
'                                                           , p_fcha_vncmnto             => :P141_FCHA_VNCMNTO',
'                                                           , p_indcdor_lqdccion_adcnal  => :P141_INDCDOR_LDCCION_ADCNAL  ',
'                                                           , p_id_rnta_antrior          => :P141_ID_RNTA_ANTRIOR',
'                                                           , p_indcdor_cntrto_gslna     => :P139_INDCDOR_CNTRTO_GSLNA ',
'                                                            )',
'                ) a',
' where a.cdgo_clnte        = :F_CDGO_CLNTE',
'   and abs(a.vlor_lqddo)   > 0',
'   and a.id_impsto_acto    = :P139_ID_IMPSTO_ACTO',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(188105065568315539)
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
 p_id=>wwv_flow_api.id(188105197471315541)
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
 p_id=>wwv_flow_api.id(188105390174315542)
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
 p_id=>wwv_flow_api.id(188105433542315543)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor <br>Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(188105543641315544)
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
 p_id=>wwv_flow_api.id(188105652781315545)
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
 p_id=>wwv_flow_api.id(188105765404315546)
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(193113544896013752)
,p_name=>'VLOR_PGDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_PGDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor <br> Pagado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_condition=>'P184_INDCDOR_LDCCION_ADCNAL'
,p_display_condition2=>'S'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(188104892539315537)
,p_internal_uid=>188104892539315537
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>false
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
 p_id=>wwv_flow_api.id(188145018218930904)
,p_interactive_grid_id=>wwv_flow_api.id(188104892539315537)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(188145166570930904)
,p_report_id=>wwv_flow_api.id(188145018218930904)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(188146107698930918)
,p_view_id=>wwv_flow_api.id(188145166570930904)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(188105065568315539)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>432
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(188147163507930922)
,p_view_id=>wwv_flow_api.id(188145166570930904)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(188105197471315541)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(188147613274930924)
,p_view_id=>wwv_flow_api.id(188145166570930904)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(188105390174315542)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(188148179895930925)
,p_view_id=>wwv_flow_api.id(188145166570930904)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(188105433542315543)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(188148651623930927)
,p_view_id=>wwv_flow_api.id(188145166570930904)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(188105543641315544)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(188149185147930928)
,p_view_id=>wwv_flow_api.id(188145166570930904)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(188105652781315545)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(188149679858930930)
,p_view_id=>wwv_flow_api.id(188145166570930904)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(188105765404315546)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(193343268452435888)
,p_view_id=>wwv_flow_api.id(188145166570930904)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(193113544896013752)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(100677234473063932)
,p_view_id=>wwv_flow_api.id(188145166570930904)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(193113544896013752)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(100677286337063355)
,p_view_id=>wwv_flow_api.id(188145166570930904)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(188105433542315543)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(100677318726063365)
,p_view_id=>wwv_flow_api.id(188145166570930904)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(188105390174315542)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(100677482531063365)
,p_view_id=>wwv_flow_api.id(188145166570930904)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(188105197471315541)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(261997810365691604)
,p_plug_name=>unistr('Informaci\00F3n B\00E1sica')
,p_region_name=>'informacion_basica'
,p_parent_plug_id=>wwv_flow_api.id(197650618258661534)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(100677932543063388)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(197650618258661534)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de cancelar? Al cancelar se perdera todos los cambios que no se han guardado'',''CANCEL'');'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-calendar-times-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(100678363033063406)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(197650618258661534)
,p_button_name=>'BTN_LIQUIDAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Liquidar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P138_INDCDOR_RQRE_AUTRZCION'
,p_button_condition2=>'N'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-cog'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(100678723091063406)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(197650618258661534)
,p_button_name=>'BTN_REGISTRAR_LIQUIDACION'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Registrar Liquidaci\00F3n')
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿Esta seguro de registrar su solicitud liquidaciÃ³n?'',''BTN_REGISTRAR_LIQUIDACION'');'
,p_button_condition=>'P138_INDCDOR_RQRE_AUTRZCION'
,p_button_condition2=>'S'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(100679196028063406)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(197650618258661534)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103612327707757)
,p_button_image_alt=>'Anterior'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(100702595764063573)
,p_branch_name=>'Ir a Inicio'
,p_branch_action=>'f?p=&APP_ID.:89:&SESSION.::&DEBUG.:RP,138,139,141,142,143::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(100678723091063406)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(100703381271063574)
,p_branch_name=>unistr('Ir a P\00E1gina 89/136 - Informe de Liquidaciones')
,p_branch_action=>'P138_BRANCH'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_PAGE_IDENT_BY_ITEM'
,p_branch_when_button_id=>wwv_flow_api.id(100677932543063388)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(100702192001063569)
,p_branch_name=>unistr('Ir a Proyecci\00F3n')
,p_branch_action=>'f?p=&APP_ID.:141:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(100679196028063406)
,p_branch_sequence=>20
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P138_INDCDOR_RQRE_ADJNTO'
,p_branch_condition_text=>'N'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(100702990635063573)
,p_branch_name=>'Ir a Adjuntos'
,p_branch_action=>'f?p=&APP_ID.:142:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(100679196028063406)
,p_branch_sequence=>30
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P138_INDCDOR_RQRE_ADJNTO'
,p_branch_condition_text=>'S'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100686484490063485)
,p_name=>'P184_NRO_RNTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(261997810365691604)
,p_prompt=>unistr('N\00B0 Liquidaci\00F3n')
,p_source=>'P138_NMRO_RNTA'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>12
,p_display_when=>'P138_ID_RNTA'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100686832811063504)
,p_name=>'P184_IDNTFCCION_SJTO_FRMTDA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(261997810365691604)
,p_prompt=>unistr('Identificaci\00F3n')
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
 p_id=>wwv_flow_api.id(100687297504063504)
,p_name=>'P184_NMBRE_RZON_SCIAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(261997810365691604)
,p_prompt=>unistr('Nombre / Raz\00F3n Social')
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
 p_id=>wwv_flow_api.id(100687610552063504)
,p_name=>'P184_UBCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(261997810365691604)
,p_prompt=>unistr('Ubicaci\00F3n')
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
 p_id=>wwv_flow_api.id(100688086604063505)
,p_name=>'P184_DRCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(261997810365691604)
,p_prompt=>unistr('Direcci\00F3n')
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
 p_id=>wwv_flow_api.id(100688463177063505)
,p_name=>'P184_CDGO_SJTO_TPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(261997810365691604)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100688805723063505)
,p_name=>'P184_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(261997810365691604)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select nmbre_impsto_sbmpsto          d ',
'        , id_impsto_sbmpsto             r       ',
'     from df_i_impuestos_subimpuesto    a',
'    where cdgo_clnte                    = :F_CDGO_CLNTE',
'      and id_impsto                     = :P138_ID_IMPSTO',
'      and id_impsto_sbmpsto             = :P138_ID_IMPSTO_SBMPSTO',
'      and actvo                         = ''S''',
' order by nmbre_impsto_sbmpsto'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100689225040063506)
,p_name=>'P184_ID_IMPSTO_ACTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(261997810365691604)
,p_prompt=>'Acto'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.nmbre_impsto_acto',
'        , a.id_impsto_acto',
'     from v_df_i_impuestos_acto           a',
' order by a.nmbre_impsto_acto'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>4
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100689668879063506)
,p_name=>'P184_ID_IMPSTO_ASCDA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(261997810365691604)
,p_prompt=>'Asociada'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select dscrpcion || '': '' || :P184_TXTO_ASCDA d',
'        , id_sbmpsto_ascda ',
'     from gi_d_subimpuestos_asociada'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>10
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100690059655063506)
,p_name=>'P184_FCHA_EXPDCION'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(261997810365691604)
,p_prompt=>'&P138_LBEL_FCHA.'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100690498476063507)
,p_name=>'P184_TXTO_ASCDA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(261997810365691604)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100690824542063507)
,p_name=>'P184_TXTO_BSE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(261997810365691604)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select txto_bse_grvble',
'     from df_i_impuestos_acto',
'    where id_impsto                = :P138_ID_IMPSTO',
'      and id_impsto_sbmpsto        = :P138_ID_IMPSTO_SBMPSTO',
'      and id_impsto_acto           = :P139_ID_IMPSTO_ACTO;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100691275002063508)
,p_name=>'P184_BSE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(261997810365691604)
,p_prompt=>'&P184_TXTO_BSE.'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>4
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100691661189063508)
,p_name=>'P184_FCHA_VNCMNTO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(261997810365691604)
,p_prompt=>'Fecha de Pago'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P184_FCHA_VNCMNTO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100692090532063508)
,p_name=>'P184_CDGO_RNTA_ESTDO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(261997810365691604)
,p_prompt=>'Estado'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.dscrpcion',
'        , a.cdgo_rnta_estdo',
'     from gi_d_rentas_estado a'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100692454053063510)
,p_name=>'P184_INDCDOR_EXTRNJRO'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(261997810365691604)
,p_prompt=>unistr('\00BFExtranjero?')
,p_display_as=>'NATIVE_YES_NO'
,p_display_when=>'P138_USA_INDCDOR_EXTRNJRO'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100692817074063510)
,p_name=>'P184_INDCDOR_MXTO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(261997810365691604)
,p_prompt=>unistr('\00BFMixto?')
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_display_when=>'P138_USA_INDCDOR_MXTO'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100693244913063511)
,p_name=>'P184_INDCDOR_CNTRTO_GSLNA'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(261997810365691604)
,p_prompt=>unistr('\00BFContrato de Gasolina?')
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_display_when=>'P184_INDCDOR_CNTRTO_GSLNA'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'Si'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100693669777063511)
,p_name=>'P184_INDCDOR_EXNCION'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(261997810365691604)
,p_prompt=>unistr('\00BFSolicit\00F3 exenci\00F3n?')
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_display_when=>'P184_INDCDOR_EXNCION'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100694072754063511)
,p_name=>'P184_INDCDOR_LDCCION_ADCNAL'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(261997810365691604)
,p_prompt=>unistr('\00BFLiquidaci\00F3n Adicional?')
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100694496165063513)
,p_name=>'P184_NMRO_LQDCION_ANTRIOR'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(261997810365691604)
,p_prompt=>unistr('N\00B0 Liquidaciones Anteriores')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_column=>1
,p_display_when=>'P184_INDCDOR_LDCCION_ADCNAL'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100694839183063517)
,p_name=>'P184_TTAL_LQDCION_ANTRIOR'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(261997810365691604)
,p_prompt=>'Total Liquidaciones Anteriores'
,p_format_mask=>'999G999G999G999G990'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>4
,p_display_when=>'P184_INDCDOR_LDCCION_ADCNAL'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100695229971063517)
,p_name=>'P184_NVA_BSE'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(261997810365691604)
,p_prompt=>'Nueva Base Gravable'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P184_INDCDOR_LDCCION_ADCNAL'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100695644679063518)
,p_name=>'P184_RSPSTA'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(261997810365691604)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100696077209063518)
,p_name=>'P184_ID_RPRTE'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(261997810365691604)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100696493835063518)
,p_name=>'P184_ID_RNTA'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(261997810365691604)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100696854572063518)
,p_name=>'P184_CNCPTOS'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(261997810365691604)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100697261311063518)
,p_name=>'P184_ID_LQDCION'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(261997810365691604)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100697695618063519)
,p_name=>'P184_ID_DCMNTO'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(261997810365691604)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100698089707063519)
,p_name=>'P184_NMRO_DCMNTO'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(261997810365691604)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(100698570886063538)
,p_computation_sequence=>10
,p_computation_item=>'P184_CNCPTOS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select json_arrayagg(json_object(  key ''ID_IMPSTO_ACTO_CNCPTO'' is a.id_impsto_acto_cncpto',
'                                   ,key ''ID_IMPSTO_ACTO''        is a.id_impsto_acto',
'                                   ,key ''GNRA_INTRES_MRA''       is a.gnra_intres_mra',
'                                   ,key ''FCHA_VNCMNTO''          is to_char(a.fcha_vncmnto, ''dd/mm/yyyy'')',
'                                   ,key ''DIAS_MRA''              is nvl(a.dias_mra,''0'')',
'                                   ,key ''BSE_CNCPTO''            is a.bse_grvble',
'                                   ,key ''VLOR_INDCDOR''          is nvl(a.vlor_indcdor,''0'')',
'                                   ,key ''VLOR_TRFA''             is nvl(a.vlor_trfa,''0'')',
'                                   ,key ''VLOR''                  is nvl(a.vlor,''0'')',
'                                   ,key ''TXTO_TRFA''             is a.txto_trfa',
'                                   ,key ''VLOR_LQDDO''            is a.vlor_lqddo',
'                                   ,key ''VLOR_INTRES_MRA''       is a.vlor_intres_mra',
'                                   ,key ''VLOR_TTAL''             is a.vlor_ttal',
'                                 )',
'                      )cncptos',
' from table (pkg_gi_rentas.fnc_cl_select_cncptos_lqdcion(p_cdgo_clnte                 => :F_CDGO_CLNTE',
'                                                       , p_id_impsto                => :P138_ID_IMPSTO',
'                                                       , p_id_impsto_sbmpsto        => :P138_ID_IMPSTO_SBMPSTO  ',
'                                                       , p_id_sjto_impsto           => :P138_ID_SJTO_IMPSTO',
'                                                       , p_json                        => :P139_CNCPTOS',
'                                                       , p_vlor_bse                    => to_number(:P141_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'                                                       , p_indcdor_usa_extrnjro        => nvl(:P139_INDCDOR_USA_EXTRNJRO, ''N'')',
'                                                       , p_indcdor_usa_mxto            => nvl(:P139_INDCDOR_USA_MXTO, ''N'')',
'                                                       , p_fcha_expdcion            => nvl(:P141_FCHA_EXPDCION, sysdate)',
'                                                       , p_fcha_vncmnto             => :P141_FCHA_VNCMNTO',
'                                                       , p_indcdor_lqdccion_adcnal  => nvl(:P141_INDCDOR_LDCCION_ADCNAL , ''N'')',
'                                                       , p_id_rnta_antrior          => :P141_ID_RNTA_ANTRIOR',
'                                                       , p_indcdor_cntrto_gslna     => nvl(:P139_INDCDOR_CNTRTO_GSLNA , ''N'')',
'                                                        )',
'            ) a',
'     where abs(vlor_lqddo) > 0',
'      -- and :P139_CNCPTOS is not null',
'       and a.id_impsto_acto    = :P139_ID_IMPSTO_ACTO'))
,p_computation_error_message=>'Error al calcular los conceptos #SQLERRM#'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(100698986143063545)
,p_validation_name=>'Validar que la proyeccion no sea nula'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select rownum',
'        , a.cdgo_cncpto || '' - '' || a.dscrpcion_cncpto  dscrpcion_cncpto',
'        , a.vlor_lqddo',
'        , a.vlor_intres_mra',
'        , a.vlor_ttal vlor_ttal',
'        , a.fcha_vncmnto',
'        , a.dias_mra',
'        , a.txto_trfa',
'     from table (pkg_gi_rentas.fnc_cl_select_cncptos_lqdcion(p_cdgo_clnte 				=> :F_CDGO_CLNTE',
'                                                           , p_id_sjto_impsto           => :P138_ID_SJTO_IMPSTO',
'                                                           , p_id_impsto                => :P138_ID_IMPSTO',
'                                                           , p_id_impsto_sbmpsto        => :P138_ID_IMPSTO_SBMPSTO  ',
'                                                           , p_json						=> :P139_CNCPTOS --**',
'                                                           , p_vlor_bse					=> to_number(:P141_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'                                                           , p_indcdor_usa_extrnjro		=> nvl(:P139_INDCDOR_USA_EXTRNJRO,nvl(:P138_USA_INDCDOR_EXTRNJRO,''N''))',
'                                                           , p_indcdor_usa_mxto			=> nvl(:P139_INDCDOR_USA_MXTO,nvl(:P138_USA_INDCDOR_MXTO,''N''))',
'                                                           , p_fcha_expdcion            => :P141_FCHA_EXPDCION',
'                                                           , p_fcha_vncmnto             => :P141_FCHA_VNCMNTO',
'                                                           , p_indcdor_lqdccion_adcnal  => nvl(:P141_INDCDOR_LDCCION_ADCNAL,''N'') ',
'                                                           , p_id_rnta_antrior          => :P141_ID_RNTA_ANTRIOR',
'                                                           , p_indcdor_cntrto_gslna     => nvl(:P139_INDCDOR_CNTRTO_GSLNA,''N'')  )) a',
' where a.cdgo_clnte        = :F_CDGO_CLNTE',
'   and a.vlor_lqddo        > 0',
'   and a.id_impsto_acto    = :P139_ID_IMPSTO_ACTO',
'union ',
'  select null',
'        , c.cdgo_cncpto || '' - '' || c.dscrpcion  dscrpcion_cncpto',
'        , - sum(b.vlor_ttal) vlor_ttal',
'        , 0 vlor_intres_mra',
'        , - sum(b.vlor_ttal) vlor_ttal',
'        , null fcha_vncmnto',
'        , null dias_mra',
'        , null txto_trfa',
'     from gi_g_rentas                    a',
'     join gi_g_liquidaciones             b on a.id_lqdcion   = b.id_lqdcion',
'     join df_i_conceptos                 c on a.id_impsto    = c.id_impsto',
'      and c.cdgo_cncpto                  = ''LAN''',
'    where (id_rnta                       = (select id_rnta from json_table(:P141_ID_RNTA_ANTRIOR,''$[*]''columns id_rnta path ''$.ID_RNTA''))',
'      or id_rnta_antrior                 = (select id_rnta from json_table(:P141_ID_RNTA_ANTRIOR,''$[*]''columns id_rnta path ''$.ID_RNTA'')))',
'     and :P184_INDCDOR_LDCCION_ADCNAL    = ''S''',
' group by c.cdgo_cncpto',
'        , c.dscrpcion'))
,p_validation_type=>'EXISTS'
,p_error_message=>unistr('Proyecci\00F3n no valida')
,p_always_execute=>'Y'
,p_validation_condition=>'BTN_LIQUIDAR,BTN_REGISTRAR_LIQUIDACION'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100701294262063555)
,p_name=>'Liquidacion de Rentas'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(100678363033063406)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100701759590063566)
,p_event_id=>wwv_flow_api.id(100701294262063555)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function Liquidacion_Rentas() {',
' ',
'    var v_app_id = $v(''pFlowId''),',
'        v_page_id = $v(''pFlowStepId''),',
'        v_session = $v(''pInstance'');',
' ',
'    var url = `f?p=${v_app_id}:${v_page_id}:${v_session}:PRINT_REPORT=re_c_recibo_pago_rentas:NO:RP:::`;',
' ',
'    var rs = await apex.server.process(''Liquidacion de Rentas'');',
'    if (rs.type == ''OK'') {',
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
'        window.location.href = `f?p=${v_app_id}:${7}:${v_session}::NO:RP,200,201,202,203,204:::`;    ',
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
 p_id=>wwv_flow_api.id(100700423760063553)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar Rentas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	v_cdgo_rspsta		number;',
'	v_mnsje_rspsta		varchar2(2000)	:= ''Inicio'';',
'    v_id_sjto_impsto    number;',
'',
'begin',
'	-- Se registra el sujeto impuesto si no existe para rentas',
'    if :P138_ID_SJTO is not null then ',
'        begin ',
'            pkg_si_novedades_persona.prc_rg_sjto_impsto_sjto_exstnt (p_cdgo_clnte        => :F_CDGO_CLNTE,',
'                                                                     p_id_sjto           => :P138_ID_SJTO,',
'                                                                     p_id_impsto         => :P138_ID_IMPSTO,',
'                                                                     p_id_usrio          => :F_ID_USRIO,',
'                                                                     o_id_sjto_impsto    => v_id_sjto_impsto,',
'                                                                     o_cdgo_rspsta		 => v_cdgo_rspsta,',
'                                                                     o_mnsje_rspsta		 => v_mnsje_rspsta);',
'             if(v_cdgo_rspsta <> 0) then',
'                 raise_application_error(-20001, ''1. Error: '' || v_mnsje_rspsta);',
'             end if;',
'            ',
'        exception',
'            when others then ',
'                rollback;',
'		        raise_application_error(-20001, ''2. '' ||v_mnsje_rspsta);',
'        end;',
'    else',
'        v_id_sjto_impsto    := :P138_ID_SJTO_IMPSTO;',
'    end if;',
'    	',
'    if v_id_sjto_impsto is not null then',
'        begin',
'            pkg_gi_rentas.prc_rg_proyeccion_renta(p_cdgo_clnte				=> :F_CDGO_CLNTE',
'                                                , p_id_impsto				=> :P138_ID_IMPSTO',
'                                                , p_id_impsto_sbmpsto		=> :P138_ID_IMPSTO_SBMPSTO',
'                                                , p_id_sjto_impsto			=> v_id_sjto_impsto',
'                                                , p_id_rnta					=> :P138_ID_RNTA',
'                                                , p_actos_cncpto			=> :P184_CNCPTOS',
'                                                , p_id_sbmpsto_ascda		=> :P139_ID_IMPSTO_ASCDA',
'                                                , p_txto_ascda				=> :P139_TXTO_ASCDA',
'                                                , p_fcha_expdcion			=> nvl(:P141_FCHA_EXPDCION, sysdate)',
'                                                , p_vlor_bse_grvble			=> to_number(:P141_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'                                                , p_indcdor_usa_mxto		=> nvl(:P139_INDCDOR_USA_MXTO,nvl(:P138_USA_INDCDOR_MXTO,''N''))',
'                                                , p_indcdor_usa_extrnjro	=> nvl(:P139_INDCDOR_USA_EXTRNJRO,nvl(:P138_USA_INDCDOR_EXTRNJRO,''N''))',
'                                                , p_fcha_vncmnto_dcmnto		=> :P141_FCHA_VNCMNTO',
'                                                , p_indcdor_lqdccion_adcnal => nvl(:P141_INDCDOR_LDCCION_ADCNAL,''N'')',
'                                                , p_id_rnta_antrior         => :P141_ID_RNTA_ANTRIOR',
'                                                , p_indcdor_exncion         => nvl(:P141_INDCDOR_EXNCION, ''N'')',
'                                                , p_indcdor_cntrto_gslna    => nvl(:P139_INDCDOR_CNTRTO_GSLNA,''N'')',
'                                                , p_json_mtdtos             => :P139_JSON_MTDTOS',
'                                                , p_entrno					=> ''PRVDO''',
'                                                , p_id_usrio				=> :F_ID_USRIO ',
'                                                , p_id_rnta_ascda           => :P139_ID_RNTA_ASCDA',
'                                                , o_id_rnta					=> :P184_ID_RNTA',
'                                                , o_cdgo_rspsta				=> v_cdgo_rspsta',
'                                                , o_mnsje_rspsta			=> v_mnsje_rspsta',
'                                                );',
'',
'            if(v_cdgo_rspsta = 0) then',
unistr('                :P184_RSPSTA := ''\00A1Preliquidaci\00F3n Generada Satisfactoriamente!'';'),
'            else',
'                rollback;',
'                :P184_ID_RNTA    := null;',
'                raise_application_error(-20001, ''3. Error: '' || v_mnsje_rspsta);',
'                    ',
'            end if;',
'        exception',
'            when others then ',
'                rollback;',
'                :P184_ID_RNTA    := null;',
'                raise_application_error(-20001, ''4. Error: '' || v_mnsje_rspsta || '' - '' || sqlerrm);',
'        end;',
'        ',
'    else',
'        rollback;',
'        v_mnsje_rspsta    := ''No se registro el sujeto impuesto'' ;',
'        raise_application_error(-20001, ''5. Error: '' || v_mnsje_rspsta || '' - '' || sqlerrm);',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(100678723091063406)
,p_process_when=>'BTN_REGISTRAR_LIQUIDACION'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>unistr('Su Solicitud de liquidaci\00F3n ha sido registrada con exito. A continuaci\00F3n un funcionario debe revisar y aprobar su liquidaci\00F3n. Al ser aprobada su liquidaci\00F3n usted podra descargar el recibo de pago.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(100700036986063552)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Informaci\00F3n de la Renta')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if :P138_ID_SJTO_IMPSTO is not null and :P138_ID_SJTO is null then ',
'        select a.idntfccion_sjto_frmtda',
'             , upper(a.nmbre_pais || '' '' || a.nmbre_dprtmnto || '' '' || a.nmbre_mncpio)',
'             , a.drccion',
'             , a.cdgo_sjto_tpo',
'             , b.nmbre_rzon_scial',
'             , :P138_ID_IMPSTO_SBMPSTO',
'             , :P139_ID_IMPSTO_ACTO',
'             , :P139_ID_IMPSTO_ASCDA',
'             , :P139_TXTO_ASCDA',
'             , :P141_FCHA_EXPDCION',
'             , :P141_FCHA_VNCMNTO        ',
'             , (select txto_bse_grvble',
'                  from df_i_impuestos_acto m ',
'                  join gi_g_rentas_acto    n on m.id_impsto_acto = n.id_impsto_acto',
'                 where n.id_rnta           = :P138_ID_RNTA',
'                   and rownum = 1) txto_bse_grvble',
'             , :P141_VLOR_BSE_GRVBLE',
'             , :P139_INDCDOR_USA_EXTRNJRO',
'             , :P139_INDCDOR_USA_MXTO',
'             , nvl(:P141_INDCDOR_LDCCION_ADCNAL,''N'')',
'             , nvl(:P139_INDCDOR_CNTRTO_GSLNA,''N'')',
'             , :P141_INDCDOR_EXNCION',
'             , :P138_CDGO_RNTA_ESTDO',
'          into :P184_IDNTFCCION_SJTO_FRMTDA',
'             , :P184_UBCCION',
'             , :P184_DRCCION',
'             , :P184_CDGO_SJTO_TPO',
'             , :P184_NMBRE_RZON_SCIAL',
'             , :P184_ID_IMPSTO_SBMPSTO',
'             , :P184_ID_IMPSTO_ACTO',
'             , :P184_ID_IMPSTO_ASCDA',
'             , :P184_TXTO_ASCDA',
'             , :P184_FCHA_EXPDCION',
'             , :P184_FCHA_VNCMNTO',
'             , :P184_TXTO_BSE',
'             , :P184_BSE',
'             , :P184_INDCDOR_EXTRNJRO',
'             , :P184_INDCDOR_MXTO',
'             , :P184_INDCDOR_LDCCION_ADCNAL',
'             , :P184_INDCDOR_CNTRTO_GSLNA',
'             , :P184_INDCDOR_EXNCION',
'             , :P184_CDGO_RNTA_ESTDO',
'           from V_SI_I_SUJETOS_IMPUESTO    a',
'           join si_i_personas              b on a.id_sjto_impsto = b.id_sjto_impsto',
'          where a.id_sjto_impsto           = :P138_ID_SJTO_IMPSTO;',
'                            ',
'    elsif :P138_ID_SJTO is not null then ',
'        select a.idntfccion_sjto_frmtda',
'             , upper(a.nmbre_pais || '' '' || a.nmbre_dprtmnto || '' '' || a.nmbre_mncpio)',
'             , a.drccion',
'             , a.cdgo_sjto_tpo',
'             , b.nmbre_rzon_scial',
'             , :P138_ID_IMPSTO_SBMPSTO',
'             , :P139_ID_IMPSTO_ACTO',
'             , :P139_ID_IMPSTO_ASCDA',
'             , :P139_TXTO_ASCDA',
'             , :P141_FCHA_EXPDCION',
'             , :P141_FCHA_VNCMNTO        ',
'             , (select txto_bse_grvble',
'                  from df_i_impuestos_acto m ',
'                  join gi_g_rentas_acto    n on m.id_impsto_acto = n.id_impsto_acto',
'                 where n.id_rnta           = :P138_ID_RNTA',
'                   and rownum = 1) txto_bse_grvble',
'             , :P141_VLOR_BSE_GRVBLE',
'             , :P139_INDCDOR_USA_EXTRNJRO',
'             , :P139_INDCDOR_USA_MXTO',
'             , nvl(:P141_INDCDOR_LDCCION_ADCNAL,''N'')',
'             , nvl(:P139_INDCDOR_CNTRTO_GSLNA,''N'')',
'             , :P141_INDCDOR_EXNCION',
'             , :P141_CDGO_RNTA_ESTDO',
'          into :P184_IDNTFCCION_SJTO_FRMTDA',
'             , :P184_UBCCION',
'             , :P184_DRCCION',
'             , :P184_CDGO_SJTO_TPO',
'             , :P184_NMBRE_RZON_SCIAL',
'             , :P184_ID_IMPSTO_SBMPSTO',
'             , :P184_ID_IMPSTO_ACTO',
'             , :P184_ID_IMPSTO_ASCDA',
'             , :P184_TXTO_ASCDA',
'             , :P184_FCHA_EXPDCION',
'             , :P184_FCHA_VNCMNTO',
'             , :P184_TXTO_BSE',
'             , :P184_BSE',
'             , :P184_INDCDOR_EXTRNJRO',
'             , :P184_INDCDOR_MXTO',
'             , :P184_INDCDOR_LDCCION_ADCNAL',
'             , :P184_INDCDOR_CNTRTO_GSLNA',
'             , :P184_INDCDOR_EXNCION',
'             , :P184_CDGO_RNTA_ESTDO',
'           from V_SI_I_SUJETOS_IMPUESTO    a',
'           join si_i_personas              b on a.id_sjto_impsto = b.id_sjto_impsto',
'          where a.id_sjto_impsto           = (select max(id_sjto_impsto) from si_i_sujetos_impuesto where id_sjto = :P138_ID_SJTO) ;',
'    else',
'        :P184_IDNTFCCION_SJTO_FRMTDA    := null;',
'        :P184_UBCCION                   := null;',
'        :P184_DRCCION                   := null;',
'        :P184_CDGO_SJTO_TPO             := null;',
'        :P184_NMBRE_RZON_SCIAL          := null;',
'        :P184_ID_IMPSTO_SBMPSTO         := null;',
'        :P184_ID_IMPSTO_ACTO            := null;',
'        :P184_FCHA_EXPDCION             := null;',
'        :P184_BSE                       := null;',
'        :P184_INDCDOR_EXTRNJRO          := null;',
'        :P184_INDCDOR_MXTO              := null;',
'        :P184_CDGO_RNTA_ESTDO           := null;',
'    end if;',
'exception',
'    when others then',
'        :P184_IDNTFCCION_SJTO_FRMTDA    := null;',
'        :P184_UBCCION                   := null;',
'        :P184_DRCCION                   := null;',
'        :P184_CDGO_SJTO_TPO             := null;',
'        :P184_NMBRE_RZON_SCIAL          := null;',
'        :P184_ID_IMPSTO_SBMPSTO         := null;',
'        :P184_ID_IMPSTO_ACTO            := null;',
'        :P184_FCHA_EXPDCION             := null;',
'        :P184_BSE                       := null;',
'        :P184_INDCDOR_EXTRNJRO          := null;',
'        :P184_INDCDOR_MXTO              := null;',
'        :P184_CDGO_RNTA_ESTDO           := null;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(100699203036063550)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consulta de Informaci\00F3n de liquidaciones anteriores')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select nvl(count(id_rnta),0) ',
'         , to_char(nvl(sum(vlor_bse_grvble),0) , ''999G999G999G999G990'')',
'         , to_char(nvl(sum(vlor_bse_grvble),0)  + to_number(:P141_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'') , ''999G999G999G999G990'')',
'     into :P184_NMRO_LQDCION_ANTRIOR',
'        , :P184_TTAL_LQDCION_ANTRIOR',
'        , :P184_NVA_BSE',
'     from v_gi_g_rentas',
'    where id_rnta                 = (select id_rnta from json_table(:P141_ID_RNTA_ANTRIOR,''$[*]''columns id_rnta path ''$.ID_RNTA''))',
'      or id_rnta_antrior          = (select id_rnta from json_table(:P141_ID_RNTA_ANTRIOR,''$[*]''columns id_rnta path ''$.ID_RNTA''))',
'      and cdgo_rnta_estdo         in (''LQD'', ''APB'')',
'      and cdgo_mvnt_fncro_estdo    = ''NO'';',
'exception ',
'    when others then ',
'        :P184_NMRO_LQDCION_ANTRIOR  := 0;',
'        :P184_TTAL_LQDCION_ANTRIOR  := 0;',
'        :P184_NVA_BSE  := 0;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P184_INDCDOR_LDCCION_ADCNAL'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'S'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(100700827744063554)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consular de Reporte de Recibo de Rentas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.id_rprte',
'      into :P184_ID_RPRTE',
'      from gn_d_reportes   a',
'       join gn_d_reporte_cliente    b on a.id_rprte = b.id_rprte',
'       and cdgo_clnte              = :F_CDGO_CLNTE',
'     where cdgo_rprte_grpo = ''RRV'' ',
'       and a.indcdor_gnrco = ''N'';',
'exception',
'    when no_data_found then ',
'        begin ',
'            select a.id_rprte',
'              into :P184_ID_RPRTE',
'              from gn_d_reportes   a',
'             where cdgo_rprte_grpo = ''RRV'' ',
'               and a.indcdor_gnrco = ''S''',
'               and rownum = 1;',
'         exception',
'             when others then ',
'                :P184_ID_RPRTE := NULL;',
'         end;',
'    when others then ',
'        :P184_ID_RPRTE := NULL;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(100699632995063550)
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
'                                                                     p_id_usrio          => :F_ID_USRIO,',
'                                                                     o_id_sjto_impsto    => :P200_ID_IMPSTO_SBMPSTO,',
'                                                                     o_cdgo_rspsta		 => v_cdgo_rspsta,',
'                                                                     o_mnsje_rspsta		 => v_mnsje_rspsta);',
'            ',
'            if v_cdgo_rspsta <> 0 then',
unistr('                :P184_RSPSTA := ''\00A1Error al Registrar el Sujeto!'';'),
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
'    if :P200_ID_IMPSTO_SBMPSTO is not null and :P200_ID_IMPSTO_SBMPSTO > 0 then',
unistr('        -- Registro de la proyecci\00F3n de rentas'),
'        pkg_gi_rentas.prc_re_liquidacion_renta (p_cdgo_clnte                => :F_CDGO_CLNTE',
'                                              , p_id_impsto                 => :P200_ID_IMPSTO',
'                                              , p_id_impsto_sbmpsto         => :P200_ID_IMPSTO_SBMPSTO',
'                                              , p_id_sjto_impsto            => :P200_ID_SJTO_IMPSTO',
'                                              , p_json_impsto_acto_cncpto   => :P184_CNCPTOS',
'                                              , p_id_sbmpsto_ascda          => :P201_ID_SBMPSTO_ASCDA',
'                                              , p_txto_ascda                => :P201_TXTO_ASCDA',
'                                              , p_fcha_expdcion             => nvl(:P202_FCHA_EXPDCION, sysdate)',
'                                              , p_vlor_bse_grvble           => to_number(:P202_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'                                              , p_indcdor_usa_extrnjro      => nvl(:P201_INDCDOR_EXTRNJRO,nvl(:P200_INDCDOR_USA_EXTRNJRO,''N''))',
'                                              , p_indcdor_usa_mxto          => nvl(:P201_INDCDOR_MXTO,nvl(:P200_INDCDOR_USA_MXTO,''N''))',
'                                              , p_fcha_vncmnto_dcmnto       => :P202_FCHA_VNCMNTO',
'                                              , p_id_usrio                  => :F_ID_USARIO',
'                                              , p_entrno                    => ''PBLCO''',
'                                              , p_id_rnta                   => :P184_ID_RNTA',
'                                              , o_id_dcmnto                 => :P184_ID_DCMNTO',
'                                              , o_nmro_dcmnto               => :P184_NMRO_DCMNTO',
'                                              , o_cdgo_rspsta               => v_cdgo_rspsta',
'                                              , o_mnsje_rspsta              => v_mnsje_rspsta',
'                                             );',
'',
'',
'        if v_cdgo_rspsta = 0 then',
unistr('            :P184_RSPSTA := ''\00A1Liquidaci\00F3n Generada Satisfactoriamente!'';'),
'            apex_json.open_object;',
'            apex_json.write(''type'', ''OK'');    ',
unistr('            apex_json.write(''nmbre_rprte'', ''Liquidaci\00F3n de Renta N '' || :P184_NMRO_DCMNTO);    '),
'            apex_json.close_object;',
'        else',
'            :P184_RSPSTA := ''Error al Liquidar'' || v_mnsje_rspsta;',
'            apex_json.open_object;',
'            apex_json.write(''type'', ''ERROR'');',
'            apex_json.write(''msg'', ''Error al Liquidar. '' || v_mnsje_rspsta);        ',
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
end;
/
