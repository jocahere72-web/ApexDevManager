prompt --application/pages/page_00107
begin
wwv_flow_api.create_page(
 p_id=>107
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Convenios Desembargo'
,p_page_mode=>'MODAL'
,p_step_title=>'Convenios Desembargo'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ABRACHE'
,p_last_upd_yyyymmddhh24miss=>'20200318164712'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(245929915140479750)
,p_plug_name=>'Convenios Desembargo'
,p_region_css_classes=>'customAlternatingRow'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.NMRO_CNVNIO,a.FCHA_APLCCION',
'  from v_gf_g_convenios a',
'  join mc_g_embargos_sjto b on A.id_sjto = b.id_sjto and b.id_embrgos_crtra = :P107_ID_EMBRGOS_CRTRA',
' where a.cdgo_cnvnio_estdo = ''APL''',
'   and A.cdgo_clnte = :F_CDGO_CLNTE',
'   and exists (select 1',
'                 from mc_g_embargos_cartera_detalle c',
'                 join gf_g_convenios_cartera d on D.vgncia = C.vgncia',
'                                              and D.id_prdo = C.id_prdo',
'                                              and D.id_cncpto = C.id_cncpto',
'                where c.id_embrgos_crtra = b.id_embrgos_crtra)'))
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
 p_id=>wwv_flow_api.id(245700039990814199)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:122:&SESSION.::&DEBUG.:RP:P122_NMRO_DCMNTO,P122_FCHA_DCMNTO:#NMRO_CNVNIO#,#FCHA_APLCCION#'
,p_detail_link_text=>'<span aria-hidden="true" class="fa fa-check-square-o"></span>'
,p_owner=>'ABRACHE'
,p_internal_uid=>245700039990814199
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122610617767713929)
,p_db_column_name=>'NMRO_CNVNIO'
,p_display_order=>10
,p_column_identifier=>'C'
,p_column_label=>'Numero de Convenio'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122610724335713930)
,p_db_column_name=>'FCHA_APLCCION'
,p_display_order=>20
,p_column_identifier=>'D'
,p_column_label=>unistr('Fecha de Aplicaci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(245959801209027203)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1230924'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_CNVNIO:FCHA_APLCCION'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(123092890464100306)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(245929915140479750)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:122:&SESSION.::&DEBUG.:RP:P122_ID_DSMBRGO_SPRTE,P122_ID_DSMBRGOS_RSLCION,P122_ID_EMBRGOS_CRTRA:&P107_ID_DSMBRGO_SPRTE.,&P107_ID_DSMBRGOS_RSLCION.,&P107_ID_EMBRGOS_CRTRA.'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55214143729092115)
,p_name=>'P107_ID_DSMBRGO_SPRTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(245929915140479750)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55214299973092116)
,p_name=>'P107_ID_DSMBRGOS_RSLCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(245929915140479750)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(123093230383100307)
,p_name=>'P107_ID_EMBRGOS_CRTRA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(245929915140479750)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
end;
/
