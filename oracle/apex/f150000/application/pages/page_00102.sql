prompt --application/pages/page_00102
begin
wwv_flow_api.create_page(
 p_id=>102
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Cartera Acuerdo de Pago'
,p_page_mode=>'MODAL'
,p_step_title=>'Cartera Acuerdo de Pago'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#cabecera_portal{',
'    display:none;  ',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'60%'
,p_page_is_public_y_n=>'Y'
,p_rejoin_existing_sessions=>'P'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20220811215633'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(100901622342386211)
,p_plug_name=>'Cartera Acuerdo de Pago'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.id_cnvnio_crtra,',
'        a.vgncia,',
'        a.prdo,',
'        a.cdgo_cncpto,',
'        a.dscrpcion,',
'        a.vlor_cptal,',
'        a.vlor_intres,',
'        a.vlor_ttal',
'   from v_gf_g_convenios_cartera a',
'  where id_cnvnio = :P102_ID_CNVNIO',
'order by a.vgncia, ',
'         a.prdo, ',
'         a.cdgo_cncpto'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(100901754872386211)
,p_name=>'Cartera Acuerdo de Pago'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>100901754872386211
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4487922089419268)
,p_db_column_name=>'ID_CNVNIO_CRTRA'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Cnvnio Crtra'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4488331611419289)
,p_db_column_name=>'VGNCIA'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4488788096419289)
,p_db_column_name=>'PRDO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Periodo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4489157868419296)
,p_db_column_name=>'CDGO_CNCPTO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>unistr('C\00F3digo Concepto')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4489510634419296)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4489995894419297)
,p_db_column_name=>'VLOR_CPTAL'
,p_display_order=>15
,p_column_identifier=>'L'
,p_column_label=>'Valor Capital'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4490312794419297)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>25
,p_column_identifier=>'M'
,p_column_label=>unistr('Valor Inter\00E9s')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4490736650419297)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>35
,p_column_identifier=>'N'
,p_column_label=>'Valor Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(100906157338393734)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'44911'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VGNCIA:PRDO:CDGO_CNCPTO:DSCRPCION:VLOR_CPTAL:VLOR_INTRES:VLOR_TTAL:'
,p_sum_columns_on_break=>'VLOR_INTRES:VLOR_TTAL:VLOR_CPTAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4491509173419310)
,p_name=>'P102_ID_CNVNIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(100901622342386211)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
