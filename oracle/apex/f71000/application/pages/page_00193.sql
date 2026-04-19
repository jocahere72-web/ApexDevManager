prompt --application/pages/page_00193
begin
wwv_flow_api.create_page(
 p_id=>193
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Detalle Modificaci\00F3n Acuerdo Pago')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Detalle Modificaci\00F3n Acuerdo Pago')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'LOBREDOR'
,p_last_upd_yyyymmddhh24miss=>'20190626162204'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(109050132025485503)
,p_plug_name=>unistr('Detalle Modificaci\00F3n Acuerdo Pago')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_cnvnio,',
'       a.idntfccion_sjto_frmtda,',
'       a.nmro_cnvnio,',
'       to_char(a.fcha_rgstro, ''DD/MM/YYYY'') fcha_rgstro,',
'       a.nmro_idntfccion_slctnte,',
'       a.nmbre_slctnte,       ',
'       a.dscrpcn_cnvnio_mdfccion_estdo,',
'       a.id_acto',
'  from v_gf_g_convenios_modificacion a',
'  join (select id_cnvnio_mdfccion',
'          from json_table(:P187_ID_CNVNIO_MDFCCION,''$[*]''columns id_cnvnio_mdfccion PATH ''$.ID_CNVNIO_MDFCCION'')) b on a.id_cnvnio_mdfccion = b.id_cnvnio_mdfccion',
' where a.cdgo_clnte = :F_CDGO_CLNTE ',
'order by a.nmro_cnvnio',
''))
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
 p_id=>wwv_flow_api.id(120659627622625402)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LOBREDOR'
,p_internal_uid=>120659627622625402
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(120659791848625403)
,p_db_column_name=>'ID_CNVNIO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'id cnvnio'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(120659893101625404)
,p_db_column_name=>'IDNTFCCION_SJTO_FRMTDA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Sujeto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(120659938305625405)
,p_db_column_name=>'NMRO_CNVNIO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Numero<br>Acuerdo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(120660149577625407)
,p_db_column_name=>'NMRO_IDNTFCCION_SLCTNTE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Identificaci\00F3n<br>Solicitante')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(120660249984625408)
,p_db_column_name=>'NMBRE_SLCTNTE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Solicitante'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(120660394856625409)
,p_db_column_name=>'DSCRPCN_CNVNIO_MDFCCION_ESTDO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(120660428879625410)
,p_db_column_name=>'ID_ACTO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Acto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:GN_G_ACTOS:FILE_BLOB:ID_ACTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(120660562371625411)
,p_db_column_name=>'FCHA_RGSTRO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Fecha<br>Registro'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(120910915892755930)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1209110'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_CNVNIO:IDNTFCCION_SJTO_FRMTDA:NMRO_IDNTFCCION_SLCTNTE:NMBRE_SLCTNTE:FCHA_RGSTRO:DSCRPCN_CNVNIO_MDFCCION_ESTDO:ID_ACTO:'
);
end;
/
