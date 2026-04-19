prompt --application/pages/page_00912
begin
wwv_flow_api.create_page(
 p_id=>912
,p_user_interface_id=>wwv_flow_api.id(103265655096132800)
,p_name=>'sg_g_usuarios'
,p_page_mode=>'MODAL'
,p_step_title=>'Usuario'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'function mayuscula(id){',
'$(''#''+id).val($(''#''+id).val().toUpperCase());',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_dialog_width=>'75%'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_last_updated_by=>'JVARGAS'
,p_last_upd_yyyymmddhh24miss=>'20230116164916'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2226076211283434)
,p_plug_name=>unistr('Regi\00F3n Display Selector')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(31771243726501113)
,p_plug_name=>'Perfiles'
,p_parent_plug_id=>wwv_flow_api.id(2226076211283434)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29943643729317093)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select id_prfil_usrio,',
'        id_usrio,',
'        id_prfil',
'   from sg_g_perfiles_usuario',
'  where id_usrio = :P912_ID_USRIO'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P912_ID_USRIO'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(31771758353501118)
,p_name=>'ID_PRFIL_USRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRFIL_USRIO'
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
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(31771830241501119)
,p_name=>'ID_USRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_USRIO'
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
,p_default_expression=>'P912_ID_USRIO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(31771948383501120)
,p_name=>'ID_PRFIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRFIL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Perfil'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_prfil,',
'        id_prfil ',
'   from sg_g_perfiles ',
'  where cdgo_clnte = :F_CDGO_CLNTE ',
'    and indcdor_prfil_admnstdor = ''N''',
'union',
' select nmbre_prfil,',
'        id_prfil ',
'   from sg_g_perfiles ',
'  where cdgo_clnte = :F_CDGO_CLNTE ',
'    and indcdor_prfil_admnstdor = ''S''',
'    and :F_ID_USRIO in (select id_usrio ',
'                           from v_sg_g_perfiles_usuario ',
'                          where id_usrio = :F_ID_USRIO',
'                            and id_prfil in (select id_prfil from sg_g_perfiles where indcdor_prfil_admnstdor = ''S'')',
'                 )',
'         ',
'order by 1'))
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
 p_id=>wwv_flow_api.id(31772083073501121)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(31772130150501122)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(31771667562501117)
,p_internal_uid=>31771667562501117
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
 p_id=>wwv_flow_api.id(31983273293764104)
,p_interactive_grid_id=>wwv_flow_api.id(31771667562501117)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(31983359621764104)
,p_report_id=>wwv_flow_api.id(31983273293764104)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(31983873807764105)
,p_view_id=>wwv_flow_api.id(31983359621764104)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(31771758353501118)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(31984337817764108)
,p_view_id=>wwv_flow_api.id(31983359621764104)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(31771830241501119)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(31984805109764109)
,p_view_id=>wwv_flow_api.id(31983359621764104)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(31771948383501120)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>670
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(31985393221764110)
,p_view_id=>wwv_flow_api.id(31983359621764104)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(31772083073501121)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39661825887056228)
,p_plug_name=>'Sub-Tributos'
,p_parent_plug_id=>wwv_flow_api.id(2226076211283434)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select id_usrio_sbmpsto,',
'        id_usrio,',
'        id_impsto,',
'        id_impsto_sbmpsto,',
'        actvo',
'   from sg_g_usuarios_subimpuesto',
'  where id_usrio = :P912_ID_USRIO'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P912_ID_USRIO'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(39662030659056230)
,p_name=>'ID_USRIO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_USRIO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(39662199589056231)
,p_name=>'ID_USRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_USRIO'
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
,p_default_type=>'ITEM'
,p_default_expression=>'P912_ID_USRIO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(39662223423056232)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(103266611170132832)
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(39662327592056233)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Sub-Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select upper(nmbre_impsto_sbmpsto) || '' ['' || upper(cdgo_impsto_sbmpsto) || '']'' display,',
'        id_impsto_sbmpsto value',
'   from df_i_impuestos_subimpuesto',
'  where id_impsto = :ID_IMPSTO'))
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
 p_id=>wwv_flow_api.id(39662423793056234)
,p_name=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFActivo?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
,p_is_required=>true
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
,p_default_type=>'STATIC'
,p_default_expression=>'S'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(39661967064056229)
,p_internal_uid=>39661967064056229
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
 p_id=>wwv_flow_api.id(45364254907352981)
,p_interactive_grid_id=>wwv_flow_api.id(39661967064056229)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(45364349222352981)
,p_report_id=>wwv_flow_api.id(45364254907352981)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(45364816529352985)
,p_view_id=>wwv_flow_api.id(45364349222352981)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(39662030659056230)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(45365307791352991)
,p_view_id=>wwv_flow_api.id(45364349222352981)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(39662199589056231)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(45365822452352994)
,p_view_id=>wwv_flow_api.id(45364349222352981)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(39662223423056232)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(45366323004352995)
,p_view_id=>wwv_flow_api.id(45364349222352981)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(39662327592056233)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>2
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(45366807260353003)
,p_view_id=>wwv_flow_api.id(45364349222352981)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(39662423793056234)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(45457866774856303)
,p_plug_name=>'Tributos'
,p_parent_plug_id=>wwv_flow_api.id(2226076211283434)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29943643729317093)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select id_usrio_impsto,',
'        id_usrio,',
'        id_impsto,',
'        actvo',
'   from sg_g_usuarios_impuesto',
'  where id_usrio = :P912_ID_USRIO',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P912_ID_USRIO'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(45458054866856305)
,p_name=>'ID_USRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_USRIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P912_ID_USRIO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(45458145705856306)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tributo'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(103266611170132832)
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
 p_id=>wwv_flow_api.id(45458202218856307)
,p_name=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFActivo?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
,p_is_required=>true
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
,p_default_type=>'STATIC'
,p_default_expression=>'S'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(45458345841856308)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(45458432605856309)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(45458666972856311)
,p_name=>'ID_USRIO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_USRIO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(45457958143856304)
,p_internal_uid=>45457958143856304
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
 p_id=>wwv_flow_api.id(46544947472785909)
,p_interactive_grid_id=>wwv_flow_api.id(45457958143856304)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(46545027488785912)
,p_report_id=>wwv_flow_api.id(46544947472785909)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(46545550680785921)
,p_view_id=>wwv_flow_api.id(46545027488785912)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(45458054866856305)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(46545985455785927)
,p_view_id=>wwv_flow_api.id(46545027488785912)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(45458145705856306)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(46546415208785929)
,p_view_id=>wwv_flow_api.id(46545027488785912)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(45458202218856307)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(46546908747785932)
,p_view_id=>wwv_flow_api.id(46545027488785912)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(45458345841856308)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(46548969713789887)
,p_view_id=>wwv_flow_api.id(46545027488785912)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(45458666972856311)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(320094013422415066)
,p_plug_name=>unistr('Informaci\00F3n B\00E1sica')
,p_parent_plug_id=>wwv_flow_api.id(2226076211283434)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(39663150422056241)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(39661825887056228)
,p_button_name=>'BTN_NUEVO_SUBIMPUESTO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Gesti\00F3n de Sub-Tributos')
,p_button_position=>'ABOVE_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:RP,9:P9_ID_USRIO:&P912_ID_USRIO.'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103323417811271755)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(320094013422415066)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P912_ID_USRIO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103322207744271753)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(320094013422415066)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103322629694271754)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(320094013422415066)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P912_ID_USRIO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103323095717271754)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(320094013422415066)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(''¿Esta seguro de eliminar el usuario?'',''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P912_ID_USRIO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103323838504271757)
,p_name=>'P912_ID_USRIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(320094013422415066)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_USRIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103324274635271762)
,p_name=>'P912_ID_TRCRO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(320094013422415066)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tercero'
,p_source=>'ID_TRCRO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_trcro) || ''['' || idntfccion || '']'' d,',
'       id_trcro r',
'  from V_DF_C_FUNCIONARIOS',
' where case when :P912_ID_USRIO is null and id_trcro not in (select id_trcro from v_sg_g_usuarios where cdgo_clnte = :F_CDGO_CLNTE and actvo = ''S'')',
'                then 1 ',
'            when :P912_ID_USRIO is not null and id_trcro in (select id_trcro from v_sg_g_usuarios where cdgo_clnte = :F_CDGO_CLNTE )',
'                then 1',
'            else 0',
'        end = 1',
'   and cdgo_clnte = :F_CDGO_CLNTE',
'order by nmbre_trcro;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione un Tercero'
,p_read_only_when=>'P912_ID_USRIO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(29996430207317116)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'290px'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103324590076271762)
,p_name=>'P912_USER_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(320094013422415066)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Usuario'
,p_source=>'USER_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_help_text=>unistr('Usuario con el cual el funcionario podr\00E1 logearse')
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103325317083271763)
,p_name=>'P912_FCHA_CRCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(320094013422415066)
,p_use_cache_before_default=>'NO'
,p_source=>'FCHA_CRCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103325779406271763)
,p_name=>'P912_ADMIN'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(320094013422415066)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFUsuario Administrador?')
,p_source=>'ADMIN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select id_usrio ',
'   from v_sg_g_perfiles_usuario ',
'  where id_usrio = :F_ID_USRIO',
'    and id_prfil in (select id_prfil from sg_g_perfiles where indcdor_prfil_admnstdor = ''S'');'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(29996430207317116)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Especificar si el Funcionario ser\00E1 Administrador')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'1'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'0'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103326158677271763)
,p_name=>'P912_ADMIN_RNION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(320094013422415066)
,p_use_cache_before_default=>'NO'
,p_item_default=>'1'
,p_source=>'ADMIN_RNION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103326577916271765)
,p_name=>'P912_PASSWORD'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(320094013422415066)
,p_use_cache_before_default=>'NO'
,p_source=>'PASSWORD'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103326917779271766)
,p_name=>'P912_FCHA_EXPRCION'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(320094013422415066)
,p_use_cache_before_default=>'NO'
,p_item_default=>'sysdate + 365'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>unistr('Fecha Expiraci\00F3n')
,p_source=>'FCHA_EXPRCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>7
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29996430207317116)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Especificar la fecha en la cual el usuario caduca.'
,p_attribute_02=>'-0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103327328401271766)
,p_name=>'P912_USERNAME_MODIFICA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(320094013422415066)
,p_use_cache_before_default=>'NO'
,p_source=>'USERNAME_MODIFICA'
,p_source_type=>'DB_COLUMN'
,p_source_post_computation=>':APP_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103327715757271766)
,p_name=>'P912_FECHA_MODIFICA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(320094013422415066)
,p_use_cache_before_default=>'NO'
,p_item_default=>'SYSDATE'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_source=>'FECHA_MODIFICA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128679208159213605)
,p_name=>'P912_ACTVO'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(320094013422415066)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Activo'
,p_source=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select id_usrio ',
'   from sg_g_usuarios ',
'  where id_usrio = :F_ID_USRIO'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(29996430207317116)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Especificar si el Funcionario ser\00E1 Activo / Inactivo')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'Si'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134276819715758208)
,p_name=>'P912_BRANCH'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(320094013422415066)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(103328617511271780)
,p_validation_name=>'P912_FCHA_CRCION must be timestamp'
,p_validation_sequence=>50
,p_validation=>'P912_FCHA_CRCION'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_validation_condition=>'CREATE,SAVE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(103325317083271763)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(103329093638271781)
,p_validation_name=>'P912_FECHA_MODIFICA must be timestamp'
,p_validation_sequence=>130
,p_validation=>'P912_FECHA_MODIFICA'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_validation_condition=>'CREATE,SAVE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(103327715757271766)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(103329484606271781)
,p_validation_name=>'Validar Usuario'
,p_validation_sequence=>140
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_usrio ',
'  from v_sg_g_usuarios ',
' where id_trcro = :P912_ID_TRCRO'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'El Tercero seleccionado ya tiene usuario creado'
,p_when_button_pressed=>wwv_flow_api.id(103322629694271754)
,p_associated_item=>wwv_flow_api.id(103324274635271762)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(33508563829844302)
,p_tabular_form_region_id=>wwv_flow_api.id(31771243726501113)
,p_validation_name=>'Valida si el perfil de administrador puede ser asignado al usuario'
,p_validation_sequence=>150
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_indcdor_prfil_admnstdor sg_g_perfiles.indcdor_prfil_admnstdor%type;',
'',
'begin',
'    select indcdor_prfil_admnstdor',
'      into v_indcdor_prfil_admnstdor',
'      from sg_g_perfiles',
'     where id_prfil = :ID_PRFIL;',
'    -- Si el usuario es administrador y el perfil esta marcado como administrado o no se puede asignar el perfil',
'    if :P912_ADMIN = 1 and (v_indcdor_prfil_admnstdor = ''S'' or v_indcdor_prfil_admnstdor = ''N'' )then',
'        return true; ',
'    -- Si el usuario no es administrador y el perfil esta marcado como administrador no se puede asignar el perfil',
'    elsif :P912_ADMIN = 0 and v_indcdor_prfil_admnstdor = ''S'' then',
'        return false; ',
'    -- Si el usuario no es administrador y el perfil esta marcado como no administrador se puede asignar el perfil',
'    elsif :P912_ADMIN = 0 and v_indcdor_prfil_admnstdor = ''N'' then',
'        return true; ',
'    end if;',
'exception',
'    when others then',
'        return false;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'No se puede asignar el perfil seleccionado debido a que este solo puede ser asignado a usuarios definidos como administrador.'
,p_always_execute=>'Y'
,p_associated_column=>'ID_PRFIL'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(103332134607271783)
,p_name=>'al dar clic en cerrar'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(103322207744271753)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(103332647344271785)
,p_event_id=>wwv_flow_api.id(103332134607271783)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(103333019796271785)
,p_name=>unistr('Obtener Identificaci\00F3n tercero')
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P912_ID_TRCRO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(103333514012271785)
,p_event_id=>wwv_flow_api.id(103333019796271785)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P912_USER_NAME'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select idntfccion ',
'  from v_si_c_terceros ',
' where id_trcro = :P912_ID_TRCRO',
'   '))
,p_attribute_07=>'P912_ID_TRCRO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(134277135472758211)
,p_name=>'Closed_Dialog_Refresh'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(320094013422415066)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(134277240877758212)
,p_event_id=>wwv_flow_api.id(134277135472758211)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(320094013422415066)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(39663735407056247)
,p_name=>unistr('Refrescar  Regi\00F3n de sub-mpuestos')
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(39661825887056228)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39663829201056248)
,p_event_id=>wwv_flow_api.id(39663735407056247)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(39661825887056228)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103330575811271782)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from SG_G_USUARIO'
,p_attribute_02=>'SG_G_USUARIOS'
,p_attribute_03=>'P912_ID_USRIO'
,p_attribute_04=>'ID_USRIO'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103331704667271783)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Antes del insert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'',
'IDEN NUMBER;',
'',
'BEGIN',
'/*',
'begin',
'    select idntfccion ',
'      into IDEN',
'      from v_df_c_funcionarios ',
'     where cdgo_clnte = :F_CDGO_CLNTE',
'       and id_fncnrio = :P912_ID_FNCNRIO;',
'',
'exception ',
'    when no_data_found then ',
'        IDEN := ''12356'';',
'end;*/',
'',
':P912_PASSWORD := pkg_sg_autenticacion.fnc_sg_hash(IDEN, IDEN); ',
'',
'insert into gti_aux (col1, col2) values (IDEN,IDEN);',
'commit;',
'',
'END;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(103322629694271754)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103330115566271782)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Antes de Eliminar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'-- Se eliminan los perfiles asignados al usuario',
'delete from sg_g_perfiles_usuario where id_usrio = :P912_ID_USRIO;',
'commit;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(103323095717271754)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103330982080271782)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of  SG_G_USUARIOS'
,p_attribute_02=>'SG_G_USUARIOS'
,p_attribute_03=>'P912_ID_USRIO'
,p_attribute_04=>'ID_USRIO'
,p_attribute_09=>'P912_ID_USRIO'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_process_error_message=>'h'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n Procesada')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(31772244751501123)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(31771243726501113)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Perfiles - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>'y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103331350244271782)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(103323095717271754)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(45458567998856310)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(45457866774856303)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Tributos - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
