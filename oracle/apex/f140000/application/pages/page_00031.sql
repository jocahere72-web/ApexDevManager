prompt --application/pages/page_00031
begin
wwv_flow_api.create_page(
 p_id=>31
,p_user_interface_id=>wwv_flow_api.id(22508582753660970)
,p_name=>'Resoluciones IGAC'
,p_page_mode=>'NON_MODAL'
,p_step_title=>'Resoluciones IGAC'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20201221185941'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(101955809576699601)
,p_plug_name=>'Resoluciones IGAC'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52128439135074801)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'       select a.id_sjto_impsto',
'            , c.id_impsto',
'            , c.id_impsto_sbmpsto',
'            , a.rslcion',
'            , a.rdccion',
'            , f.dscrpcion tpo_trmte',
'            , e.dscrpcion clse_mtcion',
'            , a.rfrncia_igac',
'            , a.cncla_inscrbe',
'            --, a.nmro_orden',
'            --, a.ttal_rgstro',
'            , a.tpo_dcmnto',
'            , a.nmro_dcmnto',
'            , trim(a.nmbre_prptrio) as nmbre_prptrio',
'            , trim(a.drccion) as drccion',
'            , g.nmbre_dstno_igac dstno_ecnmco',
'            , a.area_trrno',
'            , a.area_cnstrda',
'            , a.avluo_ctstral',
'            , a.vgncia_igac',
unistr('            , decode( a.aplcda , ''N'' , ''No'' , ''S\00ED'' ) as aplcda'),
'            , decode( a.cncla_inscrbe , ''I'' , ''<span aria-hidden="true" class="fa fa-eye" style="font-size: 20px;"></span>'' ) as link',
'            , c.fcha_aplccion',
'            , d.idntfccion as idntfccion_usrio',
'            , d.nmbre_trcro as nmbre_usrio',
'            , e.dscrpcion as clse_mtcion_aplcda',
'         from si_g_resolucion_igac_t1 a',
'    left join si_g_resolucion_aplicada c',
'           on a.id_rslcion_aplcda = c.id_rslcion_aplcda',
'    left join v_sg_g_usuarios d',
'           on c.id_usrio = d.id_usrio',
'         join df_s_mutaciones_clase e ',
'           on a.clse_mtcion = e.cdgo_mtcion_clse',
'         join df_s_tramites_tipo  f on a.tpo_trmte = f.cdgo_trmte_tpo',
'         join df_s_destinos_igac  g on a.dstno_ecnmco = g.cdgo_dstno_igac',
'        where a.rfrncia_igac = (',
'                                  select distinct(rfrncia_igac)',
'                                    from si_g_resolucion_igac_t1',
'                                   where id_sjto_impsto =  :P31_ID_SJTO_IMPSTO',
'                               )'))
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
 p_id=>wwv_flow_api.id(101956362408699606)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No hay datos disponibles'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:RP,32:P32_ID_IMPSTO,P32_ID_IMPSTO_SBMPSTO,P32_RFRNCIA_IGAC,P32_RDCCION,P32_RSLCION:#ID_IMPSTO#,#ID_IMPSTO_SBMPSTO#,#RFRNCIA_IGAC#,#RDCCION#,#RSLCION#'
,p_detail_link_text=>'#LINK#'
,p_detail_link_attr=>'title="Ver"'
,p_owner=>'AMOLINA'
,p_internal_uid=>101956362408699606
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101956570202699608)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101956679205699609)
,p_db_column_name=>'RSLCION'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>unistr('Resoluci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101956709079699610)
,p_db_column_name=>'RDCCION'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>unistr('Radicaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101956806029699611)
,p_db_column_name=>'TPO_TRMTE'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Tipo Tramite'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101956926925699612)
,p_db_column_name=>'CLSE_MTCION'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>unistr('Clase de Mutaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101957095989699613)
,p_db_column_name=>'RFRNCIA_IGAC'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Referencia'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101957134912699614)
,p_db_column_name=>'CNCLA_INSCRBE'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'C/I'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101957268991699615)
,p_db_column_name=>'TPO_DCMNTO'
,p_display_order=>80
,p_column_identifier=>'I'
,p_column_label=>unistr('Tipo de Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101957377478699616)
,p_db_column_name=>'NMRO_DCMNTO'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>unistr('Identificaci\00F3n Propietario')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101957441603699617)
,p_db_column_name=>'NMBRE_PRPTRIO'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Propietario'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101957512894699618)
,p_db_column_name=>'DRCCION'
,p_display_order=>110
,p_column_identifier=>'L'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101957600698699619)
,p_db_column_name=>'DSTNO_ECNMCO'
,p_display_order=>120
,p_column_identifier=>'M'
,p_column_label=>'Destino Igac'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101957736660699620)
,p_db_column_name=>'AREA_TRRNO'
,p_display_order=>130
,p_column_identifier=>'N'
,p_column_label=>unistr('\00C1rea Terreno')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101957824704699621)
,p_db_column_name=>'AREA_CNSTRDA'
,p_display_order=>140
,p_column_identifier=>'O'
,p_column_label=>unistr('\00C1rea Construida')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101957920825699622)
,p_db_column_name=>'AVLUO_CTSTRAL'
,p_display_order=>150
,p_column_identifier=>'P'
,p_column_label=>unistr('Aval\00FAo	')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101958010360699623)
,p_db_column_name=>'VGNCIA_IGAC'
,p_display_order=>160
,p_column_identifier=>'Q'
,p_column_label=>'Vigencia Igac'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101958181934699624)
,p_db_column_name=>'APLCDA'
,p_display_order=>170
,p_column_identifier=>'R'
,p_column_label=>unistr('\00BFAplicada?')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101958252882699625)
,p_db_column_name=>'LINK'
,p_display_order=>180
,p_column_identifier=>'S'
,p_column_label=>'Link'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101958340187699626)
,p_db_column_name=>'FCHA_APLCCION'
,p_display_order=>190
,p_column_identifier=>'T'
,p_column_label=>unistr('Fecha Aplicaci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101958404655699627)
,p_db_column_name=>'IDNTFCCION_USRIO'
,p_display_order=>200
,p_column_identifier=>'U'
,p_column_label=>unistr('Identificaci\00F3n que Aplic\00F3')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101958584761699628)
,p_db_column_name=>'NMBRE_USRIO'
,p_display_order=>210
,p_column_identifier=>'V'
,p_column_label=>unistr('Funcionario que Aplic\00F3')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101958636838699629)
,p_db_column_name=>'CLSE_MTCION_APLCDA'
,p_display_order=>220
,p_column_identifier=>'W'
,p_column_label=>unistr('Clase de Mutaci\00F3n Aplicada')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101958751650699630)
,p_db_column_name=>'ID_IMPSTO'
,p_display_order=>230
,p_column_identifier=>'X'
,p_column_label=>'Id Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101958840585699631)
,p_db_column_name=>'ID_IMPSTO_SBMPSTO'
,p_display_order=>240
,p_column_identifier=>'Y'
,p_column_label=>'Id Impsto Sbmpsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(101967840652740012)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1019679'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_SJTO_IMPSTO:RSLCION:RDCCION:TPO_TRMTE:CLSE_MTCION:RFRNCIA_IGAC:CNCLA_INSCRBE:TPO_DCMNTO:NMRO_DCMNTO:NMBRE_PRPTRIO:DRCCION:DSTNO_ECNMCO:AREA_TRRNO:AREA_CNSTRDA:AVLUO_CTSTRAL:VGNCIA_IGAC:APLCDA:LINK:FCHA_APLCCION:IDNTFCCION_USRIO:NMBRE_USRIO:CLSE_MT'
||'CION_APLCDA:ID_IMPSTO:ID_IMPSTO_SBMPSTO'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(102016835142995382)
,p_report_id=>wwv_flow_api.id(101967840652740012)
,p_name=>'Cancela'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'CNCLA_INSCRBE'
,p_operator=>'='
,p_expr=>'C'
,p_condition_sql=>' (case when ("CNCLA_INSCRBE" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''C''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_bg_color=>'#FF7755'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(102017263556995382)
,p_report_id=>wwv_flow_api.id(101967840652740012)
,p_name=>'Inscribe'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'CNCLA_INSCRBE'
,p_operator=>'='
,p_expr=>'I'
,p_condition_sql=>' (case when ("CNCLA_INSCRBE" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''I''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_bg_color=>'#99FF99'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(101956249215699605)
,p_plug_name=>'&P31_DSCRPCION.'
,p_icon_css_classes=>'&P31_ICNO.'
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
 p_id=>wwv_flow_api.id(101955982700699602)
,p_name=>'P31_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(101955809576699601)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101956004137699603)
,p_name=>'P31_DSCRPCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(101956249215699605)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101956107485699604)
,p_name=>'P31_ICNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(101956249215699605)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
