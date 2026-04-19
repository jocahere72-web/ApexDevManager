prompt --application/pages/page_00108
begin
wwv_flow_api.create_page(
 p_id=>108
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Detalle Determinaci\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Detalle Determinaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'60%'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20191119162855'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(38698647067544057)
,p_plug_name=>unistr('Detalle Determinaci\00F3n')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.vgncia, ',
'        a.prdo,',
'        a.cdgo_cncpto,',
'        a.dscrpcion,',
'        a.trfa,',
'        a.avluo,',
'        to_char(a.vlor_cptal, :F_FRMTO_MNDA) vlor_cptal,',
'        to_char(a.vlor_intres, :F_FRMTO_MNDA)vlor_intres,',
'        to_char(a.vlor_cptal + a.vlor_intres, :F_FRMTO_MNDA) vlor_ttal',
'   from v_gi_g_determinacion_detalle a',
'  where id_dtrmncion = :P108_ID_DTRMNCION',
'order by a.vgncia, ',
'        a.prdo,',
'        a.cdgo_cncpto'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(38698723059544057)
,p_name=>unistr('Detalle Determinaci\00F3n')
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>38698723059544057
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38699175702544089)
,p_db_column_name=>'VGNCIA'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38699596350544092)
,p_db_column_name=>'PRDO'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Periodo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38699929210544093)
,p_db_column_name=>'CDGO_CNCPTO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>unistr('C\00F3digo Concepto')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38700361425544093)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38700776389544093)
,p_db_column_name=>'TRFA'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Tarifa'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38701191434544093)
,p_db_column_name=>'AVLUO'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>unistr('Aval\00FAo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38701591459544093)
,p_db_column_name=>'VLOR_CPTAL'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Valor Capital'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38701960165544094)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Valor Interes'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38702315790544094)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Valor Total'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(38707760040565580)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'387078'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VGNCIA:PRDO:CDGO_CNCPTO:DSCRPCION:TRFA:AVLUO:VLOR_CPTAL:VLOR_INTRES:VLOR_TTAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38663125640421129)
,p_name=>'P108_ID_DTRMNCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(38698647067544057)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
