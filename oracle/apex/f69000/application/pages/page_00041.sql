prompt --application/pages/page_00041
begin
wwv_flow_api.create_page(
 p_id=>41
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>unistr('Registro de novedad veh\00EDculos')
,p_step_title=>unistr('Registro de novedad veh\00EDculos')
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(74223836934679730)
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'RROBLEDO'
,p_last_upd_yyyymmddhh24miss=>'20210331131209'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(99766003263913501)
,p_plug_name=>'flujo'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88515074654834653)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_api.id(101721066408655212)
,p_plug_name=>'Tab'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(88543343085834669)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(100006903032594101)
,p_plug_name=>'Resumen de Novedades'
,p_parent_plug_id=>wwv_flow_api.id(101721066408655212)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(101719993969655201)
,p_plug_name=>'Novedades'
,p_parent_plug_id=>wwv_flow_api.id(100006903032594101)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88515074654834653)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select seq_id, n001, c001 as Novedad, c002 as Valor_actual , c003 as Valor_anterior, d001',
'                        from apex_collections a',
'                        where collection_name = ''NOVEDADES_DTLLES''',
'                         and n001 = :P41_SJTO_IMPSTO;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select seq_id, n001, c001 as Novedad, c002 as Valor_actual , c003 as Valor_anterior, d001',
'                        from apex_collections a',
'                        where collection_name = ''NOVEDADES_DTLLES''',
'                         and n001 = :P41_SJTO_IMPSTO;'))
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
 p_id=>wwv_flow_api.id(101720011540655202)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'RROBLEDO'
,p_internal_uid=>101720011540655202
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101720197408655203)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101720272220655204)
,p_db_column_name=>'N001'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'N001'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101720636458655208)
,p_db_column_name=>'D001'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'D001'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101720791213655209)
,p_db_column_name=>'NOVEDAD'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Novedad'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101720808899655210)
,p_db_column_name=>'VALOR_ACTUAL'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Valor Actual'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101720948618655211)
,p_db_column_name=>'VALOR_ANTERIOR'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Valor Anterior'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(101727115497775023)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1017272'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SEQ_ID:N001:D001:NOVEDAD:VALOR_ACTUAL:VALOR_ANTERIOR'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104460511326740301)
,p_plug_name=>'Adjunto/Observacion'
,p_parent_plug_id=>wwv_flow_api.id(100006903032594101)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select id_adjntos_vhclo',
'     , file_name  as Nombre_archivo',
'     , fcha as Fecha_archivo',
'  --   , file_blob',
'     , 1 DESCARGAR',
'  from gi_g_adjuntos_vehiculo',
' where id_sjto_impsto = :P42_SJTO_IMPSTO and to_char(fcha,''yyyymmdd'') = to_char(sysdate,''yyyymmdd'')  and orgn = ''NOV'';',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select ''X''',
'  from gi_g_adjuntos_vehiculo',
' where id_sjto_impsto = :P42_SJTO_IMPSTO and to_char(fcha,''yyyymmdd'') = to_char(sysdate,''yyyymmdd'')  and orgn = ''NOV'';'))
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
 p_id=>wwv_flow_api.id(104460693002740302)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'RROBLEDO'
,p_internal_uid=>104460693002740302
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104460855343740304)
,p_db_column_name=>'NOMBRE_ARCHIVO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Nombre Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104471637048991701)
,p_db_column_name=>'ID_ADJNTOS_VHCLO'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>'Id Adjntos Vhclo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104471759122991702)
,p_db_column_name=>'FECHA_ARCHIVO'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Fecha Archivo'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104471891140991703)
,p_db_column_name=>'DESCARGAR'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(104467367673748127)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1044674'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NOMBRE_ARCHIVO:FECHA_ARCHIVO:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(204714657714106248)
,p_plug_name=>'Novedad_detalle'
,p_parent_plug_id=>wwv_flow_api.id(100006903032594101)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.atrbto,d.vlor_nvo,d.vlor_antrior,d.fcha_dgta,d.user_dgta  from si_g_novedades_vhclo_dtlle d',
'where d.id_nvdad_vhclo = :P41_ID_NOVEDAD;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.atrbto,d.vlor_nvo,d.vlor_antrior,d.fcha_dgta,d.user_dgta  from si_g_novedades_vhclo_dtlle d',
'where d.id_nvdad_vhclo = :P41_ID_NOVEDAD;'))
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
 p_id=>wwv_flow_api.id(204748568790184748)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_detail_view_enabled_yn=>'Y'
,p_owner=>'RROBLEDO'
,p_internal_uid=>204748568790184748
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(102894830513990878)
,p_db_column_name=>'ATRBTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Modificaciones'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(102895233487990894)
,p_db_column_name=>'VLOR_NVO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Valor Nuevo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(102895601995990895)
,p_db_column_name=>'VLOR_ANTRIOR'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Valor Anterior'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(102896052975990895)
,p_db_column_name=>'FCHA_DGTA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Fecha'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(102896457617990897)
,p_db_column_name=>'USER_DGTA'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'User Dgta'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(204759483092195887)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1028968'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ATRBTO:VLOR_NVO:VLOR_ANTRIOR:FCHA_DGTA:USER_DGTA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(264170464518406947)
,p_plug_name=>'Sujeto Impuesto'
,p_region_name=>'sujeto_impuesto'
,p_parent_plug_id=>wwv_flow_api.id(101721066408655212)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_indicador varchar2(1);',
'begin',
'',
'   v_indicador := pkg_wf_funciones.fnc_vl_nvdd_rlqudcion(:P41_CDGO_NVDA_TIPO);',
'',
'   if v_indicador = ''N'' then',
'      return true;',
'   else',
'      return false;',
'   end if;',
'',
'end;'))
,p_attribute_01=>'P41_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(293854704904793829)
,p_plug_name=>'Liquidaciones '
,p_parent_plug_id=>wwv_flow_api.id(101721066408655212)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders:t-Form--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select a.cdgo_cncpto||'' - ''|| a.dscrpcion_cncpto as cncpto',
'       , to_char(a.bse_cncpto,''FM$999G999G999G999G999G999G990'')  as bse_cncpto',
'       , c.vgncia',
'       , a.trfa * 100 ||''%'' as trfa',
'       , to_char(a.vlor_lqddo,''FM$999G999G999G999G999G999G990'')  as vlor_lqddo',
'       , to_char(a.vlor_clcldo,''FM$999G999G999G999G999G999G990'') as vlor_clcldo',
'       , b.frccion',
'       , c.dscrpcion_lqdcion_estdo',
'    from v_gi_g_liquidaciones_concepto  a',
'    join v_gi_g_liquidaciones_ad_vehclo b on b.id_lqdcion         = a.id_lqdcion',
'    join v_gi_g_liquidaciones              c on c.id_lqdcion      = a.id_lqdcion',
'                                         --and c.cdgo_lqdcion_estdo = ''L''',
'   where c.id_sjto_impsto     = :P41_SJTO_IMPSTO '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_plug_read_only_when_type=>'ALWAYS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(293855104040793833)
,p_name=>'BSE_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BSE_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Concepto Base '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>29
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
 p_id=>wwv_flow_api.id(293855154451793834)
,p_name=>'TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TRFA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tarifa '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>41
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
 p_id=>wwv_flow_api.id(293855264065793835)
,p_name=>'VLOR_LQDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_LQDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor liquidado '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>29
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
 p_id=>wwv_flow_api.id(293855390085793836)
,p_name=>'VLOR_CLCLDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_CLCLDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Calculado '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>29
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
 p_id=>wwv_flow_api.id(293855659185793839)
,p_name=>'FRCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FRCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Fracci\00F3n ')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(293855765785793840)
,p_name=>'CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Concepto '
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>108
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
 p_id=>wwv_flow_api.id(293855904735793841)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(294241006822502508)
,p_name=>'DSCRPCION_LQDCION_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_LQDCION_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(293854778425793830)
,p_internal_uid=>293854778425793830
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
 p_id=>wwv_flow_api.id(294032887327872063)
,p_interactive_grid_id=>wwv_flow_api.id(293854778425793830)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(294033032149872063)
,p_report_id=>wwv_flow_api.id(294032887327872063)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(202257404377164101)
,p_view_id=>wwv_flow_api.id(294033032149872063)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(293855765785793840)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>312
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(202263634885204018)
,p_view_id=>wwv_flow_api.id(294033032149872063)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(293855904735793841)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>79
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(294034352758872099)
,p_view_id=>wwv_flow_api.id(294033032149872063)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(293855104040793833)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(294034900359872101)
,p_view_id=>wwv_flow_api.id(294033032149872063)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(293855154451793834)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(294035345274872103)
,p_view_id=>wwv_flow_api.id(294033032149872063)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(293855264065793835)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(294035929036872105)
,p_view_id=>wwv_flow_api.id(294033032149872063)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(293855390085793836)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(294037423559872111)
,p_view_id=>wwv_flow_api.id(294033032149872063)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(293855659185793839)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(294250921834538089)
,p_view_id=>wwv_flow_api.id(294033032149872063)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(294241006822502508)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_filter(
 p_id=>wwv_flow_api.id(202256489781162006)
,p_report_id=>wwv_flow_api.id(294032887327872063)
,p_type=>'COLUMN'
,p_column_id=>wwv_flow_api.id(294241006822502508)
,p_operator=>'EQ'
,p_is_case_sensitive=>true
,p_expression=>'Liquidada'
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(163818649447572461)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(163818659820572462)
,p_plug_name=>'Ayuda Registro de Novedad'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>40
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
'    <center><b> Paso 3 Registro de Novedad.</b> </center><br>',
'        En este paso se muestra un resumen de los datos de la novedad. <br>',
unistr('       Para Registrar la Novedad se debe hacer clic en el bot\00F3n <b><i>Registrar Novedad</b></i>'),
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>',
'',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P28_ID_NVDAD_PRSNA'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(164074699453258964)
,p_plug_name=>unistr('Ayuda Aplicaci\00F3n / Rechazo de Novedad')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>50
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
unistr('    <center><b> Paso 4 Aplicaci\00F3n / Rechazo de Novedad.</b> </center><br>'),
'        En este paso se muestra un resumen de los datos de la novedad. <br>',
unistr('       Para Aplicar la Novedad se debe hacer clic en el bot\00F3n <b><i>Aplicar Novedad</b></i>'),
unistr('       Para Aplicar la Rechazar se debe hacer clic en el bot\00F3n <b><i>Rechazar Novedad</b></i>'),
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>',
'',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P28_ID_NVDAD_PRSNA'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94142555402154971)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(163818649447572461)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:39:&SESSION.::&DEBUG.:RP,40,41,42::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94142928681154973)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(163818649447572461)
,p_button_name=>'BTN_REGISTRAR_NOVEDAD'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar Novedad'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de Registrar la Novedad?'',''BTN_REGISTRAR_NOVEDAD'')'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  1',
' from si_g_novedades_vehiculo s',
' join v_si_i_sujetos_impuesto r on r.id_sjto_impsto = s.id_sjto_impsto',
' join si_d_novedades_tipo  e on s.cdgo_nvda_tpo = e.cdgo_nvdad_tpo and e.cdgo_sjto_tpo = ''V''',
' join sg_g_usuarios u on u.id_usrio = s.id_usrio and s.id_nvdad_vhclo = :P41_ID_NOVEDAD'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94143351965154983)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(163818649447572461)
,p_button_name=>'BTN_APLICAR_NOVEDAD'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>'Aplicar Novedad'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de Aplicar la Novedad?'',''BTN_APLICAR_NOVEDAD'')'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from si_g_novedades_persona ',
'where id_nvdad_prsna in (:P41_ID_NVDAD_PRSNA , :P28_ID_NVDAD_PRSNA )',
' and cdgo_nvdad_prsna_estdo = ''RGS'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94143793021154984)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(163818649447572461)
,p_button_name=>'BTN_RECHAZAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>'Rechazar Novedad'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:39:&SESSION.::&DEBUG.:RP::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-times'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8372402143567401)
,p_name=>'P41_RSTA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(100006903032594101)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8640690366725103)
,p_name=>'P41_DATOS_OBSERVACION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(100006903032594101)
,p_prompt=>'Datos Observacion'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'declare',
'   v_estado number;',
'begin',
'   select w.id_estdo_trnscion',
'     into v_estado',
'     from wf_g_instancias_transicion w',
'    where id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'      and w.id_fljo_trea_orgen = :F_ID_FLJO_TREA',
'      and w.id_usrio = :F_ID_USRIO;',
'',
'  if v_estado = 3 then ',
'    return true; ',
'    else ',
'    return false; ',
'  end if ;',
'',
'exception',
'        when others then ',
'        null; ',
'    ',
'end;'))
,p_display_when_type=>'FUNCTION_BODY'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94144135197154984)
,p_name=>'P41_RSPSTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(163818649447572461)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100039639328384401)
,p_name=>'P41_CDGO_NVDA_TIPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(100006903032594101)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100046847703517601)
,p_name=>'P41_DSCRPCION_NVDD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(100006903032594101)
,p_prompt=>'Tipo de Novedad'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  dscrpcion ',
'  from si_d_novedades_tipo g',
'  where  g.cdgo_nvdad_tpo = :P41_CDGO_NVDA_TIPO and g.cdgo_sjto_tpo = ''V''',
' order by 1'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100056960878655801)
,p_name=>'P41_SJTO_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(100006903032594101)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100444258537863001)
,p_name=>'P41_OBSERVACION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(100006903032594101)
,p_prompt=>'Observacion'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select  c001',
'            from APEX_collections r',
'            where collection_name = ''OBSERVACION_NOVEDAD'' and n001 = :F_ID_INSTNCIA_FLJO;'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100891285614340104)
,p_name=>'P41_ID_IMPSTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(100006903032594101)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100891407580340106)
,p_name=>'P41_ID_IMPSTO_SBIMPSTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(100006903032594101)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101797545174688201)
,p_name=>'P41_ID_NOVEDAD'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(100006903032594101)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104029379114591201)
,p_name=>'P41_FECHA_NOVEDAD'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(100006903032594101)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(100891018445340102)
,p_computation_sequence=>10
,p_computation_item=>'P41_ID_IMPSTO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select id_impsto',
'      from df_c_impuestos',
'     where cdgo_clnte  = :F_CDGO_CLNTE',
'       and cdgo_impsto = ''VHL'';'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(100891302919340105)
,p_computation_sequence=>20
,p_computation_item=>'P41_ID_IMPSTO_SBIMPSTO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_impsto_sbmpsto',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_impsto  = :P41_ID_IMPSTO'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(104049430118350001)
,p_name=>'seata_id_novedad'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P41_ID_NOVEDAD'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(104049577683350002)
,p_event_id=>wwv_flow_api.id(104049430118350001)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8640789513725104)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Datos_observacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  begin ',
' select gh.obsrvcion  into :P41_DATOS_OBSERVACION from  si_g_novedades_vehiculo gh ',
' where gh.cdgo_clnte        = :F_CDGO_CLNTE  and ',
'       gh.id_impsto         = :P41_ID_IMPSTO and ',
'       gh.id_impsto_sbmpsto = :P41_ID_IMPSTO_SBIMPSTO and ',
'       gh.id_instncia_fljo  = :F_ID_INSTNCIA_FLJO;',
'   exception',
'    when others then ',
'     null; ',
'   end ; '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94183452059155098)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registro de Novedad'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_cdgo_rspsta    number;',
'   v_mnsje_rspsta   varchar2(1000);',
'   V_id_nvdad_vhclo number;',
'',
'begin',
'',
'/* Rsgistro de novedad de vehiculo */',
'',
' pkg_gi_vehiculos.prc_rg_nvdds_vhclos_general(p_cdgo_clnte =>:F_CDGO_CLNTE,',
'                                             p_id_impsto => :P41_ID_IMPSTO,',
'                                             p_id_impsto_sbmpsto => :P41_ID_IMPSTO_SBIMPSTO,',
'                                             p_id_sjto_impsto => :P41_SJTO_IMPSTO,',
'                                             p_cdgo_nvda => :P41_CDGO_NVDA_TIPO,',
'                                             p_id_acto_tpo => null, ',
'                                             p_fcha_incio_aplccion => null,',
'                                             p_obsrvcion => :P41_OBSERVACION,',
'                                             p_id_slctud =>null, ',
'                                             p_id_instncia_fljo => :F_ID_INSTNCIA_FLJO,',
'                                             p_id_instncia_fljo_pdre => null, ',
'                                             p_id_usrio => :F_ID_USRIO,',
'                                             p_id_prcso_crga => null, ',
'                                             p_fcha_nvdad_vhclo => :P41_FECHA_NOVEDAD,',
'                                             p_id_usrio_aplco => null,',
'                                             o_id_nvdad_vhclo => :P41_ID_NOVEDAD,',
'                                             o_cdgo_rspsta => v_cdgo_rspsta,',
'                                             o_mnsje_rspsta => v_mnsje_rspsta);',
'                                             ',
'                                              ',
'     for c_archivo in ( select *',
'                          from apex_application_temp_files',
'                         where application_id = :APP_ID',
'                     ) ',
'    loop',
'    ',
'     pkg_gi_vehiculos.prc_a_adjunto_doc(p_id_sjto_impsto  =>:P41_SJTO_IMPSTO,',
'                                           p_file_blob      => c_archivo.blob_content,',
'                                           p_file_name      => c_archivo.filename,',
'                                           p_file_mimetype  => c_archivo.mime_type,',
'                                           p_estdo          => ''S'', ',
'                                           p_orgn           => ''NOV'',',
'                                           o_cdgo_rspsta    => v_cdgo_rspsta,',
'                                           o_mnsje_rspsta   => v_mnsje_rspsta);',
'    ',
'    ',
'    end loop; ',
'    ',
'                ',
'                          :P41_RSTA := ''S''; ',
'                           APEX_COLLECTION.TRUNCATE_COLLECTION(p_collection_name => ''OBSERVACION_NOVEDAD''); ',
'                         if v_cdgo_rspsta <> 0 then ',
'                        v_cdgo_rspsta := 1; ',
'                       insert into muerto (v_001) values(''En la aplicacion de novedad general''||v_cdgo_rspsta||''''||v_mnsje_rspsta);',
'                       end if; ',
'                     ---    APEX_COLLECTION.TRUNCATE_COLLECTION(p_collection_name => ''ARCHIVOS_VEHICULO'');                  ',
'     ---    insert into muerto (v_001) values(''En la aplicacion de novedad general''||v_id_nvdad_vhclo||''''||v_cdgo_rspsta||''''||v_mnsje_rspsta);',
'       ',
'       end ; '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(94142928681154973)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8632138270431701)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Agregar_Observacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'         begin                                                ',
'          select  c001',
'            into :P41_OBSERVACION',
'            from APEX_collections r',
'            where collection_name = ''OBSERVACION_NOVEDAD'' and n001 = :F_ID_INSTNCIA_FLJO;',
'          exception ',
'            when others then',
'             null; ',
'         end ; ',
'  ',
'    '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
