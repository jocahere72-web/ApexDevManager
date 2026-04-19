prompt --application/pages/page_00026
begin
wwv_flow_api.create_page(
 p_id=>26
,p_user_interface_id=>wwv_flow_api.id(22508582753660970)
,p_name=>'Titulos Ejecutivos - Detalle'
,p_page_mode=>'MODAL'
,p_step_title=>'Titulos Ejecutivos - Detalle'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'90%'
,p_last_updated_by=>'JCUAO'
,p_last_upd_yyyymmddhh24miss=>'20191017144114'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25233485429589215)
,p_plug_name=>unistr('T\00EDtulos Ejecutivos - Detalle')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52128439135074801)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  b.dscrpcion_cncpto  as  "Concepto",',
'        b.vgncia            as  "Vigencia",',
'        b.prdo              as  "Periodo",',
unistr('        b.dscrpcion_gnra_intres_mra as  "Genera Inter\00E9s",'),
'        a.vlor_cptal        as  "Valor Capital",',
unistr('        a.vlor_intres       as  "Valor Inter\00E9s"'),
'from gi_g_titulos_ejctvo_cncpto     a',
'join v_df_i_impuestos_acto_concepto b   on a.id_impsto_acto_cncpto = b.id_impsto_acto_cncpto',
'where id_ttlo_ejctvo = :P26_ID_TTLO_EJCTVO'))
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
 p_id=>wwv_flow_api.id(25233540564589216)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JCUAO'
,p_internal_uid=>25233540564589216
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25233676602589217)
,p_db_column_name=>'Concepto'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25233777463589218)
,p_db_column_name=>'Vigencia'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25234028632589221)
,p_db_column_name=>'Valor Capital'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Valor Capital'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25234479218589225)
,p_db_column_name=>'Periodo'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Periodo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25234536172589226)
,p_db_column_name=>unistr('Genera Inter\00E9s')
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Genera Inter\00E9s')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25234661492589227)
,p_db_column_name=>unistr('Valor Inter\00E9s')
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('Valor Inter\00E9s')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(25303339833727528)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'253034'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('Concepto:Vigencia:Valor Capital:Periodo:Genera Inter\00E9s:Valor Inter\00E9s')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25234394698589224)
,p_name=>'P26_ID_TTLO_EJCTVO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(25233485429589215)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
