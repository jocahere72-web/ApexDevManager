prompt --application/pages/page_00025
begin
wwv_flow_api.create_page(
 p_id=>25
,p_user_interface_id=>wwv_flow_api.id(30413944355578333)
,p_name=>'Detalle Critica'
,p_page_mode=>'MODAL'
,p_step_title=>'Detalle'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'90%'
,p_last_updated_by=>'JCUAO'
,p_last_upd_yyyymmddhh24miss=>'20190627193322'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(44274767970346217)
,p_plug_name=>'&P25_DSCRPCION_CSAL.'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(30338884622578288)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_acto,',
'       b.nmro_idntfccion,',
'       b.prmer_nmbre||nvl2(b.sgndo_nmbre, '' ''||b.sgndo_nmbre, '''')||'' ''||b.prmer_aplldo||nvl2(b.sgndo_aplldo,'' ''||b.sgndo_nmbre,'''') nmbre,',
'       b.drccion_ntfccion,',
'       a.nmro_idntfccion nmro_idntfccion_rcbe,',
'       a.nmbre_ntfccion,',
'       a.nmro_guia',
'from v_nt_g_ntfccion_guia_lte_dtlle a',
'inner join v_nt_g_ntfccnes_rspnsble b on a.id_ntfccion_rspnsble = b.id_ntfccion_rspnsble',
'where a.id_prcso_crga  = :P25_ID_PRCSO_CRGA and',
'      (:P25_CDGO_CSAL is not null and a.cdgo_csal = :P25_CDGO_CSAL) or (:P25_CDGO_CSAL is null and a.cdgo_csal is null)',
'order by a.id_acto asc '))
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
 p_id=>wwv_flow_api.id(44274813068346218)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ACARDENAS'
,p_internal_uid=>44274813068346218
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(121919747528165319)
,p_db_column_name=>'NMRO_ACTO'
,p_display_order=>10
,p_column_identifier=>'V'
,p_column_label=>'No. Acto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44276561729346235)
,p_db_column_name=>'NMRO_IDNTFCCION'
,p_display_order=>20
,p_column_identifier=>'N'
,p_column_label=>unistr('No. Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(121919912601165321)
,p_db_column_name=>'NMBRE'
,p_display_order=>30
,p_column_identifier=>'X'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44277162588346241)
,p_db_column_name=>'DRCCION_NTFCCION'
,p_display_order=>40
,p_column_identifier=>'T'
,p_column_label=>unistr('Direcci\00F3n Notificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44277251534346242)
,p_db_column_name=>'NMRO_IDNTFCCION_RCBE'
,p_display_order=>50
,p_column_identifier=>'U'
,p_column_label=>unistr('No. Identificaci\00F3n Recibe')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44276656044346236)
,p_db_column_name=>'NMBRE_NTFCCION'
,p_display_order=>60
,p_column_identifier=>'O'
,p_column_label=>'Nombre Recibe'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(121919860972165320)
,p_db_column_name=>'NMRO_GUIA'
,p_display_order=>70
,p_column_identifier=>'W'
,p_column_label=>'No. Guia'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(44400741664674820)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'444008'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'NMRO_ACTO:NMRO_IDNTFCCION:NMBRE:DRCCION_NTFCCION:NMBRE_NTFCCION:NMRO_IDNTFCCION_RCBE:NMRO_GUIA:'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(44141453565393145)
,p_branch_name=>unistr('Ir a P\00E1gina 24')
,p_branch_action=>'f?p=&APP_ID.:24:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44276267785346232)
,p_name=>'P25_ID_LTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(44274767970346217)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44276341648346233)
,p_name=>'P25_ID_PRCSO_CRGA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(44274767970346217)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44276465578346234)
,p_name=>'P25_CDGO_CSAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(44274767970346217)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44277531810346245)
,p_name=>'P25_DSCRPCION_CSAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(44274767970346217)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
