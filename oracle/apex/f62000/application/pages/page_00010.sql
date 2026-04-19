prompt --application/pages/page_00010
begin
wwv_flow_api.create_page(
 p_id=>10
,p_user_interface_id=>wwv_flow_api.id(323679016569283847)
,p_name=>'Parametros'
,p_page_mode=>'MODAL'
,p_step_title=>'Parametros'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_width=>'70%'
,p_last_updated_by=>'MCARO'
,p_last_upd_yyyymmddhh24miss=>'20191226083356'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16573652647784001)
,p_plug_name=>unistr('Par\00E1metros')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(39298132994898311)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_fljo_trnscion_prmtro,',
'       id_fljo_trnscion,',
'       prmtro_orgen,',
'       prmtro_dstno, ',
'       actvo ',
'  from wf_d_flujos_trnscion_prmtro ',
' where id_fljo_trnscion = :P10_FLJO_TRNSCION;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(16573850452784003)
,p_name=>'ID_FLJO_TRNSCION_PRMTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TRNSCION_PRMTRO'
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
 p_id=>wwv_flow_api.id(16573954147784004)
,p_name=>'ID_FLJO_TRNSCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TRNSCION'
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
,p_default_expression=>'P10_FLJO_TRNSCION'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(16574056396784005)
,p_name=>'PRMTRO_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRMTRO_ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Par\00E1metro Origen')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e.item_name d,',
'       e.item_name b',
'  from v_wf_d_flujos_transicion a',
'  join wf_d_flujos_tarea b',
'    on a.id_fljo_trea = b.id_fljo_trea',
'  join wf_d_tareas c',
'    on c.id_trea = b.id_trea',
'  join sg_g_aplicaciones d',
'    on c.id_aplccion = d.id_aplccion',
'  join apex_application_page_items e',
'    on e.application_id =  d.nmro_aplccion',
'   and e.page_id = c.nmro_pgna',
'   where a.id_fljo_trnscion = :P10_FLJO_TRNSCION ;    '))
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
 p_id=>wwv_flow_api.id(16574193559784006)
,p_name=>'PRMTRO_DSTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRMTRO_DSTNO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Par\00E1metro Destino')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e.item_name d,',
'       e.item_name b',
'  from v_wf_d_flujos_transicion a',
'  join wf_d_flujos_tarea b',
'    on a.id_fljo_trea_dstno = b.id_fljo_trea',
'  join wf_d_tareas c',
'    on c.id_trea = b.id_trea',
'  join sg_g_aplicaciones d',
'    on c.id_aplccion = d.id_aplccion',
'  join apex_application_page_items e',
'    on e.application_id =  d.nmro_aplccion',
'   and e.page_id = c.nmro_pgna',
'   where a.id_fljo_trnscion = :P10_FLJO_TRNSCION ;    '))
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
 p_id=>wwv_flow_api.id(16574245203784007)
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
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(16574695033784011)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(16574721521784012)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(16573747694784002)
,p_internal_uid=>16573747694784002
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
 p_id=>wwv_flow_api.id(16611140512035177)
,p_interactive_grid_id=>wwv_flow_api.id(16573747694784002)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(16611225046035180)
,p_report_id=>wwv_flow_api.id(16611140512035177)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16611788668035189)
,p_view_id=>wwv_flow_api.id(16611225046035180)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(16573850452784003)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16612210953035192)
,p_view_id=>wwv_flow_api.id(16611225046035180)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(16573954147784004)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16612752581035194)
,p_view_id=>wwv_flow_api.id(16611225046035180)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(16574056396784005)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>165
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16613267557035195)
,p_view_id=>wwv_flow_api.id(16611225046035180)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(16574193559784006)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>145
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16613758789035197)
,p_view_id=>wwv_flow_api.id(16611225046035180)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(16574245203784007)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16647862573171019)
,p_view_id=>wwv_flow_api.id(16611225046035180)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(16574695033784011)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16574388351784008)
,p_name=>'P10_FLJO_TRNSCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(16573652647784001)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16574891684784013)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(16573652647784001)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Parametros - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
