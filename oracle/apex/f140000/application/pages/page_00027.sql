prompt --application/pages/page_00027
begin
wwv_flow_api.create_page(
 p_id=>27
,p_user_interface_id=>wwv_flow_api.id(22508582753660970)
,p_name=>unistr('Gesti\00F3n Jur\00EDdica')
,p_page_mode=>'NON_MODAL'
,p_step_title=>unistr('Gesti\00F3n Jur\00EDdica')
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_dialog_width=>'1024'
,p_dialog_max_width=>'1024'
,p_dialog_chained=>'N'
,p_last_updated_by=>'JCUAO'
,p_last_upd_yyyymmddhh24miss=>'20191017141855'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25055717389296243)
,p_plug_name=>unistr('Gesti\00F3n Jur\00EDdica')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52128439135074801)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto as "Tributo",',
'       b.nmro_rdcdo_dsplay as "No. Solicitud",',
'       a.dscrpcion_rcrso_tpo as "Tipo de Recurso",',
'       a.nmro_acto_dsplay as "Acto",',
'       initcap(a.dscrpcion_acto_tpo) as "Tipo de Acto",',
'       case a.cdgo_rspta',
'        when ''FTT'' then ''Favorable Totalmente''',
'        when ''FPR'' then ''Favorable Parcialmente''',
'        when ''DFV'' then ''Desfavorable''',
'        when ''RCH'' then ''Rechazado''',
'      end as "Respuesta",',
'      b.nmbre_rdcdor as "Radicador",',
unistr('      b.idntfccion_rdcdor as "Identificaci\00F3n Radicador",'),
unistr('      to_char(b.fcha_rdcdo, ''dd/MM/YYYY'') as "Fecha de Radicaci\00F3n"'),
'from v_gj_g_recursos a',
'inner join v_pq_g_solicitudes b on a.id_slctud = b.id_slctud',
'where b.id_sjto_impsto = :P27_ID_SJTO_IMPSTO'))
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
 p_id=>wwv_flow_api.id(25055848376296244)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JCUAO'
,p_internal_uid=>25055848376296244
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25055943947296245)
,p_db_column_name=>'Tributo'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25056003439296246)
,p_db_column_name=>'No. Solicitud'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'No. Solicitud'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25056121145296247)
,p_db_column_name=>'Tipo de Recurso'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Tipo De Recurso'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25056204725296248)
,p_db_column_name=>'Acto'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Acto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25056309626296249)
,p_db_column_name=>'Tipo de Acto'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Tipo De Acto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25056438088296250)
,p_db_column_name=>'Respuesta'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Respuesta'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25232054866589201)
,p_db_column_name=>'Radicador'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Radicador'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25232176246589202)
,p_db_column_name=>unistr('Identificaci\00F3n Radicador')
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Identificaci\00F3n Radicador')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25232218525589203)
,p_db_column_name=>unistr('Fecha de Radicaci\00F3n')
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('Fecha De Radicaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(25243316806597880)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'252434'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('Tributo:No. Solicitud:Tipo de Recurso:Acto:Tipo de Acto:Respuesta:Radicador:Identificaci\00F3n Radicador:Fecha de Radicaci\00F3n')
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(248133303643930216)
,p_plug_name=>'&P27_DSCRPCION.'
,p_icon_css_classes=>'&P27_ICNO.'
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
 p_id=>wwv_flow_api.id(25230316743587292)
,p_name=>'P27_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(248133303643930216)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25230791157587294)
,p_name=>'P27_ICNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(248133303643930216)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25231117416587295)
,p_name=>'P27_DSCRPCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(248133303643930216)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
