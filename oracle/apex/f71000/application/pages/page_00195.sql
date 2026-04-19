prompt --application/pages/page_00195
begin
wwv_flow_api.create_page(
 p_id=>195
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Plan de Acuerdo de Pago'
,p_page_mode=>'MODAL'
,p_step_title=>'Plan de Acuerdo de Pago'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'70%'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20190527142744'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(112428283713655331)
,p_plug_name=>'Plan de Acuerdo de Pago'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_cnvnio,',
'        nmro_cta,',
'        fcha_vncmnto,',
'        vlor_cptal,',
'        vlor_intres,',
'        vlor_fncncion,',
'        vlor_ttal,',
'        a.dscrpcion_indcdor_cta_pgda,',
'        estdo_cta',
'   from v_gf_g_convenios_extracto a',
'  where id_cnvnio = :P195_ID_CNVNIO',
'    and actvo = ''S''',
'order by nmro_cta;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(112428380705655331)
,p_name=>'Plan de Acuerdo de Pago'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>112428380705655331
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(112428701163655339)
,p_db_column_name=>'ID_CNVNIO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Cnvnio'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(112429419434655348)
,p_db_column_name=>'NMRO_CTA'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>unistr('N\00B0 Cuota')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(112429878422655349)
,p_db_column_name=>'FCHA_VNCMNTO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Fecha Vencimiento'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(112430214174655349)
,p_db_column_name=>'VLOR_CPTAL'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Valor Capital'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(112430632206655349)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Valor Interes'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(112431093231655349)
,p_db_column_name=>'VLOR_FNCNCION'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>unistr('Valor Financiaci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(112431428925655350)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Valor Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(112431824237655350)
,p_db_column_name=>'DSCRPCION_INDCDOR_CTA_PGDA'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>unistr('\00BFCuota Pagada?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(112432259917655356)
,p_db_column_name=>'ESTDO_CTA'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Estado Cuota'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(112438067715674489)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1124381'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_CNVNIO:NMRO_CTA:FCHA_VNCMNTO:VLOR_CPTAL:VLOR_INTRES:VLOR_FNCNCION:VLOR_TTAL:DSCRPCION_INDCDOR_CTA_PGDA:ESTDO_CTA'
,p_sum_columns_on_break=>'VLOR_CPTAL:VLOR_INTRES:VLOR_FNCNCION:VLOR_TTAL'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(112445062196704101)
,p_report_id=>wwv_flow_api.id(112438067715674489)
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
,p_row_bg_color=>'#C7F5C7'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112412714891573203)
,p_name=>'P195_ID_CNVNIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(112428283713655331)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112412800720573204)
,p_name=>'P195_NMRO_CNVNIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(112428283713655331)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
