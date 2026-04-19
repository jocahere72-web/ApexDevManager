prompt --application/pages/page_20250
begin
wwv_flow_api.create_page(
 p_id=>2025003
,p_user_interface_id=>wwv_flow_api.id(71889596252951620)
,p_name=>unistr('Verificaci\00F3n')
,p_step_title=>unistr('Verificaci\00F3n')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.jQuery(apex.gPageContext$).on("apexreadyend", async function (e) {',
'    let rs = await apex.server.process(''consultarRespuesta'', {',
'        pageItems: ''#P2025003_ID_QJA_RCLMO''',
'    });',
'    ',
'    if(rs.type === ''OK'') {',
'        CKEDITOR.instances.P2025003_RSPSTA.setData(rs.html);    ',
'    } else {',
'        CKEDITOR.instances.P2025003_RSPSTA.setData('''');',
'    }    ',
'});'))
,p_step_template=>wwv_flow_api.id(71783507231951541)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'DBALDOVINO'
,p_last_upd_yyyymmddhh24miss=>'20250922130655'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(79874034674831890)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(218871206531175216)
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
,p_attribute_04=>'&P2025003_VLDAR_USRIO.'
,p_attribute_05=>'&P2025003_USRIO.'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(218910648302367813)
,p_plug_name=>'Respuesta'
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
 p_id=>wwv_flow_api.id(32754534617467390)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(218910648302367813)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71814488075951563)
,p_plug_display_sequence=>20
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
'    where a.id_qja_rclmo    =  :P2025003_ID_QJA_RCLMO ',
'    and a.actvo = ''S'''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from pq_g_rvsion_trea_fljo',
'where cdgo_estdo = ''R'' and id_qja_rclmo = :P2025003_ID_QJA_RCLMO',
'and id_instncia_fljo = :P2025003_ID_INSTNCIA_FLJO;'))
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
 p_id=>wwv_flow_api.id(32754649229467391)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'JPRADA'
,p_internal_uid=>32754649229467391
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9382097340074706)
,p_db_column_name=>'ID_QJA_RCLMO_ADJNTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Queja Reclamo Adjunto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9382498787074707)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9382816630074707)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9383278653074707)
,p_db_column_name=>'DESCARGAR'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'DOWNLOAD:PQ_G_QUEJAS_RECLAMO_ADJUNTO:FILE_BLOB:ID_QJA_RCLMO_ADJNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class=" fa fa-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9383689652074708)
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
 p_id=>wwv_flow_api.id(14036850025797701)
,p_db_column_name=>'NMBRE_TRCRO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Usuario'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14036922273797702)
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
 p_id=>wwv_flow_api.id(32764410783471791)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'93840'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_TRCRO:ID_QJA_RCLMO_ADJNTO:FILE_NAME:FCHA_DGTA:OBSRVCION:DESCARGAR:VER:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108511763546762824)
,p_plug_name=>'Cargar Documentos'
,p_parent_plug_id=>wwv_flow_api.id(218910648302367813)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NOT_EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from pq_g_rvsion_trea_fljo',
'where cdgo_estdo = ''R'' ',
'and id_qja_rclmo = :P2025003_ID_QJA_RCLMO',
'and id_instncia_fljo = :P2025003_ID_INSTNCIA_FLJO',
'and :P2025003_VLDAR_USRIO = ''true'''))
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
 p_id=>wwv_flow_api.id(25330526931809829)
,p_plug_name=>'Adjuntos Respuesta'
,p_parent_plug_id=>wwv_flow_api.id(108511763546762824)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>90
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P2025003_RSPTA_BTON is not null  and :P2025003_VLDAR_USRIO = ''true''',
'and :P2025003_ID_RVSION_TREA is null'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25330618996809830)
,p_plug_name=>'Documentos'
,p_region_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(25330526931809829)
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
'    where a.id_qja_rclmo    =  :P2025003_ID_QJA_RCLMO',
'    and a.actvo = ''S'''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(25331004517809833)
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
 p_id=>wwv_flow_api.id(25331049229809834)
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
 p_id=>wwv_flow_api.id(25331136337809835)
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
 p_id=>wwv_flow_api.id(25331232411809836)
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
,p_link_target=>'f?p=&APP_ID.:2025003:&SESSION.:DESCARGAR_ADJUNTO:&DEBUG.:RP:P2025003_ID_QJA_RCLMO_ADJNTO:&ID_QJA_RCLMO_ADJNTO.'
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
 p_id=>wwv_flow_api.id(25331336934809837)
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
 p_id=>wwv_flow_api.id(25331779850809841)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(25331833208809842)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(28054328853726631)
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
 p_id=>wwv_flow_api.id(28054516420726632)
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
 p_id=>wwv_flow_api.id(25330836994809832)
,p_internal_uid=>25330836994809832
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
 p_id=>wwv_flow_api.id(25345916265237475)
,p_interactive_grid_id=>wwv_flow_api.id(25330836994809832)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(25345963479237475)
,p_report_id=>wwv_flow_api.id(25345916265237475)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(25346507006237476)
,p_view_id=>wwv_flow_api.id(25345963479237475)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(25331004517809833)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(25346989074237478)
,p_view_id=>wwv_flow_api.id(25345963479237475)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(25331049229809834)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(25347431983237480)
,p_view_id=>wwv_flow_api.id(25345963479237475)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(25331136337809835)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(25347926021237481)
,p_view_id=>wwv_flow_api.id(25345963479237475)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(25331232411809836)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>91.875
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(25348426185237482)
,p_view_id=>wwv_flow_api.id(25345963479237475)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(25331336934809837)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90.42500000000001
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(25354351173255204)
,p_view_id=>wwv_flow_api.id(25345963479237475)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(25331779850809841)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28113039502421285)
,p_view_id=>wwv_flow_api.id(25345963479237475)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(28054328853726631)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28113565106421286)
,p_view_id=>wwv_flow_api.id(25345963479237475)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(28054516420726632)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108956035459836027)
,p_plug_name=>'Documentos Cargados Coleccion'
,p_parent_plug_id=>wwv_flow_api.id(108511763546762824)
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
'    where id_mtvo = :P2025003_ID_MTVO',
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
 p_id=>wwv_flow_api.id(108957894172836045)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'MCARO'
,p_internal_uid=>108957894172836045
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14050560170112842)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14050981536112842)
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
 p_id=>wwv_flow_api.id(14051371829112842)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14051780164112843)
,p_db_column_name=>'ELIMINAR'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Eliminar'
,p_column_link=>'f?p=&APP_ID.:2025003:&SESSION.:ELIMINAR_ADJUNTO:&DEBUG.:RP:P2025003_SEQ_ID:#SEQ_ID#'
,p_column_linktext=>'<span aria-hidden="true" class="fa fa-trash" style="color: red;" ></span>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14052126468112843)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(109061542593128834)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'140525'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'OBSRVCION:FILE_NAME:ELIMINAR:'
,p_sort_column_1=>'DSCRPCION_INDCDOR_OBLGTRIO'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(301607367775576983)
,p_plug_name=>'Documentos'
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
 p_id=>wwv_flow_api.id(366419808187928178)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(301607367775576983)
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
'    where id_slctud = :P2025003_ID_SLCTUD '))
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
 p_id=>wwv_flow_api.id(293658049338047683)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'MCARO'
,p_internal_uid=>293658049338047683
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9385031146074712)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9385429994074713)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9385881173074713)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'<p></p>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTOS:FILE_BLOB:ID_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9386254805074713)
,p_db_column_name=>'ID_SLCTUD'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Id Slctud'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9386669577074713)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9387075624074714)
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
 p_id=>wwv_flow_api.id(9387469299074714)
,p_db_column_name=>'FCHA'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Fecha Subida'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(293671516624053950)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'93878'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_DCMNTO:OBSRVCION:FCHA:FILE_NAME:ID_DCMNTO:ACTVO:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(366406454965920648)
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
 p_id=>wwv_flow_api.id(366410555556925302)
,p_plug_name=>'Datos del Gestor'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(366415242798926485)
,p_plug_name=>'Datos del Solicitante'
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
 p_id=>wwv_flow_api.id(366658809188249690)
,p_plug_name=>'Datos Solicitud'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9404184325077001)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(79874034674831890)
,p_button_name=>'BTN_APRBAR_OBSRVCION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_image_alt=>unistr('<b>Aprobar Observaci\00F3n</b>')
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from pq_g_rvsion_trea_fljo',
'where cdgo_estdo = ''R'' and id_qja_rclmo = :P2025003_ID_QJA_RCLMO',
'and id_instncia_fljo = :P2025003_ID_INSTNCIA_FLJO',
'and :P2025003_VLDAR_USRIO = ''true''',
';'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-check-circle'
,p_grid_new_grid=>false
);
end;
/
begin
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12540099379590003)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(79874034674831890)
,p_button_name=>'BTN_ADJNTO_OBSRVCION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'<b>Descargar Adjunto</b>'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>':P2025003_ID_RVSION_TREA is not null and :P2025003_FILE_NAME is not null and :P2025003_VLDAR_USRIO = ''true'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-download'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9380354534074700)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(79874034674831890)
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
 p_id=>wwv_flow_api.id(14043720561925415)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(79874034674831890)
,p_button_name=>'BTN_ACTLZAR_ADJNTO'
,p_button_static_id=>'procesar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Actualiza Adjunto'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from pq_g_rvsion_trea_fljo',
'where ( (cdgo_estdo = ''R'' ',
'and id_qja_rclmo = :P2025003_ID_QJA_RCLMO',
'and id_instncia_fljo = :P2025003_ID_INSTNCIA_FLJO)',
'or (:P2025003_VLDAR_USRIO = ''false'') )',
'/*and not(:P2025003_RSPTA_BTON is not null  ',
'and :P2025003_VLDAR_USRIO = ''true''',
'and :P2025003_ID_RVSION_TREA is null)*/'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(14044551128940118)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(79874034674831890)
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
'select 1 from pq_g_rvsion_trea_fljo',
'where ((cdgo_estdo = ''R'' ',
'and id_qja_rclmo = :P2025003_ID_QJA_RCLMO',
'and id_instncia_fljo = :P2025003_ID_INSTNCIA_FLJO)',
'or (:P2025003_VLDAR_USRIO = ''false'') )',
'/*and not(:P2025003_RSPTA_BTON is not null  ',
'and :P2025003_VLDAR_USRIO = ''true''',
'and :P2025003_ID_RVSION_TREA is null)*/'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-file-new'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(14271339086214597)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(79874034674831890)
,p_button_name=>'BTN_RCHZAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_image_alt=>'Rechazar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from pq_g_rvsion_trea_fljo',
'where ((cdgo_estdo = ''R'' and id_qja_rclmo = :P2025003_ID_QJA_RCLMO',
'and id_instncia_fljo = :P2025003_ID_INSTNCIA_FLJO)',
'or (:P2025003_VLDAR_USRIO = ''false'') )'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(14045870139112833)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(108511763546762824)
,p_button_name=>'BTN_AGRGAR'
,p_button_static_id=>'BTN_AGRGAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar'
,p_button_position=>'BODY'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de Cargar este Archivo?'',''BTN_AGRGAR'')'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>5
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(14046248898112834)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(108511763546762824)
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
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(14343856280781704)
,p_branch_name=>unistr('Ir a la p\00E1gina rechazo 2025005')
,p_branch_action=>'f?p=&APP_ID.:2025005:&SESSION.::&DEBUG.:RP:P2025005_ID_FLJO_TREA,P2025005_ID_INSTNCIA_FLJO,P2025005_ID_QJA_RCLMO,P2025005_USRIO,P2025005_ID_RVSION_TREA:&F_ID_FLJO_TREA.,&P2025003_ID_INSTNCIA_FLJO.,&P2025003_ID_QJA_RCLMO.,&P2025003_USRIO.,&P2025003_ID_RVSION_TREA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'BTN_RCHZAR'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(12540123039590004)
,p_branch_name=>'Imprimir'
,p_branch_action=>'f?p=&APP_ID.:2025003:&SESSION.:Imprimir:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(12540099379590003)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9381391267074702)
,p_name=>'P2025003_RSPSTA'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(218910648302367813)
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_cSize=>30
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(71867060529951592)
,p_item_template_options=>'#DEFAULT#'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (options){',
'    options.uiColor = ''#f1f1f1'';',
'    options.skin = ''office2013,skins/office2013/'';',
'    options.height = 200;',
'    options.resize_enabled = false;',
'    options.readOnly = true;',
'}',
'    '))
,p_attribute_02=>'Full'
,p_attribute_03=>'Y'
,p_attribute_05=>'top'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9388569535074715)
,p_name=>'P2025003_ID_RDCDOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(366410555556925302)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9388894919074715)
,p_name=>'P2025003_CDGO_IDNTFCCION_TPO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(366410555556925302)
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
 p_id=>wwv_flow_api.id(9389201377074716)
,p_name=>'P2025003_IDNTFCCION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(366410555556925302)
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
 p_id=>wwv_flow_api.id(9389601552074717)
,p_name=>'P2025003_PRMER_NMBRE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(366410555556925302)
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
 p_id=>wwv_flow_api.id(9390035454074717)
,p_name=>'P2025003_SGNDO_NMBRE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(366410555556925302)
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
 p_id=>wwv_flow_api.id(9390452859074717)
,p_name=>'P2025003_PRMER_APLLDO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(366410555556925302)
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
 p_id=>wwv_flow_api.id(9390884587074717)
,p_name=>'P2025003_SGNDO_APLLDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(366410555556925302)
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
 p_id=>wwv_flow_api.id(9391528427074718)
,p_name=>'P2025003_CDGO_RSPNSBLE_TPO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(366415242798926485)
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
 p_id=>wwv_flow_api.id(9391916405074718)
,p_name=>'P2025003_CDGO_IDNTFCCION_TPO_S'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(366415242798926485)
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
 p_id=>wwv_flow_api.id(9392339167074718)
,p_name=>'P2025003_IDNTFCCION_S'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(366415242798926485)
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
 p_id=>wwv_flow_api.id(9392755878074719)
,p_name=>'P2025003_PRMER_NMBRE_S'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(366415242798926485)
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
 p_id=>wwv_flow_api.id(9393185043074719)
,p_name=>'P2025003_SGNDO_NMBRE_S'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(366415242798926485)
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
 p_id=>wwv_flow_api.id(9393536542074719)
,p_name=>'P2025003_PRMER_APLLDO_S'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(366415242798926485)
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
 p_id=>wwv_flow_api.id(9393957656074719)
,p_name=>'P2025003_SGNDO_APLLDO_S'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(366415242798926485)
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
 p_id=>wwv_flow_api.id(9394399763074719)
,p_name=>'P2025003_ID_PAIS_NTFCCION_S'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(366415242798926485)
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
 p_id=>wwv_flow_api.id(9394708458074720)
,p_name=>'P2025003_ID_DPRTMNTO_NTFCCION_S'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(366415242798926485)
,p_prompt=>'Departamento'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_dprtmnto',
'     , id_dprtmnto ',
'  from df_s_departamentos ',
' where id_pais = :P2025003_ID_PAIS_NTFCCION_S;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P2025003_ID_PAIS_NTFCCION_S'
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
 p_id=>wwv_flow_api.id(9395113741074720)
,p_name=>'P2025003_ID_MNCPIO_NTFCCION_S'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(366415242798926485)
,p_prompt=>'Municipio'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_mncpio',
'     , id_mncpio ',
'  from df_s_municipios ',
' where id_dprtmnto = :P2025003_ID_DPRTMNTO_NTFCCION_S'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P2025003_ID_DPRTMNTO_NTFCCION_S'
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
 p_id=>wwv_flow_api.id(9395588450074720)
,p_name=>'P2025003_DRCCION_NTFCCION_S'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(366415242798926485)
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
 p_id=>wwv_flow_api.id(9395932588074721)
,p_name=>'P2025003_EMAIL_S'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(366415242798926485)
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
 p_id=>wwv_flow_api.id(9396353209074721)
,p_name=>'P2025003_TLFNO_S'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(366415242798926485)
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
 p_id=>wwv_flow_api.id(9396771197074721)
,p_name=>'P2025003_CLLAR_S'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(366415242798926485)
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
 p_id=>wwv_flow_api.id(9397411010074722)
,p_name=>'P2025003_ID_QJA_RCLMO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(366658809188249690)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9397859748074722)
,p_name=>'P2025003_ID_PRSNTCION_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(366658809188249690)
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
 p_id=>wwv_flow_api.id(9398275637074722)
,p_name=>'P2025003_ID_TPO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(366658809188249690)
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
 p_id=>wwv_flow_api.id(9398673919074722)
,p_name=>'P2025003_ID_MTVO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(366658809188249690)
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
 p_id=>wwv_flow_api.id(9399052460074722)
,p_name=>'P2025003_ID_IMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(366658809188249690)
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
 p_id=>wwv_flow_api.id(9399402037074723)
,p_name=>'P2025003_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(366658809188249690)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P2025003_ID_IMPSTO',
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
 p_id=>wwv_flow_api.id(9399846434074723)
,p_name=>'P2025003_IDNTFCCION_SJTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(366658809188249690)
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
 p_id=>wwv_flow_api.id(9400229695074724)
,p_name=>'P2025003_ID_SLCTUD'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(366658809188249690)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9400679538074724)
,p_name=>'P2025003_NMRO_RDCDO_DSPLAY'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(366658809188249690)
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
 p_id=>wwv_flow_api.id(9401064143074724)
,p_name=>'P2025003_FCHA_RDCDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(366658809188249690)
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
 p_id=>wwv_flow_api.id(9401463995074724)
,p_name=>'P2025003_MNSJE_RSPSTA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(366658809188249690)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9595240527320203)
,p_name=>'P2025003_ID_INSTNCIA_FLJO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(218871206531175216)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9764800025161501)
,p_name=>'P2025003_ID_RVSION_TREA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(218910648302367813)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10519069955037702)
,p_name=>'P2025003_USRIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(218910648302367813)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12539891016590001)
,p_name=>'P2025003_FILE_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(218910648302367813)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14046662194112836)
,p_name=>'P2025003_ID_MTVO_DCMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(108511763546762824)
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'Seleccione de la lista el tipo de documento que se requiere adjuntar para la solicitud.'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14047596058112838)
,p_name=>'P2025003_OPCION_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(108511763546762824)
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
 p_id=>wwv_flow_api.id(14048403899112838)
,p_name=>'P2025003_FILE_BLOB'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(108511763546762824)
,p_prompt=>'Archivo'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Habilita ventana de b\00FAsqueda para ingresar el documento adjunto correspondiente.')
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14049333025112839)
,p_name=>'P2025003_OBSRVCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(108511763546762824)
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
 p_id=>wwv_flow_api.id(14052996495112846)
,p_name=>'P2025003_SEQ_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(108956035459836027)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14068343394518402)
,p_name=>'P2025003_RSPTA_BTON'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(218910648302367813)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14068637525518405)
,p_name=>'P2025003_VLDAR_USRIO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(218910648302367813)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14077137982669624)
,p_name=>'P2025003_ARCHVOS_ADJNTOS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(25330526931809829)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14343544480781701)
,p_name=>'P2025003_RCHAZDO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(366658809188249690)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14514670979638903)
,p_name=>'P2025003_ID_QJA_RCLMO_ADJNTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(25330526931809829)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(14101876986995701)
,p_validation_name=>'Adjunto no Nulo'
,p_validation_sequence=>10
,p_validation=>'P2025003_FILE_BLOB'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar un adjunto'
,p_when_button_pressed=>wwv_flow_api.id(14045870139112833)
,p_associated_item=>wwv_flow_api.id(14048403899112838)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(14101990141995702)
,p_validation_name=>'Item no nulo'
,p_validation_sequence=>20
,p_validation=>':P2025003_RSPSTA is not null'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Digitar un valor'
,p_validation_condition=>'BTN_ACTLZA_RSPSTA'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(9381391267074702)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(14068763479518406)
,p_name=>'Al seleccionar Registros'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(25330618996809830)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(14068828503518407)
,p_event_id=>wwv_flow_api.id(14068763479518406)
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
'        apex.item("P2025003_ARCHVOS_ADJNTOS").setValue(resultString);',
'',
unistr('        // Habilitar el bot\00F3n "autorizar"'),
unistr('        $("#procesar").prop("disabled", false);  // Habilitar el bot\00F3n'),
unistr('        $("#nuevoAdjunto").prop("disabled", true);  // deshabilitar el bot\00F3n'),
'',
'    } else {',
'        // Si no hay registros seleccionados, puedes limpiar el item',
'        apex.item("P2025003_ARCHVOS_ADJNTOS").setValue("");',
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
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(14068943758518408)
,p_name=>unistr('al hacer clic en el bot\00F3n de actualizar adjunto')
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(14043720561925415)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(14069094306518409)
,p_event_id=>wwv_flow_api.id(14068943758518408)
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
'                pageItems: ''#P2025003_ID_QJA_RCLMO,#P2025003_ARCHVOS_ADJNTOS''',
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
 p_id=>wwv_flow_api.id(14069174873518410)
,p_name=>unistr('Al hacer clic en el bot\00F3n de agregar nuevo adjunto')
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(14044551128940118)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(14069285906518411)
,p_event_id=>wwv_flow_api.id(14069174873518410)
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
'                pageItems: ''#P2025003_ID_QJA_RCLMO''',
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
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(14343617651781702)
,p_name=>'Al dar clic en Rechazar'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(14271339086214597)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(14343715460781703)
,p_event_id=>wwv_flow_api.id(14343617651781702)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$s("P2025003_RCHAZDO", ''S'');',
'apex.submit({request: "BTN_RCHZAR"}); '))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9402168669074728)
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
'  into :P2025003_ID_TPO',
'     , :P2025003_ID_MTVO',
'     , :P2025003_ID_IMPSTO',
'     , :P2025003_ID_IMPSTO_SBMPSTO',
'     , :P2025003_IDNTFCCION_SJTO',
'     , :P2025003_ID_RDCDOR',
'     , :P2025003_ID_SLCTUD',
'     , :P2025003_NMRO_RDCDO_DSPLAY',
'     , :P2025003_FCHA_RDCDO',
'     , :P2025003_ID_PRSNTCION_TPO ',
'  from v_pq_g_solicitudes',
'  where id_instncia_fljo_gnrdo = :F_ID_INSTNCIA_FLJO;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9402515570074729)
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
'  into :P2025003_CDGO_IDNTFCCION_TPO',
'     , :P2025003_IDNTFCCION',
'     , :P2025003_PRMER_NMBRE',
'     , :P2025003_SGNDO_NMBRE',
'     , :P2025003_PRMER_APLLDO',
'     , :P2025003_SGNDO_APLLDO',
'  from pq_g_radicador',
' where id_rdcdor = :P2025003_ID_RDCDOR;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9402965064074729)
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
'  into :P2025003_CDGO_RSPNSBLE_TPO',
'     , :P2025003_CDGO_IDNTFCCION_TPO_S ',
'     , :P2025003_IDNTFCCION_S',
'     , :P2025003_PRMER_NMBRE_S',
'     , :P2025003_SGNDO_NMBRE_S ',
'     , :P2025003_PRMER_APLLDO_S',
'     , :P2025003_SGNDO_APLLDO_S',
'     , :P2025003_ID_PAIS_NTFCCION_S',
'     , :P2025003_ID_DPRTMNTO_NTFCCION_S',
'     , :P2025003_ID_MNCPIO_NTFCCION_S',
'     , :P2025003_DRCCION_NTFCCION_S',
'     , :P2025003_EMAIL_S',
'     , :P2025003_TLFNO_S',
'     , :P2025003_CLLAR_S',
'  from pq_g_solicitantes',
' where id_slctud = :P2025003_ID_SLCTUD;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9764933299161502)
,p_process_sequence=>50
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Cargar Datos de Revisi\00F3n Flujo')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'select a.id_rvsion_trea, b.file_name',
'into :P2025003_ID_RVSION_TREA, :P2025003_FILE_NAME',
'from pq_g_rvsion_trea_fljo a',
'inner join pq_g_trea_fljo_obsrvcion b on a.id_rvsion_trea = b.id_rvsion_trea',
'where a.cdgo_estdo = ''R'' and a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'order by 1 desc',
'fetch first 1 row only;',
'exception',
'when others then',
':P2025003_ID_RVSION_TREA := null;',
':P2025003_FILE_NAME  := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10518972773037701)
,p_process_sequence=>60
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar datos de usuario tramite'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'select distinct id_usrio ',
'into :P2025003_USRIO',
'from wf_g_instancias_transicion a',
'inner join wf_d_flujos_tarea b on a.id_fljo_trea_orgen = b.id_fljo_trea',
'where id_instncia_fljo  = :F_ID_INSTNCIA_FLJO and indcdor_incio = ''S'';',
'exception',
'when others then',
':P2025003_USRIO := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12539900491590002)
,p_process_sequence=>70
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
'       and a.id_rvsion_trea   = :P2025003_ID_RVSION_TREA;',
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
 p_id=>wwv_flow_api.id(14068570414518404)
,p_process_sequence=>80
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Usuario'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select ''true''',
'      into :P2025003_VLDAR_USRIO',
'      from wf_g_instancias_transicion ',
'     where id_instncia_fljo   = :F_ID_INSTNCIA_FLJO',
'       and id_fljo_trea_orgen = :F_ID_FLJO_TREA',
'       and id_usrio =  :F_ID_USRIO',
'       and id_estdo_trnscion in (1,2);',
'exception',
'    when others then',
'        :P2025003_VLDAR_USRIO := ''false'';',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14497001042350801)
,p_process_sequence=>90
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar adjunto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    APEX_COLLECTION.DELETE_MEMBER(',
'        p_collection_name => ''DOCUMENTOS'',',
'        p_seq => :P2025003_SEQ_ID);',
'end;'))
,p_process_error_message=>'Adjunto Eliminado Exitosamente'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'ELIMINAR_ADJUNTO'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14054553229137408)
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
'         where name = :P2025003_FILE_BLOB;',
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
'               --and n001 = :P2025003_ID_MTVO_DCMNTO;',
'               and c002 = r_temp_files.filename;',
'                           ',
'            apex_collection.update_member( p_collection_name => ''DOCUMENTOS''',
'                                          , p_seq  => v_seq  ',
'                                          , p_c001 =>  v_obsrvcion ',
'                                          , p_c002 => r_temp_files.filename',
'                                          , p_c003 => r_temp_files.mime_type',
'                                          , p_n001 => :P2025003_ID_MTVO_DCMNTO',
'                                          , p_blob001 => r_temp_files.blob_content );        ',
'        exception ',
'            when others then',
'                apex_collection.add_member( p_collection_name => ''DOCUMENTOS''',
'                                          , p_c001 => :P2025003_OBSRVCION',
'                                          , p_c002 => r_temp_files.filename',
'                                          , p_c003 => r_temp_files.mime_type',
'                                          , p_n001 => :P2025003_ID_MTVO_DCMNTO',
'                                          , p_blob001 => r_temp_files.blob_content );        ',
'        end;       ',
'    end if;',
'end;'))
,p_process_error_message=>'No se encontro archivo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(14045870139112833)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14069335621518412)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar los items luego de agregar un adjunto'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P2025003_FILE_BLOB,P2025003_SEQ_ID,P2025003_OBSRVCION'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(14045870139112833)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9595102255320202)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Aprobar Observacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(1000);',
'    ',
'begin',
'',
'        begin',
'            pkg_pl_workflow_1_0.prc_gn_rvsion_trea_fljo(p_cdgo_clnte         => :F_CDGO_CLNTE',
'                                                        , p_id_rvsion_trea   => :P2025003_ID_RVSION_TREA',
'                                                        , p_id_qja_rclmo     => :P2025003_ID_QJA_RCLMO',
'                                                        , p_id_fljo_trea     => :F_ID_FLJO_TREA',
'                                                        , p_id_instncia_fljo => :F_ID_INSTNCIA_FLJO',
'                                                        , p_id_usrio         => :F_ID_USRIO',
'                                                        , p_cdgo_estdo	     => ''A''',
'                                                        , p_obsrvcion        => ''Aprobado''',
'                                                        , o_cdgo_rspsta      => v_cdgo_rspsta',
'                                                        , o_mnsje_rspsta     => v_mnsje_rspsta);',
'              end;',
'    ',
'        if(v_cdgo_rspsta != 0)then',
'           raise_application_error(-20000, v_mnsje_rspsta);',
'    end if;',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(9404184325077001)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9403368295074729)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'consultar la queja o reclamo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cnteo_rspsta number;',
'    ',
'begin',
'    select id_qja_rclmo',
'    into :P2025003_ID_QJA_RCLMO',
'    from pq_g_quejas_reclamo',
'    where id_instncia_fljo = :F_ID_INSTNCIA_FLJO;',
'    ',
'    ---- Agregado el 25/07/2024',
unistr('	/* Se adiciona validaci\00F3n para casos donde se crean dos o m\00E1s registros '),
'	   de quejas para una misma instancia_flujo. ',
unistr('	   Valicdaci\00F3n realiza para dar soluci\00F3n al requerimiento Req0025405.'),
'	*/',
'    ',
'exception ',
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
'				into :P2025003_ID_QJA_RCLMO',
'				from pq_g_quejas_reclamo',
'				where id_instncia_fljo = :F_ID_INSTNCIA_FLJO;',
'			',
'			else ',
'			',
'				select  max(id_qja_rclmo) as id_qja_rclmo',
'				into :P2025003_ID_QJA_RCLMO',
'				from pq_g_quejas_reclamo',
'				where id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'				and rspsta is not null;',
'			',
'			end if;',
'			',
'			',
'			--insert into muerto(n_001, v_001) values (101013,:P2025003_ID_QJA_RCLMO ); commit;',
'        ',
'        exception',
'            when others then ',
'            :P2025003_ID_QJA_RCLMO := null;',
'         ',
'        end;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14068443783518403)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta Respuesta'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'select rspsta',
'into :P2025003_RSPTA_BTON',
'from pq_g_quejas_reclamo',
'where  id_slctud = :P2025003_ID_SLCTUD',
'and id_qja_rclmo = :P2025003_ID_QJA_RCLMO;',
'',
'exception',
'    when others then',
'    :P2025003_RSPTA_BTON := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14350803345868501)
,p_process_sequence=>20
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Llenar item rechazado'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''N''',
'into :P2025003_RCHAZDO',
'from dual;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_RCHZAR'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14514502961638902)
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
'        where id_qja_rclmo_adjnto = :P2025003_ID_QJA_RCLMO_ADJNTO;',
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
 p_id=>wwv_flow_api.id(9403790082074729)
,p_process_sequence=>50
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
'       where id_qja_rclmo = :P2025003_ID_QJA_RCLMO; ',
'      ',
'      apex_json.write(''type'' , ''OK'');',
'      apex_json.write(''html'', v_rspsta);',
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
 p_id=>wwv_flow_api.id(14053461459125226)
,p_process_sequence=>80
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
'           --if :P2025003_ID_RVSION_TREA is not null then ',
'           ',
'              begin',
'                --CREAMOS LOS DOCUMENTOS DE LA RESPUESTA',
'                -- AL ACTUALIZAR SE REGISTRA NUEVO DOCUMENTO, PARA CONSERVAR HISTORIAL DE ADJUNTOS REQ0027700',
'                ',
'                --1. Cambiar estado a N',
'                update pq_g_quejas_reclamo_adjunto ',
'                   set actvo = ''N''',
'                where id_qja_rclmo = :P2025003_ID_QJA_RCLMO ',
'                  and id_qja_rclmo_adjnto = :P2025003_ARCHVOS_ADJNTOS;',
'                  ',
'                --2. Consulat el ID del adjunto original.  ',
'                select id_qja_rclmo_adjnto_orgnal',
'                  into v_id_qja_rclmo_adjnto_orgnal',
'                  from pq_g_quejas_reclamo_adjunto',
'                 where id_qja_rclmo = :P2025003_ID_QJA_RCLMO ',
'                   and id_qja_rclmo_adjnto = :P2025003_ARCHVOS_ADJNTOS; ',
'                ',
unistr('                --3. Registrar nuevo adjunto (La actualizaci\00F3n de un adjunto)'),
'                insert into pq_g_quejas_reclamo_adjunto (id_qja_rclmo, file_blob, file_name, file_mimetype, obsrvcion, id_usrio, id_qja_rclmo_adjnto_orgnal) ',
'                    values (:P2025003_ID_QJA_RCLMO, v_blob, v_filename, v_mime_type, v_obsrvcion,:F_ID_USRIO,v_id_qja_rclmo_adjnto_orgnal);',
'                    ',
'                /*update pq_g_quejas_reclamo_adjunto set file_blob = v_blob, file_name = v_filename,  ',
'                file_mimetype = v_mime_type, obsrvcion = v_obsrvcion',
'                where id_qja_rclmo = :P2025003_ID_QJA_RCLMO and id_qja_rclmo_adjnto = :P2025003_ARCHVOS_ADJNTOS;*/',
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
'           --end if;',
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
 p_id=>wwv_flow_api.id(14054218669133406)
,p_process_sequence=>90
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
'',
'--insert into muerto (n_001, v_001) values (7777,''Entrando a registrar nuevo''); commit;',
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
'             where id_qja_rclmo = :P2025003_ID_QJA_RCLMO;*/',
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
'            ',
'            --insert into muerto (n_001, v_001) values (7777,''Dentro del loop''); commit;',
'            ',
'                begin',
'                    --if :P2025003_ID_RVSION_TREA is not null then',
'                        insert into pq_g_quejas_reclamo_adjunto (',
'                            id_qja_rclmo, file_blob, file_name, file_mimetype, obsrvcion, id_usrio',
'                        ) values (',
'                            :P2025003_ID_QJA_RCLMO, c_documentos.file_blob, c_documentos.filename, c_documentos.mime_type, c_documentos.obsrvcion, :F_ID_USRIO',
'                        ) returning id_qja_rclmo_adjnto into v_id_qja_rclmo_adjnto ;',
'                        ',
'                        update pq_g_quejas_reclamo_adjunto',
'                           set id_qja_rclmo_adjnto_orgnal = v_id_qja_rclmo_adjnto',
'                         where id_qja_rclmo = :P2025003_ID_QJA_RCLMO',
'                           and id_qja_rclmo_adjnto = v_id_qja_rclmo_adjnto;',
'                        ',
'                    --end if;',
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
'                select json_object(key ''P_ID_SLCTUD'' is :P2025003_ID_SLCTUD)',
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
