prompt --application/pages/page_00076
begin
wwv_flow_api.create_page(
 p_id=>76
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Cr\00EDtica PreLiquidaci\00F3n')
,p_step_title=>unistr('Cr\00EDtica PreLiquidaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#IMAGE_PREFIX#css/infortributos/utilidades.css'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NARDILA'
,p_last_upd_yyyymmddhh24miss=>'20191107150803'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(77572991554086401)
,p_plug_name=>'<b>Predios por Clases</b>'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>150
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select c.cdgo_prdio_clsfccion',
'         , c.dscrpcion_prdio_clsfccion',
'         , count(*) as cntdad_prdio',
'         , sum(b.vlor_lqddo) as vlor_lqddo',
'      from gi_g_cinta_igac a',
'      join gi_g_liquidaciones_concepto b',
'        on a.id_lqdcion = b.id_lqdcion',
'      join v_si_i_predios c',
'        on a.id_prdio      = c.id_prdio',
'     where id_prcso_crga   = :P76_ARCHIVO',
'       and nmro_orden_igac = ''001''',
'  group by c.cdgo_prdio_clsfccion',
'         , c.dscrpcion_prdio_clsfccion'))
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
 p_id=>wwv_flow_api.id(77573059212086402)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NARDILA'
,p_internal_uid=>77573059212086402
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77573146917086403)
,p_db_column_name=>'CDGO_PRDIO_CLSFCCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('C\00F3digo Clase')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77573220544086404)
,p_db_column_name=>'DSCRPCION_PRDIO_CLSFCCION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Clase'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77573383954086405)
,p_db_column_name=>'CNTDAD_PRDIO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Cantidad de Predio'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77573451081086406)
,p_db_column_name=>'VLOR_LQDDO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Valor Liquidado '
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(77582999817099205)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'775830'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CDGO_PRDIO_CLSFCCION:DSCRPCION_PRDIO_CLSFCCION:CNTDAD_PRDIO:VLOR_LQDDO'
,p_sum_columns_on_break=>'VLOR_LQDDO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(77614916794129701)
,p_plug_name=>'<b>Predios por Clase y Destino</b>'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>160
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select c.cdgo_prdio_clsfccion',
'         , c.dscrpcion_prdio_clsfccion',
'         , c.id_prdio_dstno',
'         , c.nmtcnco',
'         , c.dscrpcion_prdo_dstno',
'         , count(*) as cntdad_prdio',
'         , sum(b.vlor_lqddo) as vlor_lqddo',
'      from gi_g_cinta_igac a',
'      join gi_g_liquidaciones_concepto b',
'        on a.id_lqdcion = b.id_lqdcion',
'      join v_si_i_predios c',
'        on a.id_prdio = c.id_prdio',
'     where id_prcso_crga   = :P76_ARCHIVO',
'       and nmro_orden_igac = ''001''',
'  group by c.cdgo_prdio_clsfccion',
'         , c.dscrpcion_prdio_clsfccion',
'         , c.nmtcnco',
'         , c.id_prdio_dstno',
'         , c.dscrpcion_prdo_dstno',
'  order by c.cdgo_prdio_clsfccion',
'         , c.nmtcnco'))
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
 p_id=>wwv_flow_api.id(77615017092129702)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NARDILA'
,p_internal_uid=>77615017092129702
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77615199454129703)
,p_db_column_name=>'CDGO_PRDIO_CLSFCCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('C\00F3digo Clase')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77615215975129704)
,p_db_column_name=>'DSCRPCION_PRDIO_CLSFCCION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Clase'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77615341339129705)
,p_db_column_name=>'ID_PRDIO_DSTNO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Prdio Dstno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77615466123129706)
,p_db_column_name=>'NMTCNCO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('N\00FAmero de Destino')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77615508150129707)
,p_db_column_name=>'DSCRPCION_PRDO_DSTNO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Destino'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77615635777129708)
,p_db_column_name=>'CNTDAD_PRDIO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Cantidad de Predio'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77615769028129709)
,p_db_column_name=>'VLOR_LQDDO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Valor Liquidado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(77624798430143310)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'CHART'
,p_report_alias=>'776248'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'CDGO_PRDIO_CLSFCCION:DSCRPCION_PRDIO_CLSFCCION:ID_PRDIO_DSTNO:NMTCNCO:DSCRPCION_PRDO_DSTNO:CNTDAD_PRDIO:VLOR_LQDDO'
,p_chart_type=>'pie'
,p_chart_label_column=>'DSCRPCION_PRDO_DSTNO'
,p_chart_value_column=>'VLOR_LQDDO'
,p_chart_aggregate=>'SUM'
,p_chart_sorting=>'VALUE_ASC'
,p_chart_orientation=>'vertical'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(77615851598129710)
,p_plug_name=>'<b>Predios por Clase , Destino y Estrato</b>'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>170
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'        select c.cdgo_prdio_clsfccion',
'             , c.dscrpcion_prdio_clsfccion',
'             , c.id_prdio_dstno',
'             , c.nmtcnco',
'             , c.dscrpcion_prdo_dstno',
'             , c.cdgo_estrto',
'             , c.dscrpcion_estrto',
'             , count(*) as cntdad_prdio',
'             , sum(b.vlor_lqddo) as vlor_lqddo',
'          from gi_g_cinta_igac a',
'          join gi_g_liquidaciones_concepto b',
'            on a.id_lqdcion = b.id_lqdcion',
'          join v_si_i_predios c',
'            on a.id_prdio = c.id_prdio',
'         where id_prcso_crga   = :P76_ARCHIVO',
'           and nmro_orden_igac = ''001''',
'      group by c.cdgo_prdio_clsfccion',
'             , c.dscrpcion_prdio_clsfccion',
'             , c.nmtcnco',
'             , c.id_prdio_dstno',
'             , c.dscrpcion_prdo_dstno',
'             , c.cdgo_estrto',
'             , c.dscrpcion_estrto',
'      order by c.cdgo_prdio_clsfccion ',
'             , c.nmtcnco',
'             , c.cdgo_estrto'))
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
 p_id=>wwv_flow_api.id(77615911639129711)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NARDILA'
,p_internal_uid=>77615911639129711
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77616008764129712)
,p_db_column_name=>'CDGO_PRDIO_CLSFCCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('C\00F3digo Clase')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77616164965129713)
,p_db_column_name=>'DSCRPCION_PRDIO_CLSFCCION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Clase'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77616213350129714)
,p_db_column_name=>'ID_PRDIO_DSTNO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Prdio Dstno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77616316341129715)
,p_db_column_name=>'NMTCNCO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('N\00FAmero de Destino')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77616424403129716)
,p_db_column_name=>'DSCRPCION_PRDO_DSTNO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Destino'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77616513254129717)
,p_db_column_name=>'CDGO_ESTRTO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Estrato'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77616680146129718)
,p_db_column_name=>'DSCRPCION_ESTRTO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Dscrpcion Estrto'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77616715283129719)
,p_db_column_name=>'CNTDAD_PRDIO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Cantidad de Predio'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77616837323129720)
,p_db_column_name=>'VLOR_LQDDO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Valor Liquidado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(77631022680336470)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'CHART'
,p_report_alias=>'776311'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CDGO_PRDIO_CLSFCCION:DSCRPCION_PRDIO_CLSFCCION:ID_PRDIO_DSTNO:NMTCNCO:DSCRPCION_PRDO_DSTNO:CDGO_ESTRTO:DSCRPCION_ESTRTO:CNTDAD_PRDIO:VLOR_LQDDO'
,p_chart_type=>'bar'
,p_chart_label_column=>'DSCRPCION_PRDO_DSTNO'
,p_chart_value_column=>'CNTDAD_PRDIO'
,p_chart_aggregate=>'SUM'
,p_chart_sorting=>'VALUE_ASC'
,p_chart_orientation=>'vertical'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(77616947013129721)
,p_plug_name=>unistr('<b>Predios por \00C1rea Virtuales</b>')
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>180
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select c.bse_grvble as area_vrtual',
'         , count(*) as cntdad_prdio',
'         , sum(b.vlor_lqddo) as vlor_lqddo',
'      from gi_g_cinta_igac a',
'      join gi_g_liquidaciones_concepto b',
'        on a.id_lqdcion = b.id_lqdcion',
'      join v_si_i_predios c',
'        on a.id_prdio = c.id_prdio',
'     where id_prcso_crga   = :P76_ARCHIVO',
'       and nmro_orden_igac = ''001''',
'  group by c.bse_grvble ',
'  order by c.bse_grvble'))
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
 p_id=>wwv_flow_api.id(77617035957129722)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NARDILA'
,p_internal_uid=>77617035957129722
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77617133673129723)
,p_db_column_name=>'AREA_VRTUAL'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('\00C1rea Virtual')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77617220887129724)
,p_db_column_name=>'CNTDAD_PRDIO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Cantidad de Predio'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77617386363129725)
,p_db_column_name=>'VLOR_LQDDO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Valor Liquidado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(77633990424350683)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'776340'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'AREA_VRTUAL:CNTDAD_PRDIO:VLOR_LQDDO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(77617440649129726)
,p_plug_name=>'<b>Predios por Factor de Clases</b>'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>190
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'     select a.vlor1 as cdgo_prdio_clsfccion',
'          , b.dscrpcion_prdio_clsfccion',
'          , a.fctor ',
'          , b.cntdad_prdio',
'          , b.vlor_lqddo',
'       from gi_d_fctres a',
'       join (',
'                select c.cdgo_prdio_clsfccion',
'                     , c.dscrpcion_prdio_clsfccion',
'                     , count(*) as cntdad_prdio',
'                     , sum(b.vlor_lqddo) as vlor_lqddo',
'                  from gi_g_cinta_igac a',
'                  join gi_g_liquidaciones_concepto b',
'                    on a.id_lqdcion = b.id_lqdcion',
'                  join v_si_i_predios c',
'                    on a.id_prdio = c.id_prdio',
'                 where id_prcso_crga   = :P76_ARCHIVO',
'                   and nmro_orden_igac = ''001''',
'              group by c.cdgo_prdio_clsfccion',
'                     , c.dscrpcion_prdio_clsfccion',
'          ) b',
'         on a.vlor1 = b.cdgo_prdio_clsfccion',
'      where a.cdgo_clnte      = :F_CDGO_CLNTE',
'        and a.cdgo_fctor_tpo  = ''CL''',
'   order by cdgo_prdio_clsfccion'))
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
 p_id=>wwv_flow_api.id(77617517632129727)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NARDILA'
,p_internal_uid=>77617517632129727
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77617681164129728)
,p_db_column_name=>'CDGO_PRDIO_CLSFCCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('C\00F3digo Clase')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77617789919129729)
,p_db_column_name=>'DSCRPCION_PRDIO_CLSFCCION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Clase'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77617898891129730)
,p_db_column_name=>'FCTOR'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Factor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D09'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77617998955129731)
,p_db_column_name=>'CNTDAD_PRDIO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Cantidad de Predio'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77618059281129732)
,p_db_column_name=>'VLOR_LQDDO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Valor Liquidado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(77638508987365277)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'776386'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CDGO_PRDIO_CLSFCCION:DSCRPCION_PRDIO_CLSFCCION:FCTOR:CNTDAD_PRDIO:VLOR_LQDDO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(77618166522129733)
,p_plug_name=>'<b>Predios por Factor de Destino</b>'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>200
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'     select a.vlor1 as id_prdio_dstno',
'          , b.nmtcnco ',
'          , b.dscrpcion_prdo_dstno',
'          , a.fctor ',
'          , b.cntdad_prdio',
'          , b.vlor_lqddo',
'       from gi_d_fctres a',
'       join (',
'                select c.id_prdio_dstno',
'                     , c.nmtcnco',
'                     , c.dscrpcion_prdo_dstno',
'                     , count(*) as cntdad_prdio',
'                     , sum(b.vlor_lqddo) as vlor_lqddo',
'                  from gi_g_cinta_igac a',
'                  join gi_g_liquidaciones_concepto b',
'                    on a.id_lqdcion = b.id_lqdcion',
'                  join v_si_i_predios c',
'                    on a.id_prdio = c.id_prdio',
'                 where id_prcso_crga   = :P76_ARCHIVO',
'                   and nmro_orden_igac = ''001''',
'              group by c.id_prdio_dstno',
'                     , c.nmtcnco',
'                     , c.dscrpcion_prdo_dstno',
'          ) b',
'         on a.vlor1 = b.id_prdio_dstno',
'      where a.cdgo_clnte      = :F_CDGO_CLNTE',
'        and a.cdgo_fctor_tpo  = ''DE''',
'   order by b.nmtcnco ',
'          , b.dscrpcion_prdo_dstno'))
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
 p_id=>wwv_flow_api.id(77618219836129734)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NARDILA'
,p_internal_uid=>77618219836129734
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77618333143129735)
,p_db_column_name=>'ID_PRDIO_DSTNO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Prdio Dstno'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77618468975129736)
,p_db_column_name=>'NMTCNCO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('N\00FAmero de Destino')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77618530730129737)
,p_db_column_name=>'DSCRPCION_PRDO_DSTNO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Destino'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77618690666129738)
,p_db_column_name=>'FCTOR'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Factor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D09'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77618739598129739)
,p_db_column_name=>'CNTDAD_PRDIO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Cantidad de Predio'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77618804077129740)
,p_db_column_name=>'VLOR_LQDDO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Valor Liquidado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(77642276864376737)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'776423'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'ID_PRDIO_DSTNO:NMTCNCO:DSCRPCION_PRDO_DSTNO:FCTOR:CNTDAD_PRDIO:VLOR_LQDDO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(77618929702129741)
,p_plug_name=>'<b>Predios por Factor de Estrato</b>'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>210
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'     select a.vlor1 as cdgo_estrto',
'          , b.dscrpcion_estrto',
'          , a.fctor ',
'          , b.cntdad_prdio',
'          , b.vlor_lqddo',
'       from gi_d_fctres a',
'       join (',
'                select c.cdgo_estrto',
'                     , c.dscrpcion_estrto',
'                     , count(*) as cntdad_prdio',
'                     , sum(b.vlor_lqddo) as vlor_lqddo',
'                  from gi_g_cinta_igac a',
'                  join gi_g_liquidaciones_concepto b',
'                    on a.id_lqdcion = b.id_lqdcion',
'                  join v_si_i_predios c',
'                    on a.id_prdio = c.id_prdio',
'                 where id_prcso_crga   = :P76_ARCHIVO',
'                   and nmro_orden_igac = ''001''',
'              group by c.cdgo_estrto',
'                     , c.dscrpcion_estrto',
'          ) b',
'         on a.vlor1 = b.cdgo_estrto',
'      where a.cdgo_clnte      = :F_CDGO_CLNTE',
'        and a.cdgo_fctor_tpo  = ''ES''',
'   order by cdgo_estrto',
'          , b.dscrpcion_estrto'))
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
 p_id=>wwv_flow_api.id(77619077578129742)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NARDILA'
,p_internal_uid=>77619077578129742
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77619167546129743)
,p_db_column_name=>'CDGO_ESTRTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Estrato'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77619271359129744)
,p_db_column_name=>'DSCRPCION_ESTRTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Dscrpcion Estrto'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77619329449129745)
,p_db_column_name=>'FCTOR'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Factor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D09'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77619414260129746)
,p_db_column_name=>'CNTDAD_PRDIO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Cantidad de Predio'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
end;
/
begin
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77619561590129747)
,p_db_column_name=>'VLOR_LQDDO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Valor Liquidado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(77645460576386736)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'776455'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CDGO_ESTRTO:DSCRPCION_ESTRTO:FCTOR:CNTDAD_PRDIO:VLOR_LQDDO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(77619686777129748)
,p_plug_name=>'<b>Predios por Factor de Distancia</b>'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>220
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'     select a.vlor1 || ''-'' || a.vlor2 as rngo_dstncia',
'          , a.fctor ',
'          , b.cntdad_prdio',
'          , b.vlor_lqddo',
'       from gi_d_fctres a',
'       join (',
'                select c.dstncia',
'                     , count(*) as cntdad_prdio',
'                     , sum(b.vlor_lqddo) as vlor_lqddo',
'                  from gi_g_cinta_igac a',
'                  join gi_g_liquidaciones_concepto b',
'                    on a.id_lqdcion = b.id_lqdcion',
'                  join v_si_i_predios c',
'                    on a.id_prdio = c.id_prdio',
'                 where id_prcso_crga   = :P76_ARCHIVO',
'                   and nmro_orden_igac = ''001''',
'              group by c.dstncia',
'          ) b',
'         on b.dstncia ',
'    between a.vlor1 and a.vlor2',
'      where a.cdgo_clnte      = :F_CDGO_CLNTE',
'        and a.cdgo_fctor_tpo  = ''DI''',
'   order by a.vlor1'))
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
 p_id=>wwv_flow_api.id(77619795405129749)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NARDILA'
,p_internal_uid=>77619795405129749
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77619837032129750)
,p_db_column_name=>'RNGO_DSTNCIA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Rango Distancia'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77646359726394801)
,p_db_column_name=>'FCTOR'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Factor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D09'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77646449628394802)
,p_db_column_name=>'CNTDAD_PRDIO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Cantidad de Predio'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77646564594394803)
,p_db_column_name=>'VLOR_LQDDO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Valor Liquidado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(77653380191398675)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'776534'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'RNGO_DSTNCIA:FCTOR:CNTDAD_PRDIO:VLOR_LQDDO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(77700339693544303)
,p_plug_name=>'<b>Monto Distribuible VS Valor Liquidado</b>'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(77700188971544301)
,p_plug_name=>'<b>Monto Distribuible</b>'
,p_parent_plug_id=>wwv_flow_api.id(77700339693544303)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor7'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select ''Monto Distribuible'' as label ',
'       , to_char( vlor_ttal , ''FM999G999G999G999G999G999G990'') as value',
'    from gi_g_obras',
'   where id_obra = :P76_OBRA'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(77700284923544302)
,p_plug_name=>'<b>Valor Liquidado</b>'
,p_parent_plug_id=>wwv_flow_api.id(77700339693544303)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor8'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select ''Valor Liquidado'' as label',
'      , to_char(  sum(b.vlor_lqddo) , ''FM999G999G999G999G999G999G990'' ) as value',
'   from gi_g_liquidaciones a',
'   join gi_g_liquidaciones_concepto b',
'     on a.id_lqdcion    = b.id_lqdcion',
'  where a.id_prcso_crga = :P76_ARCHIVO'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(77843604598914402)
,p_plug_name=>'<b>Tarifa Calculada</b>'
,p_parent_plug_id=>wwv_flow_api.id(77700339693544303)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_grid_column_css_classes=>'badgeListColor3'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select ''Tarifa'' as label',
'       , trfa as value',
'   from gi_d_predios_esquema',
'  where id_obra = :P76_OBRA'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(177862427982123088)
,p_plug_name=>'Flujo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'F_ID_INSTNCIA_FLJO'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(227761003992981016)
,p_plug_name=>'Ayuda '
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
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
'    Funcionalidad que permite: <br/><br/>',
unistr('    <b>1.</b> Generar la Liquidaci\00F3n.<br/><br/>'),
unistr('    <b>2.</b> Revertir la Liquidaci\00F3n.<br/><br/>'),
unistr('    <b>3.</b> Visualizar las inconsistencias de la Preliquidaci\00F3n.<br/>'),
'    <b>Nota:</b> Click sobre el cuadro (Predios por Preliquidar).<br/><br/>',
unistr('    <b>4.</b> Visualizar la informaci\00F3n de las cr\00EDticas del archivo:<br/>'),
'	<b>a.</b> Registros Cargados.<br />',
'    <b>b.</b> Predios Cargados.<br/>',
'    <b>c.</b> Predios por Preliquidar.<br/>',
'    <b>d.</b> Predios Preliquidados.<br/>',
'	<b>e.</b> Predios Liquidados.<br/>',
'	<b>f.</b> Predios Sin liquidar.<br/>',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(344392842330965700)
,p_plug_name=>unistr('Proceso Liquidaci\00F3n - Preliquidaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>110
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(229051411385664410)
,p_plug_name=>'<b>Predios Cargados</b>'
,p_parent_plug_id=>wwv_flow_api.id(344392842330965700)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Predios Cargados'' as label ',
'      , to_char( count(*) , ''FM999G999G999G999G999G999G990'') as value',
'   from v_gi_g_cinta_igac',
'  where nmro_orden_igac = ''001''',
'    and id_prcso_crga = :P76_ARCHIVO'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(344935102347299382)
,p_plug_name=>'<b>Registros Cargados</b>'
,p_parent_plug_id=>wwv_flow_api.id(344392842330965700)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_grid_column_css_classes=>'badgeListColor1'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Registros Cargados'' as label ',
'      , to_char( count(*) , ''FM999G999G999G999G999G999G990'') as value',
'   from v_gi_g_cinta_igac',
'  where id_prcso_crga = :P76_ARCHIVO'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(344935108182299383)
,p_plug_name=>'<b>Predios por Pre-liquidar</b>'
,p_parent_plug_id=>wwv_flow_api.id(344392842330965700)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor3'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Predios por Preliquidar'' as label ',
'      , to_char( count(*) , ''FM999G999G999G999G999G999G990'') as value',
'  from v_gi_g_cinta_igac',
' where nmro_orden_igac = ''001''',
'   and id_prcso_crga = :P76_ARCHIVO',
'   and estdo_rgstro = ''C'''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:RP,36:P36_ID_PRCSO_CRGA:&P76_ARCHIVO.'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(344935400121299385)
,p_plug_name=>'<b>Predios Pre-liquidados</b>'
,p_parent_plug_id=>wwv_flow_api.id(344392842330965700)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor4'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Predios Preliquidados'' as label ',
'     , to_char( count(*) , ''FM999G999G999G999G999G999G990'') as value',
'  from v_gi_g_cinta_igac',
' where nmro_orden_igac = ''001''',
'   and id_prcso_crga   = :P76_ARCHIVO',
'   and estdo_rgstro    in ( ''P'' , ''L'' )'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(344935431562299386)
,p_plug_name=>'<b>Predios Liquidado</b>'
,p_parent_plug_id=>wwv_flow_api.id(344392842330965700)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>80
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'badgeListColor5'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select ''Predios Liquidados'' as label ',
'       , to_char( count(*) , ''FM999G999G999G999G999G999G990'') as value',
'   from v_gi_g_cinta_igac',
'  where nmro_orden_igac = ''001''',
'    and id_prcso_crga   = :P76_ARCHIVO',
'    and estdo_rgstro    = ''L'''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(344935551605299387)
,p_plug_name=>'<b>Predios Por liquidar</b>'
,p_parent_plug_id=>wwv_flow_api.id(344392842330965700)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>70
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'badgeListColor6'
,p_plug_display_column=>4
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select l.label',
'      , to_char( c.value - l.value , ''FM999G999G999G999G999G999G990'') as value',
'   from (',
'          select count(*) as value',
'            from v_gi_g_cinta_igac',
'           where nmro_orden_igac = ''001''',
'             and id_prcso_crga   = :P76_ARCHIVO',
'      ) c',
'   join (',
'          select ''Predios Por liquidar'' as label ',
'               , count(*) as value',
'            from v_gi_g_cinta_igac',
'           where nmro_orden_igac = ''001''',
'             and id_prcso_crga = :P76_ARCHIVO',
'             and estdo_rgstro = ''L''',
'      ) l',
'     on 1 = 1'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(414191017557018038)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center;">',
'        <b>',
'            <i>Opciones <i class="fa fa-gears" aria-hidden="true"></i>',
'			</i>',
'        </b>',
'    </div>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76617969972361062)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(414191017557018038)
,p_button_name=>'Btn_Generar_Liquidacion'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Generar Liquidaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from gi_g_cinta_igac ',
' where id_prcso_crga   = :P76_ARCHIVO',
'   and nmro_orden_igac = ''001''',
'   and estdo_rgstro    = ''P'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76618702344361064)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(414191017557018038)
,p_button_name=>'Btn_Revertir_Liquidacion'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Revertir Liquidaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
,p_button_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from gi_g_cinta_igac ',
' where id_prcso_crga   = :P35_ARCHIVO',
'   and nmro_orden_igac = ''001''',
'   and estdo_rgstro    = ''L'''))
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76620997311361067)
,p_name=>'P76_ARCHIVO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(344392842330965700)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76621341480361068)
,p_name=>'P76_IMPUESTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(344392842330965700)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76621707969361068)
,p_name=>'P76_VGNCIA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(344392842330965700)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76622158425361068)
,p_name=>'P76_PERIODO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(344392842330965700)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76622590952361068)
,p_name=>'P76_IMPUESTO_SUBIMPUESTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(344392842330965700)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77573550033086407)
,p_name=>'P76_OBRA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(344392842330965700)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(76626195695361086)
,p_name=>'Al_cambiar_critica'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P76_CRITICAS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76626607434361087)
,p_event_id=>wwv_flow_api.id(76626195695361086)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(76627016691361087)
,p_name=>'Al_cambiar_Reporte'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P76_RPRTE'
,p_condition_element=>'P76_RPRTE'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P76_RPRTE'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(76625724594361085)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar_Liquidacion'
,p_process_sql_clob=>'pkg_gi_liquidacion_predio.prc_ge_liquidacion_vlrzcion( p_id_prcso_crga => :P76_ARCHIVO );'
,p_process_error_message=>unistr('Ocurri\00F3 un Error al Generar la Liquidaci\00F3n.')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(172873222894186841)
,p_process_success_message=>unistr('Se ha Generado la Liquidaci\00F3n con \00C9xito.')
);
end;
/
