prompt --application/pages/page_00013
begin
wwv_flow_api.create_page(
 p_id=>13
,p_user_interface_id=>wwv_flow_api.id(22508582753660970)
,p_name=>'Acuerdos de Pago'
,p_page_mode=>'NON_MODAL'
,p_step_title=>'Acuerdos de Pago'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_dialog_width=>'1024'
,p_dialog_max_width=>'1024'
,p_dialog_chained=>'N'
,p_last_updated_by=>'JCUAO'
,p_last_upd_yyyymmddhh24miss=>'20191017091639'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24672282639198735)
,p_plug_name=>'Acuerdos de Pago'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52128439135074801)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select ''<center><span class="fa fa-eye" aria-hidden="true"></span></center>'' cartera,',
'        ''<center><span class="fa fa-eye" aria-hidden="true"></span></center>'' plan_pago,',
'        id_cnvnio,',
'        initcap(nmbre_impsto) nmbre_impsto,',
'        initcap(nmbre_slctnte) nmbre_slctnte,',
'        nmro_idntfccion_slctnte,',
'        initcap(dscrpcion_cnvnio_tpo) dscrpcion_cnvnio_tpo,',
'        nmro_cnvnio,',
'        to_char(fcha_slctud, ''DD/MM/YYYY HH12:MI:SS AM'') fcha_slctud,',
'        nmro_cta,',
'        initcap(dscrpcion_prdcdad_cta) dscrpcion_prdcdad_cta,',
'        ttal_cnvnio,',
'        initcap(dscrpcion_cnvnio_estdo) dscrpcion_cnvnio_estdo,',
'        to_char(fcha_aprbcion, ''DD/MM/YYYY HH12:MI:SS AM'') fcha_aprbcion',
' from v_gf_g_convenios',
'where id_sjto_impsto = :P13_ID_SJTO_IMPSTO'))
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
 p_id=>wwv_flow_api.id(24672353526198736)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No hay datos disponibles'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JCUAO'
,p_internal_uid=>24672353526198736
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24849347863688401)
,p_db_column_name=>'CARTERA'
,p_display_order=>10
,p_column_identifier=>'O'
,p_column_label=>'Cartera'
,p_column_link=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:RP,14:P14_ID_CNVNIO:#ID_CNVNIO#'
,p_column_linktext=>'#CARTERA#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24849419334688402)
,p_db_column_name=>'PLAN_PAGO'
,p_display_order=>20
,p_column_identifier=>'P'
,p_column_label=>'Plan Pago'
,p_column_link=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:RP,15:P15_ID_CNVNIO:#ID_CNVNIO#'
,p_column_linktext=>'#PLAN_PAGO#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24672694813198739)
,p_db_column_name=>'ID_CNVNIO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Cnvnio'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24672754228198740)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24672881963198741)
,p_db_column_name=>'NMBRE_SLCTNTE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Nombre Solicitante'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24672956977198742)
,p_db_column_name=>'NMRO_IDNTFCCION_SLCTNTE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('No. Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24673077851198743)
,p_db_column_name=>'DSCRPCION_CNVNIO_TPO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Tipo de Convenio'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24673125141198744)
,p_db_column_name=>'NMRO_CNVNIO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'No. Convenio'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24673287361198745)
,p_db_column_name=>'FCHA_SLCTUD'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Fecha Solicitud'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24673369453198746)
,p_db_column_name=>'NMRO_CTA'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'No. Cuota'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24849793048688405)
,p_db_column_name=>'DSCRPCION_PRDCDAD_CTA'
,p_display_order=>110
,p_column_identifier=>'S'
,p_column_label=>'Periodicidad'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24849853803688406)
,p_db_column_name=>'DSCRPCION_CNVNIO_ESTDO'
,p_display_order=>120
,p_column_identifier=>'T'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24673514476198748)
,p_db_column_name=>'TTAL_CNVNIO'
,p_display_order=>130
,p_column_identifier=>'L'
,p_column_label=>'Total Convenio'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24673744767198750)
,p_db_column_name=>'FCHA_APRBCION'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>unistr('Fecha Aprobaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(24867404039711344)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'248675'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CARTERA:PLAN_PAGO:NMBRE_IMPSTO:NMRO_CNVNIO:DSCRPCION_CNVNIO_TPO:NMBRE_SLCTNTE:NMRO_IDNTFCCION_SLCTNTE:NMRO_CTA:DSCRPCION_PRDCDAD_CTA:FCHA_SLCTUD:FCHA_APRBCION:TTAL_CNVNIO:DSCRPCION_CNVNIO_ESTDO:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(97477958148470048)
,p_plug_name=>'&P13_DSCRPCION.'
,p_icon_css_classes=>'&P13_ICNO.'
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
 p_id=>wwv_flow_api.id(24835162299675610)
,p_name=>'P13_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(97477958148470048)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24835461893675618)
,p_name=>'P13_ICNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(97477958148470048)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24835821927675618)
,p_name=>'P13_DSCRPCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(97477958148470048)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
