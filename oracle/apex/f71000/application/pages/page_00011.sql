prompt --application/pages/page_00011
begin
wwv_flow_api.create_page(
 p_id=>11
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Aplicaci\00F3n del Recaudo')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Aplicaci\00F3n del Recaudo')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177320258117050591)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'NARDILA'
,p_last_upd_yyyymmddhh24miss=>'20191118103050'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25271513898692507)
,p_plug_name=>unistr('Aplicaci\00F3n del Recaudo')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'     select a.vgncia as "Vigencia"',
'          , a.prdo as "Periodo"',
'          , a.cdgo_cncpto as "Codigo Concepto"',
'          , a.dscrpcion_cncpto as "Concepto"',
'          , a.vlor_cptal as "Valor Capital"',
unistr('          , a.vlor_intres as "Valor Inter\00E9s"'),
'          , a.vlor_sldo_fvor as "Valor Saldo a Favor"',
'          , a.vlor_ttal as "Valor Total"',
'       from v_re_g_recaudos_detalle a',
'      where a.id_rcdo = :P11_ID_RCDO',
'   order by a.vgncia',
'          , a.prdo',
'          , a.cdgo_cncpto',
''))
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
 p_id=>wwv_flow_api.id(25271675100692508)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'AMOLINA'
,p_internal_uid=>25271675100692508
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25271772398692509)
,p_db_column_name=>'Vigencia'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25271801713692510)
,p_db_column_name=>'Periodo'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Periodo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25271949171692511)
,p_db_column_name=>'Codigo Concepto'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Codigo Concepto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25272046546692512)
,p_db_column_name=>'Concepto'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25272142018692513)
,p_db_column_name=>'Valor Capital'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Valor Capital'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25272330093692515)
,p_db_column_name=>'Valor Saldo a Favor'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Valor Saldo a Favor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25272423872692516)
,p_db_column_name=>'Valor Total'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Valor Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25272724045692519)
,p_db_column_name=>unistr('Valor Inter\00E9s')
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('Valor Inter\00E9s')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(25390705888166636)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'253908'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('Vigencia:Periodo:Codigo Concepto:Concepto:Valor Capital:Valor Inter\00E9s:Valor Saldo a Favor:Valor Total:')
,p_sum_columns_on_break=>unistr('Valor Total:Valor Saldo a Favor:Valor Inter\00E9s:Valor Capital')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25272680425692518)
,p_name=>'P11_ID_RCDO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(25271513898692507)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
