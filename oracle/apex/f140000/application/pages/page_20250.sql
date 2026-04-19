prompt --application/pages/page_20250
begin
wwv_flow_api.create_page(
 p_id=>2025004
,p_user_interface_id=>wwv_flow_api.id(22508582753660970)
,p_name=>'consulta general de Email'
,p_page_mode=>'NON_MODAL'
,p_step_title=>'consulta general de Email'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_dialog_width=>'1024'
,p_dialog_max_width=>'1024'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20260106161858'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7740041815147520)
,p_plug_name=>'Envios Realizados'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52128439135074801)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct',
'       a.id_envio, ',
'       b.id_envio_mdio, -- oculto',
'       a.id_envio_prgrmdo, -- oculto',
'       a.dscrpcion_envio_prgmdo tpo_envio,',
'       a.fcha_rgstro,',
'       b.dstno email,',
'       b.asnto,',
'       e.dscrpcion_acto_tpo tpo_acto,',
'       e.nmro_acto,',
'       b.dscrpcion_envio_estdo estdo_envio,',
'       b.status estdo_actual,',
'       b.fcha_rspsta ultma_cnslta,',
'       ''<span aria-hidden="true" class="fa fa-eye"></span>'' as correo,',
'       case ',
'        when d.ID_ENVIO is not null then',
'            ''<span aria-hidden="true" class="fa fa-eye"></span>''',
'        else',
'            '' ''',
'        end as adjunto',
'  from v_ma_g_envios a',
'  join v_ma_g_envios_medio b on a.id_envio = b.id_envio',
'  join ma_g_envios_medio_respuesta c on b.id_envio_mdio = c.id_envio_mdio and  c.messageid = b.messageid',
'  left join v_gn_g_actos e on e.id_acto = a.id_acto',
'  left join ma_g_envios_adjntos d on d.id_envio = a.id_envio',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and b.cdgo_envio_mdio = ''EML''',
'   and a.id_sjto_impsto = :P2_ID_SJTO_IMPSTO;'))
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
 p_id=>wwv_flow_api.id(7742399498147543)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LARIZA'
,p_internal_uid=>7742399498147543
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7742482824147544)
,p_db_column_name=>'ID_ENVIO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Envio'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7742500500147545)
,p_db_column_name=>'ID_ENVIO_MDIO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Envio Mdio'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7742609176147546)
,p_db_column_name=>'ID_ENVIO_PRGRMDO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Envio Prgrmdo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7742711479147547)
,p_db_column_name=>'TPO_ENVIO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Tipo de Envio'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7742800634147548)
,p_db_column_name=>'FCHA_RGSTRO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Fecha Env\00EDo')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7742962887147549)
,p_db_column_name=>'EMAIL'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Email'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7743041514147550)
,p_db_column_name=>'TPO_ACTO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Tipo Acto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15759840859008701)
,p_db_column_name=>'NMRO_ACTO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('N\00FAmero Acto')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15759932414008702)
,p_db_column_name=>'ESTDO_ENVIO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Estado Inicial'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15760062619008703)
,p_db_column_name=>'ESTDO_ACTUAL'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Estado Actual'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15760182045008704)
,p_db_column_name=>'ULTMA_CNSLTA'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('\00DAltima Consulta')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15760293759008705)
,p_db_column_name=>'CORREO'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Ver Correo'
,p_column_link=>'f?p=67000:2024001:&SESSION.::&DEBUG.:RP:P2024001_ID_ENVIO:#ID_ENVIO#'
,p_column_linktext=>'#CORREO#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15760332123008706)
,p_db_column_name=>'ADJUNTO'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Ver Adjunto'
,p_column_link=>'f?p=67000:2024002:&SESSION.::&DEBUG.:RP:P2024002_ID_ENVIO:#ID_ENVIO#'
,p_column_linktext=>'#ADJUNTO#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117412530680607310)
,p_db_column_name=>'ASNTO'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Asnto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(15775144313009332)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'157752'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_ENVIO:TPO_ENVIO:FCHA_RGSTRO:EMAIL:TPO_ACTO:NMRO_ACTO:ESTDO_ENVIO:ESTDO_ACTUAL:ULTMA_CNSLTA:CORREO:ADJUNTO::ASNTO'
,p_sort_column_1=>'FCHA_RGSTRO'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7741856619147538)
,p_plug_name=>'&P2025004_DSCRPCION.'
,p_icon_css_classes=>'&P18_ICNO.'
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
 p_id=>wwv_flow_api.id(7741925158147539)
,p_name=>'P2025004_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(7741856619147538)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7742079759147540)
,p_name=>'P2025004_DSCRPCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(7741856619147538)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7742118750147541)
,p_name=>'P2025004_ICNO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(7741856619147538)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
