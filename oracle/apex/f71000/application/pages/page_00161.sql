prompt --application/pages/page_00161
begin
wwv_flow_api.create_page(
 p_id=>161
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Reversi\00F3n Acuerdos de Pago')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Reversi\00F3n Acuerdos de Pago')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177320258117050591)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'LOBREDOR'
,p_last_upd_yyyymmddhh24miss=>'20191219160743'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(472063934796259771)
,p_plug_name=>'Datos Acuerdo de Pago'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_cnvnio,',
'       nvl(a.idntfccion_sjto_frmtda, idntfccion_sjto) idntfccion_sjto,',
'       a.nmro_cnvnio,     ',
'       a.nmro_idntfccion_slctnte,',
'       a.nmbre_slctnte,       ',
'       a.dscrpcion_cnvnio_tpo,',
'       nvl(trunc(a.fcha_aplccion_rvrsion), trunc(a.fcha_rchzo)) fcha,',
'       a.id_acto',
'  from v_gf_g_convenios_reversion a',
'  join (select id_cnvnio',
'          from json_table (:P147_ID_CNVNIO, ''$[*]'' columns id_cnvnio path ''$.ID_CNVNIO'')) b on a.id_cnvnio = b.id_cnvnio',
'  where a.cdgo_clnte = :F_CDGO_CLNTE;'))
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
 p_id=>wwv_flow_api.id(101561696631706602)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LOBREDOR'
,p_internal_uid=>101561696631706602
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101561700578706603)
,p_db_column_name=>'ID_CNVNIO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Cnvnio'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101561881521706604)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Sujeto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101561934934706605)
,p_db_column_name=>'NMRO_CNVNIO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('N\00B0 Acuerdo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101562085709706606)
,p_db_column_name=>'NMRO_IDNTFCCION_SLCTNTE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Identificaci\00F3n <br> Solicitante')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101562155913706607)
,p_db_column_name=>'NMBRE_SLCTNTE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Solicitante'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101562236994706608)
,p_db_column_name=>'DSCRPCION_CNVNIO_TPO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Tipo de Acuerdo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101562391804706609)
,p_db_column_name=>'ID_ACTO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Acto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:V_GN_G_ACTOS:FILE_BLOB:ID_ACTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(35289263295718213)
,p_db_column_name=>'FCHA'
,p_display_order=>80
,p_column_identifier=>'I'
,p_column_label=>'Fecha'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(101582006370763147)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1015821'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'FCHA:NMRO_CNVNIO:IDNTFCCION_SJTO:NMBRE_SLCTNTE:NMRO_IDNTFCCION_SLCTNTE:ID_ACTO:'
);
end;
/
