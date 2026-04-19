prompt --application/pages/page_00026
begin
wwv_flow_api.create_page(
 p_id=>26
,p_user_interface_id=>wwv_flow_api.id(323679016569283847)
,p_name=>'Traslados'
,p_page_mode=>'MODAL'
,p_step_title=>'Traslados'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'MCARO'
,p_last_upd_yyyymmddhh24miss=>'20191017174433'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25451429732305104)
,p_plug_name=>'Traslados'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(39298132994898311)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tr.fcha_incio',
'     , tr.fcha_fin_optma',
'     , tr.fcha_fin_plnda',
'     , ta.nmbre_trea',
'     , ta.dscrpcion_fljo',
' from wf_g_instancias_fljo_trsldo t ',
' join wf_g_instancias_transicion tr',
'   on tr.id_instncia_trnscion = t.id_instncia_trnscion',
' join v_wf_d_flujos_tarea ta',
'   on ta.id_fljo_trea =  tr.id_fljo_trea_orgen',
'where t.cdgo_clnte  = :F_CDGO_CLNTE',
'  and to_char(t.fcha, ''dd/mm/yyyy hh:mi'') = :P26_FCHA',
'  and t.id_usrio = :P26_ID_USRIO',
'  and t.id_usrio_rspnsble = :P26_ID_USRIO_RSPNSBLE',
'  and t.id_usrio_asgndo = :P26_ID_USRIO_ASGNDO'))
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
 p_id=>wwv_flow_api.id(25451572855305105)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'MCARO'
,p_internal_uid=>25451572855305105
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25452149080305111)
,p_db_column_name=>'FCHA_INCIO'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>'Fecha de inicio'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25452249977305112)
,p_db_column_name=>'FCHA_FIN_OPTMA'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>'Fecha Fin Optima'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25452307466305113)
,p_db_column_name=>'FCHA_FIN_PLNDA'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>'Fecha Fin Planeada'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25452409434305114)
,p_db_column_name=>'NMBRE_TREA'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Tarea'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25452599071305115)
,p_db_column_name=>'DSCRPCION_FLJO'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'Flujo de procesos'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(25552527390784451)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'255526'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_FLJO:NMBRE_TREA:FCHA_INCIO:FCHA_FIN_OPTMA:FCHA_FIN_PLNDA:'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25451746640305107)
,p_name=>'P26_ID_USRIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(25451429732305104)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25451891106305108)
,p_name=>'P26_ID_USRIO_ASGNDO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(25451429732305104)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25451943194305109)
,p_name=>'P26_ID_USRIO_RSPNSBLE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(25451429732305104)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25452016020305110)
,p_name=>'P26_FCHA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(25451429732305104)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
