prompt --application/pages/page_00020
begin
wwv_flow_api.create_page(
 p_id=>20
,p_user_interface_id=>wwv_flow_api.id(71889596252951620)
,p_name=>'Panel de Control PQR'
,p_page_mode=>'MODAL'
,p_step_title=>'Panel de Control PQR'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'LOBREDOR'
,p_last_upd_yyyymmddhh24miss=>'20191023145613'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(23909653502839503)
,p_plug_name=>'Panel de control PQR'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71814488075951563)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select s.cdgo_clnte,',
'       s.nmro_rdcdo_dsplay,',
'       initcap(upper(r.prmer_nmbre || '' '' || r.prmer_aplldo)) nmbre_rdcdor,',
'       m.dscrpcion,',
'       e.dscrpcion dscrpcion_estdo,',
'       sms.idntfccion,',
'       i.nmbre_impsto,',
'       i.nmbre_impsto_sbmpsto,',
'       s.fcha_rdcdo,',
'       s.fcha_pryctda,',
'       s.fcha_real,',
'       s.id_instncia_fljo,',
'       rs.dscrpcion dscrpcion_rspsta,',
'       t.dscrpcion tipo',
'     from pq_g_solicitudes              s',
'     join pq_d_tipos                    t   on t.id_tpo = s.id_tpo',
'     join v_sg_g_usuarios               u   on u.id_usrio = s.id_usrio',
'     join pq_d_estados                  e   on e.id_estdo = s.id_estdo',
'     join pq_g_radicador                r   on r.id_rdcdor = s.id_rdcdor',
'     join pq_g_solicitudes_motivo       sm  on sm.id_slctud = s.id_slctud',
'     join pq_d_motivos                  m   on m.id_mtvo = sm.id_mtvo',
'     join pq_g_slctdes_mtvo_sjt_impst   sms on sms.id_slctud_mtvo = sm.id_slctud_mtvo',
'     join pq_d_presentaciones_tipo      p   on p.id_prsntcion_tpo = s.id_prsntcion_tpo',
'     join v_df_i_impuestos_subimpuesto  i   on i.id_impsto = sms.id_impsto',
'left join pq_d_respuestas               rs   on rs.cdgo_rspsta = s.cdgo_rspsta',
'   where s.cdgo_clnte = :F_CDGO_CLNTE ',
'     and m.id_mtvo = nvl(:P20_ID_MTVO, m.id_mtvo) ',
'     and e.id_estdo = nvl(:P20_ID_ESTDO , e.id_estdo)',
'     and t.id_tpo = nvl(:P20_ID_TPO  , t.id_tpo)',
'     and nvl(rs.cdgo_rspsta,0) = nvl(:P20_CDGO_RSPSTA, nvl(rs.cdgo_rspsta,0))',
'     and sms.id_impsto = nvl(:P20_ID_IMPSTO, sms.id_impsto)',
'     and trunc(s.fcha_incio) between :P20_FCHA_INCIO and :P20_FCHA_FIN'))
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
 p_id=>wwv_flow_api.id(23912980853839536)
,p_max_row_count=>'100000000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'MCARO'
,p_internal_uid=>23912980853839536
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23913051095839537)
,p_db_column_name=>'CDGO_CLNTE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Cdgo Clnte'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23913160414839538)
,p_db_column_name=>'NMRO_RDCDO_DSPLAY'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Numero Radicado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23913217938839539)
,p_db_column_name=>'NMBRE_RDCDOR'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Nombre Radicador'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23913367301839540)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Motivo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23913446888839541)
,p_db_column_name=>'DSCRPCION_ESTDO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23913589136839542)
,p_db_column_name=>'IDNTFCCION'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23913654194839543)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23913714298839544)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Sub-Tributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23913890797839545)
,p_db_column_name=>'FCHA_RDCDO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Fecha de Radicado'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23913904660839546)
,p_db_column_name=>'FCHA_PRYCTDA'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Fecha Proyectada'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23914050968839547)
,p_db_column_name=>'FCHA_REAL'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Fecha Final'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23914131408839548)
,p_db_column_name=>'ID_INSTNCIA_FLJO'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Id Instncia Fljo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23914244361839549)
,p_db_column_name=>'DSCRPCION_RSPSTA'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Respuesta'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24124706392336305)
,p_db_column_name=>'TIPO'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(24059489368527781)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'240595'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'NMRO_RDCDO_DSPLAY:NMBRE_RDCDOR:TIPO:DSCRPCION:DSCRPCION_ESTDO:IDNTFCCION:NMBRE_IMPSTO:NMBRE_IMPSTO_SBMPSTO:FCHA_RDCDO:FCHA_PRYCTDA:FCHA_REAL:DSCRPCION_RSPSTA:'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23912153715839528)
,p_name=>'P20_FCHA_FIN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(23909653502839503)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23912261206839529)
,p_name=>'P20_ID_MTVO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(23909653502839503)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23912493644839531)
,p_name=>'P20_ID_ESTDO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(23909653502839503)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23912557730839532)
,p_name=>'P20_FCHA_INCIO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(23909653502839503)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23912602503839533)
,p_name=>'P20_CDGO_RSPSTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(23909653502839503)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23914340154839550)
,p_name=>'P20_ID_IMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(23909653502839503)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24180855679668901)
,p_name=>'P20_ID_TPO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(23909653502839503)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
