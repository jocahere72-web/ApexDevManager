prompt --application/pages/page_00336
begin
wwv_flow_api.create_page(
 p_id=>336
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Archivos de Conciliaci\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Archivos de Conciliaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20210130204410'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7815888429684516)
,p_plug_name=>'<b>Archivos</b>'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_archvo_cnclcn_arc,',
'       id_rcdo_archvo_cnclcion,',
'       1 as file_blob,',
'       file_name,',
'       file_mimetype',
'  from re_g_rcdos_archv_cnclcn_arc',
'where id_rcdo_archvo_cnclcion = :P336_ID_RCDO_ARCHVO_CNCLCION'))
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
 p_id=>wwv_flow_api.id(7815971183684517)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'AHERNANDEZ'
,p_internal_uid=>7815971183684517
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7816037570684518)
,p_db_column_name=>'ID_ARCHVO_CNCLCN_ARC'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Archvo Cnclcn Arc'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7816112389684519)
,p_db_column_name=>'ID_RCDO_ARCHVO_CNCLCION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Rcdo Archvo Cnclcion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7816229958684520)
,p_db_column_name=>'FILE_BLOB'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:RE_G_RCDOS_ARCHV_CNCLCN_ARC:FILE_BLOB:ID_ARCHVO_CNCLCN_ARC::FILE_MIMETYPE:FILE_NAME:::attachment::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7816352435684521)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Nombre de Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7816462104684522)
,p_db_column_name=>'FILE_MIMETYPE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'File Mimetype'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(7855460813027716)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'78555'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_ARCHVO_CNCLCN_ARC:ID_RCDO_ARCHVO_CNCLCION:FILE_BLOB:FILE_NAME:FILE_MIMETYPE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7816763694684525)
,p_name=>'P336_ID_RCDO_ARCHVO_CNCLCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(7815888429684516)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
