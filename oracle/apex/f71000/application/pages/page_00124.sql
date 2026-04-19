prompt --application/pages/page_00124
begin
wwv_flow_api.create_page(
 p_id=>124
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Cuotas Esperadas'
,p_page_mode=>'MODAL'
,p_step_title=>'Cuotas Esperadas'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177320258117050591)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'90%'
,p_last_updated_by=>'1048292205'
,p_last_upd_yyyymmddhh24miss=>'20191016101041'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86032915463896716)
,p_plug_name=>'Detalle Cuotas'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--hiddenOverflow:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmro_cnvnio nmro',
'      ,to_char(sum(a.vlor_ttal), :F_FRMTO_MNDA)vlor_ttal',
'      ,to_char(b.ttal_cnvnio, :F_FRMTO_MNDA)ttal_cnvnio',
'      ,to_char(b.fcha_aplccion, ''DD/MM/YYYY'')fcha_aplccion',
'      ,to_char(a.fcha_vncmnto, ''DD/MM/YYYY'') fcha_vncmnto',
'      ,b.nmbre_impsto',
'      ,b.nmbre_impsto_sbmpsto',
'      ,b.idntfccion_sjto',
'      ,b.dscrpcion_cnvnio_tpo',
'      ,a.id_cnvnio_extrcto',
'      ,a.nmro_cta',
'     from gf_g_convenios_extracto a',
'     join v_gf_g_convenios b on a.id_cnvnio = b.id_cnvnio',
'    where b.cdgo_clnte = :F_CDGO_CLNTE',
'      and trunc(sysdate) > trunc(a.fcha_vncmnto)',
'      and b.cdgo_cnvnio_estdo = ''APL''',
'    and fcha_aplccion between :P124_FCHA_INCIAL and :P124_FCHA_FNAL',
'group by b.nmro_cnvnio, to_char(b.ttal_cnvnio, :F_FRMTO_MNDA), to_char(b.fcha_aplccion, ''DD/MM/YYYY''), to_char(a.fcha_vncmnto, ''DD/MM/YYYY''), b.nmbre_impsto,',
'        b.nmbre_impsto_sbmpsto, b.idntfccion_sjto, b.dscrpcion_cnvnio_tpo, a.id_cnvnio_extrcto, a.nmro_cta'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P124_FCHA_INCIAL,P124_FCHA_FNAL'
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
 p_id=>wwv_flow_api.id(86033241248896719)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LOBREDOR'
,p_internal_uid=>86033241248896719
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86033316515896720)
,p_db_column_name=>'NMRO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00B0 Acuerdo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86033406977896721)
,p_db_column_name=>'TTAL_CNVNIO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Total Acuerdo'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86033985572896726)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3471452212156613)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Sub - Tributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23954884945187019)
,p_db_column_name=>'FCHA_APLCCION'
,p_display_order=>150
,p_column_identifier=>'P'
,p_column_label=>unistr('Fecha <br>Aplicaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23954947536187020)
,p_db_column_name=>'FCHA_VNCMNTO'
,p_display_order=>160
,p_column_identifier=>'Q'
,p_column_label=>'Fecha <br> Vencimiento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23955050347187021)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>170
,p_column_identifier=>'R'
,p_column_label=>'Sujeto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23955163775187022)
,p_db_column_name=>'DSCRPCION_CNVNIO_TPO'
,p_display_order=>180
,p_column_identifier=>'S'
,p_column_label=>'Tipo Acuerdo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23955218209187023)
,p_db_column_name=>'ID_CNVNIO_EXTRCTO'
,p_display_order=>190
,p_column_identifier=>'T'
,p_column_label=>'Id Cnvnio Extrcto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23955337406187024)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>200
,p_column_identifier=>'U'
,p_column_label=>'Cuotas Esperadas'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23955460631187025)
,p_db_column_name=>'NMRO_CTA'
,p_display_order=>210
,p_column_identifier=>'V'
,p_column_label=>unistr('N\00B0 Cuota')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(86172850031812529)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'861729'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO:NMRO_CTA:NMBRE_IMPSTO:NMBRE_IMPSTO_SBMPSTO:IDNTFCCION_SJTO:DSCRPCION_CNVNIO_TPO:FCHA_APLCCION:FCHA_VNCMNTO:VLOR_TTAL:TTAL_CNVNIO:'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86033067445896717)
,p_name=>'P124_FCHA_INCIAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(86032915463896716)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86033101263896718)
,p_name=>'P124_FCHA_FNAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(86032915463896716)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
