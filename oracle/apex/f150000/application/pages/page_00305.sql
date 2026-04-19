prompt --application/pages/page_00305
begin
wwv_flow_api.create_page(
 p_id=>305
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Impresi\00F3n de Recibo pliego de cargos')
,p_step_title=>unistr('Impresi\00F3n de Recibo pliego de cargos')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Portal/js/emisionReciboOmiso.js?v=&APP_SESSION.'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'String.prototype.initCap = function () {',
unistr('   return this.toLowerCase().replace(/(?:^|\005Cs)[a-z\00E1\00E9\00ED\00FA\00F3]/g, function (m) {'),
'      return m.toUpperCase();',
'   });',
'};'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.jQuery(apex.gPageContext$).on("apexreadyend", async function (e) {',
'    apex.item(''deuda'').hide();',
'    apex.item(''info'').hide();',
'    apex.item(''sujetos'').hide();',
'    apex.item(''btn_rgrsar'').hide();',
'    apex.item(''btn_gnrar'').hide();',
'    jsonConfig = await cargarConfig();',
'    //cargarTipoBusqueda();',
'});',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Region-body>p {',
'    background-color: #fff;',
'    border: 1px solid rgba(0, 0, 0, .1);',
'    color: rgba(255, 0, 0, 0.89);',
'    padding: 1rem;',
'    text-align: center;',
'}',
'',
'.table-inf {',
'    margin-left: 10px;',
'}',
'',
'.table-inf td {',
'    font-size: 14px;',
'    text-align: left;',
'}',
'',
'.table-inf td:nth-child(odd) {',
'    font-weight: 700;',
'}',
'',
'.table-inf td:nth-child(3) {',
'    padding-left: 20rem;',
'}',
'',
'.table-inf td:nth-child(odd)::after {',
'    content: '':''',
'}',
'',
'.table-inf td:nth-child(even) {',
'    padding-left: 5px;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'JBADRAN'
,p_last_upd_yyyymmddhh24miss=>'20241016102849'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(260898108731909489)
,p_plug_name=>unistr('Emisi\00F3n de recibos puntuales')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Consulte y genere el recibo de pago<br/>',
unistr('para pliego de cargos por no inscripci\00F3n<br/>'),
'</p>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(260898603873909494)
,p_plug_name=>'busqueda'
,p_region_name=>'busqueda'
,p_parent_plug_id=>wwv_flow_api.id(260898108731909489)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(260898931223909498)
,p_plug_name=>'Deuda'
,p_region_name=>'deuda'
,p_parent_plug_id=>wwv_flow_api.id(260898108731909489)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c001',
'     , c002',
'     , c003',
'     , c004',
'     , c005',
'     , c006',
'     , c007',
'     , to_char(c008, ''FM$999G999G999G999G999G999G990'')  c008',
'     , to_char(c009, ''FM$999G999G999G999G999G999G990'')  c009',
'     , to_char(c010, ''FM$999G999G999G999G999G999G990'')  c010',
'     , c011',
'     , c012',
'     , c013',
'     , c014',
'     , trunc(pkg_fi_fiscalizacion.fnc_vl_vencimiento_acto(p_cdgo_clnte          => :F_CDGO_CLNTE,',
'                                                      --    p_fecha_inicial         => ''11/11/2022'',',
'                                                          p_id_acto    => c014)) as c015',
'  from apex_collections',
' where collection_name = ''DEUDA''',
' and trunc(sysdate)  <= trunc(pkg_fi_fiscalizacion.fnc_vl_vencimiento_acto(p_cdgo_clnte          => :F_CDGO_CLNTE,',
'                                                      --    p_fecha_inicial         => ''11/11/2022'',',
'                                                          p_id_acto    => c014))'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>'<strong><i>Vigencias con saldo pendiente</i></strong>'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(127660132073452607)
,p_name=>'C012'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C012'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(127787902402692701)
,p_name=>'C013'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C013'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(127972041347868301)
,p_name=>'C014'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C014'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(127972132455868302)
,p_name=>'C015'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C015'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha de Vencimiento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
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
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(260900426792909513)
,p_name=>'C002'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C002'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(260900578254909514)
,p_name=>'C003'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C003'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(260900861666909517)
,p_name=>'C004'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C004'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(260901295036909521)
,p_name=>'C008'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C008'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Valor<br>Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
,p_is_required=>false
,p_max_length=>29
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
 p_id=>wwv_flow_api.id(260901382112909522)
,p_name=>'C009'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C009'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Valor<br> Inter\00E9s')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>29
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
 p_id=>wwv_flow_api.id(260901504733909523)
,p_name=>'C010'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C010'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Valor <br> Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>29
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
 p_id=>wwv_flow_api.id(265153170947121878)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(265658292540132783)
,p_name=>'C001'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C001'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'C001'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(265658414736132784)
,p_name=>'C005'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C005'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'C005'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(265658481406132785)
,p_name=>'C006'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C006'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'C006'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(265658531983132786)
,p_name=>'C007'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C007'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'C007'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(265658681420132787)
,p_name=>'C011'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C011'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
,p_attribute_01=>'&C011.'
,p_link_target=>'#'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(260899111204909499)
,p_internal_uid=>260899111204909499
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
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
 p_id=>wwv_flow_api.id(265059731773194070)
,p_interactive_grid_id=>wwv_flow_api.id(260899111204909499)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(265059894760194070)
,p_report_id=>wwv_flow_api.id(265059731773194070)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(127672841379769956)
,p_view_id=>wwv_flow_api.id(265059894760194070)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(127660132073452607)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(127794009212693465)
,p_view_id=>wwv_flow_api.id(265059894760194070)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(127787902402692701)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(127977998297868607)
,p_view_id=>wwv_flow_api.id(265059894760194070)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(127972041347868301)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(127980805126937269)
,p_view_id=>wwv_flow_api.id(265059894760194070)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(127972132455868302)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(265127050051891413)
,p_view_id=>wwv_flow_api.id(265059894760194070)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(260900426792909513)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(265127595668891415)
,p_view_id=>wwv_flow_api.id(265059894760194070)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(260900578254909514)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(265138594141995778)
,p_view_id=>wwv_flow_api.id(265059894760194070)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(260900861666909517)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(265140508287995784)
,p_view_id=>wwv_flow_api.id(265059894760194070)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(260901295036909521)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(265141008311995786)
,p_view_id=>wwv_flow_api.id(265059894760194070)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(260901382112909522)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(265141448640995787)
,p_view_id=>wwv_flow_api.id(265059894760194070)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(260901504733909523)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(265956209618305237)
,p_view_id=>wwv_flow_api.id(265059894760194070)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(265658292540132783)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(265956666034305239)
,p_view_id=>wwv_flow_api.id(265059894760194070)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(265658414736132784)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(265957179471305241)
,p_view_id=>wwv_flow_api.id(265059894760194070)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(265658481406132785)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(265957696761305242)
,p_view_id=>wwv_flow_api.id(265059894760194070)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(265658531983132786)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(265958192160305244)
,p_view_id=>wwv_flow_api.id(265059894760194070)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(265658681420132787)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(260899975864909508)
,p_plug_name=>unistr('Informaci\00F3n B\00E1sica')
,p_region_name=>'info'
,p_parent_plug_id=>wwv_flow_api.id(260898108731909489)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'<table class="table-inf"></table>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(265153690546121883)
,p_plug_name=>'sujetos'
,p_region_name=>'sujetos'
,p_parent_plug_id=>wwv_flow_api.id(260898108731909489)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c002 ',
'     , c003',
'     , c004',
'     , c005',
'     , c001     ',
'  from apex_collections',
' where collection_name = ''SUJETOS'''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(265153948037121886)
,p_name=>'C002'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C002'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Referencia Anterior'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_static_id=>'c001'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(265154152329121888)
,p_name=>'C004'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C004'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Propietario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_static_id=>'c003'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(265154227473121889)
,p_name=>'C005'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C005'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Direcci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_static_id=>'c004'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(265155319598121899)
,p_name=>unistr('Opci\00F3n')
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>unistr('Opci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_attribute_01=>'<button onclick="verSujeto(&C001.,''R'')" style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton">Ver <span class="fa fa-external-link-square"></span></button>'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(315099398733150781)
,p_name=>'C003'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C003'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'C003'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
,p_static_id=>'c002'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(315099503563150782)
,p_name=>'C001'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C001'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(265153772060121884)
,p_internal_uid=>265153772060121884
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
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
 p_id=>wwv_flow_api.id(265344890721767403)
,p_interactive_grid_id=>wwv_flow_api.id(265153772060121884)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(265344994996767409)
,p_report_id=>wwv_flow_api.id(265344890721767403)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(265345954063767430)
,p_view_id=>wwv_flow_api.id(265344994996767409)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(265153948037121886)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>259
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(265346938330767433)
,p_view_id=>wwv_flow_api.id(265344994996767409)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(265154152329121888)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>270
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(265347508566767435)
,p_view_id=>wwv_flow_api.id(265344994996767409)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(265154227473121889)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>106
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(265364707446876528)
,p_view_id=>wwv_flow_api.id(265344994996767409)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(265155319598121899)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(315124760390811153)
,p_view_id=>wwv_flow_api.id(265344994996767409)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(315099398733150781)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>289
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(315130302793915842)
,p_view_id=>wwv_flow_api.id(265344994996767409)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(315099503563150782)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(191354983501334086)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(260898603873909494)
,p_button_name=>'btn_cnsltar'
,p_button_static_id=>'btn_cnsltar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-search'
,p_grid_column_attributes=>'style="margin-top:5px"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(191343881455333979)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(260898108731909489)
,p_button_name=>'btn_rgrsar'
,p_button_static_id=>'btn_rgrsar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:305:&SESSION.::&DEBUG.:RP,305:P305_ID_IMPSTO,P305_ID_IMPSTO_SBMPSTO:&P305_ID_IMPSTO.,&P305_ID_IMPSTO_SBMPSTO.'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(191344218763333986)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(260898108731909489)
,p_button_name=>'btn_rgrsar_pg'
,p_button_static_id=>'btn_rgrsar_pg'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,1::'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(191350903497334061)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(260899975864909508)
,p_button_name=>'BTN_HSTRIAL_PGOS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Historial de Pagos'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:33:&SESSION.::&DEBUG.:RP:P33_ID_SJTO_IMPSTO:&P305_ID_SJTO_IMPSTO.'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(191344505816333986)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(260898108731909489)
,p_button_name=>'btn_gnrar'
,p_button_static_id=>'btn_gnrar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-cog'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(191363223281334163)
,p_branch_name=>'Go To Page 306'
,p_branch_action=>'f?p=&APP_ID.:306:&SESSION.::&DEBUG.:RP,306:P306_ID_IMPSTO,P306_ID_IMPSTO_SBMPSTO,P306_ID_SJTO_IMPSTO,P306_CDGO_CLNTE:&P305_ID_IMPSTO.,&P305_ID_IMPSTO_SBMPSTO.,&P305_ID_SJTO_IMPSTO.,&F_CDGO_CLNTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(191344505816333986)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(127660268636452608)
,p_name=>'P305_FECHA_INICIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(260898931223909498)
,p_use_cache_before_default=>'NO'
,p_source=>'#c012#'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(127788092163692702)
,p_name=>'P305_ID_ACTO_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(260898931223909498)
,p_use_cache_before_default=>'NO'
,p_source=>'#c013#'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191355221262334086)
,p_name=>'P305_VGNCIA_PRDO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(260898603873909494)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191355680881334090)
,p_name=>'P305_VALIDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(260898603873909494)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191356049201334091)
,p_name=>'P305_ID_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(260898603873909494)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191356414481334096)
,p_name=>'P305_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(260898603873909494)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191356827325334096)
,p_name=>'P305_ID_SJTO_IMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(260898603873909494)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191357285482334096)
,p_name=>'P305_TPO_BSQDA'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(260898603873909494)
,p_prompt=>'Tipo de busqueda'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Identificaci\00F3n;RS,No. Expediente;EX')
,p_cHeight=>1
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191357631868334097)
,p_name=>'P305_PRMTRO'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(260898603873909494)
,p_prompt=>'P305_PRMTRO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191358022364334101)
,p_name=>'P305_FCHA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(260898603873909494)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(191362240086334162)
,p_name=>'al cambiar tipo de busqueda'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P305_TPO_BSQDA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(191362726844334162)
,p_event_id=>wwv_flow_api.id(191362240086334162)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var valor = $(''#P305_TPO_BSQDA'').find(''[value='' + $(''#P305_TPO_BSQDA'').val() + '']'').text();',
'$(''#P305_PRMTRO_LABEL'').text(valor);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(191360434581334129)
,p_name=>unistr('al hacer clic en el bot\00F3n consultar')
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(191354983501334086)
,p_condition_element=>'P305_PRMTRO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(191360962548334136)
,p_event_id=>wwv_flow_api.id(191360434581334129)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'validarSujeto($v(''P305_TPO_BSQDA''),''R'');',
'apex.message.showPageSuccess("Datos cargados!");',
'apex.message.clearErrors();',
'/*apex.server.process("ConsultarFechaVencimiento", ',
'    {',
'        x01: $v("P305_PRMTRO"),pageItems: "#P305_TPO_BSQDA"',
'    ',
'       ',
'    },  ',
'    {',
'      success: function (datos) {      ',
'    ',
'        if(datos.Estado == 1){',
'            $s("P305_VALIDO",datos.Estado);',
'            validarSujeto($v(''P305_TPO_BSQDA''),''R'');',
'            apex.message.showPageSuccess("Datos cargados!");',
'            apex.message.clearErrors();',
'        }else{',
'            apex.message.clearErrors();',
'             apex.message.showPageSuccess("No consulto!");',
'            apex.message.showErrors({',
'                type: "errors",',
'                location: "page",',
'                message: "No se encontro dato.",',
'                unsafe: false',
'            });',
'        }',
'      }',
'    }',
'  );*/'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(191361392727334141)
,p_name=>'al seleccionar un registro de la grilla'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(260898931223909498)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(191361875540334161)
,p_event_id=>wwv_flow_api.id(191361392727334141)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'seleccionarVigencias(this);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(191359698285334128)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fecha limite'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'v_fcha_inicial date ;',
'v_fcha_fnal date;',
'v_ndad_drcion varchar2(3);',
'v_drcion number;',
'v_dia_tpo varchar2(3);',
'',
'v_id_acto_tpo number;',
'v_id_acto number;',
'v_id_fsclzcion_expdnte_acto number;',
'',
'v_cdgo_rspsta  number;',
'v_mnsje_rspsta  varchar2(4000);',
'',
'',
'begin',
'',
'',
'     ',
'     APEX_COLLECTION.DELETE_COLLECTION(',
'        p_collection_name => ''DEUDA'');',
'/*select VLOR',
'   into v_dias_limite',
'  from df_i_definiciones_impuesto',
' where (cdgo_clnte =23001 )--:F_CDGO_CLNTE)',
'  and (ID_IMPSTO = 230012)',
'  and cdgo_dfncn_impsto = ''DIN'';*/',
'',
'',
'',
'',
'        select ',
'             c.id_acto_tpo,',
'             c.id_acto,',
'             c.id_fsclzcion_expdnte_acto',
'        into v_id_acto_tpo,',
'             v_id_acto,',
'             v_id_fsclzcion_expdnte_acto',
'        from v_fi_g_candidatos              a',
'        join fi_g_fiscalizacion_expdnte     b   on  a.id_cnddto             =   b.id_cnddto    ',
'        join fi_g_fsclzcion_expdnte_acto    c  on  b.id_fsclzcion_expdnte =   c.id_fsclzcion_expdnte                                      ',
'        join v_si_i_sujetos_impuesto        g   on  a.id_sjto_impsto        =   g.id_sjto_impsto',
'        join gn_g_actos       d   on c.id_acto  = d.id_acto                                      ',
'        where a.cdgo_clnte = :F_CDGO_CLNTE -- 23001',
'        and d.fcha_ntfccion is not null',
'        --and b.id_fncnrio = 5',
'        --''812004150''',
'        and g.id_sjto_impsto   = :P305_ID_SJTO_IMPSTO',
'       -- and c.id_acto_tpo = 169',
'       ;',
'        --and g.idntfccion_sjto   = ''812004150'';',
'',
'        select undad_drcion,',
'               drcion,',
'               dia_tpo',
'        into v_ndad_drcion,',
'             v_drcion,',
'             v_dia_tpo',
'        from gn_d_actos_tipo_tarea',
'        where id_acto_tpo = v_id_acto_tpo;',
'',
'        select fcha_ntfccion',
'        into v_fcha_inicial',
'        from gn_g_actos a',
'        where a.id_acto = v_id_acto;',
'',
'        :P305_FCHA := trunc(pk_util_calendario.fnc_cl_fecha_final( p_cdgo_clnte     => :F_CDGO_CLNTE, ',
'                                                      p_fecha_inicial  => v_fcha_inicial,',
'                                                      p_undad_drcion   => v_ndad_drcion,',
'                                                      p_drcion         => v_drcion,',
'                                                      p_dia_tpo        => v_dia_tpo)  )  ;',
'                                                      ',
'        v_fcha_inicial   := trunc(pk_util_calendario.fnc_cl_fecha_final( p_cdgo_clnte     => :F_CDGO_CLNTE, ',
'                                                      p_fecha_inicial  => v_fcha_inicial,',
'                                                      p_undad_drcion   => v_ndad_drcion,',
'                                                      p_drcion         => v_drcion,',
'                                                      p_dia_tpo        => v_dia_tpo)  )  ;                                                   ',
'                                                      ',
'        if v_fcha_fnal is not null then',
'            ',
'            --Se manda actualizar la fecha del vencimiento de termino',
'            begin',
'                pkg_fi_fiscalizacion.prc_ac_fcha_vncmnto_trmno(p_cdgo_clnte => :F_CDGO_CLNTE,',
'                                                               p_id_fsclzcion_expdnte_acto => v_id_fsclzcion_expdnte_acto,',
'                                                               p_fcha_vncmnto_trmno => v_fcha_fnal,',
'                                                               o_cdgo_rspsta => v_cdgo_rspsta,',
'                                                               o_mnsje_rspsta => v_mnsje_rspsta);',
'                                                               ',
'                                                         ',
'                if v_cdgo_rspsta > 0 then',
'                     return pkg_wf_funciones.fnc_wf_error( p_value   => false, ',
'                                                           p_mensaje => v_mnsje_rspsta);',
'                end if;',
'                ',
'            end;',
'        ',
'        ',
'        ',
'            if trunc(systimestamp) >= trunc(v_fcha_fnal) then',
'                :P305_FCHA :=   v_fcha_fnal;   ',
'            else',
'              :P305_FCHA :=   null;  ',
'            end if;',
'        end if;',
'',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P305_ID_SJTO_IMPSTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(128201707585941001)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'borrar colecction'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'APEX_COLLECTION.DELETE_COLLECTION(p_collection_name => ''DEUDA'');',
'exception when others then null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(191358468167334105)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ValidarSujeto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    tpo_bsqda        varchar2(100) := apex_application.g_x01;',
'    v_prmtros        varchar2(2000) := :P305_PRMTRO ||'':''|| tpo_bsqda ||'':''|| :P305_ID_IMPSTO || '':''|| :F_CDGO_CLNTE || '':''|| :P305_ID_SJTO_IMPSTO;',
'    v_json           json_object_t;',
'    v_prueba         varchar2(1000);',
'    v_j              clob;',
'begin',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'     ',
'    v_j := apex_web_service.make_rest_request(p_url          => :F_DRCCION_SRVDOR_PRVDO || ''recibo/validarSujetoOmiso'',',
'                                                                     p_http_method  => ''POST'',',
'                                                                     p_parm_name    => apex_util.string_to_table(''prmtro:tpo_bsqda:impuesto:cliente:idsujeto''),',
'                                                                     p_parm_value   => apex_util.string_to_table(v_prmtros)); ',
'                                                                     ',
'    apex_json.open_object;',
'    apex_json.write(''type'', ''OK'');',
'    apex_json.write(''data'', v_j);',
'    apex_json.close_object;',
'                                                                     ',
'    exception',
'        when others then',
'            apex_json.open_object;',
'            apex_json.write(''type'', ''error'');',
'            apex_json.write(''o_mnsje_rspsta'', ''asxasx '' || sqlerrm);',
'            apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(191358893766334123)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ConsultarDeuda'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_tipo          varchar2(100) := apex_application.g_x01;',
'    v_prmtros       varchar2(2000) := :F_CDGO_CLNTE ||'':''|| :P305_ID_IMPSTO ||'':''|| :P305_ID_IMPSTO_SBMPSTO || '':''|| :P305_ID_SJTO_IMPSTO || '':'' || v_tipo;',
'    v_json_t        json_object_t;',
'    v_json          clob;',
'    v_sql           clob;',
'    v_sql_coll      clob := ''begin apex_collection.create_or_truncate_collection(p_collection_name => ''''DEUDA''''); '';',
'    v_array_t       json_array_t;',
'    v_keys          json_key_list;',
'begin',
'',
' --	F_DRCCION_SRVDOR_PBLCO',
'    --    F_DRCCION_SRVDOR_PRVDO',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'    v_json := apex_web_service.make_rest_request( p_url          => :F_DRCCION_SRVDOR_PRVDO ||  ''recibo/calcularDeudaOmiso''',
'                                                , p_http_method  => ''POST''',
'                                                , p_parm_name    => apex_util.string_to_table(''cliente:impuesto:subimpuesto:idsujeto:tipo'')',
'                                                , p_parm_value   => apex_util.string_to_table(v_prmtros));   ',
'                                                 insert into muerto2(v_001, c_001, t_001 ) values (''Paso V_json'', v_json,systimestamp); commit;',
'    v_array_t := json_array_t(v_json);',
'    ',
'    for i in 0..(v_array_t.get_size - 1)',
'    loop        ',
'        v_json_t := json_object_t(v_array_t.get(i));',
'        v_keys   := v_json_t.get_keys(); ',
'        v_sql    := '' apex_collection.add_member( p_collection_name => ''''DEUDA'''''';',
'        for i in 1..v_keys.count loop',
'            v_sql := v_sql || '',p_'' ||v_keys(i) || '' => '''''' || v_json_t.get_String(v_keys(i)) || '''''' '' ;',
'        end loop;',
'        v_sql := v_sql || '');'';',
'        v_sql_coll := v_sql_coll || v_sql ;',
'    end loop;',
'    v_sql_coll := v_sql_coll || '' end;'';',
'    execute immediate v_sql_coll;',
'   ',
'    apex_json.open_object;',
'    apex_json.write(''type'', ''OK''); ',
'    apex_json.write(''sql'' , v_json); ',
'    apex_json.write(''size'' , v_array_t.get_size); ',
'    apex_json.write(''v_sql'' , v_sql); ',
'    ',
'    ',
'    apex_json.close_object;',
'                                                                     ',
'    exception',
'        when others then',
'            apex_json.open_object;',
'            apex_json.write(''type'', ''ERROR'');',
'            apex_json.write(''msg'' , sqlerrm);',
'            apex_json.write(''sql'' , v_sql); ',
'            apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(191359210371334124)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ConsultarSujetos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare    ',
'    v_json_t        json_object_t;',
'    v_json          clob;',
'    v_sql           clob; ',
'    v_array_t       json_array_t;',
'    v_keys          json_key_list;',
'begin',
'    for i in 1..apex_application.g_f01.count',
'    loop',
'        v_json := v_json || apex_application.g_f01(i);',
'    end loop;',
'    ',
'    v_sql     := ''select * from json_table(''''''||v_json|| '''''' , ''''$[*]'''' columns('';',
'    v_array_t := json_array_t(v_json);',
'    ',
'    if (v_array_t.get_size > 0) then',
'        v_json_t  := json_object_t(v_array_t.get(0));',
'        v_keys    := v_json_t.get_keys(); ',
'',
'        for i in 1..v_keys.count loop',
'            v_sql := v_sql || ''"'' ||v_keys(i) || ''"'' || '' path ''''$."'' || v_keys(i) || ''"'''','' ;',
'        end loop;',
'    else',
'        v_sql := v_sql || ''n path ''''$.n'''','';',
'    end if; ',
'    ',
'    v_sql := substr(v_sql, 1, length(v_sql) -1 ) || ''))''; ',
'    ',
'    apex_collection.create_collection_from_query( p_collection_name    => ''SUJETOS''',
'                                                , p_query              => v_sql',
'                                                , p_truncate_if_exists => ''YES'');',
'    apex_json.open_object;',
'    apex_json.write(''type'', ''OK''); ',
'    apex_json.write(''sql'' , v_sql); ',
'    ',
'    apex_json.close_object;',
'                                                                     ',
'    exception',
'        when others then',
'            apex_json.open_object;',
'            apex_json.write(''type'', ''ERROR'');',
'            apex_json.write(''msg'' , sqlerrm);',
'            apex_json.write(''sql'' , v_sql); ',
'            apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(191360051831334128)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ConsultarFechaVencimiento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'   v_undad_drcion            varchar2(10);',
'  v_dia_tpo                 varchar2(10);',
'  v_dscrpcion               varchar2(300);',
'  v_mnsje_rspsta            varchar2(500);',
'  v_fcha_incial             timestamp;',
'  v_fcha_fnal               timestamp;',
'  v_drcion                  number;',
'  v_id_fljo_trea            number;',
'  v_id_instncia_fljo        number;',
'  v_id_acto                 number;',
'  v_id_acto_tpo             number;',
'  v_id_cnddto               number;',
'  v_id_sjto_impsto          number;',
'  v_id_fsclzcion_expdnte    number;',
'  v_id_prgrma               number;',
'  v_id_sbprgrma             number;',
'  v_cdgo_rspsta             number;',
'  v_valor                   number;',
'  v_id_fsclzcion_expdnte_acto number;',
'  v_j  clob;  ',
'   ',
'begin',
'        begin',
'            select  a.id_fljo_trea,',
'                    a.id_acto_tpo',
'            into    v_id_fljo_trea,',
'                    v_id_acto_tpo',
'            from gn_d_actos_tipo_tarea  a ',
'            join gn_d_actos_tipo    b   on  a.id_acto_tpo = b.id_acto_tpo',
'            where b.cdgo_acto_tpo IN (''PCE'');  ',
'        exception',
'        when others then',
'           v_mnsje_rspsta := ''Error al consultar el acto tipo PDI ''||sqlerrm;',
'        end;',
'        ',
'       begin',
'            select a.id_instncia_fljo,',
'                   a.id_fsclzcion_expdnte',
'            into  v_id_instncia_fljo,',
'                  v_id_fsclzcion_expdnte',
'            from v_si_i_sujetos_impuesto e',
'            join v_fi_g_candidatos b   on    e.id_sjto_impsto = b.id_sjto_impsto',
'            join fi_g_fiscalizacion_expdnte a on b.id_cnddto = a.id_cnddto           ',
'            join fi_d_programas  c   on b.id_prgrma = c.id_prgrma',
'            join fi_d_subprogramas d on c.id_prgrma  = d.id_prgrma',
'           ',
'            where   --e.idntfccion_sjto = apex_application.g_x01',
'          ( case ',
'                when :P305_TPO_BSQDA = ''RS'' and e.idntfccion_sjto = apex_application.g_x01  then 1',
'                when :P305_TPO_BSQDA = ''EX'' and a.nmro_expdnte = apex_application.g_x01 then 1',
'                else 0',
'            end = 1  )',
'            and a.cdgo_expdnte_estdo = ''ABT''',
'            and d.cdgo_sbprgrma in (''ODE'',''EXT'');',
'            ',
'       exception',
'        when others then',
'           v_mnsje_rspsta := ''No se encontro parametrizado el programa ODE- Omisos desconocido ''||sqlerrm;',
'       end;',
'        ',
'      ',
'        select id_acto,',
'               id_fsclzcion_expdnte_acto',
'        into   v_id_acto,',
'               v_id_fsclzcion_expdnte_acto',
'        from fi_g_fsclzcion_expdnte_acto',
'        where id_acto_tpo = v_id_acto_tpo',
'        and id_fsclzcion_expdnte = v_id_fsclzcion_expdnte;',
'      ',
'      --Se obtiene termino del acto',
'    begin',
'        select undad_drcion,',
'               drcion,',
'               dia_tpo',
'        into  v_undad_drcion,',
'              v_drcion,',
'              v_dia_tpo',
'        from gn_d_actos_tipo_tarea',
'        where id_acto_tpo = v_id_acto_tpo;',
'    exception',
'                when no_data_found then',
'                      v_mnsje_rspsta:=  ''No se encontro parametrizado el acto '' || v_dscrpcion;',
'                when others then',
'                    v_mnsje_rspsta :=''Error al consultar el tipo de acto'';      ',
'    end;',
'    ',
'    ',
'    --Se obtiene la fecha de notificacion del acto',
'    begin',
'        select fcha_ntfccion ',
'        into v_fcha_incial',
'        from gn_g_actos a',
'        where a.id_acto = v_id_acto;',
'    exception',
'        when no_data_found then',
'            null       ; ',
'    end;',
'    ',
'    ',
'     begin',
'        v_fcha_fnal :=  pk_util_calendario.fnc_cl_fecha_final(p_cdgo_clnte     => :P_CDGO_CLNTE, ',
'                                                              p_fecha_inicial  => v_fcha_incial,',
'                                                              p_undad_drcion   => v_undad_drcion,',
'                                                              p_drcion         => v_drcion,',
'                                                              p_dia_tpo        => v_dia_tpo);',
'    ',
'        if v_fcha_fnal is not null then',
'            ',
'            --Se manda actualizar la fecha del vencimiento de termino',
'            begin',
'                pkg_fi_fiscalizacion.prc_ac_fcha_vncmnto_trmno(p_cdgo_clnte => :P_CDGO_CLNTE,',
'                                                               p_id_fsclzcion_expdnte_acto => v_id_fsclzcion_expdnte_acto,',
'                                                               p_fcha_vncmnto_trmno => v_fcha_fnal,',
'                                                               o_cdgo_rspsta => v_cdgo_rspsta,',
'                                                               o_mnsje_rspsta => v_mnsje_rspsta);',
'                if v_cdgo_rspsta > 0 then',
'                     v_mnsje_rspsta:= v_mnsje_rspsta;',
'                end if;',
'            end;',
'        ',
'        ',
'        ',
'            if trunc(systimestamp) >= trunc(v_fcha_fnal) then',
'              :P305_VALIDO  := ''N''; ',
'              v_valor:= 0;',
'                   ',
'            else',
'             :P305_VALIDO := ''S''; ',
'             v_valor:= 1;            ',
'                ',
'            end if;',
'        end if;',
'     exception',
'        when others then',
'            null;',
'    end;',
'    apex_json.open_object;  ',
'    apex_json.write(''Estado'', v_valor);  ',
'    apex_json.close_object;                              ',
'exception',
'  when others then',
'',
'    apex_json.open_object; --Abrimos el objeto -- {',
'',
'    apex_json.write(p_name => ''Estado'',',
'                    p_value => 0',
'                    );',
'    apex_json.write(p_name => ''Mensaje'',',
'                    p_value => ''Dato no encontrado''',
'                    );',
'',
'    apex_json.close_object; --Cerramos el objeto -- }',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
