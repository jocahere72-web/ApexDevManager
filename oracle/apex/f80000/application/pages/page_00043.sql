prompt --application/pages/page_00043
begin
wwv_flow_api.create_page(
 p_id=>43
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Observaciones Reversi\00F3n de Estados')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Observaciones Reversi\00F3n de Estados')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ABRACHE'
,p_last_upd_yyyymmddhh24miss=>'20190220095556'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86142393422707449)
,p_plug_name=>unistr('Observaciones Reversi\00F3n de Estados')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.fcha_rgstro,e.dscrpcion,a.obsrvcion',
'from cb_g_prcsos_jrdc_dcmnt_estd a',
'left join wf_d_flujos_tarea_estado e on a.id_fljo_trea_estdo = e.id_fljo_trea_estdo',
'where a.obsrvcion is not null',
'and a.id_prcsos_jrdco_dcmnto = :p43_id_prcsos_jrdco_dcmnto',
'order by a.id_prcsos_jrdco_dcmnto_estdo desc;'))
,p_plug_source_type=>'NATIVE_IR'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(86142458428707449)
,p_name=>unistr('Observaciones Reversi\00F3n de Estados')
,p_max_row_count_message=>unistr('El recuento m\00E1ximo de filas de este informe es #MAX_ROW_COUNT# filas. Aplique un filtro para reducir el n\00FAmero de registros de la consulta.')
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'ABRACHE'
,p_internal_uid=>86142458428707449
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86142800039707454)
,p_db_column_name=>'FCHA_RGSTRO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Fecha de registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86143203080707456)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Estado Generador'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86143682604707456)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>unistr('Observaci\00F3n de Reversi\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(86147062031717148)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'861471'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'FCHA_RGSTRO:DSCRPCION:OBSRVCION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84982762409475116)
,p_name=>'P43_ID_PRCSOS_JRDCO_DCMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(86142393422707449)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
end;
/
