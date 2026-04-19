prompt --application/pages/page_00337
begin
wwv_flow_api.create_page(
 p_id=>337
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Reporte Candidatos Cartera'
,p_page_mode=>'MODAL'
,p_step_title=>'Reporte Candidatos Cartera'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_last_updated_by=>'VROMERO'
,p_last_upd_yyyymmddhh24miss=>'20240806152058'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(161864252976976416)
,p_plug_name=>'Reporte Candidatos Cartera'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    b.dscrpcion as Periodo,',
'    p.vgncia as Vigencia,',
'    (p.prmer_nmbre ||''''||p.prmer_aplldo) as Nombre_Suscriptor,',
'    p.cdgo_idntfccion_tpo as Tipo_Identificacion,',
'    p.idntfccion as Identificacion,',
'    p.email as Correo,',
'    p.drccion_lnea as Direccion,',
'    p.nmro_lnea_tlfno as Numero_de_linea,',
unistr('    d.nmbre_impsto_acto as Destinaci\00F3n,'),
'    p.estrato as Estrato,',
'    p.nmro_cntrto as Nro_Contrato,',
'    to_char(p.trfa,''fm9990.00'') as Tarifa,',
'    p.vlor_bse_grvble as Base_gravable,',
'    p.vlor_cptal as valor_impuesto_liquidado',
'    from gi_g_telefono_pre_lqdcion p',
'    join gi_g_informacion_telefono a on a.id_infrmcion_telefono = p.id_infrmcion_telefono',
'    join df_i_periodos b on b.id_prdo = p.id_prdo',
'    join df_i_impuestos_acto           d on d.id_impsto_acto = p.id_impsto_acto',
'where id_usrio_tlfnia = :P337_USRIO_TLFNIA',
'and p.indcdor_prcsdo = ''S''',
'and not exists (',
'    select 1',
'    from gi_g_telefono_recaudo r',
'    where r.idntfccion = p.idntfccion',
'    and r.vgncia = p.vgncia',
'    AND r.id_prdo = p.id_prdo',
')',
'and p.vgncia = :P337_VGNCIA and p.id_prdo = :P337_PRDO;',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>210
,p_prn_height=>297
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(161864383921976417)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('No hay ning\00FAn candidato para Cartera')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'VROMERO'
,p_internal_uid=>161864383921976417
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(162375231825717013)
,p_db_column_name=>'NOMBRE_SUSCRIPTOR'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>'Nombre Suscriptor'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(162375346429717014)
,p_db_column_name=>'TIPO_IDENTIFICACION'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>unistr('Tipo Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(162375426582717015)
,p_db_column_name=>'IDENTIFICACION'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'Identificacion'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(162375570556717016)
,p_db_column_name=>'CORREO'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Correo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(162375607957717017)
,p_db_column_name=>'DIRECCION'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Direccion'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(162375741035717018)
,p_db_column_name=>'NUMERO_DE_LINEA'
,p_display_order=>80
,p_column_identifier=>'I'
,p_column_label=>'Numero De Linea'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(162375912758717020)
,p_db_column_name=>'ESTRATO'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Estrato'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(162376013240717021)
,p_db_column_name=>'NRO_CONTRATO'
,p_display_order=>110
,p_column_identifier=>'L'
,p_column_label=>'Nro Contrato'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(162376221331717023)
,p_db_column_name=>'BASE_GRAVABLE'
,p_display_order=>130
,p_column_identifier=>'N'
,p_column_label=>'Base Gravable'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(162376325442717024)
,p_db_column_name=>'VALOR_IMPUESTO_LIQUIDADO'
,p_display_order=>140
,p_column_identifier=>'O'
,p_column_label=>'Valor Impuesto Liquidado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(162376522484717026)
,p_db_column_name=>'PERIODO'
,p_display_order=>150
,p_column_identifier=>'Q'
,p_column_label=>'Periodo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(162376672461717027)
,p_db_column_name=>'VIGENCIA'
,p_display_order=>160
,p_column_identifier=>'R'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(162376746510717028)
,p_db_column_name=>unistr('DESTINACI\00D3N')
,p_display_order=>170
,p_column_identifier=>'S'
,p_column_label=>unistr('Destinaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(162376841254717029)
,p_db_column_name=>'TARIFA'
,p_display_order=>180
,p_column_identifier=>'T'
,p_column_label=>'Tarifa'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(162084500298849857)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1620846'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('VIGENCIA:PERIODO:NOMBRE_SUSCRIPTOR:TIPO_IDENTIFICACION:IDENTIFICACION:CORREO:DIRECCION:NUMERO_DE_LINEA:DESTINACI\00D3N:ESTRATO:NRO_CONTRATO:TARIFA:BASE_GRAVABLE:VALOR_IMPUESTO_LIQUIDADO:')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(161866954104976443)
,p_name=>'P337_USRIO_TLFNIA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(149217132615128065)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(163124788181418611)
,p_name=>'P337_IDENTIFICACION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(149217132615128065)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(163124919683418613)
,p_name=>'P337_VGNCIA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(149217132615128065)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(163125095791418614)
,p_name=>'P337_PRDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(149217132615128065)
,p_prompt=>'Prdo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
