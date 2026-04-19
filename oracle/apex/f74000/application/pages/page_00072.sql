prompt --application/pages/page_00072
begin
wwv_flow_api.create_page(
 p_id=>72
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>unistr('Proceso de selecci\00F3n Puntual')
,p_step_title=>unistr('Proceso de selecci\00F3n Puntual')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function recorrer_grid() { ',
'    ',
'   var region = apex.region("vigencia");',
'    if (region) {',
'        ',
'       var view = apex.region("vigencia").widget().interactiveGrid("getViews", "grid");',
'       var model = view.model;  ',
'       var records = view.view$.grid("getSelectedRecords");',
'   ',
'       var json = records.map(function(record){',
'           return { "ID_PRDO" : model.getValue(record, "ID_PRDO"),',
'                    "VGNCIA" : model.getValue(record, "VGNCIA"),',
'                    "ID_IMPSTO" : model.getValue(record, "ID_IMPSTO"),',
'                    "ID_IMPSTO_SBMPSTO" : model.getValue(record, "ID_IMPSTO_SBMPSTO")};',
'           ',
'       });',
'        ',
'        $s(''P72_JSON'', JSON.stringify(json));',
'        window.localStorage.setItem(''json'', JSON.stringify(json));',
'        ',
'        ',
'      ',
'       return;',
'   }   ',
'   ',
'   // apex.item( "BTN_INSRTAR" ).hide();',
'    apex.item( "BTN_AGRGAR_SJTO" ).hide();',
'   ',
'}',
' ',
'',
'',
'function recorrer_grid2() { ',
'    ',
'   var region = apex.region("vigencia2");',
'    if (region) {',
'        ',
'       var view = apex.region("vigencia2").widget().interactiveGrid("getViews", "grid");',
'       var model = view.model;  ',
'       var records = view.view$.grid("getSelectedRecords");',
'   ',
'       var json = records.map(function(record){',
'           return { "ID_PRDO" : model.getValue(record, "ID_PRDO"),',
'                    "VGNCIA" : model.getValue(record, "VGNCIA"),',
'                    "ID_IMPSTO" : model.getValue(record, "ID_IMPSTO"),',
'                    "ID_IMPSTO_SBMPSTO" : model.getValue(record, "ID_IMPSTO_SBMPSTO")};',
'           ',
'       });',
'        ',
'        $s(''P72_JSON_2'', JSON.stringify(json));',
'        window.localStorage.setItem(''json'', JSON.stringify(json));',
'        ',
'        ',
'      ',
'       return;',
'   }   ',
'   ',
'   // apex.item( "BTN_INSRTAR" ).hide();',
'    apex.item( "BTN_AGRGAR_SJTO" ).hide();',
'   ',
'}',
' '))
,p_step_template=>wwv_flow_api.id(36470205860968633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ACONDE'
,p_last_upd_yyyymmddhh24miss=>'20240623154348'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(23154206953225222)
,p_plug_name=>'Vigencia'
,p_region_name=>'vigencia2'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from (select  a.cdgo_clnte',
'                        ,a.id_impsto',
'                        ,a.id_impsto_sbmpsto',
'                        ,a.id_prdo        ',
'                        ,a.vgncia',
'                        ,a.prdo ||''-''|| a.dscrpcion as prdo',
'                        ,b.dscrpcion        ',
'                from df_i_periodos    a   ',
'                join df_s_periodicidad  b on a.cdgo_prdcdad   = b.cdgo_prdcdad  ',
'                where a.cdgo_clnte = :F_CDGO_CLNTE ',
'                and a.id_impsto = 	:P72_ID_IMPSTO2',
'                and a.id_impsto_sbmpsto = :P72_ID_IMPSTO_SBMPSTO',
'                and a.vgncia =TO_CHAR(TO_DATE(:P72_FCHA_EXPDCION,''DD/MM/YYYY''), ''YYYY'')',
'                order by a.vgncia desc);'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>'(:P72_FISCALIZACION_TIPO  = ''LQ'' AND :P72_ID_SJTO IS NOT NULL  )'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(23154507252225225)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Periodicidad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
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
 p_id=>wwv_flow_api.id(23280520822204604)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(23280621559204605)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(23280882044204607)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
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
 p_id=>wwv_flow_api.id(23280950443204608)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(23281026610204609)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
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
 p_id=>wwv_flow_api.id(23281141209204610)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(23281242528204611)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(23281333216204612)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>91
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
 p_id=>wwv_flow_api.id(23154405325225224)
,p_internal_uid=>23154405325225224
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
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
 p_id=>wwv_flow_api.id(23197167813498477)
,p_interactive_grid_id=>wwv_flow_api.id(23154405325225224)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(23197249529498478)
,p_report_id=>wwv_flow_api.id(23197167813498477)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1092377002139)
,p_view_id=>wwv_flow_api.id(23197249529498478)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(23280882044204607)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1670203002141)
,p_view_id=>wwv_flow_api.id(23197249529498478)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(23280950443204608)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(2319860002143)
,p_view_id=>wwv_flow_api.id(23197249529498478)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(23281026610204609)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(2900610002145)
,p_view_id=>wwv_flow_api.id(23197249529498478)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(23281141209204610)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3495337002149)
,p_view_id=>wwv_flow_api.id(23197249529498478)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(23281242528204611)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3969353002181)
,p_view_id=>wwv_flow_api.id(23197249529498478)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(23281333216204612)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>180
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23197785132498493)
,p_view_id=>wwv_flow_api.id(23197249529498478)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(23154507252225225)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23292670337275771)
,p_view_id=>wwv_flow_api.id(23197249529498478)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(23280520822204604)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(53312043406574254)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(53314923828574283)
,p_plug_name=>'Propietarios'
,p_region_name=>'propietarios'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_rzon_scial,',
'       a.dscrpcion_idntfccion_tpo ,',
'       a.idntfccion_rspnsble,',
'       a.id_sjto',
'  from v_si_i_sujetos_responsable a',
'  join si_c_sujetos b ',
'    on a.id_sjto    = b.id_sjto',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
' and a.idntfccion_sjto    = nvl(:P72_IDNTFCCION,a.idntfccion_sjto)',
'  -- and a.id_sjto    = nvl(:P72_ID_SJTO,a.id_sjto)',
' group by a.nmbre_rzon_scial,',
'       a.dscrpcion_idntfccion_tpo ,',
'       a.idntfccion_rspnsble,',
'       a.id_sjto;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>'(:P72_ID_SJTO IS NOT NULL)'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(53316256362574296)
,p_name=>'DSCRPCION_IDNTFCCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_IDNTFCCION_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Tipo Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(53316411809574297)
,p_name=>'IDNTFCCION_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_RSPNSBLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(55164020227146258)
,p_name=>'NMBRE_RZON_SCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RZON_SCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Nombre \00F3 Raz\00F3n Social')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>403
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
 p_id=>wwv_flow_api.id(123230435876214663)
,p_name=>'ID_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(53316093823574294)
,p_internal_uid=>53316093823574294
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
 p_id=>wwv_flow_api.id(53699289563054076)
,p_interactive_grid_id=>wwv_flow_api.id(53316093823574294)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(53699372753054076)
,p_report_id=>wwv_flow_api.id(53699289563054076)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(53700231777054083)
,p_view_id=>wwv_flow_api.id(53699372753054076)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(53316256362574296)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>163
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(53700806653054084)
,p_view_id=>wwv_flow_api.id(53699372753054076)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(53316411809574297)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55181355555557544)
,p_view_id=>wwv_flow_api.id(53699372753054076)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(55164020227146258)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>197
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(123318209325147578)
,p_view_id=>wwv_flow_api.id(53699372753054076)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(123230435876214663)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(53706478051080575)
,p_plug_name=>'Vigencia'
,p_region_name=>'vigencia'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from (select  a.cdgo_clnte',
'        ,a.id_impsto',
'        ,a.id_impsto_sbmpsto',
'        ,a.id_prdo        ',
'        ,a.vgncia',
'        ,a.prdo ||''-''|| a.dscrpcion as prdo',
'        ,b.dscrpcion        ',
'from df_i_periodos    a   ',
'join df_s_periodicidad  b on a.cdgo_prdcdad   = b.cdgo_prdcdad  ',
'where a.cdgo_clnte = :F_CDGO_CLNTE ',
'and a.id_impsto = 	:P72_ID_IMPSTO2',
'and a.id_impsto_sbmpsto = :P72_ID_IMPSTO_SBMPSTO',
'and  a.id_prdo not in (select  c.id_prdo',
'                        from fi_g_candidatos_vigencia  c ',
'                        where ',
'                        exists (select * from v_fi_g_candidatos d ',
'                                where d.id_cnddto = c.id_cnddto',
'                                and d.idntfccion = :P72_IDNTFCCION',
'                                --and d.id_fsclzcion_lte = 322',
'                                and d.actvo = ''S''',
'                                and d.cdgo_cnddto_estdo = ''ACT''',
'                                and d.indcdor_asgndo = ''S''      )',
'                        and   a.id_prdo = c.id_prdo ',
'                        and a.vgncia = c.vgncia )',
'order by a.vgncia desc);'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>'(:P72_FISCALIZACION_TIPO  = ''DC'' AND :P72_ID_SJTO IS NOT NULL)'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(23032754914051307)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(23032893387051308)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(23033443928051314)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Periodicidad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
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
 p_id=>wwv_flow_api.id(53706689443080577)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_03=>'center'
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
 p_id=>wwv_flow_api.id(53706748837080578)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
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
 p_id=>wwv_flow_api.id(53706882091080579)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_03=>'center'
,p_is_required=>false
,p_max_length=>91
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
 p_id=>wwv_flow_api.id(53707561112080586)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(53707664988080587)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(61990954463007457)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(53706577497080576)
,p_internal_uid=>53706577497080576
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
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
 p_id=>wwv_flow_api.id(53807231988356170)
,p_interactive_grid_id=>wwv_flow_api.id(53706577497080576)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(53807371780356170)
,p_report_id=>wwv_flow_api.id(53807231988356170)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23105613180450638)
,p_view_id=>wwv_flow_api.id(53807371780356170)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(23032754914051307)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23106231417450640)
,p_view_id=>wwv_flow_api.id(53807371780356170)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(23032893387051308)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23133101070399944)
,p_view_id=>wwv_flow_api.id(53807371780356170)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(23033443928051314)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(53807841496356171)
,p_view_id=>wwv_flow_api.id(53807371780356170)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(53706689443080577)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(53808367952356172)
,p_view_id=>wwv_flow_api.id(53807371780356170)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(53706748837080578)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(53808838319356174)
,p_view_id=>wwv_flow_api.id(53807371780356170)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(53706882091080579)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(53813103379358119)
,p_view_id=>wwv_flow_api.id(53807371780356170)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(53707561112080586)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71660700446502466)
,p_view_id=>wwv_flow_api.id(53807371780356170)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(61990954463007457)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(53708058994080591)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(53708804821080598)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>',
unistr('<p>Esta funcionalidad permite gestionar los procesos de selecci\00F3n de poblaci\00F3n del proceso jur\00EDdico.</p>'),
'<p> </p>',
'<p> </p>',
unistr('<p><b>Nota:</b> Solo se enviar\00E1n los conceptos seleccionados </p>'),
unistr('<b><i>1.</i></b> Permite consultar una identificaci\00F3n espec\00EDfica para seleccionar la cartera que se va a incluir en un lote por medio del bot\00F3n "Consultar".<br><br>'),
unistr('<b><i>2.</i></b> Permite consultar por medio de par\00E1metros una identificaci\00F3n para seleccionar la cartera que se va a incluir en un lote por medio del bot\00F3n "Consulta por Par\00E1metros".<br><br>'),
unistr('<b><i>3.</i></b> Permite realizar una selecci\00F3n masiva escogiendo una regla ya preestablecida para incluirla en un lote por medio del bot\00F3n "Selecci\00F3n Masiva por Regla".<br><br>'),
unistr('<p>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(59078367989252857)
,p_plug_name=>'Lote seleccionado'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36477079061968638)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>'<b>Lote seleccionado</b> &P72_OBSRVCION.'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(105901596746961202)
,p_plug_name=>'Datos del Lote: &P72_LTE.'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36491913657968646)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108234814352795953)
,p_plug_name=>'Tabulador'
,p_region_name=>'tab_conainer'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(36509862944968653)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(23056493463737984)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(53708058994080591)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RP:P8_ID_FSCLZCION_LTE:&P72_ID_CNDDTO_LTE.'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(22757363073329704)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(53708058994080591)
,p_button_name=>'BTN_INSRTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
end;
/
begin
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(23056833828737985)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(53708058994080591)
,p_button_name=>'BTN_INSRTAR_3'
,p_button_static_id=>'BTN_INSRTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(23057282786737985)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(53708058994080591)
,p_button_name=>'BTN_AGRGAR_SJTO'
,p_button_static_id=>'BTN_AGRGAR_SJTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar Sujeto'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(23040567271737818)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_api.id(53312043406574254)
,p_button_name=>'BTN_CONSLTR_PRMTROS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>unistr('Consulta Par\00E1metros')
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-table-search'
,p_grid_column_attributes=>'style="top:15px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(23040926929737824)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_api.id(53312043406574254)
,p_button_name=>'BTN_CONSLTR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(23032207093051302)
,p_branch_name=>'Ir a Busqueda Sujeto Impuesto'
,p_branch_action=>'f?p=71000:3:&SESSION.::&DEBUG.:RP,72:P3_NMRO_APP,P3_NMRO_PGNA,P3_ID_IMPSTO,P3_NMBRE_ITEM_IMPSTO,P3_IMPSTO_SBMPSTO,P3_NMBRE_ITEM,P3_NMBRE_ITEM_SBIMPSTO:&APP_ID.,&APP_PAGE_ID.,&P72_ID_IMPSTO2.,P72_ID_IMPSTO,&P72_ID_IMPSTO_SBMPSTO.,P72_ID_SJTO_IMPSTO,P72_ID_IMPSTO_SBMPSTO&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(23040567271737818)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23032335649051303)
,p_name=>'P72_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(53312043406574254)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23032948214051309)
,p_name=>'P72_FCHA_EXPDCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(53312043406574254)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Fecha de Expedici\00F3n')
,p_format_mask=>'DD/MM/YYYY'
,p_source=>'FCHA_EXPDCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>13
,p_tag_attributes=>'onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>7
,p_display_when=>'P72_FISCALIZACION_TIPO'
,p_display_when2=>'LQ'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione la fecha de suscripci\00F3n del hecho generador.')
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23041361337737827)
,p_name=>'P72_ID_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(53312043406574254)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d',
',        a.id_impsto r',
'  from fi_g_fiscalizacion_lote a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where  a.id_fsclzcion_lte = :P72_ID_CNDDTO_LTE',
'   and b.cdgo_clnte = :F_CDGO_CLNTE',
'   ;'))
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione el impuesto por el cual desea consultar de forma puntual.'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23042110555737908)
,p_name=>'P72_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(53312043406574254)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P72_ID_IMPSTO2',
' order by 1'))
,p_lov_cascade_parent_items=>'P72_ID_IMPSTO'
,p_ajax_items_to_submit=>'P72_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Seleccione el sub-impuesto por el cual desea consultar de forma puntual. La informaci\00F3n mostrada depende del impuesto que se escoja.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23043001620737910)
,p_name=>'P72_IDNTFCCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(53312043406574254)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la Identificaci\00F3n del Sujeto, ya sea de manera directa mediante digitaci\00F3n o mediante la opci\00F3n del bot\00F3n Consulta Par\00E1metro')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23043926455737911)
,p_name=>'P72_ID_SJTO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(53312043406574254)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23044378935737911)
,p_name=>'P72_RSPSTA'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(53312043406574254)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23044744002737911)
,p_name=>'P72_ID_CNDDTO_LTE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(53312043406574254)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23045141453737911)
,p_name=>'P72_JSON'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(53706478051080575)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23057623661737985)
,p_name=>'P72_BRANCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(53708058994080591)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23058693254737989)
,p_name=>'P72_OBSRVCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(59078367989252857)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_obsrvcion varchar2(100);',
'begin',
'',
'    select obsrvcion',
'      into v_obsrvcion',
'      from cb_g_procesos_simu_lote',
'     where cdgo_clnte = :F_CDGO_CLNTE ',
'       and id_prcsos_smu_lte = :P72_ID_CNDDTO_LTE;',
'    ',
'    return v_obsrvcion;',
'exception when no_data_found then',
'    return '''';',
'end;'))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23059335083737991)
,p_name=>'P72_LTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(105901596746961202)
,p_prompt=>unistr('Lote de selecci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>'P72_ID_CNDDTO_LTE'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36554765804968673)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Es el lote de selecci\00F3n realizado por un funcionario.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23060287977737993)
,p_name=>'P72_OBSRVCION_LTE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(105901596746961202)
,p_prompt=>unistr('Observaci\00F3n de Lote')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>100
,p_cHeight=>1
,p_read_only_when=>'P72_ID_CNDDTO_LTE'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(36554765804968673)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Muestra la observaci\00F3n del lote que fue ingresada cuando se genero un lote nuevo de selecci\00F3n de candidatos.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23152414736225204)
,p_name=>'P72_ID_IMPSTO2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(53312043406574254)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23152526339225205)
,p_name=>'P72_FISCALIZACION_TIPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(53312043406574254)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23154365669225223)
,p_name=>'P72_JSON_2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(23154206953225222)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23156160313225241)
,p_name=>'P72_VIGNCIA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(53312043406574254)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24108131062604301)
,p_name=>'P72_CNTRNTE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(53312043406574254)
,p_prompt=>'Contratante'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''[''||idntfccion||''] - [''||nmbre_rzon_scial||'']'' as d,',
'        id_entdad as r',
'from df_s_entidades'))
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25529287016502101)
,p_name=>'P72_NMRO_RNTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(53312043406574254)
,p_prompt=>unistr('N\00FAmero Renta')
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P72_FCHA_EXPDCION'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(23033050298051310)
,p_computation_sequence=>30
,p_computation_item=>'P72_FCHA_EXPDCION'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pkg_re_documentos.fnc_vl_fcha_mxma_tsas_mra (:F_CDGO_CLNTE, ',
'                                                    :P72_ID_IMPSTO, ',
'                                                    to_date(:P72_FCHA_EXPDCION,''DD/MM/YY''),',
'                                                    to_date(:P72_FCHA_EXPDCION,''DD/MM/YY'')) fcha_vlda',
'from dual;',
'     ',
''))
,p_compute_when_type=>'NEVER'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(23061538944738065)
,p_computation_sequence=>10
,p_computation_item=>'P72_LTE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''*Lote: ''||a.id_fsclzcion_lte||'' *Fecha: ''||to_char(a.fcha_rgstro,''dd/mm/yyyy'')||'' *Funcionario: ''||b.nmbre_trcro  as dscrpcion_Lte',
'from fi_g_fiscalizacion_lote a, v_sg_g_usuarios b',
'   where a.id_fncnrio_rgstro = b.id_fncnrio',
'   and a.cdgo_clnte = :F_CDGO_CLNTE ',
'   and a.id_fsclzcion_lte = :P72_ID_CNDDTO_LTE',
'order by id_fsclzcion_lte;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(23061890246738073)
,p_computation_sequence=>20
,p_computation_item=>'P72_OBSRVCION_LTE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select obsrvcion',
'from fi_g_fiscalizacion_lote',
'where id_fsclzcion_lte = :p72_ID_CNDDTO_LTE;'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(23062269778738074)
,p_validation_name=>'validar vigencia seleccionada'
,p_validation_sequence=>10
,p_validation=>'P72_JSON'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'No se ha seleccionado una vigencia'
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(23056833828737985)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(23155691201225236)
,p_validation_name=>'validar vigencia seleccionada2'
,p_validation_sequence=>20
,p_validation=>'P72_JSON_2'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'No se ha seleccionado una vigencia'))
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(23056833828737985)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(23033243165051312)
,p_validation_name=>unistr('Validar Fecha de Expedici\00F3n no nula')
,p_validation_sequence=>30
,p_validation=>'P72_FCHA_EXPDCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar una fecha para continuar'
,p_when_button_pressed=>wwv_flow_api.id(23056833828737985)
,p_associated_item=>wwv_flow_api.id(23032948214051309)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(23033389218051313)
,p_validation_name=>unistr('Validad identificaci\00F3n no nula')
,p_validation_sequence=>40
,p_validation=>'P72_IDNTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Debe ingresar una identificaci\00F3n')
,p_when_button_pressed=>wwv_flow_api.id(23040926929737824)
,p_associated_item=>wwv_flow_api.id(23043001620737910)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23063792252738098)
,p_name=>'antes de enviar la pagina'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'apexbeforepagesubmit'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23064270267738114)
,p_event_id=>wwv_flow_api.id(23063792252738098)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'recorrer_grid();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23248399801596202)
,p_event_id=>wwv_flow_api.id(23063792252738098)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'recorrer_grid2();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23064603568738128)
,p_name=>'al hacer clic en la grid conceptos'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(53706478051080575)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23065144280738131)
,p_event_id=>wwv_flow_api.id(23064603568738128)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'recorrer_grid();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23248686104596205)
,p_event_id=>wwv_flow_api.id(23064603568738128)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P72_JSON'
,p_attribute_03=>'P72_JSON'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23248489342596203)
,p_name=>'al hacer clic en la grid conceptos_1'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(53706478051080575)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23066068090738132)
,p_name=>'al cargar la pagina'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23066554829738132)
,p_event_id=>wwv_flow_api.id(23066068090738132)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(document).ready(function() {  ',
'    var region = apex.region("vigencia");',
'    if (region) {',
'        apex.region("vigencia").widget().interactiveGrid("setSelectedRecords", []);',
'    }',
'    recorrer_grid();      ',
'});',
'',
'',
'',
'',
'',
'    '))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23136334971306401)
,p_name=>'Actualizar region'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(53314923828574283)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23136438050306402)
,p_event_id=>wwv_flow_api.id(23136334971306401)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(53314923828574283)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23155412563225234)
,p_name=>'al hacer clic en la grid conceptos2'
,p_event_sequence=>60
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(23154206953225222)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23155524997225235)
,p_event_id=>wwv_flow_api.id(23155412563225234)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'recorrer_grid2();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23155739607225237)
,p_event_id=>wwv_flow_api.id(23155412563225234)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P72_JSON_2'
,p_attribute_03=>'P72_JSON_2'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23155815527225238)
,p_name=>unistr('Actualizar regi\00F3n vigencia al seleccionar una fecha expedici\00F3n')
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P72_FCHA_EXPDCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23156453140225244)
,p_event_id=>wwv_flow_api.id(23155815527225238)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P72_FCHA_EXPDCION'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23155954393225239)
,p_event_id=>wwv_flow_api.id(23155815527225238)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(23154206953225222)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23156906564225249)
,p_name=>'Asignar vigencia'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P72_FCHA_EXPDCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'P72_FCHA_EXPDCION'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23156588120225245)
,p_event_id=>wwv_flow_api.id(23156906564225249)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P72_FCHA_EXPDCION'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN ',
'SELECT :P72_FCHA_EXPDCION',
'INTO :P72_VIGNCIA',
'FROM DUAL;',
'',
'END;'))
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(23032418427051304)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Recuperacion automatica de filas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  idntfccion_sjto',
'    into  :P72_IDNTFCCION',
'    from v_si_i_sujetos_impuesto',
'    where id_sjto_impsto = :P72_ID_SJTO_IMPSTO; ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P72_ID_SJTO_IMPSTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(23062932339738097)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar sujeto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto number;    ',
'begin',
'    :P72_ID_SJTO_IMPSTO := null;',
'    ',
'    select id_sjto',
'      into :P72_ID_SJTO',
'      from si_c_sujetos',
'     where cdgo_clnte    = :F_CDGO_CLNTE ',
'       and idntfccion    = :P72_IDNTFCCION;',
'       ',
'     select a.id_sjto_impsto ',
'    into :P72_ID_SJTO_IMPSTO',
'    from  v_si_i_sujetos_impuesto a ',
'    where cdgo_clnte    = :F_CDGO_CLNTE  ',
'    and a.idntfccion_sjto = :P72_IDNTFCCION',
'    and a.id_impsto = :P72_ID_IMPSTO2; ',
'       ',
'         ',
'       ',
'    :P72_RSPSTA := '''';  ',
'    ',
'exception when no_data_found then ',
'          :P72_ID_SJTO := null;',
'          :P72_RSPSTA := ''No Existe el Sujeto'';',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(23040926929737824)
,p_process_success_message=>'&P72_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(23063365125738097)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Registrar Lote de selecci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_lte_nvo      number;',
'  v_cdgo_rspsta  number;',
'  v_mnsje_rspsta varchar2(4000);',
'  v_exception    exception;',
'  v_json         clob;',
'  v_vgncia       varchar2(20);',
'begin',
'',
'  --insert into muerto  (v_001, t_001) values(''Iniciso del proceso de insertar'', sysdate); commit;',
'  if (:P72_JSON = ''[]'' and :P72_JSON_2 = ''[]'') then',
'    v_json := null;',
'    --insert into muerto  (v_001, t_001, c_001) values(''Asigno json null'', sysdate, v_json); commit;',
'  elsif :P72_JSON_2 != ''[]'' then',
'    v_json := :P72_JSON_2;',
'    --insert into muerto  (v_001, t_001, c_001) values(''Asigno json_2'', sysdate, v_json); commit;',
'  ',
'  elsif :P72_JSON != ''[]'' then',
'    v_json := :P72_JSON;',
'    --insert into muerto  (v_001, t_001, c_001) values(''Asigno json'', sysdate, v_json); commit;',
'  ',
'  else',
'    v_json := null;',
'    --insert into muerto  (v_001, t_001, c_001) values(''Asigno json null'', sysdate, v_json); commit;',
'  ',
'  end if;',
'',
'  if :P72_FCHA_EXPDCION is null and :P72_FISCALIZACION_TIPO = ''LQ'' then',
'    raise_application_error(-20000,',
unistr('                            ''No ha seleccionado la fecha de expedici\00F3n, por favor selecciona una.'');'),
'  end if;',
'',
'  if v_json is null then',
'    raise_application_error(-20000,',
'                            ''No ha seleccionado una vigencia, por favor selecciona una.'');',
'  end if;',
'',
'  /* SELECT  :P72_FCHA_EXPDCION ',
'   into v_vgncia',
'   FROM dual ;',
'   ',
'   insert into muerto  (v_001, t_001) values(''Antes de entrar'', sysdate); commit;',
'   ',
'  SELECT  TO_CHAR(TO_DATE(v_vgncia,''DD/MM/YYYY''), ''YYYY'') ',
'  INTO v_vgncia',
'   FROM DUAL ;*/',
'',
'  --v_vgncia := to_date(:P72_FCHA_EXPDCION,''dd/mm/yyyy'');',
'',
' /* pkg_fi_fiscalizacion.prc_rg_seleccion_puntual(p_cdgo_clnte       => :F_CDGO_CLNTE,',
'                                                p_id_fsclzcion_lte => :P72_ID_CNDDTO_LTE,',
'                                                p_id_sjto_impsto   => :P72_ID_SJTO_IMPSTO,',
'                                                p_id_usuario       => :F_ID_USRIO,',
'                                                p_json             => v_json,',
'                                                p_fcha_expdcion    => :P72_FCHA_EXPDCION,',
unistr('                                                --  p_nmro_rnta           => :P72_NMRO_RNTA, --- validar si el paquete en sucre tiene este par\00E1metro'),
'                                                o_cdgo_rspsta  => v_cdgo_rspsta,',
'                                                o_mnsje_rspsta => v_mnsje_rspsta);*/                                                ',
'                                                 ',
' pkg_fi_fiscalizacion.prc_rg_seleccion_puntual(p_cdgo_clnte         => :F_CDGO_CLNTE,',
'                                               p_id_fsclzcion_lte   => :P72_ID_CNDDTO_LTE,',
'                                               p_id_sjto_impsto     => :P72_ID_SJTO_IMPSTO,',
'                                               p_id_usuario         => :F_ID_USRIO,',
'                                               p_json               => v_json,',
'                                               p_fcha_expdcion      => :P72_FCHA_EXPDCION,',
'                                               p_nmro_rnta           => :P72_NMRO_RNTA,',
'                                               o_cdgo_rspsta        => v_cdgo_rspsta,',
'                                               o_mnsje_rspsta       => v_mnsje_rspsta);                                               ',
'',
'  --insert into muerto  (v_001, t_001) values(''Despues de entrar fecha: ''||:P72_VIGNCIA, sysdate); commit;',
'',
'  /*if v_cdgo_rspsta > 0 then',
'      raise v_exception;',
'  end if;     */',
'',
'  if v_cdgo_rspsta > 0 then',
'    raise_application_error(-20000, v_mnsje_rspsta);',
'  end if;',
'',
'  -- :P5_ID_PRCSO_SMU_LOTE := v_lte_nvo;',
'  :P5_ID_SJTO := null;',
'  --:P5_ID_IMPSTO         := null;',
'  --:P5_ID_IMPSTO_SBMPSTO := null;',
'  :P5_IDNTFCCION := null;',
'',
'  apex_json.open_object;',
'  apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'  apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'',
'  apex_json.close_object;',
'exception',
'  when v_exception then',
'    rollback;',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'  ',
'end;',
''))
,p_process_error_message=>'No se pudo realizar el proceso.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(22757363073329704)
,p_process_success_message=>unistr('Candidatos registrado con \00E9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(23062528906738081)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Despu\00E9s de cargar la pagina')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'',
'begin',
'    ',
'     /*select a.id_impsto',
'        into :P72_ID_IMPSTO',
'        from fi_g_fiscalizacion_lote  a ',
'        where a.id_fsclzcion_lte = :P72_ID_CNDDTO_LTE ; */',
'     select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' ',
'           ,a.id_impsto,',
'          -- ,a.indcdor_fsclzcion_tpo,',
'        case',
'          when b.cdgo_impsto = ''ICA'' then',
'           ''DC''',
'          else',
'          ''LQ''',
'        end as indcdor_fsclzcion_tpo --agragado por Ariel para adaptar a ica',
'    into  :P72_ID_IMPSTO,',
'          :P72_ID_IMPSTO2,',
'          :P72_FISCALIZACION_TIPO',
'    from fi_g_fiscalizacion_lote a ',
'    join df_c_impuestos b on a.id_impsto = b.id_impsto',
'    where  a.id_fsclzcion_lte = :P72_ID_CNDDTO_LTE',
'    and b.cdgo_clnte = :F_CDGO_CLNTE',
'    ;',
'        ',
'    ',
'  /* select a.idntfccion_sjto,',
'           a.id_sjto',
'      into :P72_IDNTFCCION,',
'           :P72_ID_SJTO',
'      from v_si_c_sujetos a',
'     where a.cdgo_clnte      = :F_CDGO_CLNTE',
'      and a.idntfccion_sjto         = :P72_IDNTFCCION;*/',
'      -- and a.id_sjto         = :P72_ID_SJTO;',
'       --and a.idntfccion_sjto = nvl(:P72_IDNTFCCION, a.idntfccion_sjto) ',
'       --and (:P72_ID_SJTO is not null or  :P72_IDNTFCCION is not null);',
'       ',
'       ',
'       if :P72_FCHA_EXPEDCION is not null then',
'       SELECT :P72_FCHA_EXPEDCION',
'       INTO :P72_VIGNCIA',
'       FROM DUAL;',
'       end if;',
'     ',
'    ',
'exception when no_data_found then ',
'         -- null;        ',
'         --apex_util.set_session_state(''P72_IDNTFCCION'',  '''');',
'          apex_util.set_session_state(''P72_ID_SJTO'',  '''');',
'end;',
'',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
