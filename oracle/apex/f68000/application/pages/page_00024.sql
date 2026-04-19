prompt --application/pages/page_00024
begin
wwv_flow_api.create_page(
 p_id=>24
,p_user_interface_id=>wwv_flow_api.id(71889596252951620)
,p_name=>'Tramite'
,p_step_title=>'Tramite'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.jQuery(apex.gPageContext$).on("apexreadyend", async function (e) {',
'    let rs = await apex.server.process(''consultarRespuesta'', {',
'        pageItems: ''#P24_ID_QJA_RCLMO''',
'    });',
'    ',
'    if(rs.type === ''OK'') {',
'        CKEDITOR.instances.P24_RSPSTA.setData(rs.html);    ',
'    } else {',
'        CKEDITOR.instances.P24_RSPSTA.setData('''');',
'    }    ',
'});'))
,p_step_template=>wwv_flow_api.id(71783507231951541)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'DBALDOVINO'
,p_last_upd_yyyymmddhh24miss=>'20250922130721'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(70437425387026817)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>90
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(139504706740284164)
,p_plug_name=>'Flujo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'&P24_VLDAR_USRIO.'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(139544148511476761)
,p_plug_name=>'Tramite'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(11253709282140211)
,p_plug_name=>'Adjuntos Respuesta'
,p_parent_plug_id=>wwv_flow_api.id(139544148511476761)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>110
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P24_RSPTA_BTON is not null  and :P24_VLDAR_USRIO = ''true''',
'and :P24_ID_RVSION_TREA is not null'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(11253801347140212)
,p_plug_name=>'Documentos'
,p_region_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(11253709282140211)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71814488075951563)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.id_qja_rclmo_adjnto',
'        , a.file_name',
'        , a.obsrvcion',
'        , b.nmbre_trcro',
'        , a.fcha_dgta',
'        , 1 descargar',
'        , 2 ver',
'     from pq_g_quejas_reclamo_adjunto a',
'left join v_sg_g_usuarios b on b.id_usrio = a.id_usrio',
'    where a.id_qja_rclmo    =  :P24_ID_QJA_RCLMO',
'    and a.actvo = ''S'''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(11254186868140215)
,p_name=>'ID_QJA_RCLMO_ADJNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_QJA_RCLMO_ADJNTO'
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
 p_id=>wwv_flow_api.id(11254231580140216)
,p_name=>'FILE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FILE_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Adjunto'
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
 p_id=>wwv_flow_api.id(11254318688140217)
,p_name=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(11254414762140218)
,p_name=>'DESCARGAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCARGAR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue;" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0"><span class="fa fa-cloud-download"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=&APP_ID.:24:&SESSION.:DESCARGAR_ADJUNTO:&DEBUG.:RP:P24_ID_QJA_RCLMO_ADJNTO:&ID_QJA_RCLMO_ADJNTO.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(11254519285140219)
,p_name=>'VER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VER'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue;" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0"><span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_CLAVE_PRIMARIA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_VALOR:PQ_G_QUEJAS_RECLAMO_ADJUNTO,ID_QJA_RCLMO_ADJNTO,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,&ID_QJA_RCLMO_ADJ'
||'NTO.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(11254962201140223)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(11255015559140224)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(13977511204057013)
,p_name=>'NMBRE_TRCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TRCRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Usuario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(13977698771057014)
,p_name=>'FCHA_DGTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_DGTA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY HH:MIPM'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(11254019345140214)
,p_internal_uid=>11254019345140214
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
 p_id=>wwv_flow_api.id(11269098615567857)
,p_interactive_grid_id=>wwv_flow_api.id(11254019345140214)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(11269145829567857)
,p_report_id=>wwv_flow_api.id(11269098615567857)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11269689356567858)
,p_view_id=>wwv_flow_api.id(11269145829567857)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(11254186868140215)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11270171424567860)
,p_view_id=>wwv_flow_api.id(11269145829567857)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(11254231580140216)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11270614333567862)
,p_view_id=>wwv_flow_api.id(11269145829567857)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(11254318688140217)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11271108371567863)
,p_view_id=>wwv_flow_api.id(11269145829567857)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(11254414762140218)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70.875
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11271608535567864)
,p_view_id=>wwv_flow_api.id(11269145829567857)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(11254519285140219)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>92.025
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11277533523585586)
,p_view_id=>wwv_flow_api.id(11269145829567857)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(11254962201140223)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14036221852751667)
,p_view_id=>wwv_flow_api.id(11269145829567857)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(13977511204057013)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14036747456751668)
,p_view_id=>wwv_flow_api.id(11269145829567857)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(13977698771057014)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(47329999510377715)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(139544148511476761)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71814488075951563)
,p_plug_display_sequence=>120
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.id_qja_rclmo_adjnto',
'        , a.file_name',
'        , a.obsrvcion',
'        , b.nmbre_trcro',
'        , a.fcha_dgta',
'        , 1 descargar',
'        , 2 ver',
'     from pq_g_quejas_reclamo_adjunto   a',
'     left join v_sg_g_usuarios b on b.id_usrio = a.id_usrio',
'    where a.id_qja_rclmo    =  :P24_ID_QJA_RCLMO ',
'    and a.actvo = ''S'''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>':P24_RSPTA_BTON is not null  and :P24_VLDAR_USRIO = ''true'''
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
,p_plug_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'     from pq_g_quejas_reclamo_adjunto    ',
'    where id_qja_rclmo    =  :P2025003_ID_QJA_RCLMO'))
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(47330114122377716)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'JPRADA'
,p_internal_uid=>47330114122377716
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14575771127910331)
,p_db_column_name=>'ID_QJA_RCLMO_ADJNTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Queja Reclamo Adjunto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14576101287910333)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14576548113910333)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14576951839910334)
,p_db_column_name=>'DESCARGAR'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'DOWNLOAD:PQ_G_QUEJAS_RECLAMO_ADJUNTO:FILE_BLOB:ID_QJA_RCLMO_ADJNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class=" fa fa-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14577352779910334)
,p_db_column_name=>'VER'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Ver'
,p_column_link=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_CLAVE_PRIMARIA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_VALOR:PQ_G_QUEJAS_RECLAMO_ADJUNTO,ID_QJA_RCLMO_ADJNTO,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,#ID_QJA_RCLMO_ADJ'
||'NTO#'
,p_column_linktext=>'<center><span class=" fa fa-eye fa-1x fa-spin"></span></center>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14577703329910334)
,p_db_column_name=>'NMBRE_TRCRO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Usuario'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14578187343910334)
,p_db_column_name=>'FCHA_DGTA'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Fecha'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY HH:MIPM'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(47339875676382116)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'145785'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_TRCRO:ID_QJA_RCLMO_ADJNTO:FILE_NAME:FCHA_DGTA:OBSRVCION:DESCARGAR:VER:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(94466263273649993)
,p_plug_name=>'Cargar Documentos'
,p_region_name=>'CargarDocumentos'
,p_parent_plug_id=>wwv_flow_api.id(139544148511476761)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>100
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_footer=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<div class="row">',
'        <div  class="col col-12" style="text-align: right !important;">',
'            <font size="1">Los campos marcados con </font><font size="2" color="red">*</font><font size="1"> son obligatorios</font>',
'        </div>',
'</div>'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(94910535186723196)
,p_plug_name=>'Documentos Cargados Coleccion'
,p_parent_plug_id=>wwv_flow_api.id(94466263273649993)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71814488075951563)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select  seq_id',
'        , blob001 file_blob',
'        , c002 file_name',
'        , c001 obsrvcion ',
'      ----  case',
'          --  when dbms_lob.getlength(blob001) > 0 then ''Cargado''',
'       --     else  ''Pendiente''',
'      --  end Estado ',
'        , 1 eliminar',
'     from  apex_collections c',
'     where collection_name = ''DOCUMENTOS''',
'    ',
' /* select id_mtvo_dcmnto',
'        , dscrpcion_dcmnto',
'        , blob001 file_blob',
'        , c002 file_name',
'        , c001 obsrvcion,',
'        case',
'            when dbms_lob.getlength(blob001) > 0 then ''Cargado''',
'            else  ''Pendiente''',
'        end Estado,',
'        m.dscrpcion_indcdor_oblgtrio       ',
'     from v_pq_d_motivos_documento m',
'left join apex_collections c',
'       on id_mtvo_dcmnto = n001    ',
'      and collection_name = ''DOCUMENTOS''',
'    where id_mtvo = :P24_ID_MTVO',
'     and m.actvo =''S''*/'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select  seq_id',
'        , blob001 file_blob',
'        , c002 file_name',
'        , c001 obsrvcion ',
'        , 1 eliminar',
'     from  apex_collections c',
'     where collection_name = ''DOCUMENTOS'''))
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
 p_id=>wwv_flow_api.id(94912393899723214)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'MCARO'
,p_internal_uid=>94912393899723214
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21680628246762475)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21680976182762475)
,p_db_column_name=>'FILE_BLOB'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Archivo'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21682136337762480)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21698126418900611)
,p_db_column_name=>'ELIMINAR'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Eliminar'
,p_column_link=>'f?p=&APP_ID.:24:&SESSION.:ELIMINAR_ADJUNTO:&DEBUG.:RP:P24_SEQ_ID:#SEQ_ID#'
,p_column_linktext=>'<span aria-hidden="true" class="fa fa-trash" style="color: red;" ></span>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21722586155827401)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(95016042320016003)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'216829'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'OBSRVCION:FILE_NAME:ELIMINAR:'
,p_sort_column_1=>'DSCRPCION_INDCDOR_OBLGTRIO'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(222240867984685931)
,p_plug_name=>'Documentos'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(287053308397037126)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(222240867984685931)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71814488075951563)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.id_dcmnto',
'     , d.id_slctud',
'     , d.file_name ',
'     , d.obsrvcion',
'     , md.dscrpcion_dcmnto',
'     , d.fcha',
'     , case when d.actvo = ''S'' then',
'         ''<span style="color:green;"aria-hidden="true" class="fa fa-check-square"></span>''',
'         else',
'         ''<span style="color:red;"class="fa fa-times-square" aria-hidden="true"></span>''',
'         end actvo',
'  from pq_g_documentos d',
'  join v_pq_d_motivos_documento md',
'    on d.id_mtvo_dcmnto = md.id_mtvo_dcmnto',
'    where id_slctud = :P24_ID_SLCTUD '))
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
 p_id=>wwv_flow_api.id(214291549547156631)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'MCARO'
,p_internal_uid=>214291549547156631
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(69829402964781308)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(69829839304781326)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(69830276207781326)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'<p></p>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTOS:FILE_BLOB:ID_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(69830678405781327)
,p_db_column_name=>'ID_SLCTUD'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Id Slctud'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(69831029616781328)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(69831450839781328)
,p_db_column_name=>'ACTVO'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>'Aceptado'
,p_column_html_expression=>'#ACTVO#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(69831825621781328)
,p_db_column_name=>'FCHA'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Fecha Subida'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(214305016833162898)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'698322'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_DCMNTO:OBSRVCION:FCHA:FILE_NAME:ID_DCMNTO:ACTVO:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(287039955175029596)
,p_plug_name=>'Tabulador'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(71822304308951566)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(287044055766034250)
,p_plug_name=>'Datos del Gestor'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(287048743008035433)
,p_plug_name=>'Datos del Solicitante'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(287292309397358638)
,p_plug_name=>'Datos Solicitud'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(70478549806737701)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(70437425387026817)
,p_button_name=>'btn_rgrsar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:RP,12::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(69832978440781350)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(70437425387026817)
,p_button_name=>'BTN_RSPSTA'
,p_button_static_id=>'BTN_RSPSTA'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar Respuesta'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P24_RSPTA_BTON is null  and :P24_VLDAR_USRIO = ''true'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
end;
/
begin
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9889718009240001)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(70437425387026817)
,p_button_name=>'BTN_ACTLZA_RSPSTA'
,p_button_static_id=>'BTN_ACTLZA_RSPSTA'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Actualiza Respuesta'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P24_RSPTA_BTON is not null  and :P24_VLDAR_USRIO = ''true''',
'and :P24_ID_RVSION_TREA is not null'))
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10529247776580514)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(70437425387026817)
,p_button_name=>'BTN_VER_RSPSTA'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_image_alt=>unistr('<b>Hist\00F3rico Respuesta</b>')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:2025004:&SESSION.::&DEBUG.:RP:P2025004_ID_INSTNCIA_FLJO,P2025004_ID_QJA_RCLMO:&P24_ID_INSTNCIA_FLJO.,&P24_ID_QJA_RCLMO.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P24_VLDAR_USRIO = ''true''',
'and :P24_ID_RVSION_TREA is not null'))
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-font-size-increase'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(11148114211192504)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(70437425387026817)
,p_button_name=>'BTN_ADJNTO_OBSRVCION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_image_alt=>unistr('<b>Descargar Observaci\00F3n</b>')
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P24_ID_RVSION_TREA is not null and :P24_FILE_NAME is not null',
'and :P24_VLDAR_USRIO = ''true'''))
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-file-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(11289419790727304)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(70437425387026817)
,p_button_name=>'BTN_ACTLZAR_ADJNTO'
,p_button_static_id=>'procesar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Actualizar Adjunto'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P24_RSPTA_BTON is not null  and :P24_VLDAR_USRIO = ''true''',
'and :P24_ID_RVSION_TREA is not null'))
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13976437867057002)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(70437425387026817)
,p_button_name=>'BTN_NVO_ADJNTO'
,p_button_static_id=>'nuevoAdjunto'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Adjunto'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P24_VLDAR_USRIO = ''true''',
'and :P24_ID_RVSION_TREA is not null'))
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-file-new'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(21675029438762429)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(94466263273649993)
,p_button_name=>'BTN_AGRGAR'
,p_button_static_id=>'BTN_AGRGAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar'
,p_button_position=>'BODY'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de cargar este archivo?'',''BTN_AGRGAR'')'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>5
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(21674685179762392)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(94466263273649993)
,p_button_name=>'BTN_SCANNER'
,p_button_static_id=>'BTN_SCANNER'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Escaner'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(69828703647781278)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(222240867984685931)
,p_button_name=>'BTN_ACTLZAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Actualizar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:15:&SESSION.:BORRAR:&DEBUG.:RP,15:P15_ID_SLCTUD:&P24_ID_SLCTUD.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.id_dcmnto ',
'  from pq_g_documentos d ',
' where id_slctud = :P24_ID_SLCTUD ',
'   and indcdor_actlzar = ''S'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-external-link-square'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(21688553866782707)
,p_branch_name=>'Go To Page 909'
,p_branch_action=>'f?p=50000:909:&SESSION.::&DEBUG.:RP,909:P909_APP_ID,P909_APP_PAGE_ID:&APP_ID.,&APP_PAGE_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(21674685179762392)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(12499906397992903)
,p_branch_name=>'Imprimir'
,p_branch_action=>'f?p=&APP_ID.:24:&SESSION.:Imprimir:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(11148114211192504)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5727263423848201)
,p_name=>'P24_ID_INSTNCIA_FLJO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(139504706740284164)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9896486171324001)
,p_name=>'P24_ID_RVSION_TREA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(139544148511476761)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11148354778192506)
,p_name=>'P24_FILE_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(139544148511476761)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11289772002727307)
,p_name=>'P24_ARCHVOS_ADJNTOS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(11253709282140211)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14567455557853501)
,p_name=>'P24_ID_QJA_RCLMO_ADJNTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(11253709282140211)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21675429348762432)
,p_name=>'P24_ID_MTVO_DCMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(94466263273649993)
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'Seleccione de la lista el tipo de documento que se requiere adjuntar para la solicitud.'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21676382477762441)
,p_name=>'P24_OPCION_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(94466263273649993)
,p_item_default=>'F'
,p_prompt=>unistr('Opci\00F3n')
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Explorador de Archivos;F,Escaner;E'
,p_grid_column=>2
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione una de las opciones para adjuntar el documento a la solicitud.'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21677220543762441)
,p_name=>'P24_FILE_BLOB'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(94466263273649993)
,p_prompt=>'Archivo'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Habilita ventana de b\00FAsqueda para ingresar el documento adjunto correspondiente.')
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21678117568762442)
,p_name=>'P24_OBSRVCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(94466263273649993)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>40
,p_cMaxlength=>99
,p_cHeight=>2
,p_colspan=>10
,p_grid_column=>2
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la observaci\00F3n correspondiente a la solicitud.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21697966799900609)
,p_name=>'P24_INDCDOR_RSPSTA_ADJNTO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(287292309397358638)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21698208045900612)
,p_name=>'P24_SEQ_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(94910535186723196)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21815058356343702)
,p_name=>'P24_RSPTA_BTON'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(139544148511476761)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69814785807781240)
,p_name=>'P24_ID_QJA_RCLMO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(287292309397358638)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69815545634781250)
,p_name=>'P24_ID_PRSNTCION_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(287292309397358638)
,p_prompt=>unistr('Tipo de Presentaci\00F3n ')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_prsntcion_tpo ',
'  from pq_d_presentaciones_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69815952627781250)
,p_name=>'P24_ID_TPO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(287292309397358638)
,p_prompt=>'Tipo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_tpo',
'  from pq_d_tipos',
'  where cdgo_clnte = :F_CDGO_CLNTE;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69816343260781250)
,p_name=>'P24_ID_MTVO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(287292309397358638)
,p_prompt=>'Motivo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_mtvo ',
'  from pq_d_motivos',
' where cdgo_clnte = :f_cdgo_clnte',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69816718167781250)
,p_name=>'P24_ID_IMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(287292309397358638)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69817187603781250)
,p_name=>'P24_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(287292309397358638)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P24_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69817591274781251)
,p_name=>'P24_IDNTFCCION_SJTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(287292309397358638)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69817917589781251)
,p_name=>'P24_ID_SLCTUD'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(287292309397358638)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69818365288781253)
,p_name=>'P24_NMRO_RDCDO_DSPLAY'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(287292309397358638)
,p_prompt=>unistr('N\00FAmero Radicado')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69818793391781253)
,p_name=>'P24_FCHA_RDCDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(287292309397358638)
,p_prompt=>'Fecha Radicado'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69819171381781255)
,p_name=>'P24_MNSJE_RSPSTA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(287292309397358638)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69819846850781256)
,p_name=>'P24_ID_RDCDOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(287044055766034250)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69820247432781256)
,p_name=>'P24_CDGO_IDNTFCCION_TPO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(287044055766034250)
,p_prompt=>unistr('Tipo Identificaci\00F3n ')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IDENTIFICACIONES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_IDNTFCCION_TPO as d,',
'       CDGO_IDNTFCCION_TPO as r',
'  from DF_S_IDENTIFICACIONES_TIPO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69820645593781256)
,p_name=>'P24_IDNTFCCION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(287044055766034250)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69821088843781258)
,p_name=>'P24_PRMER_NMBRE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(287044055766034250)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69821441639781258)
,p_name=>'P24_SGNDO_NMBRE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(287044055766034250)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69821869930781258)
,p_name=>'P24_PRMER_APLLDO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(287044055766034250)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69822207320781258)
,p_name=>'P24_SGNDO_APLLDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(287044055766034250)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69822981565781259)
,p_name=>'P24_CDGO_RSPNSBLE_TPO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(287048743008035433)
,p_prompt=>'Tipo Radicador'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_rspnsble_tpo',
'     , cdgo_rspnsble_tpo ',
'  from df_s_responsables_tipo'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69823355695781259)
,p_name=>'P24_CDGO_IDNTFCCION_TPO_S'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(287048743008035433)
,p_prompt=>unistr('Tipo Identificaci\00F3n ')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IDENTIFICACIONES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_IDNTFCCION_TPO as d,',
'       CDGO_IDNTFCCION_TPO as r',
'  from DF_S_IDENTIFICACIONES_TIPO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69823710642781260)
,p_name=>'P24_IDNTFCCION_S'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(287048743008035433)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69824125449781260)
,p_name=>'P24_PRMER_NMBRE_S'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(287048743008035433)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69824598802781268)
,p_name=>'P24_SGNDO_NMBRE_S'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(287048743008035433)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69824854910781268)
,p_name=>'P24_PRMER_APLLDO_S'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(287048743008035433)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69825232743781269)
,p_name=>'P24_SGNDO_APLLDO_S'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(287048743008035433)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69825668877781269)
,p_name=>'P24_ID_PAIS_NTFCCION_S'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(287048743008035433)
,p_prompt=>unistr('Pa\00EDs')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_PAIS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_pais as d,',
'       id_pais  as r',
'  from df_s_paises',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69826006857781269)
,p_name=>'P24_ID_DPRTMNTO_NTFCCION_S'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(287048743008035433)
,p_prompt=>'Departamento'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_dprtmnto',
'     , id_dprtmnto ',
'  from df_s_departamentos ',
' where id_pais = :P24_ID_PAIS_NTFCCION_S;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P24_ID_PAIS_NTFCCION_S'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69826499929781269)
,p_name=>'P24_ID_MNCPIO_NTFCCION_S'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(287048743008035433)
,p_prompt=>'Municipio'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_mncpio',
'     , id_mncpio ',
'  from df_s_municipios ',
' where id_dprtmnto = :P24_ID_DPRTMNTO_NTFCCION_S'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P24_ID_DPRTMNTO_NTFCCION_S'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69826876092781273)
,p_name=>'P24_DRCCION_NTFCCION_S'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(287048743008035433)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>100
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69827273902781273)
,p_name=>'P24_EMAIL_S'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(287048743008035433)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69827667163781274)
,p_name=>'P24_TLFNO_S'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(287048743008035433)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69828007015781274)
,p_name=>'P24_CLLAR_S'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(287048743008035433)
,p_prompt=>'Celular'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70436647210026809)
,p_name=>'P24_OBSRVCION_S'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(287292309397358638)
,p_prompt=>unistr('Observaci\00F3n de la solicitud')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70436747288026810)
,p_name=>'P24_VLDAR_TRBTO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(287292309397358638)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70437541711026818)
,p_name=>'P24_RSPSTA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(139544148511476761)
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_cSize=>28
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(71867060529951592)
,p_item_template_options=>'#DEFAULT#'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (options){',
'    options.uiColor = ''#f1f1f1'';',
'    options.skin = ''office2013,skins/office2013/'';',
'    options.height = 200;',
'    options.resize_enabled = false',
'}'))
,p_attribute_02=>'Full'
,p_attribute_03=>'Y'
,p_attribute_05=>'top'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70437648539026819)
,p_name=>'P24_VLDAR_USRIO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(287292309397358638)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(21698092891900610)
,p_validation_name=>'Validar Documentos adjuntos segun mortivo'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select 1  ',
'    from   apex_collections ',
'    where collection_name = ''DOCUMENTOS''',
'        and  n001 is null;'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'Debe subir al menos un documento'
,p_validation_condition=>'P24_INDCDOR_RSPSTA_ADJNTO'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(69832978440781350)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(21722639750827402)
,p_validation_name=>'Adjunto no Nulo'
,p_validation_sequence=>20
,p_validation=>'P24_FILE_BLOB'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar un adjunto'
,p_when_button_pressed=>wwv_flow_api.id(21675029438762429)
,p_associated_item=>wwv_flow_api.id(21677220543762441)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(12500031895992904)
,p_validation_name=>'Item no nulo'
,p_validation_sequence=>30
,p_validation=>':P24_RSPSTA is not null'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Digitar un valor'
,p_validation_condition=>'BTN_RSPSTA, BTN_ACTLZA_RSPSTA'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(70437541711026818)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(69916481826944402)
,p_name=>unistr('al hacer clic en el bot\00F3n respuesta')
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(69832978440781350)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(69916526834944403)
,p_event_id=>wwv_flow_api.id(69916481826944402)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.confirm(''\00BFEst\00E1 seguro que desea registrar la respuesta?'', async function (ok) {'),
'    if (ok) {',
'        let popup = apex.widget.waitPopup();',
'        apex.message.clearErrors();',
'        try {',
'            let rs = await apex.server.process(''registrarRespuesta'', {',
'                pageItems: ''#P24_ID_QJA_RCLMO'',',
'                f01: CKEDITOR.instances.P24_RSPSTA.getData()',
'            });',
'            ',
'            if (rs.type === ''OK'') { ',
'                apex.item("BTN_RSPSTA").hide();',
'                //apex.message.showPageSuccess(rs.msg); ',
'                apex.submit();',
'                apex.message.showPageSuccess(rs.msg); ',
'            } else {',
'                apex.message.showErrors([{',
'                    type: "error",',
'                    location: ["page"],',
'                    message: rs.msg,',
'                    unsafe: false',
'                }]);',
'            }',
'',
'        } catch (error) {',
'            console.log(error);',
'        } finally {',
'            popup.remove();',
'        }',
'',
'    }',
'})'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(70436854878026811)
,p_name=>'al cambiar el tipo'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P24_ID_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70436907277026812)
,p_event_id=>wwv_flow_api.id(70436854878026811)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select vldar_trbto',
'      into :P24_VLDAR_TRBTO',
'      from pq_d_tipos ',
'     where id_tpo = :P24_ID_TPO; ',
'exception',
'    when others then',
'        :P24_VLDAR_TRBTO := null;',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(70437197011026814)
,p_name=>'al cambiar validar tributo'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P24_VLDAR_TRBTO'
,p_condition_element=>'P24_VLDAR_TRBTO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70437286340026815)
,p_event_id=>wwv_flow_api.id(70437197011026814)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P24_ID_IMPSTO,P24_ID_IMPSTO_SBMPSTO,P24_IDNTFCCION_SJTO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70437345307026816)
,p_event_id=>wwv_flow_api.id(70437197011026814)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P24_ID_IMPSTO,P24_ID_IMPSTO_SBMPSTO,P24_IDNTFCCION_SJTO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21688097399782702)
,p_name=>'al cerrar la ventana modal'
,p_event_sequence=>40
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21688153367782703)
,p_event_id=>wwv_flow_api.id(21688097399782702)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_blob         blob;',
'     v_seq          varchar2(4000);',
'     v_filename     varchar2(4000);',
'     v_mime_type    varchar2(4000);     ',
'     ',
'     ',
'begin',
'   --  delete muerto;commit;',
'    begin',
'        select blob001,',
'               c002,',
'               c003',
'          into v_blob,',
'               v_filename,',
'               v_mime_type',
'          from apex_collections',
'         where collection_name = ''SCANNER'';',
'    exception ',
'        when no_data_found then',
'            v_blob := null;  ',
'    end;',
'    ',
'   ',
'     ',
'    if v_blob is not null then',
'    ',
'        if (not apex_collection.collection_exists(p_collection_name => ''DOCUMENTOS'') ) then',
'            apex_collection.create_collection( p_collection_name => ''DOCUMENTOS'');',
'        end if;',
'',
'        begin',
'            select seq_id',
'              into v_seq',
'              from apex_collections',
'             where collection_name = ''DOCUMENTOS''',
'               --and n001 = :P24_ID_MTVO_DCMNTO;',
'               and c002 =  v_filename;',
'            ',
'            apex_collection.update_member( p_collection_name => ''DOCUMENTOS''',
'                                          , p_seq  => v_seq  ',
'                                          --, p_c001 =>  :P24_OBSRVCION',
'                                          , p_c002 => v_filename',
'                                          , p_c003 => v_mime_type',
'                                        --  , p_n001 => :P24_ID_MTVO_DCMNTO',
'                                          , p_blob001 => v_blob );        ',
'',
'             -- insert into muerto (v_001, v_002) values (v_filename, v_filename);',
'             -- commit;',
' ',
'        exception ',
'            when others then',
'                apex_collection.add_member( p_collection_name => ''DOCUMENTOS''',
'                                          , p_c001 => :P24_OBSRVCION',
'                                          , p_c002 => v_filename',
'                                          , p_c003 => v_mime_type',
'                                         -- , p_n001 => :P24_ID_MTVO_DCMNTO',
'                                          , p_blob001 => v_blob );    ',
'             -- insert into muerto (v_001, v_002) values (v_filename, v_filename);',
'            --  commit;',
' ',
'        end;       ',
'    end if;',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21688487049782706)
,p_event_id=>wwv_flow_api.id(21688097399782702)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(287053308397037126)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21697112564900601)
,p_name=>'Al cambiar la opcion de archivo'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P24_OPCION_1'
,p_condition_element=>'P24_OPCION_1'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'E'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21697241248900602)
,p_event_id=>wwv_flow_api.id(21697112564900601)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P24_FILE_BLOB'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21697546141900605)
,p_event_id=>wwv_flow_api.id(21697112564900601)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P24_FILE_BLOB'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21697319532900603)
,p_event_id=>wwv_flow_api.id(21697112564900601)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(21675029438762429)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21697729629900607)
,p_event_id=>wwv_flow_api.id(21697112564900601)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(21675029438762429)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21697467808900604)
,p_event_id=>wwv_flow_api.id(21697112564900601)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(21674685179762392)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21697630443900606)
,p_event_id=>wwv_flow_api.id(21697112564900601)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(21674685179762392)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9889898028240002)
,p_name=>unistr('al hacer clic en el bot\00F3n de actualizar respuesta')
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(9889718009240001)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9889984360240003)
,p_event_id=>wwv_flow_api.id(9889898028240002)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.confirm(''\00BFEst\00E1 seguro que desea actualizar la respuesta?'', async function (ok) {'),
'    if (ok) {',
'        let popup = apex.widget.waitPopup();',
'        apex.message.clearErrors();',
'        try {',
'            let rs = await apex.server.process(''ActualizaRespuesta'', {',
'                pageItems: ''#P24_ID_QJA_RCLMO'',',
'                f01: CKEDITOR.instances.P24_RSPSTA.getData()',
'            });',
'            ',
'            if (rs.type === ''OK'') { ',
'                apex.item("BTN_ACTLZA_RSPSTA").hide();',
'                apex.message.showPageSuccess(rs.msg); ',
'                apex.submit();',
'                //apex.message.showPageSuccess(rs.msg); ',
'            } else {',
'                apex.message.showErrors([{',
'                    type: "error",',
'                    location: ["page"],',
'                    message: rs.msg,',
'                    unsafe: false',
'                }]);',
'            }',
'',
'        } catch (error) {',
'            console.log(error);',
'        } finally {',
'            popup.remove();',
'        }',
'',
'    }',
'})'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(11289591737727305)
,p_name=>'Al seleccionar Registros'
,p_event_sequence=>70
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(11253801347140212)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11289600262727306)
,p_event_id=>wwv_flow_api.id(11289591737727305)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var region = apex.region("Documentos");',
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
'            var value = model.getValue(record, "ID_QJA_RCLMO_ADJNTO");',
'            concatenatedValues.push(value);',
'        });',
'',
'        // Concatenar los valores con ":" como separador',
'        var resultString = concatenatedValues.join(",");',
'',
'        apex.item("P24_ARCHVOS_ADJNTOS").setValue(resultString);',
'',
unistr('        // Habilitar el bot\00F3n "autorizar"'),
unistr('        $("#procesar").prop("disabled", false);  // Habilitar el bot\00F3n'),
unistr('        $("#nuevoAdjunto").prop("disabled", true);  // deshabilitar el bot\00F3n'),
'',
'    } else {',
'        // Si no hay registros seleccionados, puedes limpiar el item',
'        apex.item("P24_ARCHVOS_ADJNTOS").setValue("");',
'',
'        console.log("No se seleccionaron registros.");',
'',
unistr('        // Deshabilitar el bot\00F3n "autorizar"'),
unistr('        $("#procesar").prop("disabled", true);  // Deshabilitar el bot\00F3n'),
unistr('         $("#nuevoAdjunto").prop("disabled", false);  // Habilitar el bot\00F3n'),
'    }',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(11289968581727309)
,p_name=>unistr('al hacer clic en el bot\00F3n de actualizar adjunto')
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(11289419790727304)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11290055930727310)
,p_event_id=>wwv_flow_api.id(11289968581727309)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.confirm(''\00BFEst\00E1 seguro que desea actualizar la respuesta?'', async function (ok) {'),
'    if (ok) {',
'        let popup = apex.widget.waitPopup();',
'        apex.message.clearErrors();',
'        try {',
'            let rs = await apex.server.process(''ActualizarAdjunto'', {',
'                pageItems: ''#P24_ID_QJA_RCLMO,#P24_ARCHVOS_ADJNTOS''',
'            });',
'            ',
'            if (rs.type === ''OK'') { ',
'                apex.item("BTN_ACTLZAR_ADJNTO").hide();',
'                apex.message.showPageSuccess(rs.msg); ',
'                apex.submit();',
'            } else {',
'                apex.message.showErrors([{',
'                    type: "error",',
'                    location: ["page"],',
'                    message: rs.msg,',
'                    unsafe: false',
'                }]);',
'            }',
'',
'        } catch (error) {',
'            console.log(error);',
'        } finally {',
'            popup.remove();',
'        }',
'',
'    }',
'})'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13977397596057011)
,p_name=>unistr('Al hacer clic en el bot\00F3n de agregar nuevo adjunto')
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(13976437867057002)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13977440785057012)
,p_event_id=>wwv_flow_api.id(13977397596057011)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.confirm(''\00BFEst\00E1 seguro que desea registrar un nuevo adjunto?'', async function (ok) {'),
'    if (ok) {',
'        let popup = apex.widget.waitPopup();',
'        apex.message.clearErrors();',
'        try {',
'            let rs = await apex.server.process(''RegistrarNuevoAdjunto'', {',
'                pageItems: ''#P24_ID_QJA_RCLMO''',
'            });',
'            ',
'            if (rs.type === ''OK'') { ',
'                //apex.item("BTN_ACTLZAR_ADJNTO").hide();',
'                apex.message.showPageSuccess(rs.msg); ',
'                apex.submit();',
'            } else {',
'                apex.message.showErrors([{',
'                    type: "error",',
'                    location: ["page"],',
'                    message: rs.msg,',
'                    unsafe: false',
'                }]);',
'            }',
'',
'        } catch (error) {',
'            console.log(error);',
'        } finally {',
'            popup.remove();',
'        }',
'',
'    }',
'})'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5749085102381787)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'insertar la queja o reclamo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_id_tpo             number;',
'   v_id_slctud          number;',
'   v_id_instncia_fljo   number; ',
'   v_cnteo_rspsta		number;',
'',
'begin',
'',
'   begin       ',
'        select  id_qja_rclmo',
'        into :P24_ID_QJA_RCLMO',
'        from pq_g_quejas_reclamo',
'        where id_instncia_fljo = :F_ID_INSTNCIA_FLJO;',
'        ',
'        --insert into muerto(n_001, v_001) values (101010,:P24_ID_QJA_RCLMO ); commit;',
'       ',
'   exception',
'      when no_data_found then',
'         begin',
'            select id_tpo',
'                 , id_slctud',
'                 , id_instncia_fljo',
'              into v_id_tpo',
'                 , v_id_slctud',
'                 , v_id_instncia_fljo',
'              from v_pq_g_solicitudes',
'             where id_instncia_fljo_gnrdo = :F_ID_INSTNCIA_FLJO;',
'			 ',
'				begin  ',
'					--insert into muerto(n_001, v_001) values (101011,:P24_ID_QJA_RCLMO ); commit;',
'					',
'					insert into pq_g_quejas_reclamo( cdgo_clnte           , id_tpo     , id_instncia_fljo',
'												   , id_instncia_fljo_pdre, id_slctud  )',
'											 values( :F_CDGO_CLNTE        , v_id_tpo   , :F_ID_INSTNCIA_FLJO',
'												   , v_id_instncia_fljo   , v_id_slctud)',
'										   returning id_qja_rclmo ',
'												into :P24_ID_QJA_RCLMO; commit;',
'												',
'					 --insert into muerto(n_001, v_001) values (101012,:P24_ID_QJA_RCLMO ); commit;',
'					 ',
'				exception',
'					when others then ',
'					:P24_ID_QJA_RCLMO := null;',
'        end;',
'			',
'         exception',
'            when others then ',
'               v_id_tpo             := null;',
'               v_id_slctud          := null;',
'               v_id_instncia_fljo   := null;',
'         end;',
'',
'     ',
'     ---- Agregado el 25/07/2024',
unistr('	/* Se adiciona validaci\00F3n para casos donde se crean dos o m\00E1s registros '),
'	   de quejas para una misma instancia_flujo. ',
unistr('	   Valicdaci\00F3n realiza para dar soluci\00F3n al requerimiento Req0025405.'),
'	*/',
'    when others then',
'        begin',
'		',
'			select count(id_qja_rclmo) ',
'			into v_cnteo_rspsta ',
'			from pq_g_quejas_reclamo ',
'			where id_instncia_fljo = :F_ID_INSTNCIA_FLJO and rspsta is not null;',
'',
'			',
'			if v_cnteo_rspsta = 0 then',
'			',
'				select  max(id_qja_rclmo) as id_qja_rclmo',
'				into :P24_ID_QJA_RCLMO',
'				from pq_g_quejas_reclamo',
'				where id_instncia_fljo = :F_ID_INSTNCIA_FLJO;',
'			',
'			else ',
'			',
'				select  max(id_qja_rclmo) as id_qja_rclmo',
'				into :P24_ID_QJA_RCLMO',
'				from pq_g_quejas_reclamo',
'				where id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'				and rspsta is not null;',
'			',
'			end if;',
'			',
'			',
'			--insert into muerto(n_001, v_001) values (101013,:P24_ID_QJA_RCLMO ); commit;',
'        ',
'        exception',
'            when others then ',
'            :P24_ID_QJA_RCLMO := null;',
'         ',
'        end;',
'         ',
'   end;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69834478593781375)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'cargar datos solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_tpo',
'     , id_mtvo',
'     , id_impsto',
'     , id_impsto_sbmpsto',
'     , idntfccion',
'     , id_rdcdor',
'     , id_slctud',
'     , nmro_rdcdo_dsplay',
'     , fcha_rdcdo',
'     , id_prsntcion_tpo ',
'  into :P24_ID_TPO',
'     , :P24_ID_MTVO',
'     , :P24_ID_IMPSTO',
'     , :P24_ID_IMPSTO_SBMPSTO',
'     , :P24_IDNTFCCION_SJTO',
'     , :P24_ID_RDCDOR',
'     , :P24_ID_SLCTUD',
'     , :P24_NMRO_RDCDO_DSPLAY',
'     , :P24_FCHA_RDCDO',
'     , :P24_ID_PRSNTCION_TPO ',
'  from v_pq_g_solicitudes',
'  where id_instncia_fljo_gnrdo = :F_ID_INSTNCIA_FLJO;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69834701016781375)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos Radicador'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_idntfccion_tpo',
'     , idntfccion ',
'     , prmer_nmbre ',
'     , sgndo_nmbre ',
'     , prmer_aplldo ',
'     , sgndo_aplldo',
'  into :P24_CDGO_IDNTFCCION_TPO',
'     , :P24_IDNTFCCION',
'     , :P24_PRMER_NMBRE',
'     , :P24_SGNDO_NMBRE',
'     , :P24_PRMER_APLLDO',
'     , :P24_SGNDO_APLLDO',
'  from pq_g_radicador',
' where id_rdcdor = :P24_ID_RDCDOR;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69835102164781375)
,p_process_sequence=>40
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos del Solicitante'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_rspnsble_tpo',
'     , cdgo_idntfccion_tpo ',
'     , idntfccion ',
'     , prmer_nmbre ',
'     , sgndo_nmbre ',
'     , prmer_aplldo ',
'     , sgndo_aplldo ',
'     , id_pais_ntfccion ',
'     , id_dprtmnto_ntfccion ',
'     , id_mncpio_ntfccion ',
'     , drccion_ntfccion ',
'     , email ',
'     , tlfno ',
'     , cllar',
'  into :P24_CDGO_RSPNSBLE_TPO',
'     , :P24_CDGO_IDNTFCCION_TPO_S ',
'     , :P24_IDNTFCCION_S',
'     , :P24_PRMER_NMBRE_S',
'     , :P24_SGNDO_NMBRE_S ',
'     , :P24_PRMER_APLLDO_S',
'     , :P24_SGNDO_APLLDO_S',
'     , :P24_ID_PAIS_NTFCCION_S',
'     , :P24_ID_DPRTMNTO_NTFCCION_S',
'     , :P24_ID_MNCPIO_NTFCCION_S',
'     , :P24_DRCCION_NTFCCION_S',
'     , :P24_EMAIL_S',
'     , :P24_TLFNO_S',
'     , :P24_CLLAR_S',
'  from pq_g_solicitantes',
' where id_slctud = :P24_ID_SLCTUD;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(70437021786026813)
,p_process_sequence=>50
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Cargar observaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    select obsrvcion ',
'      into :P24_OBSRVCION_S ',
'      from pq_g_solicitudes_obsrvcion ',
'     where id_slctud = :P24_ID_SLCTUD',
'     order by id_slctd_obsrvcion ',
'     fetch first 1 rows only;',
'exception',
'    when others then ',
'        :P24_OBSRVCION_S := null; ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(70437722468026820)
,p_process_sequence=>60
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Usuario'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select ''true''',
'      into :P24_VLDAR_USRIO',
'      from wf_g_instancias_transicion ',
'     where id_instncia_fljo   = :F_ID_INSTNCIA_FLJO',
'       and id_fljo_trea_orgen = :F_ID_FLJO_TREA',
'       and id_usrio =  :F_ID_USRIO',
'       and id_estdo_trnscion in (1,2);',
'exception',
'    when others then',
'        :P24_VLDAR_USRIO := ''false'';',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69835993113781376)
,p_process_sequence=>70
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Insertar la queja o reclamo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'   select id_qja_rclmo',
'     into :P24_ID_QJA_RCLMO',
'     from pq_g_quejas_reclamo',
'    where id_instncia_fljo = :F_ID_INSTNCIA_FLJO;',
'exception',
'    when others then',
'        :P24_ID_QJA_RCLMO := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21687961846782701)
,p_process_sequence=>80
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Borrar Datos de la coleccion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' ',
'if apex_collection.collection_exists(p_collection_name => ''DOCUMENTOS'') then ',
'    apex_collection.delete_collection( p_collection_name => ''DOCUMENTOS'');            ',
'end if;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'PAGELOAD'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21698402062900614)
,p_process_sequence=>90
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar Adjunto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    APEX_COLLECTION.DELETE_MEMBER(',
'        p_collection_name => ''DOCUMENTOS'',',
'        p_seq => :P24_SEQ_ID);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'ELIMINAR_ADJUNTO'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Adjunto Eliminado Exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21814973300343701)
,p_process_sequence=>100
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta Respuesta'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select rspsta',
'    into :P24_RSPTA_BTON',
'from pq_g_quejas_reclamo',
'where  id_slctud = :P24_ID_SLCTUD;',
'*/',
'',
'-- Cambiado el 25/07/2024',
'select rspsta',
'into :P24_RSPTA_BTON',
'from pq_g_quejas_reclamo',
'where  id_slctud = :P24_ID_SLCTUD',
'and id_qja_rclmo = :P24_ID_QJA_RCLMO;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9896541727324002)
,p_process_sequence=>110
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Verificar Revisi\00F3n Observaci\00F3n Flujo')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'select a.id_rvsion_trea, file_name',
'into :P24_ID_RVSION_TREA, :P24_FILE_NAME',
'from pq_g_rvsion_trea_fljo a',
'inner join pq_g_trea_fljo_obsrvcion b on a.id_rvsion_trea = b.id_rvsion_trea',
'where a.cdgo_estdo = ''R'' and a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'order by 1 desc',
'fetch first 1 row only;',
'exception',
'when others then',
':P24_ID_RVSION_TREA := null;',
':P24_FILE_NAME := null;',
'end;',
'',
'',
'',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12499846199992902)
,p_process_sequence=>120
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Imprimir'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_app_id        number         := v(''APP_ID'');',
'    v_app_page_id   number         := v(''APP_PAGE_ID'');',
'    v_file_blob     blob;',
'    v_file_name     varchar2(500);',
'    v_file_mimetype varchar2(200);',
'    v_cdgo_rspsta   number := 0;',
'    v_mnsje_rspsta  varchar2(1000);',
'begin',
unistr('    -- Adjuntar la sesi\00F3n APEX'),
'    apex_session.attach(',
'        p_app_id     => v_app_id,',
'        p_page_id    => v_app_page_id,',
'        p_session_id => v(''APP_SESSION'')',
'    );',
'',
'    -- Obtener el archivo',
'    select b.file_blob, b.file_name, b.file_mimetype',
'      into v_file_blob, v_file_name, v_file_mimetype',
'      from pq_g_rvsion_trea_fljo a',
'      inner join pq_g_trea_fljo_obsrvcion b',
'        on a.id_rvsion_trea = b.id_rvsion_trea',
'     where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'       and a.id_rvsion_trea   = :P24_ID_RVSION_TREA;',
'',
'    -- Cabecera para descarga',
'    htp.init;',
'    owa_util.mime_header(v_file_mimetype, FALSE);',
'    htp.p(''Content-length: '' || dbms_lob.getlength(v_file_blob));',
'    htp.p(''Content-Disposition: attachment; filename="'' || v_file_name || ''"'');',
'    htp.p(''Cache-Control: max-age=0''); ',
'    owa_util.http_header_close;',
'',
'    -- Descargar archivo',
'    wpg_docload.download_file(v_file_blob);',
'    apex_application.stop_apex_engine;',
'',
'exception',
'    when no_data_found then',
unistr('        raise_application_error(-20001, ''No se encontr\00F3 el archivo para descargar.'');'),
'    when others then',
'        if v_cdgo_rspsta <> 0 then ',
'            raise_application_error(-20001, v_mnsje_rspsta);',
'        else',
'            raise;',
'        end if;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Imprimir'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21697821045900608)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Agregar_archivos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_blob blob;  ',
'     v_seq  varchar2(4000);',
'     r_temp_files apex_application_temp_files%rowtype;',
'     v_obsrvcion varchar2(4000);',
'begin',
'    begin',
'        select *',
'          into r_temp_files',
'          from apex_application_temp_files',
'         where name = :P24_FILE_BLOB;',
'    exception ',
'        when no_data_found then',
'            v_blob := null;  ',
'    end;',
'    ',
'    if r_temp_files.filename is not null then',
'    ',
'        if (not apex_collection.collection_exists(p_collection_name => ''DOCUMENTOS'') ) then',
'            apex_collection.create_collection( p_collection_name => ''DOCUMENTOS'');',
'        end if;',
'',
'        begin',
'            select seq_id, c001',
'              into v_seq, v_obsrvcion',
'              from apex_collections',
'             where collection_name = ''DOCUMENTOS''',
'               --and n001 = :P24_ID_MTVO_DCMNTO;',
'               and c002 = r_temp_files.filename;',
'                           ',
'            apex_collection.update_member( p_collection_name => ''DOCUMENTOS''',
'                                          , p_seq  => v_seq  ',
'                                          , p_c001 =>  v_obsrvcion ',
'                                          , p_c002 => r_temp_files.filename',
'                                          , p_c003 => r_temp_files.mime_type',
'                                          , p_n001 => :P24_ID_MTVO_DCMNTO',
'                                          , p_blob001 => r_temp_files.blob_content );        ',
'        exception ',
'            when others then',
'                apex_collection.add_member( p_collection_name => ''DOCUMENTOS''',
'                                          , p_c001 => :P24_OBSRVCION',
'                                          , p_c002 => r_temp_files.filename',
'                                          , p_c003 => r_temp_files.mime_type',
'                                          , p_n001 => :P24_ID_MTVO_DCMNTO',
'                                          , p_blob001 => r_temp_files.blob_content );        ',
'        end;       ',
'    end if;',
'end;'))
,p_process_error_message=>'No se encontro archivo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(21675029438762429)
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21698545825900615)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar los items luego de agregar un adjunto'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P24_FILE_BLOB,P24_SEQ_ID,P24_OBSRVCION'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(21675029438762429)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(11255114241140225)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(11253801347140212)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Documentos - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14567505507853502)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Descargar Adjunto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_object              		        json_object_t := json_object_t();  ',
'     v_pq_g_quejas_reclamo_adjunto      pq_g_quejas_reclamo_adjunto%rowtype;',
'     ',
'begin      ',
'    begin',
'        select *',
'        into v_pq_g_quejas_reclamo_adjunto',
'        from pq_g_quejas_reclamo_adjunto',
'        where id_qja_rclmo_adjnto = :P24_ID_QJA_RCLMO_ADJNTO;',
'    exception',
'        when others then ',
'        null;',
'    end;',
'    ',
'    begin',
'        htp.init;',
'        owa_util.mime_header(v_pq_g_quejas_reclamo_adjunto.file_mimetype, FALSE );',
'        htp.p(''Content-length: '' ||dbms_lob.getlength(v_pq_g_quejas_reclamo_adjunto.file_blob));',
'        htp.p(''Content-Disposition: attachment; filename="'' ||v_pq_g_quejas_reclamo_adjunto.file_name || ''"'' );',
'        htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'        owa_util.http_header_close;',
'        wpg_docload.download_file(v_pq_g_quejas_reclamo_adjunto.file_blob);',
'        apex_application.stop_apex_engine;',
'    exception',
'        when others then ',
'        null;',
'    end;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DESCARGAR_ADJUNTO'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69916324616944401)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'registrarRespuesta'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_rspsta          clob;',
'    v_json_parametros clob;',
'    v_file_blob       blob;',
'    v_count_docs      number := 0;',
'    v_id_qja_rclmo_adjnto     number;',
'begin',
'    apex_json.open_object;',
'    begin',
'        -- Concatenar las respuestas recibidas',
'        for i in 1..apex_application.g_f01.count loop',
'            v_rspsta := v_rspsta || apex_application.g_f01(i);',
'        end loop;',
'',
'        -- Contar archivos cargados',
'        select count(*)',
'          into v_count_docs',
'          from apex_collections',
'         where collection_name = ''DOCUMENTOS'';',
'',
'        -- Obtener un archivo si existe (opcional)',
'        if v_count_docs > 0 then',
'            select blob001',
'              into v_file_blob',
'              from apex_collections',
'             where collection_name = ''DOCUMENTOS''',
'               and rownum = 1;',
'        end if;',
'',
'        --  ambos son obligatorios',
'        if (v_rspsta is null or length(trim(v_rspsta)) = 0) or v_count_docs = 0 then',
'            apex_json.write(''type'', ''ERROR'');',
unistr('            apex_json.write(''msg'', ''\00A1Respuesta y adjunto son obligatorios, por favor intente nuevamente!'');'),
'        else',
'            -- Actualizar respuesta',
'            update pq_g_quejas_reclamo',
'               set rspsta = v_rspsta',
'             where id_qja_rclmo = :P24_ID_QJA_RCLMO;',
'',
'            apex_json.write(''type'', ''OK'');',
unistr('            apex_json.write(''msg'', ''\00A1Respuesta actualizada de forma exitosa!'');'),
'',
'            -- Procesar adjuntos',
'            for c_documentos in (',
'                select c001 obsrvcion,',
'                       c002 filename,',
'                       c003 mime_type,',
'                       blob001 file_blob',
'                  from apex_collections',
'                 where collection_name = ''DOCUMENTOS''',
'            ) loop',
'                begin',
'                    if :P24_RSPTA_BTON is null then',
'                        insert into pq_g_quejas_reclamo_adjunto (',
'                            id_qja_rclmo, file_blob, file_name, file_mimetype, obsrvcion, id_usrio',
'                        ) values (',
'                            :P24_ID_QJA_RCLMO, c_documentos.file_blob,',
'                            c_documentos.filename, c_documentos.mime_type, c_documentos.obsrvcion, :F_ID_USRIO',
'                        )  returning id_qja_rclmo_adjnto into v_id_qja_rclmo_adjnto ;',
'                        ',
'                        update pq_g_quejas_reclamo_adjunto',
'                           set id_qja_rclmo_adjnto_orgnal = v_id_qja_rclmo_adjnto',
'                         where id_qja_rclmo = :P24_ID_QJA_RCLMO',
'                           and id_qja_rclmo_adjnto = v_id_qja_rclmo_adjnto;',
'                           ',
'                           ',
'                    elsif :P24_ID_RVSION_TREA is not null then',
'                        update pq_g_quejas_reclamo_adjunto',
'                           set file_blob     = c_documentos.file_blob,',
'                               file_name     = c_documentos.filename,',
'                               file_mimetype = c_documentos.mime_type,',
'                               obsrvcion     = c_documentos.obsrvcion',
'                         where id_qja_rclmo = :P24_ID_QJA_RCLMO;',
'                    end if;',
'                exception',
'                    when others then',
'                        apex_json.write(''type'', ''ERROR'');',
'                        apex_json.write(''msg'', ''Error al guardar o actualizar el documento'');',
'                        apex_json.write(''sqlerrm'', sqlerrm);',
'                end;',
'            end loop;',
'',
'            commit;',
'',
unistr('            -- Limpiar colecci\00F3n'),
'            if apex_collection.collection_exists(p_collection_name => ''DOCUMENTOS'') then',
'                apex_collection.delete_collection(p_collection_name => ''DOCUMENTOS'');',
'            end if;',
'',
unistr('            -- Env\00EDo programado'),
'            begin',
'                select json_object(key ''P_ID_SLCTUD'' is :P24_ID_SLCTUD)',
'                  into v_json_parametros',
'                  from dual;',
'',
'                pkg_ma_envios.prc_co_envio_programado(',
'                    p_cdgo_clnte    => :F_CDGO_CLNTE,',
'                    p_idntfcdor     => ''RESPUESTA_TRAMITE_PQR'',',
'                    p_json_prmtros  => v_json_parametros',
'                );',
'            end;',
'        end if;',
'    exception',
'        when others then',
'            apex_json.write(''type'', ''ERROR'');',
'            apex_json.write(''msg'', ''No se pudo registrar la respuesta de la solicitud'');',
'            apex_json.write(''sqlerrm'', sqlerrm);',
'    end;',
'    apex_json.close_object;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69916648619944404)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'consultarRespuesta'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_rspsta    clob;',
'begin',
'   apex_json.open_object;',
'   begin',
'      select rspsta',
'        into v_rspsta',
'        from pq_g_quejas_reclamo',
'       where id_qja_rclmo = :P24_ID_QJA_RCLMO; ',
'      ',
'      apex_json.write(''type'' , ''OK'');',
'      --apex_json.write(''html'', v_rspsta);',
'   exception',
'      when others then',
'         apex_json.write(''type'', ''ERRROR'');',
'         apex_json.write(''sqlerrm'', sqlerrm);',
'   end;',
'   apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(11234699914892101)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ActualizaRespuesta'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_rspsta    clob;',
'    v_json_parametros   clob;',
'begin',
'   apex_json.open_object;',
'   begin',
'',
'      for i in 1..apex_application.g_f01.count',
'      loop',
'          v_rspsta := v_rspsta || apex_application.g_f01(i);',
'      end loop;',
'     ',
'    if ltrim(v_rspsta) is null then ',
'        apex_json.write(''type'', ''ERROR'');',
unistr('        apex_json.write(''msg'', ''\00A1La respuesta no puede estar vacia!'');    '),
'    else    ',
'        update pq_g_quejas_reclamo',
'         set rspsta = v_rspsta',
'        where id_qja_rclmo = :P24_ID_QJA_RCLMO; ',
'        apex_json.write(''type'', ''OK'');',
unistr('        apex_json.write(''msg'', ''\00A1Respuesta actualizada de forma exitosa!'');'),
'',
'',
'        commit;       ',
'        ',
'        if apex_collection.collection_exists(p_collection_name => ''DOCUMENTOS'') then ',
'            apex_collection.delete_collection( p_collection_name => ''DOCUMENTOS'');            ',
'        end if;                 ',
'          ',
'    end if;  ',
'      ',
'   exception',
'      when others then',
'         apex_json.write(''type'', ''ERRROR'');',
'         apex_json.write(''msg'', ''No se pudo actualizar la respuesta de la solicitud'');',
'         apex_json.write(''sqlerrm'', sqlerrm);',
'   end;',
'   apex_json.close_object;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(11289813108727308)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ActualizarAdjunto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_rspsta                        clob;',
'    v_json_parametros               clob;',
'    v_blob                          blob;',
'    v_mime_type                     varchar2(400);',
'    v_filename                      varchar2(400);',
'    v_obsrvcion                     varchar2(1000);',
'    v_id_qja_rclmo_adjnto_orgnal    number;',
'begin',
'   apex_json.open_object;',
'   begin',
'',
'        --RECORREMOS LOS ADJUNTOS DE LA SOLICITUD',
'                              select c001 ',
'                              , c002 ',
'                              , c003 ',
'                              , blob001',
'                              into',
'                              v_obsrvcion,',
'                              v_filename,',
'                              v_mime_type,',
'                              v_blob                            ',
'                           from apex_collections',
'                          where collection_name = ''DOCUMENTOS'';',
'                         ',
'        ',
'           if :P24_ID_RVSION_TREA is not null then ',
'           ',
'              begin',
'                --CREAMOS LOS DOCUMENTOS DE LA RESPUESTA',
'                -- AL ACTUALIZAR SE REGISTRA NUEVO DOCUMENTO, PARA CONSERVAR HISTORIAL DE ADJUNTOS REQ0027700',
'                ',
'                --1. Cambiar estado a N',
'                update pq_g_quejas_reclamo_adjunto ',
'                   set actvo = ''N''',
'                where id_qja_rclmo = :P24_ID_QJA_RCLMO ',
'                  and id_qja_rclmo_adjnto = :P24_ARCHVOS_ADJNTOS;',
'                  ',
'                --2. Consulat el ID del adjunto original.  ',
'                select id_qja_rclmo_adjnto_orgnal',
'                  into v_id_qja_rclmo_adjnto_orgnal',
'                  from pq_g_quejas_reclamo_adjunto',
'                 where id_qja_rclmo = :P24_ID_QJA_RCLMO ',
'                   and id_qja_rclmo_adjnto = :P24_ARCHVOS_ADJNTOS; ',
'                ',
unistr('                --3. Registrar nuevo adjunto (La actualizaci\00F3n de un adjunto)'),
'                insert into pq_g_quejas_reclamo_adjunto (id_qja_rclmo, file_blob, file_name, file_mimetype, obsrvcion, id_usrio, id_qja_rclmo_adjnto_orgnal) ',
'                    values (:P24_ID_QJA_RCLMO, v_blob, v_filename, v_mime_type, v_obsrvcion,:F_ID_USRIO,v_id_qja_rclmo_adjnto_orgnal);',
'                    ',
'                /*update pq_g_quejas_reclamo_adjunto set file_blob = v_blob, file_name = v_filename,  ',
'                file_mimetype = v_mime_type, obsrvcion = v_obsrvcion',
'                where id_qja_rclmo = :P24_ID_QJA_RCLMO and id_qja_rclmo_adjnto = :P24_ARCHVOS_ADJNTOS;*/',
'                ',
'                ',
'                 apex_json.write(''type'', ''OK'');',
unistr('                 apex_json.write(''msg'', ''\00A1Adjunto actualizado de forma exitosa!'');'),
'              exception',
'                when others then',
'                    apex_json.write(''type'', ''ERRROR'');',
'                    apex_json.write(''msg'', ''No se pudo actualizar el documento de la respuesta'');',
'                    apex_json.write(''sqlerrm'', sqlerrm);',
'                 end;   ',
'           end if;',
'           ',
'',
'        ',
'        commit;       ',
'        ',
'        if apex_collection.collection_exists(p_collection_name => ''DOCUMENTOS'') then ',
'            apex_collection.delete_collection( p_collection_name => ''DOCUMENTOS'');            ',
'        end if;            ',
'',
'   exception',
'      when others then',
'         apex_json.write(''type'', ''ERRROR'');',
'         apex_json.write(''msg'', ''No se pudo actualizar la respuesta de la solicitud'');',
'         apex_json.write(''sqlerrm'', sqlerrm);',
'   end;',
'   apex_json.close_object;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13976390677057001)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RegistrarNuevoAdjunto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_rspsta                  clob;',
'    v_json_parametros         clob;',
'    v_file_blob               blob;',
'    v_count_docs              number := 0;',
'    v_id_qja_rclmo_adjnto     number;',
'begin',
'    apex_json.open_object;',
'    begin',
'        -- Concatenar las respuestas recibidas',
'        for i in 1..apex_application.g_f01.count loop',
'            v_rspsta := v_rspsta || apex_application.g_f01(i);',
'        end loop;',
'',
'        -- Contar archivos cargados',
'        select count(*)',
'          into v_count_docs',
'          from apex_collections',
'         where collection_name = ''DOCUMENTOS'';',
'',
'        -- Obtener un archivo si existe (opcional)',
'        if v_count_docs > 0 then',
'            select blob001',
'              into v_file_blob',
'              from apex_collections',
'             where collection_name = ''DOCUMENTOS''',
'               and rownum = 1;',
'        end if;',
'',
'        --  ambos son obligatorios',
'        if /*(v_rspsta is null or length(trim(v_rspsta)) = 0) or*/ v_count_docs = 0 then',
'            apex_json.write(''type'', ''ERROR'');',
unistr('            apex_json.write(''msg'', ''\00A1Adjunto es obligatorio, por favor intente nuevamente!'');'),
'        else',
'            -- Actualizar respuesta',
'            /*update pq_g_quejas_reclamo',
'               set rspsta = v_rspsta',
'             where id_qja_rclmo = :P24_ID_QJA_RCLMO;*/',
'',
'            -- Procesar adjuntos',
'            for c_documentos in (',
'                select c001 obsrvcion,',
'                       c002 filename,',
'                       c003 mime_type,',
'                       blob001 file_blob',
'                  from apex_collections',
'                 where collection_name = ''DOCUMENTOS''',
'            ) loop',
'                begin',
'                    if :P24_ID_RVSION_TREA is not null then',
'                        insert into pq_g_quejas_reclamo_adjunto (',
'                            id_qja_rclmo, file_blob, file_name, file_mimetype, obsrvcion, id_usrio',
'                        ) values (',
'                            :P24_ID_QJA_RCLMO, c_documentos.file_blob, c_documentos.filename, c_documentos.mime_type, c_documentos.obsrvcion, :F_ID_USRIO',
'                        ) returning id_qja_rclmo_adjnto into v_id_qja_rclmo_adjnto ;',
'                        ',
'                        update pq_g_quejas_reclamo_adjunto',
'                           set id_qja_rclmo_adjnto_orgnal = v_id_qja_rclmo_adjnto',
'                         where id_qja_rclmo = :P24_ID_QJA_RCLMO',
'                           and id_qja_rclmo_adjnto = v_id_qja_rclmo_adjnto;',
'                        ',
'                    end if;',
'                exception',
'                    when others then',
'                        apex_json.write(''type'', ''ERROR'');',
'                        apex_json.write(''msg'', ''Error al guardar documento'');',
'                        apex_json.write(''sqlerrm'', sqlerrm);',
'                end;',
'            end loop;',
'',
'            commit;',
'',
'            apex_json.write(''type'', ''OK'');',
unistr('            apex_json.write(''msg'', ''\00A1Adjunto cargado de forma exitosa!'');'),
'',
unistr('            -- Limpiar colecci\00F3n'),
'            if apex_collection.collection_exists(p_collection_name => ''DOCUMENTOS'') then',
'                apex_collection.delete_collection(p_collection_name => ''DOCUMENTOS'');',
'            end if;',
'',
unistr('            -- Env\00EDo programado'),
'            begin',
'                select json_object(key ''P_ID_SLCTUD'' is :P24_ID_SLCTUD)',
'                  into v_json_parametros',
'                  from dual;',
'',
'                pkg_ma_envios.prc_co_envio_programado(',
'                    p_cdgo_clnte    => :F_CDGO_CLNTE,',
'                    p_idntfcdor     => ''RESPUESTA_TRAMITE_PQR'',',
'                    p_json_prmtros  => v_json_parametros',
'                );',
'            end;',
'        end if;',
'    exception',
'        when others then',
'            apex_json.write(''type'', ''ERROR'');',
'            apex_json.write(''msg'', ''No se pudo registrar la respuesta de la solicitud'');',
'            apex_json.write(''sqlerrm'', sqlerrm);',
'    end;',
'    apex_json.close_object;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
