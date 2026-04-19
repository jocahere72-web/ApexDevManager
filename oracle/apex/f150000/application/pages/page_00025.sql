prompt --application/pages/page_00025
begin
wwv_flow_api.create_page(
 p_id=>25
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Declaraciones archivos adjuntos'
,p_page_mode=>'MODAL'
,p_step_title=>'Declaraciones archivos adjuntos'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'85%'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'JDIAZ'
,p_last_upd_yyyymmddhh24miss=>'20200730143655'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(78325136844004229)
,p_plug_name=>'Archivos Adjuntos'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  b.nmbre,',
'        a.id_dclrcion_archvo_adjnto,',
'        a.id_dclrcion,',
'        a.id_dclrcn_archvo_tpo,',
'        a.fcha_dgta,',
'        a.fcha_mdfca,',
'        to_char(dbms_lob.getlength(a.file_blob) / 1024 / 1024 , ''999G999G999G999G990D000'') || '' MB'' tmno,',
'        a.file_name',
'from    gi_g_dclrcnes_arhvos_adjnto a',
'join    gi_d_dclrcnes_archvos_tpo   b   on  b.id_dclrcn_archvo_tpo  =   a.id_dclrcn_archvo_tpo',
'where   a.id_dclrcion   =   :P25_ID_DCLRCION;'))
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
 p_id=>wwv_flow_api.id(78325275926004230)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JDIAZ'
,p_internal_uid=>78325275926004230
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78325379533004231)
,p_db_column_name=>'NMBRE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tipo Archivo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78325404412004232)
,p_db_column_name=>'ID_DCLRCION_ARCHVO_ADJNTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Dclrcion Archvo Adjnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78325578688004233)
,p_db_column_name=>'ID_DCLRCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Dclrcion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78325692835004234)
,p_db_column_name=>'ID_DCLRCN_ARCHVO_TPO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Id Dclrcn Archvo Tpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79685150022354327)
,p_db_column_name=>'FCHA_DGTA'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Fecha de Registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79685206988354328)
,p_db_column_name=>'FCHA_MDFCA'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('Fecha de Actualizaci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78326066321004238)
,p_db_column_name=>'TMNO'
,p_display_order=>110
,p_column_identifier=>'H'
,p_column_label=>unistr('Tama\00F1o')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78325843560004236)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>120
,p_column_identifier=>'F'
,p_column_label=>'Nombre Archivo'
,p_column_link=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.:RP,26:P26_ID_DCLRCION_ARCHVO_ADJNTO:#ID_DCLRCION_ARCHVO_ADJNTO#'
,p_column_linktext=>'#FILE_NAME#'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(79623078731482353)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'796231'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'REPORT'
,p_report_columns=>'NMBRE:FCHA_DGTA:FCHA_MDFCA:TMNO:FILE_NAME:'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(78326432663004242)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(78325136844004229)
,p_button_name=>'BTN_NUEVO_ARCHIVO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Archivo'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_button_redirect_url=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.:RP,26:P26_ID_DCLRCION:&P25_ID_DCLRCION.'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78326365479004241)
,p_name=>'P25_ID_DCLRCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(78325136844004229)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
