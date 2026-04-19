prompt --application/pages/page_00009
begin
wwv_flow_api.create_page(
 p_id=>9
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Reglas de Descuento'
,p_page_mode=>'MODAL'
,p_step_title=>'Reglas de Descuento'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
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
,p_dialog_width=>'90%'
,p_protection_level=>'C'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20240815060641'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10281346295958731)
,p_plug_name=>'Condiciones'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select id_dscnto_cndcion,',
'        dscrp_cdgo_dscnto_cndcion_tpo,',
'        fcha_dsde,',
'        fcha_hsta,',
'        vgncia_dsde_pgo || ''-'' || prdo_dsde_pgo vgncia_prdo_pgo_dsde,',
'        vgncia_hsta_pgo || ''-'' || prdo_hsta_pgo vgncia_prdo_pgo_hsta,',
'        vgncia_dsde_paz_slvo || ''-'' || prdo_dsde_paz_slvo vgncia_prdo_paz_slvo_dsde,',
'        vgncia_hsta_paz_slvo || ''-'' || prdo_hsta_paz_slvo vgncia_prdo_paz_slvo_hsta,',
'        fcha_lmte_paz_slvo,',
'        dscrpcion_actvo_cndcion',
'        ,id_impsto,id_impsto_sbmpsto',
'   from v_re_g_descuentos_condicion',
'  where id_dscnto_rgla = :P9_ID_DSCNTO_RGLA'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P9_ID_DSCNTO_RGLA'
);
wwv_flow_api.create_region_column_group(
 p_id=>wwv_flow_api.id(16450621406791504)
,p_heading=>'Pago'
);
wwv_flow_api.create_region_column_group(
 p_id=>wwv_flow_api.id(16450705337791505)
,p_heading=>'Paz y Salvo'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3323631745616201)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Impsto'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_api.id(3323782812616202)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Impsto Sbmpsto'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>150
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_api.id(10282853179958746)
,p_name=>'FCHA_DSDE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_DSDE'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Desde'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
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
 p_id=>wwv_flow_api.id(10282978322958747)
,p_name=>'FCHA_HSTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_HSTA'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Hasta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
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
 p_id=>wwv_flow_api.id(10283056464958748)
,p_name=>'VGNCIA_PRDO_PGO_DSDE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA_PRDO_PGO_DSDE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Vigencia-Periodo <br>Desde'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(16450621406791504)
,p_use_group_for=>'BOTH'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>81
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
 p_id=>wwv_flow_api.id(10283151260958749)
,p_name=>'VGNCIA_PRDO_PGO_HSTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA_PRDO_PGO_HSTA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Vigencia-Periodo<br>Hasta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(16450621406791504)
,p_use_group_for=>'BOTH'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>81
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
 p_id=>wwv_flow_api.id(10283231470958750)
,p_name=>'VGNCIA_PRDO_PAZ_SLVO_DSDE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA_PRDO_PAZ_SLVO_DSDE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Vigencia-Periodo<br>Desde'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(16450705337791505)
,p_use_group_for=>'BOTH'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>81
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
 p_id=>wwv_flow_api.id(16450309017791501)
,p_name=>'VGNCIA_PRDO_PAZ_SLVO_HSTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA_PRDO_PAZ_SLVO_HSTA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Vigencia-Periodo<br>Hasta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(16450705337791505)
,p_use_group_for=>'BOTH'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>81
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
 p_id=>wwv_flow_api.id(16450465595791502)
,p_name=>'FCHA_LMTE_PAZ_SLVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_LMTE_PAZ_SLVO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha L\00EDmite')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(16450705337791505)
,p_use_group_for=>'BOTH'
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
 p_id=>wwv_flow_api.id(16450576115791503)
,p_name=>'DSCRPCION_ACTVO_CNDCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ACTVO_CNDCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFActivo?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>2
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
 p_id=>wwv_flow_api.id(16450847062791506)
,p_name=>'Editar'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Editar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_01=>'<span class="fa fa-edit">&EMPLOYEE_STATUS.</span>'
,p_link_target=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:RP,30:P30_ID_DSCNTO_CNDCION,P30_ID_DSCNTO_RGLA,P30_ID_IMPSTO,P30_ID_IMPSTO_SBMPSTO:&ID_DSCNTO_CNDCION.,&P9_ID_DSCNTO_RGLA.,&ID_IMPSTO.,&ID_IMPSTO_SBMPSTO.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(16450912219791507)
,p_name=>'ID_DSCNTO_CNDCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DSCNTO_CNDCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(47762724460414902)
,p_name=>'DSCRP_CDGO_DSCNTO_CNDCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRP_CDGO_DSCNTO_CNDCION_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Tipo de <br> Condici\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>11
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
 p_id=>wwv_flow_api.id(10282700129958745)
,p_internal_uid=>10282700129958745
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>false
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
 p_id=>wwv_flow_api.id(16456596629796264)
,p_interactive_grid_id=>wwv_flow_api.id(10282700129958745)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(16456668309796264)
,p_report_id=>wwv_flow_api.id(16456596629796264)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3329687864617669)
,p_view_id=>wwv_flow_api.id(16456668309796264)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(3323631745616201)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3330198624617672)
,p_view_id=>wwv_flow_api.id(16456668309796264)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(3323782812616202)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16457897630796331)
,p_view_id=>wwv_flow_api.id(16456668309796264)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(10282853179958746)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16458339617796337)
,p_view_id=>wwv_flow_api.id(16456668309796264)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(10282978322958747)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16458818105796387)
,p_view_id=>wwv_flow_api.id(16456668309796264)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(10283056464958748)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16459318235796389)
,p_view_id=>wwv_flow_api.id(16456668309796264)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(10283151260958749)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16459831365796390)
,p_view_id=>wwv_flow_api.id(16456668309796264)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(10283231470958750)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16460348617796392)
,p_view_id=>wwv_flow_api.id(16456668309796264)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(16450309017791501)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16460836921796393)
,p_view_id=>wwv_flow_api.id(16456668309796264)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(16450465595791502)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16461328864796395)
,p_view_id=>wwv_flow_api.id(16456668309796264)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(16450576115791503)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16475488637854869)
,p_view_id=>wwv_flow_api.id(16456668309796264)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(16450847062791506)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>69
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16475968103854871)
,p_view_id=>wwv_flow_api.id(16456668309796264)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(16450912219791507)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(47800824645560682)
,p_view_id=>wwv_flow_api.id(16456668309796264)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(47762724460414902)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(183888452447438291)
,p_plug_name=>'Reglas de Descuento'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(183889026056438295)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(183888452447438291)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P9_ID_DSCNTO_RGLA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(183889636730438295)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(183888452447438291)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(183889126464438295)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(183888452447438291)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P9_ID_DSCNTO_RGLA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10282527850958743)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(10281346295958731)
,p_button_name=>'BTN_NUEVA_CONDICION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nueva Condicion'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_button_redirect_url=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:RP,30:P30_ID_DSCNTO_RGLA:&P9_ID_DSCNTO_RGLA.'
,p_icon_css_classes=>'fa-window-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(183888851507438295)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(183888452447438291)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P9_ID_DSCNTO_RGLA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(46597703471083222)
,p_branch_name=>'ir a pagina 25'
,p_branch_action=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'CREATE,SAVE,DELETE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7859128438891601)
,p_name=>'P9_IND_EXTNDE_TMPO'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(183888452447438291)
,p_use_cache_before_default=>'NO'
,p_item_default=>'S'
,p_prompt=>unistr('\00BF Aplica para todas las cuotas?')
,p_source=>'IND_EXTNDE_TMPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>4
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione "S\00ED" si el descuento aplica para todas las cuotas del convenio, a\00FAn el descuento no este vigente.  Escoja "No" si solo aplica para las cuotas que est\00E9n dentro de la vigencia del descuento')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7859270125891602)
,p_name=>'P9_IND_APLCA_CNVNIO'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(183888452447438291)
,p_use_cache_before_default=>'NO'
,p_item_default=>'S'
,p_prompt=>unistr('\00BF Aplica para convenio ?')
,p_source=>'IND_APLCA_CNVNIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione "S\00ED" para que los convenios apliquen el descuento.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7859346952891603)
,p_name=>'P9_TPO_INTRES_BNCRIO'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(183888452447438291)
,p_use_cache_before_default=>'NO'
,p_item_default=>'S'
,p_prompt=>unistr('\00BF Inter\00E9s Bancario ?')
,p_source=>'TPO_INTRES_BNCRIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione "S\00ED" para que el descuento se aplique sobre el inter\00E9s bancario calculado.  Seleccione "No" para que el descuento se aplique sobre el inter\00E9s de usura.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16451552522791513)
,p_name=>'P9_DSCRPCION'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(183888452447438291)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Descripci\00F3n')
,p_source=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>70
,p_cMaxlength=>300
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la descripci\00F3n del descuento.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45459022233856315)
,p_name=>'P9_ID_CNCPTO_DSCNTO'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(183888452447438291)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Concepto Descuento'
,p_source=>'ID_CNCPTO_DSCNTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_cncpto || '' - '' || dscrpcion d ,',
'       id_cncpto r',
'  from df_i_conceptos',
' where cdgo_clnte         = :F_CDGO_CLNTE',
'   and id_impsto          = :P9_ID_IMPSTO',
'   and ctgria_cncpto      = ''D''',
'   and cdgo_cncpto_tpo    = ''CRD''',
'   and actvo              = ''S''',
'  -- and id_cncpto_rlcnal   = :P9_ID_CNCPTO',
' order by 1',
''))
,p_lov_cascade_parent_items=>'P9_ID_IMPSTO,P9_ID_CNCPTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione de la lista el concepto de descuento.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46597248758083217)
,p_name=>'P9_VGNCIA_DSDE'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(183888452447438291)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Vigencia Desde'
,p_source=>'VGNCIA_DSDE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione la vigencia inicial.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46597380576083218)
,p_name=>'P9_ID_PRDO_DSDE'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(183888452447438291)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Periodo desde'
,p_source=>'ID_PRDO_DSDE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select prdo || '' - '' || dscrpcion as d,',
'       id_prdo as r',
'  from df_i_periodos',
' where vgncia = :P9_VGNCIA_DSDE',
'  and cdgo_clnte = :F_CDGO_CLNTE',
'  and id_impsto = :P9_ID_IMPSTO',
'  and id_impsto_sbmpsto = :P9_ID_IMPSTO_SBMPSTO',
' order by 1'))
,p_lov_cascade_parent_items=>'P9_ID_IMPSTO,P9_ID_IMPSTO_SBMPSTO,P9_VGNCIA_DSDE'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione el periodo inicial.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46597483786083219)
,p_name=>'P9_FCHA_DSDE'
,p_is_required=>true
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(183888452447438291)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Desde'
,p_source=>'FCHA_DSDE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese la fecha inicial para el descuento.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46597551481083220)
,p_name=>'P9_FCHA_HSTA'
,p_is_required=>true
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(183888452447438291)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Hasta'
,p_source=>'FCHA_HSTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese la fecha final del descuento.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47762603459414901)
,p_name=>'P9_ID_CNCPTO_DSCNTO_GRPO'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(183888452447438291)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Concepto de Descuento Grupo'
,p_source=>'ID_CNCPTO_DSCNTO_GRPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_cncpto || '' - '' || dscrpcion d ,',
'       id_cncpto r',
'  from df_i_conceptos',
' where cdgo_clnte         = :F_CDGO_CLNTE',
'   and id_impsto          = :P9_ID_IMPSTO',
'   and ctgria_cncpto      = ''D''',
'   and cdgo_cncpto_tpo    = ''CRD''',
'   and actvo              = ''S''',
'  -- and id_cncpto_rlcnal   = :P9_ID_CNCPTO',
' order by 1',
''))
,p_lov_cascade_parent_items=>'P9_ID_IMPSTO,P9_ID_CNCPTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione de la lista el grupo del concepto de descuento.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(183891944527438314)
,p_name=>'P9_ID_DSCNTO_RGLA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(183888452447438291)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_DSCNTO_RGLA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(183892410940438346)
,p_name=>'P9_CDGO_CLNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(183888452447438291)
,p_use_cache_before_default=>'NO'
,p_item_default=>'&F_CDGO_CLNTE.'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(183892753042438349)
,p_name=>'P9_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(183888452447438291)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tributo'
,p_source=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tributo.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(183893183892438350)
,p_name=>'P9_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(183888452447438291)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tributo Sub-Tributo'
,p_source=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where id_impsto = :P9_ID_IMPSTO',
' order by 1'))
,p_lov_cascade_parent_items=>'P9_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione de la lista el subtributo.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(183893585552438350)
,p_name=>'P9_VGNCIA_HSTA'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(183888452447438291)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Vigencia Hasta'
,p_source=>'VGNCIA_HSTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione la vigencia final.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(183893951535438351)
,p_name=>'P9_ID_PRDO_HSTA'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(183888452447438291)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Periodo hasta'
,p_source=>'ID_PRDO_HSTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select prdo || '' - '' || dscrpcion as d,',
'       id_prdo as r',
'  from df_i_periodos',
' where vgncia = :P9_VGNCIA_HSTA',
'  and cdgo_clnte = :F_CDGO_CLNTE',
'  and id_impsto = :P9_ID_IMPSTO',
'  and id_impsto_sbmpsto = :P9_ID_IMPSTO_SBMPSTO',
' order by 1'))
,p_lov_cascade_parent_items=>'P9_VGNCIA_HSTA,P9_ID_IMPSTO,P9_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione el periodo final.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(183894375043438352)
,p_name=>'P9_ID_CNCPTO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(183888452447438291)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Concepto'
,p_source=>'ID_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_cncpto || '' - '' || dscrpcion d ,',
'       id_cncpto r',
'  from df_i_conceptos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_impsto = :P9_ID_IMPSTO',
' order by 1',
''))
,p_lov_cascade_parent_items=>'P9_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione de la lista el concepto.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(183894772947438352)
,p_name=>'P9_PRCNTJE_DSCNTO'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(183888452447438291)
,p_use_cache_before_default=>'NO'
,p_source=>'PRCNTJE_DSCNTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(183895220612438352)
,p_name=>'P9_CDGO_TPO_DSCNTO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(183888452447438291)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo Descuento'
,p_source=>'CDGO_DSCNTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Incentivo;INC,Descuento;DSC'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tipo de descuento'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(183895560713438352)
,p_name=>'P9_ACTVO'
,p_is_required=>true
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(183888452447438291)
,p_use_cache_before_default=>'NO'
,p_item_default=>'S'
,p_prompt=>unistr('\00BFActivo?')
,p_source=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione "S\00ED" para activar el descuento y "No" para desactivarlo.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(183939660054921462)
,p_name=>'P9_PRCNTJE_DSCNTO_DISPLAY'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(183888452447438291)
,p_prompt=>'Porcentaje Descuento'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>3
,p_cMaxlength=>3
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese el porcentaje de descuento.'
,p_attribute_02=>'100'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(46597926814083224)
,p_validation_name=>'Vigencia hasta mayor que vigencia desde'
,p_validation_sequence=>10
,p_validation=>'(:P9_VGNCIA_DSDE<=:P9_VGNCIA_HSTA)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'La Vigencia Hasta debe ser Mayor que la Vigencia Desde.'
,p_associated_item=>wwv_flow_api.id(183893585552438350)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(183889644677438295)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(183889636730438295)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(183890496068438307)
,p_event_id=>wwv_flow_api.id(183889644677438295)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(182522031279831706)
,p_name=>'Validar solo numero'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_PRCNTJE_DSCNTO_DISPLAY'
,p_bind_type=>'bind'
,p_bind_event_type=>'keydown'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(182522090609831707)
,p_event_id=>wwv_flow_api.id(182522031279831706)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'//return isNumber(event);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(16451011087791508)
,p_name=>unistr('Actualizar IG Condiciones al cerrar modal de Gesti\00F3n de Condiciones')
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(10281346295958731)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(16451123055791509)
,p_event_id=>wwv_flow_api.id(16451011087791508)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(10281346295958731)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(47853071846794602)
,p_name=>'Al cambiar fecha de inicio'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_FCHA_DSDE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(47853161753794603)
,p_event_id=>wwv_flow_api.id(47853071846794602)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P9_FCHA_HSTA").datepicker( ''option'' , ''minDate'' , $("#P9_FCHA_DSDE").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(47764311569414918)
,p_name=>unistr('Refrescar Regi\00F3n de condiciones')
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(47764431782414919)
,p_event_id=>wwv_flow_api.id(47764311569414918)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(10281346295958731)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(47857256934794644)
,p_name=>'al cerrar modal'
,p_event_sequence=>70
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(47857336076794645)
,p_event_id=>wwv_flow_api.id(47857256934794644)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(10281346295958731)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7859442752891604)
,p_name=>'Mostrar extiende cuotas'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_IND_APLCA_CNVNIO'
,p_condition_element=>'P9_IND_APLCA_CNVNIO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7859510809891605)
,p_event_id=>wwv_flow_api.id(7859442752891604)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_IND_EXTNDE_TMPO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7859605616891606)
,p_event_id=>wwv_flow_api.id(7859442752891604)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_IND_EXTNDE_TMPO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7859791983891607)
,p_event_id=>wwv_flow_api.id(7859442752891604)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_IND_EXTNDE_TMPO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'N'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(183896342861438357)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from RE_G_DESCUENTOS_REGLA'
,p_attribute_02=>'RE_G_DESCUENTOS_REGLA'
,p_attribute_03=>'P9_ID_DSCNTO_RGLA'
,p_attribute_04=>'ID_DSCNTO_RGLA'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(183939940262921465)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Calcular Porcentaje'
,p_process_sql_clob=>':P9_PRCNTJE_DSCNTO_DISPLAY :=  (:P9_PRCNTJE_DSCNTO *  100);'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(183939910412921464)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Calcular Item porcentaje descuento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P9_PRCNTJE_DSCNTO :=  (:P9_PRCNTJE_DSCNTO_DISPLAY /  100);',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(183896750504438360)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of RE_G_DESCUENTOS_REGLA'
,p_attribute_02=>'RE_G_DESCUENTOS_REGLA'
,p_attribute_03=>'P9_ID_DSCNTO_RGLA'
,p_attribute_04=>'ID_DSCNTO_RGLA'
,p_attribute_09=>'P9_ID_DSCNTO_RGLA'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n Procesada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(183897170039438361)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(183889126464438295)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(183897564670438361)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(183889636730438295)
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
