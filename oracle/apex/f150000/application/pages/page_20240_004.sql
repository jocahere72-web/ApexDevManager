prompt --application/pages/page_20240_004
begin
wwv_flow_api.create_page(
 p_id=>2024025
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Gesti\00F3n Solicitudes Permisos de Sujetos Asociados')
,p_step_title=>unistr('Gesti\00F3n Solicitudes Permisos de Sujetos Asociados')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.formulario_declaracion/1.0/js/app.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/js/pdfjs-2.4.456-dist/build/pdf.js'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.pdfobject-container {',
'    height: 60rem;',
'    border: 1rem solid rgba(0, 0, 0, .1);',
'}'))
,p_step_template=>wwv_flow_api.id(252164311814651356)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'HGOMEZ'
,p_last_upd_yyyymmddhh24miss=>'20241211085737'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4573957411094107)
,p_plug_name=>unistr('Solicitud de Gesti\00F3n de Permisos')
,p_region_name=>'deshabilitar'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.idntfccion, ',
'       b.nmbre_trcro, ',
'       c.nmbre_impsto, ',
'       case',
'        when a.actvo = ''S'' then  ''Si''',
'        when a.actvo = ''N'' then  ''No''',
'        else a.actvo',
'       end Activo,',
'       a.id_sjto_ascdo',
'from si_i_sujetos_asociados a',
'join v_sg_g_usuarios b on b.id_usrio = a.id_usrio',
'join df_c_impuestos c on c.id_impsto = a.id_impsto',
'join si_g_slctds_permisos_asociado d on a.id_usrio = d.id_usrio',
'where id_slctud_prmsos = :P2024025_ID_SLCTUD_PRMSOS and cdna_sjto_impsto = :P2024025_CDNA_ID_SJTO_ASCDO',
'and a.id_sjto_ascdo in (',
'    select to_number(regexp_substr(:P2024025_CDNA_ID_SJTO_ASCDO, ''[^,]+'', 1, level)) ',
'    from dual',
'    connect by regexp_substr(:P2024025_CDNA_ID_SJTO_ASCDO, ''[^,]+'', 1, level) is not null',
')'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P2024025_CDGO_GSTION'
,p_plug_display_when_cond2=>'D'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4574134226094109)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n Usuario')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(4574268611094110)
,p_name=>'NMBRE_TRCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TRCRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Usuario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>503
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
 p_id=>wwv_flow_api.id(4574378204094111)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>200
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
 p_id=>wwv_flow_api.id(4646489686964301)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4647491381964311)
,p_name=>'ACTIVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTIVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Activo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(4647915358964316)
,p_name=>'ID_SJTO_ASCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_ASCDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(4574096433094108)
,p_internal_uid=>4574096433094108
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU'
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
 p_id=>wwv_flow_api.id(4604259404891550)
,p_interactive_grid_id=>wwv_flow_api.id(4574096433094108)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(4604359422891550)
,p_report_id=>wwv_flow_api.id(4604259404891550)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4604806290891554)
,p_view_id=>wwv_flow_api.id(4604359422891550)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(4574134226094109)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4605326783891559)
,p_view_id=>wwv_flow_api.id(4604359422891550)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(4574268611094110)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4605876110891562)
,p_view_id=>wwv_flow_api.id(4604359422891550)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(4574378204094111)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4674807259628177)
,p_view_id=>wwv_flow_api.id(4604359422891550)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(4647491381964311)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4684815757767910)
,p_view_id=>wwv_flow_api.id(4604359422891550)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(4647915358964316)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4577383292094141)
,p_plug_name=>unistr('Solicitud de Gesti\00F3n de Permiso')
,p_region_name=>'habilitar'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.idntfccion, ',
'       b.nmbre_trcro, ',
'       c.nmbre_impsto, ',
'       case',
'        when a.actvo = ''S'' then  ''Si''',
'        when a.actvo = ''N'' then  ''No''',
'        else a.actvo',
'       end Activo,',
'       a.id_sjto_ascdo',
'from si_i_sujetos_asociados a',
'join v_sg_g_usuarios b on b.id_usrio = a.id_usrio',
'join df_c_impuestos c on c.id_impsto = a.id_impsto',
'join si_g_slctds_permisos_asociado d on a.id_usrio = d.id_usrio',
'where id_slctud_prmsos = :P2024025_ID_SLCTUD_PRMSOS and cdna_sjto_impsto = :P2024025_CDNA_ID_SJTO_ASCDO',
'and a.id_sjto_ascdo in (',
'    select to_number(regexp_substr(:P2024025_CDNA_ID_SJTO_ASCDO, ''[^,]+'', 1, level)) ',
'    from dual',
'    connect by regexp_substr(:P2024025_CDNA_ID_SJTO_ASCDO, ''[^,]+'', 1, level) is not null',
')'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P2024025_CDGO_GSTION'
,p_plug_display_when_cond2=>'H'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4577558289094143)
,p_name=>'NMBRE_TRCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TRCRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Usuario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>503
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
 p_id=>wwv_flow_api.id(4577612413094144)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>200
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
 p_id=>wwv_flow_api.id(4577845888094146)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n Usuario')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(4578083150094148)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4647541675964312)
,p_name=>'ACTIVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTIVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Activo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(4648083892964317)
,p_name=>'ID_SJTO_ASCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_ASCDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(4577435649094142)
,p_internal_uid=>4577435649094142
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU'
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
 p_id=>wwv_flow_api.id(4639526078919743)
,p_interactive_grid_id=>wwv_flow_api.id(4577435649094142)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(4639673001919744)
,p_report_id=>wwv_flow_api.id(4639526078919743)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4640161329919745)
,p_view_id=>wwv_flow_api.id(4639673001919744)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(4577558289094143)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4640617584919747)
,p_view_id=>wwv_flow_api.id(4639673001919744)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(4577612413094144)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4641641546919750)
,p_view_id=>wwv_flow_api.id(4639673001919744)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(4577845888094146)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4676354848629164)
,p_view_id=>wwv_flow_api.id(4639673001919744)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(4647541675964312)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4685969607769431)
,p_view_id=>wwv_flow_api.id(4639673001919744)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(4648083892964317)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7344330652556325)
,p_plug_name=>'Gestion Solicitudes Asociados'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'    .mensaje-container {',
'        font-family: Arial, sans-serif;',
'        background-color: #f9f9f9;',
'        padding: 20px;',
'        border-radius: 8px;',
'        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);',
'        color: #333;',
'    }',
'',
'    .mensaje-header {',
'        font-size: 18px;',
'        font-weight: bold;',
'        margin-bottom: 15px;',
'        color: #0056b3; /* Azul para el encabezado */',
'    }',
'',
'    .mensaje-body {',
'        font-size: 16px;',
'        line-height: 1.6;',
'        margin-top: 10px;',
'    }',
'',
'    .mensaje-body strong {',
'        font-weight: bold;',
'    }',
'',
unistr('    /* Resaltado en color para los valores din\00E1micos */'),
'    .mensaje-value {',
'        color: #0056b3; /* Azul para resaltar los valores */',
'        font-weight: bold;',
'    }',
'',
'    .mensaje-footer {',
'        margin-top: 20px;',
'        font-size: 14px;',
'        color: #666;',
'    }',
'</style>',
'',
'<div class="mensaje-container">',
'    <p class="mensaje-header">Estimado usuario/a,</p>',
'    <p class="mensaje-body">',
unistr('        Le informamos que la solicitud de gesti\00F3n de permisos de sujeto asociado se encuentra con los siguientes detalles:'),
'    </p>',
'    <ul class="mensaje-body">',
unistr('        <li><strong>N\00FAmero de consecutivo:</strong> <span class="mensaje-value">&P2024025_NMRO_CNSCTVO.</span></li>'),
'        <li><strong>Fecha de solicitud:</strong> <span class="mensaje-value">&P2024025_FCHA_SLCTUD.</span></li>',
'        <li><strong>Estado actual:</strong> <span class="mensaje-value">&P2024025_ESTDO.</span></li>',
'        <li><strong>Identificacion solicitante:</strong> <span class="mensaje-value">&P2024025_IDNTFCCION.</span></li>',
'        <li><strong>Nombre solicitante:</strong> <span class="mensaje-value">&P2024025_NMBRE_TRCRO.</span></li>',
'        <li><strong>Gestion de permisos:</strong> <span class="mensaje-value">&P2024025_GSTION.</span></li>',
'',
'    </ul>',
'    <p class="mensaje-body">',
unistr('        Si requiere m\00E1s informaci\00F3n o tiene alguna duda, no dude en ponerse en contacto.'),
'    </p>',
'    <p class="mensaje-footer">',
unistr('        \00A1Gracias!.'),
'    </p>',
'</div>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from si_g_slctds_permisos_asociado',
'where estdo <> ''PEN'' and id_slctud_prmsos = :P2024025_ID_SLCTUD_PRMSOS;'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7344483836556326)
,p_plug_name=>unistr('Gesti\00F3n Solicitudes')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'    .mensaje-container {',
'        font-family: Arial, sans-serif;',
'        background-color: #f9f9f9;',
'        padding: 20px;',
'        border-radius: 8px;',
'        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);',
'        color: #333;',
'    }',
'',
'    .mensaje-header {',
'        font-size: 18px;',
'        font-weight: bold;',
'        margin-bottom: 15px;',
'        color: #0056b3; /* Azul para el encabezado */',
'    }',
'',
'    .mensaje-body {',
'        font-size: 16px;',
'        line-height: 1.6;',
'        margin-top: 10px;',
'    }',
'',
'    .mensaje-body strong {',
'        font-weight: bold;',
'    }',
'',
unistr('    /* Resaltado en color para los valores din\00E1micos */'),
'    .mensaje-value {',
'        color: #0056b3; /* Azul para resaltar los valores */',
'        font-weight: bold;',
'    }',
'',
'    .mensaje-footer {',
'        margin-top: 20px;',
'        font-size: 14px;',
'        color: #666;',
'    }',
'</style>',
'',
'<div class="mensaje-container">',
'    <p class="mensaje-header">Estimado usuario/a,</p>',
'    <p class="mensaje-body">',
unistr('        Le informamos que la solicitud de gesti\00F3n de permisos de sujeto asociado se encuentra con los siguientes detalles:'),
'    </p>',
'    <ul class="mensaje-body">',
unistr('        <li><strong>N\00FAmero de consecutivo:</strong> <span class="mensaje-value">&P2024025_NMRO_CNSCTVO.</span></li>'),
'        <li><strong>Fecha de solicitud:</strong> <span class="mensaje-value">&P2024025_FCHA_SLCTUD.</span></li>',
'        <li><strong>Estado actual:</strong> <span class="mensaje-value">&P2024025_ESTDO.</span></li>',
'        <li><strong>Identificacion solicitante:</strong> <span class="mensaje-value">&P2024025_IDNTFCCION.</span></li>',
'        <li><strong>Nombre solicitante:</strong> <span class="mensaje-value">&P2024025_NMBRE_TRCRO.</span></li>',
'        <li><strong>Gestion de permisos:</strong> <span class="mensaje-value">&P2024025_GSTION.</span></li>',
'',
'    </ul>',
'    <p class="mensaje-body">',
unistr('        Si requiere m\00E1s informaci\00F3n o tiene alguna duda, no dude en ponerse en contacto.'),
'    </p>',
'    <p class="mensaje-footer">',
unistr('        \00A1Gracias!.'),
'    </p>',
'</div>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from si_g_slctds_permisos_asociado',
'where estdo = ''PEN'' and id_slctud_prmsos = :P2024025_ID_SLCTUD_PRMSOS;'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(90991783146049005)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
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
 p_id=>wwv_flow_api.id(90992152307049009)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i></b>',
unistr('</h5>Funcionalidad que permite autorizar o rechazar las solicitudes de autorizaci\00F3n para la gesti\00F3n de declaraciones.'),
'<br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4548926203340211)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(90991783146049005)
,p_button_name=>'BTN_PRCSAR_SLCTUD'
,p_button_static_id=>'procesar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar Solicitud'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from si_g_slctds_permisos_asociado',
'where estdo = ''PEN'' and id_slctud_prmsos = :P2024025_ID_SLCTUD_PRMSOS;'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4549396148340212)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(90991783146049005)
,p_button_name=>'BTN_RCHZAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'<b>Rechazar Solicitud</b>'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from si_g_slctds_permisos_asociado',
'where estdo = ''PEN'' and id_slctud_prmsos = :P2024025_ID_SLCTUD_PRMSOS;'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4539073123340202)
,p_name=>'P2024025_CDGO_AUTRZCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(7344483836556326)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4539418021340202)
,p_name=>'P2024025_CDNA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(7344483836556326)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4542911866340207)
,p_name=>'P2024025_FCHA_SLCTUD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(7344330652556325)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4543375489340207)
,p_name=>'P2024025_NMRO_SLCTUD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(7344330652556325)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4543787798340207)
,p_name=>'P2024025_ESTDO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(7344330652556325)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4544163428340207)
,p_name=>'P2024025_CDGO_CLNTE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(7344330652556325)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4544528802340208)
,p_name=>'P2024025_ID_SLCTUD_PRMSOS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(7344330652556325)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4544991984340208)
,p_name=>'P2024025_CDGO_RSPSTA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(7344330652556325)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4545342816340208)
,p_name=>'P2024025_FCHA_GSTION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(7344330652556325)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4545762444340208)
,p_name=>'P2024025_IDNTFCCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(7344330652556325)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4546167256340209)
,p_name=>'P2024025_NMBRE_TRCRO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(7344330652556325)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4573611799094104)
,p_name=>'P2024025_CDGO_GSTION'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(7344330652556325)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4573750651094105)
,p_name=>'P2024025_NMRO_CNSCTVO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(7344330652556325)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4574507298094113)
,p_name=>'P2024025_GSTION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(7344330652556325)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4577242475094140)
,p_name=>'P2024025_CDNA_ID_SJTO_ASCDO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(7344330652556325)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4650798798964344)
,p_name=>'P2024025_TKEN'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(7344330652556325)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4554109989340215)
,p_name=>'Setear Valor de Item'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(4548926203340211)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4554665903340215)
,p_event_id=>wwv_flow_api.id(4554109989340215)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2024025_CDGO_AUTRZCION'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'A'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4552356334340214)
,p_name=>'llamar Process'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(4548926203340211)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4552814130340214)
,p_event_id=>wwv_flow_api.id(4552356334340214)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'BTN_AUTRZAR'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4550533602340213)
,p_name=>'Setear Valor de Items'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(4549396148340212)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4551071433340213)
,p_event_id=>wwv_flow_api.id(4550533602340213)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2024025_CDGO_AUTRZCION'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'R'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4551469390340214)
,p_name=>'llamar Processing'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(4549396148340212)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4551955276340214)
,p_event_id=>wwv_flow_api.id(4551469390340214)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'BTN_RCHZAR'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4646816209964305)
,p_name=>'Al seleccionar registro'
,p_event_sequence=>90
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(4573957411094107)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4646914497964306)
,p_event_id=>wwv_flow_api.id(4646816209964305)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var region = apex.region("deshabilitar");',
'',
'if (region) {',
'    var view = region.widget().interactiveGrid("getViews", "grid");',
'    var model = view.model;',
'',
'    var records = view.view$.grid("getSelectedRecords");',
'',
'    // Si hay registros seleccionados',
'    if (records.length > 0) {',
'        // Crear una variable para almacenar la cadena concatenada',
'        var concatenatedValues = [];',
'',
'        records.forEach(function(record) {',
'            var value = model.getValue(record, "ID_SJTO_ASCDO");',
'            concatenatedValues.push(value);',
'        });',
'',
'        // Concatenar los valores con ":" como separador',
'        var resultString = concatenatedValues.join(":");',
'',
'        apex.item("P2024025_CDNA").setValue(resultString);',
'',
unistr('        // Habilitar el bot\00F3n "procesar"'),
unistr('        $("#procesar").prop("disabled", false);  // Habilitar el bot\00F3n'),
'',
'    } else {',
'        // Si no hay registros seleccionados, puedes limpiar el item',
'        apex.item("P2024025_CDNA").setValue("");',
'',
'        console.log("No se seleccionaron registros.");',
'',
unistr('        // Deshabilitar el bot\00F3n "procesar"'),
unistr('        $("#procesar").prop("disabled", true);  // Deshabilitar el bot\00F3n'),
'    }',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4648171008964318)
,p_name=>'Al seleccionar registros'
,p_event_sequence=>100
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(4577383292094141)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4648265311964319)
,p_event_id=>wwv_flow_api.id(4648171008964318)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var region = apex.region("habilitar");',
'',
'if (region) {',
'    var view = region.widget().interactiveGrid("getViews", "grid");',
'    var model = view.model;',
'',
'    var records = view.view$.grid("getSelectedRecords");',
'',
'    // Si hay registros seleccionados',
'    if (records.length > 0) {',
'        // Crear una variable para almacenar la cadena concatenada',
'        var concatenatedValues = [];',
'',
'        records.forEach(function(record) {',
'            var value = model.getValue(record, "ID_SJTO_ASCDO");',
'            concatenatedValues.push(value);',
'        });',
'',
'        // Concatenar los valores con ":" como separador',
'        var resultString = concatenatedValues.join(":");',
'',
'        apex.item("P2024025_CDNA").setValue(resultString);',
'',
unistr('        // Habilitar el bot\00F3n "procesar"'),
unistr('        $("#procesar").prop("disabled", false);  // Habilitar el bot\00F3n'),
'',
'    } else {',
'        // Si no hay registros seleccionados, puedes limpiar el item',
'        apex.item("P2024025_CDNA").setValue("");',
'',
'        console.log("No se seleccionaron registros.");',
'',
unistr('        // Deshabilitar el bot\00F3n "procesar"'),
unistr('        $("#procesar").prop("disabled", true);  // Deshabilitar el bot\00F3n'),
'    }',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4550169452340213)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Gestionar Solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(1000);',
'    ',
'begin',
'',
'    if :P2024025_CDGO_AUTRZCION is not null then',
'',
'            pkg_gi_asociado.prc_ac_permisos_sujeto_asociado (',
'                                                                p_cdgo_clnte        => :F_CDGO_CLNTE,',
'                                                                p_id_slctud_prmsos  => :P2024025_ID_SLCTUD_PRMSOS,',
'                                                                p_cdna              => :P2024025_CDNA,',
'                                                                p_cdgo_rspta        => :P2024025_CDGO_AUTRZCION,',
'                                                                p_cdgo_gstion       => :P2024025_CDGO_GSTION,',
'                                                                o_cdgo_rspsta       => v_cdgo_rspsta,',
'                                                                o_mnsje_rspsta      => v_mnsje_rspsta',
'                                                            );',
'',
unistr('    -- Verificaci\00F3n del c\00F3digo de respuesta'),
'    if v_cdgo_rspsta != 0 then',
unistr('        raise_application_error(-20001, ''Error: '' || v_mnsje_rspsta || '' (C\00F3digo: '' || v_cdgo_rspsta || '')'');'),
'',
'    end if;',
'   ',
'   else',
'            raise_application_error(-20001, ''Error: Codigo autorizacion nulo'');',
'   end if;',
'exception',
'    when others then',
'        raise_application_error(-20002, ''Error en el procesamiento: '' || sqlerrm);',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_AUTRZAR,BTN_RCHZAR'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4578112783094149)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(4577383292094141)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Solicitud de Gesti\00F3n de Permiso - Save Interactive Grid Data')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4646598262964302)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(4573957411094107)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Solicitud de Gesti\00F3n de Permisos - Save Interactive Grid Data')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4549754260340212)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Informaci\00F3n Solicitud')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.nmro_cnsctvo, ',
'           c.dscrpcion as estado_solicitud,  ',
'           trunc(fcha_slctud),',
'           b.idntfccion,',
'           b.nmbre_trcro,',
'            case',
'            when a.cdgo_gstion = ''H'' then ''Habilitar''',
'            when a.cdgo_gstion = ''D'' then ''Deshabilitar''',
'            else a.cdgo_gstion',
'            end gestion,',
'            a.cdgo_gstion,',
'            cdna_sjto_impsto,',
'            id_slctud_prmsos',
'    into :P2024025_NMRO_CNSCTVO, ',
'         :P2024025_ESTDO,',
'         :P2024025_FCHA_SLCTUD, ',
'         :P2024025_IDNTFCCION,',
'         :P2024025_NMBRE_TRCRO,',
'         :P2024025_GSTION,',
'         :P2024025_CDGO_GSTION,',
'         :P2024025_CDNA_ID_SJTO_ASCDO,',
'         :P2024025_ID_SLCTUD_PRMSOS',
'    from si_g_slctds_permisos_asociado a',
'    join v_sg_g_usuarios b on a.id_usrio = b.id_usrio',
'    inner join si_d_estdo_slctud c on c.estdo = a.estdo',
'    where cdgo_slctud = :P2024025_TKEN;',
'',
'exception',
'    when no_data_found then',
'        :P2024025_NMRO_CNSCTVO := null; ',
'        :P2024025_ESTDO := null;  ',
'        :P2024025_FCHA_SLCTUD := null; ',
'        :P2024025_IDNTFCCION := null;',
'        :P2024025_NMBRE_TRCRO := null;',
'        :P2024025_GSTION := null;',
'        :P2024025_CDGO_GSTION := null;',
'        :P2024025_CDNA_ID_SJTO_ASCDO := null;',
'        :P2024025_ID_SLCTUD_PRMSOS :=null;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P2024025_TKEN'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
