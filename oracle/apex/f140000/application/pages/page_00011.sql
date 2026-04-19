prompt --application/pages/page_00011
begin
wwv_flow_api.create_page(
 p_id=>11
,p_user_interface_id=>wwv_flow_api.id(22508582753660970)
,p_name=>'Cartera Movimientos'
,p_page_mode=>'MODAL'
,p_step_title=>'Cartera Movimientos'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'85%'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20191218081808'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(125121951686994253)
,p_plug_name=>'Movimientos'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52128439135074801)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto,',
'       a.vgncia,',
'       a.prdo,',
'       initcap(a.dscrpcion_mvmnto_tpo) dscrpcion_mvmnto_tpo,',
'       to_char(a.fcha_mvmnto, ''DD/MM/YYYY HH12:MI:SS AM'') fcha_mvmnto,',
'       initcap(a.cdgo_cncpto || '' - '' || dscrpcion_cncpto) cncpto,',
'       a.vlor_dbe,',
'       a.vlor_hber',
'  from v_gf_g_movimientos_detalle a ',
' where a.id_sjto_impsto    = :P11_ID_SJTO_IMPSTO',
'   and vgncia              = :P11_VGNCIA',
'   and id_prdo             = :P11_ID_PRDO',
'   and id_orgen            = :P11_ID_ORGEN',
'order by a.fcha_mvmnto desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(125121991057994253)
,p_name=>'Movimientos'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>125121991057994253
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24735747111376541)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>10
,p_column_identifier=>'H'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24734944675376540)
,p_db_column_name=>'VGNCIA'
,p_display_order=>20
,p_column_identifier=>'F'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24735349473376541)
,p_db_column_name=>'PRDO'
,p_display_order=>30
,p_column_identifier=>'G'
,p_column_label=>'Periodo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24732902297376539)
,p_db_column_name=>'DSCRPCION_MVMNTO_TPO'
,p_display_order=>40
,p_column_identifier=>'A'
,p_column_label=>'Tipo Movimiento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24733344325376540)
,p_db_column_name=>'FCHA_MVMNTO'
,p_display_order=>50
,p_column_identifier=>'B'
,p_column_label=>'Fecha Movimiento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24733762508376540)
,p_db_column_name=>'CNCPTO'
,p_display_order=>60
,p_column_identifier=>'C'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24734196081376540)
,p_db_column_name=>'VLOR_DBE'
,p_display_order=>70
,p_column_identifier=>'D'
,p_column_label=>'Valor Debe'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24734560163376540)
,p_db_column_name=>'VLOR_HBER'
,p_display_order=>80
,p_column_identifier=>'E'
,p_column_label=>'Valor Haber'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(125128457339015795)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'247361'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_IMPSTO:VGNCIA:PRDO:DSCRPCION_MVMNTO_TPO:FCHA_MVMNTO:CNCPTO:VLOR_DBE:VLOR_HBER:'
,p_sort_column_1=>'FCHA_MVMNTO'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24736546816376541)
,p_name=>'P11_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(125121951686994253)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24736931512376545)
,p_name=>'P11_VGNCIA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(125121951686994253)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24737323709376546)
,p_name=>'P11_ID_PRDO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(125121951686994253)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48993983348511003)
,p_name=>'P11_ID_ORGEN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(125121951686994253)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
