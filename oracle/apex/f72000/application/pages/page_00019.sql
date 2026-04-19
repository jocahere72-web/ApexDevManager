prompt --application/pages/page_00019
begin
wwv_flow_api.create_page(
 p_id=>19
,p_user_interface_id=>wwv_flow_api.id(72999165452094574)
,p_name=>'Documentos Generados Etapa'
,p_page_mode=>'MODAL'
,p_step_title=>'Documentos Generados Etapa'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_dialog_attributes=>'resizable:true, draggable:true'
,p_last_updated_by=>'JCUAO'
,p_last_upd_yyyymmddhh24miss=>'20191031112701'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(167708894120027830)
,p_plug_name=>'Documentos Generados'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_rcrso_dcmnto,',
'       a.id_fljo_trea,',
'       a.id_plntlla,',
'       a.dscrpcion_plntlla,',
'       a.id_acto_tpo,',
'       a.dscrpcion_acto_tpo,',
'       a.id_acto,',
'       a.id_acto_tpo_gnrdo,',
'       a.nmro_acto,',
'       a.nmro_acto_dsplay,',
'       a.dscrpcion_acto_tpo_gnrdo,',
'       a.txto_dcmnto,',
'       case when a.nmro_acto is not null then',
'                ''<center>',
'                <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver <span class="fa fa-eye"></span>',
'                </button>',
'                </center>''',
'            when a.nmro_acto is null then ',
'                null ',
'            end accion,',
unistr('       case b.indcdor_ntfcdo when ''S'' then ''S\00ED'' when ''N'' then ''No'' end indcdor_ntfcdo,'),
'       b.id_ntfccion,',
'       case when b.id_ntfccion is not null then',
'                ''<center>',
'                <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver <span class="fa fa-eye"></span>',
'                </button>',
'                </center>''',
'            when b.id_ntfccion is null then',
'                null',
'            end btn_ntfcdo',
'  from v_gj_g_recursos_documento a',
'  left  join v_nt_g_notfccnes_gn_g_actos b on a.id_acto = b.id_acto',
' where a.id_rcrso = :P19_ID_RCRSO and',
'       a.id_fljo_trea = :P19_ID_FLJO_TREA'))
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
 p_id=>wwv_flow_api.id(83844592185381717)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No hay documentos disponibles'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JCUAO'
,p_internal_uid=>83844592185381717
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(83845174624381723)
,p_db_column_name=>'NMRO_ACTO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('N\00FAmero del Acto')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(83845334094381725)
,p_db_column_name=>'DSCRPCION_ACTO_TPO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Tipo de Acto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(83845485463381726)
,p_db_column_name=>'TXTO_DCMNTO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Texto Documento'
,p_column_type=>'CLOB'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85173285486932006)
,p_db_column_name=>'ID_ACTO'
,p_display_order=>100
,p_column_identifier=>'O'
,p_column_label=>'Acto Generado'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85172706243932001)
,p_db_column_name=>'ID_RCRSO_DCMNTO'
,p_display_order=>110
,p_column_identifier=>'J'
,p_column_label=>'Id Rcrso Dcmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85172941101932003)
,p_db_column_name=>'ID_FLJO_TREA'
,p_display_order=>130
,p_column_identifier=>'L'
,p_column_label=>'Id Fljo Trea'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85173052629932004)
,p_db_column_name=>'ID_PLNTLLA'
,p_display_order=>140
,p_column_identifier=>'M'
,p_column_label=>'Id Plntlla'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85173105773932005)
,p_db_column_name=>'ID_ACTO_TPO'
,p_display_order=>150
,p_column_identifier=>'N'
,p_column_label=>'Id Acto Tpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85173318092932007)
,p_db_column_name=>'ID_ACTO_TPO_GNRDO'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Id Acto Tpo Gnrdo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85173401637932008)
,p_db_column_name=>'NMRO_ACTO_DSPLAY'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Nmro Acto Dsplay'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85173561390932009)
,p_db_column_name=>'DSCRPCION_ACTO_TPO_GNRDO'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Dscrpcion Acto Tpo Gnrdo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86413586280326502)
,p_db_column_name=>'ACCION'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Acto Generado'
,p_column_link=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,FILE_BLOB,FILE_NAME,FILE_MIMETYPE,ID_ACTO,#ID_ACTO#'
,p_column_linktext=>'#ACCION#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(89552037985668801)
,p_db_column_name=>'INDCDOR_NTFCDO'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>unistr('\00BFNotificado?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(89552121086668802)
,p_db_column_name=>'ID_NTFCCION'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Id Ntfccion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(89552285780668803)
,p_db_column_name=>'BTN_NTFCDO'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>unistr('Notificaci\00F3n')
,p_column_link=>'f?p=65000:19:&SESSION.::&DEBUG.:RP,19:P19_ID_NTFCCION:#ID_NTFCCION#'
,p_column_linktext=>'#BTN_NTFCDO#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93621257770559901)
,p_db_column_name=>'DSCRPCION_PLNTLLA'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Plantilla'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(83941689708044330)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'839417'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_ACTO_TPO:NMRO_ACTO:INDCDOR_NTFCDO:ACCION:BTN_NTFCDO::DSCRPCION_PLNTLLA'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93614819203552798)
,p_name=>'P19_ID_RCRSO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(167708894120027830)
,p_display_as=>'NATIVE_HIDDEN'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93615117586555010)
,p_name=>'P19_ID_FLJO_TREA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(167708894120027830)
,p_display_as=>'NATIVE_HIDDEN'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
end;
/
