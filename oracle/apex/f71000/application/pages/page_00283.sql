prompt --application/pages/page_00283
begin
wwv_flow_api.create_page(
 p_id=>283
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Resumen de Acuerdo de Pago'
,p_step_title=>'Resumen de Acuerdo de Pago'
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-controlsContainer {',
'    display: none;',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20210826103908'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(221937654158378745)
,p_plug_name=>'Datos del Convenio'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(177374655004050691)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(93753112655784101)
,p_plug_name=>'Display Selector'
,p_parent_plug_id=>wwv_flow_api.id(221937654158378745)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(93753206574784102)
,p_plug_name=>'<b>NOVEDADES</b>'
,p_parent_plug_id=>wwv_flow_api.id(93753112655784101)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(93753354196784103)
,p_plug_name=>unistr('<b>Modificaci\00F3n de Acuerdos de Pagos</b>')
,p_parent_plug_id=>wwv_flow_api.id(93753206574784102)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--hiddenOverflow:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.dscrpcion_cnvnio_mdfccion_tpo',
'        , a.dscrpcn_mdfccion_nmro_cta_tpo',
'        , a.nvo_nmro_cta',
'        , a.fcha_sgte_cta',
'        , a.dscrpcion_prdcdad_cta',
'        , a.fcha_rgstro',
'        , a.dscrpcn_cnvnio_mdfccion_estdo',
'        , a.nmbre_slctnte',
'        , a.nmro_idntfccion_slctnte',
'        , a.id_acto',
'     from v_gf_g_convenios_modificacion a',
'    where id_cnvnio                     = :P283_ID_CNVNIO',
' order by a.fcha_rgstro'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>'select 1 from gf_g_convenios_modificacion where id_cnvnio = :P283_ID_CNVNIO'
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
 p_id=>wwv_flow_api.id(93753577178784105)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>93753577178784105
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93753650252784106)
,p_db_column_name=>'DSCRPCION_CNVNIO_MDFCCION_TPO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Tipo de Modificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93753794111784107)
,p_db_column_name=>'DSCRPCN_MDFCCION_NMRO_CTA_TPO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Tipo de modificaci\00F3n <br> de cuotas')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93753875041784108)
,p_db_column_name=>'NVO_NMRO_CTA'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Nuevo N\00FAmero de Cuotas')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93753908749784109)
,p_db_column_name=>'FCHA_SGTE_CTA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Fecha Siguiente Cuota'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93754012077784110)
,p_db_column_name=>'DSCRPCION_PRDCDAD_CTA'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Periodicidad'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93754186291784111)
,p_db_column_name=>'FCHA_RGSTRO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Fecha de Registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93754288770784112)
,p_db_column_name=>'DSCRPCN_CNVNIO_MDFCCION_ESTDO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Estado de Solicitud'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93754379580784113)
,p_db_column_name=>'NMBRE_SLCTNTE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Nombre del Solicitante'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93754403371784114)
,p_db_column_name=>'NMRO_IDNTFCCION_SLCTNTE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('Identificaci\00F3n de Solicitante')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93754579016784115)
,p_db_column_name=>'ID_ACTO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Ver Acto'
,p_column_link=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_CLAVE_PRIMARIA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_VALOR:V_GN_G_ACTOS,ID_ACTO,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,#ID_ACTO#'
,p_column_linktext=>'<span aria-hidden="true" class="fa fa-eye" style="color: blue;" ></span>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(93792025484337233)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'937921'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'FCHA_RGSTRO:DSCRPCION_CNVNIO_MDFCCION_TPO:DSCRPCN_MDFCCION_NMRO_CTA_TPO:NVO_NMRO_CTA:FCHA_SGTE_CTA:DSCRPCION_PRDCDAD_CTA:NMBRE_SLCTNTE:NMRO_IDNTFCCION_SLCTNTE:DSCRPCN_CNVNIO_MDFCCION_ESTDO:ID_ACTO:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(94831464409425904)
,p_plug_name=>'<b>Revocatoria Solicitada por el Contribuyente</b>'
,p_parent_plug_id=>wwv_flow_api.id(93753206574784102)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--hiddenOverflow:t-Form--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select    a.nmbre_slctnte',
'         , a.fcha_rgstro',
'         , a.fcha_aplccion_rvrsion',
'         , a.dscrpcion_cnvnio_rvrsion_estdo',
'         , a.cdgo_cnvnio_rvrsion_estdo',
'         , a.fcha_rchzo ',
'         , a.id_acto',
' from  v_gf_g_convenios_reversion a',
' where a.id_cnvnio = :P283_ID_CNVNIO;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>'select 1 from gf_g_convenios_reversion where id_cnvnio = :P283_ID_CNVNIO'
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
 p_id=>wwv_flow_api.id(94831506953425905)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'JPRADA'
,p_internal_uid=>94831506953425905
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94832167816425911)
,p_db_column_name=>'FCHA_RGSTRO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Fecha Registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94832359192425913)
,p_db_column_name=>'NMBRE_SLCTNTE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Nombre Solicitante'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94832609706425916)
,p_db_column_name=>'FCHA_APLCCION_RVRSION'
,p_display_order=>90
,p_column_identifier=>'K'
,p_column_label=>unistr('Fecha Aplicaci\00F3n Reversi\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94832740967425917)
,p_db_column_name=>'DSCRPCION_CNVNIO_RVRSION_ESTDO'
,p_display_order=>100
,p_column_identifier=>'L'
,p_column_label=>unistr('Estado Reversi\00F3n Convenio')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94832829152425918)
,p_db_column_name=>'FCHA_RCHZO'
,p_display_order=>110
,p_column_identifier=>'M'
,p_column_label=>'Fecha Rechazo Convenio'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94832970921425919)
,p_db_column_name=>'ID_ACTO'
,p_display_order=>120
,p_column_identifier=>'N'
,p_column_label=>'Ver Acto'
,p_column_link=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_CLAVE_PRIMARIA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_VALOR:V_GN_G_ACTOS,ID_ACTO,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,#ID_ACTO#'
,p_column_linktext=>'<span aria-hidden="true" class="fa fa-eye" style="color: blue;" ></span>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94833090515425920)
,p_db_column_name=>'CDGO_CNVNIO_RVRSION_ESTDO'
,p_display_order=>130
,p_column_identifier=>'O'
,p_column_label=>'Cdgo Cnvnio Rvrsion Estdo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(94839859935445197)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'948399'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'FCHA_RGSTRO:NMBRE_SLCTNTE:FCHA_APLCCION_RVRSION:DSCRPCION_CNVNIO_RVRSION_ESTDO:FCHA_RCHZO:ID_ACTO:CDGO_CNVNIO_RVRSION_ESTDO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(94857012771060707)
,p_plug_name=>'<b> Revocatoria - Funcionario </b>'
,p_parent_plug_id=>wwv_flow_api.id(93753206574784102)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.fcha_rgstro ',
'     , a.fcha_aplccion  ',
'     , a.nmbre_slctnte',
'     , a.dscrpcion_cnvnio_rvctria_estdo',
'     , a.dscrpcion_mtdo_rvctria',
'    -- , a.id_acto',
'     , nvl(a.id_acto_anlcion,a.id_acto)    id_acto',
'     , b.id_rprte',
'     ,  ''ACTO_REV_''|| a.nmro_cnvnio nmbre_rprte',
'     ,  ''<data><id_acto>''||nvl(a.id_acto_anlcion,a.id_acto)||''</id_acto>',
'               <id_cnvnio>''||a.id_cnvnio||''</id_cnvnio>',
'               <cod_clnte>''||a.cdgo_clnte||''</cod_clnte>',
'               <p_id_rprte>''||b.id_rprte||''</p_id_rprte>',
'               <id_plntlla>''||b.id_plntlla||''</id_plntlla></data>'' pmtro_rprte',
'       , 1 acto',
' from  v_gf_g_convenios_revocatoria a',
'     join gf_g_convenios_documentos  b on a.id_cnvnio = b.id_cnvnio and nvl(a.id_acto_anlcion,a.id_acto) = b.id_acto',
' where a.id_cnvnio = :P283_ID_CNVNIO;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>'select 1 from gf_g_convenios_revocatoria where id_cnvnio = :P283_ID_CNVNIO'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(98611148168058902)
,p_name=>'FCHA_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(98611272273058903)
,p_name=>'FCHA_APLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_APLCCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha Aplicaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(98611323606058904)
,p_name=>'NMBRE_SLCTNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_SLCTNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Solicitante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>404
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
 p_id=>wwv_flow_api.id(98611436567058905)
,p_name=>'DSCRPCION_CNVNIO_RVCTRIA_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNVNIO_RVCTRIA_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado de la revocatoria'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(98611577952058906)
,p_name=>'DSCRPCION_MTDO_RVCTRIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_MTDO_RVCTRIA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('M\00E9todo de revocatoria')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(98611667352058907)
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
 p_id=>wwv_flow_api.id(98611758719058908)
,p_name=>'ID_RPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RPRTE'
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
 p_id=>wwv_flow_api.id(98611807575058909)
,p_name=>'NMBRE_RPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RPRTE'
,p_data_type=>'VARCHAR2'
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(98611930233058910)
,p_name=>'PMTRO_RPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PMTRO_RPRTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(98612091398058911)
,p_name=>'ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Ver Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_link_target=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_NMBRE_RPRTE,P2_XML:&ID_RPRTE.,&NMBRE_RPRTE.,&PMTRO_RPRTE.'
,p_link_text=>' <center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(98611049570058901)
,p_internal_uid=>98611049570058901
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
 p_id=>wwv_flow_api.id(98616977059060722)
,p_interactive_grid_id=>wwv_flow_api.id(98611049570058901)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(98617037878060722)
,p_report_id=>wwv_flow_api.id(98616977059060722)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98617511071060733)
,p_view_id=>wwv_flow_api.id(98617037878060722)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(98611148168058902)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>189.25
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98617946403060736)
,p_view_id=>wwv_flow_api.id(98617037878060722)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(98611272273058903)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>194
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98618402408060738)
,p_view_id=>wwv_flow_api.id(98617037878060722)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(98611323606058904)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>320.5
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98618969149060739)
,p_view_id=>wwv_flow_api.id(98617037878060722)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(98611436567058905)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>217.5
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98619435720060741)
,p_view_id=>wwv_flow_api.id(98617037878060722)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(98611577952058906)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>299.25
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98619928071060743)
,p_view_id=>wwv_flow_api.id(98617037878060722)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(98611667352058907)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98620474500060744)
,p_view_id=>wwv_flow_api.id(98617037878060722)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(98611758719058908)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98620942799060746)
,p_view_id=>wwv_flow_api.id(98617037878060722)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(98611807575058909)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98621412934060748)
,p_view_id=>wwv_flow_api.id(98617037878060722)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(98611930233058910)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98621982912060750)
,p_view_id=>wwv_flow_api.id(98617037878060722)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(98612091398058911)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90.25
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95048773372447802)
,p_plug_name=>unistr('<b> Anulaci\00F3n</b> ')
,p_parent_plug_id=>wwv_flow_api.id(93753206574784102)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select    a.nmbre_slctnte',
'     , a.dscrpcion mtvo_anlcion',
'     , a.fcha fcha_anlcion',
'     , a.obsrvcion',
'     , a.id_acto',
'     , b.id_rprte',
'     ,  ''ACTO_ANU_''|| a.nmro_cnvnio nmbre_rprte',
'     ,  ''<data><id_acto>''||a.id_acto||''</id_acto>',
'               <id_cnvnio>''||a.id_cnvnio||''</id_cnvnio>',
'               <cod_clnte>''||a.cdgo_clnte||''</cod_clnte>',
'               <p_id_rprte>''||b.id_rprte||''</p_id_rprte>',
'               <id_plntlla>''||b.id_plntlla||''</id_plntlla></data>'' pmtro_rprte',
'       , 1 acto',
' from  v_gf_g_convenios_anulacion a',
'     join gf_g_convenios_documentos  b on a.id_cnvnio = b.id_cnvnio and a.id_acto = b.id_acto',
' where a.id_cnvnio = :P283_ID_CNVNIO;',
'  '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>'select 1 from gf_g_convenios_anulacion where id_cnvnio = :P283_ID_CNVNIO'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95050095983447815)
,p_name=>'NMBRE_SLCTNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_SLCTNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Solicitante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>404
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
 p_id=>wwv_flow_api.id(95050164065447816)
,p_name=>'MTVO_ANLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MTVO_ANLCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Motivo Anulaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(95050212801447817)
,p_name=>'FCHA_ANLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ANLCION'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha Anulaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(95050348436447818)
,p_name=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>2000
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
 p_id=>wwv_flow_api.id(95050433602447819)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
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
 p_id=>wwv_flow_api.id(95050503235447820)
,p_name=>'ID_RPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RPRTE'
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
 p_id=>wwv_flow_api.id(95050658889447821)
,p_name=>'NMBRE_RPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RPRTE'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(95050702917447822)
,p_name=>'PMTRO_RPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PMTRO_RPRTE'
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
 p_id=>wwv_flow_api.id(95050805232447823)
,p_name=>'ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Ver Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_NMBRE_RPRTE,P2_XML:&ID_RPRTE.,&NMBRE_RPRTE.,&PMTRO_RPRTE.'
,p_link_text=>' <center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(95049956600447814)
,p_internal_uid=>95049956600447814
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>false
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
end;
/
begin
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(95070727216102218)
,p_interactive_grid_id=>wwv_flow_api.id(95049956600447814)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(95070868902102219)
,p_report_id=>wwv_flow_api.id(95070727216102218)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95071261170102225)
,p_view_id=>wwv_flow_api.id(95070868902102219)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(95050095983447815)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>274
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95071749813102230)
,p_view_id=>wwv_flow_api.id(95070868902102219)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(95050164065447816)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>280.75
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95072222705102232)
,p_view_id=>wwv_flow_api.id(95070868902102219)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(95050212801447817)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>212.5
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95072711920102233)
,p_view_id=>wwv_flow_api.id(95070868902102219)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(95050348436447818)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>377.5
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95073230246102235)
,p_view_id=>wwv_flow_api.id(95070868902102219)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(95050433602447819)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95073748889102237)
,p_view_id=>wwv_flow_api.id(95070868902102219)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(95050503235447820)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95074217212102239)
,p_view_id=>wwv_flow_api.id(95070868902102219)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(95050658889447821)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95074793670102240)
,p_view_id=>wwv_flow_api.id(95070868902102219)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(95050702917447822)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95075223038102243)
,p_view_id=>wwv_flow_api.id(95070868902102219)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(95050805232447823)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>147.75
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(98480472494336501)
,p_plug_name=>unistr('<b> Finalizaci\00F3n Acuerdo de Pago </b>')
,p_parent_plug_id=>wwv_flow_api.id(93753206574784102)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.fcha fcha_fnlzcion ',
'     , a.nmbre_slctnte',
'     , a.obsrvcion',
'     , a.id_acto',
'     , b.id_rprte',
'     ,  ''ACTO_FINAL_''|| a.nmro_cnvnio nmbre_rprte',
'     ,  ''<data><id_acto>''||a.id_acto||''</id_acto>',
'               <id_cnvnio>''||a.id_cnvnio||''</id_cnvnio>',
'               <cod_clnte>''||a.cdgo_clnte||''</cod_clnte>',
'               <p_id_rprte>''||b.id_rprte||''</p_id_rprte>',
'               <id_plntlla>''||b.id_plntlla||''</id_plntlla></data>'' pmtro_rprte',
'       , 1 acto',
' from  v_gf_g_convenios_finalizacion a',
'     join gf_g_convenios_documentos  b on a.id_cnvnio = b.id_cnvnio and a.id_acto = b.id_acto',
' where a.id_cnvnio = :P283_ID_CNVNIO;',
'  '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>'select 1 from gf_g_convenios_finalizacion where id_cnvnio = :P283_ID_CNVNIO'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(98481515282336512)
,p_name=>'FCHA_FNLZCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_FNLZCION'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha Finalizaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(98481690008336513)
,p_name=>'NMBRE_SLCTNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_SLCTNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Solicitante'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>404
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
 p_id=>wwv_flow_api.id(98481741679336514)
,p_name=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>2000
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
 p_id=>wwv_flow_api.id(98481802507336515)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
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
 p_id=>wwv_flow_api.id(98481929608336516)
,p_name=>'ID_RPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RPRTE'
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
 p_id=>wwv_flow_api.id(98482004171336517)
,p_name=>'NMBRE_RPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RPRTE'
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
 p_id=>wwv_flow_api.id(98482152295336518)
,p_name=>'PMTRO_RPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PMTRO_RPRTE'
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
 p_id=>wwv_flow_api.id(98482289171336519)
,p_name=>'ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Ver Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_link_target=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_NMBRE_RPRTE,P2_XML:&ID_RPRTE.,&NMBRE_RPRTE.,&PMTRO_RPRTE.'
,p_link_text=>' <center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(98481475543336511)
,p_internal_uid=>98481475543336511
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
 p_id=>wwv_flow_api.id(98510327205520097)
,p_interactive_grid_id=>wwv_flow_api.id(98481475543336511)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(98510459090520098)
,p_report_id=>wwv_flow_api.id(98510327205520097)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98510906816520110)
,p_view_id=>wwv_flow_api.id(98510459090520098)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(98481515282336512)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>202
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98511444420520114)
,p_view_id=>wwv_flow_api.id(98510459090520098)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(98481690008336513)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>255.75
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98511901962520116)
,p_view_id=>wwv_flow_api.id(98510459090520098)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(98481741679336514)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>611.75
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98512433990520117)
,p_view_id=>wwv_flow_api.id(98510459090520098)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(98481802507336515)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98512987833520119)
,p_view_id=>wwv_flow_api.id(98510459090520098)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(98481929608336516)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98513440889520121)
,p_view_id=>wwv_flow_api.id(98510459090520098)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(98482004171336517)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98513981578520122)
,p_view_id=>wwv_flow_api.id(98510459090520098)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(98482152295336518)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98514445734520124)
,p_view_id=>wwv_flow_api.id(98510459090520098)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(98482289171336519)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>107.5
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(93753435876784104)
,p_plug_name=>'<b> SOLICITUD</b>'
,p_parent_plug_id=>wwv_flow_api.id(93753112655784101)
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
 p_id=>wwv_flow_api.id(79847303173125982)
,p_plug_name=>'<b>Cuota(s) Inicial</b>'
,p_parent_plug_id=>wwv_flow_api.id(93753435876784104)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--hiddenOverflow:t-Form--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select b.nmro_dcmnto',
'        , b.fcha_vncmnto',
'        , b.vlor_ttal_dcmnto',
'        , b.dscrpcion_indcdor_pgo_aplcdo',
'        , c.fcha_rcdo',
'    from gf_g_cnvnios_cta_incl_vgnc a',
'    join v_re_g_documentos          b on a.id_dcmnto    = b.id_dcmnto',
'    join re_g_recaudos              c on a.id_dcmnto    = c.id_orgen',
'    where a.id_cnvnio               = :P283_ID_CNVNIO',
' order by b.nmro_dcmnto   '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'    from gf_g_cnvnios_cta_incl_vgnc a',
'    join v_re_g_documentos          b on a.id_dcmnto    = b.id_dcmnto',
'    join re_g_recaudos              c on a.id_dcmnto    = c.id_orgen',
'    where a.id_cnvnio               = :P283_ID_CNVNIO'))
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
 p_id=>wwv_flow_api.id(79847462891125983)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>79847462891125983
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75005509382167169)
,p_db_column_name=>'NMRO_DCMNTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00B0 Documento')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75005928469167180)
,p_db_column_name=>'FCHA_VNCMNTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Fecha de Vencimiento <br>del Docuemnto'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75006367243167180)
,p_db_column_name=>'VLOR_TTAL_DCMNTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Valor Documento'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75006798692167180)
,p_db_column_name=>'DSCRPCION_INDCDOR_PGO_APLCDO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('\00BFDocumento Pagado?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75007186245167180)
,p_db_column_name=>'FCHA_RCDO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Fecha de Recaudo'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(79864255056346864)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'750075'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_DCMNTO:FCHA_VNCMNTO:VLOR_TTAL_DCMNTO:DSCRPCION_INDCDOR_PGO_APLCDO:FCHA_RCDO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(178814100642320870)
,p_plug_name=>unistr('<b> Informaci\00F3n del Solicitante</b>')
,p_parent_plug_id=>wwv_flow_api.id(93753435876784104)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(177374655004050691)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(267329790266122435)
,p_plug_name=>unistr('<b>Garant\00EDas</b>')
,p_parent_plug_id=>wwv_flow_api.id(93753435876784104)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.id_cnvnio_grntia_adjnto,',
'        a.ID_GRNTIA_TPO tipo_garantia, ',
'       b.DSCRPCION Tipo,',
'       a.DSCRPCION descrip, ',
'       1 descargar',
'  from gf_g_convenios_garantia a',
'  join GF_D_GARANTIAS_TIPO b on a.ID_GRNTIA_TPO = b.ID_GRNTIA_TPO',
'  join gf_g_cnvnios_grntia_adjnto c on a.id_cnvnio_grntia = c.id_cnvnio_grntia',
'  where id_cnvnio = :P283_ID_CNVNIO',
' order by 1',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(177374655004050691)
,p_plug_display_condition_type=>'NOT_EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from gf_g_convenios_garantia a',
'  where id_cnvnio = :P283_ID_CNVNIO'))
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
 p_id=>wwv_flow_api.id(223899150151847975)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'AHERNANDEZ'
,p_internal_uid=>223899150151847975
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75011667785167201)
,p_db_column_name=>'DESCRIP'
,p_display_order=>70
,p_column_identifier=>'P'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75012059148167202)
,p_db_column_name=>'TIPO_GARANTIA'
,p_display_order=>80
,p_column_identifier=>'R'
,p_column_label=>'Tipo Garantia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75012406957167202)
,p_db_column_name=>'TIPO'
,p_display_order=>90
,p_column_identifier=>'S'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75010825878167198)
,p_db_column_name=>'DESCARGAR'
,p_display_order=>100
,p_column_identifier=>'T'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:GF_G_CNVNIOS_GRNTIA_ADJNTO:FILE_BLOB:ID_CNVNIO_GRNTIA_ADJNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75011238441167201)
,p_db_column_name=>'ID_CNVNIO_GRNTIA_ADJNTO'
,p_display_order=>110
,p_column_identifier=>'U'
,p_column_label=>'Id Cnvnio Grntia Adjnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(223934326006597835)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'750128'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TIPO:DESCRIP::DESCARGAR:ID_CNVNIO_GRNTIA_ADJNTO'
,p_break_on=>'TIPO:0:0:0:0'
,p_break_enabled_on=>'0:0:0:0:TIPO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(268191031018306366)
,p_plug_name=>'<b>Plan de Pago</b>'
,p_parent_plug_id=>wwv_flow_api.id(93753435876784104)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmro_cta,',
'        vlor_cptal,',
'        vlor_intres,',
'        vlor_fncncion,',
'        vlor_ttal,',
'        to_char(fcha_vncmnto, ''DD/MM/YYYY'')fcha_vncmnto,',
'        estdo_cta',
'   from v_gf_g_convenios_extracto',
'  where id_cnvnio = :P283_ID_CNVNIO',
'    and actvo = ''S'';'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P283_ID_CNVNIO'
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
 p_id=>wwv_flow_api.id(227561885449263266)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'<b>&P44_RSPSTA.</b>'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>227561885449263266
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75015525403167205)
,p_db_column_name=>'NMRO_CTA'
,p_display_order=>20
,p_column_identifier=>'F'
,p_column_label=>unistr('N\00B0 Cuota')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75015934665167205)
,p_db_column_name=>'FCHA_VNCMNTO'
,p_display_order=>60
,p_column_identifier=>'W'
,p_column_label=>'Fecha <br>Vencimiento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75013971711167204)
,p_db_column_name=>'VLOR_CPTAL'
,p_display_order=>70
,p_column_identifier=>'AA'
,p_column_label=>'Valor Capital'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75014378978167204)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>90
,p_column_identifier=>'AB'
,p_column_label=>'Valor Interes'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75014707502167204)
,p_db_column_name=>'VLOR_FNCNCION'
,p_display_order=>100
,p_column_identifier=>'AC'
,p_column_label=>unistr('Valor Financiaci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75015178624167204)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>110
,p_column_identifier=>'AD'
,p_column_label=>'Valor Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75013529857167203)
,p_db_column_name=>'ESTDO_CTA'
,p_display_order=>120
,p_column_identifier=>'AE'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(269466801448819244)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'750163'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_CTA:FCHA_VNCMNTO:VLOR_CPTAL:VLOR_INTRES:VLOR_FNCNCION:VLOR_TTAL::ESTDO_CTA'
,p_sort_column_1=>'NMRO_CTA'
,p_sort_direction_1=>'ASC'
,p_sum_columns_on_break=>'VLOR_CTA:VLOR_TTAL:VLOR_FNCNCION:VLOR_INTRES:VLOR_CPTAL'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(75042337564242925)
,p_report_id=>wwv_flow_api.id(269466801448819244)
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'ESTDO_CTA'
,p_operator=>'='
,p_expr=>'VENCIDA'
,p_condition_sql=>' (case when ("ESTDO_CTA" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''VENCIDA''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#FF6161'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(75042768284242925)
,p_report_id=>wwv_flow_api.id(269466801448819244)
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'ESTDO_CTA'
,p_operator=>'='
,p_expr=>'PAGADA'
,p_condition_sql=>' (case when ("ESTDO_CTA" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''PAGADA''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#99FF99'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(282223294328813596)
,p_plug_name=>'<b>Cartera</b>'
,p_region_name=>'deuda'
,p_parent_plug_id=>wwv_flow_api.id(93753435876784104)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--hiddenOverflow:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.vgncia,',
'      p.prdo,  ',
'      to_char(sum(nvl(c.vlor_cptal,0)), :F_FRMTO_MNDA) vlor_cptal,',
'      to_char(sum(nvl(c.vlor_intres,0)), :F_FRMTO_MNDA) vlor_intres,',
'      to_char(sum(nvl(c.vlor_cptal,0))+ sum(nvl(vlor_intres,0)) , :F_FRMTO_MNDA)vlor_ttal',
'from gf_g_convenios_cartera c',
'join df_i_periodos p on p.id_prdo = c.id_prdo    ',
'where id_cnvnio = :P283_ID_CNVNIO',
'group by c.vgncia, p.prdo;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
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
 p_id=>wwv_flow_api.id(194315526876940681)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>194315526876940681
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75008171165167192)
,p_db_column_name=>'VGNCIA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75008556475167192)
,p_db_column_name=>'PRDO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Per\00EDdo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75008955805167192)
,p_db_column_name=>'VLOR_CPTAL'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Valor Capital'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75009317627167193)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Valor Inter\00E9s')
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75009702454167193)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Valor Total'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(194327245593952708)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'750101'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VGNCIA:PRDO:VLOR_CPTAL:VLOR_INTRES:VLOR_TTAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(178467362098145369)
,p_plug_name=>'<b>SUJETO TRIBUTO</b>'
,p_parent_plug_id=>wwv_flow_api.id(221937654158378745)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(177374655004050691)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
begin
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(178814187824320871)
,p_plug_name=>'<b>DATOS DEL ACUERDO</b>'
,p_parent_plug_id=>wwv_flow_api.id(221937654158378745)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--hiddenOverflow:t-Form--noPadding:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(177374655004050691)
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(222475183005733395)
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
,p_plug_required_role=>wwv_flow_api.id(177374655004050691)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(268549059317442643)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>70
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
unistr('    <p>Esta funcionalidad permite consultar toda la informaci\00F3n relacionada con el acuerdo de pago seleccionado.</p>'),
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(75017803419167207)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(222475183005733395)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(75019808777167225)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(222475183005733395)
,p_button_name=>'BTN_VER_ACTO'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Ver Acto'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_CLAVE_PRIMARIA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_VALOR:GD_G_DOCUMENTOS,ID_DCMNTO,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,&P283_ID_DCMNTO.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_cnvnio',
'  from gf_g_convenios',
' where id_cnvnio = :P283_ID_CNVNIO',
'   and cdgo_cnvnio_estdo in (''APL'',''RCH'',''ANL'', ''RVS'')',
'   and id_acto is not null'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(75025465769167291)
,p_branch_name=>'Ir a la Pagina Anterior'
,p_branch_action=>'P283_BRANCH'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_PAGE_IDENT_BY_ITEM'
,p_branch_when_button_id=>wwv_flow_api.id(75017803419167207)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74992754286167119)
,p_name=>'P283_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(221937654158378745)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74993134995167137)
,p_name=>'P283_ID_SJTO_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(221937654158378745)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74993554724167137)
,p_name=>'P283_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(221937654158378745)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74993968043167138)
,p_name=>'P283_ID_ACTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(221937654158378745)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74994336177167138)
,p_name=>'P283_NMBRE_ACTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(221937654158378745)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74994767840167146)
,p_name=>'P283_ID_DCMNTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(221937654158378745)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74995454690167151)
,p_name=>'P283_ID_CNVNIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(178467362098145369)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74995875334167151)
,p_name=>'P283_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(178467362098145369)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74996237383167151)
,p_name=>'P283_DRCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(178467362098145369)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74996635098167151)
,p_name=>'P283_RSPSTA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(178467362098145369)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74997044715167151)
,p_name=>'P283_ID_INSTNCIA_FLJO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(178467362098145369)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74997427788167152)
,p_name=>'P283_NMBRE_IMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(178467362098145369)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74997811635167152)
,p_name=>'P283_NMBRE_IMPSTO_SBMPSTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(178467362098145369)
,p_prompt=>'SubTributo'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74998577471167154)
,p_name=>'P283_CDGO_IDNTFFCION_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(178814100642320870)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LV_IDENTIFICACIONES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_IDNTFCCION_TPO as d,',
'       CDGO_IDNTFCCION_TPO as r',
'  from DF_S_IDENTIFICACIONES_TIPO',
' order by 1'))
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74998932548167155)
,p_name=>'P283_NMRO_IDNTFCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(178814100642320870)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74999347611167155)
,p_name=>'P283_NMBRE_CMPLTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(178814100642320870)
,p_prompt=>'Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74999775132167155)
,p_name=>'P283_UBCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(178814100642320870)
,p_prompt=>unistr('Ubicaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75000131745167155)
,p_name=>'P283_DRCCION_NTFCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(178814100642320870)
,p_prompt=>unistr('Direcci\00F3n Notificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75000574199167155)
,p_name=>'P283_TLFNO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(178814100642320870)
,p_prompt=>unistr('Tel\00E9fono / Celular')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75000981177167156)
,p_name=>'P283_EMAIL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(178814100642320870)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75001629423167156)
,p_name=>'P283_ID_RPRTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(178814187824320871)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75002024067167156)
,p_name=>'P283_NMRO_RDCDO_DSPLAY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(178814187824320871)
,p_prompt=>unistr('N\00B0 Radicado')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75002491726167157)
,p_name=>'P283_NMRO_CNVNIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(178814187824320871)
,p_prompt=>unistr('Acuerdo N\00B0:')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75002866207167157)
,p_name=>'P283_CDGO_CNVNIO_ESTDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(178814187824320871)
,p_prompt=>'Estado'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_CONVENIO_ESTADO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_cnvnio_estdo as r',
'  from gf_d_convenios_estado',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75003251459167157)
,p_name=>'P283_ID_CNVNIO_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(178814187824320871)
,p_prompt=>'Tipo de Acuerdo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_CONVENIO_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       ID_CNVNIO_TPO as r',
'  from gf_d_convenios_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75003656880167157)
,p_name=>'P283_FCHA_PRMRA_CTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(178814187824320871)
,p_prompt=>'Fecha Primera Cuota'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75004059608167159)
,p_name=>'P283_NMRO_CTA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(178814187824320871)
,p_prompt=>unistr('N\00B0 Cuotas')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75004456093167159)
,p_name=>'P283_CDGO_PRDCDAD'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(178814187824320871)
,p_prompt=>'Periodicidad'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_PERIODICIDAD'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_prdcdad as r',
'  from df_s_periodicidad',
' order by cntdad_vce_anio desc'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75004854351167160)
,p_name=>'P283_NMRO_CTAS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(178814187824320871)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75020246826167225)
,p_name=>'P283_BRANCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(222475183005733395)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75020655900167225)
,p_name=>'P283_ID_PLNTLLA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(222475183005733395)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(75021407856167263)
,p_computation_sequence=>10
,p_computation_item=>'F_ID_INSTNCIA_FLJO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P283_ID_INSTNCIA_FLJO'
,p_compute_when=>'P283_ID_INSTNCIA_FLJO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(75023368813167279)
,p_process_sequence=>20
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Datos Acuerdo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  idntfccion_sjto_frmtda,',
'            a.drccion,',
'            a.id_cnvnio_tpo,',
'            a.nmro_cnvnio,',
'            a.cdgo_idntfccion_tpo_slctnte,',
'            a.nmro_idntfccion_slctnte,',
'            a.nmbre_slctnte,',
'            a.drccion_ntfccion,',
'            a.nmbre_pais_ntfccion || '' - '' || nmbre_dprtmnto_ntfccion || '' - '' || nmbre_mncpio_ntfccion,',
'            a.email,',
'            a.tlfno || '' - '' || a.cllar,',
'            a.nmro_cta,',
'            a.cdgo_prdcdad_cta,',
'            to_char(a.fcha_prmra_cta, ''DD/MM/YYYY''),',
'            a.cdgo_cnvnio_estdo,',
'            a.id_instncia_fljo_hjo,',
'            a.nmro_mxmo_ctas,',
'            a.id_impsto,',
'            a.id_impsto_sbmpsto,',
'            a.id_sjto_impsto,',
'            upper(a.nmbre_impsto),',
'            upper(a.nmbre_impsto_sbmpsto),',
'            a.cdgo_idntfccion_tpo_slctnte,',
'            a.nmro_rdcdo_dsplay,',
'            a.id_cnvnio',
'       into :P283_IDNTFCCION,',
'            :P283_DRCCION,',
'            :P283_ID_CNVNIO_TPO,',
'            :P283_NMRO_CNVNIO,',
'            :P283_CDGO_IDNTFFCION_TPO,',
'            :P283_NMRO_IDNTFCION,',
'            :P283_NMBRE_CMPLTO,',
'            :P283_DRCCION_NTFCCION,',
'            :P283_UBCCION,',
'            :P283_EMAIL,',
'            :P283_TLFNO,',
'            :P283_NMRO_CTA, ',
'            :P283_CDGO_PRDCDAD,',
'            :P283_FCHA_PRMRA_CTA,',
'            :P283_CDGO_CNVNIO_ESTDO,',
'            :P283_ID_INSTNCIA_FLJO,',
'            :P283_NMRO_CTAS,',
'            :P283_ID_IMPSTO,',
'            :P283_ID_IMPSTO_SBMPSTO,',
'            :P283_ID_SJTO_IMPSTO,',
'            :P283_NMBRE_IMPSTO,',
'            :P283_NMBRE_IMPSTO_SBMPSTO,',
'            :P283_CDGO_IDNTFFCION_TPO,',
'            :P283_NMRO_RDCDO_DSPLAY,',
'            :P283_ID_CNVNIO',
'       from v_gf_g_convenios a',
'       where (a.id_cnvnio = :P283_ID_CNVNIO ',
'          or  a.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO);    ',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(75024177559167288)
,p_process_sequence=>30
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Datos del Acto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P283_CDGO_CNVNIO_ESTDO not in (''ANL'', ''RVS'') then',
'    begin',
'        select b.id_acto,',
'               b.nmro_acto|| ''.pdf'' ,',
'               b.id_dcmnto',
'          into :P283_ID_ACTO,',
'               :P283_NMBRE_ACTO,',
'               :P283_ID_DCMNTO',
'          from v_gf_g_convenios a',
'          join gn_g_actos        b on a.id_acto = b.id_acto',
'         where id_cnvnio = :P283_ID_CNVNIO;',
'    exception',
'        when others then ',
'             null;',
'    end;',
'     ',
' elsif :P283_CDGO_CNVNIO_ESTDO = ''ANL'' then',
'     select id_acto,',
'           nmro_acto|| ''.pdf'' ',
'      into :P283_ID_ACTO,',
'           :P283_NMBRE_ACTO',
'      from v_gf_g_convenios_anulacion',
'     where id_cnvnio = :P283_ID_CNVNIO;',
'     ',
' elsif :P283_CDGO_CNVNIO_ESTDO = ''RVS'' then ',
'    select id_acto,',
'           nmro_acto|| ''.pdf'' ',
'      into :P283_ID_ACTO,',
'           :P283_NMBRE_ACTO',
'      from v_gf_g_convenios_reversion',
'     where id_cnvnio = :P283_ID_CNVNIO;',
'',
' end if;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P283_ID_CNVNIO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
