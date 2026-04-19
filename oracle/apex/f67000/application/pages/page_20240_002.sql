prompt --application/pages/page_20240_002
begin
wwv_flow_api.create_page(
 p_id=>2024002
,p_user_interface_id=>wwv_flow_api.id(71698179048188014)
,p_name=>'Consulta de archivos adjuntos'
,p_page_mode=>'MODAL'
,p_step_title=>'Consulta de archivos adjuntos'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'DBALDOVINO'
,p_last_upd_yyyymmddhh24miss=>'20240930174512'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5500756402929301)
,p_plug_name=>'Adjuntos enviados'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71623038711187958)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_envio, b.file_name ',
'from ma_g_envios a',
'join ma_g_envios_adjntos b on b.id_envio = a.id_envio',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.id_envio = :P2024002_ID_ENVIO'))
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
 p_id=>wwv_flow_api.id(5502221588929316)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'DBALDOVINO'
,p_internal_uid=>5502221588929316
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5502346288929317)
,p_db_column_name=>'ID_ENVIO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'<p>Adjunto</p>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:MA_G_ENVIOS_ADJNTOS:FILE_BLOB:ID_ENVIO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5502467007929318)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'<p>Nombre Adjunto</p>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(5519112898988057)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'55192'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'FILE_NAME:ID_ENVIO:'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5501346755929307)
,p_name=>'P2024002_ID_ENVIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5500756402929301)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
end;
/
