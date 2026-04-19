prompt --application/pages/page_00160
begin
wwv_flow_api.create_page(
 p_id=>160
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Detalle Archivo Plusval\00EDa')
,p_step_title=>unistr('Detalle Archivo Plusval\00EDa')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IG-controlsContainer {',
'    display: none;',
'}',
'',
'.btn_rechazar_exencion{',
'    background-color: #f17d7d;',
'}'))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'NCARRASQUILLA'
,p_last_upd_yyyymmddhh24miss=>'20201020165427'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(91420563521164818)
,p_plug_name=>'Registros Procesados'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select case when r.indcdor_pgo_aplcdo = ''S'' then ',
'              null',
'          else',
'              case when c.indcdor_mdfca_archvo = ''S'' THEN ',
'                  decode(rgstro_error,''D'',null,''<span class="fa fa-pencil"></span>'')',
'              else ',
'                 decode(rgstro_error,''S'',''<span class="fa fa-pencil"></span>'',null)',
'              end',
'          end as editar',
'        ,  a.id_plsvlia_dtlle					',
'		, a.id_prcso_plsvlia					',
'		, a.cdgo_prdial			',
'		, a.area_objto			',
'		, a.mtrcla_inmblria		',
'		, a.prptrio				',
'		, to_char(a.vlor_p1,:F_FRMTO_MNDA) vlor_p1			',
'		, to_char(a.vlor_p2,:F_FRMTO_MNDA) vlor_p2				',
'		, a.area				',
'		, a.clsfccion_zna		',
'		, a.cmna				',
'		, a.drccion				',
'		, a.hcho_gnrdor      	',
'		, a.prdio_fra_estdio	',
'		, to_char(a.vlor_plsvlia,:F_FRMTO_MNDA) as vlor_plsvlia		',
'		, to_char(a.vlor_ttal_plsvlia,:F_FRMTO_MNDA) as vlor_ttal_plsvlia 	',
'		, to_char(a.vlor_plsvlia_actlzda,:F_FRMTO_MNDA) as vlor_plsvlia_actlzda',
'		, decode(a.rgstro_error,''S'',''Si'',''N'',''No'',''D'',''Duplicado'',null)	rgstro_error',
'		, a.dscrpcion_error',
'     from gi_g_plusvalia_procso_dtlle a',
'     join gi_g_plusvalia_proceso b on a.id_prcso_plsvlia = b.id_prcso_plsvlia',
'     join gi_d_plusvalia_configurcion   c on b.id_impsto = c.id_impsto',
'     left join re_g_documentos          r on a.id_dcmnto = r.id_dcmnto',
'    where id_prcso_crga = :P160_ID_PRCSO_CRGA      ; '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(91420716972164820)
,p_name=>'ID_PLSVLIA_DTLLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PLSVLIA_DTLLE'
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
 p_id=>wwv_flow_api.id(91420801863164821)
,p_name=>'ID_PRCSO_PLSVLIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSO_PLSVLIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(91420907743164822)
,p_name=>'CDGO_PRDIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_PRDIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Referencia<br>Catastral'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(91421002222164823)
,p_name=>'AREA_OBJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AREA_OBJTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('\00C1rea<br>Objeto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(91421150225164824)
,p_name=>'MTRCLA_INMBLRIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MTRCLA_INMBLRIA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Matr\00EDcula<br>Inmobiliaria')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(91421214226164825)
,p_name=>'PRPTRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRPTRIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Propieatrio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(91421312797164826)
,p_name=>'VLOR_P1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_P1'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor P1'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
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
 p_id=>wwv_flow_api.id(91421427925164827)
,p_name=>'VLOR_P2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_P2'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor P2'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
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
 p_id=>wwv_flow_api.id(91421574498164828)
,p_name=>'AREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AREA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('\00C1rea')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(91421686579164829)
,p_name=>'CLSFCCION_ZNA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLSFCCION_ZNA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Clasificaci\00F3n<br>Zona')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(91421729918164830)
,p_name=>'CMNA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CMNA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Comuna'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(91421838726164831)
,p_name=>'DRCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DRCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Direcci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(91421951967164832)
,p_name=>'HCHO_GNRDOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HCHO_GNRDOR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Hecho<br>Generador'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(91422088825164833)
,p_name=>'PRDIO_FRA_ESTDIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDIO_FRA_ESTDIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Predio Fuera<br>Estudio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(91422173188164834)
,p_name=>'VLOR_PLSVLIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_PLSVLIA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor<br>Plusvalia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
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
 p_id=>wwv_flow_api.id(91422215030164835)
,p_name=>'VLOR_TTAL_PLSVLIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_PLSVLIA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Total<br>Plusval\00EDa')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
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
 p_id=>wwv_flow_api.id(91422355009164836)
,p_name=>'VLOR_PLSVLIA_ACTLZDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_PLSVLIA_ACTLZDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Plusvalia<br>Actualizada'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
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
 p_id=>wwv_flow_api.id(91422456120164837)
,p_name=>'RGSTRO_ERROR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RGSTRO_ERROR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFTiene<br> Error?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>9
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
 p_id=>wwv_flow_api.id(91422546618164838)
,p_name=>'DSCRPCION_ERROR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ERROR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Descripci\00F3n Error')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>1000
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
 p_id=>wwv_flow_api.id(91423271856164845)
,p_name=>'EDITAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EDITAR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_01=>'&EDITAR.'
,p_link_target=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:RP,160:P163_ID_PLSVLIA_DTLLE:&ID_PLSVLIA_DTLLE.'
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
 p_id=>wwv_flow_api.id(91420643196164819)
,p_internal_uid=>91420643196164819
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
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
 p_id=>wwv_flow_api.id(91475890513855027)
,p_interactive_grid_id=>wwv_flow_api.id(91420643196164819)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(91475904685855027)
,p_report_id=>wwv_flow_api.id(91475890513855027)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91476470498855029)
,p_view_id=>wwv_flow_api.id(91475904685855027)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(91420716972164820)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91476924992855030)
,p_view_id=>wwv_flow_api.id(91475904685855027)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(91420801863164821)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91477489128855032)
,p_view_id=>wwv_flow_api.id(91475904685855027)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(91420907743164822)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>178
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91477929742855034)
,p_view_id=>wwv_flow_api.id(91475904685855027)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(91421002222164823)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>72
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91478493096855035)
,p_view_id=>wwv_flow_api.id(91475904685855027)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(91421150225164824)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>133
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91478900923855037)
,p_view_id=>wwv_flow_api.id(91475904685855027)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(91421214226164825)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>286
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91479460434855039)
,p_view_id=>wwv_flow_api.id(91475904685855027)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(91421312797164826)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>145
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91479907155855053)
,p_view_id=>wwv_flow_api.id(91475904685855027)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(91421427925164827)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>133
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91480478882855054)
,p_view_id=>wwv_flow_api.id(91475904685855027)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(91421574498164828)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91480948662855056)
,p_view_id=>wwv_flow_api.id(91475904685855027)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(91421686579164829)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>102
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91481481200855057)
,p_view_id=>wwv_flow_api.id(91475904685855027)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(91421729918164830)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91481959664855059)
,p_view_id=>wwv_flow_api.id(91475904685855027)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(91421838726164831)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>138
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91482408700855063)
,p_view_id=>wwv_flow_api.id(91475904685855027)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(91421951967164832)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>141
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91482905911855065)
,p_view_id=>wwv_flow_api.id(91475904685855027)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(91422088825164833)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>95
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91483453036855067)
,p_view_id=>wwv_flow_api.id(91475904685855027)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(91422173188164834)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91483911108855068)
,p_view_id=>wwv_flow_api.id(91475904685855027)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(91422215030164835)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>99
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91484475866855070)
,p_view_id=>wwv_flow_api.id(91475904685855027)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(91422355009164836)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>114
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91484981698855071)
,p_view_id=>wwv_flow_api.id(91475904685855027)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(91422456120164837)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>89
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91485473819855073)
,p_view_id=>wwv_flow_api.id(91475904685855027)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(91422546618164838)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>116
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91512721411685513)
,p_view_id=>wwv_flow_api.id(91475904685855027)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(91423271856164845)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(187451163691002852)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(281667291476873517)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	<br>',
'	<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'	<i>',
'	Esta funcionalidad permite mostrar los registros del archivo seleccionado y seleccionar el que se requiere modificar.<br><br>',
unistr('		<p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'	</i> ',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(282969071404259131)
,p_plug_name=>'<b>Detalle Cargue Archivo:   &P160_NMBRE_ARCHVO.</b>'
,p_region_name=>'informacion_basica'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(91508074923558274)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(187451163691002852)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:159:&SESSION.::&DEBUG.:RP,160::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91422854774164841)
,p_name=>'P160_TTL_RGSTRO_VLDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(282969071404259131)
,p_prompt=>unistr('Registros V\00E1lidos')
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91422956388164842)
,p_name=>'P160_TTAL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(282969071404259131)
,p_prompt=>'Total Registros'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91460317125819013)
,p_name=>'P160_ID_PRCSO_CRGA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(282969071404259131)
,p_prompt=>'Id Proceso Carga'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91461161149819014)
,p_name=>'P160_FCHA_PRCSO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(282969071404259131)
,p_prompt=>'Fecha de Proceso'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91461575488819014)
,p_name=>'P160_ID_PRCSO_PLSVLIA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(282969071404259131)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91461960508819014)
,p_name=>'P160_NMBRE_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(282969071404259131)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91462776852819015)
,p_name=>'P160_NMBRE_IMPSTO_SBMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(282969071404259131)
,p_prompt=>'SubTributo'
,p_format_mask=>'99G999G999G999G990D0000'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91463535923819015)
,p_name=>'P160_VGNCIA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(282969071404259131)
,p_prompt=>'Vigencia'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91463912742819015)
,p_name=>'P160_NMBRE_ARCHVO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(282969071404259131)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91470256677819114)
,p_name=>'P160_TTL_RGSTRO_ERROR'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(282969071404259131)
,p_prompt=>'Registros con Error'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91470607376819114)
,p_name=>'P160_USUARIO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(282969071404259131)
,p_prompt=>unistr('Usuario que Proces\00F3')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(91681343707963217)
,p_name=>'Al cerrar modal'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(282969071404259131)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91681416402963218)
,p_event_id=>wwv_flow_api.id(91681343707963217)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(282969071404259131)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(91682184845963225)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualizar si no tiene error'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(1000);',
'begin',
'',
'  pkg_gi_plusvalia.prc_ac_clmna_error(  p_cdgo_clnte        => :F_CDGO_CLNTE,',
'                                        p_id_prcso_plsvlia  => :P160_id_prcso_plsvlia,',
'                                        o_cdgo_rspsta       => v_cdgo_rspsta,',
'                                        o_mnsje_rspsta      => v_mnsje_rspsta',
'                                     );',
'   if (v_cdgo_rspsta <> 0) then',
'       raise_application_error( -20001 , v_mnsje_rspsta );     ',
'   /*else',
'       raise_application_error( -20001 , v_mnsje_rspsta||''-''||:P160_id_prcso_plsvlia );   */',
'   end if;   ',
'      ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(91472651254819126)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Informaci\00F3n de Archivo')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'select b.id_prcso_crga          id_crga, ',
'       b.fcha_prcso             fcha, ',
'       c.nmbre_impsto           trbto, ',
'       c.nmbre_impsto_sbmpsto   sbtrbto, ',
'       b.vgncia                 vgncia, ',
'       b.id_prcso_plsvlia       plsvlia, ',
'       b.nmbre_archvo           archvo,	',
'       b.ttl_rgstro_error       cn_error,',
'       b.ttl_rgstro_vldo        sn_error,',
'       (b.ttl_rgstro_error + b.ttl_rgstro_vldo)  ttal, ',
'       nmbre_trcro              usuario',
'   into   :P160_id_prcso_crga        					',
'        , :P160_fcha_prcso			',
'        , :P160_nmbre_impsto			',
'        , :P160_nmbre_impsto_sbmpsto		',
'        , :P160_vgncia				',
'        , :P160_id_prcso_plsvlia				',
'        , :P160_nmbre_archvo				',
'        , :P160_ttl_rgstro_error				',
'        , :P160_ttl_rgstro_vldo			',
'        , :P160_ttal				',
'        , :P160_usuario',
'  from gi_g_plusvalia_proceso       b ',
'  join v_df_i_impuestos_subimpuesto c on b.id_impsto = c.id_impsto',
'                                        and b.id_impsto_sbmpsto = c.id_impsto_sbmpsto',
'  join v_sg_g_usuarios              s on b.id_usrio = s.id_usrio',
' where  b.id_prcso_crga              = nvl(:P160_id_prcso_crga,b.id_prcso_crga)  ',
'        and b.id_prcso_plsvlia           = nvl(:P160_id_prcso_plsvlia,b.id_prcso_plsvlia) ',
'        ; ',
'         ',
'exception',
'    when others then      					',
'        :P160_id_prcso_crga         := null;      ',
'        :P160_fcha_prcso		    := null; 	',
'        :P160_nmbre_impsto		    := null; 	',
'        :P160_nmbre_impsto_sbmpsto  := null; 	',
'        :P160_vgncia                := null; 				',
'        :P160_id_prcso_plsvlia      := null; 		',
'        :P160_nmbre_archvo          := null; 			',
'        :P160_ttl_rgstro_error      := null; 		',
'        :P160_ttl_rgstro_vldo       := null;                     			',
'        :P160_ttal		            := null; 		',
'        :P160_usuario	            := null;  ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(91473004682819127)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consulta de Reporte de Recibo de Plusval\00EDa')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    NULL;',
'end;'))
,p_process_error_message=>unistr('No se encontro parametrizaci\00F3n del reporte')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
