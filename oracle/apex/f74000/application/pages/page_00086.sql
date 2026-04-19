prompt --application/pages/page_00086
begin
wwv_flow_api.create_page(
 p_id=>86
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>'Analisis del Contador'
,p_step_title=>unistr('Revisi\00F3n de documentos')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var v_json = '''';',
'',
'function seleccionarTodos(){',
'    var vigenciasIG = apex.region(''vigencias'');',
'    var vigenciasModel = vigenciasIG.widget().interactiveGrid(''getViews'', ''grid'').model;',
'',
'    ',
'    if (vigenciasIG){',
'         // Obtener todos los identificadores de fila del modelo del IG "Vigencias"',
'    var allRowIds = vigenciasModel.getAllRowIds();',
'',
unistr('    // Seleccionar todas las filas autom\00E1ticamente'),
'    vigenciasModel.setSelected(allRowIds);',
'    console.log("Seleccionados");',
'    }else{',
'        console.log("No Seleccionados");',
'    }',
'   ',
'',
'',
'}',
'',
'',
'',
'function buildJsonExpediente() {',
'    ',
'    var region = apex.region(''expediente'');',
'    ',
'    if(region) {',
'        ',
'        var view = apex.region("expediente").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        var jsonExpediente = records.map((expediente) => {',
'            return {"ID_FSCLZCION_EXPDNTE" : model.getValue(expediente, "ID_FSCLZCION_EXPDNTE")}; ',
'        });',
'        $s(''P86_JSON'', JSON.stringify(jsonExpediente));',
'        window.localStorage.setItem(''jsonExpediente'', JSON.stringify(jsonExpediente));',
'        console.log("JsonExpediente "+JSON.stringify(jsonExpediente));',
'    }',
'    ',
'    /*setTimeout(function() {',
unistr('    // Tu c\00F3digo aqu\00ED'),
'        buildJsonVigencia();',
'     }, 1000);*/',
'    ',
'    ',
'     ',
'}',
'',
'',
'function buildJsonVigencia(){',
'     console.log("Iniciando vigencias");',
'     var region = apex.region(''vigencia'');',
'    ',
'    if(region) {',
'        ',
'        var view = apex.region("vigencia").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        //var records = view.view$.grid("getSelectedRecords");',
'        var records = model._data;',
'        var arr = [];',
'        ',
'        var jsonVigencia = records.map((vigencia) => {',
'            return {"ID_FSCLZCION_EXPDNTE"  : model.getValue(vigencia, "ID_FSCLZCION_EXPDNTE"),',
'                    "VGNCIA"                : model.getValue(vigencia, "VGNCIA"),',
'                    "ID_PRDO"               : model.getValue(vigencia, "ID_PRDO"),',
'                    "ID_CNDDTO_VGNCIA"      : model.getValue(vigencia, "ID_CNDDTO_VGNCIA"),',
'                    "ID_TREA"               : model.getValue(vigencia, "ID_TREA"),',
'                    "ID_ACTO_TPO"           : model.getValue(vigencia, "ID_ACTO_TPO"),',
'                    "ID_SJTO_IMPSTO"           : model.getValue(vigencia, "ID_SJTO_IMPSTO"),',
'                    "ID_ACTO"           : model.getValue(vigencia, "ID_ACTO"),',
'                   }; ',
'        });',
unistr('        console.log("creaci\00F3n de json");'),
'        console.log("jsonVigencia "+JSON.stringify(jsonVigencia));',
'',
'        var c = jsonVigencia.map(function(e){return e.ID_FSCLZCION_EXPDNTE}).filter(function(f,i,r){return r.indexOf(f) === i})',
'        ',
'        buildJson(c,  jsonVigencia);',
'',
'    }',
'}',
'',
'function buildJsonAbogado(){',
'    ',
'     var region = apex.region(''abogado'');',
'    ',
'    if(region) {',
'        ',
'        var view = apex.region("abogado").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        var arr = [];',
'        ',
'        var jsonabogado = records.map((abogado) => {',
'            return {"ID_FSCLZCION_EXPDNTE"  : model.getValue(vigencia, "ID_FSCLZCION_EXPDNTE"),',
'                    "ID_FNCNRIO"               : model.getValue(vigencia, "ID_FNCNRIO"),',
'                    "ID_USRIO"           : model.getValue(vigencia, "ID_USRIO")',
'                   }; ',
'        });',
'        ',
'          var c = jsonabogado.map(function(e){return e.ID_FSCLZCION_EXPDNTE}).filter(function(f,i,r){return r.indexOf(f) === i})',
'',
'',
'            buildJsonall(c,  jsonabogado);',
'',
'        }',
'    }',
'',
'',
'',
'function buildJson(fiscalizacion,  json) {',
'      ',
'    fiscalizacion = fiscalizacion.map(function(c,) {',
'        return {"ID_FSCLZCION_EXPDNTE" : c,  "VGNCIA" : []}',
'    })',
'    ',
'    fiscalizacion.forEach(function(c) {',
'        json.forEach(function(o) {',
'            if (c.ID_FSCLZCION_EXPDNTE == o.ID_FSCLZCION_EXPDNTE) {',
'                c.VGNCIA.push(',
'                    {',
'                        "VGNCIA"              : o.VGNCIA, ',
'                        "ID_PRDO"             : o.ID_PRDO,                         ',
'                        "ID_CNDDTO_VGNCIA"    : o.ID_CNDDTO_VGNCIA,',
'                        "ID_TREA"             : o.ID_TREA,',
'                        "ID_ACTO_TPO"         : o.ID_ACTO_TPO,',
'                        "ID_SJTO_IMPSTO"      : o.ID_SJTO_IMPSTO,',
'                        "ID_ACTO"         : o.ID_ACTO,',
'                    }',
'                )',
'            }',
'        })',
'    })',
'    ',
'    window.localStorage.setItem(''jsonVigencia'', JSON.stringify(fiscalizacion));',
'    ',
'}',
'',
'function buildJsonall(fiscalizacion,  json2,) {',
'      ',
'    fiscalizacion = fiscalizacion.map(function(c,) {',
'        return {"ID_FSCLZCION_EXPDNTE" : c,  "ABOGADO": []}',
'    })',
'    ',
'     fiscalizacion.forEach(function(c) {',
'        json2.forEach(function(o) {',
'            if (c.ID_FSCLZCION_EXPDNTE == o.ID_FSCLZCION_EXPDNTE) {',
'                c.ABOGADO.push(                    {',
'                        "ID_FNCNRIO"              : o.ID_FNCNRIO, ',
'                        "ID_USRIO"             : o.ID_USRIO                ',
'                    }',
'                )',
'            }',
'        })',
'    })',
'    ',
'    window.localStorage.setItem(''jsonall'', JSON.stringify(fiscalizacion));',
'    ',
'}',
'',
'',
'',
'function allVigencia(e,btn,ig, data){',
'    ',
'    var jsonVigencia = data.map((vigencia) => {',
'        return {"ID_FSCLZCION_EXPDNTE"  : vigencia.ID_FSCLZCION_EXPDNTE,',
'                "VGNCIA"                : vigencia.VGNCIA,',
'                "ID_PRDO"               : vigencia.ID_PRDO,',
'                "ID_CNDDTO_VGNCIA"      : vigencia.ID_CNDDTO_VGNCIA,',
'                "ID_TREA"               : vigencia.ID_TREA,',
'                "ID_ACTO_TPO"           : vigencia.ID_ACTO_TPO,',
'                "ID_SJTO_IMPSTO"        : vigencia.ID_SJTO_IMPSTO,',
'                "ID_ACTO"               : vigencia.ID_ACTO',
'                }; ',
'    });',
'    ',
'    var c = jsonVigencia.map(function(e){return e.ID_FSCLZCION_EXPDNTE}).filter(function(f,i,r){return r.indexOf(f) === i})',
'    ',
'    buildJson(c,jsonVigencia);',
'  ',
'}',
'',
'function allVigencia2(e,btn,ig, data){',
'    ',
'    var jsonall = data.map((abogado) => {',
'        return {"ID_FSCLZCION_EXPDNTE"  : abogado.ID_FSCLZCION_EXPDNTE,',
'                "VGNCIA"                : abogado.ID_FNCNRIO,',
'                "ID_PRDO"               : abogado.ID_USRIO',
'                }; ',
'    });',
'    ',
'    var c = jsonall.map(function(e){return e.ID_FSCLZCION_EXPDNTE}).filter(function(f,i,r){return r.indexOf(f) === i})',
'    ',
'    buildJsonall(c,jsonall);',
'  ',
'}',
'',
'',
'function ocultarBotonInciarFsclzcion(){',
'    if(JSON.parse(window.localStorage.jsonExpediente).length > 0){',
'        apex.item(''solicitud'').show();',
'    }else{',
'        apex.item(''solicitud'').hide();',
'    }	',
'    ',
'}',
'',
'',
'',
'',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//apex.region("expediente").widget().interactiveGrid("setSelectedRecords", []);',
'apex.item(''solicitud'').hide();',
''))
,p_step_template=>wwv_flow_api.id(36470205860968633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20240430171524'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(209211643942471601)
,p_plug_name=>'Flujo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
,p_attribute_08=>'&P86_ID_USRIO_ESPCFCO.'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(209392158907047901)
,p_plug_name=>'<b> DATOS EXPEDIENTE. </b>'
,p_region_name=>'datos_expediente'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NOT_EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from fi_g_expedientes_analisis a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(209426821652826610)
,p_plug_name=>'Expediente'
,p_region_name=>'expediente'
,p_parent_plug_id=>wwv_flow_api.id(209392158907047901)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select *',
'from (select  a.id_sjto_impsto,',
'        g.idntfccion_sjto,',
'        a.id_cnddto,',
'        a.candidato,',
'        c.id_fsclzcion_expdnte,',
'        a.nmbre_impsto,',
'        a.nmbre_impsto_sbmpsto,',
'        a.id_prgrma,',
'        a.nmbre_prgrma,',
'        a.id_sbprgrma,',
'        a.nmbre_sbprgrma,',
'        c.id_instncia_fljo,',
'        d.id_fljo_trea_orgen,',
'        c.nmro_expdnte',
'from v_fi_g_candidatos              a',
'join fi_g_candidatos_funcionario    b   on  a.id_cnddto             =   b.id_cnddto',
'join fi_g_fiscalizacion_expdnte     c   on  a.id_cnddto             =   c.id_cnddto    ',
'join wf_g_instancias_transicion     d   on  c.id_instncia_fljo      =   d.id_instncia_fljo',
'join wf_d_flujos_tarea              e   on  d.id_fljo_trea_orgen    =   e.id_fljo_trea',
'join wf_d_tareas                    f   on  e.id_trea               =   f.id_trea',
'join v_si_i_sujetos_impuesto        g   on  a.id_sjto_impsto        =   g.id_sjto_impsto',
'left join fi_g_fsclzcion_expdnte_acto   h  on  h.id_fsclzcion_expdnte =   c.id_fsclzcion_expdnte',
'                                           and h.id_fljo_trea         =   e.id_fljo_trea',
'left join gn_d_actos_tipo_tarea     i   on  i.id_acto_tpo           =   h.id_acto_tpo',
'                                        and i.id_fljo_trea          =   e.id_fljo_trea',
'                                        and i.indcdor_oblgtrio      = ''S''',
'left join gn_g_actos       j   on h.id_acto  = j.id_acto                                           ',
'--left join nt_g_notificaciones       w   on h.id_acto  = w.id_acto                                           ',
'--left join nt_g_notificaciones_detalle y on w.id_ntfccion = y.id_ntfccion and y.id_ntfccion is not null',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'--and b.id_fncnrio = :F_ID_FNCNRIO',
'      ',
'and b.actvo = ''S''',
'and c.cdgo_expdnte_estdo = ''ABT''',
'and d.id_estdo_trnscion in (1,2) ',
'and a.id_impsto = :P86_IMPUESTO',
'and a.id_prgrma = :P86_PRGRMA',
'and a.id_sbprgrma = :P86_SUBPRGRMA',
'and g.idntfccion_sjto   = :P86_IDNTFCCION_SJTO',
'and c.nmro_expdnte   = nvl(:P86_NMRO_EXPDNTE, c.nmro_expdnte)',
'and e.id_fljo_trea = nvl(:P86_ETPA, e.id_fljo_trea) ',
'/*and not exists (select k.id_fsclzcion_expdnte ',
'                from fi_g_expedientes_analisis k ',
'                where c.id_fsclzcion_expdnte = k.id_fsclzcion_expdnte',
'               and k.cdgo_rspta is  null)*/',
'group by a.id_sjto_impsto, ',
'         g.idntfccion_sjto, ',
'         a.id_cnddto, ',
'         a.candidato, ',
'         c.id_fsclzcion_expdnte, ',
'         a.nmbre_impsto, ',
'         a.nmbre_impsto_sbmpsto, ',
'         a.id_prgrma, ',
'         a.nmbre_prgrma, ',
'         a.id_sbprgrma, ',
'         a.nmbre_sbprgrma, ',
'         c.id_instncia_fljo, ',
'         d.id_fljo_trea_orgen, ',
'         c.nmro_expdnte',
'order by  c.nmro_expdnte  );'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P86_PRGRMA,P86_SUBPRGRMA,P86_ETPA,P86_IDNTFCCION_SJTO,P86_IMPUESTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(209427027060826612)
,p_name=>'ID_CNDDTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNDDTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(209427217620826614)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(209427462370826616)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sub Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>50
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
 p_id=>wwv_flow_api.id(209427531219826617)
,p_name=>'CANDIDATO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANDIDATO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Candidato'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(209427982551826621)
,p_name=>'NMBRE_PRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_PRGRMA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Programa'
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
 p_id=>wwv_flow_api.id(209428039605826622)
,p_name=>'NMBRE_SBPRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_SBPRGRMA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Sub programa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(209428152908826623)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(209428280107826624)
,p_name=>'ID_FSCLZCION_EXPDNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FSCLZCION_EXPDNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(209451878839723101)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
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
 p_id=>wwv_flow_api.id(209451939542723102)
,p_name=>'ID_PRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRGRMA'
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
 p_id=>wwv_flow_api.id(209452097924723103)
,p_name=>'ID_SBPRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SBPRGRMA'
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
 p_id=>wwv_flow_api.id(209452123889723104)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
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
 p_id=>wwv_flow_api.id(209452211223723105)
,p_name=>'ID_FLJO_TREA_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA_ORGEN'
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
 p_id=>wwv_flow_api.id(209452417828723107)
,p_name=>'NMRO_EXPDNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_EXPDNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'No. Expedinte'
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
 p_id=>wwv_flow_api.id(209467321353744405)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(209426928859826611)
,p_internal_uid=>209426928859826611
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
 p_id=>wwv_flow_api.id(209436793917025619)
,p_interactive_grid_id=>wwv_flow_api.id(209426928859826611)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(209436837135025624)
,p_report_id=>wwv_flow_api.id(209436793917025619)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(209437990639025634)
,p_view_id=>wwv_flow_api.id(209436837135025624)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(209427027060826612)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(209438826358025650)
,p_view_id=>wwv_flow_api.id(209436837135025624)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(209427217620826614)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(209439874157025654)
,p_view_id=>wwv_flow_api.id(209436837135025624)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(209427462370826616)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(209440341104025656)
,p_view_id=>wwv_flow_api.id(209436837135025624)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(209427531219826617)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(209442321396025663)
,p_view_id=>wwv_flow_api.id(209436837135025624)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(209427982551826621)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(209442863018025664)
,p_view_id=>wwv_flow_api.id(209436837135025624)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(209428039605826622)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(209443368160025666)
,p_view_id=>wwv_flow_api.id(209436837135025624)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(209428152908826623)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(209443832222025667)
,p_view_id=>wwv_flow_api.id(209436837135025624)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(209428280107826624)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(209457864500723352)
,p_view_id=>wwv_flow_api.id(209436837135025624)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(209451878839723101)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(209458320101723357)
,p_view_id=>wwv_flow_api.id(209436837135025624)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(209451939542723102)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(209458890393723358)
,p_view_id=>wwv_flow_api.id(209436837135025624)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(209452097924723103)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(209459384311723360)
,p_view_id=>wwv_flow_api.id(209436837135025624)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(209452123889723104)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(209459892441723361)
,p_view_id=>wwv_flow_api.id(209436837135025624)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(209452211223723105)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(209460886867723367)
,p_view_id=>wwv_flow_api.id(209436837135025624)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(209452417828723107)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(209428372683826625)
,p_plug_name=>'Vigencias'
,p_region_name=>'vigencia'
,p_parent_plug_id=>wwv_flow_api.id(209392158907047901)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.id_fsclzcion_expdnte,',
'        c.id_cnddto_vgncia,',
'        d.dscrpcion ||''-''||d.prdo  as prdio,',
'        d.id_prdo,',
'        c.vgncia,',
'        g.id_trea,',
'        g.dscrpcion_trea,',
'        h.id_acto_tpo,',
'        k.dscrpcion,',
'        l.id_sjto_impsto,',
'        h.id_acto',
'from fi_g_fsclzc_expdn_cndd_vgnc a',
'join fi_g_fiscalizacion_expdnte b           on a.id_fsclzcion_expdnte = b.id_fsclzcion_expdnte',
'join v_fi_g_candidatos    l                 on  b.id_cnddto    =    l.id_cnddto',
'join fi_g_candidatos_vigencia   c           on  a.id_cnddto_vgncia = c.id_cnddto_vgncia',
'join df_i_periodos              d           on  c.id_prdo = d.id_prdo',
'join wf_g_instancias_transicion     e       on  b.id_instncia_fljo      =   e.id_instncia_fljo',
'join wf_d_flujos_tarea              f       on  e.id_fljo_trea_orgen    =   f.id_fljo_trea',
'join wf_d_tareas                   g        on  f.id_trea               =   g.id_trea',
'left join fi_g_fsclzcion_expdnte_acto   h   on  h.id_fsclzcion_expdnte =   b.id_fsclzcion_expdnte',
'                                            and h.id_fljo_trea         =   f.id_fljo_trea',
'                                          ',
'left join gn_d_actos_tipo_tarea     i       on  i.id_acto_tpo           =   h.id_acto_tpo',
'                                            and i.id_fljo_trea          =   f.id_fljo_trea',
'                                            and i.indcdor_oblgtrio      = ''S''',
'left join gn_g_actos       j                on h.id_acto  = j.id_acto ',
'left join  gn_d_actos_tipo          k       on k.id_Acto_tpo = h.id_acto_tpo',
'where a.id_fsclzcion_expdnte in (select a.id_fsclzcion_expdnte from json_table(:P86_JSON, ''$[*]'' columns(id_fsclzcion_expdnte number path ''$.ID_FSCLZCION_EXPDNTE'')) a)',
'and  h.id_acto is not null ',
'and j.fcha_ntfccion is not  null ',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(209429858400826640)
,p_name=>'ID_CNDDTO_VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNDDTO_VGNCIA'
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
 p_id=>wwv_flow_api.id(209429943074826641)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_03=>'center'
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
 p_id=>wwv_flow_api.id(209468883918744420)
,p_name=>'ID_FSCLZCION_EXPDNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FSCLZCION_EXPDNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(209469993333744431)
,p_name=>'PRDIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>91
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
 p_id=>wwv_flow_api.id(209470034633744432)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(209608289166869201)
,p_name=>'ID_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TREA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(209608369308869202)
,p_name=>'DSCRPCION_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_TREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Etapa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>1000
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
 p_id=>wwv_flow_api.id(209608477836869203)
,p_name=>'ID_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(209608590515869204)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo de acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>50
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
 p_id=>wwv_flow_api.id(209972153212764302)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(209972235996764303)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(209428429111826626)
,p_internal_uid=>209428429111826626
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'    window.localStorage.removeItem(''jsonVigencia'');',
'    config.initialSelection = false;',
'       return selectAll(config, {',
'           name: ''Seleccionar Todos'',',
'           action: allVigencia',
'       }) ;',
'   ',
'}',
''))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(209437362738025628)
,p_interactive_grid_id=>wwv_flow_api.id(209428429111826626)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(209437407017025628)
,p_report_id=>wwv_flow_api.id(209437362738025628)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(209445320533025673)
,p_view_id=>wwv_flow_api.id(209437407017025628)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(209429858400826640)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(209445806296025675)
,p_view_id=>wwv_flow_api.id(209437407017025628)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(209429943074826641)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(209496425012426903)
,p_view_id=>wwv_flow_api.id(209437407017025628)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(209468883918744420)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(209506266159462765)
,p_view_id=>wwv_flow_api.id(209437407017025628)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(209469993333744431)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(209508239061636423)
,p_view_id=>wwv_flow_api.id(209437407017025628)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(209470034633744432)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(209614237038869600)
,p_view_id=>wwv_flow_api.id(209437407017025628)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(209608289166869201)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(209614623633869604)
,p_view_id=>wwv_flow_api.id(209437407017025628)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(209608369308869202)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(209617804796309456)
,p_view_id=>wwv_flow_api.id(209437407017025628)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(209608477836869203)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(209618934609371642)
,p_view_id=>wwv_flow_api.id(209437407017025628)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(209608590515869204)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(209979610910074951)
,p_view_id=>wwv_flow_api.id(209437407017025628)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(209972153212764302)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(209983572191505132)
,p_view_id=>wwv_flow_api.id(209437407017025628)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(209972235996764303)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(209692156307596101)
,p_plug_name=>'Tabulador'
,p_region_name=>'rds'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(36509862944968653)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(209777188793539016)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>100
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(210001691085751501)
,p_plug_name=>unistr('Observaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>100
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'EXISTS'
,p_plug_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from fi_g_expedientes_analisis a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(210005556794751540)
,p_plug_name=>'<b> DATOS EXPEDIENTE </b>'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(36509862944968653)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from fi_g_expedientes_analisis a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO'))
,p_plug_read_only_when_type=>'EXISTS'
,p_plug_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from fi_g_expedientes_analisis a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(210003607277751521)
,p_plug_name=>'Expediente'
,p_region_name=>'expediente2'
,p_parent_plug_id=>wwv_flow_api.id(210005556794751540)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select *',
'from (select  a.id_sjto_impsto,',
'        g.idntfccion_sjto,',
'        a.id_cnddto,',
'        a.candidato,',
'        c.id_fsclzcion_expdnte,',
'        a.nmbre_impsto,',
'        a.nmbre_impsto_sbmpsto,',
'        a.id_prgrma,',
'        a.nmbre_prgrma,',
'        a.id_sbprgrma,',
'        a.nmbre_sbprgrma,',
'        c.id_instncia_fljo,',
'        d.id_fljo_trea_orgen,',
'        c.nmro_expdnte',
'from v_fi_g_candidatos              a',
'join fi_g_candidatos_funcionario    b   on  a.id_cnddto             =   b.id_cnddto',
'join fi_g_fiscalizacion_expdnte     c   on  a.id_cnddto             =   c.id_cnddto    ',
'join wf_g_instancias_transicion     d   on  c.id_instncia_fljo      =   d.id_instncia_fljo',
'join wf_d_flujos_tarea              e   on  d.id_fljo_trea_orgen    =   e.id_fljo_trea',
'join wf_d_tareas                    f   on  e.id_trea               =   f.id_trea',
'join v_si_i_sujetos_impuesto        g   on  a.id_sjto_impsto        =   g.id_sjto_impsto',
'left join fi_g_fsclzcion_expdnte_acto   h  on  h.id_fsclzcion_expdnte =   c.id_fsclzcion_expdnte',
'                                           and h.id_fljo_trea         =   e.id_fljo_trea',
'left join gn_d_actos_tipo_tarea     i   on  i.id_acto_tpo           =   h.id_acto_tpo',
'                                        and i.id_fljo_trea          =   e.id_fljo_trea',
'                                        and i.indcdor_oblgtrio      = ''S''',
'left join gn_g_actos       j   on h.id_acto  = j.id_acto  ',
'join fi_g_expedientes_analisis    k on c.id_fsclzcion_expdnte = k.id_fsclzcion_expdnte',
'--left join nt_g_notificaciones       w   on h.id_acto  = w.id_acto                                           ',
'--left join nt_g_notificaciones_detalle y on w.id_ntfccion = y.id_ntfccion and y.id_ntfccion is not null',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'      and c.cdgo_expdnte_estdo = ''ABT''',
'and d.id_estdo_trnscion in (1,2) ',
'--and b.id_fncnrio = :F_ID_FNCNRIO',
'and k.id_instncia_fljo= :F_ID_INSTNCIA_FLJO ',
'group by a.id_sjto_impsto, ',
'         g.idntfccion_sjto, ',
'         a.id_cnddto, ',
'         a.candidato, ',
'         c.id_fsclzcion_expdnte, ',
'         a.nmbre_impsto, ',
'         a.nmbre_impsto_sbmpsto, ',
'         a.id_prgrma, ',
'         a.nmbre_prgrma, ',
'         a.id_sbprgrma, ',
'         a.nmbre_sbprgrma, ',
'         c.id_instncia_fljo, ',
'         d.id_fljo_trea_orgen, ',
'         c.nmro_expdnte',
'order by  c.nmro_expdnte  );'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(210004074114751525)
,p_name=>'ID_CNDDTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNDDTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(210004163870751526)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(210004212322751527)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sub Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>50
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
 p_id=>wwv_flow_api.id(210004346725751528)
,p_name=>'CANDIDATO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANDIDATO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Candidato'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(210004402262751529)
,p_name=>'NMBRE_PRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_PRGRMA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Programa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(210004578900751530)
,p_name=>'NMBRE_SBPRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_SBPRGRMA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Sub programa'
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(210004628797751531)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(210004741254751532)
,p_name=>'ID_FSCLZCION_EXPDNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FSCLZCION_EXPDNTE'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(210004863787751533)
,p_name=>'ID_PRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRGRMA'
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
 p_id=>wwv_flow_api.id(210004908775751534)
,p_name=>'ID_SBPRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SBPRGRMA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(210005006069751535)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(210005121689751536)
,p_name=>'ID_FLJO_TREA_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA_ORGEN'
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
 p_id=>wwv_flow_api.id(210005295537751537)
,p_name=>'NMRO_EXPDNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_EXPDNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'No. Expedinte'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
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
 p_id=>wwv_flow_api.id(210005365290751538)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(210003948107751524)
,p_internal_uid=>210003948107751524
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
 p_id=>wwv_flow_api.id(210019989684424537)
,p_interactive_grid_id=>wwv_flow_api.id(210003948107751524)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(210020006641424542)
,p_report_id=>wwv_flow_api.id(210019989684424537)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210020581251424547)
,p_view_id=>wwv_flow_api.id(210020006641424542)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(210004074114751525)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210021052215424553)
,p_view_id=>wwv_flow_api.id(210020006641424542)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(210004163870751526)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210021511403424555)
,p_view_id=>wwv_flow_api.id(210020006641424542)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(210004212322751527)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210022080511424557)
,p_view_id=>wwv_flow_api.id(210020006641424542)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(210004346725751528)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210022542894424566)
,p_view_id=>wwv_flow_api.id(210020006641424542)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(210004402262751529)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210023039434424568)
,p_view_id=>wwv_flow_api.id(210020006641424542)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(210004578900751530)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210023515642424572)
,p_view_id=>wwv_flow_api.id(210020006641424542)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(210004628797751531)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210024045922424574)
,p_view_id=>wwv_flow_api.id(210020006641424542)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(210004741254751532)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210024503962424581)
,p_view_id=>wwv_flow_api.id(210020006641424542)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(210004863787751533)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210025026510424583)
,p_view_id=>wwv_flow_api.id(210020006641424542)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(210004908775751534)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210025566929424585)
,p_view_id=>wwv_flow_api.id(210020006641424542)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(210005006069751535)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210026083811424588)
,p_view_id=>wwv_flow_api.id(210020006641424542)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(210005121689751536)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210026581875424590)
,p_view_id=>wwv_flow_api.id(210020006641424542)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(210005295537751537)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210027076954424592)
,p_view_id=>wwv_flow_api.id(210020006641424542)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(210005365290751538)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(210005632155751541)
,p_plug_name=>'Vigencias'
,p_region_name=>'vigencia2'
,p_parent_plug_id=>wwv_flow_api.id(210005556794751540)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>110
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  b.id_expdnte_anlsis_dtll,',
'        f.dscrpcion ||''-''||f.prdo  as prdio,',
'        f.id_prdo,',
'        b.vgncia,',
'        b.id_fljo_trea,',
'        b.id_acto_tpo,',
'        c.id_fsclzcion_expdnte,',
'        e.id_cnddto_vgncia,        ',
'        h.id_trea,',
'        h.dscrpcion_trea,',
'        l.dscrpcion,',
'        m.id_sjto_impsto',
'from fi_g_expedientes_analisis   a',
'join fi_g_expndnts_anlsis_dtlle b on a.id_expdnte_anlsis = b.id_expdnte_anlsis',
'join fi_g_fiscalizacion_expdnte   c on a.id_fsclzcion_expdnte = c.id_fsclzcion_expdnte',
'join v_fi_g_candidatos            m on  c.id_cnddto    =    m.id_cnddto',
'join fi_g_fsclzc_expdn_cndd_vgnc  d on b.id_fsclzc_expdn_cndd_vgnc = d.id_fsclzc_expdn_cndd_vgnc',
'join fi_g_candidatos_vigencia     e on d.id_cnddto_vgncia = e.id_cnddto_vgncia',
'join df_i_periodos                f on  e.id_prdo = f.id_prdo',
'join fi_g_fsclzcion_expdnte_acto  i on  i.id_fsclzcion_expdnte = c.id_fsclzcion_expdnte',
'                                    and i.id_acto_tpo = b.id_Acto_tpo',
'join wf_d_flujos_tarea            g on   i.id_fljo_trea         =   g.id_fljo_trea',
'join wf_d_tareas                  h on   g.id_trea               =   h.id_trea',
'left join  gn_d_actos_tipo        l on b.id_Acto_tpo = l.id_acto_tpo',
'--where a.id_expdnte_anlsis = :P86_ID_EXPDNTE_ANLSIS',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO ',
';'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(210005937538751544)
,p_name=>'ID_CNDDTO_VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNDDTO_VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(210006018762751545)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_03=>'center'
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
 p_id=>wwv_flow_api.id(210006197982751546)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
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
 p_id=>wwv_flow_api.id(210006444214751549)
,p_name=>'ID_FSCLZCION_EXPDNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FSCLZCION_EXPDNTE'
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
 p_id=>wwv_flow_api.id(210006577820751550)
,p_name=>'PRDIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>91
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
 p_id=>wwv_flow_api.id(210033280518981801)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(210033381496981802)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo de acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>50
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(210033426503981803)
,p_name=>'ID_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TREA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(210033598043981804)
,p_name=>'DSCRPCION_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_TREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Etapa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>1000
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
 p_id=>wwv_flow_api.id(210033640263981805)
,p_name=>'ID_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_TPO'
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
 p_id=>wwv_flow_api.id(210812864416518501)
,p_name=>'ID_EXPDNTE_ANLSIS_DTLL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EXPDNTE_ANLSIS_DTLL'
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
 p_id=>wwv_flow_api.id(210812928881518502)
,p_name=>'ID_FLJO_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(210005816539751543)
,p_internal_uid=>210005816539751543
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
 p_id=>wwv_flow_api.id(210040904995021289)
,p_interactive_grid_id=>wwv_flow_api.id(210005816539751543)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(210041039648021289)
,p_report_id=>wwv_flow_api.id(210040904995021289)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210041557688021302)
,p_view_id=>wwv_flow_api.id(210041039648021289)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(210005937538751544)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210042046180021312)
,p_view_id=>wwv_flow_api.id(210041039648021289)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(210006018762751545)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210042558229021314)
,p_view_id=>wwv_flow_api.id(210041039648021289)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(210006197982751546)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210043812526021333)
,p_view_id=>wwv_flow_api.id(210041039648021289)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(210006444214751549)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210044338712021335)
,p_view_id=>wwv_flow_api.id(210041039648021289)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(210006577820751550)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210044810562021337)
,p_view_id=>wwv_flow_api.id(210041039648021289)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(210033280518981801)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210045327269021338)
,p_view_id=>wwv_flow_api.id(210041039648021289)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(210033381496981802)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210045843778021340)
,p_view_id=>wwv_flow_api.id(210041039648021289)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(210033426503981803)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210046364422021342)
,p_view_id=>wwv_flow_api.id(210041039648021289)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(210033598043981804)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210046886905021344)
,p_view_id=>wwv_flow_api.id(210041039648021289)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(210033640263981805)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210818882141518731)
,p_view_id=>wwv_flow_api.id(210041039648021289)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(210812864416518501)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210819368950518739)
,p_view_id=>wwv_flow_api.id(210041039648021289)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(210812928881518502)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(210118882979376001)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>110
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'    </b>',
'</h5>',
'',
'<p align="justify">',
'<i>Funcionalidad que permite consultar los expedientes de un contribuyente.</i>',
'</p>',
'',
'<p align="justify">',
'<i> Consultar un expediente y seleccionar las vigencias asociadas al acto que se desea analizar, una vez registrada la solicitud, actualiza un indicador de bloqueo en el expediente seleccionado.</i>',
'</p>',
'',
'',
'<p align="justify">',
unistr('<i>Agregar adjuntos como evidencia al an\00E1lisis  y al flujo del expediente. Permite registrar una observaci\00F3n '),
unistr('de la gesti\00F3n realizada.</i>'),
'</p>',
'',
'<p align="justify">',
unistr('<i>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>'),
'</p>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(210172390077515101)
,p_plug_name=>unistr('<b>INFORMACI\00D3N PQR</b>')
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(36509862944968653)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(209392428535047904)
,p_plug_name=>'<b> DATOS SOLICITUD </b>'
,p_parent_plug_id=>wwv_flow_api.id(210172390077515101)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(209394603930047926)
,p_plug_name=>'<b> DATOS SOLICITANTE </b>'
,p_parent_plug_id=>wwv_flow_api.id(210172390077515101)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>80
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(209705224480624501)
,p_plug_name=>'<b> DOCUMENTOS </b>'
,p_parent_plug_id=>wwv_flow_api.id(210172390077515101)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>90
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(209426015232826602)
,p_plug_name=>'<b>DOCUMENTOS</b>'
,p_parent_plug_id=>wwv_flow_api.id(209705224480624501)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.id_dcmnto',
'     , d.id_slctud',
'     , d.file_name ',
'     , d.obsrvcion',
'     , md.dscrpcion_dcmnto',
'     , d.fcha',
'     , case when d.actvo = ''S'' then',
'         ''<span style="color:green;"aria-hidden="true" class="fa fa-check-square"></span>''',
'         else',
'         ''<span style="color:red;"class="fa fa-times-square" aria-hidden="true"></span>''',
'         end actvo',
'  from pq_g_documentos d',
'  join v_pq_d_motivos_documento md',
'    on d.id_mtvo_dcmnto = md.id_mtvo_dcmnto',
'    where id_slctud = :P86_ID_SLCTUD '))
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
 p_id=>wwv_flow_api.id(209776348367539008)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LARIZA'
,p_internal_uid=>209776348367539008
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(209776896201539013)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>10
,p_column_identifier=>'E'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(209776755372539012)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>20
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(209776463684539009)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>30
,p_column_identifier=>'A'
,p_column_label=>'<p></p>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTOS:FILE_BLOB:ID_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(209776585456539010)
,p_db_column_name=>'ID_SLCTUD'
,p_display_order=>40
,p_column_identifier=>'B'
,p_column_label=>'Id Slctud'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(209776604293539011)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>50
,p_column_identifier=>'C'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(209777087672539015)
,p_db_column_name=>'ACTVO'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Aceptado'
,p_column_html_expression=>'#ACTVO#'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(209776934828539014)
,p_db_column_name=>'FCHA'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Fecha Subida'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(209795266286658301)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2097953'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_DCMNTO:OBSRVCION:ID_DCMNTO:ID_SLCTUD:FILE_NAME:ACTVO:FCHA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(209740320162252004)
,p_plug_name=>'<b> DATOS GESTOR </b>'
,p_parent_plug_id=>wwv_flow_api.id(210172390077515101)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>70
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(210172435783515102)
,p_plug_name=>'<b> ADJUNTOS </b>'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from gn_g_adjuntos a',
'where a.id_orgen = :F_ID_INSTNCIA_FLJO'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(210172682770515104)
,p_plug_name=>'Adjuntos'
,p_region_name=>'Adjuntos'
,p_parent_plug_id=>wwv_flow_api.id(210172435783515102)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.ID_ADJNTO,',
'       a.id_usrio,',
'       f.nmbre_trea,',
'       e.nmbre_trcro,',
'       a.obsrvcion,',
'       a.file_name,',
'       to_char(a.fcha_rgstro, ''DD/MM/YYYY'') as fecha, ',
'      case',
'         when a.file_mimetype like ''%excel.sheet%'' then',
'            ''-''',
'        else ',
'            ''<a href="''||APEX_UTIL.PREPARE_URL(p_url => ''f?p=''|| 50000 || '':'' || 127 || '':'' || :app_session ||''::NO:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:gn_g_adjunto'
||'s,FILE_BLOB,FILE_NAME,FILE_MIMETYPE,ID_ADJNTO,'' || a.id_adjnto, p_checksum_type => ''SESSION'')||''">Ver <span aria-hidden="true" class="fa fa-eye"></span></a>''',
'        end as ver,',
'       3 descargar_adjunto  ',
'   from GN_G_ADJUNTOS a',
'--join fi_g_expedientes_analisis b on a.id_orgen = b.id_instncia_fljo',
'--join fi_g_fiscalizacion_expdnte c on b.id_fsclzcion_expdnte = c.id_fsclzcion_expdnte',
'join sg_g_usuarios  d   on  a.id_usrio = d.id_usrio',
'join v_si_c_terceros  e   on  d.id_trcro = e.id_trcro',
'join v_wf_d_flujos_tarea  f   on  a.id_fljo_trea  =   f.id_fljo_trea',
'where a.id_orgen = :F_ID_INSTNCIA_FLJO;',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from gn_g_adjuntos a',
'where a.id_orgen = :F_ID_INSTNCIA_FLJO'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(210583399072802205)
,p_name=>'ID_USRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_USRIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(210583474480802206)
,p_name=>'NMBRE_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Etapa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>1000
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
 p_id=>wwv_flow_api.id(210583540898802207)
,p_name=>'NMBRE_TRCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TRCRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Usuario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>503
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
 p_id=>wwv_flow_api.id(210583611613802208)
,p_name=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION'
,p_data_type=>'CLOB'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>32767
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(210583791685802209)
,p_name=>'FILE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FILE_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Archivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>255
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
 p_id=>wwv_flow_api.id(210583822741802210)
,p_name=>'FECHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FECHA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha de cargue'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(210583926550802211)
,p_name=>'ID_ADJNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ADJNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(210584029693802212)
,p_name=>'VER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VER'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Ver'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_CLAVE_PRIMARIA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_VALOR,P127_COLUMNA_BFILE:GN_G_ADJUNTOS,ID_ADJNTO,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,&ID_ADJNTO.,FILE_BFILE'
,p_link_text=>'<center><span class=" fa fa-eye fa-1x fa-spin"></span></center>'
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
 p_id=>wwv_flow_api.id(210584106430802213)
,p_name=>'DESCARGAR_ADJUNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCARGAR_ADJUNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Descargar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attribute_01=>'<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>'
,p_link_target=>'f?p=&APP_ID.:86:&SESSION.:DESCARGAR_ADJUNTO:&DEBUG.:RP:P86_ID_ADJNTO,P86_ID_INSTNCIA_FLJO:&ID_ADJNTO.,&F_ID_INSTNCIA_FLJO.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(210583227365802204)
,p_internal_uid=>210583227365802204
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN'
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
 p_id=>wwv_flow_api.id(210592767176011613)
,p_interactive_grid_id=>wwv_flow_api.id(210583227365802204)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(210592855478011617)
,p_report_id=>wwv_flow_api.id(210592767176011613)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210593379530011644)
,p_view_id=>wwv_flow_api.id(210592855478011617)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(210583399072802205)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210593763019011660)
,p_view_id=>wwv_flow_api.id(210592855478011617)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(210583474480802206)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210594257949011663)
,p_view_id=>wwv_flow_api.id(210592855478011617)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(210583540898802207)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210594772931011665)
,p_view_id=>wwv_flow_api.id(210592855478011617)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(210583611613802208)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210595249684011667)
,p_view_id=>wwv_flow_api.id(210592855478011617)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(210583791685802209)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210595780700011669)
,p_view_id=>wwv_flow_api.id(210592855478011617)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(210583822741802210)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210596232769011671)
,p_view_id=>wwv_flow_api.id(210592855478011617)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(210583926550802211)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210596704597011673)
,p_view_id=>wwv_flow_api.id(210592855478011617)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(210584029693802212)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(210597202385011675)
,p_view_id=>wwv_flow_api.id(210592855478011617)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(210584106430802213)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(213311336320844801)
,p_plug_name=>unistr('<b> OBSERVACIONES DEL AN\00C1LISIS DEL ABOGADO</b>')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from fi_g_expndnts_analisis_obsvcion a',
'join fi_g_expedientes_analisis b on a.id_expdnte_anlsis = b.id_expdnte_anlsis--BVM 11-04-2024',
'where b.id_instncia_fljo = :P86_ID_INSTNCIA_FLJO--BVM 11-04-2024',
'/*select 1',
'from fi_g_expndnts_analisis_obsvcion a',
'where a.id_instncia_fljo = :P86_ID_INSTNCIA_FLJO*/',
';'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(213311404774844802)
,p_plug_name=>'Observaciones'
,p_region_name=>'observacion'
,p_parent_plug_id=>wwv_flow_api.id(213311336320844801)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_expdnte_anlss_obsvcn,',
'        a.asnto_obsrvcion,',
'        a.id_expdnte_anlsis,',
'        --a.id_fsclzcion_expdnte,',
'        a.id_fljo_trea,',
'        --to_char(a.fcha_rchzo,''DD/MM/YYYY HH24:MI:SS AM'') as fcha_rchzo, ',
'        to_char(a.fcha_obsrvcion,''DD/MM/YYYY HH24:MI:SS AM'') as fcha_rchzo,       ',
'        a.id_usrio,--a.id_usrio_rchzo,',
'        a.obsrvcion,--a.obsrvcion_rchzo,',
'        a.indcdor_cnfrmdo,',
'        f.nmbre_trea,',
'        e.nmbre_trcro',
'from fi_g_expndnts_analisis_obsvcion a ',
'--join sg_g_usuarios  d   on  a.ID_USRIO_RCHZO = d.id_usrio',
'join sg_g_usuarios  d   on  a.id_usrio = d.id_usrio',
'join v_si_c_terceros  e   on  d.id_trcro = e.id_trcro',
'join v_wf_d_flujos_tarea  f   on  a.id_fljo_trea  =   f.id_fljo_trea',
'--where a.id_instncia_fljo = :P87_ID_INSTNCIA_FLJO;',
'where a.id_expdnte_anlsis = :P87_ID_EXPDNTE_ANLSIS',
'/*',
'select  a.id_expdnte_anlss_obsvcn,',
'        a.asnto_obsrvcion,',
'        a.id_expdnte_anlsis,',
'        b.id_fsclzcion_expdnte,--BVM 11-04-2024',
'        a.id_fljo_trea,',
'        to_char(b.fcha_rchzo,''DD/MM/YYYY HH24:MI:SS AM'') as fcha_rchzo,--BVM 11-04-2024',
'        b.id_usrio_rchzo,--BVM 11-04-2024',
'        b.obsrvcion_rchzo,--BVM 11-04-2024',
'        a.indcdor_cnfrmdo,',
'        f.nmbre_trea,',
'        e.nmbre_trcro',
'from fi_g_expndnts_analisis_obsvcion a ',
'join fi_g_expedientes_analisis b on a.id_expdnte_anlsis = b.id_expdnte_anlsis--BVM 11-04-2024',
'join sg_g_usuarios  d   on  b.ID_USRIO_RCHZO = d.id_usrio--BVM 11-04-2024',
'join v_si_c_terceros  e   on  d.id_trcro = e.id_trcro',
'join v_wf_d_flujos_tarea  f   on  a.id_fljo_trea  =   f.id_fljo_trea',
'where b.id_instncia_fljo = :F_ID_INSTNCIA_FLJO--BVM 11-04-2024',
'*/',
'/*select  a.id_expdnte_anlss_obsvcn,',
'        a.asnto_obsrvcion,',
'        a.id_expdnte_anlsis,',
'        a.id_fsclzcion_expdnte,',
'        a.id_fljo_trea,',
'        to_char(a.fcha_rchzo,''DD/MM/YYYY HH24:MI:SS AM'') as fcha_rchzo,       ',
'        a.id_usrio_rchzo,',
'        a.obsrvcion_rchzo,',
'        a.indcdor_cnfrmdo,',
'        f.nmbre_trea,',
'       e.nmbre_trcro',
'from fi_g_expndnts_analisis_obsvcion a ',
'join sg_g_usuarios  d   on  a.ID_USRIO_RCHZO = d.id_usrio',
'join v_si_c_terceros  e   on  d.id_trcro = e.id_trcro',
'join v_wf_d_flujos_tarea  f   on  a.id_fljo_trea  =   f.id_fljo_trea',
'',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO*/',
';'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(49260932935348201)
,p_name=>'ID_USRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_USRIO'
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
 p_id=>wwv_flow_api.id(49261042627348202)
,p_name=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>3000
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
 p_id=>wwv_flow_api.id(213311732592844805)
,p_name=>'ID_EXPDNTE_ANLSS_OBSVCN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EXPDNTE_ANLSS_OBSVCN'
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
 p_id=>wwv_flow_api.id(213311802348844806)
,p_name=>'ASNTO_OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ASNTO_OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Asunto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(213311901096844807)
,p_name=>'ID_EXPDNTE_ANLSIS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EXPDNTE_ANLSIS'
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
 p_id=>wwv_flow_api.id(213312130040844809)
,p_name=>'ID_FLJO_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(213312215022844810)
,p_name=>'FCHA_RCHZO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RCHZO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha Observaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_max_length=>22
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
 p_id=>wwv_flow_api.id(213312523875844813)
,p_name=>'INDCDOR_CNFRMDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_CNFRMDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFConfirmado?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00CD')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(213333016111955501)
,p_name=>'NMBRE_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Etapa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>1000
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
 p_id=>wwv_flow_api.id(213333152391955502)
,p_name=>'NMBRE_TRCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TRCRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Usuario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>503
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
 p_id=>wwv_flow_api.id(213334555666955516)
,p_name=>'VER'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Ver<span class="fa fa-eye"></span>'
,p_link_target=>'f?p=&APP_ID.:90:&SESSION.::&DEBUG.:RP,90,90:P90_ID_EXPDNTE_ANLSS_OBSVCN:&ID_EXPDNTE_ANLSS_OBSVCN.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(213311616276844804)
,p_internal_uid=>213311616276844804
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
 p_id=>wwv_flow_api.id(213323018159883520)
,p_interactive_grid_id=>wwv_flow_api.id(213311616276844804)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(213323160577883520)
,p_report_id=>wwv_flow_api.id(213323018159883520)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49266948707348439)
,p_view_id=>wwv_flow_api.id(213323160577883520)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(49260932935348201)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49267431201348444)
,p_view_id=>wwv_flow_api.id(213323160577883520)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(49261042627348202)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>487.514
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213323673680883522)
,p_view_id=>wwv_flow_api.id(213323160577883520)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(213311732592844805)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213324140782883524)
,p_view_id=>wwv_flow_api.id(213323160577883520)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(213311802348844806)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213324657366883526)
,p_view_id=>wwv_flow_api.id(213323160577883520)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(213311901096844807)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213325649256883530)
,p_view_id=>wwv_flow_api.id(213323160577883520)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(213312130040844809)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213326173260883533)
,p_view_id=>wwv_flow_api.id(213323160577883520)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(213312215022844810)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>183
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213327698655883540)
,p_view_id=>wwv_flow_api.id(213323160577883520)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(213312523875844813)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>112
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213339065399955687)
,p_view_id=>wwv_flow_api.id(213323160577883520)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(213333016111955501)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>171
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213339597898955690)
,p_view_id=>wwv_flow_api.id(213323160577883520)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(213333152391955502)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213376852530289846)
,p_view_id=>wwv_flow_api.id(213323160577883520)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(213334555666955516)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>30
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(277494246176251082)
,p_plug_name=>unistr('Par\00E1metros busquedas ')
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36491913657968646)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NOT_EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--and b.id_fljo_trea = :P86_ID_FLJO_TREA',
'--and a.id_expdnte_anlsis = :P86_ID_EXPDNTE_ANLSIS',
'select 1',
'from fi_g_expedientes_analisis  a',
'join fi_g_expndnts_anlsis_dtlle b on a.id_expdnte_anlsis = b.id_expdnte_anlsis',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(209522566502591305)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(209777188793539016)
,p_button_name=>'BTN_REGISTRAR'
,p_button_static_id=>'solicitud'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from fi_g_expedientes_analisis a',
'join fi_g_expndnts_anlsis_dtlle b on a.id_expdnte_anlsis = b.id_expdnte_anlsis',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(210108621109272201)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(209777188793539016)
,p_button_name=>'BTN_AGRGR_ADJNTOS'
,p_button_static_id=>'adjunto'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar adjuntos'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=73000:10000:&SESSION.::&DEBUG.:RP,10000:P10000_ID_INSTNCIA_FLJO,P10000_ID_FLJO_TREA,P10000_ID_ORGEN,P10000_CDGO_ORGEN_TPO,P10000_CDGO_PRCSO,P10000_APP,P10000_PAGE:&F_ID_INSTNCIA_FLJO.,&F_ID_FLJO_TREA.,&F_ID_INSTNCIA_FLJO.,fi_g_expedientes_analisis,FISCA,74000,86'
,p_icon_css_classes=>'fa-upload'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(211084630411509501)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(209777188793539016)
,p_button_name=>'BTN_CONFIRMAR'
,p_button_static_id=>'adjunto'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Confirmar Solictud'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=73000:10000:&SESSION.::&DEBUG.:RP,10000:P10000_ID_INSTNCIA_FLJO,P10000_ID_FLJO_TREA,P10000_ID_ORGEN,P10000_CDGO_ORGEN_TPO,P10000_CDGO_PRCSO:&P86_ID_INSTNCIA_FLJO.,&F_ID_FLJO_TREA.,&P86_ID_INSTNCIA_FLJO.,fi_g_expedientes_analisis,FISCA'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-upload'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(211084761889509502)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(209777188793539016)
,p_button_name=>'BTN_RECHAZAR'
,p_button_static_id=>'adjunto'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Rechazar Solicitud'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=73000:10000:&SESSION.::&DEBUG.:RP,10000:P10000_ID_INSTNCIA_FLJO,P10000_ID_FLJO_TREA,P10000_ID_ORGEN,P10000_CDGO_ORGEN_TPO,P10000_CDGO_PRCSO:&P86_ID_INSTNCIA_FLJO.,&F_ID_FLJO_TREA.,&P86_ID_INSTNCIA_FLJO.,fi_g_expedientes_analisis,FISCA'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-upload'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(209467116389744403)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(277494246176251082)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(211738461422794803)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(277494246176251082)
,p_button_name=>'BTN_CNSLTAR_1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(142105110694294101)
,p_branch_name=>'Regresar pagina contador'
,p_branch_action=>'f?p=&APP_ID.:86:&SESSION.::&DEBUG.:RP:P86_ID_INSTNCIA_FLJO:&P86_ID_INSTNCIA_FLJO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209341323238076901)
,p_name=>'P86_ID_INSTNCIA_FLJO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(209211643942471601)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209347268487120976)
,p_name=>'P86_IMPUESTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(277494246176251082)
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
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209347564437123511)
,p_name=>'P86_PRGRMA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(277494246176251082)
,p_prompt=>'Programa'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_prgrma as d,',
'        a.id_prgrma as r ',
'from fi_d_programas a where  a.cdgo_prgrma != ''OD'';'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209347834817167124)
,p_name=>'P86_SUBPRGRMA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(277494246176251082)
,p_prompt=>'SubPrograma'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_sbprgrma as d,',
'        a.id_sbprgrma as r ',
'from fi_d_subprogramas a',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.id_prgrma = :P86_PRGRMA',
'and actvo = ''S'';',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P86_PRGRMA'
,p_ajax_items_to_submit=>'P86_SUBPRGRMA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209348143650179514)
,p_name=>'P86_FLJO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(277494246176251082)
,p_prompt=>'Flujo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion_fljo as d,',
'       a.id_fljo as r',
'from wf_d_flujos a',
'where a.id_fljo = (select  b.id_fljo ',
'                   from fi_d_programas b',
'                   where b.id_prgrma = :P86_PRGRMA);'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P86_PRGRMA'
,p_ajax_items_to_submit=>'P86_FLJO'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209348478107187324)
,p_name=>'P86_ETPA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(277494246176251082)
,p_prompt=>'Etapa'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.dscrpcion_trea,',
'       a.id_fljo_trea',
'from wf_d_flujos_tarea  a',
'join wf_d_tareas        b   on  a.id_trea   =   b.id_trea',
'where a.id_fljo = :P86_FLJO',
'order by b.dscrpcion_trea;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P86_FLJO'
,p_ajax_items_to_submit=>'P86_ETPA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209348727204189549)
,p_name=>'P86_IDNTFCCION_SJTO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(277494246176251082)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209392576270047905)
,p_name=>'P86_ID_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(209392428535047904)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'COPY OF LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
,p_lov_display_null=>'YES'
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36555174524968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209392609514047906)
,p_name=>'P86_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(209392428535047904)
,p_prompt=>'Sub - Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'COPY OF LV_IMPUESTO_SUBIMPUESTO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select initcap(NMBRE_IMPSTO_SBMPSTO)  as d,',
'       ID_IMPSTO_SBMPSTO as r',
'  from DF_I_IMPUESTOS_SUBIMPUESTO',
'',
' order by 1'))
,p_lov_display_null=>'YES'
,p_grid_column=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36555174524968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209392755223047907)
,p_name=>'P86_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(209392428535047904)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209392873621047908)
,p_name=>'P86_IDNTFCCION_SJTO2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(209392428535047904)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36555174524968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209392913557047909)
,p_name=>'P86_OBSRVCION_S'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(209392428535047904)
,p_prompt=>unistr('Observaci\00F3n de la solicitud')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36554884028968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209393192807047911)
,p_name=>'P86_ID_MTVO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(209392428535047904)
,p_prompt=>'Motivo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_mtvo ',
'  from pq_d_motivos',
' where cdgo_clnte = :f_cdgo_clnte',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36555174524968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209393243677047912)
,p_name=>'P86_ID_SLCTUD'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(209392428535047904)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209393304772047913)
,p_name=>'P86_NMRO_RDCDO_DSPLAY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(209392428535047904)
,p_prompt=>unistr('N\00B0 Radicado')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36554884028968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209393483294047914)
,p_name=>'P86_FCHA_RDCDO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(209392428535047904)
,p_prompt=>'Fecha Radicado'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36554884028968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209394701692047927)
,p_name=>'P86_CDGO_RSPNSBLE_TPO_S'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(209394603930047926)
,p_prompt=>'Tipo Radicador'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_rspnsble_tpo',
'     , cdgo_rspnsble_tpo ',
'  from df_s_responsables_tipo'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36554884028968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209394872035047928)
,p_name=>'P86_CDGO_IDNTFCCION_TPO_S'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(209394603930047926)
,p_prompt=>unistr('Tipo Identificaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IDENTIFICACIONES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_IDNTFCCION_TPO as d,',
'       CDGO_IDNTFCCION_TPO as r',
'  from DF_S_IDENTIFICACIONES_TIPO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36555174524968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209394973292047929)
,p_name=>'P86_IDNTFCCION_S'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(209394603930047926)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36555174524968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209395068795047930)
,p_name=>'P86_PRMER_NMBRE_S'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(209394603930047926)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36555174524968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209395192230047931)
,p_name=>'P86_DRCCION_NTFCCION_S'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(209394603930047926)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_colspan=>6
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36555174524968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209395322177047933)
,p_name=>'P86_TLFNO_S'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(209394603930047926)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36554884028968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209395424698047934)
,p_name=>'P86_CLLAR_S'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(209394603930047926)
,p_prompt=>'Celular'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36554884028968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209467543303744407)
,p_name=>'P86_JSON'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(209426821652826610)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209467690323744408)
,p_name=>'P86_ID_FSCLZCION_EXPDNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(209426821652826610)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209630704078923502)
,p_name=>'P86_EMAIL_S'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(209394603930047926)
,p_prompt=>'E-mail'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36554884028968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209706212003624511)
,p_name=>'P86_ID_PRSNTCION_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(209392428535047904)
,p_prompt=>unistr('Tipo de Presentaci\00F3n ')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_prsntcion_tpo ',
'  from pq_d_presentaciones_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36555174524968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209706376337624512)
,p_name=>'P86_ID_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(209392428535047904)
,p_prompt=>'Tipo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_tpo',
'  from pq_d_tipos',
'  where cdgo_clnte = :F_CDGO_CLNTE;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36555174524968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209706426903624513)
,p_name=>'P86_SGNDO_NMBRE_S'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(209394603930047926)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36554884028968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209706569276624514)
,p_name=>'P86_PRMER_APLLDO_S'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(209394603930047926)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36555174524968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209706671466624515)
,p_name=>'P86_SGNDO_APLLDO_S'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(209394603930047926)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36554884028968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209706715113624516)
,p_name=>'P86_ID_PAIS_NTFCCION_S'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(209394603930047926)
,p_prompt=>unistr('Direcci\00F3n Notificaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_pais as d,',
'       id_pais  as r',
'  from df_s_paises',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(36555174524968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209706843702624517)
,p_name=>'P86_ID_DPRTMNTO_NTFCCION_S'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(209394603930047926)
,p_prompt=>'Departamento'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_dprtmnto',
'     , id_dprtmnto ',
'  from df_s_departamentos ',
' where id_pais = :P11_ID_PAIS_NTFCCION_S;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P86_ID_PAIS_NTFCCION_S'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36555174524968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209706908893624518)
,p_name=>'P86_ID_MNCPIO_NTFCCION_S'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(209394603930047926)
,p_prompt=>'Municipio'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_mncpio',
'     , id_mncpio ',
'  from df_s_municipios ',
' where id_dprtmnto = :P11_ID_DPRTMNTO_NTFCCION_S'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P86_ID_DPRTMNTO_NTFCCION_S'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>10
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36555174524968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209740400808252005)
,p_name=>'P86_ID_RDCDOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(209740320162252004)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209740500177252006)
,p_name=>'P86_CDGO_IDNTFCCION_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(209740320162252004)
,p_prompt=>unistr('Tipo de Presentaci\00F3n ')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IDENTIFICACIONES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_IDNTFCCION_TPO as d,',
'       CDGO_IDNTFCCION_TPO as r',
'  from DF_S_IDENTIFICACIONES_TIPO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36555174524968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209741865148252019)
,p_name=>'P86_VLDAR_TRBTO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(209392428535047904)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209760005686434501)
,p_name=>'P86_PRMER_NMBRE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(209740320162252004)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36555174524968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209760126494434502)
,p_name=>'P86_SGNDO_NMBRE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(209740320162252004)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36554884028968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209760201727434503)
,p_name=>'P86_PRMER_APLLDO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(209740320162252004)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36554884028968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209760398682434504)
,p_name=>'P86_SGNDO_APLLDO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(209740320162252004)
,p_prompt=>'Segundo apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36554884028968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209760478044434505)
,p_name=>'P86_IDNTFCCION'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(209740320162252004)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>22
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36554884028968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209946455634483501)
,p_name=>'P86_ID_USRIO_ESPCFCO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(209777188793539016)
,p_prompt=>'Abogado / Fiscalizador'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  f.nmbre_trcro d,',
'        d.id_usrio r',
'from fi_g_cnddtos_fncnrio_trza a',
'join    fi_g_candidatos_funcionario b on a.id_cnddto_fncnrio = b.id_cnddto_fncnrio',
'join fi_g_fiscalizacion_expdnte c on b.id_cnddto = c.id_cnddto',
'join  df_c_funcionarios e   on  b.id_fncnrio = e.id_fncnrio',
'join v_si_c_terceros  f   on  e.id_trcro = f.id_trcro',
'join sg_g_usuarios  d   on  f.id_trcro = d.id_trcro',
'join fi_g_expedientes_analisis g on c.id_fsclzcion_expdnte = g.id_fsclzcion_expdnte',
'where g.id_expdnte_anlsis = :P86_ID_EXPDNTE_ANLSIS',
'/*where g.id_expdnte_anlsis in (select a.id_fsclzcion_expdnte ',
'                              from json_table(:P86_JSON, ''$[*]'' columns(id_fsclzcion_expdnte number ',
'                                                                        path ''$.ID_FSCLZCION_EXPDNTE'')) a)*/',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when=>'P86_ID_EXPDNTE_ANLSIS'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(209972076328764301)
,p_name=>'P86_ID_INSTNCIA_FLJO_PDRE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(209211643942471601)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(210001766977751502)
,p_name=>'P86_OBSRVCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(210001691085751501)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>100
,p_cMaxlength=>2000
,p_cHeight=>15
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(210584207028802214)
,p_name=>'P86_ID_ADJNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(210172682770515104)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(210635286503079002)
,p_name=>'P86_ID_EXPDNTE_ANLSIS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(277494246176251082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(210635332045079003)
,p_name=>'P86_ID_EXPDNTE_ANLSIS_DTLL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(277494246176251082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(210635486772079004)
,p_name=>'P86_ID_FLJO_TREA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(277494246176251082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(210635548444079005)
,p_name=>'P86_ID_PRDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(277494246176251082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(210635676536079006)
,p_name=>'P86_VGNCIA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(277494246176251082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(211004288347244101)
,p_name=>'P86_NMRO_EXPDNTE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(277494246176251082)
,p_prompt=>'Nro. Expediente'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(211444702206449602)
,p_name=>'P86_ID_INSTNCIA_FLJO_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(209211643942471601)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(211588444996044001)
,p_name=>'P86_ID_ACTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(277494246176251082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213068459340526903)
,p_name=>'P86_INDCDOR_RCHZAR'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(209777188793539016)
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(209754082835350501)
,p_computation_sequence=>10
,p_computation_item=>'P86_ID_INSTNCIA_FLJO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'F_ID_INSTNCIA_FLJO'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(211730004883574901)
,p_validation_name=>'Validar tributo'
,p_validation_sequence=>20
,p_validation=>'P86_IMPUESTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione el Tributo.'
,p_when_button_pressed=>wwv_flow_api.id(211738461422794803)
,p_associated_item=>wwv_flow_api.id(209347268487120976)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(211730160052574902)
,p_validation_name=>'Validar programa'
,p_validation_sequence=>30
,p_validation=>'P86_PRGRMA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione el Programa'
,p_when_button_pressed=>wwv_flow_api.id(211738461422794803)
,p_associated_item=>wwv_flow_api.id(209347564437123511)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(211730251666574903)
,p_validation_name=>'Validar sub programa'
,p_validation_sequence=>40
,p_validation=>'P86_SUBPRGRMA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione el Sub programa'
,p_when_button_pressed=>wwv_flow_api.id(211738461422794803)
,p_associated_item=>wwv_flow_api.id(209347834817167124)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(211738521423794804)
,p_validation_name=>'Validar flujo'
,p_validation_sequence=>50
,p_validation=>'P86_FLJO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione el Flujo'
,p_when_button_pressed=>wwv_flow_api.id(211738461422794803)
,p_associated_item=>wwv_flow_api.id(209348143650179514)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(211722011544918401)
,p_validation_name=>unistr('Validar identificaci\00F3n')
,p_validation_sequence=>60
,p_validation=>'P86_IDNTFCCION_SJTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Ingrese la identificaci\00F3n.')
,p_when_button_pressed=>wwv_flow_api.id(211738461422794803)
,p_associated_item=>wwv_flow_api.id(209348727204189549)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(209468002821744412)
,p_name=>'Al seleccionar expediente'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(209426821652826610)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(209468196711744413)
,p_event_id=>wwv_flow_api.id(209468002821744412)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'buildJsonExpediente();',
'ocultarBotonInciarFsclzcion();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(209468479171744416)
,p_event_id=>wwv_flow_api.id(209468002821744412)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P86_JSON'
,p_attribute_03=>'P86_JSON'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(209468529321744417)
,p_event_id=>wwv_flow_api.id(209468002821744412)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(209428372683826625)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(210060671283140123)
,p_event_id=>wwv_flow_api.id(209468002821744412)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(210005556794751540)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(209469786351744429)
,p_name=>'Al seleccionar vigencia'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'apexbeforepagesubmit'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(209469843865744430)
,p_event_id=>wwv_flow_api.id(209469786351744429)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'buildJsonVigencia();',
'ocultarBotonInciarFsclzcion();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(209741695895252017)
,p_name=>'Al cambiar tipo'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P86_ID_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(209741755868252018)
,p_event_id=>wwv_flow_api.id(209741695895252017)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select vldar_trbto',
'      into :P11_VLDAR_TRBTO',
'      from pq_d_tipos ',
'     where id_tpo = :P11_ID_TPO; ',
'exception',
'    when others then',
'        :P11_VLDAR_TRBTO := null;',
'end;'))
,p_attribute_02=>'P86_ID_TPO'
,p_attribute_03=>'P86_VLDAR_TRBTO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(209741937601252020)
,p_name=>'al cambiar validar tributo'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P86_VLDAR_TRBTO'
,p_condition_element=>'P86_VLDAR_TRBTO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(209742051162252021)
,p_event_id=>wwv_flow_api.id(209741937601252020)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P86_ID_IMPSTO,P86_ID_IMPSTO_SBMPSTO,P986_IDNTFCCION_SJTO2'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(209742120354252022)
,p_event_id=>wwv_flow_api.id(209741937601252020)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P86_ID_IMPSTO,P86_ID_IMPSTO_SBMPSTO,P986_IDNTFCCION_SJTO2'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(209946524830483502)
,p_name=>'Seleccionar abogado'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P86_ID_USRIO_ESPCFCO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(209946604691483503)
,p_event_id=>wwv_flow_api.id(209946524830483502)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P86_ID_USRIO_ESPCFCO'
,p_attribute_03=>'P86_ID_USRIO_ESPCFCO'
,p_attribute_04=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(210001844928751503)
,p_name=>'Registrar solicitud'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(209522566502591305)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(210001911383751504)
,p_event_id=>wwv_flow_api.id(210001844928751503)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function registrarSolicitud() {',
'    try {',
'        ',
'        var popup = apex.widget.waitPopup();',
'        console.log("Entrando");',
'        buildJsonVigencia();',
'        console.log("Saliendo");',
'        var json = window.localStorage.jsonVigencia;',
'        let contentJson = JSON.parse(json);',
'        ',
'       ',
'        let array = contentJson.length <= 1001 ? contentJson : contentJson.slice(0, 1000);',
'        await apex.server.process("AjaxRegistrarSolicitud", {',
'            //f01: json,',
'              f01: JSON.stringify(array),',
'            pageItems: "#F_CDGO_CLNTE, #F_ID_USRIO"',
'        },{',
'            success: function(data) {',
'                console.log(data);',
'                popup.remove();',
'                if(data.o_cdgo_rspsta > 0) {',
'                    console.log(data.o_mnsje_rspsta);',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors([',
'                        {',
'                            type:       "error",',
'                            location:   "page",',
'                            message:    data.o_mnsje_rspsta,',
'                            unsafe:     false',
'                        }',
'                    ]);',
'                } else {',
unistr('                    apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                    setTimeout(() => {',
'                            location.reload();',
'                        }, 2000)',
'                    apex.submit({request : "BORRAR"});',
'                }',
'            }',
'        })',
'    ',
'    } catch(e) {',
'        popup.remove();',
'        console.log(e);',
'    }',
'}',
'',
unistr('apex.message.confirm("\00BFEst\00E1 seguro de registrar la solicitud de an\00E1lisis de expediente? Una vez que confirme no podr\00E1 adjuntar modificar la informaci\00F3n", function(okPressed) {'),
'   if(okPressed) {',
'       registrarSolicitud();',
'        ',
'   } ',
'});',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(211339970595796101)
,p_name=>'Al consultar'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(209467116389744403)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(211340019354796102)
,p_event_id=>wwv_flow_api.id(211339970595796101)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('console.log(''Inicio funci\00F3n'');'),
'apex.server.process ("Validar_expediente", {  ',
'  pageItems: "#P86_IDNTFCCION_SJTO,#P86_IMPUESTO,#P86_PRGRMA,#P86_SUBPRGRMA,#P86_FLJO,#P86_ETPA,#P86_NMRO_EXPDNTE"',
'  }).then(function(resp){',
'        apex.message.clearErrors();',
'        if (!resp.exists){',
'            ',
'           /* setTimeout(() => {',
'                            location.reload();',
'                        }, 2000)*/',
'                    apex.submit();',
'            ',
'            /*apex.message.showErrors([',
'                { type:"error",',
'                  ',
'                 location:   [ "page", "inline" ],',
unistr('                    message:  resp.MSG//  "No existe expedientes abiertos para la identificaci\00F3n "'),
'                }]);*/',
'          ',
'        }else{',
'            console.log(''else'');',
unistr('            apex.message.showPageSuccess(''\00A1Consulta con \00E9xito!'');'),
'            ',
'             setTimeout(() => {',
'                            location.reload();',
'                        }, 2000)',
'                    apex.submit();',
'        }',
'     }',
');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(211372895228189401)
,p_name=>unistr('Al ingresar observaci\00F3n')
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P86_OBSRVCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(211372906350189402)
,p_event_id=>wwv_flow_api.id(211372895228189401)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P86_OBSRVCION'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(142105257331294102)
,p_name=>'Actualizar'
,p_event_sequence=>100
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(210172435783515102)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(142105374901294103)
,p_event_id=>wwv_flow_api.id(142105257331294102)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(210172435783515102)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(213399847084919102)
,p_name=>'Al cargar expedientes'
,p_event_sequence=>110
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(209428372683826625)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(213399932220919103)
,p_event_id=>wwv_flow_api.id(213399847084919102)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log("Entrando");',
'buildJsonVigencia();',
'console.log("Saliendo");'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(210584404714802216)
,p_process_sequence=>70
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Descargar Archivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Consulta',
'declare',
'    v_file_name varchar2(2000);',
'    v_file_blob     blob;',
'    file_blob blob;',
'    v_file_bfile    bfile;',
'    v_file_mimetype varchar2(1000);',
'    v_tipo_operacion varchar2(20);',
'    v_id_dcmnto   number;',
'    o_cdgo_rspsta number;',
'    o_mnsje_rspsta varchar2(4000);',
'begin',
'        insert into muerto (v_001,t_001)  values (''Entro en descarga 2 '',  sysdate ) ; commit;',
'       -- apex_application.g_print_success_message := ''<span style="color:white">ITEM [''||:P86_ID_ADJNTO||'']!'';',
'       ',
'       select  file_blob,    ',
'               file_bfile,     ',
'               file_mimetype,     ',
'               file_name',
'        into   v_file_blob,   ',
'               v_file_bfile,   ',
'               v_file_mimetype,   ',
'               v_file_name',
'        from gn_g_adjuntos',
'        where id_adjnto  = :P86_ID_ADJNTO;',
'        ',
'       insert into muerto (v_001, v_002, t_001)  values (''DESCARGA '', v_file_name, sysdate ) ; commit;',
'',
'    if  v_file_blob is null and v_file_bfile is not null then',
'    ',
'               ',
'',
'            -- apex_application.g_print_success_message := ''<span style="color:white">ENTRO [''||:P149_ID_RNTA_ADJNTO||'']!'';',
'             pkg_gd_utilidades.prc_co_archco_dsco ( p_bfile          => v_file_bfile',
'                                                , o_archvo_blob      => v_file_blob ',
'                                                , o_cdgo_rspsta      => o_cdgo_rspsta ',
'                                                , o_mnsje_rspsta     => o_mnsje_rspsta) ;  ',
'          ',
'             insert into muerto (v_001, v_002, B_001, t_001)  values (''Consulto archivo '', o_mnsje_rspsta,v_file_blob, sysdate ) ; commit;',
'       ',
'        ',
'    end if;',
'       insert into muerto (v_001, v_002, t_001)  values (''salio if descarga '', :P86_ID_ADJNTO, sysdate ) ; commit;',
'',
'        ',
'        :P86_ID_ADJNTO := null;',
'    ',
'        htp.init;',
'        owa_util.mime_header(v_file_mimetype, FALSE );',
'        htp.p(''Content-length: '' ||dbms_lob.getlength(v_file_blob));',
'        htp.p(''Content-Disposition: attachment; filename="'' ||v_file_name || ''"'' );',
'        htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'        owa_util.http_header_close;',
'        wpg_docload.download_file(v_file_blob);',
'        apex_application.stop_apex_engine;',
' ',
'    ',
'exception',
'    when others then',
'   -- o_mnsje_rspsta := ''Error ''|| sqlerrm ;',
'         --  insert into muerto (v_001, v_002, t_001)  values (''Error'', o_mnsje_rspsta, sysdate ) ; commit;',
'',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DESCARGAR_ADJUNTO'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(211531057466490902)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Descargar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Consulta',
'declare',
'    v_file_name varchar2(2000);',
'    v_file_blob     blob;',
'    file_blob blob;',
'    v_file_bfile    bfile;',
'    v_file_mimetype varchar2(1000);',
'    v_tipo_operacion varchar2(20);',
'    v_id_dcmnto   number;',
'    o_cdgo_rspsta number;',
'    o_mnsje_rspsta varchar2(4000);',
'begin',
'        insert into muerto (v_001,t_001)  values (''Entro en descarga... '',  sysdate ) ; commit;',
'       -- apex_application.g_print_success_message := ''<span style="color:white">ITEM [''||:P86_ID_ADJNTO||'']!'';',
'       ',
'       select  file_blob,    ',
'               file_bfile,     ',
'               file_mimetype,     ',
'               file_name',
'        into   v_file_blob,   ',
'               v_file_bfile,   ',
'               v_file_mimetype,   ',
'               v_file_name',
'        from gn_g_adjuntos',
'        where id_adjnto  =  204;--:P86_ID_ADJNTO;',
'        ',
'       insert into muerto (v_001, v_002, t_001)  values (''ENTRO A DESCARGA '', v_file_name, sysdate ) ; commit;',
'',
'    if  v_file_blob is null and v_file_bfile is not null then',
'    ',
'                      insert into muerto (v_001, v_002, t_001)  values (''ENTRO EN IF'', v_file_name, sysdate ) ; commit;',
'',
'',
'            -- apex_application.g_print_success_message := ''<span style="color:white">ENTRO [''||:P149_ID_RNTA_ADJNTO||'']!'';',
'             pkg_gd_utilidades.prc_co_archco_dsco ( p_bfile          => v_file_bfile',
'                                                , o_archvo_blob      => v_file_blob ',
'                                                , o_cdgo_rspsta      => o_cdgo_rspsta ',
'                                                , o_mnsje_rspsta     => o_mnsje_rspsta) ;  ',
'          ',
'             insert into muerto (v_001, v_002, B_001, t_001)  values (''Consulto archivo '', o_mnsje_rspsta,v_file_blob, sysdate ) ; commit;',
'       ',
'        ',
'    end if;',
'      insert into muerto (v_001, v_002, t_001)  values (''salio if descarga '', :P86_ID_ADJNTO, sysdate ) ; commit;',
'',
'        ',
'        :P86_ID_ADJNTO := null;',
'    ',
'        htp.init;',
'        owa_util.mime_header(v_file_mimetype, FALSE );',
'        htp.p(''Content-length: '' ||dbms_lob.getlength(v_file_blob));',
'        htp.p(''Content-Disposition: attachment; filename="'' ||v_file_name || ''"'' );',
'        htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'        owa_util.http_header_close;',
'        wpg_docload.download_file(v_file_blob);',
'        apex_application.stop_apex_engine;',
' ',
'    ',
'exception',
'    when others then',
'   -- o_mnsje_rspsta := ''Error ''|| sqlerrm ;',
'         --  insert into muerto (v_001, v_002, t_001)  values (''Error'', o_mnsje_rspsta, sysdate ) ; commit;',
'',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(210635159128079001)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'cargar datos solicitud de analisis'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin      ',
'    select a.id_expdnte_anlsis,',
'           b.id_expdnte_anlsis_dtll,',
'           b.id_fljo_trea,',
'           b.id_prdo,',
'           b.vgncia,',
'           b.obsrvcion',
'    into  :P86_ID_EXPDNTE_ANLSIS,',
'          :P86_ID_EXPDNTE_ANLSIS_dtll,',
'          :P86_ID_FLJO_TREA ,',
'          :P86_ID_PRDO,',
'          :P86_VGNCIA,',
'          :P86_OBSRVCION',
'    from fi_g_expedientes_analisis  a',
'    join fi_g_expndnts_anlsis_dtlle b  on a.id_expdnte_anlsis = b.id_expdnte_anlsis      ',
'    where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO ',
'    fetch first 1 rows only;     ',
'exception',
'    when no_data_found then',
'        null;',
'      --raise_application_error(-20000, ''Solicitud no encontrada.'');',
'    when others then',
'       raise_application_error(-20000, ''Problemas al consultar solicitud''); ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P86_ID_EXPDNTE_ANLSIS'
,p_process_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(209625545924897902)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar datos solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select id_tpo',
'     , id_mtvo',
'     , id_impsto',
'     , id_impsto_sbmpsto',
'     , idntfccion',
'     , id_rdcdor',
'     , a.id_slctud',
'     , nmro_rdcdo_dsplay',
'     , fcha_rdcdo',
'     , id_prsntcion_tpo ',
'     , id_instncia_fljo',
'     , b.obsrvcion',
'  into :P86_ID_TPO',
'     , :P86_ID_MTVO',
'     , :P86_ID_IMPSTO',
'     , :P86_ID_IMPSTO_SBMPSTO',
'     , :P86_IDNTFCCION_SJTO2',
'     , :P86_ID_RDCDOR',
'     , :P86_ID_SLCTUD',
'     , :P86_NMRO_RDCDO_DSPLAY',
'     , :P86_FCHA_RDCDO',
'     , :P86_ID_PRSNTCION_TPO ',
'     , :P86_ID_INSTNCIA_FLJO_PDRE',
'     , :P86_OBSRVCION_S',
'  from v_pq_g_solicitudes a',
'  left join pq_g_solicitudes_obsrvcion b on a.id_slctud = b.id_slctud',
'  where id_instncia_fljo_gnrdo  = :F_ID_INSTNCIA_FLJO;',
'  ',
'exception',
'    when no_data_found then',
'    null;',
'       --raise_application_error(-20000, ''Solicitud no encontrada..'');',
'    when others then',
'       raise_application_error(-20000, ''Problemas al consultar solicitud''); ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P86_ID_INSTNCIA_FLJO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(211485383457111101)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'cargar id_instncia_fljo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin      ',
'    select :F_ID_INSTNCIA_FLJO',
'    into  :P86_ID_INSTNCIA_FLJO        ',
'    from dual;     ',
'exception',
'    when no_data_found then',
'      --  null;',
'      raise_application_error(-20000, ''Solicitud no encontrada'');',
'    when others then',
'       raise_application_error(-20000, ''Problemas al consultar solicitud''); ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(209740058660252001)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos Radicador'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select cdgo_idntfccion_tpo',
'     , idntfccion ',
'     , prmer_nmbre ',
'     , sgndo_nmbre ',
'     , prmer_aplldo ',
'     , sgndo_aplldo',
'  into :P86_CDGO_IDNTFCCION_TPO',
'     , :P86_IDNTFCCION',
'     , :P86_PRMER_NMBRE',
'     , :P86_SGNDO_NMBRE',
'     , :P86_PRMER_APLLDO',
'     , :P86_SGNDO_APLLDO',
'  from pq_g_radicador',
' where id_rdcdor = :P86_ID_RDCDOR;',
'  ',
'exception',
'    when no_data_found then',
'       raise_application_error(-20000, ''Solicitud no encontrada'');',
'    when others then',
'       raise_application_error(-20000, ''Problemas al consultar solicitud''); ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P86_ID_RDCDOR'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(209740191177252002)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos del Solicitante'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'   select cdgo_rspnsble_tpo',
'     , cdgo_idntfccion_tpo ',
'     , idntfccion ',
'     , prmer_nmbre ',
'     , sgndo_nmbre ',
'     , prmer_aplldo ',
'     , sgndo_aplldo ',
'     , id_pais_ntfccion ',
'     , id_dprtmnto_ntfccion ',
'     , id_mncpio_ntfccion ',
'     , drccion_ntfccion ',
'     , email ',
'     , tlfno ',
'     , cllar',
'  into :P86_CDGO_RSPNSBLE_TPO_S',
'     , :P86_CDGO_IDNTFCCION_TPO_S ',
'     , :P86_IDNTFCCION_S',
'     , :P86_PRMER_NMBRE_S',
'     , :P86_SGNDO_NMBRE_S ',
'     , :P86_PRMER_APLLDO_S',
'     , :P86_SGNDO_APLLDO_S',
'     , :P86_ID_PAIS_NTFCCION_S',
'     , :P86_ID_DPRTMNTO_NTFCCION_S',
'     , :P86_ID_MNCPIO_NTFCCION_S',
'     , :P86_DRCCION_NTFCCION_S',
'     , :P86_EMAIL_S',
'     , :P86_TLFNO_S',
'     , :P86_CLLAR_S',
'  from pq_g_solicitantes',
' where id_slctud = :P86_ID_SLCTUD;',
'  ',
'exception',
'    when no_data_found then',
'       raise_application_error(-20000, ''Solicitud no encontrada'');',
'    when others then',
'       raise_application_error(-20000, ''Problemas al consultar solicitud''); ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(209740274137252003)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('cargar observaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select obsrvcion ',
'      into :P86_OBSRVCION_S ',
'      from pq_g_solicitudes_obsrvcion ',
'     where id_slctud = :P86_ID_SLCTUD',
'     order by id_slctd_obsrvcion ',
'     fetch first 1 rows only;',
'exception',
'    when no_data_found then',
'       raise_application_error(-20000, ''Solicitud no encontrada'');',
'    when others then',
'       raise_application_error(-20000, ''Problemas al consultar solicitud''); ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(209522123145591301)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AjaxRegistrarSolicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    ',
'    v_cdgo_rspsta   number;',
'    v_mnsje_rspsta  varchar2(1000);',
'    v_cnddtoVgncia  clob;',
'    v_exception     exception;',
'',
'',
'begin',
'',
'    for i in 1..apex_application.g_f01.count loop',
'        v_cnddtoVgncia := v_cnddtoVgncia || apex_application.g_f01(i);',
'    end loop;',
'    ',
'  if :P86_OBSRVCION is null then',
'      raise v_exception;',
'  end if ;',
'  ',
'    if :P86_IDNTFCCION_SJTO is null or :P86_IDNTFCCION_SJTO = '''' then',
'        raise v_exception;',
unistr('        raise_application_error(-20001, ''Por favor ingrese una identificari\00F3n'');'),
'    end if;',
'    ',
'    pkg_fi_fiscalizacion.prc_rg_expediente_analisis(p_cdgo_clnte	         => :F_CDGO_CLNTE,',
'                                                       p_id_usrio            => :F_ID_USRIO,',
'                                                       p_id_fncnrio          => :F_ID_FNCNRIO,',
'                                                       p_expediente        	 => v_cnddtoVgncia,',
'                                                       p_id_slctud           => :P86_ID_SLCTUD,',
'                                                       p_obsrvcion           => :P86_OBSRVCION,',
'                                                       P_ID_IMPSTO           => :P86_ID_IMPSTO,',
'                                                       P_ID_IMPSTO_sbmpsto   => :P86_ID_IMPSTO_SBMPSTO,',
'                                                       P_fcha_rgtro          => sysdate,',
'                                                       p_instancia_fljo      => :P86_ID_INSTNCIA_FLJO,',
'                                                       p_instancia_fljo_pdre => :P86_ID_INSTNCIA_FLJO_PDRE,',
'                                                       p_id_fljo_trea        => :F_ID_FLJO_TREA,',
'                                                       p_id_fsclzdor         => :P86_ID_USRIO_ESPCFCO,',
'                                                       o_cdgo_rspsta         => v_cdgo_rspsta,',
'                                                       o_mnsje_rspsta        => v_mnsje_rspsta);',
'',
'',
'    if v_cdgo_rspsta > 0 then',
'        raise v_exception;',
'    end if;',
'    ',
'                                              ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'   --apex_json.write(''o_mnsje_rspsta'', ''1''||v_mnsje_rspsta);',
'    apex_json.close_object;',
'    ',
'exception',
'    when v_exception then',
'        rollback;',
'        ',
'         if :P86_OBSRVCION is null then',
'             apex_json.open_object;',
'            apex_json.write(''o_cdgo_rspsta'', 999);',
unistr('            apex_json.write(''o_mnsje_rspsta'', ''Por favor ingrese una observaci\00F3n'');'),
'            apex_json.close_object;',
'            ',
'          elsif :P86_IDNTFCCION_SJTO is null or :P86_IDNTFCCION_SJTO = '''' then',
'          ',
'              apex_json.open_object;',
'            apex_json.write(''o_cdgo_rspsta'', 999);',
unistr('            apex_json.write(''o_mnsje_rspsta'', ''Por favor ingrese una identificaci\00F3n'');'),
'            apex_json.close_object;',
'          else ',
'               apex_json.open_object;',
'                apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'                apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'                apex_json.close_object;',
'         end if;',
'        ',
'        ',
'       ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(211340151533796103)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validar_expediente'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'  ',
'    v_rsltdo        number;',
'     v_exception     exception;',
'begin ',
'     ',
'     ',
'     /*if :P86_IDNTFCCION_SJTO is null or :P86_IDNTFCCION_SJTO = '''' then',
'        raise v_exception;',
'       ',
'    end if;*/',
'    ',
'',
'   ',
'          select 1',
'          into  v_rsltdo',
'          from (select  a.id_sjto_impsto,',
'                    g.idntfccion_sjto,',
'                    a.id_cnddto,',
'                    a.candidato,',
'                    c.id_fsclzcion_expdnte,',
'                    a.nmbre_impsto,',
'                    a.nmbre_impsto_sbmpsto,',
'                    a.id_prgrma,',
'                    a.nmbre_prgrma,',
'                    a.id_sbprgrma,',
'                    a.nmbre_sbprgrma,',
'                    c.id_instncia_fljo,',
'                    d.id_fljo_trea_orgen,',
'                    c.nmro_expdnte',
'            from v_fi_g_candidatos              a',
'            join fi_g_candidatos_funcionario    b   on  a.id_cnddto             =   b.id_cnddto',
'            join fi_g_fiscalizacion_expdnte     c   on  a.id_cnddto             =   c.id_cnddto    ',
'            join wf_g_instancias_transicion     d   on  c.id_instncia_fljo      =   d.id_instncia_fljo',
'            join wf_d_flujos_tarea              e   on  d.id_fljo_trea_orgen    =   e.id_fljo_trea',
'            join wf_d_tareas                    f   on  e.id_trea               =   f.id_trea',
'            join v_si_i_sujetos_impuesto        g   on  a.id_sjto_impsto        =   g.id_sjto_impsto',
'            left join fi_g_fsclzcion_expdnte_acto   h  on  h.id_fsclzcion_expdnte =   c.id_fsclzcion_expdnte',
'                                                       and h.id_fljo_trea         =   e.id_fljo_trea',
'            left join gn_d_actos_tipo_tarea     i   on  i.id_acto_tpo           =   h.id_acto_tpo',
'                                                    and i.id_fljo_trea          =   e.id_fljo_trea',
'                                                    and i.indcdor_oblgtrio      = ''S''',
'            left join gn_g_actos       j   on h.id_acto  = j.id_acto                                           ',
'            --left join nt_g_notificaciones       w   on h.id_acto  = w.id_acto                                           ',
'            --left join nt_g_notificaciones_detalle y on w.id_ntfccion = y.id_ntfccion and y.id_ntfccion is not null',
'            where-- a.cdgo_clnte = :F_CDGO_CLNTE  and',
'                b.actvo = ''S''',
'            and c.cdgo_expdnte_estdo = ''ABT''',
'            and d.id_estdo_trnscion in (1,2) ',
'            and a.id_impsto = :P86_IMPUESTO',
'            and a.id_prgrma = :P86_PRGRMA',
'            and a.id_sbprgrma =:P86_SUBPRGRMA',
'            and g.idntfccion_sjto   = :P86_IDNTFCCION_SJTO',
'            and c.nmro_expdnte   = nvl(:P86_NMRO_EXPDNTE, c.nmro_expdnte)',
'            and e.id_fljo_trea = nvl(:P86_ETPA, e.id_fljo_trea)',
'            group by a.id_sjto_impsto, ',
'                     g.idntfccion_sjto, ',
'                     a.id_cnddto, ',
'                     a.candidato, ',
'                     c.id_fsclzcion_expdnte, ',
'                     a.nmbre_impsto, ',
'                     a.nmbre_impsto_sbmpsto, ',
'                     a.id_prgrma, ',
'                     a.nmbre_prgrma, ',
'                     a.id_sbprgrma, ',
'                     a.nmbre_sbprgrma, ',
'                     c.id_instncia_fljo, ',
'                     d.id_fljo_trea_orgen, ',
'                     c.nmro_expdnte',
'            order by  c.nmro_expdnte  ); ',
'          ',
'        ',
'         ',
'        ',
'              apex_json.open_object;',
'              apex_json.write(''exists'', true); ',
'              apex_json.write(''idntfccion_sjto'',:P86_IDNTFCCION_SJTO );',
'              apex_json.close_object;',
'         ',
'         ',
'    exception ',
'    ',
'       /* when v_exception then',
'            if :P86_IDNTFCCION_SJTO is null or :P86_IDNTFCCION_SJTO = '''' then',
'          ',
'            apex_json.open_object;',
'            apex_json.write(''ERROR'', true);',
unistr('            apex_json.write(''MSG'', ''Por favor ingrese una identificaci\00F3n'');'),
'            apex_json.write(''exists'', false); ',
'            apex_json.close_object;',
'           end if;*/',
'         when no_data_found then',
'           -- if :P86_IDNTFCCION_SJTO is null or :P86_IDNTFCCION_SJTO = '''' then',
'          ',
'            apex_json.open_object;',
'            apex_json.write(''ERROR'', true);',
unistr('            apex_json.write(''MSG'', ''Por favor ingrese una identificaci\00F3n'');'),
'            apex_json.write(''exists'', false); ',
'            apex_json.close_object;',
'         --  end if;',
'            ',
'        when others then ',
'            apex_json.open_object;',
'            apex_json.write(''ERROR'', true);',
'            apex_json.write(''MSG''  , apex_escape.html(sqlerrm));',
'            apex_json.write(''exists'', false); ',
'            apex_json.close_object;',
'end;',
'   '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
