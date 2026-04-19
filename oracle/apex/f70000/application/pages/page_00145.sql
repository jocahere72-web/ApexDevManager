prompt --application/pages/page_00145
begin
wwv_flow_api.create_page(
 p_id=>145
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Ver Adjuntos Declaraciones'
,p_page_mode=>'MODAL'
,p_step_title=>'Ver Adjuntos Declaraciones'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_last_updated_by=>'122333'
,p_last_upd_yyyymmddhh24miss=>'20210812134652'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(78373906117450324)
,p_plug_name=>'Ver Adjuntos Declaracion '
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_dclrcion_archvo_adjnto,',
'        a.id_dclrcion,',
'        a.id_dclrcn_archvo_tpo,',
'        c.dscrpcion_adjnto_tpo as tpo_archvo,',
'        a.fcha_dgta,',
'        a.fcha_mdfca,',
'        to_char(dbms_lob.getlength(a.file_blob) / 1024 / 1024 , ''999G999G999G999G990D000'') || '' MB'' tmno,',
'        a.file_name,',
'        1 Descargar',
'from    gi_g_dclrcnes_arhvos_adjnto a',
'join    gi_d_dclrcnes_archvos_tpo   b   on  b.id_dclrcn_archvo_tpo  =   a.id_dclrcn_archvo_tpo',
'join    gi_d_subimpuestos_adjnto_tp c   on  b.id_sbmpto_adjnto_tpo  =   c.id_sbmpto_adjnto_tpo',
'where   a.id_dclrcion   =   :P145_ID_DCLRCION'))
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
 p_id=>wwv_flow_api.id(78374016135450325)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'AHERNANDEZ'
,p_internal_uid=>78374016135450325
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78374289214450327)
,p_db_column_name=>'ID_DCLRCION_ARCHVO_ADJNTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Dclrcion Archvo Adjnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78374306007450328)
,p_db_column_name=>'ID_DCLRCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Dclrcion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78374468519450329)
,p_db_column_name=>'ID_DCLRCN_ARCHVO_TPO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Id Dclrcn Archvo Tpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78374543425450330)
,p_db_column_name=>'FCHA_DGTA'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Fecha de Registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78374698893450331)
,p_db_column_name=>'FCHA_MDFCA'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Fecha de Actualizaci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78374716634450332)
,p_db_column_name=>'TMNO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Tama\00F1o')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78374880436450333)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Nombre Archivo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78375045886450335)
,p_db_column_name=>'DESCARGAR'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:GI_G_DCLRCNES_ARHVOS_ADJNTO:FILE_BLOB:ID_DCLRCION_ARCHVO_ADJNTO::FILE_MIMETYPE:FILE_NAME:::attachment:#FILE_NAME#:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(140658715211351002)
,p_db_column_name=>'TPO_ARCHVO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Tpo Archvo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(83360762624013953)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'833608'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TPO_ARCHVO:FCHA_DGTA:FCHA_MDFCA:DESCARGAR:TMNO:'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78374962811450334)
,p_name=>'P145_ID_DCLRCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(78373906117450324)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
