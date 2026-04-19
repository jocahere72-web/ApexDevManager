prompt --application/pages/page_00264
begin
wwv_flow_api.create_page(
 p_id=>264
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Detalle Compensaci\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Aplicaci\00F3n de la Compensaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'60%'
,p_last_updated_by=>'HMARTINEZ'
,p_last_upd_yyyymmddhh24miss=>'20200709173120'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39345787586121303)
,p_plug_name=>unistr('Aplicaci\00F3n de la Compensaci\00F3n')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  d.dscrpcion,',
'        b.vlor_cmpnscion',
'from gf_g_sldos_fvr_cmpnscn_dtll  b',
'join df_i_conceptos               d on b.id_cncpto  =   d.id_cncpto',
'where b.id_sldo_fvor =    :P264_ID_SLD_FVR ',
'and   b.id_sld_fvr_cmpnscion = :P264_ID_SLD_FVR_CMPNSCION ',
'and   b.vgncia  = :P264_VGNCIA ',
'and   b.id_prdo = :P264_ID_PRDO',
'and   b.id_mvmnto_fncro = :P264_ID_MVMNTO_FNCRO'))
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
 p_id=>wwv_flow_api.id(39345895947121304)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LTORRES'
,p_internal_uid=>39345895947121304
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(45862163169169101)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>50
,p_column_identifier=>'O'
,p_column_label=>'Conceptos'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39346231669121308)
,p_db_column_name=>'VLOR_CMPNSCION'
,p_display_order=>60
,p_column_identifier=>'D'
,p_column_label=>'Valor Compensado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(39372468808247407)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'393725'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION:VLOR_CMPNSCION:'
,p_sum_columns_on_break=>'VLOR_CMPNSCION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13776051304155801)
,p_name=>'P264_ID_MVMNTO_FNCRO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(39345787586121303)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39347227479121318)
,p_name=>'P264_ID_SLD_FVR_CMPNSCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(39345787586121303)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45862207380169102)
,p_name=>'P264_ID_SLD_FVR'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(39345787586121303)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46272483074379104)
,p_name=>'P264_VGNCIA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(39345787586121303)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46272582864379105)
,p_name=>'P264_ID_PRDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(39345787586121303)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
