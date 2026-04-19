prompt --application/pages/page_20240_004
begin
wwv_flow_api.create_page(
 p_id=>2024006
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Selecci\00F3n De Candidatos Persuasivo Masivo')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Selecci\00F3n De Candidatos Persuasivo Masivo')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buildJson() {',
'    try {',
'        var id_impsto = apex.item("P2024006_ID_IMPSTO").getValue() || null;',
'        var id_impsto_sbmpsto = apex.item("P2024006_ID_IMPSTO_SBMPSTO").getValue() || null;',
'        var vgncia_dsde = apex.item("P2024006_VGNCIA_MIN").getValue() || null;',
'        var vgncia_hsta = apex.item("P2024006_VGNCIA_MAX").getValue() || null;',
'        var dda_dsde = apex.item("P2024006_DDA_MIN").getValue() || null;',
'        var dda_hsta = apex.item("P2024006_DDA_MAX").getValue() || null;        ',
'        var prdo_min = apex.item("P2024006_PRDO_MIN").getValue() || null;',
'        var prdo_max = apex.item("P2024006_PRDO_MAX").getValue() || null;',
'        var tpo_prsna = apex.item("P2024006_TPO_PRSNA").getValue() || null;',
'        var tpo_rgmn = apex.item("P2024006_TPO_RGMN").getValue() || null;',
'        var clsfccion = apex.item("P2024006_CLSFCCION").getValue() || null;',
'        var id_dstno = apex.item("P2024006_ID_DSTNO").getValue() || null;',
'        var id_estrto = apex.item("P2024006_ID_ESTRTO").getValue() || null;',
'        var nmro_gstros = apex.item("P2024006_NMRO_RGSTROS").getValue() || null;',
'',
'        var json = {',
'            "id_impsto": id_impsto,',
'            "id_impsto_sbmpsto": id_impsto_sbmpsto,',
'            "vgncia_dsde" : vgncia_dsde,',
'            "vgncia_hsta": vgncia_hsta,',
'            "dda_dsde": dda_dsde,',
'            "dda_hsta": dda_hsta,',
'            "id_prdo_in": prdo_min,',
'            "id_prdo_fn": prdo_max,',
'            "cdgo_clse": clsfccion,',
'            "id_prdio_dstno": id_dstno,',
'            "cdgo_estrto": id_estrto,',
'            "tpo_prsna": tpo_prsna,',
'            "cdgo_sjto_tpo": tpo_rgmn',
'        };',
'',
'        $s(''P2024006_JSON_PRMTROS'', JSON.stringify(json));',
'        console.log("JSON generado:", json);',
'    } catch (e) {',
'        console.error("Error al construir el JSON:", e.message);',
'    }',
'}',
'',
'function validacion() {    ',
'    ',
'    var sbmpsto = apex.item("P2024006_ID_IMPSTO_SBMPSTO").getValue();',
'    var impsto = apex.item("P2024006_ID_IMPSTO").getValue();',
'    var dda = apex.item("P2024006_DDA_MIN").getValue();',
'    ',
'    if ( impsto === "" && sbmpsto === "" && dda === "") {',
unistr('        apex.message.alert(''Seleccione los par\00E1metros obligatorios'');'),
'        return false; ',
'    } else {',
'        return true; ',
'    }',
'}',
'',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var vlordefault = 999999999999; ',
'apex.item("P2024006_DDA_MAX").setValue(vlordefault);',
'apex.item("P2024006_ID_DSTNO").hide();',
'apex.item("P2024006_ID_ESTRTO").hide();',
'apex.item("P2024006_TPO_PRSNA").hide();',
'apex.item("P2024006_TPO_RGMN").hide();',
'apex.item("P2024006_CLSFCCION").hide();'))
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_last_updated_by=>'ACONDE'
,p_last_upd_yyyymmddhh24miss=>'20250115104706'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5011019938692735)
,p_plug_name=>unistr('Par\00E1metros')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5011332236692738)
,p_plug_name=>'Candidatos'
,p_region_name=>'candidatos'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select *',
'  from v_cb_g_procesos_simu_sujeto a',
' where a.id_prcsos_smu_lte = :P2024006_ID_LTE;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4006830739945101)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>180
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(5011576996692740)
,p_name=>'ID_PRCSOS_SMU_LTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSOS_SMU_LTE'
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
 p_id=>wwv_flow_api.id(5011687013692741)
,p_name=>'ID_PRCSOS_SMU_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSOS_SMU_SJTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(5011754706692742)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n<br> Sujeto')
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
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(5011877875692743)
,p_name=>'Drccion'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DRCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Direcci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(5011902998692744)
,p_name=>'VLOR_TTAL_DDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_DDA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Cartera'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_api.id(5012089625692745)
,p_name=>'FCHA_INGRSO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_INGRSO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Facha Ingreso'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_format_mask=>'DD-MON-YYYY'
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
 p_id=>wwv_flow_api.id(5012198444692746)
,p_name=>'INDCDOR_PRCSDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_PRCSDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Procesado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>1
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
 p_id=>wwv_flow_api.id(5012287866692747)
,p_name=>'ID_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO'
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
 p_id=>wwv_flow_api.id(5012312017692748)
,p_name=>'CDGO_ORGN_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ORGN_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(5012414333692749)
,p_name=>'ID_DPRTMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DPRTMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(5012592287692750)
,p_name=>'NMBRE_DPRTMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DPRTMNTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Departamento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(5282251664373601)
,p_name=>'ID_MNCPIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_MNCPIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(5282372540373602)
,p_name=>'NMBRE_MNCPIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_MNCPIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Municipio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(5282440591373603)
,p_name=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Activo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>3
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
 p_id=>wwv_flow_api.id(5282541296373604)
,p_name=>'EMAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMAIL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Email'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>320
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
 p_id=>wwv_flow_api.id(5011431352692739)
,p_internal_uid=>5011431352692739
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
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
 p_id=>wwv_flow_api.id(5287837372373715)
,p_interactive_grid_id=>wwv_flow_api.id(5011431352692739)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(5287946848373716)
,p_report_id=>wwv_flow_api.id(5287837372373715)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5288495914373717)
,p_view_id=>wwv_flow_api.id(5287946848373716)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(5011576996692740)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5288904690373719)
,p_view_id=>wwv_flow_api.id(5287946848373716)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(5011687013692741)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5289499230373720)
,p_view_id=>wwv_flow_api.id(5287946848373716)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(5011754706692742)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5289811291373722)
,p_view_id=>wwv_flow_api.id(5287946848373716)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(5011877875692743)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5290322785373723)
,p_view_id=>wwv_flow_api.id(5287946848373716)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(5011902998692744)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5290888741373725)
,p_view_id=>wwv_flow_api.id(5287946848373716)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(5012089625692745)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5291320844373726)
,p_view_id=>wwv_flow_api.id(5287946848373716)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(5012198444692746)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5291894999373728)
,p_view_id=>wwv_flow_api.id(5287946848373716)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(5012287866692747)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5292300307373729)
,p_view_id=>wwv_flow_api.id(5287946848373716)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(5012312017692748)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5292869673373730)
,p_view_id=>wwv_flow_api.id(5287946848373716)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(5012414333692749)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5293313600373732)
,p_view_id=>wwv_flow_api.id(5287946848373716)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(5012592287692750)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5293873240373733)
,p_view_id=>wwv_flow_api.id(5287946848373716)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(5282251664373601)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5294301666373735)
,p_view_id=>wwv_flow_api.id(5287946848373716)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(5282372540373602)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5294887532373736)
,p_view_id=>wwv_flow_api.id(5287946848373716)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(5282440591373603)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5295307063373738)
,p_view_id=>wwv_flow_api.id(5287946848373716)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(5282541296373604)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5283622868373615)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(5011332236692738)
,p_button_name=>'BTN_CNSLTAR'
,p_button_static_id=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5282921482373608)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5011019938692735)
,p_button_name=>'BTN_BSCR_CNDTOS'
,p_button_static_id=>'BTN_BSCR_CNDTOS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Buscar Candidatos'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5278322172318950)
,p_name=>'P2024006_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5011019938692735)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
,p_lov_display_null=>'YES'
,p_colspan=>5
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5278619505323628)
,p_name=>'P2024006_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5011019938692735)
,p_prompt=>'Sub - Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where id_impsto = :P2024006_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P2024006_ID_IMPSTO'
,p_ajax_items_to_submit=>'P2024006_ID_IMPSTO,P2024006_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5278944589328218)
,p_name=>'P2024006_VGNCIA_MIN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(5011019938692735)
,p_prompt=>unistr('Vigencia M\00EDnima')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_colspan=>2
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5279212471330914)
,p_name=>'P2024006_VGNCIA_MAX'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(5011019938692735)
,p_prompt=>unistr('Vigencia M\00E1xima')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>4
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5279523575333328)
,p_name=>'P2024006_DDA_MIN'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(5011019938692735)
,p_prompt=>unistr('Monto M\00EDnimo')
,p_format_mask=>'999G999G999G999G990D0000'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'center'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5279865689335342)
,p_name=>'P2024006_DDA_MAX'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(5011019938692735)
,p_item_default=>'999999999999'
,p_prompt=>unistr('Monto M\00E1ximo')
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>9
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'center'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5283442248373613)
,p_name=>'P2024006_JSON_PRMTROS'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(5011019938692735)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5283569609373614)
,p_name=>'P2024006_ID_LTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5011332236692738)
,p_prompt=>unistr('Lotes De Selecci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_prcsos_smu_lte || '' - '' || b.nmbre_trcro || '' - '' ||',
'       to_char(a.fcha_lte, ''yyyy-mm-dd'') as d,',
'       a.id_prcsos_smu_lte as r',
'  from cb_g_procesos_simu_lote a',
'  join v_sg_g_usuarios b',
'    on b.id_fncnrio = a.id_fncnrio',
' where  b.id_usrio = :F_ID_USRIO',
'   and a.id_prcso_tpo = 1;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'60%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9578330128995401)
,p_name=>'P2024006_ID_DSTNO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(5011019938692735)
,p_prompt=>'Destino'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_PREDIOS_DESTINO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d ,',
'        id_prdio_dstno r',
'   from df_i_predios_destino',
'   order by id_prdio_dstno'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>4
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9578451441995402)
,p_name=>'P2024006_ID_ESTRTO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(5011019938692735)
,p_prompt=>'Estrato'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_ESTRATO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_estrto d,',
'        cdgo_estrto r',
'   from df_s_estratos',
'   order by r;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9579162282995409)
,p_name=>'P2024006_NMRO_RGSTROS'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(5011019938692735)
,p_prompt=>'Cantidad Registros Por Lote'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>4
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9579294936995410)
,p_name=>'P2024006_PRDO_MAX'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(5011019938692735)
,p_prompt=>unistr('Periodo M\00E1ximo')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.prdo || '' - '' || a.dscrpcion as d, a.id_prdo as r',
'  from df_i_periodos a',
' where a.id_impsto = :P2024006_ID_IMPSTO',
'   and a.id_impsto_sbmpsto = :P2024006_ID_IMPSTO_SBMPSTO',
'   and a.vgncia = :P2024006_VGNCIA_MAX'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P2024006_ID_IMPSTO,P2024006_ID_IMPSTO_SBMPSTO,P2024006_VGNCIA_MAX'
,p_ajax_items_to_submit=>'P2024006_ID_IMPSTO,P2024006_ID_IMPSTO_SBMPSTO,P2024006_VGNCIA_MAX'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>4
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9579398745995411)
,p_name=>'P2024006_PRDO_MIN'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(5011019938692735)
,p_prompt=>unistr('Per\00EDodo M\00EDnimo')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.prdo || '' - '' || a.dscrpcion as d, a.id_prdo as r',
'  from df_i_periodos a',
' where a.id_impsto = :P2024006_ID_IMPSTO',
'   and a.id_impsto_sbmpsto = :P2024006_ID_IMPSTO_SBMPSTO',
'   and a.vgncia = :P2024006_VGNCIA_MIN'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P2024006_ID_IMPSTO,P2024006_ID_IMPSTO_SBMPSTO,P2024006_VGNCIA_MIN'
,p_ajax_items_to_submit=>'P2024006_ID_IMPSTO,P2024006_ID_IMPSTO_SBMPSTO,P2024006_VGNCIA_MIN'
,p_ajax_optimize_refresh=>'Y'
,p_colspan=>2
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9579562787995413)
,p_name=>'P2024006_CLSFCCION'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(5011019938692735)
,p_prompt=>unistr('Clasificaci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_CLASIFICACION_PREDIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_prdio_clsfccion d,',
'       cdgo_prdio_clsfccion  r   ',
'  from df_s_predios_clasificacion',
'  order by cdgo_prdio_clsfccion'))
,p_lov_display_null=>'YES'
,p_colspan=>2
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9579649748995414)
,p_name=>'P2024006_TPO_PRSNA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(5011019938692735)
,p_prompt=>'Tipo Persona'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>unistr('STATIC:Natural;N,Jur\00EDdica;J')
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9579759468995415)
,p_name=>'P2024006_TPO_RGMN'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(5011019938692735)
,p_prompt=>unistr('R\00E9gimen')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>' LV_RGMEN'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rgmen_tpo d ,',
'       cdgo_rgmen_tpo r ',
'from DF_C_REGIMENES_TIPO',
'order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>9
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5011180777692736)
,p_name=>'al cambiar P2024006_ID_IMPSTO'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2024006_ID_IMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5011286442692737)
,p_event_id=>wwv_flow_api.id(5011180777692736)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select min(id_impsto_sbmpsto)',
'      into :P2024006_ID_IMPSTO_SBMPSTO',
'      from df_i_impuestos_subimpuesto',
'     where id_impsto = :P2024006_ID_IMPSTO;',
'end;'))
,p_attribute_02=>'P2024006_ID_IMPSTO,P2024006_ID_IMPSTO_SBMPSTO'
,p_attribute_03=>'P2024006_ID_IMPSTO_SBMPSTO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9578599297995403)
,p_event_id=>wwv_flow_api.id(5011180777692736)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buscaImpuesto() {',
'    try {',
'        apex.server.process("buscarImpuesto", {',
'            pageItems: "#P2024006_ID_IMPSTO"',
'        }, {',
'            success: function(data) {',
'                if (data.o_cdgo_impsto !== ''IPU'') {',
'                    apex.item("P2024006_ID_DSTNO").hide();',
'                    apex.item("P2024006_ID_ESTRTO").hide();',
'                    apex.item("P2024006_CLSFCCION").hide();',
'                    apex.item("P2024006_TPO_PRSNA").show();',
'                    apex.item("P2024006_TPO_RGMN").show();',
'                } else {',
'                    apex.item("P2024006_ID_DSTNO").show();                    ',
'                    apex.item("P2024006_CLSFCCION").show();',
'                    apex.item("P2024006_TPO_PRSNA").hide();',
'                    apex.item("P2024006_TPO_RGMN").hide();',
'                }',
'            }',
'        });',
'    } catch (e) {',
'        console.log(e);',
'    }',
'}',
'',
'buscaImpuesto();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5283011634373609)
,p_name=>'Al dar clic en BTN_BSCR_CNDTOS'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(5282921482373608)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5283178918373610)
,p_event_id=>wwv_flow_api.id(5283011634373609)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buscarcandidatos() {',
'   /* console.log(''Destino: '',apex.item("P2024006_ID_DSTNO").getValue());',
'    console.log(''Estrato: '',apex.item("P2024006_ID_ESTRTO").getValue());',
'    console.log(''TPO_PRSNA: '',apex.item("P2024006_TPO_PRSNA").getValue());',
'    console.log(''TPO_RGMN: '',apex.item("P2024006_TPO_RGMN").getValue());*/',
'    ',
'    buildJson();',
'    ',
'    apex.server.process("seleccionPoblacion", {',
'        pageItems: "#F_CDGO_CLNTE, #F_ID_FNCNRIO, #P2024006_JSON_PRMTROS, #P2024006_NMRO_RGSTROS"',
'    }, {',
'        success: function(data) {',
'            apex.message.clearErrors();',
'            if (data.o_cdgo_rspsta != 0) {',
'                apex.message.showErrors([{',
'                    type: "error",',
'                    location: "page",',
'                    message: "Error al procesar el job: "+data.o_msg_rspsta,',
'                    unsafe: false',
'                }]);',
'            } else {',
'                apex.message.alert(',
unistr('                    "El proceso de b\00FAsqueda puede tardar unos minutos, se le informar\00E1 cuando termine al correo " + data.o_email,'),
'                    function() {',
'                        console.log("Mensaje cerrado.");',
'                        setTimeout(function() {',
'                            closeModal();',
'                        }, 1000);',
'                    }',
'                );',
'            }',
'        },',
'        error: function(xhr, status, error) {',
'            console.error("Error en la llamada Ajax:", status, error);',
unistr('            apex.message.alert("Ocurri\00F3 un error al procesar la solicitud. Por favor, int\00E9ntelo de nuevo.");'),
'        }',
'    });',
'}',
'',
'function closeModal() {',
'    apex.navigation.dialog.close(true);',
'}',
'',
'if (validacion()) {',
'    buscarcandidatos();',
'}',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4006998295945102)
,p_name=>'al seleccionar'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(5011332236692738)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4007090633945103)
,p_event_id=>wwv_flow_api.id(4006998295945102)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function obtenerJsonActos() {',
'    var region = apex.region(''candidatos'');',
'    var objeto = [];',
'',
'    if (!region) {',
unistr('        console.error("No se encontr\00F3 la regi\00F3n ''candidatos''.");'),
'        return;',
'    }',
'',
'    var view = region.widget().interactiveGrid("getViews", "grid");',
'    if (!view) {',
'        console.error("No se pudo obtener la vista del Interactive Grid.");',
'        return;',
'    }',
'',
'    var model = view.model;',
'',
'    // Obtener los registros seleccionados',
'    var selectedRecords = view.view$.grid("getSelectedRecords");',
'    if (selectedRecords.length === 0) {',
'        console.log("No hay registros seleccionados.");',
'        return;',
'    }',
'',
unistr('    // Filtrar los registros seleccionados que no est\00E1n procesados'),
'    const filteredRecords = selectedRecords.filter(record => model.getValue(record, "INDCDOR_PRCSDO") === ''N'');',
'',
'    if (filteredRecords.length === 0) {',
'        console.log("No hay registros seleccionados y no procesados para procesar.");',
'        return;',
'    }',
'',
'    // Construir el objeto JSON con los registros filtrados',
'    objeto = filteredRecords.map(record => ({',
'        ID_PRCSOS_SMU_SJTO: model.getValue(record, "ID_PRCSOS_SMU_SJTO").trim(),',
'        ID_SJTO: model.getValue(record, "ID_SJTO").trim(),',
'        VLOR_TTAL_DDA: model.getValue(record, "VLOR_TTAL_DDA").trim(),',
'        IDNTFCCION: model.getValue(record, "IDNTFCCION").trim(),',
'        ID_PRCSOS_SMU_LOTE: $v(''P2024006_ID_PRCSO_SMU_LOTE''),',
'        INDCDOR_PRCSDO: model.getValue(record, "INDCDOR_PRCSDO").trim()',
'    }));',
'',
'    // Convertir a JSON y almacenar en localStorage',
'    var v_json = JSON.stringify(objeto);',
'    window.localStorage.setItem(''v_json'', v_json);',
'',
'    // Log de salida',
'    console.log(''v_json:'', v_json);',
'}',
'',
unistr('// Ejecutar la funci\00F3n'),
'obtenerJsonActos();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9578752407995405)
,p_name=>'Al cambiar P2024006_ID_DSTNO'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2024006_ID_DSTNO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9578897866995406)
,p_event_id=>wwv_flow_api.id(9578752407995405)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function vlidarDestino(){',
'    try{',
'        apex.server.process ("buscarDestino",{',
'            pageItems: "#P2024006_ID_IMPSTO, #P2024006_ID_DSTNO"',
'        },{',
'            success: function(data){',
'                if (data.o_dstno != 1){',
'                    apex.item("P2024006_ID_ESTRTO").hide();',
'                }else{',
'                    apex.item("P2024006_ID_ESTRTO").show();',
'                }',
'            }',
'        })',
'    }catch(e){',
'        console.log(e)',
'        }',
'}',
'',
'vlidarDestino();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5283393615373612)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'seleccionPoblacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_clnte     NUMBER := :F_CDGO_CLNTE;',
'    v_json_prmtros   CLOB   := :P2024006_JSON_PRMTROS;',
'    v_id_fncnrio     NUMBER := :F_ID_FNCNRIO;',
'    v_id_usrio       number := :F_ID_USRIO;',
'    v_job_state      VARCHAR2(50);',
unistr('    v_cdgo_rspsta    NUMBER := 0; -- C\00F3digo de respuesta (0=\00E9xito, 1=error)'),
'    v_msg_rspsta     VARCHAR2(4000); -- Mensaje de respuesta',
'begin',
unistr('    -- Validaci\00F3n de par\00E1metros'),
'    if v_cdgo_clnte is null or v_json_prmtros is null or v_id_fncnrio is null then',
'        v_cdgo_rspsta := 1;',
unistr('        v_msg_rspsta := ''Los par\00E1metros de entrada no pueden ser nulos.'';'),
'        raise_application_error(-20001, v_msg_rspsta);',
'    end if;',
'',
unistr('    -- Configuraci\00F3n del job'),
'    begin',
'        DBMS_SCHEDULER.set_attribute(name => ''IT_GENERA_SLCCION_PRSSVO_CDDTOS'', ',
'                                     attribute => ''job_action'', ',
'                                     value => ''pkg_cb_proceso_persuasivo.prc_rg_slccion_cndtos'');',
'                                     ',
'        DBMS_SCHEDULER.set_attribute(name => ''IT_GENERA_SLCCION_PRSSVO_CDDTOS'', ',
'                                     attribute => ''number_of_arguments'', ',
'                                     value => 5);',
'',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE(job_name => ''IT_GENERA_SLCCION_PRSSVO_CDDTOS'', ',
'                                              argument_position => 1, ',
'                                              argument_value => v_cdgo_clnte);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE(job_name => ''IT_GENERA_SLCCION_PRSSVO_CDDTOS'', ',
'                                              argument_position => 2, ',
'                                              argument_value => v_json_prmtros);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE(job_name => ''IT_GENERA_SLCCION_PRSSVO_CDDTOS'', ',
'                                              argument_position => 3, ',
'                                              argument_value => v_id_fncnrio);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE(job_name => ''IT_GENERA_SLCCION_PRSSVO_CDDTOS'', ',
'                                              argument_position => 4, ',
'                                              argument_value => v_id_usrio);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE(job_name => ''IT_GENERA_SLCCION_PRSSVO_CDDTOS'', ',
'                                              argument_position => 5, ',
'                                              argument_value => :P2024006_NMRO_RGSTROS);                                      ',
'',
'        -- Deshabilitar y habilitar el job para reiniciar su estado',
'        DBMS_SCHEDULER.DISABLE(''IT_GENERA_SLCCION_PRSSVO_CDDTOS'');',
'        DBMS_SCHEDULER.ENABLE(''IT_GENERA_SLCCION_PRSSVO_CDDTOS'');',
'',
'        -- Verificar el estado del job',
'        select state',
'        into v_job_state',
'        from user_scheduler_jobs',
'        where job_name = ''IT_GENERA_SLCCION_PRSSVO_CDDTOS'';',
'',
'        if (v_job_state = ''SCHEDULED'' or v_job_state = ''RUNNING'') then',
'            v_cdgo_rspsta := 0;',
'            v_msg_rspsta := ''El job fue habilitado correctamente.'';',
'        else',
'            v_cdgo_rspsta := 1;',
unistr('            v_msg_rspsta := ''El job no se habilit\00F3 correctamente. Estado: '' || v_job_state;'),
'        end if;',
'',
'    exception',
'        when others then',
'            v_cdgo_rspsta := 1;',
unistr('            v_msg_rspsta := ''Error en la configuraci\00F3n del job: '' || sqlerrm;'),
'    end;',
'',
'    -- Generar respuesta JSON',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_msg_rspsta'', v_msg_rspsta);',
'    apex_json.close_object;',
'',
'exception',
'    when others then',
unistr('        rollback; -- Opcional, seg\00FAn tu contexto'),
'        v_cdgo_rspsta := 1;',
'        v_msg_rspsta := ''Error general: '' || sqlerrm;',
'',
'        -- Generar respuesta JSON en caso de error',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_msg_rspsta'', v_msg_rspsta);',
'        apex_json.close_object;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9578627992995404)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'buscarImpuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_impsto df_c_impuestos.cdgo_impsto%type;',
'    v_mnsje_rspsta varchar2(4000);',
'begin',
'    v_mnsje_rspsta := ''Impuesto encontrado'';',
'    begin',
'        select cdgo_impsto',
'          into v_cdgo_impsto',
'          from df_c_impuestos',
'         where id_impsto = :P2024006_ID_IMPSTO;',
'   exception',
'        when no_data_found then',
'          v_cdgo_impsto := null;',
'          v_mnsje_rspsta := ''Error al consultar el impuesto. ''||sqlerrm;',
'        when others then ',
'          v_cdgo_impsto := null;',
'          v_mnsje_rspsta := ''Error al consultar el impuesto. ''||sqlerrm;',
'   end; ',
'   ',
'   apex_json.open_object;  ',
'   apex_json.write(''o_cdgo_impsto'', v_cdgo_impsto); ',
'   apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta); ',
'   apex_json.close_object;',
'  ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9578919234995407)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'buscarDestino'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_dstno number;',
'    v_mnsje_rspsta varchar2(4000);',
'begin',
'    v_mnsje_rspsta := ''Impuesto encontrado'';',
'    begin',
'        select 1',
'     into v_dstno',
'     from df_i_predios_destino a',
'    where id_impsto = :P2024006_ID_IMPSTO',
'    and id_prdio_dstno = :P2024006_ID_DSTNO',
'      and a.indcdor_usa_estrto = ''S'';',
'   exception',
'        when no_data_found then',
'          v_dstno := 0;',
'          v_mnsje_rspsta := ''Error al consultar el destino. ''||sqlerrm;',
'        when others then ',
'          v_dstno := 0;',
'          v_mnsje_rspsta := ''Error al consultar el destino. ''||sqlerrm;',
'   end; ',
'   ',
'   apex_json.open_object;  ',
'   apex_json.write(''o_dstno'', v_dstno); ',
'   apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta); ',
'   apex_json.close_object;',
'  ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
