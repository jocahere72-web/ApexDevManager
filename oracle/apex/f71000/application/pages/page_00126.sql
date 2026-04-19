prompt --application/pages/page_00126
begin
wwv_flow_api.create_page(
 p_id=>126
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Acuerdo de Pago por Tributo'
,p_page_mode=>'MODAL'
,p_step_title=>'Acuerdo de Pago por Tributo'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177320258117050591)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'90%'
,p_last_updated_by=>'LOBREDOR'
,p_last_upd_yyyymmddhh24miss=>'20191016115610'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86609414874327701)
,p_plug_name=>'Acuerdo de Pago por Tributo'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select c.nmro_cnvnio,',
'          c.fcha_aplccion,',
'          c.dscrpcion_cnvnio_estdo,',
'          c.dscrpcion_cnvnio_tpo,',
'          c.nmbre_impsto,',
'          c.nmbre_impsto_sbmpsto,',
'          c.idntfccion_sjto_frmtda,',
'          to_char(c.ttal_cnvnio, :F_FRMTO_MNDA) ttal_cnvnio,',
'          to_char(c.vlor_cta_incial, :F_FRMTO_MNDA) ttal_cta_incial',
'     from v_gf_g_convenios c',
'    where c.cdgo_clnte = :F_CDGO_CLNTE and c.id_impsto = :P126_IMPUESTO',
'      and ((trunc(c.fcha_slctud) between :P126_FECHA_INICIAL and :P126_FECHA_FINAL)',
'            or ((trunc(c.fcha_slctud) >= :P126_FECHA_INICIAL and :P126_FECHA_FINAL is null))',
'            or (trunc(c.fcha_slctud) <= :P126_FECHA_FINAL and :P126_FECHA_INICIAL  is null)',
'            or (:P126_FECHA_INICIAL is null and :P126_FECHA_FINAL is null ))',
'      and c.cdgo_cnvnio_estdo = ''APL''      ',
' order by c.id_cnvnio'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P126_FECHA_INICIAL,P126_FECHA_FINAL,P126_IMPUESTO'
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
 p_id=>wwv_flow_api.id(86623823309452923)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LOBREDOR'
,p_internal_uid=>86623823309452923
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86623996973452924)
,p_db_column_name=>'NMRO_CNVNIO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00FAmero Acuerdo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86624167287452926)
,p_db_column_name=>'DSCRPCION_CNVNIO_ESTDO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Estado '
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86624249729452927)
,p_db_column_name=>'DSCRPCION_CNVNIO_TPO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Tipo Acuerdo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86624364133452928)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86624416550452929)
,p_db_column_name=>'TTAL_CNVNIO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Total Acuerdo'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86624537863452930)
,p_db_column_name=>'TTAL_CTA_INCIAL'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Cuota Inicial'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3472450056156623)
,p_db_column_name=>'FCHA_APLCCION'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Fecha'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3472587501156624)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Sub - Tributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3472630874156625)
,p_db_column_name=>'IDNTFCCION_SJTO_FRMTDA'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Sujeto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(86773499747846052)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'867735'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_CNVNIO:NMBRE_IMPSTO:NMBRE_IMPSTO_SBMPSTO:IDNTFCCION_SJTO_FRMTDA:DSCRPCION_CNVNIO_TPO:FCHA_APLCCION:DSCRPCION_CNVNIO_ESTDO:TTAL_CTA_INCIAL:TTAL_CNVNIO:'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86609534196327702)
,p_name=>'P126_FECHA_INICIAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(86609414874327701)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86609688253327703)
,p_name=>'P126_IMPUESTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(86609414874327701)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86609725669327704)
,p_name=>'P126_FECHA_FINAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(86609414874327701)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
