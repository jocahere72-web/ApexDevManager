prompt --application/pages/page_00028
begin
wwv_flow_api.create_page(
 p_id=>28
,p_user_interface_id=>wwv_flow_api.id(30413944355578333)
,p_name=>'Detalle Panel'
,p_page_mode=>'MODAL'
,p_step_title=>'Detalle'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20200107154047'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(203133072846401809)
,p_plug_name=>'Actos Notificados'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(30338884622578288)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_acto,',
'       a.nmro_acto,',
'       a.cdgo_clnte,',
'       a.dscrpcion_acto_orgen,',
'       a.dscrpcion_acto_tpo,',
'       a.fcha',
'from v_nt_g_notfccnes_gn_g_actos a',
'inner join gn_d_actos_tipo b on a.id_acto_tpo = b.id_acto_tpo',
'where a.fcha_incio_ntfccion is not null and',
'     ((:P28_FCHA_INCIAL is not null and :P28_FCHA_FNAL is not null and trunc(a.fcha) between :P28_FCHA_INCIAL and :P28_FCHA_FNAL) or',
'      (:P28_FCHA_INCIAL is null and :P28_FCHA_FNAL is not null and trunc(a.fcha) <= :P28_FCHA_FNAL)or',
'      (:P28_FCHA_INCIAL is not null and :P28_FCHA_FNAL is null and trunc(a.fcha) >= :P28_FCHA_INCIAL)or',
'      (:P28_FCHA_INCIAL is null and :P28_FCHA_FNAL is null)) and',
'      a.id_ntfccion is not null and',
'      a.indcdor_ntfcdo = nvl(case :P28_NTFCCION when ''Actos Notificados'' then ''S'' when ''Actos No Notificados'' then ''N'' else null end, a.indcdor_ntfcdo);'))
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
,p_plug_header=>'<h4 style="text-align: center;">&P28_NTFCCION.</h4>'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(203133125581401810)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JCUAO'
,p_internal_uid=>203133125581401810
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101619898107000417)
,p_db_column_name=>'ID_ACTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Acto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101620143136000420)
,p_db_column_name=>'NMRO_ACTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'No. Acto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101620536099000420)
,p_db_column_name=>'CDGO_CLNTE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Cdgo Clnte'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101620999962000420)
,p_db_column_name=>'DSCRPCION_ACTO_ORGEN'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Origen del Acto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101621394320000421)
,p_db_column_name=>'DSCRPCION_ACTO_TPO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Tipo de Acto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101621768639000421)
,p_db_column_name=>'FCHA'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Fecha'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(203140822713425353)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1016221'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_ACTO:NMRO_ACTO:CDGO_CLNTE:DSCRPCION_ACTO_ORGEN:DSCRPCION_ACTO_TPO:FCHA'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54501712397685502)
,p_name=>'P28_FCHA_INCIAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(203133072846401809)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54501824427685503)
,p_name=>'P28_FCHA_FNAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(203133072846401809)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101515235451401411)
,p_name=>'P28_NTFCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(203133072846401809)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
