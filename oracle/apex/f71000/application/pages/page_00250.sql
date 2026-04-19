prompt --application/pages/page_00250
begin
wwv_flow_api.create_page(
 p_id=>250
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Consignar y Devolver'
,p_step_title=>'Consignar y Devolver'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buildJsonTitulosC() {',
'    ',
'    var region = apex.region(''titulosC'');',
'    ',
'    if(region) {',
'        var view = apex.region("titulosC").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = model._data;//view.view$.grid("getSelectedRecords");',
'        ',
'        var jsonTitulosC = records.map((titulosC) => {',
'            return {"ID_TTLO_JDCIAL" : model.getValue(titulosC, "ID_TTLO_JDCIAL"),',
'                    "TTLO_JDCIAL_ESTDO" : model.getValue(titulosC, "TTLO_JDCIAL_ESTDO"),',
'                    "ID_INSTNCIA_FLJO" : model.getValue(titulosC, "ID_INSTNCIA_FLJO")',
'                   };',
'        });',
'        $s(''P250_JSON_CNSGNR'', JSON.stringify(jsonTitulosC));',
'        console.log(''jsonC: ''+JSON.stringify(jsonTitulosC));',
'    }',
'};',
'function buildJsonTitulosD() {',
'    ',
'    var region = apex.region(''titulosD'');',
'    ',
'    if(region) {',
'        var view = apex.region("titulosD").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = model._data;//view.view$.grid("getSelectedRecords");',
'        ',
'        var jsonTitulosD = records.map((titulosD) => {',
'            return {"ID_TTLO_JDCIAL" : model.getValue(titulosD, "ID_TTLO_JDCIAL"),',
'                    "TTLO_JDCIAL_ESTDO" : model.getValue(titulosD, "TTLO_JDCIAL_ESTDO"),',
'                    "ID_INSTNCIA_FLJO" : model.getValue(titulosD, "ID_INSTNCIA_FLJO")',
'                   };',
'        });',
'        $s(''P250_JSON_DVLVR'', JSON.stringify(jsonTitulosD));',
'        console.log(''jsonD: ''+JSON.stringify(jsonTitulosD));',
'    }',
'};'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if( apex.region("titulosC") )',
'    apex.region("titulosC").widget().interactiveGrid("getViews", "grid").view$.grid("selectAll");',
'if( apex.region("titulosD") )',
'    apex.region("titulosD").widget().interactiveGrid("getViews", "grid").view$.grid("selectAll");'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20231117112507'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17465160882712106)
,p_plug_name=>unistr('<b>T\00EDtulos Registrados para Devolver</b>')
,p_region_name=>'titulosD'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   a.id_ttlo_jdcial',
'        ,a.cdgo_clnte',
'        ,a.id_ttlo_jdcial_crgdo',
'        ,a.nmro_ttlo_jdcial',
'        ,a.fcha_cnsttcion',
'        ,a.vlor',
'        --,a.idntfccion_dmndnte',
'        --,a.nmbre_dmndnte',
'        ,decode(a.id_ttlo_jdcial_area,a.id_ttlo_jdcial_area, c.nmbre_area , ''-'') as id_ttlo_jdcial_area',
'        ,decode(a.cdgo_idntfccion_tpo_dmnddo, a.cdgo_idntfccion_tpo_dmnddo, b.dscrpcion_idntfccion_tpo, ''-'') as cdgo_idntfccion_tpo_dmnddo',
'        ,a.idntfccion_dmnddo',
'        ,a.nmbre_dmnddo',
'        ,a.nmro_ttlo_pdre',
'        ,a.id_ttlo_pdre',
'        ,a.cdgo_entdad_cnsgnnte||'' - ''||d.nmbre_bnco as cdgo_entdad_cnsgnnte',
'        ,a.id_bnco_cnsgnnte',
'        ,decode(a.cdgo_ttlo_jdcial_estdo, a.cdgo_ttlo_jdcial_estdo, f.dscrpcion, ''-'') as cdgo_ttlo_jdcial_estdo',
'        ,a.id_embrgo_rslcion',
'        ,a.id_instncia_fljo_pdre',
'        ,a.id_instncia_fljo',
'        ,a.id_slctud',
'        ,a.cdgo_entdad_rcddr||'' - ''||e.nmbre_bnco as cdgo_entdad_rcddr',
'        ,a.id_bnco_rcddr',
'        ,a.cnsctvo_embrgo',
'from gf_g_titulos_judicial a',
'join df_s_identificaciones_tipo b on b.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo_dmnddo',
'join df_c_areas c on c.id_area = a.id_ttlo_jdcial_area',
'join df_c_bancos d on d.id_bnco = a.id_bnco_cnsgnnte',
'join df_c_bancos e on e.id_bnco = a.id_bnco_rcddr',
'left join gf_d_titulos_judicial_estdo f on f.cdgo_ttlo_jdcial_estdo = a.cdgo_ttlo_jdcial_estdo',
'--left join mc_g_embargos_resolucion g on g.id_embrgos_rslcion = a.id_embrgo_rslcion',
'--where a.id_instncia_fljo is null',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'--and a.idntfccion_dmnddo = :P250_IDNTFCCION',
'and a.cdgo_ttlo_jdcial_estdo in (''ASL'',''SDT'',''CDT'')'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17465479333712109)
,p_name=>'ID_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17465664446712111)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17465757208712112)
,p_name=>'ID_TTLO_JDCIAL_CRGDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_CRGDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17465811060712113)
,p_name=>'NMRO_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_JDCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('N\00FAmero T\00EDtulo<br>Judicial')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17465959437712114)
,p_name=>'FCHA_CNSTTCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_CNSTTCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Fecha<br>Constituci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17466094243712115)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Valor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17466110320712116)
,p_name=>'ID_TTLO_JDCIAL_AREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_AREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('\00C1rea')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17466206792712117)
,p_name=>'IDNTFCCION_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Identificaci\00F3n<br>Demandado')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17466310058712118)
,p_name=>'NMBRE_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Nombre<br>Demandado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17466427083712119)
,p_name=>'NMRO_TTLO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_PDRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('N\00FAmero T\00EDtulo<br>Judicial Padre')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17466582202712120)
,p_name=>'ID_TTLO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_PDRE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17466613441712121)
,p_name=>'CDGO_ENTDAD_CNSGNNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ENTDAD_CNSGNNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Entidad<br>Consignante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17466785157712122)
,p_name=>'ID_BNCO_CNSGNNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_BNCO_CNSGNNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17466852219712123)
,p_name=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Estado T\00EDtulo<br>Judicial')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Consignar;CNS,Devolver;DVL,Fraccionar;FRC,Rechazar;RCH'
,p_lov_display_extra=>true
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
,p_include_in_export=>false
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17466965127712124)
,p_name=>'ID_EMBRGO_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGO_RSLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17467062329712125)
,p_name=>'ID_INSTNCIA_FLJO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO_PDRE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17467198340712126)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17467254974712127)
,p_name=>'ID_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTUD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Id Solicitud<br>PQR'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17467368078712128)
,p_name=>'CDGO_ENTDAD_RCDDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ENTDAD_RCDDR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Entidad<br>Recaudadora'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17467434631712129)
,p_name=>'ID_BNCO_RCDDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_BNCO_RCDDR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17467528747712130)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>220
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17467688608712131)
,p_name=>'CDGO_IDNTFCCION_TPO_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_IDNTFCCION_TPO_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Tipo Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17467785603712132)
,p_name=>'CNSCTVO_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNSCTVO_EMBRGO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Consecutivo<br>Embargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(17465301172712108)
,p_internal_uid=>17465301172712108
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
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
 p_id=>wwv_flow_api.id(17477155202911773)
,p_interactive_grid_id=>wwv_flow_api.id(17465301172712108)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(17477275105911774)
,p_report_id=>wwv_flow_api.id(17477155202911773)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17477759297911786)
,p_view_id=>wwv_flow_api.id(17477275105911774)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(17465479333712109)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17478783655911797)
,p_view_id=>wwv_flow_api.id(17477275105911774)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(17465664446712111)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17479263498911799)
,p_view_id=>wwv_flow_api.id(17477275105911774)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(17465757208712112)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17479739300911801)
,p_view_id=>wwv_flow_api.id(17477275105911774)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(17465811060712113)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17480259979911803)
,p_view_id=>wwv_flow_api.id(17477275105911774)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(17465959437712114)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17480742195911804)
,p_view_id=>wwv_flow_api.id(17477275105911774)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(17466094243712115)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17481274665911815)
,p_view_id=>wwv_flow_api.id(17477275105911774)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(17466110320712116)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17481738136911817)
,p_view_id=>wwv_flow_api.id(17477275105911774)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(17466206792712117)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17482250510911819)
,p_view_id=>wwv_flow_api.id(17477275105911774)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(17466310058712118)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17482766858911820)
,p_view_id=>wwv_flow_api.id(17477275105911774)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(17466427083712119)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17483193318911822)
,p_view_id=>wwv_flow_api.id(17477275105911774)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(17466582202712120)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17483652777911823)
,p_view_id=>wwv_flow_api.id(17477275105911774)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(17466613441712121)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17484185409911825)
,p_view_id=>wwv_flow_api.id(17477275105911774)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(17466785157712122)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17484656525911827)
,p_view_id=>wwv_flow_api.id(17477275105911774)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(17466852219712123)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17485128704911829)
,p_view_id=>wwv_flow_api.id(17477275105911774)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(17466965127712124)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17485673657911831)
,p_view_id=>wwv_flow_api.id(17477275105911774)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(17467062329712125)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17486139391911832)
,p_view_id=>wwv_flow_api.id(17477275105911774)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(17467198340712126)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17486658665911834)
,p_view_id=>wwv_flow_api.id(17477275105911774)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(17467254974712127)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17487104233911836)
,p_view_id=>wwv_flow_api.id(17477275105911774)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(17467368078712128)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17487690773911838)
,p_view_id=>wwv_flow_api.id(17477275105911774)
,p_display_seq=>21
,p_column_id=>wwv_flow_api.id(17467434631712129)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17488530756911844)
,p_view_id=>wwv_flow_api.id(17477275105911774)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(17467688608712131)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17489026481911846)
,p_view_id=>wwv_flow_api.id(17477275105911774)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(17467785603712132)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(29120147061087522)
,p_plug_name=>unistr('Proceso Puntual T\00EDtulo Judicial ')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
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
 p_id=>wwv_flow_api.id(51204424182098014)
,p_plug_name=>unistr('<b>T\00EDtulos Registrados para Consignar</b>')
,p_region_name=>'titulosC'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   a.id_ttlo_jdcial',
'        ,a.cdgo_clnte',
'        ,a.id_ttlo_jdcial_crgdo',
'        ,a.nmro_ttlo_jdcial',
'        ,a.fcha_cnsttcion',
'        ,a.vlor',
'        --,a.idntfccion_dmndnte',
'        --,a.nmbre_dmndnte',
'        ,decode(a.id_ttlo_jdcial_area,a.id_ttlo_jdcial_area, c.nmbre_area , ''-'') as id_ttlo_jdcial_area',
'        ,decode(a.cdgo_idntfccion_tpo_dmnddo, a.cdgo_idntfccion_tpo_dmnddo, b.dscrpcion_idntfccion_tpo, ''-'') as cdgo_idntfccion_tpo_dmnddo',
'        ,a.idntfccion_dmnddo',
'        ,a.nmbre_dmnddo',
'        ,a.nmro_ttlo_pdre',
'        ,a.id_ttlo_pdre',
'        ,a.cdgo_entdad_cnsgnnte||'' - ''||d.nmbre_bnco as cdgo_entdad_cnsgnnte',
'        ,a.id_bnco_cnsgnnte',
'        ,decode(a.cdgo_ttlo_jdcial_estdo, a.cdgo_ttlo_jdcial_estdo, f.dscrpcion, ''-'') as cdgo_ttlo_jdcial_estdo',
'        ,a.id_embrgo_rslcion',
'        ,a.id_instncia_fljo_pdre',
'        ,a.id_instncia_fljo',
'        ,a.id_slctud',
'        ,a.cdgo_entdad_rcddr||'' - ''||e.nmbre_bnco as cdgo_entdad_rcddr',
'        ,a.id_bnco_rcddr',
'        ,a.cnsctvo_embrgo',
'from gf_g_titulos_judicial a',
'join df_s_identificaciones_tipo b on b.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo_dmnddo',
'join df_c_areas c on c.id_area = a.id_ttlo_jdcial_area',
'join df_c_bancos d on d.id_bnco = a.id_bnco_cnsgnnte',
'join df_c_bancos e on e.id_bnco = a.id_bnco_rcddr',
'left join gf_d_titulos_judicial_estdo f on f.cdgo_ttlo_jdcial_estdo = a.cdgo_ttlo_jdcial_estdo',
'--left join mc_g_embargos_resolucion g on g.id_embrgos_rslcion = a.id_embrgo_rslcion',
'--where a.id_instncia_fljo is null',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'--and a.idntfccion_dmnddo = :P250_IDNTFCCION',
'and a.cdgo_ttlo_jdcial_estdo in (''ACN'', ''CNS'')'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(51204562012098016)
,p_name=>'ID_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(51204707559098017)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(51204790765098018)
,p_name=>'ID_TTLO_JDCIAL_CRGDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_CRGDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(51204885085098019)
,p_name=>'NMRO_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_JDCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('N\00FAmero T\00EDtulo<br>Judicial')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(51204991619098020)
,p_name=>'FCHA_CNSTTCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_CNSTTCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Fecha<br>Constituci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(51205129590098021)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Valor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
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
,p_escape_on_http_output=>true
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(51205375243098024)
,p_name=>'ID_TTLO_JDCIAL_AREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_AREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('\00C1rea')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(51205542924098026)
,p_name=>'IDNTFCCION_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Identificaci\00F3n<br>Demandado')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(51205661833098027)
,p_name=>'NMBRE_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Nombre<br>Demandado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(51205829902098028)
,p_name=>'NMRO_TTLO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_PDRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('N\00FAmero T\00EDtulo<br>Judicial Padre')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(51205879917098029)
,p_name=>'ID_TTLO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_PDRE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(51205999604098030)
,p_name=>'CDGO_ENTDAD_CNSGNNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ENTDAD_CNSGNNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Entidad<br>Consignante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(51206099122098031)
,p_name=>'ID_BNCO_CNSGNNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_BNCO_CNSGNNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(51206225810098032)
,p_name=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Estado T\00EDtulo<br>Judicial')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Consignar;CNS,Devolver;DVL,Fraccionar;FRC,Rechazar;RCH'
,p_lov_display_extra=>true
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
,p_include_in_export=>false
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(51206254706098033)
,p_name=>'ID_EMBRGO_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGO_RSLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(51206356319098034)
,p_name=>'ID_INSTNCIA_FLJO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO_PDRE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(51206520743098035)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>220
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(51206588898098036)
,p_name=>'ID_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTUD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Id Solicitud<br>PQR'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(51206710542098037)
,p_name=>'CDGO_ENTDAD_RCDDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ENTDAD_RCDDR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Entidad<br>Recaudadora'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(51206754462098038)
,p_name=>'ID_BNCO_RCDDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_BNCO_RCDDR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>250
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(51207014187098040)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(51352404315753821)
,p_name=>'CDGO_IDNTFCCION_TPO_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_IDNTFCCION_TPO_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Tipo Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(51381433026368143)
,p_name=>'CNSCTVO_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNSCTVO_EMBRGO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Consecutivo<br>Embargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>260
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(51204516462098015)
,p_internal_uid=>51204516462098015
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
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
 p_id=>wwv_flow_api.id(51213586372122344)
,p_interactive_grid_id=>wwv_flow_api.id(51204516462098015)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(51213684209122346)
,p_report_id=>wwv_flow_api.id(51213586372122344)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(34507201676568597)
,p_view_id=>wwv_flow_api.id(51213684209122346)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(51352404315753821)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51214211733122348)
,p_view_id=>wwv_flow_api.id(51213684209122346)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(51204562012098016)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51214739262122350)
,p_view_id=>wwv_flow_api.id(51213684209122346)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(51204707559098017)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51215157134122351)
,p_view_id=>wwv_flow_api.id(51213684209122346)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(51204790765098018)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51215691323122353)
,p_view_id=>wwv_flow_api.id(51213684209122346)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(51204885085098019)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51216228955122355)
,p_view_id=>wwv_flow_api.id(51213684209122346)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(51204991619098020)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51216725295122356)
,p_view_id=>wwv_flow_api.id(51213684209122346)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(51205129590098021)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51218179746122361)
,p_view_id=>wwv_flow_api.id(51213684209122346)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(51205375243098024)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51219235463122364)
,p_view_id=>wwv_flow_api.id(51213684209122346)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(51205542924098026)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51219665402122365)
,p_view_id=>wwv_flow_api.id(51213684209122346)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(51205661833098027)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51220205098122367)
,p_view_id=>wwv_flow_api.id(51213684209122346)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(51205829902098028)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51220704151122368)
,p_view_id=>wwv_flow_api.id(51213684209122346)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(51205879917098029)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51221181181122370)
,p_view_id=>wwv_flow_api.id(51213684209122346)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(51205999604098030)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51221650966122371)
,p_view_id=>wwv_flow_api.id(51213684209122346)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(51206099122098031)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51222227921122373)
,p_view_id=>wwv_flow_api.id(51213684209122346)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(51206225810098032)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51222668803122374)
,p_view_id=>wwv_flow_api.id(51213684209122346)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(51206254706098033)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51223158647122376)
,p_view_id=>wwv_flow_api.id(51213684209122346)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(51206356319098034)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51223740240122379)
,p_view_id=>wwv_flow_api.id(51213684209122346)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(51206520743098035)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51224173630122381)
,p_view_id=>wwv_flow_api.id(51213684209122346)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(51206588898098036)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51224741128122383)
,p_view_id=>wwv_flow_api.id(51213684209122346)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(51206710542098037)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51225156498122385)
,p_view_id=>wwv_flow_api.id(51213684209122346)
,p_display_seq=>23
,p_column_id=>wwv_flow_api.id(51206754462098038)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51479105497271553)
,p_view_id=>wwv_flow_api.id(51213684209122346)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(51381433026368143)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(61909532732988103)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
'Esta funcionalidad permite:<br><br>',
unistr('Proyectar la aplicaci\00F3n del T\00EDtulo Judicial.<br><br>'),
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(435948954706160672)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(17494294676099110)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(435948954706160672)
,p_button_name=>'REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:249:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(17511925280624616)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(435948954706160672)
,p_button_name=>'BTN_GNRAR_ACTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Acto'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P250_ID_ACTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18518887979319339)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(435948954706160672)
,p_button_name=>'BTN_VER_ACTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Ver Acto'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P250_ID_ACTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(17512153676626125)
,p_branch_name=>'Ir a Pagina 253 Generar Acto'
,p_branch_action=>'f?p=&APP_ID.:253:&SESSION.::&DEBUG.:RP,253:P253_PAGINA,P253_CDGO_TTLO_JDCIAL_ESTDO,P253_ID_INSTNCIA_FLJO:&APP_PAGE_ID.,CYD,&F_ID_INSTNCIA_FLJO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(17511925280624616)
,p_branch_sequence=>40
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(18519077739320794)
,p_branch_name=>unistr('Ir a P\00E1gina 127 Ver Acto')
,p_branch_action=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR,P127_COLUMNA_FILENAME:v_gn_g_actos,file_blob,file_mimetype,id_acto,&P250_ID_ACTO.,file_name&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(18518887979319339)
,p_branch_sequence=>70
,p_branch_condition_type=>'ITEM_IS_NOT_NULL'
,p_branch_condition=>'P250_ID_ACTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17315374075563845)
,p_name=>'P250_JSON_CNSGNR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(51204424182098014)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17465299881712107)
,p_name=>'P250_JSON_DVLVR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(17465160882712106)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17649042982567401)
,p_name=>'P250_ID_TTLO_JDCIAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(29120147061087522)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17654672357576801)
,p_name=>'P250_IDNTFCCION_DMNDDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(29120147061087522)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18518200923315839)
,p_name=>'P250_ID_ACTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(29120147061087522)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18746068967091001)
,p_name=>'P250_JSON_TTLOS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(29120147061087522)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(17514905358781801)
,p_name=>'Seleccionar Titulos Devolver'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(17465160882712106)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(17515085383781802)
,p_event_id=>wwv_flow_api.id(17514905358781801)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'buildJsonTitulosD();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(18742441938044164)
,p_name=>'Seleccionar Titulos Consignar'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(51204424182098014)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(18742839638044278)
,p_event_id=>wwv_flow_api.id(18742441938044164)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'buildJsonTitulosC();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18518463448317906)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargue Datos Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    select b.id_acto',
'      into :P250_ID_ACTO',
'      from gf_g_titulos_jdcial_dcmnto b',
'      join gf_g_ttls_jdcl_dcmnt_asccn c on b.id_ttlo_jdcial_dcmnto = c.id_ttlo_jdcial_dcmnto',
'      join gf_g_titulos_judicial f on f.id_ttlo_jdcial = c.id_ttlo_jdcial',
'      join gn_d_actos_tipo d on d.id_acto_tpo = b.id_acto_tpo',
'      join gn_d_actos_tipo_tarea e on e.id_acto_tpo = b.id_acto_tpo',
'                                   and e.id_fljo_trea = :F_ID_FLJO_TREA ',
'     where c.id_ttlo_jdcial = :P250_ID_TTLO_JDCIAL--nvl(json_value(:P250_JSON_CNSGNR, ''$.id_ttlo_jdcial''), json_value(:P250_JSON_DVLVR, ''$.id_ttlo_jdcial''))',
'       and f.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'       and rownum = 1;',
'exception ',
'    when others then',
'        :P250_ID_ACTO := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(17315676194567885)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargue de Datos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'     select idntfccion_dmnddo',
'            , id_ttlo_jdcial',
'        into :P250_IDNTFCCION_DMNDDO',
'            ,:P250_ID_TTLO_JDCIAL',
'       from v_gf_g_titulos_judicial',
'      where id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'      and rownum = 1;  ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18743129632048267)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Construir Json T\00EDtulos')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    for c_ttlos in (select id_ttlo_jdcial, ',
'                           ttlo_jdcial_estdo,',
'                           id_instncia_fljo ',
'                    from json_table(:P250_JSON_TTLOS, ''$[*]'' ',
'                                     columns (id_ttlo_jdcial            varchar2 path ''$.ID_TTLO_JDCIAL'',',
'                                              ttlo_jdcial_estdo    varchar2 path ''$.TTLO_JDCIAL_ESTDO'',',
'                                              id_instncia_fljo    varchar2 path ''$.ID_INSTNCIA_FLJO''))',
'    )loop',
'            if c_ttlos.ttlo_jdcial_estdo in (''ACN'',''CNS'',''ATJ'') then',
'                select json_arrayagg(',
'                           json_object (',
'                               ''id_ttlo_jdcial'' value id_ttlo_jdcial',
'                           )',
'                       ) as json_titulos',
'                into :P250_JSON_CNSGNR',
'                from (',
'                    /*select a.id_ttlo_jdcial from gf_g_titulos_judicial a',
'                    where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                    and a.cdgo_ttlo_jdcial_estdo in (''ACN'', ''CNS'', ''ATJ'')*/',
'                    select id_ttlo_jdcial, ',
'                           ttlo_jdcial_estdo,',
'                           id_instncia_fljo',
'                    from json_table(:P250_JSON_TTLOS, ''$[*]'' ',
'                                     columns (id_ttlo_jdcial            varchar2 path ''$.ID_TTLO_JDCIAL'',',
'                                              ttlo_jdcial_estdo    varchar2 path ''$.TTLO_JDCIAL_ESTDO'',',
'                                              id_instncia_fljo    varchar2 path ''$.ID_INSTNCIA_FLJO'')) a',
'                    where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                    and a.ttlo_jdcial_estdo in (''ACN'', ''CNS'', ''ATJ'')',
'                );',
'            elsif c_ttlos.ttlo_jdcial_estdo in (''ASL'',''SDT'',''CDT'') then',
'                select json_arrayagg(',
'                           json_object (',
'                               ''id_ttlo_jdcial'' value id_ttlo_jdcial',
'                           )',
'                       ) as json_titulos',
'                into :P250_JSON_DVLVR',
'                from (',
'                    /*select a.id_ttlo_jdcial from gf_g_titulos_judicial a',
'                    where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                    and a.cdgo_ttlo_jdcial_estdo in (''ASL'', ''SDT'', ''CDT'')*/',
'                    select id_ttlo_jdcial, ',
'                           ttlo_jdcial_estdo,',
'                           id_instncia_fljo',
'                    from json_table(:P250_JSON_TTLOS, ''$[*]'' ',
'                                     columns (id_ttlo_jdcial            varchar2 path ''$.ID_TTLO_JDCIAL'',',
'                                              ttlo_jdcial_estdo    varchar2 path ''$.TTLO_JDCIAL_ESTDO'',',
'                                              id_instncia_fljo    varchar2 path ''$.ID_INSTNCIA_FLJO'')) a',
'                    where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                    and a.ttlo_jdcial_estdo in (''ASL'', ''SDT'', ''CDT'')',
'                );',
'            end if;',
'    end loop;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
