prompt --application/pages/page_00204
begin
wwv_flow_api.create_page(
 p_id=>204
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Registro Saldo a Favor'
,p_step_title=>'Registro Saldo a Favor'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function capturarValorDocumento(){',
'    var region = apex.region("P204_DOCUMENTOS");',
'    ',
'    if (region) {',
'       var view = region.widget().interactiveGrid("getViews", "grid");',
'       var model = view.model;  ',
'       var records = view.view$.grid("getSelectedRecords");',
'        ',
'       if($.isEmptyObject(records) == false){',
'           for(let i=0; i<records.length; i++){',
'			   $s("P204_VALOR_SALDO_FAVOR",model.getValue(records[i], "VLOR").replace(/[^0-9]/g, ""));',
'               $s("P204_ID_RCDO",model.getValue(records[i], "ID_RCDO").trim());',
'               $s("P204_SJTO_IMPSTO",model.getValue(records[i], "ID_SJTO_IMPSTO").trim());',
'           }',
'       }',
'       else{',
'          $s("P204_SALDO_FAVOR",null);   ',
'       }',
'   }',
'};'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Form-label{',
'  font-weight: 700;',
'}',
'',
'#P204_OBSERVACION{',
'    resize:none !important;',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NCARRASQUILLA'
,p_last_upd_yyyymmddhh24miss=>'20231012092428'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108995914841845234)
,p_plug_name=>'Sujeto'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108995511018845230)
,p_plug_name=>unistr('Informaci\00F3n Sujeto')
,p_parent_plug_id=>wwv_flow_api.id(108995914841845234)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>'(:P204_TPO_RGSTRO = ''OT'' and :P204_SJTO_IMPSTO is not null)'
,p_attribute_01=>'P204_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108996095835845235)
,p_plug_name=>'Vigencias'
,p_parent_plug_id=>wwv_flow_api.id(108995914841845234)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  seq_id,',
'        c001 as vgncia,',
'        c002 as prdo',
'from APEX_collections    a    ',
'where collection_name = ''VGNCIA_PRDO''',
'and c003 = ''PV'';'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>'(:P204_TPO_RGSTRO = ''OT'' and :P204_SJTO_IMPSTO is not null)'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108996731692845242)
,p_name=>'SEQ_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEQ_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108996819878845243)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.vgncia as d,',
'       a.vgncia as r',
'from df_i_periodos a',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and id_impsto = :P204_TRIBUTO',
'and id_impsto_sbmpsto = :P204_SUB_TRIBUTO',
'group by a.vgncia',
'order by a.vgncia desc;'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108996998946845244)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(prdo || '' '' || dscrpcion || '' '' || dscrpcion_prdcdad) as d,',
'       id_prdo as r',
'from v_df_i_periodos',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and id_impsto = :P204_TRIBUTO',
'and id_impsto_sbmpsto = :P204_SUB_TRIBUTO',
'and vgncia = :VGNCIA'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'VGNCIA'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108997039743845245)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(108996619690845241)
,p_internal_uid=>108996619690845241
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET'
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
 p_id=>wwv_flow_api.id(109111425958227262)
,p_interactive_grid_id=>wwv_flow_api.id(108996619690845241)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(109111562873227264)
,p_report_id=>wwv_flow_api.id(109111425958227262)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109112002136227269)
,p_view_id=>wwv_flow_api.id(109111562873227264)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(108996731692845242)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109112597858227274)
,p_view_id=>wwv_flow_api.id(109111562873227264)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(108996819878845243)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109113050996227278)
,p_view_id=>wwv_flow_api.id(109111562873227264)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(108996998946845244)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109115720904238135)
,p_view_id=>wwv_flow_api.id(109111562873227264)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(108997039743845245)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(212248399335794652)
,p_plug_name=>'Adjuntar Soportes'
,p_parent_plug_id=>wwv_flow_api.id(108995914841845234)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>'(:P204_TPO_RGSTRO = ''OT'' and :P204_SJTO_IMPSTO is not null)'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(109136962265696312)
,p_plug_name=>'Soportes'
,p_parent_plug_id=>wwv_flow_api.id(212248399335794652)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  seq_id,',
'        c004 as nombre,',
'        c005 as filemymetype,',
'        blob001 as blobfile,',
'        c006 as num_resolucion ,',
'        d002 as fec_resolucion ,',
'        ''<span aria-hidden="true" class="fa fa-trash" style="color: #d22204;" alt="Eliminar" title="Eliminar"></span>'' as elmnar',
'from APEX_collections    a    ',
'where collection_name = ''VGNCIA_PRDO''',
'and c003 = ''SP'';'))
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
 p_id=>wwv_flow_api.id(109137063526696313)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LTORRES'
,p_internal_uid=>109137063526696313
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(109137112084696314)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(109137647894696319)
,p_db_column_name=>'NOMBRE'
,p_display_order=>20
,p_column_identifier=>'E'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(109137768222696320)
,p_db_column_name=>'FILEMYMETYPE'
,p_display_order=>30
,p_column_identifier=>'F'
,p_column_label=>'Formato'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(109242910030374404)
,p_db_column_name=>'BLOBFILE'
,p_display_order=>40
,p_column_identifier=>'J'
,p_column_label=>'Blobfile'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(109243158291374406)
,p_db_column_name=>'ELMNAR'
,p_display_order=>50
,p_column_identifier=>'K'
,p_column_label=>'Elmnar'
,p_column_link=>'f?p=&APP_ID.:204:&SESSION.:eliminar:&DEBUG.:RP:P204_SEQ_ID:#SEQ_ID#'
,p_column_linktext=>'#ELMNAR#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134091891532850502)
,p_db_column_name=>'FEC_RESOLUCION'
,p_display_order=>70
,p_column_identifier=>'M'
,p_column_label=>unistr('Fecha Resoluci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134291755184382433)
,p_db_column_name=>'NUM_RESOLUCION'
,p_display_order=>80
,p_column_identifier=>'N'
,p_column_label=>'Num Resolucion'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(109237417381263441)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1092375'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SEQ_ID:NOMBRE:FILEMYMETYPE:BLOBFILE:ELMNAR:FEC_RESOLUCION'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(134349446233632701)
,p_plug_name=>'Soportes 2'
,p_parent_plug_id=>wwv_flow_api.id(212248399335794652)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  seq_id,',
'        c004 as nombre,',
'        c005 as filemymetype,',
'        blob001 as blobfile,',
'        c006 as num_resolucion ,',
'        d002 as fec_resolucion ,',
'        ''<span aria-hidden="true" class="fa fa-trash" style="color: #d22204;" alt="Eliminar" title="Eliminar"></span>'' as elmnar',
'from    APEX_collections    a    ',
'where   collection_name = ''VGNCIA_PRDO''',
'and     c003 = ''SP'';'))
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
 p_id=>wwv_flow_api.id(134349564506632702)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JPRADA'
,p_internal_uid=>134349564506632702
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134349648308632703)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134349721429632704)
,p_db_column_name=>'NOMBRE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134349816329632705)
,p_db_column_name=>'FILEMYMETYPE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Formato'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134349983178632706)
,p_db_column_name=>'BLOBFILE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Blobfile'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134350084699632707)
,p_db_column_name=>'NUM_RESOLUCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('N\00FAmero Resoluci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134350139543632708)
,p_db_column_name=>'FEC_RESOLUCION'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Fecha Resoluci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134350210540632709)
,p_db_column_name=>'ELMNAR'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Elmnar'
,p_column_link=>'f?p=&APP_ID.:204:&SESSION.:eliminar:&DEBUG.:RP:P204_SEQ_ID:#SEQ_ID#'
,p_column_linktext=>'#ELMNAR#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(134362112043681219)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1343622'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SEQ_ID:NOMBRE:FILEMYMETYPE:BLOBFILE:NUM_RESOLUCION:FEC_RESOLUCION:ELMNAR'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(110782828593808604)
,p_plug_name=>'Documento Vigencia'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17120581544243107)
,p_plug_name=>'Vigencias'
,p_region_name=>'vgncias'
,p_parent_plug_id=>wwv_flow_api.id(110782828593808604)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.id_dcmnto,',
'       c.vgncia,',
'       c.id_prdo,',
'       d.prdo',
'from v_re_g_recaudos a',
'join re_g_documentos_detalle  b on a.id_orgen = b.id_dcmnto',
'join gf_g_movimientos_detalle c on b.id_mvmnto_dtlle = c.id_mvmnto_dtlle',
'join df_i_periodos            d on c.id_prdo = d.id_prdo',
'group by b.id_dcmnto,',
'         c.vgncia,',
'         c.id_prdo,',
'         d.prdo;'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(101638393445135912)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17120787885243109)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
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
 p_id=>wwv_flow_api.id(17120886490243110)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'N'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17120960463243111)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(17121015360243112)
,p_name=>'ID_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCMNTO'
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
,p_parent_column_id=>wwv_flow_api.id(103056225650098401)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17121251742243114)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(17120608999243108)
,p_internal_uid=>17120608999243108
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
 p_id=>wwv_flow_api.id(17287446424553860)
,p_interactive_grid_id=>wwv_flow_api.id(17120608999243108)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(17287599498553860)
,p_report_id=>wwv_flow_api.id(17287446424553860)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17288080915553873)
,p_view_id=>wwv_flow_api.id(17287599498553860)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(17120787885243109)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17288563245553878)
,p_view_id=>wwv_flow_api.id(17287599498553860)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(17120886490243110)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17289060562553880)
,p_view_id=>wwv_flow_api.id(17287599498553860)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(17120960463243111)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17290829471563842)
,p_view_id=>wwv_flow_api.id(17287599498553860)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(17121015360243112)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(101638393445135912)
,p_plug_name=>'Documentos'
,p_region_name=>'P204_DOCUMENTOS'
,p_parent_plug_id=>wwv_flow_api.id(110782828593808604)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_rcdo, ',
'       a.id_orgen as id_dcmnto, ',
'       a.id_sjto_impsto,',
'       a.vlor, ',
'       a.vlor as valor_oculto,',
'       c.nmbre_bnco,',
'       to_char(a.fcha_ingrso_bnco, ''dd/MM/YYYY'') as fcha_ingrso_bnco,',
'       to_char(a.fcha_rcdo, ''dd/MM/YYYY'') as fcha_rcdo,',
'       d.dscrpcion',
' from re_g_recaudos a',
' join re_g_recaudos_control b on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
' join df_c_bancos c on b.id_bnco = c.id_bnco',
' join re_d_recaudo_estado d on a.cdgo_rcdo_estdo = d.cdgo_rcdo_estdo',
'where b.cdgo_clnte = :F_CDGO_CLNTE ',
'and a.id_orgen = :P204_ID_ORGEN',
'and b.id_impsto = :P204_TRIBUTO',
'and b.id_impsto_sbmpsto = :P204_SUB_TRIBUTO',
'and a.cdgo_rcdo_estdo in ( ''RG'' , ''AP'' )',
'and a.id_rcdo not in ( ',
'                        select d.id_orgen ',
'                        from gf_g_saldos_favor d',
'                        where d.cdgo_clnte = :F_CDGO_CLNTE',
'                        and d.id_orgen is not null',
'',
'                     );'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(91393276397975811)
,p_name=>'NMBRE_BNCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_BNCO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Banco'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(91393305716975812)
,p_name=>'FCHA_INGRSO_BNCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_INGRSO_BNCO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha Ingreso a Banco'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>10
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
 p_id=>wwv_flow_api.id(91393461386975813)
,p_name=>'FCHA_RCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RCDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha Recaudo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>10
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
 p_id=>wwv_flow_api.id(91393516396975814)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(101638886095135917)
,p_name=>'ID_RCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RCDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
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
 p_id=>wwv_flow_api.id(101639123219135920)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(101639213141135921)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
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
 p_id=>wwv_flow_api.id(101640090725135929)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(103056225650098401)
,p_name=>'ID_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'N'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(118490778328325203)
,p_name=>'VALOR_OCULTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VALOR_OCULTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attribute_01=>'N'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(101638447025135913)
,p_internal_uid=>101638447025135913
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
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
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
end;
/
begin
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(101718366250588397)
,p_interactive_grid_id=>wwv_flow_api.id(101638447025135913)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(101718465621588397)
,p_report_id=>wwv_flow_api.id(101718366250588397)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92601969594792550)
,p_view_id=>wwv_flow_api.id(101718465621588397)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(91393276397975811)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92602411188792556)
,p_view_id=>wwv_flow_api.id(101718465621588397)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(91393305716975812)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92602985621792559)
,p_view_id=>wwv_flow_api.id(101718465621588397)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(91393461386975813)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92603410137792562)
,p_view_id=>wwv_flow_api.id(101718465621588397)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(91393516396975814)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101731370209791621)
,p_view_id=>wwv_flow_api.id(101718465621588397)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(101638886095135917)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101732845106791625)
,p_view_id=>wwv_flow_api.id(101718465621588397)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(101639123219135920)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101733311863791626)
,p_view_id=>wwv_flow_api.id(101718465621588397)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(101639213141135921)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(103062871857099949)
,p_view_id=>wwv_flow_api.id(101718465621588397)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(103056225650098401)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(118605491773810339)
,p_view_id=>wwv_flow_api.id(101718465621588397)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(118490778328325203)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(325681983636946020)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>60
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
 p_id=>wwv_flow_api.id(366362567816791113)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(479555310088960916)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center; padding: 10px 0 px 0px 10px;">',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </i>',
'        </b>',
'    </div>',
'</h5>',
'',
'<i>',
'',
'Funcionalidad que permite: <br><br>',
'',
unistr('Registrar Saldos a favor por Recaudo o por Resoluci\00F3n<br><br>'),
'',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'',
'',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(108997471136845249)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(325681983636946020)
,p_button_name=>'Guardar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'(:P204_RGSTROS > 0 or :P204_SJTO_IMPSTO is not null )'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(109135942823696302)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(325681983636946020)
,p_button_name=>'Regresar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:&P204_PGNA.:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(109231763992202276)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(212248399335794652)
,p_button_name=>'BTN_AGRGAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar'
,p_button_position=>'BODY'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(101662838251446619)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(366362567816791113)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(108994834998845223)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(366362567816791113)
,p_button_name=>'BTN_CNSLTAR_SJTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Consultar Sujeto'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(65293815384391501)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(366362567816791113)
,p_button_name=>'BTN_REFRESCAR'
,p_button_static_id=>'refrescar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>'Limpiar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:204:&SESSION.::&DEBUG.:RP,204::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(109138129564696324)
,p_branch_name=>'Go To Page 204'
,p_branch_action=>'f?p=&APP_ID.:204:&SESSION.::&DEBUG.:RP,204:P204_PGNA:&P204_PGNA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(108997471136845249)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17121494420243116)
,p_name=>'P204_SJTO_IMPSTO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(366362567816791113)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17121984882243121)
,p_name=>'P204_TRIBUTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(366362567816791113)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_rcdo',
' from v_re_g_recaudos a',
'where a.nmro_dcmnto = :P204_N_DOCUMENTO',
'and a.id_impsto = :P204_TRIBUTO',
'and a.id_impsto_sbmpsto = :P204_SUB_TRIBUTO',
'and a.cdgo_rcdo_estdo in ( ''RG'' , ''AP'' )',
'and not a.id_rcdo in (select b.id_orgen from gf_g_saldos_favor b);'))
,p_read_only_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17122038070243122)
,p_name=>'P204_SUB_TRIBUTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(366362567816791113)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P204_TRIBUTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P204_TRIBUTO'
,p_ajax_items_to_submit=>'P204_SUB_TRIBUTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_rcdo',
' from v_re_g_recaudos a',
'where a.nmro_dcmnto = :P204_N_DOCUMENTO',
'and a.id_impsto = :P204_TRIBUTO',
'and a.id_impsto_sbmpsto = :P204_SUB_TRIBUTO',
'and a.cdgo_rcdo_estdo in ( ''RG'' , ''AP'' )',
'and not a.id_rcdo in (select b.id_orgen from gf_g_saldos_favor b);'))
,p_read_only_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17122378171243125)
,p_name=>'P204_JSONVGNCIA'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(366362567816791113)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91392657659975805)
,p_name=>'P204_TPO_ORGEN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(366362567816791113)
,p_prompt=>'Tipo Origen'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion as d,',
'        a.cdgo_rcdo_orgn_tpo as r',
' from re_d_recaudo_origen_tipo a;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91393024635975809)
,p_name=>'P204_ID_ORGEN'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(366362567816791113)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101637770749135906)
,p_name=>'P204_TIPO_SAF'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(366362567816791113)
,p_prompt=>'Tipo de Saldo a Favor:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre as d,',
'       a.cdgo_sldo_fvor_tpo as r',
'from gf_d_saldos_favor_tipo    a',
'join gf_d_saldos_fvor_tpo_impsto        b   on  a.cdgo_sldo_fvor_tpo    =   b.cdgo_sldo_fvor_tpo',
'where b.id_impsto = :P204_TRIBUTO;  '))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P204_TRIBUTO'
,p_ajax_items_to_submit=>'P204_TIPO_SAF'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_display_when=>'(:P204_RGSTROS > 0 or :P204_SJTO_IMPSTO is not null )'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101638211080135911)
,p_name=>'P204_RCDO_ORGN'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(366362567816791113)
,p_prompt=>unistr('N\00FAmero Documento:')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_rcdo',
' from re_g_recaudos a',
' join re_g_recaudos_control b on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
'where b.cdgo_clnte = :F_CDGO_CLNTE ',
'and a.id_orgen = :P204_ID_ORGEN',
'and b.id_impsto = :P204_TRIBUTO',
'and b.id_impsto_sbmpsto = :P204_SUB_TRIBUTO',
'and a.cdgo_rcdo_estdo in ( ''RG'' , ''AP'' )',
'and a.id_rcdo not in ( select d.id_orgen from gf_g_saldos_favor d);'))
,p_read_only_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101663654841446626)
,p_name=>'P204_ID_RCDO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(366362567816791113)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102637983025127004)
,p_name=>'P204_SLDO_FVOR_OCLTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(366362567816791113)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103056562867098404)
,p_name=>'P204_SALDO_FAVOR'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(366362567816791113)
,p_prompt=>'Valor Saldo a Favor'
,p_display_as=>'PLUGIN_AUTONUMERIC'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'(:P204_RGSTROS > 0 or :P204_SJTO_IMPSTO is not null )'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'P204_SLDO_FVOR_OCLTO'
,p_attribute_02=>'10000000000000'
,p_attribute_03=>'1'
,p_attribute_05=>'$'
,p_attribute_06=>'p'
,p_attribute_07=>','
,p_attribute_09=>'0'
,p_attribute_10=>'null'
,p_attribute_11=>'null'
,p_attribute_12=>'null'
,p_attribute_13=>'3'
,p_attribute_14=>'.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104336415070704201)
,p_name=>'P204_PGNA'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(366362567816791113)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108992692443845201)
,p_name=>'P204_TPO_RGSTRO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(366362567816791113)
,p_item_default=>'RE'
,p_prompt=>'Tipo Registro'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>unistr('STATIC:Resoluci\00F3n;OT,Recaudo;RE')
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108994501922845220)
,p_name=>'P204_IDNTFCCION_SJTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(366362567816791113)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_read_only_when=>'P204_SJTO_IMPSTO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109039286250112303)
,p_name=>'P204_RGSTROS'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(366362567816791113)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109138295653696325)
,p_name=>'P204_SPRTE_RQRDO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(366362567816791113)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109232591774202289)
,p_name=>'P204_FILE_BLOB'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(212248399335794652)
,p_prompt=>'Archivo'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109243069504374405)
,p_name=>'P204_SEQ_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(212248399335794652)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110785260185808628)
,p_name=>'P204_OBSERVACION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(366362567816791113)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>150
,p_cHeight=>5
,p_display_when=>'(:P204_RGSTROS > 0 or :P204_SJTO_IMPSTO is not null )'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113724838145087204)
,p_name=>'P204_VALOR_SALDO_FAVOR'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(366362567816791113)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134081673886521901)
,p_name=>'P204_NMRO_RSLCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(212248399335794652)
,p_prompt=>unistr('N\00FAmero Resoluci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>5
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134081762461521902)
,p_name=>'P204_FCHA_RSLCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(212248399335794652)
,p_prompt=>unistr('Fecha Resoluci\00F3n')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(109138320179696326)
,p_computation_sequence=>10
,p_computation_item=>'P204_SPRTE_RQRDO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte => :F_CDGO_CLNTE, p_cdgo_dfncion_clnte_ctgria => ''SAF'', p_cdgo_dfncion_clnte => ''SPT'') as definicion ',
'from dual;'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(36825841549612701)
,p_validation_name=>'Valida Tipo Saldo a Favor'
,p_validation_sequence=>10
,p_validation=>'P204_TIPO_SAF'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(108997471136845249)
,p_associated_item=>wwv_flow_api.id(101637770749135906)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(108993963125845214)
,p_validation_name=>'Valida tributo'
,p_validation_sequence=>20
,p_validation=>'P204_TRIBUTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione el tributo'
,p_validation_condition=>'BTN_CONSULTAR,BTN_CNSLTAR_SJTO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(17121984882243121)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(108994076552845215)
,p_validation_name=>'Valida Tipo Origen'
,p_validation_sequence=>30
,p_validation=>'P204_TPO_ORGEN'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione el tipo de origen'
,p_when_button_pressed=>wwv_flow_api.id(101662838251446619)
,p_associated_item=>wwv_flow_api.id(91392657659975805)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(108994175744845216)
,p_validation_name=>'Valida Sub Tributo'
,p_validation_sequence=>40
,p_validation=>'P204_SUB_TRIBUTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione el Sub Tributo'
,p_validation_condition=>'BTN_CONSULTAR,BTN_CNSLTAR_SJTO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(17122038070243122)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(108994271105845217)
,p_validation_name=>'Valida numero documento'
,p_validation_sequence=>50
,p_validation=>'P204_RCDO_ORGN'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Ingrese el n\00FAmero documento o declaraci\00F3n')
,p_when_button_pressed=>wwv_flow_api.id(101662838251446619)
,p_associated_item=>wwv_flow_api.id(101638211080135911)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(109039072283112301)
,p_validation_name=>unistr('Valida Identificaci\00F3n')
,p_validation_sequence=>60
,p_validation=>'P204_IDNTFCCION_SJTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Ingrese la identificaci\00F3n')
,p_when_button_pressed=>wwv_flow_api.id(108994834998845223)
,p_associated_item=>wwv_flow_api.id(108994501922845220)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(101640506711135934)
,p_name=>'Al Seleccionar Documento'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(101638393445135912)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(101640613058135935)
,p_event_id=>wwv_flow_api.id(101640506711135934)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'capturarValorDocumento();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(103132700931541301)
,p_name=>'Desactiva boton guardar'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(17122131659243123)
,p_name=>'Al seleccionar la vigencia'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(17120581544243107)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(17122298210243124)
,p_event_id=>wwv_flow_api.id(17122131659243123)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buildJsonVigenciaPeriofo(){',
'    var region = apex.region("vgncias");',
'    ',
'    if (region) {',
'        var view = apex.region("vgncias").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'   ',
'        var json = records.map((record) => {',
'            return { "vgncia": model.getValue(record, "VGNCIA"),',
'                     "id_prdo": model.getValue(record, "ID_PRDO")',
'                   };',
'        });',
'        ',
'         $s(''P204_JSONVGNCIA'', json.length > 0 ? JSON.stringify(json) : '''');  ',
'    };',
'}',
'',
'buildJsonVigenciaPeriofo();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(109136604909696309)
,p_event_id=>wwv_flow_api.id(17122131659243123)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(108993029993845205)
,p_name=>'Al cambiar P204_TPO_RGSTRO'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P204_TPO_ORGEN'
,p_condition_element=>'P204_TPO_ORGEN'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'RE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108993132722845206)
,p_event_id=>wwv_flow_api.id(108993029993845205)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P204_TPO_ORGEN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(108993372743845208)
,p_name=>'Al cambiar '
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P204_TPO_RGSTRO'
,p_condition_element=>'P204_TPO_RGSTRO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'RE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108993410550845209)
,p_event_id=>wwv_flow_api.id(108993372743845208)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P204_TPO_ORGEN,P204_RCDO_ORGN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108995247552845227)
,p_event_id=>wwv_flow_api.id(108993372743845208)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(110782828593808604)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108994388361845218)
,p_event_id=>wwv_flow_api.id(108993372743845208)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(101662838251446619)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108995005478845225)
,p_event_id=>wwv_flow_api.id(108993372743845208)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(108994834998845223)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108994447278845219)
,p_event_id=>wwv_flow_api.id(108993372743845208)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(101662838251446619)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108994681488845221)
,p_event_id=>wwv_flow_api.id(108993372743845208)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P204_IDNTFCCION_SJTO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108993624813845211)
,p_event_id=>wwv_flow_api.id(108993372743845208)
,p_event_result=>'FALSE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P204_TPO_ORGEN,P204_RCDO_ORGN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108994969193845224)
,p_event_id=>wwv_flow_api.id(108993372743845208)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(108994834998845223)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108994751093845222)
,p_event_id=>wwv_flow_api.id(108993372743845208)
,p_event_result=>'FALSE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P204_IDNTFCCION_SJTO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108995159235845226)
,p_event_id=>wwv_flow_api.id(108993372743845208)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(110782828593808604)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(108995685406845231)
,p_name=>unistr('Limpiar sessi\00F3n')
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P204_TPO_RGSTRO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108995723268845232)
,p_event_id=>wwv_flow_api.id(108995685406845231)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if($v("P204_SJTO_IMPSTO") !== ""){',
'    $("#refrescar").click()',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(108995814749845233)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Crea colecci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'    APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''VGNCIA_PRDO'');',
'End;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P204_SJTO_IMPSTO'
,p_process_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(91393152288975810)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Origen'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'     ',
'    if :P204_TPO_ORGEN = ''DC'' then',
'    ',
'        begin',
'            select  a.id_dcmnto',
'            into :P204_ID_ORGEN',
'            from re_g_documentos a',
'            where a.cdgo_clnte = :F_CDGO_CLNTE',
'            and a.id_impsto = :P204_TRIBUTO',
'            and a.id_impsto_sbmpsto = :P204_SUB_TRIBUTO',
'            and a.nmro_dcmnto = :P204_RCDO_ORGN ;',
'        exception',
'            when others then',
'                 :P204_ID_ORGEN := null;',
'                 insert into muerto(v_001) values (''Exception de documento'');',
'        end;',
'        ',
'    else',
'    ',
'        begin',
'            select  a.id_dclrcion',
'            into :P204_ID_ORGEN',
'            from gi_g_declaraciones a',
'            where a.cdgo_clnte = :F_CDGO_CLNTE',
'            and a.id_impsto = :P204_TRIBUTO',
'            and a.id_impsto_sbmpsto = :P204_SUB_TRIBUTO',
'            and a.nmro_cnsctvo = :P204_RCDO_ORGN;',
'        exception',
'            when others then',
'                 :P204_ID_ORGEN := null;',
'        end;',
'        ',
'    end if;',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(108995392871845228)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta sujeto impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.id_sjto_impsto',
'    into :P204_SJTO_IMPSTO',
'    from v_si_i_sujetos_impuesto a',
'    where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.idntfccion_sjto = :P204_IDNTFCCION_SJTO',
'    and a.id_impsto = :P204_TRIBUTO;',
'exception',
'    when others then',
'        :P204_SJTO_IMPSTO := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(108994834998845223)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(109039314741112304)
,p_process_sequence=>40
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Obtener numero registros documentos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(a.id_rcdo)',
'into :P204_RGSTROS',
' from re_g_recaudos a',
' join re_g_recaudos_control b on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
'where b.cdgo_clnte = :F_CDGO_CLNTE ',
'and a.id_orgen = :P204_ID_ORGEN',
'and b.id_impsto = :P204_TRIBUTO',
'and b.id_impsto_sbmpsto = :P204_SUB_TRIBUTO',
'and a.cdgo_rcdo_estdo in ( ''RG'' , ''AP'' )',
'and a.id_rcdo not in ( ',
'                        select d.id_orgen ',
'                        from gf_g_saldos_favor d',
'                        where d.cdgo_clnte = :F_CDGO_CLNTE',
'                        and d.id_orgen is not null',
'                     );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(109243300280374408)
,p_process_sequence=>50
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('--Elimina los Datos de la Colecci\00F3n'),
' apex_collection.delete_member( p_collection_name => ''VGNCIA_PRDO''',
'                              , p_seq             => :P204_SEQ_ID );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'eliminar'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(108997269284845247)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(108996095835845235)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Guardar Vigencias'
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_rsltdo number;',
'begin',
'    case :APEX$ROW_STATUS',
'    when ''C'' then',
'        ',
'        select count(seq_id)',
'        into v_rsltdo',
'        from apex_collections    a    ',
'        where collection_name = ''VGNCIA_PRDO''',
'        and c001 = :VGNCIA',
'        and c002 = :PRDO;',
'        ',
'        if v_rsltdo > 0 then',
unistr('            raise_application_error( -20001 , ''La vigencia '' || :VGNCIA || '' y per\00EDodo '' || :PRDO || '' ya se agregaron'' );'),
'        end if;',
'    ',
'        :SEQ_ID := apex_collection.add_member( p_collection_name => ''VGNCIA_PRDO''',
'											  , p_c001            => :VGNCIA ',
'											  , p_c002            => :PRDO',
'                                              , p_c003            => ''PV'');    ',
'        ',
'',
'        ',
'    when ''D'' then',
unistr('         --Elimina los Datos de la Colecci\00F3n'),
'         apex_collection.delete_member( p_collection_name => ''VGNCIA_PRDO''',
'                                      , p_seq             => :SEQ_ID );',
'    end case;',
'end;'))
,p_attribute_05=>'Y'
,p_attribute_06=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(109137569641696318)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Agregar Adjunto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_blob blob;',
'     v_seq  varchar2(4000);',
'     r_temp_files apex_application_temp_files%rowtype;',
'begin',
'    -- Consultamos el archivo cargado en la tabla temporal    ',
'    begin            ',
'        select *',
'          into r_temp_files',
'          from apex_application_temp_files',
'         where name = :P204_FILE_BLOB;',
'    exception ',
'        when no_data_found then',
'            v_blob := null;  ',
'    end;',
'    ',
'    -- Validamos que el archivo no este vacio',
'    if r_temp_files.filename is not null ',
'       and :P204_NMRO_RSLCION is not null and :P204_FCHA_RSLCION is not null -- Req. 0023623',
'       then',
'    ',
'        -- Adicionamos el registro a la coleccion ',
'        apex_collection.add_member( p_collection_name   => ''VGNCIA_PRDO''',
'                                  , p_c003              => ''SP''',
'                                  , p_c004              => r_temp_files.filename',
'                                  , p_c005              => r_temp_files.mime_type',
'                                  , p_c006              => :P204_NMRO_RSLCION',
'                                  , p_d002              => :P204_FCHA_RSLCION',
'                                  , p_blob001           => r_temp_files.blob_content );',
'             ',
'    else',
unistr('        raise_application_error(-20001, ''Debe ingresar informaci\00F3n del soporte a adjuntar'');'),
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(109231763992202276)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(109136509991696308)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta   number;',
'    v_mnsje_rspsta  varchar2(3000);',
'    v_id_sldo_fvor  number;',
'    v_sprte         number;',
'    v_vgncia_prdo   clob;',
'    v_exception     exception;',
'    r_temp_files   apex_application_temp_files%rowtype;',
'begin',
' ',
'    if :P204_TPO_RGSTRO = ''OT'' then',
'',
'        declare',
'            v_json          json_object_t := new json_object_t();',
'            vgncia_prdo     json_array_t  := json_array_t();',
'            v_vgncia_prdo   clob;',
'        begin',
'        ',
'            for c_vgncia_prdo in (',
'                                    select  seq_id,',
'                                            c001 as vgncia,',
'                                            c002 as prdo',
'                                    from APEX_collections    a    ',
'                                    where collection_name = ''VGNCIA_PRDO''',
'                                    and c003 = ''PV''',
'                                 ) loop',
'',
'                --Se construye el json de vigencia periodo',
'                v_json.put(''vgncia'',  c_vgncia_prdo.vgncia); ',
'                v_json.put(''id_prdo'', c_vgncia_prdo.prdo);',
'                vgncia_prdo.append(v_json);',
'',
'            end loop;',
'            ',
'            :P204_JSONVGNCIA := vgncia_prdo.to_clob();',
'        end;',
'        ',
'    end if;',
' ',
'    if(:P204_SLDO_FVOR_OCLTO is null) then',
'         v_cdgo_rspsta := 1;',
'         v_mnsje_rspsta := ''El valor del saldo a favor es requerido'';',
'         raise v_exception;',
'    end if;',
'    ',
'    if(to_number(:P204_SLDO_FVOR_OCLTO) > to_number(:P204_VALOR_SALDO_FAVOR)) then',
'         v_cdgo_rspsta := 2;',
'         v_mnsje_rspsta := ''El valor del saldo a favor no puede ser mayor al valor del documento'';',
'         raise v_exception;',
'    end if;',
'    ',
'    if(:P204_JSONVGNCIA is null or :P204_JSONVGNCIA = ''[]'') then',
'         v_cdgo_rspsta := 3;',
'         v_mnsje_rspsta := ''Agregue las vigencias del documento.'';',
'         raise v_exception;',
'    end if;',
'    ',
'    if(:P204_TIPO_SAF is null) then',
'         v_cdgo_rspsta := 4;',
'         v_mnsje_rspsta := ''Seleccione el tipo de saldo a favor.'';',
'         raise v_exception;',
'    end if;',
'    ',
'    begin',
'        select  count(seq_id)',
'        into v_sprte',
'        from APEX_collections    a    ',
'        where collection_name = ''VGNCIA_PRDO''',
'        and c003 = ''SP'';',
'    end;',
'    ',
'    if(:P204_SPRTE_RQRDO = ''S'' and :P204_TPO_RGSTRO = ''OT'' and v_sprte = 0',
'        and :P204_NMRO_RSLCION is null and :P204_NMRO_RSLCION is null --- req. 0023623',
'      ) then',
'         v_cdgo_rspsta := 5;',
unistr('         v_mnsje_rspsta := ''Adjunte al menos un soporte con su n\00FAmero y fecha de resoluci\00F3n'';'),
'         raise v_exception;',
'    end if;',
'    ',
'    pkg_gf_saldos_favor.prc_rg_saldos_favor( p_cdgo_clnte      =>  :F_CDGO_CLNTE,',
'                                             p_id_impsto =>           :P204_TRIBUTO,',
'                                             p_id_impsto_sbmpsto  =>  :P204_SUB_TRIBUTO, ',
'                                             p_id_sjto_impsto =>      :P204_SJTO_IMPSTO,',
'                                             p_vlor_sldo_fvor =>      :P204_SLDO_FVOR_OCLTO,',
'                                             p_cdgo_sldo_fvor_tpo =>  :P204_TIPO_SAF,',
'                                             p_id_orgen           =>  :P204_ID_RCDO,',
'                                             p_nmro_dcmnto        =>  :P204_N_DOCUMENTO,',
'                                             p_id_usrio           =>  :F_ID_USRIO,',
'                                             p_indcdor_rgstro     =>  ''M'',',
'                                             p_obsrvcion          =>  :P204_OBSERVACION,',
'                                             p_json_pv            =>  :P204_JSONVGNCIA,',
'                                             o_id_sldo_fvor       =>  v_id_sldo_fvor,',
'                                             o_cdgo_rspsta        =>  v_cdgo_rspsta,',
'                                             o_mnsje_rspsta       =>  v_mnsje_rspsta);',
'    if v_cdgo_rspsta > 0 then',
'        raise v_exception;',
'    end if;',
'    ',
'    begin',
'    ',
'        for c_sprte in (',
'                            select  seq_id,',
'                                    c004 as nombre,',
'                                    c005 as filemymetype,',
'                                    blob001 as blobfile ,',
'                                    c006 as num_resolucion ,',
'                                    d002 as fec_rsolucion',
'                            from APEX_collections    a    ',
'                            where collection_name = ''VGNCIA_PRDO''',
'                            and c003 = ''SP''',
'                       ) loop',
'        ',
'            insert into gf_g_saldos_favor_soporte(id_sldo_fvor,      ',
'                                                  file_blob,        ',
'                                                  file_name,      ',
'                                                  file_mimetype ,',
'                                                  nmro_rslcion , ',
'                                                  fcha_rslcion',
'                                                 )',
'                                           values(v_id_sldo_fvor,    ',
'                                                  c_sprte.blobfile, ',
'                                                  c_sprte.nombre, ',
'                                                  c_sprte.filemymetype ,',
'                                                  c_sprte.num_resolucion ,',
'                                                  c_sprte.fec_rsolucion',
'                                                 );',
'        end loop;',
'    end;',
'        ',
'exception',
'    when v_exception then',
'        rollback;',
'        raise_application_error(-20111,v_mnsje_rspsta);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(108997471136845249)
);
end;
/
