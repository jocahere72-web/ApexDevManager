prompt --application/pages/page_00151
begin
wwv_flow_api.create_page(
 p_id=>151
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Registro Reversi\00F3n Acuerdo de Pago')
,p_step_title=>unistr('Registro Reversi\00F3n Acuerdo de Pago')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>'apex.item(''BTN_NVA_RVRSION'').hide();'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20201222102136'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(100339182180988701)
,p_plug_name=>'Workflow'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'false'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(221637173887203924)
,p_plug_name=>unistr('Registro Reversi\00F3n Acuerdo de Pago')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(116621471635027201)
,p_plug_name=>'Acuerdo de Pago'
,p_parent_plug_id=>wwv_flow_api.id(221637173887203924)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(417881919367882771)
,p_plug_name=>'<b>DATOS DEL ACUERDO DE PAGO </b>'
,p_region_name=>'DatosAcuerdoReversar'
,p_parent_plug_id=>wwv_flow_api.id(116621471635027201)
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.id_cnvnio,',
'          a.nmro_cnvnio,',
'          to_char(a.fcha_aplccion, ''DD/MM/YYYY'') fcha_aplccion,',
'          to_char(a.ttal_cnvnio, :F_FRMTO_MNDA) ttal_cnvnio,',
'          a.idntfccion_sjto_frmtda idntfccion_sjto,',
'          a.nmbre_slctnte,',
'          (select min(vgncia) from gf_g_convenios_cartera m where m.id_cnvnio = a.id_cnvnio) vgncia_mmna,',
'          (select max(vgncia) from gf_g_convenios_cartera m where m.id_cnvnio = a.id_cnvnio) vgncia_mxma,',
'          dscrpcion_cnvnio_estdo,',
'          cdgo_cnvnio_estdo',
'     from v_gf_g_convenios a',
'    where a.cdgo_clnte = :F_CDGO_CLNTE',
'     and  a.id_impsto = :P151_ID_IMPSTO',
'     and  a.id_impsto_sbmpsto = :P151_ID_IMPSTO_SBMPSTO',
'     and  a.id_sjto_impsto = :P151_ID_SJTO_IMPSTO  ',
'     and  a.cdgo_cnvnio_estdo = ''APL''',
'  --   and  a.id_cnvnio not in (select id_cnvnio from gf_g_convenios_revocatoria)'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'not exists (select a.id_cnvnio_rvrsion',
'           from gf_g_convenios_reversion a',
'           join v_gf_g_convenios b on a.id_cnvnio = b.id_cnvnio ',
'          where cdgo_cnvnio_rvrsion_estdo != ''RCH''--in (select cdgo_cnvnio_rvrsion_estdo from gf_d_convenios_rvrsion_estdo)',
'            and (a.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO',
'             or  (b.cdgo_clnte = :F_CDGO_CLNTE',
'            and   b.id_impsto = :P151_ID_IMPSTO',
'            and   b.id_impsto_sbmpsto = :P151_ID_IMPSTO_SBMPSTO',
'            and   b.id_sjto_impsto  = :P151_ID_SJTO_IMPSTO)))'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(34717415659147201)
,p_name=>'CDGO_CNVNIO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CNVNIO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
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
 p_id=>wwv_flow_api.id(116621871906027205)
,p_name=>'FCHA_APLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_APLCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Fecha <br> Aplicaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>10
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
 p_id=>wwv_flow_api.id(217250189882254573)
,p_name=>'ID_CNVNIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNVNIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(217250528241254577)
,p_name=>'NMRO_CNVNIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CNVNIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00FAmero <br> Acuerdo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
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
 p_id=>wwv_flow_api.id(217251106368254583)
,p_name=>'TTAL_CNVNIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TTAL_CNVNIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total <br>Acuerdo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
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
 p_id=>wwv_flow_api.id(217253023313254602)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(217253174461254603)
,p_name=>'NMBRE_SLCTNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_SLCTNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Solicitante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>404
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(217253286972254604)
,p_name=>'VGNCIA_MMNA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA_MMNA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Desde'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(217253344886254605)
,p_name=>'VGNCIA_MXMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA_MXMA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Hasta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(217253412760254606)
,p_name=>'DSCRPCION_CNVNIO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNVNIO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(217301988784802675)
,p_name=>'selector'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>120
,p_attribute_01=>'N'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(217250032413254572)
,p_internal_uid=>217250032413254572
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
' config.initialSelection = false;',
' return config;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(217256392925278440)
,p_interactive_grid_id=>wwv_flow_api.id(217250032413254572)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(217256494222278441)
,p_report_id=>wwv_flow_api.id(217256392925278440)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(34723469661147425)
,p_view_id=>wwv_flow_api.id(217256494222278441)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(34717415659147201)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116653706689196152)
,p_view_id=>wwv_flow_api.id(217256494222278441)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(116621871906027205)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(217256905797278444)
,p_view_id=>wwv_flow_api.id(217256494222278441)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(217250189882254573)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(217258943054278452)
,p_view_id=>wwv_flow_api.id(217256494222278441)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(217250528241254577)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(217261946861278460)
,p_view_id=>wwv_flow_api.id(217256494222278441)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(217251106368254583)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(217273856112404642)
,p_view_id=>wwv_flow_api.id(217256494222278441)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(217253023313254602)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(217274390252404644)
,p_view_id=>wwv_flow_api.id(217256494222278441)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(217253174461254603)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(217274819033404645)
,p_view_id=>wwv_flow_api.id(217256494222278441)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(217253286972254604)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(217275396567404646)
,p_view_id=>wwv_flow_api.id(217256494222278441)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(217253344886254605)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(217275850078404648)
,p_view_id=>wwv_flow_api.id(217256494222278441)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(217253412760254606)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(221128903731853124)
,p_plug_name=>'PQR'
,p_parent_plug_id=>wwv_flow_api.id(221637173887203924)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(175609831721986511)
,p_plug_name=>'<b>Documentos PQR</b>'
,p_parent_plug_id=>wwv_flow_api.id(221128903731853124)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.id_dcmnto,',
'        c.dscrpcion_dcmnto,',
'        a.file_name,',
'        a.obsrvcion,',
'        1 dscrgar',
'   from pq_g_documentos             a',
'   join v_pq_g_solicitudes          b on a.id_slctud = b.id_slctud',
'   join v_pq_d_motivos_documento    c on a.id_mtvo_dcmnto = c.id_mtvo_dcmnto',
'  where b.id_instncia_fljo_gnrdo = :F_ID_INSTNCIA_FLJO'))
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
 p_id=>wwv_flow_api.id(175609879814986512)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No se encontraron documentos'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>175609879814986512
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100550173920955118)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Dcmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100550473795955119)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100550811104955119)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100551294509955119)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100551667513955120)
,p_db_column_name=>'DSCRGAR'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTOS:FILE_BLOB:ID_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(175638978990062666)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1005520'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_DCMNTO:DSCRPCION_DCMNTO:FILE_NAME:OBSRVCION:DSCRGAR'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(224055706988567091)
,p_plug_name=>'<b>Sujeto Tributo</b>'
,p_parent_plug_id=>wwv_flow_api.id(221128903731853124)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:margin-top-md:margin-bottom-md:margin-left-md:margin-right-md'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(224423988736754924)
,p_plug_name=>unistr('<b>Informaci\00F3n Solicitante</b>')
,p_parent_plug_id=>wwv_flow_api.id(221128903731853124)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(389045124921956191)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'not exists ( select id_cnvnio_rvrsion',
'               from gf_g_convenios_reversion',
'              where cdgo_cnvnio_rvrsion_estdo in (select cdgo_cnvnio_rvrsion_estdo from gf_d_convenios_rvrsion_estdo)',
'                and id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO)'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(455570645879411920)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
'    Esta funcionalidad permite<br><br>',
unistr('    <b>1.</b> Visualizar los datos personales, documentos adjuntos e informaci\00F3n del tributo suministrada por el contribuyente en PQR.<br><br>'),
'    <b>2.</b> Seleccionar el acuerdo de pago que se pretende revertir.<br><br>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i> ',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(116659514031239243)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(389045124921956191)
,p_button_name=>'BTN_NVA_RVRSION'
,p_button_static_id=>'BTN_NVA_RVRSION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registro'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-window-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(33821082700607101)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(389045124921956191)
,p_button_name=>'BTN_NVO_RCHZO'
,p_button_static_id=>'BTN_NVO_RCHZO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Rechazo'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(94092834092685401)
,p_branch_name=>'Ir a gestion'
,p_branch_action=>'f?p=&APP_ID.:147:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26919965477631801)
,p_name=>'P151_PGNA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(224055706988567091)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100324578344939384)
,p_name=>'P151_ID_INSTNCIA_FLJO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(224055706988567091)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100325359086939384)
,p_name=>'P151_CDGO_SJTO_TPO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(224055706988567091)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100325700845939384)
,p_name=>'P151_ID_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(224055706988567091)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'Y'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100326113115939385)
,p_name=>'P151_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(224055706988567091)
,p_prompt=>'Sub-Tributo '
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IMPUESTO_SUBIMPUESTO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select upper(nmbre_impsto_sbmpsto)  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'Y'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100326514019939385)
,p_name=>'P151_IDNTFCCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(224055706988567091)
,p_prompt=>unistr('Identificaci\00F3n')
,p_source=>'P41_IDNTFCCION'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100326973769939385)
,p_name=>'P151_UBCCION_SJTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(224055706988567091)
,p_prompt=>unistr('Ubicaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100327363783939385)
,p_name=>'P151_DRCCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(224055706988567091)
,p_prompt=>unistr('Direcci\00F3n')
,p_source=>'P41_DRCCION'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100327709787939385)
,p_name=>'P151_ID_SJTO_IMPSTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(224055706988567091)
,p_source=>'P41_ID_SJTO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100328168462939387)
,p_name=>'P151_RSPSTA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(224055706988567091)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100328595787939387)
,p_name=>'P151_ID_PRYCCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(224055706988567091)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100329259334939387)
,p_name=>'P151_CDGO_IDNTFCION_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(224423988736754924)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_source=>'P42_TIPO_IDENTIFICACION'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100329664331939388)
,p_name=>'P151_NMRO_IDNTFCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(224423988736754924)
,p_prompt=>unistr('Identificaci\00F3n')
,p_source=>'P42_NMRO_IDNTFCCION'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100330013414939388)
,p_name=>'P151_NMBRE_CMPLTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(224423988736754924)
,p_prompt=>'Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100330499263939388)
,p_name=>'P151_DRCCION_NTFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(224423988736754924)
,p_prompt=>unistr('Direcci\00F3n Notificaci\00F3n')
,p_source=>'P42_DIRECCION'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100330898779939388)
,p_name=>'P151_UBCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(224423988736754924)
,p_prompt=>unistr('Ubicaci\00F3n')
,p_source=>'select upper (nmbre_pais || '' '' || nmbre_dprtmnto || '' ''|| nmbre_mncpio)ubccion from v_df_s_municipios where id_mncpio = :P42_ID_MNCPIO;'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100331214112939389)
,p_name=>'P151_TLFNO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(224423988736754924)
,p_prompt=>unistr('Tel\00E9fono')
,p_source=>'P42_TLFNO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
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
 p_id=>wwv_flow_api.id(100331692138939389)
,p_name=>'P151_CLLAR'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(224423988736754924)
,p_prompt=>'Celular'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100332032173939389)
,p_name=>'P151_EMAIL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(224423988736754924)
,p_prompt=>'Email'
,p_source=>'P42_EMAIL'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100332488791939389)
,p_name=>'P151_ID_SLCTNTE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(224423988736754924)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100332847957939390)
,p_name=>'P151_ID_SLCTUD'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(224423988736754924)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(116661593648268201)
,p_name=>'P151_ID_CNVNIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(116621471635027201)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(100359970257089802)
,p_computation_sequence=>10
,p_computation_item=>'P151_ID_INSTNCIA_FLJO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'F_ID_INSTNCIA_FLJO'
,p_compute_when=>'P151_ID_INSTNCIA_FLJO'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(116956459141838602)
,p_validation_name=>'Valida Exista Acuerdo Revertido'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from gf_g_convenios_reversion a ',
'  join ( select id_cnvnio',
'           from json_table (:P151_ID_CNVNIO, ''$[*]'' columns id_cnvnio path ''$.ID_CNVNIO'') ',
'          ) b on a.id_cnvnio = b.id_cnvnio',
'   where a.cdgo_cnvnio_rvrsion_estdo != ''RCH'''))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'Acuerdo de Pago Revertido Anteriormente.'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(116659514031239243)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(122509498268147301)
,p_validation_name=>unistr('Valida Selecci\00F3n Acuerdo')
,p_validation_sequence=>20
,p_validation=>'P151_ID_CNVNIO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione Acuerdo a Revertir'
,p_validation_condition=>'BTN_NVA_RVRSION,BTN_NVO_RCHZO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(116671796483601201)
,p_name=>'Al Seleccionar Registro'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(417881919367882771)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(116671847834601202)
,p_event_id=>wwv_flow_api.id(116671796483601201)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var records = this.data.selectedRecords;',
'    apex.item(''BTN_NVO_RCHZO'').hide();',
'    apex.item(''BTN_NVA_RVRSION'').hide();',
'',
'if(records.length > 0){',
'    var model = this.data.model;',
'    var estados = records.map(function(record){',
'        return model.getValue(record, ''CDGO_CNVNIO_ESTDO'');',
'    }).filter( function (obj, pos, record){',
'        return (record.indexOf(obj) === pos)',
'    });',
'    // valida que exista un unico estado seleccionado',
'    if(estados.length === 1){ ',
'        records = records.filter(function (record){',
'            return (model.getValue(record, ''CDGO_CNVNIO_ESTDO'') == ''APL'' || model.getValue(record, ''CDGO_CNVNIO_ESTDO'') == ''FNL'')',
'        });',
'',
'        var json = records.map(function (record){',
'            return {''ID_CNVNIO'': model.getValue(record, ''ID_CNVNIO'')};',
'        });',
'',
'        var finalizados = records.filter(function (record){',
'            return (model.getValue(record, ''CDGO_CNVNIO_ESTDO'') == ''FNL'');',
'        });',
'',
'        var aplicados = records.filter(function (record){',
'            return (model.getValue(record, ''CDGO_CNVNIO_ESTDO'') == ''APL'');',
'        });',
'        ',
'        if(json.length > 0){   ',
'            $s(''P151_ID_CNVNIO'', JSON.stringify(json));',
'            if (finalizados.length > 0){',
'                apex.item(''BTN_NVO_RCHZO'').show();',
'            }',
'            if(aplicados.length > 0) {',
'                apex.item(''BTN_NVA_RVRSION'').show();',
'            }',
'        }',
'        ',
'    }        ',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(116876185895016304)
,p_name=>'New'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(221128903731853124)
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(116876260576016305)
,p_event_id=>wwv_flow_api.id(116876185895016304)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(122239120941339501)
,p_name=>'Borrar Ruta Actual'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(116659514031239243)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(122239256929339502)
,p_event_id=>wwv_flow_api.id(122239120941339501)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'window.localStorage.removeItem(''wf_link'');',
'apex.submit(''REGISTRO'');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(34755864215602801)
,p_name=>unistr('Borrar Cach\00E9')
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(33821082700607101)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(34755995528602802)
,p_event_id=>wwv_flow_api.id(34755864215602801)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'window.localStorage.removeItem(''wf_link'');',
'apex.submit(''REGISTRO'');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(100371584124132002)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Recuperar Datos Solicitante y Sujeto Impuesto de PQR'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  b.id_slctnte,',
'            a.id_impsto,',
'            a.id_impsto_sbmpsto,',
'            b.id_slctud,',
'            b.cdgo_idntfccion_tpo,',
'            b.idntfccion,',
'            b.nmbre_slctnte,',
'            b.ubccion,',
'            b.drccion_ntfccion,',
'            b.tlfno,',
'            b.cllar,',
'            b.email,',
'            a.id_sjto_impsto,',
'            c.cdgo_sjto_tpo,',
'            pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => c.idntfccion_sjto , p_frmto => ''xx-xx-xxxx-xxxx-xxx'' , p_crcter_dlmtdor => ''-'' ) idntfccion_sjto,',
'            c.drccion,',
'            upper(c.nmbre_pais || ''-'' || c.nmbre_dprtmnto || ''-'' || c.nmbre_mncpio) ubccion_sjto',
'        into ',
'           :P151_ID_SLCTNTE,',
'           :P151_ID_IMPSTO,',
'           :P151_ID_IMPSTO_SBMPSTO,',
'           :P151_ID_SLCTUD,',
'           :P151_CDGO_IDNTFCION_TPO,',
'           :P151_NMRO_IDNTFCION,',
'           :P151_NMBRE_CMPLTO,',
'           :P151_UBCCION,',
'           :P151_DRCCION_NTFCCION,',
'           :P151_TLFNO,',
'           :P151_CLLAR,',
'           :P151_EMAIL,',
'           :P151_ID_SJTO_IMPSTO,',
'           :P151_CDGO_SJTO_TPO,',
'           :P151_IDNTFCCION,',
'           :P151_DRCCION,',
'           :P151_UBCCION_SJTO        ',
'        from v_pq_g_solicitudes            a',
'        join v_pq_g_solicitantes           b on a.id_slctud = b.id_slctud',
'        join v_si_i_sujetos_impuesto       c on a.id_sjto_impsto = c.id_sjto_impsto',
'        where a.id_instncia_fljo_gnrdo = :F_ID_INSTNCIA_FLJO;',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(57097781635563701)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Radica, Cierra PQR y Finaliza Flujo'
,p_process_sql_clob=>'null'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_process_success_message=>'ASASASAS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(56969854980849201)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Registrar Reversi\00F3n (Rechazo, Finalizaci\00F3n)')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_cdgo_rspsta              number; ',
'    v_json_parametros          clob;',
'    v_mnsje_rspsta             varchar2(2000);',
'    v_id_fljo_trea             number;',
'    v_type_rspsta              varchar2(1); ',
'    ',
'begin',
'    ',
'    select json_object( key ''ID_CNVNIO'' is a.id_cnvnio)',
'      into :P151_ID_CNVNIO   ',
'      from v_gf_g_convenios a',
' left join gf_g_convenios_reversion b on a.id_cnvnio = b.id_cnvnio   ',
'     where a.cdgo_clnte = :F_CDGO_CLNTE',
'       and a.id_impsto = :P151_ID_IMPSTO',
'       and a.id_impsto_sbmpsto = :P151_ID_IMPSTO_SBMPSTO',
'       and a.id_sjto_impsto = :P151_ID_SJTO_IMPSTO',
'       and b.id_cnvnio is null',
'       and a.cdgo_cnvnio_estdo = ''FNL'';',
'           ',
'        if (:P151_ID_CNVNIO is not null) then',
'        ',
'            begin       ',
'               pkg_gf_convenios.prc_rg_reversion_acuerdo_pago(p_cdgo_clnte              =>  :F_CDGO_CLNTE,',
'                                                              p_id_cnvnio               =>	:P151_ID_CNVNIO,',
'                                                              p_id_usrio                =>	:F_ID_USRIO,',
'                                                              p_id_instncia_fljo_hjo    =>	:F_ID_INSTNCIA_FLJO,',
'                                                              p_id_fljo_trea_orgen      =>  :F_ID_FLJO_TREA,  ',
'                                                              p_id_slctud               =>	:P151_ID_SLCTUD,',
'                                                              o_cdgo_rspsta             =>	v_cdgo_rspsta,',
'                                                              o_mnsje_rspsta            =>	v_mnsje_rspsta);',
'',
'                if (v_cdgo_rspsta = 0) then',
'                    apex_util.set_session_state(''F_ID_FLJO_TREA'','''');',
'                     begin ',
'                        pkg_pq_pqr.prc_rg_radicar_solicitud( p_id_slctud => :P151_ID_SLCTUD, p_cdgo_clnte =>:F_CDGO_CLNTE );',
'                        commit;',
'                    exception ',
'                      when others then',
'                       rollback;',
'                       raise_application_error(-20001, ''La solicitud no ha sido radicada '' || SQLCODE || '' - '' || SQLERRM);      ',
'                    end;',
'                    ',
'                    begin            ',
'                        select json_object( key ''p_id_slctud'' is :P151_ID_SLCTUD) ',
'                          into v_json_parametros',
'                          from dual;',
'',
'                            --CONSULTAMOS SI HAY ENVIOS PROGRAMADOS',
'                        pkg_ma_envios.prc_co_envio_programado( p_cdgo_clnte     => :F_CDGO_CLNTE',
'                                                             , p_idntfcdor      => ''PKG_GF_CONVENIOS.PRC_RG_REVERSION_ACUERDO_PAGO''',
'                                                             , p_json_prmtros   => v_json_parametros',
'                                                             );',
'                    exception',
'                        when others then',
'                            null;',
'                    end;',
'                    ',
'                else',
unistr('                    raise_application_error(-20001, ''No se registr\00F3 reversi\00F3n de acuerdo de pago'');    '),
'                end if;',
'            end;',
'',
'        end if;',
'',
'exception',
'',
'    when no_Data_found then',
'        ',
'            begin',
'                select b.id_fljo_trea_orgen',
'                  into v_id_fljo_trea',
'                  from wf_g_instancias_transicion b             ',
'                  where b.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                    and b.id_estdo_trnscion in (1,2);',
'            end;',
'            ',
'            begin',
'                pkg_pl_workflow_1_0.prc_rg_instancias_transicion( p_id_instncia_fljo  => :F_ID_INSTNCIA_FLJO,',
'                                                                  p_id_fljo_trea      => v_id_fljo_trea,',
'                                                                  p_json              => ''[]'',',
'                                                                  o_type              => v_type_rspsta,',
'                                                                  o_mnsje             => v_mnsje_rspsta,',
'                                                                  o_id_fljo_trea      => v_id_fljo_trea,',
'                                                                  o_error             => v_cdgo_rspsta);',
'',
'                 ',
'                if (v_type_rspsta = ''S'') then',
'                    rollback;',
'                    v_mnsje_rspsta := ''Error al cambiar de etapa el flujo.'' || v_mnsje_rspsta ;',
'                    return;	',
'                else',
'                    apex_util.set_session_state(''F_ID_FLJO_TREA'','''');',
'                end if;',
'            end;   ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(58882325847345601)
,p_process_sequence=>50
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>unistr('Limpiar P\00E1gina 233')
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'233'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(116658531786227300)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Registrar Registro Reversi\00F3n (Aplicar)')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  declare',
'      v_cdgo_rspsta      number; ',
'      v_json_parametros  clob;   ',
'  begin',
'    pkg_gf_convenios.prc_rg_reversion_acuerdo_pago(p_cdgo_clnte               =>   	:F_CDGO_CLNTE,',
'                                                    p_id_cnvnio               =>	:P151_ID_CNVNIO,',
'                                                    p_id_usrio                =>	:F_ID_USRIO,',
'                                                    p_id_instncia_fljo_hjo    =>	:F_ID_INSTNCIA_FLJO,',
'                                                    p_id_fljo_trea_orgen      =>    :F_ID_FLJO_TREA,  ',
'                                                    p_id_slctud               =>	:P151_ID_SLCTUD,',
'                                                    o_cdgo_rspsta             =>	v_cdgo_rspsta,',
'                                                    o_mnsje_rspsta            =>	:P151_RSPSTA);',
'  ',
'        apex_util.set_session_state(''F_ID_FLJO_TREA'','''');',
'        ',
'      /*  begin ',
'            pkg_pq_pqr.prc_rg_radicar_solicitud( p_id_slctud => :P151_ID_SLCTUD, p_cdgo_clnte =>:F_CDGO_CLNTE );',
'            commit;',
'        exception ',
'          when others then',
'           rollback;',
'           raise_application_error(-20001, ''La solicitud no ha sido radicada '' || SQLCODE || '' - '' || SQLERRM);      ',
'        end;*/',
'        ',
'        ',
'        begin',
'            select json_object( key ''p_id_slctud'' is :P151_ID_SLCTUD) ',
'              into v_json_parametros',
'              from dual;',
'            ',
'            --CONSULTAMOS SI HAY ENVIOS PROGRAMADOS',
'            pkg_ma_envios.prc_co_envio_programado( p_cdgo_clnte     => :F_CDGO_CLNTE',
'                                                 , p_idntfcdor      => ''PKG_GF_CONVENIOS.PRC_RG_REVERSION_ACUERDO_PAGO''',
'                                                 , p_json_prmtros   => v_json_parametros',
'                                                 );',
'        exception',
'            when others then',
'                null;',
'        end;',
'        ',
'        ',
'  end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(116659514031239243)
,p_process_success_message=>'&P151_RSPSTA.'
);
end;
/
