prompt --application/pages/page_00010
begin
wwv_flow_api.create_page(
 p_id=>10
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Registros y Predios Recibidos'
,p_page_mode=>'MODAL'
,p_step_title=>'Registros y Predios Recibidos'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(164066978207707637)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'auto'
,p_dialog_width=>'90%'
,p_last_updated_by=>'NARDILA'
,p_last_upd_yyyymmddhh24miss=>'20190205155128'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(33302020574531605)
,p_plug_name=>'Registros y Predios Recibidos'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(172593952263232165)
,p_plug_name=>'<b>Informe Registros Enviados</b>'
,p_parent_plug_id=>wwv_flow_api.id(33302020574531605)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select rfrncia_igac',
'      , nmbre_prptrio_igac',
'      , nmro_dcmnto_igac',
'      , drccion_prdio_igac',
'      , area_trrno_igac',
'      , area_cnstrda_igac',
'      , avluo_igac ',
'   from gi_g_cinta_igac ',
'  where id_prcso_crga = :P40_ARCHIVO'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P10_INDICADOR'
,p_plug_display_when_cond2=>'RE'
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
 p_id=>wwv_flow_api.id(172594098991232166)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ECASTILLO'
,p_internal_uid=>170422069425643206
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172594204614232167)
,p_db_column_name=>'RFRNCIA_IGAC'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Referencia'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172594264787232168)
,p_db_column_name=>'NMBRE_PRPTRIO_IGAC'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Propietario'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172594331040232169)
,p_db_column_name=>'NMRO_DCMNTO_IGAC'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172594436240232170)
,p_db_column_name=>'DRCCION_PRDIO_IGAC'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Direcci\00F3n <br> Predio')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172594613824232171)
,p_db_column_name=>'AREA_TRRNO_IGAC'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('\00C1rea Terreno')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172594682898232172)
,p_db_column_name=>'AREA_CNSTRDA_IGAC'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('\00C1rea Construida')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172594824974232173)
,p_db_column_name=>'AVLUO_IGAC'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Aval\00FAo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(172645346753408671)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1704734'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'RFRNCIA_IGAC:NMBRE_PRPTRIO_IGAC:NMRO_DCMNTO_IGAC:DRCCION_PRDIO_IGAC:AREA_TRRNO_IGAC:AREA_CNSTRDA_IGAC:AVLUO_IGAC'
,p_sum_columns_on_break=>'AVLUO_IGAC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(172951899012246765)
,p_plug_name=>'<b>Informe Predios Enviados</b>'
,p_parent_plug_id=>wwv_flow_api.id(33302020574531605)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select rfrncia_igac',
'      , nmbre_prptrio_igac',
'      , nmro_dcmnto_igac',
'      , drccion_prdio_igac',
'      , area_trrno_igac',
'      , area_cnstrda_igac',
'      , avluo_igac ',
'   from gi_g_cinta_igac a ',
'  where id_prcso_crga   = :P40_ARCHIVO',
'    and nmro_orden_igac = ''001'''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P10_INDICADOR'
,p_plug_display_when_cond2=>'PE'
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
 p_id=>wwv_flow_api.id(172952096050246767)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ECASTILLO'
,p_internal_uid=>170780066484657807
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172952153922246768)
,p_db_column_name=>'RFRNCIA_IGAC'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Referencia'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172952288102246769)
,p_db_column_name=>'NMBRE_PRPTRIO_IGAC'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Propietario'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172952361789246770)
,p_db_column_name=>'NMRO_DCMNTO_IGAC'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172952505318246771)
,p_db_column_name=>'DRCCION_PRDIO_IGAC'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Predio'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172952626303246772)
,p_db_column_name=>'AREA_TRRNO_IGAC'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('\00C1rea terreno')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172952650262246773)
,p_db_column_name=>'AREA_CNSTRDA_IGAC'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('\00C1rea Construida')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172952782440246774)
,p_db_column_name=>'AVLUO_IGAC'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Aval\00FAo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(173169867453449285)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1709979'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'RFRNCIA_IGAC:NMBRE_PRPTRIO_IGAC:NMRO_DCMNTO_IGAC:DRCCION_PRDIO_IGAC:AREA_TRRNO_IGAC:AREA_CNSTRDA_IGAC:AVLUO_IGAC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(172952880951246775)
,p_plug_name=>'<b>Informe Incremento de Predios</b>'
,p_parent_plug_id=>wwv_flow_api.id(33302020574531605)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select vgncia,',
'         a.rfrncia_igac,',
'         a.nmbre_prptrio_igac,',
'         a.nmro_dcmnto_igac,',
'         a.drccion_prdio_igac,',
'         a.area_trrno_igac,',
'         a.area_cnstrda_igac,',
'         a.avluo_igac',
'    from gi_g_cinta_igac a',
'    join et_g_procesos_carga b',
'      on a.id_prcso_crga = b.id_prcso_crga',
'   where a.nmro_orden_igac = ''001'' ',
'     and b.vgncia          in ( :P40_VGNCIA, ( :P40_VGNCIA - 1 ) )',
'     and b.cdgo_clnte      = :F_CDGO_CLNTE',
'     group by vgncia, ',
'              a.rfrncia_igac, ',
'              a.nmbre_prptrio_igac, ',
'              a.nmro_dcmnto_igac, ',
'              a.drccion_prdio_igac, ',
'              a.area_trrno_igac, ',
'              a.area_cnstrda_igac, ',
'              a.avluo_igac'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P10_INDICADOR'
,p_plug_display_when_cond2=>'IP'
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
 p_id=>wwv_flow_api.id(172952942533246776)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ECASTILLO'
,p_internal_uid=>170780912967657816
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172953053393246777)
,p_db_column_name=>'VGNCIA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172953133840246778)
,p_db_column_name=>'RFRNCIA_IGAC'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Referencia'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172953250140246779)
,p_db_column_name=>'NMBRE_PRPTRIO_IGAC'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Propietario'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172953414706246780)
,p_db_column_name=>'NMRO_DCMNTO_IGAC'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172953471713246781)
,p_db_column_name=>'DRCCION_PRDIO_IGAC'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Predio'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172953586722246782)
,p_db_column_name=>'AREA_TRRNO_IGAC'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('\00C1rea terreno')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172953708058246783)
,p_db_column_name=>'AREA_CNSTRDA_IGAC'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('\00C1rea Construida')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172953746205246784)
,p_db_column_name=>'AVLUO_IGAC'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Aval\00FAo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(173250981143715507)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1710790'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'VGNCIA:RFRNCIA_IGAC:NMBRE_PRPTRIO_IGAC:NMRO_DCMNTO_IGAC:DRCCION_PRDIO_IGAC:AREA_TRRNO_IGAC:AREA_CNSTRDA_IGAC:AVLUO_IGAC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173605954873271304)
,p_plug_name=>'Predios Enviados Material'
,p_parent_plug_id=>wwv_flow_api.id(33302020574531605)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''icon'' as card_type',
'     , ''fa-file-archive-o'' as card_icon ',
'     , null AS card_icon_color',
'     , ''background: linear-gradient(60deg, hsl(0, 97%, 50%), hsl(0, 84%, 85%));box-shadow: 0 12px 20px -10px rgba(230, 230, 230, 0.28), 0 4px 20px 0px rgba(0, 0, 0, 0.12), 0 7px 8px -5px rgba(230, 230, 230, 0.2);'' as card_header_style',
'     , ''Predios Enviados'' AS card_title',
'     , to_char( count(*) ,''999G999G999G999G999G999G990'' ) as card_value',
'     , '''' as card_footer',
'     , '''' as card_link',
'     , null as card_chart_data',
'     , null as card_chart_config ',
'  from gi_g_cinta_igac',
' where id_prcso_crga   = :P40_ARCHIVO',
'   and nmro_orden_igac = ''001'''))
,p_plug_source_type=>'PLUGIN_APEX.MATERIAL.CARDS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P10_INDICADOR'
,p_plug_display_when_cond2=>'PE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'  "cardWidth": 15',
'}'))
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173606052904271305)
,p_plug_name=>'Registros Enviados Material'
,p_parent_plug_id=>wwv_flow_api.id(33302020574531605)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''icon'' as card_type',
'     , ''fa-file-archive-o'' as card_icon ',
'     , null AS card_icon_color',
'     , ''background: linear-gradient(60deg, hsl(0, 97%, 50%), hsl(0, 84%, 85%));box-shadow: 0 12px 20px -10px rgba(230, 230, 230, 0.28), 0 4px 20px 0px rgba(0, 0, 0, 0.12), 0 7px 8px -5px rgba(230, 230, 230, 0.2);'' as card_header_style',
'     , ''Registros Enviados'' AS card_title',
'     , to_char( count(*) ,''999G999G999G999G999G999G990'' ) as card_value',
'     , '''' as card_footer',
'     , '''' as card_link',
'     , null as card_chart_data',
'     , null as card_chart_config ',
'  from gi_g_cinta_igac ',
' where id_prcso_crga = :P40_ARCHIVO'))
,p_plug_source_type=>'PLUGIN_APEX.MATERIAL.CARDS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P10_INDICADOR'
,p_plug_display_when_cond2=>'RE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'  "cardWidth": 15',
'}'))
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173606187613271306)
,p_plug_name=>'Incremento de Predios Material'
,p_parent_plug_id=>wwv_flow_api.id(33302020574531605)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       ''icon'' AS CARD_TYPE, ',
'       ''fa-line-chart'' AS CARD_ICON, ',
'       '''' AS CARD_ICON_COLOR, ',
'       ''background: linear-gradient(60deg, hsl(66, 57%, 34%), hsl(69, 85%, 52%));box-shadow: 0 12px 20px -10px rgba(230, 230, 230, 0.28), 0 4px 20px 0px rgba(0, 0, 0, 0.12), 0 7px 8px -5px rgba(230, 230, 230, 0.2);'' AS CARD_HEADER_STYLE,',
'       ''Incremento en predios entre vigencia Anterior y Actual'' AS CARD_TITLE, ',
'       to_char(sum(case when vgncia = :P40_VGNCIA then incremento',
'              else -incremento end),''999G999G999G999G999G999G990'') AS CARD_VALUE, ',
'       '''' AS CARD_FOOTER, ',
'       '''' AS CARD_LINK, ',
'       null AS CARD_CHART_DATA, ',
'       null AS CARD_CHART_CONFIG ',
'  from (',
'              select count(*) as incremento, vgncia',
'                from v_gi_g_cinta_igac a',
'               where a.nmro_orden_igac = ''001'' ',
'                 and a.vgncia          in ( :P40_VGNCIA, ( :P40_VGNCIA - 1 ) )',
'                 and a.cdgo_clnte      = :F_CDGO_CLNTE',
'                 group by vgncia',
'         )'))
,p_plug_source_type=>'PLUGIN_APEX.MATERIAL.CARDS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P10_INDICADOR'
,p_plug_display_when_cond2=>'IP'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'  "cardWidth": 15',
'}'))
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(168978123803513373)
,p_plug_name=>'Incremento Predios entre Vigencia Anterior y Actual Nuevos en la Cinta'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--stacked:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       ''icon'' AS CARD_TYPE, ',
'       ''fa-line-chart'' AS CARD_ICON, ',
'       NULL AS CARD_ICON_COLOR, ',
'       ''background: linear-gradient(60deg, hsl(305, 96%, 28%), hsl(291, 90%, 60%));box-shadow: 0 12px 20px -10px rgba(230, 230, 230, 0.28), 0 4px 20px 0px rgba(0, 0, 0, 0.12), 0 7px 8px -5px rgba(230, 230, 230, 0.2);'' AS CARD_HEADER_STYLE,',
'       ''Incremento Predios entre Vigencia Anterior y Actual Nuevos en la Cinta'' AS CARD_TITLE, ',
'       to_char(count(*),''999G999G999G999G999G999G990'') AS CARD_VALUE, ',
'       '''' AS CARD_FOOTER, ',
'       '''' AS CARD_LINK, ',
'       NULL AS CARD_CHART_DATA, ',
'       NULL AS CARD_CHART_CONFIG',
'  from v_gi_g_cinta_igac a',
' where a.nmro_orden_igac = ''001'' ',
'   and a.cdgo_clnte      = :F_CDGO_CLNTE',
'   and a.vgncia          = :P40_VGNCIA',
'   and not exists ( ',
'                    select ''x'' ',
'                          from gi_g_cinta_igac c',
'                          join et_g_procesos_carga b',
'                            on a.id_prcso_crga = b.id_prcso_crga',
'                         where c.rfrncia_igac = a.rfrncia_igac ',
'                           and b.vgncia = (:P40_VGNCIA - 1)',
'                   )',
'   and not exists (',
'                    select ''x'' ',
'                      from v_si_i_sujetos_impuesto d',
'                     where d.idntfccion_sjto = a.rfrncia_igac',
'                       and d.cdgo_clnte      = :F_CDGO_CLNTE',
'                  )'))
,p_plug_source_type=>'PLUGIN_APEX.MATERIAL.CARDS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P10_INDICADOR'
,p_plug_display_when_cond2=>'PNA'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'  "cardWidth": 15',
'}'))
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(168978140872513374)
,p_plug_name=>'Incremento de Predios Nuevos entre Vigencia Actual y Anterior Existentes en Predios Material'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--stacked:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       ''icon'' AS CARD_TYPE, ',
'       ''fa-line-chart'' AS CARD_ICON, ',
'       NULL AS CARD_ICON_COLOR, ',
'       ''background: linear-gradient(60deg, hsl(249, 98%, 18%), hsl(241, 89%, 78%));box-shadow: 0 12px 20px -10px rgba(230, 230, 230, 0.28), 0 4px 20px 0px rgba(0, 0, 0, 0.12), 0 7px 8px -5px rgba(230, 230, 230, 0.2);'' AS CARD_HEADER_STYLE,',
'       ''Incremento de Predios Nuevos entre Vigencia Actual y Anterior Existentes en Predios'' AS CARD_TITLE, ',
'       to_char(count(*),''999G999G999G999G999G999G990'') AS CARD_VALUE, ',
'       '''' AS CARD_FOOTER, ',
'       '''' AS CARD_LINK, ',
'       NULL AS CARD_CHART_DATA, ',
'       NULL AS CARD_CHART_CONFIG',
'  from v_gi_g_cinta_igac a',
' where a.nmro_orden_igac = ''001'' ',
'   and a.cdgo_clnte      = :F_CDGO_CLNTE',
'   and a.vgncia          = :P40_VGNCIA',
'   and not exists ( ',
'                    select ''x'' ',
'                      from v_gi_g_cinta_igac c',
'                     where c.rfrncia_igac = a.rfrncia_igac ',
'                       and c.vgncia  = (:P40_VGNCIA - 1)',
'                  )',
'   and exists     (',
'                    select ''x'' ',
'                      from v_si_i_sujetos_impuesto e ',
'                     where e.idntfccion = a.rfrncia_igac',
'                       and e.cdgo_clnte   = :F_CDGO_CLNTE',
'                  )'))
,p_plug_source_type=>'PLUGIN_APEX.MATERIAL.CARDS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P10_INDICADOR'
,p_plug_display_when_cond2=>'PN'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'  "cardWidth": 15',
'}'))
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(172953833431246785)
,p_plug_name=>'<b>Informe Incremento Predios Nuevos</b>'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.rfrncia_igac,',
'       a.nmbre_prptrio_igac,',
'       a.nmro_dcmnto_igac,',
'       a.drccion_prdio_igac,',
'       a.area_trrno_igac,',
'       a.area_cnstrda_igac,',
'       a.avluo_igac',
'  from gi_g_cinta_igac a',
'  join et_g_procesos_carga b',
'    on a.id_prcso_crga = b.id_prcso_crga',
' where a.nmro_orden_igac = ''001''',
'   and b.cdgo_clnte      = :F_CDGO_CLNTE',
'   and b.vgncia          = :P40_VGNCIA',
'   and not exists (',
'                    select ''x''',
'                     from gi_g_cinta_igac c',
'                     join et_g_procesos_carga d',
'                       on c.id_prcso_crga = d.id_prcso_crga',
'                    where c.rfrncia_igac  = a.rfrncia_igac',
'                      and d.vgncia        = (:P40_VGNCIA - 1)',
'                   )'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P10_INDICADOR'
,p_plug_display_when_cond2=>'IPN'
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
 p_id=>wwv_flow_api.id(172953930523246786)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ECASTILLO'
,p_internal_uid=>170781900957657826
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172954041167246787)
,p_db_column_name=>'RFRNCIA_IGAC'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Referencia'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172954177443246788)
,p_db_column_name=>'NMBRE_PRPTRIO_IGAC'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Propietario'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172954246679246789)
,p_db_column_name=>'NMRO_DCMNTO_IGAC'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172954331899246790)
,p_db_column_name=>'DRCCION_PRDIO_IGAC'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Predio'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172954448650246791)
,p_db_column_name=>'AREA_TRRNO_IGAC'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('\00C1rea terreno')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172954597215246792)
,p_db_column_name=>'AREA_CNSTRDA_IGAC'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('\00C1rea construida')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172954674121246793)
,p_db_column_name=>'AVLUO_IGAC'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Aval\00FAo ')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(173280965875784678)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1711090'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'RFRNCIA_IGAC:NMBRE_PRPTRIO_IGAC:NMRO_DCMNTO_IGAC:DRCCION_PRDIO_IGAC:AREA_TRRNO_IGAC:AREA_CNSTRDA_IGAC:AVLUO_IGAC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(172954762663246794)
,p_plug_name=>'<b>Informe Incremento Predios entre Vigencia Anterior y Actual Nuevos en la Cinta</b>'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select a.rfrncia_igac, ',
'           a.nmbre_prptrio_igac, ',
'           a.nmro_dcmnto_igac, ',
'           a.drccion_prdio_igac, ',
'           a.area_trrno_igac, ',
'           a.area_cnstrda_igac, ',
'           a.avluo_igac',
'      from gi_g_cinta_igac a',
'      join et_g_procesos_carga b',
'        on a.id_prcso_crga = b.id_prcso_crga',
'     where a.nmro_orden_igac = ''001'' ',
'       --and b.cdgo_clnte      = :F_CDGO_CLNTE',
'       and b.vgncia          = :P40_VGNCIA',
'       and not exists ( ',
'                        select ''x'' ',
'                          from gi_g_cinta_igac c',
'                          join et_g_procesos_carga b',
'                            on a.id_prcso_crga = b.id_prcso_crga',
'                         where c.rfrncia_igac = a.rfrncia_igac ',
'                           and b.vgncia = (:P40_VGNCIA - 1)',
'                       )',
'       and not exists (',
'                        select ''x'' ',
'                          from v_si_i_sujetos_impuesto d',
'                         where d.idntfccion_sjto = a.rfrncia_igac',
'                           and d.cdgo_clnte   = :F_CDGO_CLNTE',
'                      )'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P10_INDICADOR'
,p_plug_display_when_cond2=>'PNA'
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
end;
/
begin
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(172954896301246795)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ECASTILLO'
,p_internal_uid=>170782866735657835
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172955023284246796)
,p_db_column_name=>'RFRNCIA_IGAC'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Referencia'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172955077325246797)
,p_db_column_name=>'NMBRE_PRPTRIO_IGAC'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Propietario'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172955198349246798)
,p_db_column_name=>'NMRO_DCMNTO_IGAC'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172955254785246799)
,p_db_column_name=>'DRCCION_PRDIO_IGAC'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Predio'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172955419486246800)
,p_db_column_name=>'AREA_TRRNO_IGAC'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('\00C1rea terreno')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172955485087246801)
,p_db_column_name=>'AREA_CNSTRDA_IGAC'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('\00C1rea construida')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172955581582246802)
,p_db_column_name=>'AVLUO_IGAC'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Aval\00FAo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(173291359744825902)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1711194'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'RFRNCIA_IGAC:NMBRE_PRPTRIO_IGAC:NMRO_DCMNTO_IGAC:DRCCION_PRDIO_IGAC:AREA_TRRNO_IGAC:AREA_CNSTRDA_IGAC:AVLUO_IGAC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(172955652231246803)
,p_plug_name=>'<b>Informe Incremento de Predios Nuevos entre Vigencia Actual y Anterior Existentes en Predios</b>'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select a.rfrncia_igac,',
'           a.nmbre_prptrio_igac,',
'           a.nmro_dcmnto_igac,',
'           a.drccion_prdio_igac,',
'           a.area_trrno_igac,',
'           a.area_cnstrda_igac,',
'           a.avluo_igac',
'      from gi_g_cinta_igac a',
'      join et_g_procesos_carga b',
'        on a.id_prcso_crga = b.id_prcso_crga',
'     where a.nmro_orden_igac = ''001'' ',
'       and b.cdgo_clnte      = :F_CDGO_CLNTE',
'       and b.vgncia          = :P40_VGNCIA',
'       and not exists ( ',
'                        select ''x'' ',
'                          from gi_g_cinta_igac c',
'                          join et_g_procesos_carga d',
'                            on c.id_prcso_crga = d.id_prcso_crga',
'                         where c.rfrncia_igac = a.rfrncia_igac ',
'                           and d.vgncia  = (:P40_VGNCIA - 1)',
'                      )',
'       and exists     (',
'                        select ''x'' ',
'                          from si_i_sujetos_impuesto e ',
'                         where e.idntfccion = a.rfrncia_igac',
'                           and e.cdgo_clnte   = :F_CDGO_CLNTE',
'                      )'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P10_INDICADOR'
,p_plug_display_when_cond2=>'PN'
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
 p_id=>wwv_flow_api.id(172955792826246804)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ECASTILLO'
,p_internal_uid=>170783763260657844
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172955928622246805)
,p_db_column_name=>'RFRNCIA_IGAC'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Referencia'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172955995841246806)
,p_db_column_name=>'NMBRE_PRPTRIO_IGAC'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Propietario'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172956086554246807)
,p_db_column_name=>'NMRO_DCMNTO_IGAC'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172956178067246808)
,p_db_column_name=>'DRCCION_PRDIO_IGAC'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172956324077246809)
,p_db_column_name=>'AREA_TRRNO_IGAC'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('\00C1rea Terreno')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172956415701246810)
,p_db_column_name=>'AREA_CNSTRDA_IGAC'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('\00C1rea Construida')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173295681167847361)
,p_db_column_name=>'AVLUO_IGAC'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Aval\00FAo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(173304703722852266)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1711327'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'RFRNCIA_IGAC:NMBRE_PRPTRIO_IGAC:NMRO_DCMNTO_IGAC:DRCCION_PRDIO_IGAC:AREA_TRRNO_IGAC:AREA_CNSTRDA_IGAC:AVLUO_IGAC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173606242779271307)
,p_plug_name=>'Incremento Predios Nuevos Material'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--stacked:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       ''icon'' AS CARD_TYPE, ',
'       ''fa-line-chart'' AS CARD_ICON, ',
'       NULL AS CARD_ICON_COLOR, ',
'       ''background: linear-gradient(60deg, hsl(44, 100%, 57%), hsl(39, 100%, 53%));box-shadow: 0 12px 20px -10px rgba(230, 230, 230, 0.28), 0 4px 20px 0px rgba(0, 0, 0, 0.12), 0 7px 8px -5px rgba(230, 230, 230, 0.2);'' AS CARD_HEADER_STYLE,',
'       ''Incremento en Predios Nuevos'' AS CARD_TITLE, ',
'       to_char(count(*),''999G999G999G999G999G999G990'') AS CARD_VALUE, ',
'       '''' AS CARD_FOOTER, ',
'       '''' AS CARD_LINK, ',
'       NULL AS CARD_CHART_DATA, ',
'       NULL AS CARD_CHART_CONFIG',
'  from v_gi_g_cinta_igac a',
' where a.nmro_orden_igac = ''001''',
'   and a.cdgo_clnte      = :F_CDGO_CLNTE',
'   and a.vgncia          = :P40_VGNCIA',
'   and not exists (',
'                    select ''x''',
'                     from v_gi_g_cinta_igac c',
'                    where c.rfrncia_igac  = a.rfrncia_igac',
'                      and c.cdgo_clnte      = :F_CDGO_CLNTE',
'                      and c.vgncia        = (:P40_VGNCIA - 1)',
'                   )'))
,p_plug_source_type=>'PLUGIN_APEX.MATERIAL.CARDS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P10_INDICADOR'
,p_plug_display_when_cond2=>'IPN'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'  "cardWidth": 15',
'}'))
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172951931288246766)
,p_name=>'P10_INDICADOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(33302020574531605)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
