prompt --application/pages/page_00028
begin
wwv_flow_api.create_page(
 p_id=>28
,p_user_interface_id=>wwv_flow_api.id(22508582753660970)
,p_name=>'Medidas Cautelares'
,p_page_mode=>'NON_MODAL'
,p_step_title=>'Medidas Cautelares'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_dialog_width=>'1024'
,p_dialog_max_width=>'1024'
,p_dialog_chained=>'N'
,p_last_updated_by=>'JCUAO'
,p_last_upd_yyyymmddhh24miss=>'20191017161734'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25234789369589228)
,p_plug_name=>'Medidas Cautelares'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52128439135074801)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select a.idntfccion as "Identificaci\00F3n",'),
unistr('       a.nmtcnco_idntfccion_tpo as "Tipo de Identificaci\00F3n",'),
'       a.nmbre_cmplto as "Responsable",',
unistr('       ''<center><span class="fa fa-eye" aria-hidden="true"></span></center>'' as "Investigaci\00F3n de Bienes",'),
'       ''<center><span class="fa fa-eye" aria-hidden="true"></span></center>'' as "Embargos",',
'       ''<center><span class="fa fa-eye" aria-hidden="true"></span></center>'' as "Desembargos"',
'  from v_mc_g_embargos_responsable a',
' where exists (select 1',
'                 from mc_g_embargos_cartera_detalle b',
'                where b.id_embrgos_crtra = a.id_embrgos_crtra',
'                  and b.id_sjto_impsto = :P28_ID_SJTO_IMPSTO)',
' group by a.idntfccion,a.nmtcnco_idntfccion_tpo,a.nmbre_cmplto'))
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
 p_id=>wwv_flow_api.id(25234844751589229)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JCUAO'
,p_internal_uid=>25234844751589229
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25235295449589233)
,p_db_column_name=>unistr('Investigaci\00F3n de Bienes')
,p_display_order=>10
,p_column_identifier=>'D'
,p_column_label=>unistr('Investigaci\00F3n De Bienes')
,p_column_link=>unistr('f?p=80000:76:&SESSION.::&DEBUG.:RP,76:P76_IDNTFCCION_RSPNSBLE:#Identificaci\00F3n#')
,p_column_linktext=>unistr('#Investigaci\00F3n de Bienes#')
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25235356603589234)
,p_db_column_name=>'Embargos'
,p_display_order=>20
,p_column_identifier=>'E'
,p_column_label=>'Embargos'
,p_column_link=>unistr('f?p=80000:77:&SESSION.::&DEBUG.:RP,77:P77_IDNTFCCION_RSPNSBLE:#Identificaci\00F3n#')
,p_column_linktext=>'#Embargos#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25235419725589235)
,p_db_column_name=>'Desembargos'
,p_display_order=>30
,p_column_identifier=>'F'
,p_column_label=>'Desembargos'
,p_column_link=>unistr('f?p=80000:78:&SESSION.::&DEBUG.:RP,78:P78_IDNTFCCION_RSPNSBLE:#Identificaci\00F3n#')
,p_column_linktext=>'#Desembargos#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25234901746589230)
,p_db_column_name=>unistr('Identificaci\00F3n')
,p_display_order=>40
,p_column_identifier=>'A'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25235072518589231)
,p_db_column_name=>unistr('Tipo de Identificaci\00F3n')
,p_display_order=>50
,p_column_identifier=>'B'
,p_column_label=>unistr('Tipo De Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25235148782589232)
,p_db_column_name=>'Responsable'
,p_display_order=>60
,p_column_identifier=>'C'
,p_column_label=>'Responsable'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(25435504473283689)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'254356'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('Investigaci\00F3n de Bienes:Embargos:Desembargos:Identificaci\00F3n:Tipo de Identificaci\00F3n:Responsable')
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(273546683242177090)
,p_plug_name=>'&P28_DSCRPCION.'
,p_icon_css_classes=>'&P28_ICNO.'
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
 p_id=>wwv_flow_api.id(25413938272246894)
,p_name=>'P28_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(273546683242177090)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25414314686246899)
,p_name=>'P28_ICNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(273546683242177090)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25414763049246899)
,p_name=>'P28_DSCRPCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(273546683242177090)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
