prompt --application/pages/page_00020
begin
wwv_flow_api.create_page(
 p_id=>20
,p_user_interface_id=>wwv_flow_api.id(22508582753660970)
,p_name=>'Determinaciones'
,p_page_mode=>'NON_MODAL'
,p_step_title=>'Determinaciones'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_dialog_width=>'1024'
,p_dialog_max_width=>'1024'
,p_dialog_chained=>'N'
,p_last_updated_by=>'NCARRASQUILLA'
,p_last_upd_yyyymmddhh24miss=>'20251014100606'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24853875469688446)
,p_plug_name=>'Determinacion'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52128439135074801)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.id_dtrmncion,',
'        a.nmbre_impsto as "Tributo",',
unistr('        a.id_dtrmncion_lte as "No. Lote Determinaci\00F3n",'),
unistr('        to_char(a.fcha_dtrmncion, ''DD/MM/YYYY HH12:MI:SS AM'') as "Fecha Determinaci\00F3n",'),
unistr('        a.nmro_acto "No. Determinaci\00F3n",'),
'        a.dscrpcion_indcdor_ntfcdo as "Notificada",',
unistr('        to_char(a.fcha_ntfccion, ''DD/MM/YYYY HH12:MI:SS AM'') as "Fecha de Notificaci\00F3n",'),
'        a.id_acto,',
'        decode(a.actvo, ''S'', ''Activa'', ''Inactiva'') "Estado"',
'   from v_gi_g_determinaciones a',
'  where id_sjto_impsto = :P20_ID_SJTO_IMPSTO'))
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
 p_id=>wwv_flow_api.id(24853932085688447)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No hay datos disponibles'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:RP,30:P30_ID_DTRMNCION:#ID_DTRMNCION#'
,p_detail_link_text=>'<center><span class="fa fa-eye" aria-hidden="true"></span></center>'
,p_owner=>'JCUAO'
,p_internal_uid=>24853932085688447
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25051860234296204)
,p_db_column_name=>'Tributo'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25051955558296205)
,p_db_column_name=>unistr('No. Lote Determinaci\00F3n')
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('No. Lote Determinaci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25052065705296206)
,p_db_column_name=>unistr('Fecha Determinaci\00F3n')
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Fecha Determinaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25052135012296207)
,p_db_column_name=>unistr('No. Determinaci\00F3n')
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('No. Determinaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25052210660296208)
,p_db_column_name=>'Notificada'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Notificada'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25052336785296209)
,p_db_column_name=>unistr('Fecha de Notificaci\00F3n')
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Fecha De Notificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48994464603511008)
,p_db_column_name=>'ID_DTRMNCION'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Id Dtrmncion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24893852261937501)
,p_db_column_name=>'ID_ACTO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Ver Acto'
,p_column_link=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,FILE_BLOB,FILE_NAME,FILE_MIMETYPE,ID_ACTO,#ID_ACTO#'
,p_column_linktext=>'<button type="button" class="t-Button t-Button--icon t-Button--success t-Button--simple t-Button--iconRight">Ver<span aria-hidden="true" class="t-Icon t-Icon--right fa fa-eye"></span></button>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15287476593369401)
,p_db_column_name=>'Estado'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(25059262006309453)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'250593'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('Tributo:No. Lote Determinaci\00F3n:Fecha Determinaci\00F3n:No. Determinaci\00F3n:Notificada:Fecha de Notificaci\00F3n:ID_DTRMNCION:ID_ACTO:Estado')
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(147524844434958713)
,p_plug_name=>'&P20_DSCRPCION.'
,p_icon_css_classes=>'&P20_ICNO.'
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
 p_id=>wwv_flow_api.id(25046639352279159)
,p_name=>'P20_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(147524844434958713)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25047048493279161)
,p_name=>'P20_ICNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(147524844434958713)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25047424696279162)
,p_name=>'P20_DSCRPCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(147524844434958713)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
