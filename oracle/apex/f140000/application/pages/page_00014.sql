prompt --application/pages/page_00014
begin
wwv_flow_api.create_page(
 p_id=>14
,p_user_interface_id=>wwv_flow_api.id(22508582753660970)
,p_name=>'Acuerdo de Pago - Cartera '
,p_page_mode=>'MODAL'
,p_step_title=>'Acuerdo de Pago - Cartera '
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'90%'
,p_last_updated_by=>'JCUAO'
,p_last_upd_yyyymmddhh24miss=>'20191017091244'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(125804602259421871)
,p_plug_name=>'Cartera Acuerdo de Pago'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52128439135074801)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmro_cnvnio,',
'        vgncia,',
'        prdo,',
'        cdgo_cncpto || '' - '' || dscrpcion cncpto,',
'        vlor_cptal,',
'        vlor_intres,',
'        vlor_ttal',
'   from v_gf_g_convenios_cartera',
'  where id_cnvnio = :P14_ID_CNVNIO;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(125804640706421871)
,p_name=>'Cartera Acuerdo de Pago'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>125804640706421871
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24877589326753766)
,p_db_column_name=>'NMRO_CNVNIO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00B0 Acuerdo de Pago')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24877979374753769)
,p_db_column_name=>'VGNCIA'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24878343613753769)
,p_db_column_name=>'PRDO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Periodo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24878728512753770)
,p_db_column_name=>'CNCPTO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24879119989753770)
,p_db_column_name=>'VLOR_CPTAL'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Valor Capital'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24879585345753770)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Valor Interes'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24879924424753770)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Valor Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(125812486976438022)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'248803'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_CNVNIO:VGNCIA:PRDO:CNCPTO:VLOR_CPTAL:VLOR_INTRES:VLOR_TTAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24880713474753778)
,p_name=>'P14_ID_CNVNIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(125804602259421871)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
