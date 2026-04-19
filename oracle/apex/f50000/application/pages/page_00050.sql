prompt --application/pages/page_00050
begin
wwv_flow_api.create_page(
 p_id=>50
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>unistr('Limites Liquidaci\00F3n')
,p_step_title=>unistr('L\00EDmites Liquidaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buttonCollapse(id){',
'	if($(''#''+id).attr(''aria-expanded'') == ''true''){',
'		$(''#''+id).click();',
'	}',
'}',
'',
'',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'buttonCollapse(''t_Button_rightControlButton'');',
'',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-GV {',
'    line-height: 11px;',
'}'))
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20201222101359'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(30246395236576402)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
unistr('<p>Funcionalidad que permite establecer los l\00EDmites de liquidacion escogiendo la columna de la tabla y aplicarle la compuerta l\00F3gica que corresponda.</p>'),
unistr('<p>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(331201327505989944)
,p_plug_name=>unistr('L\00EDmite de Liquidaci\00F3n')
,p_region_name=>'emp'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select  id_prdio_lmte_lqdcion,',
'            fcha_incial,',
'            cdgo_clnte,',
'            id_impsto,',
'            id_impsto_sbmpsto,',
'            fcha_fnal,',
'            nmbre_tbla,',
'            nmbre_clmna,',
'            id_oprdor_tpo,',
'            cmprta_lgca,',
'            orden_agrpcion ,',
'            tpo_clmna',
'      from gi_d_predios_lmte_lqdcion',
'         where cdgo_clnte        = :F_CDGO_CLNTE  ',
'           and id_impsto         = :P50_IMPUESTO ',
'           and id_impsto_sbmpsto = :P50_IMPUESTO_SUBIMPUESTO ',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(133309123301338210)
,p_name=>'TPO_CLMNA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_CLMNA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tipo de Dato'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select data_type a',
'       , data_type b',
'    from user_tab_columns',
'   where table_name = :nmbre_tbla',
'     and column_name = :nmbre_clmna'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'NMBRE_TBLA,NMBRE_CLMNA'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(164703636170470429)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>30
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(164703718658470430)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(164704160831470434)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
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
,p_default_type=>'STATIC'
,p_default_expression=>'&F_CDGO_CLNTE.'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(164704448702470437)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
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
,p_default_type=>'ITEM'
,p_default_expression=>'P50_IMPUESTO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(164704524152470438)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P50_IMPUESTO_SUBIMPUESTO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(331201542739989946)
,p_name=>'ID_PRDIO_LMTE_LQDCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDIO_LMTE_LQDCION'
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(331202003709989950)
,p_name=>'FCHA_INCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_INCIAL'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Inicial'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD-MON-YYYY'
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
 p_id=>wwv_flow_api.id(331202045388989951)
,p_name=>'FCHA_FNAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_FNAL'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Final'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD-MON-YYYY'
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
 p_id=>wwv_flow_api.id(331202166693989952)
,p_name=>'NMBRE_TBLA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TBLA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Nombre Tabla'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select table_name as d,',
'       table_name as r',
'  from user_tables ',
' where table_name in (''GI_G_LIQUIDACIONES_AD_PREDIO'')',
' order by 1'))
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
 p_id=>wwv_flow_api.id(331202272511989953)
,p_name=>'NMBRE_CLMNA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_CLMNA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Nombre Columna'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select column_name d ,',
'        column_name r',
'    from user_tab_columns',
'        where  table_name in :NMBRE_TBLA',
'        order by 1'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'NMBRE_TBLA'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(331202369506989954)
,p_name=>'ID_OPRDOR_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_OPRDOR_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tipo Operador'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(166561465066557861)
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
 p_id=>wwv_flow_api.id(331202497779989955)
,p_name=>'CMPRTA_LGCA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CMPRTA_LGCA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Compuerta<br> L\00F3gica')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:AND,OR,-,'
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
 p_id=>wwv_flow_api.id(331202601356989956)
,p_name=>'ORDEN_AGRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ORDEN_AGRPCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Orden<br> Agrupaci\00F3n')
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(331201493534989945)
,p_internal_uid=>331201493534989945
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_max_row_count=>100000
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SAVE'
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
 p_id=>wwv_flow_api.id(332831314327882235)
,p_interactive_grid_id=>wwv_flow_api.id(331201493534989945)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(332831468375882235)
,p_report_id=>wwv_flow_api.id(332831314327882235)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1187300035639)
,p_view_id=>wwv_flow_api.id(332831468375882235)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(164704448702470437)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>203
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1641067035667)
,p_view_id=>wwv_flow_api.id(332831468375882235)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(164704524152470438)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>197
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(166670429543646388)
,p_view_id=>wwv_flow_api.id(332831468375882235)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(164703636170470429)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>10
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(166727792803894696)
,p_view_id=>wwv_flow_api.id(332831468375882235)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(164704160831470434)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(167109936907682213)
,p_view_id=>wwv_flow_api.id(332831468375882235)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(133309123301338210)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(332831984921882257)
,p_view_id=>wwv_flow_api.id(332831468375882235)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(331201542739989946)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(332833861953882298)
,p_view_id=>wwv_flow_api.id(332831468375882235)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(331202003709989950)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>98
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(332834324826882300)
,p_view_id=>wwv_flow_api.id(332831468375882235)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(331202045388989951)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>96
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(332834866544882302)
,p_view_id=>wwv_flow_api.id(332831468375882235)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(331202166693989952)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(332835350473882304)
,p_view_id=>wwv_flow_api.id(332831468375882235)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(331202272511989953)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>161
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(332835842814882309)
,p_view_id=>wwv_flow_api.id(332831468375882235)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(331202369506989954)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(332836336922882311)
,p_view_id=>wwv_flow_api.id(332831468375882235)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(331202497779989955)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>128
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(332836908437882312)
,p_view_id=>wwv_flow_api.id(332831468375882235)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(331202601356989956)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>108
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(495051624681078565)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29541487623068504)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(166499797170519571)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(495051624681078565)
,p_button_name=>'Btn_consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(166500567951519590)
,p_name=>'P50_IMPUESTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(495051624681078565)
,p_prompt=>'<b>Tributo</b>'
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
,p_lov_null_text=>'-Seleccione Impuesto-'
,p_cHeight=>1
,p_grid_column=>4
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(166501333470519597)
,p_name=>'P50_IMPUESTO_SUBIMPUESTO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(495051624681078565)
,p_prompt=>'<b>Sub Tributo</b>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto d, ',
'          id_impsto_sbmpsto r ',
'  from df_i_impuestos_subimpuesto ',
' where id_impsto = :P50_IMPUESTO'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccione Subimpuesto-'
,p_lov_cascade_parent_items=>'P50_IMPUESTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(164703846056470431)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(331201327505989944)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Limites de Liquidaci\00F3n - Save Interactive Grid Data')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
