prompt --application/pages/page_00018
begin
wwv_flow_api.create_page(
 p_id=>18
,p_user_interface_id=>wwv_flow_api.id(22508582753660970)
,p_name=>'Prescripciones'
,p_page_mode=>'NON_MODAL'
,p_step_title=>'Prescripciones'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_dialog_width=>'1024'
,p_dialog_max_width=>'1024'
,p_dialog_chained=>'N'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20210603161109'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24852189184688429)
,p_plug_name=>'Prescripciones'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52128439135074801)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      b.id_prscrpcion_sjto_impsto,',
'            b.nmbre_impsto as "Tributo",',
unistr('            a.nmro_prscrpcion as "N\00B0 Prescripci\00F3n",'),
unistr('            a.dscrpcion_prscrpcion_tpo "Tipo Prescripci\00F3n",'),
unistr('            a.nmro_rdcdo as "N\00B0 Solicitud",'),
'            a.fcha_slctud as "Fecha Solicitud",',
'            a.dscrpcion_rspsta as "Respuesta",',
'            c.id_acto',
'from        v_gf_g_prescripciones           a',
'inner join  v_gf_g_prscrpcnes_sjto_impsto   b   on  b.id_prscrpcion =   a.id_prscrpcion',
'left  join  gf_g_prscrpcns_dcmnto           c   on  a.id_prscrpcion =   c.id_prscrpcion',
'where       b.id_sjto_impsto    =   :P18_ID_SJTO_IMPSTO'))
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
 p_id=>wwv_flow_api.id(24852243576688430)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No hay datos disponibles'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:RP,19:P19_ID_PRSCRPCION_SJTO_IMPSTO:#ID_PRSCRPCION_SJTO_IMPSTO#'
,p_detail_link_text=>'<center><span class="fa fa-eye" aria-hidden="true"></span></center>'
,p_owner=>'JCUAO'
,p_internal_uid=>24852243576688430
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24852389781688431)
,p_db_column_name=>'ID_PRSCRPCION_SJTO_IMPSTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Prscrpcion Sjto Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24852442788688432)
,p_db_column_name=>'Tributo'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24852576838688433)
,p_db_column_name=>unistr('N\00B0 Prescripci\00F3n')
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('N\00B0 Prescripci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24852632978688434)
,p_db_column_name=>unistr('Tipo Prescripci\00F3n')
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Tipo Prescripci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24852768441688435)
,p_db_column_name=>unistr('N\00B0 Solicitud')
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('N\00B0 Solicitud')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24852865370688436)
,p_db_column_name=>'Fecha Solicitud'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Fecha Solicitud'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24853076552688438)
,p_db_column_name=>'Respuesta'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Respuesta'
,p_column_link=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,file_name,file_blob,file_mimetype,id_acto,#ID_ACTO#'
,p_column_linktext=>'#Respuesta#'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18223605750938613)
,p_db_column_name=>'ID_ACTO'
,p_display_order=>80
,p_column_identifier=>'I'
,p_column_label=>'Id Acto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(25023942325222232)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'250240'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('ID_PRSCRPCION_SJTO_IMPSTO:Tributo:N\00B0 Prescripci\00F3n:Tipo Prescripci\00F3n:N\00B0 Solicitud:Fecha Solicitud:Respuesta:ID_ACTO')
,p_sort_column_1=>unistr('N\00B0 Prescripci\00F3n')
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'0'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(122482270424679570)
,p_plug_name=>'&P18_DSCRPCION.'
,p_icon_css_classes=>'&P18_ICNO.'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52124852663074800)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25004913192209539)
,p_name=>'P18_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(122482270424679570)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25005349388209539)
,p_name=>'P18_ICNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(122482270424679570)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25005702334209539)
,p_name=>'P18_DSCRPCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(122482270424679570)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
