prompt --application/pages/page_00030
begin
wwv_flow_api.create_page(
 p_id=>30
,p_user_interface_id=>wwv_flow_api.id(22508582753660970)
,p_name=>unistr('Detalle Determinaci\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Detalle Determinaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'1042445451'
,p_last_upd_yyyymmddhh24miss=>'20191218110433'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(49080249680486413)
,p_plug_name=>unistr('Detalle Determinaci\00F3n')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52128439135074801)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.vgncia,',
'        a.prdo,',
'        a.cdgo_cncpto || '' - '' || a.dscrpcion cncpto,',
'        sum(a.vlor_cptal)                     vlor_cptal,',
'        sum(a.vlor_intres)                    vlor_intres,',
'        sum(a.vlor_cptal + a.vlor_intres)     vlor_ttal',
'   from v_gi_g_determinacion_detalle        a',
'  where a.id_dtrmncion = :P30_ID_DTRMNCION',
'group by a.id_dtrmncion,',
'        a.vgncia,',
'        a.prdo,',
'        a.cdgo_cncpto,',
'        a.dscrpcion',
'order by a.vgncia, ',
'        a.prdo        '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(49080304098486413)
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
,p_internal_uid=>49080304098486413
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(49080718850486443)
,p_db_column_name=>'VGNCIA'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(49081168600486454)
,p_db_column_name=>'PRDO'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Periodo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(49081570756486454)
,p_db_column_name=>'CNCPTO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(49081986668486454)
,p_db_column_name=>'VLOR_CPTAL'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Valor Capital'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(49082329446486454)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>unistr('Valor Inter\00E9s')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48994105901511005)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>15
,p_column_identifier=>'F'
,p_column_label=>'Valor Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(49087571189535373)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'490876'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VGNCIA:PRDO:CNCPTO:VLOR_CPTAL:VLOR_INTRES:VLOR_TTAL'
,p_sum_columns_on_break=>'VLOR_CPTAL:VLOR_INTRES:VLOR_TTAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48994339089511007)
,p_name=>'P30_ID_DTRMNCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(49080249680486413)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
