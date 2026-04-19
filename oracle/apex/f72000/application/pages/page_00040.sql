prompt --application/pages/page_00040
begin
wwv_flow_api.create_page(
 p_id=>40
,p_user_interface_id=>wwv_flow_api.id(72999165452094574)
,p_name=>'Recursos Finalizados'
,p_step_title=>'Recursos Finalizados'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(72894757230094465)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'122333'
,p_last_upd_yyyymmddhh24miss=>'20200516150445'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(71339150385008395)
,p_plug_name=>'Recursos Finalizados'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_rcrso,',
'        c.idntfccion,',
'        a.id_instncia_fljo_hjo,',
'        a.id_slctud,',
'        c.nmro_rdcdo_dsplay,',
'   --   c.fcha_rdcdo,',
'   --   c.fcha_pryctda,',
'        c.nmbre_impsto,',
'        c.nmbre_impsto_sbmpsto,',
'        a.cdgo_rspta,',
'        d.dscrpcion,',
'        b.fcha_fin_optma,',
'        b.estdo_instncia        ',
'from  gj_g_recursos a',
'join  wf_g_instancias_flujo     b on a.id_instncia_fljo_hjo = b.id_instncia_fljo and b.estdo_instncia = ''FINALIZADA''',
'join  v_pq_g_solicitudes        c on  a.id_slctud           = c.id_slctud',
'join gj_d_recursos_respuesta    d on a.cdgo_rspta           = d.cdgo_rspta',
'where a.cdgo_rspta is not null',
'order by b.fcha_fin_optma desc;',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(71339251415008395)
,p_name=>'Recursos Finalizados'
,p_max_row_count_message=>unistr('El recuento m\00E1ximo de filas de este informe es #MAX_ROW_COUNT# filas. Aplique un filtro para reducir el n\00FAmero de registros de la consulta.')
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'AHERNANDEZ'
,p_internal_uid=>71339251415008395
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71339583883008550)
,p_db_column_name=>'ID_RCRSO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Rcrso'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71339899439008558)
,p_db_column_name=>'ID_INSTNCIA_FLJO_HJO'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Instancia Flujo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71340223912008558)
,p_db_column_name=>'ID_SLCTUD'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Id Slctud'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71340605388008558)
,p_db_column_name=>'CDGO_RSPTA'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Cdgo Rspta'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71341026490008559)
,p_db_column_name=>'FCHA_FIN_OPTMA'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>unistr('Fecha Finalizaci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71341451563008559)
,p_db_column_name=>'ESTDO_INSTNCIA'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71342795438180601)
,p_db_column_name=>'NMRO_RDCDO_DSPLAY'
,p_display_order=>16
,p_column_identifier=>'G'
,p_column_label=>'No. Radicado PQR'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71342822882180602)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>26
,p_column_identifier=>'H'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71342997149180603)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>36
,p_column_identifier=>'I'
,p_column_label=>'Sub -Tributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71343020709180604)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>46
,p_column_identifier=>'J'
,p_column_label=>'Respuesta'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71343165514180605)
,p_db_column_name=>'IDNTFCCION'
,p_display_order=>56
,p_column_identifier=>'K'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(71341899436016457)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'713419'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_INSTNCIA_FLJO_HJO:NMRO_RDCDO_DSPLAY:IDNTFCCION:NMBRE_IMPSTO:NMBRE_IMPSTO_SBMPSTO:FCHA_FIN_OPTMA:DSCRPCION:ESTDO_INSTNCIA:'
);
end;
/
