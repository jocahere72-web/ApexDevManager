prompt --application/pages/page_00153
begin
wwv_flow_api.create_page(
 p_id=>153
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Proceso de Plusval\00EDa')
,p_step_title=>unistr('Proceso de Plusval\00EDa')
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
'#Total_Rgstros .u-colors>:nth-child(45n+1) .u-color {',
' color: #fff;',
' background-color: #ffa6f8;',
'-- font-weight: bold; ',
' font-size: 25px;',
'     ',
'}',
'',
'#Total_Errors .u-colors>:nth-child(45n+1) .u-color {',
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
'}'))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NCARRASQUILLA'
,p_last_upd_yyyymmddhh24miss=>'20201020191103'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(90458158195814326)
,p_plug_name=>'Consolidado'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(90458349539814328)
,p_plug_name=>'Total registros archivo'
,p_parent_plug_id=>wwv_flow_api.id(90458158195814326)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-top-sm:margin-bottom-sm:margin-left-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_grid_column_css_classes=>'badgeListColor1'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select ''Total Registros'' label,',
'          count(a.id_plsvlia_dtlle) value',
'     from gi_g_plusvalia_procso_dtlle a',
'     join gi_g_plusvalia_proceso      b on a.id_prcso_plsvlia = b.id_prcso_plsvlia',
'    where id_prcso_crga = :P153_ID_PRCSO_CRGA ;'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(90458523431814330)
,p_plug_name=>'Registros con Error'
,p_parent_plug_id=>wwv_flow_api.id(90458158195814326)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-top-sm:margin-bottom-sm:margin-right-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor3'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select ''Registros con Error'' label,',
'          count(a.id_plsvlia_dtlle) value',
'     from gi_g_plusvalia_procso_dtlle a',
'     join gi_g_plusvalia_proceso      b on a.id_prcso_plsvlia = b.id_prcso_plsvlia',
'    where id_prcso_crga = :P153_ID_PRCSO_CRGA ',
'      and rgstro_error != ''N'';'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(90458691690814331)
,p_plug_name=>unistr('Sin Matr\00EDcula')
,p_parent_plug_id=>wwv_flow_api.id(90458158195814326)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-bottom-sm:margin-left-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_plug_grid_column_css_classes=>'badgeListColor3'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('   select ''Sin Matr\00EDcula Inmobiliaria'' label,'),
'          count(a.id_plsvlia_dtlle) value',
'     from gi_g_plusvalia_procso_dtlle a',
'     join gi_g_plusvalia_proceso      b on a.id_prcso_plsvlia = b.id_prcso_plsvlia',
'    where id_prcso_crga = :P153_ID_PRCSO_CRGA ',
'      and rgstro_error = ''S''      ',
'      and ( a.mtrcla_inmblria is null or',
'            not exists ( select 1 from si_i_predios s',
'                          where s.mtrcla_inmblria = a.mtrcla_inmblria )',
'          );'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(90458794537814332)
,p_plug_name=>'Sin Cod. predial'
,p_parent_plug_id=>wwv_flow_api.id(90458158195814326)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor4'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select ''Sin Referencia Catastral'' label,',
'          count(a.id_plsvlia_dtlle) value',
'     from gi_g_plusvalia_procso_dtlle a',
'     join gi_g_plusvalia_proceso      b on a.id_prcso_plsvlia = b.id_prcso_plsvlia',
'    where id_prcso_crga = :P153_ID_PRCSO_CRGA ',
'      and rgstro_error = ''S''',
'      and cdgo_prdial is null;'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(90458850356814333)
,p_plug_name=>unistr('Sin Direcci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(90458158195814326)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor6'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('   select ''Sin Direcci\00F3n'' label,'),
'          count(a.id_plsvlia_dtlle) value',
'     from gi_g_plusvalia_procso_dtlle a',
'     join gi_g_plusvalia_proceso      b on a.id_prcso_plsvlia = b.id_prcso_plsvlia',
'    where id_prcso_crga = :P153_ID_PRCSO_CRGA ',
'      and rgstro_error = ''S''',
'      and drccion is null;'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(90458925816814334)
,p_plug_name=>'Sin Propietario'
,p_parent_plug_id=>wwv_flow_api.id(90458158195814326)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>80
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor7'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select ''Sin Propietario'' label,',
'          count(a.id_plsvlia_dtlle) value',
'     from gi_g_plusvalia_procso_dtlle a',
'     join gi_g_plusvalia_proceso      b on a.id_prcso_plsvlia = b.id_prcso_plsvlia',
'    where id_prcso_crga = :P153_ID_PRCSO_CRGA ',
'      and rgstro_error = ''S''',
'      and prptrio is null;'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(90459099312814335)
,p_plug_name=>unistr('Sin \00C1rea Objeto')
,p_parent_plug_id=>wwv_flow_api.id(90458158195814326)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-right-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>90
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor8'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('   select ''Sin \00C1rea Objeto'' label,'),
'          count(a.id_plsvlia_dtlle) value',
'     from gi_g_plusvalia_procso_dtlle a',
'     join gi_g_plusvalia_proceso      b on a.id_prcso_plsvlia = b.id_prcso_plsvlia',
'    where id_prcso_crga = :P153_ID_PRCSO_CRGA ',
'      and rgstro_error = ''S''',
'      and area_objto is null;'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(90459117441814336)
,p_plug_name=>'Sin Valor P1'
,p_parent_plug_id=>wwv_flow_api.id(90458158195814326)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-bottom-sm:margin-left-sm:margin-right-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>100
,p_plug_grid_column_css_classes=>'badgeListColor3'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select ''Sin Valor P1'' label,',
'          count(a.id_plsvlia_dtlle) value',
'     from gi_g_plusvalia_procso_dtlle a',
'     join gi_g_plusvalia_proceso      b on a.id_prcso_plsvlia = b.id_prcso_plsvlia',
'    where id_prcso_crga = :P153_ID_PRCSO_CRGA ',
'      and rgstro_error = ''S''',
'      and vlor_p1 is null;'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(90459295790814337)
,p_plug_name=>'Sin Hecho Generador'
,p_parent_plug_id=>wwv_flow_api.id(90458158195814326)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor5'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select ''Sin Hecho Generador'' label,',
'          count(a.id_plsvlia_dtlle) value',
'     from gi_g_plusvalia_procso_dtlle a',
'     join gi_g_plusvalia_proceso      b on a.id_prcso_plsvlia = b.id_prcso_plsvlia',
'    where id_prcso_crga = :P153_ID_PRCSO_CRGA ',
'      and rgstro_error = ''S''',
'      and hcho_gnrdor is null;'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(90459354862814338)
,p_plug_name=>'Sin Valor P2'
,p_parent_plug_id=>wwv_flow_api.id(90458158195814326)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-bottom-sm:margin-right-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>110
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor6'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select ''Sin Valor P2'' label,',
'          count(a.id_plsvlia_dtlle) value',
'     from gi_g_plusvalia_procso_dtlle a',
'     join gi_g_plusvalia_proceso      b on a.id_prcso_plsvlia = b.id_prcso_plsvlia',
'    where id_prcso_crga = :P153_ID_PRCSO_CRGA ',
'      and rgstro_error = ''S''',
'      and vlor_p2 is null;',
''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(90459431936814339)
,p_plug_name=>'Duplicado en otro Archivo'
,p_parent_plug_id=>wwv_flow_api.id(90458158195814326)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-bottom-sm:margin-right-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>120
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor3'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select ''Duplicado en otro Archivo'' label,',
'          count(a.id_plsvlia_dtlle) value',
'     from gi_g_plusvalia_procso_dtlle a',
'     join gi_g_plusvalia_proceso      b on a.id_prcso_plsvlia = b.id_prcso_plsvlia',
'    where id_prcso_crga = :P153_ID_PRCSO_CRGA ',
'      and rgstro_error = ''D'';'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(90459577450814340)
,p_plug_name=>unistr('Registros V\00E1lidos')
,p_parent_plug_id=>wwv_flow_api.id(90458158195814326)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-top-sm:margin-bottom-sm:margin-left-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select ''Registros Validos'' label,',
'          count(a.id_plsvlia_dtlle) value',
'     from gi_g_plusvalia_procso_dtlle a',
'     join gi_g_plusvalia_proceso      b on a.id_prcso_plsvlia = b.id_prcso_plsvlia',
'    where id_prcso_crga = :P153_ID_PRCSO_CRGA ',
'      and rgstro_error = ''N'';'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(91681908750963223)
,p_plug_name=>'Registros NO validos'
,p_region_name=>'datos_archivo_no_validos'
,p_parent_plug_id=>wwv_flow_api.id(90458158195814326)
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_plug_template=>wwv_flow_api.id(164079332454707690)
,p_plug_display_sequence=>130
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select  ',
'         a.dscrpcion_error	',
'        ,a.cdgo_prdial			',
'        ,a.area_objto			',
'        ,a.mtrcla_inmblria		',
'        ,a.prptrio				',
'        ,a.vlor_p1				',
'        ,a.vlor_p2		',
'        ,a.drccion				',
'        ,a.hcho_gnrdor	',
'        ,a.vlor_plsvlia_actlzda',
'     from gi_g_plusvalia_procso_dtlle a',
'     join gi_g_plusvalia_proceso      b on a.id_prcso_plsvlia = b.id_prcso_plsvlia',
'    where id_prcso_crga = :P153_ID_PRCSO_CRGA ',
'      and rgstro_error != ''N'';'))
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
 p_id=>wwv_flow_api.id(92392143797403007)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NCARRASQUILLA'
,p_internal_uid=>92392143797403007
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92392261393403008)
,p_db_column_name=>'DSCRPCION_ERROR'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Descripci\00F3n<br>Error')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92392342620403009)
,p_db_column_name=>'CDGO_PRDIAL'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Referencia<br>Catastral'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92392417130403010)
,p_db_column_name=>'AREA_OBJTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('\00C1rea<br>Objeto')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92392508833403011)
,p_db_column_name=>'MTRCLA_INMBLRIA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Matr\00EDcula<br>Inmobiliaria')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92392646216403012)
,p_db_column_name=>'PRPTRIO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Propietario'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92392745385403013)
,p_db_column_name=>'VLOR_P1'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Valor P1'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92392885327403014)
,p_db_column_name=>'VLOR_P2'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Valor P2'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92393219772403018)
,p_db_column_name=>'DRCCION'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92393384010403019)
,p_db_column_name=>'HCHO_GNRDOR'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Hecho<br>Generador'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92393731171403023)
,p_db_column_name=>'VLOR_PLSVLIA_ACTLZDA'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>unistr('Valor Plusval\00EDa<br>Actualizada')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(92512278796136445)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'925123'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_ERROR:CDGO_PRDIAL:AREA_OBJTO:MTRCLA_INMBLRIA:PRPTRIO:VLOR_P1:VLOR_P2:DRCCION:HCHO_GNRDOR:VLOR_PLSVLIA_ACTLZDA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(92394145250403027)
,p_plug_name=>unistr('Registros Sin Matr\00EDcula Inmobiliria')
,p_region_name=>'datos_archivo_no_matricula'
,p_parent_plug_id=>wwv_flow_api.id(90458158195814326)
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164079332454707690)
,p_plug_display_sequence=>150
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select  ',
'         a.dscrpcion_error	',
'        ,a.cdgo_prdial			',
'        ,a.area_objto			',
'        ,a.mtrcla_inmblria		',
'        ,a.prptrio				',
'        ,a.vlor_p1				',
'        ,a.vlor_p2		',
'        ,a.drccion				',
'        ,a.hcho_gnrdor	',
'        ,a.vlor_plsvlia_actlzda',
'     from gi_g_plusvalia_procso_dtlle a',
'     join gi_g_plusvalia_proceso      b on a.id_prcso_plsvlia = b.id_prcso_plsvlia',
'    where id_prcso_crga = :P153_ID_PRCSO_CRGA ',
'      and rgstro_error = ''S''      ',
'      and ( a.mtrcla_inmblria is null or',
'            not exists ( select 1 from si_i_predios s',
'                          where s.mtrcla_inmblria = a.mtrcla_inmblria )',
'          );',
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
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(92394201442403028)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NCARRASQUILLA'
,p_internal_uid=>92394201442403028
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92394340950403029)
,p_db_column_name=>'DSCRPCION_ERROR'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Descripci\00F3n<br>Error')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92394429255403030)
,p_db_column_name=>'CDGO_PRDIAL'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Referencia<br>Catastral'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92394582570403031)
,p_db_column_name=>'AREA_OBJTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('\00C1rea<br>Objeto')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92394616722403032)
,p_db_column_name=>'MTRCLA_INMBLRIA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Matr\00EDcula<br>Inmobiliaria')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92394737635403033)
,p_db_column_name=>'PRPTRIO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Propietario'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92394851698403034)
,p_db_column_name=>'VLOR_P1'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Valor P1'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92394955989403035)
,p_db_column_name=>'VLOR_P2'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Valor P2'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92395032879403036)
,p_db_column_name=>'DRCCION'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92395147435403037)
,p_db_column_name=>'HCHO_GNRDOR'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Hecho<br>Generador'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92395221734403038)
,p_db_column_name=>'VLOR_PLSVLIA_ACTLZDA'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('Valor Plusval\00EDa<br>Actualizada')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(92528148453310784)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'925282'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_ERROR:CDGO_PRDIAL:AREA_OBJTO:MTRCLA_INMBLRIA:PRPTRIO:VLOR_P1:VLOR_P2:DRCCION:HCHO_GNRDOR:VLOR_PLSVLIA_ACTLZDA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(92395621280403042)
,p_plug_name=>'Registros Sin Referencia Catastral'
,p_region_name=>'datos_archivo_no_predial'
,p_parent_plug_id=>wwv_flow_api.id(90458158195814326)
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164079332454707690)
,p_plug_display_sequence=>160
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select  ',
'         a.dscrpcion_error	',
'        ,a.cdgo_prdial			',
'        ,a.area_objto			',
'        ,a.mtrcla_inmblria		',
'        ,a.prptrio				',
'        ,a.vlor_p1				',
'        ,a.vlor_p2		',
'        ,a.drccion				',
'        ,a.hcho_gnrdor	',
'        ,a.vlor_plsvlia_actlzda',
'     from gi_g_plusvalia_procso_dtlle a',
'     join gi_g_plusvalia_proceso      b on a.id_prcso_plsvlia = b.id_prcso_plsvlia',
'    where id_prcso_crga = :P153_ID_PRCSO_CRGA ',
'      and rgstro_error = ''S''',
'      and a.cdgo_prdial is null',
';'))
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
 p_id=>wwv_flow_api.id(92395702001403043)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NCARRASQUILLA'
,p_internal_uid=>92395702001403043
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92395877166403044)
,p_db_column_name=>'DSCRPCION_ERROR'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Descripci\00F3n<br>Error')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92395987429403045)
,p_db_column_name=>'CDGO_PRDIAL'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Referencia<br>Catastral'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92396074411403046)
,p_db_column_name=>'AREA_OBJTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('\00C1rea<br>Objeto')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92396145937403047)
,p_db_column_name=>'MTRCLA_INMBLRIA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Matr\00EDcula<br>Inmobiliaria')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92396212016403048)
,p_db_column_name=>'PRPTRIO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Propietario'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92396365257403049)
,p_db_column_name=>'VLOR_P1'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Valor P1'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92396400693403050)
,p_db_column_name=>'VLOR_P2'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Valor P2'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92528724020360501)
,p_db_column_name=>'DRCCION'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92528859746360502)
,p_db_column_name=>'HCHO_GNRDOR'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Hecho<br>Generador'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92528985841360503)
,p_db_column_name=>'VLOR_PLSVLIA_ACTLZDA'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('Valor Plusval\00EDa<br>Actualizada')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(92538757236381286)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'925388'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_ERROR:CDGO_PRDIAL:AREA_OBJTO:MTRCLA_INMBLRIA:PRPTRIO:VLOR_P1:VLOR_P2:DRCCION:HCHO_GNRDOR:VLOR_PLSVLIA_ACTLZDA'
);
end;
/
begin
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(92529023944360504)
,p_plug_name=>'Registros Sin Hecho Generador'
,p_region_name=>'datos_archivo_no_hecho'
,p_parent_plug_id=>wwv_flow_api.id(90458158195814326)
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164079332454707690)
,p_plug_display_sequence=>170
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select  ',
'         a.dscrpcion_error	',
'        ,a.cdgo_prdial			',
'        ,a.area_objto			',
'        ,a.mtrcla_inmblria		',
'        ,a.prptrio				',
'        ,a.vlor_p1				',
'        ,a.vlor_p2		',
'        ,a.drccion				',
'        ,a.hcho_gnrdor	',
'        ,a.vlor_plsvlia_actlzda',
'     from gi_g_plusvalia_procso_dtlle a',
'     join gi_g_plusvalia_proceso      b on a.id_prcso_plsvlia = b.id_prcso_plsvlia',
'    where id_prcso_crga = :P153_ID_PRCSO_CRGA ',
'      and rgstro_error = ''S''',
'      and a.hcho_gnrdor is null',
';'))
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
 p_id=>wwv_flow_api.id(92529125645360505)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NCARRASQUILLA'
,p_internal_uid=>92529125645360505
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92529298698360506)
,p_db_column_name=>'DSCRPCION_ERROR'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Descripci\00F3n<br>Error')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92529330143360507)
,p_db_column_name=>'CDGO_PRDIAL'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Referencia<br>Catastral'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92529494723360508)
,p_db_column_name=>'AREA_OBJTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('\00C1rea<br>Objeto')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92529577477360509)
,p_db_column_name=>'MTRCLA_INMBLRIA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Matr\00EDcula<br>Inmobiliaria')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92529689188360510)
,p_db_column_name=>'PRPTRIO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Propietario'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92529757894360511)
,p_db_column_name=>'VLOR_P1'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Valor P1'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92529831916360512)
,p_db_column_name=>'VLOR_P2'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Valor P2'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92529949623360513)
,p_db_column_name=>'DRCCION'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92530013866360514)
,p_db_column_name=>'HCHO_GNRDOR'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Hecho<br>Generador'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92530100434360515)
,p_db_column_name=>'VLOR_PLSVLIA_ACTLZDA'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('Valor Plusval\00EDa<br>Actualizada')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(92580901341614456)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'925810'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_ERROR:CDGO_PRDIAL:AREA_OBJTO:MTRCLA_INMBLRIA:PRPTRIO:VLOR_P1:VLOR_P2:DRCCION:HCHO_GNRDOR:VLOR_PLSVLIA_ACTLZDA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(92530801050360522)
,p_plug_name=>unistr('Registros Sin Direcci\00F3n')
,p_region_name=>'datos_archivo_no_direccion'
,p_parent_plug_id=>wwv_flow_api.id(90458158195814326)
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164079332454707690)
,p_plug_display_sequence=>180
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select  ',
'         a.dscrpcion_error	',
'        ,a.cdgo_prdial			',
'        ,a.area_objto			',
'        ,a.mtrcla_inmblria		',
'        ,a.prptrio				',
'        ,a.vlor_p1				',
'        ,a.vlor_p2		',
'        ,a.drccion				',
'        ,a.hcho_gnrdor	',
'        ,a.vlor_plsvlia_actlzda',
'     from gi_g_plusvalia_procso_dtlle a',
'     join gi_g_plusvalia_proceso      b on a.id_prcso_plsvlia = b.id_prcso_plsvlia',
'    where id_prcso_crga = :P153_ID_PRCSO_CRGA ',
'      and rgstro_error = ''S''',
'      and drccion is null;'))
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
 p_id=>wwv_flow_api.id(92530947295360523)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NCARRASQUILLA'
,p_internal_uid=>92530947295360523
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92531082640360524)
,p_db_column_name=>'DSCRPCION_ERROR'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Descripci\00F3n<br>Error')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92531138428360525)
,p_db_column_name=>'CDGO_PRDIAL'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Referencia<br>Catastral'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92531229649360526)
,p_db_column_name=>'AREA_OBJTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('\00C1rea<br>Objeto')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92531314326360527)
,p_db_column_name=>'MTRCLA_INMBLRIA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Matr\00EDcula<br>Inmobiliaria')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92531422905360528)
,p_db_column_name=>'PRPTRIO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Propietario'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92531538795360529)
,p_db_column_name=>'VLOR_P1'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Valor P1'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92531618301360530)
,p_db_column_name=>'VLOR_P2'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Valor P2'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92531710486360531)
,p_db_column_name=>'DRCCION'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92531845129360532)
,p_db_column_name=>'HCHO_GNRDOR'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Hecho<br>Generador'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92531954544360533)
,p_db_column_name=>'VLOR_PLSVLIA_ACTLZDA'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('Valor Plusval\00EDa<br>Actualizada')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(92581525941614459)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'925816'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_ERROR:CDGO_PRDIAL:AREA_OBJTO:MTRCLA_INMBLRIA:PRPTRIO:VLOR_P1:VLOR_P2:DRCCION:HCHO_GNRDOR:VLOR_PLSVLIA_ACTLZDA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(92532087325360534)
,p_plug_name=>'Registros Sin Propietario'
,p_region_name=>'datos_archivo_no_propietario'
,p_parent_plug_id=>wwv_flow_api.id(90458158195814326)
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164079332454707690)
,p_plug_display_sequence=>190
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select  ',
'         a.dscrpcion_error	',
'        ,a.cdgo_prdial			',
'        ,a.area_objto			',
'        ,a.mtrcla_inmblria		',
'        ,a.prptrio				',
'        ,a.vlor_p1				',
'        ,a.vlor_p2		',
'        ,a.drccion				',
'        ,a.hcho_gnrdor	',
'        ,a.vlor_plsvlia_actlzda',
'     from gi_g_plusvalia_procso_dtlle a',
'     join gi_g_plusvalia_proceso      b on a.id_prcso_plsvlia = b.id_prcso_plsvlia',
'    where id_prcso_crga = :P153_ID_PRCSO_CRGA ',
'      and rgstro_error = ''S''',
'      and prptrio is null;'))
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
 p_id=>wwv_flow_api.id(92532175650360535)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NCARRASQUILLA'
,p_internal_uid=>92532175650360535
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92532284853360536)
,p_db_column_name=>'DSCRPCION_ERROR'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Descripci\00F3n<br>Error')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92532348421360537)
,p_db_column_name=>'CDGO_PRDIAL'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Referencia<br>Catastral'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92532449559360538)
,p_db_column_name=>'AREA_OBJTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('\00C1rea<br>Objeto')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92532523136360539)
,p_db_column_name=>'MTRCLA_INMBLRIA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Matr\00EDcula<br>Inmobiliaria')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92532630909360540)
,p_db_column_name=>'PRPTRIO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Propietario'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92532760278360541)
,p_db_column_name=>'VLOR_P1'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Valor P1'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92532803763360542)
,p_db_column_name=>'VLOR_P2'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Valor P2'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92532934877360543)
,p_db_column_name=>'DRCCION'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92533074033360544)
,p_db_column_name=>'HCHO_GNRDOR'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Hecho<br>Generador'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92533188324360545)
,p_db_column_name=>'VLOR_PLSVLIA_ACTLZDA'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('Valor Plusval\00EDa<br>Actualizada')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(92582259679614462)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'925823'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_ERROR:CDGO_PRDIAL:AREA_OBJTO:MTRCLA_INMBLRIA:PRPTRIO:VLOR_P1:VLOR_P2:DRCCION:HCHO_GNRDOR:VLOR_PLSVLIA_ACTLZDA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(92533282866360546)
,p_plug_name=>unistr('Registros Sin \00C1rea Objeto')
,p_region_name=>'datos_archivo_no_areaobjeto'
,p_parent_plug_id=>wwv_flow_api.id(90458158195814326)
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164079332454707690)
,p_plug_display_sequence=>200
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select  ',
'         a.dscrpcion_error	',
'        ,a.cdgo_prdial			',
'        ,a.area_objto			',
'        ,a.mtrcla_inmblria		',
'        ,a.prptrio				',
'        ,a.vlor_p1				',
'        ,a.vlor_p2		',
'        ,a.drccion				',
'        ,a.hcho_gnrdor	',
'        ,a.vlor_plsvlia_actlzda',
'     from gi_g_plusvalia_procso_dtlle a',
'     join gi_g_plusvalia_proceso      b on a.id_prcso_plsvlia = b.id_prcso_plsvlia',
'    where id_prcso_crga = :P153_ID_PRCSO_CRGA ',
'      and rgstro_error = ''S''',
'      and area_objto is null;'))
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
 p_id=>wwv_flow_api.id(92533376381360547)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NCARRASQUILLA'
,p_internal_uid=>92533376381360547
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92533416097360548)
,p_db_column_name=>'DSCRPCION_ERROR'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Descripci\00F3n<br>Error')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92533572308360549)
,p_db_column_name=>'CDGO_PRDIAL'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Referencia<br>Catastral'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92533698540360550)
,p_db_column_name=>'AREA_OBJTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('\00C1rea<br>Objeto')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92557578864440801)
,p_db_column_name=>'MTRCLA_INMBLRIA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Matr\00EDcula<br>Inmobiliaria')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92557681102440802)
,p_db_column_name=>'PRPTRIO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Propietario'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92557777583440803)
,p_db_column_name=>'VLOR_P1'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Valor P1'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92557898346440804)
,p_db_column_name=>'VLOR_P2'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Valor P2'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92557901797440805)
,p_db_column_name=>'DRCCION'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92558072063440806)
,p_db_column_name=>'HCHO_GNRDOR'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Hecho<br>Generador'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92558125061440807)
,p_db_column_name=>'VLOR_PLSVLIA_ACTLZDA'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('Valor Plusval\00EDa<br>Actualizada')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(92582952657614467)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'925830'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_ERROR:CDGO_PRDIAL:AREA_OBJTO:MTRCLA_INMBLRIA:PRPTRIO:VLOR_P1:VLOR_P2:DRCCION:HCHO_GNRDOR:VLOR_PLSVLIA_ACTLZDA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(92558271984440808)
,p_plug_name=>'Registros Sin Valor P1'
,p_region_name=>'datos_archivo_no_valorp1'
,p_parent_plug_id=>wwv_flow_api.id(90458158195814326)
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164079332454707690)
,p_plug_display_sequence=>210
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select  ',
'         a.dscrpcion_error	',
'        ,a.cdgo_prdial			',
'        ,a.area_objto			',
'        ,a.mtrcla_inmblria		',
'        ,a.prptrio				',
'        ,a.vlor_p1				',
'        ,a.vlor_p2		',
'        ,a.drccion				',
'        ,a.hcho_gnrdor	',
'        ,a.vlor_plsvlia_actlzda',
'     from gi_g_plusvalia_procso_dtlle a',
'     join gi_g_plusvalia_proceso      b on a.id_prcso_plsvlia = b.id_prcso_plsvlia',
'    where id_prcso_crga = :P153_ID_PRCSO_CRGA ',
'      and rgstro_error = ''S''',
'      and vlor_p1 is null;'))
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
 p_id=>wwv_flow_api.id(92558308833440809)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NCARRASQUILLA'
,p_internal_uid=>92558308833440809
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92558445170440810)
,p_db_column_name=>'DSCRPCION_ERROR'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Descripci\00F3n<br>Error')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92558542745440811)
,p_db_column_name=>'CDGO_PRDIAL'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Referencia<br>Catastral'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92558647321440812)
,p_db_column_name=>'AREA_OBJTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('\00C1rea<br>Objeto')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92558796890440813)
,p_db_column_name=>'MTRCLA_INMBLRIA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Matr\00EDcula<br>Inmobiliaria')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92558852832440814)
,p_db_column_name=>'PRPTRIO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Propietario'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92558961015440815)
,p_db_column_name=>'VLOR_P1'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Valor P1'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92559009721440816)
,p_db_column_name=>'VLOR_P2'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Valor P2'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92559168927440817)
,p_db_column_name=>'DRCCION'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92559292214440818)
,p_db_column_name=>'HCHO_GNRDOR'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Hecho<br>Generador'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92559318882440819)
,p_db_column_name=>'VLOR_PLSVLIA_ACTLZDA'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('Valor Plusval\00EDa<br>Actualizada')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(92583678119614477)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'925837'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_ERROR:CDGO_PRDIAL:AREA_OBJTO:MTRCLA_INMBLRIA:PRPTRIO:VLOR_P1:VLOR_P2:DRCCION:HCHO_GNRDOR:VLOR_PLSVLIA_ACTLZDA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(92559445098440820)
,p_plug_name=>'Registros Sin Valor P2'
,p_region_name=>'datos_archivo_no_valorp2'
,p_parent_plug_id=>wwv_flow_api.id(90458158195814326)
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164079332454707690)
,p_plug_display_sequence=>220
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select  ',
'         a.dscrpcion_error	',
'        ,a.cdgo_prdial			',
'        ,a.area_objto			',
'        ,a.mtrcla_inmblria		',
'        ,a.prptrio				',
'        ,a.vlor_p1				',
'        ,a.vlor_p2		',
'        ,a.drccion				',
'        ,a.hcho_gnrdor	',
'        ,a.vlor_plsvlia_actlzda',
'     from gi_g_plusvalia_procso_dtlle a',
'     join gi_g_plusvalia_proceso      b on a.id_prcso_plsvlia = b.id_prcso_plsvlia',
'    where id_prcso_crga = :P153_ID_PRCSO_CRGA ',
'      and rgstro_error = ''S''',
'      and vlor_p2 is null;'))
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
 p_id=>wwv_flow_api.id(92559503619440821)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NCARRASQUILLA'
,p_internal_uid=>92559503619440821
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92559682184440822)
,p_db_column_name=>'DSCRPCION_ERROR'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Descripci\00F3n<br>Error')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92559701717440823)
,p_db_column_name=>'CDGO_PRDIAL'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Referencia<br>Catastral'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92559863874440824)
,p_db_column_name=>'AREA_OBJTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('\00C1rea<br>Objeto')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92559913128440825)
,p_db_column_name=>'MTRCLA_INMBLRIA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Matr\00EDcula<br>Inmobiliaria')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92560082986440826)
,p_db_column_name=>'PRPTRIO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Propietario'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92560159989440827)
,p_db_column_name=>'VLOR_P1'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Valor P1'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92560265345440828)
,p_db_column_name=>'VLOR_P2'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Valor P2'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92560337093440829)
,p_db_column_name=>'DRCCION'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92560498292440830)
,p_db_column_name=>'HCHO_GNRDOR'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Hecho<br>Generador'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92560519297440831)
,p_db_column_name=>'VLOR_PLSVLIA_ACTLZDA'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('Valor Plusval\00EDa<br>Actualizada')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(92584366691614479)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'925844'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_ERROR:CDGO_PRDIAL:AREA_OBJTO:MTRCLA_INMBLRIA:PRPTRIO:VLOR_P1:VLOR_P2:DRCCION:HCHO_GNRDOR:VLOR_PLSVLIA_ACTLZDA'
);
end;
/
begin
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(92955218844064511)
,p_plug_name=>'Registros Duplicados en otro Archivo'
,p_region_name=>'datos_archivo_duplicado'
,p_parent_plug_id=>wwv_flow_api.id(90458158195814326)
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164079332454707690)
,p_plug_display_sequence=>230
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select  ',
'         a.dscrpcion_error	',
'        ,a.cdgo_prdial			',
'        ,a.area_objto			',
'        ,a.mtrcla_inmblria		',
'        ,a.prptrio				',
'        ,a.vlor_p1				',
'        ,a.vlor_p2		',
'        ,a.drccion				',
'        ,a.hcho_gnrdor	',
'        ,a.vlor_plsvlia_actlzda',
'     from gi_g_plusvalia_procso_dtlle a',
'     join gi_g_plusvalia_proceso      b on a.id_prcso_plsvlia = b.id_prcso_plsvlia',
'    where id_prcso_crga = :P153_ID_PRCSO_CRGA ',
'      and rgstro_error = ''D'';'))
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
 p_id=>wwv_flow_api.id(92955356508064512)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NCARRASQUILLA'
,p_internal_uid=>92955356508064512
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92955427024064513)
,p_db_column_name=>'DSCRPCION_ERROR'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Descripci\00F3n<br>Error')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92955565748064514)
,p_db_column_name=>'CDGO_PRDIAL'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Referencia<br>Catastral'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92955638919064515)
,p_db_column_name=>'AREA_OBJTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('\00C1rea<br>Objeto')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92955749005064516)
,p_db_column_name=>'MTRCLA_INMBLRIA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Matr\00EDcula<br>Inmobiliaria')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92955822198064517)
,p_db_column_name=>'PRPTRIO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Propietario'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92955959566064518)
,p_db_column_name=>'VLOR_P1'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Valor P1'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92956058710064519)
,p_db_column_name=>'VLOR_P2'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Valor P2'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92956151487064520)
,p_db_column_name=>'DRCCION'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92956209102064521)
,p_db_column_name=>'HCHO_GNRDOR'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Hecho<br>Generador'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92956399655064522)
,p_db_column_name=>'VLOR_PLSVLIA_ACTLZDA'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('Valor Plusval\00EDa<br>Actualizada')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(93157954414942524)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'931580'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_ERROR:CDGO_PRDIAL:AREA_OBJTO:MTRCLA_INMBLRIA:PRPTRIO:VLOR_P1:VLOR_P2:DRCCION:HCHO_GNRDOR:VLOR_PLSVLIA_ACTLZDA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(91423068634164843)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(89420349732943625)
,p_plug_name=>'Ayuda'
,p_parent_plug_id=>wwv_flow_api.id(91423068634164843)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	<br>',
'	<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'	<i>',
unistr('	Esta funcionalidad permite procesar el archivo de Plusval\00EDa y muestra las inconsistencias encontradas.<br><br>'),
unistr('		<p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'	</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(147645641603138759)
,p_plug_name=>unistr('Proceso de Archivo Plusval\00EDa')
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(91423158360164844)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(91423068634164843)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:159:&SESSION.::&DEBUG.:RP,153::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(89238996517977230)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(147645641603138759)
,p_button_name=>'Btn_Procesar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padLeft:t-Button--padRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(89420105961943623)
,p_branch_name=>'Ir a la misma pagina'
,p_branch_action=>'f?p=&APP_ID.:153:&SESSION.::&DEBUG.:RP,153:P153_ID_PRCSO_CRGA:&P153_ARCHIVO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89239306664977233)
,p_name=>'P153_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(147645641603138759)
,p_prompt=>'Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_impsto  d',
'     , a.id_impsto r ',
'  from df_c_impuestos     a ',
' where a.cdgo_clnte       = :F_CDGO_CLNTE',
'   and a.cdgo_impsto = ''PLU'';'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89239776048977239)
,p_name=>'P153_IMPUESTO_SUBIMPUESTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(147645641603138759)
,p_prompt=>'Sub Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P153_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P153_IMPSTO'
,p_ajax_items_to_submit=>'P153_IMPSTO,P153_IMPUESTO_SUBIMPUESTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89240105769977291)
,p_name=>'P153_VGNCIA'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(147645641603138759)
,p_prompt=>'Vigencia:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'25%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89240539468977292)
,p_name=>'P153_PRDO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(147645641603138759)
,p_prompt=>'Periodo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select prdo    as d',
'     , id_prdo as r  ',
'  from df_i_periodos',
' where id_impsto         = :P153_IMPSTO',
'   and id_impsto_sbmpsto = :P153_IMPUESTO_SUBIMPUESTO',
'   and vgncia            = :P153_VGNCIA;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P153_IMPSTO,P153_IMPUESTO_SUBIMPUESTO,P153_VGNCIA'
,p_ajax_items_to_submit=>'P153_PRDO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'25%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89240930338977292)
,p_name=>'P153_ARCHIVO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(147645641603138759)
,p_prompt=>'Archivo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.file_name d--|| ''  |  '' || to_char( a.fcha_rgstro , ''DD/MM/YYYY HH:MI:SS AM'' )  || ''  |  '' || a.nmbre_trcro as d',
'      , a.id_prcso_crga as r',
'   from v_et_g_procesos_carga a',
'  where a.cdgo_clnte        = :F_CDGO_CLNTE',
'    and a.id_impsto         = :P153_IMPSTO',
'    and a.id_impsto_sbmpsto = :P153_IMPUESTO_SUBIMPUESTO',
'    and a.vgncia            = :P153_VGNCIA  ',
'    and a.id_prdo           = :P153_PRDO',
'    and a.indcdor_prcsdo    = ''N''',
'    and exists(',
'                      select 1',
'                        from gi_g_plusvalia_archivo c',
'                       where c.id_prcso_crga = a.id_prcso_crga',
'                         and c.estdo_rgstro is null',
'                    group by a.id_prcso_crga',
'              );',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P153_IMPSTO,P153_IMPUESTO_SUBIMPUESTO,P153_VGNCIA,P153_PRDO'
,p_ajax_items_to_submit=>'P153_IMPSTO,P153_IMPUESTO_SUBIMPUESTO,P153_VGNCIA,P153_PRDO,P153_ARCHIVO'
,p_ajax_optimize_refresh=>'Y'
,p_colspan=>8
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89241374610977293)
,p_name=>'P153_BRANCH_APP'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(147645641603138759)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89241709628977293)
,p_name=>'P153_BRANCH_PAGE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(147645641603138759)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89304333979008224)
,p_name=>'P153_ID_PRCSO_CRGA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(147645641603138759)
,p_source=>'P153_ARCHIVO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90458492619814329)
,p_name=>'P153_ID_PRCSO_PLSVLIA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(147645641603138759)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(90459633075814341)
,p_name=>'Al hacer clic abrir modal error'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(90458523431814330)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(90459813022814343)
,p_event_id=>wwv_flow_api.id(90459633075814341)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#datos_archivo_no_validos").dialog("open");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(90459788836814342)
,p_event_id=>wwv_flow_api.id(90459633075814341)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(91681908750963223)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(92530254802360516)
,p_name=>'Al hacer clic abrir modal hecho'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(90459295790814337)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92530468552360518)
,p_event_id=>wwv_flow_api.id(92530254802360516)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#datos_archivo_no_hecho").dialog("open");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92530371190360517)
,p_event_id=>wwv_flow_api.id(92530254802360516)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(91681908750963223)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(92530597122360519)
,p_name=>'Al hacer clic abrir modal direccion'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(90458850356814333)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92530737367360521)
,p_event_id=>wwv_flow_api.id(92530597122360519)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#datos_archivo_no_direccion").dialog("open");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92530686212360520)
,p_event_id=>wwv_flow_api.id(92530597122360519)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(92530801050360522)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(92560613979440832)
,p_name=>'Al hacer clic abrir modal propietario'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(90458925816814334)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92560854938440834)
,p_event_id=>wwv_flow_api.id(92560613979440832)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#datos_archivo_no_propietario").dialog("open");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92560798164440833)
,p_event_id=>wwv_flow_api.id(92560613979440832)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(92532087325360534)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(92560993898440835)
,p_name=>'Al hacer clic abrir modal areaobjeto'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(90459099312814335)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92561128859440837)
,p_event_id=>wwv_flow_api.id(92560993898440835)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#datos_archivo_no_areaobjeto").dialog("open");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92561019415440836)
,p_event_id=>wwv_flow_api.id(92560993898440835)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(92533282866360546)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(92561270131440838)
,p_name=>'Al hacer clic abrir modal valorp1'
,p_event_sequence=>60
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(90459117441814336)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92561424456440840)
,p_event_id=>wwv_flow_api.id(92561270131440838)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#datos_archivo_no_valorp1").dialog("open");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92561311922440839)
,p_event_id=>wwv_flow_api.id(92561270131440838)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(92558271984440808)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(92561538234440841)
,p_name=>'Al hacer clic abrir modal valorp2'
,p_event_sequence=>70
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(90459354862814338)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92561796566440843)
,p_event_id=>wwv_flow_api.id(92561538234440841)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#datos_archivo_no_valorp2").dialog("open");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92561672187440842)
,p_event_id=>wwv_flow_api.id(92561538234440841)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(92559445098440820)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(92956493539064523)
,p_name=>'Al hacer clic abrir modal duplicado'
,p_event_sequence=>80
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(90459431936814339)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92956695132064525)
,p_event_id=>wwv_flow_api.id(92956493539064523)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#datos_archivo_duplicado").dialog("open");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92956578659064524)
,p_event_id=>wwv_flow_api.id(92956493539064523)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(92955218844064511)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(92393889862403024)
,p_name=>'Al hacer clic abrir modal Matricula'
,p_event_sequence=>90
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(90458691690814331)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92394074192403026)
,p_event_id=>wwv_flow_api.id(92393889862403024)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#datos_archivo_no_matricula").dialog("open");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92393939362403025)
,p_event_id=>wwv_flow_api.id(92393889862403024)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(92394145250403027)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(92395351690403039)
,p_name=>'Al hacer clic abrir modal predial'
,p_event_sequence=>100
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(90458794537814332)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92395574740403041)
,p_event_id=>wwv_flow_api.id(92395351690403039)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#datos_archivo_no_predial").dialog("open");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92395460532403040)
,p_event_id=>wwv_flow_api.id(92395351690403039)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(92395621280403042)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(89242180129977304)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Procesar Archivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_cdgo_rspsta        number;',
'     v_mnsje_rspsta       varchar2(4000);',
'     v_id_prcso_plsvlia   number;',
'begin',
'     pkg_gi_plusvalia.prc_pr_archivo_plusvalia( p_id_usrio          => :F_ID_USRIO',
'                                               , p_cdgo_clnte        => :F_CDGO_CLNTE',
'                                               , p_id_impsto         => :P153_IMPSTO',
'                                               , p_id_impsto_sbmpsto => :P153_IMPUESTO_SUBIMPUESTO',
'                                               , p_id_prcso_crga	 => :P153_ARCHIVO',
'                                               , p_vgncia            => :P153_VGNCIA',
'                                               , p_id_prdo           => :P153_PRDO',
'                                               , o_cdgo_rspsta       => v_cdgo_rspsta',
'                                               , o_mnsje_rspsta      => v_mnsje_rspsta);        ',
'   if (v_cdgo_rspsta <> 0) then',
'       raise_application_error( -20001 , v_mnsje_rspsta );     ',
'   end if;   ',
'   ',
'   ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(89238996517977230)
,p_process_success_message=>unistr('Proceso Realizado con \00C9xito.')
);
end;
/
