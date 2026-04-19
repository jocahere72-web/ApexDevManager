prompt --application/pages/page_20250_002
begin
wwv_flow_api.create_page(
 p_id=>2025031
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Actos Generados T\00EDtulos Judicial ')
,p_page_mode=>'MODAL'
,p_step_title=>'Actos Generados'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'90%'
,p_last_updated_by=>'ACONDE'
,p_last_upd_yyyymmddhh24miss=>'20250619144502'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5542755959032407)
,p_plug_name=>'Actos'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   a.id_ttlo_jdcial        ',
'        ,a.id_instncia_fljo    ',
'        ,c.id_acto',
'        ,c.nmro_acto',
'        ,trunc(c.fcha_acto) as fcha_acto',
'        ,case when id_acto is not null',
'                then ''<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" aria-labelledby="id_tareas_ig_grid_vc_ctx id_tareas_ig_grid_vc_cur">Ver PDF <span class="fa fa-eye"></span>',
'                    </button>''',
'        else '' ''',
'        end as pdf,',
'        a.nmro_ttlo_jdcial,',
'        c.dscrpcion_acto_tpo',
'from gf_g_titulos_judicial a',
'left join v_gf_g_titulos_jdcial_dcmnto c on a.id_ttlo_jdcial = c.id_ttlo_jdcial',
'where a.id_ttlo_jdcial = :P2025031_ID_TTLO_JDCIAL;'))
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
 p_id=>wwv_flow_api.id(5542859505032408)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ACONDE'
,p_internal_uid=>5542859505032408
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5542911712032409)
,p_db_column_name=>'ID_TTLO_JDCIAL'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Ttlo Jdcial'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5543077716032410)
,p_db_column_name=>'ID_INSTNCIA_FLJO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Instncia Fljo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5543187807032411)
,p_db_column_name=>'ID_ACTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Acto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5543217462032412)
,p_db_column_name=>'NMRO_ACTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('N\00FAmero De Acto')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5543343036032413)
,p_db_column_name=>'FCHA_ACTO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Fecha De Acto'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5543480422032414)
,p_db_column_name=>'PDF'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'PDF'
,p_column_link=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,file_blob,file_name,file_mimetype,id_acto,#ID_ACTO#'
,p_column_linktext=>'#PDF#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5560506185461401)
,p_db_column_name=>'NMRO_TTLO_JDCIAL'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('N\00FAmero <br>T\00EDtulo Judicial')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5560656709461402)
,p_db_column_name=>'DSCRPCION_ACTO_TPO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Tipo De Acto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(5555892507428328)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'55559'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_TTLO_JDCIAL:NMRO_ACTO:FCHA_ACTO:DSCRPCION_ACTO_TPO:PDF:'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5543695541032416)
,p_name=>'P2025031_ID_TTLO_JDCIAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5542755959032407)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5543829952032418)
,p_name=>'P2025031_NMRO_TTLO_JDCIAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5542755959032407)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
end;
/
