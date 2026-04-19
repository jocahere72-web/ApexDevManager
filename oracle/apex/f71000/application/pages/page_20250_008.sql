prompt --application/pages/page_20250_008
begin
wwv_flow_api.create_page(
 p_id=>2025041
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Detalle de Descuentos Otorgados'
,p_page_mode=>'MODAL'
,p_step_title=>'Detalle de Descuentos Otorgados'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'60%'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250917112659'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2877324909735930)
,p_plug_name=>'&P2025041_RGLA.'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'WITH detalles_documento AS',
' (SELECT /*+ MATERIALIZE */',
'   id_dcmnto,',
'   vgncia,',
'   cdgo_cncpto_tpo,',
'   vlor_hber,',
'   vlor_dbe,',
'   id_dscnto_rgla,',
'   id_sjto_impsto,',
'   fcha_dcmnto,',
'   nmro_dcmnto',
'    FROM v_re_g_documentos_detalle',
'   WHERE id_dcmnto = :P2025041_ID_DCMNTO),',
'recaudo_agregado AS',
' (SELECT a.id_rcdo, a.vgncia, SUM(a.vlor_ttal) AS vlor_ttal',
'    FROM v_re_g_recaudos_detalle a',
'    JOIN re_g_recaudos r',
'      ON a.id_rcdo = r.id_rcdo',
'   WHERE r.id_orgen = :P2025041_ID_DCMNTO',
'   GROUP BY a.id_rcdo, a.vgncia)',
unistr('SELECT a.idntfccion_sjto AS "Identificaci\00F3n Sujeto",'),
'       a.vgncia AS "Vigencia",',
'       a.valor AS "Valor Descuento",',
'       b.capital AS "Valor Capital",',
'       nvl(c.interes, 0) AS "Valor Interes",',
'       d.vlor_ttal AS "Valor Pagado"',
'  FROM (SELECT si.idntfccion_sjto,',
'               det.id_dcmnto,',
'               det.vgncia,',
'               rg.dscrpcion,',
'               TRUNC(det.fcha_dcmnto) AS fcha_dcmnto,',
'               SUM(det.vlor_hber) AS valor,',
'               rec.id_rcdo',
'          FROM detalles_documento det',
'          JOIN v_re_g_recaudos rec',
'            ON rec.id_orgen = det.id_dcmnto',
'           AND rec.cdgo_rcdo_estdo = ''AP''',
'          JOIN re_g_descuentos_regla rg',
'            ON det.id_dscnto_rgla = rg.id_dscnto_rgla',
'          JOIN v_si_i_sujetos_impuesto si',
'            ON det.id_sjto_impsto = si.id_sjto_impsto',
'         WHERE det.cdgo_cncpto_tpo = ''D''',
'           AND det.id_dscnto_rgla = :P2025041_RGLA',
'         GROUP BY si.idntfccion_sjto,',
'                  det.id_dcmnto,',
'                  det.vgncia,',
'                  rg.dscrpcion,',
'                  TRUNC(det.fcha_dcmnto),',
'                  rec.id_rcdo) a',
'  LEFT JOIN (SELECT id_dcmnto, vgncia, SUM(vlor_dbe) AS capital',
'               FROM detalles_documento',
'              WHERE cdgo_cncpto_tpo = ''C''',
'              GROUP BY id_dcmnto, vgncia) b',
'    ON a.id_dcmnto = b.id_dcmnto',
'   AND a.vgncia = b.vgncia',
'  LEFT JOIN (SELECT id_dcmnto, vgncia, SUM(vlor_dbe) AS interes',
'               FROM detalles_documento',
'              WHERE cdgo_cncpto_tpo = ''I''',
'              GROUP BY id_dcmnto, vgncia) c',
'    ON a.id_dcmnto = c.id_dcmnto',
'   AND a.vgncia = c.vgncia',
'  JOIN recaudo_agregado d',
'    ON a.id_rcdo = d.id_rcdo',
'   AND a.vgncia = d.vgncia',
' ORDER BY a.fcha_dcmnto, a.idntfccion_sjto, a.vgncia DESC'))
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
 p_id=>wwv_flow_api.id(2877430913735931)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'DBALDOVINO'
,p_internal_uid=>2877430913735931
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2877510084735932)
,p_db_column_name=>unistr('Identificaci\00F3n Sujeto')
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Identificaci\00F3n Sujeto')
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2877679873735933)
,p_db_column_name=>'Vigencia'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2877772900735934)
,p_db_column_name=>'Valor Descuento'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Valor Descuento'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'FML999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2877895586735935)
,p_db_column_name=>'Valor Capital'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Valor Capital'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'FML999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2877984284735936)
,p_db_column_name=>'Valor Interes'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Valor Inter\00E9s')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'FML999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2878757714735944)
,p_db_column_name=>'Valor Pagado'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Valor Pagado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'FML999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(2912524940287785)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'29126'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'Vigencia:Valor Capital:Valor Interes:Valor Descuento::Valor Pagado'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2878176589735938)
,p_name=>'P2025041_ID_DCMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2877324909735930)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2878277256735939)
,p_name=>'P2025041_RGLA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(2877324909735930)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
