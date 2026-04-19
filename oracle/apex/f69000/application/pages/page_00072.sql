prompt --application/pages/page_00072
begin
wwv_flow_api.create_page(
 p_id=>72
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>'Web Services Confecamaras'
,p_step_title=>'Web Services Confecamaras'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_IMAGES#sweetalert2@11.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buildJsonCandidatos(){',
'',
'    var region = apex.region(''Lte'');',
'    ',
'    if(region){',
'        ',
'        var view = apex.region("Lte").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        var jsonCandidatos = records.map((carga) => {',
'            return {"LTE" : model.getValue(carga, "ID_CNFCMRA_LTE")}; ',
'        });',
'        ',
'       ',
'        ',
'        console.log(jsonCandidatos[0].LTE);',
'        $s(''P54_ID_LTE'',jsonCandidatos[0].LTE);',
'        /*window.localStorage.setItem(''ID_CNFCMRA_LTE'', JSON.stringify(ID_CNFCMRA_LTE));*/',
'        ',
'        //localStorage.getItem( ''id_dcl_crga'' );',
'        apex.region("NH").widget().interactiveGrid("getActions").invoke("refresh");',
'          apex.region("H").widget().interactiveGrid("getActions").invoke("refresh");',
'        apex.region("NH").widget().interactiveGrid("getActions").invoke("selection-refresh")',
'         apex.region("H").widget().interactiveGrid("getActions").invoke("selection-refresh")',
'        ',
'      ',
'    }',
'}',
'',
'',
'',
'function getEmpInfo () {',
'   ws= apex.widget.waitPopup();',
'    ',
'    ',
'  apex.server.process(',
'    ''ws'',{ x01: $v("P54_FCHA_INI"),',
'           x02: $v("P54_FCHA_FIN")},',
'    ',
'    {',
'      success: function (pData) {             // Success Javascript',
'          console.log(JSON.stringify(pData))',
'        ',
'          ',
'          apex.item("P54_RPSTA").setValue(JSON.stringify(pData))',
'         ',
'          ws.remove();',
'          ',
'         Swal.fire(',
'                  ''Lote Procesado!'',',
'                  '''',',
'                  ''success''',
'                )',
'          ',
'         apex.region("Lte").widget().interactiveGrid("getActions").invoke("refresh");',
'          apex.region("NH").widget().interactiveGrid("getActions").invoke("refresh");',
'          apex.region("H").widget().interactiveGrid("getActions").invoke("refresh");',
'          apex.region("Lte").widget().interactiveGrid("getActions").invoke("selection-refresh")',
'          apex.region("NH").widget().interactiveGrid("getActions").invoke("selection-refresh")',
'         apex.region("H").widget().interactiveGrid("getActions").invoke("selection-refresh")',
'      ',
'    },',
'       error: function (pData) {',
'           ',
'           Swal.fire(',
'                  ''No se pudo procesar!'',',
'                  '''',',
'                  ''error''',
'                )',
'           ',
'           ',
'            ws.remove();           ',
'           apex.region("NH").widget().interactiveGrid("getActions").invoke("refresh");',
'          apex.region("H").widget().interactiveGrid("getActions").invoke("refresh");',
'           apex.region("NH").widget().interactiveGrid("getActions").invoke("selection-refresh")',
'         apex.region("H").widget().interactiveGrid("getActions").invoke("selection-refresh")',
'      ',
'  }}',
'       ',
'  );',
'    ',
'}'))
,p_step_template=>wwv_flow_api.id(88508844706834645)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'DBALDOVINO'
,p_last_upd_yyyymmddhh24miss=>'20260123174327'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(272370665038762382)
,p_plug_name=>unistr('Inscripci\00F3n Expediente Confec\00E1maras')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>':F_ID_USRIO in (230017,230137)'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(272623773180061498)
,p_plug_name=>unistr('Detalle Web Services C\00E1mara de Comercio')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(272622171715061482)
,p_plug_name=>'Web Services'
,p_parent_plug_id=>wwv_flow_api.id(272623773180061498)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(88543343085834669)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(145807862188039379)
,p_plug_name=>'Consumos'
,p_region_name=>'Lte'
,p_parent_plug_id=>wwv_flow_api.id(272622171715061482)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_CNFCMRA_LTE, FCHA_INCIAL, FCHA_FNAL,FCHA_RGSTRO,decode(orgen,''CAM'',''CAMARA DE COMERCIO'',''COM'',''CONFECAMARAS'') orgen,',
'        (select count(*)',
'          from ws_g_confecamaras_sjto_lte b',
'         where b.id_cnfcmra_lte = a.id_cnfcmra_lte',
'           and b.prcsdo_extsmnte = ''S'') inscrtos',
'from ws_g_confecamaras_lote a',
'where  exists (select ID_CNFCMRA_LTE from ws_g_confecamaras_sjto_lte b where a.ID_CNFCMRA_LTE= b.ID_CNFCMRA_LTE);'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(16932320874508503)
,p_name=>'ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Origen'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>18
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(145808051073039381)
,p_name=>'ID_CNFCMRA_LTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNFCMRA_LTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Lote'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(145808281106039383)
,p_name=>'FCHA_INCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_INCIAL'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha Matr\00EDcula')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(145808359417039384)
,p_name=>'FCHA_FNAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_FNAL'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Final'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(145808622295039386)
,p_name=>'FCHA_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(145809306156039393)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(145809419808039394)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(154094629275293965)
,p_name=>'INSCRTOS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INSCRTOS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Inscritos'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(145808004921039380)
,p_internal_uid=>145808004921039380
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
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
 p_id=>wwv_flow_api.id(145828514122141445)
,p_interactive_grid_id=>wwv_flow_api.id(145808004921039380)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(145828628957141445)
,p_report_id=>wwv_flow_api.id(145828514122141445)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16947959989213091)
,p_view_id=>wwv_flow_api.id(145828628957141445)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(16932320874508503)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18721790396349980)
,p_view_id=>wwv_flow_api.id(145828628957141445)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(154094629275293965)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(145829040996141446)
,p_view_id=>wwv_flow_api.id(145828628957141445)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(145808051073039381)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(145830055215141450)
,p_view_id=>wwv_flow_api.id(145828628957141445)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(145808281106039383)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(145830557419141452)
,p_view_id=>wwv_flow_api.id(145828628957141445)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(145808359417039384)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(145831570091141458)
,p_view_id=>wwv_flow_api.id(145828628957141445)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(145808622295039386)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(145841249049156636)
,p_view_id=>wwv_flow_api.id(145828628957141445)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(145809306156039393)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(272622411676061484)
,p_plug_name=>'No procesadas'
,p_region_name=>'NH'
,p_parent_plug_id=>wwv_flow_api.id(272622171715061482)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_cnfcmra_lte as Lote,',
'       a.id_cnfcmra_sjto_lte,',
'       a.mtrcla,',
unistr('       a.idntfccion as Identificaci\00F3n,'),
'       decode(trim(prmer_nmbre),',
'              null,',
'              rzon_scial,',
'              prmer_nmbre || '' '' || sgndo_nmbre || '' '' || prmer_aplldo || '' '' ||',
'              sgndo_aplldo) as Nombre,',
'       case',
'           when (a.ctgria = ''0'' and organizacion = ''01'') then',
'               ''Persona Natural''',
'           when (a.ctgria = ''0'' and organizacion <> ''01'') then',
'               ''Establecimiento''',
'           when (a.ctgria = ''1'') then',
'               ''Sociedad principal''',
'           when (a.ctgria = ''2'') then',
'               ''Sucursal''  ',
'           when (a.ctgria = ''3'') then',
'               ''Agencia''',
'       end  ctgria,',
'       a.prcsdo as Procesado,',
unistr('       a.obsrvcion_error_prcso as Observaci\00F3n,'),
'       b.observacion error,',
'       decode(c.idclase, 1 ,c.numid, substr(c.numid,1,length(c.numid)-1)) nit_prptrio,',
'       c.razonsocial',
'  from ws_g_confecamaras_sjto_lte a',
'  left join ws_d_confecmrs_sjt_lt_error b',
'    on b.id_cnfcmra_sjto_lte = a.id_cnfcmra_sjto_lte',
'   and b.id_cnfcmr_sjt_lt_error = a.id_cnfcmr_sjt_lt_error',
'  left join json_table(a.prptrios, ''$[*]'' columns(razonsocial path ''$.razonsocial'', numid path ''$.numid'', idclase path ''$.idclase'')) c on 1 = 1',
' where (a.prcsdo = ''N'' or a.ID_CNFCMR_SJT_LT_ERROR is not null)',
' and (c.idclase <> (''P'') OR c.idclase is null)',
' and a.orgen = ''COM''',
' ',
' UNION',
' ',
' select a.id_cnfcmra_lte as Lote,',
'       a.id_cnfcmra_sjto_lte,',
'       a.mtrcla,',
unistr('       a.idntfccion as Identificaci\00F3n,'),
'	   ',
'       decode(trim(prmer_nmbre),',
'              null,',
'              rzon_scial,',
'              prmer_nmbre || '' '' || sgndo_nmbre || '' '' || prmer_aplldo || '' '' ||',
'              sgndo_aplldo) as Nombre,',
'       case',
'           when organizacion = ''01'' then',
'               ''Persona Natural''',
'           when organizacion <> ''01'' then',
'               ''Sociedad Principal''',
'       end  ctgria,',
'       a.prcsdo as Procesado,',
unistr('       a.obsrvcion_error_prcso as Observaci\00F3n,'),
'       b.observacion error,',
'	   ',
'       case',
'           when organizacion = ''01'' then',
'               a.idntfccion',
'           else',
'				c.numid',
'       end nit_prptrio,',
'	   ',
'       case',
'           when organizacion = ''01'' then',
'				decode(trim(prmer_nmbre),',
'				null,',
'				rzon_scial,',
'				prmer_nmbre || '' '' || sgndo_nmbre || '' '' || prmer_aplldo || '' '' ||',
'				sgndo_aplldo)',
'           else',
'				c.razonsocial',
'       end razonsocial',
'  from ws_g_confecamaras_sjto_lte a',
'  left join ws_d_confecmrs_sjt_lt_error b',
'    on b.id_cnfcmra_sjto_lte = a.id_cnfcmra_sjto_lte',
'   and b.id_cnfcmr_sjt_lt_error = a.id_cnfcmr_sjt_lt_error',
'  left join json_table(a.rprsntnte_lgal, ''$[*]'' columns(razonsocial path ''$.NOM_REP_LEGAL'', numid path ''$.IDENTIFICACION'')) c on 1 = 1',
' where nvl(a.prcsdo_extsmnte,''N'') = ''N''',
' and a.orgen = ''CAM'''))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(145807862188039379)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(152288737037782065)
,p_name=>'ERROR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ERROR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Error'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(152439925859364465)
,p_name=>'NIT_PRPTRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NIT_PRPTRIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nit Propietario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(152439973205364466)
,p_name=>'RAZONSOCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RAZONSOCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Propietario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(152440063158364467)
,p_name=>'ID_CNFCMRA_SJTO_LTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNFCMRA_SJTO_LTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(152440261935364469)
,p_name=>'CTGRIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CTGRIA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Categoria'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>18
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(154094635981293966)
,p_name=>'MTRCLA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MTRCLA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Matr\00EDcula')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>10
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(272623235929061492)
,p_name=>'LOTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LOTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(145808051073039381)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(272623285431061493)
,p_name=>unistr('IDENTIFICACI\00D3N')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('IDENTIFICACI\00D3N')
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>20
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(272623366001061494)
,p_name=>'NOMBRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOMBRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>753
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
 p_id=>wwv_flow_api.id(272623545729061495)
,p_name=>'PROCESADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROCESADO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Procesado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>2
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(272623584762061496)
,p_name=>unistr('OBSERVACI\00D3N')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('OBSERVACI\00D3N')
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(272622562583061486)
,p_internal_uid=>272622562583061486
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
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
 p_id=>wwv_flow_api.id(272631038009104230)
,p_interactive_grid_id=>wwv_flow_api.id(272622562583061486)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(272631090422104231)
,p_report_id=>wwv_flow_api.id(272631038009104230)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18741312509600019)
,p_view_id=>wwv_flow_api.id(272631090422104231)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(154094635981293966)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>85.5625
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(152294773189782300)
,p_view_id=>wwv_flow_api.id(272631090422104231)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(152288737037782065)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>394.5625
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(152445873061364575)
,p_view_id=>wwv_flow_api.id(272631090422104231)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(152439925859364465)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>153.76198168945314
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(152446422331364578)
,p_view_id=>wwv_flow_api.id(272631090422104231)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(152439973205364466)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>263.3875366210938
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(152448344753375505)
,p_view_id=>wwv_flow_api.id(272631090422104231)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(152440063158364467)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>92.5625
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(152463749074619334)
,p_view_id=>wwv_flow_api.id(272631090422104231)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(152440261935364469)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>133.5625
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(272634015732104268)
,p_view_id=>wwv_flow_api.id(272631090422104231)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(272623235929061492)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>112.399
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(272634482942104270)
,p_view_id=>wwv_flow_api.id(272631090422104231)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(272623285431061493)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>143
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(272635039845104272)
,p_view_id=>wwv_flow_api.id(272631090422104231)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(272623366001061494)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>336
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(272635547236104274)
,p_view_id=>wwv_flow_api.id(272631090422104231)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(272623545729061495)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>99
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(272636021948104276)
,p_view_id=>wwv_flow_api.id(272631090422104231)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(272623584762061496)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>438
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(272624467798061505)
,p_plug_name=>'Procesadas'
,p_region_name=>'H'
,p_parent_plug_id=>wwv_flow_api.id(272622171715061482)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_cnfcmra_lte as Lote,',
'       id_cnfcmra_sjto_lte,',
'       a.mtrcla,',
unistr('       idntfccion as Identificaci\00F3n, '),
'       decode(trim(prmer_nmbre),null,rzon_scial,prmer_nmbre||'' ''||sgndo_nmbre||'' ''||prmer_aplldo||'' ''||sgndo_aplldo) as Nombre, ',
'       case',
'           when (a.ctgria = ''0'' and organizacion = ''01'') then',
'               ''Persona Natural''',
'           when (a.ctgria = ''0'' and organizacion <> ''01'') then',
'               ''Establecimiento''',
'           when (a.ctgria = ''1'') then',
'               ''Sociedad principal''',
'           when (a.ctgria = ''2'') then',
'               ''Sucursal''  ',
'           when (a.ctgria = ''3'') then',
'               ''Agencia''',
'       end  ctgria,',
'       prcsdo as Procesado, ',
unistr('       obsrvcion_error_prcso as Observaci\00F3n,'),
'       a.mnsje_rspsta_cnfcmra',
'from ws_g_confecamaras_sjto_lte a where obsrvcion_error_prcso is null',
'and (prcsdo = ''S'' and ID_CNFCMR_SJT_LT_ERROR is null)',
'and a.orgen = ''COM''',
'',
'union',
'',
'select id_cnfcmra_lte as Lote,',
'       id_cnfcmra_sjto_lte,',
'       a.mtrcla,',
unistr('       idntfccion as Identificaci\00F3n, '),
'       decode(trim(prmer_nmbre),null,rzon_scial,prmer_nmbre||'' ''||sgndo_nmbre||'' ''||prmer_aplldo||'' ''||sgndo_aplldo) as Nombre, ',
'       case',
'           when organizacion = ''01'' then',
'               ''Persona Natural''',
'           when organizacion <> ''01'' then',
'               ''Sociedad Principal''',
'       end  ctgria,',
'       prcsdo as Procesado, ',
unistr('       obsrvcion_error_prcso as Observaci\00F3n,'),
'       a.mnsje_rspsta_cnfcmra',
'from ws_g_confecamaras_sjto_lte a where obsrvcion_error_prcso is null',
'and nvl(a.prcsdo_extsmnte,''N'') = ''S''',
'and a.orgen = ''CAM''',
'',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(145807862188039379)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(152440219436364468)
,p_name=>'ID_CNFCMRA_SJTO_LTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNFCMRA_SJTO_LTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(152440383606364470)
,p_name=>'CTGRIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CTGRIA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Categoria'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>18
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(152440478786364471)
,p_name=>'MNSJE_RSPSTA_CNFCMRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MNSJE_RSPSTA_CNFCMRA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Mensaje Confirmaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(154094761336293967)
,p_name=>'MTRCLA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MTRCLA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Matr\00EDcula')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>10
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(272624678569061507)
,p_name=>'LOTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LOTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(145808051073039381)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(272624812043061508)
,p_name=>unistr('IDENTIFICACI\00D3N')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('IDENTIFICACI\00D3N')
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>20
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(272624894475061509)
,p_name=>'NOMBRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOMBRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>753
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
 p_id=>wwv_flow_api.id(272625007185061510)
,p_name=>'PROCESADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROCESADO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Procesado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>2
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(272625131228061511)
,p_name=>unistr('OBSERVACI\00D3N')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('OBSERVACI\00D3N')
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(272624640488061506)
,p_internal_uid=>272624640488061506
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
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
 p_id=>wwv_flow_api.id(272649038338115727)
,p_interactive_grid_id=>wwv_flow_api.id(272624640488061506)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(272649124311115727)
,p_report_id=>wwv_flow_api.id(272649038338115727)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(152453613180383364)
,p_view_id=>wwv_flow_api.id(272649124311115727)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(152440219436364468)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(152465176113621697)
,p_view_id=>wwv_flow_api.id(272649124311115727)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(152440383606364470)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(152467836739692170)
,p_view_id=>wwv_flow_api.id(272649124311115727)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(152440478786364471)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154115920368449631)
,p_view_id=>wwv_flow_api.id(272649124311115727)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(154094761336293967)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(272649636399115731)
,p_view_id=>wwv_flow_api.id(272649124311115727)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(272624678569061507)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>59.601
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(272650128170115735)
,p_view_id=>wwv_flow_api.id(272649124311115727)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(272624812043061508)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(272650655916115738)
,p_view_id=>wwv_flow_api.id(272649124311115727)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(272624894475061509)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>522
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(272651112800115742)
,p_view_id=>wwv_flow_api.id(272649124311115727)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(272625007185061510)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>84
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(272651623876115745)
,p_view_id=>wwv_flow_api.id(272649124311115727)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(272625131228061511)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18715825841326775)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(272370665038762382)
,p_button_name=>'P72_CNSLTR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success'
,p_button_template_id=>wwv_flow_api.id(88588617354834707)
,p_button_image_alt=>'Consultar/Inscribir Expedientes'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18716245985326777)
,p_name=>'P72_FCHA_INI'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(272370665038762382)
,p_prompt=>'Fecha'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18716656882326778)
,p_name=>'P72_FCHA_FIN'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(272370665038762382)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18717087174326778)
,p_name=>'P72_RPSTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(272370665038762382)
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>2
,p_field_template=>wwv_flow_api.id(88588114931834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18717450424326778)
,p_name=>'P72_TMP'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(272370665038762382)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18717869659326778)
,p_name=>'P72_ID_LTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(272370665038762382)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(18733115001326794)
,p_name=>'Ejecutar Ajax'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(18715825841326775)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(18733629263326795)
,p_event_id=>wwv_flow_api.id(18733115001326794)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'getEmpInfo();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(18734196906326796)
,p_event_id=>wwv_flow_api.id(18733115001326794)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P72_RPSTA'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18722586158326786)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(145807862188039379)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Lote - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18732701229326793)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ws'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_prvdor         number;',
'    v_id_impsto         number;',
'    v_id_impsto_sbmpsto number;',
'    v_id_usrio          number := 230017;',
'    v_cdgo_clnte        number := 23001;',
'    v_tpo_prcso_cnslta  varchar2(1);',
'    v_fcha              timestamp := :P72_FCHA_INI;',
'    v_tpo_rprte         number;',
'    v_obsrvcion         varchar2(4000);',
'    v_id_fljo           number := 5;',
'',
'    o_id_session_2      number;',
'    o_id_instncia_fljo  number;',
'    o_cdgo_rspsta       number;',
'    v_mnsje_rspsta      varchar2(5000);',
'begin',
unistr('    -- Asignaci\00F3n de propiedades en un solo bloque'),
'    select ',
'        pkg_ws_confecamaras.fnc_cl_parametro_configuracion(v_cdgo_clnte, ''IPV''),',
'        pkg_ws_confecamaras.fnc_cl_parametro_configuracion(v_cdgo_clnte, ''IIM''),',
'        pkg_ws_confecamaras.fnc_cl_parametro_configuracion(v_cdgo_clnte, ''ISI''),',
'        pkg_ws_confecamaras.fnc_cl_parametro_configuracion(v_cdgo_clnte, ''TPC''),',
'        pkg_ws_confecamaras.fnc_cl_parametro_configuracion(v_cdgo_clnte, ''TPR''),',
'        pkg_ws_confecamaras.fnc_cl_parametro_configuracion(v_cdgo_clnte, ''OBS'')',
'    into ',
'        v_id_prvdor, v_id_impsto, v_id_impsto_sbmpsto, v_tpo_prcso_cnslta, ',
'        v_tpo_rprte, v_obsrvcion',
'    from dual;',
'',
unistr('    -- Primera llamada con tipo de acci\00F3n ''TPA'''),
'    begin',
'        pkg_ws_confecamaras.prc_gn_novedades(',
'            p_cdgo_clnte        => v_cdgo_clnte,',
'            p_id_prvdor         => v_id_prvdor,',
'            p_id_impsto         => v_id_impsto,',
'            p_id_impsto_sbmpsto => v_id_impsto_sbmpsto,',
'            p_id_usrio          => v_id_usrio,',
'            p_tpo_prcso_cnlta   => v_tpo_prcso_cnslta,',
'            p_fcha_incial       => v_fcha,',
'            p_fcha_fnal         => v_fcha,',
'            p_tpo_rprte         => v_tpo_rprte,',
'            p_tpo_accion        => ''TPA'',',
'            p_obsrvcion         => v_obsrvcion,',
'            p_id_fljo           => v_id_fljo,',
'            o_id_session        => o_id_session_2,',
'            o_id_instncia_fljo  => o_id_instncia_fljo,',
'            o_cdgo_rspsta       => o_cdgo_rspsta,',
'            o_mnsje_rspsta      => v_mnsje_rspsta',
'        );',
'    exception',
'        when others then',
unistr('            dbms_output.put_line(''Error en acci\00F3n TPA: '' || sqlerrm);'),
'    end;',
'',
unistr('    -- Segunda llamada con tipo de acci\00F3n ''CPE'''),
'    begin',
'        pkg_ws_confecamaras.prc_gn_novedades(',
'            p_cdgo_clnte        => v_cdgo_clnte,',
'            p_id_prvdor         => v_id_prvdor,',
'            p_id_impsto         => v_id_impsto,',
'            p_id_impsto_sbmpsto => v_id_impsto_sbmpsto,',
'            p_id_usrio          => v_id_usrio,',
'            p_tpo_prcso_cnlta   => v_tpo_prcso_cnslta,',
'            p_fcha_incial       => v_fcha,',
'            p_fcha_fnal         => v_fcha,',
'            p_tpo_rprte         => v_tpo_rprte,',
'            p_tpo_accion        => ''CPE'',',
'            p_obsrvcion         => v_obsrvcion,',
'            p_id_fljo           => v_id_fljo,',
'            o_id_session        => o_id_session_2,',
'            o_id_instncia_fljo  => o_id_instncia_fljo,',
'            o_cdgo_rspsta       => o_cdgo_rspsta,',
'            o_mnsje_rspsta      => v_mnsje_rspsta',
'        );',
'    exception',
'        when others then',
unistr('            dbms_output.put_line(''Error en acci\00F3n CPE: '' || sqlerrm);'),
'    end;',
'',
'exception',
'    when others then',
'        dbms_output.put_line(''Error general: '' || sqlerrm);',
'end;'))
,p_process_error_message=>'eRROR'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'lISTO!!'
);
end;
/
