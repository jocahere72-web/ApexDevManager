prompt --application/pages/page_00005
begin
wwv_flow_api.create_page(
 p_id=>5
,p_user_interface_id=>wwv_flow_api.id(22508582753660970)
,p_name=>'Documentos de Pago'
,p_page_mode=>'NON_MODAL'
,p_step_title=>'Documentos de Pago'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_dialog_width=>'1024'
,p_dialog_max_width=>'1024'
,p_dialog_chained=>'N'
,p_last_updated_by=>'1066746000'
,p_last_upd_yyyymmddhh24miss=>'20260130092733'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24205632153799427)
,p_plug_name=>'Documentos de Pago'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52128439135074801)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_dcmnto,',
'       nmbre_impsto,',
'       nmbre_impsto_sbmpsto,',
'       nmro_dcmnto, ',
'       fcha_dcmnto fcha_dcmnto, ',
'       initcap(dscrpcion_dcmnto_tpo) dscrpcion_dcmnto_tpo,',
'       vlor_ttal_dcmnto, ',
'       fcha_vncmnto fcha_vncmnto,',
'       initcap(dscrpcion_indcdor_pgo_aplcdo) dscrpcion_indcdor_pgo_aplcdo,',
'       vlor_ttal_hber',
'  from v_re_g_documentos ',
' where id_sjto_impsto = :P5_ID_SJTO_IMPSTO',
'   and vlor_ttal_dcmnto > 0'))
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
 p_id=>wwv_flow_api.id(24531916141846406)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No hay datos disponibles'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:RP,6:P6_ID_DCMNTO:#ID_DCMNTO#'
,p_detail_link_text=>'<center><span class="fa fa-eye" aria-hidden="true"></span></center>'
,p_owner=>'JCUAO'
,p_internal_uid=>24531916141846406
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24532056610846407)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Dcmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24532149517846408)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(133768000076383501)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>30
,p_column_identifier=>'L'
,p_column_label=>'Nmbre Impsto Sbmpsto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24532288506846409)
,p_db_column_name=>'NMRO_DCMNTO'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'No. Documento'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24532419504846411)
,p_db_column_name=>'DSCRPCION_DCMNTO_TPO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Tipo de Documento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24532588148846412)
,p_db_column_name=>'VLOR_TTAL_DCMNTO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Valor Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(67292538754147606)
,p_db_column_name=>'VLOR_TTAL_HBER'
,p_display_order=>70
,p_column_identifier=>'I'
,p_column_label=>'Descuento'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24532769573846414)
,p_db_column_name=>'DSCRPCION_INDCDOR_PGO_APLCDO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Pago Aplicado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85168138178979647)
,p_db_column_name=>'FCHA_DCMNTO'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>'Fcha Dcmnto'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY HH12:MI:SS AM'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85168215973979648)
,p_db_column_name=>'FCHA_VNCMNTO'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Fcha Vncmnto'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(24595519647990636)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'245956'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_IMPSTO:NMBRE_IMPSTO_SBMPSTO:NMRO_DCMNTO:DSCRPCION_DCMNTO_TPO:FCHA_DCMNTO:FCHA_VNCMNTO:VLOR_TTAL_DCMNTO:DSCRPCION_INDCDOR_PGO_APLCDO:VLOR_TTAL_HBER:'
,p_sort_column_1=>'FCHA_DCMNTO'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(47948620405526342)
,p_plug_name=>'&P5_DSCRPCION.'
,p_icon_css_classes=>'&P5_ICNO.'
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
 p_id=>wwv_flow_api.id(24531603323846403)
,p_name=>'P5_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(47948620405526342)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24548380236870604)
,p_name=>'P5_ICNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(47948620405526342)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24548712636870605)
,p_name=>'P5_DSCRPCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(47948620405526342)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
