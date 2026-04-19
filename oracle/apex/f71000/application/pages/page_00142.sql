prompt --application/pages/page_00142
begin
wwv_flow_api.create_page(
 p_id=>142
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Pagos de Acuerdos de Pagos'
,p_page_mode=>'MODAL'
,p_step_title=>'Pagos de Acuerdos de Pagos'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'60%'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20200424171417'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(96482045828519944)
,p_plug_name=>'Pagos de Acuerdos de Pagos'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_dcmnto',
'     , a.fcha_rcdo',
'     , a.vlor',
'     , b.dscrpcion_bnco as nmbre_bnco_mdio_pgo',
'     , b.nmro_cnta',
'     , a.dscrpcion_rcdo_estdo',
'     , (select listagg (nmro_cta, '', '')',
'             from ( select distinct id_dcmnto',
'                         , nmro_cta',
'                      from re_g_documentos_cnvnio_cta  m',
'                     where id_cnvnio = :P142_ID_CNVNIO',
'                       and id_dcmnto = a.id_orgen',
'                     order by nmro_cta',
'                  ) )nmro_ctas',
'  from v_re_g_recaudos a',
'  join v_re_g_recaudos_control b',
'    on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
'  where a.id_cnvnio = :P142_ID_CNVNIO;',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(96482135600519944)
,p_name=>'Pagos de Acuerdos de PAgos'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>96482135600519944
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96482599810519949)
,p_db_column_name=>'NMRO_DCMNTO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00B0 Documento')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96482977148519950)
,p_db_column_name=>'FCHA_RCDO'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Fecha Recaudo'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96483367448519951)
,p_db_column_name=>'VLOR'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Valor Recaudado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96483771962519951)
,p_db_column_name=>'NMBRE_BNCO_MDIO_PGO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Banco / Entidad '
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96484530157519951)
,p_db_column_name=>'DSCRPCION_RCDO_ESTDO'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(54243073081546805)
,p_db_column_name=>'NMRO_CNTA'
,p_display_order=>16
,p_column_identifier=>'G'
,p_column_label=>unistr('N\00B0 Cuenta')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3003365128605420)
,p_db_column_name=>'NMRO_CTAS'
,p_display_order=>26
,p_column_identifier=>'H'
,p_column_label=>'Cuota(s)'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(96487769817536925)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'964878'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_DCMNTO:FCHA_RCDO:VLOR:NMBRE_BNCO_MDIO_PGO:DSCRPCION_RCDO_ESTDO:NMRO_CNTA:NMRO_CTAS'
,p_sum_columns_on_break=>'VLOR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96440804937390214)
,p_name=>'P142_ID_CNVNIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(96482045828519944)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
