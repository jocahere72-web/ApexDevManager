prompt --application/pages/page_00008
begin
wwv_flow_api.create_page(
 p_id=>8
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Liquidaciones Predios Rurales'
,p_page_mode=>'MODAL'
,p_step_title=>'Liquidaciones Predios Rurales'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(164065555011707626)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_dialog_width=>'1200'
,p_last_updated_by=>'ELAFAURIE'
,p_last_upd_yyyymmddhh24miss=>'20181226093948'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173530865604126583)
,p_plug_name=>'Region Botones'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164075504857707680)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173531470322126589)
,p_plug_name=>'Pre Liquidacion Predios Rurales'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dstno_ecnmco_igac "Destino",',
unistr('                   a.dscrpcion         "Descripci\00F3n Destino",'),
'                   a.cntdad             "No. Predios",',
unistr('                   a.ttal_trrno         "Total \00C1rea Terreno",'),
unistr('                   a.ttal_cnstrda       "Total \00C1rea Construida",'),
unistr('                   a.ttal_avluos        "Total Aval\00FAos"'),
'            from (',
'                           select c.dstno_ecnmco_igac, ',
'                                  nvl(d.nmbre_dstno_igac,''NO CLASIFICADO'') dscrpcion,',
'                                  count(*) cntdad, ',
'                                  sum(c.area_trrno_igac) ttal_trrno,',
'                                  sum(c.area_cnstrda_igac) ttal_cnstrda,',
'                                  sum(c.avluo_igac) ttal_avluos,',
'                                  1 orden       ',
'                             from v_gi_g_cinta_igac c',
'                        left join df_s_destinos_igac d',
'                               on c.dstno_ecnmco_igac = d.cdgo_dstno_igac',
'                            where c.nmro_orden_igac          = ''001'' ',
'                              and substr(c.rfrncia_igac,1,2)  = ''00''',
'                              and c.vgncia = :P2_VGNCIA',
'                              and c.cdgo_clnte = :F_CDGO_CLNTE',
'                            group by c.dstno_ecnmco_igac,',
'                                     d.nmbre_dstno_igac',
'                    ) a',
'        order by a.orden,',
'                 a.dstno_ecnmco_igac'))
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
 p_id=>wwv_flow_api.id(173531579253126590)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ECASTILLO'
,p_internal_uid=>171359549687537630
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173531649073126591)
,p_db_column_name=>'Destino'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Destino'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173531784072126592)
,p_db_column_name=>unistr('Descripci\00F3n Destino')
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Descripci\00F3n destino')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173531846675126593)
,p_db_column_name=>'No. Predios'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'No. predios'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173531933751126594)
,p_db_column_name=>unistr('Total \00C1rea Terreno')
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Total \00E1rea terreno')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173532069797126595)
,p_db_column_name=>unistr('Total \00C1rea Construida')
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Total \00E1rea construida')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173532154570126596)
,p_db_column_name=>unistr('Total Aval\00FAos')
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Total aval\00FAos')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(173562931166061322)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1713910'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>unistr('Destino:Descripci\00F3n Destino:No. Predios:Total \00C1rea Terreno:Total \00C1rea Construida:Total Aval\00FAos')
,p_sum_columns_on_break=>unistr('No. Predios:Total \00C1rea Terreno:Total \00C1rea Construida:Total Aval\00FAos')
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(173531099082126585)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(173530865604126583)
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
 p_id=>wwv_flow_api.id(173530962629126584)
,p_name=>'P8_INDICADOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(173530865604126583)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(173531172848126586)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(173531099082126585)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(173531283179126587)
,p_event_id=>wwv_flow_api.id(173531172848126586)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
end;
/
