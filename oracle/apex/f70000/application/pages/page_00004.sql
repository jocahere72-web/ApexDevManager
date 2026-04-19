prompt --application/pages/page_00004
begin
wwv_flow_api.create_page(
 p_id=>4
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Predios conservados, nuevos y retirados ( Cinta IGAC general y actualizados ), e incrementos de aval\00FAos')
,p_page_mode=>'MODAL'
,p_step_title=>'Predios'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-noDataMsg {',
'    padding: 0;',
'}'))
,p_step_template=>wwv_flow_api.id(164066978207707637)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'auto'
,p_dialog_width=>'90%'
,p_last_updated_by=>'NARDILA'
,p_last_upd_yyyymmddhh24miss=>'20190506110457'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52439018859472308)
,p_plug_name=>unistr('Predios conservados, nuevos y retirados ( Cinta IGAC general y actualizados ), e incrementos de aval\00FAos')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(168978598353513378)
,p_plug_name=>' Predios Conservados Activos Material'
,p_parent_plug_id=>wwv_flow_api.id(52439018859472308)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''icon'' as card_type',
'     , ''fa-globe'' as card_icon ',
'     , null as card_icon_color ',
'     , ''background: linear-gradient(60deg, hsl(80, 61%, 50%), hsl(80, 85%, 74%));box-shadow: 0 12px 20px -10px rgba(230, 230, 230, 0.28), 0 4px 20px 0px rgba(0, 0, 0, 0.12), 0 7px 8px -5px rgba(230, 230, 230, 0.2);'' as card_header_style',
'     , ''Predios Conservados Activos'' AS card_title',
'     , to_char(count(*),''999G999G999G999G999G999G990'') as card_value',
'     , '''' as card_footer',
'     , '''' as card_link',
'     , null as card_chart_data',
'     , null as card_chart_config',
'  from v_gi_g_cinta_igac a',
' where a.nmro_orden_igac = ''001''',
'   and a.cdgo_clnte    = :F_CDGO_CLNTE',
'   and a.id_prcso_crga = :P40_ARCHIVO',
'   and exists ( ',
'                  select ''x'' ',
'                    from v_si_i_sujetos_impuesto b',
'                   where b.idntfccion_sjto = a.rfrncia_igac',
'                     and b.cdgo_clnte      = :F_CDGO_CLNTE',
'                     and b.cdgo_sjto_estdo = ''A''',
'              )'))
,p_plug_source_type=>'PLUGIN_APEX.MATERIAL.CARDS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P4_INDICADOR'
,p_plug_display_when_cond2=>'PCA'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'  "cardWidth": 15',
'}'))
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(168978648022513379)
,p_plug_name=>'Predios Conservados Inactivos Material'
,p_parent_plug_id=>wwv_flow_api.id(52439018859472308)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''icon'' as card_type',
'      , ''fa-globe'' as card_icon',
'      , null as card_icon_color',
'      , null as card_header_style',
'      , ''Predios Conservados Inactivos'' as card_title ',
'      , to_char(count(*),''999G999G999G999G999G999G990'') as card_value ',
'      , '''' as card_footer',
'      , '''' as card_link ',
'      , null as card_chart_data',
'      , null as card_chart_config',
'  from v_gi_g_cinta_igac a',
' where a.id_prcso_crga   = :P40_ARCHIVO',
'   and a.nmro_orden_igac = ''001''',
'   and exists ( ',
'                  select ''x'' ',
'                    from v_si_i_sujetos_impuesto b',
'                   where b.idntfccion_sjto = a.rfrncia_igac',
'                     and b.cdgo_clnte      = :F_CDGO_CLNTE',
'                     and b.cdgo_sjto_estdo = ''I''',
'              )'))
,p_plug_source_type=>'PLUGIN_APEX.MATERIAL.CARDS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P4_INDICADOR'
,p_plug_display_when_cond2=>'PCI'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'  "cardWidth": 15',
'}'))
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(175071785400017366)
,p_plug_name=>unistr('<b>Predios conservados, nuevos y retirados ( Cinta IGAC general y actualizados ), e incrementos de aval\00FAos</b>')
,p_parent_plug_id=>wwv_flow_api.id(52439018859472308)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select 1',
'         , ''Predios Nuevos'' as Novedad',
'         , to_char( count(*) ,''999G999G999G999G999G999G990'') as "No. Predios"',
unistr('         , to_char( sum(a.avluo_igac),''999G999G999G999G999G999G990'') as "Total Aval\00FAos"'),
'      from v_gi_g_cinta_igac a',
'     where a.nmro_orden_igac = ''001''',
'       and a.cdgo_clnte      = :F_CDGO_CLNTE',
'       and a.id_prcso_crga   = :P40_ARCHIVO',
'       and not exists ( ',
'                            select ''x'' ',
'                              from v_si_i_sujetos_impuesto b',
'                             where a.rfrncia_igac = b.idntfccion_sjto',
'                               and b.cdgo_clnte   = :F_CDGO_CLNTE',
'                       )',
'    union ',
'    select 2',
'         , ''Predios Conservan'' as Novedad',
'         , to_char( count(*) ,''999G999G999G999G999G999G990'') as "No. Predios"',
unistr('         , to_char( sum(a.avluo_igac),''999G999G999G999G999G999G990'') as "Total Aval\00FAos"'),
'      from v_gi_g_cinta_igac a',
'     where a.nmro_orden_igac = ''001''',
'       and a.cdgo_clnte      = :F_CDGO_CLNTE',
'       and a.id_prcso_crga   = :P40_ARCHIVO',
'       and exists ( ',
'                        select ''x'' ',
'                          from v_si_i_sujetos_impuesto b',
'                         where b.idntfccion_sjto = a.rfrncia_igac',
'                           and b.cdgo_clnte      = :F_CDGO_CLNTE',
'                   )',
'    union ',
'    select 3',
'         , ''Predios Retirados'' as Novedad',
'         , to_char( count(*) ,''999G999G999G999G999G999G990'') as "No. Predios"',
unistr('         , to_char( sum(b.avluo_ctstral),''999G999G999G999G999G999G990'') as "Total Aval\00FAos"'),
'      from v_si_i_sujetos_impuesto a',
'      join v_si_i_predios b',
'        on a.id_sjto_impsto  = b.id_sjto_impsto',
'     where a.cdgo_clnte      = :F_CDGO_CLNTE',
'       and a.cdgo_sjto_estdo = ''A''',
'       and not exists ( ',
'                         select ''x'' ',
'                           from v_gi_g_cinta_igac c',
'                          where c.nmro_orden_igac = ''001''',
'                            and c.cdgo_clnte      = :F_CDGO_CLNTE',
'                            and c.id_prcso_crga   = :P40_ARCHIVO',
'                            and c.rfrncia_igac    = a.idntfccion_sjto',
'                      )'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P4_INDICADOR'
,p_plug_display_when_cond2=>'PCNR'
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
 p_id=>wwv_flow_api.id(175071865893017367)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ECASTILLO'
,p_internal_uid=>172899836327428407
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(175071992293017368)
,p_db_column_name=>'1'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'1'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(175072111975017369)
,p_db_column_name=>'NOVEDAD'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Novedad'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(175072141314017370)
,p_db_column_name=>'No. Predios'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'No. predios'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(52438351167472301)
,p_db_column_name=>unistr('Total Aval\00FAos')
,p_display_order=>40
,p_column_identifier=>'F'
,p_column_label=>unistr('Total Aval\00FAos')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(175127579992198034)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1729556'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('NOVEDAD:No. Predios:Total Aval\00FAos:')
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(515012904785825895)
,p_plug_name=>'<b>Informe Predios Conservados Activos</b>'
,p_parent_plug_id=>wwv_flow_api.id(52439018859472308)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.rfrncia_igac',
'     , a.nmbre_prptrio_igac',
'     , a.nmro_dcmnto_igac',
'     , a.drccion_prdio_igac',
'     , a.area_trrno_igac',
'     , a.area_cnstrda_igac',
'     , a.avluo_igac ',
'  from gi_g_cinta_igac a',
' where a.id_prcso_crga   = :P40_ARCHIVO',
'   and a.nmro_orden_igac = ''001''',
'   and exists ( ',
'                  select ''x'' ',
'                    from v_si_i_sujetos_impuesto b',
'                   where b.idntfccion_sjto = a.rfrncia_igac',
'                     and b.cdgo_clnte      = :F_CDGO_CLNTE',
'                     and b.cdgo_sjto_estdo = ''A''',
'              )'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P4_INDICADOR'
,p_plug_display_when_cond2=>'PCA'
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
 p_id=>wwv_flow_api.id(515013051513825896)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('No existe Informaci\00F3n de Predios Conservados Activos')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ECASTILLO'
,p_internal_uid=>512841021948236936
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173456778060901804)
,p_db_column_name=>'RFRNCIA_IGAC'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Referencia'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173457130967901804)
,p_db_column_name=>'NMBRE_PRPTRIO_IGAC'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Propietario'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173457564444901805)
,p_db_column_name=>'NMRO_DCMNTO_IGAC'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173457999134901805)
,p_db_column_name=>'DRCCION_PRDIO_IGAC'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Direcci\00F3n <br> Predio')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173458378083901807)
,p_db_column_name=>'AREA_TRRNO_IGAC'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('\00C1rea Terreno')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173458748053901816)
,p_db_column_name=>'AREA_CNSTRDA_IGAC'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('\00C1rea Construida')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173459152676901816)
,p_db_column_name=>'AVLUO_IGAC'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Aval\00FAo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(515064299276002401)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1712875'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'RFRNCIA_IGAC:NMBRE_PRPTRIO_IGAC:NMRO_DCMNTO_IGAC:DRCCION_PRDIO_IGAC:AREA_TRRNO_IGAC:AREA_CNSTRDA_IGAC:AVLUO_IGAC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(515370851534840495)
,p_plug_name=>'<b>Informe Predios Conservados Inactivos</b>'
,p_parent_plug_id=>wwv_flow_api.id(52439018859472308)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.rfrncia_igac',
'     , a.nmbre_prptrio_igac',
'     , a.nmro_dcmnto_igac',
'     , a.drccion_prdio_igac',
'     , a.area_trrno_igac',
'     , a.area_cnstrda_igac',
'     , a.avluo_igac ',
'  from gi_g_cinta_igac a',
' where a.id_prcso_crga   = :P40_ARCHIVO',
'   and a.nmro_orden_igac = ''001''',
'   and exists ( ',
'                  select ''x'' ',
'                    from v_si_i_sujetos_impuesto b',
'                   where b.idntfccion_sjto = a.rfrncia_igac',
'                     and b.cdgo_clnte      = :F_CDGO_CLNTE',
'                     and b.cdgo_sjto_estdo = ''I''',
'              )'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P4_INDICADOR'
,p_plug_display_when_cond2=>'PCI'
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
 p_id=>wwv_flow_api.id(515371048572840497)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('No se encontr\00F3 Informaci\00F3n de Predios Conservados Inactivos')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ECASTILLO'
,p_internal_uid=>513199019007251537
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173452316275901741)
,p_db_column_name=>'RFRNCIA_IGAC'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Referencia'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173452698095901748)
,p_db_column_name=>'NMBRE_PRPTRIO_IGAC'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Propietario'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173453051239901748)
,p_db_column_name=>'NMRO_DCMNTO_IGAC'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173453456011901749)
,p_db_column_name=>'DRCCION_PRDIO_IGAC'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Predio'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173453925286901749)
,p_db_column_name=>'AREA_TRRNO_IGAC'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('\00C1rea terreno')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173454244698901749)
,p_db_column_name=>'AREA_CNSTRDA_IGAC'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('\00C1rea Construida')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173454630732901754)
,p_db_column_name=>'AVLUO_IGAC'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Aval\00FAo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(515588819976043015)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1712830'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'RFRNCIA_IGAC:NMBRE_PRPTRIO_IGAC:NMRO_DCMNTO_IGAC:DRCCION_PRDIO_IGAC:AREA_TRRNO_IGAC:AREA_CNSTRDA_IGAC:AVLUO_IGAC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(173456126968901791)
,p_name=>'P4_INDICADOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(52439018859472308)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
