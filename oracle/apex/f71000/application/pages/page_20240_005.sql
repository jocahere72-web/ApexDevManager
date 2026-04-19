prompt --application/pages/page_20240_005
begin
wwv_flow_api.create_page(
 p_id=>2024009
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Lote Ajustes Masivos'
,p_step_title=>'Lote Ajustes Masivos'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_css_file_urls=>'#IMAGE_PREFIX#css/infortributos/utilidades.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#registros_en_archivo .u-colors>:nth-child(45n+1) .u-color {',
' color: #fff;',
'     background-color: green;',
'--font-weight: bold;',
' font-size: 25px;    ',
'    ',
'}',
'',
'#Total_Sjtos_Imp_Vldos .u-colors>:nth-child(45n+1) .u-color {',
' color: #fff;',
' background-color: #ffa6f8;',
'-- font-weight: bold; ',
' font-size: 25px;',
'     ',
'}',
'',
'#Total_Sjtos_Imp_NO_Vldos .u-colors>:nth-child(45n+1) .u-color {',
' color: #fff;',
' background-color: red;',
'-- font-weight: bold; ',
' font-size: 25px;',
'     ',
'}',
'',
'#registros_bloqueados .u-colors>:nth-child(45n+1) .u-color {',
' color: #fff;',
' background-color: #00b7e2;',
'-- font-weight: bold; ',
' font-size: 25px;',
'      ',
'}',
'',
'#registros_sin_saldo .u-colors>:nth-child(45n+1) .u-color {',
'    color: #fff;',
'    background-color: orange;',
'    font-size: 25px;   ',
'}',
'',
'',
'#registros_duplicados .u-colors>:nth-child(45n+1) .u-color {',
'    color: #fff;',
'    background-color: #CE88F7;',
'    font-size: 25px;',
'}',
'',
'.t-BadgeList--circular.t-BadgeList--large .t-BadgeList-label {',
'    font-size: 14px;',
'    padding: 0.5px 8px;',
'}',
'',
'.t-Region .t-Region-body {',
'    padding: 7px;',
'}',
'	',
'.t-Region {',
'    margin-bottom: 0px;',
'}',
''))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NCARRASQUILLA'
,p_last_upd_yyyymmddhh24miss=>'20241025165553'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(56903231608173345)
,p_plug_name=>'Consolidado'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(56903183315173344)
,p_plug_name=>'Consolidado Total Registros de la consulta'
,p_region_name=>'Consolidado_Total'
,p_parent_plug_id=>wwv_flow_api.id(56903231608173345)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-top-sm:margin-bottom-sm:margin-left-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_grid_column_css_classes=>'badgeListColor1'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Total Registros'' label,',
'       count(c001) value',
'  from gn_g_temporal ',
' where id_ssion = :APP_SESSION'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(56903357653173346)
,p_plug_name=>'Consolidado Total Sujetos Tributos Validos'
,p_parent_plug_id=>wwv_flow_api.id(56903231608173345)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-top-sm:margin-bottom-sm:margin-right-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Sujetos Validos'' label,',
'       count(c002) value',
'  from gn_g_temporal ',
' where id_ssion = :APP_SESSION',
'   and c005 = ''VLD'''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(56903423542173347)
,p_plug_name=>'Consolidado Total Sujetos Tributos NO Validos'
,p_parent_plug_id=>wwv_flow_api.id(56903231608173345)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-bottom-sm:margin-left-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>60
,p_plug_grid_column_css_classes=>'badgeListColor3'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Sujetos NO Validos'' label,',
'       count(c002) value',
'  from gn_g_temporal ',
' where id_ssion = :APP_SESSION',
'   and c005 = ''NVD'''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(56903585134173348)
,p_plug_name=>'Consolidado Total Sujetos Tributos Bloqueados'
,p_parent_plug_id=>wwv_flow_api.id(56903231608173345)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>80
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor4'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Sujetos Bloqueados'' label,',
'       count(c002) value',
'  from gn_g_temporal ',
' where id_ssion = :APP_SESSION',
'   and c005 = ''BLQ'''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(56903636751173349)
,p_plug_name=>'Consolidado Total Sujetos Tributos Sin Saldo'
,p_parent_plug_id=>wwv_flow_api.id(56903231608173345)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>100
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor5'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Sujetos con Deuda Fuera de Rango'' label,',
'       count(c002) value',
'  from gn_g_temporal ',
' where id_ssion = :APP_SESSION',
'   and c005 = ''SNS'''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(56903789968173350)
,p_plug_name=>'Consolidado Registros Duplicados'
,p_parent_plug_id=>wwv_flow_api.id(56903231608173345)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>120
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor1'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Sujetos Duplicados'' label,',
'       count(c002) value',
'  from gn_g_temporal ',
' where id_ssion = :APP_SESSION',
'   and c005 = ''DPC'''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(58730584007537879)
,p_plug_name=>'Consolidado Registros con Determinaciones'
,p_parent_plug_id=>wwv_flow_api.id(56903231608173345)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:margin-bottom-sm:margin-right-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>130
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'badgeListColor1'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Sujeos Determinados'' label,',
'       count(c002) value',
'  from gn_g_temporal ',
' where id_ssion = :APP_SESSION',
'   and c005 = ''DTM'''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(377729176375053599)
,p_plug_name=>'Sujetos Tributos NO Validos'
,p_region_name=>'datos_archivo_no_validos'
,p_parent_plug_id=>wwv_flow_api.id(56903231608173345)
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_plug_template=>wwv_flow_api.id(177331524321050607)
,p_plug_display_sequence=>150
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select n002, -- No. Linea',
'       n001, -- Id Sujeto Impuesto ',
unistr('       c001, -- Identificaci\00F3n'),
'       c002, -- Indicador Existe',
unistr('       c003, -- Direcci\00F3n'),
'       c004 -- Nombre Responsable',
'  from gn_g_temporal ',
' where id_ssion = :APP_SESSION',
'   and c005 = ''NVD'''))
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
 p_id=>wwv_flow_api.id(378437088083943188)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>378437088083943188
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6219764783384357)
,p_db_column_name=>'N002'
,p_display_order=>10
,p_column_identifier=>'F'
,p_column_label=>unistr('No. L\00EDnea')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6217702143384354)
,p_db_column_name=>'N001'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'N001'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6218169830384355)
,p_db_column_name=>'C001'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6218503218384356)
,p_db_column_name=>'C002'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Existe?'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6218932466384356)
,p_db_column_name=>'C003'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6219336106384356)
,p_db_column_name=>'C004'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Nombre Responsable'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(378452159822953545)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'62201'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'N002:C001:C002:C003:C004:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(378439118182943208)
,p_plug_name=>'Registros Duplicados'
,p_region_name=>'datos_archivo_duplicados'
,p_parent_plug_id=>wwv_flow_api.id(56903231608173345)
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177331524321050607)
,p_plug_display_sequence=>180
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select n002, -- No. Linea',
unistr('       c001, -- Identificaci\00F3n'),
'       c002, -- Indicador Existe',
unistr('       c003, -- Direcci\00F3n'),
'       c004 -- Nombre Responsable',
'  from gn_g_temporal ',
' where id_ssion = :APP_SESSION',
'   and c005 = ''DPC'''))
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
 p_id=>wwv_flow_api.id(378439263823943209)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>378439263823943209
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6222495122384360)
,p_db_column_name=>'N002'
,p_display_order=>10
,p_column_identifier=>'F'
,p_column_label=>unistr('No. L\00EDnea')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6220875454384359)
,p_db_column_name=>'C001'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6221232862384359)
,p_db_column_name=>'C002'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Existe?'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6221687404384359)
,p_db_column_name=>'C003'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6222052479384360)
,p_db_column_name=>'C004'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Nombre Responsable'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(378589830495469550)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'62228'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'N002:C001:C002:C003:C004'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(378441163118943228)
,p_plug_name=>'Sujetos Tributos Bloqueados'
,p_region_name=>'datos_archivo_bloqueado'
,p_parent_plug_id=>wwv_flow_api.id(56903231608173345)
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177331524321050607)
,p_plug_display_sequence=>160
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select n002, -- No. Linea',
unistr('       c001, -- Identificaci\00F3n'),
'       c002, -- Indicador Existe',
unistr('       c003, -- Direcci\00F3n'),
'       c004 -- Nombre Responsable',
'  from gn_g_temporal ',
' where id_ssion = :APP_SESSION',
'   and c005 = ''BLQ'''))
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
 p_id=>wwv_flow_api.id(378441227281943229)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>378441227281943229
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6223552950384361)
,p_db_column_name=>'C001'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6223939477384361)
,p_db_column_name=>'C002'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Existe?'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6224319383384361)
,p_db_column_name=>'C003'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6224730780384361)
,p_db_column_name=>'C004'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Nombre Responsable'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6225144900384362)
,p_db_column_name=>'N002'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('No. L\00EDnea')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(379080173171456348)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'62255'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'N002:C001:C002:C003:C004'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(379284874760840832)
,p_plug_name=>'Sujetos Tributos Sin Saldo'
,p_region_name=>'datos_archivo_sin_saldo'
,p_parent_plug_id=>wwv_flow_api.id(56903231608173345)
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177331524321050607)
,p_plug_display_sequence=>170
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select n002, -- No. Linea',
unistr('       c001, -- Identificaci\00F3n'),
'       c002, -- Indicador Existe',
unistr('       c003, -- Direcci\00F3n'),
'       c004 -- Nombre Responsable',
'  from gn_g_temporal ',
' where id_ssion = :APP_SESSION',
'   and c005 = ''SNS'''))
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
 p_id=>wwv_flow_api.id(379285044681840833)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>379285044681840833
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6226249272384363)
,p_db_column_name=>'C001'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6226672892384363)
,p_db_column_name=>'C002'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Existe?'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6227043930384364)
,p_db_column_name=>'C003'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6227426077384364)
,p_db_column_name=>'C004'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Nombre Responsable'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6227807083384364)
,p_db_column_name=>'N002'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('No. L\00EDnea')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(379841358081784146)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'62282'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'N002:C001:C002:C003:C004:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(57034718970923337)
,p_plug_name=>'Datos SQL'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr(' select c001, -- Identificaci\00F3n'),
'        c002, -- Indicador Existe',
unistr('        c003, -- Direcci\00F3n'),
'        c004, -- Nombre Responsable',
'        b.dscrpcion c005 ,-- Estado',
'        n003 -- Saldo',
'  from gn_g_temporal  a',
'  join gi_d_dtrmncion_sjto_estdo b on a.c005 =  b.cdgo_dtrmncion_sjto_estdo',
' where id_ssion = :APP_SESSION'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
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
 p_id=>wwv_flow_api.id(57034865078923338)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>57034865078923338
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6228953754384366)
,p_db_column_name=>'C001'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6229357228384366)
,p_db_column_name=>'C002'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('\00BFExiste?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6229784299384367)
,p_db_column_name=>'C003'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6230176882384367)
,p_db_column_name=>'C004'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Responsable'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6230577794384367)
,p_db_column_name=>'C005'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6230920017384367)
,p_db_column_name=>'N003'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Saldo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(57042357011927884)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'62313'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'C001:C002:C003:C004:C005:N003'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(6231766041384368)
,p_report_id=>wwv_flow_api.id(57042357011927884)
,p_name=>'Bloqueado'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'C005'
,p_operator=>'='
,p_expr=>'Bloqueado'
,p_condition_sql=>' (case when ("C005" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Bloqueado''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#99CCFF'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(6232103734384369)
,p_report_id=>wwv_flow_api.id(57042357011927884)
,p_name=>'Sin Saldo'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'C005'
,p_operator=>'='
,p_expr=>'Con deuda Fuera de Rango'
,p_condition_sql=>' (case when ("C005" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Con deuda Fuera de Rango''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#FFCA45'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(6232560513384369)
,p_report_id=>wwv_flow_api.id(57042357011927884)
,p_name=>'Duplicado'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'C005'
,p_operator=>'='
,p_expr=>'Duplicado'
,p_condition_sql=>' (case when ("C005" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Duplicado''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#DFB9F7'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(6232982533384369)
,p_report_id=>wwv_flow_api.id(57042357011927884)
,p_name=>'No Valido'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'C005'
,p_operator=>'='
,p_expr=>'No Valido'
,p_condition_sql=>' (case when ("C005" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''No Valido''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#FFA3AB'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(376696388459814424)
,p_plug_name=>'Lote de Ajuste'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:margin-top-sm:margin-bottom-sm:margin-left-sm:margin-right-sm'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6175172230821714)
,p_plug_name=>unistr('Resoluci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(376696388459814424)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select  seq_id,',
'        c004 as nombre,',
'        c005 as filemymetype,',
'        blob001 as blobfile,',
'        ''<span aria-hidden="true" class="fa fa-trash" style="color: #d22204;" alt="Eliminar" title="Eliminar"></span>'' as elmnar',
'from APEX_collections    a    ',
'where collection_name = ''RSLCION''',
';',
'',
'*/',
'select  c001 as nombre,',
'        c002 as filemymetype,',
'        blob001 as blobfile,',
'        ''<span aria-hidden="true" class="fa fa-trash" style="color: #d22204;" alt="Eliminar" title="Eliminar"></span>'' as elmnar',
'from    gn_g_temporal ',
'where   id_ssion = :APP_SESSION;',
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
end;
/
begin
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(6175871700821721)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_actions_menu=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'NCARRASQUILLA'
,p_internal_uid=>6175871700821721
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6176005462821723)
,p_db_column_name=>'NOMBRE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6176101002821724)
,p_db_column_name=>'FILEMYMETYPE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Formato'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6176281781821725)
,p_db_column_name=>'BLOBFILE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Blobfile'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6176394990821726)
,p_db_column_name=>'ELMNAR'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Eliminar'
,p_column_link=>'f?p=&APP_ID.:2024009:&SESSION.:eliminar:&DEBUG.:RP:P2024009_SEQ_ID:#SEQ_ID#'
,p_column_linktext=>'#ELMNAR#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(6349881881640864)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'63499'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NOMBRE:FILEMYMETYPE:BLOBFILE:ELMNAR'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(377731622561053623)
,p_plug_name=>'Datos Archivo'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select n002, -- No. Linea',
unistr('        c001, -- Identificaci\00F3n'),
'        c002, -- Indicador Existe',
unistr('        c003, -- Direcci\00F3n'),
'        c004, -- Nombre Responsable',
'        b.dscrpcion c005 ,-- Estado',
'        n003 -- Saldo',
'  from gn_g_temporal a',
'  join gi_d_dtrmncion_sjto_estdo b on a.c005 =  b.cdgo_dtrmncion_sjto_estdo',
'  where id_ssion = :APP_SESSION'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
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
 p_id=>wwv_flow_api.id(377731708255053624)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>377731708255053624
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6248922371384388)
,p_db_column_name=>'N002'
,p_display_order=>10
,p_column_identifier=>'G'
,p_column_label=>unistr('No L\00EDnea')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6247306069384387)
,p_db_column_name=>'C001'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6247736482384388)
,p_db_column_name=>'C002'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>unistr('\00BFExiste?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6248179214384388)
,p_db_column_name=>'C003'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6248562122384388)
,p_db_column_name=>'C004'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Responsable'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6249369329384389)
,p_db_column_name=>'C005'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6249727292384389)
,p_db_column_name=>'N003'
,p_display_order=>80
,p_column_identifier=>'I'
,p_column_label=>'Saldo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(378418905513841104)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'62501'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100
,p_report_columns=>'N002:C001:C002:C003:C004:C005:N003'
,p_sort_column_1=>'N002'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'C001'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'N001'
,p_sort_direction_3=>'ASC'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(6250543373384390)
,p_report_id=>wwv_flow_api.id(378418905513841104)
,p_name=>'Bloqueado'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'C005'
,p_operator=>'='
,p_expr=>'Bloqueado'
,p_condition_sql=>' (case when ("C005" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Bloqueado''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#99CCFF'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(6250970507384390)
,p_report_id=>wwv_flow_api.id(378418905513841104)
,p_name=>'Sin Saldo'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'C005'
,p_operator=>'='
,p_expr=>'Con deuda Fuera de Rango'
,p_condition_sql=>' (case when ("C005" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Con deuda Fuera de Rango''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#FFCA45'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(6251357446384390)
,p_report_id=>wwv_flow_api.id(378418905513841104)
,p_name=>'Determinados'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'C005'
,p_operator=>'='
,p_expr=>'Deteriminados'
,p_condition_sql=>' (case when ("C005" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Deteriminados''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#DBDBDB'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(6251768097384391)
,p_report_id=>wwv_flow_api.id(378418905513841104)
,p_name=>'Duplicados'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'C005'
,p_operator=>'='
,p_expr=>'Duplicado'
,p_condition_sql=>' (case when ("C005" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Duplicado''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#DFB9F7'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(6252100047384391)
,p_report_id=>wwv_flow_api.id(378418905513841104)
,p_name=>'No Validos'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'C005'
,p_operator=>'='
,p_expr=>'No Valido'
,p_condition_sql=>' (case when ("C005" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''No Valido''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#FFA3AB'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(378438174947943199)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(379833545962777898)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>',
'Funcionalidad que permite<br><br>',
unistr('Crear lotes de Ajustes, para un grupo de sujetos del tributo espec\00EDfico.<br><br>'),
unistr('Adjuntar resoluci\00F3n que avala la generaci\00F3n de los ajustes del archivo/lote<br><br> '),
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6252847043384392)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(378438174947943199)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:2024008:&SESSION.::&DEBUG.:RP,2024008::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6253243289384392)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(378438174947943199)
,p_button_name=>'BTN_PROCESAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de procesar los ajustes masivos?  Nota: Al aceptar el procesamiento, este se realizarÃ¡ en segundo plano. Puede revisar el avance en la opciÃ³n de gestiÃ³n. '',''BTN_PROCESAR'');'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_count number;',
'begin   ',
'		',
'    select   count (*)',
'    into     v_count',
'    from     gn_g_temporal    a    ',
'    where    id_ssion = :APP_SESSION ;  ',
'    ',
'    if ( v_count > 0 ) then',
'       return true; ',
'    else ',
'        return false;',
'    end if; ',
'',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6234093697384371)
,p_button_sequence=>180
,p_button_plug_id=>wwv_flow_api.id(376696388459814424)
,p_button_name=>'BTN_CRGAR_RSLCION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-dynamic-content'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6234866710384372)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(376696388459814424)
,p_button_name=>'BTN_CANCELAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:2024009:&SESSION.::&DEBUG.:RP,61::'
,p_icon_css_classes=>'fa-calendar-ban'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6278158258384425)
,p_branch_name=>unistr('Ir P\00E1gina 60 - Lotes de Determinaci\00F3n')
,p_branch_action=>'f?p=&APP_ID.:2024008:&SESSION.::&DEBUG.:RP,2024008::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6253243289384392)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6176578580821728)
,p_name=>'P2024009_SEQ_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6175172230821714)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6236146549384378)
,p_name=>'P2024009_ID_ARCHVO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(376696388459814424)
,p_prompt=>'Archivo a procesar'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.file_name || ''  |  '' || to_char( a.fcha_rgstro , ''DD/MM/YYYY HH:MI:SS AM'' )  || ''  |  '' || a.nmbre_trcro as d',
'        , a.id_prcso_crga as r',
'from    v_et_g_procesos_carga a',
'where   a.cdgo_clnte        = :F_CDGO_CLNTE ',
'and     indcdor_prcsdo = ''N''',
'and     exists( select  1',
'                from    gf_g_ajustes_cargue c',
'                where   c.id_prcso_crga = a.id_prcso_crga',
'                group by a.id_prcso_crga',
'              );'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Sub-Tributo al que pertenece el lote de determinaci\00F3n')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'70%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6244122957384385)
,p_name=>'P2024009_RSLCION'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(376696388459814424)
,p_prompt=>unistr('Resoluci\00F3n')
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_tag_attributes=>'accept=".pdf"'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Se debe seleccionar el Archivo que contiene el listado de los sujetos  del tributo que se pretenden determinar.<br>',
'<b>El archivo adjunto debe cumplir las siguientes especificaciones:</b><br>',
'  - Solo se aceptan archivos de texto (.txt).<br>',
'  - El archivo no debe tener encabezado.<br>',
unistr('  - En cada linea debe estar la la identificaci\00F3n del sujeto. <br>'),
'  - No se debe ingresar ningun caracter especial para separar las identificaciones.<br>',
'  - Al final del todas la identificaciones debe tener un salto de linea.<br>',
'      <b>Ejemplo</b><br>',
'      0103000003620010901060003<br>',
'      0103000003640902900000074<br>',
'      0103000003620006901030001<br>',
'      0103000003590002901980003<br>',
'      0103000003610905900000081<br><br>',
''))
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6266086174384416)
,p_name=>unistr('Al cambiar el archivo se refresca la regi\00F3n de datos del archivo')
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2024009_RSLCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6266578270384416)
,p_event_id=>wwv_flow_api.id(6266086174384416)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''IDNTFCCION_SJTO_IMPSTO''); ',
'APEX_UTIL.SET_SESSION_STATE(''P2024009_RSLCION'',:P2024009_RSLCION);'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6267474669384417)
,p_name=>'Al hacer clic Abrir modal de registros duplicados'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(56903789968173350)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6267901226384417)
,p_event_id=>wwv_flow_api.id(6267474669384417)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#datos_archivo_duplicados").dialog("open");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6268485236384418)
,p_event_id=>wwv_flow_api.id(6267474669384417)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(378439118182943208)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6268839833384418)
,p_name=>'Al hacer clic Abrir modal de datos bloqueados'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(56903585134173348)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6269334048384418)
,p_event_id=>wwv_flow_api.id(6268839833384418)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#datos_archivo_bloqueado").dialog("open");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6269871331384418)
,p_event_id=>wwv_flow_api.id(6268839833384418)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(378441163118943228)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6270295473384419)
,p_name=>'Al hacer clic Abrir modal de datos no validos'
,p_event_sequence=>60
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(56903423542173347)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6270765602384419)
,p_event_id=>wwv_flow_api.id(6270295473384419)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#datos_archivo_no_validos").dialog("open");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6271249455384419)
,p_event_id=>wwv_flow_api.id(6270295473384419)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(377729176375053599)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6271652856384419)
,p_name=>'Al hacer clic Abrir modal de datos de sin saldo'
,p_event_sequence=>70
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(56903636751173349)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6272177441384420)
,p_event_id=>wwv_flow_api.id(6271652856384419)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#datos_archivo_sin_saldo").dialog("open");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6272689616384421)
,p_event_id=>wwv_flow_api.id(6271652856384419)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(379284874760840832)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6273089185384422)
,p_name=>'Al hacer clic limpiar los datos'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(187457932347795398)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6273588254384422)
,p_event_id=>wwv_flow_api.id(6273089185384422)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(376696388459814424)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6273972180384422)
,p_name=>'Leer Archivo'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(2247031229935707)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6274402734384423)
,p_event_id=>wwv_flow_api.id(6273972180384422)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'procesoLeerArchivo();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6277181345384424)
,p_name=>unistr('Al hacer clic al bot\00F3n cancelar')
,p_event_sequence=>150
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(6252847043384392)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6277638192384424)
,p_event_id=>wwv_flow_api.id(6277181345384424)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    delete from gn_g_temporal where id_ssion = :APP_SESSION;',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6176486980821727)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Eliminar resoluci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('/*--Elimina los Datos de la Colecci\00F3n'),
' apex_collection.delete_member( p_collection_name => ''RSLCION''',
'                              , p_seq             => :P2024009_SEQ_ID );',
'*/      ',
'',
'begin',
'    delete from gn_g_temporal where id_ssion = :APP_SESSION;',
'    commit;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'eliminar'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6175077071821713)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Agregar resolucion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_blob         blob;',
'     v_seq          varchar2(4000);',
'     r_temp_files   apex_application_temp_files%rowtype;',
'begin',
'   /*',
'    if not apex_collection.collection_exists( p_collection_name => ''RSLCION'' ) then         ',
'        APEX_COLLECTION.CREATE_COLLECTION(p_collection_name => ''RSLCION''); ',
unistr('        -- insert into gti_aux (col1,col2) values (''0002'',''No exite la colesi\00F3n, se cre\00F3'');                                       '),
'    end if; ',
'       */',
'       ',
'    -- Consultamos el archivo cargado en la tabla temporal    ',
'    begin            ',
'        select  *',
'        into    r_temp_files',
'        from    apex_application_temp_files',
'        where   name = :P2024009_RSLCION;',
'    exception ',
'        when no_data_found then',
'            v_blob := null;  ',
'    end;',
'    ',
'    -- Validamos que el archivo no este vacio',
'    if r_temp_files.filename is not null then',
'                    ',
'        insert into gn_g_temporal (C001,	                C002,                     BLOB001,                     id_ssion)',
'                           values (r_temp_files.filename,   r_temp_files.mime_type,   r_temp_files.blob_content,   :APP_SESSION);',
'        commit;',
'        ',
'        /*-- Adicionamos el registro a la coleccion ',
'        apex_collection.add_member( p_collection_name   => ''RSLCION'' ',
'                                  , p_c004              => r_temp_files.filename',
'                                  , p_c005              => r_temp_files.mime_type',
'                                  , p_blob001           => r_temp_files.blob_content );*/',
'             ',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6257563021384408)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Procesar archivo '
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_blob_data       BLOB;',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(500);',
'    ',
'begin',
'    select blob_content ',
'      into v_blob_data',
'     from apex_application_temp_files  ',
'    where name =  :P2024009_ARCHVO;   ',
'        ',
'    pkg_gi_determinacion.prc_gn_procesar_archivo (p_cdgo_clnte		    => :F_CDGO_CLNTE,',
'                                                  p_id_ssion            => :APP_SESSION,',
'                                                  p_blob			    => v_blob_data,',
'                                                  p_id_impsto		    => :P2024009_ID_IMPSTO,',
'                                                  p_id_impsto_sbmpsto   => :P2024009_ID_IMSPTO_SBMPSTO,',
'                                                  p_vgncia_dsde	        => :P2024009_VGNCIA_DSDE,',
'                                                  p_prdo_dsde		    => :P2024009_PRDO_DSDE,',
'                                                  p_vgncia_hsta	        => :P2024009_VGNCIA_HSTA,',
'                                                  p_prdo_hsta		    => :P2024009_PRDO_HSTA,',
'                                                  p_dda_dsde		    => :P2024009_DDA_DSDE,',
'                                                  p_dda_hsta		    => :P2024009_DDA_HSTA,',
'                                                  o_cdgo_rspsta         => v_cdgo_rspsta,',
'                                                  o_mnsje_rspsta        => v_mnsje_rspsta);',
'    exception ',
'        when no_data_found then ',
'            v_mnsje_rspsta := ''No se encontro archivo para procesar'';',
'            apex_error.add_error ( p_message => v_mnsje_rspsta, p_display_location => apex_error.c_inline_in_notification );',
'			raise_application_error( -20001 , v_mnsje_rspsta );',
'            ',
'end;',
'',
'',
'    ',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(2247031229935707)
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6256308507384406)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('\00CDtems en sesi\00F3n')
,p_process_sql_clob=>'APEX_UTIL.SET_SESSION_STATE(''P2024009_PRDO_DSDE'',:P2024009_PRDO_DSDE);'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6257961221384408)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar lote de ajustes job'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_error varchar2(1000);',
'	v_blob_data		blob;',
'begin',
'',
'    insert into gti_aux (col1, col2) values (''INICIO AJUSTE MASIVOS'', :P2024009_ID_ARCHVO);',
'    commit;',
'	 ',
'    ',
'    if ( :P2024009_ID_ARCHVO is null) then   ',
'        raise_application_error(-20001, ''Debe escojer el archivo a procesar'');	',
'	end if; ',
'		',
'    BEGIN',
'        DBMS_SCHEDULER.set_attribute( name => ''"GENESYS"."IT_GI_PROCESAR_AJUSTES_MASIVOS"'', attribute => ''job_action'', value => ''PKG_GF_AJUSTES.PRC_RG_AJUSTES_MASIVOS'');',
'',
'        DBMS_SCHEDULER.set_attribute( name => ''"GENESYS"."IT_GI_PROCESAR_AJUSTES_MASIVOS"'', attribute => ''number_of_arguments'', value => ''4'');',
'',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PROCESAR_AJUSTES_MASIVOS'', argument_position => 1, argument_value => :F_CDGO_CLNTE);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PROCESAR_AJUSTES_MASIVOS'', argument_position => 2, argument_value => :F_ID_USRIO);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PROCESAR_AJUSTES_MASIVOS'', argument_position => 3, argument_value => :P2024009_ID_ARCHVO);',
'        --DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PROCESAR_AJUSTES_MASIVOS'', argument_position => 4, argument_value => v_blob_data);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PROCESAR_AJUSTES_MASIVOS'', argument_position => 4, argument_value => :APP_SESSION); ',
'',
'    END; ',
'	',
'    BEGIN',
'        DBMS_SCHEDULER.ENABLE(''"GENESYS"."IT_GI_PROCESAR_AJUSTES_MASIVOS"'');',
'    END; ',
'	',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(6253243289384392)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6258368353384409)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Limpiar Tempo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    delete from gn_g_temporal where id_ssion = :APP_SESSION;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(6252847043384392)
);
end;
/
