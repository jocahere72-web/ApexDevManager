prompt --application/pages/page_00009
begin
wwv_flow_api.create_page(
 p_id=>9
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Liquidaciones Predios Urbanos'
,p_page_mode=>'MODAL'
,p_step_title=>'Liquidaciones Predios Urbanos'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(164065555011707626)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_dialog_width=>'1200'
,p_last_updated_by=>'ELAFAURIE'
,p_last_upd_yyyymmddhh24miss=>'20181226094024'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173295942595847364)
,p_plug_name=>'Predios Nuevos y Existentes por Estrato'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dstno_ecnmco_igac "Destino IGAC",',
unistr('           a.dscrpcion         "Descripci\00F3n Destino",'),
'           a.estrto            "Estrato",',
unistr('           a.tpo               "Aval\00FAo Catastral",'),
'           a.cntdad            "No. Predios",',
unistr('           a.ttal_avluos       "Total Aval\00FAos"'),
'    from (',
'                    select c.dstno_ecnmco_igac, ',
'                           d.nmbre_dstno_igac dscrpcion,',
'                           max(''1'') Estrto,',
'                           max(''<=135 SMMLV (99.591.795)'') tpo,',
'                           count(*) cntdad,',
'                           sum(c.avluo_igac) ttal_avluos,',
'                           max(1) orden',
'                      from v_gi_g_cinta_igac c',
'                      join v_df_s_destinos_igac d ',
'                        on c.dstno_ecnmco_igac = d.cdgo_dstno_igac',
'                     where c.nmro_orden_igac   =  ''001'' ',
'                       and substr(c.rfrncia_igac,1,2) <> ''00''',
'                       and c.dstno_ecnmco_igac in (''A'') ',
'                       and c.avluo_igac <= (:P2_TRFA * :P2_SMMLV)',
'                       and c.vgncia = :P2_VGNCIA',
'                       and c.cdgo_clnte = :F_CDGO_CLNTE',
'                       and exists (',
'                                    select ''x''',
'                                      from v_si_i_predios p',
'                                      join v_si_i_sujetos_impuesto s',
'                                        on p.id_sjto_impsto = s.id_sjto_impsto',
'                                     where s.idntfccion = c.rfrncia_igac ',
'                                       and p.cdgo_estrto = ''1''',
'                                       and s.cdgo_clnte = :F_CDGO_CLNTE',
'                                  )',
'                      group by c.dstno_ecnmco_igac,',
'                               d.nmbre_dstno_igac',
'                union',
'                    select c.dstno_ecnmco_igac, ',
'                           d.nmbre_dstno_igac dscrpcion,',
'                           max(''1'') Estrto,',
'                           max(''> 135 SMMLV (99.591.795)'') tpo,    ',
'                           count(*) cntdad, sum(c.avluo_igac) ttal_avluos,',
'                           max(1) orden       ',
'                      from v_gi_g_cinta_igac c',
'                      join v_df_s_destinos_igac d ',
'                        on c.dstno_ecnmco_igac = d.cdgo_dstno_igac',
'                     where c.nmro_orden_igac   =  ''001'' ',
'                       and substr(c.rfrncia_igac,1,2) <> ''00'' ',
'                       and c.dstno_ecnmco_igac in (''A'') ',
'                       and c.avluo_igac > (:P2_TRFA * :P2_SMMLV)',
'                       and c.vgncia = :P2_VGNCIA',
'                       and c.cdgo_clnte = :F_CDGO_CLNTE',
'                       and exists (',
'                                    select ''x''',
'                                      from v_si_i_predios p',
'                                      join v_si_i_sujetos_impuesto s',
'                                        on p.id_sjto_impsto = s.id_sjto_impsto',
'                                     where s.idntfccion = c.rfrncia_igac ',
'                                       and p.cdgo_estrto = ''1''',
'                                       and cdgo_clnte = :F_CDGO_CLNTE',
'                                  )',
'                     group by c.dstno_ecnmco_igac,',
'                              d.nmbre_dstno_igac',
'            ) a',
'     order by a.orden, ',
'              a.dstno_ecnmco_igac'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P9_INDICADOR'
,p_plug_display_when_cond2=>'PNEE'
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
 p_id=>wwv_flow_api.id(173296031777847365)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No se encontraron datos de Predios Nuevos y Existentes por Estrato 1'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ECASTILLO'
,p_internal_uid=>171124002212258405
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173296174326847366)
,p_db_column_name=>'Destino IGAC'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Destino igac'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173296233121847367)
,p_db_column_name=>unistr('Descripci\00F3n Destino')
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Descripci\00F3n destino')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173296401559847368)
,p_db_column_name=>'No. Predios'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'No. predios'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173296499036847369)
,p_db_column_name=>unistr('Total Aval\00FAos')
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Total aval\00FAos')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173296542941847370)
,p_db_column_name=>'Estrato'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Estrato'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173296671058847371)
,p_db_column_name=>unistr('Aval\00FAo Catastral')
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Aval\00FAo catastral')
,p_column_type=>'STRING'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(173773580270603328)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1716016'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('Destino IGAC:Descripci\00F3n Destino:Estrato:Aval\00FAo Catastral:No. Predios:Total Aval\00FAos:')
,p_sum_columns_on_break=>unistr('No. Predios:Total Aval\00FAos')
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173296782570847372)
,p_plug_name=>'Destinos no Homologados sin caso de liquidacion'
,p_region_name=>'DHL'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dstno_ecnmco_igac "Destino IGAC",',
unistr('               a.dscrpcion         "Descripci\00F3n Destino",'),
'               a.cntdad             "No. Predios",',
unistr('               a.ttal_avluos        "Total Aval\00FAos"'),
'          from (',
'                  select c.dstno_ecnmco_igac, ',
'                         nvl(d.nmbre_dstno_igac,''NO CLASIFICADO'') dscrpcion,',
'                         count(*) cntdad, ',
'                         sum(c.avluo_igac) ttal_avluos,',
'                         max(1) orden',
'                    from v_gi_g_cinta_igac c',
'               left join v_df_s_destinos_igac d ',
'                      on c.dstno_ecnmco_igac = d.cdgo_dstno_igac',
'                   where c.nmro_orden_igac   =  ''001'' ',
'                     and substr(c.rfrncia_igac,1,2) <> ''00''',
'                     and c.dstno_ecnmco_igac not in (''A'',''B'',''C'',''F'',''G'',''H'',''I'',''J'',''K'',''P'',''R'',''S'',''T'')',
'                     and c.vgncia = :P2_VGNCIA',
'                     and c.cdgo_clnte = :F_CDGO_CLNTE',
'                   group by c.dstno_ecnmco_igac,',
'                            d.nmbre_dstno_igac',
'                ) a',
'          order by a.orden, ',
'                   a.dstno_ecnmco_igac'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P9_INDICADOR'
,p_plug_display_when_cond2=>'DHL'
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
 p_id=>wwv_flow_api.id(173296856178847373)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('No se encontraron datos de Predios con destino no homologados sin caso de liquidaci\00F3n')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ECASTILLO'
,p_internal_uid=>171124826613258413
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173296933869847374)
,p_db_column_name=>'Destino IGAC'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Destino igac'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173297111279847375)
,p_db_column_name=>unistr('Descripci\00F3n Destino')
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Descripci\00F3n destino')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173297188091847376)
,p_db_column_name=>'No. Predios'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'No. predios'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173297244490847377)
,p_db_column_name=>unistr('Total Aval\00FAos')
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Total aval\00FAos')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(173792999711743379)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1716210'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('Destino IGAC:Descripci\00F3n Destino:No. Predios:Total Aval\00FAos')
,p_sum_columns_on_break=>unistr('No. Predios:Total Aval\00FAos')
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173532312679126597)
,p_plug_name=>'Region Botones'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164075504857707680)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173532873741126603)
,p_plug_name=>'Liquidacion Predios Urbanos'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dstno_ecnmco_igac "Destino IGAC" ,',
unistr('               a.dscrpcion         "Descripci\00F3n Destino" ,'),
'               a.cntdad             "No. Predios" ,',
unistr('               a.ttal_avluos        "Total Aval\00FAos"'),
'          from (',
'                    select c.dstno_ecnmco_igac , ',
'                           d.nmbre_dstno_igac dscrpcion,',
'                           count(*) cntdad, ',
'                           sum(c.avluo_igac) ttal_avluos,',
'                           1 orden       ',
'                      from v_gi_g_cinta_igac c',
'                      join v_df_s_destinos_igac d',
'                        on c.dstno_ecnmco_igac = d.cdgo_dstno_igac',
'                     where c.nmro_orden_igac           = ''001''',
'                       and substr(c.rfrncia_igac,1,2) <> ''00'' ',
'                       and c.dstno_ecnmco_igac in (''R'',''S'',''T'')',
'                       and c.vgncia = :P2_VGNCIA',
'                       and c.cdgo_clnte = :F_CDGO_CLNTE',
'                     group by c.dstno_ecnmco_igac,',
'                              d.nmbre_dstno_igac',
'              ) a',
'        order by a.orden, ',
'                 a.dstno_ecnmco_igac'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P9_INDICADOR'
,p_plug_display_when_cond2=>'PRST'
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
 p_id=>wwv_flow_api.id(173533106353126605)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ECASTILLO'
,p_internal_uid=>171361076787537645
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173533134893126606)
,p_db_column_name=>'Destino IGAC'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Destino igac'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173533274371126607)
,p_db_column_name=>unistr('Descripci\00F3n Destino')
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Descripci\00F3n destino')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173533349297126608)
,p_db_column_name=>'No. Predios'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'No. predios'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173533454164126609)
,p_db_column_name=>unistr('Total Aval\00FAos')
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Total aval\00FAos')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(173598306316213978)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1714263'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>unistr('Destino IGAC:Descripci\00F3n Destino:No. Predios:Total Aval\00FAos')
,p_sum_columns_on_break=>unistr('No. Predios:Total Aval\00FAos')
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173533604366126610)
,p_plug_name=>'Destino R y S'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dstno_ecnmco_igac "Destino IGAC",',
unistr('           (select d.nmbre_dstno_igac from df_s_destinos_igac d where d.cdgo_dstno_igac = a.dstno_ecnmco_igac)  "Descripci\00F3n Destino",'),
'           a.cntdad             "No. Predios ( Inferior a 454 UVT )",',
unistr('           a.ttal_avluos        "Total Aval\00FAos ( Inferior a 454 UVT )",'),
'           b.cntdad             "No. Predios ( Superior a 454 UVT )",',
unistr('           b.ttal_avluos        "Total Aval\00FAos ( Superior a 454 UVT )",'),
'           c.cntdad             "No. Predios",',
unistr('           c.ttal_avluos        "Total Aval\00FAos"       '),
'      from (',
'               select c.dstno_ecnmco_igac , ',
'                      count(*) cntdad ,',
'                      sum(c.avluo_igac) ttal_avluos',
'                from v_gi_g_cinta_igac c',
'                where c.nmro_orden_igac          =  ''001''',
'                  and substr(c.rfrncia_igac,1,2) <> ''00'' ',
'                  and c.dstno_ecnmco_igac in (''R'',''S'')',
'                  and c.avluo_igac <= (454 * :P2_UVT)',
'                  and c.vgncia = :P2_VGNCIA',
'                  and c.cdgo_clnte = :F_CDGO_CLNTE',
'                group by c.dstno_ecnmco_igac ) a ,',
'             (',
'               select c.dstno_ecnmco_igac , ',
'                      count(*) cntdad ,',
'                      sum(c.avluo_igac) ttal_avluos',
'                 from v_gi_g_cinta_igac c',
'                where c.nmro_orden_igac          =  ''001'' ',
'                  and substr(c.rfrncia_igac,1,2) <> ''00'' ',
'                  and c.dstno_ecnmco_igac in (''R'',''S'')',
'                  and c.avluo_igac > (454 * :P2_UVT)',
'                  and c.vgncia = :P2_VGNCIA',
'                  and c.cdgo_clnte = :F_CDGO_CLNTE',
'                group by c.dstno_ecnmco_igac ) b ,',
'             (',
'               select c.dstno_ecnmco_igac , ',
'                      count(*) cntdad , ',
'                      sum(c.avluo_igac) ttal_avluos',
'                 from v_gi_g_cinta_igac c',
'                where c.nmro_orden_igac          =  ''001''',
'                  and substr(c.rfrncia_igac,1,2) <> ''00'' ',
'                  and c.dstno_ecnmco_igac in (''R'',''S'')',
'                  and c.vgncia = :P2_VGNCIA',
'                  and c.cdgo_clnte = :F_CDGO_CLNTE',
'                group by c.dstno_ecnmco_igac ) c',
'    where a.dstno_ecnmco_igac = b.dstno_ecnmco_igac',
'      and b.dstno_ecnmco_igac = c.dstno_ecnmco_igac',
'    order by a.dstno_ecnmco_igac'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P9_INDICADOR'
,p_plug_display_when_cond2=>'DLU'
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
 p_id=>wwv_flow_api.id(173601693680271261)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ECASTILLO'
,p_internal_uid=>171429664114682301
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173601751460271262)
,p_db_column_name=>'Destino IGAC'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Destino igac'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173601831844271263)
,p_db_column_name=>unistr('Descripci\00F3n Destino')
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Descripci\00F3n destino')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173602025809271264)
,p_db_column_name=>'No. Predios'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'No. predios'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173602063902271265)
,p_db_column_name=>unistr('Total Aval\00FAos')
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Total aval\00FAos')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173602219253271266)
,p_db_column_name=>'No. Predios ( Inferior a 454 UVT )'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'No. predios ( inferior a 454 uvt )'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173602247528271267)
,p_db_column_name=>unistr('Total Aval\00FAos ( Inferior a 454 UVT )')
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Total aval\00FAos ( inferior a 454 uvt )')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173602406842271268)
,p_db_column_name=>'No. Predios ( Superior a 454 UVT )'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'No. predios ( superior a 454 uvt )'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173602524705271269)
,p_db_column_name=>unistr('Total Aval\00FAos ( Superior a 454 UVT )')
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Total aval\00FAos ( superior a 454 uvt )')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(173617548148430777)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1714456'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('Destino IGAC:Descripci\00F3n Destino:No. Predios ( Inferior a 454 UVT ):Total Aval\00FAos ( Inferior a 454 UVT ):No. Predios ( Superior a 454 UVT ):Total Aval\00FAos ( Superior a 454 UVT ):No. Predios:Total Aval\00FAos:')
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173602615058271270)
,p_plug_name=>'Destino Homologados'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dstno_ecnmco_igac "Destino IGAC" ,',
unistr('               a.dscrpcion         "Descripci\00F3n Destino" ,'),
'               a.cntdad             "No. Predios" ,',
unistr('               a.ttal_avluos        "Total Aval\00FAos"'),
'          from (',
'                        select c.dstno_ecnmco_igac , ',
'                               d.nmbre_dstno_igac dscrpcion,',
'                               count(*) cntdad ,',
'                               sum(c.avluo_igac) ttal_avluos,',
'                               1 orden       ',
'                          from v_gi_g_cinta_igac c',
'                          join v_df_s_destinos_igac d',
'                            on c.dstno_ecnmco_igac = d.cdgo_dstno_igac',
'                         where c.nmro_orden_igac          =  ''001''',
'                           and substr(c.rfrncia_igac,1,2) <> ''00'' ',
'                           and c.dstno_ecnmco_igac in (''B'',''C'',''F'',''G'',''H'',''I'')',
'                           and c.vgncia = :P2_VGNCIA',
'                           and c.cdgo_clnte = :F_CDGO_CLNTE',
'                         group by c.dstno_ecnmco_igac,',
'                                  d.nmbre_dstno_igac',
'                 ) a',
'        order by a.orden, ',
'                 a.dstno_ecnmco_igac'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P9_INDICADOR'
,p_plug_display_when_cond2=>'DH'
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
 p_id=>wwv_flow_api.id(173602707476271271)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ECASTILLO'
,p_internal_uid=>171430677910682311
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173602816961271272)
,p_db_column_name=>'Destino IGAC'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Destino igac'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173602901917271273)
,p_db_column_name=>unistr('Descripci\00F3n Destino')
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Descripci\00F3n destino')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173602955946271274)
,p_db_column_name=>'No. Predios'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'No. predios'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173603045845271275)
,p_db_column_name=>unistr('Total Aval\00FAos')
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Total aval\00FAos')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(173622333595468868)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1714504'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('Destino IGAC:Descripci\00F3n Destino:No. Predios:Total Aval\00FAos')
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173603609585271280)
,p_plug_name=>'Destino Uso Publico'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dstno_ecnmco_igac "Destino IGAC",',
unistr('               a.dscrpcion         "Descripci\00F3n Destino",'),
'               a.cntdad             "No. Predios",',
unistr('               a.ttal_avluos        "Total Aval\00FAos"'),
'          from (',
'                    select c.dstno_ecnmco_igac , ',
'                           d.nmbre_dstno_igac dscrpcion,',
'                           count(*) cntdad ,',
'                           sum(c.avluo_igac) ttal_avluos       ',
'                      from v_gi_g_cinta_igac c',
'                      join v_df_s_destinos_igac d',
'                        on c.dstno_ecnmco_igac = d.cdgo_dstno_igac  ',
'                     where c.nmro_orden_igac          =  ''001''',
'                       and substr(c.rfrncia_igac,1,2) <> ''00'' ',
'                       and c.dstno_ecnmco_igac in (''P'')',
'                       and c.vgncia = :P2_VGNCIA',
'                       and c.cdgo_clnte = :F_CDGO_CLNTE',
'                     group by c.dstno_ecnmco_igac,',
'                              d.nmbre_dstno_igac',
'                ) a;  '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P9_INDICADOR'
,p_plug_display_when_cond2=>'DUP'
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
end;
/
begin
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(173603641091271281)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ECASTILLO'
,p_internal_uid=>171431611525682321
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173603775832271282)
,p_db_column_name=>'Destino IGAC'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Destino igac'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173603847354271283)
,p_db_column_name=>unistr('Descripci\00F3n Destino')
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Descripci\00F3n destino')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173603981829271284)
,p_db_column_name=>'No. Predios'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'No. predios'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173604072766271285)
,p_db_column_name=>unistr('Total Aval\00FAos')
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Total aval\00FAos')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(173626068176510501)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1714541'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('Destino IGAC:Descripci\00F3n Destino:No. Predios:Total Aval\00FAos')
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173604209415271286)
,p_plug_name=>'Destino No Homologados'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dstno_ecnmco_igac "Destino IGAC",',
unistr('           a.dscrpcion         "Descripci\00F3n Destino",'),
'           a.cntdad             "No. Predios",',
unistr('           a.ttal_avluos        "Total Aval\00FAos"'),
'     from (',
'                select c.dstno_ecnmco_igac, ',
'                       d.nmbre_dstno_igac dscrpcion,',
'                       count(*) cntdad ,',
'                       sum(c.avluo_igac) ttal_avluos,',
'                       1 orden       ',
'                  from v_gi_g_cinta_igac c',
'                  join v_df_s_destinos_igac d',
'                    on c.dstno_ecnmco_igac = d.cdgo_dstno_igac',
'                 where c.nmro_orden_igac = ''001'' ',
'                   and substr(c.rfrncia_igac,1,2)<>''00'' ',
'                   and c.dstno_ecnmco_igac in (''J'',''K'')',
'                   and c.vgncia = :P2_VGNCIA',
'                   and c.cdgo_clnte = :F_CDGO_CLNTE',
'                 group by c.dstno_ecnmco_igac,',
'                          d.nmbre_dstno_igac',
'                order by orden ',
'           ) a',
'    order by a.orden, a.dstno_ecnmco_igac'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P9_INDICADOR'
,p_plug_display_when_cond2=>'DNH'
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
 p_id=>wwv_flow_api.id(173604231907271287)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ECASTILLO'
,p_internal_uid=>171432202341682327
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173604395013271288)
,p_db_column_name=>'Destino IGAC'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Destino igac'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173604509109271289)
,p_db_column_name=>unistr('Descripci\00F3n Destino')
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Descripci\00F3n destino')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173604572880271290)
,p_db_column_name=>'No. Predios'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'No. predios'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173604661638271291)
,p_db_column_name=>unistr('Total Aval\00FAos')
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Total aval\00FAos')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(173631257416548252)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1714593'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('Destino IGAC:Descripci\00F3n Destino:No. Predios:Total Aval\00FAos')
,p_sum_columns_on_break=>unistr('No. Predios:Total Aval\00FAos')
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(173532430920126599)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(173532312679126597)
,p_button_name=>'Btn_Cancelar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(173532414650126598)
,p_name=>'P9_INDICADOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(173532312679126597)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(173532531179126600)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(173532430920126599)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(173532671864126601)
,p_event_id=>wwv_flow_api.id(173532531179126600)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
end;
/
