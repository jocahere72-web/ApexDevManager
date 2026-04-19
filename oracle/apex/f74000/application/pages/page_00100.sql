prompt --application/pages/page_00100
begin
wwv_flow_api.create_page(
 p_id=>100
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>unistr('Regenerar Actos Fiscalizaci\00F3n')
,p_step_title=>unistr('Regenerar Actos Fiscalizaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(36470205860968633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'HGOMEZ'
,p_last_upd_yyyymmddhh24miss=>'20240725143218'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(53947666629110930)
,p_plug_name=>'Consultar Acto'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(53948083498110934)
,p_plug_name=>'Fiscalizacion'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_fsclzcion_expdnte,',
'    b.id_fsclzcion_expdnte_acto,',
'    a.id_instncia_fljo,',
'    d.nmro_acto_dsplay,',
'    b.id_acto_tpo,',
'    b.id_acto,',
'    f.nmbre_clnte,',
'    f.idntfccion_sjto,',
'    f.Email,',
'    f.nmbre_impsto,',
'    f.DSCRPCION_SJTO_ESTDO,',
'    ''<center><span class="fa fa-eye" aria-hidden="true"></span></center>'' PDF',
'from fi_g_fiscalizacion_expdnte a',
'join fi_g_fsclzcion_expdnte_acto b on b.id_fsclzcion_expdnte = a.id_fsclzcion_expdnte',
'join fi_g_candidatos c on c.id_cnddto = a.id_cnddto',
'join v_si_i_sujetos_impuesto f on c.id_sjto_impsto = f.id_sjto_impsto',
'join v_gn_g_actos d on d.id_acto = b.id_acto',
'where  d.nmro_acto_dsplay = :P100_NMRO_ACTO_DSPLAY  and b.id_acto_tpo = :P100_ID_ACTO_TPO;     '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>'(:P100_NMRO_ACTO_DSPLAY is not null and :P100_ID_ACTO_TPO is not null)'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(53948268562110936)
,p_name=>'ID_FSCLZCION_EXPDNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FSCLZCION_EXPDNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(53948392441110937)
,p_name=>'ID_FSCLZCION_EXPDNTE_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FSCLZCION_EXPDNTE_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(53948471268110938)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Instancia Flujo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(53948582409110939)
,p_name=>'NMRO_ACTO_DSPLAY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO_DSPLAY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Numero Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(53948672094110940)
,p_name=>'ID_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(53948744701110941)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(53948834157110942)
,p_name=>'NMBRE_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_CLNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(53948944921110943)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(53949091336110944)
,p_name=>'EMAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMAIL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Email'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>320
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
 p_id=>wwv_flow_api.id(53949172380110945)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(53949205946110946)
,p_name=>'DSCRPCION_SJTO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_SJTO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>50
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
 p_id=>wwv_flow_api.id(53949343891110947)
,p_name=>'PDF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PDF'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'PDF'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue;" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver PDF <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,file_blob,file_name,file_mimetype,id_acto,&ID_ACTO.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(53948119098110935)
,p_internal_uid=>53948119098110935
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
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
 p_id=>wwv_flow_api.id(54137541840438795)
,p_interactive_grid_id=>wwv_flow_api.id(53948119098110935)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(54137641923438796)
,p_report_id=>wwv_flow_api.id(54137541840438795)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54138133223438800)
,p_view_id=>wwv_flow_api.id(54137641923438796)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(53948268562110936)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54138697519438812)
,p_view_id=>wwv_flow_api.id(54137641923438796)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(53948392441110937)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54139122591438814)
,p_view_id=>wwv_flow_api.id(54137641923438796)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(53948471268110938)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54139693433438816)
,p_view_id=>wwv_flow_api.id(54137641923438796)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(53948582409110939)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54140130351438818)
,p_view_id=>wwv_flow_api.id(54137641923438796)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(53948672094110940)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54140617128438820)
,p_view_id=>wwv_flow_api.id(54137641923438796)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(53948744701110941)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54141144031438821)
,p_view_id=>wwv_flow_api.id(54137641923438796)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(53948834157110942)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54141606604438823)
,p_view_id=>wwv_flow_api.id(54137641923438796)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(53948944921110943)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54142163607438825)
,p_view_id=>wwv_flow_api.id(54137641923438796)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(53949091336110944)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54142636075438827)
,p_view_id=>wwv_flow_api.id(54137641923438796)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(53949172380110945)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54143165947438828)
,p_view_id=>wwv_flow_api.id(54137641923438796)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(53949205946110946)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54143689111438830)
,p_view_id=>wwv_flow_api.id(54137641923438796)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(53949343891110947)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(53949417028110948)
,p_plug_name=>unistr('Consulta Fiscalizaci\00F3n')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_fsclzcion_expdnte,',
'    b.id_fsclzcion_expdnte_acto,',
'    a.id_instncia_fljo,',
'    d.nmro_acto_dsplay,',
'    b.id_acto_tpo,',
'    g.dscrpcion,',
'    b.id_acto,',
'    f.nmbre_clnte,',
'    f.idntfccion_sjto,',
'    f.Email,',
'    f.nmbre_impsto,',
'    f.DSCRPCION_SJTO_ESTDO,',
'    ''<center><span class="fa fa-eye" aria-hidden="true"></span></center>'' PDF',
'from fi_g_fiscalizacion_expdnte a',
'join fi_g_fsclzcion_expdnte_acto b on b.id_fsclzcion_expdnte = a.id_fsclzcion_expdnte',
'join fi_g_candidatos c on c.id_cnddto = a.id_cnddto',
'join v_si_i_sujetos_impuesto f on c.id_sjto_impsto = f.id_sjto_impsto',
'join v_gn_g_actos d on d.id_acto = b.id_acto',
'join gn_d_actos_tipo g on g.id_acto_tpo = b.id_acto_tpo',
'where b.id_acto_tpo = :P100_ID_ACTO_TPO and',
'    (d.file_blob IS NOT NULL AND DBMS_LOB.getlength(d.file_blob) <= 5000)',
'   OR (d.file_bfile IS NOT NULL AND DBMS_LOB.getlength(d.file_bfile) <= 5000);     '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>'(:P100_NMRO_ACTO_DSPLAY is null and :P100_ID_ACTO_TPO is not null)'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(53949641182110950)
,p_name=>'ID_FSCLZCION_EXPDNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FSCLZCION_EXPDNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(54148634465471501)
,p_name=>'ID_FSCLZCION_EXPDNTE_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FSCLZCION_EXPDNTE_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(54148750848471502)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Instancia Flujo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54148857476471503)
,p_name=>'NMRO_ACTO_DSPLAY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO_DSPLAY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Numero de Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(54148926368471504)
,p_name=>'ID_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(54149045632471505)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(54149152580471506)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54149223337471507)
,p_name=>'NMBRE_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_CLNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54149361170471508)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Identificacion'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(54149406608471509)
,p_name=>'EMAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMAIL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Email'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>320
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
 p_id=>wwv_flow_api.id(54149504188471510)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(54149666967471511)
,p_name=>'DSCRPCION_SJTO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_SJTO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>50
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
 p_id=>wwv_flow_api.id(54149775724471512)
,p_name=>'PDF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PDF'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'PDF'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue;" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver PDF <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,file_blob,file_name,file_mimetype,id_acto,&ID_ACTO.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(53949501113110949)
,p_internal_uid=>53949501113110949
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
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
 p_id=>wwv_flow_api.id(54154567978473410)
,p_interactive_grid_id=>wwv_flow_api.id(53949501113110949)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(54154694409473411)
,p_report_id=>wwv_flow_api.id(54154567978473410)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54155060784473412)
,p_view_id=>wwv_flow_api.id(54154694409473411)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(53949641182110950)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54155515840473414)
,p_view_id=>wwv_flow_api.id(54154694409473411)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(54148634465471501)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54156081889473415)
,p_view_id=>wwv_flow_api.id(54154694409473411)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(54148750848471502)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54156598044473417)
,p_view_id=>wwv_flow_api.id(54154694409473411)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(54148857476471503)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54157037552473419)
,p_view_id=>wwv_flow_api.id(54154694409473411)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(54148926368471504)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54157511352473422)
,p_view_id=>wwv_flow_api.id(54154694409473411)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(54149045632471505)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54158053930473423)
,p_view_id=>wwv_flow_api.id(54154694409473411)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(54149152580471506)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54158542507473425)
,p_view_id=>wwv_flow_api.id(54154694409473411)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(54149223337471507)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54159032325473426)
,p_view_id=>wwv_flow_api.id(54154694409473411)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(54149361170471508)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54159523751473428)
,p_view_id=>wwv_flow_api.id(54154694409473411)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(54149406608471509)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54160077964473430)
,p_view_id=>wwv_flow_api.id(54154694409473411)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(54149504188471510)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54160532493473431)
,p_view_id=>wwv_flow_api.id(54154694409473411)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(54149666967471511)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54161041965473433)
,p_view_id=>wwv_flow_api.id(54154694409473411)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(54149775724471512)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(54149835917471513)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Opciones <i class="fa fa-gear" aria-hidden="true"></i></center></b></h5>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(54149918854471514)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center></b></h5>',
'<i><p>Funcionalidad que permite realizar una consulta de actos asociado a un numero de acto y procesar en caso que el acto presente inconvenientes de visualizacion para generarlo nuevamente.</p>',
unistr('<p>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dirijase al Manual de Usuario.</p>'),
'</i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(53947939357110933)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(53947666629110930)
,p_button_name=>'BTN_CNSLTAR_ACTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(54150007374471515)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(54149835917471513)
,p_button_name=>'BNT_PRCSAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'<b>Procesar</b>'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'(:P100_NMRO_ACTO_DSPLAY is not null and :P100_ID_ACTO_TPO is not null)'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-window'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(54150156793471516)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(54149835917471513)
,p_button_name=>'BTN_PRCSAR_MSVO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar Masivo'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'(:P100_NMRO_ACTO_DSPLAY is null and :P100_ID_ACTO_TPO is not null)'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(53947758507110931)
,p_name=>'P100_NMRO_ACTO_DSPLAY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(53947666629110930)
,p_prompt=>'Numero Acto'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(36555174524968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(53947848788110932)
,p_name=>'P100_ID_ACTO_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(53947666629110930)
,p_prompt=>'Tipo de Acto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct a.dscrpcion   as d',
'     , a.id_acto_tpo          as r',
'  from gn_d_actos_tipo a ',
'  join gn_g_actos      b on a.id_acto_tpo = b.id_acto_tpo',
' where a.cdgo_clnte      = :F_CDGO_CLNTE',
'   and b.cdgo_acto_orgen = ''FISCA'';'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(36555174524968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(54150500115471520)
,p_validation_name=>'Validar campos Nulos'
,p_validation_sequence=>10
,p_validation=>' :P100_ID_ACTO_TPO is not null'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Debe asignar un valor'
,p_when_button_pressed=>wwv_flow_api.id(53947939357110933)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(54150314911471518)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Regenerar Acto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_nmro_acto_dsplay VARCHAR2(100) := :P100_NMRO_ACTO_DSPLAY;',
'    v_cdgo_clnte       NUMBER := :F_CDGO_CLNTE;',
'    v_id_acto_tpo      NUMBER := :P100_ID_ACTO_TPO;',
'    o_cdgo_rspsta      NUMBER;',
'    o_mnsje_rspsta     VARCHAR2(4000);',
'begin',
'    begin',
'        pkg_fi_fiscalizacion.prc_ac_rg_actos_fiscalizacion(',
'            p_nmro_acto_dsplay  => v_nmro_acto_dsplay,',
'            p_cdgo_clnte        => v_cdgo_clnte,',
'            p_id_acto_tpo       => v_id_acto_tpo,  ',
'            o_cdgo_rspsta       => o_cdgo_rspsta,',
'            o_mnsje_rspsta      => o_mnsje_rspsta',
'        );',
'',
'        if o_cdgo_rspsta != 0 then',
'            raise_application_error(-20001, o_mnsje_rspsta);',
'        end if;',
'    end;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(54150007374471515)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(54150467665471519)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Regenerar Actos Masivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    declare',
'        v_cdgo_clnte       number := :F_CDGO_CLNTE;',
'        v_id_acto_tpo      number := :P100_ID_ACTO_TPO ;',
'        o_cdgo_rspsta      number := 0;',
'        o_mnsje_rspsta     varchar2(4000);',
'    begin',
'        for cur in (',
'            select ',
'                d.nmro_acto_dsplay',
'            from fi_g_fiscalizacion_expdnte a',
'            join fi_g_fsclzcion_expdnte_acto b on b.id_fsclzcion_expdnte = a.id_fsclzcion_expdnte',
'            join v_gn_g_actos d on d.id_acto = b.id_acto',
'            where b.id_acto_tpo = v_id_acto_tpo ',
'              and (',
'                  (d.file_blob is not null and dbms_lob.getlength(d.file_blob) <= 5000)',
'                  or (d.file_bfile is not null and dbms_lob.getlength(d.file_bfile) <= 5000)',
'              ) ',
'        ) ',
'        loop',
'            begin',
'                pkg_fi_fiscalizacion.prc_ac_rg_actos_fiscalizacion(',
'                                                                    p_nmro_acto_dsplay  => cur.nmro_acto_dsplay,',
'                                                                    p_cdgo_clnte        => v_cdgo_clnte,',
'                                                                    p_id_acto_tpo       => v_id_acto_tpo,  ',
'                                                                    o_cdgo_rspsta       => o_cdgo_rspsta,',
'                                                                    o_mnsje_rspsta      => o_mnsje_rspsta',
'                                                                    );',
'			 exception',
'			  when others then',
'                o_cdgo_rspsta := 10; ',
'                o_mnsje_rspsta := ''error en procesamiento, . detalle: '' || sqlerrm;',
'			end;',
'		end loop;',
'    exception',
'        when others then',
'            raise_application_error(-20002, ''Error general: '' || sqlerrm);',
'    end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(54150156793471516)
);
end;
/
