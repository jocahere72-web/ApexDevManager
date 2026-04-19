prompt --application/pages/page_00157
begin
wwv_flow_api.create_page(
 p_id=>157
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Prescripci\00F3n Lotes de Selecci\00F3n')
,p_step_title=>unistr('Gesti\00F3n de Lotes de Prescripci\00F3n')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JDIAZ'
,p_last_upd_yyyymmddhh24miss=>'20191113165112'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(99305014535486415)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
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
 p_id=>wwv_flow_api.id(99305275415486417)
,p_plug_name=>unistr('Prescripci\00F3n Selecci\00F3n Lote')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(107917591546785703)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i>',
'    </b>',
'</h5>',
'<i>',
unistr('Funcionalidad que permite gestionar la selecci\00F3n de los lotes puntuales o masivos para iniciar el proceso de prescripci\00F3n.'),
'<br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(172752640141494913)
,p_plug_name=>'P157_LOTE_DETALLE'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P157_ID_PRSCRPCION_LTE'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(172584117141808504)
,p_plug_name=>'Sujeto'
,p_region_name=>'IG_SUJETO'
,p_parent_plug_id=>wwv_flow_api.id(172752640141494913)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.id_prscrpcion_sjto_impst_lt,',
'            a.cdgo_clnte,',
'            a.id_prscrpcion_lte,',
'            a.id_impsto,',
'            a.id_impsto_sbmpsto,',
'            a.id_sjto_impsto',
'from        gf_g_prscrpcns_sjt_impst_lt     a',
'where       a.cdgo_clnte        =       :F_CDGO_CLNTE',
'and         a.id_prscrpcion_lte =       :P157_ID_PRSCRPCION_LTE',
'and         a.id_impsto         =       nvl(:P157_ID_IMPSTO, a.id_impsto)',
'and         a.id_impsto_sbmpsto =       nvl(:P157_ID_IMPSTO_SBMPSTO, a.id_impsto_sbmpsto)',
'and         exists(select       1',
'                   from         v_si_i_sujetos_impuesto     b',
'                   where        b.cdgo_clnte            =       a.cdgo_clnte',
'                   and          b.id_impsto             =       a.id_impsto',
'                   and          b.id_sjto_impsto        =       a.id_sjto_impsto',
'                   and          b.idntfccion_sjto       =       nvl(:P157_IDNTFCCION, b.idntfccion_sjto)',
'                  );'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(27616863548781602)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(99695857497154702)
,p_name=>'ID_PRSCRPCION_SJTO_IMPST_LT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRSCRPCION_SJTO_IMPST_LT'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(99695978710154703)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
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
,p_default_type=>'ITEM'
,p_default_expression=>'F_CDGO_CLNTE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(99696030579154704)
,p_name=>'ID_PRSCRPCION_LTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRSCRPCION_LTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P157_ID_PRSCRPCION_LTE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(99696130412154705)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(2335316031561140)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(99696225478154706)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Sub-Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.nmbre_impsto_sbmpsto,',
'            a.id_impsto_sbmpsto',
'from        df_i_impuestos_subimpuesto      a',
'where       a.cdgo_clnte        =   :F_CDGO_CLNTE',
'and         a.id_impsto         =   :ID_IMPSTO;'))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'ID_IMPSTO'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(99696339882154707)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.idntfccion_sjto as idntfccion_sjto,',
'            a.id_sjto_impsto',
'from        v_si_i_sujetos_impuesto     a',
'where       a.cdgo_clnte        =   :F_CDGO_CLNTE',
'and         a.id_impsto         =   :ID_IMPSTO',
'order by    a.idntfccion_sjto;'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'ID_IMPSTO'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(99696402023154708)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(99696513468154709)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(99695717096154701)
,p_internal_uid=>99695717096154701
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
,p_pagination_type=>'SET'
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
 p_id=>wwv_flow_api.id(99702171557155263)
,p_interactive_grid_id=>wwv_flow_api.id(99695717096154701)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(99702201262155263)
,p_report_id=>wwv_flow_api.id(99702171557155263)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(27623402253804294)
,p_view_id=>wwv_flow_api.id(99702201262155263)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(27616863548781602)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99702756864155265)
,p_view_id=>wwv_flow_api.id(99702201262155263)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(99695857497154702)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99703287618155266)
,p_view_id=>wwv_flow_api.id(99702201262155263)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(99695978710154703)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99703763026155267)
,p_view_id=>wwv_flow_api.id(99702201262155263)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(99696030579154704)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99704209689155268)
,p_view_id=>wwv_flow_api.id(99702201262155263)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(99696130412154705)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99704715340155321)
,p_view_id=>wwv_flow_api.id(99702201262155263)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(99696225478154706)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>2
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99705232012155322)
,p_view_id=>wwv_flow_api.id(99702201262155263)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(99696339882154707)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>3
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99707350655160118)
,p_view_id=>wwv_flow_api.id(99702201262155263)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(99696402023154708)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(172751730276494904)
,p_plug_name=>'Vigencia'
,p_region_name=>'P157_VGNCIA'
,p_parent_plug_id=>wwv_flow_api.id(172752640141494913)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.id_prscrpcion_vgncia_lte,',
'            a.cdgo_clnte,',
'            a.id_prscrpcion_sjto_impst_lt,',
'            a.vgncia,',
'            a.id_prdo',
'from        gf_g_prescrpcns_vgncia_lte      a',
'where       a.cdgo_clnte        =       :F_CDGO_CLNTE;'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(172584117141808504)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(99616177412984019)
,p_name=>'ID_PRSCRPCION_VGNCIA_LTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRSCRPCION_VGNCIA_LTE'
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
,p_is_primary_key=>true
,p_default_type=>'SEQUENCE'
,p_default_expression=>'sq_gf_g_prescrpcns_vgncia_lte'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(99616249252984020)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
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
,p_default_type=>'ITEM'
,p_default_expression=>'F_CDGO_CLNTE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(99616346923984021)
,p_name=>'ID_PRSCRPCION_SJTO_IMPST_LT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRSCRPCION_SJTO_IMPST_LT'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(99695857497154702)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(99616483700984022)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.vgncia as text,',
'            a.vgncia as value',
'from        df_s_vigencias        a',
'order by    a.vgncia;'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(99616544463984023)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      ''* '' ||a.dscrpcion ||'' * '' || a.prdo,',
'            a.id_prdo',
'from        df_i_periodos       a',
'where       a.cdgo_clnte        =   :F_CDGO_CLNTE',
'and         a.vgncia            =   :VGNCIA',
'and         exists(select       1',
'                   from         gf_g_prscrpcns_sjt_impst_lt     b',
'                   where        b.cdgo_clnte                    =   a.cdgo_clnte',
'                   and          b.id_prscrpcion_sjto_impst_lt   =   :ID_PRSCRPCION_SJTO_IMPST_LT',
'                   and          b.id_impsto                     =   a.id_impsto',
'                   and          b.id_impsto_sbmpsto             =   a.id_impsto_sbmpsto',
'                  );'))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'ID_PRSCRPCION_SJTO_IMPST_LT,VGNCIA'
,p_ajax_items_to_submit=>'ID_PRDO'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(99616726119984025)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(99616882685984026)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(99616083437984018)
,p_internal_uid=>99616083437984018
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
,p_pagination_type=>'SET'
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
 p_id=>wwv_flow_api.id(99650088542011955)
,p_interactive_grid_id=>wwv_flow_api.id(99616083437984018)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(99650137341011955)
,p_report_id=>wwv_flow_api.id(99650088542011955)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99650687686011956)
,p_view_id=>wwv_flow_api.id(99650137341011955)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(99616177412984019)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99651121213011957)
,p_view_id=>wwv_flow_api.id(99650137341011955)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(99616249252984020)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99651662512011958)
,p_view_id=>wwv_flow_api.id(99650137341011955)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(99616346923984021)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>10
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99652173410012022)
,p_view_id=>wwv_flow_api.id(99650137341011955)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(99616483700984022)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99652689741012023)
,p_view_id=>wwv_flow_api.id(99650137341011955)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(99616544463984023)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99654268300013460)
,p_view_id=>wwv_flow_api.id(99650137341011955)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(99616726119984025)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(186075382044874953)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_plug_read_only_when_type=>'ITEM_IS_NULL'
,p_plug_read_only_when=>'P157_ID_PRSCRPCION_LTE'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(99305181184486416)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(99305014535486415)
,p_button_name=>'BTN_NUEVO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Lote'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:158:&SESSION.::&DEBUG.:RP,158::'
,p_button_condition=>'P157_ID_PRSCRPCION_LTE'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(99792787358764701)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(99305014535486415)
,p_button_name=>'BTN_SQL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>unistr('Selecci\00F3n Masiva x Regla')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:162:&SESSION.::&DEBUG.:RP,162:P162_ID_PRSCRPCION_LTE,P162_APP_ID,P162_APP_PAGE_ID:&P157_ID_PRSCRPCION_LTE.,&APP_ID.,&APP_PAGE_ID.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      1',
'from        gf_g_prescripciones_lte     a',
'where       a.cdgo_clnte        =   :F_CDGO_CLNTE',
'and         a.id_prscrpcion_lte =   :P157_ID_PRSCRPCION_LTE',
'and         a.prcsdo            =   ''N'';'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-file-sql'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(101462856929687603)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(99305014535486415)
,p_button_name=>'BTN_ELMNAR_LTE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Eliminar Lote'
,p_button_position=>'BELOW_BOX'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      1',
'from        gf_g_prescripciones_lte     a',
'where       a.cdgo_clnte        =   :F_CDGO_CLNTE',
'and         a.id_prscrpcion_lte =   :P157_ID_PRSCRPCION_LTE',
'and         a.prcsdo            =   ''N'';'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(101463163570687606)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(99305014535486415)
,p_button_name=>'BTN_INCIAR_PRS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>unistr('Iniciar Prescripci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:168:&SESSION.::&DEBUG.:RP,168:P168_ID_PRSCRPCION_LTE:&P157_ID_PRSCRPCION_LTE.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      1',
'from        gf_g_prescripciones_lte     a',
'where       a.cdgo_clnte        =   :F_CDGO_CLNTE',
'and         a.id_prscrpcion_lte =   :P157_ID_PRSCRPCION_LTE',
'and         a.prcsdo            =   ''N'';'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-play'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(99305805480486423)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(99305275415486417)
,p_button_name=>'BTN_CONSULTA'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(99305920672486424)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(99305275415486417)
,p_button_name=>'BTN_ACTLZAR_OBSVCION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>unistr('Actualizar Observaci\00F3n')
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:158:&SESSION.::&DEBUG.:RP,158:P158_ID_PRSCRPCION_LTE:&P157_ID_PRSCRPCION_LTE.'
,p_button_condition=>'P157_ID_PRSCRPCION_LTE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-clipboard-edit'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(101875734276171801)
,p_branch_name=>'Ir a pagina 157'
,p_branch_action=>'f?p=&APP_ID.:157:&SESSION.::&DEBUG.:RP,157::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(101462856929687603)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17757358438340703)
,p_name=>'P157_VGNCIAS_SLCCNDAS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(172751730276494904)
,p_prompt=>'Vgncias Slccndas'
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
 p_id=>wwv_flow_api.id(99305335332486418)
,p_name=>'P157_ID_PRSCRPCION_LTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(99305275415486417)
,p_prompt=>unistr('Lote de Selecci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      ''Lote: ''|| a.id_prscrpcion_lte || '' Fecha: '' || a.fcha_lte || '' Usuario: '' || b.nmbre_trcro as text,',
'            a.id_prscrpcion_lte as value',
'from        gf_g_prescripciones_lte     a',
'inner join  v_sg_g_usuarios             b   on  b.id_usrio  =   a.id_usrio',
'where       a.cdgo_clnte        =       :F_CDGO_CLNTE',
'and         a.id_usrio          =       :F_ID_USRIO',
'and         a.prcsdo            =       ''N''',
'order by    a.id_prscrpcion_lte desc;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'60%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99305468023486419)
,p_name=>'P157_OBSRVCION_LTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(99305275415486417)
,p_prompt=>unistr('Observaci\00F3n de Lote')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101471516715713369)
,p_name=>'P157_IDNTFCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(186075382044874953)
,p_prompt=>unistr('<b>Identificaci\00F3n</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101471925260713372)
,p_name=>'P157_ID_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(186075382044874953)
,p_prompt=>'<b>Tributo</b>'
,p_display_as=>'NATIVE_SELECT_LIST'
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
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101472306873713372)
,p_name=>'P157_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(186075382044874953)
,p_prompt=>'<b>Sub-Tributo</b>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.nmbre_impsto_sbmpsto',
'           ,a.id_impsto_sbmpsto ',
'from        df_i_impuestos_subimpuesto      a',
'where       a.id_impsto     =   :P157_ID_IMPSTO;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P157_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(99305516079486420)
,p_computation_sequence=>10
,p_computation_item=>'P157_OBSRVCION_LTE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.obsrvcnes_lte',
'from        gf_g_prescripciones_lte     a',
'where       a.cdgo_clnte        =       :F_CDGO_CLNTE',
'and         a.id_usrio          =       :F_ID_USRIO',
'and         a.id_prscrpcion_lte =       :P157_ID_PRSCRPCION_LTE;'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(120363660444067702)
,p_tabular_form_region_id=>wwv_flow_api.id(172584117141808504)
,p_validation_name=>'gf_g_prscrpcns_sjt_impst_lt_fk'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  1',
'from    gf_g_prescrpcns_vgncia_lte  a',
'where   a.id_prscrpcion_sjto_impst_lt   =   :ID_PRSCRPCION_SJTO_IMPST_LT;'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'El Sujeto-Tributo no se puede eliminar mientras tenga vigencias asociadas.'
,p_always_execute=>'Y'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(119453424032128504)
,p_tabular_form_region_id=>wwv_flow_api.id(172584117141808504)
,p_validation_name=>'gf_g_prscrpcns_sjt_impst_lt_un'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  1',
'from    gf_g_prscrpcns_sjt_impst_lt    a',
'where   a.cdgo_clnte         =    :CDGO_CLNTE',
'and     a.id_prscrpcion_lte  =    :ID_PRSCRPCION_LTE',
'and     a.id_sjto_impsto     =    :ID_SJTO_IMPSTO;'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>unistr('Sujeto-Tributo duplicado, por favor revisar informaci\00F3n.')
,p_validation_condition_type=>'NEVER'
,p_exec_cond_for_each_row=>'Y'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(119453550027128505)
,p_tabular_form_region_id=>wwv_flow_api.id(172751730276494904)
,p_validation_name=>'gf_g_pr_vg_lt_vgncias_prdos_un'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select    1',
'from      gf_g_prescrpcns_vgncia_lte    a',
'where     a.cdgo_clnte                     = :CDGO_CLNTE',
'and       a.id_prscrpcion_sjto_impst_lt    = :ID_PRSCRPCION_SJTO_IMPST_LT',
'and       a.vgncia                         = :VGNCIA',
'and       a.id_prdo                        = :ID_PRDO;'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>unistr('Vigencia y periodo duplicado, por favor revisar informaci\00F3n.')
,p_validation_condition_type=>'NEVER'
,p_exec_cond_for_each_row=>'Y'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(17757241859340702)
,p_tabular_form_region_id=>wwv_flow_api.id(172584117141808504)
,p_validation_name=>unistr('Validar Selecci\00F3n de lote')
,p_validation_sequence=>50
,p_validation=>'ID_PRSCRPCION_LTE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Se debe seleccionar un lote.'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(108591364055526601)
,p_name=>unistr('Al cerrar procesar regla de selecci\00F3n masiva')
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(99792787358764701)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108591411839526602)
,p_event_id=>wwv_flow_api.id(108591364055526601)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(172584117141808504)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(114955327022976901)
,p_name=>'Al hacer clic BTN_ELMNAR_LTE'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(101462856929687603)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(114955440661976902)
,p_event_id=>wwv_flow_api.id(114955327022976901)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function fnc_eliminarLote(){',
'    let $waitPopup = apex.widget.waitPopup();',
'    try{',
'        await apex.server.process ( "ajax_eliminarLote", {',
'            pageItems: "#P157_ID_PRSCRPCION_LTE"',
'        }, {',
'            success: function( pData ){',
'                if (pData.o_cdgo_rspsta != 0){',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors ([',
'                        {',
'                            type:       "error",',
'                            location:   "page",',
'                            message:    pData.o_mnsje_rspsta,',
'                            unsafe:     false',
'                        }',
'                    ]);',
'                }else{',
unistr('                    sessionStorage.setItem("v_msgInciarPrscpcion", "Acci\00F3n procesada con \00E9xito.");'),
'                    window.location.href = pData.o_url;',
'                }',
'            }',
'        })',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        $waitPopup.remove();',
'    }',
'};',
'',
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de eliminar el lote de selecci\00F3n?", function( okPressed ) {'),
'        if( okPressed ) {',
'            fnc_eliminarLote();',
'        }',
'    });'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(116251367255546307)
,p_name=>unistr('Validar mensaje iniciar prescripci\00F3n')
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(116251447836546308)
,p_event_id=>wwv_flow_api.id(116251367255546307)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (window.sessionStorage.v_msgInciarPrscpcion){',
'    apex.message.showPageSuccess(window.sessionStorage.v_msgInciarPrscpcion);',
'    window.sessionStorage.removeItem(''v_msgInciarPrscpcion'');',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(27617664610781610)
,p_name=>unistr('Cambiar Selecci\00F3n')
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(172584117141808504)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27617759621781611)
,p_event_id=>wwv_flow_api.id(27617664610781610)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var region = apex.region("IG_SUJETO");	',
'var v_slccion;',
'if(region){',
'	var view = region.widget().interactiveGrid("getViews", "grid");',
'	var model = view.model;',
'	var records = view.view$.grid("getSelectedRecords");',
'	if(!$.isEmptyObject(records)){',
'		v_slccion = model.getValue(records[0], "ID_PRSCRPCION_SJTO_IMPST_LT");',
'	}else{',
'		v_slccion = null;',
'	}',
'}',
'if (v_slccion){',
'	$( "#P157_VGNCIA").show();',
'}else{',
'	$( "#P157_VGNCIA").hide();',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(99616915577984027)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(172751730276494904)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Vigencia: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>'No se puede agregar mas de 2 veces la misma vigencia y periodo.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n procesada con \00E9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(99696600266154710)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(172584117141808504)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Sujeto: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>'No se puede agregar mas de 2 veces el mismo Sujeto-Tributo.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n Procesada con \00E9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(101462979253687604)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar lote de seleccion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(1000);',
'    v_xml             varchar2(1000);',
'begin',
'    v_xml :=        ''<CDGO_CLNTE>''           ||:F_CDGO_CLNTE          ||''</CDGO_CLNTE>'';',
'    v_xml := v_xml||''<ID_PRSCRPCION_LTE>''    ||:P157_ID_PRSCRPCION_LTE||''</ID_PRSCRPCION_LTE>'';',
'    ',
'    pkg_gf_prescripcion.prc_el_prscrpcn_pblcion_msva(p_xml								=>    v_xml',
'                                                    ,o_cdgo_rspsta						=>    v_cdgo_rspsta',
'                                                    ,o_mnsje_rspsta						=>    v_mnsje_rspsta',
'                                                    );                                            ',
'	if (v_cdgo_rspsta <> 0) then',
'		RAISE_APPLICATION_ERROR (-20000,v_mnsje_rspsta); ',
'	end if;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(101462856929687603)
,p_process_when_type=>'NEVER'
,p_process_success_message=>unistr('Lote eliminado con \00E9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(115150578451906404)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_eliminarLote'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(1000);',
'    v_xml             varchar2(1000);',
'    v_url             varchar2(4000);',
'begin',
'    v_xml :=        ''<CDGO_CLNTE>''           ||:F_CDGO_CLNTE          ||''</CDGO_CLNTE>'';',
'    v_xml := v_xml||''<ID_PRSCRPCION_LTE>''    ||:P157_ID_PRSCRPCION_LTE||''</ID_PRSCRPCION_LTE>'';',
'    ',
'    pkg_gf_prescripcion.prc_el_prscrpcn_pblcion_msva(p_xml			   =>    v_xml,',
'                                                     o_cdgo_rspsta	   =>    v_cdgo_rspsta,',
'                                                     o_mnsje_rspsta    =>    v_mnsje_rspsta);',
'                                                     ',
'    v_url := APEX_UTIL.PREPARE_URL(p_url => ''f?p='' || :APP_ID || '':'' || :APP_PAGE_ID || '':''|| :APP_SESSION || '':::'' || :APP_PAGE_ID || ''::'');',
'                                                    ',
'	owa_util.mime_header(''application/json'', false);',
'    htp.p(''cache-control: no-cache'');',
'    htp.p(''pragma: no-cache''); ',
'    owa_util.http_header_close;',
'    ',
'    htp.p(''{"o_cdgo_rspsta" : "'' || v_cdgo_rspsta || ''",'' ||',
'          ''"o_mnsje_rspsta" : "''||v_mnsje_rspsta||''",'' ||',
'          ''"o_url" : "'' || v_url || ''"}'');',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P157_ID_PRSCRPCION_LTE'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
