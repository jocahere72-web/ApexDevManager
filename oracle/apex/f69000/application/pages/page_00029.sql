prompt --application/pages/page_00029
begin
wwv_flow_api.create_page(
 p_id=>29
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>unistr('Adjuntos y Observaci\00F3n')
,p_step_title=>unistr('Adjuntos y Observaci\00F3n')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JADIES'
,p_last_upd_yyyymmddhh24miss=>'20241023105610'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16519602537637434)
,p_plug_name=>'Contenedor'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(88543343085834669)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12158787355402038)
,p_plug_name=>'Observaciones Novedad'
,p_parent_plug_id=>wwv_flow_api.id(16519602537637434)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1 ',
'from si_g_novedades_observacion a',
'join sg_g_usuarios b on a.id_usrio = b.id_usrio',
'join si_c_terceros c on b.id_trcro = c.id_trcro',
'where id_instncia_fljo = :P28_ID_INSTNCIA_FLJO;'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12159004766402040)
,p_plug_name=>'observaciones'
,p_parent_plug_id=>wwv_flow_api.id(12158787355402038)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_nvddes_obsrvcion,',
'       a.id_nvdad,',
'       a.cdgo_nvdad_prsna_estdo,',
'       a.id_instncia_fljo,',
'       a.id_fljo_trea,',
'       a.id_usrio,',
'       a.obsrvcion,',
'       a.fcha_obsrvcion,',
'       (c.prmer_nmbre ||'' ''|| c.sgndo_nmbre ||'' ''|| c.prmer_aplldo ||'' ''|| c.sgndo_aplldo) usuario',
'from si_g_novedades_observacion a',
'join sg_g_usuarios b on a.id_usrio = b.id_usrio',
'join si_c_terceros c on b.id_trcro = c.id_trcro',
'where id_instncia_fljo = :P28_ID_INSTNCIA_FLJO;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12188290887755982)
,p_name=>'ID_NVDDES_OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_NVDDES_OBSRVCION'
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
 p_id=>wwv_flow_api.id(12188445990755983)
,p_name=>'ID_NVDAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_NVDAD'
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
 p_id=>wwv_flow_api.id(12188545321755984)
,p_name=>'CDGO_NVDAD_PRSNA_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_NVDAD_PRSNA_ESTDO'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(12188664246755985)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
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
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12188710236755986)
,p_name=>'ID_FLJO_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA'
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
 p_id=>wwv_flow_api.id(12188820879755987)
,p_name=>'ID_USRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_USRIO'
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
 p_id=>wwv_flow_api.id(12230923312865938)
,p_name=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Obsrvcion'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(12231062442865939)
,p_name=>'FCHA_OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_OBSRVCION'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fcha Obsrvcion'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(12231129869865940)
,p_name=>'USUARIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USUARIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Usuario'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(12188250170755981)
,p_internal_uid=>12188250170755981
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
 p_id=>wwv_flow_api.id(12236863334866137)
,p_interactive_grid_id=>wwv_flow_api.id(12188250170755981)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(12236974004866137)
,p_report_id=>wwv_flow_api.id(12236863334866137)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12237456313866138)
,p_view_id=>wwv_flow_api.id(12236974004866137)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(12188290887755982)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12237978797866140)
,p_view_id=>wwv_flow_api.id(12236974004866137)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(12188445990755983)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12238443237866141)
,p_view_id=>wwv_flow_api.id(12236974004866137)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(12188545321755984)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12238957346866142)
,p_view_id=>wwv_flow_api.id(12236974004866137)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(12188664246755985)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12239440383866144)
,p_view_id=>wwv_flow_api.id(12236974004866137)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(12188710236755986)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12239949543866145)
,p_view_id=>wwv_flow_api.id(12236974004866137)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(12188820879755987)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12240345105866146)
,p_view_id=>wwv_flow_api.id(12236974004866137)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(12230923312865938)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12240797772866148)
,p_view_id=>wwv_flow_api.id(12236974004866137)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(12231062442865939)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>166
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12241340072866149)
,p_view_id=>wwv_flow_api.id(12236974004866137)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(12231129869865940)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69621430314138402)
,p_plug_name=>unistr('Observaci\00F3n / Adjuntos')
,p_parent_plug_id=>wwv_flow_api.id(16519602537637434)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_plug_read_only_when=>'P28_ID_NVDAD_PRSNA'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69630246859376002)
,p_plug_name=>'Adjuntos'
,p_parent_plug_id=>wwv_flow_api.id(69621430314138402)
,p_icon_css_classes=>'fa-trash-o'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select b.seq_id',
'        , a.id_nvdad_prsna_adjnto_tpo',
'		, a.dscrpcion_adjnto',
'		, b.c002 file_name',
'		, case',
'			when dbms_lob.getlength(blob001) > 0 then ''Cargado''',
'			else  ''Pendiente''',
'		end Estado',
unistr('		, decode (a.indcdor_oblgtrio, ''S'', ''S\00ED'', ''N'', ''No'') dscrpcion_indcdor_oblgtrio'),
'        , 1 eliminar',
'        , b.n002',
'	 from si_d_nvddes_prsna_adjnto_tp	a',
'	 left join apex_collections			b on b.collection_name = ''ADJUNTOS_NOVEDADES_PERSONA''',
'      and b.n001                        = :F_ID_INSTNCIA_FLJO',
'      and a.id_nvdad_prsna_adjnto_tpo   = b.n002   ',
'    where a.cdgo_clnte                   = :F_CDGO_CLNTE',
'      and a.cdgo_nvdad_tpo 				= nvl(:P29_CDGO_NVDAD_TPO,:P34_CDGO_NVDAD_TPO)',
'      and a.actvo 						= ''S'''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'     from si_d_nvddes_prsna_adjnto_tp',
'    where  cdgo_clnte                   = :F_CDGO_CLNTE',
'        and cdgo_nvdad_tpo 				= nvl(:P29_CDGO_NVDAD_TPO,:P34_CDGO_NVDAD_TPO)'))
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
 p_id=>wwv_flow_api.id(69630473703376004)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>69630473703376004
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74238318497552203)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'L'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74215072606610702)
,p_db_column_name=>'ID_NVDAD_PRSNA_ADJNTO_TPO'
,p_display_order=>20
,p_column_identifier=>'E'
,p_column_label=>'Id Nvdad Prsna Adjnto Tpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74215142681610703)
,p_db_column_name=>'DSCRPCION_ADJNTO'
,p_display_order=>30
,p_column_identifier=>'F'
,p_column_label=>'Tipo Adjunto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(69630674828376006)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>40
,p_column_identifier=>'B'
,p_column_label=>'Nombre Adjunto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74215511504610707)
,p_db_column_name=>'DSCRPCION_INDCDOR_OBLGTRIO'
,p_display_order=>50
,p_column_identifier=>'J'
,p_column_label=>unistr('\00BFObligatorio?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74215464106610706)
,p_db_column_name=>'ESTADO'
,p_display_order=>60
,p_column_identifier=>'I'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74238203171552202)
,p_db_column_name=>'ELIMINAR'
,p_display_order=>70
,p_column_identifier=>'K'
,p_column_label=>'Eliminar'
,p_column_link=>'f?p=&APP_ID.:29:&SESSION.:ELIMINAR_ADJUNTO:&DEBUG.:RP:P29_SEQ_ID,P29_ID_NVDAD_PRSNA_ADJNTO_TPO:#SEQ_ID#,#ID_NVDAD_PRSNA_ADJNTO_TPO#'
,p_column_linktext=>'<span aria-hidden="true" class="fa fa-trash" style="color: red;" ></span>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(152054773016434903)
,p_db_column_name=>'N002'
,p_display_order=>80
,p_column_identifier=>'M'
,p_column_label=>'N002'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(69638049468578698)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'696381'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_ADJNTO:DSCRPCION_INDCDOR_OBLGTRIO:FILE_NAME:ESTADO:ELIMINAR:'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(152326981777017176)
,p_report_id=>wwv_flow_api.id(69638049468578698)
,p_name=>'Pendientes'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'ESTADO'
,p_operator=>'='
,p_expr=>'Pendiente'
,p_condition_sql=>' (case when ("ESTADO" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Pendiente''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#F59B85'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(70307657792867401)
,p_plug_name=>'Items'
,p_parent_plug_id=>wwv_flow_api.id(69621430314138402)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select s.remote_addr',
'      ,d.flow_id app_id',
'      ,i.display_sequence seq',
'      ,d.item_name, d.item_value_vc2 item_value',
'      ,d.item_filter',
'      ,d.session_state_status',
'      ,d.is_encrypted',
'      --,s.cookie the_user',
'      ,s.security_group_id',
'      ,d.flow_instance',
'      --,d.*',
'      , i.page_id',
'from apex_190100.wwv_flow_data d',
'    ,apex_190100.wwv_flow_sessions$ s',
'    ,APEX_190100.apex_application_page_db_items i',
'where d.flow_instance = s.id',
'and   i.item_id(+)    = d.item_id',
'--and   s.security_group_id = 100001 -- workspace group ID',
'--and   item_name is not null',
'--and   flow_instance   = :APP_SESSION_ID -- session ID',
'and   d.flow_id = :APP_ID -- ignore dev builder et al',
'and D.ITEM_NAME like ''P34%''',
'order by d.flow_id, i.display_sequence, d.item_name'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
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
 p_id=>wwv_flow_api.id(70307796586867402)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>70307796586867402
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70307817408867403)
,p_db_column_name=>'ITEM_NAME'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Item Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70314838168905201)
,p_db_column_name=>'REMOTE_ADDR'
,p_display_order=>20
,p_column_identifier=>'D'
,p_column_label=>'Remote Addr'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70314947042905202)
,p_db_column_name=>'APP_ID'
,p_display_order=>30
,p_column_identifier=>'E'
,p_column_label=>'App Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70315078755905203)
,p_db_column_name=>'SEQ'
,p_display_order=>40
,p_column_identifier=>'F'
,p_column_label=>'Seq'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70315127164905204)
,p_db_column_name=>'ITEM_VALUE'
,p_display_order=>50
,p_column_identifier=>'G'
,p_column_label=>'Item Value'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70315271641905205)
,p_db_column_name=>'ITEM_FILTER'
,p_display_order=>60
,p_column_identifier=>'H'
,p_column_label=>'Item Filter'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70315378410905206)
,p_db_column_name=>'SESSION_STATE_STATUS'
,p_display_order=>70
,p_column_identifier=>'I'
,p_column_label=>'Session State Status'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70315401262905207)
,p_db_column_name=>'IS_ENCRYPTED'
,p_display_order=>80
,p_column_identifier=>'J'
,p_column_label=>'Is Encrypted'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70315537233905208)
,p_db_column_name=>'SECURITY_GROUP_ID'
,p_display_order=>90
,p_column_identifier=>'K'
,p_column_label=>'Security Group Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70315665268905209)
,p_db_column_name=>'FLOW_INSTANCE'
,p_display_order=>100
,p_column_identifier=>'L'
,p_column_label=>'Flow Instance'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70315793499905210)
,p_db_column_name=>'PAGE_ID'
,p_display_order=>110
,p_column_identifier=>'M'
,p_column_label=>'Page Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(70314003707872746)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'703141'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ITEM_NAME:REMOTE_ADDR:APP_ID:SEQ:ITEM_VALUE:ITEM_FILTER:SESSION_STATE_STATUS:IS_ENCRYPTED:SECURITY_GROUP_ID:FLOW_INSTANCE:PAGE_ID'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69621365756138401)
,p_plug_name=>unistr('Identificaci\00F3n No. &P29_IDNTFCCION.')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69934965462104001)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>',
'    <p align="justify">Funcionalidad de Solicitud de Novedad.<br> <br>',
unistr('    <center><b> Paso 2 Observaci\00F3nes y Adjunto.</b> </center><br>'),
unistr('    <b> 1</b> Se debe singresar una observaci\00F3n de la novedad.<br> <br>'),
'    <b> 2</b> Agregar los documentos que soportan las solicitud de novedad<br>',
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>',
'',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(69621611104138404)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(69621430314138402)
,p_button_name=>'BTN_NUEVO_ADJUNTO'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar Adjunto'
,p_button_position=>'BODY'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de Agregar este Archivo?'',''BTN_NUEVO_ADJUNTO'')'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'     from si_d_nvddes_prsna_adjnto_tp',
'    where  cdgo_clnte                   = :F_CDGO_CLNTE',
'        and cdgo_nvdad_tpo 				= nvl(:P29_CDGO_NVDAD_TPO,:P34_CDGO_NVDAD_TPO)'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>2
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69630187791376001)
,p_name=>'P29_FILE_BLOB'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(69621430314138402)
,p_prompt=>'Adjunto'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'     from si_d_nvddes_prsna_adjnto_tp',
'    where  cdgo_clnte                   = :F_CDGO_CLNTE',
'        and cdgo_nvdad_tpo 				= nvl(:P29_CDGO_NVDAD_TPO,:P34_CDGO_NVDAD_TPO)'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69641131405581604)
,p_name=>'P29_SEQ_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(69630246859376002)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69641405741581607)
,p_name=>'P29_OBSRVCION'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(69621430314138402)
,p_prompt=>unistr('Observaci\00F3n Novedad')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>100
,p_cMaxlength=>200
,p_cHeight=>1
,p_read_only_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74238119897552201)
,p_name=>'P29_ID_NVDAD_PRSNA_ADJNTO_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(69621430314138402)
,p_prompt=>'Tipo de Adjunto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select a.dscrpcion_adjnto',
'        , a.id_nvdad_prsna_adjnto_tpo ',
'        , case when indcdor_oblgtrio = ''S'' then ''Obligatorios'' else ''Opcionales'' end as tipo',
'     from si_d_nvddes_prsna_adjnto_tp   a',
'    where CDGO_CLNTE                   = :F_CDGO_CLNTE',
'        and cdgo_nvdad_tpo                = nvl(:P29_CDGO_NVDAD_TPO,:P34_CDGO_NVDAD_TPO)'))
,p_lov_display_null=>'YES'
,p_colspan=>5
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'     from si_d_nvddes_prsna_adjnto_tp',
'    where  cdgo_clnte                   = :F_CDGO_CLNTE',
'        and cdgo_nvdad_tpo 				= nvl(:P29_CDGO_NVDAD_TPO,:P34_CDGO_NVDAD_TPO)'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(151913548784467802)
,p_name=>'P29_CDGO_NVDAD_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(69621430314138402)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(152011083019924901)
,p_name=>'P29_ID_SJTO_IMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(69621430314138402)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(152011120943924902)
,p_name=>'P29_IDNTFCCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(69621430314138402)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(152138888141566701)
,p_name=>'P29_ID_IMPSTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(69621430314138402)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(152379747095904201)
,p_name=>'P29_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(69621430314138402)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(69641282329581605)
,p_validation_name=>unistr('Validar Adjunto no Nulo al hacer clic en el bot\00F3n nuevo adjunto')
,p_validation_sequence=>10
,p_validation=>'P29_FILE_BLOB'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor seleccione un Adjunto'
,p_when_button_pressed=>wwv_flow_api.id(69621611104138404)
,p_associated_item=>wwv_flow_api.id(69630187791376001)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(74271469742257102)
,p_validation_name=>'Validar que esten cargados los adjuntos obligatorios'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cntdad_cndcion             number;',
'    v_cntdad_adjnto_oblgtorio    number;',
'',
'begin',
'    begin',
'        select count(1)',
'          into v_cntdad_cndcion',
'          from si_d_nvddes_prsna_adjnto_tp',
'        where  cdgo_clnte                   = :F_CDGO_CLNTE',
'            and cdgo_nvdad_tpo 				= nvl(:P29_CDGO_NVDAD_TPO,:P34_CDGO_NVDAD_TPO)',
'            and indcdor_oblgtrio            = ''S''',
'            and actvo 				        = ''S'';',
'      exception',
'          when others then ',
'              v_cntdad_cndcion    := 0;',
'      end;',
'      ',
'    if v_cntdad_cndcion > 0 then ',
'        begin',
'            select count(*)',
'              into v_cntdad_adjnto_oblgtorio',
'              from si_d_nvddes_prsna_adjnto_tp	a',
'              left join apex_collections			b on b.collection_name = ''ADJUNTOS_NOVEDADES_PERSONA''',
'               and b.n001                        = :F_ID_INSTNCIA_FLJO',
'               and a.id_nvdad_prsna_adjnto_tpo   = b.n002   ',
'             where  a.cdgo_clnte                   = :F_CDGO_CLNTE',
'               and a.cdgo_nvdad_tpo 				= nvl(:P29_CDGO_NVDAD_TPO,:P34_CDGO_NVDAD_TPO)',
'               and a.actvo 						= ''S''',
'               and dbms_lob.getlength(blob001)   > 0;',
'            if v_cntdad_adjnto_oblgtorio =  0 then ',
'                return ''Para poder continuar debe cargar los adjuntos obligatorios'';',
'            end if;',
'        exception',
'            when others then',
'                return ''Para poder continuar debe cargar los adjuntos obligatorios'';',
'        end;',
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'BTN_NUEVO_ADJUNTO'
,p_validation_condition_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_associated_item=>wwv_flow_api.id(74238119897552201)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(70679168203912406)
,p_name=>'Inactivar botones cuado la novedad este registrada'
,p_event_sequence=>10
,p_condition_element=>'P28_ID_NVDAD_PRSNA'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70679206856912407)
,p_event_id=>wwv_flow_api.id(70679168203912406)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(69621611104138404)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(152054502596434901)
,p_name=>'Al cambiar el tipo de adjunto'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P29_ID_NVDAD_PRSNA_ADJNTO_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(152054636918434902)
,p_event_id=>wwv_flow_api.id(152054502596434901)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P29_ID_NVDAD_PRSNA_ADJNTO_TPO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(152103628410646412)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar colecciones'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if  apex_collection.collection_exists (p_collection_name => ''ADJUNTOS_NOVEDADES_PERSONA'') then',
'    apex_collection.delete_collection (p_collection_name => ''ADJUNTOS_NOVEDADES_PERSONA'');',
'end if;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(151910151492341686)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar datos de actualizacion y/o inscripcion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_tmpral    number := 0;  ',
'    v_id_ssion     number;  ',
'    v_json          clob;  ',
' ',
'begin ',
'',
'    --Tener presente que este proceso esta en las paginas 34, 29,30',
'      -- al hacer modificacion, modificarlo en esas paginas',
'',
'  for c_item in  ( ',
'                --busco la instancia flujo de esa temporal'',',
'                select c001, c003 ',
'                from gn_g_temporal ',
'                where n001           = :F_ID_INSTNCIA_FLJO     --instancia flujo'',',
'                and   c005           =  ''SUJETO'' ',
'            ) loop ',
' ',
'            --v(c_item.c001):= c_item.c003; '',',
'            --v(''''F_CDGO_CLNTE'''')'',',
'            --v(''''P34_CDGO_IDNTFCCION_TPO'''')'',',
' ',
'           -- insert into muerto (v_001, v_002, T_001) values (''''NOVEDADES'''', c_item.c001, sysdate); commit;'',',
'            if c_item.c001 = ''P34_CDGO_IDNTFCCION_TPO''			then :P34_CDGO_IDNTFCCION_TPO		:= c_item.c003; end if ;',
'            if c_item.c001 = ''P34_PRMER_NMBRE''                  then :P34_PRMER_NMBRE               := c_item.c003; end if ;',
'            if c_item.c001 = ''P34_SGNDO_NMBRE''                  then :P34_SGNDO_NMBRE               := c_item.c003; end if ;',
'            if c_item.c001 = ''P34_PRMER_APLLDO''                 then :P34_PRMER_APLLDO              := c_item.c003; end if ;',
'            if c_item.c001 = ''P34_SGNDO_APLLDO''                 then :P34_SGNDO_APLLDO              := c_item.c003; end if ;',
'            if c_item.c001 = ''P34_NMBRE_RZON_SCIAL''             then :P34_NMBRE_RZON_SCIAL          := c_item.c003; end if ;',
'            if c_item.c001 = ''P34_ID_DPRTMNTO''                  then :P34_ID_DPRTMNTO               := c_item.c003; end if ;',
'            if c_item.c001 = ''P34_ID_MNCPIO''                    then :P34_ID_MNCPIO                 := c_item.c003; end if ;',
'            if c_item.c001 = ''P34_ID_DPRTMNTO_NTFCCION''         then :P34_ID_DPRTMNTO_NTFCCION      := c_item.c003; end if ;',
'            if c_item.c001 = ''P34_ID_MNCPIO_NTFCCION''           then :P34_ID_MNCPIO_NTFCCION        := c_item.c003; end if ;',
'            if c_item.c001 = ''P34_DRCCION''                      then :P34_DRCCION                   := c_item.c003; end if ;',
'            if c_item.c001 = ''P34_DRCCION_NTFCCION''             then :P34_DRCCION_NTFCCION          := c_item.c003; end if ;',
'            if c_item.c001 = ''P34_ID_SJTO_TPO''                  then :P34_ID_SJTO_TPO               := c_item.c003; end if ;',
'            if c_item.c001 = ''P34_NMRO_SCRSLES''                 then :P34_NMRO_SCRSLES              := c_item.c003; end if ;',
'            if c_item.c001 = ''P34_ID_ACTVDAD_ECNMCA''            then :P34_ID_ACTVDAD_ECNMCA         := c_item.c003; end if ;',
'            if c_item.c001 = ''P34_TLFNO''                        then :P34_TLFNO                     := c_item.c003; end if ;',
'            if c_item.c001 = ''P34_EMAIL''                        then :P34_EMAIL                     := c_item.c003; end if ;',
'            if c_item.c001 = ''P34_FCHA_INCIO_ACTVDDES''          then :P34_FCHA_INCIO_ACTVDDES       := c_item.c003; end if ;',
'            if c_item.c001 = ''P34_NMRO_RGSTRO_CMRA_CMRCIO''      then :P34_NMRO_RGSTRO_CMRA_CMRCIO   := c_item.c003; end if ;',
'            if c_item.c001 = ''P34_DRCCION_CMRA_CMRCIO''          then :P34_DRCCION_CMRA_CMRCIO       := c_item.c003; end if ;',
'            if c_item.c001 = ''P34_FCHA_RGSTRO_CMRA_CMRCIO''      then :P34_FCHA_RGSTRO_CMRA_CMRCIO   := c_item.c003; end if ;',
'            if c_item.c001 = ''P34_TPO_PRSNA''                    then :P34_TPO_PRSNA                 := c_item.c003; end if ;',
'            if c_item.c001 = ''P34_IDNTFCCION''                   then :P34_IDNTFCCION                := c_item.c003; end if ;',
' ',
'    end loop; ',
'end;  '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(152017296745982264)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar parametros del flujo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_instncia_trnscion    number := 0; ',
'    v_cdgo_nvdad_tpo          si_d_novedades_tipo.cdgo_nvdad_tpo%type;',
'    v_idntfccion             varchar(25);',
'    v_id_sjto_impsto         number := 0; ',
'    v_id_impsto              number := 0; ',
'    v_obsrvcion              si_g_novedades_persona.obsrvcion%type;',
'    v_id_impsto_sbmpsto      number := 0; ',
'begin',
'',
'        --insert into muerto (v_001, v_002, t_001) values (''PARAMETROS'',:F_ID_INSTNCIA_FLJO||''-''|| :F_ID_FLJO_TREA,SYSDATE); commit;',
'        select id_instncia_trnscion',
'        into v_id_instncia_trnscion',
'        from wf_g_instancias_transicion',
'        where  id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'        and id_fljo_trea_orgen = :F_ID_FLJO_TREA;',
'',
'        --insert into muerto2 (v_001, v_002, t_001)  values (''PARAMETROS'',''v_id_instncia_trnscion : '' || v_id_instncia_trnscion,SYSDATE); commit;',
' ',
'        select vlor',
'        into v_cdgo_nvdad_tpo ',
'        from wf_g_instancias_item_valor',
'        where  id_instncia_trnscion = v_id_instncia_trnscion',
'        and nmbre_item =  ''P29_CDGO_NVDAD_TPO''; ',
' ',
'        :P29_CDGO_NVDAD_TPO := v_cdgo_nvdad_tpo ;',
'        :P34_CDGO_NVDAD_TPO := v_cdgo_nvdad_tpo ;',
'        :P28_CDGO_NVDAD_TPO := v_cdgo_nvdad_tpo ; ',
'        ',
'        --insert into muerto2  (v_001, v_002, t_001)  values (''PARAMETROS'',''P34_CDGO_NVDAD_TPO : '' || :P34_CDGO_NVDAD_TPO,SYSDATE); commit;',
'        --insert into muerto2  (v_001, v_002, t_001)  values (''PARAMETROS'',''P28_CDGO_NVDAD_TPO : '' || :P28_CDGO_NVDAD_TPO,SYSDATE); commit;',
'',
'        select vlor',
'        into v_idntfccion',
'        from wf_g_instancias_item_valor',
'        where  id_instncia_trnscion = v_id_instncia_trnscion',
'        and nmbre_item =  ''P29_IDNTFCCION'';',
'',
'        :P29_IDNTFCCION := v_idntfccion;',
'        :P34_IDNTFCCION := v_idntfccion; ',
'        :P28_IDNTFCCION := v_idntfccion;  ',
'        ',
'        --insert into muerto2 (v_001, v_002, t_001)  values (''PARAMETROS'','':P34_IDNTFCCION  :'' || :P34_IDNTFCCION,SYSDATE); commit;',
'        ',
'        select vlor',
'        into v_id_sjto_impsto ',
'        from wf_g_instancias_item_valor',
'        where  id_instncia_trnscion = v_id_instncia_trnscion',
'        and nmbre_item =  ''P29_ID_SJTO_IMPSTO'';',
'',
'        :P29_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'        :P34_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'        :P28_ID_SJTO_IMPSTO := v_id_sjto_impsto; ',
'        ',
'       --insert into muerto2  (v_001, v_002, t_001)  values (''PARAMETROS'','':P34_ID_SJTO_IMPSTO  :'' || :P34_ID_SJTO_IMPSTO,SYSDATE); commit;',
'          ',
'        select vlor',
'        into v_id_impsto ',
'        from wf_g_instancias_item_valor',
'        where  id_instncia_trnscion = v_id_instncia_trnscion',
'        and nmbre_item =  ''P29_ID_IMPSTO'';',
'',
'        :P29_ID_IMPSTO := v_id_impsto;',
'        :P34_ID_IMPSTO := v_id_impsto;',
'        :P28_ID_IMPSTO := v_id_impsto;   ',
'',
'        select vlor',
'        into v_id_impsto_sbmpsto ',
'        from wf_g_instancias_item_valor',
'        where  id_instncia_trnscion = v_id_instncia_trnscion',
'        and nmbre_item =  ''P29_ID_IMPSTO_SBMPSTO'';',
'',
'        :P28_ID_IMPSTO_SBMPSTO := v_id_impsto_sbmpsto;',
'        :P29_ID_IMPSTO_SBMPSTO := v_id_impsto_sbmpsto; ',
'        :P34_ID_IMPSTO_SBMPSTO := v_id_impsto_sbmpsto; ',
'        :P30_ID_IMPSTO_SBMPSTO := v_id_impsto_sbmpsto; ',
' ',
'        --Insert into muerto2  (v_001, v_002, t_001)  values (''SALIO PARAMETROS'',''P34_ID_IMPSTO_SBMPSTO : '' || :P34_ID_IMPSTO_SBMPSTO,SYSDATE); commit;',
'         ',
'        ',
'   end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(151912429518453471)
,p_process_sequence=>40
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Cargar Informaci\00F3n de Responsables')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_total number;',
'begin',
'    ',
'     --insert into muerto2(v_001,v_002) values(''Entro a coleccion respondables :F_ID_INSTNCIA_FLJO :'', :F_ID_INSTNCIA_FLJO); commit;',
'    ',
'    ',
'    if (not apex_collection.collection_exists(p_collection_name => ''RESPONSABLES'') ) then',
'        apex_collection.create_collection( p_collection_name => ''RESPONSABLES'');',
'    end if;',
'',
'',
'    select count(*)',
'    into v_total',
'    from gn_g_temporal',
'    where n001 =  :F_ID_INSTNCIA_FLJO',
'      and c023 = ''RESPONSABLE_NOVEDADES_PERSONA'';',
'',
'',
'    if v_total > 0 then',
'',
'      for c_rspnsble in (select * ',
'                         from gn_g_temporal a',
'                         where n001 =  :F_ID_INSTNCIA_FLJO',
'                              and c023 = ''RESPONSABLE_NOVEDADES_PERSONA''',
'                              and c004  not in (select c004 ',
'                                                from apex_collections    m',
'                                               where collection_name     = ''RESPONSABLES'' ',
'                                                 and m.n001              = :F_ID_INSTNCIA_FLJO) ) loop',
'',
'          apex_collection.add_member(p_collection_name 	=> ''RESPONSABLES''',
'                                   , p_n001               => :F_ID_INSTNCIA_FLJO',
'                                   , p_c001				=> c_rspnsble.c001',
'                                   , p_c002				=> c_rspnsble.c002',
'                                   , p_c003				=> c_rspnsble.c003',
'                                   , p_c004				=> c_rspnsble.c004',
'                                   , p_c005				=> c_rspnsble.c005',
'                                   , p_c006				=> c_rspnsble.c006',
'                                   , p_c007				=> c_rspnsble.c007',
'                                   , p_c008				=> c_rspnsble.c008',
'                                   , p_c009				=> c_rspnsble.c009',
'                                   , p_c010				=> c_rspnsble.c010',
'                                   , p_c011				=> c_rspnsble.c011',
'                                   , p_c012				=> c_rspnsble.c012',
'                                   , p_c013				=> c_rspnsble.c013',
'                                   , p_c014				=> c_rspnsble.c014',
'                                   , p_c015				=> c_rspnsble.c015',
'                                   , p_c016				=> c_rspnsble.c016',
'                                   , p_c017				=> c_rspnsble.c017',
'                                   , p_c018				=> c_rspnsble.c018',
'                                   , p_c019				=> c_rspnsble.c019',
'                                   , p_c020				=> c_rspnsble.c020',
'                                   , p_c021				=> c_rspnsble.c021',
'                                   , p_c022				=> ''NUEVO'');',
'      end loop;',
'    end if;',
'  ',
'  ',
'    for c_rspnsble in (select * ',
'                         from si_i_sujetos_responsable a',
'                        where id_sjto_impsto    = nvl(:P29_ID_SJTO_IMPSTO, :P34_ID_SJTO_IMPSTO)',
'                          and idntfccion        not in (select c004 ',
'                                                          from apex_collections    m',
'                                                         where collection_name     = ''RESPONSABLES'' ',
'                                                           and m.n001              = :F_ID_INSTNCIA_FLJO) ) loop',
'                        ',
'        apex_collection.add_member(p_collection_name 	=> ''RESPONSABLES''',
'                                 , p_n001               => :F_ID_INSTNCIA_FLJO',
'                                 , p_c001				=> c_rspnsble.ID_SJTO_RSPNSBLE',
'                                 , p_c002				=> c_rspnsble.ID_SJTO_IMPSTO',
'                                 , p_c003				=> c_rspnsble.CDGO_IDNTFCCION_TPO',
'                                 , p_c004				=> c_rspnsble.IDNTFCCION',
'                                 , p_c005				=> c_rspnsble.PRMER_NMBRE',
'                                 , p_c006				=> c_rspnsble.SGNDO_NMBRE',
'                                 , p_c007				=> c_rspnsble.PRMER_APLLDO',
'                                 , p_c008				=> c_rspnsble.SGNDO_APLLDO',
'                                 , p_c009				=> c_rspnsble.PRNCPAL_S_N',
'                                 , p_c010				=> c_rspnsble.CDGO_TPO_RSPNSBLE',
'                                 , p_c011				=> c_rspnsble.PRCNTJE_PRTCPCION',
'                                 , p_c012				=> c_rspnsble.ORGEN_DCMNTO',
'                                 , p_c013				=> c_rspnsble.ID_PAIS_NTFCCION',
'                                 , p_c014				=> c_rspnsble.ID_DPRTMNTO_NTFCCION',
'                                 , p_c015				=> c_rspnsble.ID_MNCPIO_NTFCCION',
'                                 , p_c016				=> c_rspnsble.DRCCION_NTFCCION',
'                                 , p_c017				=> c_rspnsble.EMAIL',
'                                 , p_c018				=> c_rspnsble.TLFNO',
'                                 , p_c019				=> c_rspnsble.CLLAR',
'                                 , p_c020				=> c_rspnsble.ACTVO',
'                                 , p_c021				=> c_rspnsble.ID_TRCRO',
'                                 , p_c022				=> ''EXISTENTE'');',
'    end loop;',
'end;    '))
,p_process_error_message=>'#SQLERRM# #SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(151912751950454469)
,p_process_sequence=>50
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Cargar Informaci\00F3n de Sucursales')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_total number;',
'begin',
'    ',
'     --insert into muerto2(v_001,v_002) values(''Entro a coleccion SUCURSALES :F_ID_INSTNCIA_FLJO :'', :F_ID_INSTNCIA_FLJO); commit;',
'    ',
'    ',
'    if (not apex_collection.collection_exists(p_collection_name => ''SUCURSALES'') ) then',
'        apex_collection.create_collection( p_collection_name => ''SUCURSALES'');',
'    end if;',
'',
'    select count(*)',
'    into v_total',
'    from gn_g_temporal',
'    where n001 =  :F_ID_INSTNCIA_FLJO',
'      and c023 = ''SUCURSAL_NOVEDADES_PERSONA'';',
'',
'',
'    if v_total > 0 then',
'',
'      for c_scrsal in (select * ',
'                         from gn_g_temporal a',
'                         where n001 =  :F_ID_INSTNCIA_FLJO',
'                              and c023 = ''SUCURSAL_NOVEDADES_PERSONA''',
'                              and c004  not in (select c004 ',
'                                                from apex_collections    m',
'                                               where collection_name     = ''SUCURSALES'' ',
'                                                 and m.n001              = :F_ID_INSTNCIA_FLJO) ) loop',
'',
'          apex_collection.add_member(p_collection_name 	=> ''SUCURSALES''',
'                                     , p_n001               => :F_ID_INSTNCIA_FLJO',
'                                     , p_c001				=> c_scrsal.c001',
'									 , p_c002				=> c_scrsal.c002',
'								--	 , p_c003				=> c_scrsal.PRNCPAL_S_N',
'									 , p_c004				=> c_scrsal.c004',
'									 , p_c005				=> c_scrsal.c005',
'									 , p_c006				=> c_scrsal.c006',
'									 , p_c007				=> c_scrsal.c007',
'									 , p_c008				=> c_scrsal.c008',
'									 , p_c009				=> c_scrsal.c009',
'									 , p_c010				=> c_scrsal.c010',
'									 , p_c011				=> c_scrsal.c011	  ',
'                                     , p_c022				=> ''NUEVO'');',
'                                     ',
'      end loop;',
'    end if;',
'',
'    ',
'    for c_scrsal in (select * ',
'                         from si_i_sujetos_sucursal a',
'                        where id_sjto_impsto    = nvl(:P29_ID_SJTO_IMPSTO , :P34_ID_SJTO_IMPSTO ) ',
'                          and cdgo_scrsal        not in (select c004 ',
'                                                          from apex_collections    m',
'                                                         where collection_name     = ''SUCURSALES'' ',
'                                                           and m.n001              = :F_ID_INSTNCIA_FLJO) ) loop ',
'                        ',
'           apex_collection.add_member(p_collection_name 	=> ''SUCURSALES''',
'                                     , p_n001               => :F_ID_INSTNCIA_FLJO',
'                                     , p_c001				=> c_scrsal.ID_SJTO_IMPSTO',
'									 , p_c002				=> c_scrsal.NMBRE',
'								--	 , p_c003				=> c_scrsal.PRNCPAL_S_N',
'									 , p_c004				=> c_scrsal.CDGO_SCRSAL',
'									 , p_c005				=> c_scrsal.ID_DPRTMNTO_NTFCCION',
'									 , p_c006				=> c_scrsal.ID_MNCPIO_NTFCCION',
'									 , p_c007				=> c_scrsal.DRCCION',
'									 , p_c008				=> c_scrsal.EMAIL',
'									 , p_c009				=> c_scrsal.TLFNO',
'									 , p_c010				=> c_scrsal.CLLAR',
'									 , p_c011				=> c_scrsal.ACTVO ); ',
'    end loop;',
'end;    '))
,p_process_error_message=>'#SQLERRM# #SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(152044907052380301)
,p_process_sequence=>60
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Cargar Informaci\00F3n de Adjuntos')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_total    number := 0;',
'',
'begin',
'    ',
'     insert into muerto2(v_001,v_002) values(''Entro a coleccion ADJUNTOS_NOVEDADES_PERSONA :F_ID_INSTNCIA_FLJO :'', :F_ID_INSTNCIA_FLJO); commit;',
'    ',
'    if (not apex_collection.collection_exists(p_collection_name => ''ADJUNTOS_NOVEDADES_PERSONA'') ) then',
'        apex_collection.create_collection( p_collection_name => ''ADJUNTOS_NOVEDADES_PERSONA'');',
'    end if;',
'',
'    select count(*)',
'    into v_total',
'    from gn_g_temporal',
'    where n001 =  :F_ID_INSTNCIA_FLJO',
'        and c023 = ''ADJUNTOS_NOVEDADES_PERSONA'';',
'    ',
'    if v_total > 0 then',
'         for c_adjnto in (select * ',
'                         from gn_g_temporal a',
'                         where n001 =  :F_ID_INSTNCIA_FLJO',
'                                and c023 = ''ADJUNTOS_NOVEDADES_PERSONA''',
'                                and c004  not in (select c004 ',
'                                                    from apex_collections    m',
'                                                    where collection_name     = ''ADJUNTOS_NOVEDADES_PERSONA'' ',
'                                                       and m.n001              = :F_ID_INSTNCIA_FLJO) ) loop ',
'',
'             apex_collection.add_member( p_collection_name   => ''ADJUNTOS_NOVEDADES_PERSONA''',
'                                      , p_n001              => :F_ID_INSTNCIA_FLJO',
'                                      , p_n002              => c_adjnto.n002',
'                                      , p_c002              => c_adjnto.c002',
'                                      , p_c003              => c_adjnto.c003',
'                                      , p_blob001           => c_adjnto.blob001 );',
'            end loop;    ',
'    end if;',
'  ',
'end;    '))
,p_process_error_message=>'#SQLERRM# #SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69630380028376003)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Agregar Adjunto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_blob         blob;',
'     v_seq          varchar2(4000);',
'     r_temp_files   apex_application_temp_files%rowtype;',
'     v_count        number;',
'     ',
'begin',
'    begin',
'        select *',
'          into r_temp_files',
'          from apex_application_temp_files',
'         where name = :P29_FILE_BLOB;',
'    exception ',
'        when no_data_found then',
'            v_blob := null;  ',
'    end;',
'    ',
'    if r_temp_files.filename is not null then',
'    ',
'        if (not apex_collection.collection_exists(p_collection_name => ''ADJUNTOS_NOVEDADES_PERSONA'') ) then',
'            apex_collection.create_collection( p_collection_name => ''ADJUNTOS_NOVEDADES_PERSONA'');',
'        end if;',
'        ',
'        begin ',
'            select nvl(count(1), 0 )',
'              into v_count',
'              from apex_collections			a ',
'             where a.collection_name        = ''ADJUNTOS_NOVEDADES_PERSONA''',
'               and a.n001                   = :F_ID_INSTNCIA_FLJO',
'               and a.n002                   = :P29_ID_NVDAD_PRSNA_ADJNTO_TPO;',
'        exception',
'            when others then ',
'                v_count := 0;',
'        end;',
'        ',
'        if v_count = 0 then',
'            apex_collection.add_member( p_collection_name   => ''ADJUNTOS_NOVEDADES_PERSONA''',
'                                      , p_n001              => :F_ID_INSTNCIA_FLJO',
'                                      , p_n002              => :P29_ID_NVDAD_PRSNA_ADJNTO_TPO',
'                                      , p_c002              => r_temp_files.filename',
'                                      , p_c003              => r_temp_files.mime_type',
'                                      , p_blob001           => r_temp_files.blob_content );',
'',
'            insert into gn_g_temporal   (id_ssion							,n001								,n002										,c002		 ',
'                                        ,c003								,blob001							,c023)								 ',
'                                values (:F_ID_INSTNCIA_FLJO					,:F_ID_INSTNCIA_FLJO				,:P29_ID_NVDAD_PRSNA_ADJNTO_TPO				,r_temp_files.filename			 ',
'                                        ,r_temp_files.mime_type				,r_temp_files.blob_content			,''ADJUNTOS_NOVEDADES_PERSONA''); ',
'',
'        else',
'            raise_application_error( -20001 , ''El tipo de adjunto seleccionado ya se tiene un adjunto asociado, si desea cambiarlo por favor elimine el adjunto que ya existe'' );',
'        end if;',
'             ',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(69621611104138404)
,p_process_when=>'P29_FILE_BLOB'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'Adjunto agregado Exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69743303345923101)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_PROCESO_WORKFLOW'
,p_process_name=>'Proceso Workflow'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'WORKFLOW'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69641065656581603)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar Adjunto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    insert into muerto2(v_001,v_002) values(''Entro a borrar  ADJUNTOS_NOVEDADES_PERSONA :F_ID_INSTNCIA_FLJO :'', :F_ID_INSTNCIA_FLJO); commit;',
'    insert into muerto2(v_001,v_002) values(''Entro a borrar  ADJUNTOS_NOVEDADES_PERSONA :P29_ID_NVDAD_PRSNA_ADJNTO_TPO :'', :P29_ID_NVDAD_PRSNA_ADJNTO_TPO); commit;',
'   ',
'    insert into muerto2(v_001,v_002) values(''Entro a borrar  ADJUNTOS_NOVEDADES_PERSONA :P29_SEQ_ID :'', :P29_SEQ_ID); commit;',
'   ',
'    delete gn_g_temporal',
'    where n001       = :F_ID_INSTNCIA_FLJO',
'        and c023     = ''ADJUNTOS_NOVEDADES_PERSONA''',
'        and n002     = :P29_ID_NVDAD_PRSNA_ADJNTO_TPO;',
'',
'    APEX_COLLECTION.DELETE_MEMBER(p_collection_name => ''ADJUNTOS_NOVEDADES_PERSONA'',',
'                                  p_seq => :P29_SEQ_ID);',
'   --:P29_OBSRVCION := NULL;',
'   ',
'end;'))
,p_process_error_message=>'Error al Eliminar el Adjunto'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'ELIMINAR_ADJUNTO'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Adjunto Eliminado'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(151911844561445301)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'actualizar_temporal'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_tmpral                gn_g_temporal.id_tmpral%type;',
'    ',
'    v_item_nmbre               varchar2(1000) := apex_application.g_f01(1);',
'    v_item_vlor                varchar2(1000) := apex_application.g_f02(1);',
'    ',
'    v_error                    varchar2(1000);',
'    v_nmro                     number;',
'begin',
'    ',
'    begin',
'        begin',
'           select a.id_tmpral',
'             into v_id_tmpral',
'             from gn_g_temporal      a',
'            where --a.id_ssion         = :APP_SESSION and',
'              a.n001             = :F_ID_INSTNCIA_FLJO',
'              and a.c005             = ''SUCURSALES''',
'              and a.n002             = :P55_SEQ_ID',
'              and a.c001             = v_item_nmbre;',
'        exception ',
'            when others then ',
'                v_id_tmpral    := null;',
'        end;',
'        ',
'        ',
'        if v_id_tmpral is not null then ',
'        ',
'            update gn_g_temporal    a',
'              set c003              = v_item_vlor',
'                , c006              = ''ACTUALIZACION''',
'             where --a.id_ssion       = :APP_SESSION and',
'               a.n001           = :F_ID_INSTNCIA_FLJO',
'               and a.c005           = ''SUCURSALES''',
'               and a.n002           = :P55_SEQ_ID',
'               and a.c001           = v_item_nmbre;',
'            v_nmro := sql%rowcount;',
'            /*insert into gti_aux(col1, col2) values (''v_item_nmbre'', v_item_nmbre);',
'            insert into gti_aux(col1, col2) values (''v_item_vlor'', v_item_vlor);*/',
'            commit;',
'            ',
'        else',
'            insert into gn_g_temporal (id_ssion,                 n001,                    n002,                      c001,                ',
'                                       c002,                     c003,                    c004,                      c005,',
'                                       c006)',
'                               values (:APP_SESSION,             :F_ID_INSTNCIA_FLJO,     :P55_SEQ_ID,               v_item_nmbre,   ',
'                                       v_item_vlor,              v_item_vlor,             v_item_nmbre,             ''SUCURSALES'',',
'                                       ''NUEVO'');',
'',
'            commit;',
'        end if;',
'    ',
'    exception ',
'        when others then ',
'            null;',
'  end;',
'  ',
'  ',
'exception',
'    when others then ',
'        v_error    := sqlcode || '' -  ''|| sqlerrm;',
'         insert into gti_aux(col1, col2) values (''Error'', v_error);',
'         commit;        ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P55_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(151912191256446025)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'actualizar_temporal'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_tmpral                gn_g_temporal.id_tmpral%type;',
'    ',
'    v_item_nmbre               varchar2(1000) := apex_application.g_f01(1);',
'    v_item_vlor                varchar2(1000) := apex_application.g_f02(1);',
'    ',
'    v_error                    varchar2(1000);',
'    v_nmro                     number;',
'begin',
'    ',
'    begin',
'        begin',
'           select a.id_tmpral',
'             into v_id_tmpral',
'             from gn_g_temporal      a',
'            where --a.id_ssion         = :APP_SESSION and',
'              a.n001             = :F_ID_INSTNCIA_FLJO',
'              and a.c005             = ''SUCURSALES''',
'              and a.n002             = :P55_SEQ_ID',
'              and a.c001             = v_item_nmbre;',
'        exception ',
'            when others then ',
'                v_id_tmpral    := null;',
'        end;',
'        ',
'        ',
'        if v_id_tmpral is not null then ',
'        ',
'            update gn_g_temporal    a',
'              set c003              = v_item_vlor',
'                , c006              = ''ACTUALIZACION''',
'             where --a.id_ssion       = :APP_SESSION and',
'               a.n001           = :F_ID_INSTNCIA_FLJO',
'               and a.c005           = ''SUCURSALES''',
'               and a.n002           = :P55_SEQ_ID',
'               and a.c001           = v_item_nmbre;',
'            v_nmro := sql%rowcount;',
'            /*insert into gti_aux(col1, col2) values (''v_item_nmbre'', v_item_nmbre);',
'            insert into gti_aux(col1, col2) values (''v_item_vlor'', v_item_vlor);*/',
'            commit;',
'            ',
'        else',
'            insert into gn_g_temporal (id_ssion,                 n001,                    n002,                      c001,                ',
'                                       c002,                     c003,                    c004,                      c005,',
'                                       c006)',
'                               values (:APP_SESSION,             :F_ID_INSTNCIA_FLJO,     :P55_SEQ_ID,               v_item_nmbre,   ',
'                                       v_item_vlor,              v_item_vlor,             v_item_nmbre,             ''SUCURSALES'',',
'                                       ''NUEVO'');',
'',
'            commit;',
'        end if;',
'    ',
'    exception ',
'        when others then ',
'            null;',
'  end;',
'  ',
'  ',
'exception',
'    when others then ',
'        v_error    := sqlcode || '' -  ''|| sqlerrm;',
'         insert into gti_aux(col1, col2) values (''Error'', v_error);',
'         commit;        ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P55_SEQ_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
