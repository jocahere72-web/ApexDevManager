prompt --application/pages/page_00049
begin
wwv_flow_api.create_page(
 p_id=>49
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>unistr('Finalizaci\00F3n Novedad')
,p_step_title=>unistr('Finalizaci\00F3n Novedad')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'RROBLEDO'
,p_last_upd_yyyymmddhh24miss=>'20210323154248'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(101632332286416501)
,p_plug_name=>'Flujo'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88515074654834653)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(101788510618620601)
,p_plug_name=>'Novedades'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select s.id_nvdad_vhclo, ',
'       s.id_instncia_fljo,',
'       s.id_impsto,',
'       s.id_impsto_sbmpsto,',
'       s.id_sjto_impsto,',
'       r.idntfccion_sjto, ',
'       e.dscrpcion,',
'       s.fcha_rgstro,',
'       u.user_name',
' from si_g_novedades_vehiculo s',
' join v_si_i_sujetos_impuesto r on r.id_sjto_impsto = s.id_sjto_impsto',
' join si_d_novedades_tipo  e on s.cdgo_nvda_tpo = e.cdgo_nvdad_tpo and e.cdgo_sjto_tpo = ''V''',
' join sg_g_usuarios u on u.id_usrio = s.id_usrio and s.id_nvdad_vhclo = :P49_ID_NOVEDAD'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
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
 p_id=>wwv_flow_api.id(101821609415115417)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'RROBLEDO'
,p_internal_uid=>101821609415115417
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101821758190115418)
,p_db_column_name=>'ID_NVDAD_VHCLO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Nvdad Vhclo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101821856502115419)
,p_db_column_name=>'ID_INSTNCIA_FLJO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Instncia Fljo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101821949947115420)
,p_db_column_name=>'ID_IMPSTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101822016284115421)
,p_db_column_name=>'ID_IMPSTO_SBMPSTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Id Impsto Sbmpsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101822180251115422)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101822255904115423)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101822384266115424)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Novedad'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101822443822115425)
,p_db_column_name=>'FCHA_RGSTRO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Fecha Novedad'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101822592594115426)
,p_db_column_name=>'USER_NAME'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Usuario'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(101850225372142770)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1018503'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_NVDAD_VHCLO:ID_INSTNCIA_FLJO:ID_IMPSTO:ID_IMPSTO_SBMPSTO:ID_SJTO_IMPSTO:IDNTFCCION_SJTO:DSCRPCION:FCHA_RGSTRO:USER_NAME'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(101820073198115401)
,p_plug_name=>'Novedad_detalle'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.atrbto,d.vlor_nvo,d.vlor_antrior,d.fcha_dgta,d.user_dgta  from si_g_novedades_vhclo_dtlle d',
'where d.id_nvdad_vhclo = :P49_ID_NOVEDAD;'))
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
 p_id=>wwv_flow_api.id(101853984274193901)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_detail_view_enabled_yn=>'Y'
,p_owner=>'RROBLEDO'
,p_internal_uid=>101853984274193901
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101854017814193902)
,p_db_column_name=>'ATRBTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Modificaciones'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101854113899193903)
,p_db_column_name=>'VLOR_NVO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Valor Nuevo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101854299267193904)
,p_db_column_name=>'VLOR_ANTRIOR'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Valor Anterior'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101854317998193905)
,p_db_column_name=>'FCHA_DGTA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Fecha'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(101854408799193906)
,p_db_column_name=>'USER_DGTA'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'User Dgta'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(101864898576205040)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1018649'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ATRBTO:VLOR_NVO:VLOR_ANTRIOR:FCHA_DGTA:USER_DGTA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(208764859173417302)
,p_plug_name=>'Adjunto_archivos'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select id_adjntos_vhclo',
'     , file_name  as Nombre_archivo',
'     , fcha as Fecha_archivo',
'  --   , file_blob',
'     , 1 DESCARGAR',
'  from gi_g_adjuntos_vehiculo',
' where id_sjto_impsto = :P49_SJTO_IMPSTO and to_char(fcha,''yyyymmdd'') = to_char(sysdate,''yyyymmdd'')  and orgn = ''NOV'';'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1',
'  from gi_g_adjuntos_vehiculo',
' where id_sjto_impsto = :P49_SJTO_IMPSTO and to_char(fcha,''yyyymmdd'') = to_char(sysdate,''yyyymmdd'')  and orgn = ''NOV'';'))
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
 p_id=>wwv_flow_api.id(208764962029417303)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'RROBLEDO'
,p_internal_uid=>208764962029417303
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104502578817062210)
,p_db_column_name=>'ID_ADJNTOS_VHCLO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Adjntos Vhclo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104502957881062211)
,p_db_column_name=>'DESCARGAR'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:GI_G_ADJUNTOS_VEHICULO:FILE_BLOB:ID_ADJNTOS_VHCLO::::::attachment:<span class="fa fa-cloud-download" aria-hidden="true"></span>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104503305011062212)
,p_db_column_name=>'NOMBRE_ARCHIVO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Nombre Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104503756517062212)
,p_db_column_name=>'FECHA_ARCHIVO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Fecha Archivo'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(208772509202505628)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1045041'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NOMBRE_ARCHIVO:FECHA_ARCHIVO:DESCARGAR:'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101797604020688202)
,p_name=>'P49_ID_NOVEDAD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(101788510618620601)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
