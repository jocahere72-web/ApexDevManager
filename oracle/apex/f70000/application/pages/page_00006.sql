prompt --application/pages/page_00006
begin
wwv_flow_api.create_page(
 p_id=>6
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Predios Rurales'
,p_page_mode=>'MODAL'
,p_step_title=>'Predios Rurales'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(164065555011707626)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_dialog_width=>'1200'
,p_last_updated_by=>'ELAFAURIE'
,p_last_upd_yyyymmddhh24miss=>'20181226093636'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(172698233356212805)
,p_plug_name=>unistr('<b>Estad\00EDsticas de Predios Rurales</b>')
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
'                        left join v_df_s_destinos_igac e',
'                               on c.dstno_ecnmco_igac = e.cdgo_dstno_igac ',
'                            where c.nmro_orden_igac            =  ''001'' ',
'                              and substr(c.rfrncia_igac,1,2 )  =  ''00''',
'                              and c.cdgo_clnte = :F_CDGO_CLNTE',
'                              and c.vgncia = :P2_VGNCIA',
'                            group by c.dstno_ecnmco_igac, ',
'                                     e.nmbre_dstno_igac',
'                 ) a',
'          order by a.orden,',
'                   a.dstno_ecnmco_igac'))
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
 p_id=>wwv_flow_api.id(173528661481126561)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ECASTILLO'
,p_internal_uid=>171356631915537601
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173528736461126562)
,p_db_column_name=>'Destino'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Destino'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173528886522126563)
,p_db_column_name=>unistr('Descripci\00F3n Destino')
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Descripci\00F3n destino')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173529028906126564)
,p_db_column_name=>'No. Predios'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'No. predios'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173529063197126565)
,p_db_column_name=>unistr('Total Aval\00FAos')
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Total aval\00FAos')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(173537248721147147)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1713653'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>unistr('Destino:Descripci\00F3n Destino:No. Predios:Total Aval\00FAos')
,p_sum_columns_on_break=>unistr('No. Predios:Total Aval\00FAos')
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(172698364189212806)
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
 p_id=>wwv_flow_api.id(175283174325275572)
,p_plug_name=>'Region de Anexo'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_api.id(164075504857707680)
,p_plug_display_sequence=>15
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(172698489552212807)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(172698364189212806)
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
 p_id=>wwv_flow_api.id(175283290367275573)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(175283174325275572)
,p_button_name=>'Btn_Anexo_02_C'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Exportar Anexo 02 C'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP,11::'
,p_icon_css_classes=>'fa-file-arrow-down'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172698817367212810)
,p_name=>'P6_INDICADOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(172698364189212806)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(172698604500212808)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(172698489552212807)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(172698658788212809)
,p_event_id=>wwv_flow_api.id(172698604500212808)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(175283107004275571)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cambiar Valor Anexo 02 C'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    :F_NMBRE_ARCHVO := ''Anexo_''||:P40_VGNCIA||''_02_C'';',
'    ',
'     begin',
'         select vlor',
'           into :F_SQL',
'           from df_c_definiciones_cliente',
'          where cdgo_clnte = :F_CDGO_CLNTE',
'            and cdgo_dfncion_clnte = ''A2C'';',
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
,p_process_when_button_id=>wwv_flow_api.id(175283290367275573)
);
end;
/
