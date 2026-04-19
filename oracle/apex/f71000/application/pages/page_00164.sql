prompt --application/pages/page_00164
begin
wwv_flow_api.create_page(
 p_id=>164
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Plan de Acuerdos de PAgos'
,p_page_mode=>'MODAL'
,p_step_title=>'Plan de Acuerdos de PAgos'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'70%'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20190405113755'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(100947477998733080)
,p_plug_name=>'Plan de Acuerdos de PAgos'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmro_cnvnio,',
'        nmro_cta,',
'        to_char(fcha_vncmnto, ''DD/MM/YYYY HH12:MI:SS AM'') fcha_vncmnto,',
'        vlor_cptal,',
'        vlor_intres,',
'        vlor_fncncion,',
'        vlor_ttal,',
'        dscrpcion_indcdor_cta_pgda,',
'        nmro_dcmnto,',
'        to_char(fcha_pgo_cta, ''DD/MM/YYYY HH12:MI:SS AM'') fcha_pgo_cta,',
'        estdo_cta',
'   from v_gf_g_convenios_extracto',
'  where id_cnvnio = :P164_ID_CNVNIO;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(100947595602733080)
,p_name=>'Plan de Acuerdos de PAgos'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>100947595602733080
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100947901165733084)
,p_db_column_name=>'NMRO_CNVNIO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00B0 Acuerdo de Pago')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100948315341733084)
,p_db_column_name=>'NMRO_CTA'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>unistr('N\00B0 Cuota')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100833937025208235)
,p_db_column_name=>'FCHA_VNCMNTO'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Fecha Vencimiento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100949192399733086)
,p_db_column_name=>'VLOR_CPTAL'
,p_display_order=>22
,p_column_identifier=>'D'
,p_column_label=>'Valor Capital'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100949539880733086)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>32
,p_column_identifier=>'E'
,p_column_label=>unistr('Valor Inter\00E9s')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100949968681733087)
,p_db_column_name=>'VLOR_FNCNCION'
,p_display_order=>42
,p_column_identifier=>'F'
,p_column_label=>unistr('Valor Financiaci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100950351789733087)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>52
,p_column_identifier=>'G'
,p_column_label=>'Valor Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100950786766733087)
,p_db_column_name=>'DSCRPCION_INDCDOR_CTA_PGDA'
,p_display_order=>62
,p_column_identifier=>'H'
,p_column_label=>'Cuota Pagada ?'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100951112783733087)
,p_db_column_name=>'NMRO_DCMNTO'
,p_display_order=>72
,p_column_identifier=>'I'
,p_column_label=>unistr('N\00B0 Documento')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100834065301208236)
,p_db_column_name=>'FCHA_PGO_CTA'
,p_display_order=>82
,p_column_identifier=>'M'
,p_column_label=>'Fecha Pago'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100951945994733088)
,p_db_column_name=>'ESTDO_CTA'
,p_display_order=>92
,p_column_identifier=>'K'
,p_column_label=>'Estado de Cuota'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(100958355260763901)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1009584'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_CNVNIO:NMRO_CTA:FCHA_VNCMNTO:VLOR_CPTAL:VLOR_INTRES:VLOR_FNCNCION:VLOR_TTAL:DSCRPCION_INDCDOR_CTA_PGDA:NMRO_DCMNTO:FCHA_PGO_CTA:ESTDO_CTA'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(100960989799781183)
,p_report_id=>wwv_flow_api.id(100958355260763901)
,p_name=>'PAGADA'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'ESTDO_CTA'
,p_operator=>'='
,p_expr=>'PAGADA'
,p_condition_sql=>' (case when ("ESTDO_CTA" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''PAGADA''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#63FF9A'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(100961369853781183)
,p_report_id=>wwv_flow_api.id(100958355260763901)
,p_name=>'VENCIDA'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'ESTDO_CTA'
,p_operator=>'='
,p_expr=>'VENCIDA'
,p_condition_sql=>' (case when ("ESTDO_CTA" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''VENCIDA''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#F79191'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100834184715208237)
,p_name=>'P164_ID_CNVNIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(100947477998733080)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
