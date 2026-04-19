prompt --application/pages/page_00138
begin
wwv_flow_api.create_page(
 p_id=>138
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Consulta de Anulaci\00F3n Acuerdo de Pago')
,p_step_title=>unistr('Consulta de Anulaci\00F3n Acuerdo de Pago')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#anulados_ig_report_settings{',
'    display: none',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(177374633629050691)
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20201019161616'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(98792235902500115)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(98792507936500118)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i>',
'    </b>',
'</h5>',
'',
'<i>',
'Esta funcionalidad permite <br><br>',
'    <b>',
'        1. </b> <i>Visualizar los acuerdos de pago en estado anulado.</i>',
'    </b><br><br>',
'    <b>',
unistr('        2. </b> <i>Efectuar anulaci\00F3n de acuerdos de pago.</i>'),
'    </b><br><br>',
'     <b>',
unistr('        3. </b> <i>Descargar el acto de anulaci\00F3n de acuerdo de pago.</i>'),
'    </b><br><br>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(101926684382112004)
,p_plug_name=>'anulados'
,p_region_name=>'anulados'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_cnvnio,',
'        a.idntfccion_sjto,',
'        a.nmro_idntfccion_slctnte,',
'        a.nmbre_slctnte,',
'        a.fcha fcha_anlcion,',
'        a.dscrpcion mtvo,',
'        a.id_acto,',
'        b.id_rprte,',
'        a.nmbre_impsto,',
'        a.nmbre_impsto_sbmpsto,',
'        ''ACTO_ANU_''|| a.nmro_cnvnio nmbre_rprte,',
'        ''<data><id_acto>''||a.id_acto||''</id_acto>',
'               <id_cnvnio>''||a.id_cnvnio||''</id_cnvnio>',
'               <cod_clnte>''||a.cdgo_clnte||''</cod_clnte>',
'               <p_id_rprte>''||b.id_rprte||''</p_id_rprte>',
'               <id_plntlla>''||b.id_plntlla||''</id_plntlla></data>'' pmtro_rprte,',
'        1 acto,',
'        a.nmro_acto',
'from v_gf_g_convenios_anulacion a',
'join gf_g_convenios_documentos  b on a.id_cnvnio = b.id_cnvnio and a.id_acto = b.id_acto',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'  and (a.id_impsto = :P138_ID_IMPSTO or :P138_ID_IMPSTO is null)',
'  and (a.id_impsto_sbmpsto = :P138_ID_IMPSTO_SBMPSTO or :P138_ID_IMPSTO_SBMPSTO is null)',
'  and (a.idntfccion_sjto = :P138_IDNTFCCION_SJTO or :P138_IDNTFCCION_SJTO is null)',
'  and (a.id_cnvnio_tpo = :P138_ID_CNVNIO_TPO or :P138_ID_CNVNIO_TPO is null)',
'  and (a.cdgo_sjto_tpo = :P138_CDGO_SJTO_TPO or :P138_CDGO_SJTO_TPO is null) ',
'  and (a.id_mtvo_anlcn = :P138_MTVO_ANLCION or :P138_MTVO_ANLCION is null)',
'  and (a.nmro_idntfccion_slctnte = :P138_IDNTFCCION_SLCTNTE or :P138_IDNTFCCION_SLCTNTE is null)',
'   and ((trunc(a.fcha) between :P138_FCHA_INCIO and :P138_FCHA_FNAL)',
'       or (trunc(a.fcha) >= :P138_FCHA_INCIO and :P138_FCHA_FNAL is null) ',
'       or (trunc(a.fcha) <= :P138_FCHA_FNAL and :P138_FCHA_INCIO  is null)',
'       or(:P138_FCHA_INCIO is null and :P138_FCHA_FNAL is null ))  '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(47152905040556504)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>25
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
 p_id=>wwv_flow_api.id(56880418290055019)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00B0 Acto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>30
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
 p_id=>wwv_flow_api.id(108600419047534102)
,p_name=>'NMRO_CNVNIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CNVNIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00B0 Acuerdo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108600705679534105)
,p_name=>'NMBRE_SLCTNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_SLCTNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Solicitante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(108600842466534106)
,p_name=>'FCHA_ANLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ANLCION'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_format_mask=>'DD/MM/YYYY'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(108600994556534107)
,p_name=>'MTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Motivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(108601207047534110)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(108601375087534111)
,p_name=>'ID_RPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RPRTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(108601449554534112)
,p_name=>'NMBRE_RPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RPRTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(108601581660534113)
,p_name=>'PMTRO_RPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PMTRO_RPRTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108601639382534114)
,p_name=>'ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_NMBRE_RPRTE,P2_XML:&ID_RPRTE.,&NMBRE_RPRTE.,&PMTRO_RPRTE.'
,p_link_text=>'<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(110945533991362708)
,p_name=>'NMRO_IDNTFCCION_SLCTNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_IDNTFCCION_SLCTNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Id Solicitante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>25
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
 p_id=>wwv_flow_api.id(119357733469894529)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(119357872072894530)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sub - Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>50
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(108600373523534101)
,p_internal_uid=>108600373523534101
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
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(108606247105535384)
,p_interactive_grid_id=>wwv_flow_api.id(108600373523534101)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(108606329801535387)
,p_report_id=>wwv_flow_api.id(108606247105535384)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(47210305664989785)
,p_view_id=>wwv_flow_api.id(108606329801535387)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(47152905040556504)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(56941442593259233)
,p_view_id=>wwv_flow_api.id(108606329801535387)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(56880418290055019)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108606774776535411)
,p_view_id=>wwv_flow_api.id(108606329801535387)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(108600419047534102)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108608232683535437)
,p_view_id=>wwv_flow_api.id(108606329801535387)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(108600705679534105)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108608714333535438)
,p_view_id=>wwv_flow_api.id(108606329801535387)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(108600842466534106)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108609220592535439)
,p_view_id=>wwv_flow_api.id(108606329801535387)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(108600994556534107)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108610794819535443)
,p_view_id=>wwv_flow_api.id(108606329801535387)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(108601207047534110)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108611251614535445)
,p_view_id=>wwv_flow_api.id(108606329801535387)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(108601375087534111)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108611774671535446)
,p_view_id=>wwv_flow_api.id(108606329801535387)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(108601449554534112)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108612274082535448)
,p_view_id=>wwv_flow_api.id(108606329801535387)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(108601581660534113)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108612773845535449)
,p_view_id=>wwv_flow_api.id(108606329801535387)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(108601639382534114)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>50
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110962302445474664)
,p_view_id=>wwv_flow_api.id(108606329801535387)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(110945533991362708)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(119488120159264886)
,p_view_id=>wwv_flow_api.id(108606329801535387)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(119357733469894529)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(119488699804264888)
,p_view_id=>wwv_flow_api.id(108606329801535387)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(119357872072894530)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>120
,p_break_order=>5
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(150046054944274679)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(98792417870500117)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(98792235902500115)
,p_button_name=>'BTN_ANLCION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Nueva Anulaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:182:&SESSION.::&DEBUG.:RP,182::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(99063293917448462)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(150046054944274679)
,p_button_name=>'BTN_BUSCAR'
,p_button_static_id=>'BTN_BUSCAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47153999811556514)
,p_name=>'P138_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(150046054944274679)
,p_prompt=>'<b>Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el tributo de acuerdos de pago anulados o en proceso de anulaci\00F3n.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47154027585556515)
,p_name=>'P138_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(150046054944274679)
,p_prompt=>'<b>Sub Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto d ',
'       ,id_impsto_sbmpsto r       ',
'  from df_i_impuestos_subimpuesto',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'    and id_impsto = :P138_ID_IMPSTO',
'    and actvo = ''S'';'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P138_ID_IMPSTO'
,p_ajax_items_to_submit=>'P138_ID_IMPSTO,P138_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el sub tributo de acuerdos de pago anulados o en proceso de anulaci\00F3n.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99063654160448466)
,p_name=>'P138_ID_CNVNIO_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(150046054944274679)
,p_prompt=>'<b>Tipo de Acuerdo de Pago</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_CONVENIO_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       ID_CNVNIO_TPO as r',
'  from gf_d_convenios_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el tipo de acuerdo de pago aplicado en proceso de anulaci\00F3n.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99064016888448468)
,p_name=>'P138_CDGO_SJTO_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(150046054944274679)
,p_prompt=>'<b>Tipo Sujeto</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_TPO_SJTO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_sjto_tpo as d, ',
'       cdgo_sjto_tpo as r ',
'  from df_s_sujetos_tipo',
'order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el tipo de sujeto asociado al acuerdo de pago.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99064443452448468)
,p_name=>'P138_MTVO_ANLCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(150046054944274679)
,p_prompt=>unistr('<b>Motivo Anulaci\00F3n</b>')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_MTVO_ANLCION_CNVNIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'        id_mtvo_anlcn as r',
' from gf_d_anulacion_motivo',
'where cdgo_clnte = :F_CDGO_CLNTE',
'    and actvo = ''S''',
' order by 1;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el motivo de anulaci\00F3n de acuerdo de pago.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99064838776448468)
,p_name=>'P138_IDNTFCCION_SJTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(150046054944274679)
,p_prompt=>unistr('<b>Identificaci\00F3n Sujeto</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>25
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_grid_column=>11
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la identificaci\00F3n del sujeto al que se le anul\00F3 acuerdo de pago.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99065258457448469)
,p_name=>'P138_IDNTFCCION_SLCTNTE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(150046054944274679)
,p_prompt=>unistr('<b>Identificaci\00F3n Solicitante</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>25
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumero'');"" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_grid_column=>9
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la identificaci\00F3n del solicitante al que se le realiz\00F3 la anulaci\00F3n de acuerdo de pago.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99065632241448470)
,p_name=>'P138_FCHA_INCIO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(150046054944274679)
,p_prompt=>unistr('<b>Fecha Incial - Anulaci\00F3n</b>')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>20
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese fecha m\00EDnima del rango, correspondiente a la anulaci\00F3n de acuerdos de pago.')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99066035668448471)
,p_name=>'P138_FCHA_FNAL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(150046054944274679)
,p_prompt=>unistr('<b>Fecha Final - Anulaci\00F3n</b>')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>20
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese fecha m\00E1xima del rango, correspondiente a la anulaci\00F3n de acuerdos de pago.')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(99283848852035401)
,p_name=>'Cerrar Modal'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
,p_display_when_type=>'NEVER'
);
end;
/
