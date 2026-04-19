prompt --application/pages/page_00197
begin
wwv_flow_api.create_page(
 p_id=>197
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Ver Ajuste Aplicado'
,p_page_mode=>'MODAL'
,p_step_title=>'Ver Ajuste Aplicado'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'800'
,p_dialog_width=>'1200'
,p_dialog_chained=>'N'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20251126110121'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(110755576734495904)
,p_plug_name=>'Region de Impresion'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_plug_display_when_condition=>'P197_CDGO_ESTDO_AJSTE'
,p_plug_display_when_cond2=>'AP:RG:A'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(197212840860060854)
,p_plug_name=>'Tab Ajuste'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(119241640089274502)
,p_plug_name=>unistr('<b>Informaci\00F3n</b>')
,p_parent_plug_id=>wwv_flow_api.id(197212840860060854)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'P197_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(453112834747233655)
,p_plug_name=>unistr('<b>Informaci\00F3n</b>')
,p_parent_plug_id=>wwv_flow_api.id(197212840860060854)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(452570351440272634)
,p_plug_name=>'Datos del Sujeto Tributo'
,p_parent_plug_id=>wwv_flow_api.id(453112834747233655)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.id_sjto_impsto,   ',
'        a.nmbre_impsto,',
'        a.idntfccion_sjto,',
'        a.drccion,',
'        '' '' || a.nmbre_mncpio || '' - '' || upper(a.nmbre_dprtmnto)  || '' '' ||a.nmbre_pais  ubicacion,',
'        a.dscrpcion_sjto_estdo ',
'   from v_si_i_sujetos_impuesto a',
'  where a.cdgo_clnte      = :F_CDGO_CLNTE',
'    and a.id_sjto_impsto  = :P197_ID_SJTO_IMPSTO'))
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
 p_id=>wwv_flow_api.id(452570459928272635)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'La consulta no arrojo resultado'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'AALFARO'
,p_internal_uid=>452570459928272635
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110698944254086003)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>10
,p_column_identifier=>'F'
,p_column_label=>'SJTO_IMPSTO'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110698115838086003)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110697327314086003)
,p_db_column_name=>'DRCCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110697795141086003)
,p_db_column_name=>'UBICACION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Ubicaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110698524797086003)
,p_db_column_name=>'DSCRPCION_SJTO_ESTDO'
,p_display_order=>60
,p_column_identifier=>'B'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110696999019086002)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>70
,p_column_identifier=>'J'
,p_column_label=>unistr('Identificaci\00F3n del Sujeto')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(452613991401805891)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1106993'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'NMBRE_IMPSTO:DSCRPCION_SJTO_ESTDO:DRCCION:UBICACION:ID_SJTO_IMPSTO:IDNTFCCION_SJTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(452698503784289848)
,p_plug_name=>'Datos del Predio'
,p_parent_plug_id=>wwv_flow_api.id(453112834747233655)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select ',
'    a.dscrpcion_prdo_dstno,',
'    a.dscrpcion_estrto,',
'    a.dscrpcion_prdio_clsfccion',
'    ,a.avluo_ctstral,',
'    a.avluo_cmrcial,',
'    a.area_cnstrda,',
'    a.mtrcla_inmblria,',
'    a.nmbre_dstno_igac ',
'  from v_si_i_predios a ',
'  join si_i_sujetos_impuesto b ',
'--   on a.id_sjto = b.id_sjto',
'  on a.id_sjto_impsto = b.id_sjto_impsto',
' where  b.id_sjto_impsto  = :P197_ID_SJTO_IMPSTO ;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select  a.cdgo_sjto_tpo',
' from v_si_i_sujetos_impuesto a',
' where a.id_sjto_impsto   = :P197_ID_SJTO_IMPSTO  and a.cdgo_clnte = :F_CDGO_CLNTE and  a.cdgo_sjto_tpo = ''P'';'))
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
 p_id=>wwv_flow_api.id(452698713348289850)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'AALFARO'
,p_internal_uid=>452698713348289850
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110700070099086005)
,p_db_column_name=>'DSCRPCION_PRDO_DSTNO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Destino'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110700406457086005)
,p_db_column_name=>'DSCRPCION_ESTRTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Estrato'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110700834174086005)
,p_db_column_name=>'DSCRPCION_PRDIO_CLSFCCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Clasificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110701232297086005)
,p_db_column_name=>'AVLUO_CTSTRAL'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Aval\00FAo Catrastral')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110701692751086006)
,p_db_column_name=>'AVLUO_CMRCIAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Aval\00FAo Comercial')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110702034155086006)
,p_db_column_name=>'AREA_CNSTRDA'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('\00C1rea Construida')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110702420620086006)
,p_db_column_name=>'MTRCLA_INMBLRIA'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Matr\00EDcula')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110702847711086006)
,p_db_column_name=>'NMBRE_DSTNO_IGAC'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Destino Igac'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(453094854085485453)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1107032'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_PRDO_DSTNO:DSCRPCION_ESTRTO:DSCRPCION_PRDIO_CLSFCCION:AVLUO_CTSTRAL:AVLUO_CMRCIAL:AREA_CNSTRDA:MTRCLA_INMBLRIA:NMBRE_DSTNO_IGAC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(452700689769289870)
,p_plug_name=>unistr('Datos del Veh\00EDculo')
,p_parent_plug_id=>wwv_flow_api.id(453112834747233655)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select ',
'    a.nmbre_vhclo_mrca,',
'    a.vlor_cmrcial,',
'    a.avluo,',
'    a.fcha_cmpra,',
'    a.nmro_mtrcla,',
'    a.nmro_mtor, ',
'    a.nmbre_vhclo_clse,',
'    a.nmbre_vhclo_ctgtria ',
' from v_si_i_vehiculos a',
' where a.id_sjto_impsto    = :P197_ID_SJTO_IMPSTO'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select  a.cdgo_sjto_tpo',
' from v_si_i_sujetos_impuesto a',
' where a.id_sjto_impsto   = :P197_ID_SJTO_IMPSTO  and a.cdgo_clnte = :F_CDGO_CLNTE and  a.cdgo_sjto_tpo = ''V'';'))
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
 p_id=>wwv_flow_api.id(452700753179289871)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'La consulta no arrojo resultado'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'AALFARO'
,p_internal_uid=>452700753179289871
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110703989079086007)
,p_db_column_name=>'NMBRE_VHCLO_MRCA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Veh\00EDculo marca')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110704340148086008)
,p_db_column_name=>'VLOR_CMRCIAL'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Valor comercial'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110704783797086008)
,p_db_column_name=>'AVLUO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Aval\00FAo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110705171869086008)
,p_db_column_name=>'FCHA_CMPRA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Fecha Compra'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110705517738086008)
,p_db_column_name=>'NMRO_MTRCLA'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('N\00FAmero Matr\00EDcula')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110705981204086008)
,p_db_column_name=>'NMRO_MTOR'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('N\00FAmero Motor')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110706341618086009)
,p_db_column_name=>'NMBRE_VHCLO_CLSE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Clase Veh\00EDculo')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110706722790086009)
,p_db_column_name=>'NMBRE_VHCLO_CTGTRIA'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Categor\00EDa Veh\00EDculo')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(453859524545846086)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1107071'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_VHCLO_MRCA:VLOR_CMRCIAL:AVLUO:FCHA_CMPRA:NMRO_MTRCLA:NMRO_MTOR:NMBRE_VHCLO_CLSE:NMBRE_VHCLO_CTGTRIA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(452701668394289880)
,p_plug_name=>'Datos del Propietario'
,p_parent_plug_id=>wwv_flow_api.id(453112834747233655)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select ',
'    a.nmbre_rzon_scial,',
'    a.dscrpcion_idntfccion_tpo ,',
'    a.idntfccion_rspnsble ,',
'     case when prncpal_s_n = ''S'' then',
'       ''<input type="checkbox" name="prncpal_s_n" disabled="true" checked>'' ',
'        else  ',
'       ''<input type="checkbox" name="prncpal_s_n" disabled="true">'' ',
'       end as prncpal_s_n',
'  from v_si_i_sujetos_responsable a',
'  join si_i_sujetos_impuesto b on a.id_sjto = b.id_sjto',
'  where a.cdgo_clnte     = :F_CDGO_CLNTE',
'  and a.id_sjto  = :P197_ID_SJTO_IMPSTO'))
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
 p_id=>wwv_flow_api.id(453112420923233650)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'La consulta no arrojo resultado'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'AALFARO'
,p_internal_uid=>453112420923233650
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110708240374086010)
,p_db_column_name=>'DSCRPCION_IDNTFCCION_TPO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Tipo Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110708629734086010)
,p_db_column_name=>'IDNTFCCION_RSPNSBLE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110709063050086010)
,p_db_column_name=>'PRNCPAL_S_N'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Principal '
,p_column_html_expression=>'<input type="checkbox" checked >'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110707860384086010)
,p_db_column_name=>'NMBRE_RZON_SCIAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Raz\00F3n Social')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(453134816534509152)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1107094'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_IDNTFCCION_TPO:IDNTFCCION_RSPNSBLE:PRNCPAL_S_N:NMBRE_RZON_SCIAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(460646107197138031)
,p_plug_name=>'<b>Tributo</b>'
,p_parent_plug_id=>wwv_flow_api.id(197212840860060854)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(628712480202546318)
,p_plug_name=>'<b>Datos del Ajuste</b>'
,p_parent_plug_id=>wwv_flow_api.id(197212840860060854)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_plug_read_only_when=>'P197_ID_AJSTE'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16025402353042401)
,p_plug_name=>'<b>Soportes</b>'
,p_parent_plug_id=>wwv_flow_api.id(628712480202546318)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_ajste No_Ajuste,  ',
'       c.file_name Nombre_Archivo, ',
'       c.fcha_rgstro Fecha_Registro,',
'       upper(substr(c.file_name,instr(c.file_name, ''.'', -1) + 1)) tipo_de_archivo,',
'       c.id_adjnto,',
'       1 ver,',
'       2 descargar ',
'from v_gf_g_ajustes a join gf_g_saldos_favor_solicitud  b on b.id_instncia_fljo = a.id_instncia_fljo_pdre',
'                      join gn_g_adjuntos                c on c.id_orgen = b.id_sldo_fvor_slctud',
'                                                          and c.cdgo_orgen_tpo = ''SOPORTE_SAF''',
'where a.id_ajste = :P197_ID_AJSTE ',
'     and cdgo_ajste_mtvo = ''CD106''  --COMPENSACION',
'    '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from v_gf_g_ajustes a join gf_g_saldos_favor_solicitud  b on b.id_instncia_fljo = a.id_instncia_fljo_pdre',
'                      join gn_g_adjuntos                c on c.id_orgen = b.id_sldo_fvor_slctud',
'                                                          and c.cdgo_orgen_tpo = ''SOPORTE_SAF''',
'where a.id_ajste = :P197_ID_AJSTE',
'     and cdgo_ajste_mtvo = ''CD106'''))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(16027114696042418)
,p_name=>'NO_AJUSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NO_AJUSTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'No Ajuste'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(16027248632042419)
,p_name=>'NOMBRE_ARCHIVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOMBRE_ARCHIVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Archivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>255
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(16027361459042420)
,p_name=>'FECHA_REGISTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FECHA_REGISTRO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(16027477691042421)
,p_name=>'TIPO_DE_ARCHIVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIPO_DE_ARCHIVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tipo de<br> Archivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>255
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(16027586405042422)
,p_name=>'VER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VER'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Ver'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_01=>'<center><span class=" fa fa-eye fa-1x fa-spin"></span></center>'
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_CLAVE_PRIMARIA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_VALOR:gn_g_adjuntos,ID_ADJNTO,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,&ID_ADJNTO.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(16027616715042423)
,p_name=>'DESCARGAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCARGAR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(16027741256042424)
,p_name=>'ID_ADJNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ADJNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Adjnto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(16027063637042417)
,p_internal_uid=>16027063637042417
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(16043769322094999)
,p_interactive_grid_id=>wwv_flow_api.id(16027063637042417)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(16043896232095000)
,p_report_id=>wwv_flow_api.id(16043769322094999)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16044382594095004)
,p_view_id=>wwv_flow_api.id(16043896232095000)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(16027114696042418)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105.83500000000001
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16044879856095008)
,p_view_id=>wwv_flow_api.id(16043896232095000)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(16027248632042419)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>512.8299999999999
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16045342733095010)
,p_view_id=>wwv_flow_api.id(16043896232095000)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(16027361459042420)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>165.128
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16045822980095012)
,p_view_id=>wwv_flow_api.id(16043896232095000)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(16027477691042421)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>96.81800000000001
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16046391548095014)
,p_view_id=>wwv_flow_api.id(16043896232095000)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(16027586405042422)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>79.83500000000001
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16046713704095015)
,p_view_id=>wwv_flow_api.id(16043896232095000)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(16027616715042423)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>114.79499999999999
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16050002293105445)
,p_view_id=>wwv_flow_api.id(16043896232095000)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(16027741256042424)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(209770342853755555)
,p_plug_name=>'Adjuntos'
,p_parent_plug_id=>wwv_flow_api.id(628712480202546318)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select    ',
'            id_ajste_adjnto,',
'            id_ajste,',
'			cdgo_adjnto_tpo,',
'			fcha,',
'            SUBSTR(file_name, INSTR(file_name, ''/'')+1) file_name,',
'			--file_blob,',
'			--file_name,',
'            --SUBSTR(file_name, 18) file_name,',
'			--NVL(SUBSTR(file_name, 0, INSTR(file_name, ''/'')-1), file_name) file_name, ',
'            --file_mimetype,',
'			1 descargar',
'   from gf_g_ajuste_adjunto',
'  where id_ajste = :P197_ID_AJSTE',
'  order by fcha desc;	'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  id_ajste_adjnto     ',
'   from gf_g_ajuste_adjunto',
'  where id_ajste = :P197_ID_AJSTE'))
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
end;
/
begin
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(209770420246755556)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'AHERNANDEZ'
,p_internal_uid=>209770420246755556
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110689241926085994)
,p_db_column_name=>'FCHA'
,p_display_order=>30
,p_column_identifier=>'A'
,p_column_label=>'Fecha'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110689664792085995)
,p_db_column_name=>'DESCARGAR'
,p_display_order=>80
,p_column_identifier=>'B'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:GF_G_AJUSTE_ADJUNTO:FILE_BLOB:ID_AJSTE_ADJNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<span class="fa fa-cloud-arrow-down"></span>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110690069903085995)
,p_db_column_name=>'ID_AJSTE'
,p_display_order=>90
,p_column_identifier=>'C'
,p_column_label=>'No Ajuste'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110690442562085995)
,p_db_column_name=>'CDGO_ADJNTO_TPO'
,p_display_order=>100
,p_column_identifier=>'D'
,p_column_label=>'Tipo de Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110690878980085996)
,p_db_column_name=>'ID_AJSTE_ADJNTO'
,p_display_order=>110
,p_column_identifier=>'H'
,p_column_label=>'Id Ajste Adjnto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110691286208085996)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>120
,p_column_identifier=>'I'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(209780022184798648)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1106916'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_AJSTE:FILE_NAME:CDGO_ADJNTO_TPO:FCHA:DESCARGAR:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(455188723810430864)
,p_plug_name=>'<b>Conceptos del Ajuste  No.  &P197_NUMRO_AJSTE. Flujo de Proceso No. &P197_ID_INSTNCIA_FLJO. </b>  '
,p_region_name=>'conceptos_ajustes'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    id_ajste_dtlle, ',
'    id_ajste,',
'    dscrpcion_concepto,',
'    vgncia,',
'    dscrpcion_periodo,',
'    to_char(sldo_cptal, :F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''') sldo_cptal,',
'    vlor_ajste,',
'    vlor_ajste vlor_ajste_mascara,',
'    to_char(intres_ajste_mrtrio, :F_FRMTO_MNDA) intres_ajste_mrtrio    ',
'--      ''$'' || to_char(vlor_ajste, ''999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.'''''') vlor_ajste_mascara      ',
'  from v_gf_g_ajuste_detalle ',
'where id_ajste = :P197_ID_AJSTE',
'',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P197_ID_AJSTE'
,p_plug_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_plug_read_only_when=>'P197_ID_AJSTE'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(6607665331874001)
,p_name=>'INTRES_AJSTE_MRTRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INTRES_AJSTE_MRTRIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Valor Ajuste Inter\00E9s')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(323096490046310291)
,p_name=>'VLOR_AJSTE_MASCARA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_AJSTE_MASCARA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Ajuste Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_is_required=>true
,p_max_length=>13
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(455891053670707744)
,p_name=>'ID_AJSTE_DTLLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_AJSTE_DTLLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(455891148939707745)
,p_name=>'ID_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_AJSTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(455891271133707746)
,p_name=>'DSCRPCION_CONCEPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CONCEPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(455891400837707747)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(455891427963707748)
,p_name=>'DSCRPCION_PERIODO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_PERIODO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(455891527616707749)
,p_name=>'SLDO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SLDO_CPTAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Saldo Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(455891637585707750)
,p_name=>'VLOR_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_AJSTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(455890939695707743)
,p_internal_uid=>455890939695707743
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>false
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(455922492843748667)
,p_interactive_grid_id=>wwv_flow_api.id(455890939695707743)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(455922622855748667)
,p_report_id=>wwv_flow_api.id(455922492843748667)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6613671046874254)
,p_view_id=>wwv_flow_api.id(455922622855748667)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(6607665331874001)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(324182488414279977)
,p_view_id=>wwv_flow_api.id(455922622855748667)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(323096490046310291)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>117
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(455923026092748669)
,p_view_id=>wwv_flow_api.id(455922622855748667)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(455891053670707744)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(455923545702748671)
,p_view_id=>wwv_flow_api.id(455922622855748667)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(455891148939707745)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(455924023403748673)
,p_view_id=>wwv_flow_api.id(455922622855748667)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(455891271133707746)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>245
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(455924537277748674)
,p_view_id=>wwv_flow_api.id(455922622855748667)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(455891400837707747)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>102
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(455925084263748676)
,p_view_id=>wwv_flow_api.id(455922622855748667)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(455891427963707748)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>214
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(455925607970748677)
,p_view_id=>wwv_flow_api.id(455922622855748667)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(455891527616707749)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>167
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(455926047337748679)
,p_view_id=>wwv_flow_api.id(455922622855748667)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(455891637585707750)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(6905551228300)
,p_view_id=>wwv_flow_api.id(455922622855748667)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(323096490046310291)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(110779665308752193)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(110755576734495904)
,p_button_name=>'BTN_IMPRMIR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column_span=>2
,p_grid_column=>7
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(110692344038085999)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(460646107197138031)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_button_condition=>'P197_ID_AJSTE'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(110692779481085999)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(460646107197138031)
,p_button_name=>'BTN_CONSLTR_PRMTROS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>unistr('Consulta Par\00E1metros')
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::P3_NMRO_APP,P3_NMRO_PGNA,P3_NMBRE_ITEM,P3_ID_IMPSTO:&APP_ID.,&APP_PAGE_ID.,P197_ID_SJTO_IMPSTO,&P197_ID_IMPSTO.'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P197_ID_AJSTE'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(110683310351085986)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(628712480202546318)
,p_button_name=>'Visor'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Documento Soporte'
,p_button_position=>'BODY'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(110717326135086028)
,p_branch_name=>unistr('Ir a P\00E1gina 127')
,p_branch_action=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:gn_g_actos,FILE_BLOB,FILE_NAME,FILE_MIMETYPE,ID_ACTO,&P197_ID_ACTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(110683310351085986)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(110780196356756395)
,p_branch_name=>'Imprimir Reporte Ajuste'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_XML:&P197_ID_RPRTE.,<data><id_ajuste>&P197_ID_AJSTE.</id_ajuste><id_impuesto>&P197_ID_IMPSTO.</id_impuesto><P104_ID_INSTNCIA_FLJO>&P197_ID_INSTNCIA_FLJO.</P104_ID_INSTNCIA_FLJO></data>&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(110779665308752193)
,p_branch_sequence=>50
,p_branch_condition_type=>'ITEM_IS_NOT_NULL'
,p_branch_condition=>'P197_ID_AJSTE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16027978263042426)
,p_name=>'P197_ID_ADJNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(16025402353042401)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110683791780085987)
,p_name=>'P197_ID_AJSTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(628712480202546318)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110684197734085987)
,p_name=>'P197_NMRO_SLCTUD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(628712480202546318)
,p_prompt=>unistr('N\00FAmero Solicitud')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110684562856085987)
,p_name=>'P197_TPO_AJSTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(628712480202546318)
,p_prompt=>'Tipo Ajuste'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110684957667085987)
,p_name=>'P197_CDGO_TPO_AJSTE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(628712480202546318)
,p_prompt=>unistr('C\00F3digo Tipo Ajuste')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110685351745085987)
,p_name=>'P197_DSCRPCION_MOTIVO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(628712480202546318)
,p_prompt=>'Motivo'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110685742138085988)
,p_name=>'P197_DSCRPCION_DCMNTO_SPRTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(628712480202546318)
,p_prompt=>'Documento Soporte'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_column=>2
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110686139330085988)
,p_name=>'P197_NMRO_DCMTO_SPRTE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(628712480202546318)
,p_prompt=>unistr('N\00FAmero Documento Soporte')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_column=>2
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110686503513085988)
,p_name=>'P197_FCHA_DCMNTO_SPRTE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(628712480202546318)
,p_prompt=>'Fecha Documento '
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110686992958085988)
,p_name=>'P197_TPO_DCMNTO_SPRTE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(628712480202546318)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110687341842085988)
,p_name=>'P197_DSCRPCION_ESTADO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(628712480202546318)
,p_prompt=>'Estado'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110687786810085988)
,p_name=>'P197_OBSRVCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(628712480202546318)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110688173066085989)
,p_name=>'P197_CDGO_ESTDO_AJSTE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(628712480202546318)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110688586663085989)
,p_name=>'P197_ID_ACTO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(628712480202546318)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110693189857085999)
,p_name=>'P197_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(460646107197138031)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_read_only_when=>'P197_ID_AJSTE'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110693562569086000)
,p_name=>'P197_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(460646107197138031)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P197_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P197_ID_IMPSTO'
,p_ajax_items_to_submit=>'P197_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P197_ID_AJSTE'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110693980147086000)
,p_name=>'P197_ID_SJTO_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(460646107197138031)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110694357044086000)
,p_name=>'P197_IDNTFCCION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(460646107197138031)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>25
,p_read_only_when=>'P197_ID_AJSTE'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110694793468086000)
,p_name=>'P197_RSPSTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(460646107197138031)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110695104642086000)
,p_name=>'P197_XML'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(460646107197138031)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110695529102086001)
,p_name=>'P197_ID_INSTNCIA_FLJO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(460646107197138031)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110695949132086001)
,p_name=>'P197_V__MNSJE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(460646107197138031)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110755470006495903)
,p_name=>'P197_ID_RPRTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(110755576734495904)
,p_prompt=>'Reporte'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rprte d ,',
'       id_rprte r',
'        from gn_d_reportes',
' where cdgo_rprte_grpo = ''AJ1'' and id_rprte=199;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(119834344317002301)
,p_name=>'P197_NUMRO_AJSTE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(460646107197138031)
,p_use_cache_before_default=>'NO'
,p_source=>'NUMRO_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(110709966576086018)
,p_computation_sequence=>10
,p_computation_item=>'P197_ID_INSTNCIA_FLJO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'F_ID_INSTNCIA_FLJO'
,p_compute_when_type=>'NEVER'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(110710337807086021)
,p_computation_sequence=>20
,p_computation_item=>'F_ID_INSTNCIA_FLJO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P197_ID_INSTNCIA_FLJO'
,p_compute_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(110714274645086024)
,p_name=>unistr('Guardar en sesi\00F3n el valor del sub-impuesto selccionado')
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P197_ID_IMPSTO_SBMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(110714765979086025)
,p_event_id=>wwv_flow_api.id(110714274645086024)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    APEX_UTIL.SET_SESSION_STATE(''P197_ID_IMPSTO_SBMPSTO'',:P197_ID_IMPSTO_SBMPSTO);',
'END;'))
,p_attribute_02=>'P197_ID_IMPSTO_SBMPSTO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(110715126682086027)
,p_name=>'antes de enviar la pagina'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_bind_event_type=>'apexbeforepagesubmit'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'P197_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(110755628425495905)
,p_name=>'Activar Boton Imprimir'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P197_ID_RPRTE'
,p_condition_element=>'P197_ID_RPRTE'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(110755703062495906)
,p_event_id=>wwv_flow_api.id(110755628425495905)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(110779665308752193)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(110755856631495907)
,p_event_id=>wwv_flow_api.id(110755628425495905)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(110779665308752193)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(110710647210086022)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Identificaci\00F3n del Sujeto Impuesto')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    select  case when length(a.idntfccion_sjto) = 15 then ',
'						pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => a.idntfccion_sjto, p_frmto => ''xx-xx-xxxx-xxxx-xxx'' , p_crcter_dlmtdor => ''-'' ) ',
'			   when length(a.idntfccion_sjto) = 25 then',
'						pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => a.idntfccion_sjto, p_frmto => ''xx-xx-xx-xx-xxxx-xxxx-x-xx-xx-xxxx'' , p_crcter_dlmtdor => ''-'' )',
'		    else a.idntfccion_sjto',
'            end as idntfccion_sjto,',
'            a.id_impsto ',
'      into :P197_IDNTFCCION,',
'           :P197_ID_IMPSTO ',
'      from v_si_i_sujetos_impuesto a',
'     where a.cdgo_clnte      = :F_CDGO_CLNTE',
'       and a.id_sjto_impsto  = :P197_ID_SJTO_IMPSTO;',
'',
'exception ',
'    when no_data_found then ',
'        apex_util.set_session_state(''P197_IDNTFCCION'',  '''');',
'end;',
'',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(110713007332086023)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Datos del Ajuste'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'select',
'        id_ajste,',
'        nmro_slctud,',
'        tpo_ajste,',
'        cdgo_tpo_ajste,',
'        dscrpcion_motivo,',
'        fcha_dcmnto_sprte,',
'   --     dscrpcion_dcmnto_sprte,',
'   --     nmro_dcmto_sprte,',
'        obsrvcion,',
'        dscrpcion_estado,',
'        CDGO_AJSTE_ESTDO--,',
'        --id_acto',
'   into ',
'        :P197_ID_AJSTE,',
'        :P197_NMRO_SLCTUD,',
'        :P197_TPO_AJSTE,',
'        :P197_CDGO_TPO_AJSTE,',
'        :P197_DSCRPCION_MOTIVO,',
'        :P197_FCHA_DCMNTO_SPRTE,',
'    --    :P197_DSCRPCION_DCMNTO_SPRTE,',
'    --    :P197_NMRO_DCMTO_SPRTE,',
'        :P197_OBSRVCION,',
'        :P197_DSCRPCION_ESTADO,',
'        :P197_CDGO_ESTDO_AJSTE--,',
'       -- :P197_ID_ACTO',
'  from v_gf_g_ajustes',
'  where ',
' ',
'--    id_instncia_fljo=:P197_ID_INSTNCIA_FLJO;',
'         id_ajste = :P197_ID_AJSTE;',
'        ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(110712269157086023)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Sujeto Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto varchar2(500);',
'    ',
'begin',
'    ',
'    select id_sjto_impsto',
'      into v_id_sjto_impsto',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte        = :F_CDGO_CLNTE',
'       and id_impsto         = :P197_ID_IMPSTO',
'       and idntfccion_sjto   = :P197_IDNTFCCION;',
'       ',
'    :P197_RSPSTA := '''';',
'    :P197_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'    ',
'exception when no_data_found then ',
'          :P197_ID_SJTO_IMPSTO := null;',
'          :P197_RSPSTA := ''No Existe el Sujeto Impuesto'';',
'end;'))
,p_process_error_message=>'&P197_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(110692344038085999)
,p_process_success_message=>'&P197_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(110711857854086022)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Automatic Row Fetch V_GF_G_AJUSTES'
,p_attribute_02=>'V_GF_G_AJUSTES'
,p_attribute_03=>'P197_ID_AJSTE'
,p_attribute_04=>'ID_AJSTE'
,p_attribute_08=>wwv_flow_string.join(wwv_flow_t_varchar2(
'id_instncia_fljo=:P197_ID_INSTNCIA_FLJO',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P197_ID_INSTNCIA_FLJO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_is_stateful_y_n=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(110711019961086022)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Impuesto y Sub-Impuesto del Ajuste'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_impsto, id_impsto_sbmpsto, id_sjto_impsto,id_ajste,CDGO_AJSTE_ESTDO',
'   into :P197_ID_IMPSTO, :P197_ID_IMPSTO_SBMPSTO, :P197_ID_SJTO_IMPSTO,:P197_ID_AJSTE,:P197_CDGO_ESTDO_AJSTE',
'   from gf_g_ajustes',
'  where id_instncia_fljo=:P197_ID_INSTNCIA_FLJO;',
'  --id_instncia_fljo=:P197_ID_INSTNCIA_FLJO;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P197_ID_INSTNCIA_FLJO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
