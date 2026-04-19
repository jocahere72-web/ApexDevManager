prompt --application/pages/page_00031
begin
wwv_flow_api.create_page(
 p_id=>31
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Declaraciones pivoteo atributos'
,p_step_title=>'prueba pivoteo atributos'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'9145445'
,p_last_upd_yyyymmddhh24miss=>'20190827093401'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6257644593289916)
,p_plug_name=>'Atributos'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'FUNC_BODY_RETURNING_SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'p_id_dclrcion_tmpral		number;',
'p_id_frmlrio_rgion          number;',
'p_out 						sys_refcursor;',
'v_out 						clob;',
'o_cdgo_rspsta				number;',
'o_mnsje_rspsta				varchar2(10000);',
'',
'begin',
'    pkg_gi_declaraciones.prc_pv_dclrcn_frmlr_rgn_atrbto(p_cdgo_clnte=>:F_CDGO_CLNTE,',
'                                                         p_id_dclrcion_tmpral=>:P31_ID_DCLRCION_TMPRAL,',
'                                                         p_id_frmlrio_rgion =>:P31_ID_FRMLRIO_RGION,',
'                                                         p_out=>p_out,',
'                                                         v_out=>v_out,',
'                                                         o_cdgo_rspsta=>o_cdgo_rspsta,',
'                                                         o_mnsje_rspsta=>o_mnsje_rspsta);',
'return v_out;',
'end;',
'',
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
 p_id=>wwv_flow_api.id(6976710136343624)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'AHERNANDEZ'
,p_internal_uid=>6976710136343624
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14097710719145916)
,p_db_column_name=>'F1. CLASE DE PRODUCTO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'F1. Clase De Producto'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14098497694145917)
,p_db_column_name=>'F2. GALONES GRAVADOS'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'F2. Galones Gravados'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14099101308145917)
,p_db_column_name=>'F3. PRECIO DE REFERENCIA POR G'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'F3. Precio De Referencia Por G'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14099881938145918)
,p_db_column_name=>'F4. % ALCOHOL CARBURANTE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'F4. % Alcohol Carburante'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14100557228145918)
,p_db_column_name=>'F5. BASE GRAVABLE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'F5. Base Gravable'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14101214585145919)
,p_db_column_name=>'F6. SOBRETASA'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'F6. Sobretasa'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(7087942384624628)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'70880'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'F1. CLASE DE PRODUCTO:F2. GALONES GRAVADOS:F3. PRECIO DE REFERENCIA POR G:F4. % ALCOHOL CARBURANTE:F5. BASE GRAVABLE:F6. SOBRETASA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6974752870343604)
,p_plug_name=>'Declaraciones Temporales Atributos '
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6976005343343617)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(6974752870343604)
,p_button_name=>'Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6974820897343605)
,p_name=>'P31_ID_DCLRCION_TMPRAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6974752870343604)
,p_prompt=>unistr('Declaraci\00F3n Temporal')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select distinct("Descripci\00F3n del Formulario"||'' ''||id_dclrcion_tmpral) as Descripci\00F3n,id_dclrcion_tmpral'),
'from V_GI_G_DECLARACIONES_TEMPORAL',
'where cdgo_clnte=:F_CDGO_CLNTE',
'order by id_dclrcion_tmpral;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7341252331201602)
,p_name=>'P31_ID_FRMLRIO_RGION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(6974752870343604)
,p_prompt=>'Region'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select distinct("Descripci\00F3n de la Region"),id_frmlrio_rgion '),
'from v_gi_g_declaraciones_temporal ',
'where id_dclrcion_tmpral =:P31_ID_DCLRCION_TMPRAL;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P31_ID_DCLRCION_TMPRAL'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6979078487343647)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Sincronizar de Columnas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'p_id_dclrcion_tmpral		number;',
'v_out 						clob;',
'p_out 						sys_refcursor;',
'o_cdgo_rspsta				number;',
'o_mnsje_rspsta				varchar2(10000);',
'l_flow_id                   NUMBER (20);',
'l_region_id                 NUMBER (20);',
'l_query                     VARCHAR2 (4000);',
'l_result                    VARCHAR2 (4000);',
'l_id                        number;',
'',
'BEGIN',
'   LOCK TABLE APEX_190100.WWV_FLOW_WORKSHEET_COLUMNS  IN EXCLUSIVE MODE;',
'   ',
'',
'    pkg_gi_declaraciones.prc_pv_dclrcn_frmlr_rgn_atrbto(p_cdgo_clnte=>:F_CDGO_CLNTE,',
'                                                         p_id_dclrcion_tmpral=>:P31_ID_DCLRCION_TMPRAL,',
'                                                         p_id_frmlrio_rgion =>:P31_ID_FRMLRIO_RGION,',
'                                                         p_out=>p_out,',
'                                                         v_out=>v_out,',
'                                                         o_cdgo_rspsta=>o_cdgo_rspsta,',
'                                                         o_mnsje_rspsta=>o_mnsje_rspsta);',
' ',
'   ',
'   l_query := v_out;',
'   wwv_flow_api.set_security_group_id(apex_util.find_security_group_id(''INFORTRIBUTOS''));',
'',
'   SELECT application_id, region_id',
'   INTO l_flow_id, l_region_id',
'   FROM apex_application_page_ir',
'   WHERE page_id = :APP_PAGE_ID AND application_id = :APP_ID;',
'',
'       ',
'       APEX_190100.wwv_flow_worksheet_standard.synch_report_columns (  p_flow_id => l_flow_id,',
'                                                                       p_region_id => l_region_id,',
'                                                                       p_query => l_query,',
'                                                                       p_add_new_cols_to_default_rpt => ''Y'');',
'      ',
' ',
'END;',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6979272122343649)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Sincronizar Cargar Pagina'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'p_id_dclrcion_tmpral		number;',
'p_id_frmlrio_rgion          number;',
'v_out 						clob;',
'p_out 						sys_refcursor;',
'o_cdgo_rspsta				number;',
'o_mnsje_rspsta				varchar2(10000);',
'l_flow_id                   NUMBER (20);',
'l_region_id                 NUMBER (20);',
'l_query                     VARCHAR2 (4000);',
'l_result                    VARCHAR2 (4000);',
'l_id                        number;',
'',
'BEGIN',
'   LOCK TABLE APEX_190100.WWV_FLOW_WORKSHEET_COLUMNS  IN EXCLUSIVE MODE;',
'   ',
'    pkg_gi_declaraciones.prc_pv_dclrcn_frmlr_rgn_atrbto(p_cdgo_clnte=>:F_CDGO_CLNTE,',
'                                                         p_id_dclrcion_tmpral=>:P31_ID_DCLRCION_TMPRAL,',
'                                                         p_id_frmlrio_rgion =>:P31_ID_FRMLRIO_RGION,',
'                                                         p_out=>p_out,',
'                                                         v_out=>v_out,',
'                                                         o_cdgo_rspsta=>o_cdgo_rspsta,',
'                                                         o_mnsje_rspsta=>o_mnsje_rspsta);',
'                                                         ',
'                                                    ',
'                                                         ',
'   l_query := v_out;',
'   wwv_flow_api.set_security_group_id(apex_util.find_security_group_id(''INFORTRIBUTOS''));',
'',
'   SELECT application_id, region_id',
'   INTO l_flow_id, l_region_id',
'   FROM apex_application_page_ir',
'   WHERE page_id = :APP_PAGE_ID AND application_id = :APP_ID;',
'',
'   APEX_190100.wwv_flow_worksheet_standard.synch_report_columns (  p_flow_id => l_flow_id,',
'                                                                       p_region_id => l_region_id,',
'                                                                       p_query => l_query,',
'                                                                       p_add_new_cols_to_default_rpt => ''Y'');',
'      ',
'',
'END;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
