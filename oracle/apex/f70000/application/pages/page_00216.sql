prompt --application/pages/page_00216
begin
wwv_flow_api.create_page(
 p_id=>216
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Consulta de Reservas'
,p_step_title=>'Consulta de Reservas'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20210618090351'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(146520062957562521)
,p_plug_name=>'Consulta de Reservas'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.id_subprdcto, p.dscrpcion_prsntcion, sum(p.cntdad_rsrvda)',
'  from v_gi_g_rentas_producto p',
' where p.indcdor_rsrvdo = 1',
' group by p.id_subprdcto, p.dscrpcion_prsntcion',
' order by p.dscrpcion_prsntcion;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(146520190302562521)
,p_name=>'Consulta de Reservas'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'HMARTINEZ'
,p_internal_uid=>146520190302562521
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(137288243407187317)
,p_db_column_name=>'DSCRPCION_PRSNTCION'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Medicamentos Solicitados'
,p_column_link=>'f?p=&APP_ID.:155:&SESSION.::&DEBUG.:RP,155:P155_MDCMNTO:#ID_SUBPRDCTO##ID_RNTA#'
,p_column_linktext=>'#DSCRPCION_PRSNTCION#'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(137288642288187334)
,p_db_column_name=>'SUM(P.CNTDAD_RSRVDA)'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Cantidades Reservadas'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(137289052730187334)
,p_db_column_name=>'ID_SUBPRDCTO'
,p_display_order=>13
,p_column_identifier=>'D'
,p_column_label=>'Id Subprdcto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(146522629772568250)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1372894'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_PRSNTCION:SUM(P.CNTDAD_RSRVDA):ID_SUBPRDCTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(237503189470844511)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>',
unistr('    <p align="justify">A trav\00E9s de esta opci\00F3n podr\00E1 consultar los mediacmentos que se encuentran en Reserva por los contribuyentes, al hacer clic en alguno de los medicamentos se mostrar\00E1 informaci\00F3n detallada de que liquidaciones tiene asociadas ba')
||'jo reserva.<br> ',
'        ',
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
