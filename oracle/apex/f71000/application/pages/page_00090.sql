prompt --application/pages/page_00090
begin
wwv_flow_api.create_page(
 p_id=>90
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Estado Preinscripci\00F3n')
,p_step_title=>unistr('Estado Preinscripci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function isLetter(id){',
unistr('    if (!/^[A-Za-z\00E1\00E9\00ED\00F3\00FA\00FC\00F1 ]*$/i.test($(''#''+id).val())) {'),
unistr('        $(''#''+id).val($(''#''+id).val().replace(/[^A-Za-z\00E1\00E9\00ED\00F3\00FA\00FC\00F1 ]+/ig,""));'),
'    }',
'}',
'',
'',
'function mayuscula(id){',
'	$(''#''+id).val($(''#''+id).val().toUpperCase());',
'}',
'',
'function isNumber(event) {',
'    if (event) {',
'        var charCode = (event.which) ? event.which : event.keyCode;',
'        if (event.altKey // alt',
'            || event.ctrlKey // crtl',
'            || event.shiftKey // shift',
'            || event.which === 0 // special chars',
'            || !(',
'                   (charCode >= 48 && charCode <= 57) // numbers',
'                || charCode === 13  // Enter',
'                || (charCode >= 96 && charCode <= 105) // numblocks',
'                || (charCode >= 37 && charCode <= 40) // cursors',
'                || charCode === 8 // backspace',
'                || charCode === 46  // delete',
'                ) ',
'          ) { ',
'            event.preventDefault();',
'            return false;',
'        }',
'    }',
'    return true;',
'};',
''))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JALCOCER'
,p_last_upd_yyyymmddhh24miss=>'20181218095830'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(48723028654597900)
,p_plug_name=>'Estado '
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CDGO_PRNSCRPCION_ESTDO,',
'       DSCRPCION',
'  from GF_D_PREINSCRIPCIONES_ESTDO'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(46229817111754049)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48724249709597904)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
,p_is_primary_key=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48724788410597904)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_label=>'Actions'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_enable_hide=>true
,p_is_primary_key=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48725319135597906)
,p_name=>'CDGO_PRNSCRPCION_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_PRNSCRPCION_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('C\00F3digo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_item_attributes=>'onkeyup="mayuscula(this.id)"'
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48725951178597906)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_item_attributes=>'onkeyup="mayuscula(this.id)"'
,p_is_required=>true
,p_max_length=>1000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(48723554013597903)
,p_internal_uid=>48723554013597903
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
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
 p_id=>wwv_flow_api.id(48723915459597903)
,p_interactive_grid_id=>wwv_flow_api.id(48723554013597903)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(48724091693597903)
,p_report_id=>wwv_flow_api.id(48723915459597903)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48725127811597905)
,p_view_id=>wwv_flow_api.id(48724091693597903)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(48724788410597904)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48725792535597906)
,p_view_id=>wwv_flow_api.id(48724091693597903)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(48725319135597906)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48726387770597907)
,p_view_id=>wwv_flow_api.id(48724091693597903)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(48725951178597906)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48743482615639865)
,p_view_id=>wwv_flow_api.id(48724091693597903)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(46229817111754049)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(48726520263597907)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(48723028654597900)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>' - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
