prompt --application/pages/page_00213
begin
wwv_flow_api.create_page(
 p_id=>213
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Resoluciones por Sucursal '
,p_page_mode=>'MODAL'
,p_step_title=>'Resoluciones por Sucursal '
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(164066978207707637)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'70%'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20210616113824'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22009976902733522)
,p_plug_name=>unistr('Consultar resoluci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22010392338733526)
,p_plug_name=>'Resoluciones '
,p_parent_plug_id=>wwv_flow_api.id(22009976902733522)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_rslcion',
'     , id_sjto_impsto',
'     , nmro_rslcion',
'     , fcha_rslcion',
'     , fcha_incial',
'     , fcha_fnal',
'     , file_name',
'     , 1 as dscrgar',
'     , case when trunc(sysdate) >= trunc(fcha_incial) and trunc(sysdate) <= trunc(fcha_fnal) then',
'                ''Vigente''',
'            else',
'                ''Vencida''',
'       end as stdo',
'  from si_d_resoluciones',
' where id_sjto_impsto = :P213_ID_SJTO_IMPSTO',
'   and id_sjto_scrsal = :P213_ID_SCRSAL'))
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
 p_id=>wwv_flow_api.id(22010480528733527)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato ')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:171:&SESSION.::&DEBUG.:RP:P171_ID_RSLCION:#ID_RSLCION#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'AHERNANDEZ'
,p_internal_uid=>22010480528733527
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13908093623869700)
,p_db_column_name=>'ID_RSLCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Rslcion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13908475377869702)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13908823393869702)
,p_db_column_name=>'NMRO_RSLCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Nro. Resoluci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13909219080869703)
,p_db_column_name=>'FCHA_RSLCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Fecha Resoluci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13909689090869704)
,p_db_column_name=>'FCHA_INCIAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Fecha Inicial'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13910056197869704)
,p_db_column_name=>'FCHA_FNAL'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Fecha Final'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13910472261869704)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13910873637869705)
,p_db_column_name=>'DSCRGAR'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Descargar '
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:SI_D_RESOLUCIONES:FILE_BLOB:ID_RSLCION::FILE_MIMETYPE:FILE_NAME:::attachment:<span class="fa fa-cloud-download" aria-hidden="true"></span>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13911237547869705)
,p_db_column_name=>'STDO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(22061261912943279)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'139116'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_RSLCION:FCHA_RSLCION:FCHA_INCIAL:FCHA_FNAL:STDO:DSCRGAR:'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13906126752869693)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(22009976902733522)
,p_button_name=>'Btn_agregar_resolucion'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Agregar Resoluci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-file-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(13912198716869711)
,p_branch_name=>unistr('Agregar resoluci\00F3n ')
,p_branch_action=>'f?p=&APP_ID.:171:&SESSION.::&DEBUG.:RP,171:P171_ID_SJTO_IMPSTO,P171_ID_SCRSAL:&P213_ID_SJTO_IMPSTO.,&P213_ID_SCRSAL.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(13906126752869693)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13906562560869694)
,p_name=>'P213_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(22009976902733522)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13906973317869696)
,p_name=>'P213_ID_SJTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(22009976902733522)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13907381018869699)
,p_name=>'P213_ID_SCRSAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(22009976902733522)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
