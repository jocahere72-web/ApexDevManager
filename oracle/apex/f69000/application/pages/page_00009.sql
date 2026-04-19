prompt --application/pages/page_00009
begin
wwv_flow_api.create_page(
 p_id=>9
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>unistr('Resumen de Reliquidaci\00F3n - Novedad de Predial Masiva')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Resumen de Reliquidaci\00F3n - Novedad de Predial Masiva')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
''))
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-controlsContainer{',
'    display: none !important;',
'}'))
,p_step_template=>wwv_flow_api.id(88496149054834641)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'90%'
,p_last_updated_by=>'NARDILA'
,p_last_upd_yyyymmddhh24miss=>'20190711164056'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(126556304663213926)
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
 p_id=>wwv_flow_api.id(126507552432919124)
,p_plug_name=>'Reliquidaciones'
,p_parent_plug_id=>wwv_flow_api.id(126556304663213926)
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
'      where a.id_nvdad_prdio_dtlle = :P9_ID_NVDAD_PRDIO_DTLLE',
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
 p_id=>wwv_flow_api.id(126507675144919125)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No existen re-liquidaciones por mostrar.'
,p_show_nulls_as=>'-'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'NARDILA'
,p_internal_uid=>126507675144919125
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3615039606196360)
,p_db_column_name=>'ID_LQDCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00B0 Liquidaci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3615439389196361)
,p_db_column_name=>'VGNCIA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3615881351196361)
,p_db_column_name=>'PRDO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Per\00EDodo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3616219511196361)
,p_db_column_name=>'INDCDOR_NVO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Nueva Vigencia?'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3616663849196369)
,p_db_column_name=>'CDGO_CNCPTO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('C\00F3digo Concepto')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3617094649196369)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3617423892196369)
,p_db_column_name=>'VLOR_LQDDO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Valor Liquidado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3617831296196369)
,p_db_column_name=>'TXTO_TRFA'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Texto Tarifa'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3618288244196369)
,p_db_column_name=>'INDCDOR_LMTA_IMPSTO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Limita Impuesto?'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3618637735196370)
,p_db_column_name=>'BSE_CNCPTO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Base'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(126527979628990210)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'36190'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VGNCIA:PRDO:ID_LQDCION:INDCDOR_NVO:CDGO_CNCPTO:DSCRPCION:VLOR_LQDDO:BSE_CNCPTO:TXTO_TRFA:INDCDOR_LMTA_IMPSTO:'
,p_sort_column_1=>'VGNCIA'
,p_sort_direction_1=>'DESC'
,p_break_on=>'VGNCIA:PRDO:ID_LQDCION:INDCDOR_NVO'
,p_break_enabled_on=>'VGNCIA:PRDO:ID_LQDCION:INDCDOR_NVO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(126508786537919136)
,p_plug_name=>'Liquidaciones Anterior'
,p_parent_plug_id=>wwv_flow_api.id(126556304663213926)
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
'      where id_nvdad_prdio_dtlle = :P9_ID_NVDAD_PRDIO_DTLLE',
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
 p_id=>wwv_flow_api.id(126508886080919137)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No existen liquidaciones anteriores por mostrar.'
,p_show_nulls_as=>'-'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'NARDILA'
,p_internal_uid=>126508886080919137
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3619786039196374)
,p_db_column_name=>'ID_LQDCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00B0 Liquidaci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3620111690196374)
,p_db_column_name=>'VGNCIA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3620548650196374)
,p_db_column_name=>'PRDO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Per\00EDodo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3620931072196374)
,p_db_column_name=>'CDGO_CNCPTO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('C\00F3digo Concepto')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3621342365196375)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3621777632196375)
,p_db_column_name=>'VLOR_LQDDO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Valor Liquidado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3622168472196375)
,p_db_column_name=>'TXTO_TRFA'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Texto Tarifa'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3622591102196375)
,p_db_column_name=>'INDCDOR_LMTA_IMPSTO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Limita Impuesto?'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3622962333196375)
,p_db_column_name=>'BSE_CNCPTO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Base'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(126547996873109784)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'36233'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VGNCIA:PRDO:ID_LQDCION:CDGO_CNCPTO:DSCRPCION:VLOR_LQDDO:BSE_CNCPTO:TXTO_TRFA:INDCDOR_LMTA_IMPSTO:'
,p_sort_column_1=>'VGNCIA'
,p_sort_direction_1=>'DESC'
,p_break_on=>'VGNCIA:PRDO:ID_LQDCION'
,p_break_enabled_on=>'VGNCIA:PRDO:ID_LQDCION'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(126580669150361324)
,p_plug_name=>'Ajustes'
,p_parent_plug_id=>wwv_flow_api.id(126556304663213926)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody:t-Form--slimPadding:margin-bottom-sm'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select b.vgncia',
'        , b.prdo',
'        , d.cdgo_cncpto',
'        , d.dscrpcion',
unistr('        , decode( c.tpo_ajste , ''CR'' , ''Cr\00E9dito'' , ''D\00E9bito'' ) as tpo_ajste'),
'        , a.vlor_sldo_cptal',
'        , a.vlor_ajste',
'        , e.dscrpcion_estado',
'     from gi_g_liquidaciones_ajuste a',
'     join v_gi_g_liquidaciones b',
'       on a.id_lqdcion = b.id_lqdcion',
'     join gi_d_liquidaciones_mtv_ajst c',
'       on a.id_lqdcion_mtv_ajst = c.id_lqdcion_mtv_ajst',
'     join df_i_conceptos d',
'       on a.id_cncpto = d.id_cncpto',
'     join v_gf_g_ajustes e',
'       on a.id_ajste = e.id_ajste',
'    where a.id_lqdcion in (',
'                               select b.id_lqdcion',
'                                 from si_g_novedades_predio_dtlle a',
'                                 join si_g_novedades_prdio_vgncia b',
'                                   on a.id_nvdad_prdio_dtlle = b.id_nvdad_prdio_dtlle',
'                                where b.id_lqdcion is not null',
'                                  and b.id_nvdad_prdio_dtlle = :P9_ID_NVDAD_PRDIO_DTLLE',
'                          )',
'order by b.vgncia desc',
'       , b.prdo desc;'))
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
 p_id=>wwv_flow_api.id(126580807013361325)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No existen ajustes por mostrar.'
,p_show_nulls_as=>'-'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'NARDILA'
,p_internal_uid=>126580807013361325
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3624004098196376)
,p_db_column_name=>'VGNCIA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3624464771196376)
,p_db_column_name=>'PRDO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Per\00EDodo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3624827216196378)
,p_db_column_name=>'CDGO_CNCPTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('C\00F3digo Concepto')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3625233229196378)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3625655636196378)
,p_db_column_name=>'TPO_AJSTE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Tipo de Ajuste'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3626061262196379)
,p_db_column_name=>'VLOR_SLDO_CPTAL'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Saldo Capital'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3626467780196379)
,p_db_column_name=>'VLOR_AJSTE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Valor Ajuste'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3626896321196379)
,p_db_column_name=>'DSCRPCION_ESTADO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Estado Ajuste'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(126588601299366331)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'36272'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VGNCIA:PRDO:CDGO_CNCPTO:DSCRPCION:TPO_AJSTE:VLOR_SLDO_CPTAL:VLOR_AJSTE:DSCRPCION_ESTADO'
,p_sort_column_1=>'VGNCIA'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3614383107196348)
,p_name=>'P9_ID_NVDAD_PRDIO_DTLLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(126556304663213926)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
