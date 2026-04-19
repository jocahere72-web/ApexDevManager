prompt --application/pages/page_00289
begin
wwv_flow_api.create_page(
 p_id=>289
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Detalle Declaraci\00F3n Carga')
,p_step_title=>unistr('Detalle Declaraci\00F3n Carga')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JAGUIRRE'
,p_last_upd_yyyymmddhh24miss=>'20220912101936'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35238198635975611)
,p_plug_name=>unistr('Par\00E1metros')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35527564323984015)
,p_plug_name=>unistr('Parametrizaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(164084128065707698)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35239570833975625)
,p_plug_name=>'Homologados'
,p_parent_plug_id=>wwv_flow_api.id(35527564323984015)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'ID_DCLRCNES_CRGA        , ',
'ID_RGLA_INTRMDIA        , ',
'ID_FRMLRIO_RGION        , ',
'ID_FRMLRIO_RGION_ATRBTO , ',
'ID_DCLRCNES_CRGA_DTLLE  ',
'from gi_g_dclrcnes_carga_detalle',
'where VLOR_GNRCO is null',
'and ID_DCLRCNES_CRGA=:P289_ID_DLCRCION_CRGA;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(35239918265975629)
,p_name=>'ID_DCLRCNES_CRGA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCNES_CRGA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
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
 p_id=>wwv_flow_api.id(35240086398975630)
,p_name=>'ID_RGLA_INTRMDIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RGLA_INTRMDIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Campo Archivo ETL'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>'select id_rgla_intrmdia||''-''||dscrpcion as dscrpcn,id_rgla_intrmdia as vlr   from ET_D_REGLAS_INTERMEDIA where id_crga=:P289_ET_CRGA;'
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>false
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
 p_id=>wwv_flow_api.id(35240144382975631)
,p_name=>'ID_FRMLRIO_RGION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FRMLRIO_RGION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Regi\00F3n Formulario')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_frmlrio_rgion||''-''||a.dscrpcion,a.id_frmlrio_rgion  ',
'from GI_D_FORMULARIOS_REGION a ',
'where  a.id_frmlrio=:P289_ID_FRMLARIO',
'',
'',
'',
''))
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
 p_id=>wwv_flow_api.id(35240246835975632)
,p_name=>'ID_FRMLRIO_RGION_ATRBTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FRMLRIO_RGION_ATRBTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Atributo Regi\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.ID_FRMLRIO_RGION_ATRBTO||''-''||c.DSCRPCION ,c.ID_FRMLRIO_RGION_ATRBTO ',
'from gi_d_frmlrios_rgion_atrbto c ',
'join gi_d_formularios_region a  on c.id_frmlrio_rgion=a.id_frmlrio_rgion',
'where  a.id_frmlrio=:P289_ID_FRMLARIO',
'and c.id_frmlrio_rgion=:ID_FRMLRIO_RGION;'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'ID_FRMLRIO_RGION'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(35240451567975634)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(35240547371975635)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(35241842650975648)
,p_name=>'ID_DCLRCNES_CRGA_DTLLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCNES_CRGA_DTLLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(35239687166975626)
,p_internal_uid=>35239687166975626
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
 p_id=>wwv_flow_api.id(35355044000434914)
,p_interactive_grid_id=>wwv_flow_api.id(35239687166975626)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(35355117395434918)
,p_report_id=>wwv_flow_api.id(35355044000434914)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35357656056455377)
,p_view_id=>wwv_flow_api.id(35355117395434918)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(35239918265975629)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35358191098455378)
,p_view_id=>wwv_flow_api.id(35355117395434918)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(35240086398975630)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35358608194455380)
,p_view_id=>wwv_flow_api.id(35355117395434918)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(35240144382975631)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35359118135455389)
,p_view_id=>wwv_flow_api.id(35355117395434918)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(35240246835975632)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35364668293581164)
,p_view_id=>wwv_flow_api.id(35355117395434918)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(35240451567975634)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35407639359163547)
,p_view_id=>wwv_flow_api.id(35355117395434918)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(35241842650975648)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35529008922984030)
,p_plug_name=>'No homologados'
,p_parent_plug_id=>wwv_flow_api.id(35527564323984015)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'ID_DCLRCNES_CRGA        , ',
'VLOR_GNRCO as Valor_Por_Defecto        , ',
'ID_FRMLRIO_RGION        , ',
'ID_FRMLRIO_RGION_ATRBTO , ',
'ID_DCLRCNES_CRGA_DTLLE  ',
'from gi_g_dclrcnes_carga_detalle',
'where VLOR_GNRCO is not null',
'and ID_DCLRCNES_CRGA=:P289_ID_DLCRCION_CRGA;;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(35529272934984032)
,p_name=>'ID_DCLRCNES_CRGA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCNES_CRGA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
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
 p_id=>wwv_flow_api.id(35529439130984034)
,p_name=>'ID_FRMLRIO_RGION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FRMLRIO_RGION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Regi\00F3n Formulario')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_frmlrio_rgion||''-''||a.dscrpcion,a.id_frmlrio_rgion  ',
'from GI_D_FORMULARIOS_REGION a ',
'where  a.id_frmlrio=:P289_ID_FRMLARIO',
'',
'',
'',
''))
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
 p_id=>wwv_flow_api.id(35529577080984035)
,p_name=>'ID_FRMLRIO_RGION_ATRBTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FRMLRIO_RGION_ATRBTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Atributo Regi\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.ID_FRMLRIO_RGION_ATRBTO||''-''||c.DSCRPCION ,c.ID_FRMLRIO_RGION_ATRBTO ',
'from gi_d_frmlrios_rgion_atrbto c ',
'join gi_d_formularios_region a  on c.id_frmlrio_rgion=a.id_frmlrio_rgion',
'where a.id_frmlrio=:P289_ID_FRMLARIO',
'and c.id_frmlrio_rgion=:ID_FRMLRIO_RGION;'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'ID_FRMLRIO_RGION'
,p_ajax_optimize_refresh=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(35529662156984036)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>50
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(35529727029984037)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(35529875687984038)
,p_name=>'ID_DCLRCNES_CRGA_DTLLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCNES_CRGA_DTLLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(35529996674984039)
,p_name=>'VALOR_POR_DEFECTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VALOR_POR_DEFECTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Valor Por Defecto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>400
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(35529125836984031)
,p_internal_uid=>35529125836984031
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
 p_id=>wwv_flow_api.id(35685743568820584)
,p_interactive_grid_id=>wwv_flow_api.id(35529125836984031)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(35685842926820584)
,p_report_id=>wwv_flow_api.id(35685743568820584)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35686384802820586)
,p_view_id=>wwv_flow_api.id(35685842926820584)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(35529272934984032)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35687363257820590)
,p_view_id=>wwv_flow_api.id(35685842926820584)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(35529439130984034)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35687892881820592)
,p_view_id=>wwv_flow_api.id(35685842926820584)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(35529577080984035)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35688336560820594)
,p_view_id=>wwv_flow_api.id(35685842926820584)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(35529662156984036)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35689252301820598)
,p_view_id=>wwv_flow_api.id(35685842926820584)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(35529875687984038)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35694009347921462)
,p_view_id=>wwv_flow_api.id(35685842926820584)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(35529996674984039)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(100641194049277719)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <b>',
'        <center>Opciones ',
'            <i class="fa fa-gears" aria-hidden="true"></i>',
'        </center>',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(100642235936281087)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <center>',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'        </b>',
'    </center>',
'</h5>',
'<p>',
'<b><i></i></b>Esta funcionalidad permite Parametrizar un proceso de carga del ETL, contando con las siguientes opciones:<br><br>',
'',
'<b><i>1.</i></b>Consultar los procesos de carga ya parametrizados.<br><br>',
'',
'<b><i>2.</i></b>Insertar nuevas parametrizaciones.',
'</p>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(35238438309975614)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(100641194049277719)
,p_button_name=>'btn_rgrsar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_image_alt=>'Regresar '
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:287:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(35309541885818964)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(100641194049277719)
,p_button_name=>'btn_prcsar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar Detalle'
,p_button_position=>'BELOW_BOX'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(35238551095975615)
,p_branch_name=>unistr('regresar a la p\00E1gina 287')
,p_branch_action=>'f?p=&APP_ID.:287:&SESSION.::&DEBUG.:RP,287::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(35238438309975614)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35238268409975612)
,p_name=>'P289_ID_DLCRCION_CRGA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(35238198635975611)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35238376553975613)
,p_name=>'P289_ID_VGNCIA_FRMLRIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(35238198635975611)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35238762230975617)
,p_name=>'P289_PRCSO_CRGA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(35238198635975611)
,p_prompt=>'Proceso Carga'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35238945101975619)
,p_name=>'P289_ET_CRGA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(35238198635975611)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35239158350975621)
,p_name=>'P289_FRMLARIO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(35238198635975611)
,p_prompt=>'Formulario'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35239230752975622)
,p_name=>'P289_ID_FRMLARIO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(35238198635975611)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(35238846298975618)
,p_computation_sequence=>10
,p_computation_item=>'P289_PRCSO_CRGA'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_crga',
'  from et_g_carga ',
'  where not id_crga in (',
'                          select id_crga ',
'                            from df_s_resolucion_carga',
'                      )',
' and id_crga = :P289_ET_CRGA',
' '))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(35239414956975624)
,p_computation_sequence=>20
,p_computation_item=>'P289_FRMLARIO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.dscrpcion ',
'from GI_D_FORMULARIOS b ',
'where b.id_frmlrio=:P289_ID_FRMLARIO',
''))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(35241642203975646)
,p_name=>'New'
,p_event_sequence=>10
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(35239570833975625)
,p_triggering_element=>'ID_DCLRCNES_CRGA'
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(35241712181975647)
,p_event_id=>wwv_flow_api.id(35241642203975646)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'ID_DCLRCNES_CRGA'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>'select :P289_ID_DLCRCION_CRGA from dual;'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(35530063588984040)
,p_name=>'New_1'
,p_event_sequence=>20
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(35529008922984030)
,p_triggering_element=>'ID_DCLRCNES_CRGA'
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(35530165660984041)
,p_event_id=>wwv_flow_api.id(35530063588984040)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'ID_DCLRCNES_CRGA'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>'select :P289_ID_DLCRCION_CRGA from dual;'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(35240622008975636)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(35239570833975625)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Param\00E9trica - Save Interactive Grid Data')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>unistr('\00A1No se pudo procesar la informaci\00F3n!')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('\00A1Informaci\00F3n procesada!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(35530214081984042)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(35529008922984030)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'No_homologados - Save Interactive Grid Data_1'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>unistr('\00A1No se pudo procesar la informaci\00F3n!')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('\00A1Informaci\00F3n procesada!')
);
end;
/
