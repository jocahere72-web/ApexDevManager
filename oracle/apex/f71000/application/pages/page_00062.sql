prompt --application/pages/page_00062
begin
wwv_flow_api.create_page(
 p_id=>62
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Poblaci\00F3n')
,p_step_title=>unistr('Poblaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function procesoEjecutarConsulta() {',
'  var $waitPopup;',
' ',
'    //Elimina los mensajes de la coleccion',
'  apex.message.clearErrors();',
'    ',
'  if ( $v(''P62_ID_SQL'').length !== 0 ) {',
'      ',
'    apex.server.process(',
'    "Ejecutar Consulta",',
'    {',
'      pageItems: "#P60_ID_IMPSTO,#P60_ID_IMSPTO_SBMPSTO,#P60_VGNCIA_DSDE,#P60_PRDO_DSDE,#P60_VGNCIA_HSTA,#P60_PRDO_HSTA,#P62_SLCCION_PBLCION,#P62_ARCHVO,#P62_ID_SQL"',
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
'              apex.region(''consultaFacturas'').refresh();',
'              //Actualizamos los indicadores',
'              apex.region("registros_en_archivo").refresh();',
'              apex.region("Total_Sjtos_Imp_Vldos").refresh();',
'              apex.region("Total_Sjtos_Imp_NO_Vldos").refresh();',
'              apex.region("registros_bloqueados").refresh();',
'             // apex.region("registros_duplicados").refresh();',
'             /* apex.region(''opciones'').refresh();',
'              apex.submit({ request:"IGNORE"});*/',
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
'          pageItem: "P62_ID_SQL",',
'          message: "Debe seleccionar una consulta",',
'          unsafe: false',
'        });',
'      ',
'  }',
'}'))
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
''))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'LOBREDOR'
,p_last_upd_yyyymmddhh24miss=>'20190613110606'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4415119393966855)
,p_plug_name=>unistr('Poblaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_component_template_options=>'t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_api.id(177337797773050609)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(4414536068966851)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(177351601973050625)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4513149111339021)
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
 p_id=>wwv_flow_api.id(4634570906108824)
,p_plug_name=>'Opciones'
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
unistr('Para la creaci\00F3n de lote de facturaci\00F3n masiva con multiples fechas se deden realizar 4 pasos. En esta opci\00F3n se ejecutara el segundo paso.<br>'),
unistr('<center><b><i> Paso 2: Poblaci\00F3n </i></b> </br></center>'),
unistr('Para seleccionar la poblaci\00F3n de sujetos impuestos se tienen dos opciones:</br>'),
'    <b><i> a. Archivo Plano:</i></b> Debe contener solo las identificaciones de los sujetos impuestos.</br>',
unistr('    <b><i> b. Construcci\00F3n de una Consulta:</i></b> Selecci\00F3n o construcci\00F3n de una condici\00F3n.</br>'),
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(372679529711579669)
,p_plug_name=>unistr('Poblaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(373737041518831871)
,p_plug_name=>'Consolidado'
,p_region_name=>'consultaFacturas'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4386706451902523)
,p_plug_name=>'Consolidado Total Sujetos Tributos Validos'
,p_region_name=>'Total_Sjtos_Imp_Vldos'
,p_parent_plug_id=>wwv_flow_api.id(373737041518831871)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-top-md:margin-right-md'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select ''Sujetos Validos'' label,',
'       count(c002) value',
'  from apex_collections ',
' where collection_name = ''IDNTFCCION_SJTO_IMPSTO''',
'   and c005 = ''Valido''*/',
'select ''Sujetos Validos'' label,',
'       count(c002) value',
'  from gn_g_temporal ',
' where id_ssion = :APP_SESSION',
'   and c005 = ''Validos'';'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4386891550902524)
,p_plug_name=>'Consolidado Total Registros del Archivo'
,p_region_name=>'registros_en_archivo'
,p_parent_plug_id=>wwv_flow_api.id(373737041518831871)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:margin-top-md:margin-left-md'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_grid_column_css_classes=>'badgeListColor1'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select ''Total Registros'' label,',
'       count(c001) value',
'  from apex_collections ',
' where collection_name = ''IDNTFCCION_SJTO_IMPSTO''*/',
' select ''Total Registros'' label,',
'       count(c001) value',
'  from gn_g_temporal ',
' where id_ssion = :APP_SESSION;'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4386966818902525)
,p_plug_name=>'Consolidado Total Sujetos Tributos NO Validos'
,p_region_name=>'Total_Sjtos_Imp_NO_Vldos'
,p_parent_plug_id=>wwv_flow_api.id(373737041518831871)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-left-md'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_grid_column_css_classes=>'badgeListColor3'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select ''Sujetos NO Validos'' label,',
'       count(c002) value',
'  from apex_collections ',
' where collection_name = ''IDNTFCCION_SJTO_IMPSTO''',
'   and c005 = ''No Valido''*/',
'select ''Sujetos NO Validos'' label,',
'       count(c002) value',
'  from gn_g_temporal ',
' where id_ssion = :APP_SESSION',
'   and c005 = ''NO Validos'';'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4387048878902526)
,p_plug_name=>'Consolidado Total Sujetos Tributos Bloqueados'
,p_region_name=>'registros_bloqueados'
,p_parent_plug_id=>wwv_flow_api.id(373737041518831871)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor4'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select ''Sujetos Bloqueados'' label,',
'       count(c002) value',
'  from apex_collections ',
' where collection_name = ''IDNTFCCION_SJTO_IMPSTO''',
'   and c005 = ''Bloqueado''*/',
'select ''Sujetos Bloqueados'' label,',
'       count(c002) value',
'  from gn_g_temporal ',
' where id_ssion = :APP_SESSION',
'   and c005 = ''Bloqueados'';'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4387164384902527)
,p_plug_name=>'Consolidado Total Sujetos Tributos Sin Saldo'
,p_region_name=>'registros_sin_saldo'
,p_parent_plug_id=>wwv_flow_api.id(373737041518831871)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor5'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select ''Sujetos Sin Saldo'' label,',
'       count(c002) value',
'  from apex_collections ',
' where collection_name = ''IDNTFCCION_SJTO_IMPSTO''',
'   and c005 = ''Sin Saldo''*/',
'select ''Sujetos Sin Saldo'' label,',
'       count(c002) value',
'  from gn_g_temporal ',
' where id_ssion = :APP_SESSION',
'   and c005 = ''Sin Saldo'';'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4387235532902528)
,p_plug_name=>'Consolidado Registros Duplicados'
,p_region_name=>'registros_duplicados'
,p_parent_plug_id=>wwv_flow_api.id(373737041518831871)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-right-md'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor6'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select ''Registros Duplicados'' label,',
'       count(c002) value',
'  from apex_collections ',
' where collection_name = ''IDNTFCCION_SJTO_IMPSTO''',
'   and c005 = ''Duplicado'';*/',
'select ''Registros Duplicados'' label,',
'       count(c002) value',
'  from gn_g_temporal ',
' where id_ssion = :APP_SESSION',
'   and c005 = ''Duplicados'';'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P62_SLCCION_PBLCION'
,p_plug_display_when_cond2=>'ACV'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4387334292902529)
,p_plug_name=>'Sujetos Tributos NO Validos'
,p_region_name=>'datos_archivo_no_validos'
,p_parent_plug_id=>wwv_flow_api.id(373737041518831871)
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177331524321050607)
,p_plug_display_sequence=>70
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select n002, -- No. Linea',
'       n001, -- Id Sujeto Impuesto ',
unistr('       c001, -- Identificaci\00F3n'),
'       c002, -- Indicador Existe',
unistr('       c003, -- Direcci\00F3n'),
'       c004 -- Nombre Responsable',
'  from apex_collections ',
' where collection_name = ''IDNTFCCION_SJTO_IMPSTO''',
'   and c005 = ''No Valido'''))
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
 p_id=>wwv_flow_api.id(4387468040902530)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>4387468040902530
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4387575684902531)
,p_db_column_name=>'N002'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00B0 L\00EDnea')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4387673509902532)
,p_db_column_name=>'N001'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'N001'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4387736503902533)
,p_db_column_name=>'C001'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4387876558902534)
,p_db_column_name=>'C002'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Existe?'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4387990932902535)
,p_db_column_name=>'C003'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4388060890902536)
,p_db_column_name=>'C004'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Responsable'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(4503358272296922)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'45034'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'N002:N001:C001:C002:C003:C004'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4388462711902540)
,p_plug_name=>'Sujetos Tributos Bloqueados'
,p_region_name=>'datos_archivo_bloqueado'
,p_parent_plug_id=>wwv_flow_api.id(373737041518831871)
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177331524321050607)
,p_plug_display_sequence=>80
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select n002, -- No. Linea',
unistr('       c001, -- Identificaci\00F3n'),
'       c002, -- Indicador Existe',
unistr('       c003, -- Direcci\00F3n'),
'       c004 -- Nombre Responsable',
'  from apex_collections ',
' where collection_name = ''IDNTFCCION_SJTO_IMPSTO''',
'   and c005 = ''Bloqueado'''))
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
 p_id=>wwv_flow_api.id(4388545446902541)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>4388545446902541
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4388631026902542)
,p_db_column_name=>'N002'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00B0 L\00EDnea')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4388860282902544)
,p_db_column_name=>'C001'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4388934675902545)
,p_db_column_name=>'C002'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Existe?'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4389026188902546)
,p_db_column_name=>'C003'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4389177920902547)
,p_db_column_name=>'C004'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Responsable'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(4510449850336425)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'45105'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'N002:C001:C002:C003:C004'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4511174804339001)
,p_plug_name=>'Sujetos Tributos Sin Saldo'
,p_region_name=>'datos_archivo_sin_saldo'
,p_parent_plug_id=>wwv_flow_api.id(373737041518831871)
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177331524321050607)
,p_plug_display_sequence=>90
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select n002, -- No. Linea',
unistr('       c001, -- Identificaci\00F3n'),
'       c002, -- Indicador Existe',
unistr('       c003, -- Direcci\00F3n'),
'       c004 -- Nombre Responsable',
'  from apex_collections ',
' where collection_name = ''IDNTFCCION_SJTO_IMPSTO''',
'   and c005 = ''Sin Saldo'''))
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
 p_id=>wwv_flow_api.id(4511266735339002)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>4511266735339002
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4511333006339003)
,p_db_column_name=>'N002'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00B0 L\00EDnea')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4511437046339004)
,p_db_column_name=>'C001'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4511547690339005)
,p_db_column_name=>'C002'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Existe?'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4511662300339006)
,p_db_column_name=>'C003'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4511748821339007)
,p_db_column_name=>'C004'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Responsable'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(4519265381344850)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'45193'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'N002:C001:C002:C003:C004'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4512169738339011)
,p_plug_name=>'Registros Duplicados'
,p_region_name=>'datos_archivo_duplicados'
,p_parent_plug_id=>wwv_flow_api.id(373737041518831871)
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177331524321050607)
,p_plug_display_sequence=>100
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select n002, -- No. Linea',
unistr('       c001, -- Identificaci\00F3n'),
'       c002, -- Indicador Existe',
unistr('       c003, -- Direcci\00F3n'),
'       c004 -- Nombre Responsable',
'  from apex_collections ',
' where collection_name = ''IDNTFCCION_SJTO_IMPSTO''',
'   and c005 = ''Duplicado'''))
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
 p_id=>wwv_flow_api.id(4512207944339012)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>4512207944339012
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4512338320339013)
,p_db_column_name=>'N002'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00B0 L\00EDnea')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4512444375339014)
,p_db_column_name=>'C001'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4512503092339015)
,p_db_column_name=>'C002'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Existe?'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4512649509339016)
,p_db_column_name=>'C003'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4512722155339017)
,p_db_column_name=>'C004'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Responsable'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(4522924708354686)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'45230'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'N002:C001:C002:C003:C004'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(373738118427833995)
,p_plug_name=>'Datos Archivo'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select n002, -- No. Linea',
unistr('        c001, -- Identificaci\00F3n'),
'        c002, -- Indicador Existe',
unistr('        c003, -- Direcci\00F3n'),
'        c004, -- Nombre Responsable',
'        c005 -- Estado',
'  from apex_collections ',
' where collection_name = ''IDNTFCCION_SJTO_IMPSTO'''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P62_ARCHVO is not null and :P62_SLCCION_PBLCION = ''ACV'''
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
 p_id=>wwv_flow_api.id(373738204121833996)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>373738204121833996
);
end;
/
begin
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4469020267100404)
,p_db_column_name=>'N002'
,p_display_order=>10
,p_column_identifier=>'G'
,p_column_label=>unistr('No L\00EDnea')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4467484408100398)
,p_db_column_name=>'C001'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4467844509100404)
,p_db_column_name=>'C002'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Existe ?'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4468238483100404)
,p_db_column_name=>'C003'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4468673165100404)
,p_db_column_name=>'C004'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Responsable'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4469422119100405)
,p_db_column_name=>'C005'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(374425401380621476)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'44698'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100
,p_report_columns=>'N002:C001:C002:C003:C004:C005'
,p_sort_column_1=>'N002'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'C001'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'N001'
,p_sort_direction_3=>'ASC'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(4470269785100406)
,p_report_id=>wwv_flow_api.id(374425401380621476)
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
 p_id=>wwv_flow_api.id(4470618883100407)
,p_report_id=>wwv_flow_api.id(374425401380621476)
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
 p_id=>wwv_flow_api.id(4471074953100407)
,p_report_id=>wwv_flow_api.id(374425401380621476)
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
 p_id=>wwv_flow_api.id(4471471588100407)
,p_report_id=>wwv_flow_api.id(374425401380621476)
,p_name=>'Sin Saldo'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'C005'
,p_operator=>'='
,p_expr=>'Sin Saldo'
,p_condition_sql=>' (case when ("C005" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Sin Saldo''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#FFCA45'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(375058318176228962)
,p_plug_name=>'Datos Consulta SQL'
,p_region_name=>'consultaFacturas'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr(' select c001, -- Identificaci\00F3n'),
'        c002, -- Indicador Existe',
unistr('        c003, -- Direcci\00F3n'),
'        c004, -- Nombre Responsable',
'        c005 -- Estado',
'  from apex_collections ',
' where collection_name = ''IDNTFCCION_SJTO_IMPSTO'''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>':P62_ID_SQL is not null and :P62_SLCCION_PBLCION = ''SQL'''
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
 p_id=>wwv_flow_api.id(375058491765228963)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>375058491765228963
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4472156293101159)
,p_db_column_name=>'C001'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4472597758101159)
,p_db_column_name=>'C002'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Existe ?'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4472912822101160)
,p_db_column_name=>'C003'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4473390364101160)
,p_db_column_name=>'C004'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Responsable'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4473727620101160)
,p_db_column_name=>'C005'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(375287208151310709)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'44741'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'C001:C002:C003:C004:C005'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(4474538528101161)
,p_report_id=>wwv_flow_api.id(375287208151310709)
,p_name=>'Bloqueados'
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
 p_id=>wwv_flow_api.id(4474922931101161)
,p_report_id=>wwv_flow_api.id(375287208151310709)
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
 p_id=>wwv_flow_api.id(4475326429101161)
,p_report_id=>wwv_flow_api.id(375287208151310709)
,p_name=>'Sin Saldo'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'C005'
,p_operator=>'='
,p_expr=>'Sin Saldo'
,p_condition_sql=>' (case when ("C005" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Sin Saldo''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#FFCA45'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4513253250339022)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(4513149111339021)
,p_button_name=>'BTN_CONSULTAR_DESCUENTO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Ver Descuentos'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:58:&SESSION.::&DEBUG.:RP:P58_ID_IMPSTO,P58_ID_IMSPTO_SBMPSTO,P58_VGNCIA_DSDE,P58_PRDO_DSDE,P58_VGNCIA_HSTA,P58_PRDO_HSTA:&P60_ID_IMPSTO.,&P60_ID_IMSPTO_SBMPSTO.,&P60_VGNCIA_DSDE.,&P60_PRDO_DSDE.,&P60_VGNCIA_HSTA.,&P60_PRDO_HSTA.'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4634832988108827)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_api.id(372679529711579669)
,p_button_name=>'BTN_CONSTRUCTOR_SQL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Constructor SQL'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-code'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4444482689085268)
,p_button_sequence=>160
,p_button_plug_id=>wwv_flow_api.id(372679529711579669)
,p_button_name=>'BTN_LEER_ARCHIVO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Leer Archivo'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-dynamic-content'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4444898682085268)
,p_button_sequence=>170
,p_button_plug_id=>wwv_flow_api.id(372679529711579669)
,p_button_name=>'BTN_EJECUTAR_CONSULTA'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
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
 p_id=>wwv_flow_api.id(4444007298085268)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(4415119393966855)
,p_button_name=>'BTN_CANCELAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:61:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-calendar-ban'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4417219914966858)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(4415119393966855)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4386596225902521)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(4415119393966855)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355657869050631)
,p_button_image_alt=>'Previous'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4513642311339026)
,p_branch_name=>unistr('Ir P\00E1gina Consulta SQL ')
,p_branch_action=>'f?p=50000:902:&SESSION.::&DEBUG.:RP,902:P902_PAGE_ID,P902_APP_ID,P902_COD_PROCESO,P902_ITEM_ID:&APP_PAGE_ID.,&APP_ID.,FCM,P62_ID_SQL&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4634832988108827)
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(117370587065018001)
,p_branch_name=>unistr('Ir a P\00E1gina Constructor SQL')
,p_branch_action=>'f?p=50000:907:&SESSION.::&DEBUG.:RP:P907_PAGE_ID,P907_APP_ID,P907_COD_PROCESO,P907_ITEM_ID:&APP_PAGE_ID.,&APP_ID.,FMM,P62_ID_SQL&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4634832988108827)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4418069100966860)
,p_branch_name=>'Go To Page 63'
,p_branch_action=>'f?p=&APP_ID.:63:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4417219914966858)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4386616091902522)
,p_branch_name=>'Go To Page 60'
,p_branch_action=>'f?p=&APP_ID.:60:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4386596225902521)
,p_branch_sequence=>40
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4447653708085271)
,p_name=>'P62_SLCCION_PBLCION'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(372679529711579669)
,p_item_default=>'ACV'
,p_prompt=>unistr('Selecci\00F3n Pablaci\00F3n por:')
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Archivo;ACV,SQL;SQL'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4448058730085271)
,p_name=>'P62_ARCHVO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(372679529711579669)
,p_prompt=>'Archivo'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4448857831085272)
,p_name=>'P62_ID_SQL'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(372679529711579669)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4449291568085272)
,p_name=>'P62_RSPSTA'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(372679529711579669)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4449692339085272)
,p_name=>'P62_ID_DCMNTO_LTE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(372679529711579669)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4514882123339038)
,p_name=>'P62_SQL'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(372679529711579669)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30165351751586801)
,p_name=>'P62_NMBRE_CNSLTA'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(372679529711579669)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Consulta Seleccionada'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_cnslta',
'  from cs_g_consultas_maestro',
' where id_cnslta_mstro = :P62_ID_SQL'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117411262661208801)
,p_name=>'P62_TTAL_SJTO_IMPSTO'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(372679529711579669)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4386433492902520)
,p_validation_name=>'Validar que exista un archivo seleccionado'
,p_validation_sequence=>10
,p_validation=>'P62_ARCHVO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar un archivo'
,p_when_button_pressed=>wwv_flow_api.id(4444482689085268)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4635100750108830)
,p_validation_name=>'Validar que existan Sujetos validos para poder continuar'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'v_num_sjto    number;',
'begin',
'    begin ',
'        select count(seq_id)',
'          into v_num_sjto',
'      from apex_collections ',
'     where collection_name = ''IDNTFCCION_SJTO_IMPSTO''',
'       and c005 = ''Valido'';',
'       ',
'    exception',
'        when no_data_found then',
'           v_num_sjto := 0;',
'    end;',
'',
'',
'    if v_num_sjto > 0 then ',
'        return true;',
'    else ',
'        return false;',
'    end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Deben existir sujetos validos para poder continuar'
,p_when_button_pressed=>wwv_flow_api.id(4417219914966858)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4385028143902506)
,p_name=>unistr('Al cambiar el tipo de poblaci\00F3n se deben mostrar los botones y las regiones que correspondan')
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P62_SLCCION_PBLCION'
,p_condition_element=>'P62_SLCCION_PBLCION'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'ACV'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4385175175902507)
,p_event_id=>wwv_flow_api.id(4385028143902506)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(4444482689085268)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4385276710902508)
,p_event_id=>wwv_flow_api.id(4385028143902506)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(4444482689085268)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4385435539902510)
,p_event_id=>wwv_flow_api.id(4385028143902506)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P62_ARCHVO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4385684276902512)
,p_event_id=>wwv_flow_api.id(4385028143902506)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P62_ARCHVO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4386017902902516)
,p_event_id=>wwv_flow_api.id(4385028143902506)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(373738118427833995)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4386214963902518)
,p_event_id=>wwv_flow_api.id(4385028143902506)
,p_event_result=>'FALSE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(373738118427833995)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4634956399108828)
,p_event_id=>wwv_flow_api.id(4385028143902506)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(4634832988108827)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4513559741339025)
,p_event_id=>wwv_flow_api.id(4385028143902506)
,p_event_result=>'FALSE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(4634832988108827)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30165443990586802)
,p_event_id=>wwv_flow_api.id(4385028143902506)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P62_NMBRE_CNSLTA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4385384511902509)
,p_event_id=>wwv_flow_api.id(4385028143902506)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(4444898682085268)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30165675216586804)
,p_event_id=>wwv_flow_api.id(4385028143902506)
,p_event_result=>'FALSE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P62_NMBRE_CNSLTA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4385746569902513)
,p_event_id=>wwv_flow_api.id(4385028143902506)
,p_event_result=>'FALSE'
,p_action_sequence=>70
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(4444898682085268)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4386114443902517)
,p_event_id=>wwv_flow_api.id(4385028143902506)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(375058318176228962)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4386393703902519)
,p_event_id=>wwv_flow_api.id(4385028143902506)
,p_event_result=>'FALSE'
,p_action_sequence=>80
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(375058318176228962)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4388194662902537)
,p_name=>'Al hacer clic Abrir modal de datos de archivos no validos'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(4386966818902525)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4388250868902538)
,p_event_id=>wwv_flow_api.id(4388194662902537)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#datos_archivo_no_validos").dialog("open");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4388366975902539)
,p_event_id=>wwv_flow_api.id(4388194662902537)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4387334292902529)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4389299093902548)
,p_name=>'Al hacer clic Abrir modal de datos de archivos bloqueados'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(4387048878902526)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4389367112902549)
,p_event_id=>wwv_flow_api.id(4389299093902548)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#datos_archivo_bloqueado").dialog("open");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4389463582902550)
,p_event_id=>wwv_flow_api.id(4389299093902548)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4388462711902540)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4511805172339008)
,p_name=>'Al hacer clic Abrir modal de datos de archivos sin saldo'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(4387164384902527)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4511959775339009)
,p_event_id=>wwv_flow_api.id(4511805172339008)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#datos_archivo_sin_saldo").dialog("open");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4512026595339010)
,p_event_id=>wwv_flow_api.id(4511805172339008)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4511174804339001)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4512856067339018)
,p_name=>'Al hacer clic Abrir modal de datos de archivos duplicados'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(4387235532902528)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4512954077339019)
,p_event_id=>wwv_flow_api.id(4512856067339018)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#datos_archivo_duplicados").dialog("open");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4513031954339020)
,p_event_id=>wwv_flow_api.id(4512856067339018)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4512169738339011)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4513718978339027)
,p_name=>unistr('Al cambiar el archivo se refresca la regi\00F3n de datos del archivo')
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P62_ARCHVO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4513813980339028)
,p_event_id=>wwv_flow_api.id(4513718978339027)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''IDNTFCCION_SJTO_IMPSTO''); ',
'APEX_UTIL.SET_SESSION_STATE(''P62_ARCHVO'',:P62_ARCHVO);'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4513966574339029)
,p_event_id=>wwv_flow_api.id(4513718978339027)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4386891550902524)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4514030026339030)
,p_event_id=>wwv_flow_api.id(4513718978339027)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4386706451902523)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4514181148339031)
,p_event_id=>wwv_flow_api.id(4513718978339027)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4386966818902525)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4514241409339032)
,p_event_id=>wwv_flow_api.id(4513718978339027)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4387048878902526)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4514368904339033)
,p_event_id=>wwv_flow_api.id(4513718978339027)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4387164384902527)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4514469921339034)
,p_event_id=>wwv_flow_api.id(4513718978339027)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4387235532902528)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4514927965339039)
,p_name=>unistr('Al cambiar el id de la SQL se refresca la regi\00F3n de datos SQL')
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P62_ID_SQL,P62_SQL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4515042671339040)
,p_event_id=>wwv_flow_api.id(4514927965339039)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''IDNTFCCION_SJTO_IMPSTO''); ',
'APEX_UTIL.SET_SESSION_STATE(''P62_ID_SQL'',:P62_ID_SQL);',
'APEX_UTIL.SET_SESSION_STATE(''P62_SQL'',:P62_SQL);'))
,p_attribute_02=>'P62_ID_SQL,P62_SQL'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4515130641339041)
,p_event_id=>wwv_flow_api.id(4514927965339039)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4386891550902524)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4515201655339042)
,p_event_id=>wwv_flow_api.id(4514927965339039)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4386706451902523)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4515395777339043)
,p_event_id=>wwv_flow_api.id(4514927965339039)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4386966818902525)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4515493464339044)
,p_event_id=>wwv_flow_api.id(4514927965339039)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4387048878902526)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4515515399339045)
,p_event_id=>wwv_flow_api.id(4514927965339039)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4387164384902527)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4515637357339046)
,p_event_id=>wwv_flow_api.id(4514927965339039)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4387235532902528)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(117411322634208802)
,p_name=>'Ejecutar Ajax procesoEjecutarConsulta'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(4444898682085268)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(117411445920208803)
,p_event_id=>wwv_flow_api.id(117411322634208802)
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
 p_id=>wwv_flow_api.id(117411574358208804)
,p_event_id=>wwv_flow_api.id(117411322634208802)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'procesoEjecutarConsulta();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4487515062160723)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Procesar Archivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_blob_data       BLOB;',
'    v_blob_len        NUMBER;',
'    v_position        NUMBER;',
'    v_raw_chunk       RAW(10000);',
'    v_char            CHAR(1);',
'    c_chunk_len       number                  := 1;',
'    v_line            VARCHAR2 (32767)        := NULL;',
'    v_nmro_lnea       number;',
'    v_data_array      wwv_flow_global.vc_arr2;',
'',
'    v_id_sjto_impsto    si_i_sujetos_impuesto.id_sjto_impsto%type;',
'    v_drccion           si_i_sujetos_impuesto.drccion%type;  ',
'    v_nmbre_rspnsble    v_si_i_sujetos_responsable.nmbre_rspnsble%type;  ',
'    v_idntfccion        varchar2(30);',
'    v_indcdor_existe    varchar2(2);',
'    v_estdo             varchar2(30);',
'    v_seq_id            apex_collections.seq_id%type;',
'    v_estado            apex_collections.c005%type;',
'    v_ttal_sjto_impsto  number;',
'                       ',
'    BEGIN',
'     APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''IDNTFCCION_SJTO_IMPSTO''); ',
'     -- Read data from wwv_flow_files',
'        select blob_content ',
'          into v_blob_data',
'         from apex_application_temp_files  ',
'        where name =  :P62_ARCHVO;   ',
'',
'        v_blob_len := dbms_lob.getlength(v_blob_data);',
'        v_position := 1;',
'        v_nmro_lnea := 0;',
'',
'',
'         if apex_collection.collection_exists(''IDNTFCCION_SJTO_IMPSTO'') then',
'            ',
'            while ( v_position <= v_blob_len ) loop',
'                v_raw_chunk := dbms_lob.substr(v_blob_data,c_chunk_len,v_position);',
'                v_char :=  chr(hex_to_decimal(rawtohex(v_raw_chunk)));',
'                v_position := v_position + c_chunk_len;',
'',
'                v_line := v_line || v_char;',
'                v_line := REPLACE (v_line,  CHR(10), '''');',
'                v_idntfccion := REPLACE (v_line,  CHR(13), '''');',
'                ',
'                -- Si es Fin de Linea',
'                if v_char = CHR(13) then',
unistr('                    -- Se valida si el la identificaci\00F3n corresponde a un sujeto impuesto'),
'                    begin',
'                       select id_sjto_impsto into v_id_sjto_impsto from si_i_sujetos_impuesto where cdgo_clnte = :F_CDGO_CLNTE and idntfccion =  v_idntfccion;',
'',
unistr('                          --  Si existe el sujeto impuesto se consulta la direcci\00F3n, responsable y se calcula el estado'),
'                          if v_id_sjto_impsto is not null then',
'                               select ''SI'' indcdor_existe,',
'                                      a.drccion,',
'                                      a.nmbre_rspnsble,',
'                                      case when a.estdo_blqdo = ''S'' then ''Bloqueado''',
'                                           when sum (b.vlor_sldo_cptal + b.vlor_intres) <= 0  or sum (b.vlor_sldo_cptal + b.vlor_intres) is null then ''Sin Saldo''',
'                                           when a.estdo_blqdo = ''N'' then ''Valido''',
'                                      end as estdo',
'                                 into v_indcdor_existe,',
'                                      v_drccion,',
'                                      v_nmbre_rspnsble,',
'                                      v_estdo',
'                                 from v_si_i_sujetos_responsable a',
'                                 left join v_gf_g_cartera_x_vigencia  b on a.id_sjto_impsto =  b.id_sjto_impsto',
'                                  and (b.vgncia * 100 + b.prdo) between (:P60_VGNCIA_DSDE * 100 + :P60_PRDO_DSDE) and (:P60_VGNCIA_HSTA * 100 + :P60_PRDO_HSTA)',
'                                where a.cdgo_clnte = :F_CDGO_CLNTE',
'                                  and a.id_impsto = :P60_ID_IMPSTO',
'                                  and a.id_sjto_impsto =  v_id_sjto_impsto  -- 0003000000000901900008312',
'                                  and a.prncpal_s_n = ''S''',
'                             group by a.id_sjto_impsto,',
'                                      a.drccion,',
'                                      a.nmbre_rspnsble,',
'                                      a.estdo_blqdo;',
unistr('                           end if; -- Fin Validaci\00F3n Sujeto impuesto existe                   '),
'',
'                    exception ',
'                       when no_data_found then ',
'                           v_id_sjto_impsto := null;',
'                           v_indcdor_existe := ''NO'' ;  ',
'                           v_drccion        := '' -- '';',
'                           v_nmbre_rspnsble := '' -- '';',
'                           v_estdo          := ''No Valido'';',
'                    end;       ',
'',
'                    v_nmro_lnea := v_nmro_lnea + 1;',
'',
'                    APEX_COLLECTION.ADD_MEMBER( p_collection_name => ''IDNTFCCION_SJTO_IMPSTO'',',
'                                                p_n001            => v_id_sjto_impsto,',
'                                                p_n002            => v_nmro_lnea,',
'                                                p_C001            => v_idntfccion,',
'                                                p_C002            => v_indcdor_existe,',
'                                                p_C003            => v_drccion,',
'                                                p_C004            => v_nmbre_rspnsble,',
'                                                p_C005            => v_estdo);  ',
'                    v_line := NULL;',
'                 ',
'',
'                end if;',
'            end loop;',
unistr('            -- Se Recorre la colecci\00F3n para validar los registros duplicados'),
'            for c_clction in (select seq_id, n001, n002, C001, C002, C003, C004,  ',
'                                      case when (row_number() over(partition by c001 order by c001))>1 then ',
'                                          ''Duplicado''',
'                                          else ',
'                                              c005',
'                                      end C005,',
'                                      row_number() over(partition by c001 order by c001)C006',
'                                 from apex_collections ',
'                                where collection_name = ''IDNTFCCION_SJTO_IMPSTO'') loop',
unistr('                 -- Se actualiza la collecci\00F3n '),
'                 APEX_COLLECTION.UPDATE_MEMBER (p_collection_name => ''IDNTFCCION_SJTO_IMPSTO'',',
'                                                p_seq             => c_clction.seq_id,',
'                                                p_n001            => c_clction.n001,',
'                                                p_n002            => c_clction.n002,',
'                                                p_C001            => c_clction.c001,',
'                                                p_C002            => c_clction.c002,',
'                                                p_C003            => c_clction.c003,',
'                                                p_C004            => c_clction.c004,',
'                                                p_c005            => c_clction.c005);',
'             end loop;',
'         ',
'             v_ttal_sjto_impsto := APEX_COLLECTION.COLLECTION_MEMBER_COUNT( p_collection_name => ''IDNTFCCION_SJTO_IMPSTO''); ',
'             -- select count(c005) into v_ttal_sjto_impsto from apex_collections where collection_name = ''IDNTFCCION_SJTO_IMPSTO'' and c005 = ''Valido''; ',
'         ',
'             :P60_TTAL_SJTO_IMPSTO :=v_ttal_sjto_impsto;',
'         ',
'             if v_ttal_sjto_impsto > :P60_NMRO_MAX_DCMNTO_GNRDO then ',
unistr('                 apex_error.add_error ( p_message          => ''El Archivo supera el m\00E1ximo de Sujetos Impuestos permitidos por lote de facturaci\00F3n. <br> M\00E1ximos: ''|| :P60_NMRO_MAX_DCMNTO_GNRDO || '', Archivo: '' || v_ttal_sjto_impsto '),
'                                      , p_display_location => apex_error.c_inline_in_notification );  ',
'            ',
'             end if;',
'        end if;',
'    end;',
''))
,p_process_error_message=>'Error al procesar el archivo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(4444482689085268)
,p_process_when=>'P62_ARCHVO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'Se proceso el archivo exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4487883489161891)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Ejecutar Consulta'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    declare',
'        v_sql               clob;',
'',
'        v_id_sjto_impsto    si_i_sujetos_impuesto.id_sjto_impsto%type;',
'        v_drccion           si_c_sujetos.drccion%type;  ',
'        v_nmbre_rspnsble    v_si_i_sujetos_responsable.nmbre_rzon_scial%type;  ',
'        v_idntfccion        varchar2(30);',
'        v_indcdor_existe    varchar2(2);',
'        v_estdo             varchar2(30);',
'        v_nmro_lnea         number;',
'',
'        TYPE tipoCursor IS REF CURSOR;',
'        c_sjto_impsto tipoCursor;',
'',
'    begin',
'        v_sql    :=  pkg_cs_constructorsql.fnc_co_sql_dinamica(:P62_ID_SQL, ''S'', :F_CDGO_CLNTE );',
'',
'        APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''IDNTFCCION_SJTO_IMPSTO''); ',
'',
'        insert into gti_aux (col1, col2) values (''v_sql--> '', v_sql); commit;',
'',
'        if apex_collection.collection_exists(''IDNTFCCION_SJTO_IMPSTO'') then',
'',
'            open c_sjto_impsto for  v_sql;',
'',
'            loop ',
'                fetch c_sjto_impsto into v_idntfccion;',
'                exit when c_sjto_impsto%NOTFOUND;',
'',
'                insert into gti_aux (col1, col2) values (''v_idntfccion--> '', v_idntfccion); commit;',
'',
unistr('                -- Se valida si el la identificaci\00F3n corresponde a un sujeto impuesto'),
'                    begin ',
'                       select id_sjto_impsto into v_id_sjto_impsto from v_si_i_sujetos_impuesto where cdgo_clnte = :F_CDGO_CLNTE and idntfccion_sjto =  v_idntfccion;',
'',
unistr('                          --  Si existe el sujeto impuesto se consulta la direcci\00F3n, responsable y se calcula el estado'),
'                          if v_id_sjto_impsto is not null then',
'                               select ''SI'' indcdor_existe,',
'                                      a.drccion,',
'                                      c.nmbre_rzon_scial,',
'                                      case when a.estdo_blqdo_sjto = ''S'' then ''Bloqueado''',
'                                           when sum (b.vlor_sldo_cptal + b.vlor_intres) <= 0  or sum (b.vlor_sldo_cptal + b.vlor_intres) is null then ''Sin Saldo''',
'                                           when a.estdo_blqdo_sjto = ''N'' then ''Valido''',
'                                      end as estdo',
'                                 into v_indcdor_existe,',
'                                      v_drccion,',
'                                      v_nmbre_rspnsble,',
'                                      v_estdo',
'                                 from v_si_i_sujetos_impuesto a',
'                                 join v_si_i_sujetos_responsable c on a.id_sjto = c.id_sjto',
'                                 left join v_gf_g_cartera_x_vigencia  b on a.id_sjto_impsto =  b.id_sjto_impsto',
'                                  and (b.vgncia * 100 + b.prdo) between (:P60_VGNCIA_DSDE * 100 + :P60_PRDO_DSDE) and (:P60_VGNCIA_HSTA * 100 + :P60_PRDO_HSTA)',
'                                where a.cdgo_clnte = :F_CDGO_CLNTE',
'                                  and a.id_impsto = :P60_ID_IMPSTO',
'                                  and a.id_sjto_impsto =  v_id_sjto_impsto',
'                                  and c.prncpal_s_n = ''S''',
'                             group by a.id_sjto_impsto,',
'                                      a.drccion,',
'                                      c.nmbre_rzon_scial,',
'                                      a.estdo_blqdo_sjto;',
'                           end if;                  ',
'',
'                    exception ',
'                       when no_data_found then ',
'                           v_id_sjto_impsto := null;',
'                           v_indcdor_existe := ''NO'' ;  ',
'                           v_drccion        := '' -- '';',
'                           v_nmbre_rspnsble := '' -- '';',
'                           v_estdo          := ''No Valido'';',
'                    end; ',
unistr('                -- Se llena la colecci\00F3n'),
'                APEX_COLLECTION.ADD_MEMBER( p_collection_name => ''IDNTFCCION_SJTO_IMPSTO'',',
'                                                p_n001            => v_id_sjto_impsto,',
'                                                p_C001            => v_idntfccion,',
'                                                p_C002            => v_indcdor_existe,',
'                                                p_C003            => v_drccion,',
'                                                p_C004            => v_nmbre_rspnsble,',
'                                                p_C005            => v_estdo); ',
'            end loop;',
'',
'            v_nmro_lnea := 0;',
'            for c_sjto_impsto in (select n001 id_sjto_impsto,                                              ',
'                                         c001 idntfccion,  ',
'                                         c002 indcdor_existe, ',
'                                         c003 drccion,',
'                                         c004 nmbre_rspnsble,  ',
'                                         c005 estdo ',
'                            from apex_collections ',
'                           where collection_name = ''IDNTFCCION_SJTO_IMPSTO'') loop',
'                v_nmro_lnea := v_nmro_lnea + 1;',
'                insert into gn_g_temporal (n001,				            n002,				            C001,			                                C002,',
'                                           C003,				            C004,				            C005,		                                    id_ssion)',
'                                   values (c_sjto_impsto.id_sjto_impsto,	v_nmro_lnea,		            c_sjto_impsto.idntfccion,	                    c_sjto_impsto.indcdor_existe, ',
'                                           c_sjto_impsto.drccion, 		    c_sjto_impsto.nmbre_rspnsble,	c_sjto_impsto.estdo, 	                        :APP_SESSION);',
'',
'            end loop;',
'            :P62_TTAL_SJTO_IMPSTO := v_nmro_lnea;',
'            close c_sjto_impsto;',
'',
'            apex_json.open_object();',
'            apex_json.write(''msg'', ''Proceso terminado.'');',
'            apex_json.write(''err'', 0);   ',
'       end if;   ',
'        apex_json.close_object();  ',
'    exception',
'             when others then',
'                  apex_json.write(''err'',true);',
'                  apex_json.write(''msg'',apex_escape.html(sqlerrm));',
'                  apex_json.close_all();   ',
'    end;'))
,p_process_error_message=>'Error al Ejecutar la consulta'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(4444898682085268)
,p_process_when=>'P62_ID_SQL'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'Se ejecuto la consulta Exitosamente'
);
end;
/
