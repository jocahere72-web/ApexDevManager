prompt --application/pages/page_00015
begin
wwv_flow_api.create_page(
 p_id=>15
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Aval\00FAo Totales Recibidos')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Aval\00FAo Totales Recibidos')
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-noDataMsg {',
'    padding: 0;',
'}'))
,p_step_template=>wwv_flow_api.id(164066978207707637)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'auto'
,p_dialog_width=>'90%'
,p_last_updated_by=>'NARDILA'
,p_last_upd_yyyymmddhh24miss=>'20190205155128'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(32933435767531001)
,p_plug_name=>unistr('Aval\00FAo Totales Recibidos')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(168978230651513375)
,p_plug_name=>'Predios Con Avaluos Mayor a Cero Material'
,p_parent_plug_id=>wwv_flow_api.id(32933435767531001)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''icon'' as card_type',
'     , ''fa-globe'' as card_icon ',
'     , null as card_icon_color ',
'     , ''background: linear-gradient(60deg, hsl(249, 96%, 49%), hsl(241, 44%, 28%));box-shadow: 0 12px 20px -10px rgba(230, 230, 230, 0.28), 0 4px 20px 0px rgba(0, 0, 0, 0.12), 0 7px 8px -5px rgba(230, 230, 230, 0.2);'' as card_header_style',
unistr('     , ''Predios con aval\00FAos mayor a cero'' as card_title'),
'     , to_char( count(*) , ''999G999G999G999G999G999G990'') as card_value ',
'     , '''' as card_footer',
'     , '''' as card_link',
'     , null as card_chart_data',
'     , null as card_chart_config',
'  from gi_g_cinta_igac ',
' where id_prcso_crga   = :P40_ARCHIVO',
'   and nmro_orden_igac = ''001''',
'   and avluo_igac      > 0'))
,p_plug_source_type=>'PLUGIN_APEX.MATERIAL.CARDS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P15_INDICADOR'
,p_plug_display_when_cond2=>'PAM'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'  "cardWidth": 15',
'}'))
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(168978363323513376)
,p_plug_name=>unistr('Predios Con Aval\00FAos igual a Cero Material')
,p_parent_plug_id=>wwv_flow_api.id(32933435767531001)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''icon'' as card_type',
'     , ''fa-globe'' as card_icon ',
'     , null as card_icon_color ',
'     , ''background: linear-gradient(60deg, hsl(249, 96%, 49%), hsl(241, 44%, 28%));box-shadow: 0 12px 20px -10px rgba(230, 230, 230, 0.28), 0 4px 20px 0px rgba(0, 0, 0, 0.12), 0 7px 8px -5px rgba(230, 230, 230, 0.2);'' as card_header_style',
unistr('     , ''Predios con aval\00FAos igual a cero'' as card_title'),
'     , to_char( count(*) , ''999G999G999G999G999G999G990'') as card_value ',
'     , '''' as card_footer',
'     , '''' as card_link',
'     , null as card_chart_data',
'     , null as card_chart_config',
'  from gi_g_cinta_igac ',
' where id_prcso_crga   = :P40_ARCHIVO',
'   and nmro_orden_igac = ''001''',
'   and avluo_igac      = 0'))
,p_plug_source_type=>'PLUGIN_APEX.MATERIAL.CARDS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P15_INDICADOR'
,p_plug_display_when_cond2=>'PAI'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'  "cardWidth": 15',
'}'))
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(168978437413513377)
,p_plug_name=>'Total Avaluos Material'
,p_parent_plug_id=>wwv_flow_api.id(32933435767531001)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>60
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''icon'' as card_type',
'     , ''fa-globe'' as card_icon ',
'     , null as card_icon_color  ',
'     , ''background: linear-gradient(60deg, hsl(182, 27%, 25%), hsl(182, 32%, 55%));box-shadow: 0 12px 20px -10px rgba(230, 230, 230, 0.28), 0 4px 20px 0px rgba(0, 0, 0, 0.12), 0 7px 8px -5px rgba(230, 230, 230, 0.2);'' as card_header_style',
unistr('     , ''Total aval\00FAos'' as card_title'),
'     , to_char( sum(avluo_igac) ,''999G999G999G999G999G999G990'' ) as card_value',
'     , '''' as card_footer',
'     , '''' as card_link',
'     , null as card_chart_data',
'     , null as card_chart_config',
'  from gi_g_cinta_igac c',
' where c.id_prcso_crga   = :P40_ARCHIVO',
'   and c.nmro_orden_igac = ''001'''))
,p_plug_source_type=>'PLUGIN_APEX.MATERIAL.CARDS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P15_INDICADOR'
,p_plug_display_when_cond2=>'TOT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'  "cardWidth": 15',
'}'))
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173300302647847407)
,p_plug_name=>'<b>Informe Total Avaluos</b>'
,p_parent_plug_id=>wwv_flow_api.id(32933435767531001)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rfrncia_igac',
'     , nmbre_prptrio_igac',
'     , nmro_dcmnto_igac',
'     , drccion_prdio_igac',
'     , area_trrno_igac',
'     , area_cnstrda_igac',
'     , avluo_igac ',
'  from gi_g_cinta_igac ',
' where id_prcso_crga   = :P40_ARCHIVO',
'   and nmro_orden_igac = ''001'''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P15_INDICADOR'
,p_plug_display_when_cond2=>'TOT'
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
 p_id=>wwv_flow_api.id(173300385741847408)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ECASTILLO'
,p_internal_uid=>171128356176258448
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173300486341847409)
,p_db_column_name=>'RFRNCIA_IGAC'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Referencia'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173300544068847410)
,p_db_column_name=>'NMBRE_PRPTRIO_IGAC'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Propietario'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(175071322930017361)
,p_db_column_name=>'NMRO_DCMNTO_IGAC'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(175071413354017362)
,p_db_column_name=>'DRCCION_PRDIO_IGAC'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Direcci\00F3n <br> Predio')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(175071499343017363)
,p_db_column_name=>'AREA_TRRNO_IGAC'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('\00C1rea Terreno')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(175071534852017364)
,p_db_column_name=>'AREA_CNSTRDA_IGAC'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('\00C1rea Construida')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(175071671955017365)
,p_db_column_name=>'AVLUO_IGAC'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Aval\00FAo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(175090996121034852)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1729190'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'RFRNCIA_IGAC:NMBRE_PRPTRIO_IGAC:NMRO_DCMNTO_IGAC:DRCCION_PRDIO_IGAC:AREA_TRRNO_IGAC:AREA_CNSTRDA_IGAC:AVLUO_IGAC'
,p_sum_columns_on_break=>'AVLUO_IGAC:AREA_TRRNO_IGAC:AREA_CNSTRDA_IGAC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(343733332302513178)
,p_plug_name=>unistr('<b>Informe Predios Con Aval\00FAos Mayor a Cero</b>')
,p_parent_plug_id=>wwv_flow_api.id(32933435767531001)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rfrncia_igac',
'     , nmbre_prptrio_igac',
'     , nmro_dcmnto_igac',
'     , drccion_prdio_igac',
'     , area_trrno_igac',
'     , area_cnstrda_igac',
'     , avluo_igac ',
'  from gi_g_cinta_igac ',
' where id_prcso_crga   = :P40_ARCHIVO',
'   and nmro_orden_igac = ''001''',
'   and avluo_igac      > 0'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P15_INDICADOR'
,p_plug_display_when_cond2=>'PAM'
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
 p_id=>wwv_flow_api.id(343733479030513179)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ECASTILLO'
,p_internal_uid=>341561449464924219
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173331021478870141)
,p_db_column_name=>'RFRNCIA_IGAC'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Referencia'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173331426896870141)
,p_db_column_name=>'NMBRE_PRPTRIO_IGAC'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Propietario'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173331729842870142)
,p_db_column_name=>'NMRO_DCMNTO_IGAC'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173332138787870142)
,p_db_column_name=>'DRCCION_PRDIO_IGAC'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Direcci\00F3n <br> Predio')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173332569157870144)
,p_db_column_name=>'AREA_TRRNO_IGAC'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('\00C1rea Terreno')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173332957793870144)
,p_db_column_name=>'AREA_CNSTRDA_IGAC'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('\00C1rea Construida')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173333407918870144)
,p_db_column_name=>'AVLUO_IGAC'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Aval\00FAo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(343784726792689684)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1711617'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'RFRNCIA_IGAC:NMBRE_PRPTRIO_IGAC:NMRO_DCMNTO_IGAC:DRCCION_PRDIO_IGAC:AREA_TRRNO_IGAC:AREA_CNSTRDA_IGAC:AVLUO_IGAC'
,p_sum_columns_on_break=>'AVLUO_IGAC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(344091279051527778)
,p_plug_name=>unistr('<b>Informe Predios Con Aval\00FAos igual a Cero</b>')
,p_parent_plug_id=>wwv_flow_api.id(32933435767531001)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rfrncia_igac',
'     , nmbre_prptrio_igac',
'     , nmro_dcmnto_igac',
'     , drccion_prdio_igac',
'     , area_trrno_igac',
'     , area_cnstrda_igac',
'     , avluo_igac ',
'  from gi_g_cinta_igac ',
' where id_prcso_crga   = :P40_ARCHIVO',
'   and nmro_orden_igac = ''001''',
'   and avluo_igac      = 0'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P15_INDICADOR'
,p_plug_display_when_cond2=>'PAI'
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
 p_id=>wwv_flow_api.id(344091476089527780)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ECASTILLO'
,p_internal_uid=>341919446523938820
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173312088459870063)
,p_db_column_name=>'RFRNCIA_IGAC'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Referencia'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173312522604870065)
,p_db_column_name=>'NMBRE_PRPTRIO_IGAC'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Propietario'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173312831584870065)
,p_db_column_name=>'NMRO_DCMNTO_IGAC'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173313300261870065)
,p_db_column_name=>'DRCCION_PRDIO_IGAC'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Predio'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173313675444870066)
,p_db_column_name=>'AREA_TRRNO_IGAC'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('\00C1rea terreno')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173314114865870066)
,p_db_column_name=>'AREA_CNSTRDA_IGAC'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('\00C1rea Construida')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173314478978870066)
,p_db_column_name=>'AVLUO_IGAC'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Aval\00FAo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(344309247492730298)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1711428'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'RFRNCIA_IGAC:NMBRE_PRPTRIO_IGAC:NMRO_DCMNTO_IGAC:DRCCION_PRDIO_IGAC:AREA_TRRNO_IGAC:AREA_CNSTRDA_IGAC:AVLUO_IGAC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(173330296012870131)
,p_name=>'P15_INDICADOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(32933435767531001)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
