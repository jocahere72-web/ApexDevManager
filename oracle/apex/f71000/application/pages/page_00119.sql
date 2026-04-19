prompt --application/pages/page_00119
begin
wwv_flow_api.create_page(
 p_id=>119
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Tipos de Convenios'
,p_page_mode=>'MODAL'
,p_step_title=>'Tipos de Acuerdo de Pago'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177320258117050591)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'90%'
,p_last_updated_by=>'LOBREDOR'
,p_last_upd_yyyymmddhh24miss=>'20191230114321'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(83348638956436014)
,p_plug_name=>'Parametros'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85698249352401907)
,p_plug_name=>'Panel Convenios'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85698301441401908)
,p_plug_name=>'Detalle Convenios'
,p_parent_plug_id=>wwv_flow_api.id(85698249352401907)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.nmro_cnvnio nmro,',
'       to_char(c.vlor_cta_incial, :F_FRMTO_MNDA) cta_incial,',
'       to_char(c.ttal_cnvnio, :F_FRMTO_MNDA) ttal_cnvnio, ',
'       c.fcha_slctud,',
'       c.fcha_mxma_ctas,',
'       c.fcha_rvctoria,',
'       c.nmbre_impsto,',
'       c.nmbre_impsto_sbmpsto,',
'       c.dscrpcion_cnvnio_tpo tpo, ',
'       c.dscrpcion_cnvnio_estdo estdo',
'  from v_gf_g_convenios c ',
' where c.cdgo_clnte = :F_CDGO_CLNTE ',
'   and c.cdgo_cnvnio_estdo = :P119_ESTDO',
'   and ((trunc(c.fcha_slctud) between :P119_FECHA_INICIAL and :P119_FECHA_FINAL)',
'                                     or ((trunc(c.fcha_slctud) >= :P119_FECHA_INICIAL and :P119_FECHA_FINAL is null))',
'                                     or (trunc(c.fcha_slctud) <= :P119_FECHA_FINAL and :P119_FECHA_INICIAL  is null)',
'                                     or (:P119_FECHA_INICIAL is null and :P119_FECHA_FINAL is null ))',
'   and c.id_cnvnio_tpo = :P119_TPO           ',
'order by c.fcha_slctud'))
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
 p_id=>wwv_flow_api.id(85903072479345736)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LOBREDOR'
,p_internal_uid=>85903072479345736
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85903178554345737)
,p_db_column_name=>'NMRO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00B0 Acuerdo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85903672457345742)
,p_db_column_name=>'FCHA_RVCTORIA'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Fecha Revocatoria'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_condition=>'P118_ESTDO'
,p_display_condition2=>'RVC'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85903759398345743)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85903866315345744)
,p_db_column_name=>'TPO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Tipo de Acuerdo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85903926282345745)
,p_db_column_name=>'ESTDO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Estado de Acuerdo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86624672836452931)
,p_db_column_name=>'CTA_INCIAL'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Cuota Inicial'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86624758678452932)
,p_db_column_name=>'TTAL_CNVNIO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Total Acuerdo'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3470870677156607)
,p_db_column_name=>'FCHA_SLCTUD'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Fcha Slctud'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3470917114156608)
,p_db_column_name=>'FCHA_MXMA_CTAS'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>unistr('Fecha M\00E1xima')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3471066181156609)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Sub - Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(86022453458869225)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'860225'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO:NMBRE_IMPSTO:NMBRE_IMPSTO_SBMPSTO:TPO:FCHA_MXMA_CTAS:ESTDO:CTA_INCIAL:TTAL_CNVNIO:'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83348747043436015)
,p_name=>'P119_FECHA_INICIAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(83348638956436014)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(85698034052401905)
,p_name=>'P119_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(83348638956436014)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(85698133146401906)
,p_name=>'P119_ESTDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(83348638956436014)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(85699970931401924)
,p_name=>'P119_FECHA_FINAL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(83348638956436014)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
