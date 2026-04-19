prompt --application/pages/page_00061
begin
wwv_flow_api.create_page(
 p_id=>61
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Lote Determinaci\00F3n')
,p_step_title=>unistr('Lote Determinaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function procesoEjecutarConsulta() {',
'  var $waitPopup;',
' ',
'    //Elimina los mensajes de la coleccion',
'  apex.message.clearErrors();',
'    ',
'  if ( $v(''P61_ID_SQL'').length !== 0 ) {',
'      ',
'    apex.server.process(',
'    "Ejecutar Consulta 2",',
'    {',
'     pageItems: "#P61_ID_IMPSTO,#P61_ID_IMSPTO_SBMPSTO,#P61_VGNCIA_DSDE,#P61_PRDO_DSDE,#P61_VGNCIA_HSTA,#P61_PRDO_HSTA,#P61_SLCCION_PBLCION,#P61_ARCHVO,#P61_ID_SQL,#P61_DDA_DSDE,#P61_DDA_HSTA,#P61_FCHA_VNCMNTO" ',
'    },',
'    {',
'      beforeSend: function() {',
'        $waitPopup = apex.widget.waitPopup();',
'      },',
'      success: function(s) {',
'          console.log(s); ',
'          $waitPopup.remove();',
'          if (s.err === 0) {              ',
'              apex.message.showPageSuccess("Consulta Ejecutada Exitosamente");',
'              apex.submit({ request:"IGNORE"});',
'          }else {',
'              apex.message.showErrors({',
'              type: apex.message.TYPE.ERROR,',
'              location: ["page"],',
'              message: s.msg,',
'              unsafe: false',
'          });',
'              ',
'          }',
'         ',
'      },',
'      error: function(e) {',
'        apex.message.showErrors({',
'          type: apex.message.TYPE.ERROR,',
'          location: ["page"],',
'          message: e.responseText,',
'          unsafe: false',
'        });',
'',
'        console.log("error", e);',
'        $waitPopup.remove();',
'      }',
'    }',
'  );',
'  } else  {',
'      apex.message.showErrors({',
'          type: apex.message.TYPE.ERROR,',
'          location: ["page" , "inline"],',
'          pageItem: "P61_ID_SQL",',
'          message: "Debe seleccionar una consulta",',
'          unsafe: false',
'        });',
'      ',
'  }',
'}',
''))
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
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'PSOTTER'
,p_last_upd_yyyymmddhh24miss=>'20210624091744'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(50688530624789009)
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
 p_id=>wwv_flow_api.id(50688482331789008)
,p_plug_name=>'Consolidado Total Registros de la consulta'
,p_region_name=>'Consolidado_Total'
,p_parent_plug_id=>wwv_flow_api.id(50688530624789009)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-top-sm:margin-bottom-sm:margin-left-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
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
 p_id=>wwv_flow_api.id(50688656669789010)
,p_plug_name=>'Consolidado Total Sujetos Tributos Validos'
,p_parent_plug_id=>wwv_flow_api.id(50688530624789009)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-top-sm:margin-bottom-sm:margin-right-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
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
 p_id=>wwv_flow_api.id(50688722558789011)
,p_plug_name=>'Consolidado Total Sujetos Tributos NO Validos'
,p_parent_plug_id=>wwv_flow_api.id(50688530624789009)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-bottom-sm:margin-left-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
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
 p_id=>wwv_flow_api.id(50688884150789012)
,p_plug_name=>'Consolidado Total Sujetos Tributos Bloqueados'
,p_parent_plug_id=>wwv_flow_api.id(50688530624789009)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
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
 p_id=>wwv_flow_api.id(50688935767789013)
,p_plug_name=>'Consolidado Total Sujetos Tributos Sin Saldo'
,p_parent_plug_id=>wwv_flow_api.id(50688530624789009)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
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
 p_id=>wwv_flow_api.id(50689088984789014)
,p_plug_name=>'Consolidado Registros Duplicados'
,p_parent_plug_id=>wwv_flow_api.id(50688530624789009)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
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
 p_id=>wwv_flow_api.id(52515883024153543)
,p_plug_name=>'Consolidado Registros con Determinaciones'
,p_parent_plug_id=>wwv_flow_api.id(50688530624789009)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:margin-bottom-sm:margin-right-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
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
 p_id=>wwv_flow_api.id(371514475391669263)
,p_plug_name=>'Sujetos Tributos NO Validos'
,p_region_name=>'datos_archivo_no_validos'
,p_parent_plug_id=>wwv_flow_api.id(50688530624789009)
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_plug_template=>wwv_flow_api.id(164079332454707690)
,p_plug_display_sequence=>140
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
 p_id=>wwv_flow_api.id(372222387100558852)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>372222387100558852
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2260986635935733)
,p_db_column_name=>'N002'
,p_display_order=>10
,p_column_identifier=>'F'
,p_column_label=>unistr('No. L\00EDnea')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2258958809935731)
,p_db_column_name=>'N001'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'N001'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2259365529935732)
,p_db_column_name=>'C001'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2259799947935732)
,p_db_column_name=>'C002'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Existe?'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2260181405935733)
,p_db_column_name=>'C003'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2260504522935733)
,p_db_column_name=>'C004'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Nombre Responsable'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(372237458839569209)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'22613'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'N002:C001:C002:C003:C004:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(372224417199558872)
,p_plug_name=>'Registros Duplicados'
,p_region_name=>'datos_archivo_duplicados'
,p_parent_plug_id=>wwv_flow_api.id(50688530624789009)
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164079332454707690)
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
 p_id=>wwv_flow_api.id(372224562840558873)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>372224562840558873
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2264271204935737)
,p_db_column_name=>'N002'
,p_display_order=>10
,p_column_identifier=>'F'
,p_column_label=>unistr('No. L\00EDnea')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2262646018935736)
,p_db_column_name=>'C001'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2263089769935736)
,p_db_column_name=>'C002'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Existe?'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2263416607935737)
,p_db_column_name=>'C003'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2263885945935737)
,p_db_column_name=>'C004'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Nombre Responsable'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(372375129512085214)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'22646'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'N002:C001:C002:C003:C004'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(372226462135558892)
,p_plug_name=>'Sujetos Tributos Bloqueados'
,p_region_name=>'datos_archivo_bloqueado'
,p_parent_plug_id=>wwv_flow_api.id(50688530624789009)
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164079332454707690)
,p_plug_display_sequence=>150
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
 p_id=>wwv_flow_api.id(372226526298558893)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>372226526298558893
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2265620853935739)
,p_db_column_name=>'C001'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2266062009935739)
,p_db_column_name=>'C002'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Existe?'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2266421512935739)
,p_db_column_name=>'C003'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2266848114935740)
,p_db_column_name=>'C004'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Nombre Responsable'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2267268350935740)
,p_db_column_name=>'N002'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('No. L\00EDnea')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(372865472188072012)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'22676'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'N002:C001:C002:C003:C004'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(373070173777456496)
,p_plug_name=>'Sujetos Tributos Sin Saldo'
,p_region_name=>'datos_archivo_sin_saldo'
,p_parent_plug_id=>wwv_flow_api.id(50688530624789009)
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164079332454707690)
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
 p_id=>wwv_flow_api.id(373070343698456497)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>373070343698456497
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2268608189935741)
,p_db_column_name=>'C001'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2269068724935741)
,p_db_column_name=>'C002'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Existe?'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2269424677935741)
,p_db_column_name=>'C003'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2269827053935742)
,p_db_column_name=>'C004'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Nombre Responsable'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2270205508935742)
,p_db_column_name=>'N002'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('No. L\00EDnea')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(373626657098399810)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'22706'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'N002:C001:C002:C003:C004:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(50820017987539001)
,p_plug_name=>'Datos SQL'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>70
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
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P61_ID_SQL is not null and :P61_SLCCION_PBLCION = ''SQL'''
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
 p_id=>wwv_flow_api.id(50820164095539002)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>50820164095539002
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(50820295506539003)
,p_db_column_name=>'C001'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(50820362696539004)
,p_db_column_name=>'C002'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('\00BFExiste?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(50820481496539005)
,p_db_column_name=>'C003'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(50820580905539006)
,p_db_column_name=>'C004'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Responsable'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(50820737076539008)
,p_db_column_name=>'C005'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(50820892314539009)
,p_db_column_name=>'N003'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Saldo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(50827656028543548)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'508277'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'C001:C002:C003:C004:C005:N003'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(48559130216405145)
,p_report_id=>wwv_flow_api.id(50827656028543548)
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
 p_id=>wwv_flow_api.id(48559565105405145)
,p_report_id=>wwv_flow_api.id(50827656028543548)
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
 p_id=>wwv_flow_api.id(48559986408405146)
,p_report_id=>wwv_flow_api.id(50827656028543548)
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
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(48560371748405146)
,p_report_id=>wwv_flow_api.id(50827656028543548)
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(370481687476430088)
,p_plug_name=>unistr('Lote de Determinaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:margin-top-sm:margin-bottom-sm:margin-left-sm:margin-right-sm'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
begin
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(371516921577669287)
,p_plug_name=>'Datos Archivo'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>60
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
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P61_ARCHVO is not null and :P61_SLCCION_PBLCION = ''ACV'''
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
 p_id=>wwv_flow_api.id(371517007271669288)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>371517007271669288
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2273517812935746)
,p_db_column_name=>'N002'
,p_display_order=>10
,p_column_identifier=>'G'
,p_column_label=>unistr('No L\00EDnea')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2271921748935744)
,p_db_column_name=>'C001'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2272369915935744)
,p_db_column_name=>'C002'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>unistr('\00BFExiste?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2272731809935745)
,p_db_column_name=>'C003'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2273108170935746)
,p_db_column_name=>'C004'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Responsable'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2273961125935746)
,p_db_column_name=>'C005'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2374544855094006)
,p_db_column_name=>'N003'
,p_display_order=>80
,p_column_identifier=>'I'
,p_column_label=>'Saldo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(372204204530456768)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'22743'
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
 p_id=>wwv_flow_api.id(49659140958735512)
,p_report_id=>wwv_flow_api.id(372204204530456768)
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
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(49659576416735513)
,p_report_id=>wwv_flow_api.id(372204204530456768)
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
 p_id=>wwv_flow_api.id(49659986111735513)
,p_report_id=>wwv_flow_api.id(372204204530456768)
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
 p_id=>wwv_flow_api.id(49660321225735514)
,p_report_id=>wwv_flow_api.id(372204204530456768)
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
 p_id=>wwv_flow_api.id(49660700715735515)
,p_report_id=>wwv_flow_api.id(372204204530456768)
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(372223473964558863)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
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
 p_id=>wwv_flow_api.id(373618844979393562)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
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
unistr('Crear lotes de Determinaci\00F3n, para un grupo de sujetos del tributo espec\00EDfico.<br><br>'),
unistr(' Para seleccionar la poblaci\00F3n de sujetos del tributo se tienen dos opciones:<br><br>'),
unistr('    <b><i> a. Archivo Plano:</i></b> Debe contener s\00F3lo las identificaciones de los sujetos del tributo.<br><br>'),
unistr('    <b><i> b. Construcci\00F3n de una Consulta:</i></b> Selecci\00F3n o construcci\00F3n de una consulta SQL.'),
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2276695076935748)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(372223473964558863)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:60:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2277414099935749)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(372223473964558863)
,p_button_name=>'BTN_PROCESAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de procesar el lote de DeterminaciÃ³n?  Nota: Al aceptar el procesamiento del lote de determinaciÃ³n se realizarÃ¡ en segundo plano. En cuanto termine el procesamiento el sistema le notificara de manera automÃ¡tica que este ha terminado. '',''BTN_PROCESAR'');'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_count number;',
'begin',
'    begin',
'        select count (*)',
'          into v_count',
'          from gn_g_temporal ',
'         where id_ssion = :APP_SESSION',
'           and C005 = ''VLD'';',
'    exception ',
'       when no_data_found then ',
'           v_count := 0;',
'   end;',
'',
'    if v_count > 0 then ',
'        if (:P61_SLCCION_PBLCION = ''ACV'' and :P61_ARCHVO is not null) then',
'            return true;',
'        elsif :P61_SLCCION_PBLCION = ''SQL'' then',
'            return true;',
'        else ',
'            return false;',
'        end if;',
'    else ',
'        return false;',
'    end if;',
'    ',
'    ',
'',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2152789088634110)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_api.id(370481687476430088)
,p_button_name=>'BTN_CONSTRUCTOR_SQL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Constructor de Consulta'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-code'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2247031229935707)
,p_button_sequence=>160
,p_button_plug_id=>wwv_flow_api.id(370481687476430088)
,p_button_name=>'BTN_LEER_ARCHIVO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Leer Archivo'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-dynamic-content'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2247495357935707)
,p_button_sequence=>170
,p_button_plug_id=>wwv_flow_api.id(370481687476430088)
,p_button_name=>'BTN_EJECUTAR_CONSULTA'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ejecutar Consulta'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-dynamic-content'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2246634343935706)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(370481687476430088)
,p_button_name=>'BTN_CANCELAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:61:&SESSION.::&DEBUG.:RP,61::'
,p_icon_css_classes=>'fa-calendar-ban'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(105967127543930301)
,p_branch_name=>unistr('Ir P\00E1gina Consulta SQL ')
,p_branch_action=>'f?p=50000:907:&SESSION.::&DEBUG.:RP,907:P907_PAGE_ID,P907_APP_ID,P907_COD_PROCESO,P907_ITEM_ID:&APP_PAGE_ID.,&APP_ID.,DET,P61_ID_SQL&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(2152789088634110)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2304383361935775)
,p_branch_name=>unistr('Ir P\00E1gina 60 - Lotes de Determinaci\00F3n')
,p_branch_action=>'f?p=&APP_ID.:60:&SESSION.::&DEBUG.:RP,60::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(2277414099935749)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2152541439634108)
,p_name=>'P61_DDA_DSDE_VSAL'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(370481687476430088)
,p_prompt=>'Deuda Desde'
,p_format_mask=>':FRMTO_MNDA'
,p_display_as=>'PLUGIN_AUTONUMERIC'
,p_cSize=>30
,p_cMaxlength=>14
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Valor de la Deuda inicial. Este valor es tenido en cuenta para seleccionar los sujetos  del tributo que tengan igual o mayor valor de deuda entre las vigencia-Periodo Inicial y Vigencia-Periodo Final seleccionadas. '
,p_attribute_01=>'P61_DDA_DSDE'
,p_attribute_02=>'10000000000000'
,p_attribute_03=>'1'
,p_attribute_07=>','
,p_attribute_10=>'null'
,p_attribute_11=>'null'
,p_attribute_12=>'null'
,p_attribute_13=>'3'
,p_attribute_14=>'.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2152619035634109)
,p_name=>'P61_DDA_HSTA_VSAL'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(370481687476430088)
,p_prompt=>'Deuda Hasta'
,p_display_as=>'PLUGIN_AUTONUMERIC'
,p_cSize=>30
,p_cMaxlength=>14
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Valor de la Deuda Final. Este valor es tenido en cuenta para seleccionar los sujetos  del tributo que tengan igual o menor valor de deuda entre las vigencia-Periodo Inicial y Vigencia-Periodo Final seleccionadas. '
,p_attribute_01=>'P61_DDA_HSTA'
,p_attribute_02=>'10000000000000'
,p_attribute_03=>'1'
,p_attribute_07=>','
,p_attribute_10=>'null'
,p_attribute_11=>'null'
,p_attribute_12=>'null'
,p_attribute_13=>'3'
,p_attribute_14=>'.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2152920958634112)
,p_name=>'P61_NMBRE_CNSLTA'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(370481687476430088)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Consulta Seleccionada'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_cnslta',
'  from cs_g_consultas_maestro',
' where id_cnslta_mstro = :P61_ID_SQL'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2247855810935709)
,p_name=>'P61_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(370481687476430088)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Tributo al que pertenece el lote de determinaci\00F3n')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2248233675935710)
,p_name=>'P61_ID_IMSPTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(370481687476430088)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_impsto_sbmpsto d, ',
'        id_impsto_sbmpsto r',
'   from df_i_impuestoS_subimpuesto ',
'  where cdgo_clnte = :F_CDGO_CLNTE ',
'    and id_impsto = :P61_ID_IMPSTO'))
,p_lov_cascade_parent_items=>'P61_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Sub-Tributo al que pertenece el lote de determinaci\00F3n')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2248614985935711)
,p_name=>'P61_VGNCIA_DSDE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(370481687476430088)
,p_prompt=>'Vigencia Desde'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_colspan=>4
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_help_text=>'Vigencia Desde: Esta vigencia es tenida en cuenta para seleccionar los sujetos del tributo que tengan deuda a partir de la vigencia seleccionada. '
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2249013545935711)
,p_name=>'P61_PRDO_DSDE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(370481687476430088)
,p_prompt=>'Periodo Desde'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select prdo d, ',
'         prdo v',
'   from df_i_periodos ',
'  where cdgo_clnte = :F_CDGO_CLNTE ',
'    and id_impsto =:P61_ID_IMPSTO',
'    and id_impsto_sbmpsto = :P61_ID_IMSPTO_SBMPSTO',
'    and vgncia = :P61_VGNCIA_DSDE',
'order by prdo    '))
,p_lov_cascade_parent_items=>'P61_VGNCIA_DSDE,P61_ID_IMSPTO_SBMPSTO'
,p_ajax_items_to_submit=>'P61_VGNCIA_DSDE'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_help_text=>'Periodo Desde: Este Periodo es tenido en cuenta para seleccionar los sujetos  del tributo que tengan deuda a partir del Periodo seleccionado. '
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2249492994935711)
,p_name=>'P61_VGNCIA_HSTA'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(370481687476430088)
,p_prompt=>'Vigencia Hasta'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_help_text=>'Vigencia Hasta: Esta vigencia es tenida en cuenta para seleccionar los sujetos  del tributo que tengan deuda hasta la vigencia seleccionada. '
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2249877566935712)
,p_name=>'P61_PRDO_HSTA'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(370481687476430088)
,p_prompt=>'Periodo Hasta'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select prdo d, ',
'         prdo v',
'   from df_i_periodos ',
'  where cdgo_clnte = :F_CDGO_CLNTE ',
'    and id_impsto =:P61_ID_IMPSTO',
'    and id_impsto_sbmpsto = :P61_ID_IMSPTO_SBMPSTO',
'    and vgncia = :P61_VGNCIA_HSTA',
'order by prdo    '))
,p_lov_cascade_parent_items=>'P61_VGNCIA_HSTA,P61_ID_IMSPTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_help_text=>'Periodo Hasta: Este Periodo es tenido en cuenta para seleccionar los sujetos  del tributo que tengan deuda hasta el Periodo seleccionado. '
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2250234205935712)
,p_name=>'P61_SLCCION_PBLCION'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(370481687476430088)
,p_item_default=>'SQL'
,p_prompt=>unistr('Selecci\00F3n Pablaci\00F3n por:')
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Archivo;ACV,Consulta;SQL'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Indica el m\00E9todo que ser\00E1 usado para seleccionar los sujetos  del tributo a determinar. ')
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2250610325935712)
,p_name=>'P61_ARCHVO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(370481687476430088)
,p_prompt=>'Archivo'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_tag_attributes=>'accept=".txt"'
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(164103298426707753)
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2251466544935712)
,p_name=>'P61_ID_SQL'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(370481687476430088)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2251873741935713)
,p_name=>'P61_RSPSTA'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(370481687476430088)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2252218183935713)
,p_name=>'P61_ID_DCMNTO_LTE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(370481687476430088)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2252600091935713)
,p_name=>'P61_TTAL_SJTO_IMPSTO'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(370481687476430088)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(81392199777596201)
,p_name=>'P61_DDA_DSDE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(370481687476430088)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(81392288552596202)
,p_name=>'P61_DDA_HSTA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(370481687476430088)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2282496627935757)
,p_validation_name=>'Validar que la vigencia Hasta no sea menor a la Vigencia Desde'
,p_validation_sequence=>10
,p_validation=>':P61_VGNCIA_HSTA >= :P61_VGNCIA_DSDE'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'La vigencia hasta no puede ser menor a la vigencia desde'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(2247031229935707)
,p_associated_item=>wwv_flow_api.id(2249492994935711)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2282806236935757)
,p_validation_name=>'Validar que exista un archivo seleccionado'
,p_validation_sequence=>80
,p_validation=>'P61_ARCHVO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por Favor Seleccionar un archivo.'
,p_validation_condition=>'P61_SLCCION_PBLCION'
,p_validation_condition2=>'ACV'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(2247031229935707)
,p_associated_item=>wwv_flow_api.id(2250610325935712)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(114863511988413202)
,p_validation_name=>'El id de la consulta no sea nulo'
,p_validation_sequence=>90
,p_validation=>'P61_ID_SQL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor seleccione una consulta'
,p_validation_condition=>'P61_SLCCION_PBLCION'
,p_validation_condition2=>'SQL'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(2247495357935707)
,p_associated_item=>wwv_flow_api.id(2251466544935712)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(38663208562421130)
,p_validation_name=>'Deuda Desde no nulo y Mayor que 0'
,p_validation_sequence=>100
,p_validation=>':P61_DDA_DSDE is not null and to_number(:P61_DDA_DSDE, ''999999999999990D00'', ''nls_numeric_characters=''''.,'''''' ) > 0'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'El valor ingresado debe ser mayor que 0.'
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_api.id(2152541439634108)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(48805143680045429)
,p_validation_name=>'Deuda Hasta no nulo y Mayor que 0'
,p_validation_sequence=>110
,p_validation=>':P61_DDA_HSTA is not null and to_number(:P61_DDA_HSTA, ''999999999999990D00'', ''nls_numeric_characters=''''.,'''''' ) > 0'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'El valor ingresado debe ser mayor que 0.'
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_api.id(2152619035634109)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(48805210889045430)
,p_validation_name=>'New'
,p_validation_sequence=>120
,p_validation=>'to_number(:P61_DDA_HSTA, ''999999999999990D00'', ''nls_numeric_characters=''''.,'''''' )  >= to_number(:P61_DDA_DSDE, ''999999999999990D00'', ''nls_numeric_characters=''''.,'''''' )'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'La deuda hasta debe ser mayor o igual que la deuda desde'
,p_associated_item=>wwv_flow_api.id(2152619035634109)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2285554172935760)
,p_name=>'Al cambiar. Si es Archivo se muestra el item para seleccionar un archivo'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P61_SLCCION_PBLCION'
,p_condition_element=>'P61_SLCCION_PBLCION'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'ACV'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2286040300935761)
,p_event_id=>wwv_flow_api.id(2285554172935760)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P61_ARCHVO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2287023879935763)
,p_event_id=>wwv_flow_api.id(2285554172935760)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P61_ARCHVO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2288529032935763)
,p_event_id=>wwv_flow_api.id(2285554172935760)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(2247031229935707)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2289557998935766)
,p_event_id=>wwv_flow_api.id(2285554172935760)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(2247031229935707)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2152814409634111)
,p_event_id=>wwv_flow_api.id(2285554172935760)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(2152789088634110)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2291052165935767)
,p_event_id=>wwv_flow_api.id(2285554172935760)
,p_event_result=>'FALSE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(2152789088634110)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2153046146634113)
,p_event_id=>wwv_flow_api.id(2285554172935760)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P61_NMBRE_CNSLTA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2153127266634114)
,p_event_id=>wwv_flow_api.id(2285554172935760)
,p_event_result=>'FALSE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P61_NMBRE_CNSLTA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2290047673935766)
,p_event_id=>wwv_flow_api.id(2285554172935760)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P61_ID_SQL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2291597459935767)
,p_event_id=>wwv_flow_api.id(2285554172935760)
,p_event_result=>'FALSE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(2247495357935707)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2290510654935767)
,p_event_id=>wwv_flow_api.id(2285554172935760)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(2247495357935707)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50839817474628404)
,p_event_id=>wwv_flow_api.id(2285554172935760)
,p_event_result=>'FALSE'
,p_action_sequence=>70
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(50820017987539001)
,p_attribute_01=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50839925266628405)
,p_event_id=>wwv_flow_api.id(2285554172935760)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(371516921577669287)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50840015824628406)
,p_event_id=>wwv_flow_api.id(2285554172935760)
,p_event_result=>'FALSE'
,p_action_sequence=>80
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(371516921577669287)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2292957505935768)
,p_name=>unistr('Al cambiar el archivo se refresca la regi\00F3n de datos del archivo')
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P61_ARCHVO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2293421018935768)
,p_event_id=>wwv_flow_api.id(2292957505935768)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''IDNTFCCION_SJTO_IMPSTO''); ',
'APEX_UTIL.SET_SESSION_STATE(''P61_ARCHVO'',:P61_ARCHVO);'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2296991583935770)
,p_event_id=>wwv_flow_api.id(2292957505935768)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(371514475391669263)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2297359929935771)
,p_name=>'Al hacer clic Abrir modal de registros duplicados'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(50689088984789014)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2297899010935771)
,p_event_id=>wwv_flow_api.id(2297359929935771)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#datos_archivo_duplicados").dialog("open");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2298389801935771)
,p_event_id=>wwv_flow_api.id(2297359929935771)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(372224417199558872)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2300124389935772)
,p_name=>'Al hacer clic Abrir modal de datos bloqueados'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(50688884150789012)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2300697104935772)
,p_event_id=>wwv_flow_api.id(2300124389935772)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#datos_archivo_bloqueado").dialog("open");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2301102731935772)
,p_event_id=>wwv_flow_api.id(2300124389935772)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(372226462135558892)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2301575634935772)
,p_name=>'Al hacer clic Abrir modal de datos no validos'
,p_event_sequence=>60
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(50688722558789011)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2302004183935773)
,p_event_id=>wwv_flow_api.id(2301575634935772)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#datos_archivo_no_validos").dialog("open");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2302553806935773)
,p_event_id=>wwv_flow_api.id(2301575634935772)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(371514475391669263)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50689647882789020)
,p_name=>'Al hacer clic Abrir modal de datos de sin saldo'
,p_event_sequence=>70
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(50688935767789013)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50689781498789021)
,p_event_id=>wwv_flow_api.id(50689647882789020)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#datos_archivo_sin_saldo").dialog("open");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50689894232789022)
,p_event_id=>wwv_flow_api.id(50689647882789020)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(373070173777456496)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2302927389935774)
,p_name=>'Al hacer clic limpiar los datos'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(187457932347795398)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2303410421935774)
,p_event_id=>wwv_flow_api.id(2302927389935774)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(370481687476430088)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50648643680572004)
,p_name=>'Leer Archivo'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(2247031229935707)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50648781325572005)
,p_event_id=>wwv_flow_api.id(50648643680572004)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'procesoLeerArchivo();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50749239515960702)
,p_name=>unistr('Generar Lote de Determinaci\00F3n')
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(2277414099935749)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50749311863960703)
,p_event_id=>wwv_flow_api.id(50749239515960702)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'procesoGenerarLoteDeterminacion();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(103052319953096912)
,p_name=>'Ejecutar Ajax procesoEjecutarConsulta'
,p_event_sequence=>130
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(2247495357935707)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(114864113066413208)
,p_event_id=>wwv_flow_api.id(103052319953096912)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'delete from gn_g_temporal where id_ssion = :APP_SESSION;',
'commit;',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(103052447879096913)
,p_event_id=>wwv_flow_api.id(103052319953096912)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'procesoEjecutarConsulta();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(137474407335761447)
,p_name=>unistr('Al hacer clic al bot\00F3n cancelar')
,p_event_sequence=>150
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(2276695076935748)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(137474610340761449)
,p_event_id=>wwv_flow_api.id(137474407335761447)
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
 p_id=>wwv_flow_api.id(77770157137212401)
,p_process_sequence=>10
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
'    where name =  :P61_ARCHVO;   ',
'        ',
'    pkg_gi_determinacion.prc_gn_procesar_archivo (p_cdgo_clnte		    => :F_CDGO_CLNTE,',
'                                                  p_id_ssion            => :APP_SESSION,',
'                                                  p_blob			    => v_blob_data,',
'                                                  p_id_impsto		    => :P61_ID_IMPSTO,',
'                                                  p_id_impsto_sbmpsto   => :P61_ID_IMSPTO_SBMPSTO,',
'                                                  p_vgncia_dsde	        => :P61_VGNCIA_DSDE,',
'                                                  p_prdo_dsde		    => :P61_PRDO_DSDE,',
'                                                  p_vgncia_hsta	        => :P61_VGNCIA_HSTA,',
'                                                  p_prdo_hsta		    => :P61_PRDO_HSTA,',
'                                                  p_dda_dsde		    => :P61_DDA_DSDE,',
'                                                  p_dda_hsta		    => :P61_DDA_HSTA,',
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
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2284397016935759)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('\00CDtems en sesi\00F3n')
,p_process_sql_clob=>'APEX_UTIL.SET_SESSION_STATE(''P61_PRDO_DSDE'',:P61_PRDO_DSDE);'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(82088763339055501)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Generar lote de Determinaci\00F3n job')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_error varchar2(1000);',
'begin',
'    insert into gti_aux (col1, col2) values (''F_CDGO_CLNTE'', :F_CDGO_CLNTE);',
'    insert into gti_aux (col1, col2) values (''APP_SESSION'', :APP_SESSION);',
'    insert into gti_aux (col1, col2) values (''P61_ID_IMPSTO'', :P61_ID_IMPSTO);',
'    insert into gti_aux (col1, col2) values (''P61_ID_IMSPTO_SBMPSTO'', :P61_ID_IMSPTO_SBMPSTO);',
'    insert into gti_aux (col1, col2) values (''P61_SLCCION_PBLCION'', :P61_SLCCION_PBLCION);',
'    insert into gti_aux (col1, col2) values (''P61_VGNCIA_DSDE'', :P61_VGNCIA_DSDE);',
'    insert into gti_aux (col1, col2) values (''P61_PRDO_DSDE'', :P61_PRDO_DSDE);',
'    insert into gti_aux (col1, col2) values (''P61_VGNCIA_HSTA'', :P61_VGNCIA_HSTA);',
'    insert into gti_aux (col1, col2) values (''P61_PRDO_HSTA'', :P61_PRDO_HSTA);',
'    insert into gti_aux (col1, col2) values (''P61_DDA_DSDE'', :P61_DDA_DSDE);',
'    insert into gti_aux (col1, col2) values (''P61_DDA_HSTA'', :P61_DDA_HSTA);',
'    insert into gti_aux (col1, col2) values (''F_ID_USRIO'', :F_ID_USRIO);',
'    commit;',
'    BEGIN',
'        DBMS_SCHEDULER.set_attribute( name => ''"GENESYS"."IT_GI_PROCESAR_DETERMINACION"'', attribute => ''job_action'', value => ''PKG_GI_DETERMINACION.PRC_RG_LOTE_DETERMINACION'');',
'',
'        DBMS_SCHEDULER.set_attribute( name => ''"GENESYS"."IT_GI_PROCESAR_DETERMINACION"'', attribute => ''number_of_arguments'', value => ''13'');',
'',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PROCESAR_DETERMINACION'', argument_position => 1, argument_value => :F_CDGO_CLNTE);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PROCESAR_DETERMINACION'', argument_position => 2, argument_value => :APP_SESSION);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PROCESAR_DETERMINACION'', argument_position => 3, argument_value => :P61_ID_IMPSTO);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PROCESAR_DETERMINACION'', argument_position => 4, argument_value => :P61_ID_IMSPTO_SBMPSTO);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PROCESAR_DETERMINACION'', argument_position => 5, argument_value => :P61_SLCCION_PBLCION);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PROCESAR_DETERMINACION'', argument_position => 6, argument_value => :P61_VGNCIA_DSDE);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PROCESAR_DETERMINACION'', argument_position => 7, argument_value => :P61_PRDO_DSDE);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PROCESAR_DETERMINACION'', argument_position => 8, argument_value => :P61_VGNCIA_HSTA);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PROCESAR_DETERMINACION'', argument_position => 9, argument_value => :P61_PRDO_HSTA);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PROCESAR_DETERMINACION'', argument_position => 10, argument_value => :P61_DDA_DSDE);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PROCESAR_DETERMINACION'', argument_position => 11, argument_value => :P61_DDA_HSTA);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PROCESAR_DETERMINACION'', argument_position => 12, argument_value => :F_ID_USRIO);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PROCESAR_DETERMINACION'', argument_position => 13, argument_value => 1);',
'',
'    END; ',
'',
'    ',
'    BEGIN',
'        DBMS_SCHEDULER.ENABLE(''"GENESYS"."IT_GI_PROCESAR_DETERMINACION"'');',
'    END; ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(2277414099935749)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(137474368991761446)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Limpiar Tempo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    delete from gn_g_temporal where id_ssion = :APP_SESSION;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(2276695076935748)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(50687770527789001)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Ejecutar Consulta 2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_sql               clob;',
'    v_to_cursor_number  number; ',
'    v_column_count      number; ',
'    v_desc_table        dbms_sql.desc_tab;',
'    TYPE tipoCursor IS REF CURSOR;',
'    c_sjto_impsto tipoCursor;',
'    ',
'    v_clmna_exte        varchar2(1);',
'    v_nmbre_clmna       varchar2(35);',
'    ',
'    ',
'    v_accion varchar2(1);',
'',
'    v_id_sjto_impsto    si_i_sujetos_impuesto.id_sjto_impsto%type;',
'    v_drccion           si_c_sujetos.drccion%type;  ',
'    v_nmbre_rspnsble    v_si_i_sujetos_responsable.nmbre_rzon_scial%type;  ',
'    v_idntfccion        varchar2(30);',
'    v_indcdor_existe    varchar2(2);',
'    v_estdo             varchar2(30);',
'    v_sldo              number;',
'    v_nmro_lnea         number;',
'    v_ttal_dtrmncion    number;',
'    v_cntdad_vgncia_prdo    number;',
'    ',
'    begin',
'        apex_json.initialize_output ( p_http_cache => false );',
'        owa_util.mime_header(''application/json'', false);',
'        htp.p(''cache-control: no-cache'');',
'        htp.p(''pragma: no-cache'');',
'        owa_util.http_header_close;',
'        apex_json.open_object();',
'',
'        begin ',
'            v_sql := ''select * from ('' || pkg_cs_constructorsql.fnc_co_sql_dinamica(:P61_ID_SQL, :F_CDGO_CLNTE) || '') where rownum = 1 '';',
'            ',
'            open c_sjto_impsto for v_sql;',
'            v_to_cursor_number := dbms_sql.to_cursor_number(c_sjto_impsto);  ',
'            dbms_sql.describe_columns(v_to_cursor_number, v_column_count, v_desc_table);',
'',
'            for i in 1 .. v_column_count loop',
'                dbms_sql.define_column(v_to_cursor_number, i, null, 4000);',
'            end loop;',
'',
'            v_clmna_exte := ''N''; ',
'            while dbms_sql.fetch_rows(v_to_cursor_number) > 0 loop',
unistr('                -- Busqueda de la columan Identificaci\00F3n del Sujeto Impuesto'),
'                for i in 1 .. v_column_count loop                      ',
'                    if upper(v_desc_table(i).col_name) in (''IDNTFCCION'',''IDNTFCCION_SJTO'') then',
'                        v_clmna_exte := ''S'';',
'                        v_nmbre_clmna := v_desc_table(i).col_name;',
'                    end if;',
unistr('                end loop; -- Fin Busqueda de la columan Identificaci\00F3n del Sujeto Impuesto'),
'            end loop;',
'            ',
'            pkg_sg_log.prc_rg_log(60, null, ''pkg_gi_determinacion.prc_gn_procesar_archivo'',  10000, ''v_sql: ''||v_sql, 1); ',
'            ',
'        exception ',
'            when others then ',
'               apex_json.write(''msg'', ''La consulta no tiene las columna necesarias.'');     ',
'        end;',
'        ',
'        ---',
'        if  v_clmna_exte = ''S'' then ',
'            v_sql := ''select ''|| v_nmbre_clmna || '' from( '' || pkg_cs_constructorsql.fnc_co_sql_dinamica(p_id_cnslta_mstro => :P61_ID_SQL, p_cdgo_clnte => :F_CDGO_CLNTE)  || '')'';',
'            APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''IDNTFCCION_SJTO_IMPSTO''); ',
'',
'                            ',
'            if apex_collection.collection_exists(''IDNTFCCION_SJTO_IMPSTO'') then',
'                open c_sjto_impsto for v_sql;',
'                loop ',
'                    fetch c_sjto_impsto into v_idntfccion;',
'                    exit when c_sjto_impsto%NOTFOUND;',
'                    ',
unistr('                    -- Se valida si el la identificaci\00F3n corresponde a un sujeto impuesto'),
'                        begin ',
'                           select id_sjto_impsto ',
'                             into v_id_sjto_impsto ',
'                             from v_si_i_sujetos_impuesto ',
'                            where cdgo_clnte = :F_CDGO_CLNTE ',
'                              and idntfccion_sjto = v_idntfccion ',
'                              and id_impsto = :P61_ID_IMPSTO;',
'                            ',
unistr('                              --  Si existe el sujeto impuesto se consulta la direcci\00F3n, responsable y se calcula el estado'),
'                              if v_id_sjto_impsto is not null then',
'                                  ',
'',
'                                  select count(*) ',
'                                    into v_ttal_dtrmncion',
'                                    from v_gi_g_determinacion_detalle ',
'                                   where cdgo_clnte			= :F_CDGO_CLNTE',
'                                     and id_impsto			= :P61_ID_IMPSTO',
'                                     and id_impsto_sbmpsto	= :P61_ID_IMSPTO_SBMPSTO',
'                                     and id_sjto_impsto		= v_id_sjto_impsto',
'                                    and (vgncia * 100 + prdo) between (:P61_VGNCIA_DSDE * 100 + :P61_PRDO_DSDE) and (:P61_VGNCIA_HSTA * 100 + :P61_PRDO_HSTA);',
'                                  ',
'                                  begin',
'                                   select count(*) ',
'                                      into v_cntdad_vgncia_prdo',
'                                      from v_gf_g_cartera_x_concepto',
'                                     where cdgo_clnte			= :F_CDGO_CLNTE',
'                                       and id_impsto			= :P61_ID_IMPSTO',
'                                       and id_impsto_sbmpsto	= :P61_ID_IMSPTO_SBMPSTO',
'                                       and id_sjto_impsto		= v_id_sjto_impsto',
'                                       and (vgncia * 100 + prdo) between (:P61_VGNCIA_DSDE * 100 + :P61_PRDO_DSDE) and (:P61_VGNCIA_HSTA * 100 + :P61_PRDO_HSTA);',
'                                  exception ',
'                                      when others then',
'                                          v_cntdad_vgncia_prdo := 0;',
'                                  end;',
'                                ',
'                                   begin                                   ',
'                                       select ''SI'' indcdor_existe,',
'                                              a.drccion,',
'                                              c.nmbre_rzon_scial,',
'                                              case when a.estdo_blqdo_sjto = ''S'' then ''BLQ''',
'                                                  when v_ttal_dtrmncion = v_cntdad_vgncia_prdo then ''DTM''',
'                                                   when (sum (b.vlor_sldo_cptal + b.vlor_intres) between :P61_DDA_DSDE and  :P61_DDA_HSTA ) and  a.estdo_blqdo_sjto = ''N'' then ''VLD''',
'                                               else ''SNS''',
'                                              end as estdo,',
'                                              nvl(sum (b.vlor_sldo_cptal + b.vlor_intres),0) sldo',
'                                         into v_indcdor_existe,',
'                                              v_drccion,',
'                                              v_nmbre_rspnsble,',
'                                              v_estdo,',
'                                              v_sldo',
'                                         from v_si_i_sujetos_impuesto a',
'                                         join v_si_i_sujetos_responsable c on a.id_sjto = c.id_sjto',
'                                         left join v_gf_g_cartera_x_vigencia  b on a.id_sjto_impsto =  b.id_sjto_impsto',
'                                          and (b.vgncia * 100 + b.prdo) between (:P61_VGNCIA_DSDE * 100 + :P61_PRDO_DSDE) and (:P61_VGNCIA_HSTA * 100 + :P61_PRDO_HSTA)',
'                                        where a.cdgo_clnte = :F_CDGO_CLNTE',
'                                          and a.id_impsto = :P61_ID_IMPSTO',
'                                          and a.id_sjto_impsto =  v_id_sjto_impsto  -- 0003000000000901900008312',
'                                          and c.prncpal_s_n = ''S''',
'                                     group by a.id_sjto_impsto,',
'                                              a.drccion,',
'                                              c.nmbre_rzon_scial,',
'                                              a.estdo_blqdo_sjto;',
'                                   exception',
'                                           when others then',
'                                               insert into gti_aux (col1, col2) values (''10. mas de uno. v_id_sjto_impsto: '', v_id_sjto_impsto); commit;',
'                                    end;',
'',
unistr('                               end if; -- Fin Validaci\00F3n Sujeto impuesto existe                   '),
'',
'                        exception ',
'                           when no_data_found then ',
'                               v_id_sjto_impsto := null;',
'                               v_indcdor_existe := ''NO'' ;  ',
'                               v_drccion        := '' -- '';',
'                               v_nmbre_rspnsble := '' -- '';',
'                               v_estdo          := ''NVD'';',
'                               v_sldo           := 0;',
'                        end; ',
unistr('                    -- Se llena la colecci\00F3n'),
'                    APEX_COLLECTION.ADD_MEMBER( p_collection_name => ''IDNTFCCION_SJTO_IMPSTO'',',
'                                                    p_n001            => v_id_sjto_impsto,',
'                                                    p_C001            => v_idntfccion,',
'                                                    p_C002            => v_indcdor_existe,',
'                                                    p_C003            => v_drccion,',
'                                                    p_C004            => v_nmbre_rspnsble,',
'                                                    p_C005            => v_estdo,',
'                                                    p_N003            => v_sldo ); ',
'                end loop;',
'                v_nmro_lnea := 1;',
'                ',
'                for c_sjto_impsto in (select n001 id_sjto_impsto,',
'                                             c001 idntfccion,  ',
'                                             c002 indcdor_existe, ',
'                                             c003 drccion,',
'                                             c004 nmbre_rspnsble,  ',
'                                             c005 cdgo_dtrmncion_sjto_estdo,  ',
'                                             n003 sldo ',
'								from apex_collections ',
'                               where collection_name = ''IDNTFCCION_SJTO_IMPSTO'') loop',
'                    ',
'                    insert into gn_g_temporal (n001,				            n002,				            C001,			                                C002,',
'                                               C003,				            C004,				            C005,		                                    n003, ',
'                                               id_ssion)',
'                                       values (c_sjto_impsto.id_sjto_impsto,	v_nmro_lnea,		            c_sjto_impsto.idntfccion,	                    c_sjto_impsto.indcdor_existe, ',
'                                               c_sjto_impsto.drccion, 		    c_sjto_impsto.nmbre_rspnsble,	c_sjto_impsto.cdgo_dtrmncion_sjto_estdo, 		c_sjto_impsto.sldo, ',
'                                               :APP_SESSION);',
'                    v_nmro_lnea := v_nmro_lnea + 1;',
'                end loop;',
'                ',
unistr('                -- -- Se Recorre la colecci\00F3n para validar los registros duplicados'),
'                for c_clction in (select id_tmpral, n001, n002, C001, C002, C003, C004, n003, ',
'                                         case when (row_number() over(partition by c001 order by c001))>1 then ',
'                                            ''DPC''',
'                                            else ',
'                                                to_char(c005)',
'                                         end c005,',
'                                         row_number() over(partition by c001 order by c001)C006',
'                                    from gn_g_temporal ',
'                                   where id_ssion = :APP_SESSION',
'                                order by n002) loop',
unistr('                    -- Se actualiza la collecci\00F3n '),
'                    update gn_g_temporal ',
'                    set n001 = c_clction.n001,',
'                        n002 = c_clction.n002,',
'                        c001 = c_clction.c001,',
'                        C002 = c_clction.c002,',
'                        C003 = c_clction.c003,',
'                        C004 = c_clction.c004,',
'                        C005 = c_clction.c005,',
'                        n003 = c_clction.n003',
'                    where id_tmpral = c_clction.id_tmpral',
'                      and id_ssion = :APP_SESSION;',
unistr('                end loop; -- Fin Se Recorre la colecci\00F3n para validar los registros duplicados'),
'        ',
'               close c_sjto_impsto;',
'                  apex_json.write(''msg'', ''Proceso terminado.''); ',
'                  apex_json.write(''err'', 0);   ',
'',
'            end if;',
'        else',
unistr('            apex_json.write(''msg'', ''No existe la columna de identificaci\00F3n del sujeto impuesto.''); '),
'            apex_json.write(''err'', 1); ',
'        end if;',
'        ---',
'        apex_json.close_object();  ',
'  ',
'    exception',
'        when others then',
'            apex_json.write(''err'',true);',
'            apex_json.write(''msg'',apex_escape.html(''--< '' || sqlerrm));',
'            apex_json.close_all();',
'    end;',
'',
''))
,p_process_error_message=>'E'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(2247495357935707)
,p_process_success_message=>'EJEUCTADA'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2284746349935759)
,p_process_sequence=>20
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Crear Colecci\00F3n de Sujetos impuestos')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin    ',
'    if apex_collection.collection_exists( p_collection_name => ''IDNTFCCION_SJTO_IMPSTO'' ) then ',
unistr('        --insert into gti_aux (col1,col2) values (''0001'',''Si exite la colesi\00F3n'');'),
'        ',
'       for c_cllction in (select seq_id from apex_collections where collection_name = ''IDNTFCCION_SJTO_IMPSTO'' and d001 is null) loop ',
'           APEX_COLLECTION.DELETE_MEMBER( p_collection_name => ''IDNTFCCION_SJTO_IMPSTO'', p_seq => c_cllction.seq_id);',
'       end loop;',
'    ',
'        null;',
'     else ',
'         APEX_COLLECTION.CREATE_COLLECTION(p_collection_name => ''IDNTFCCION_SJTO_IMPSTO''); ',
unistr('        -- insert into gti_aux (col1,col2) values (''0002'',''No exite la colesi\00F3n, se cre\00F3'');                                       '),
'    end if;',
'end;',
'        ',
'        ',
'',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'IGNORE'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
);
null;
end;
/
