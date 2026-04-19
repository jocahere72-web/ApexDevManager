prompt --application/pages/page_00220
begin
wwv_flow_api.create_page(
 p_id=>220
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Prescripci\00F3n Documentos Tipo')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Documentos por Tipo de Prescripci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'85%'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20210514110445'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(118465423012388998)
,p_plug_name=>unistr('Prescripci\00F3n Documentos Tipo')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_prscrpcn_dcmnto,',
'        a.id_prscrpcion_tpo,',
'        a.cdgo_rspsta,',
'        a.id_actos_tpo_trea,',
'        a.id_fljo_trea_cnfrmcion,',
'        a.indcdor_rslve_prscrpcion,',
'        a.orden',
'from    gf_d_prescripciones_dcmnto  a',
'where   a.id_prscrpcion_tpo =   :P220_ID_PRSCRPCION_TPO;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(28437258170513701)
,p_name=>'CDGO_RSPSTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_RSPSTA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('C\00F3digo Respuesta')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.cdgo_rspsta',
'from    gf_d_prscrpcnes_rspsta  a',
'order by a.dscrpcion;'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_null_text=>'-Seleccionar-'
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
 p_id=>wwv_flow_api.id(28437373000513702)
,p_name=>'INDCDOR_RSLVE_PRSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_RSLVE_PRSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFResuelve Prescripci\00F3n?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(28437427150513703)
,p_name=>'ORDEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ORDEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Orden'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_item_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_is_required=>true
,p_max_length=>3
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
 p_id=>wwv_flow_api.id(118466655956389004)
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
 p_id=>wwv_flow_api.id(118467149441389006)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_label=>'Acciones'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_enable_hide=>true
,p_is_primary_key=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(118468305932389010)
,p_name=>'ID_PRSCRPCN_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRSCRPCN_DCMNTO'
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
,p_enable_pivot=>false
,p_is_primary_key=>true
,p_default_type=>'SEQUENCE'
,p_default_expression=>'sq_gf_d_prescripciones_dcmnto'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(118468997464389011)
,p_name=>'ID_PRSCRPCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRSCRPCION_TPO'
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P220_ID_PRSCRPCION_TPO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(118469506072389011)
,p_name=>'ID_ACTOS_TPO_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTOS_TPO_TREA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Actos'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      b.dscrpcion_fljo||'' - ''||c.dscrpcion_trea || '' - '' || e.dscrpcion,',
'            d.id_actos_tpo_trea',
'from        wf_d_flujos_tarea       a',
'inner join  wf_d_flujos             b   on  b.id_fljo       =   a.id_fljo',
'                                        and b.actvo         =   ''S''',
'inner join  wf_d_tareas             c   on  c.id_trea       =   a.id_trea',
'inner join  gn_d_actos_tipo_tarea   d   on  d.id_fljo_trea  =   a.id_fljo_trea',
'inner join  gn_d_actos_tipo         e   on  e.id_acto_tpo   =   d.id_acto_tpo',
'where       b.cdgo_clnte    =   :F_CDGO_CLNTE',
'and         b.id_prcso      =   12',
'order by    c.dscrpcion_trea, e.dscrpcion;'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'ID_FLJO_TREA'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(118470108249389011)
,p_name=>'ID_FLJO_TREA_CNFRMCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA_CNFRMCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Etapa Confirmaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      d.nmbre_trea||'' - ''|| e.dscrpcion_fljo,',
'            c.id_fljo_trea',
'from        gn_d_actos_tipo_tarea   a',
'inner join  wf_d_flujos_tarea       b   on  b.id_fljo_trea  =   a.id_fljo_trea',
'inner join  wf_d_flujos_tarea       c   on  c.id_fljo       =   b.id_fljo',
'                                        and c.actvo         =   ''S''',
'inner join  wf_d_tareas             d   on  d.id_trea       =   c.id_trea',
'inner join  wf_d_flujos             e   on  b.id_fljo       = e.id_fljo',
'where       a.id_actos_tpo_trea =   :ID_ACTOS_TPO_TREA'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'ID_ACTOS_TPO_TREA'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(118465903520389000)
,p_internal_uid=>118465903520389000
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
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>300
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(118466334018389001)
,p_interactive_grid_id=>wwv_flow_api.id(118465903520389000)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(118466428181389002)
,p_report_id=>wwv_flow_api.id(118466334018389001)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28443290116513844)
,p_view_id=>wwv_flow_api.id(118466428181389002)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(28437258170513701)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28443744364513847)
,p_view_id=>wwv_flow_api.id(118466428181389002)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(28437373000513702)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28444282033513849)
,p_view_id=>wwv_flow_api.id(118466428181389002)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(28437427150513703)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(118467591476389007)
,p_view_id=>wwv_flow_api.id(118466428181389002)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(118467149441389006)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(118468763823389011)
,p_view_id=>wwv_flow_api.id(118466428181389002)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(118468305932389010)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(118469358030389011)
,p_view_id=>wwv_flow_api.id(118466428181389002)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(118468997464389011)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(118469946011389011)
,p_view_id=>wwv_flow_api.id(118466428181389002)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(118469506072389011)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(118470568236389012)
,p_view_id=>wwv_flow_api.id(118466428181389002)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(118470108249389011)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(118471126158395402)
,p_name=>'P220_ID_PRSCRPCION_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(118465423012388998)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(118470701248389014)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(118465423012388998)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr(': Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
