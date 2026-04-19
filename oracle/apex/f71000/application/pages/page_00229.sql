prompt --application/pages/page_00229
begin
wwv_flow_api.create_page(
 p_id=>229
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Acuerdos Pago por M\00E9todo Revocatoria')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Acuerdos Pago por M\00E9todo Revocatoria')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177320258117050591)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'LOBREDOR'
,p_last_upd_yyyymmddhh24miss=>'20191017092811'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(124172257853769323)
,p_plug_name=>'Acuerdos de Pago por Tipo de Revocatoria'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--hiddenOverflow:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmro_cnvnio',
'        ,fcha_aplccion',
'        ,nmbre_impsto',
'        ,nmbre_impsto_sbmpsto',
'        ,idntfccion_sjto_frmtda',
'        ,nmbre_slctnte',
'        ,initcap(dscrpcion_cnvnio_rvctria_estdo) dscrpcion_cnvnio_rvctria_estdo',
'        ,decode(cdgo_rvctria_tpo,''OFC'', sum(nmro_ofcios_emtdo_rvocar), sum(nmro_ctas)) vlor_rvctria ',
' from v_gf_g_convenios_revocatoria',
'where cdgo_clnte = :F_CDGO_CLNTE ',
'  and ((trunc(fcha_aplccion) between :P118_FECHA_INICIAL and :P118_FECHA_FINAL)',
'   or ((trunc(fcha_aplccion) >= :P118_FECHA_INICIAL and :P118_FECHA_FINAL   is null))',
'   or (trunc(fcha_aplccion)  <= :P118_FECHA_FINAL   and :P118_FECHA_INICIAL is null)',
'   or (:P118_FECHA_INICIAL is null and :P118_FECHA_FINAL is null))',
'  and cdgo_cnvnio_rvctria_estdo = ''APL''',
'  and id_rvctria_mtdo = :P229_ID_RVCTRIA_MTDO',
'group by nmro_cnvnio',
'        ,fcha_aplccion',
'        ,nmbre_impsto',
'        ,nmbre_impsto_sbmpsto',
'        ,idntfccion_sjto_frmtda',
'        ,nmbre_slctnte',
'        ,dscrpcion_cnvnio_rvctria_estdo',
'        ,nmro_ofcios_emtdo_rvocar',
'        ,nmro_ctas',
'        ,cdgo_rvctria_tpo;'))
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
 p_id=>wwv_flow_api.id(3416250684062548)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LOBREDOR'
,p_internal_uid=>3416250684062548
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3416392694062549)
,p_db_column_name=>'NMRO_CNVNIO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00FAmero <br> Acuerdo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3470264694156601)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3470335421156602)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Sub-Tributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3470424428156603)
,p_db_column_name=>'IDNTFCCION_SJTO_FRMTDA'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Sujeto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3470547816156604)
,p_db_column_name=>'NMBRE_SLCTNTE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Solicitante'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3470606043156605)
,p_db_column_name=>'DSCRPCION_CNVNIO_RVCTRIA_ESTDO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3470771505156606)
,p_db_column_name=>'FCHA_APLCCION'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Fecha'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3473094853156629)
,p_db_column_name=>'VLOR_RVCTRIA'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('N\00FAmero Cuotas/ <br> N\00FAmero Oficios')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(3500124499189955)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'35002'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_CNVNIO:NMBRE_IMPSTO:NMBRE_IMPSTO_SBMPSTO:IDNTFCCION_SJTO_FRMTDA:NMBRE_SLCTNTE:DSCRPCION_CNVNIO_RVCTRIA_ESTDO:FCHA_APLCCION:VLOR_RVCTRIA'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(124172303305769324)
,p_name=>'P229_ID_RVCTRIA_MTDO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(124172257853769323)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(124173348194769334)
,p_name=>'P229_CDGO_RVCTRIA_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(124172257853769323)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
