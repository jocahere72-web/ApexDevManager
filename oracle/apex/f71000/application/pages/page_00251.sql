prompt --application/pages/page_00251
begin
wwv_flow_api.create_page(
 p_id=>251
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Registro de T\00EDtulo Judicial')
,p_step_title=>unistr('Registro de T\00EDtulo Judicial')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buildJsonTitulos() {',
'    ',
'    console.log(''Iniciando buildJsonTitulos'');',
'    ',
'    var region = apex.region(''titulos'');',
'    ',
'    if(region) {',
'        ',
'        var view = apex.region("titulos").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;        ',
'        var records = view.view$.grid("getSelectedRecords");',
'                ',
'        var jsonTitulos = records.map((titulos) => {',
'            return {"ID_TTLO_JDCIAL" : model.getValue(titulos, "ID_TTLO_JDCIAL"),',
'                    "ACCION" : model.getValue(titulos, "ACCION"),',
'                    "IDNTFCCION_DMNDDO" : model.getValue(titulos, "IDNTFCCION_DMNDDO")',
'                   }; ',
'        });',
'        $s(''P251_JSON'', JSON.stringify(jsonTitulos));',
'        console.log(''json_TITULOS: ''+JSON.stringify(jsonTitulos));',
'    }    ',
'    ',
'}',
'',
'function buildJsonTitulos2() {',
'    ',
'    var region = apex.region(''titulos'');',
'    ',
'    if(region){',
'        ',
'        var view = apex.region("titulos").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;        ',
'        ',
'        /*var filtro = model._data.filter(function(record) {',
'            var action = model.getValue(record, "ACCION");',
'            return action !== null && action !== undefined && action.toString().trim() !== "";',
'        });*/',
'        ',
'        var filtroRecords = model._data.filter(function(record) {',
'            return model.getValue(record, "ACCION.v") !== "";',
'        });',
'        ',
'        var jsonFiltro = filtroRecords.map(function(record) {',
'            return {',
'                    "ID_TTLO_JDCIAL": model.getValue(record, "ID_TTLO_JDCIAL"),',
'                    "ACCION": model.getValue(record, "ACCION"),',
'                    "IDNTFCCION_DMNDDO": model.getValue(record, "IDNTFCCION_DMNDDO")',
'            };',
'       });',
'        ',
'       var jsonString = JSON.stringify(jsonFiltro);        ',
'        $s(''P251_JSON'', JSON.stringify(jsonFiltro));',
'        ',
'        console.log(''json_TITULOS: ''+JSON.stringify(jsonFiltro));',
'        ',
'        if (Object.keys(jsonFiltro).length > 0){',
'            apex.item("P251_INDCDOR_TRSLDO").setValue("S");',
'        }',
'      }',
'}',
'',
'function fnc_jsonSeleccion(accion) {',
'    //console.log(''entrando a fnc_jsonSeleccion con accion ''+accion);',
'    var region = apex.region(''titulosSeleccion'');',
'    ',
'    if (region) {',
'        ',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'',
'        var jsonTitulos = records.map((record) => {',
'            return {',
'                "ID_TTLO_JDCIAL": model.getValue(record, "ID_TTLO_JDCIAL"),',
'                "ACCION": accion,',
'                "IDNTFCCION_DMNDDO": model.getValue(record, "IDNTFCCION_DMNDDO")',
'            };',
'        });',
'',
'        var json = JSON.stringify(jsonTitulos);',
'        $s(''P251_JSON'', JSON.stringify(jsonTitulos));',
'        console.log(''Jason titulos: ''+json);',
'        ',
'      //  console.log(''funcion isEmptyObject: ''+isEmptyObject(jsonTitulos));',
'        ',
'        if (isEmptyObject(jsonTitulos)){',
'           // console.log(''Esta vacio'');',
'            return ''N'';',
'        }else{',
'          //  console.log(''Esta lleno'');',
'            return ''S'';',
'        }',
'   ',
'    }',
'}',
'',
'function isEmptyObject(obj) {',
'    return Object.entries(obj).length === 0;',
'}',
'',
'function mostrarValor() {',
'  ',
'   // var valor = apex.item("P251_ID_EMBRGOS_RSLCION").getValue();',
'    var p251_cnsctvo_embrgo = apex.item("P251_CNSCTVO_EMBRGO").getValue();',
'    console.log("item P251_CNSCTVO_EMBRGO: " + p251_cnsctvo_embrgo);',
'  //  console.log("item id_embrgos_rslcion: " + valor);',
'    ',
'    try {       ',
'                ',
'        apex.server.process("buscarEmbargo", {',
'            pageItems: "#P251_CNSCTVO_EMBRGO"',
'        }, {',
'            success: function (data) {',
'                ',
'                if (data.o_cdgo_rspsta != 0) {',
'                    console.log(''RESPUESTA: '' + data.o_cdgo_rspsta);',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors([',
'                        {',
'                            type: "error",',
'                            location: "page",',
'                            message: data.o_mnsje_rspsta,',
'                            unsafe: false',
'                        }',
'                    ]);',
'                } else {',
'                    apex.item("P251_ID_EMBRGOS_RSLCION").setValue(data.o_id_embrgos_rslcion);',
'                    console.log("Valor item: " + apex.item("P251_ID_EMBRGOS_RSLCION").getValue());',
'                }',
'            }',
'        })',
'    } catch (e) {',
'        console.log(e);',
'    }',
'}',
'',
'function jsonSeleccion() {',
'',
'    var region = apex.region(''titulosSeleccion'');',
'',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'',
'        var jsonTitulos = records.map((record) => {',
'            return {',
'                "ID_TTLO_JDCIAL": model.getValue(record, "ID_TTLO_JDCIAL")',
'            };',
'        });',
'',
'        var json = JSON.stringify(jsonTitulos);',
'        $s(''P251_JSON_ASEMRGO'', JSON.stringify(jsonTitulos));        ',
'        console.log(''Jason titulos: '' + json);',
'',
'        if (isEmptyObject(jsonTitulos)) {',
'            return ''N'';',
'        } else {',
'            return ''S'';',
'        }',
'',
'    }',
'}',
'',
'function validarItems(){',
'    ',
'    var dato = apex.item("P251_CNSCTVO_EMBRGO").getValue();',
'    console.log("valor item : "+dato);',
'        ',
'    if (dato === "" || dato === null){',
'         apex.message.clearErrors();',
'         apex.message.showErrors([{',
'            type: "error",',
'            location: "page",',
unistr('            message: "El consecutivo de embargo no puede estar vac\00EDo.",'),
'            unsafe: false',
'        }]);        ',
'        return ''N'';',
'    } else {',
'        return ''S'';',
'    }',
'}',
''))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'ACARABALLO'
,p_last_upd_yyyymmddhh24miss=>'20250902145825'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10091968807212003)
,p_plug_name=>unistr('<b>Proceso Puntual T\00EDtulo Judicial </b>')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_api.id(16845466283207101)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda </b>')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NOT_EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1  ',
'from wf_g_instancias_transicion ',
'where id_instncia_fljo = :F_ID_INSTNCIA_FLJO ',
'and id_fljo_trea_orgen = 204',
'and id_estdo_trnscion = 3'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19043939083849633)
,p_plug_name=>unistr('<b>T\00EDtulos Registrados Funcionario</b>')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   a.id_ttlo_jdcial',
'        ,a.cdgo_clnte',
'        ,a.id_ttlo_jdcial_crgdo',
'        ,a.nmro_ttlo_jdcial',
'        ,a.fcha_cnsttcion',
'        ,a.vlor',
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
'join gf_d_titulos_judicial_estdo f on f.cdgo_ttlo_jdcial_estdo = a.cdgo_ttlo_jdcial_estdo',
'where a.id_fncnrio = :P251_FNCNRIO',
'and a.cdgo_ttlo_jdcial_estdo = ''RGS''',
'and a.id_instncia_fljo is null',
';'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(19044266314849636)
,p_name=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Estado<br>T\00EDtulo Judicial')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
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
 p_id=>wwv_flow_api.id(19044343594849637)
,p_name=>'ID_EMBRGO_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGO_RSLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(19044429402849638)
,p_name=>'ID_INSTNCIA_FLJO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO_PDRE'
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
 p_id=>wwv_flow_api.id(19044570763849639)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
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
 p_id=>wwv_flow_api.id(19044641757849640)
,p_name=>'ID_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTUD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Id Solicitud<br>PQR'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(19044734168849641)
,p_name=>'CDGO_ENTDAD_RCDDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ENTDAD_RCDDR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Entidad<br>Recaudadora'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(19044889043849642)
,p_name=>'ID_BNCO_RCDDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_BNCO_RCDDR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(19045050794849644)
,p_name=>'CDGO_IDNTFCCION_TPO_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_IDNTFCCION_TPO_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Tipo<br>Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(19045137719849645)
,p_name=>'CNSCTVO_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNSCTVO_EMBRGO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Consecutivo<br>Embargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(19045351970849647)
,p_name=>'NMRO_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_JDCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('N\00FAmero T\00EDtulo<br>Judicial')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(19045432796849648)
,p_name=>'ID_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(19045544565849649)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
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
 p_id=>wwv_flow_api.id(19045694625849650)
,p_name=>'ID_TTLO_JDCIAL_CRGDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_CRGDO'
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
 p_id=>wwv_flow_api.id(19065573880598201)
,p_name=>'FCHA_CNSTTCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_CNSTTCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Fecha<br>Constituci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
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
 p_id=>wwv_flow_api.id(19065633580598202)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Valor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
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
 p_id=>wwv_flow_api.id(19065784019598203)
,p_name=>'ID_TTLO_JDCIAL_AREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_AREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('\00C1rea')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
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
 p_id=>wwv_flow_api.id(19065882253598204)
,p_name=>'IDNTFCCION_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Identificaci\00F3n<br>Demandado')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
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
 p_id=>wwv_flow_api.id(19065995846598205)
,p_name=>'NMBRE_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Nombre<br>Demandado'
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
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(19066047619598206)
,p_name=>'NMRO_TTLO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_PDRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('N\00FAmero T\00EDtulo<br>Judicial Padre')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
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
 p_id=>wwv_flow_api.id(19066136324598207)
,p_name=>'ID_TTLO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_PDRE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>220
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(19066279514598208)
,p_name=>'CDGO_ENTDAD_CNSGNNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ENTDAD_CNSGNNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Entidad<br>Consignante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
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
 p_id=>wwv_flow_api.id(19066318725598209)
,p_name=>'ID_BNCO_CNSGNNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_BNCO_CNSGNNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>240
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(19044118510849635)
,p_internal_uid=>19044118510849635
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET'
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
 p_id=>wwv_flow_api.id(19072351676607652)
,p_interactive_grid_id=>wwv_flow_api.id(19044118510849635)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(19072474495607660)
,p_report_id=>wwv_flow_api.id(19072351676607652)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19072995970607685)
,p_view_id=>wwv_flow_api.id(19072474495607660)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(19044266314849636)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19073336842607693)
,p_view_id=>wwv_flow_api.id(19072474495607660)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(19044343594849637)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19073804471607695)
,p_view_id=>wwv_flow_api.id(19072474495607660)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(19044429402849638)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19074353483607702)
,p_view_id=>wwv_flow_api.id(19072474495607660)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(19044570763849639)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19074865415607704)
,p_view_id=>wwv_flow_api.id(19072474495607660)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(19044641757849640)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19075390879607707)
,p_view_id=>wwv_flow_api.id(19072474495607660)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(19044734168849641)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19075825223607709)
,p_view_id=>wwv_flow_api.id(19072474495607660)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(19044889043849642)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19076708464607721)
,p_view_id=>wwv_flow_api.id(19072474495607660)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(19045050794849644)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19077246734607723)
,p_view_id=>wwv_flow_api.id(19072474495607660)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(19045137719849645)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19078274121607727)
,p_view_id=>wwv_flow_api.id(19072474495607660)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(19045351970849647)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19078704153607729)
,p_view_id=>wwv_flow_api.id(19072474495607660)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(19045432796849648)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19079218851607730)
,p_view_id=>wwv_flow_api.id(19072474495607660)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(19045544565849649)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19079707920607732)
,p_view_id=>wwv_flow_api.id(19072474495607660)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(19045694625849650)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19080271991607734)
,p_view_id=>wwv_flow_api.id(19072474495607660)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(19065573880598201)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19080783873607736)
,p_view_id=>wwv_flow_api.id(19072474495607660)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(19065633580598202)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19081220108607737)
,p_view_id=>wwv_flow_api.id(19072474495607660)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(19065784019598203)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19081746817607739)
,p_view_id=>wwv_flow_api.id(19072474495607660)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(19065882253598204)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19082274365607741)
,p_view_id=>wwv_flow_api.id(19072474495607660)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(19065995846598205)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19082614716607790)
,p_view_id=>wwv_flow_api.id(19072474495607660)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(19066047619598206)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19083193972607792)
,p_view_id=>wwv_flow_api.id(19072474495607660)
,p_display_seq=>21
,p_column_id=>wwv_flow_api.id(19066136324598207)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19083625718607793)
,p_view_id=>wwv_flow_api.id(19072474495607660)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(19066279514598208)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19084185500607795)
,p_view_id=>wwv_flow_api.id(19072474495607660)
,p_display_seq=>23
,p_column_id=>wwv_flow_api.id(19066318725598209)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21350480554159701)
,p_plug_name=>unistr('<b>T\00EDtulos en Gesti\00F3n</b>')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   a.id_ttlo_jdcial',
'        ,a.cdgo_clnte',
'        ,a.id_ttlo_jdcial_crgdo',
'        ,a.nmro_ttlo_jdcial',
'        ,a.fcha_cnsttcion',
'        ,a.vlor',
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
'join gf_d_titulos_judicial_estdo f on f.cdgo_ttlo_jdcial_estdo = a.cdgo_ttlo_jdcial_estdo',
'where a.id_fncnrio = :P251_FNCNRIO ',
'and a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
';'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  1',
'from gf_g_titulos_judicial a',
'where a.id_fncnrio = :P251_FNCNRIO ',
'and a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
';'))
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21350706393159704)
,p_name=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Estado<br>T\00EDtulo Judicial')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
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
 p_id=>wwv_flow_api.id(21350883313159705)
,p_name=>'ID_EMBRGO_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGO_RSLCION'
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
 p_id=>wwv_flow_api.id(21350974101159706)
,p_name=>'ID_INSTNCIA_FLJO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO_PDRE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21351071068159707)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21351152606159708)
,p_name=>'ID_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTUD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Id Solicitud<br>PQR'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(21351223515159709)
,p_name=>'CDGO_ENTDAD_RCDDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ENTDAD_RCDDR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Entidad<br>Recaudadora'
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
 p_id=>wwv_flow_api.id(21351395141159710)
,p_name=>'ID_BNCO_RCDDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_BNCO_RCDDR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21351477058159711)
,p_name=>'CDGO_IDNTFCCION_TPO_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_IDNTFCCION_TPO_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Tipo<br>Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(21351574408159712)
,p_name=>'CNSCTVO_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNSCTVO_EMBRGO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Consecutivo<br>Embargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21351696206159713)
,p_name=>'NMRO_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_JDCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('N\00FAmero T\00EDtulo<br>Judicial')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(21351744601159714)
,p_name=>'ID_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21351818478159715)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
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
 p_id=>wwv_flow_api.id(21351922099159716)
,p_name=>'ID_TTLO_JDCIAL_CRGDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_CRGDO'
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
 p_id=>wwv_flow_api.id(21352062807159717)
,p_name=>'FCHA_CNSTTCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_CNSTTCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Fecha<br>Constituci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
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
 p_id=>wwv_flow_api.id(21352120069159718)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Valor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
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
 p_id=>wwv_flow_api.id(21352247379159719)
,p_name=>'ID_TTLO_JDCIAL_AREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_AREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('\00C1rea')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
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
 p_id=>wwv_flow_api.id(21352383231159720)
,p_name=>'IDNTFCCION_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Identificaci\00F3n<br>Demandado')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
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
 p_id=>wwv_flow_api.id(21352442300159721)
,p_name=>'NMBRE_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Nombre<br>Demandado'
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
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21352591311159722)
,p_name=>'NMRO_TTLO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_PDRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('N\00FAmero T\00EDtulo<br>Judicial Padre')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
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
 p_id=>wwv_flow_api.id(21352610849159723)
,p_name=>'ID_TTLO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_PDRE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>220
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21352794917159724)
,p_name=>'CDGO_ENTDAD_CNSGNNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ENTDAD_CNSGNNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Entidad<br>Consignante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
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
 p_id=>wwv_flow_api.id(21352875786159725)
,p_name=>'ID_BNCO_CNSGNNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_BNCO_CNSGNNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>240
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21936283465380506)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21936328517380507)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(21350663767159703)
,p_internal_uid=>21350663767159703
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET'
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
 p_id=>wwv_flow_api.id(21356382970162017)
,p_interactive_grid_id=>wwv_flow_api.id(21350663767159703)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(21356409161162018)
,p_report_id=>wwv_flow_api.id(21356382970162017)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21356996933162030)
,p_view_id=>wwv_flow_api.id(21356409161162018)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(21350706393159704)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21357489196162034)
,p_view_id=>wwv_flow_api.id(21356409161162018)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(21350883313159705)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21357927988162036)
,p_view_id=>wwv_flow_api.id(21356409161162018)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(21350974101159706)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21358435683162038)
,p_view_id=>wwv_flow_api.id(21356409161162018)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(21351071068159707)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21358924898162046)
,p_view_id=>wwv_flow_api.id(21356409161162018)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(21351152606159708)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21359492551162061)
,p_view_id=>wwv_flow_api.id(21356409161162018)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(21351223515159709)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21359941464162063)
,p_view_id=>wwv_flow_api.id(21356409161162018)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(21351395141159710)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21360401556162065)
,p_view_id=>wwv_flow_api.id(21356409161162018)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(21351477058159711)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21360975057162067)
,p_view_id=>wwv_flow_api.id(21356409161162018)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(21351574408159712)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21361423391162069)
,p_view_id=>wwv_flow_api.id(21356409161162018)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(21351696206159713)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21361995583162071)
,p_view_id=>wwv_flow_api.id(21356409161162018)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(21351744601159714)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21362457768162073)
,p_view_id=>wwv_flow_api.id(21356409161162018)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(21351818478159715)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21362937966162075)
,p_view_id=>wwv_flow_api.id(21356409161162018)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(21351922099159716)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21363441088162077)
,p_view_id=>wwv_flow_api.id(21356409161162018)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(21352062807159717)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21363883134162079)
,p_view_id=>wwv_flow_api.id(21356409161162018)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(21352120069159718)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>151.128
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21364323248162080)
,p_view_id=>wwv_flow_api.id(21356409161162018)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(21352247379159719)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21364809393162082)
,p_view_id=>wwv_flow_api.id(21356409161162018)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(21352383231159720)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21365388711162085)
,p_view_id=>wwv_flow_api.id(21356409161162018)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(21352442300159721)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21365864511162088)
,p_view_id=>wwv_flow_api.id(21356409161162018)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(21352591311159722)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21366326286162090)
,p_view_id=>wwv_flow_api.id(21356409161162018)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(21352610849159723)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21366830437162092)
,p_view_id=>wwv_flow_api.id(21356409161162018)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(21352794917159724)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21367362231162095)
,p_view_id=>wwv_flow_api.id(21356409161162018)
,p_display_seq=>22
,p_column_id=>wwv_flow_api.id(21352875786159725)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21951171722297114)
,p_view_id=>wwv_flow_api.id(21356409161162018)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(21936283465380506)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25964365190746506)
,p_plug_name=>'Asociar Acciones'
,p_region_name=>'acciones'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size480x320'
,p_plug_template=>wwv_flow_api.id(177331524321050607)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25964633475746509)
,p_plug_name=>unistr('Selecci\00F3n De T\00EDtulos')
,p_region_name=>'titulosSeleccion'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   a.id_ttlo_jdcial',
'        ,a.cdgo_clnte',
'        ,a.id_ttlo_jdcial_crgdo',
'        ,a.nmro_ttlo_jdcial',
'        ,a.fcha_cnsttcion',
'        ,a.vlor',
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
'where (a.id_instncia_fljo is null and a.cdgo_ttlo_jdcial_estdo = ''RGS'' and a.idntfccion_dmnddo = :P251_IDNTFCCION) ',
'  or (a.id_instncia_fljo is not null and a.cdgo_ttlo_jdcial_estdo = ''RCH'' and a.idntfccion_dmnddo = :P251_IDNTFCCION)'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NOT_EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1  ',
'from wf_g_instancias_transicion ',
'where id_instncia_fljo = :F_ID_INSTNCIA_FLJO ',
'and id_fljo_trea_orgen = 204',
'and id_estdo_trnscion = 3'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(25964816079746511)
,p_name=>'ID_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(25964905692746512)
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
 p_id=>wwv_flow_api.id(25965012320746513)
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
 p_id=>wwv_flow_api.id(25965121951746514)
,p_name=>'NMRO_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_JDCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('No. T\00EDtulo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
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
 p_id=>wwv_flow_api.id(25965271441746515)
,p_name=>'FCHA_CNSTTCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_CNSTTCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
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
 p_id=>wwv_flow_api.id(25965324821746516)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor T\00EDtulo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(25965462091746517)
,p_name=>'ID_TTLO_JDCIAL_AREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_AREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(25965531497746518)
,p_name=>'CDGO_IDNTFCCION_TPO_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_IDNTFCCION_TPO_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(25965640516746519)
,p_name=>'IDNTFCCION_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(25965702193746520)
,p_name=>'NMBRE_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(25965855850746521)
,p_name=>'NMRO_TTLO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_PDRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('No. T\00EDtulo Padre')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
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
 p_id=>wwv_flow_api.id(25965902578746522)
,p_name=>'ID_TTLO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_PDRE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(25966021176746523)
,p_name=>'CDGO_ENTDAD_CNSGNNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ENTDAD_CNSGNNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(25966177996746524)
,p_name=>'ID_BNCO_CNSGNNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_BNCO_CNSGNNTE'
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
 p_id=>wwv_flow_api.id(25966260744746525)
,p_name=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(25966383149746526)
,p_name=>'ID_EMBRGO_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGO_RSLCION'
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
 p_id=>wwv_flow_api.id(25966480556746527)
,p_name=>'ID_INSTNCIA_FLJO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO_PDRE'
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
 p_id=>wwv_flow_api.id(25966568705746528)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(25966684794746529)
,p_name=>'ID_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTUD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(25966741203746530)
,p_name=>'CDGO_ENTDAD_RCDDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ENTDAD_RCDDR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(25966881165746531)
,p_name=>'ID_BNCO_RCDDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_BNCO_RCDDR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>220
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(25966946950746532)
,p_name=>'CNSCTVO_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNSCTVO_EMBRGO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Embargo Asociado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
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
 p_id=>wwv_flow_api.id(25967031919746533)
,p_name=>'APEX$ROW_SELECTOR_1'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(25964730909746510)
,p_internal_uid=>25964730909746510
,p_is_editable=>false
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
 p_id=>wwv_flow_api.id(26637562305642381)
,p_interactive_grid_id=>wwv_flow_api.id(25964730909746510)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(26637612840642384)
,p_report_id=>wwv_flow_api.id(26637562305642381)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26638188439642397)
,p_view_id=>wwv_flow_api.id(26637612840642384)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(25964816079746511)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26638629505642404)
,p_view_id=>wwv_flow_api.id(26637612840642384)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(25964905692746512)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26639017988642407)
,p_view_id=>wwv_flow_api.id(26637612840642384)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(25965012320746513)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26639582554642409)
,p_view_id=>wwv_flow_api.id(26637612840642384)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(25965121951746514)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26640025730642410)
,p_view_id=>wwv_flow_api.id(26637612840642384)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(25965271441746515)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26640543259642412)
,p_view_id=>wwv_flow_api.id(26637612840642384)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(25965324821746516)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26641024668642414)
,p_view_id=>wwv_flow_api.id(26637612840642384)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(25965462091746517)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26641566606642416)
,p_view_id=>wwv_flow_api.id(26637612840642384)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(25965531497746518)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26642007004642418)
,p_view_id=>wwv_flow_api.id(26637612840642384)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(25965640516746519)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26642595735642419)
,p_view_id=>wwv_flow_api.id(26637612840642384)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(25965702193746520)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26643008044642421)
,p_view_id=>wwv_flow_api.id(26637612840642384)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(25965855850746521)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26643524250642423)
,p_view_id=>wwv_flow_api.id(26637612840642384)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(25965902578746522)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26644045186642426)
,p_view_id=>wwv_flow_api.id(26637612840642384)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(25966021176746523)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26644511114642427)
,p_view_id=>wwv_flow_api.id(26637612840642384)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(25966177996746524)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26645025206642429)
,p_view_id=>wwv_flow_api.id(26637612840642384)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(25966260744746525)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26645582740642431)
,p_view_id=>wwv_flow_api.id(26637612840642384)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(25966383149746526)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26646012324642433)
,p_view_id=>wwv_flow_api.id(26637612840642384)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(25966480556746527)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26646515750642436)
,p_view_id=>wwv_flow_api.id(26637612840642384)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(25966568705746528)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26647024073642438)
,p_view_id=>wwv_flow_api.id(26637612840642384)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(25966684794746529)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26647531646642440)
,p_view_id=>wwv_flow_api.id(26637612840642384)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(25966741203746530)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26648069862642442)
,p_view_id=>wwv_flow_api.id(26637612840642384)
,p_display_seq=>21
,p_column_id=>wwv_flow_api.id(25966881165746531)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26648565401642444)
,p_view_id=>wwv_flow_api.id(26637612840642384)
,p_display_seq=>22
,p_column_id=>wwv_flow_api.id(25966946950746532)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(28518870884923482)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
'Esta funcionalidad permite:<br><br>',
unistr('<b>1.</b> Registrar t\00EDtulo judicial puntualmente.<br><br>'),
unistr('<b>2.</b> Modificar t\00EDtulo judicial en estado registrado o apto para solicitud.<br><br>'),
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(29532809261458705)
,p_plug_name=>unistr('Traslado De T\00EDtulos Judiciales')
,p_region_name=>'traslado'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400'
,p_plug_template=>wwv_flow_api.id(177331524321050607)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(32401914973479702)
,p_plug_name=>unistr('Asociaci\00F3n De Medida Cautelar')
,p_region_name=>'embargos'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400'
,p_plug_template=>wwv_flow_api.id(177331524321050607)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(32402297889479705)
,p_plug_name=>'Datos Embargo'
,p_parent_plug_id=>wwv_flow_api.id(32401914973479702)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(51300381681709403)
,p_plug_name=>unistr('<b>Gesti\00F3n T\00EDtulo Judicial</b>')
,p_region_name=>'titulos'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   a.id_ttlo_jdcial',
'        ,a.cdgo_clnte',
'        ,a.id_ttlo_jdcial_crgdo',
'        ,a.nmro_ttlo_jdcial',
'        ,a.fcha_cnsttcion',
'        ,a.vlor',
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
'where (a.id_instncia_fljo is null and a.cdgo_ttlo_jdcial_estdo = ''RGS'' and a.idntfccion_dmnddo = :P251_IDNTFCCION) ',
'  or (a.id_instncia_fljo is not null and a.cdgo_ttlo_jdcial_estdo = ''RCH'' and a.idntfccion_dmnddo = :P251_IDNTFCCION)'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18442492718664801)
,p_name=>'ACCION'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Acci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>260
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion d, ',
'a.cdgo_ttlo_jdcial_estdo r',
'from gf_d_titulos_judicial_estdo a',
'where a.cdgo_ttlo_jdcial_estdo in (''ACN'',''ASL'',''FRC'',''TRO'');'))
,p_lov_display_extra=>false
,p_lov_display_null=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(51300519511709405)
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
 p_id=>wwv_flow_api.id(51300665058709406)
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
 p_id=>wwv_flow_api.id(51300748264709407)
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
 p_id=>wwv_flow_api.id(51300842584709408)
,p_name=>'NMRO_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_JDCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('N\00FAmero T\00EDtulo<br>Judicial')
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
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(51300949118709409)
,p_name=>'FCHA_CNSTTCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_CNSTTCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Fecha<br>Constituci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(51301087089709410)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Valor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(51301332742709413)
,p_name=>'ID_TTLO_JDCIAL_AREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_AREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('\00C1rea')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(51301500423709415)
,p_name=>'IDNTFCCION_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Identificaci\00F3n<br>Demandado')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(51301619332709416)
,p_name=>'NMBRE_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Nombre<br>Demandado'
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
 p_id=>wwv_flow_api.id(51301787401709417)
,p_name=>'NMRO_TTLO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_PDRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('N\00FAmero T\00EDtulo<br>Judicial Padre')
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
 p_id=>wwv_flow_api.id(51301837416709418)
,p_name=>'ID_TTLO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_PDRE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
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
 p_id=>wwv_flow_api.id(51301957103709419)
,p_name=>'CDGO_ENTDAD_CNSGNNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ENTDAD_CNSGNNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Entidad<br>Consignante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
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
 p_id=>wwv_flow_api.id(51302056621709420)
,p_name=>'ID_BNCO_CNSGNNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_BNCO_CNSGNNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
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
 p_id=>wwv_flow_api.id(51302183309709421)
,p_name=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Estado<br>T\00EDtulo Judicial')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
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
 p_id=>wwv_flow_api.id(51302212205709422)
,p_name=>'ID_EMBRGO_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGO_RSLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
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
 p_id=>wwv_flow_api.id(51302313818709423)
,p_name=>'ID_INSTNCIA_FLJO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO_PDRE'
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
 p_id=>wwv_flow_api.id(51302478242709424)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
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
 p_id=>wwv_flow_api.id(51302546397709425)
,p_name=>'ID_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTUD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Id Solicitud<br>PQR'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
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
 p_id=>wwv_flow_api.id(51302668041709426)
,p_name=>'CDGO_ENTDAD_RCDDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ENTDAD_RCDDR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Entidad<br>Recaudadora'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
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
 p_id=>wwv_flow_api.id(51302711961709427)
,p_name=>'ID_BNCO_RCDDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_BNCO_RCDDR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>240
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
 p_id=>wwv_flow_api.id(51302971686709429)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(51448361815365210)
,p_name=>'CDGO_IDNTFCCION_TPO_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_IDNTFCCION_TPO_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Tipo<br>Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(51477390525979532)
,p_name=>'CNSCTVO_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNSCTVO_EMBRGO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Consecutivo<br>Embargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
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
 p_id=>wwv_flow_api.id(51300473961709404)
,p_internal_uid=>51300473961709404
,p_is_editable=>true
,p_edit_operations=>'u'
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
 p_id=>wwv_flow_api.id(51309543871733733)
,p_interactive_grid_id=>wwv_flow_api.id(51300473961709404)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(51309641708733735)
,p_report_id=>wwv_flow_api.id(51309543871733733)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(27910115866143)
,p_view_id=>wwv_flow_api.id(51309641708733735)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(18442492718664801)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>204.844
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(34603159176179986)
,p_view_id=>wwv_flow_api.id(51309641708733735)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(51448361815365210)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>209.983
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51310169232733737)
,p_view_id=>wwv_flow_api.id(51309641708733735)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(51300519511709405)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51310696761733739)
,p_view_id=>wwv_flow_api.id(51309641708733735)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(51300665058709406)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51311114633733740)
,p_view_id=>wwv_flow_api.id(51309641708733735)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(51300748264709407)
,p_is_visible=>true
,p_is_frozen=>false
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51311648822733742)
,p_view_id=>wwv_flow_api.id(51309641708733735)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(51300842584709408)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>202.979
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51312186454733744)
,p_view_id=>wwv_flow_api.id(51309641708733735)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(51300949118709409)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>133.9861
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51312682794733745)
,p_view_id=>wwv_flow_api.id(51309641708733735)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(51301087089709410)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>134.969
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51314137245733750)
,p_view_id=>wwv_flow_api.id(51309641708733735)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(51301332742709413)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51315192962733753)
,p_view_id=>wwv_flow_api.id(51309641708733735)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(51301500423709415)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>190.9861
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51315622901733754)
,p_view_id=>wwv_flow_api.id(51309641708733735)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(51301619332709416)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>239.986
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51316162597733756)
,p_view_id=>wwv_flow_api.id(51309641708733735)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(51301787401709417)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>247.993
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51316661650733757)
,p_view_id=>wwv_flow_api.id(51309641708733735)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(51301837416709418)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51317138680733759)
,p_view_id=>wwv_flow_api.id(51309641708733735)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(51301957103709419)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>134
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51317608465733760)
,p_view_id=>wwv_flow_api.id(51309641708733735)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(51302056621709420)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51318185420733762)
,p_view_id=>wwv_flow_api.id(51309641708733735)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(51302183309709421)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>237.993
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51318626302733763)
,p_view_id=>wwv_flow_api.id(51309641708733735)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(51302212205709422)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51319116146733765)
,p_view_id=>wwv_flow_api.id(51309641708733735)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(51302313818709423)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51319697739733768)
,p_view_id=>wwv_flow_api.id(51309641708733735)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(51302478242709424)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51320131129733770)
,p_view_id=>wwv_flow_api.id(51309641708733735)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(51302546397709425)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>76
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51320698627733772)
,p_view_id=>wwv_flow_api.id(51309641708733735)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(51302668041709426)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>131
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51321113997733774)
,p_view_id=>wwv_flow_api.id(51309641708733735)
,p_display_seq=>23
,p_column_id=>wwv_flow_api.id(51302711961709427)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51575062996882942)
,p_view_id=>wwv_flow_api.id(51309641708733735)
,p_display_seq=>22
,p_column_id=>wwv_flow_api.id(51477390525979532)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>207.99
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(402564096029098204)
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10190691730395947)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(402564096029098204)
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
 p_id=>wwv_flow_api.id(16701559623551335)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(402564096029098204)
,p_button_name=>'ACTLZAR_TTLO'
,p_button_static_id=>'btn_actlzar_ttlo'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Asociar Acci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P251_INDCDOR_TRSLDO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(24949423772118207)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(402564096029098204)
,p_button_name=>'TRSLDAR_TTLO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Trasladar T\00EDtulo')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from gf_g_titulos_judicial a ',
'where id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'and cdgo_ttlo_jdcial_estdo = ''TRO'' ',
'and not exists ',
'(select 1 from gf_g_titulos_judicial_traslado t ',
' where t.id_instncia_fljo = a.id_instncia_fljo);'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(32401827748479701)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(402564096029098204)
,p_button_name=>'BTN_ASCAR_EMBRGO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Asociar Embargo'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(25964545188746508)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(25964365190746506)
,p_button_name=>'BTN_ASCIAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Asociar Acci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16845925411207106)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(16845466283207101)
,p_button_name=>'CONSULTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(32430467581310504)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(32402297889479705)
,p_button_name=>'BTN_ASCIAR_EMBRGO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Asociar Embargo'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(29533737057458714)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(29532809261458705)
,p_button_name=>'BTN_TRSLDAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Trasladar T\00EDtulo')
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'select 1 from gf_g_titulos_judicial_traslado t where t.id_instncia_fljo = :F_ID_INSTNCIA_FLJO'
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16845599110207102)
,p_name=>'P251_IDNTFCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(16845466283207101)
,p_prompt=>unistr('<b>Identificaci\00F3n</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17411291820175213)
,p_name=>'P251_JSON'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(25964633475746509)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20969188077246401)
,p_name=>'P251_FNCNRIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(19043939083849633)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21350553680159702)
,p_name=>'P251_FNCNRIO_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(21350480554159701)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25964415806746507)
,p_name=>'P251_ACCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(25964365190746506)
,p_prompt=>unistr('<b>Acci\00F3n</b>')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,cdgo_ttlo_jdcial_estdo as r',
'  from gf_d_titulos_judicial_estdo',
'  where cdgo_ttlo_jdcial_estdo in (''ACN'',''ASL'',''FRC'',''TRO'',''CYC'',''CMP'')',
' order by cdgo_ttlo_jdcial_estdo'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25967127660746534)
,p_name=>'P251_NMBRES_DMNDDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(16845466283207101)
,p_prompt=>'<b>Nombres Demandado</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26407712836815901)
,p_name=>'P251_INDCDOR_TRSLDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(51300381681709403)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29533146966458708)
,p_name=>'P251_ID_AREA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(29532809261458705)
,p_prompt=>unistr('<b>\00C1rea De Traslado</b> ')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_area as d, id_area as r ',
'  from df_c_areas ',
' order by id_area'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29533240743458709)
,p_name=>'P251_ID_AREA_OCLTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(29532809261458705)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29533336883458710)
,p_name=>'P251_MTVO_TRSLDO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(29532809261458705)
,p_prompt=>'<b>Observaciones</b>'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29533498130458711)
,p_name=>'P251_ID_TTLO_JDCIAL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(29532809261458705)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29533571015458712)
,p_name=>'P251_INDCDOR_MTVO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(29532809261458705)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29533621446458713)
,p_name=>'P251_JSON_TTLOS'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(29532809261458705)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32402316484479706)
,p_name=>'P251_CNSCTVO_EMBRGO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(32402297889479705)
,p_prompt=>'Consecutivo De Medida Cautelar'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.cnsctvo_embrgo||'' - ''||to_char(a.fcha_rgstro_embrgo,''DD/MM/YYYY'') ||'' - ''||b.nmbre_trcro as d',
'     , a.cnsctvo_embrgo as r',
'from v_mc_g_embargos_resolucion a',
'join mc_g_embargos_responsable c on a.id_embrgos_crtra = c.id_embrgos_crtra',
'join v_sg_g_usuarios b on b.id_fncnrio = a.id_fncnrio;'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32431541982310515)
,p_name=>'P251_JSON_ASEMRGO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(32402297889479705)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(20969222322246402)
,p_computation_sequence=>10
,p_computation_item=>'P251_FNCNRIO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.id_fncnrio',
'from v_sg_g_usuarios b ',
'where b.id_usrio = :F_ID_USRIO'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(18484836339998005)
,p_validation_name=>unistr(' Al consultar identificaci\00F3n')
,p_validation_sequence=>10
,p_validation=>'P251_IDNTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Digite una identificaci\00F3n.')
,p_associated_item=>wwv_flow_api.id(16845599110207102)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(16846054241207107)
,p_name=>unistr('Al dar clic al bot\00F3n consultar')
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(16845925411207106)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(16846166644207108)
,p_event_id=>wwv_flow_api.id(16846054241207107)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'CONSULTAR'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(25320123479101407)
,p_name=>'Al dar click BTN_ACTLZAR_TTLO'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(16701559623551335)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(25320295844101408)
,p_event_id=>wwv_flow_api.id(25320123479101407)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'function openAcciones() {    ',
'    ',
'    var titulos = fnc_jsonSeleccion();',
'',
'    if (titulos == ''N'') { ',
'         apex.message.clearErrors();',
'        apex.message.showErrors([',
'            {',
'                type: "error",',
'                location: "page",',
unistr('                message: ''Debe al menos selecconar un t\00EDtulo'','),
'                unsafe: false',
'            }',
'        ]);        ',
'    } else {',
'       openModal("acciones");',
'    }',
'',
'}',
'',
'openAcciones();',
'/*',
unistr('apex.message.confirm("\00BFEst\00E1 seguro de actualizar los t\00EDtulos?", function (okPressed) {'),
'    if (okPressed) {',
unistr('       // fnc_actualizarT\00EDtulos();'),
'        openAcciones();',
'    }',
'}); */'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(25967364790746536)
,p_name=>'Al hacer click BTN_ASCIAR'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(25964545188746508)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(25967400452746537)
,p_event_id=>wwv_flow_api.id(25967364790746536)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('function fnc_actualizarT\00EDtulos() {'),
'    try {',
'        ',
'        //buildJsonTitulos();   ',
'        fnc_jsonSeleccion(apex.item("P251_ACCION").getValue());',
'        ',
unistr('        apex.server.process("actualizarT\00EDtulos", {'),
'            pageItems: "#F_CDGO_CLNTE, #F_ID_USRIO, #P251_JSON, #F_ID_INSTNCIA_FLJO"',
'        }, {',
'            success: function (data) {',
'                ',
'                if (data.o_cdgo_rspsta != 0) {',
'                    console.log(''RESPUESTA: '' + data.o_cdgo_rspsta);',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors([',
'                        {',
'                            type: "error",',
'                            location: "page",',
'                            message: data.o_mnsje_rspsta,',
'                            unsafe: false',
'                        }',
'                    ]);',
'                } else {',
unistr('                    apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                    apex.item("P251_ACCION").setValue("");',
'                    apex.submit();',
'                }',
'            }',
'        })',
'    } catch (e) {',
'        console.log(e);',
'    }',
'} ',
'',
'',
unistr('apex.message.confirm("\00BFEst\00E1 seguro de actualizar los t\00EDtulos?", function (okPressed) {'),
'    if (okPressed) {',
unistr('        fnc_actualizarT\00EDtulos();'),
'    }',
'}); '))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(29532994332458706)
,p_name=>'Al dar click BTN_TRSLDAR_TTLO'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(24949423772118207)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29533021671458707)
,p_event_id=>wwv_flow_api.id(29532994332458706)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'openModal("traslado");',
'  '))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(29533895509458715)
,p_name=>'al dar click BTN_TRSLDAR'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(29533737057458714)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29533982458458716)
,p_event_id=>wwv_flow_api.id(29533895509458715)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function fnc_trasladarTitulos(){',
'    try{    ',
'         ',
'        var json = window.localStorage.jsonTitulosJudicialesRegistrados;',
'            ',
'        apex.server.process("trasladarTitulos", {',
'            f01: json,',
'            pageItems: "#F_CDGO_CLNTE,#F_ID_USRIO, #P251_MTVO_TRSLDO,#P251_INDCDOR_MTVO,#F_ID_INSTNCIA_FLJO,#F_ID_FLJO_TREA, #P251_ID_AREA"',
'        },{',
'            success: function(data){',
'                if(data.o_cdgo_rspsta != 0){',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors([',
'                        {',
'                            type:       "error",',
'                            location:   "page",',
'                            message:    data.o_mnsje_rspsta,',
'                            unsafe:     false',
'                        }',
'                    ]);',
'                }',
'                else{                    ',
unistr('                    apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                 //   setTimeout(function() {closeModal()}, 2000);   ',
'                    setTimeout(function() {redirect(data.o_url)}, 2000); ',
'                }',
'            }',
'        })',
'    }catch(e){',
'        console.log(e);',
'    }',
'}',
'',
unistr('apex.message.confirm("\00BFEst\00E1 seguro de trasladar los T\00EDtulos Judiciales?", function(okPressed){'),
'    if(okPressed){',
'        fnc_trasladarTitulos();',
'    }',
'});',
'',
'function redirect(url){',
'    window.location.href = url;   ',
'}',
'',
'function closeModal(){',
'    apex.navigation.dialog.close(true);    ',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(32402053530479703)
,p_name=>'Al dar clic BTN_ASCAR_EMBRGO'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(32401827748479701)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(32402175104479704)
,p_event_id=>wwv_flow_api.id(32402053530479703)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function irAsociarEmbargos() {',
'    if (jsonSeleccion() !== ''S'') {',
'        apex.message.clearErrors();',
'        apex.message.showErrors([',
'            {',
'                type: "error",',
'                location: "page",',
unistr('                message: "Por favor seleccione un t\00EDtulo judicial",'),
'                unsafe: false',
'            }',
'        ]);',
'    } else {',
'        openModal("embargos");',
'    }',
'}',
'',
'irAsociarEmbargos();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(32430522529310505)
,p_name=>'Al dar clic BTN_ASCIAR_EMBRGO'
,p_event_sequence=>140
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(32430467581310504)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(32430642316310506)
,p_event_id=>wwv_flow_api.id(32430522529310505)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function actualizarEmbargo() {',
'',
'    try {',
'',
'        if (jsonSeleccion() !== ''S'') {',
'            apex.message.clearErrors();',
'            apex.message.showErrors([',
'              {',
'                 type: "error",',
'                 location: "page",',
unistr('                 message: "No ha seleccionado un t\00EDtulo judicial",'),
'                 unsafe: false',
'               }',
'             ]);',
'        }else{',
'         if (validarItems() === ''S'') {           ',
'            ',
'            apex.server.process(',
'                "actualizaEmbargo",',
'                {',
'                    pageItems: "#F_CDGO_CLNTE, #P251_CNSCTVO_EMBRGO, #P251_JSON_ASEMRGO"',
'                },',
'                {',
'                    success: function (data) {',
'                        if (data.o_cdgo_rspsta != 0) {',
'                            apex.message.clearErrors();',
'                            apex.message.showErrors([',
'                                {',
'                                    type: "error",',
'                                    location: "inline",',
'                                    message: data.o_mnsje_rspsta,',
'                                    unsafe: false',
'                                }',
'                            ]);',
'                        } else {',
'                            apex.message.clearErrors();',
'                            apex.message.showPageSuccess("Embargo asociado correctamente.");',
'                            apex.item("P251_CNSCTVO_EMBRGO").setValue("");',
'                            apex.submit();',
'                        }',
'                    },',
'                    error: function (jqXHR, textStatus, errorThrown) {',
'                        console.log("Error: " + textStatus + ": " + errorThrown);',
'                        apex.message.showErrors([',
'                            {',
'                                type: "error",',
'                                location: "inline",',
'                                message: "Error al procesar la solicitud.",',
'                                unsafe: false',
'                            }',
'                        ]);',
'                    }',
'                }',
'            );',
'        }',
'      }     ',
'    } catch (e) {',
'        console.log("Error: " + e);',
'    }',
'}',
'',
unistr('apex.message.confirm("\00BFEst\00E1 seguro de asociar este embargo al T\00EDtulo Judicial seleccionado?", function (okPressed) {'),
'    if (okPressed) {',
'        actualizarEmbargo();',
'    }',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(32431604634310516)
,p_name=>'al cambiar P251_IDNTFCCION'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P251_IDNTFCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'keypress'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(32431706088310517)
,p_event_id=>wwv_flow_api.id(32431604634310516)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'     select a.NMBRE_DMNDDO  into :P251_NMBRES_DMNDDO ',
'      from gf_g_titulos_judicial a',
'     where a.idntfccion_dmnddo = :P251_IDNTFCCION',
'       and rownum = 1',
' group by a.idntfccion_dmnddo, a.NMBRE_DMNDDO;',
' exception when others then',
'     :P251_NMBRES_DMNDDO := null;',
' end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21936446915380508)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(21350480554159701)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('<b>T\00EDtulos en Gesti\00F3n</b> - Save Interactive Grid Data')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(25967290221746535)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Buscar_Demandado'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'     select a.NMBRE_DMNDDO  into :P251_NMBRES_DMNDDO ',
'      from gf_g_titulos_judicial a',
'     where a.idntfccion_dmnddo = :P251_IDNTFCCION',
'       and rownum = 1',
' group by a.idntfccion_dmnddo, a.NMBRE_DMNDDO;',
' exception when others then',
'     :P251_NMBRES_DMNDDO := null;',
' end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(16845925411207106)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(25320357332101409)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('actualizarT\00EDtulos')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_cdgo_rspsta   number;',
'    v_mnsje_rspsta  varchar2(4000);',
'    v_accion        varchar2(100);',
'    v_cdgo_estdo    varchar2(3);',
'    v_exception     exception;',
'begin',
'',
'    v_cdgo_rspsta:= 0;',
'    v_mnsje_rspsta:= ''OK'';   ',
'    ',
'  ',
'',
'   pkg_gf_titulos_judicial.prc_ac_instncia_titulo(p_cdgo_clnte         => :F_CDGO_CLNTE,',
'                                                   p_id_usrio           => :F_ID_USRIO,',
'                                                   p_json_ttlos         => :P251_JSON,',
'                                                   p_id_instncia_fljo   => :F_ID_INSTNCIA_FLJO,',
'                                                   o_cdgo_rspsta        => v_cdgo_rspsta,',
'                                                   o_mnsje_rspsta       => v_mnsje_rspsta);                                                   ',
'                                               ',
'',
'    if v_cdgo_rspsta > 0 then',
'        raise v_exception;     ',
'    end if;',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'',
'exception',
'   when v_exception then',
'        rollback;',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.close_object;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(29534190626458718)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'trasladarTitulos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'v_titulos        clob;',
'v_cdgo_rspsta    number;',
'v_mnsje_rspsta   varchar2(3000);',
'v_url            varchar2(1000);',
'',
'begin',
'',
'    begin',
'         select json_arrayagg(',
'                               json_object (',
'                                   ''id_ttlo_jdcial'' value id_ttlo_jdcial',
'                               )',
'                           ) as json_titulos',
'                    into v_titulos',
'                    from (',
'                        select a.id_ttlo_jdcial from gf_g_titulos_judicial a',
'                        where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO);                       ',
'                                             ',
'    end;',
'',
'    pkg_gf_titulos_judicial.prc_ac_titulos_judicial(p_cdgo_clnte         => :F_CDGO_CLNTE,',
'                                                    p_id_usrio           => :F_ID_USRIO,',
'                                                    p_json_ttlos_pry     => v_titulos,',
'                                                    p_indcdor_mtvo       => ''T'', ',
'                                                    p_obsrvcion          => :P251_MTVO_TRSLDO,',
'                                                    p_id_instncia_fljo   => :F_ID_INSTNCIA_FLJO,',
'                                                    p_id_fljo_trea       => :F_ID_FLJO_TREA,',
'                                                    o_url                => v_url,',
'                                                    o_cdgo_rspsta        => v_cdgo_rspsta,',
'                                                    o_mnsje_rspsta       => v_mnsje_rspsta);',
'                                                    ',
'    if v_cdgo_rspsta = 0 then',
'     pkg_gf_titulos_judicial.prc_rg_titulos_judicial_traslado(p_cdgo_clnte       => :F_CDGO_CLNTE,',
'                                                              p_id_instncia_fljo => :F_ID_INSTNCIA_FLJO,',
'                                                              p_id_usrio         => :F_ID_USRIO,',
'                                                              p_json_ttlos       => v_titulos,',
'                                                              p_id_area          => :P251_ID_AREA,',
'                                                              p_obsrvcion        => :P251_MTVO_TRSLDO,',
'                                                              p_fcha_trsldo      => systimestamp,',
'                                                              o_cdgo_rspsta      => v_cdgo_rspsta,',
'                                                              o_mnsje_rspsta     => v_mnsje_rspsta);',
'',
'    end if;',
'                                                    ',
'                                                    ',
'    owa_util.mime_header(''application/json'', false);',
'    htp.p(''cache-control: no-cache'');',
'    htp.p(''pragma: no-cache''); ',
'    owa_util.http_header_close;',
'    ',
'    v_url := apex_util.prepare_url(''f?p=''|| v(''APP_ID'') || '':251:''|| v(''APP_SESSION'') || v_url);',
'    ',
' --   v_url := apex_util.prepare_url(''f?p=''|| v(''APP_ID'') || '':245:''|| v(''APP_SESSION'') ||'':PAGELOAD:NO::P245_ID_INSTNCIA_FLJO:''||:F_ID_INSTNCIA_FLJO);',
'   ',
'    htp.p(''{"o_cdgo_rspsta" :''||v_cdgo_rspsta||'',',
'            "o_mnsje_rspsta":"''||v_mnsje_rspsta||''",',
'            "o_url":    "''||v_url||''"    ',
'          }'');                                                   ',
'        ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(29534080133458717)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Crear Json T\00EDtulos')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'     select json_arrayagg(',
'                           json_object (',
'                               ''id_ttlo_jdcial'' value id_ttlo_jdcial',
'                           )',
'                       ) as json_titulos',
'                into :P251_JSON_TTLOS',
'                from (',
'                    select a.id_ttlo_jdcial from gf_g_titulos_judicial a',
'                    where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(32430703839310507)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'buscarEmbargo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_cdgo_rspsta        number := 0;',
'  v_mnsje_rspsta       varchar2(4000) := ''Embargo encontrado'';',
'  v_id_embrgos_rslcion number;',
'  v_exception          exception;',
'begin',
'',
'  select id_embrgos_rslcion',
'    into v_id_embrgos_rslcion',
'    from mc_g_embargos_resolucion',
'   where cnsctvo_embrgo = :P251_CNSCTVO_EMBRGO;',
'',
'  if v_id_embrgos_rslcion is not null then',
'    v_mnsje_rspsta := v_mnsje_rspsta || '' - '' || v_id_embrgos_rslcion;',
'    dbms_output.put_line(v_mnsje_rspsta);',
'  else',
'    v_cdgo_rspsta  := 1;',
unistr('    v_mnsje_rspsta := ''Error 1. No se encontr\00F3 el embargo. '' || sqlerrm;'),
'    raise v_exception;',
'  end if;',
'',
'  apex_json.open_object;',
'  apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'  apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'  apex_json.write(''o_id_embrgos_rslcion'', v_id_embrgos_rslcion);',
'  apex_json.close_object;',
'',
'exception',
'  when v_exception then',
'    rollback;',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.write(''o_id_embrgos_rslcion'', v_id_embrgos_rslcion);',
'    apex_json.close_object;',
'  ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(32431435798310514)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'actualizaEmbargo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_cdgo_rspsta  number;',
'  v_mnsje_rspsta varchar2(4000);',
'  v_accion       varchar2(100);',
'  v_cdgo_estdo   varchar2(3);',
'  v_exception    exception; ',
'begin',
'',
'  v_cdgo_rspsta  := 0;',
'  v_mnsje_rspsta := ''OK'';  ',
'  ',
'',
'  pkg_gf_titulos_judicial.prc_ac_titulos_judicial_embargo(p_cdgo_clnte     => :F_CDGO_CLNTE,',
'                                                          p_json_ttlos     => :P251_JSON_ASEMRGO,',
'                                                          p_cnsctvo_embrgo => :P251_CNSCTVO_EMBRGO,',
'                                                          o_cdgo_rspsta    => v_cdgo_rspsta,',
'                                                          o_mnsje_rspsta   => v_mnsje_rspsta);',
'',
'  if v_cdgo_rspsta > 0 then',
'    raise v_exception;',
'  else ',
'   commit;',
'  end if;',
'',
'  apex_json.open_object;',
'  apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'  apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'  apex_json.close_object;',
'',
'exception',
'  when v_exception then',
'    rollback;',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'  ',
'end;',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
