prompt --application/pages/page_00136
begin
wwv_flow_api.create_page(
 p_id=>136
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Detalle de Liquidaci\00F3n de Rentas Varias - Consulta')
,p_step_title=>unistr('Detalle de Liquidaci\00F3n de Rentas Varias - Consulta')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IG-controlsContainer {',
'    display: none;',
'}',
'',
'.btn_rechazar_exencion{',
'    background-color: #f17d7d;',
'}'))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'NCARRASQUILLA'
,p_last_upd_yyyymmddhh24miss=>'20201207162102'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5614721431742810)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(99830849217613475)
,p_plug_name=>'Ayuda'
,p_parent_plug_id=>wwv_flow_api.id(5614721431742810)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>70
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	<br>',
'	<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'	<i>',
'	Esta funcionalidad permite<br><br>',
unistr('		<b>1.</b> Aprobar y/o Rechazar las solicitudes de liquidaci\00F3n de rentas varias.<br><br>'),
'		<b>2.</b> Aprobar y/o Rechazar las solicitudes de exenciones de rentas varias.<br><br>			',
'		<b>3.</b> Consultar las preliquidaciones de rentas varias.<br><br>',
unistr('			<b>4.</b> Modificar las preliquidaciones de rentas varias, siempre y cuando no exista una liquidaci\00F3n oficial.<br><br>'),
unistr('		<p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'	</i> ',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(27239321543623019)
,p_plug_name=>'Tab Selector'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(27238758538623013)
,p_plug_name=>'Adjuntos'
,p_parent_plug_id=>wwv_flow_api.id(27239321543623019)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select id_rnta_adjnto',
'        , id_sbmpto_adjnto_tpo        ',
'        , (select dscrpcion',
'             from table (pkg_gi_rentas.fnc_tipos_adjunto (p_cdgo_clnte          => :F_CDGO_CLNTE,',
'                                                          p_id_impsto           => :P89_ID_IMPSTO,',
'                                                          p_id_impsto_sbmpsto   => :P136_ID_IMPSTO_SBMPSTO,',
'                                                          p_id_impsto_acto      => :P136_ID_IMPSTO_ACTO ))',
'            where id_adjnto_tpo = a.id_sbmpto_adjnto_tpo ) dscrpcion ',
'        , file_name',
'        , obsrvcion',
'        , 1 descargar',
'        , 2 ver',
'     from gi_g_rentas_adjnto     a',
'    where id_rnta                = :P136_ID_RNTA'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'     from gi_g_rentas_adjnto     a',
'    where id_rnta                = :P136_ID_RNTA'))
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
 p_id=>wwv_flow_api.id(27238856207623014)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>27238856207623014
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96756622541114814)
,p_db_column_name=>'ID_RNTA_ADJNTO'
,p_display_order=>10
,p_column_identifier=>'K'
,p_column_label=>'Id Rnta Adjnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96756792908114815)
,p_db_column_name=>'ID_SBMPTO_ADJNTO_TPO'
,p_display_order=>20
,p_column_identifier=>'L'
,p_column_label=>'Id Sbmpto Adjnto Tpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96756888321114816)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>30
,p_column_identifier=>'M'
,p_column_label=>'Tipos de Adjunto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96756976730114817)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>40
,p_column_identifier=>'N'
,p_column_label=>'Adjunto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96757083681114818)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>50
,p_column_identifier=>'O'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96757160375114819)
,p_db_column_name=>'DESCARGAR'
,p_display_order=>60
,p_column_identifier=>'P'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'DOWNLOAD:GI_G_RENTAS_ADJNTO:FILE_BLOB:ID_RNTA_ADJNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class=" fa fa-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96757233368114820)
,p_db_column_name=>'VER'
,p_display_order=>70
,p_column_identifier=>'Q'
,p_column_label=>'Ver'
,p_column_link=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_CLAVE_PRIMARIA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_VALOR:GI_G_RENTAS_ADJNTO,ID_RNTA_ADJNTO,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,#ID_RNTA_ADJNTO#'
,p_column_linktext=>'<center><span class=" fa fa-eye fa-1x fa-spin"></span></center>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(27265503219153068)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'56547'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>':ID_RNTA_ADJNTO:ID_SBMPTO_ADJNTO_TPO:DSCRPCION:FILE_NAME:OBSRVCION:DESCARGAR:VER'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(27239493448623020)
,p_plug_name=>'Conceptos'
,p_parent_plug_id=>wwv_flow_api.id(27239321543623019)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select distinct ''['' || d.cdgo_cncpto || ''] '' || d.dscrpcion_cncpto dscrpcion_cncpto',
'        , a.vlor_lqddo',
'        , a.vlor_intres',
'        , a.vlor_lqddo + a.vlor_intres vlor_ttal',
'        , a.fcha_vncmnto',
'        , a.txto_trfa',
'     from gi_g_rentas_acto_concepto         a',
'     join gi_g_rentas_acto                  b on a.id_rnta_acto     = b.id_rnta_acto',
'     join gi_g_rentas                       c on b.id_rnta          = c.id_rnta',
'     join v_df_i_impuestos_acto_concepto    d on a.id_impsto_acto_cncpto    = d.id_impsto_acto_cncpto',
'    where c.id_rnta                         = :P136_ID_RNTA;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(22042904131266984)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Interes'
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
 p_id=>wwv_flow_api.id(27239884347623024)
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
 p_id=>wwv_flow_api.id(27240016250623026)
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
 p_id=>wwv_flow_api.id(27240252321623028)
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
 p_id=>wwv_flow_api.id(27240362420623029)
,p_name=>'FCHA_VNCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_VNCMNTO'
,p_data_type=>'TIMESTAMP'
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
 p_id=>wwv_flow_api.id(27240584183623031)
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
,p_is_required=>true
,p_max_length=>20
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
 p_id=>wwv_flow_api.id(27239711318623022)
,p_internal_uid=>27239711318623022
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
 p_id=>wwv_flow_api.id(27279836998238389)
,p_interactive_grid_id=>wwv_flow_api.id(27239711318623022)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(27279985350238389)
,p_report_id=>wwv_flow_api.id(27279836998238389)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22152448165294307)
,p_view_id=>wwv_flow_api.id(27279985350238389)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(22042904131266984)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(27280926478238403)
,p_view_id=>wwv_flow_api.id(27279985350238389)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(27239884347623024)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>432
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(27281982287238407)
,p_view_id=>wwv_flow_api.id(27279985350238389)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(27240016250623026)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(27282998675238410)
,p_view_id=>wwv_flow_api.id(27279985350238389)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(27240252321623028)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(27283470403238412)
,p_view_id=>wwv_flow_api.id(27279985350238389)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(27240362420623029)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(27284498638238415)
,p_view_id=>wwv_flow_api.id(27279985350238389)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(27240584183623031)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(114771000010)
,p_view_id=>wwv_flow_api.id(27279985350238389)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(27240252321623028)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(213934000602)
,p_view_id=>wwv_flow_api.id(27279985350238389)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(27240016250623026)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(231284000916)
,p_view_id=>wwv_flow_api.id(27279985350238389)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(22042904131266984)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(77074120142293006)
,p_plug_name=>'Liquidaciones Anteriores'
,p_parent_plug_id=>wwv_flow_api.id(27239321543623019)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1 ver',
'        , a.nmro_rnta',
'        , trunc(a.fcha_rgstro) fcha_rgstro',
'        , a.dscrpcion_ascda || '': '' || a.txto_ascda ascda',
'        , a.vlor_bse_grvble',
'        , a.fcha_expdcion',
'        , case ',
'            when a.id_rnta_antrior is not null then',
unistr('                ''S\00ED'''),
'            else',
'                ''No''',
'            end as indcdor_lqdcion_antrior',
'        , b.vlor_ttal',
'        , a.id_lqdcion',
'     from v_gi_g_rentas                 a',
'     join ( select a.id_rnta',
'                 , sum(d.vlor_dbe - d.vlor_hber) vlor_ttal',
'              from v_gi_g_rentas                 a',
'              join gi_g_liquidaciones            b on a.id_lqdcion       = b.id_lqdcion',
'              join gf_g_movimientos_financiero   c on b.id_lqdcion       = c.id_orgen',
'               and c.cdgo_mvnt_fncro_estdo       = ''NO''',
'              join gf_g_movimientos_detalle      d on c.id_mvmnto_fncro  = d.id_mvmnto_fncro',
'               and d.cdgo_mvmnto_tpo             not in (''PC'', ''PI'')',
'          group by a.id_rnta  )                  b on a.id_rnta     = b.id_rnta',
'    where (a.id_rnta                             = :P136_ID_RNTA_ANTRIOR    ',
'       or a.id_rnta_antrior                      = :P136_ID_RNTA_ANTRIOR)',
'      and a.cdgo_rnta_estdo                      in (''APB'', ''LQD'')',
'       and a.id_rnta                             != :P136_ID_RNTA',
' order by a.id_lqdcion'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P136_INDCDOR_LQDCCION_ADCNAL'
,p_plug_display_when_cond2=>unistr('S\00ED')
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
 p_id=>wwv_flow_api.id(77074216769293007)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>77074216769293007
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4256597927589343)
,p_db_column_name=>'NMRO_RNTA'
,p_display_order=>10
,p_column_identifier=>'I'
,p_column_label=>unistr('N\00B0 Liquidaci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77074471384293009)
,p_db_column_name=>'FCHA_RGSTRO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Fecha de Registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77074554111293010)
,p_db_column_name=>'ASCDA'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Asociada'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77074641240293011)
,p_db_column_name=>'VLOR_BSE_GRVBLE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Base Gravable'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77074722635293012)
,p_db_column_name=>'FCHA_EXPDCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Fecha de Expedici\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77074895807293013)
,p_db_column_name=>'INDCDOR_LQDCION_ANTRIOR'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('\00BFLiquidaci\00F3n Adicional?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77074923611293014)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Valor Pagado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77075154138293016)
,p_db_column_name=>'VER'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Ver'
,p_column_link=>'f?p=140000:4:&SESSION.::&DEBUG.:RP,4:P4_ID_LQDCION:#ID_LQDCION#'
,p_column_linktext=>'<span aria-hidden="true" class="fa fa-eye" style="color: blue;" ></span>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4619541312961001)
,p_db_column_name=>'ID_LQDCION'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>'Id Lqdcion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(78017102104702135)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'780172'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VER:FCHA_RGSTRO:ASCDA:VLOR_BSE_GRVBLE:FCHA_EXPDCION:INDCDOR_LQDCION_ANTRIOR:VLOR_TTAL::NMRO_RNTA:ID_LQDCION'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(79562680666385535)
,p_plug_name=>'Exenciones'
,p_parent_plug_id=>wwv_flow_api.id(27239321543623019)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P136_INDCDOR_EXNCION'
,p_plug_display_when_cond2=>'S'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80928567522670817)
,p_plug_name=>'<b>Motivos</b>'
,p_parent_plug_id=>wwv_flow_api.id(79562680666385535)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'V_GF_G_EXENCIONES_SLCTUD_MTVO'
,p_query_where=>'ID_EXNCION_SLCTUD = :P136_ID_EXNCION_SLCTUD'
,p_query_order_by=>'MTVO'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P136_ID_EXNCION_SLCTUD'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>'select * from V_GF_G_EXENCIONES_SLCTUD_MTVO where ID_EXNCION_SLCTUD = :P136_ID_EXNCION_SLCTUD'
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
 p_id=>wwv_flow_api.id(80928609637670818)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'JPRADA'
,p_internal_uid=>80928609637670818
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80928764270670819)
,p_db_column_name=>'ID_EXNCION_SLCTUD_MTVO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Exncion Slctud Mtvo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80928824627670820)
,p_db_column_name=>'ID_EXNCION_SLCTUD'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Exncion Slctud'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80928910100670821)
,p_db_column_name=>'ID_EXNCION_MTVO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Exncion Mtvo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80929049385670822)
,p_db_column_name=>'NMTCNCO_MTVO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('C\00F3digo')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80929108346670823)
,p_db_column_name=>'MTVO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Motivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80929279871670824)
,p_db_column_name=>'ID_DCRTO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Id Dcrto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80929390580670825)
,p_db_column_name=>'NMRO_DCRTO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Nmro Dcrto'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80929436054670826)
,p_db_column_name=>'DSCRPCION_DCRTO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Decreto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80929515714670827)
,p_db_column_name=>'NMTCNCO_DCRTO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('Exenci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(81737023219566271)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'817371'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_EXNCION_SLCTUD_MTVO:ID_EXNCION_SLCTUD:ID_EXNCION_MTVO:NMTCNCO_MTVO:MTVO:ID_DCRTO:NMRO_DCRTO:DSCRPCION_DCRTO:NMTCNCO_DCRTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80929692198670828)
,p_plug_name=>'<b>Conceptos</b>'
,p_parent_plug_id=>wwv_flow_api.id(79562680666385535)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.dscrpcion_cncpto ',
'        , a.vlor_cncpto',
'        , a.prcntje_exncion',
'        , a.vlor_exnto',
'        , a.vlor_cncpto - a.vlor_exnto vlor_ttal',
'     from v_gf_g_exncnes_slctud_dtlle   a',
'    where id_exncion_slctud             = :P136_ID_EXNCION_SLCTUD;'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P136_ID_EXNCION_SLCTUD'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select *',
'     from v_gf_g_exncnes_slctud_dtlle   a',
'    where id_exncion_slctud             = :P136_ID_EXNCION_SLCTUD;'))
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
 p_id=>wwv_flow_api.id(80929751252670829)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JPRADA'
,p_internal_uid=>80929751252670829
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80929889391670830)
,p_db_column_name=>'DSCRPCION_CNCPTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80929928287670831)
,p_db_column_name=>'VLOR_CNCPTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Valor concepto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
end;
/
begin
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80930085386670832)
,p_db_column_name=>'PRCNTJE_EXNCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('% Exenci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80930144225670833)
,p_db_column_name=>'VLOR_EXNTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Valor Exento'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80930227277670834)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Valor a Pagar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(81742521773620394)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'817426'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_CNCPTO:VLOR_CNCPTO:PRCNTJE_EXNCION:VLOR_EXNTO:'
,p_sum_columns_on_break=>'VLOR_EXNTO:VLOR_CNCPTO:VLOR_TTAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86478998439177204)
,p_plug_name=>'Trazabilidad'
,p_parent_plug_id=>wwv_flow_api.id(27239321543623019)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select to_char(a.fcha, ''DD/MM/YYYY HH:MI AM'') fcha',
'        , a.nmbre_trcro',
'        , a.estdo',
'        , a.obsrvcion',
'     from v_gi_g_rentas_solicitud_traza    a',
'    where a.id_rnta                         = :P136_ID_RNTA',
' order by a.fcha'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P136_ID_RNTA'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'     from v_gi_g_rentas_solicitud_traza    a',
'    where id_rnta                          = :P136_ID_RNTA;'))
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
 p_id=>wwv_flow_api.id(86479072893177205)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>86479072893177205
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86479653694177211)
,p_db_column_name=>'FCHA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Fecha'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86479775763177212)
,p_db_column_name=>'NMBRE_TRCRO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Usuario'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86479807735177213)
,p_db_column_name=>'ESTDO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Estados'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86480060601177215)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(86559089420050990)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'865591'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'FCHA:NMBRE_TRCRO:ESTDO:OBSRVCION'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(84146034981539701)
,p_plug_name=>'Flujo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'F_ID_INSTNCIA_FLJO'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'false'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(101132629144999089)
,p_plug_name=>unistr('<b>Liquidaci\00F3n N\00B0 &P136_NMRO_RNTA. [ &P136_DSCRPCION_RNTA_ESTDO. ]</b>')
,p_region_name=>'informacion_basica'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5658644788888922)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(5614721431742810)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:135:&SESSION.::&DEBUG.:RP,136::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5615137105742814)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5614721431742810)
,p_button_name=>'BTN_EDITAR_SOLICITUD'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Editar Solicitud'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:138:&SESSION.::&DEBUG.:RP,138,139,141,142,143:P138_ID_RNTA,P138_BRANCH:&P136_ID_RNTA.,&APP_PAGE_ID.'
,p_button_condition=>'P136_CDGO_RNTA_ESTDO'
,p_button_condition2=>'RGS'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-edit'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5614899568742811)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(5614721431742810)
,p_button_name=>'BTN_APROBAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Aprobar Solicitud'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    (:P136_CDGO_RNTA_ESTDO in (''RGS'',''RVS''))',
'and (',
'        (:P136_INDCDOR_EXNCION = ''N'')',
'     or (:P136_INDCDOR_EXNCION = ''S'' and :P136_CDGO_EXNCION_ESTDO in (''RGS'', ''RCH'') )',
'    )'))
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(79562436799385533)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(5614721431742810)
,p_button_name=>'BTN_RECHAZAR_EXENCION'
,p_button_static_id=>'btn_rechazar_exencion'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>unistr('<b>Rechazar Exenci\00F3n</b>')
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:134:&SESSION.::&DEBUG.:RP,134::'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'        :P136_CDGO_EXNCION_ESTDO     = ''RGS'' ',
'    and :P136_INDCDOR_EXNCION        = ''S''  ',
'    and :P136_CDGO_RNTA_ESTDO        in(''RGS'',''RVS'')'))
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-window-close-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5614965701742812)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(5614721431742810)
,p_button_name=>'BTN_RECHAZAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Rechazar Solicitud'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:137:&SESSION.::&DEBUG.:RP,137::'
,p_button_condition=>':P136_CDGO_RNTA_ESTDO in (''RGS'',''RVS'')'
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-remove'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(84231074697878802)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(5614721431742810)
,p_button_name=>'BTN_FIRMAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>unistr('Firmar Exenci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿Esta seguro de firmar estÃ¡ solicitud?'',''BTN_FIRMAR'');'
,p_button_condition=>':P136_CDGO_RNTA_ESTDO = ''PYT'''
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(84230978708878801)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(5614721431742810)
,p_button_name=>'BTN_REVERSAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Reversar Solicitud'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition=>'    :P136_CDGO_RNTA_ESTDO = ''PYT'''
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-remove'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5616674479742829)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(5614721431742810)
,p_button_name=>'BTN_IMPRIMIR_RECIBO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>unistr('Imprimir Liquidaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P136_CDGO_RNTA_ESTDO = ''APB'' ',
'and :F_ID_DCMNTO is not null'))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4252633912589304)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_api.id(5614721431742810)
,p_button_name=>'BTN_IMPRIMIR_RECIBO_EXENCION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Imprimir Recibo Exenci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    :P136_INDCDOR_EXNCION        = ''S'' ',
'and :P136_CDGO_EXNCION_ESTDO     = ''APB''',
'and :P136_INDCDOR_PAGO_APLCDO    = ''N'''))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(84348268818070353)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_api.id(5614721431742810)
,p_button_name=>'BTN_VER_ACTO'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>unistr('Ver Certificado de Exenci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_CLAVE_PRIMARIA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_VALOR:V_GN_G_ACTOS,ID_ACTO,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,&P136_ID_ACTO.'
,p_button_condition=>'P136_INDCDOR_PAGO_APLCDO'
,p_button_condition2=>'S'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4252880905589306)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_api.id(5614721431742810)
,p_button_name=>'BTN_GENERAR_CERTIFICADO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'GENERAR CERTIFICADO'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition=>'P136_INDCDOR_PAGO_APLCDO'
,p_button_condition2=>'S'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(100017418293164411)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_api.id(5614721431742810)
,p_button_name=>'BTN_DENEGAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Denegar Solicitud'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:187:&SESSION.::&DEBUG.:RP,187::'
,p_button_condition=>':P136_CDGO_RNTA_ESTDO in (''RGS'',''RVS'',''DNG'')'
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-remove'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5616580651742828)
,p_branch_name=>'Imprimir Documento'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_NMBRE_RPRTE,P2_PRMTRO_1,P2_PRMTRO_2:&P136_ID_RPRTE.,Liquidacion_&P136_NMRO_RNTA.,&P136_ID_RNTA.,&F_ID_DCMNTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5616674479742829)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4252749380589305)
,p_branch_name=>unistr('Imprimir Documento Exenci\00F3n')
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_PRMTRO_1,P2_NMBRE_RPRTE,P2_PRMTRO_2:&P136_ID_RPRTE.,&P136_ID_RNTA.,Documento_ExenciÃ³n_&P136_NMRO_DCMNTO_EXNCION.,&P136_ID_DCMNTO_EXNCION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4252633912589304)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(83210662902346807)
,p_branch_name=>unistr('Ir a la pagina de Exenci\00F3n')
,p_branch_action=>'f?p=&APP_ID.:144:&SESSION.::&DEBUG.:RP,144:P144_ID_EXNCION_SLCTUD,P144_ID_IMPSTO_SBMPSTO:&P136_ID_EXNCION_SLCTUD.,&P136_ID_IMPSTO_SBMPSTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5614899568742811)
,p_branch_sequence=>10
,p_branch_condition_type=>'SQL_EXPRESSION'
,p_branch_condition=>':P136_INDCDOR_EXNCION = ''S'' and :P136_CDGO_EXNCION_ESTDO = ''RGS'''
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(86478759877177202)
,p_branch_name=>unistr('Ir a la P\00E1gina de Reversa')
,p_branch_action=>'f?p=&APP_ID.:147:&SESSION.::&DEBUG.:RP,147::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(84230978708878801)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5616831916742831)
,p_name=>'P136_CDGO_RNTA_ESTDO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(101132629144999089)
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5617280236742835)
,p_name=>'P136_TXTO_ASCDA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(101132629144999089)
,p_prompt=>'Asociada'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>10
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5659024304888926)
,p_name=>'P136_IDNTFCCION_SJTO_FRMTDA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(101132629144999089)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5659419469888929)
,p_name=>'P136_UBCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(101132629144999089)
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
 p_id=>wwv_flow_api.id(5659898318888930)
,p_name=>'P136_DRCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(101132629144999089)
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
 p_id=>wwv_flow_api.id(5660273735888930)
,p_name=>'P136_NMBRE_RZON_SCIAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(101132629144999089)
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
 p_id=>wwv_flow_api.id(5660672899888930)
,p_name=>'P136_CDGO_SJTO_TPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(101132629144999089)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5661098215888931)
,p_name=>'P136_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(101132629144999089)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select nmbre_impsto_sbmpsto          d ',
'        , id_impsto_sbmpsto             r       ',
'     from df_i_impuestos_subimpuesto    a',
'    where cdgo_clnte                    = :F_CDGO_CLNTE',
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
 p_id=>wwv_flow_api.id(5661445179888931)
,p_name=>'P136_ID_IMPSTO_ACTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(101132629144999089)
,p_prompt=>'Acto'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select nmbre_impsto_acto      d',
'        , id_impsto_acto         r',
'     from df_i_impuestos_acto    a',
' order by nmbre_impsto_acto',
'   '))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P136_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
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
 p_id=>wwv_flow_api.id(5661830570888931)
,p_name=>'P136_FCHA_EXPDCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(101132629144999089)
,p_prompt=>unistr('Fecha de Suscripci\00F3n')
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5662290594888931)
,p_name=>'P136_BSE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(101132629144999089)
,p_prompt=>'&P136_TXTO_BSE.'
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
 p_id=>wwv_flow_api.id(5662627424888932)
,p_name=>'P136_INDCDOR_EXTRNJRO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(101132629144999089)
,p_prompt=>unistr('\00BFExtranjero?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(5646119019866897)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when=>'P136_INDCDOR_EXTRNJRO'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5663034492888932)
,p_name=>'P136_INDCDOR_MXTO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(101132629144999089)
,p_prompt=>unistr('\00BFMixto?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(5646119019866897)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_display_when=>'P136_INDCDOR_MXTO'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5663496751888934)
,p_name=>'P136_ID_RPRTE'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(101132629144999089)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5663899039888934)
,p_name=>'P136_RSPSTA'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(101132629144999089)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5664277415888940)
,p_name=>'P136_ID_RNTA'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(101132629144999089)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5664602431888940)
,p_name=>'P136_ID_LQDCION'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(101132629144999089)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5665009377888940)
,p_name=>'P136_ID_DCMNTO'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(101132629144999089)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5665431515888941)
,p_name=>'P136_NMRO_DCMNTO'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(101132629144999089)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77074083840293005)
,p_name=>'P136_INDCDOR_LQDCCION_ADCNAL'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(101132629144999089)
,p_prompt=>unistr('\00BFLiquidaci\00F3n Adicional?')
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
 p_id=>wwv_flow_api.id(77075014959293015)
,p_name=>'P136_ID_RNTA_ANTRIOR'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(101132629144999089)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77077023948293035)
,p_name=>'P136_FCHA_VNCMNTO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(101132629144999089)
,p_prompt=>'Fecha de Vencimiento'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P136_FCHA_VNCMNTO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77077180480293036)
,p_name=>'P136_INDCDOR_CNTRTO_GSLNA'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(101132629144999089)
,p_prompt=>unistr('\00BFContrato de Gasolina?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(5646119019866897)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_display_when=>'P136_INDCDOR_CNTRTO_GSLNA'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77077251656293037)
,p_name=>'P136_NMRO_LQDCION_ANTRIOR'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(101132629144999089)
,p_prompt=>unistr('N\00B0 Liquidaciones Anteriores')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>'P136_INDCDOR_LQDCCION_ADCNAL'
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
 p_id=>wwv_flow_api.id(77077311278293038)
,p_name=>'P136_TTAL_LQDCION_ANTRIOR'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(101132629144999089)
,p_prompt=>'Total Liquidaciones Anteriores'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P136_INDCDOR_LQDCCION_ADCNAL'
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
 p_id=>wwv_flow_api.id(77077402219293039)
,p_name=>'P136_NVA_BSE'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(101132629144999089)
,p_prompt=>'Nueva Base Gravable'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P136_INDCDOR_LQDCCION_ADCNAL'
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
 p_id=>wwv_flow_api.id(79562332683385532)
,p_name=>'P136_INDCDOR_EXNCION'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(101132629144999089)
,p_prompt=>unistr('\00BFSolicit\00F3 Exenci\00F3n?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(5646119019866897)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_display_when=>'P136_INDCDOR_EXNCION'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79562553677385534)
,p_name=>'P136_CDGO_EXNCION_ESTDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(79562680666385535)
,p_prompt=>unistr('Estado Exenci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_EXENCIONES_ESTADO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_exncion_estdo as r',
'  from gf_d_exenciones_estado',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79562722053385536)
,p_name=>'P136_ID_EXNCION_SLCTUD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(79562680666385535)
,p_prompt=>unistr('N\00B0 de solicitud de exenci\00F3n')
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
 p_id=>wwv_flow_api.id(79562882794385537)
,p_name=>'P136_USRIO_RGSTRA_EXNCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(79562680666385535)
,p_prompt=>'Usuario que registra'
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
 p_id=>wwv_flow_api.id(79562934273385538)
,p_name=>'P136_FCHA_RGSTRO_EXNCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(79562680666385535)
,p_prompt=>'Fecha de registro'
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
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79563076928385539)
,p_name=>'P136_ID_USRIO_RSPSTA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(79562680666385535)
,p_prompt=>'Usuario respuesta'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_USUARIOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trcro || ''['' || user_name || '']''  as d,',
'       id_usrio as r',
'  from v_sg_g_usuarios',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when=>'P136_CDGO_EXNCION_ESTDO'
,p_display_when2=>'APB'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79563187676385540)
,p_name=>'P136_FCHA_RSPSTA_EXNCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(79562680666385535)
,p_prompt=>'Fecha de respuesta'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P136_CDGO_EXNCION_ESTDO'
,p_display_when2=>'APB'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79563293400385541)
,p_name=>'P136_OBSRVCION_RCHZO_EXNCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(79562680666385535)
,p_prompt=>unistr('Observaci\00F3n del rechazo')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>'P136_CDGO_EXNCION_ESTDO'
,p_display_when2=>'RCH'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79655066108676120)
,p_name=>'P136_NMRO_RNTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(101132629144999089)
,p_source=>'P136_NRMO_RNTA'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80930499601670836)
,p_name=>'P136_NMRO_DCMNTO_EXNCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(79562680666385535)
,p_prompt=>unistr('N\00B0 Documento de Pago de Exenci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P136_CDGO_EXNCION_ESTDO'
,p_display_when2=>'APB'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80930569850670837)
,p_name=>'P136_INDCDOR_PAGO_APLCDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(79562680666385535)
,p_prompt=>unistr('\00BFDocumento Exenci\00F3n pagado?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(5646119019866897)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_display_when=>'P136_CDGO_EXNCION_ESTDO'
,p_display_when2=>'APB'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80930688338670838)
,p_name=>'P136_ID_DCMNTO_EXNCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(79562680666385535)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84146120725539702)
,p_name=>'P136_DSCRPCION_RNTA_ESTDO'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(101132629144999089)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84378971962588201)
,p_name=>'P136_ID_ACTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(79562680666385535)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86380412118043114)
,p_name=>'P136_TXTO_BSE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(101132629144999089)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(77078349287293048)
,p_validation_name=>'Validar Reporte'
,p_validation_sequence=>10
,p_validation=>'P136_ID_RPRTE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'No existe reporte parametrizado, por favor comuniquese con el administrador'
,p_when_button_pressed=>wwv_flow_api.id(5616674479742829)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5616375297742826)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Aprobar Solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(1000);',
'    v_id_dcmnto          number;',
'    v_nmro_dcmnto        number;',
'begin',
'    pkg_gi_rentas.prc_ap_solicitud_renta( p_cdgo_clnte          => :F_CDGO_CLNTE',
'                                        , p_id_rnta             => :P136_ID_RNTA',
'                                        , p_id_usrio            => :F_ID_USRIO',
'                                        , p_id_exncion_slctud   => :P136_ID_EXNCION_SLCTUD ',
'                                        , o_id_dcmnto           => v_id_dcmnto',
'                                        , o_nmro_dcmnto         => v_nmro_dcmnto',
'                                        , o_cdgo_rspsta         => v_cdgo_rspsta',
'                                        , o_mnsje_rspsta        => v_mnsje_rspsta);',
'',
'    if v_cdgo_rspsta = 0 then ',
'        :F_ID_DCMNTO         := v_id_dcmnto;',
'        :P136_NMRO_DCMNTO    := v_nmro_dcmnto;',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(5614899568742811)
,p_process_when=>'(:P136_INDCDOR_EXNCION = ''S'' and :P136_CDGO_EXNCION_ESTDO in (''RCH'', ''PYT'')) or :P136_INDCDOR_EXNCION = ''N'''
,p_process_when_type=>'SQL_EXPRESSION'
,p_process_success_message=>unistr('Aprobaci\00F3n de Solicitud Exitosa')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4252980377589307)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GENERAR CERTIFICADO'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_nl            number    := 6;',
'    v_id_acto        number;',
'    o_cdgo_rspsta    number;',
'    o_mnsje_rspsta   varchar2(1000);',
'begin ',
'    pkg_gf_exenciones.prc_gn_certificado_exencion(p_cdgo_clnte          => :F_CDGO_CLNTE',
'                                                , p_id_exncion_slctud   => :P136_ID_EXNCION_SLCTUD',
'                                                , p_id_plntlla          => 1',
'                                                , p_id_usrio            => :F_ID_USRIO',
'                                                , o_id_acto             => v_id_acto',
'                                                , o_cdgo_rspsta         => o_cdgo_rspsta',
'                                                , o_mnsje_rspsta        => o_mnsje_rspsta);',
'',
'    if o_cdgo_rspsta!= 0 then ',
'        o_cdgo_rspsta	:= 13;',
unistr('        o_mnsje_rspsta  := ''No. '' || o_cdgo_rspsta || '': Error al generar el cerfificado de la excenci\00F3n'';'),
'        pkg_sg_log.prc_rg_log( :F_CDGO_CLNTE, null, ''pkg_gf_exenciones.prc_gn_certificado_exencion'', v_nl, o_mnsje_rspsta, 1);',
'        rollback;',
'        return;	',
'    else',
unistr('        o_mnsje_rspsta  := ''generaci\00F3n del cerfificado exitoso. o_id_acto: '' || v_id_acto;'),
'        pkg_sg_log.prc_rg_log( :F_CDGO_CLNTE, null, ''pkg_gf_exenciones.prc_gn_certificado_exencion'', v_nl, o_mnsje_rspsta, 1);',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(4252880905589306)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(84242116486159401)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Firmar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(1000);',
'    v_id_dcmnto          number;',
'    v_nmro_dcmnto        number;',
'begin',
'    pkg_gi_rentas.prc_ap_solicitud_renta( p_cdgo_clnte          => :F_CDGO_CLNTE',
'                                        , p_id_rnta             => :P136_ID_RNTA',
'                                        , p_id_usrio            => :F_ID_USRIO',
'                                        , p_id_exncion_slctud   => :P136_ID_EXNCION_SLCTUD ',
'                                        , o_id_dcmnto           => v_id_dcmnto',
'                                        , o_nmro_dcmnto         => v_nmro_dcmnto',
'                                        , o_cdgo_rspsta         => v_cdgo_rspsta',
'                                        , o_mnsje_rspsta        => v_mnsje_rspsta);',
'',
'    if v_cdgo_rspsta = 0 then ',
'        :F_ID_DCMNTO         := v_id_dcmnto;',
'        :P136_NMRO_DCMNTO    := v_nmro_dcmnto;',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(84231074697878802)
,p_process_when=>'(:P136_INDCDOR_EXNCION = ''S'' and :P136_CDGO_RNTA_ESTDO =''PYT'')'
,p_process_when_type=>'SQL_EXPRESSION'
,p_process_success_message=>unistr('Aprobaci\00F3n de Solicitud Exitosa')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5665850213888941)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Informaci\00F3n de Rentas')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'   select a.idntfccion_sjto_frmtda',
'        , a.nmro_rnta',
'        , upper(b.nmbre_pais || '' '' || b.nmbre_dprtmnto || '' '' || b.nmbre_mncpio) ubccion',
'        , b.drccion',
'        , c.nmbre_rzon_scial',
'        , a.id_impsto_sbmpsto',
'        , d.id_impsto_acto',
'        , case when txto_ascda is not null then ',
'            a.dscrpcion_ascda || '': '' || a.txto_ascda ',
'          else',
'              ''--''',
'          end as txto_ascda',
'        , a.fcha_expdcion',
'        , trunc(a.fcha_vncmnto)',
'        , (select txto_bse_grvble',
'             from df_i_impuestos_acto m ',
'             join gi_g_rentas_acto    n on m.id_impsto_acto = n.id_impsto_acto',
'            where n.id_rnta           = a.id_rnta',
'            and rownum = 1) txto_bse_grvble',
'        , to_char(a.vlor_bse_grvble, :F_FRMTO_MNDA) vlor_bse_grvble',
'        , a.indcdor_usa_extrnjro',
'        , a.indcdor_usa_mxto',
'        , case ',
'            when a.id_rnta_antrior is not null then ',
unistr('                ''S\00ED'''),
'            else ',
'                ''No''',
'          end as indcdor_lqdcion_adcnal',
'        , a.id_rnta_antrior',
'        , a.indcdor_cntrto_gslna',
'        , a.cdgo_rnta_estdo',
'        , a.dscrpcion_rnta_estdo',
'        , a.id_dcmnto',
'        , a.indcdor_exncion',
'        , a.cdgo_exncion_estdo',
'        , a.id_exncion_slctud       ',
'		, a.usrio_rgstra_exncion		       ',
'		, a.fcha_rgstro_exncion			       ',
'		, a.id_usrio_rspsta       ',
'		, a.fcha_rspsta_exncion			       ',
'		, a.obsrvcion_rchzo_exncion		',
'        , a.id_instncia_fljo',
'        , a.id_fljo_trea',
'	into :P136_IDNTFCCION_SJTO_FRMTDA',
'        , :P136_NMRO_RNTA',
'        , :P136_UBCCION',
'        , :P136_DRCCION',
'        , :P136_NMBRE_RZON_SCIAL',
'        , :P136_ID_IMPSTO_SBMPSTO',
'        , :P136_ID_IMPSTO_ACTO',
'        , :P136_TXTO_ASCDA',
'        , :P136_FCHA_EXPDCION',
'        , :P136_FCHA_VNCMNTO',
'        , :P136_TXTO_BSE',
'        , :P136_BSE',
'        , :P136_INDCDOR_EXTRNJRO',
'        , :P136_INDCDOR_MXTO',
'        , :P136_INDCDOR_LQDCCION_ADCNAL',
'        , :P136_ID_RNTA_ANTRIOR',
'        , :P136_INDCDOR_CNTRTO_GSLNA',
'        , :P136_CDGO_RNTA_ESTDO',
'        , :P136_DSCRPCION_RNTA_ESTDO',
'        , :F_ID_DCMNTO',
'        , :P136_INDCDOR_EXNCION',
'        , :P136_CDGO_EXNCION_ESTDO',
'		, :P136_ID_EXNCION_SLCTUD   ',
'		, :P136_USRIO_RGSTRA_EXNCION		',
'		, :P136_FCHA_RGSTRO_EXNCION			',
'		, :P136_ID_USRIO_RSPSTA     ',
'		, :P136_FCHA_RSPSTA_EXNCION			',
'		, :P136_OBSRVCION_RCHZO_EXNCION		',
'        , :F_ID_INSTNCIA_FLJO',
'        , :F_ID_FLJO_TREA ',
'     from v_gi_g_rentas     a',
'     join v_si_i_sujetos_impuesto    b on a.id_sjto_impsto  = b.id_sjto_impsto',
'     join si_i_personas              c on b.id_sjto_impsto  = c.id_sjto_impsto',
'     join gi_g_rentas_acto           d on a.id_rnta         = d.id_rnta',
'    where a.id_rnta                  = :P136_ID_RNTA;',
'',
'exception',
'    when others then',
'        :P136_IDNTFCCION_SJTO_FRMTDA    := null;',
'        :P136_NMRO_RNTA                 := null;',
'        :P136_UBCCION                   := null;',
'        :P136_DRCCION                   := null;',
'        :P136_CDGO_SJTO_TPO             := null;',
'        :P136_ID_IMPSTO_SBMPSTO         := null;',
'        :P136_ID_IMPSTO_ACTO            := null;',
'        :P136_TXTO_ASCDA                := null;',
'        :P136_FCHA_EXPDCION             := null;',
'        :P136_FCHA_VNCMNTO              := null;',
'        :P136_BSE                       := null;',
'        :P136_INDCDOR_EXTRNJRO          := null;',
'        :P136_INDCDOR_MXTO              := null;',
'        :P136_INDCDOR_LQDCCION_ADCNAL   := null;',
'        :P136_ID_RNTA_ANTRIOR           := null;',
'        :P136_INDCDOR_CNTRTO_GSLNA      := null;   ',
'        :P136_CDGO_EXNCION_ESTDO        := null;',
'		:P136_ID_EXNCION_SLCTUD   		:= null;',
'		:P136_USRIO_RGSTRA_EXNCION	    := null;',
'		:P136_FCHA_RGSTRO_EXNCION		:= null;',
'		:P136_ID_USRIO_RSPSTA           := null;',
'		:P136_FCHA_RSPSTA_EXNCION		:= null;',
'		:P136_OBSRVCION_RCHZO_EXNCION   := null;',
'		',
'end;',
'',
' '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P136_ID_RNTA'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(79881903176484503)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta de Reporte de Recibo de Rentas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.id_rprte',
'      into :P136_ID_RPRTE',
'      from gn_d_reportes   a',
'       join gn_d_reporte_cliente    b on a.id_rprte = b.id_rprte',
'       and cdgo_clnte              = :F_CDGO_CLNTE',
'     where cdgo_rprte_grpo = ''RRV'' ',
'       and a.indcdor_gnrco = ''N'';',
'exception',
'    when no_data_found then ',
'       begin ',
'           select a.id_rprte',
'          into :P136_ID_RPRTE',
'          from gn_d_reportes   a',
'         where cdgo_rprte_grpo = ''RRV'' ',
'           and a.indcdor_gnrco = ''S''',
'           and rownum = 1;',
'       exception ',
'           when others then ',
'               null;',
'       end;',
'    when others then ',
'        :P136_ID_RPRTE := NULL;',
'end;'))
,p_process_error_message=>unistr('No se encontro parametrizaci\00F3n del reporte')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(80930302263670835)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Informacion de Exenci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'       select a.id_dcmnto',
'        , a.nmro_dcmnto',
'        , decode(a.indcdor_pgo_aplcdo, null, ''N'', a.indcdor_pgo_aplcdo) indcdor_pgo_aplcdo',
'        , a.id_acto',
'     into :P136_ID_DCMNTO_EXNCION',
'        , :P136_NMRO_DCMNTO_EXNCION',
'        , :P136_INDCDOR_PAGO_APLCDO',
'        , :P136_ID_ACTO',
'     from v_gf_g_exenciones_solicitud    a',
'    where a.id_exncion_slctud            = :P136_ID_EXNCION_SLCTUD;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P136_ID_EXNCION_SLCTUD'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
