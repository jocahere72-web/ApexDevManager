prompt --application/pages/page_00016
begin
wwv_flow_api.create_page(
 p_id=>16
,p_user_interface_id=>wwv_flow_api.id(22508582753660970)
,p_name=>'Recaudo'
,p_page_mode=>'NON_MODAL'
,p_step_title=>'Recaudo'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_dialog_width=>'1024'
,p_dialog_max_width=>'1024'
,p_dialog_chained=>'N'
,p_last_updated_by=>'DBALDOVINO'
,p_last_upd_yyyymmddhh24miss=>'20260206104831'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24850016152688408)
,p_plug_name=>'Recaudo'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52128439135074801)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select a."N\00B0 Documento",'),
'       a."Tipo de Origen",',
'       a."Fecha de Recaudo",',
'       a."Valor Recaudo",',
'       a."Fecha de Aplicacion",',
'       a."Observacion",',
'       a."Estado",',
'       a.id_rcdo,',
'       a.id_rcdo_cntrol,',
'       trunc(a.fcha_vncmnto) as "Fecha de Vencimiento",',
'       case',
'         when trunc(a.fcha_rcdo) > trunc(a.fcha_vncmnto) then',
unistr('          ''S\00ED'''),
'         else',
'          ''No''',
unistr('       end as "Pago Extempor\00E1neo",'),
'       nmbre_bnco Banco,',
'       nmro_cnta Cuenta,',
'       dscrpcion_rcdo_orgen_cntrol,',
'       pgdor,',
'        case when s.id_adjnto is not null then ''<center><span class="fa fa-eye"></span></center>'' end ver  , s.id_adjnto   --REQ0029193',
unistr('  from (select a.nmro_dcmnto as "N\00B0 Documento",'),
'               a.dscrpcion_rcdo_orgn_tpo as "Tipo de Origen",',
'               trunc(a.fcha_rcdo) as "Fecha de Recaudo",',
'               a.vlor as "Valor Recaudo",',
'               trunc(a.fcha_apliccion) as "Fecha de Aplicacion",',
'               a.obsrvcion as "Observacion",',
'               a.dscrpcion_rcdo_estdo as "Estado",',
'               a.id_rcdo,',
'               case',
'                 when a.cdgo_rcdo_orgn_tpo = ''DC'' then',
'                  (select d.fcha_vncmnto',
'                     from re_g_documentos d',
'                    where d.id_dcmnto = a.id_orgen)',
'                 when a.cdgo_rcdo_orgn_tpo = ''DL'' then',
'                  (select d.fcha_prsntcion_pryctda',
'                     from gi_g_declaraciones d',
'                    where d.id_dclrcion = a.id_orgen)',
'               end as fcha_vncmnto,',
'               a.fcha_rcdo,',
'               c.nmbre_bnco,',
'               c.nmro_cnta,',
'               a.id_rcdo_cntrol,',
'               a.dscrpcion_rcdo_orgen_cntrol,',
'               e.idntfccion||'' - ''||e.prmer_nmbre ||decode(d.prcntje_prtcpcion,null,'''','' - ''||d.prcntje_prtcpcion||''%'') pgdor',
'          from v_re_g_recaudos a',
'          join v_re_g_recaudos_control c',
'            on c.id_rcdo_cntrol = a.id_rcdo_cntrol',
'          left join re_g_documentos d',
'            on d.id_dcmnto = a.id_orgen',
'           and a.cdgo_rcdo_orgn_tpo = ''DC''',
'          left join si_i_sujetos_responsable e',
'            on e.id_sjto_impsto = a.id_sjto_impsto',
'           and e.idntfccion = d.idntfccion',
'           and a.cdgo_rcdo_orgn_tpo = ''DC''',
'         where a.id_sjto_impsto = :P16_ID_SJTO_IMPSTO',
'           and a.cdgo_rcdo_estdo in (''AP'', ''RG'')',
'         order by a.cdgo_rcdo_estdo, a.nmro_dcmnto) a',
'     left join gn_g_adjuntos s on a.id_rcdo = s.id_orgen and cdgo_prcso = ''REC'' --REQ0029193',
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
 p_id=>wwv_flow_api.id(24850177689688409)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No hay datos disponibles'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:RP,17:P17_ID_RCDO:#ID_RCDO#'
,p_detail_link_text=>'<center><span class="fa fa-eye" aria-hidden="true"></span></center>'
,p_owner=>'JCUAO'
,p_internal_uid=>24850177689688409
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24850222085688410)
,p_db_column_name=>unistr('N\00B0 Documento')
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00B0 Documento')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24850336955688411)
,p_db_column_name=>'Tipo de Origen'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tipo De Origen'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24850553541688413)
,p_db_column_name=>'Valor Recaudo'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Valor Recaudo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24850753358688415)
,p_db_column_name=>'Observacion'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Observacion'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24850879505688416)
,p_db_column_name=>'Estado'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24850950181688417)
,p_db_column_name=>'ID_RCDO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Id Rcdo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(49245302682622708)
,p_db_column_name=>unistr('Pago Extempor\00E1neo')
,p_display_order=>110
,p_column_identifier=>'L'
,p_column_label=>unistr('Pago Extempor\00E1neo')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(49245407427622709)
,p_db_column_name=>'BANCO'
,p_display_order=>120
,p_column_identifier=>'M'
,p_column_label=>'Banco'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(49245526590622710)
,p_db_column_name=>'CUENTA'
,p_display_order=>130
,p_column_identifier=>'N'
,p_column_label=>'Cuenta'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94611375074345506)
,p_db_column_name=>'ID_RCDO_CNTROL'
,p_display_order=>140
,p_column_identifier=>'O'
,p_column_label=>'Id Rcdo Cntrol'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94611408666345507)
,p_db_column_name=>'DSCRPCION_RCDO_ORGEN_CNTROL'
,p_display_order=>150
,p_column_identifier=>'P'
,p_column_label=>'Origen'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21500530510453904)
,p_db_column_name=>'Fecha de Recaudo'
,p_display_order=>160
,p_column_identifier=>'Q'
,p_column_label=>'Fecha De Recaudo'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21500628543453905)
,p_db_column_name=>'Fecha de Aplicacion'
,p_display_order=>170
,p_column_identifier=>'R'
,p_column_label=>'Fecha De Aplicacion'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21500718944453906)
,p_db_column_name=>'Fecha de Vencimiento'
,p_display_order=>180
,p_column_identifier=>'S'
,p_column_label=>'Fecha De Vencimiento'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(89959107378975901)
,p_db_column_name=>'PGDOR'
,p_display_order=>190
,p_column_identifier=>'T'
,p_column_label=>'Pagador'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16935190502508531)
,p_db_column_name=>'VER'
,p_display_order=>200
,p_column_identifier=>'U'
,p_column_label=>'Evidencia'
,p_column_link=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR,P127_COLUMNA_BFILE:GN_G_ADJUNTOS,FILE_BLOB,FILE_NAME,FILE_MIMETYPE,ID_ADJNTO,#ID_ADJNTO#,FILE_B'
||'FILE'
,p_column_linktext=>'#VER#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16935234447508532)
,p_db_column_name=>'ID_ADJNTO'
,p_display_order=>210
,p_column_identifier=>'V'
,p_column_label=>'Id Adjnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(24927259344922453)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'249273'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('N\00B0 Documento:Tipo de Origen:Fecha de Recaudo:Fecha de Aplicacion:Fecha de Vencimiento:Valor Recaudo:Observacion:Estado:Pago Extempor\00E1neo:BANCO:CUENTA:DSCRPCION_RCDO_ORGEN_CNTROL::PGDOR:VER:ID_ADJNTO')
,p_sort_column_1=>'Fecha de Recaudo'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(122382427469365479)
,p_plug_name=>'&P16_DSCRPCION.'
,p_icon_css_classes=>'&P16_ICNO.'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52124852663074800)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24905053449895455)
,p_name=>'P16_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(122382427469365479)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24905448884895458)
,p_name=>'P16_ICNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(122382427469365479)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24905881753895459)
,p_name=>'P16_DSCRPCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(122382427469365479)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
