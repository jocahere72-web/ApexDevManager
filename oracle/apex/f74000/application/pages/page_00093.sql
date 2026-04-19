prompt --application/pages/page_00093
begin
wwv_flow_api.create_page(
 p_id=>93
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>unistr('Gesti\00F3n de Requerimientos de Informaci\00F3n')
,p_step_title=>unistr('Gesti\00F3n de Requerimientos de Informaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function obtener_slctud(){',
'    var grid = apex.region("requerimientos").widget().interactiveGrid("getViews", "grid");',
'    var model = grid.model;',
'    var selectedRecords = grid.getSelectedRecords();',
'',
'    if (selectedRecords.length > 0) {',
'        var firstSelectedRecord = selectedRecords[0]; // Obtener el primer registro seleccionado',
'        var idSlctud = model.getValue(firstSelectedRecord, "ID_SLCTUD_RQRMNTO");',
'',
'        // Validar por consola',
'        console.log("ID_SLCTUD_RQRMNTO seleccionado:", idSlctud);',
unistr('        // Asignar el valor al \00EDtem'),
'        $s("P93_ID_SLCTUD_RQRMNTO", idSlctud);',
'    }',
'}',
'',
'function obtener_dcmnto(){',
'    var grid = apex.region("documentos").widget().interactiveGrid("getViews", "grid");',
'    var model = grid.model;',
'    var selectedRecords = grid.getSelectedRecords();',
'',
'    if (selectedRecords.length > 0) {',
'        var firstSelectedRecord = selectedRecords[0]; // Obtener el primer registro seleccionado',
'        var idDcmnto = model.getValue(firstSelectedRecord, "ID_DCMNTO");',
'',
'        // Validar por consola',
'        console.log("ID_DCMNTO seleccionado:", idDcmnto);',
unistr('        // Asignar el valor al \00EDtem'),
'        $s("P93_ID_DCMNTO", idDcmnto);',
'    }',
'}',
''))
,p_step_template=>wwv_flow_api.id(36470205860968633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250423074735'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2936875907418620)
,p_plug_name=>'Tab'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(36509862944968653)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(163560349966367705)
,p_plug_name=>unistr('Requerimientos de Informaci\00F3n')
,p_region_name=>'requerimientos'
,p_parent_plug_id=>wwv_flow_api.id(2936875907418620)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  b.nmbre_prgrma,',
'        b.nmbre_sbprgrma,',
'        a.nmro_expdnte,',
'        to_char(a.fcha_aprtra, ''DD/MM/YYYY'') fcha_aprtra_expdnte,',
'        b.id_sjto_impsto,',
'        b.idntfccion idntfccion_candidato,',
'        b.candidato,',
'        d.dscrpcion_acto_tpo acto_tpo,',
'        d.nmro_acto_dsplay nmro_acto,',
'        e.id_fljo_trea,',
'        f.dscrpcion_trea trea_crcion_rqrmnto,',
'        to_char(d.fcha, ''DD/MM/YYYY'') fcha_crcion_acto,',
'        to_char(d.fcha_ntfccion, ''DD/MM/YYYY'') fcha_ntfccion_acto,',
'        c.id_slctud_rqrmnto,',
'        c.nmro_rdcdo_dsplay_rq nmro_rdcdo_pqr_rqrmnto',
'from fi_g_fiscalizacion_expdnte     a',
'join v_fi_g_candidatos              b   on  b.id_cnddto            =    a.id_cnddto',
'join fi_g_fsclzcion_expdnte_acto    c   on  c.id_fsclzcion_expdnte =    a.id_fsclzcion_expdnte',
'join v_gn_g_actos                   d   on  d.id_acto              =    c.id_acto',
'join wf_d_flujos_tarea              e   on  e.id_fljo_trea         =    c.id_fljo_trea',
'join wf_d_tareas                    f   on  f.id_trea              =    e.id_trea',
'where c.id_slctud_rqrmnto is not null',
';'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(2696466447261401)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(2696660805261403)
,p_name=>'FCHA_APRTRA_EXPDNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_APRTRA_EXPDNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha Apertura<br>Expediente'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(2696784939261404)
,p_name=>'IDNTFCCION_CANDIDATO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_CANDIDATO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n<br>Candidato')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(2696868885261405)
,p_name=>'CANDIDATO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANDIDATO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Nombre<br>Candidato'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
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
 p_id=>wwv_flow_api.id(2696986514261406)
,p_name=>'ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTO_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo de<br>Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(2697048466261407)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero<br>Acto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(2697106890261408)
,p_name=>'ID_FLJO_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
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
 p_id=>wwv_flow_api.id(2697274401261409)
,p_name=>'TREA_CRCION_RQRMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TREA_CRCION_RQRMNTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Tarea Creaci\00F3n<br>del Req.')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>1000
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
 p_id=>wwv_flow_api.id(2697388059261410)
,p_name=>'FCHA_CRCION_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_CRCION_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Fecha Creaci\00F3n<br>del Acto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
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
 p_id=>wwv_flow_api.id(2697484432261411)
,p_name=>'FCHA_NTFCCION_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_NTFCCION_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Fecha Notificaci\00F3n<br>del Acto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
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
 p_id=>wwv_flow_api.id(2697503186261412)
,p_name=>'NMRO_RDCDO_PQR_RQRMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_RDCDO_PQR_RQRMNTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero Radicado<br>Petici\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
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
 p_id=>wwv_flow_api.id(163560963386367711)
,p_name=>'NMBRE_PRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_PRGRMA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Programa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(163561016361367712)
,p_name=>'NMBRE_SBPRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_SBPRGRMA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Subprograma'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(163561173570367713)
,p_name=>'NMRO_EXPDNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_EXPDNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero<br>Expediente')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(163562390810367725)
,p_name=>'ID_SLCTUD_RQRMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTUD_RQRMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
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
 p_id=>wwv_flow_api.id(163562449024367726)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(163560463496367706)
,p_internal_uid=>163560463496367706
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
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
 p_id=>wwv_flow_api.id(163645057693206058)
,p_interactive_grid_id=>wwv_flow_api.id(163560463496367706)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(163645133424206066)
,p_report_id=>wwv_flow_api.id(163645057693206058)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(2702419188265782)
,p_view_id=>wwv_flow_api.id(163645133424206066)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(2696466447261401)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(2704460940412788)
,p_view_id=>wwv_flow_api.id(163645133424206066)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(2696660805261403)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>106.5
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(2704946385412790)
,p_view_id=>wwv_flow_api.id(163645133424206066)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(2696784939261404)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>96.5
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(2705472837412791)
,p_view_id=>wwv_flow_api.id(163645133424206066)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(2696868885261405)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>219.5
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(2705975883412793)
,p_view_id=>wwv_flow_api.id(163645133424206066)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(2696986514261406)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>176.5
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(2706459787412794)
,p_view_id=>wwv_flow_api.id(163645133424206066)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(2697048466261407)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>128.5
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(2706950376412795)
,p_view_id=>wwv_flow_api.id(163645133424206066)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(2697106890261408)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(2707483023412797)
,p_view_id=>wwv_flow_api.id(163645133424206066)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(2697274401261409)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>112.5
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(2707935425412798)
,p_view_id=>wwv_flow_api.id(163645133424206066)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(2697388059261410)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110.5
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(2708445282412800)
,p_view_id=>wwv_flow_api.id(163645133424206066)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(2697484432261411)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>123.972
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(2708994548412801)
,p_view_id=>wwv_flow_api.id(163645133424206066)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(2697503186261412)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>117.01380532836914
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(163647507114206103)
,p_view_id=>wwv_flow_api.id(163645133424206066)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(163560963386367711)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>103.5
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(163648068895206104)
,p_view_id=>wwv_flow_api.id(163645133424206066)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(163561016361367712)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>136.5
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(163648587551206106)
,p_view_id=>wwv_flow_api.id(163645133424206066)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(163561173570367713)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>142.5
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(163656132942234245)
,p_view_id=>wwv_flow_api.id(163645133424206066)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(163562390810367725)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(163561519034367717)
,p_plug_name=>'Documentos Cargados'
,p_region_name=>'documentos'
,p_parent_plug_id=>wwv_flow_api.id(2936875907418620)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.id_dcmnto',
'     , d.id_slctud',
'     , d.file_name ',
'     , d.obsrvcion obsrvcion_archvo',
'     --, d.file_blob',
'     , d.file_mimetype',
'     , md.dscrpcion_dcmnto',
'     , to_char(d.fcha,''DD/MM/YYYY'') fcha_crgue_archvo',
'     , 1 DESCARGAR',
'  from pq_g_documentos d',
'  join v_pq_d_motivos_documento md on d.id_mtvo_dcmnto = md.id_mtvo_dcmnto  ',
'  --join fi_g_fsclzcion_expdnte_acto f on f.id_slctud_rqrmnto = d.id_slctud',
' where md.actvo = ''S''',
'   and d.id_slctud = :P93_ID_SLCTUD_RQRMNTO',
';'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P93_ID_SLCTUD_RQRMNTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(2847086825581141)
,p_name=>'OBSRVCION_ARCHVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION_ARCHVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Observaci\00F3n<br>del Archivo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
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
 p_id=>wwv_flow_api.id(2847164592581142)
,p_name=>'FCHA_CRGUE_ARCHVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_CRGUE_ARCHVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha Cargue<br>del Archivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(2919939905141601)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(2935293701418604)
,p_name=>'FILE_MIMETYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FILE_MIMETYPE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(2937048378418622)
,p_name=>'DESCARGAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCARGAR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Descargar'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_api.id(163561791676367719)
,p_name=>'ID_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(163561814401367720)
,p_name=>'ID_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTUD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(163561989457367721)
,p_name=>'FILE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FILE_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Nombre del<br>Archivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>255
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
 p_id=>wwv_flow_api.id(163562186846367723)
,p_name=>'DSCRPCION_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_DCMNTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo de<br>Documento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(163561696728367718)
,p_internal_uid=>163561696728367718
,p_is_editable=>false
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
,p_enable_mail_download=>false
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(163651759738225906)
,p_interactive_grid_id=>wwv_flow_api.id(163561696728367718)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(163651834143225906)
,p_report_id=>wwv_flow_api.id(163651759738225906)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(2867539968728874)
,p_view_id=>wwv_flow_api.id(163651834143225906)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(2847086825581141)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(2868089724728876)
,p_view_id=>wwv_flow_api.id(163651834143225906)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(2847164592581142)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(2957548034447004)
,p_view_id=>wwv_flow_api.id(163651834143225906)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(2935293701418604)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3076541092045486)
,p_view_id=>wwv_flow_api.id(163651834143225906)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(2937048378418622)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(163652369299225912)
,p_view_id=>wwv_flow_api.id(163651834143225906)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(163561791676367719)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(163652864712226131)
,p_view_id=>wwv_flow_api.id(163651834143225906)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(163561814401367720)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(163653271778226133)
,p_view_id=>wwv_flow_api.id(163651834143225906)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(163561989457367721)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>131.797
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(163654294495226138)
,p_view_id=>wwv_flow_api.id(163651834143225906)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(163562186846367723)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2938579912418637)
,p_plug_name=>unistr('Requerimientos de Informaci\00F3n')
,p_region_name=>'requerimientos'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  b.nmbre_prgrma,',
'        b.nmbre_sbprgrma,',
'        a.nmro_expdnte,',
'        to_char(a.fcha_aprtra, ''DD/MM/YYYY'') fcha_aprtra_expdnte,',
'        b.id_sjto_impsto,',
'        b.idntfccion idntfccion_candidato,',
'        b.candidato,',
'        d.dscrpcion_acto_tpo acto_tpo,',
'        d.nmro_acto_dsplay nmro_acto,',
'        e.id_fljo_trea,',
'        f.dscrpcion_trea trea_crcion_rqrmnto,',
'        to_char(d.fcha, ''DD/MM/YYYY'') fcha_crcion_acto,',
'        to_char(d.fcha_ntfccion, ''DD/MM/YYYY'') fcha_ntfccion_acto,',
'        c.id_slctud_rqrmnto,',
'        c.nmro_rdcdo_dsplay_rq nmro_rdcdo_pqr_rqrmnto,',
unistr('        decode(c.indcdor_cmple, ''S'', ''S\00ED'', ''No'') indcdor_cmple,'),
'        c.nmro_expdnte_sncntrio,',
'        g.dscrpcion_mtvo',
'from fi_g_fiscalizacion_expdnte     a',
'join v_fi_g_candidatos              b   on  b.id_cnddto            =    a.id_cnddto',
'join fi_g_fsclzcion_expdnte_acto    c   on  c.id_fsclzcion_expdnte =    a.id_fsclzcion_expdnte',
'join v_gn_g_actos                   d   on  d.id_acto              =    c.id_acto',
'join wf_d_flujos_tarea              e   on  e.id_fljo_trea         =    c.id_fljo_trea',
'join wf_d_tareas                    f   on  f.id_trea              =    e.id_trea',
'join v_pq_g_solicitudes             g   on g.id_slctud             =    c.id_slctud_rqrmnto',
'where c.id_slctud_rqrmnto is not null',
'  and b.idntfccion  = nvl(:P93_IDNTFCCION,b.idntfccion)',
'  and b.id_prgrma   = nvl(:P93_PRGRMA,b.id_prgrma)',
'  and b.id_sbprgrma = nvl(:P93_SUBPRGRMA,b.id_sbprgrma)',
';'))
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
end;
/
begin
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(3092448030903306)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:94:&SESSION.::&DEBUG.:RP:P94_ID_SLCTUD_RQRMNTO:#ID_SLCTUD_RQRMNTO#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-view.png" class="apex-edit-view" alt="">'
,p_owner=>'BVILLEGAS'
,p_internal_uid=>3092448030903306
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3092518615903307)
,p_db_column_name=>'NMBRE_PRGRMA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Programa'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3092692640903308)
,p_db_column_name=>'NMBRE_SBPRGRMA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Subprograma'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3092709253903309)
,p_db_column_name=>'NMRO_EXPDNTE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('N\00FAmero<br>Expediente')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3092850028903310)
,p_db_column_name=>'FCHA_APRTRA_EXPDNTE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Fecha Apertura<br>Expediente'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3092955056903311)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3093044474903312)
,p_db_column_name=>'IDNTFCCION_CANDIDATO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Identificaci\00F3n<br>Candidato')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3093190493903313)
,p_db_column_name=>'CANDIDATO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Nombre<br>Candidato'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3093225550903314)
,p_db_column_name=>'ACTO_TPO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Tipo de<br>Acto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3093306116903315)
,p_db_column_name=>'NMRO_ACTO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('N\00FAmero<br>Acto')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3093469921903316)
,p_db_column_name=>'ID_FLJO_TREA'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Id Fljo Trea'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3093594431903317)
,p_db_column_name=>'TREA_CRCION_RQRMNTO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('Tarea Creaci\00F3n<br>del Req.')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3093600064903318)
,p_db_column_name=>'FCHA_CRCION_ACTO'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>unistr('Fecha Creaci\00F3n<br>del Acto')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3093708025903319)
,p_db_column_name=>'FCHA_NTFCCION_ACTO'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>unistr('Fecha Notificaci\00F3n<br>del Acto')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3093833382903320)
,p_db_column_name=>'ID_SLCTUD_RQRMNTO'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Id Slctud Rqrmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3093961486903321)
,p_db_column_name=>'NMRO_RDCDO_PQR_RQRMNTO'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>unistr('N\00FAmero Radicado<br>Petici\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5488314227182101)
,p_db_column_name=>'INDCDOR_CMPLE'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>unistr('\00BFCumple?')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5488454515182102)
,p_db_column_name=>'NMRO_EXPDNTE_SNCNTRIO'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Expediente Sancionatorio'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(69758314028376701)
,p_db_column_name=>'DSCRPCION_MTVO'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Motivo PQR'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(3106427873969723)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'31065'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_PRGRMA:NMBRE_SBPRGRMA:NMRO_EXPDNTE:FCHA_APRTRA_EXPDNTE:IDNTFCCION_CANDIDATO:CANDIDATO:ACTO_TPO:NMRO_ACTO:FCHA_CRCION_ACTO:FCHA_NTFCCION_ACTO:NMRO_RDCDO_PQR_RQRMNTO::INDCDOR_CMPLE:NMRO_EXPDNTE_SNCNTRIO:DSCRPCION_MTVO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(71392022571336571)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(89965283313143921)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(89971374328170537)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'    </b>',
'</h5>',
'',
'<p align="justify">',
unistr('<i>Funcionalidad que permite validar la informaci\00F3n solicitada por Requerimiento Ordinario o Requerimiento Especial, la cual es presentada mediante una petici\00F3n de PQR.</i>'),
'</p>',
'<br>',
'<p align="justify">',
unistr('<i>Esta informaci\00F3n se podr\00E1 verificar y posteriormente marcar como buena o mala por un indicador (S\00ED/No). En caso que la informaci\00F3n presentada no tenga errores en su presentaci\00F3n se otorgara un descuento, de lo contrario no aplica descuento.</i>'),
'</p>',
'',
'',
'<p align="justify">',
unistr('<i>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>'),
'</p>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3244928216197274)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(71392022571336571)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2935755230418609)
,p_name=>'P93_ID_DCMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(163561519034367717)
,p_prompt=>'Id Dcmnto'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(36555007171968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2936253399418614)
,p_name=>'P93_ID_SLCTUD_RQRMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(163560349966367705)
,p_prompt=>'Id Slctud Rqrmnto'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(36555007171968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3245736541197278)
,p_name=>'P93_PRGRMA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(71392022571336571)
,p_prompt=>'Programa'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_prgrma as d,',
'        a.id_prgrma as r ',
'from fi_d_programas a ',
'where  a.cdgo_prgrma != ''OD'';'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3246164123197279)
,p_name=>'P93_SUBPRGRMA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(71392022571336571)
,p_prompt=>'Subprograma'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_sbprgrma as d,',
'        a.id_sbprgrma as r ',
'from fi_d_subprogramas a',
'where a.id_prgrma = :P93_PRGRMA',
'and actvo = ''S'';',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P93_PRGRMA'
,p_ajax_items_to_submit=>'P93_SUBPRGRMA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3247352144197280)
,p_name=>'P93_IDNTFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(71392022571336571)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2935858720418610)
,p_name=>'Al seleccionar documento'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(163561519034367717)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2936951015418621)
,p_event_id=>wwv_flow_api.id(2935858720418610)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P93_ID_DCMNTO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2935948318418611)
,p_event_id=>wwv_flow_api.id(2935858720418610)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'obtener_dcmnto();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2936073722418612)
,p_name=>'Al seleccionar requerimiento'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(163560349966367705)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2936117756418613)
,p_event_id=>wwv_flow_api.id(2936073722418612)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'obtener_slctud();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2936489632418616)
,p_event_id=>wwv_flow_api.id(2936073722418612)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(163561519034367717)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2937240419418624)
,p_name=>'Al descargar'
,p_event_sequence=>30
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(163561519034367717)
,p_triggering_element=>'DESCARGAR'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2937331142418625)
,p_event_id=>wwv_flow_api.id(2937240419418624)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   v_blob       BLOB;',
'   v_mime       VARCHAR2(48);',
'   v_length     NUMBER;',
'   v_filename   VARCHAR2(200);',
'BEGIN',
'   -- Recupera el archivo BLOB',
'   SELECT a.file_blob, a.file_mimetype, a.file_name',
'   INTO v_blob, v_mime, v_filename',
'   FROM pq_g_documentos a',
'   WHERE a.id_dcmnto = :ID_DCMNTO;',
'',
'   -- Configura el encabezado HTTP para la descarga',
'   owa_util.mime_header(v_mime, FALSE);',
'   htp.p(''Content-Disposition: attachment; filename="'' || v_filename || ''"'');',
'   owa_util.http_header_close;',
'',
'   -- Enviar el contenido del archivo BLOB al cliente',
'   wpg_docload.download_file(v_blob);',
'END;'))
,p_attribute_02=>'ID_DCMNTO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2936788257418619)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Descargar Blob'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   l_blob       BLOB;',
'   l_mime       VARCHAR2(48);',
'   l_length     NUMBER;',
'   l_filename   VARCHAR2(200);',
'BEGIN',
'   -- Recupera el archivo BLOB',
'   SELECT a.file_blob, a.file_mimetype, a.file_name',
'   INTO l_blob, l_mime, l_filename',
'   FROM pq_g_documentos a',
'   WHERE a.id_dcmnto = :P93_ID_DCMNTO;',
'',
'   -- Configura el encabezado HTTP para la descarga',
'   owa_util.mime_header(l_mime, FALSE);',
'   htp.p(''Content-Disposition: attachment; filename="'' || l_filename || ''"'');',
'   owa_util.http_header_close;',
'',
'   -- Enviar el contenido del archivo BLOB al cliente',
'   wpg_docload.download_file(l_blob);',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
end;
/
