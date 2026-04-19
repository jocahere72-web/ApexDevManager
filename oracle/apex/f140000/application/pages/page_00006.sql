prompt --application/pages/page_00006
begin
wwv_flow_api.create_page(
 p_id=>6
,p_user_interface_id=>wwv_flow_api.id(22508582753660970)
,p_name=>'Documentos de Pago - Detalle'
,p_page_mode=>'MODAL'
,p_step_title=>'Documentos de Pago - Detalle'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20220511143939'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(148585113191084981)
,p_plug_name=>'Detalle Documento - Consulta General'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52128439135074801)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select vgncia, ',
'        prdo, ',
'        dscrpcion || '' ['' || cdgo_cncpto || '']''  cncpto,',
'        vlor_dbe,',
'        vlor_hber,',
'        nmro_cta',
'   from v_re_g_documentos_detalle ',
'  where id_dcmnto = :P6_ID_DCMNTO',
' order by id_dcmnto_dtlle'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(148585272358084981)
,p_name=>'Detalle Documento - Consulta General'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>148585272358084981
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24578048823960615)
,p_db_column_name=>'VGNCIA'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24578455007960616)
,p_db_column_name=>'PRDO'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Periodo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24578872066960616)
,p_db_column_name=>'CNCPTO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24579238918960616)
,p_db_column_name=>'VLOR_DBE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Valor Debe'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24579682510960617)
,p_db_column_name=>'VLOR_HBER'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Valor Haber'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(112214479982535102)
,p_db_column_name=>'NMRO_CTA'
,p_display_order=>15
,p_column_identifier=>'F'
,p_column_label=>'Cuota Convenio'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(148589900510096467)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'245800'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VGNCIA:PRDO:CNCPTO:VLOR_DBE:VLOR_HBER:NMRO_CTA'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24580420460960625)
,p_name=>'P6_ID_DCMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(148585113191084981)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
end;
/
