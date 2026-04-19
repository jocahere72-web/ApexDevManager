prompt --application/pages/page_00123
begin
wwv_flow_api.create_page(
 p_id=>123
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Cuotas Convenios'
,p_page_mode=>'MODAL'
,p_step_title=>'Cuotas Vencidas'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177320258117050591)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'90%'
,p_last_updated_by=>'1048292205'
,p_last_upd_yyyymmddhh24miss=>'20191016101517'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85904160841345747)
,p_plug_name=>'Detalle Cuotas Vencidas'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmro_cnvnio nmro',
'      ,to_char(sum(a.vlor_ttal), :F_FRMTO_MNDA) vlor_ttal',
'      ,to_char(b.ttal_cnvnio, :F_FRMTO_MNDA)ttal_cnvnio',
'      ,to_char(b.fcha_aplccion, ''DD/MM/YYYY'')fcha_aplccion',
'      ,to_char(a.fcha_vncmnto, ''DD/MM/YYYY'') fcha_vncmnto',
'      ,b.nmbre_impsto',
'      ,b.nmbre_impsto_sbmpsto',
'      ,b.idntfccion_sjto',
'      ,b.dscrpcion_cnvnio_tpo',
'      ,a.id_cnvnio_extrcto',
'      ,a.nmro_cta',
'     from gf_g_convenios_extracto a',
'     join v_gf_g_convenios b on a.id_cnvnio = b.id_cnvnio',
'    where b.cdgo_clnte = :F_CDGO_CLNTE and a.indcdor_cta_pgda = ''N''',
'      and trunc(sysdate) > trunc(a.fcha_vncmnto)',
'      and b.cdgo_cnvnio_estdo = ''APL''',
'    and fcha_aplccion between :P123_FCHA_INCIAL and :P123_FCHA_FNAL',
'group by b.nmro_cnvnio, b.ttal_cnvnio, b.fcha_aplccion, to_char(a.fcha_vncmnto, ''DD/MM/YYYY''), b.nmbre_impsto,',
'        b.nmbre_impsto_sbmpsto, b.idntfccion_sjto, b.dscrpcion_cnvnio_tpo, a.id_cnvnio_extrcto, a.nmro_cta',
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
 p_id=>wwv_flow_api.id(85904275104345748)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LOBREDOR'
,p_internal_uid=>85904275104345748
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23953813216187009)
,p_db_column_name=>'NMRO'
,p_display_order=>10
,p_column_identifier=>'R'
,p_column_label=>unistr('N\00B0 Acuerdo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23953934703187010)
,p_db_column_name=>'TTAL_CNVNIO'
,p_display_order=>20
,p_column_identifier=>'S'
,p_column_label=>'Total Acuerdo'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23954329279187014)
,p_db_column_name=>'FCHA_VNCMNTO'
,p_display_order=>60
,p_column_identifier=>'W'
,p_column_label=>'Fecha Vencimiento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23954431413187015)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>70
,p_column_identifier=>'X'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23909903184839506)
,p_db_column_name=>'FCHA_APLCCION'
,p_display_order=>90
,p_column_identifier=>'AB'
,p_column_label=>unistr('Fecha Aplicaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23910091169839507)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>100
,p_column_identifier=>'AC'
,p_column_label=>'Sub - Tributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23910122509839508)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>110
,p_column_identifier=>'AD'
,p_column_label=>'Sujeto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23910284197839509)
,p_db_column_name=>'DSCRPCION_CNVNIO_TPO'
,p_display_order=>120
,p_column_identifier=>'AE'
,p_column_label=>'Tipo Acuerdo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23910320319839510)
,p_db_column_name=>'ID_CNVNIO_EXTRCTO'
,p_display_order=>130
,p_column_identifier=>'AF'
,p_column_label=>'Id Cnvnio Extrcto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23910439481839511)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>140
,p_column_identifier=>'AG'
,p_column_label=>'Total Vencidas'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23955596934187026)
,p_db_column_name=>'NMRO_CTA'
,p_display_order=>150
,p_column_identifier=>'AH'
,p_column_label=>unistr('N\00B0 Cuota')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(86040877697897999)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'860409'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO:NMRO_CTA:NMBRE_IMPSTO:NMBRE_IMPSTO_SBMPSTO:IDNTFCCION_SJTO:DSCRPCION_CNVNIO_TPO:FCHA_APLCCION:FCHA_VNCMNTO:VLOR_TTAL:TTAL_CNVNIO:'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23910549315839512)
,p_name=>'P123_FCHA_FNAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(85904160841345747)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23910670840839513)
,p_name=>'P123_FCHA_INCIAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(85904160841345747)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(86032626297896713)
,p_process_sequence=>10
,p_process_point=>'BEFORE_FOOTER'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Borrar Sesion'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
