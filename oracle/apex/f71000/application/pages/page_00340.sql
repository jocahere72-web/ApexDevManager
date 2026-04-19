prompt --application/pages/page_00340
begin
wwv_flow_api.create_page(
 p_id=>340
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Soportes de saldo a favor'
,p_page_mode=>'MODAL'
,p_step_title=>'Saldos a Favor soportes'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'LTORRES'
,p_last_upd_yyyymmddhh24miss=>'20210419073005'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(109296095911574701)
,p_plug_name=>'Container'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(109296292213574703)
,p_plug_name=>'Soportes'
,p_parent_plug_id=>wwv_flow_api.id(109296095911574701)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_sldo_fvor_sprte ,',
'       id_sldo_fvor ,',
'       file_blob ,',
'       file_name ,',
'       file_mimetype ,',
'        decode(dbms_lob.getlength( a.file_blob ) , 0 , null , dbms_lob.getlength( a.file_blob )) as dscrgar',
'from gf_g_saldos_favor_soporte a',
'where id_sldo_fvor = :P340_ID_SLDO_FVOR;'))
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
 p_id=>wwv_flow_api.id(109296337280574704)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LTORRES'
,p_internal_uid=>109296337280574704
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(109296495028574705)
,p_db_column_name=>'ID_SLDO_FVOR_SPRTE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Sldo Fvor Sprte'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(109296572481574706)
,p_db_column_name=>'ID_SLDO_FVOR'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Sldo Fvor'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(109296645461574707)
,p_db_column_name=>'FILE_BLOB'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'File Blob'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(109296700115574708)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(109296839557574709)
,p_db_column_name=>'FILE_MIMETYPE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'File Mimetype'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(109297016414574711)
,p_db_column_name=>'DSCRGAR'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Descargar'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:GF_G_SALDOS_FAVOR_SOPORTE:FILE_BLOB:ID_SLDO_FVOR_SPRTE::FILE_MIMETYPE:FILE_NAME:::attachment:<span class="fa fa-download" aria-hidden="true"></span>:'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(109305224375600978)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1093053'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_SLDO_FVOR_SPRTE:ID_SLDO_FVOR:FILE_BLOB:FILE_NAME:FILE_MIMETYPE:DSCRGAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109296136527574702)
,p_name=>'P340_ID_SLDO_FVOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(109296095911574701)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
