prompt --application/pages/page_00029
begin
wwv_flow_api.create_page(
 p_id=>29
,p_user_interface_id=>wwv_flow_api.id(22508582753660970)
,p_name=>'Novedades'
,p_page_mode=>'NON_MODAL'
,p_step_title=>'Novedades'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_dialog_width=>'1024'
,p_dialog_max_width=>'1024'
,p_dialog_chained=>'N'
,p_last_updated_by=>'DBALDOVINO'
,p_last_upd_yyyymmddhh24miss=>'20250515172409'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5184133301576801)
,p_plug_name=>'Novedades de Persona'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(52129532999074802)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from v_si_g_novedades_persona a',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
' where a.id_sjto_impsto = :P29_ID_SJTO_IMPSTO',
' and b.cdgo_impsto not in (''IPU'')'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5184210396576802)
,p_plug_name=>'IR Novedades de Persona'
,p_parent_plug_id=>wwv_flow_api.id(5184133301576801)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52128439135074801)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    a.idntfccion_sjto             AS "Establecimiento",',
unistr('    a.obsrvcion                   AS "Observaci\00F3n",'),
'    a.dscrpcion_nvdad_tpo         AS "Tipo de Novedad",',
'    a.fcha_rgstro                 AS "Fecha de Registro",',
'    a.dscrpcion_nvdad_prsna_estdo AS "Estado",',
'    a.nmbre_usrio_aplco           AS "Usuario",',
unistr('    a.fcha_aplco                  AS "Fecha de Aplicaci\00F3n",'),
'    a.id_nvdad_prsna,',
'    a.id_acto,',
'    case when a.id_acto is not null',
'                then  ''<center><span style="color:blue" class="fa fa-eye" aria-hidden="true"></span></center>''',
'        else '' ''',
'       end as pdf,',
'   case when a.id_nvdad_prsna is not null',
'            then  ''<center><span style="color:blue" class="fa fa-file-text-o" aria-hidden="true"></span></center>''',
'    else '' ''',
'   end as detalle    ',
'',
'',
'from',
'    v_si_g_novedades_persona a',
'    inner join df_c_impuestos b on a.id_impsto = b.id_impsto',
'     /* join  si_g_novedades_prsna_adjnto b',
'        on a.id_nvdad_prsna   = b.id_nvdad_prsna*/',
'where',
'        a.id_sjto_impsto = :P29_ID_SJTO_IMPSTO',
'    and b.cdgo_impsto not in (''IPU'')',
'    and a.cdgo_nvdad_prsna_estdo = ''APL'';'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(5184481873576804)
,p_name=>'Establecimiento'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Establecimiento'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Establecimiento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(5184516039576805)
,p_name=>unistr('Observaci\00F3n')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('Observaci\00F3n')
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(5184617879576806)
,p_name=>'Tipo de Novedad'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Tipo de Novedad'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo De Novedad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>30
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
 p_id=>wwv_flow_api.id(5184755507576807)
,p_name=>'Fecha de Registro'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Fecha de Registro'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha De Registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(5184818424576808)
,p_name=>'Estado'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Estado'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>30
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
 p_id=>wwv_flow_api.id(5184918781576809)
,p_name=>'Usuario'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Usuario'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Usuario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(5185099898576810)
,p_name=>unistr('Fecha de Aplicaci\00F3n')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('Fecha de Aplicaci\00F3n')
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha De Aplicaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(5185170354576811)
,p_name=>'ID_NVDAD_PRSNA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_NVDAD_PRSNA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(5185210570576812)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(5185377490576813)
,p_name=>'PDF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PDF'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Ver PDF'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_01=>'&PDF.'
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,file_blob,file_name,file_mimetype,id_acto,&ID_ACTO.'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(5185475950576814)
,p_name=>'DETALLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DETALLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Detalle'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_01=>'&DETALLE.'
,p_link_target=>'f?p=&APP_ID.:2024001:&SESSION.::&DEBUG.:RP:P2024001_ID_NVDAD_PRSNA:&ID_NVDAD_PRSNA.'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(5184381478576803)
,p_internal_uid=>5184381478576803
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
 p_id=>wwv_flow_api.id(5190246388599368)
,p_interactive_grid_id=>wwv_flow_api.id(5184381478576803)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(5190398161599368)
,p_report_id=>wwv_flow_api.id(5190246388599368)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5190854354599372)
,p_view_id=>wwv_flow_api.id(5190398161599368)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(5184481873576804)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5191381720599376)
,p_view_id=>wwv_flow_api.id(5190398161599368)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(5184516039576805)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>237
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5191838379599377)
,p_view_id=>wwv_flow_api.id(5190398161599368)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(5184617879576806)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>177
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5192387225599379)
,p_view_id=>wwv_flow_api.id(5190398161599368)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(5184755507576807)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>173
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5192834282599380)
,p_view_id=>wwv_flow_api.id(5190398161599368)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(5184818424576808)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>115
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5193385542599381)
,p_view_id=>wwv_flow_api.id(5190398161599368)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(5184918781576809)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>350
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5193878382599382)
,p_view_id=>wwv_flow_api.id(5190398161599368)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(5185099898576810)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>192
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5194335803599384)
,p_view_id=>wwv_flow_api.id(5190398161599368)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(5185170354576811)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5194870977599385)
,p_view_id=>wwv_flow_api.id(5190398161599368)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(5185210570576812)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5195333977599386)
,p_view_id=>wwv_flow_api.id(5190398161599368)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(5185377490576813)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>97
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5195814382599388)
,p_view_id=>wwv_flow_api.id(5190398161599368)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(5185475950576814)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26346316623571601)
,p_plug_name=>'Novedades de Predio'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(52129532999074802)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from si_g_novedades_predio_dtlle a',
' where a.id_sjto_impsto = :P29_ID_SJTO_IMPSTO'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26346431779571602)
,p_plug_name=>'IR Novedades de Predio'
,p_parent_plug_id=>wwv_flow_api.id(26346316623571601)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52128439135074801)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select b.dscrpcion_entdad_nvdad as "Entidad"',
'         , b.dscrpcion_acto_tpo as "Tipo de Acto"',
unistr('         , b.fcha_incio_aplccion as "Fecha de Aplicaci\00F3n"'),
'         , to_char( b.fcha_rgstro , ''DD/MM/YYYY'' ) as "Fecha Registro"',
'         , b.obsrvcion as "Observacion"',
'         , a.dscrpcion_dstno_antrior as "Destino Anterior"',
'         , a.dscrpcion_dstno_nvo as "Destino Nuevo"',
'         , a.dscrpcion_estrto_antrior as "Estrato Anterior"',
'         , a.dscrpcion_estrto_nvo as "Estrato Nuevo"',
'         , a.dscrpcion_uso_slo_antrior as "Uso Suelo Anterior"',
'         , a.dscrpcion_uso_slo_nvo as "Uso Suelo Nuevo"',
'         , a.id_nvdad_prdio_dtlle',
'      from v_si_g_novedades_predio_dtlle a',
'      join v_si_g_novedades_predio b',
'        on a.id_nvdad_prdio   = b.id_nvdad_prdio',
'     where a.id_sjto_impsto   = :P29_ID_SJTO_IMPSTO',
'       and a.cdgo_nvdad_estdo = ''AP''',
'  order by b.fcha_rgstro'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>210
,p_prn_height=>297
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(26346542318571603)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NARDILA'
,p_internal_uid=>26346542318571603
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(26346699043571604)
,p_db_column_name=>'Entidad'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Entidad'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(26346766840571605)
,p_db_column_name=>'Tipo de Acto'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tipo De Acto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(26346890451571606)
,p_db_column_name=>unistr('Fecha de Aplicaci\00F3n')
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Fecha De Aplicaci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(26346970297571607)
,p_db_column_name=>'Fecha Registro'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Fecha Registro'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(26347054134571608)
,p_db_column_name=>'Observacion'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Observacion'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(26347173763571609)
,p_db_column_name=>'Destino Anterior'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Destino Anterior'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(26347217502571610)
,p_db_column_name=>'Destino Nuevo'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Destino Nuevo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(26347356318571611)
,p_db_column_name=>'Estrato Anterior'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Estrato Anterior'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(26347420567571612)
,p_db_column_name=>'Estrato Nuevo'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Estrato Nuevo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(26347534150571613)
,p_db_column_name=>'Uso Suelo Anterior'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Uso Suelo Anterior'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(26347628970571614)
,p_db_column_name=>'Uso Suelo Nuevo'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Uso Suelo Nuevo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(26347759827571615)
,p_db_column_name=>'ID_NVDAD_PRDIO_DTLLE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Id Nvdad Prdio Dtlle'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(26356114751585318)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'263562'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('Entidad:Tipo de Acto:Fecha de Aplicaci\00F3n:Fecha Registro:Observacion:Destino Anterior:Destino Nuevo:Estrato Anterior:Estrato Nuevo:Uso Suelo Anterior:Uso Suelo Nuevo:ID_NVDAD_PRDIO_DTLLE')
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(299884285733689717)
,p_plug_name=>'&P29_DSCRPCION.'
,p_icon_css_classes=>'&P29_ICNO.'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52124852663074800)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26338216599512637)
,p_name=>'P29_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(299884285733689717)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26338514684512640)
,p_name=>'P29_ICNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(299884285733689717)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26338972428512640)
,p_name=>'P29_DSCRPCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(299884285733689717)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
