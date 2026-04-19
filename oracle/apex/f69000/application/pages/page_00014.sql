prompt --application/pages/page_00014
begin
wwv_flow_api.create_page(
 p_id=>14
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>unistr('Resumen de  Reliquidaci\00F3n - Novedad de Predial')
,p_step_title=>unistr('Resumen  de Reliquidaci\00F3n - Novedad de Predial')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
''))
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*.a-IRR-controlsContainer{',
'    display: none !important;',
'}*/'))
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'1111111111'
,p_last_upd_yyyymmddhh24miss=>'20200305143756'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(122942553811017603)
,p_plug_name=>'Form Reliquidacion Novedad Predial'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:margin-bottom-sm'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(122893801580722801)
,p_plug_name=>'Reliquidaciones'
,p_parent_plug_id=>wwv_flow_api.id(122942553811017603)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody:t-Form--slimPadding:margin-bottom-sm'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'     select a.id_lqdcion',
'          , a.vgncia',
'          , a.prdo ',
'          , nvl2( b.id_lqdcion_antrior , ''No'' , ''Si'' ) as indcdor_nvo',
'          , e.cdgo_cncpto',
'          , e.dscrpcion',
'          , c.vlor_lqddo',
'          , c.bse_cncpto',
'          , c.txto_trfa',
'          , decode( c.indcdor_lmta_impsto , ''N'' , ''No'' , ''Si'' ) as indcdor_lmta_impsto',
'       from v_si_g_novedades_prdio_vgncia a',
'       join gi_g_liquidaciones b',
'         on a.id_lqdcion = b.id_lqdcion',
'       join gi_g_liquidaciones_concepto c',
'         on b.id_lqdcion = c.id_lqdcion',
'       join df_i_impuestos_acto_concepto d',
'         on c.id_impsto_acto_cncpto = d.id_impsto_acto_cncpto',
'       join df_i_conceptos e',
'         on d.id_cncpto  = e.id_cncpto',
'      where a.id_nvdad_prdio_dtlle = :P14_ID_NVDAD_PRDIO_DTLLE',
'   order by a.vgncia desc',
'          , a.prdo desc'))
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
 p_id=>wwv_flow_api.id(122893924292722802)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No existen re-liquidaciones por mostrar.'
,p_show_nulls_as=>'-'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NARDILA'
,p_internal_uid=>122893924292722802
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122894031045722803)
,p_db_column_name=>'ID_LQDCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00B0 Liquidaci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122894106505722804)
,p_db_column_name=>'VGNCIA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122894253713722805)
,p_db_column_name=>'PRDO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Per\00EDodo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122894360255722806)
,p_db_column_name=>'INDCDOR_NVO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Nueva Vigencia?'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122894491005722807)
,p_db_column_name=>'CDGO_CNCPTO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('C\00F3digo Concepto')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122894578410722808)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122894649448722809)
,p_db_column_name=>'VLOR_LQDDO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Valor Liquidado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122894706092722810)
,p_db_column_name=>'TXTO_TRFA'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Texto Tarifa'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122894832938722811)
,p_db_column_name=>'INDCDOR_LMTA_IMPSTO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Limita Impuesto?'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122942455071017602)
,p_db_column_name=>'BSE_CNCPTO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Base'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(122914228776793887)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1229143'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VGNCIA:PRDO:ID_LQDCION:INDCDOR_NVO:CDGO_CNCPTO:DSCRPCION:VLOR_LQDDO:BSE_CNCPTO:TXTO_TRFA:INDCDOR_LMTA_IMPSTO:'
,p_sort_column_1=>'VGNCIA'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'PRDO'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'DSCRPCION'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'ID_LQDCION'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_break_on=>'VGNCIA:PRDO:ID_LQDCION:INDCDOR_NVO'
,p_break_enabled_on=>'VGNCIA:PRDO:ID_LQDCION:INDCDOR_NVO'
,p_sum_columns_on_break=>'VLOR_LQDDO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(122895035685722813)
,p_plug_name=>'Liquidaciones Anterior'
,p_parent_plug_id=>wwv_flow_api.id(122942553811017603)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody:t-Form--slimPadding:margin-bottom-sm'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'     select b.id_lqdcion_antrior as id_lqdcion',
'          , a.vgncia',
'          , a.prdo ',
'          , e.cdgo_cncpto',
'          , e.dscrpcion',
'          , c.vlor_lqddo',
'          , c.txto_trfa',
'          , c.bse_cncpto',
'          , decode( c.indcdor_lmta_impsto , ''N'' , ''No'' , ''Si'' ) as indcdor_lmta_impsto',
'       from v_si_g_novedades_prdio_vgncia a',
'       join gi_g_liquidaciones b',
'         on a.id_lqdcion = b.id_lqdcion',
'       join gi_g_liquidaciones_concepto c',
'         on b.id_lqdcion_antrior = c.id_lqdcion',
'       join df_i_impuestos_acto_concepto d',
'         on c.id_impsto_acto_cncpto = d.id_impsto_acto_cncpto',
'       join df_i_conceptos e',
'         on d.id_cncpto  = e.id_cncpto',
'      where id_nvdad_prdio_dtlle = :P14_ID_NVDAD_PRDIO_DTLLE',
'   order by a.vgncia desc',
'          , a.prdo desc'))
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
 p_id=>wwv_flow_api.id(122895135228722814)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No existen liquidaciones anteriores por mostrar.'
,p_show_nulls_as=>'-'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NARDILA'
,p_internal_uid=>122895135228722814
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122895246140722815)
,p_db_column_name=>'ID_LQDCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00B0 Liquidaci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122895376128722816)
,p_db_column_name=>'VGNCIA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122895494088722817)
,p_db_column_name=>'PRDO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Per\00EDodo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122895653402722819)
,p_db_column_name=>'CDGO_CNCPTO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('C\00F3digo Concepto')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122895719060722820)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122895805551722821)
,p_db_column_name=>'VLOR_LQDDO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Valor Liquidado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122895939366722822)
,p_db_column_name=>'TXTO_TRFA'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Texto Tarifa'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122896095535722823)
,p_db_column_name=>'INDCDOR_LMTA_IMPSTO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Limita Impuesto?'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122942390971017601)
,p_db_column_name=>'BSE_CNCPTO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Base'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(122934246020913461)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1229343'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VGNCIA:PRDO:ID_LQDCION:CDGO_CNCPTO:DSCRPCION:VLOR_LQDDO:BSE_CNCPTO:TXTO_TRFA:INDCDOR_LMTA_IMPSTO:'
,p_sort_column_1=>'VGNCIA'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'PRDO'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'DSCRPCION'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'ID_LQDCION'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_break_on=>'VGNCIA:PRDO:ID_LQDCION'
,p_break_enabled_on=>'VGNCIA:PRDO:ID_LQDCION'
,p_sum_columns_on_break=>'VLOR_LQDDO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(122966918298165001)
,p_plug_name=>'Ajustes'
,p_parent_plug_id=>wwv_flow_api.id(122942553811017603)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody:t-Form--slimPadding:margin-bottom-sm'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'       select b.vgncia',
'            , b.prdo',
'            , d.cdgo_cncpto',
'            , d.dscrpcion',
unistr('            , decode( c.tpo_ajste , ''CR'' , ''Cr\00E9dito'' , ''D\00E9bito'' ) as tpo_ajste'),
'            , a.vlor_sldo_cptal',
'            , a.vlor_ajste',
'            , e.dscrpcion_estado',
'         from gi_g_liquidaciones_ajuste a',
'         join v_gi_g_liquidaciones b',
'           on a.id_lqdcion = b.id_lqdcion',
'         join gi_d_liquidaciones_mtv_ajst c',
'           on a.id_lqdcion_mtv_ajst = c.id_lqdcion_mtv_ajst',
'         join df_i_conceptos d',
'           on a.id_cncpto = d.id_cncpto',
'         join v_gf_g_ajustes e',
'           on a.id_ajste = e.id_ajste',
'        where a.id_lqdcion in (',
'                                   select b.id_lqdcion',
'                                     from si_g_novedades_predio_dtlle a',
'                                     join si_g_novedades_prdio_vgncia b',
'                                       on a.id_nvdad_prdio_dtlle = b.id_nvdad_prdio_dtlle',
'                                    where b.id_lqdcion is not null',
'                                      and b.id_nvdad_prdio_dtlle = :P14_ID_NVDAD_PRDIO_DTLLE',
'                              )',
'    order by b.vgncia desc',
'           , b.prdo desc;'))
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
 p_id=>wwv_flow_api.id(122967056161165002)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No existen ajustes por mostrar.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'NARDILA'
,p_internal_uid=>122967056161165002
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122967120214165003)
,p_db_column_name=>'VGNCIA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122967279485165004)
,p_db_column_name=>'PRDO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Per\00EDodo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122967375618165005)
,p_db_column_name=>'CDGO_CNCPTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('C\00F3digo Concepto')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122967469857165006)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122967544392165007)
,p_db_column_name=>'TPO_AJSTE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Tipo de Ajuste'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122967689494165008)
,p_db_column_name=>'VLOR_SLDO_CPTAL'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Saldo Capital'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122967702074165009)
,p_db_column_name=>'VLOR_AJSTE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Valor Ajuste'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122967831733165010)
,p_db_column_name=>'DSCRPCION_ESTADO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Estado Ajuste'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(122974850447170008)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1229749'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VGNCIA:PRDO:CDGO_CNCPTO:DSCRPCION:TPO_AJSTE:VLOR_SLDO_CPTAL:VLOR_AJSTE:DSCRPCION_ESTADO'
,p_sort_column_1=>'VGNCIA'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(450267748824297003)
,p_plug_name=>'Workflow'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(450658850514074837)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
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
'  Funcionalidad que permite: <br/><br/>',
'  <b>2.</b> Visualizar los datos de las reliquidaciones.<br/><br/>',
'  <b>3.</b> Visualizar los datos de las liquidaciones anteriores.<br/><br/>',
'  <b>4.</b> Visualizar las datos de los ajustes.<br/><br/>',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122942618652017604)
,p_name=>'P14_ID_NVDAD_PRDIO_DTLLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(122942553811017603)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
