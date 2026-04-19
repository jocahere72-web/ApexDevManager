prompt --application/pages/page_00127
begin
wwv_flow_api.create_page(
 p_id=>127
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Acuerdos Pago Cuota M\00E1xima')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Acuerdos Pago Cuota M\00E1xima')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177320258117050591)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'90%'
,p_last_updated_by=>'LOBREDOR'
,p_last_upd_yyyymmddhh24miss=>'20191016120247'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86625850233452943)
,p_plug_name=>'Detalle'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.nmro_cnvnio nmro,',
'       to_char(c.vlor_cta_incial, :F_FRMTO_MNDA) cta_incial,',
'       to_char(c.ttal_cnvnio, :F_FRMTO_MNDA) ttal_cnvnio, ',
'       c.fcha_slctud,',
'       c.fcha_mxma_ctas,',
'       c.fcha_rvctoria,',
'       c.dscrpcion_cnvnio_tpo tpo, ',
'       c.dscrpcion_cnvnio_estdo estdo,',
'       c.nmbre_impsto,',
'       c.nmbre_impsto_sbmpsto,',
'       c.idntfccion_sjto_frmtda',
'   from v_gf_g_convenios c',
'   where c.cdgo_clnte = :F_CDGO_CLNTE ',
'     and ((trunc(c.fcha_slctud) between :P127_FECHA_INICIAL and :P127_FECHA_FINAL)',
'           or ((trunc(c.fcha_slctud) >= :P127_FECHA_INICIAL and :P127_FECHA_FINAL   is null))',
'           or (trunc(c.fcha_slctud)  <= :P127_FECHA_FINAL   and :P127_FECHA_INICIAL is null)',
'           or (:P127_FECHA_INICIAL is null and :P127_FECHA_FINAL is null))',
'     and c.cdgo_cnvnio_estdo = ''APL''',
'     and c.id_cnvnio_tpo = :P127_TPO',
'     and c.nmro_cta = :P127_CTA',
'order by c.fcha_slctud'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P127_FECHA_INICIAL,P127_FECHA_FINAL,P127_TPO,P127_CTA'
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
 p_id=>wwv_flow_api.id(86625912765452944)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LOBREDOR'
,p_internal_uid=>86625912765452944
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86626063939452945)
,p_db_column_name=>'NMRO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00FAmero Acuerdo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86626150002452946)
,p_db_column_name=>'CTA_INCIAL'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Cuota Inicial'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86626237531452947)
,p_db_column_name=>'TTAL_CNVNIO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Total Acuerdo'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(87136127444567301)
,p_db_column_name=>'TPO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Tipo de Acuerdo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(87136285127567302)
,p_db_column_name=>'ESTDO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Estado de Acuerdo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3471643760156615)
,p_db_column_name=>'FCHA_SLCTUD'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Fcha Slctud'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3471789530156616)
,p_db_column_name=>'FCHA_MXMA_CTAS'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('Fecha <br> M\00E1xima')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3471856564156617)
,p_db_column_name=>'FCHA_RVCTORIA'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Fcha Rvctoria'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3472791733156626)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3472826940156627)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Sub - Tributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3472973278156628)
,p_db_column_name=>'IDNTFCCION_SJTO_FRMTDA'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Sujeto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(87144074269568197)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'871441'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO:NMBRE_IMPSTO:NMBRE_IMPSTO_SBMPSTO:IDNTFCCION_SJTO_FRMTDA:TPO:FCHA_MXMA_CTAS:ESTDO:CTA_INCIAL:TTAL_CNVNIO:'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86625477798452939)
,p_name=>'P127_FECHA_INICIAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(86625850233452943)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86625559105452940)
,p_name=>'P127_FECHA_FINAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(86625850233452943)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86625669835452941)
,p_name=>'P127_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(86625850233452943)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86625773850452942)
,p_name=>'P127_CTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(86625850233452943)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
