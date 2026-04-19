prompt --application/pages/page_00005
begin
wwv_flow_api.create_page(
 p_id=>5
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Predios Urbanos'
,p_page_mode=>'MODAL'
,p_step_title=>'Predios Urbanos'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(164065555011707626)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_dialog_width=>'1200'
,p_last_updated_by=>'ELAFAURIE'
,p_last_upd_yyyymmddhh24miss=>'20181226093457'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(172695877796212781)
,p_plug_name=>'<b>Predios Urbanos Segun Destino Economico</b>'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dstno_ecnmco_igac  "Destino",',
unistr('                 a.dscrpcion          "Descripci\00F3n Destino",'),
'                 a.cntdad             "No. Predios",',
unistr('                 a.ttal_avluos        "Total Aval\00FAos"'),
'            from (',
'                           select c.dstno_ecnmco_igac, ',
'                                  nvl(e.nmbre_dstno_igac,''NO CLASIFICADO'') dscrpcion,',
'                                  count(*) cntdad , ',
'                                  sum(c.avluo_igac) ttal_avluos,',
'                                  1 orden',
'                             from v_gi_g_cinta_igac c',
'                        left join df_s_destinos_igac e',
'                               on c.dstno_ecnmco_igac = e.cdgo_dstno_igac ',
'                            where c.nmro_orden_igac            =  ''001'' ',
'                              and substr(c.rfrncia_igac,1,2 )  <>  ''00''',
'                              and c.cdgo_clnte = :F_CDGO_CLNTE',
'                              and c.vgncia = :P2_VGNCIA',
'                            group by c.dstno_ecnmco_igac, ',
'                                     e.nmbre_dstno_igac',
'                 ) a',
'          order by a.orden,',
'                   a.dstno_ecnmco_igac'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P5_INDICADOR'
,p_plug_display_when_cond2=>'DE'
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
 p_id=>wwv_flow_api.id(172696082619212783)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ECASTILLO'
,p_internal_uid=>170524053053623823
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172696188632212784)
,p_db_column_name=>'Destino'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Destino'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172696237141212785)
,p_db_column_name=>unistr('Descripci\00F3n Destino')
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Descripci\00F3n destino')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172696365000212786)
,p_db_column_name=>'No. Predios'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'No. predios'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172696456862212787)
,p_db_column_name=>unistr('Total Aval\00FAos')
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Total aval\00FAos')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(173510734406988824)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1713388'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>unistr('Destino:Descripci\00F3n Destino:No. Predios:Total Aval\00FAos')
,p_sum_columns_on_break=>unistr('No. Predios:Total Aval\00FAos')
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(172696629289212788)
,p_plug_name=>'Botones'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164075504857707680)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(172697590098212798)
,p_plug_name=>'<b>Predios Urbanos de destino habitacional por estrato</b>'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'         select ''HABITACIONAL'' "Destino" ,',
'                nvl(c.estrato_d, ''Estrato 99 - Nuevos'') "Estrato" ,',
'                c.cntdad "Total Predios" , ',
unistr('                c.ttal_avluos "Total Aval\00FAos"'),
'           from (       ',
'                  select b.estrato ,',
'                         r.dscrpcion_estrto estrato_d, ',
'                         count(*) cntdad , ',
'                         sum(b.avluo) Ttal_avluos      ',
'                    from (',
'                                 select a.rfrncia_igac ,',
'                                        a.avluo ,',
'                                        nvl(a.estrto, ''98'') estrato',
'                                  from (',
'                                            select c.rfrncia_igac ,',
'                                                   c.avluo_igac avluo,',
'                                                   g.cdgo_estrto estrto',
'                                              from v_gi_g_cinta_igac c',
'                                              ',
'                                         left join v_si_i_sujetos_impuesto f',
'                                                on c.rfrncia_igac = f.idntfccion',
'                                         left join v_si_i_predios g',
'                                                on f.id_sjto_impsto = g.id_sjto_impsto',
'                                              ',
'                                             where c.nmro_orden_igac          =  ''001'' ',
'                                               and substr(c.rfrncia_igac,1,2) <> ''00''',
'                                               and c.dstno_ecnmco_igac = ''A''',
'                                               and c.vgncia = :P2_VGNCIA',
'                                               and c.cdgo_clnte = :F_CDGO_CLNTE',
'                                               ',
'                                       ) a ',
'                         ) b',
'               left join df_s_estratos r',
'                      on b.estrato = r.cdgo_estrto',
'                   where b.estrato <> ''1''',
'                   group by b.estrato, ',
'                            r.dscrpcion_estrto',
'                   order by b.estrato',
'                 ) c'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P5_INDICADOR'
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
 p_id=>wwv_flow_api.id(172697657561212799)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ECASTILLO'
,p_internal_uid=>170525627995623839
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172697746598212800)
,p_db_column_name=>'Destino'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Destino'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172697888007212801)
,p_db_column_name=>'Estrato'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Estrato'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172698024922212802)
,p_db_column_name=>'Total Predios'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Total predios'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172698090280212803)
,p_db_column_name=>unistr('Total Aval\00FAos')
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Total aval\00FAos')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(173518990723067778)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1713470'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>unistr('Destino:Estrato:Total Predios:Total Aval\00FAos')
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(175285897587275599)
,p_plug_name=>'Region de Anexos'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_api.id(164075504857707680)
,p_plug_display_sequence=>25
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(172696639436212789)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(172696629289212788)
,p_button_name=>'Btn_Cancelar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(175285952175275600)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(175285897587275599)
,p_button_name=>'Btn_Anexo_09_01'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Exportar Anexo 09 01'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP,11::'
,p_button_condition=>'P5_INDICADOR'
,p_button_condition2=>'DH'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-file-arrow-down'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172695952613212782)
,p_name=>'P5_INDICADOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(172696629289212788)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(172696776441212790)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(172696639436212789)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(172696927502212791)
,p_event_id=>wwv_flow_api.id(172696776441212790)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(175286089630275601)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Valores Anexo 09 01'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    :F_NMBRE_ARCHVO := ''Anexo_''||:P40_VGNCIA||''_09_01'';',
'    ',
'     begin',
'         select vlor',
'           into :F_SQL',
'           from df_c_definiciones_cliente',
'          where cdgo_clnte = :F_CDGO_CLNTE',
'            and cdgo_dfncion_clnte = ''A91'';',
'         exception when no_data_found ',
'              then',
'              :F_SQL := '''';',
'     end;',
'     ',
'     :F_SQL := replace( :F_SQL , ''!VGNCIA!'' , :P40_VGNCIA);',
'     :F_SQL := replace( :F_SQL , ''!CLNTE!'' , :F_CDGO_CLNTE);',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(175285952175275600)
,p_process_when=>'P5_INDICADOR'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'DH'
);
end;
/
