prompt --application/pages/page_00199
begin
wwv_flow_api.create_page(
 p_id=>199
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Informaci\00F3n ')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Informaci\00F3n ')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(164066978207707637)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20210316160153'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(63577658194963632)
,p_plug_name=>'<b>Documento de Pago </b>'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P199_ID_RCDO'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(107278371717408206)
,p_plug_name=>'<b>Detalle del Documento</b>'
,p_parent_plug_id=>wwv_flow_api.id(63577658194963632)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(107278460656408207)
,p_plug_name=>'<b>Detalle</b>'
,p_parent_plug_id=>wwv_flow_api.id(107278371717408206)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select vgncia, ',
'        prdo, ',
'        dscrpcion || '' ['' || cdgo_cncpto || '']''  cncpto,',
'        vlor_dbe,',
'        vlor_hber',
'   from v_re_g_documentos_detalle ',
'  where id_dcmnto = (',
'                                select id_orgen',
'                                  from re_g_recaudos',
'                                 where id_rcdo = :P199_ID_RCDO',
'                    )',
' order by id_dcmnto_dtlle'))
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
 p_id=>wwv_flow_api.id(107278505379408208)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'AMOLINA'
,p_internal_uid=>107278505379408208
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(107279436337408217)
,p_db_column_name=>'VGNCIA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(107279573718408218)
,p_db_column_name=>'PRDO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Periodo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(107279662585408219)
,p_db_column_name=>'CNCPTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(107279774183408220)
,p_db_column_name=>'VLOR_DBE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Valor Debe'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(107279803491408221)
,p_db_column_name=>'VLOR_HBER'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Valor Haber'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(107297348795469878)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1072974'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VGNCIA:PRDO:CNCPTO:VLOR_DBE:VLOR_HBER'
,p_sum_columns_on_break=>'VLOR_DBE:VLOR_HBER'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(63578486872963640)
,p_plug_name=>'<b>Recaudo</b>'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P199_ID_RCDO'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(107278202855408205)
,p_plug_name=>'<b>Detalle del Recaudo </b>'
,p_parent_plug_id=>wwv_flow_api.id(63578486872963640)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(63578970911963645)
,p_plug_name=>'<b>Detalle</b>'
,p_parent_plug_id=>wwv_flow_api.id(107278202855408205)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.vgncia as "Vigencia"',
'      , a.prdo as "Periodo"',
'      , a.cdgo_cncpto as "Codigo Concepto"',
'      , initcap(a.dscrpcion_cncpto) as "Concepto"',
'      , a.vlor_cptal as "Valor Capital"',
'      , a.vlor_intres as "Valor Interes"',
'      , a.vlor_sldo_fvor as "Valor Saldo a Favor"',
'      , a.vlor_ttal as "Valor Total"',
'   from v_re_g_recaudos_detalle a',
'  where a.id_rcdo = :P199_ID_RCDO'))
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
 p_id=>wwv_flow_api.id(63579066838963646)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'AMOLINA'
,p_internal_uid=>63579066838963646
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(63579190386963647)
,p_db_column_name=>'Vigencia'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(63579203760963648)
,p_db_column_name=>'Periodo'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Periodo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(63579307818963649)
,p_db_column_name=>'Codigo Concepto'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Codigo Concepto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(63579453384963650)
,p_db_column_name=>'Concepto'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(107277829402408201)
,p_db_column_name=>'Valor Capital'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Valor Capital'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(107277989535408202)
,p_db_column_name=>'Valor Interes'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Valor Interes'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(107278009254408203)
,p_db_column_name=>'Valor Saldo a Favor'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Valor Saldo A Favor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(107278127540408204)
,p_db_column_name=>'Valor Total'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Valor Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(107285502532410903)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1072856'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'Vigencia:Periodo:Codigo Concepto:Concepto:Valor Capital:Valor Interes:Valor Saldo a Favor:Valor Total'
,p_sum_columns_on_break=>'Valor Total'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(107280083978408223)
,p_plug_name=>unistr('<b>Liquidaci\00F3n </b>')
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P199_ID_LQDCION'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(107281474610408237)
,p_plug_name=>'<b>Detalle</b>'
,p_parent_plug_id=>wwv_flow_api.id(107280083978408223)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(107281569712408238)
,p_plug_name=>'Detalle '
,p_parent_plug_id=>wwv_flow_api.id(107281474610408237)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select a.cdgo_cncpto',
'       , a.dscrpcion_cncpto',
'       , a.bse_cncpto',
'       , (a.trfa) * 100 as Tarifa',
'       , a.vlor_lqddo               ',
'    from v_gi_g_liquidaciones_concepto a',
'   where a.id_lqdcion = :P199_ID_LQDCION'))
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
 p_id=>wwv_flow_api.id(107281696293408239)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'AMOLINA'
,p_internal_uid=>107281696293408239
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(107281768034408240)
,p_db_column_name=>'CDGO_CNCPTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('C\00F3digo Concepto')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(107281829680408241)
,p_db_column_name=>'DSCRPCION_CNCPTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Concepto '
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(107281951455408242)
,p_db_column_name=>'BSE_CNCPTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Concepto Base '
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(107282077424408243)
,p_db_column_name=>'TARIFA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Tarifa'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(107282108876408244)
,p_db_column_name=>'VLOR_LQDDO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Valor Liquidado '
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(107324939519609656)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1073250'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CDGO_CNCPTO:DSCRPCION_CNCPTO:BSE_CNCPTO:TARIFA:VLOR_LQDDO'
,p_sum_columns_on_break=>'VLOR_LQDDO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63577779213963633)
,p_name=>'P199_NMRO_DCMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(63577658194963632)
,p_prompt=>'Numero '
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63577810820963634)
,p_name=>'P199_FCHA_DCMNTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(63577658194963632)
,p_prompt=>'Fecha '
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63577921264963635)
,p_name=>'P199_VLOR_DCMNTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(63577658194963632)
,p_prompt=>'Valor'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63578012002963636)
,p_name=>'P199_PGO_APLCDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(63577658194963632)
,p_prompt=>unistr('\00BFPago Aplicado?')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63578108943963637)
,p_name=>'P199_ID_RCDO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(63577658194963632)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63578596034963641)
,p_name=>'P199_FCHA_RCDO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(63578486872963640)
,p_prompt=>'Fecha '
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63578625092963642)
,p_name=>'P199_VLOR_RCDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(63578486872963640)
,p_prompt=>'Valor'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63578720489963643)
,p_name=>'P199_ESTDO_RCDO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(63578486872963640)
,p_prompt=>'Estado '
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63578831412963644)
,p_name=>'P199_FCHA_APLCCIO_RCDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(63578486872963640)
,p_prompt=>unistr('Fecha Aplicaci\00F3n ')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107280140061408224)
,p_name=>'P199_ID_LQDCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(107280083978408223)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107280278996408225)
,p_name=>'P199_TTLO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(107280083978408223)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107280758120408230)
,p_name=>'P199_NMRO_LQDCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(107280083978408223)
,p_prompt=>'Numero '
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107280846374408231)
,p_name=>'P199_VGNCIA_LQDCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(107280083978408223)
,p_prompt=>'Vigencia '
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107280976815408232)
,p_name=>'P199_PRDO_LQDCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(107280083978408223)
,p_prompt=>'Periodo '
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107281061825408233)
,p_name=>'P199_FCHA_LQDCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(107280083978408223)
,p_prompt=>'Fecha '
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107281104834408234)
,p_name=>'P199_VLOR_LQDCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(107280083978408223)
,p_prompt=>'Valor'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107281215581408235)
,p_name=>'P199_ESTDO_LQDCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(107280083978408223)
,p_prompt=>'Estado'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(63578282651963638)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Datos '
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    -- Consulta los datos del documento',
'    select nmro_dcmnto',
'         , trunc(fcha_dcmnto)',
unistr('         , decode(indcdor_pgo_aplcdo, ''S'', ''S\00ED'', ''No'')'),
'         , to_char(vlor_ttal_dcmnto, :F_FRMTO_MNDA)',
'      into :P199_NMRO_DCMNTO',
'         , :P199_FCHA_DCMNTO',
'         , :P199_PGO_APLCDO',
'         , :P199_VLOR_DCMNTO',
'      from re_g_documentos',
'     where id_dcmnto = (',
'                                select id_orgen',
'                                  from re_g_recaudos',
'                                 where id_rcdo = :P199_ID_RCDO',
'                        );',
'',
'        -- Consulta datos del Recaudo',
'        select trunc(fcha_rcdo)',
'             , to_char(vlor, :F_FRMTO_MNDA)',
'             , trunc(fcha_apliccion)',
'             , dscrpcion_rcdo_estdo',
'          into :P199_FCHA_RCDO',
'             , :P199_VLOR_RCDO',
'             , :P199_FCHA_APLCCIO_RCDO',
'             , :P199_ESTDO_RCDO',
'          from v_re_g_recaudos',
'         where id_rcdo = :P199_ID_RCDO;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P199_ID_RCDO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(107281314219408236)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar liquidaci\00F3n ')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'select a.vgncia,',
'       a.prdo,',
'       to_char( a.fcha_lqdcion , ''DD/MM/YYYY'' ) as fcha_lqdcion,',
'       to_char(a.vlor_ttal, :F_FRMTO_MNDA),',
'       a.dscrpcion_lqdcion_estdo,',
'       a.id_lqdcion',
'  into :P199_VGNCIA_LQDCION',
'     , :P199_PRDO_LQDCION',
'     , :P199_FCHA_LQDCION',
'     , :P199_VLOR_LQDCION',
'     , :P199_ESTDO_LQDCION',
'     , :P199_NMRO_LQDCION',
'  from v_gi_g_liquidaciones a',
' where a.id_lqdcion = :P199_ID_LQDCION;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P199_ID_LQDCION'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
