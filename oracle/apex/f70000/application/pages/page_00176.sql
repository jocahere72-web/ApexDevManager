prompt --application/pages/page_00176
begin
wwv_flow_api.create_page(
 p_id=>176
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Detalle de Solicitudes Recaudadas'
,p_page_mode=>'MODAL'
,p_step_title=>'Detalle de Solicitudes Recaudadas'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(164066978207707637)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'70%'
,p_last_updated_by=>'JRANGEL'
,p_last_upd_yyyymmddhh24miss=>'20201103170904'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(96948549203876506)
,p_plug_name=>'Liquidaciones pagadas'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(96949700732876518)
,p_plug_name=>'Detalle Solicitudes Recaudadas'
,p_parent_plug_id=>wwv_flow_api.id(96948549203876506)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   a.nmro_rnta,',
'         trunc(a.fcha_rgstro) fcha_rgstro,',
'         a.idntfccion_sjto,',
'         b.nmro_dcmnto,',
'         trunc(b.fcha_dcmnto) fcha_dcmnto,',
'         c.id_rcdo,',
'         trunc(c.fcha_rcdo) fcha_rcdo,',
'         to_char(c.vlor, :F_FRMTO_MNDA) vlor',
'from v_gi_g_rentas     a',
'join re_g_documentos   b on a.id_dcmnto = b.id_dcmnto',
'join re_g_recaudos     c on c.id_orgen  = b.id_dcmnto and c.cdgo_rcdo_orgn_tpo = ''DC''',
'where   a.cdgo_clnte           = :F_CDGO_CLNTE',
'   and  a.id_impsto            = :P176_ID_IMPSTO',
'   and  a.id_impsto_sbmpsto    = :P176_ID_IMPSTO_SBMPSTO',
'   --and  a.indcdor_rnta_pgda  = ''S''',
'   and  b.indcdor_pgo_aplcdo = ''S''',
'   and (trunc(c.fcha_rcdo)>= :P176_FCHA_DSDE or :P176_FCHA_DSDE is null)',
'   and (trunc(c.fcha_rcdo) <= :P176_FCHA_HSTA or :P176_FCHA_HSTA is null)'))
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
 p_id=>wwv_flow_api.id(96950097975876521)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn datos.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JRANGEL'
,p_internal_uid=>96950097975876521
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96950119789876522)
,p_db_column_name=>'NMRO_RNTA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00FAmero Solicitud')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96950290682876523)
,p_db_column_name=>'FCHA_RGSTRO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Fecha Solicitud '
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96950313998876524)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Identificaci\00F3n Sujeto')
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96950424267876525)
,p_db_column_name=>'NMRO_DCMNTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('N\00FAmero Documento de Pago')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96950545150876526)
,p_db_column_name=>'FCHA_DCMNTO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Fecha Documento de Pago'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96950666120876527)
,p_db_column_name=>'ID_RCDO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('N\00FAmero Recaudo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96950708769876528)
,p_db_column_name=>'FCHA_RCDO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Fecha Recaudo'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96950807918876529)
,p_db_column_name=>'VLOR'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Valor Recaudado'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(96982465923670372)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'969825'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_RNTA:FCHA_RGSTRO:IDNTFCCION_SJTO:NMRO_DCMNTO:FCHA_DCMNTO:ID_RCDO:FCHA_RCDO:VLOR'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(96988429671780903)
,p_plug_name=>'Mes'
,p_parent_plug_id=>wwv_flow_api.id(96948549203876506)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>'<H1 align="center"> Recaudos del Mes de &P176_MES. </H1>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P176_MES'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(193499138781547972)
,p_plug_name=>'Total Recaudado'
,p_parent_plug_id=>wwv_flow_api.id(96948549203876506)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(count(a.id_rnta))as vlue',
'     , ''Solicitudes Recaudadas'' as ttlo',
'  from gi_g_rentas     a',
'  join re_g_documentos b on a.id_dcmnto = b.id_dcmnto',
'  join re_g_recaudos   c on c.id_orgen  = b.id_dcmnto and c.cdgo_rcdo_orgn_tpo = ''DC''',
' where   a.cdgo_clnte           = :F_CDGO_CLNTE',
'   and   a.id_impsto            = :P176_ID_IMPSTO',
'   and   a.id_impsto_sbmpsto    = :P176_ID_IMPSTO_SBMPSTO',
'   --and a.indcdor_rnta_pgda  = ''S''',
'   and b.indcdor_pgo_aplcdo = ''S''',
'   and (trunc(c.fcha_rcdo)>= :P176_FCHA_DSDE or :P176_FCHA_DSDE is null)',
'   and (trunc(c.fcha_rcdo) <= :P176_FCHA_HSTA or :P176_FCHA_HSTA is null)',
'union all',
'select to_char(nvl(sum(b.vlor_ttal_dcmnto),0),:F_FRMTO_MNDA) as vlue',
'     , ''Total Recaudado'' as ttlo',
'  from gi_g_rentas     a',
'  join re_g_documentos b on a.id_dcmnto = b.id_dcmnto',
'  join re_g_recaudos   c on c.id_orgen  = b.id_dcmnto and c.cdgo_rcdo_orgn_tpo = ''DC''',
' where   a.cdgo_clnte           = :F_CDGO_CLNTE',
'   and   a.id_impsto            = :P176_ID_IMPSTO',
'   and   a.id_impsto_sbmpsto    = :P176_ID_IMPSTO_SBMPSTO',
'   --and a.indcdor_rnta_pgda  = ''S''',
'   and b.indcdor_pgo_aplcdo = ''S''',
'   and (trunc(c.fcha_rcdo)>= :P176_FCHA_DSDE or :P176_FCHA_DSDE is null)',
'   and (trunc(c.fcha_rcdo) <= :P176_FCHA_HSTA or :P176_FCHA_HSTA is null)'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_ajax_items_to_submit=>'P176_FCHA_DSDE,P176_FCHA_HSTA'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VLUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'TTLO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96948688558876507)
,p_name=>'P176_FCHA_DSDE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(96948549203876506)
,p_prompt=>'<b>Fecha Desde:</b>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P176_MES'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96949374962876514)
,p_name=>'P176_FCHA_HSTA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(96948549203876506)
,p_prompt=>'<b>Fecha Hasta:</b>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_display_when=>'P176_MES'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96949422831876515)
,p_name=>'P176_ID_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(96948549203876506)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96949578376876516)
,p_name=>'P176_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(96948549203876506)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96988285050780901)
,p_name=>'P176_MES'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(96948549203876506)
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P176_MES'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(96988321988780902)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Calcular Fechas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    select to_date(:P176_MES,''MM'')',
'         , last_day(to_date(:P176_MES,''MM''))',
'      into :P176_FCHA_DSDE ',
'         , :P176_FCHA_HSTA',
'      from dual;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P176_MES'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
