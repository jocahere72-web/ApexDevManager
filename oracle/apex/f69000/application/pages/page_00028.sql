prompt --application/pages/page_00028
begin
wwv_flow_api.create_page(
 p_id=>28
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>'Tipo de Novedad / Sujeto Impuesto'
,p_step_title=>'Tipo de Novedad / Sujeto Impuesto'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js'
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css'
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'CNEGRETE'
,p_last_upd_yyyymmddhh24miss=>'20250526153023'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4308057728725302)
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
 p_id=>wwv_flow_api.id(4307990647725301)
,p_plug_name=>'Datos Solicitud'
,p_parent_plug_id=>wwv_flow_api.id(4308057728725302)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P28_ID_SLCTUD'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4308713814725309)
,p_plug_name=>'Adjuntos'
,p_parent_plug_id=>wwv_flow_api.id(4307990647725301)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.file_name',
'     , a.file_mimetype',
'     , a.obsrvcion',
'     , a.file_blob',
'     , a.id_dcmnto',
'     , b.dscrpcion_dcmnto',
'  from pq_g_documentos          a',
'  join v_pq_d_motivos_documento b  on a.id_mtvo_dcmnto = b.id_mtvo_dcmnto',
' where a.id_slctud = :P28_ID_SLCTUD;'))
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
 p_id=>wwv_flow_api.id(4308802371725310)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'AMOLINA'
,p_internal_uid=>4308802371725310
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4309260130725314)
,p_db_column_name=>'FILE_BLOB'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'File Blob'
,p_column_type=>'OTHER'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTOS:FILE_BLOB:ID_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<span class="fa fa-cloud-arrow-down" aria-hidden="true"></span>:'
,p_display_condition_type=>'NEVER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4309381457725315)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4309402962725316)
,p_db_column_name=>'FILE_MIMETYPE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4309618349725318)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Observaci\00F3n ')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4310025486725322)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>90
,p_column_identifier=>'L'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTOS:FILE_BLOB:ID_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<span class="fa fa-cloud-arrow-down" aria-hidden="true"></span>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4344804523827401)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>100
,p_column_identifier=>'M'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(4329868626835243)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'43299'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_DCMNTO:FILE_NAME:FILE_MIMETYPE:OBSRVCION:ID_DCMNTO:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5997802661900101)
,p_plug_name=>'Observaciones Novedad'
,p_parent_plug_id=>wwv_flow_api.id(4308057728725302)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1 ',
'from si_g_novedades_observacion a',
'join sg_g_usuarios b on a.id_usrio = b.id_usrio',
'join si_c_terceros c on b.id_trcro = c.id_trcro',
'where id_instncia_fljo = :F_ID_INSTNCIA_FLJO;'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5998020072900103)
,p_plug_name=>'observaciones'
,p_parent_plug_id=>wwv_flow_api.id(5997802661900101)
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
'where id_instncia_fljo = :F_ID_INSTNCIA_FLJO;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(6027306194254045)
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
 p_id=>wwv_flow_api.id(6027461297254046)
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
 p_id=>wwv_flow_api.id(6027560628254047)
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
 p_id=>wwv_flow_api.id(6027679553254048)
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
 p_id=>wwv_flow_api.id(6027725543254049)
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
 p_id=>wwv_flow_api.id(6027836186254050)
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
 p_id=>wwv_flow_api.id(6069938619364001)
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
 p_id=>wwv_flow_api.id(6070077749364002)
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
 p_id=>wwv_flow_api.id(6070145176364003)
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
 p_id=>wwv_flow_api.id(6027265477254044)
,p_internal_uid=>6027265477254044
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
 p_id=>wwv_flow_api.id(6075878641364200)
,p_interactive_grid_id=>wwv_flow_api.id(6027265477254044)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(6075989311364200)
,p_report_id=>wwv_flow_api.id(6075878641364200)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6076471620364201)
,p_view_id=>wwv_flow_api.id(6075989311364200)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(6027306194254045)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6076994104364203)
,p_view_id=>wwv_flow_api.id(6075989311364200)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(6027461297254046)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6077458544364204)
,p_view_id=>wwv_flow_api.id(6075989311364200)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(6027560628254047)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6077972653364205)
,p_view_id=>wwv_flow_api.id(6075989311364200)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(6027679553254048)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6078455690364207)
,p_view_id=>wwv_flow_api.id(6075989311364200)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(6027725543254049)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6078964850364208)
,p_view_id=>wwv_flow_api.id(6075989311364200)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(6027836186254050)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6079360412364209)
,p_view_id=>wwv_flow_api.id(6075989311364200)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(6069938619364001)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6079813079364211)
,p_view_id=>wwv_flow_api.id(6075989311364200)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(6070077749364002)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>166.525
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6080355379364212)
,p_view_id=>wwv_flow_api.id(6075989311364200)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(6070145176364003)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200.52499999999998
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69304230457464539)
,p_plug_name=>'Tipo de Novedad'
,p_parent_plug_id=>wwv_flow_api.id(4308057728725302)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
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
 p_id=>wwv_flow_api.id(69604719852593313)
,p_plug_name=>'Sujeto Impuesto'
,p_region_name=>'sujeto_impuesto'
,p_parent_plug_id=>wwv_flow_api.id(69304230457464539)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P28_ID_SJTO_IMPSTO'
,p_attribute_01=>'P28_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69304745799464544)
,p_plug_name=>'Flujo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
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
 p_id=>wwv_flow_api.id(69923824048066001)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
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
'    <center><b> Paso 1 Tipo de Novedad y Sujeto Tributo.</b> </center><br>',
'    <b> 1</b> Se debe seleccionar el tipo de la Novedad.<br> <br>',
'    <b> 2</b> Consultar el Sujeto Tributo<br>',
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>',
'',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(70026051596601403)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(70026150549601404)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(70026051596601403)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=68000:26:&SESSION.::&DEBUG.:RP,28,29,30,31,34,35,55::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(69603801427593304)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(69304230457464539)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(69604024527593306)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(69304230457464539)
,p_button_name=>'BTN_CONSULTA_PARAMETROS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>unistr('Consulta Par\00E1metros')
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(69604656245593312)
,p_branch_name=>unistr('Ir a P\00E1gina 3')
,p_branch_action=>'f?p=71000:3:&SESSION.::&DEBUG.:RP:P3_NMRO_APP,P3_NMRO_PGNA,P3_NMBRE_ITEM,P3_ID_IMPSTO,P3_IMPSTO_SBMPSTO,P3_NMBRE_ITEM_IMPSTO,P3_NMBRE_ITEM_SBIMPSTO:&APP_ID.,&APP_PAGE_ID.,P28_ID_SJTO_IMPSTO,&P28_ID_IMPSTO.,&P28_ID_IMPSTO_SBMPSTO.,P28_ID_IMPSTO,P28_ID_IMPSTO_SBMPSTO&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(69604024527593306)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4300930475203904)
,p_name=>'P28_ID_SLCTUD'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(69304230457464539)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4308121976725303)
,p_name=>'P28_DSCRPCION_ESTDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(4307990647725301)
,p_prompt=>'Estado'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4308287913725304)
,p_name=>'P28_NMBRE_RDCDOR'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(4307990647725301)
,p_prompt=>'Radicador'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4308336165725305)
,p_name=>'P28_NMBRE_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(4307990647725301)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4308423026725306)
,p_name=>'P28_NMBRE_IMPSTO_SBMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(4307990647725301)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4308576187725307)
,p_name=>'P28_IDNTFCCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(4307990647725301)
,p_prompt=>'Identificacion del Sujeto'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4308675029725308)
,p_name=>'P28_DSCRPCION_MTVO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(4307990647725301)
,p_prompt=>'Motivo'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4364068457417601)
,p_name=>'P28_ID_INSTNCIA_FLJO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(69304230457464539)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4421606250579301)
,p_name=>'P28_NMRO_RDCDO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(4307990647725301)
,p_prompt=>'Numero Radicado '
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4421721623579302)
,p_name=>'P28_FCHA_RDCDO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(4307990647725301)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11923077619560001)
,p_name=>'P28_RECHAZAR'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(4307990647725301)
,p_item_default=>'N'
,p_prompt=>'Rechazar Solicitud'
,p_source=>'N'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_grid_column=>11
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'Si'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69304394405464540)
,p_name=>'P28_CDGO_NVDAD_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(69304230457464539)
,p_item_default=>'CNC'
,p_prompt=>'Tipo de Novedad'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select dscrpcion',
'        , cdgo_nvdad_tpo',
'    from si_d_novedades_tipo',
'    where cdgo_sjto_tpo = ''E''',
' order by dscrpcion'))
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'4'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69603511523593301)
,p_name=>'P28_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(69304230457464539)
,p_prompt=>'Tributos'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select upper(nmbre_impsto)',
'        , id_impsto',
'     from df_c_impuestos',
'    where cdgo_clnte        = :F_CDGO_CLNTE',
'      and cdgo_sjto_tpo     = ''E''',
' order by nmbre_impsto'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Selecciones un Tributo -- '
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69603651293593302)
,p_name=>'P28_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(69304230457464539)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select upper(nmbre_impsto_sbmpsto)',
'        , id_impsto_sbmpsto',
'     from df_i_impuestos_subimpuesto',
'    where id_impsto        = :P28_ID_IMPSTO',
' order by nmbre_impsto_sbmpsto'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Selecciones un Sub-Tributo -- '
,p_lov_cascade_parent_items=>'P28_ID_IMPSTO'
,p_ajax_items_to_submit=>'P28_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69603718762593303)
,p_name=>'P28_PRMTRO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(69304230457464539)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69604469741593310)
,p_name=>'P28_RSPSTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(69304230457464539)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69604505016593311)
,p_name=>'P28_ID_SJTO_IMPSTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(69304230457464539)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69751711576707504)
,p_name=>'P28_ID_NVDAD_PRSNA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(69304230457464539)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69795053243733802)
,p_name=>'P28_CDGO_NVDAD_PRSNA_ESTDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(69304230457464539)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70164368132059205)
,p_name=>'P28_MSTRAR_BTNES'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(69304745799464544)
,p_source=>'true'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76581200014714601)
,p_name=>'P28_RSPSTA_EXSTE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(69304230457464539)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76589188328742601)
,p_name=>'P28_FCHA_RDCDO_VLDCION'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(69304230457464539)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76589255057742602)
,p_name=>'P28_NMRO_RDCDO_DSPLAY_VLDCION'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(69304230457464539)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76589307119742603)
,p_name=>'P28_NMBRE_TRCRO_VLDCION'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(69304230457464539)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76589430909742604)
,p_name=>'P28_FCHA_RGSTRO_VLDCION'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(69304230457464539)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(152314254599921502)
,p_name=>'P28_DSCRPCION_NVDAD_TPO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(69304230457464539)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(12073344139141101)
,p_computation_sequence=>10
,p_computation_item=>'P28_RECHAZAR'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''N''',
'from dual;'))
,p_compute_when=>'P28_ID_SLCTUD'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(152314324202921503)
,p_computation_sequence=>20
,p_computation_item=>'P28_DSCRPCION_NVDAD_TPO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select dscrpcion',
'    from si_d_novedades_tipo',
'    where cdgo_sjto_tpo = ''E''',
'        and cdgo_nvdad_tpo =  :P28_CDGO_NVDAD_TPO'))
,p_compute_when=>'P28_CDGO_NVDAD_TPO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
begin
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(69851740297108421)
,p_validation_name=>'Validar que el Sujeto Impuesto exista'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    ',
'begin',
'    select id_sjto_impsto',
'      into v_id_sjto_impsto',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte                = :F_CDGO_CLNTE',
'       and id_impsto                 = :P28_ID_IMPSTO',
'       and idntfccion_sjto           = :P28_PRMTRO;',
'    ',
'   return true;',
'exception',
'    when no_data_found then ',
'        return false;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'El Sujeto Tributo consultado no existe'
,p_validation_condition=>'P28_CDGO_NVDAD_TPO'
,p_validation_condition2=>'INS'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(69603801427593304)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(69851601873108420)
,p_validation_name=>unistr('Validar que el sujeto impuesto este activo cuando es Actualizaci\00F3n y cancelaci\00F3n')
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    ',
'begin',
'    select id_sjto_impsto',
'      into v_id_sjto_impsto',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte                = :F_CDGO_CLNTE',
'       and id_impsto                 = :P28_ID_IMPSTO',
'       and idntfccion_sjto          = :P28_PRMTRO--- or id_sjto_impsto = :P28_ID_SJTO_IMPSTO)',
'       and id_sjto_estdo             in (1,3);  --Se agrega el estado Omiso para que sea actualizado y se pasa a estado activo',
'    ',
'   return true;',
'exception',
'    when no_data_found then ',
'        return false;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'El sujeto tributo consultado no se encuentra activo'
,p_validation_condition=>':P28_CDGO_NVDAD_TPO not in (''ACV'', ''INS'') AND :P28_RECHAZAR = ''N'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(74278847099754901)
,p_validation_name=>unistr('Validar que el sujeto impuesto este inactivo cuando es Activaci\00F3n')
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    ',
'begin',
'    select id_sjto_impsto',
'      into v_id_sjto_impsto',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte                = :F_CDGO_CLNTE',
'       and id_impsto                 = :P28_ID_IMPSTO',
'       and idntfccion_sjto           = :P28_PRMTRO',
'       and id_sjto_estdo             in (2,3);  --Se le agrega el estado de omiso desconocido para que pueda ser activado',
'    ',
'   return true;',
'exception',
'    when no_data_found then ',
'        return false;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'El sujeto tributo consultado ya se encuentra activo'
,p_validation_condition=>':P28_CDGO_NVDAD_TPO =''ACV'' AND :P28_RECHAZAR = ''N'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(69946739702237701)
,p_validation_name=>unistr('Validar que el parametro no sea Nulo al hacer clic en elbot\00F3n consultar')
,p_validation_sequence=>40
,p_validation=>'P28_PRMTRO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Debe ingresar una identificaci\00F3n para consultar')
,p_when_button_pressed=>wwv_flow_api.id(69603801427593304)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(151903637067262902)
,p_validation_name=>unistr('Validar que el Sujeto Impuesto no exista para inscripci\00F3n')
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select id_sjto_impsto',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte                = :F_CDGO_CLNTE',
'       and id_impsto                 = :P28_ID_IMPSTO',
'       and idntfccion_sjto           = nvl(:P28_PRMTRO, :P28_IDNTFCCION);'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'El Sujeto Tributo consultado ya se encuentra inscrito'
,p_validation_condition=>':P28_CDGO_NVDAD_TPO = ''INS'' and :P28_RECHAZAR =''N'''
,p_validation_condition_type=>'SQL_EXPRESSION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(151903779595262903)
,p_validation_name=>'Validar que el Sujeto Impuesto no tenga una inscripcion por gestionar'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'  select  a.fcha_rgstro',
'        , d.nmbre_trcro',
'        , e.nmro_rdcdo_dsplay',
'        , e.fcha_rdcdo ',
'  into  :P28_FCHA_RGSTRO_VLDCION',
'        ,  :P28_NMBRE_TRCRO_VLDCION',
'        ,  :P28_NMRO_RDCDO_DSPLAY_VLDCION',
'        ,  :P28_FCHA_RDCDO_VLDCION',
'  from si_g_novedades_persona a join si_g_novedades_persona_sjto b on b.id_nvdad_prsna = a.id_nvdad_prsna',
'                                                                  and b.idntfccion = nvl(:P28_PRMTRO, :P28_IDNTFCCION)',
'                                join  wf_g_instancias_transicion c on c.id_instncia_fljo = a.id_instncia_fljo',
'                                                                   and c.id_estdo_trnscion in (1,2)',
'                                join  v_sg_g_usuarios            d on d.id_usrio =  c.id_usrio',
'                                left join pq_g_solicitudes       e on e.id_slctud = a.id_slctud',
'  where a.cdgo_clnte      = :F_CDGO_CLNTE',
'        and  a.id_impsto  = :P28_ID_IMPSTO',
'      	and a.cdgo_nvdad_tpo  = ''INS''',
'        and a.cdgo_nvdad_prsna_estdo = ''RGS'';',
'',
unistr('		:P28_RSPSTA_EXSTE := :F_NMBRE_USRIO || ''. '' || ''El Sujeto Tributo consultado ya tiene una solicitud de inscripci\00F3n pendiente por Aprobar \00F3 Rechazar asignada al sr(a) '' '),
'                                || :P28_NMBRE_TRCRO_VLDCION || '', con fecha ''|| :P28_FCHA_RGSTRO_VLDCION ||  ',
unistr('                                ''.    Por este motivo, no es posible continuar con la inscripci\00F3n. ''||  :P28_NMRO_RDCDO_DSPLAY_VLDCION;'),
'',
'        return false;',
'exception ',
'	when no_data_found then ',
'		return true;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'&P28_RSPSTA_EXSTE.'
,p_validation_condition=>':P28_CDGO_NVDAD_TPO = ''INS'' and :P28_RECHAZAR =''N'''
,p_validation_condition_type=>'SQL_EXPRESSION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(70163963524059201)
,p_name=>'Cuando el Sujeto Impuesto Seleccionado esta Inactivo'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'EXISTS'
,p_display_when_cond=>'select 1 from si_i_sujetos_impuesto where id_sjto_impsto = :P28_ID_SJTO_IMPSTO and id_sjto_estdo = 2 and :P28_CDGO_NVDAD_TPO != ''ACV'''
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70164261831059204)
,p_event_id=>wwv_flow_api.id(70163963524059201)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
' ',
'    Swal.fire({',
'        icon: ''error'',',
'        title:  ''<H2 >NOVEDADES DE PERSONAS</H2>'',',
'        html: ''<H4>El Sujeto Tributo seleccionado NO esta Activo.</H4>'' ',
'    });',
unistr('    // Se ocultan las regiones de informaci\00F3n b\00E1sica, convenio y cuotas'),
'    apex.item( "sujeto_impuesto" ).hide();',
'    apex.item( ":P28_ID_SJTO_IMPSTO" ).setValue(null);',
'    apex.item( ":P28_MSTRAR_BTNES" ).setValue(''false'');',
'',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(70678632472912401)
,p_name=>'Inabilitar Botones cuando la novedad ya esta registrada'
,p_event_sequence=>20
,p_condition_element=>'P28_ID_NVDAD_PRSNA'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70678754119912402)
,p_event_id=>wwv_flow_api.id(70678632472912401)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(69604024527593306)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70678892747912403)
,p_event_id=>wwv_flow_api.id(70678632472912401)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(69603801427593304)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(11923138488560002)
,p_name=>'Actualizar pagina'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P28_RECHAZAR'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11923212380560003)
,p_event_id=>wwv_flow_api.id(11923138488560002)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(151920996484542401)
,p_name=>unistr('Al cambiar actualizar en la colecci\00F3n el nuevo valor')
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P28_CDGO_NVDAD_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(151927299230569407)
,p_event_id=>wwv_flow_api.id(151920996484542401)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P28_CDGO_NVDAD_TPO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69604282411593308)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Sujeto Impuesto x BTN_CONSULTAR'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    ',
'begin',
'    select id_sjto_impsto',
'      into v_id_sjto_impsto',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte                = :F_CDGO_CLNTE',
'       and id_impsto                 = :P28_ID_IMPSTO',
'       and idntfccion_sjto           = :P28_PRMTRO;',
'    ',
'   :P28_RSPSTA := ''Consulta Exitosa'';',
'   :P28_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'   :P28_MSTRAR_BTNES := ''true'';',
'exception',
'    when no_data_found then ',
'    :P28_ID_SJTO_IMPSTO := null;',
'    :P28_RSPSTA := ''No Existe el Sujeto Impuesto'';',
'   :P28_MSTRAR_BTNES := ''false'';',
'end;'))
,p_process_error_message=>'&P28_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(69603801427593304)
,p_process_when=>'P28_PRMTRO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'&P28_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69962830464439501)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_PROCESO_WORKFLOW'
,p_process_name=>'Proceso WorkFlow'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'WORKFLOW'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69751623061707503)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta de Novedad Persona'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'   select id_nvdad_prsna',
'        , id_nvdad_prsna',
'        , id_impsto',
'        , id_impsto_sbmpsto',
'        , cdgo_nvdad_tpo',
'        , id_slctud',
'        , obsrvcion',
'        , cdgo_nvdad_prsna_estdo',
'     into :P28_ID_NVDAD_PRSNA',
'        , :P30_ID_NVDAD_PRSNA',
'        , :P28_ID_IMPSTO',
'        , :P28_ID_IMPSTO_SBMPSTO',
'        , :P28_CDGO_NVDAD_TPO',
'        , :P28_ID_SJTO_IMPSTO',
'        , :P29_OBSRVCION',
'        , :P28_CDGO_NVDAD_PRSNA_ESTDO',
'     from si_g_novedades_persona',
'    where id_nvdad_prsna            = :P28_ID_NVDAD_PRSNA;',
'exception',
'    when others then ',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4300855115203903)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.id_slctud',
'         , a.id_impsto',
'         , a.id_impsto_sbmpsto',
'       --  , a.idntfccion',
'       --  , ''INS''',
'         , a.dscrpcion_estdo',
'         , a.nmbre_rdcdor',
'         , a.nmbre_impsto',
'         , a.nmbre_impsto_sbmpsto',
'         , a.idntfccion',
'         , a.dscrpcion_mtvo',
'         , a.nmro_rdcdo',
'         , trunc(a.fcha_rdcdo)',
'     into :P28_ID_SLCTUD',
'        , :P28_ID_IMPSTO',
'        , :P28_ID_IMPSTO_SBMPSTO',
'      --  , :P28_PRMTRO',
'       -- , :P28_CDGO_NVDAD_TPO',
'        , :P28_DSCRPCION_ESTDO',
'        , :P28_NMBRE_RDCDOR',
'        , :P28_NMBRE_IMPSTO',
'        , :P28_NMBRE_IMPSTO_SBMPSTO',
'        , :P28_IDNTFCCION',
'        , :P28_DSCRPCION_MTVO',
'        , :P28_NMRO_RDCDO',
'        , :P28_FCHA_RDCDO',
'     from v_pq_g_solicitudes a',
'    where a.id_instncia_fljo_gnrdo = :F_ID_INSTNCIA_FLJO;',
'exception ',
'    when no_data_found then',
'        :P28_ID_SLCTUD := '''';',
'       -- :P28_ID_IMPSTO := '''';',
'       -- :P28_ID_IMPSTO_SBMPSTO := '''';',
'       -- :P28_PRMTRO := '''';',
'       -- :P28_CDGO_NVDAD_TPO := '''';',
'        :P28_DSCRPCION_ESTDO := '''';',
'        :P28_NMBRE_RDCDOR := '''';',
'        :P28_NMBRE_IMPSTO := '''';',
'        :P28_NMBRE_IMPSTO_SBMPSTO := '''';',
'        :P28_IDNTFCCION := '''';',
'        :P28_DSCRPCION_MTVO  := '''';',
'end; '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(151903505415262901)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar colecciones'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if  apex_collection.collection_exists (p_collection_name => ''RESPONSABLES'') then',
'    apex_collection.delete_collection (p_collection_name => ''RESPONSABLES'');',
'end if;',
'if  apex_collection.collection_exists (p_collection_name => ''SUCURSALES'') then',
'    apex_collection.delete_collection (p_collection_name => ''SUCURSALES'');',
'end if;',
'if  apex_collection.collection_exists (p_collection_name => ''ADJUNTOS_NOVEDADES_PERSONA'') then',
'    apex_collection.delete_collection (p_collection_name => ''ADJUNTOS_NOVEDADES_PERSONA'');',
'end if;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
