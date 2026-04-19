prompt --application/pages/page_00139
begin
wwv_flow_api.create_page(
 p_id=>139
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'BK Cartera para Ajuste'
,p_step_title=>'BK Cartera para Ajuste'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function recorrer_grid() { ',
'    ',
'   var region = apex.region("conceptos_ajustes");',
'   var id_ajuste = $(''#P106_ID_AJSTE'').val();',
'    ',
'    if (region && !id_ajuste) {',
'        ',
'       var view = apex.region("conceptos_ajustes").widget().interactiveGrid("getViews", "grid");',
'       var model = view.model;  ',
'       var records = view.view$.grid("getSelectedRecords");       ',
'        ',
'       var json = records.map(function(record){           ',
'           return { "VGNCIA": model.getValue(record, "VGNCIA").trim(),',
'                    "ID_PRDO": model.getValue(record, "ID_PRDO"),',
'                    "ID_CNCPTO": model.getValue(record, "ID_CNCPTO"),',
'                    "VLOR_SLDO_CPTAL": model.getValue(record, "VLOR_SLDO_CPTAL").trim().split(''.'').join(''''),',
'                    "VLOR_AJSTE": model.getValue(record, "VLOR_AJSTE").trim().split(''.'').join('''')',
'                  };',
'       }).filter(function(f){',
'          return parseFloat(f["VLOR_AJSTE"]) > 0 ;',
'       }); ',
'       $(''#P106_JSON'').val(json.length > 0 ? JSON.stringify(json) : '''');     ',
'   } ',
'   ',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'MCARO'
,p_last_upd_yyyymmddhh24miss=>'20191206082921'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(172523498456444929)
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
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(349276963545382191)
,p_plug_name=>'<b>Insertar Valor del Ajuste</b>'
,p_region_name=>'conceptos_ajustes'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.vgncia ,',
'        a.id_prdo,',
'        a.prdo,',
'        a.id_cncpto,',
'        a.cdgo_cncpto,',
'        a.dscrpcion_cncpto ,',
'        a.vlor_sldo_cptal,',
'         ''$'' || to_char(a.vlor_sldo_cptal, ''999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.'''''') vlor_sldo_cptal_mascarca,',
'        nvl(a.vlor_intres,0) vlor_intres,',
'          ''$'' || to_char( nvl(a.vlor_intres,0), ''999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.'''''') vlor_intres_mascara,',
'        rownum as num',
' from v_gf_g_cartera_x_concepto a',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.id_sjto_impsto = :P139_ID_SJTO_IMPSTO',
'  and a.vlor_sldo_cptal > 0;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P139_ID_AJSTE'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(212864544850031825)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(212864684419031826)
,p_name=>'ID_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(220449051672734037)
,p_name=>'VLOR_SLDO_CPTAL_MASCARCA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL_MASCARCA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Valor Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>13
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
 p_id=>wwv_flow_api.id(220449162006734038)
,p_name=>'VLOR_INTRES_MASCARA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES_MASCARA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Valor Inter\00E9s ')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>13
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
 p_id=>wwv_flow_api.id(222351758060551828)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(351332570212377984)
,p_name=>'VLOR_AJSTE'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Ajuste'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_is_required=>true
,p_static_id=>'estilo'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    options.features = options.features || {};',
'    options.features.sort = false;',
'    return options;',
'}'))
,p_enable_hide=>true
,p_help_text=>'Valor ajuste no puede ser cero ni nulo'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(351333763873377996)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
 p_id=>wwv_flow_api.id(351334031900377998)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
 p_id=>wwv_flow_api.id(351334153768378000)
,p_name=>'CDGO_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(351334258840378001)
,p_name=>'DSCRPCION_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Descripci\00F3n Concepto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(351334396353378002)
,p_name=>'VLOR_SLDO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_format_mask=>'999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(351334530074378003)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_format_mask=>'999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(351334593602378004)
,p_name=>'NUM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NUM'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(349277209134382193)
,p_internal_uid=>349277209134382193
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_no_data_found_message=>'La consulta no arrojo resultado'
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
 p_id=>wwv_flow_api.id(350655891273045223)
,p_interactive_grid_id=>wwv_flow_api.id(349277209134382193)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(350655956719045224)
,p_report_id=>wwv_flow_api.id(350655891273045223)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(212970482767853806)
,p_view_id=>wwv_flow_api.id(350655956719045224)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(212864544850031825)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(212970980027853809)
,p_view_id=>wwv_flow_api.id(350655956719045224)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(212864684419031826)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(221338936334240083)
,p_view_id=>wwv_flow_api.id(350655956719045224)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(220449051672734037)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>260
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(221339360357240085)
,p_view_id=>wwv_flow_api.id(350655956719045224)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(220449162006734038)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>264
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(351358915498457943)
,p_view_id=>wwv_flow_api.id(350655956719045224)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(351332570212377984)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>318
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(351383302689628244)
,p_view_id=>wwv_flow_api.id(350655956719045224)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(351333763873377996)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(351384883683628265)
,p_view_id=>wwv_flow_api.id(350655956719045224)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(351334031900377998)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(351386452716628270)
,p_view_id=>wwv_flow_api.id(350655956719045224)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(351334153768378000)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(351387319167628273)
,p_view_id=>wwv_flow_api.id(350655956719045224)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(351334258840378001)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>415
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(351388095596628275)
,p_view_id=>wwv_flow_api.id(350655956719045224)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(351334396353378002)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(351388890632628277)
,p_view_id=>wwv_flow_api.id(350655956719045224)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(351334530074378003)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(351389645202628279)
,p_view_id=>wwv_flow_api.id(350655956719045224)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(351334593602378004)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(350465749219657405)
,p_plug_name=>unistr('<b>Informaci\00F3n</b>')
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(349923265912696384)
,p_plug_name=>'Datos del Sujeto Tributo'
,p_parent_plug_id=>wwv_flow_api.id(350465749219657405)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.id_sjto_impsto,   ',
'        a.nmbre_impsto,',
'        a.idntfccion_sjto,',
'        a.drccion,',
'        '' '' || a.nmbre_mncpio || '' - '' || upper(a.nmbre_dprtmnto)  || '' '' ||a.nmbre_pais  ubicacion,',
'        a.dscrpcion_sjto_estdo ',
'   from v_si_i_sujetos_impuesto a',
'  where a.cdgo_clnte      = :F_CDGO_CLNTE',
'    and a.id_sjto_impsto  = :P139_ID_SJTO_IMPSTO'))
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
 p_id=>wwv_flow_api.id(349923374400696385)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'La consulta no arrojo resultado'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'AALFARO'
,p_internal_uid=>349923374400696385
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93133056131059055)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>10
,p_column_identifier=>'F'
,p_column_label=>'SJTO_IMPSTO'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93132296826059055)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'Impuesto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93131421162059055)
,p_db_column_name=>'DRCCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93131801924059055)
,p_db_column_name=>'UBICACION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Ubicaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93132652941059055)
,p_db_column_name=>'DSCRPCION_SJTO_ESTDO'
,p_display_order=>60
,p_column_identifier=>'B'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93131002383059054)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>70
,p_column_identifier=>'J'
,p_column_label=>unistr('Identificaci\00F3n del Sujeto')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(349966905874229641)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'931334'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'NMBRE_IMPSTO:DSCRPCION_SJTO_ESTDO:DRCCION:UBICACION:ID_SJTO_IMPSTO:IDNTFCCION_SJTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(350051418256713598)
,p_plug_name=>'Datos del Predio'
,p_parent_plug_id=>wwv_flow_api.id(350465749219657405)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select ',
'    a.dscrpcion_prdo_dstno,',
'    a.dscrpcion_estrto,',
'    a.dscrpcion_prdio_clsfccion',
'    ,a.avluo_ctstral,',
'    a.avluo_cmrcial,',
'    a.area_cnstrda,',
'    a.mtrcla_inmblria,',
'    a.nmbre_dstno_igac ',
'  from v_si_i_predios a ',
'  join si_i_sujetos_impuesto b ',
'--   on a.id_sjto = b.id_sjto',
'  on a.id_sjto_impsto = b.id_sjto_impsto',
' where  b.id_sjto_impsto  = :P139_ID_SJTO_IMPSTO ;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select  a.cdgo_sjto_tpo',
' from v_si_i_sujetos_impuesto a',
' where a.id_sjto_impsto   = :P139_ID_SJTO_IMPSTO  and a.cdgo_clnte = :F_CDGO_CLNTE and  a.cdgo_sjto_tpo = ''P'';'))
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
 p_id=>wwv_flow_api.id(350051627820713600)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'AALFARO'
,p_internal_uid=>350051627820713600
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93134140270059059)
,p_db_column_name=>'DSCRPCION_PRDO_DSTNO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Destino'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93134586125059059)
,p_db_column_name=>'DSCRPCION_ESTRTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Estrato'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93134961471059059)
,p_db_column_name=>'DSCRPCION_PRDIO_CLSFCCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Clasificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93135308994059059)
,p_db_column_name=>'AVLUO_CTSTRAL'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Aval\00FAo Catrastral')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93135744971059060)
,p_db_column_name=>'AVLUO_CMRCIAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Aval\00FAo Comercial')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93136191837059060)
,p_db_column_name=>'AREA_CNSTRDA'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('\00C1rea Construida')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93136592900059060)
,p_db_column_name=>'MTRCLA_INMBLRIA'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Matr\00EDcula')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93136953557059061)
,p_db_column_name=>'NMBRE_DSTNO_IGAC'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Destino Igac'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(350447768557909203)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'931373'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_PRDO_DSTNO:DSCRPCION_ESTRTO:DSCRPCION_PRDIO_CLSFCCION:AVLUO_CTSTRAL:AVLUO_CMRCIAL:AREA_CNSTRDA:MTRCLA_INMBLRIA:NMBRE_DSTNO_IGAC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(350053604241713620)
,p_plug_name=>unistr('Datos del Veh\00EDculo')
,p_parent_plug_id=>wwv_flow_api.id(350465749219657405)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select ',
'    a.nmbre_vhclo_mrca,',
'    a.vlor_cmrcial,',
'    a.avluo,',
'    a.fcha_cmpra,',
'    a.nmro_mtrcla,',
'    a.nmro_mtor, ',
'    a.nmbre_vhclo_clse,',
'    a.nmbre_vhclo_ctgtria ',
' from v_si_i_vehiculos a',
' where a.id_sjto_impsto    = :P139_ID_SJTO_IMPSTO'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select  a.cdgo_sjto_tpo',
' from v_si_i_sujetos_impuesto a',
' where a.id_sjto_impsto   = :P139_ID_SJTO_IMPSTO  and a.cdgo_clnte = :F_CDGO_CLNTE and  a.cdgo_sjto_tpo = ''V'';'))
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
 p_id=>wwv_flow_api.id(350053667651713621)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'La consulta no arrojo resultado'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'AALFARO'
,p_internal_uid=>350053667651713621
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93138032518059062)
,p_db_column_name=>'NMBRE_VHCLO_MRCA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Veh\00EDculo marca')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93138475156059062)
,p_db_column_name=>'VLOR_CMRCIAL'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Valor comercial'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93138848376059063)
,p_db_column_name=>'AVLUO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Aval\00FAo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93139213560059063)
,p_db_column_name=>'FCHA_CMPRA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Fecha Compra'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93139647116059063)
,p_db_column_name=>'NMRO_MTRCLA'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('N\00FAmero Matr\00EDcula')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93140012271059063)
,p_db_column_name=>'NMRO_MTOR'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('N\00FAmero Motor')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93140430823059063)
,p_db_column_name=>'NMBRE_VHCLO_CLSE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Clase Veh\00EDculo')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93140878665059064)
,p_db_column_name=>'NMBRE_VHCLO_CTGTRIA'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Categor\00EDa Veh\00EDculo')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(351212439018269836)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'931412'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_VHCLO_MRCA:VLOR_CMRCIAL:AVLUO:FCHA_CMPRA:NMRO_MTRCLA:NMRO_MTOR:NMBRE_VHCLO_CLSE:NMBRE_VHCLO_CTGTRIA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(350054582866713630)
,p_plug_name=>'Datos del Propietario'
,p_parent_plug_id=>wwv_flow_api.id(350465749219657405)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select ',
'    a.nmbre_rzon_scial,',
'    a.dscrpcion_idntfccion_tpo ,',
'    a.idntfccion_rspnsble ,',
'     case when prncpal_s_n = ''S'' then',
'       ''<input type="checkbox" name="prncpal_s_n" disabled="true" checked>'' ',
'        else  ',
'       ''<input type="checkbox" name="prncpal_s_n" disabled="true">'' ',
'       end as prncpal_s_n',
'  from v_si_i_sujetos_responsable a',
'  join si_i_sujetos_impuesto b on a.id_sjto = b.id_sjto',
'  where a.cdgo_clnte     = :F_CDGO_CLNTE',
'  and a.id_sjto  = :P139_ID_SJTO_IMPSTO'))
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
 p_id=>wwv_flow_api.id(350465335395657400)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'La consulta no arrojo resultado'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'AALFARO'
,p_internal_uid=>350465335395657400
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93142391525059065)
,p_db_column_name=>'DSCRPCION_IDNTFCCION_TPO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Tipo Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93142781762059065)
,p_db_column_name=>'IDNTFCCION_RSPNSBLE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93143133980059065)
,p_db_column_name=>'PRNCPAL_S_N'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Principal '
,p_column_html_expression=>'<input type="checkbox" checked >'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93141958102059064)
,p_db_column_name=>'NMBRE_RZON_SCIAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Raz\00F3n Social')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(350487731006932902)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'931435'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_IDNTFCCION_TPO:IDNTFCCION_RSPNSBLE:PRNCPAL_S_N:NMBRE_RZON_SCIAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(350465854095657406)
,p_plug_name=>'<b>Datos del Ajuste</b>'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(526065394674970068)
,p_plug_name=>'<b>Datos del Ajuste</b>'
,p_parent_plug_id=>wwv_flow_api.id(350465854095657406)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>80
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_plug_read_only_when=>'P139_ID_AJSTE'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(352541638282854614)
,p_plug_name=>'<b>Ajuste Detalle</b>'
,p_region_name=>'conceptos_ajustess'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    id_ajste_dtlle, ',
'    id_ajste,',
'    dscrpcion_concepto,',
'    vgncia,',
'    dscrpcion_periodo,',
'    sldo_cptal,',
'    vlor_ajste,',
'      ''$'' || to_char(vlor_ajste, ''999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.'''''') vlor_ajste_mascara',
'  from v_gf_g_ajuste_detalle ',
'where id_ajste = :P139_ID_AJSTE;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P139_ID_AJSTE'
,p_plug_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_plug_read_only_when=>'P139_ID_AJSTE'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(203931822694223338)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(203931939436223339)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(220449404518734041)
,p_name=>'VLOR_AJSTE_MASCARA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_AJSTE_MASCARA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Valor Ajuste'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(353243968143131494)
,p_name=>'ID_AJSTE_DTLLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_AJSTE_DTLLE'
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
 p_id=>wwv_flow_api.id(353244063412131495)
,p_name=>'ID_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_AJSTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(353244185606131496)
,p_name=>'DSCRPCION_CONCEPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CONCEPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(353244315310131497)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(353244342436131498)
,p_name=>'DSCRPCION_PERIODO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_PERIODO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(353244442089131499)
,p_name=>'SLDO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SLDO_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Saldo Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(353244552058131500)
,p_name=>'VLOR_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_AJSTE'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(353243854168131493)
,p_internal_uid=>353243854168131493
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
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
 p_id=>wwv_flow_api.id(353275407316172417)
,p_interactive_grid_id=>wwv_flow_api.id(353243854168131493)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(353275537328172417)
,p_report_id=>wwv_flow_api.id(353275407316172417)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(221535402886703727)
,p_view_id=>wwv_flow_api.id(353275537328172417)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(220449404518734041)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(222594389351572208)
,p_view_id=>wwv_flow_api.id(353275537328172417)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(203931822694223338)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>157
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(353275940565172419)
,p_view_id=>wwv_flow_api.id(353275537328172417)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(353243968143131494)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(353276460175172421)
,p_view_id=>wwv_flow_api.id(353275537328172417)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(353244063412131495)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(353276937876172423)
,p_view_id=>wwv_flow_api.id(353275537328172417)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(353244185606131496)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(353277451750172424)
,p_view_id=>wwv_flow_api.id(353275537328172417)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(353244315310131497)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(353277998736172426)
,p_view_id=>wwv_flow_api.id(353275537328172417)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(353244342436131498)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(353278522443172427)
,p_view_id=>wwv_flow_api.id(353275537328172417)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(353244442089131499)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(353278961810172429)
,p_view_id=>wwv_flow_api.id(353275537328172417)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(353244552058131500)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(437055708117738861)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(521730868212532505)
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
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(528991412021648590)
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
'<p>Esta funcionalidad permite gestionar los procesos de ajustes .</p>',
'<p>En esta etapa se Registra el Ajuste.</p>',
'<p>Se debe ingresar el valor del ajuste en la seccion Insertar Valor del Ajustes en el campo Valor Ajuste. </p>',
unistr('<p>Hacer clic en el bot\00F3n <b>Insertar Ajuste</b> para pasar a la siguiente etapa del proceso. </p>'),
'<p><b>Nota:</b> Solo se enviaran los conceptos seleccionados y con valor ajuste mayor a cero. </p>',
'</i>',
'</br>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(93130015670059051)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(521730868212532505)
,p_button_name=>'BTN_INSRTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar Ajuste'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.id_cncpto',
'  from v_gf_g_cartera_x_concepto a',
' where a.cdgo_clnte        = :F_CDGO_CLNTE',
'   and a.id_sjto_impsto    = :P102_ID_SJTO_IMPSTO',
'   and a.id_impsto         = :P102_ID_IMPSTO',
'   and a.id_impsto_sbmpsto = :P102_ID_IMPSTO_SBMPSTO ',
'   and a.vlor_sldo_cptal   > 0',
'   and :P139_ID_AJSTE is null'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(93125769431059046)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(437055708117738861)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(93126198177059047)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(437055708117738861)
,p_button_name=>'BTN_CONSLTR_PRMTROS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>unistr('Consulta Par\00E1metros')
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::P3_NMRO_APP,P3_NMRO_PGNA,P3_NMBRE_ITEM,P3_ID_IMPSTO:&APP_ID.,&APP_PAGE_ID.,P139_ID_SJTO_IMPSTO,&P139_ID_IMPSTO.'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93126544688059047)
,p_name=>'P139_NMBRE_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(437055708117738861)
,p_use_cache_before_default=>'NO'
,p_prompt=>'<b>Impuesto</b>'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto ',
'  from v_df_c_impuestos',
' where id_impsto = :P102_ID_IMPSTO',
' and cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93126904902059049)
,p_name=>'P139_NMBRE_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(437055708117738861)
,p_use_cache_before_default=>'NO'
,p_prompt=>'<b>Sub Impuesto</b>'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto    ',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P139_ID_IMPSTO',
' order by 1',
' ',
'  /* and id_impsto = :P102_ID_IMPSTO */'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93127349864059049)
,p_name=>'P139_ID_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(437055708117738861)
,p_source=>'P102_ID_IMPSTO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93127742717059049)
,p_name=>'P139_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(437055708117738861)
,p_use_cache_before_default=>'NO'
,p_source=>'P102_ID_IMPSTO_SBMPSTO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93128125945059050)
,p_name=>'P139_ID_SJTO_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(437055708117738861)
,p_source=>'P102_ID_SJTO_IMPSTO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93128576236059050)
,p_name=>'P139_IDNTFCCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(437055708117738861)
,p_item_default=>':P102_IDNTFCCION'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>unistr('<b>Identificaci\00F3n</b>')
,p_source=>'P102_IDNTFCCION'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93128936408059050)
,p_name=>'P139_RSPSTA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(437055708117738861)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93129391121059050)
,p_name=>'P139_XML'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(437055708117738861)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93144548991059066)
,p_name=>'P139_NMRO_SLCTUD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(526065394674970068)
,p_prompt=>unistr('N\00FAmero Solicitud')
,p_source=>'P105_NMRO_SLCTUD'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93144928865059067)
,p_name=>'P139_ID_AJSTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(526065394674970068)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93145371775059067)
,p_name=>'P139_FCHA_DCMNTO_SPRTE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(526065394674970068)
,p_prompt=>'Fecha Documento '
,p_source=>'P105_FCHA_DCMNTO_SPRTE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93145720775059067)
,p_name=>'P139_ID_AJSTE_MTVO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(526065394674970068)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Motivo'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'from gf_d_ajuste_motivo ',
'where cdgo_clnte=:f_cdgo_clnte and id_ajste_mtvo = :P139_ID_AJSTE_MTVO;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93146161191059068)
,p_name=>'P139_TPO_DCMNTO_SPRTE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(526065394674970068)
,p_prompt=>'Tipo Documento Soporte'
,p_source=>'P105_TPO_DCMNTO_SPRTE'
,p_source_type=>'ITEM'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_acto,id_prcso ',
'from   v_gn_g_actos_tipo',
'-- where cdgo_clnte = :f_cdgo_clnte and id_prcso=6;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93146548606059069)
,p_name=>'P139_NMRO_DCMTO_SPRTE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(526065394674970068)
,p_prompt=>unistr('N\00FAmero Documento Soporte')
,p_source=>'P105_NMRO_DCMTO_SPRTE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93146934713059069)
,p_name=>'P139_OBSRVCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(526065394674970068)
,p_prompt=>unistr('Observaci\00F3n')
,p_source=>'P105_OBSRVCION'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93147348369059069)
,p_name=>'P139_CDGO_ESTDO_AJSTE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(526065394674970068)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Estado'
,p_source=>'CDGO_AJSTE_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select ',
'    dscrpcion,',
'    cdgo_ajste_estdo ',
' from gf_d_ajuste_estado',
'where cdgo_ajste_estdo  = :P139_CDGO_ESTDO_AJSTE'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_display_when=>'P139_ID_AJSTE'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93153854478059074)
,p_name=>'P139_JSON'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(349276963545382191)
,p_item_default=>'999'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(93155319267059082)
,p_computation_sequence=>10
,p_computation_item=>'P139_ID_AJSTE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_ajste from gf_g_ajustes ',
'            where id_instncia_fljo =:F_ID_INSTNCIA_FLJO;'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(93155789593059082)
,p_validation_name=>unistr('\00CDtem Numero Solicitud no nulo')
,p_validation_sequence=>50
,p_validation=>'P139_NMRO_SLCTUD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor ingrese el numero de solicitud de Ajuste'
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(93130015670059051)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(93156956787059083)
,p_validation_name=>unistr('\00CDtem Tipo Ajuste no nulo')
,p_validation_sequence=>60
,p_validation=>'P139_TPO_AJSTE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor escoja el tipo de ajuste a realizar'
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(93130015670059051)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(93156552543059082)
,p_validation_name=>unistr('\00CDtem Id.Motivo no nulo')
,p_validation_sequence=>70
,p_validation=>'P139_ID_AJSTE_MTVO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor escoja el motivo de ajuste a realizar'
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(93130015670059051)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(93156141220059082)
,p_validation_name=>'Item Fecha Documento no nulo'
,p_validation_sequence=>80
,p_validation=>'P139_FCHA_DCMNTO_SPRTE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor ingrese la fecha del documento'
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(93130015670059051)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(93157361211059083)
,p_validation_name=>'Item Tipo Documento no nulo'
,p_validation_sequence=>90
,p_validation=>'P139_TPO_DCMNTO_SPRTE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor ingrese el tipo de documento soporte'
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(93130015670059051)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(93157701221059083)
,p_validation_name=>'Item Num Documento no nulo'
,p_validation_sequence=>100
,p_validation=>'P139_NMRO_DCMTO_SPRTE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor ingrese el numero de documento soporte'
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(93130015670059051)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(93158113785059083)
,p_validation_name=>'Item Observacion no nulo'
,p_validation_sequence=>110
,p_validation=>'P139_OBSRVCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Por favor ingrese una observaci\00F3n sobre el ajuste.')
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(93130015670059051)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(93154359404059074)
,p_tabular_form_region_id=>wwv_flow_api.id(349276963545382191)
,p_validation_name=>'Item Valor Ajuste menor Valor Capital'
,p_validation_sequence=>120
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_vlr_ajste varchar2(100) := :VLOR_AJSTE;',
'    v_vlr_cptal varchar2(100) ;',
'begin',
'    select ',
'        replace(:VLOR_SLDO_CPTAL,''.'') valor ',
'        into v_vlr_cptal ',
'      from dual;',
'    if cast(v_vlr_ajste as number) > cast(v_vlr_cptal as number)then',
'      raise_application_error( -20000, ''El valor del ajuste'' || :VALOR_AJUSTE || '' es mayor que el valor saldo capital''  || :VLR_SLDO_CPTAL );',
' ',
'    end if;',
'end;'))
,p_validation_type=>'PLSQL_ERROR'
,p_error_message=>'el Valor del ajuste debe ser menor que el valor capital'
,p_always_execute=>'Y'
,p_validation_condition=>':VLOR_AJSTE > :VLOR_SLDO_CPTAL'
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(177022097068083171)
,p_exec_cond_for_each_row=>'Y'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(93160914182059087)
,p_name=>'antes de enviar la pagina'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_bind_event_type=>'apexbeforepagesubmit'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'P139_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(93161473570059087)
,p_event_id=>wwv_flow_api.id(93160914182059087)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'recorrer_grid();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(93160003051059086)
,p_name=>'Nuevo'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(93130015670059051)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(93160501387059087)
,p_event_id=>wwv_flow_api.id(93160003051059086)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'window.localStorage.clear();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(93158439195059083)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Identificaci\00F3n del Sujeto Impuesto')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    select a.idntfccion_sjto, a.id_impsto ,a.id_sjto_impsto',
'      into :P139_IDNTFCCION, :P139_ID_IMPSTO ,:P139_ID_SJTO_IMPSTO',
'      from v_si_i_sujetos_impuesto a',
'     where a.cdgo_clnte      = :F_CDGO_CLNTE',
'       and a.id_sjto_impsto  = :P102_ID_SJTO_IMPSTO;',
'  /*  select a.idntfccion_sjto, a.id_impsto ,a.id_sjto_impsto,b.id_impsto_sbmpsto',
'    into :P139_IDNTFCCION, :P139_ID_IMPSTO ,:P139_ID_SJTO_IMPSTO,:P139_ID_IMPSTO_SBMPSTO	',
'    from v_si_i_sujetos_impuesto a',
'	    join v_gf_g_cartera_x_concepto b on a.id_sjto_impsto = b.id_sjto_impsto',
'     where a.cdgo_clnte      = :F_CDGO_CLNTE',
'       and a.id_sjto_impsto  = :P102_ID_SJTO_IMPSTO;	*/   ',
'',
'exception ',
'    when no_data_found then ',
'        apex_util.set_session_state(''P139_IDNTFCCION'',  '''');',
'end;',
'',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(93158821201059084)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registro Ajuste'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
unistr('	v_id_ajste	number;  -- ID del Ajuste. El cual es retornado por el procedimiento de creaci\00F3n de AJUSTE'),
'	v_xml         clob;',
'begin',
'',
'	',
'	-- Creamos el AJUSTE mediante procedimiento pkg_gf_ajustes.prcd_crear_ajustes',
' ',
'    	pkg_gf_ajustes.prc_rg_ajustes (p_cdgo_clnte         => :F_CDGO_CLNTE,',
'                                       p_id_impsto          => :P139_ID_IMPSTO,',
'                                       p_id_impsto_sbmpsto  => :P102_ID_IMPSTO_SBMPSTO,',
'                                       p_id_sjto_impsto     => :P139_ID_SJTO_IMPSTO,',
'							           p_orgen              => ''M'',',
'                                       p_tpo_ajste          => :P105_TPO_AJSTE,',
'                                       p_id_ajste_mtvo      => :P105_ID_AJSTE_MTVO,',
'                                       p_obsrvcion          => :P105_OBSRVCION,',
'                                       p_tpo_dcmnto_sprte   => :P105_TPO_DCMNTO_SPRTE,',
'							           p_nmro_dcmto_sprte   => :P105_NMRO_DCMTO_SPRTE,',
'                                       p_fcha_dcmnto_sprte  => :P105_FCHA_DCMNTO_SPRTE,',
'                                       p_nmro_slctud        => :P105_NMRO_SLCTUD,',
'                                       p_id_usrio           => :F_ID_USRIO,',
'							           p_id_instncia_fljo   => :F_ID_INSTNCIA_FLJO,',
'                                       p_id_fljo_trea       => :F_ID_FLJO_TREA ,',
'                                       p_json               => :P139_JSON,',
'                                       p_id_ajste           => v_id_ajste );',
'  /*  pkg_gf_ajustes.prc_rg_ajustes(v_xml,',
'                          v_id_ajste ) ;*/',
'	:F_ID_AJSTE :=   v_id_ajste;',
'    :P139_ID_AJSTE:=  v_id_ajste;',
'	',
'end;'))
,p_process_error_message=>'Error no se puede crear el registro de ajuste'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(93130015670059051)
,p_process_success_message=>'Ajuste Registrado Correctamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(93159258047059084)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_PROCESO_WORKFLOW'
,p_process_name=>'Proceso_Workflow_Boton_Insertar'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(93130015670059051)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(93159639706059084)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Enviar Alerta'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
unistr('	v_id_ajste	number;  -- ID del Ajuste. El cual es retornado por el procedimiento de creaci\00F3n de AJUSTE'),
'    c_id_usrio  number;',
'    p_usrios genesys.pkg_ma_mail.g_users;',
'    v_id_fljo_trea wf_g_instancias_transicion.id_fljo_trea_orgen%type;',
'begin',
'',
'	select id_usrio',
'                 , id_fljo_trea_orgen',
'              into c_id_usrio,',
'                   v_id_fljo_trea',
'              from wf_g_instancias_transicion ',
'             where id_estdo_trnscion in (1,2) and id_instncia_fljo=:F_ID_INSTNCIA_FLJO;',
'             ',
'             pkg_gf_ajustes.prc_up_instancia_flujo( p_id_instncia_fljo => :F_ID_INSTNCIA_FLJO',
'                                                  , p_id_fljo_trea    =>  v_id_fljo_trea ',
'			                                     );',
'						begin 	',
'',
'							 p_usrios := genesys.pkg_ma_mail.g_users(c_id_usrio); ',
'							  pkg_ma_mail.prc_rg_alerta(',
'								p_id_alrta_tpo => 4,',
'								p_ttlo => ''Tiene un Ajuste por Aprobar'',',
'								p_dscrpcion => ''Consulte la Gestion de Ajustes, Ajuste Registrado el: ''|| to_char(sysdate,''DD-MM-YYYY'')|| '' a las '' || to_char(sysdate,''HH24:MI''),',
'								p_url => null,',
'								p_pop_up => ''S'',',
'								p_usrios => p_usrios',
'							  );',
'							 ',
'						exception',
'							when others then',
'							 insert into gti_aux (col1, col2) values (1, ''el proceso de Alertas no se realizo correctamente'');commit; ',
'						',
'						',
'						end;',
'    commit;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(93130015670059051)
);
end;
/
