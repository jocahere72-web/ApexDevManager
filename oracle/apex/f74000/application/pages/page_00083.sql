prompt --application/pages/page_00083
begin
wwv_flow_api.create_page(
 p_id=>83
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>'Tipo de Actos Requeridos.'
,p_page_mode=>'MODAL'
,p_step_title=>'Tipo de Actos Requeridos.'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'LRIZA'
,p_last_upd_yyyymmddhh24miss=>'20230104143527'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(34566771233863753)
,p_plug_name=>'Tipos de Actos Requeridos'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_prgrma_acto_req,',
'       id_prgrma,',
'       id_sbprgrma,',
'       id_acto_tpo,',
'       id_acto_tpo_req',
'  from fi_d_programas_acto_req',
' where id_prgrma = :P83_ID_PRGRMA',
'   and id_sbprgrma = :P83_ID_SBPRGRMA',
'   and id_acto_tpo = :P83_ID_ACTO_TPO;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(34123149877547097)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(34123248181547098)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(34568541584863761)
,p_name=>'ID_PRGRMA_ACTO_REQ'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRGRMA_ACTO_REQ'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_pivot=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(34569173002863761)
,p_name=>'ID_PRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRGRMA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Programa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_prgrma as d,',
'       a.id_prgrma as r',
'  from fi_d_programas a',
' where a.actvo = ''S''',
'   and a.id_prgrma = :P83_ID_PRGRMA;'))
,p_lov_display_extra=>false
,p_lov_display_null=>false
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(34569824949863761)
,p_name=>'ID_SBPRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SBPRGRMA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Subprograma'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_sbprgrma as d,',
'       a.id_sbprgrma as r ',
'  from fi_d_subprogramas a',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.id_prgrma = :P83_ID_PRGRMA',
'   and id_sbprgrma = :P83_ID_SBPRGRMA',
'   and a.actvo = ''S'';'))
,p_lov_display_extra=>false
,p_lov_display_null=>false
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(34570400331863762)
,p_name=>'ID_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Acto Tipo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion as d,',
'       a.id_acto_tpo as r',
'  from gn_d_actos_tipo a',
'  join fi_d_programas_acto b on a.id_acto_tpo = b.id_acto_tpo',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and b.id_prgrma = :P83_ID_PRGRMA',
'   and b.id_sbprgrma = :P83_ID_SBPRGRMA',
'   and a.id_acto_tpo = :P83_ID_ACTO_TPO;'))
,p_lov_display_extra=>false
,p_lov_display_null=>false
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(34570986032863762)
,p_name=>'ID_ACTO_TPO_REQ'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_TPO_REQ'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Acto Tipo Requerido'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion as d,',
'       a.id_acto_tpo as r',
' from gn_d_actos_tipo a',
' join fi_d_programas_acto b on a.id_acto_tpo = b.id_acto_tpo',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and b.id_prgrma = :P83_ID_PRGRMA',
'   and b.id_sbprgrma = :P83_ID_SBPRGRMA',
'   and a.id_acto_tpo != :P83_ID_ACTO_TPO;'))
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(34567303344863756)
,p_internal_uid=>34567303344863756
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_edit_row_operations_column=>'ID_PRGRMA_ACTO_REQ'
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
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>300
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(34567675191863757)
,p_interactive_grid_id=>wwv_flow_api.id(34567303344863756)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(34567801655863757)
,p_report_id=>wwv_flow_api.id(34567675191863757)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(34569020657863761)
,p_view_id=>wwv_flow_api.id(34567801655863757)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(34568541584863761)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(34569624760863761)
,p_view_id=>wwv_flow_api.id(34567801655863757)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(34569173002863761)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(34570182319863761)
,p_view_id=>wwv_flow_api.id(34567801655863757)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(34569824949863761)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(34570824860863762)
,p_view_id=>wwv_flow_api.id(34567801655863757)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(34570400331863762)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(34571411720863762)
,p_view_id=>wwv_flow_api.id(34567801655863757)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(34570986032863762)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(34572449655866567)
,p_view_id=>wwv_flow_api.id(34567801655863757)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(34123149877547097)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19070255885605308)
,p_name=>'P83_ID_PRGRMA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(34566771233863753)
,p_prompt=>'P83_ID_PRGRMA'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(36555007171968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19070531746605356)
,p_name=>'P83_ID_SBPRGRMA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(34566771233863753)
,p_prompt=>'P83_ID_SBPRGRMA'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(36555007171968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19070993101605356)
,p_name=>'P83_ID_ACTO_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(34566771233863753)
,p_prompt=>'P83_ID_ACTO_TPO'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(36555007171968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19071396674605395)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(34566771233863753)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Tipos de Actos Requeridos - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
