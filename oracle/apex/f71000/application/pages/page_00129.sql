prompt --application/pages/page_00129
begin
wwv_flow_api.create_page(
 p_id=>129
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Acuerdos de Pagos Rechazados'
,p_page_mode=>'MODAL'
,p_step_title=>'Acuerdos de Pagos Rechazados'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'70%'
,p_last_updated_by=>'LOBREDOR'
,p_last_upd_yyyymmddhh24miss=>'20191018083014'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95547243492048549)
,p_plug_name=>'Acuerdos de Pagos Rechazados'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_cnvnio,',
'       a.idntfccion_sjto,',
'       a.nmro_cnvnio,',
'       a.fcha_slctud,',
'       a.nmro_idntfccion_slctnte,',
'       a.nmbre_slctnte,',
'       id_acto,',
'       a.dscrpcion_cnvnio_tpo ',
'  from v_gf_g_convenios a',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and trunc(a.fcha_rchzo) = trunc(sysdate)',
'    and a.cdgo_cnvnio_estdo = ''RCH''',
'    and a.id_cnvnio in (select regexp_substr(:P47_CNVNIOS_APRBDOS, ''[^:]+'', 1,level) id_cnvnio',
'                          from dual',
'                        connect by regexp_substr(:P47_CNVNIOS_APRBDOS, ''[^:]+'', 1,level) is not null) '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(95547356115048549)
,p_name=>'Acuerdos de Pagos Rechazados'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>95547356115048549
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95547709012048555)
,p_db_column_name=>'ID_CNVNIO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Cnvnio'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95560566958048569)
,p_db_column_name=>'NMRO_CNVNIO'
,p_display_order=>21
,p_column_identifier=>'AG'
,p_column_label=>unistr('N\00FAmero Acuerdo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95561739916048578)
,p_db_column_name=>'FCHA_SLCTUD'
,p_display_order=>31
,p_column_identifier=>'AJ'
,p_column_label=>'Fecha Solicitud'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95558545211048565)
,p_db_column_name=>'DSCRPCION_CNVNIO_TPO'
,p_display_order=>41
,p_column_identifier=>'AB'
,p_column_label=>'Tipo Acuerdo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95552137277048561)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>51
,p_column_identifier=>'L'
,p_column_label=>'Sujeto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95553319862048562)
,p_db_column_name=>'NMRO_IDNTFCCION_SLCTNTE'
,p_display_order=>71
,p_column_identifier=>'O'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95552586514048561)
,p_db_column_name=>'NMBRE_SLCTNTE'
,p_display_order=>81
,p_column_identifier=>'M'
,p_column_label=>'Solicitante'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96175256434155124)
,p_db_column_name=>'ID_ACTO'
,p_display_order=>91
,p_column_identifier=>'DW'
,p_column_label=>'Acto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:V_GN_G_ACTOS:FILE_BLOB:ID_ACTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(96153377880847463)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'961534'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_CNVNIO:NMRO_CNVNIO:FCHA_SLCTUD:DSCRPCION_CNVNIO_TPO:IDNTFCCION_SJTO:NMRO_IDNTFCCION_SLCTNTE:NMBRE_SLCTNTE:ID_INSTNCIA_FLJO_PDRE_IMPSTO:CDGO_IDNTFCCION_TPO_SLCTNTE_NTFCCION:ID_CDGO_ACTO_ORGEN:NMRO_NMRO_ACTO_DSPLAY:FCHA_FCHA_APRBCION:ID_ACTO'
);
end;
/
