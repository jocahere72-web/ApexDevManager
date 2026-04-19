prompt --application/pages/page_00240
begin
wwv_flow_api.create_page(
 p_id=>240
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Archivo - T\00EDtulos Judiciales')
,p_step_title=>unistr('Archivo - T\00EDtulos Judiciales')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buildJsonTitulosCargados(){',
'   ',
'    var region = apex.region(''archivoTitulos'');',
'    ',
'    if(region){',
'        var view = apex.region("archivoTitulos").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        records = records.filter(function (record) {',
'            return model.getValue(record, "ESTDO") !== "Registrado";',
'        });',
'        ',
'        var json = records.map(function (record){',
'            return {"ID_TTLO_JDCIAL_CRGDO": model.getValue(record, "ID_TTLO_JDCIAL_CRGDO"),',
'                    "NMRO_TTLO": model.getValue(record, "NMRO_TTLO"),',
'                    "FCHA_CNSTTCION": model.getValue(record, "FCHA_CNSTTCION"),',
'                    "VLOR": model.getValue(record, "VLOR"),',
'                    "IDNTFCCION_DMNDNTE": model.getValue(record, "IDNTFCCION_DMNDNTE"),',
'                    "NMBRE_DMNDNTE": model.getValue(record, "NMBRE_DMNDNTE"),',
'                    "CDGO_IDNTFCCION_TPO_DMNDO": model.getValue(record, "CDGO_IDNTFCCION_TPO_DMNDO"),',
'                    "IDNTFCCION_DMNDO": model.getValue(record, "IDNTFCCION_DMNDO"),',
'                    "NMBRE_DMNDO": model.getValue(record, "NMBRE_DMNDO"),',
'                    "NMRO_TTLO_PDRE": model.getValue(record, "NMRO_TTLO_PDRE"),',
'                    "CDGO_ENTDAD_CNSGNNTE": model.getValue(record, "CDGO_ENTDAD_CNSGNNTE"),',
'                    "VLOR_OCULTO": model.getValue(record, "VLOR_OCULTO")',
'                   };',
'        });',
'        ',
'        window.localStorage.setItem(''jsonTitulosJudicialesCargados'', JSON.stringify(json));',
'        ',
'        apex.region("archivoTitulos").widget().interactiveGrid("setSelectedRecords", records);',
'    }',
'   ',
'   ',
'}',
'',
'function buildJsonTitulosRegistrados(){',
'   ',
'    var region = apex.region(''titulosRegistrados'');',
'    ',
'    if(region){',
'        var view = apex.region("titulosRegistrados").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        records = records.filter(function (record) {',
'            return model.getValue(record, "CDGO_TTLO_JDCIAL_ESTDO") !== "APB";',
'        });',
'        ',
'        var json = records.map(function (record){',
'            return {"NMRO_TTLO_JDCIAL": model.getValue(record, "NMRO_TTLO_JDCIAL"),',
'                    "FCHA_CNSTTCION": model.getValue(record, "FCHA_CNSTTCION"),',
'                    "VLOR": model.getValue(record, "VLOR"),',
'                    "IDNTFCCION_DMNDNTE": model.getValue(record, "IDNTFCCION_DMNDNTE"),',
'                    "NMBRE_DMNDNTE": model.getValue(record, "NMBRE_DMNDNTE"),',
'                    "IDNTFCCION_DMNDO": model.getValue(record, "IDNTFCCION_DMNDO"),',
'                    "NMBRE_DMNDO": model.getValue(record, "NMBRE_DMNDO"),',
'                    "ESTDO": model.getValue(record, "ESTDO"),',
'                    "CLOR": model.getValue(record, "CLOR"),',
'                    "ID_TTLO_JDCIAL": model.getValue(record, "ID_TTLO_JDCIAL"),',
'                    "CDGO_TTLO_JDCIAL_ESTDO": model.getValue(record, "CDGO_TTLO_JDCIAL_ESTDO"),',
'                    "NMRO_TTLO_PDRE": model.getValue(record, "NMRO_TTLO_PDRE"),',
'                   };',
'        });',
'        ',
'        window.localStorage.setItem(''jsonTitulosJudicialesRegistrados'', JSON.stringify(json));',
'        ',
'        if(json.length > 0 & apex.item("P240_RQRE_APRBCCION").getValue() == "S"){',
'            $("#Btn_Aprobar").show();',
'            $("#Btn_Rechazar").show();',
'        }else{',
'             $("#Btn_Aprobar").hide();',
'            $("#Btn_Rechazar").hide();',
'        }',
'        ',
'        apex.region("titulosRegistrados").widget().interactiveGrid("setSelectedRecords", records);',
'    }',
'}',
'',
'function allTitulosCargados(e,btn,ig, data){',
'    window.localStorage.setItem(''jsonTitulosJudicialesCargados'', JSON.stringify(data));',
'}',
'',
'function allTitulosRegistrados(e,btn,ig, data){',
'    window.localStorage.setItem(''jsonTitulosJudicialesRegistrados'', JSON.stringify(data)); ',
'}',
'',
'function buildJsonTituloJudicial(){',
'   ',
'    var region = apex.region(''titulosJudiciales'');',
'    ',
'    if(region){',
'        var view = apex.region("titulosJudiciales").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        var json = records.map(function (record){',
'            return {"ID_TTLO_JDCIAL": model.getValue(record, "ID_TTLO_JDCIAL")};',
'        });',
'        ',
'        $s(''P240_JSONMEDIDACAUTELAR'', '''');',
'        $s(''P240_JSONTITULOJUDICIAL'', json.length > 0 ? JSON.stringify(json) : '''');',
'    }',
'}',
'',
'function buildJsonMedidaCautelar(){',
'   ',
'    var region = apex.region("medidaCautelar");',
'    console.log(region);',
'    if(region){',
'        var view = apex.region("medidaCautelar").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        var json = records.map(function (record){',
'            return {"ID_EMBRGOS_CRTRA": model.getValue(record, "ID_EMBRGOS_CRTRA"),',
'                    "ID_EMBRGOS_RSLCION": model.getValue(record, "ID_EMBRGOS_RSLCION"),',
'                    "CDGO_ESTDOS_CRTRA": model.getValue(record, "CDGO_ESTDOS_CRTRA")',
'                   };',
'        });',
'        $s(''P240_JSONMEDIDACAUTELAR'', json.length > 0 ? JSON.stringify(json) : '''');',
'        ',
'    }',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#Btn_Aprobar").hide();',
'$("#Btn_Rechazar").hide();'))
,p_css_file_urls=>'#IMAGE_PREFIX#css/infortributos/utilidades.css'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20230815151727'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8387736552037203)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10068079352873836)
,p_plug_name=>'Parametros'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_api.id(177331524321050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12069947518915806)
,p_plug_name=>'Nuevo'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8170335880263701)
,p_plug_name=>unistr('<b>T\00EDtulos Judiciales Cargados</b>')
,p_parent_plug_id=>wwv_flow_api.id(12069947518915806)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8170495054263702)
,p_plug_name=>'Archivo'
,p_parent_plug_id=>wwv_flow_api.id(8170335880263701)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:margin-bottom-sm'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8170698057263704)
,p_plug_name=>'<b>Registros Cargados</b>'
,p_parent_plug_id=>wwv_flow_api.id(8170335880263701)
,p_region_css_classes=>'badgeListColor3'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''T\00EDtulos Judiciales Cargados'' as label  '),
'      , count(*)  as value ',
'  from gf_g_titulos_judicial_crgdo',
' where id_prcso_crga = :P240_ID_PRCSO_CRGA'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8170889123263706)
,p_plug_name=>unistr('<b>T\00EDtulos Judiciales Padres</b>')
,p_parent_plug_id=>wwv_flow_api.id(8170335880263701)
,p_region_css_classes=>'badgeListColor7'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''T\00EDtulos Judiciales Padres'' as label  '),
'      , to_char( count(a.nmro_ttlo_pdre)  , ''FM999G999G999G999G999G999G990'') as value ',
'  from gf_g_titulos_judicial_crgdo a',
' where id_prcso_crga = :P240_ID_PRCSO_CRGA',
' and a.nmro_ttlo_pdre <> 0;'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12069808378915805)
,p_plug_name=>unistr('<b>T\00EDtulos Cargados</b>')
,p_parent_plug_id=>wwv_flow_api.id(8170335880263701)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8171324244263711)
,p_plug_name=>'Titulos Archivos'
,p_region_name=>'archivoTitulos'
,p_parent_plug_id=>wwv_flow_api.id(12069808378915805)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_ttlo_jdcial_crgdo,',
'       a.nmro_ttlo,',
'       a.fcha_cnsttcion,',
'       a.vlor,',
'       a.vlor as vlor_oculto,',
'       a.idntfccion_dmndnte,',
'       a.nmbre_dmndnte,',
'       a.cdgo_idntfccion_tpo_dmndo,',
'       a.idntfccion_dmndo,',
'       a.nmbre_dmndo,',
'       a.nmro_ttlo_pdre,',
'       a.cdgo_entdad_cnsgnnte,',
'       case',
'           when a.cdgo_ttlo_jdcial_crgdo_estdo = ''RGS'' THEN ''Registrado'' ',
'           else ''Cargado''',
'       end as estdo',
'       --b.nmbre_bnco',
'from gf_g_titulos_judicial_crgdo a',
'--join df_c_bancos          b on b.cdgo_bnco = a.cdgo_entdad_cnsgnnte',
'where a.id_prcso_crga = :P240_ID_PRCSO_CRGA;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(8193606928581504)
,p_name=>'NMRO_TTLO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('T\00EDtulo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(8193763219581505)
,p_name=>'FCHA_CNSTTCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_CNSTTCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(8193836340581506)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(8193936844581507)
,p_name=>'IDNTFCCION_DMNDNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_DMNDNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n <br> Demandante')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(8194084986581508)
,p_name=>'NMBRE_DMNDNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DMNDNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre <br> Demandante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>200
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
 p_id=>wwv_flow_api.id(8194181612581509)
,p_name=>'CDGO_IDNTFCCION_TPO_DMNDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_IDNTFCCION_TPO_DMNDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo <br> Documento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>5
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
 p_id=>wwv_flow_api.id(8194241385581510)
,p_name=>'IDNTFCCION_DMNDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_DMNDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n <br> Demandado')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(8194328283581511)
,p_name=>'NMBRE_DMNDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DMNDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre <br> Demandado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>200
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
 p_id=>wwv_flow_api.id(8194428624581512)
,p_name=>'NMRO_TTLO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_PDRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('T\00EDtulo Padre')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(8218819939661702)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(9506056369312601)
,p_name=>'ID_TTLO_JDCIAL_CRGDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_CRGDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
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
 p_id=>wwv_flow_api.id(9537593057785602)
,p_name=>'CDGO_ENTDAD_CNSGNNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ENTDAD_CNSGNNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(12569924686878701)
,p_name=>'VLOR_OCULTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_OCULTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12570136519878703)
,p_name=>'ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(8193480460581502)
,p_internal_uid=>8193480460581502
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'config.initialSelection = false;',
'  window.localStorage.removeItem(''jsonTitulosJudicialesCargados'');',
'   return selectAll(config, {',
'       name: ''Seleccionar Todos'',',
'       action: allTitulosCargados',
'   }) ;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(8202940701609027)
,p_interactive_grid_id=>wwv_flow_api.id(8193480460581502)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(8203088006609028)
,p_report_id=>wwv_flow_api.id(8202940701609027)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8204056447609036)
,p_view_id=>wwv_flow_api.id(8203088006609028)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(8193606928581504)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>119
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8204540805609040)
,p_view_id=>wwv_flow_api.id(8203088006609028)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(8193763219581505)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>91
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8205039859609041)
,p_view_id=>wwv_flow_api.id(8203088006609028)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(8193836340581506)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>104
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8205564203609043)
,p_view_id=>wwv_flow_api.id(8203088006609028)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(8193936844581507)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>103
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8206090668609044)
,p_view_id=>wwv_flow_api.id(8203088006609028)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(8194084986581508)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>145
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8206563341609046)
,p_view_id=>wwv_flow_api.id(8203088006609028)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(8194181612581509)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>86
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8207033203609047)
,p_view_id=>wwv_flow_api.id(8203088006609028)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(8194241385581510)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>104
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8207511867609048)
,p_view_id=>wwv_flow_api.id(8203088006609028)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(8194328283581511)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>293
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8208093167609050)
,p_view_id=>wwv_flow_api.id(8203088006609028)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(8194428624581512)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9512060244312741)
,p_view_id=>wwv_flow_api.id(8203088006609028)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(9506056369312601)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>60
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9547555911888949)
,p_view_id=>wwv_flow_api.id(8203088006609028)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(9537593057785602)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12575913725879679)
,p_view_id=>wwv_flow_api.id(8203088006609028)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(12569924686878701)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12598224001357978)
,p_view_id=>wwv_flow_api.id(8203088006609028)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(12570136519878703)
,p_is_visible=>false
,p_is_frozen=>false
,p_break_order=>5
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85294977498688211)
,p_plug_name=>unistr('<b>Valor Total T\00EDtulos Judiciales</b>')
,p_parent_plug_id=>wwv_flow_api.id(8170335880263701)
,p_region_css_classes=>'badgeListColor4'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select  ''Valor Total T\00EDtulos Judiciales'' as label,'),
'        to_char( nvl(sum(a.vlor), 0) , ''FM$999G999G999G999G999G999G990'' ) as value',
'from gf_g_titulos_judicial_crgdo a',
'where a.id_prcso_crga = :P240_ID_PRCSO_CRGA;'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10064517874873801)
,p_plug_name=>unistr('<b>T\00EDtulos Judiciales Registrados</b>')
,p_parent_plug_id=>wwv_flow_api.id(12069947518915806)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmro_ttlo_jdcial',
'from gf_g_titulos_judicial          a',
'join gf_g_titulos_judicial_crgdo    b on a.nmro_ttlo_jdcial = b.nmro_ttlo',
'join gf_d_titulos_judicial_estdo    c on a.cdgo_ttlo_jdcial_estdo = c.cdgo_ttlo_jdcial_estdo',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.cdgo_ttlo_jdcial_estdo = ''RGS''',
'or a.cdgo_ttlo_jdcial_estdo = ''APB'';'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10064685984873802)
,p_plug_name=>unistr('T\00EDtulos Registrados')
,p_region_name=>'titulosRegistrados'
,p_parent_plug_id=>wwv_flow_api.id(10064517874873801)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_ttlo_jdcial,',
'        a.nmro_ttlo_jdcial,',
'        a.fcha_cnsttcion,',
'        a.vlor,',
'        a.idntfccion_dmndnte,',
'        a.cdgo_ttlo_jdcial_estdo,',
'        c.nmbre_dmndnte,',
'        c.idntfccion_dmndo,',
'        c.nmbre_dmndo,',
'        nvl(a.nmro_ttlo_pdre, 0) as nmro_ttlo_pdre,',
'        b.dscrpcion as estdo,',
'        b.clor',
'from gf_g_titulos_judicial a',
'join gf_d_titulos_judicial_estdo b on a.cdgo_ttlo_jdcial_estdo = b.cdgo_ttlo_jdcial_estdo ',
'join gf_g_titulos_judicial_crgdo c on a.nmro_ttlo_jdcial = c.nmro_ttlo',
'where a.cdgo_ttlo_jdcial_estdo = ''RGS'' ',
'or a.cdgo_ttlo_jdcial_estdo = ''APB'' ;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10065012752873806)
,p_name=>'FCHA_CNSTTCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_CNSTTCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(10065199576873807)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(10065298452873808)
,p_name=>'IDNTFCCION_DMNDNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_DMNDNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n <br> Demandante')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>100
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10065300935873809)
,p_name=>'NMBRE_DMNDNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DMNDNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre <br> Demandante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>200
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
 p_id=>wwv_flow_api.id(10065425088873810)
,p_name=>'IDNTFCCION_DMNDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_DMNDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n <br> Demandado')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(10065515872873811)
,p_name=>'NMBRE_DMNDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DMNDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre <br> Demandado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>200
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
 p_id=>wwv_flow_api.id(10065860203873814)
,p_name=>'CLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLOR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attribute_01=>'N'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10066080435873816)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10066268459873818)
,p_name=>'ID_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attribute_01=>'N'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12376539802038402)
,p_name=>'NMRO_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_JDCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('T\00EDtulo Judicial')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(12570431330878706)
,p_name=>'ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estdo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(12570551968878707)
,p_name=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attribute_01=>'N'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12985353015439001)
,p_name=>'NMRO_TTLO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_PDRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('T\00EDtulo Judicial <br> Padre')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(10064817733873804)
,p_internal_uid=>10064817733873804
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'config.initialSelection = false;',
'  window.localStorage.removeItem(''jsonTitulosJudicialesRegistrados'');',
'   return selectAll(config, {',
'       name: ''Todos'',',
'       action: allTitulosRegistrados',
'   }) ;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(10073634531984241)
,p_interactive_grid_id=>wwv_flow_api.id(10064817733873804)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(10073756336984241)
,p_report_id=>wwv_flow_api.id(10073634531984241)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(142414894602116)
,p_view_id=>wwv_flow_api.id(10073756336984241)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(10066268459873818)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10074798178984246)
,p_view_id=>wwv_flow_api.id(10073756336984241)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(10065012752873806)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10075281985984248)
,p_view_id=>wwv_flow_api.id(10073756336984241)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(10065199576873807)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10075750003984251)
,p_view_id=>wwv_flow_api.id(10073756336984241)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(10065298452873808)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10076283696984252)
,p_view_id=>wwv_flow_api.id(10073756336984241)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(10065300935873809)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10076717594984253)
,p_view_id=>wwv_flow_api.id(10073756336984241)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(10065425088873810)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10077216691984255)
,p_view_id=>wwv_flow_api.id(10073756336984241)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(10065515872873811)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10081096434124219)
,p_view_id=>wwv_flow_api.id(10073756336984241)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(10065860203873814)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12396887824063313)
,p_view_id=>wwv_flow_api.id(10073756336984241)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(12376539802038402)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12721388766236325)
,p_view_id=>wwv_flow_api.id(10073756336984241)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(12570431330878706)
,p_is_visible=>false
,p_is_frozen=>false
,p_break_order=>5
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12723051516252180)
,p_view_id=>wwv_flow_api.id(10073756336984241)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(12570551968878707)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12991593167439601)
,p_view_id=>wwv_flow_api.id(10073756336984241)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(12985353015439001)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>144
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12070384197915810)
,p_plug_name=>unistr('<b>An\00E1lisis</b>')
,p_parent_plug_id=>wwv_flow_api.id(12069947518915806)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmro_ttlo_jdcial',
'from gf_g_titulos_judicial          a',
'join gf_g_titulos_judicial_crgdo    b on a.nmro_ttlo_jdcial = b.nmro_ttlo',
'join gf_d_titulos_judicial_estdo    c on a.cdgo_ttlo_jdcial_estdo = c.cdgo_ttlo_jdcial_estdo',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.cdgo_ttlo_jdcial_estdo = ''RGS''',
'or a.cdgo_ttlo_jdcial_estdo = ''APB'';'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12070498668915811)
,p_plug_name=>'nuevo'
,p_parent_plug_id=>wwv_flow_api.id(12070384197915810)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12072382091915830)
,p_plug_name=>'Medida Cautelar'
,p_parent_plug_id=>wwv_flow_api.id(12070498668915811)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12070720822915814)
,p_plug_name=>'Medidas Cautelar'
,p_region_name=>'medidaCautelar'
,p_parent_plug_id=>wwv_flow_api.id(12072382091915830)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  b.id_embrgos_crtra,',
'        b.id_embrgos_rslcion,',
'        b.nmro_acto,',
'        b.fcha_acto,',
'        b.cdgo_estdos_crtra,',
'        b.dscrpcion_estado_crtra,',
'        b.idntfccion,',
'        b.vgncias,',
'        b.vlor_embrgo,',
'        b.impuesto,',
'        b.idntfccion_rspnsble,',
'        b.nmbre_rspnsble',
'from gf_g_titulos_judicial              a ',
'left join v_gf_g_ttlos_mc_g_embrgs_res b on a.idntfccion_dmnddo = b.idntfccion_rspnsble',
'where  a.id_embrgo_rslcion is null   ',
'--and    b.fcha_acto <= a.fcha_cnsttcion ',
'group by    b.id_embrgos_crtra,',
'            b.id_embrgos_rslcion,',
'            b.nmro_acto,',
'            b.fcha_acto,',
'            b.cdgo_estdos_crtra,',
'            b.dscrpcion_estado_crtra,',
'            b.idntfccion,',
'            b.vgncias,',
'            b.vlor_embrgo,',
'            b.impuesto,',
'            b.idntfccion_rspnsble,',
'            b.nmbre_rspnsble;'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(23363927383680330)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12070966544915816)
,p_name=>'ID_EMBRGOS_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_CRTRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'N'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12071025824915817)
,p_name=>'ID_EMBRGOS_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RSLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'N'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12071168762915818)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Nmro Acto'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>30
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
 p_id=>wwv_flow_api.id(12071286169915819)
,p_name=>'FCHA_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ACTO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fcha Acto'
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
 p_id=>wwv_flow_api.id(12071324730915820)
,p_name=>'CDGO_ESTDOS_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ESTDOS_CRTRA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'N'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12071448107915821)
,p_name=>'DSCRPCION_ESTADO_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ESTADO_CRTRA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Dscrpcion Estado Crtra'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(12071542941915822)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Idntfccion'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>25
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
 p_id=>wwv_flow_api.id(12071696124915823)
,p_name=>'VGNCIAS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIAS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Vgncias'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(12071765245915824)
,p_name=>'VLOR_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_EMBRGO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vlor Embrgo'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(12071801105915825)
,p_name=>'IMPUESTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMPUESTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Impuesto'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(12071969567915826)
,p_name=>'IDNTFCCION_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_RSPNSBLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(23365803381680348)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12072034532915827)
,p_name=>'NMBRE_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RSPNSBLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nmbre Rspnsble'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>403
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
 p_id=>wwv_flow_api.id(12073171646915838)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(12070889663915815)
,p_internal_uid=>12070889663915815
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
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
 p_id=>wwv_flow_api.id(12209338860259796)
,p_interactive_grid_id=>wwv_flow_api.id(12070889663915815)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(12209493957259796)
,p_report_id=>wwv_flow_api.id(12209338860259796)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12209945044259797)
,p_view_id=>wwv_flow_api.id(12209493957259796)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(12070966544915816)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12210483316259800)
,p_view_id=>wwv_flow_api.id(12209493957259796)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(12071025824915817)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12210928287259802)
,p_view_id=>wwv_flow_api.id(12209493957259796)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(12071168762915818)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12211475795259803)
,p_view_id=>wwv_flow_api.id(12209493957259796)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(12071286169915819)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12211918366259805)
,p_view_id=>wwv_flow_api.id(12209493957259796)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(12071324730915820)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12212429775259807)
,p_view_id=>wwv_flow_api.id(12209493957259796)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(12071448107915821)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12212982077259808)
,p_view_id=>wwv_flow_api.id(12209493957259796)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(12071542941915822)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12213494748259810)
,p_view_id=>wwv_flow_api.id(12209493957259796)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(12071696124915823)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12213969373259811)
,p_view_id=>wwv_flow_api.id(12209493957259796)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(12071765245915824)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12214461398259813)
,p_view_id=>wwv_flow_api.id(12209493957259796)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(12071801105915825)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12214927745259814)
,p_view_id=>wwv_flow_api.id(12209493957259796)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(12071969567915826)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12215470606259816)
,p_view_id=>wwv_flow_api.id(12209493957259796)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(12072034532915827)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(31919280423683296)
,p_plug_name=>'Tipo de Solicitud'
,p_region_name=>'medida'
,p_parent_plug_id=>wwv_flow_api.id(12072382091915830)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:margin-bottom-sm'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(23363927383680330)
,p_plug_name=>unistr('T\00EDtulos Judiciales')
,p_region_name=>'titulosJudiciales'
,p_parent_plug_id=>wwv_flow_api.id(12070498668915811)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_ttlo_jdcial,',
'        a.nmro_ttlo_jdcial,',
'        a.fcha_cnsttcion,',
'        a.vlor,',
'        b.idntfccion_dmndo,',
'        b.nmbre_dmndo,',
'        a.nmro_ttlo_pdre',
'from gf_g_titulos_judicial a ',
'join gf_g_titulos_judicial_crgdo b on a.nmro_ttlo_jdcial= b.nmro_ttlo',
'join gf_d_titulos_judicial_estdo c on a.cdgo_ttlo_jdcial_estdo = c.Cdgo_Ttlo_Jdcial_Estdo',
'where a.cdgo_ttlo_jdcial_estdo = ''APB'' ',
'and   a.id_embrgo_rslcion is null;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12376419748038401)
,p_name=>'NMRO_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_JDCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nmro Ttlo Jdcial'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>170
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(23365145876680342)
,p_name=>'FCHA_CNSTTCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_CNSTTCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha de Constituci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(23365257412680343)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor del T\00EDtulo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(23365803381680348)
,p_name=>'IDNTFCCION_DMNDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_DMNDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n Demandado')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(23365886189680349)
,p_name=>'NMBRE_DMNDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DMNDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Demandado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>200
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(23367136267680362)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(23444533116369728)
,p_name=>'NMRO_TTLO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_PDRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('N\00FAmero T\00EDtulo Padre')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(23447057484369753)
,p_name=>'ID_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Ttlo Jdcial'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>160
,p_value_alignment=>'RIGHT'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(23364533922680336)
,p_internal_uid=>23364533922680336
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
 p_id=>wwv_flow_api.id(23388587263862946)
,p_interactive_grid_id=>wwv_flow_api.id(23364533922680336)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(23388628319862946)
,p_report_id=>wwv_flow_api.id(23388587263862946)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12194267907332546)
,p_view_id=>wwv_flow_api.id(23388628319862946)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(23447057484369753)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12206709796526825)
,p_view_id=>wwv_flow_api.id(23388628319862946)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(23444533116369728)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>201
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12382423338038792)
,p_view_id=>wwv_flow_api.id(23388628319862946)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(12376419748038401)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>280
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23391626059862960)
,p_view_id=>wwv_flow_api.id(23388628319862946)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(23365145876680342)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>280
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23392109013862961)
,p_view_id=>wwv_flow_api.id(23388628319862946)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(23365257412680343)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>284
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23394675603862969)
,p_view_id=>wwv_flow_api.id(23388628319862946)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(23365803381680348)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>179
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23395146405862970)
,p_view_id=>wwv_flow_api.id(23388628319862946)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(23365886189680349)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>366
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(263976881223742196)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center; padding: 10px 0 px 0px 10px;">',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </i>',
'        </b>',
'    </div>',
'</h5>',
'',
'Funcionalidad que permite: <br><br>',
'',
unistr('<b><i>1.</i></b>Registrar los T\00EDtulos Judiciales que se van a procesar.<br><br>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8387837518037204)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(8387736552037203)
,p_button_name=>'BTN_RGSTRAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10066574427873821)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(8387736552037203)
,p_button_name=>'Btn_Aprobar'
,p_button_static_id=>'Btn_Aprobar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>'Aprobar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:256:&SESSION.:R:&DEBUG.:RP,256:P256_INDCDOR_MTVO:A'
,p_button_condition=>'P240_RQRE_APRBCCION'
,p_button_condition2=>'S'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10066682898873822)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(8387736552037203)
,p_button_name=>'Btn_Rechazar'
,p_button_static_id=>'Btn_Rechazar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>'Rechazar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:256:&SESSION.::&DEBUG.:RP,256:P256_INDCDOR_MTVO:R'
,p_button_condition=>'P240_RQRE_APRBCCION'
,p_button_condition2=>'S'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(11180359439448801)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(8387736552037203)
,p_button_name=>'Nuevo'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>'Nuevo'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:258:&SESSION.::&DEBUG.:RP,258::'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12216583370281520)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(31919280423683296)
,p_button_name=>'BTN_GUARDAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8170587559263703)
,p_name=>'P240_ID_PRCSO_CRGA'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(8170495054263702)
,p_prompt=>'Archivo'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select file_name || ''  |  '' || to_char( fcha_rgstro , ''DD/MM/YYYY HH:MI:SS AM'' )  || ''  |  '' || nmbre_trcro as d',
'       , id_prcso_crga as r',
'    from v_et_g_procesos_carga a ',
'   where cdgo_clnte        = :F_CDGO_CLNTE',
'     and ( indcdor_prcsdo = ''N'' or :P240_ID_PRCSO_CRGA is not null )',
'     and id_prcso_crga  in (',
'                                  select id_prcso_crga ',
'                                    from gf_g_titulos_judicial_crgdo ',
'                                group by id_prcso_crga',
'                            )'))
,p_lov_display_null=>'YES'
,p_cSize=>100
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9537439684785601)
,p_name=>'P240_ID_TTLO_JDCIAL_AREA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(8170495054263702)
,p_prompt=>'Secretaria'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_area d,',
'       a.id_ttlo_jdcial_area r    ',
'from gf_d_titulos_judicial_area a',
'join df_c_areas b on A.ID_AREA = b.ID_AREA',
'where b.cdgo_clnte = :F_CDGO_CLNTE;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'500'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10068107411873837)
,p_name=>'P240_RQRE_APRBCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(10068079352873836)
,p_prompt=>'rqre_aprbccion'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12072401040915831)
,p_name=>'P240_JSONMEDIDACAUTELAR'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(10068079352873836)
,p_prompt=>'JSONMEDIDACAUTELAR'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12072576052915832)
,p_name=>'P240_JSONTITULOJUDICIAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(10068079352873836)
,p_prompt=>'JSONTITULOJUDICIAL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12216986368281520)
,p_name=>'P240_CDGO_TTLO_JDCIAL_SLCTUD_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(31919280423683296)
,p_prompt=>'Tipo de Solicitud'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion as d,',
'        a.cdgo_ttlo_jdcial_slctud_tpo as r',
'from gf_d_ttlos_jdcial_slctud_tp a',
'where a.cdgo_clnte = :F_CDGO_CLNTE;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'500'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8171161246263709)
,p_name=>'Al cambiar el archivo'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P240_ID_PRCSO_CRGA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8171207858263710)
,p_event_id=>wwv_flow_api.id(8171161246263709)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8387981795037205)
,p_name=>'Al seleccionar titulo'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(8171324244263711)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8388034370037206)
,p_event_id=>wwv_flow_api.id(8387981795037205)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'buildJsonTitulosCargados();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8508303427919003)
,p_name=>unistr('Registrar T\00EDtulos')
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8387837518037204)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8508410192919004)
,p_event_id=>wwv_flow_api.id(8508303427919003)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function fnc_registrarTitulos(){',
'    try{',
'        if(JSON.parse(window.localStorage.jsonTitulosJudicialesCargados).length === 0){',
'            apex.message.clearErrors();',
'            apex.message.showErrors ([',
'                {',
'                    type:       "error",',
'                    location:   "page",',
unistr('                    message:    "Seleccione los T\00EDtulos Judiciales",'),
'                    unsafe:     false',
'                }',
'            ]);',
'        }else{',
'            ',
'            var json = window.localStorage.jsonTitulosJudicialesCargados;',
'',
'            apex.server.process("ajaxRegistrarTitulos",{',
'            f01: json, ',
'            pageItems: "#P240_ID_PRCSO_CRGA, #P240_ID_TTLO_JDCIAL_AREA, #P240_RQRE_APRBCCION"',
'                ',
'            },{',
'                success: function(data){',
'                    if(data.o_cdgo_rspsta != 0){',
'                        apex.message.clearErrors();',
'                        apex.message.showErrors ([',
'                            {',
'                                type:       "error",',
'                                location:   "page",',
'                                message:    data.o_mnsje_rspsta,',
'                                unsafe:     false',
'                            }',
'                        ]);',
'                    }else{',
unistr('                        apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                        apex.submit();',
'                    }',
'                }',
'            })',
'        }',
'    }catch(e){',
'        console.log(e);',
'    }',
'}',
'',
unistr('apex.message.confirm( "Est\00E1 seguro de registrar los T\00EDtulos Judiciales?", function(okPressed) {'),
'    if(okPressed) {',
'       fnc_registrarTitulos();',
'    }',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(10066383108873819)
,p_name=>'Al seleccionar titulo registrado'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(10064685984873802)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10066439032873820)
,p_event_id=>wwv_flow_api.id(10066383108873819)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'buildJsonTitulosRegistrados();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12072607772915833)
,p_name=>'Al hacer clic Medida'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(12070720822915814)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12072726369915834)
,p_event_id=>wwv_flow_api.id(12072607772915833)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'buildJsonMedidaCautelar();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12072889953915835)
,p_name=>unistr('Al hacer clic T\00EDtulo')
,p_event_sequence=>60
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(23363927383680330)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12072959478915836)
,p_event_id=>wwv_flow_api.id(12072889953915835)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'buildJsonTituloJudicial();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12073369892915840)
,p_name=>unistr('Guardar An\00E1lisis')
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(12216583370281520)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12073440761915841)
,p_event_id=>wwv_flow_api.id(12073369892915840)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function fnc_guardarAnalisis(){',
'    try{',
'        ',
'        apex.server.process("ajaxGuardarAnalisis", {',
'            pageItems: "#P240_JSONMEDIDACAUTELAR, #P240_JSONTITULOJUDICIAL, #P240_CDGO_TTLO_JDCIAL_SLCTUD_TPO"',
'            ',
'        },{',
'            success: function(data){',
'                if(data.o_cdgo_rspsta != 0){',
'                     apex.message.clearErrors();',
'                        apex.message.showErrors ([',
'                            {',
'                                type:       "error",',
'                                location:   "page",',
'                                message:    data.o_mnsje_rspsta,',
'                                unsafe:     false',
'                            }',
'                        ]);',
'                }else{',
unistr('                    apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                    apex.submit();',
'                }',
'            }',
'            ',
'        })',
'        ',
'    }catch(e){',
'        console.log(e);',
'    }',
'}',
'',
unistr('apex.message.confirm( "Est\00E1 seguro de guardar el an\00E1lisis?", function(okPressed) {'),
'    if(okPressed) {',
'       fnc_guardarAnalisis();',
'    }',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10067944494873835)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Nuevo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'select b.indcdor_rqre_aprbccion',
'into :P240_RQRE_APRBCCION',
'from gf_g_titulos_judicial       a',
'join gf_d_titulos_jdcial_cnfgrcn b on a.cdgo_ttlo_jdcial_estdo = b.cdgo_ttlo_jdcial_estdo',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'group by b.indcdor_rqre_aprbccion;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8508510858919005)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajaxRegistrarTitulos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_dcmnto clob;',
'     v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(3000);',
'begin',
'',
'    if(:P240_ID_TTLO_JDCIAL_AREA is null) then ',
'        v_cdgo_rspsta := 1;',
'        v_mnsje_rspsta := ''Seleccione la Secretaria'';',
'    else',
'        for i in 1..apex_application.g_f01.count loop',
'        v_dcmnto := v_dcmnto || apex_application.g_f01(i);',
'        end loop;',
'        ',
'        pkg_gf_titulos_judicial.prc_rg_titulos_judicial(p_cdgo_clnte              =>  :F_CDGO_CLNTE,',
'                                                        p_id_usrio                =>  :F_ID_USRIO,',
'                                                        p_json_ttlos              =>  v_dcmnto,',
'                                                        p_id_prcso_crga           =>  :P240_ID_PRCSO_CRGA,',
'                                                        p_id_ttlo_jdcial_area     =>  :P240_ID_TTLO_JDCIAL_AREA,',
'                                                        p_indcdor_rqre_aprbccion  =>  :P240_RQRE_APRBCCION,',
'                                                        o_cdgo_rspsta             =>  v_cdgo_rspsta,',
'                                                        o_mnsje_rspsta            =>  v_mnsje_rspsta);',
'    end if;',
'',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12073503595915842)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajaxGuardarAnalisis'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(3000);',
'begin',
'',
'    if(:P240_CDGO_TTLO_JDCIAL_SLCTUD_TPO is null) then ',
'        v_cdgo_rspsta := 1;',
'        v_mnsje_rspsta := ''Seleccione el tipo de solicitud'';',
'    elsif(:P240_JSONMEDIDACAUTELAR is null) then',
'        v_cdgo_rspsta := 2;',
'        v_mnsje_rspsta := ''Seleccione la Medida Cautelar'';',
'    else',
'        pkg_gf_titulos_judicial.prc_rg_titulo_judicial_analisi(p_cdgo_clnte                    =>    :F_CDGO_CLNTE,',
'                                                               p_id_usrio                      =>    :F_ID_USRIO,',
'                                                               p_json_ttlo_jdcial              =>    :P240_JSONTITULOJUDICIAL,',
'                                                               p_json_embrgos_rslcion          =>    :P240_JSONMEDIDACAUTELAR,',
'                                                               p_cdgo_ttlo_jdcial_slctud_tpo   =>    :P240_CDGO_TTLO_JDCIAL_SLCTUD_TPO,',
'                                                               o_cdgo_rspsta                   =>    v_cdgo_rspsta,',
'                                                               o_mnsje_rspsta                  =>    v_mnsje_rspsta',
'                                                              );',
'    end if;',
'                ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
