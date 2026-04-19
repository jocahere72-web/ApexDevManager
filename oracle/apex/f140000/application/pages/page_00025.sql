prompt --application/pages/page_00025
begin
wwv_flow_api.create_page(
 p_id=>25
,p_user_interface_id=>wwv_flow_api.id(22508582753660970)
,p_name=>unistr('T\00EDtulos Ejecutivos')
,p_page_mode=>'NON_MODAL'
,p_step_title=>unistr('T\00EDtulos Ejecutivos')
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_dialog_width=>'1024'
,p_dialog_max_width=>'1024'
,p_dialog_chained=>'N'
,p_last_updated_by=>'JCUAO'
,p_last_upd_yyyymmddhh24miss=>'20191017144013'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25055621420296242)
,p_plug_name=>unistr('T\00EDtulos Ejecutivos')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52128439135074801)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_ttlo_ejctvo,',
'        a.nmbre_impsto as "Tributo",',
'        a.nmbre_impsto_sbmpsto as "Sub-Impuesto",',
unistr('        a.nmro_ttlo_ejctvo as "No. T\00EDtulo Ejecutivo",'),
'        a.nmbre_area as "Area",',
'        a.nmbre_impsto_acto as "Tipo de Acto",',
'        a.dscrpcion as "Estado",',
unistr('        a.fcha_cnsttcion as "Fecha de Creaci\00F3n",'),
unistr('        a.fcha_ntfccion as "Fecha de Notificaci\00F3n",'),
unistr('        a.nmro_ntfccion as "Guia de Notificaci\00F3n"'),
'from v_gi_g_titulos_ejecutivo a',
'where a.id_sjto_impsto = :P25_ID_SJTO_IMPSTO'))
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
 p_id=>wwv_flow_api.id(25232347177589204)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No hay datos disponibles'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.:RP,26:P26_ID_TTLO_EJCTVO:#ID_TTLO_EJCTVO#'
,p_detail_link_text=>'<center><span class="fa fa-eye" aria-hidden="true"></span></center>'
,p_owner=>'JCUAO'
,p_internal_uid=>25232347177589204
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25232403827589205)
,p_db_column_name=>'ID_TTLO_EJCTVO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Ttlo Ejctvo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25232549391589206)
,p_db_column_name=>'Tributo'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25232689150589207)
,p_db_column_name=>'Sub-Impuesto'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Sub-impuesto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25232768923589208)
,p_db_column_name=>unistr('No. T\00EDtulo Ejecutivo')
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('No. T\00EDtulo Ejecutivo')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25232803680589209)
,p_db_column_name=>'Area'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Area'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25232933350589210)
,p_db_column_name=>'Tipo de Acto'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Tipo De Acto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25233081538589211)
,p_db_column_name=>'Estado'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25233175848589212)
,p_db_column_name=>unistr('Fecha de Creaci\00F3n')
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Fecha De Creaci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25233296322589213)
,p_db_column_name=>unistr('Fecha de Notificaci\00F3n')
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('Fecha De Notificaci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25233313272589214)
,p_db_column_name=>unistr('Guia de Notificaci\00F3n')
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('Guia De Notificaci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(25269471123685856)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'252695'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('ID_TTLO_EJCTVO:Tributo:Sub-Impuesto:No. T\00EDtulo Ejecutivo:Area:Tipo de Acto:Estado:Fecha de Creaci\00F3n:Fecha de Notificaci\00F3n:Guia de Notificaci\00F3n')
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(222903554728342932)
,p_plug_name=>'&P25_DSCRPCION.'
,p_icon_css_classes=>'&P25_ICNO.'
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
 p_id=>wwv_flow_api.id(25191949652358704)
,p_name=>'P25_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(222903554728342932)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25192372453358707)
,p_name=>'P25_ICNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(222903554728342932)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25192789662358707)
,p_name=>'P25_DSCRPCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(222903554728342932)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
