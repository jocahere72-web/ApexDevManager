prompt --application/pages/page_00055
begin
wwv_flow_api.create_page(
 p_id=>55
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Emisi\00F3n de Recibos Masivo - Ventanilla')
,p_step_title=>unistr('Emisi\00F3n de Recibos Masivo - Ventanilla')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function procesoEjecutarConsulta() {',
'  var $waitPopup;',
' ',
'    //Elimina los mensajes de la coleccion',
'  apex.message.clearErrors();',
'    ',
'  if ( $v(''P55_ID_SQL'').length !== 0 ) {',
'      ',
'    apex.server.process(',
'    "Ejecutar Consulta",',
'    {',
'     pageItems: "#P55_ID_IMPSTO,#P55_ID_IMSPTO_SBMPSTO,#P55_VGNCIA_DSDE,#P55_PRDO_DSDE,#P55_VGNCIA_HSTA,#P55_PRDO_HSTA,#P55_SLCCION_PBLCION,#P55_ARCHVO,#P55_ID_SQL,#P55_FCHA_VNCMNTO" ',
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
'              apex.region(''consulta'').refresh();',
'              //Actualizamos los indicadores',
'              apex.region("consolidado_total_registros").refresh();',
'              apex.region("consolidado_total_sujetos_validos").refresh();',
'              apex.region("consolidado_total_sujetos_no_validos").refresh();',
'              apex.region("consolidado_total_sujetos_bloqueados").refresh();',
'              apex.region("consolidado_registros_duplicados").refresh();',
'              apex.region("consolidado_total_sujetos_fuera_de_rango").refresh();',
'              ',
'              apex.region(''opciones'').refresh();',
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
'          pageItem: "P55_ID_SQL",',
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
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20220530213317'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(116369296868339101)
,p_plug_name=>'Consolidado Consultas'
,p_region_name=>'consulta'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(61472462368997131)
,p_plug_name=>'Consolidado Total Sujetos Fuera de Rango'
,p_region_name=>'consolidado_total_sujetos_fuera_de_rango'
,p_parent_plug_id=>wwv_flow_api.id(116369296868339101)
,p_region_css_classes=>'badgeListColor3'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:margin-top-md:margin-right-md'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
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
 p_id=>wwv_flow_api.id(62907639694620720)
,p_plug_name=>'Sujetos Fuera de Rango'
,p_region_name=>'sujetos_fuera_de_rango'
,p_parent_plug_id=>wwv_flow_api.id(116369296868339101)
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177331524321050607)
,p_plug_display_sequence=>110
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select n002, -- No. Linea',
unistr('       c001, -- Identificaci\00F3n'),
'       c002, -- Indicador Existe',
unistr('       c003, -- Direcci\00F3n'),
'       c004 -- Nombre Responsable',
'  from gn_g_temporal ',
' where id_ssion = :APP_SESSION',
'   and c005 = ''SNS'''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62907802873620722)
,p_name=>'N002'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'N002'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'No. Linea'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62907932444620723)
,p_name=>'C001'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C001'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62908016945620724)
,p_name=>'C002'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C002'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Indicador Existe'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62908146330620725)
,p_name=>'C003'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C003'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Direcci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62908299561620726)
,p_name=>'C004'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C004'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Responsable'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(62907790199620721)
,p_internal_uid=>62907790199620721
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(63040993294490486)
,p_interactive_grid_id=>wwv_flow_api.id(62907790199620721)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(63041034145490486)
,p_report_id=>wwv_flow_api.id(63040993294490486)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(63041535887490487)
,p_view_id=>wwv_flow_api.id(63041034145490486)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(62907802873620722)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(63042084264490489)
,p_view_id=>wwv_flow_api.id(63041034145490486)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(62907932444620723)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(63042537699490491)
,p_view_id=>wwv_flow_api.id(63041034145490486)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(62908016945620724)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(63043028432490492)
,p_view_id=>wwv_flow_api.id(63041034145490486)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(62908146330620725)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(63043530505490494)
,p_view_id=>wwv_flow_api.id(63041034145490486)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(62908299561620726)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(116369379322339102)
,p_plug_name=>'Consolidado Total Registros de la consulta'
,p_region_name=>'consolidado_total_registros'
,p_parent_plug_id=>wwv_flow_api.id(116369296868339101)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:margin-top-md:margin-left-md'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_grid_column_css_classes=>'badgeListColor1'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Total Registros'' label,',
'       count(*) value',
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
 p_id=>wwv_flow_api.id(116369557872339104)
,p_plug_name=>'Consolidado Total Sujetos Tributos Validos'
,p_region_name=>'consolidado_total_sujetos_validos'
,p_parent_plug_id=>wwv_flow_api.id(116369296868339101)
,p_region_css_classes=>'badgeListColor2'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:margin-top-md:margin-right-md'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
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
 p_id=>wwv_flow_api.id(116412575984454201)
,p_plug_name=>'Consolidado Total Sujetos Tributos NO Validos'
,p_region_name=>'consolidado_total_sujetos_no_validos'
,p_parent_plug_id=>wwv_flow_api.id(116369296868339101)
,p_region_css_classes=>'badgeListColor3'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:margin-left-md'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>50
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
 p_id=>wwv_flow_api.id(116412638132454202)
,p_plug_name=>'Consolidado Total Sujetos Tributos Bloqueados'
,p_region_name=>'consolidado_total_sujetos_bloqueados'
,p_parent_plug_id=>wwv_flow_api.id(116369296868339101)
,p_region_css_classes=>'badgeListColor4'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
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
 p_id=>wwv_flow_api.id(116412844033454204)
,p_plug_name=>'Consolidado Registros Duplicados'
,p_region_name=>'consolidado_registros_duplicados'
,p_parent_plug_id=>wwv_flow_api.id(116369296868339101)
,p_region_css_classes=>'badgeListColor7'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:margin-right-md'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Registros Duplicados'' label,',
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
 p_id=>wwv_flow_api.id(116412937093454205)
,p_plug_name=>'Sujetos Tributos NO Validos'
,p_region_name=>'datos_no_validos'
,p_parent_plug_id=>wwv_flow_api.id(116369296868339101)
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_plug_template=>wwv_flow_api.id(177331524321050607)
,p_plug_display_sequence=>80
,p_plug_display_point=>'BODY'
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
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(116413500613454211)
,p_name=>'N002'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'N002'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'No. Linea'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(116413628262454212)
,p_name=>'N001'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'N001'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Sujeto Impuesto '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(116413726379454213)
,p_name=>'C001'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C001'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(116413837035454214)
,p_name=>'C002'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C002'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Indicador Existe'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(116413909930454215)
,p_name=>'C003'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C003'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Direcci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(116414014616454216)
,p_name=>'C004'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C004'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Responsable'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(116413492547454210)
,p_internal_uid=>116413492547454210
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(116472155372591718)
,p_interactive_grid_id=>wwv_flow_api.id(116413492547454210)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(116472215722591718)
,p_report_id=>wwv_flow_api.id(116472155372591718)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116472701312591725)
,p_view_id=>wwv_flow_api.id(116472215722591718)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(116413500613454211)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>85
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116473274769591728)
,p_view_id=>wwv_flow_api.id(116472215722591718)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(116413628262454212)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>136
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116473788874591731)
,p_view_id=>wwv_flow_api.id(116472215722591718)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(116413726379454213)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>214
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116474290357591732)
,p_view_id=>wwv_flow_api.id(116472215722591718)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(116413837035454214)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>111
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116474707329591734)
,p_view_id=>wwv_flow_api.id(116472215722591718)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(116413909930454215)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>103
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116475266454591735)
,p_view_id=>wwv_flow_api.id(116472215722591718)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(116414014616454216)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>300
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(116413049014454206)
,p_plug_name=>'Sujetos Tributos Bloqueados'
,p_region_name=>'datos_bloqueado'
,p_parent_plug_id=>wwv_flow_api.id(116369296868339101)
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_plug_template=>wwv_flow_api.id(177331524321050607)
,p_plug_display_sequence=>90
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select n002, -- No. Linea',
unistr('       c001, -- Identificaci\00F3n'),
'       c002, -- Indicador Existe',
unistr('       c003, -- Direcci\00F3n'),
'       c004 -- Nombre Responsable',
'  from gn_g_temporal ',
' where id_ssion = :APP_SESSION',
'   and c005 = ''BLQ'''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(116414212693454218)
,p_name=>'N002'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'N002'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'No. Linea'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(116414366907454219)
,p_name=>'C001'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C001'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(116414429994454220)
,p_name=>'C002'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C002'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Indicador Existe'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(116414522326454221)
,p_name=>'C003'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C003'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Direcci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(116414655313454222)
,p_name=>'C004'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C004'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Responsable'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(116414191788454217)
,p_internal_uid=>116414191788454217
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(116476372665595253)
,p_interactive_grid_id=>wwv_flow_api.id(116414191788454217)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(116476436049595253)
,p_report_id=>wwv_flow_api.id(116476372665595253)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116476985927595254)
,p_view_id=>wwv_flow_api.id(116476436049595253)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(116414212693454218)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>93
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116477457829595257)
,p_view_id=>wwv_flow_api.id(116476436049595253)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(116414366907454219)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116477996326595259)
,p_view_id=>wwv_flow_api.id(116476436049595253)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(116414429994454220)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>137
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116478456585595260)
,p_view_id=>wwv_flow_api.id(116476436049595253)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(116414522326454221)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>133
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116478923140595261)
,p_view_id=>wwv_flow_api.id(116476436049595253)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(116414655313454222)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>300
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(116413381817454209)
,p_plug_name=>'Registros Duplicados'
,p_region_name=>'datos_duplicados'
,p_parent_plug_id=>wwv_flow_api.id(116369296868339101)
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_plug_template=>wwv_flow_api.id(177331524321050607)
,p_plug_display_sequence=>100
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select n002, -- No. Linea',
unistr('       c001, -- Identificaci\00F3n'),
'       c002, -- Indicador Existe',
unistr('       c003, -- Direcci\00F3n'),
'       c004 -- Nombre Responsable',
'  from gn_g_temporal ',
' where id_ssion = :APP_SESSION',
'   and c005 = ''DPC'''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(116415474320454230)
,p_name=>'N002'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'N002'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'No. Linea'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(116415518453454231)
,p_name=>'C001'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C001'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(116415637764454232)
,p_name=>'C002'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C002'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Indicador Existe'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(116415768525454233)
,p_name=>'C003'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C003'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Direcci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(116415889910454234)
,p_name=>'C004'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C004'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Responsable'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(116415307458454229)
,p_internal_uid=>116415307458454229
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(116490397847599332)
,p_interactive_grid_id=>wwv_flow_api.id(116415307458454229)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(116490466828599332)
,p_report_id=>wwv_flow_api.id(116490397847599332)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116490942670599333)
,p_view_id=>wwv_flow_api.id(116490466828599332)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(116415474320454230)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>96
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116491436816599334)
,p_view_id=>wwv_flow_api.id(116490466828599332)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(116415518453454231)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>191
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116491984962599335)
,p_view_id=>wwv_flow_api.id(116490466828599332)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(116415637764454232)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116492431069599337)
,p_view_id=>wwv_flow_api.id(116490466828599332)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(116415768525454233)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>121
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116492986442599338)
,p_view_id=>wwv_flow_api.id(116490466828599332)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(116415889910454234)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>300
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(117261234210605602)
,p_plug_name=>'Datos Resultado'
,p_region_name=>'consulta'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody:margin-left-md'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select n002, -- No. Linea',
unistr('        c001, -- Identificaci\00F3n'),
'        c002, -- Indicador Existe',
unistr('        c003, -- Direcci\00F3n'),
'        c004, -- Nombre Responsable',
'        decode(c005, ''SNS'', ''Con deuda Fuera de Rango'', ''NVD'', ''No Valido'', ''DPC'', ''Duplicado'', ''BLQ'', ''Bloqueado'',''VLD'',''Valido'') c005-- Estado',
'   from gn_g_temporal a',
'  where id_ssion = :APP_SESSION',
'  order by 1;'))
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
 p_id=>wwv_flow_api.id(117261398131605603)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>117261398131605603
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117261497886605604)
,p_db_column_name=>'N002'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00B0. L\00EDnea')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117261554280605605)
,p_db_column_name=>'C001'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117261678786605606)
,p_db_column_name=>'C002'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Existe ?'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117261745334605607)
,p_db_column_name=>'C003'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117261887449605608)
,p_db_column_name=>'C004'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Responsable'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(63574668444963602)
,p_db_column_name=>'C005'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(117296867157668128)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1172969'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'N002:C001:C002:C003:C004:C005'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(63052056497693295)
,p_report_id=>wwv_flow_api.id(117296867157668128)
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'C005'
,p_operator=>'='
,p_expr=>'No Valido'
,p_condition_sql=>' (case when ("C005" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''No Valido''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#FF7755'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(63052426361693296)
,p_report_id=>wwv_flow_api.id(117296867157668128)
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'C005'
,p_operator=>'='
,p_expr=>'Duplicado'
,p_condition_sql=>' (case when ("C005" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Duplicado''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#FFFF99'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(182977562726297600)
,p_plug_name=>unistr('Lote de Facturaci\00F3n Masiva')
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
 p_id=>wwv_flow_api.id(184719349214426375)
,p_plug_name=>'Opciones'
,p_region_name=>'opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(186114720229261074)
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
'<i>Funcionalidad que permite:<br><br>',
unistr('<b><i> -</i></b> Crear lotes de Facturaci\00F3n Masiva, para un grupo de sujetos impuestos determinados.</br><br>'),
unistr('<b><i> -</i></b> Para seleccionar la poblaci\00F3n de sujetos impuestos se tienen dos opciones:</br><br>'),
'    <b><i> a. Archivo Plano:</i></b> Debe contener solo las identificaciones de los sujetos impuestos y debe ser de tipo .txt.</br><br>',
unistr('    <b><i> b. Construcci\00F3n de una Consulta:</i></b> Selecci\00F3n o construcci\00F3n de una condici\00F3n.</br><br>'),
unistr('<i>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>'),
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(185325838333930976)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(184719349214426375)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(185561563462323963)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(184719349214426375)
,p_button_name=>'BTN_CONSULTAR_DESCUENTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Ver Descuentos'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(184719450691426376)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(184719349214426375)
,p_button_name=>'BTN_PROCESAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' to_number(:P55_TTAL_SJTO_IMPSTO) > 0 /*and ',
' to_number(:P55_TTAL_SJTO_IMPSTO) <= to_number(:P55_NMRO_MAX_DCMNTO_GNRDO)*/'))
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(186115938569261086)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_api.id(182977562726297600)
,p_button_name=>'BTN_CONSTRUCTOR_SQL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Constructor de Consultas'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-code'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(184009056277536762)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_api.id(182977562726297600)
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
 p_id=>wwv_flow_api.id(185328085776930999)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_api.id(182977562726297600)
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
 p_id=>wwv_flow_api.id(184009234102536763)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(182977562726297600)
,p_button_name=>'BTN_CANCELAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(185326007302930978)
,p_branch_name=>unistr('Ir P\00E1gina 56')
,p_branch_action=>'f?p=&APP_ID.:56:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(184719450691426376)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(185565064617323998)
,p_branch_name=>unistr('Ir P\00E1gina 58 Descuentos')
,p_branch_action=>'f?p=&APP_ID.:58:&SESSION.::&DEBUG.:RP,58:P58_ID_IMPSTO,P58_ID_IMSPTO_SBMPSTO,P58_VGNCIA_DSDE,P58_PRDO_DSDE,P58_VGNCIA_HSTA,P58_PRDO_HSTA,P58_FCHA_VNCMNTO:&P55_ID_IMPSTO.,&P55_ID_IMSPTO_SBMPSTO.,&P55_VGNCIA_DSDE.,&P55_PRDO_DSDE.,&P55_VGNCIA_HSTA.,&P55_PRDO_HSTA.,&P55_FCHA_VNCMNTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(185561563462323963)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(116043880836592801)
,p_branch_name=>unistr('Ir a P\00E1gina Consulta SQL')
,p_branch_action=>'f?p=50000:907:&SESSION.::&DEBUG.:RP,907:P907_PAGE_ID,P907_APP_ID,P907_COD_PROCESO,P907_ITEM_ID:&APP_PAGE_ID.,&APP_ID.,FCM,P55_ID_SQL&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(186115938569261086)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(186116187996261089)
,p_branch_name=>'Ir al Constructor de SQL'
,p_branch_action=>'f?p=50000:902:&SESSION.::&DEBUG.:RP:P902_PAGE_ID,P902_APP_ID,P902_COD_PROCESO,P902_ITEM_ID:&APP_PAGE_ID.,&APP_ID.,FCM,P55_ID_SQL&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(186115938569261086)
,p_branch_sequence=>40
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(116548034954430606)
,p_branch_name=>'Ir a Pgina 56 Regresar'
,p_branch_action=>'f?p=&APP_ID.:56:&SESSION.::&DEBUG.:RP,56::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(185325838333930976)
,p_branch_sequence=>50
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30752517513604103)
,p_name=>'P55_NMBRE_CNSLTA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(182977562726297600)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Consulta Seleccionada'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_cnslta',
'  from cs_g_consultas_maestro',
' where id_cnslta_mstro = :P55_ID_SQL'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(175615467909849604)
,p_name=>'P55_NMRO_MAX_DCMNTO_GNRDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(184719349214426375)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'v_vlor        number;',
'begin',
'',
'v_vlor := pkg_gn_generalidades.fnc_cl_defniciones_cliente (p_cdgo_clnte 			    => :F_CDGO_CLNTE,',
'										                   p_cdgo_dfncion_clnte_ctgria	=> ''GFN'',',
'										                   p_cdgo_dfncion_clnte			=> ''NDF'');',
'',
'return v_vlor;',
'',
'end;'))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>unistr('N\00B0. M\00E1x Documetos por Lotes')
,p_format_mask=>'999G999G999G999G999G999G990'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(182977880016297603)
,p_name=>'P55_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(182977562726297600)
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
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Impuesto al que pertenece el lote de facturaci\00F3n')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(182977964358297604)
,p_name=>'P55_ID_IMSPTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(182977562726297600)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_impsto_sbmpsto d, ',
'        id_impsto_sbmpsto r',
'   from df_i_impuestoS_subimpuesto ',
'  where cdgo_clnte = :F_CDGO_CLNTE ',
'    and id_impsto = :P55_ID_IMPSTO'))
,p_lov_cascade_parent_items=>'P55_ID_IMPSTO'
,p_ajax_items_to_submit=>'P55_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Sub-Impuesto al que pertenece el lote de facturaci\00F3n')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(182978118964297605)
,p_name=>'P55_VGNCIA_DSDE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(182977562726297600)
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
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Vigencia Desde: Esta vigencia es tenida en cuenta para seleccionar los sujetos impuestos determinados para emisi\00F3n de factura a partir de la vigencia seleccionada. ')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(182978206020297606)
,p_name=>'P55_PRDO_DSDE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(182977562726297600)
,p_prompt=>'Periodo Desde'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select prdo d, ',
'         prdo v',
'   from df_i_periodos ',
'  where cdgo_clnte = :F_CDGO_CLNTE ',
'    and id_impsto =:P55_ID_IMPSTO',
'    and id_impsto_sbmpsto = :P55_ID_IMSPTO_SBMPSTO',
'    and vgncia = :P55_VGNCIA_DSDE',
'order by prdo    '))
,p_lov_cascade_parent_items=>'P55_VGNCIA_DSDE'
,p_ajax_items_to_submit=>'P55_VGNCIA_DSDE,P55_ID_IMSPTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Periodo Desde: Este Periodo es tenido en cuenta para seleccionar los sujetos impuestos determinados para emisi\00F3n de factura  a partir del Periodo seleccionado. ')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(182978256093297607)
,p_name=>'P55_VGNCIA_HSTA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(182977562726297600)
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
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Vigencia Hasta: Esta vigencia es tenida en cuenta para seleccionar los sujetos impuestos determinados para emisi\00F3n de factura hasta la vigencia seleccionada. ')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(182978361157297608)
,p_name=>'P55_PRDO_HSTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(182977562726297600)
,p_prompt=>'Periodo Hasta'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select prdo d, ',
'         prdo v',
'   from df_i_periodos ',
'  where cdgo_clnte = :F_CDGO_CLNTE ',
'    and id_impsto =:P55_ID_IMPSTO',
'    and id_impsto_sbmpsto = :P55_ID_IMSPTO_SBMPSTO',
'    and vgncia = :P55_VGNCIA_HSTA',
'order by prdo    '))
,p_lov_cascade_parent_items=>'P55_VGNCIA_HSTA'
,p_ajax_items_to_submit=>'P55_VGNCIA_HSTA,P55_ID_IMSPTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Periodo Hasta: Este Periodo es tenido en cuenta para seleccionar los sujetos impuestos determinados para emisi\00F3n de factura hasta el Periodo seleccionado. ')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(182978529621297609)
,p_name=>'P55_FCHA_VNCMNTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(182977562726297600)
,p_prompt=>'Fecha Vencimiento'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeydown="return false" '
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_02=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(184008906088536760)
,p_name=>'P55_SLCCION_PBLCION'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(182977562726297600)
,p_item_default=>'ACV'
,p_prompt=>unistr('Selecci\00F3n Pablaci\00F3n por:')
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Archivo;ACV,Consulta;SQL'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(184009489671536766)
,p_name=>'P55_ARCHVO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(182977562726297600)
,p_prompt=>'Archivo'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Se debe seleccionar el Archivo que contiene el listado de los sujetos impuestos que se pretenden determinar '
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
,p_attribute_11=>'.txt'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(184009863758536770)
,p_name=>'P55_SQL'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(182977562726297600)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(184720042936426382)
,p_name=>'P55_RSPSTA'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(182977562726297600)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(185324809866930966)
,p_name=>'P55_OBSRVCION'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(182977562726297600)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>110
,p_cMaxlength=>1000
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(185324935706930967)
,p_name=>'P55_ID_DCMNTO_LTE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(182977562726297600)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186114319960261070)
,p_name=>'P55_TTAL_SJTO_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(184719349214426375)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(c002) value',
'  from gn_g_temporal ',
' where id_ssion = :APP_SESSION',
'   and c005 = ''VLD'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186116549331261093)
,p_name=>'P55_ID_SQL'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(182977562726297600)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(184009314916536764)
,p_validation_name=>'Validar que la vigencia Hasta no sea menor a la Vigencia Desde'
,p_validation_sequence=>10
,p_validation=>':P55_VGNCIA_HSTA >= :P55_VGNCIA_DSDE'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'La vigencia hasta no puede ser menor a la vigencia desde'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(184009056277536762)
,p_associated_item=>wwv_flow_api.id(182978256093297607)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(184009356027536765)
,p_validation_name=>unistr('Validar que la fecha de vencimiento este dentro de un rango de fechas en la parametrizaci\00F3n de tasas mora')
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'v_fcha_vlda varchar2(1);',
'',
'begin ',
'',
'    v_fcha_vlda := pkg_gn_generalidades.fnc_vl_fcha_vncmnto_tsas_mra (:F_CDGO_CLNTE, :P55_ID_IMPSTO, to_date(:P55_FCHA_VNCMNTO,''DD/MM/YYYY''));',
'   -- v_fcha_vlda := ''S'';',
'    if v_fcha_vlda = ''S'' then ',
'        return true;',
'    else ',
'        return false;',
'    end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('La fecha de Vencimiento seleccionada no es valida. Por favor revise las par\00E1metrizaci\00F3n de Tasas Mora. ')
,p_validation_condition=>'BTN_LEER_ARCHIVO,BTN_EJECUTAR_CONSULTA'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(182978529621297609)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(184722112295426402)
,p_validation_name=>'Validar que exista un archivo seleccionado'
,p_validation_sequence=>30
,p_validation=>'P55_ARCHVO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por Favor Seleccionar un archivo.'
,p_validation_condition=>'P55_SLCCION_PBLCION'
,p_validation_condition2=>'ACV'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(184009056277536762)
,p_associated_item=>wwv_flow_api.id(184009489671536766)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(116417304595454249)
,p_validation_name=>'Valida Fecha de Vencimiento al Ejecutar'
,p_validation_sequence=>40
,p_validation=>'P55_FCHA_VNCMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor digite #LABEL#'
,p_when_button_pressed=>wwv_flow_api.id(185328085776930999)
,p_associated_item=>wwv_flow_api.id(182978529621297609)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(116417493196454250)
,p_validation_name=>'Valida Tributo al Ejecutar'
,p_validation_sequence=>50
,p_validation=>'P55_ID_IMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione #LABEL#'
,p_when_button_pressed=>wwv_flow_api.id(185328085776930999)
,p_associated_item=>wwv_flow_api.id(182977880016297603)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(116547582046430601)
,p_validation_name=>'Valida Sub-Tributo al Ejecutar'
,p_validation_sequence=>60
,p_validation=>'P55_ID_IMSPTO_SBMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione #LABEL#'
,p_when_button_pressed=>wwv_flow_api.id(185328085776930999)
,p_associated_item=>wwv_flow_api.id(182977964358297604)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(116547625650430602)
,p_validation_name=>'Valida Vigencia al Ejecutar'
,p_validation_sequence=>70
,p_validation=>'P55_VGNCIA_DSDE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione #LABEL#'
,p_when_button_pressed=>wwv_flow_api.id(185328085776930999)
,p_associated_item=>wwv_flow_api.id(182978118964297605)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(116547761699430603)
,p_validation_name=>'Valida Periodo al Ejecutar'
,p_validation_sequence=>80
,p_validation=>'P55_PRDO_DSDE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione #LABEL#'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(185328085776930999)
,p_associated_item=>wwv_flow_api.id(182978206020297606)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(116547821094430604)
,p_validation_name=>'Validar Vigencia al Ejecutar'
,p_validation_sequence=>90
,p_validation=>'P55_VGNCIA_HSTA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione #LABEL#'
,p_when_button_pressed=>wwv_flow_api.id(185328085776930999)
,p_associated_item=>wwv_flow_api.id(182978256093297607)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(116547965477430605)
,p_validation_name=>'Validar Periodo al Ejecutar'
,p_validation_sequence=>100
,p_validation=>'P55_PRDO_HSTA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione #LABEL#'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(185328085776930999)
,p_associated_item=>wwv_flow_api.id(182978361157297608)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(184009606409536767)
,p_name=>'Al cambiar. Si es Archivo se muestra el item para seleccionar un archivo'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P55_SLCCION_PBLCION'
,p_condition_element=>'P55_SLCCION_PBLCION'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'ACV'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184009664690536768)
,p_event_id=>wwv_flow_api.id(184009606409536767)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P55_ARCHVO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184009773822536769)
,p_event_id=>wwv_flow_api.id(184009606409536767)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P55_ARCHVO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184719579527426377)
,p_event_id=>wwv_flow_api.id(184009606409536767)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(184009056277536762)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184010000528536771)
,p_event_id=>wwv_flow_api.id(184009606409536767)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(186115938569261086)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184719694816426378)
,p_event_id=>wwv_flow_api.id(184009606409536767)
,p_event_result=>'FALSE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(184009056277536762)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30752446960604102)
,p_event_id=>wwv_flow_api.id(184009606409536767)
,p_event_result=>'FALSE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(186115938569261086)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30752649295604104)
,p_event_id=>wwv_flow_api.id(184009606409536767)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P55_NMBRE_CNSLTA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30752733197604105)
,p_event_id=>wwv_flow_api.id(184009606409536767)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P55_NMBRE_CNSLTA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30752863300604106)
,p_event_id=>wwv_flow_api.id(184009606409536767)
,p_event_result=>'FALSE'
,p_action_sequence=>70
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P55_NMBRE_CNSLTA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30752358475604101)
,p_event_id=>wwv_flow_api.id(184009606409536767)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P55_SQL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(186116106041261088)
,p_event_id=>wwv_flow_api.id(184009606409536767)
,p_event_result=>'FALSE'
,p_action_sequence=>80
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(186115938569261086)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(185561304785323960)
,p_event_id=>wwv_flow_api.id(184009606409536767)
,p_event_result=>'FALSE'
,p_action_sequence=>90
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(185328085776930999)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(186115989267261087)
,p_event_id=>wwv_flow_api.id(184009606409536767)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(186115938569261086)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(185329102574931009)
,p_event_id=>wwv_flow_api.id(184009606409536767)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(185328085776930999)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(184011751808536789)
,p_name=>unistr('Al cambiar el archivo se refresca la regi\00F3n de datos del archivo')
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P55_ARCHVO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184011973170536791)
,p_event_id=>wwv_flow_api.id(184011751808536789)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''IDNTFCCION_SJTO_IMPSTO''); ',
'APEX_UTIL.SET_SESSION_STATE(''P55_ARCHVO'',:P55_ARCHVO);'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(116268837207754401)
,p_name=>'Ejecutar Ajax procesoEjecutarConsulta'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(185328085776930999)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(116268964469754402)
,p_event_id=>wwv_flow_api.id(116268837207754401)
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
 p_id=>wwv_flow_api.id(116269049574754403)
,p_event_id=>wwv_flow_api.id(116268837207754401)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'procesoEjecutarConsulta();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(115943248539958214)
,p_name=>'Consultar y setar el primer subimpuesto encontrado'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P55_ID_IMPSTO'
,p_condition_element=>'P55_ID_IMPSTO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(115943373379958215)
,p_event_id=>wwv_flow_api.id(115943248539958214)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P55_ID_IMSPTO_SBMPSTO'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_impsto_sbmpsto            number;',
'    ',
'begin',
'',
'select id_impsto_sbmpsto into v_id_impsto_sbmpsto from df_i_impuestos_subimpuesto where id_impsto = :P55_ID_IMPSTO and rownum = 1;',
'return v_id_impsto_sbmpsto;',
'end;'))
,p_attribute_07=>'P55_ID_IMPSTO,P55_ID_IMSPTO_SBMPSTO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(116415963530454235)
,p_name=>'Al hacer clic Abrir modal de datos no validos'
,p_event_sequence=>100
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(116412575984454201)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(116416033865454236)
,p_event_id=>wwv_flow_api.id(116415963530454235)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#datos_no_validos").dialog("open");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(116416250360454238)
,p_name=>'Al hacer clic Abrir modal de datos bloqueados'
,p_event_sequence=>110
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(116412638132454202)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(116416493083454240)
,p_event_id=>wwv_flow_api.id(116416250360454238)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#datos_bloqueado").dialog("open");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(116416844929454244)
,p_name=>'Al hacer clic abrir modal registros duplicados'
,p_event_sequence=>130
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(116412844033454204)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(116416972793454245)
,p_event_id=>wwv_flow_api.id(116416844929454244)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#datos_duplicados").dialog("open");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(62908335649620727)
,p_name=>'Al hacer clic abrir modal sujetos_fuera_de_rango'
,p_event_sequence=>140
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(61472462368997131)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(62908441352620728)
,p_event_id=>wwv_flow_api.id(62908335649620727)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#sujetos_fuera_de_rango").dialog("open");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(117354311541950501)
,p_name=>'confrimar registro de lote'
,p_event_sequence=>150
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(184719450691426376)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(117354455672950502)
,p_event_id=>wwv_flow_api.id(117354311541950501)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.confirm("\00BFEst\00E1 seguro que desea registrar el lote?", function(ok){'),
'    if (ok) {',
'        apex.submit({request:"BTN_PROCESAR"});',
'    }',
'});',
'                     '))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(184010149665536773)
,p_process_sequence=>20
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
'    v_drccion           v_si_i_sujetos_impuesto.drccion%type;  ',
'    v_nmbre_rspnsble    v_si_i_sujetos_responsable.nmbre_rzon_scial%type;  ',
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
'        where name =  :P55_ARCHVO;   ',
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
'                       select id_sjto_impsto into v_id_sjto_impsto from v_si_i_sujetos_impuesto where cdgo_clnte = :F_CDGO_CLNTE and idntfccion_sjto =  v_idntfccion and id_impsto = :P55_ID_IMPSTO;',
'',
unistr('                          --  Si existe el sujeto impuesto se consulta la direcci\00F3n, responsable y se calcula el estado'),
'                          if v_id_sjto_impsto is not null then',
'                                  select ''SI'' indcdor_existe,',
'                                          a.drccion,',
'                                          c.nmbre_rzon_scial,',
'                                          case when a.estdo_blqdo_sjto = ''S'' then ''BLQ'' ',
'                                               when sum (b.vlor_sldo_cptal + b.vlor_intres) <= 0  or sum (b.vlor_sldo_cptal + b.vlor_intres) is null then ''SNS''                                               ',
'                                               when a.estdo_blqdo_sjto = ''N'' then ''VLD''',
'                                          end as estdo',
'                                     into v_indcdor_existe,',
'                                          v_drccion,',
'                                          v_nmbre_rspnsble,',
'                                          v_estdo',
'                                     from v_si_i_sujetos_impuesto a',
'                                     join v_si_i_sujetos_responsable         c on a.id_sjto_impsto  = c.id_sjto_impsto',
'                                     left join v_gf_g_cartera_x_vigencia     b on a.id_sjto_impsto  =  b.id_sjto_impsto',
'                                      and (b.vgncia * 100 + b.prdo) between (:P55_VGNCIA_DSDE * 100 + :P55_PRDO_DSDE) and (:P55_VGNCIA_HSTA * 100 + :P55_PRDO_HSTA)',
'                                    where a.cdgo_clnte = :F_CDGO_CLNTE',
'                                      and a.id_impsto = :P55_ID_IMPSTO',
'                                      and a.id_sjto_impsto =  v_id_sjto_impsto  -- 0003000000000901900008312',
'                                      and c.prncpal_s_n = ''S''',
'                                 group by a.id_sjto_impsto,',
'                                          a.drccion,',
'                                          c.nmbre_rzon_scial,',
'                                          a.estdo_blqdo_sjto;',
unistr('                           end if; -- Fin Validaci\00F3n Sujeto impuesto existe                  '),
'',
'                    exception ',
'                       when no_data_found then ',
'                           v_id_sjto_impsto := null;',
'                           v_indcdor_existe := ''NO'' ;  ',
'                           v_drccion        := '' -- '';',
'                           v_nmbre_rspnsble := '' -- '';',
'                           v_estdo          := ''NVD'';',
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
'            for c_clction in (select seq_id, n001, n002, C001, C002, C003, C004,n003,  ',
'                                      case when (row_number() over(partition by c001 order by c001))>1 then ',
'                                          ''DPC''',
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
'                                                p_n003            => c_clction.n003,',
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
'             :P55_TTAL_SJTO_IMPSTO :=v_ttal_sjto_impsto;',
'         ',
'             /*if v_ttal_sjto_impsto > :P55_NMRO_MAX_DCMNTO_GNRDO then ',
unistr('                 apex_error.add_error ( p_message          => ''El Archivo supera el m\00E1ximo de Sujetos Impuestos permitidos por lote de facturaci\00F3n. <br> M\00E1ximos: ''|| :P55_NMRO_MAX_DCMNTO_GNRDO || '', Archivo: '' || v_ttal_sjto_impsto '),
'                                      , p_display_location => apex_error.c_inline_in_notification );  ',
'            ',
'             else */',
'                 delete from gn_g_temporal where id_ssion =  :APP_SESSION; commit;',
'                 for c_sjetos in (select n001    id_sjto_impsto,',
'                                         n002    nmro_lnea,',
'                                         C001    idntfccion,',
'                                         C002    indcdor_existe,',
'                                         C003    drccion,',
'                                         C004    nmbre_rspnsble,',
'                                         C005    estdo,',
'                                         n003    sldo',
'                                    from apex_collections ',
'                                   where collection_name = ''IDNTFCCION_SJTO_IMPSTO'') loop',
'                    insert into gn_g_temporal (n001,				        n002,				        C001,			        C002,',
'                                               C003,				        C004,				        C005,		            n003, ',
'                                               id_ssion)',
'                                       values (c_sjetos.id_sjto_impsto,	    c_sjetos.nmro_lnea,		    c_sjetos.idntfccion,	c_sjetos.indcdor_existe, ',
'                                               c_sjetos.drccion, 		    c_sjetos.nmbre_rspnsble,	c_sjetos.estdo, 		c_sjetos.sldo, ',
'                                               :APP_SESSION);',
'                 end loop;',
'             --end if;',
'        end if;',
'    end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(184009056277536762)
,p_process_when=>'P55_ARCHVO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(185564964687323997)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('\00CDtems en sesi\00F3n')
,p_process_sql_clob=>'APEX_UTIL.SET_SESSION_STATE(''P55_PRDO_DSDE'',:P55_PRDO_DSDE);'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(184719968502426381)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Documentos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_msj               varchar2(4000);',
'    v_id_dcmnto_lte     number;',
'    v_error             varchar2(1000);',
'begin',
'',
'    BEGIN',
'        DBMS_SCHEDULER.set_attribute( name => ''"GENESYS"."IT_GI_PRC_DOCUMENTOS_MASIVOS"'', attribute => ''job_action'', value => ''PKG_RE_DOCUMENTOS.PRC_RG_LOTE_DOCUMENTOS'');',
'        DBMS_SCHEDULER.set_attribute( name => ''"GENESYS"."IT_GI_PRC_DOCUMENTOS_MASIVOS"'', attribute => ''number_of_arguments'', value => ''18'');',
'',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS'', argument_position => 1, argument_value => :F_CDGO_CLNTE);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS'', argument_position => 2, argument_value => :P55_ID_IMPSTO);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS'', argument_position => 3, argument_value => :P55_ID_IMSPTO_SBMPSTO);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS'', argument_position => 4, argument_value => :P55_VGNCIA_DSDE);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS'', argument_position => 5, argument_value => :P55_PRDO_DSDE);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS'', argument_position => 6, argument_value => :P55_VGNCIA_HSTA);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS'', argument_position => 7, argument_value => :P55_PRDO_HSTA);',
'        SYS.DBMS_SCHEDULER.SET_JOB_ANYDATA_VALUE(job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS'', argument_position => 8, argument_value => sys.anydata.convertDate(to_date(:P55_FCHA_VNCMNTO,''DD/MM/YYYY'')));',
'        --DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS'', argument_position => 8, argument_value => to_date(:P55_FCHA_VNCMNTO,''DD/MM/YYYY''));--''29-OCT-21'');',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS'', argument_position => 9, argument_value => :P55_SLCCION_PBLCION);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS'', argument_position => 10, argument_value => null);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS'', argument_position => 11, argument_value => ''DOC'');',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS'', argument_position => 12, argument_value => ''MSV'');',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS'', argument_position => 13, argument_value => :P55_OBSRVCION);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS'', argument_position => 14, argument_value => :F_ID_USRIO);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS'', argument_position => 15, argument_value => ''PRVDO'');',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS'', argument_position => 16, argument_value => :APP_SESSION);		',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS'', argument_position => 17, argument_value => v_msj);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS'', argument_position => 18, argument_value => v_id_dcmnto_lte);                ',
'',
'    END; ',
'    ',
'    BEGIN',
'        DBMS_SCHEDULER.ENABLE(''"GENESYS"."IT_GI_PRC_DOCUMENTOS_MASIVOS"'');',
'    END; ',
'    ',
'    exception',
'        when others then',
unistr('            raise_application_error(-20001, ''Error durante la ejecuci\00F3n del JOB: ''||sqlerrm);'),
'end;                               ',
'',
'                           ',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(184719450691426376)
,p_process_success_message=>'&P55_RSPSTA.'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(116269210602754405)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'BORRAR COLECCION'
,p_process_sql_clob=>'APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''IDNTFCCION_SJTO_IMPSTO''); '
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(186115938569261086)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(116417156264454247)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Borrar estado de sesion cuando presione cancelar'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(184009234102536763)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(116417209818454248)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Limpia la tabla temporal'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'     delete from gn_g_temporal ',
'     where id_ssion = :APP_SESSION;',
'exception',
'    when others then',
'        raise_application_error(-20001,''Problemas al eliminar registros de la tabla temporal'');',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_REGRESAR,BTN_CANCELAR'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(116269152496754404)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'BORRAR_COLECCION'
,p_process_sql_clob=>'APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''IDNTFCCION_SJTO_IMPSTO'');'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BORRAR_COLECCION'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(185328234600931000)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Ejecutar Consulta'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_sql    clob;',
'',
'    v_id_sjto_impsto    si_i_sujetos_impuesto.id_sjto_impsto%type;',
'    v_drccion           si_c_sujetos.drccion%type;  ',
'    v_nmbre_rspnsble    v_si_i_sujetos_responsable.nmbre_rzon_scial%type;  ',
'    v_idntfccion        varchar2(30);',
'    v_indcdor_existe    varchar2(2);',
'    v_estdo             varchar2(30);',
'    v_nmro_lnea         number;   ',
'   ',
'    ',
'    TYPE tipoCursor IS REF CURSOR;',
'    c_sjto_impsto tipoCursor;',
'    ',
'begin',
'    v_sql    :=  pkg_cs_constructorsql.fnc_co_sql_dinamica(:P55_ID_SQL, ''S'', :F_CDGO_CLNTE );',
'    ',
'    APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''IDNTFCCION_SJTO_IMPSTO''); ',
'',
'    insert into gti_aux (col1, col2) values (''v_sql--> '', v_sql); commit;',
'',
'    if apex_collection.collection_exists(''IDNTFCCION_SJTO_IMPSTO'') then',
'        open c_sjto_impsto for  v_sql;',
'        loop ',
'            fetch c_sjto_impsto into v_idntfccion;',
'            exit when c_sjto_impsto%NOTFOUND;',
'            ',
unistr('            -- Se valida si el la identificaci\00F3n corresponde a un sujeto impuesto'),
'                begin ',
'                   select id_sjto_impsto into v_id_sjto_impsto from v_si_i_sujetos_impuesto where cdgo_clnte = :F_CDGO_CLNTE and idntfccion_sjto =  v_idntfccion;',
'                      ',
unistr('                      --  Si existe el sujeto impuesto se consulta la direcci\00F3n, responsable y se calcula el estado'),
'                      if v_id_sjto_impsto is not null then',
'                           select ''SI'' indcdor_existe,',
'                                  a.drccion,',
'                                  c.nmbre_rzon_scial,',
'                                  case when a.estdo_blqdo_sjto = ''S'' then ''BLQ''',
'                                       when sum (b.vlor_sldo_cptal + b.vlor_intres) <= 0  or sum (b.vlor_sldo_cptal + b.vlor_intres) is null then ''SNS''',
'                                       when a.estdo_blqdo_sjto = ''N'' then ''VLD''',
'                                  end as estdo',
'                             into v_indcdor_existe,',
'                                  v_drccion,',
'                                  v_nmbre_rspnsble,',
'                                  v_estdo',
'                             from v_si_i_sujetos_impuesto a',
'                             join v_si_i_sujetos_responsable c on a.id_sjto = c.id_sjto',
'                             left join v_gf_g_cartera_x_vigencia  b on a.id_sjto_impsto =  b.id_sjto_impsto',
'                              and (b.vgncia * 100 + b.prdo) between (:P55_VGNCIA_DSDE * 100 + :P55_PRDO_DSDE) and (:P55_VGNCIA_HSTA * 100 + :P55_PRDO_HSTA)',
'                            where a.cdgo_clnte = :F_CDGO_CLNTE',
'                              and a.id_impsto = :P55_ID_IMPSTO',
'                              and a.id_sjto_impsto =  v_id_sjto_impsto  -- 0003000000000901900008312',
'                              and c.prncpal_s_n = ''S''',
'                         group by a.id_sjto_impsto,',
'                                  a.drccion,',
'                                  c.nmbre_rzon_scial,',
'                                  a.estdo_blqdo_sjto;',
unistr('                       end if; -- Fin Validaci\00F3n Sujeto impuesto existe                   '),
'                   ',
'                exception ',
'                   when no_data_found then ',
'                       v_id_sjto_impsto := null;',
'                       v_indcdor_existe := ''NO'' ;  ',
'                       v_drccion        := '' -- '';',
'                       v_nmbre_rspnsble := '' -- '';',
'                       v_estdo          := ''No Valido'';',
'                end; ',
unistr('            -- Se llena la colecci\00F3n'),
'            APEX_COLLECTION.ADD_MEMBER( p_collection_name => ''IDNTFCCION_SJTO_IMPSTO'',',
'                                            p_n001            => v_id_sjto_impsto,',
'                                            p_C001            => v_idntfccion,',
'                                            p_C002            => v_indcdor_existe,',
'                                            p_C003            => v_drccion,',
'                                            p_C004            => v_nmbre_rspnsble,',
'                                            p_C005            => v_estdo); ',
'        end loop;',
'       ',
'        v_nmro_lnea := 0;',
'        for c_sjto_impsto in (select n001 id_sjto_impsto,                                              ',
'                                     c001 idntfccion,  ',
'                                     c002 indcdor_existe, ',
'                                     c003 drccion,',
'                                     c004 nmbre_rspnsble,  ',
'                                     c005 estdo ',
'                        from apex_collections ',
'                       where collection_name = ''IDNTFCCION_SJTO_IMPSTO'') loop',
'            v_nmro_lnea := v_nmro_lnea + 1;',
'            insert into gn_g_temporal (n001,				            n002,				            C001,			                                C002,',
'                                       C003,				            C004,				            C005,		                                    id_ssion)',
'                               values (c_sjto_impsto.id_sjto_impsto,	v_nmro_lnea,		            c_sjto_impsto.idntfccion,	                    c_sjto_impsto.indcdor_existe, ',
'                                       c_sjto_impsto.drccion, 		    c_sjto_impsto.nmbre_rspnsble,	c_sjto_impsto.estdo, 	                        :APP_SESSION);',
'',
'        end loop;',
'        :P55_TTAL_SJTO_IMPSTO := v_nmro_lnea;',
'        close c_sjto_impsto;',
'       ',
'        apex_json.open_object();',
'        apex_json.write(''msg'', ''Proceso terminado.'');',
'        apex_json.write(''err'', 0);   ',
'   end if;   ',
'    apex_json.close_object();  ',
'exception',
'         when others then',
'              apex_json.write(''err'',true);',
'              apex_json.write(''msg'',apex_escape.html(sqlerrm));',
'              apex_json.close_all();   ',
'end;',
'',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(185328085776930999)
,p_process_when=>'P55_ID_SQL'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
