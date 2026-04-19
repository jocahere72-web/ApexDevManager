prompt --application/pages/page_00231
begin
wwv_flow_api.create_page(
 p_id=>231
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Acuerdos de Pago Modificados'
,p_page_mode=>'MODAL'
,p_step_title=>'Acuerdos de Pago Modificados'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177320258117050591)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'LOBREDOR'
,p_last_upd_yyyymmddhh24miss=>'20191017095957'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3723165550833201)
,p_plug_name=>'Acuerdos Modifiados'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.nmro_cnvnio',
'       ,c.fcha_rgstro',
'       ,c.nmbre_impsto',
'       ,c.nmbre_impsto_sbmpsto',
'       ,c.idntfccion_sjto_frmtda',
'       ,c.nmbre_slctnte',
'       ,initcap(c.dscrpcn_cnvnio_mdfccion_estdo) dscrpcn_cnvnio_mdfccion_estdo',
'       ,decode(cdgo_cnvnio_mdfccion_tpo, ''MFC'', c.dscrpcion_prdcdad_cta, ''MNC'' , c.nvo_nmro_cta ) mdfccion',
' from v_gf_g_convenios_modificacion c',
' join v_gf_g_convenios d on c.id_cnvnio = d.id_cnvnio',
'where c.cdgo_clnte = :F_CDGO_CLNTE ',
'  and ((trunc(c.fcha_rgstro) between :P118_FECHA_INICIAL and :P118_FECHA_FINAL)',
'   or ((trunc(c.fcha_rgstro) >= :P118_FECHA_INICIAL and :P118_FECHA_FINAL   is null))',
'   or (trunc(c.fcha_rgstro)  <= :P118_FECHA_FINAL   and :P118_FECHA_INICIAL is null)',
'   or (:P118_FECHA_INICIAL is null and :P118_FECHA_FINAL is null))',
'  and c.cdgo_cnvnio_mdfccion_tpo = :P231_CDGO_CNVNIO_MDFCCION_TPO',
'  and c.cdgo_cnvnio_mdfccion_estdo = :P231_CDGO_CNVNIO_MDFCCION_ESTDO;'))
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
 p_id=>wwv_flow_api.id(3701733485753705)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LOBREDOR'
,p_internal_uid=>3701733485753705
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3701892771753706)
,p_db_column_name=>'NMRO_CNVNIO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00FAmero <br> Acuerdo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3701939774753707)
,p_db_column_name=>'FCHA_RGSTRO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Fecha'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3702091445753708)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3702159264753709)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Sub - Tributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3702226132753710)
,p_db_column_name=>'IDNTFCCION_SJTO_FRMTDA'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Sujeto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3702301671753711)
,p_db_column_name=>'NMBRE_SLCTNTE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Solicitante'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3702436322753712)
,p_db_column_name=>'DSCRPCN_CNVNIO_MDFCCION_ESTDO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23956818313187039)
,p_db_column_name=>'MDFCCION'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('N\00B0 Cuotas /<br> Periodicidad (Nuevos)')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(4121712947148477)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'41218'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_CNVNIO:FCHA_RGSTRO:NMBRE_IMPSTO:NMBRE_IMPSTO_SBMPSTO:IDNTFCCION_SJTO_FRMTDA:NMBRE_SLCTNTE:DSCRPCN_CNVNIO_MDFCCION_ESTDO:MDFCCION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3723294442833202)
,p_name=>'P231_CDGO_CNVNIO_MDFCCION_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(3723165550833201)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23956939255187040)
,p_name=>'P231_CDGO_CNVNIO_MDFCCION_ESTDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(3723165550833201)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
