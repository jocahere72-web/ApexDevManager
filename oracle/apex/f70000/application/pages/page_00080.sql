prompt --application/pages/page_00080
begin
wwv_flow_api.create_page(
 p_id=>80
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Valorizacion Obra Predios'
,p_step_title=>'Valorizacion Obra Predios'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NARDILA'
,p_last_upd_yyyymmddhh24miss=>'20190205155142'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(75549826466325805)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'       <i>',
'           <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>                   ',
'       </i> ',
'   </b>',
'</h5>',
'<br>',
'  <i>Funcionalidad que permite visualizar mapa de calor de los predios a contribuir.</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(75550181077325808)
,p_plug_name=>'Nuevo'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select lttud lat, lngtud lng, 1 mag',
'from si_i_predios',
'where lttud is not null and lngtud is not null'))
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
 p_id=>wwv_flow_api.id(75550200077325809)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ADMIN'
,p_internal_uid=>75550200077325809
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75550393060325810)
,p_db_column_name=>'LAT'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Lat'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75550467078325811)
,p_db_column_name=>'LNG'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Lng'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75550511150325812)
,p_db_column_name=>'MAG'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Mag'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(76209689835786309)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'762097'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'LAT:LNG:MAG'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(75550644215325813)
,p_plug_name=>'Mapa'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select lttud lat, lngtud lng, 1 mag',
'from   si_i_predios c',
'where lttud is not null'))
,p_plug_source_type=>'PLUGIN_COM.JK64.HEATMAP'
,p_plug_query_num_rows=>100000
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'500'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
,p_attribute_04=>'0.5'
,p_attribute_05=>'20'
);
end;
/
