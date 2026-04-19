prompt --application/pages/page_00087
begin
wwv_flow_api.create_page(
 p_id=>87
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>unistr('An\00E1lisis del Abogado')
,p_step_title=>unistr('An\00E1lisis del Abogado')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var v_json = '''';',
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
'        $s(''P87_JSON'', JSON.stringify(jsonExpediente));',
'        window.localStorage.setItem(''jsonExpediente'', JSON.stringify(jsonExpediente));',
'    }',
'}',
'',
'',
'function buildJsonVigencia(){',
'    ',
'     var region = apex.region(''vigencia'');',
'    ',
'    if(region) {',
'        ',
'        var view = apex.region("vigencia").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
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
'                ',
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
'',
'',
'function ocultarBotonInciarFsclzcion(){',
'    if(JSON.parse(window.localStorage.jsonVigencia).length > 0){',
'        apex.item(''solicitud'').show();',
'    }else{',
'        apex.item(''solicitud'').hide();',
'    }	',
'    ',
'}',
'',
'   function builjsonObservacion(){',
'        console.log("Iniciando vigencias");',
'     var region = apex.region(''observacion'');',
'    ',
'    if(region) {',
'        ',
'        var view = apex.region("observacion").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        //var records = view.view$.grid("getSelectedRecords");',
'        var records = model._data;',
'        var arr = [];',
'        ',
'        var jsonObservacion = records.map((observacion) => {',
'            return {"ID_EXPDNTE_ANLSS_OBSVCN"  : model.getValue(observacion, "ID_EXPDNTE_ANLSS_OBSVCN")   }; ',
'        });',
unistr('        console.log("creaci\00F3n de json");'),
'        console.log("jsonVigencia "+JSON.stringify(jsonObservacion));',
'        window.localStorage.setItem(''jsonObservacion'', JSON.stringify(jsonObservacion));',
'',
'    }',
'}',
'    ',
'   ',
'',
'function revertir(){',
'    var event = new Event(''eventRevertir'');',
'    window.dispatchEvent(event);',
'}',
'',
'',
'',
'',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//apex.region("expediente").widget().interactiveGrid("setSelectedRecords", []);',
'',
'//$("#P87_OBSRVCION").disable();',
'',
'//if ($("#P87_CDGO_RSPTA").val() == "x") {',
'//    $("#P87_OBSRVCION").prop("disabled", true);',
'//} else {',
'//    $("#P87_OBSRVCION").prop("disabled", false);',
'//}',
'',
'//apex.item( "P87_INDCDOR_RCHZAR_1" ).setValue( "N" );',
''))
,p_step_template=>wwv_flow_api.id(36470205860968633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20240709235939'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(213258243284156903)
,p_plug_name=>unistr('<b> OBSERVACIONES DEL AN\00C1LISIS</b>')
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
'join fi_g_expedientes_analisis b on b.id_expdnte_anlsis = a.id_expdnte_anlsis',
'where b.id_instncia_fljo = :P87_ID_INSTNCIA_FLJO',
'/*select 1',
'from fi_g_expndnts_analisis_obsvcion a',
'where a.id_instncia_fljo = :P87_ID_INSTNCIA_FLJO*/',
';'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(213096523360471104)
,p_plug_name=>'Observaciones'
,p_region_name=>'observacion'
,p_parent_plug_id=>wwv_flow_api.id(213258243284156903)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>100
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
'where a.id_expdnte_anlsis = :P87_ID_EXPDNTE_ANLSIS;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(49212125519347801)
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
 p_id=>wwv_flow_api.id(49212294069347802)
,p_name=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>160
,p_value_alignment=>'LEFT'
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(213096781069471106)
,p_name=>'ID_EXPDNTE_ANLSS_OBSVCN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EXPDNTE_ANLSS_OBSVCN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(213096873160471107)
,p_name=>'ID_EXPDNTE_ANLSIS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EXPDNTE_ANLSIS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(213097051056471109)
,p_name=>'ID_FLJO_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA'
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
 p_id=>wwv_flow_api.id(213097426512471113)
,p_name=>'INDCDOR_CNFRMDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_CNFRMDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFConfirmado?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
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
 p_id=>wwv_flow_api.id(213142929497131201)
,p_name=>'VER'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Ver<span class="fa fa-eye"></span>'
,p_link_target=>'f?p=&APP_ID.:90:&SESSION.::&DEBUG.:RP,90:P90_ID_EXPDNTE_ANLSS_OBSVCN:&ID_EXPDNTE_ANLSS_OBSVCN.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(213258586140156906)
,p_name=>'FCHA_RCHZO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RCHZO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha Observaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(213258796968156908)
,p_name=>'ASNTO_OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ASNTO_OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Asunto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(213481389614972601)
,p_name=>'NMBRE_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tarea'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
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
 p_id=>wwv_flow_api.id(213481465115972602)
,p_name=>'NMBRE_TRCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TRCRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Usuario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(213096610228471105)
,p_internal_uid=>213096610228471105
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
 p_id=>wwv_flow_api.id(213103063246602530)
,p_interactive_grid_id=>wwv_flow_api.id(213096610228471105)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(213103112904602533)
,p_report_id=>wwv_flow_api.id(213103063246602530)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49218129688348649)
,p_view_id=>wwv_flow_api.id(213103112904602533)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(49212125519347801)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>349.028
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49218655840348654)
,p_view_id=>wwv_flow_api.id(213103112904602533)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(49212294069347802)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>628.861
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213103683610602538)
,p_view_id=>wwv_flow_api.id(213103112904602533)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(213096781069471106)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213104107339602544)
,p_view_id=>wwv_flow_api.id(213103112904602533)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(213096873160471107)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213105166839602548)
,p_view_id=>wwv_flow_api.id(213103112904602533)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(213097051056471109)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213107199616602558)
,p_view_id=>wwv_flow_api.id(213103112904602533)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(213097426512471113)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>125
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213148231633139260)
,p_view_id=>wwv_flow_api.id(213103112904602533)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(213142929497131201)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213277925771791016)
,p_view_id=>wwv_flow_api.id(213103112904602533)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(213258586140156906)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>168
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213281933535876922)
,p_view_id=>wwv_flow_api.id(213103112904602533)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(213258796968156908)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213487381504972842)
,p_view_id=>wwv_flow_api.id(213103112904602533)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(213481389614972601)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>177
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213487854002972845)
,p_view_id=>wwv_flow_api.id(213103112904602533)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(213481465115972602)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(420033133970509557)
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
,p_attribute_04=>'false'
,p_attribute_08=>'&P87_ABOGADO.'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(420213648935085857)
,p_plug_name=>'<b> DATOS EXPEDIENTE </b>'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(36509862944968653)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NOT_EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from fi_g_expedientes_analisis a',
'where a.id_instncia_fljo = :P87_ID_INSTNCIA_FLJO'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(420248311680864566)
,p_plug_name=>'Expediente'
,p_region_name=>'expediente'
,p_parent_plug_id=>wwv_flow_api.id(420213648935085857)
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
'and a.id_impsto = :P87_IMPUESTO',
'and a.id_prgrma = :P87_PRGRMA',
'and a.id_sbprgrma = :P87_SUBPRGRMA',
'and g.idntfccion_sjto   = :P87_IDNTFCCION_SJTO',
'and e.id_fljo_trea = nvl(:P87_ETPA, e.id_fljo_trea)',
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
,p_ajax_items_to_submit=>'P87_PRGRMA,P87_SUBPRGRMA,P87_ETPA,P87_IDNTFCCION_SJTO,P87_IMPUESTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(420248517088864568)
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
 p_id=>wwv_flow_api.id(420248707648864570)
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
 p_id=>wwv_flow_api.id(420248952398864572)
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
 p_id=>wwv_flow_api.id(420249021247864573)
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
 p_id=>wwv_flow_api.id(420249472579864577)
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
 p_id=>wwv_flow_api.id(420249529633864578)
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
 p_id=>wwv_flow_api.id(420249642936864579)
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
 p_id=>wwv_flow_api.id(420249770135864580)
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(420273368867761057)
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
 p_id=>wwv_flow_api.id(420273429570761058)
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
 p_id=>wwv_flow_api.id(420273587952761059)
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
 p_id=>wwv_flow_api.id(420273613917761060)
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
 p_id=>wwv_flow_api.id(420273701251761061)
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
 p_id=>wwv_flow_api.id(420273907856761063)
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
 p_id=>wwv_flow_api.id(420288811381782361)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(420248418887864567)
,p_internal_uid=>420248418887864567
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
 p_id=>wwv_flow_api.id(420258283945063575)
,p_interactive_grid_id=>wwv_flow_api.id(420248418887864567)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(420258327163063580)
,p_report_id=>wwv_flow_api.id(420258283945063575)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420259480667063590)
,p_view_id=>wwv_flow_api.id(420258327163063580)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(420248517088864568)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420260316386063606)
,p_view_id=>wwv_flow_api.id(420258327163063580)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(420248707648864570)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420261364185063610)
,p_view_id=>wwv_flow_api.id(420258327163063580)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(420248952398864572)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420261831132063612)
,p_view_id=>wwv_flow_api.id(420258327163063580)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(420249021247864573)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420263811424063619)
,p_view_id=>wwv_flow_api.id(420258327163063580)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(420249472579864577)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420264353046063620)
,p_view_id=>wwv_flow_api.id(420258327163063580)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(420249529633864578)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420264858188063622)
,p_view_id=>wwv_flow_api.id(420258327163063580)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(420249642936864579)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420265322250063623)
,p_view_id=>wwv_flow_api.id(420258327163063580)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(420249770135864580)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420279354528761308)
,p_view_id=>wwv_flow_api.id(420258327163063580)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(420273368867761057)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420279810129761313)
,p_view_id=>wwv_flow_api.id(420258327163063580)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(420273429570761058)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420280380421761314)
,p_view_id=>wwv_flow_api.id(420258327163063580)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(420273587952761059)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420280874339761316)
,p_view_id=>wwv_flow_api.id(420258327163063580)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(420273613917761060)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420281382469761317)
,p_view_id=>wwv_flow_api.id(420258327163063580)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(420273701251761061)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420282376895761323)
,p_view_id=>wwv_flow_api.id(420258327163063580)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(420273907856761063)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(420249862711864581)
,p_plug_name=>'Vigencias'
,p_region_name=>'vigencia'
,p_parent_plug_id=>wwv_flow_api.id(420213648935085857)
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
'where a.id_fsclzcion_expdnte in (select a.id_fsclzcion_expdnte from json_table(:P87_JSON, ''$[*]'' columns(id_fsclzcion_expdnte number path ''$.ID_FSCLZCION_EXPDNTE'')) a)',
'and  h.id_acto is not null ',
'and j.fcha_ntfccion is not  null ',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(420251348428864596)
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(420251433102864597)
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
 p_id=>wwv_flow_api.id(420290373946782376)
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
 p_id=>wwv_flow_api.id(420291483361782387)
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
 p_id=>wwv_flow_api.id(420291524661782388)
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(420429779194907157)
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
 p_id=>wwv_flow_api.id(420429859336907158)
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
 p_id=>wwv_flow_api.id(420429967864907159)
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
 p_id=>wwv_flow_api.id(420430080543907160)
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
 p_id=>wwv_flow_api.id(420793643240802258)
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
 p_id=>wwv_flow_api.id(420793726024802259)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Acto'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>130
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
 p_id=>wwv_flow_api.id(420881784641178075)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(420249919139864582)
,p_internal_uid=>420249919139864582
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
'    window.localStorage.removeItem(''jsonVigencia'');',
'    config.initialSelection = false;',
'       return selectAll(config, {',
'           name: ''Seleccionar Todos'',',
'           action: allVigencia',
'       }) ;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(420258852766063584)
,p_interactive_grid_id=>wwv_flow_api.id(420249919139864582)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(420258897045063584)
,p_report_id=>wwv_flow_api.id(420258852766063584)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420266810561063629)
,p_view_id=>wwv_flow_api.id(420258897045063584)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(420251348428864596)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420267296324063631)
,p_view_id=>wwv_flow_api.id(420258897045063584)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(420251433102864597)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420317915040464859)
,p_view_id=>wwv_flow_api.id(420258897045063584)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(420290373946782376)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420327756187500721)
,p_view_id=>wwv_flow_api.id(420258897045063584)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(420291483361782387)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420329729089674379)
,p_view_id=>wwv_flow_api.id(420258897045063584)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(420291524661782388)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420435727066907556)
,p_view_id=>wwv_flow_api.id(420258897045063584)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(420429779194907157)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420436113661907560)
,p_view_id=>wwv_flow_api.id(420258897045063584)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(420429859336907158)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420439294824347412)
,p_view_id=>wwv_flow_api.id(420258897045063584)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(420429967864907159)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420440424637409598)
,p_view_id=>wwv_flow_api.id(420258897045063584)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(420430080543907160)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420801100938112907)
,p_view_id=>wwv_flow_api.id(420258897045063584)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(420793643240802258)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420805062219543088)
,p_view_id=>wwv_flow_api.id(420258897045063584)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(420793726024802259)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(420513646335634057)
,p_plug_name=>'Tabulador'
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
 p_id=>wwv_flow_api.id(420598678821576972)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>100
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
 p_id=>wwv_flow_api.id(420823181113789457)
,p_plug_name=>unistr('<b> Observaci\00F3n</b>')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>110
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_plug_read_only_when=>'P87_ID_ACTO'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(420827046822789496)
,p_plug_name=>'<b> DATOS EXPEDIENTE </b>'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(36509862944968653)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'NOT_EXISTS'
,p_plug_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from fi_g_expedientes_analisis a',
'where a.id_instncia_fljo = :P87_ID_INSTNCIA_FLJO',
''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(420825097305789477)
,p_plug_name=>'Expediente'
,p_region_name=>'expediente2'
,p_parent_plug_id=>wwv_flow_api.id(420827046822789496)
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
 p_id=>wwv_flow_api.id(420825564142789481)
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
 p_id=>wwv_flow_api.id(420825653898789482)
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
 p_id=>wwv_flow_api.id(420825702350789483)
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
 p_id=>wwv_flow_api.id(420825836753789484)
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
 p_id=>wwv_flow_api.id(420825892290789485)
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
 p_id=>wwv_flow_api.id(420826068928789486)
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
 p_id=>wwv_flow_api.id(420826118825789487)
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
 p_id=>wwv_flow_api.id(420826231282789488)
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(420826353815789489)
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
 p_id=>wwv_flow_api.id(420826398803789490)
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
 p_id=>wwv_flow_api.id(420826496097789491)
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
 p_id=>wwv_flow_api.id(420826611717789492)
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
 p_id=>wwv_flow_api.id(420826785565789493)
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
 p_id=>wwv_flow_api.id(420826855318789494)
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
 p_id=>wwv_flow_api.id(420825438135789480)
,p_internal_uid=>420825438135789480
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
 p_id=>wwv_flow_api.id(420841479712462493)
,p_interactive_grid_id=>wwv_flow_api.id(420825438135789480)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(420841496669462498)
,p_report_id=>wwv_flow_api.id(420841479712462493)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420842071279462503)
,p_view_id=>wwv_flow_api.id(420841496669462498)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(420825564142789481)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420842542243462509)
,p_view_id=>wwv_flow_api.id(420841496669462498)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(420825653898789482)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420843001431462511)
,p_view_id=>wwv_flow_api.id(420841496669462498)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(420825702350789483)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420843570539462513)
,p_view_id=>wwv_flow_api.id(420841496669462498)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(420825836753789484)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420844032922462522)
,p_view_id=>wwv_flow_api.id(420841496669462498)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(420825892290789485)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420844529462462524)
,p_view_id=>wwv_flow_api.id(420841496669462498)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(420826068928789486)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420845005670462528)
,p_view_id=>wwv_flow_api.id(420841496669462498)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(420826118825789487)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420845535950462530)
,p_view_id=>wwv_flow_api.id(420841496669462498)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(420826231282789488)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420845993990462537)
,p_view_id=>wwv_flow_api.id(420841496669462498)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(420826353815789489)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420846516538462539)
,p_view_id=>wwv_flow_api.id(420841496669462498)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(420826398803789490)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420847056957462541)
,p_view_id=>wwv_flow_api.id(420841496669462498)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(420826496097789491)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420847573839462544)
,p_view_id=>wwv_flow_api.id(420841496669462498)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(420826611717789492)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420848071903462546)
,p_view_id=>wwv_flow_api.id(420841496669462498)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(420826785565789493)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420848566982462548)
,p_view_id=>wwv_flow_api.id(420841496669462498)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(420826855318789494)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(420827122183789497)
,p_plug_name=>'Vigencias'
,p_region_name=>'vigencia2'
,p_parent_plug_id=>wwv_flow_api.id(420827046822789496)
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
'where a.id_expdnte_anlsis = :P87_ID_EXPDNTE_ANLSIS',
';'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(420827427566789500)
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
 p_id=>wwv_flow_api.id(420827508790789501)
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
 p_id=>wwv_flow_api.id(420827688010789502)
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
 p_id=>wwv_flow_api.id(420827934242789505)
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
 p_id=>wwv_flow_api.id(420828067848789506)
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
 p_id=>wwv_flow_api.id(420854770547019757)
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
 p_id=>wwv_flow_api.id(420854871525019758)
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(420854916532019759)
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
 p_id=>wwv_flow_api.id(420855088072019760)
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
 p_id=>wwv_flow_api.id(420855130292019761)
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
 p_id=>wwv_flow_api.id(421634354444556457)
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
 p_id=>wwv_flow_api.id(421634418909556458)
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
 p_id=>wwv_flow_api.id(420827306567789499)
,p_internal_uid=>420827306567789499
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
 p_id=>wwv_flow_api.id(420862395023059245)
,p_interactive_grid_id=>wwv_flow_api.id(420827306567789499)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(420862529676059245)
,p_report_id=>wwv_flow_api.id(420862395023059245)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420863047716059258)
,p_view_id=>wwv_flow_api.id(420862529676059245)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(420827427566789500)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420863536208059268)
,p_view_id=>wwv_flow_api.id(420862529676059245)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(420827508790789501)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420864048257059270)
,p_view_id=>wwv_flow_api.id(420862529676059245)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(420827688010789502)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420865302554059289)
,p_view_id=>wwv_flow_api.id(420862529676059245)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(420827934242789505)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420865828740059291)
,p_view_id=>wwv_flow_api.id(420862529676059245)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(420828067848789506)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420866300590059293)
,p_view_id=>wwv_flow_api.id(420862529676059245)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(420854770547019757)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420866817297059294)
,p_view_id=>wwv_flow_api.id(420862529676059245)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(420854871525019758)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420867333806059296)
,p_view_id=>wwv_flow_api.id(420862529676059245)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(420854916532019759)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420867854450059298)
,p_view_id=>wwv_flow_api.id(420862529676059245)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(420855088072019760)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(420868376933059300)
,p_view_id=>wwv_flow_api.id(420862529676059245)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(420855130292019761)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(421640372169556687)
,p_view_id=>wwv_flow_api.id(420862529676059245)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(421634354444556457)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(421640858978556695)
,p_view_id=>wwv_flow_api.id(420862529676059245)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(421634418909556458)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(420940373007413957)
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
unistr('<i>Funcionalidad que permite analizar la investigaci\00F3n realizada del expediente.</i>'),
'</p>',
'',
'<p align="justify">',
unistr('<i>S\00ED se aplica la solicitud, el flujo del expediente seleccionado se ira a Auto de archivo al transitar.</i>'),
'</p>',
'',
'<p align="justify">',
unistr('<i>S\00ED se rechaza la solicitud, el flujo del expediente seleccionado avanzar\00E1 normal a la siguiente etapa.</i>'),
'</p>',
'',
'<p align="justify">',
unistr('<i>Permite agregar adjuntos como evidencia al an\00E1lisis y al flujo del expediente. Permite registrar una observaci\00F3n '),
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
 p_id=>wwv_flow_api.id(420993880105553057)
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
 p_id=>wwv_flow_api.id(420213918563085860)
,p_plug_name=>'<b> DATOS SOLICITUD </b>'
,p_parent_plug_id=>wwv_flow_api.id(420993880105553057)
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
 p_id=>wwv_flow_api.id(420216093958085882)
,p_plug_name=>'<b> DATOS SOLICITANTE </b>'
,p_parent_plug_id=>wwv_flow_api.id(420993880105553057)
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
 p_id=>wwv_flow_api.id(420526714508662457)
,p_plug_name=>'<b> DOCUMENTOS </b>'
,p_parent_plug_id=>wwv_flow_api.id(420993880105553057)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>90
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(420247505260864558)
,p_plug_name=>'<b>DOCUMENTOS</b>'
,p_parent_plug_id=>wwv_flow_api.id(420526714508662457)
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
'    where id_slctud = :P87_ID_SLCTUD '))
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
 p_id=>wwv_flow_api.id(420597838395576964)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LARIZA'
,p_internal_uid=>420597838395576964
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(210852156096038044)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>10
,p_column_identifier=>'E'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(210851754313038044)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>20
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(210850582410038037)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>30
,p_column_identifier=>'A'
,p_column_label=>'<p></p>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTOS:FILE_BLOB:ID_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(210850989483038043)
,p_db_column_name=>'ID_SLCTUD'
,p_display_order=>40
,p_column_identifier=>'B'
,p_column_label=>'Id Slctud'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(210851333824038043)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>50
,p_column_identifier=>'C'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(210852936821038045)
,p_db_column_name=>'ACTVO'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Aceptado'
,p_column_html_expression=>'#ACTVO#'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(210852571116038044)
,p_db_column_name=>'FCHA'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Fecha Subida'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(420616756314696257)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2108533'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_DCMNTO:OBSRVCION:ID_DCMNTO:ID_SLCTUD:FILE_NAME:ACTVO:FCHA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(420561810190289960)
,p_plug_name=>'<b> DATOS GESTOR </b>'
,p_parent_plug_id=>wwv_flow_api.id(420993880105553057)
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
 p_id=>wwv_flow_api.id(420993925811553058)
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
 p_id=>wwv_flow_api.id(420994172798553060)
,p_plug_name=>'Adjuntos'
,p_region_name=>'Adjuntos'
,p_parent_plug_id=>wwv_flow_api.id(420993925811553058)
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
'where a.id_orgen = :F_ID_INSTNCIA_FLJO',
'',
'',
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
 p_id=>wwv_flow_api.id(421404889100840161)
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
 p_id=>wwv_flow_api.id(421404964508840162)
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(421405030926840163)
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
 p_id=>wwv_flow_api.id(421405101641840164)
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
 p_id=>wwv_flow_api.id(421405281713840165)
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
 p_id=>wwv_flow_api.id(421405312769840166)
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
 p_id=>wwv_flow_api.id(421405416578840167)
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
 p_id=>wwv_flow_api.id(421405519721840168)
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
 p_id=>wwv_flow_api.id(421405596458840169)
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
,p_link_target=>'f?p=&APP_ID.:87:&SESSION.:DESCARGAR_ADJUNTO:&DEBUG.:RP:P87_ID_ADJNTO:&ID_ADJNTO.'
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
 p_id=>wwv_flow_api.id(421404717393840160)
,p_internal_uid=>421404717393840160
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
 p_id=>wwv_flow_api.id(421414257204049569)
,p_interactive_grid_id=>wwv_flow_api.id(421404717393840160)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(421414345506049573)
,p_report_id=>wwv_flow_api.id(421414257204049569)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(421414869558049600)
,p_view_id=>wwv_flow_api.id(421414345506049573)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(421404889100840161)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(421415253047049616)
,p_view_id=>wwv_flow_api.id(421414345506049573)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(421404964508840162)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(421415747977049619)
,p_view_id=>wwv_flow_api.id(421414345506049573)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(421405030926840163)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(421416262959049621)
,p_view_id=>wwv_flow_api.id(421414345506049573)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(421405101641840164)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(421416739712049623)
,p_view_id=>wwv_flow_api.id(421414345506049573)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(421405281713840165)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(421417270728049625)
,p_view_id=>wwv_flow_api.id(421414345506049573)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(421405312769840166)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(421417722797049627)
,p_view_id=>wwv_flow_api.id(421414345506049573)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(421405416578840167)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(421418194625049629)
,p_view_id=>wwv_flow_api.id(421414345506049573)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(421405519721840168)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(421418692413049631)
,p_view_id=>wwv_flow_api.id(421414345506049573)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(421405596458840169)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(488315736204289038)
,p_plug_name=>unistr('Par\00E1metros busquedas ')
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36491913657968646)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NOT_EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from fi_g_expedientes_analisis  a',
'join fi_g_expndnts_anlsis_dtlle b on a.id_expdnte_anlsis = b.id_expdnte_anlsis',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(210822311367037977)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(420598678821576972)
,p_button_name=>'BTN_REGISTRAR'
,p_button_static_id=>'solicitud'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(210822766337037979)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(420598678821576972)
,p_button_name=>'BTN_AGRGR_ADJNTOS'
,p_button_static_id=>'adjunto'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar adjuntos'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=73000:10000:&SESSION.::&DEBUG.:RP,10000:P10000_ID_INSTNCIA_FLJO,P10000_ID_FLJO_TREA,P10000_ID_ORGEN,P10000_CDGO_ORGEN_TPO,P10000_CDGO_PRCSO,P10000_APP,P10000_PAGE:&P87_ID_INSTNCIA_FLJO.,&F_ID_FLJO_TREA.,&P87_ID_INSTNCIA_FLJO.,fi_g_expedientes_analisis,FISCA,74000,87'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from fi_g_expedientes_analisis a',
'where a.id_instncia_fljo = :P87_ID_INSTNCIA_FLJO',
'and a.id_expdnte_anlsis = :P87_ID_EXPDNTE_ANLSIS',
'and a.cdgo_rspta = ''REG'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-upload'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(211090279904520313)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(420598678821576972)
,p_button_name=>'BTN_CONFIRMAR'
,p_button_static_id=>'confirmar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Aplicar Solictud'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from fi_g_expedientes_analisis a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'and a.id_expdnte_anlsis = :P87_ID_EXPDNTE_ANLSIS',
'and a.cdgo_rspta = ''REG'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(211090554062521996)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(420598678821576972)
,p_button_name=>'BTN_RECHAZAR'
,p_button_static_id=>'rechazar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Rechazar Solicitud'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from fi_g_expedientes_analisis a',
'where a.id_instncia_fljo = :P87_ID_INSTNCIA_FLJO',
'and a.id_expdnte_anlsis = :P87_ID_EXPDNTE_ANLSIS',
'and a.cdgo_rspta = ''REG'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-times'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(213258880602156909)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(420598678821576972)
,p_button_name=>'BTN_RECHAZAR_ANALISIS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>unistr('Rechazar An\00E1lisis')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from fi_g_expedientes_analisis a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'and a.id_expdnte_anlsis = :P87_ID_EXPDNTE_ANLSIS',
'and a.cdgo_rspta = ''REG'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-rotate-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(212992068417437301)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(420598678821576972)
,p_button_name=>'BTN_NVA_OBSRVCION'
,p_button_static_id=>'devolver'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Nueva Observacion'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:90:&SESSION.::&DEBUG.:RP,90:P90_ID_EXPDNTE_ANLSIS,P90_ID_FLJO_TREA,P90_ID_USRIO_RCHZO,P90_ID_FSCLZCION_EXPDNTE,P90_INDCDOR_CNFRMDO,P90_ID_INSTNCIA_FLJO:&P87_ID_EXPDNTE_ANLSIS.,&F_ID_FLJO_TREA.,&F_ID_USRIO.,&P87_ID_FSCLZCION_EXPDNTE.,N,&P87_ID_INSTNCIA_FLJO.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from fi_g_expedientes_analisis a',
'where a.id_instncia_fljo = :P87_ID_INSTNCIA_FLJO',
'and a.id_expdnte_anlsis = :P87_ID_EXPDNTE_ANLSIS',
'and a.cdgo_rspta = ''REG'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(213258029338156901)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(420598678821576972)
,p_button_name=>'BTN_CNFRMR_OBSVCN'
,p_button_static_id=>'rechazar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Confirmar Observaciones'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from fi_g_expndnts_analisis_obsvcion a',
'join fi_g_expedientes_analisis b on b.id_expdnte_anlsis = a.id_expdnte_anlsis',
'where b.id_instncia_fljo  = :P87_ID_INSTNCIA_FLJO ',
'and a.indcdor_cnfrmdo = ''N''',
'/*select 1',
'from fi_g_expndnts_analisis_obsvcion a',
'where a.id_instncia_fljo  = :P87_ID_INSTNCIA_FLJO ',
'and a.indcdor_cnfrmdo = ''N''*/',
';'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(211096373709742905)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(420598678821576972)
,p_button_name=>'BTN_GENERAR_ACTO'
,p_button_static_id=>'rechazar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Generar Acto'
,p_button_position=>'BELOW_BOX'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-times'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(211282182030913001)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(420598678821576972)
,p_button_name=>'BTN_VER_ACTO'
,p_button_static_id=>'acto'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Ver acto'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_CLAVE_PRIMARIA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_VALOR:V_GN_G_ACTOS,ID_ACTO,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,&P87_ID_ACTO.'
,p_button_condition=>'P87_ID_ACTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(210862312311038066)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(488315736204289038)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(210823478768037982)
,p_name=>'P87_ID_INSTNCIA_FLJO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(420033133970509557)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(210823822865037985)
,p_name=>'P87_ID_INSTNCIA_FLJO_PDRE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(420033133970509557)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(210831437664038004)
,p_name=>'P87_JSON'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(420248311680864566)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(210831837471038004)
,p_name=>'P87_ID_FSCLZCION_EXPDNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(420248311680864566)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(210837947673038012)
,p_name=>'P87_ABOGADO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(420249862711864581)
,p_prompt=>'Abogado'
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
'where c.id_fsclzcion_expdnte  in (select a.id_fsclzcion_expdnte ',
'                                  from json_table(:P87_JSON, ''$[*]'' columns(id_fsclzcion_expdnte number path ''$.ID_FSCLZCION_EXPDNTE'')) a);'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(36555007171968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(210839213021038014)
,p_name=>'P87_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(420213918563085860)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(210839655423038014)
,p_name=>'P87_ID_PRSNTCION_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(420213918563085860)
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
 p_id=>wwv_flow_api.id(210840029813038015)
,p_name=>'P87_ID_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(420213918563085860)
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
 p_id=>wwv_flow_api.id(210840465662038015)
,p_name=>'P87_ID_MTVO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(420213918563085860)
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
 p_id=>wwv_flow_api.id(210840879843038015)
,p_name=>'P87_ID_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(420213918563085860)
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
 p_id=>wwv_flow_api.id(210841236170038015)
,p_name=>'P87_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(420213918563085860)
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
 p_id=>wwv_flow_api.id(210841693761038022)
,p_name=>'P87_IDNTFCCION_SJTO2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(420213918563085860)
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
 p_id=>wwv_flow_api.id(210842067293038023)
,p_name=>'P87_ID_SLCTUD'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(420213918563085860)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(210842418480038023)
,p_name=>'P87_NMRO_RDCDO_DSPLAY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(420213918563085860)
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
 p_id=>wwv_flow_api.id(210842892229038023)
,p_name=>'P87_FCHA_RDCDO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(420213918563085860)
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
 p_id=>wwv_flow_api.id(210843256168038024)
,p_name=>'P87_OBSRVCION_S'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(420213918563085860)
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
 p_id=>wwv_flow_api.id(210843626204038024)
,p_name=>'P87_VLDAR_TRBTO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(420213918563085860)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(210844348568038026)
,p_name=>'P87_CDGO_RSPNSBLE_TPO_S'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(420216093958085882)
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
 p_id=>wwv_flow_api.id(210844782598038026)
,p_name=>'P87_CDGO_IDNTFCCION_TPO_S'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(420216093958085882)
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
 p_id=>wwv_flow_api.id(210845103843038026)
,p_name=>'P87_IDNTFCCION_S'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(420216093958085882)
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
 p_id=>wwv_flow_api.id(210845590298038027)
,p_name=>'P87_PRMER_NMBRE_S'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(420216093958085882)
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
 p_id=>wwv_flow_api.id(210845954701038027)
,p_name=>'P87_SGNDO_NMBRE_S'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(420216093958085882)
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
 p_id=>wwv_flow_api.id(210846391001038027)
,p_name=>'P87_PRMER_APLLDO_S'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(420216093958085882)
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(210846768872038027)
,p_name=>'P87_SGNDO_APLLDO_S'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(420216093958085882)
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
 p_id=>wwv_flow_api.id(210847125715038028)
,p_name=>'P87_ID_PAIS_NTFCCION_S'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(420216093958085882)
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
 p_id=>wwv_flow_api.id(210847592755038030)
,p_name=>'P87_ID_DPRTMNTO_NTFCCION_S'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(420216093958085882)
,p_prompt=>'Departamento'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_dprtmnto',
'     , id_dprtmnto ',
'  from df_s_departamentos ',
' where id_pais = :P11_ID_PAIS_NTFCCION_S;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P87_ID_PAIS_NTFCCION_S'
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
 p_id=>wwv_flow_api.id(210847926781038030)
,p_name=>'P87_ID_MNCPIO_NTFCCION_S'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(420216093958085882)
,p_prompt=>'Municipio'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_mncpio',
'     , id_mncpio ',
'  from df_s_municipios ',
' where id_dprtmnto = :P11_ID_DPRTMNTO_NTFCCION_S'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P87_ID_DPRTMNTO_NTFCCION_S'
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
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(210848341617038030)
,p_name=>'P87_DRCCION_NTFCCION_S'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(420216093958085882)
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
 p_id=>wwv_flow_api.id(210848793488038031)
,p_name=>'P87_EMAIL_S'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(420216093958085882)
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
 p_id=>wwv_flow_api.id(210849180395038031)
,p_name=>'P87_TLFNO_S'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(420216093958085882)
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
 p_id=>wwv_flow_api.id(210849505566038031)
,p_name=>'P87_CLLAR_S'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(420216093958085882)
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
 p_id=>wwv_flow_api.id(210854034957038050)
,p_name=>'P87_ID_RDCDOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(420561810190289960)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(210854490510038050)
,p_name=>'P87_CDGO_IDNTFCCION_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(420561810190289960)
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
 p_id=>wwv_flow_api.id(210854820086038050)
,p_name=>'P87_IDNTFCCION'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(420561810190289960)
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
 p_id=>wwv_flow_api.id(210855228475038050)
,p_name=>'P87_PRMER_NMBRE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(420561810190289960)
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
 p_id=>wwv_flow_api.id(210855658891038051)
,p_name=>'P87_SGNDO_NMBRE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(420561810190289960)
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
 p_id=>wwv_flow_api.id(210856008616038051)
,p_name=>'P87_PRMER_APLLDO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(420561810190289960)
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
 p_id=>wwv_flow_api.id(210856433903038051)
,p_name=>'P87_SGNDO_APLLDO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(420561810190289960)
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
 p_id=>wwv_flow_api.id(210861610212038064)
,p_name=>'P87_ID_ADJNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(420994172798553060)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(210862759938038066)
,p_name=>'P87_IMPUESTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(488315736204289038)
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
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(210863112249038067)
,p_name=>'P87_PRGRMA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(488315736204289038)
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
 p_id=>wwv_flow_api.id(210863539300038067)
,p_name=>'P87_SUBPRGRMA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(488315736204289038)
,p_prompt=>'SubPrograma'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_sbprgrma as d,',
'        a.id_sbprgrma as r ',
'from fi_d_subprogramas a',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.id_prgrma = :P87_PRGRMA',
'and actvo = ''S'';',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P87_PRGRMA'
,p_ajax_items_to_submit=>'P87_SUBPRGRMA'
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
 p_id=>wwv_flow_api.id(210863968339038067)
,p_name=>'P87_FLJO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(488315736204289038)
,p_prompt=>'Flujo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion_fljo as d,',
'       a.id_fljo as r',
'from wf_d_flujos a',
'where a.id_fljo = (select  b.id_fljo ',
'                   from fi_d_programas b',
'                   where b.id_prgrma = :P87_PRGRMA);'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P87_PRGRMA'
,p_ajax_items_to_submit=>'P87_FLJO'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(210864318729038067)
,p_name=>'P87_ETPA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(488315736204289038)
,p_prompt=>'Etapa'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.dscrpcion_trea,',
'       a.id_fljo_trea',
'from wf_d_flujos_tarea  a',
'join wf_d_tareas        b   on  a.id_trea   =   b.id_trea',
'where a.id_fljo = :P87_FLJO',
'order by b.dscrpcion_trea;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P87_FLJO'
,p_ajax_items_to_submit=>'P87_ETPA'
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
 p_id=>wwv_flow_api.id(210864746130038068)
,p_name=>'P87_IDNTFCCION_SJTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(488315736204289038)
,p_prompt=>unistr('Identificaci\00F3n')
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
 p_id=>wwv_flow_api.id(210865438622038069)
,p_name=>'P87_OBSRVCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(420823181113789457)
,p_prompt=>unistr('Observaci\00F3n Abogado')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>100
,p_cMaxlength=>1000
,p_cHeight=>15
,p_read_only_when=>'P87_CDGO_RSPTA'
,p_read_only_when2=>'REG'
,p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(210866151156038070)
,p_name=>'P87_ID_EXPDNTE_ANLSIS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(420827046822789496)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(210866591573038070)
,p_name=>'P87_ID_EXPDNTE_ANLSIS_DTLL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(420827046822789496)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(210866913953038070)
,p_name=>'P87_ID_FLJO_TREA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(420827046822789496)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(210867397566038072)
,p_name=>'P87_ID_PRDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(420827046822789496)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(210867744585038072)
,p_name=>'P87_VGNCIA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(420827046822789496)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(211282243500913002)
,p_name=>'P87_ID_ACTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(488315736204289038)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(211282339519913003)
,p_name=>'P87_CDGO_RSPTA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(488315736204289038)
,p_item_default=>'x'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213068379344526902)
,p_name=>'P87_INDCDOR_RCHZAR'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(420823181113789457)
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213552140885722701)
,p_name=>'P87_OBSRVCION_CNTDOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(420823181113789457)
,p_prompt=>unistr('Observaci\00F3n Contador.')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>100
,p_cMaxlength=>1000
,p_cHeight=>15
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(213258641398156907)
,p_computation_sequence=>10
,p_computation_item=>'P87_INDCDOR_RCHZAR'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'S'
,p_compute_when_type=>'NEVER'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(211496258720383589)
,p_computation_sequence=>20
,p_computation_item=>'P87_ID_INSTNCIA_FLJO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'F_ID_INSTNCIA_FLJO'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(210883515527038102)
,p_name=>'Al seleccionar expediente'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(420248311680864566)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(210884006493038103)
,p_event_id=>wwv_flow_api.id(210883515527038102)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'buildJsonExpediente();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(210884508012038104)
,p_event_id=>wwv_flow_api.id(210883515527038102)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P87_JSON'
,p_attribute_03=>'P87_JSON'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(210885076373038106)
,p_event_id=>wwv_flow_api.id(210883515527038102)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(420249862711864581)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(210885564219038106)
,p_event_id=>wwv_flow_api.id(210883515527038102)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(420827046822789496)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(210885953536038107)
,p_name=>'Al seleccionar vigencia'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(420249862711864581)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(210886466272038107)
,p_event_id=>wwv_flow_api.id(210885953536038107)
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
 p_id=>wwv_flow_api.id(210886870314038107)
,p_name=>'Al cambiar tipo'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P87_ID_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(210887323105038108)
,p_event_id=>wwv_flow_api.id(210886870314038107)
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
,p_attribute_02=>'P87_ID_TPO'
,p_attribute_03=>'P87_VLDAR_TRBTO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(210887796699038108)
,p_name=>'al cambiar validar tributo'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P87_VLDAR_TRBTO'
,p_condition_element=>'P87_VLDAR_TRBTO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(210888217501038108)
,p_event_id=>wwv_flow_api.id(210887796699038108)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_ID_IMPSTO,P87_ID_IMPSTO_SBMPSTO,P87_IDNTFCCION_SJTO2'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(210888771408038109)
,p_event_id=>wwv_flow_api.id(210887796699038108)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P87_ID_IMPSTO,P87_ID_IMPSTO_SBMPSTO,P87_IDNTFCCION_SJTO2'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(210889126633038109)
,p_name=>'Seleccionar abogado'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P87_ABOGADO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(210889630001038109)
,p_event_id=>wwv_flow_api.id(210889126633038109)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P87_ABOGADO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(210890085873038109)
,p_name=>'Registrar solicitud'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(209522566502591305)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(210890559025038110)
,p_event_id=>wwv_flow_api.id(210890085873038109)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function registrarSolicitud() {',
'    try {',
'        var popup = apex.widget.waitPopup();',
'        var json = window.localStorage.jsonVigencia;',
'        let contentJson = JSON.parse(json);',
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
unistr('apex.message.confirm("\00BFEst\00E1 seguro de registrar la solicitud de an\00E1lisis de expediente?", function(okPressed) {'),
'   if(okPressed) {',
'       registrarSolicitud();',
'        ',
'   } ',
'});',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(213168007847515701)
,p_name=>'Al cerrar Observaciones btn'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(212992068417437301)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(213168139630515702)
,p_event_id=>wwv_flow_api.id(213168007847515701)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(213096523360471104)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(213175624033947403)
,p_name=>'Al cerrar Observaciones'
,p_event_sequence=>90
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(213096523360471104)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(213175715065947404)
,p_event_id=>wwv_flow_api.id(213175624033947403)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(213096523360471104)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(213282611364930501)
,p_name=>unistr('Devolver an\00E1lisis')
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(213258880602156909)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(213282752127930502)
,p_event_id=>wwv_flow_api.id(213282611364930501)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function fnc_revertirAnalisis(){',
'    ',
unistr('    console.log("Entro a la funci\00F3n fnc_revertirAnalisis");'),
'    let $waitPopup = apex.widget.waitPopup();',
'    try{',
'        await apex.server.process ( "AjaxRechazarAnalisis", {',
'            pageItems: "#P87_ID_EXPDNTE_ANLSIS"',
'        }, {',
'            success: function( pData ){',
'                ',
'                console.log("respuesta => "+pData.o_cdgo_rspsta);',
'                ',
'                if (pData.o_cdgo_rspsta != 0){',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors ([',
'                        {',
'                            type:       "error",',
'                            location:   "page",',
'                            message:    pData.o_mnsje_rspsta,',
'                            unsafe:     false',
'                        }',
'                    ]);',
'                }else{',
unistr('                    apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                    revertirTarea();',
'                    console.log("Antes de tarea_siguiente");',
'                    //tarea_siguiente();',
'                    console.log("depues de tarea_siguiente");',
'',
'                }',
'            }',
'        })',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        $waitPopup.remove();',
'    }',
'};',
'',
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de rechazar el an\00E1lisis del contador?", function( okPressed ) {'),
'        if( okPressed ) {',
'           //  revertirTarea();',
'            console.log("Antes de fnc_revertirAnalisis");',
'            fnc_revertirAnalisis();',
'        }',
'    });'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(49253572258265701)
,p_name=>'Al cerrar modal observaciones'
,p_event_sequence=>120
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(420513646335634057)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(49253624820265702)
,p_event_id=>wwv_flow_api.id(49253572258265701)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(420513646335634057)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(210882726698038100)
,p_process_sequence=>80
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
'        --apex_application.g_print_success_message := ''<span style="color:white">ITEM [''||:P149_ID_RNTA_ADJNTO||'']!'';',
'         insert into muerto (v_001,  t_001)  values (''Entrando...1  =>'' ||:P87_ID_ADJNTO, sysdate ) ; commit;',
'         ',
'       select  file_blob,    ',
'               file_bfile,     ',
'               file_mimetype,     ',
'               file_name',
'        into   v_file_blob,   ',
'               v_file_bfile,   ',
'               v_file_mimetype,   ',
'               v_file_name',
'        from gn_g_adjuntos',
'        where id_adjnto  = :P87_ID_ADJNTO;',
'',
'    if  v_file_blob is null and v_file_bfile is not null then',
'    ',
'            -- apex_application.g_print_success_message := ''<span style="color:white">ENTRO [''||:P149_ID_RNTA_ADJNTO||'']!'';',
'             pkg_gd_utilidades.prc_co_archco_dsco ( p_bfile          => v_file_bfile',
'                                                , o_archvo_blob      => v_file_blob ',
'                                                , o_cdgo_rspsta      => o_cdgo_rspsta ',
'                                                , o_mnsje_rspsta     => o_mnsje_rspsta) ;   ',
'        ',
'    end if;',
'    ',
'        :P87_ID_ADJNTO := null;',
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
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DESCARGAR_ADJUNTO'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(211096059121742902)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AjaxAplicarSolicitud_1'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    ',
'    v_cdgo_rspsta   number;',
'    v_mnsje_rspsta  varchar2(1000);',
'    v_cnddtoVgncia  clob;',
'    v_exception     exception;',
'    v_ttal_obsrvcion    number := 0;',
'',
'',
'begin    ',
'        begin',
'            select count(*)',
'            into v_ttal_obsrvcion',
'            from fi_g_expndnts_analisis_obsvcion a',
'            where a.id_expdnte_anlsis = :P87_ID_EXPDNTE_ANLSIS ',
'            and a.indcdor_cnfrmdo = ''N'';',
'        exception',
'            when no_data_found    then',
'                       null;',
'            when others    then',
'                             raise_application_error(-20001, ''Error al consultar las observaciones'');',
'        end;',
'        ',
'        if v_ttal_obsrvcion > 0  then ',
'             raise_application_error(-20001, ''Por favor confirme todas las observaciones.'');',
'        end if;',
'                ',
'        if :P87_OBSRVCION is null or :P87_OBSRVCION = '''' then',
unistr('         raise_application_error(-20001, ''Por favor ingrese una observaci\00F3n'');'),
'       end if;',
'    ',
'    begin',
'        update fi_g_fsclzc_expdn_cndd_vgnc a set a.indcdor_blqdo = ''N''',
'        where a.id_slctud = :P87_ID_SLCTUD;',
'    exception',
'        when others then',
'        raise_application_error(-20001, ''Error al actualizar el indicador bloqueado de fi_g_fsclzc_expdn_cndd_vgnc'');',
'    end;',
'     ',
'    ',
'    begin',
'     ',
'        update fi_g_expedientes_analisis a set fcha_aplco = sysdate,',
'                                                id_usrio_aplco = :F_ID_USRIO,',
'                                                cdgo_rspta = ''APL''',
'                                                ,obsrvcion_aplcdo = :P87_OBSRVCION',
'        where a.id_expdnte_anlsis = :P87_ID_EXPDNTE_ANLSIS ;',
'    ',
'    exception',
'        when others then',
'        raise_application_error(-20001, ''Error al actualizar el estado aplicado del expediente analisis'');',
'    end;',
'     ',
'     ',
'     ',
'    if :P87_ID_EXPDNTE_ANLSIS is null then',
unistr('         raise_application_error(-20001, ''id expdnte_anlsis esta vac\00EDo'');'),
'        raise v_exception;',
'    end if;',
'     ',
'        ',
'          pkg_fi_fiscalizacion.prc_rg_acto_analisis_expediente(p_cdgo_clnte   =>  :F_CDGO_CLNTE,',
'                        p_id_usrio                    =>  :F_ID_USRIO,',
'                        p_id_expdnte_anlsis           =>  :P87_ID_EXPDNTE_ANLSIS,',
'                         p_id_fljo_trea               =>  :F_ID_FLJO_TREA,',
'                        p_cdgo_rspta                  =>  ''A'',',
'                        p_acto_vlor_ttal              =>  0,                       ',
'                        o_cdgo_rspsta                 =>  v_cdgo_rspsta,',
'                        o_mnsje_rspsta                => v_mnsje_rspsta) ;',
'',
'',
'    if v_cdgo_rspsta > 0 then',
'         raise_application_error(-20001, v_mnsje_rspsta);',
'        raise v_exception;',
'    end if;',
'    ',
'    begin',
'        update fi_g_fsclzc_expdn_cndd_vgnc a',
'        set a.estdo = ''P''',
'        where a.id_fsclzcion_expdnte = :P87_ID_FSCLZCION_EXPDNTE;',
'    exception',
'        when others then            ',
'            v_mnsje_rspsta :=''No se pudo actualizar el estado del expediente'';',
'            raise_application_error(-20001, v_mnsje_rspsta);',
'            raise v_exception;',
'    end;   ',
'exception',
'    when v_exception then',
'            raise_application_error(-20001, ''Error al llamar el proceso'');',
'        rollback;',
'       ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(211090279904520313)
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(211096209614742904)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AjaxRechazarSolicitud_1'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    ',
'    v_cdgo_rspsta   number;',
'    v_mnsje_rspsta  varchar2(1000);',
'    v_cnddtoVgncia  clob;',
'    v_exception     exception;',
'    v_ttal_obsrvcion    number := 0;',
'',
'begin',
'        ',
'        begin',
'            select count(*)',
'            into v_ttal_obsrvcion',
'            from fi_g_expndnts_analisis_obsvcion a',
'            where a.id_expdnte_anlsis = :P87_ID_EXPDNTE_ANLSIS ',
'            and a.indcdor_cnfrmdo = ''N'';',
'        exception',
'            when no_data_found    then',
'                       null;',
'            when others    then',
'                             raise_application_error(-20001, ''Error al consultar las observaciones'');',
'        end;',
'        ',
'        if v_ttal_obsrvcion > 0  then ',
'             raise_application_error(-20001, ''Por favor confirme todas las observaciones.'');',
'        end if; ',
'        ',
'        if :P87_OBSRVCION is null or :P87_OBSRVCION = '''' then',
unistr('            raise_application_error(-20001, ''Por favor ingrese una observaci\00F3n'');'),
'        end if;',
'          ',
'        ',
'        update fi_g_fsclzc_expdn_cndd_vgnc a set a.indcdor_blqdo = ''N''',
'        where a.id_slctud = :P87_ID_SLCTUD;',
'        ',
'        update fi_g_expedientes_analisis a set fcha_rchzo = sysdate,',
'                                                id_usrio_rchzo = :F_ID_USRIO,',
'                                                cdgo_rspta = ''RCH''',
'                                               ,obsrvcion_rchzo = :P87_OBSRVCION',
'        where a.id_expdnte_anlsis = :P87_ID_EXPDNTE_ANLSIS ;',
'        ',
'         pkg_fi_fiscalizacion.prc_rg_acto_analisis_expediente(p_cdgo_clnte   =>  :F_CDGO_CLNTE,',
'                        p_id_usrio                    =>  :F_ID_USRIO,',
'                        p_id_expdnte_anlsis           =>  :P87_ID_EXPDNTE_ANLSIS,',
'                        p_id_fljo_trea                =>  :F_ID_FLJO_TREA,          ',
'                        p_cdgo_rspta                  =>  ''R'',',
'                        p_acto_vlor_ttal              =>  0,',
'                        o_cdgo_rspsta                 =>  v_cdgo_rspsta,',
'                        o_mnsje_rspsta                => v_mnsje_rspsta) ;',
'',
'',
'    if v_cdgo_rspsta > 0 then',
'         raise_application_error(-20000, ''Erro al rechazar. ''||v_mnsje_rspsta);',
'        --raise v_exception;',
'    end if;',
'    ',
'    begin',
'        update fi_g_fsclzc_expdn_cndd_vgnc a',
'        set a.estdo = ''F''',
'        where a.id_fsclzcion_expdnte = :P87_ID_FSCLZCION_EXPDNTE;',
'    exception',
'        when others then            ',
'            v_mnsje_rspsta :=''No se pudo actualizar el estado del expediente'';',
'            raise_application_error(-20001, v_mnsje_rspsta);',
'            raise v_exception;',
'    end;   ',
'    ',
'                                              ',
'    apex_json.open_object;',
'    --apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'   -- apex_json.write(''o_mnsje_rspsta'', ''1''||v_mnsje_rspsta);',
'    apex_json.close_object;',
'    ',
'exception',
'    when v_exception then',
'        rollback;',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(211090554062521996)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(212992159101437302)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Rechazar analisis'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    ',
'    v_cdgo_rspsta   number;',
'    v_mnsje_rspsta  varchar2(1000);',
'    v_cnddtoVgncia  clob;',
'    v_exception     exception;',
'    ',
'    v_type                      varchar2(1000);',
'    v_mnsje                     varchar2(1000);',
'    v_error                     varchar2(1000);',
'    v_id_fljo_trea              number;',
'',
'',
'begin',
'            :P87_INDCDOR_RCHZAR := ''S'';',
'            ',
'          if :P87_INDCDOR_RCHZAR is null or :P87_INDCDOR_RCHZAR = ''N'' then',
'             raise_application_error(-20001, ''Error al rechazar'');',
'          end if;',
'       ',
'        /* pkg_fi_fiscalizacion.prc_rg_acto_analisis_expediente(p_cdgo_clnte   =>  :F_CDGO_CLNTE,',
'                        p_id_usrio                    =>  :F_ID_USRIO,',
'                        p_id_expdnte_anlsis           =>  :P87_ID_EXPDNTE_ANLSIS,',
'                        p_id_fljo_trea                =>  :F_ID_FLJO_TREA,          ',
'                        p_cdgo_rspta                  =>  ''R'',',
'                        p_acto_vlor_ttal              =>  0,',
'                        o_cdgo_rspsta                 =>  v_cdgo_rspsta,',
'                        o_mnsje_rspsta                => v_mnsje_rspsta) ;',
'                        ',
'          pkg_pl_workflow_1_0.prc_rg_instancias_transicion(p_id_instncia_fljo => :P87_ID_INSTNCIA_FLJO, ',
'                                                             p_id_fljo_trea     => :F_ID_FLJO_TREA, ',
'												             p_json             => null, ',
'												             o_type             => v_type, ',
'												             o_mnsje            => v_mnsje, ',
'												             o_id_fljo_trea     => v_id_fljo_trea, ',
'                                                             o_error	        => v_error);*/',
'',
'',
'    if v_type = ''N''  then',
'         raise_application_error(-20000, ''Erro al rechazar. ''||v_mnsje);',
'        --raise v_exception;',
'    end if;',
'    ',
'    ',
'                                              ',
'    apex_json.open_object;',
'    --apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'   -- apex_json.write(''o_mnsje_rspsta'', ''1''||v_mnsje_rspsta);',
'    apex_json.close_object;',
'    ',
'exception',
'    when v_exception then',
'        rollback;',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(213258880602156909)
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(213258102352156902)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Confirmar Observaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    ',
'    v_cdgo_rspsta   number := 0;',
'    v_mnsje_rspsta  varchar2(1000);',
'    v_cnddtoVgncia  clob;',
'    v_exception     exception;',
'',
'',
'begin          ',
'            ',
'    begin',
'        update fi_g_expndnts_analisis_obsvcion a set a.indcdor_cnfrmdo = ''S''',
'        where a.id_expdnte_anlsis = :P87_ID_EXPDNTE_ANLSIS ; ',
'    exception',
'        when others then            ',
'            v_mnsje_rspsta :=''No se pudo actualizar el estado del expediente'';',
'            raise_application_error(-20001, v_mnsje_rspsta);',
'            raise v_exception;',
'    end; ',
'    ',
'                                              ',
'    apex_json.open_object;',
'    --apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'   -- apex_json.write(''o_mnsje_rspsta'', ''1''||v_mnsje_rspsta);',
'    apex_json.close_object;',
'    ',
'exception',
'    when v_exception then',
'        rollback;',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(213258029338156901)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(211252248926828601)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'generar acto'
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
'       pkg_fi_fiscalizacion.prc_rg_acto_analisis_expediente(p_cdgo_clnte   =>  :F_CDGO_CLNTE,',
'                        p_id_usrio                    =>  :F_ID_USRIO,',
'                        p_id_expdnte_anlsis           =>  :P87_ID_EXPDNTE_ANLSIS,',
'                        p_cdgo_rspta                  =>  ''RCH'',',
'                        p_acto_vlor_ttal              =>  0,',
'                        p_id_cnddto                   =>  0,',
'                        o_cdgo_rspsta                 =>  v_cdgo_rspsta,',
'                        o_mnsje_rspsta                => v_mnsje_rspsta) ;',
'',
'',
'    if v_cdgo_rspsta > 0 then',
'        raise v_exception;',
'    end if;',
'    ',
'                                              ',
'    apex_json.open_object;',
'    --apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'   -- apex_json.write(''o_mnsje_rspsta'', ''1''||v_mnsje_rspsta);',
'    apex_json.close_object;',
'    ',
'exception',
'    when v_exception then',
'        rollback;',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(211096373709742905)
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(211497197763387457)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'cargar id_instncia_fljo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin      ',
'    select :F_ID_INSTNCIA_FLJO',
'    into  :P87_ID_INSTNCIA_FLJO        ',
'    from dual;     ',
'exception',
'    when no_data_found then',
'      --  null;',
'      raise_application_error(-20000, ''Solicitud no encontrada....'');',
'    when others then',
'       raise_application_error(-20000, ''Problemas al consultar solicitud''); ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(210881191801038099)
,p_process_sequence=>30
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
'     , id_slctud',
'     , nmro_rdcdo_dsplay',
'     , fcha_rdcdo',
'     , id_prsntcion_tpo ',
'     , id_instncia_fljo',
'  into :P87_ID_TPO',
'     , :P87_ID_MTVO',
'     , :P87_ID_IMPSTO',
'     , :P87_ID_IMPSTO_SBMPSTO',
'     , :P87_IDNTFCCION_SJTO2',
'     , :P87_ID_RDCDOR',
'     , :P87_ID_SLCTUD',
'     , :P87_NMRO_RDCDO_DSPLAY',
'     , :P87_FCHA_RDCDO',
'     , :P87_ID_PRSNTCION_TPO ',
'     , :P87_ID_INSTNCIA_FLJO_PDRE',
'  from v_pq_g_solicitudes',
'  where id_instncia_fljo_gnrdo  = :F_ID_INSTNCIA_FLJO;',
'  ',
'exception',
'    when no_data_found then',
'      null;',
'      -- raise_application_error(-20000, ''Solicitud no encontrada...'');',
'    when others then',
'       raise_application_error(-20000, ''Problemas al consultar solicitud''); ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P87_ID_INSTNCIA_FLJO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(210883124057038102)
,p_process_sequence=>40
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
'          -- a.id_acto,',
'           a.cdgo_rspta,',
'           a.obsrvcion,',
'           nvl(a.obsrvcion_aplcdo, a.obsrvcion_rchzo),',
'           a.id_fsclzcion_expdnte',
'    into  :P87_ID_EXPDNTE_ANLSIS,',
'          :P87_ID_EXPDNTE_ANLSIS_dtll,',
'          :P87_ID_FLJO_TREA ,',
'          :P87_ID_PRDO,',
'          :P87_VGNCIA,',
'         -- :P87_ID_ACTO,',
'          :P87_CDGO_RSPTA,',
'          :P87_OBSRVCION_CNTDOR,',
'          :P87_OBSRVCION,',
'          :P87_ID_FSCLZCION_EXPDNTE',
'    from fi_g_expedientes_analisis  a',
'    join fi_g_expndnts_anlsis_dtlle b  on a.id_expdnte_anlsis = b.id_expdnte_anlsis      ',
'    where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'    --and b.id_fljo_trea = :F_ID_FLJO_TREA',
'    fetch first 1 rows only;     ',
'exception',
'    when no_data_found then',
'        null;',
'      -- raise_application_error(-20000, ''Solicitud no encontrada'');',
'    when others then',
'       raise_application_error(-20000, ''Problemas al consultar solicitud''); ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(211601087781929801)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'cargar dato acto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin      ',
'    select ',
'           a.id_acto',
'    into  ',
'          :P87_ID_ACTO   ',
'    from fi_g_expedientes_analisis  a',
'    join fi_g_expndnts_anlsis_dtlle b  on a.id_expdnte_anlsis = b.id_expdnte_anlsis      ',
'    where  a.id_expdnte_anlsis = :P87_ID_EXPDNTE_ANLSIS',
'    --a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'    --and b.id_fljo_trea = :F_ID_FLJO_TREA',
'    fetch first 1 rows only;     ',
'exception',
'    when no_data_found then',
'        null;',
'      -- raise_application_error(-20000, ''Solicitud no encontrada'');',
'    when others then',
'       raise_application_error(-20000, ''Problemas al consultar solicitud''); ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P87_ID_INSTNCIA_FLJO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(210881599339038099)
,p_process_sequence=>60
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
'  into :P87_CDGO_IDNTFCCION_TPO',
'     , :P87_IDNTFCCION',
'     , :P87_PRMER_NMBRE',
'     , :P87_SGNDO_NMBRE',
'     , :P87_PRMER_APLLDO',
'     , :P87_SGNDO_APLLDO',
'  from pq_g_radicador',
' where id_rdcdor = :P87_ID_RDCDOR;',
'  ',
'exception',
'    when no_data_found then',
'       raise_application_error(-20000, ''Solicitud no encontrada..'');',
'    when others then',
'       raise_application_error(-20000, ''Problemas al consultar solicitud''); ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P87_ID_RDCDOR'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(210881909531038100)
,p_process_sequence=>70
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
'  into :P87_CDGO_RSPNSBLE_TPO_S',
'     , :P87_CDGO_IDNTFCCION_TPO_S ',
'     , :P87_IDNTFCCION_S',
'     , :P87_PRMER_NMBRE_S',
'     , :P87_SGNDO_NMBRE_S ',
'     , :P87_PRMER_APLLDO_S',
'     , :P87_SGNDO_APLLDO_S',
'     , :P87_ID_PAIS_NTFCCION_S',
'     , :P87_ID_DPRTMNTO_NTFCCION_S',
'     , :P87_ID_MNCPIO_NTFCCION_S',
'     , :P87_DRCCION_NTFCCION_S',
'     , :P87_EMAIL_S',
'     , :P87_TLFNO_S',
'     , :P87_CLLAR_S',
'  from pq_g_solicitantes',
' where id_slctud = :P87_ID_SLCTUD;',
'  ',
'exception',
'    when no_data_found then',
'       raise_application_error(-20000, ''Solicitud no encontrada.'');',
'    when others then',
'       raise_application_error(-20000, ''Problemas al consultar solicitud''); ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P87_ID_SLCTUD'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(210882363753038100)
,p_process_sequence=>80
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('cargar observaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select obsrvcion ',
'      into :P87_OBSRVCION_S ',
'      from pq_g_solicitudes_obsrvcion ',
'     where id_slctud = :P87_ID_SLCTUD',
'     order by id_slctd_obsrvcion ',
'     fetch first 1 rows only;',
'exception',
'    when no_data_found then',
'       raise_application_error(-20000, ''Solicitud no encontrada....'');',
'    when others then',
'       raise_application_error(-20000, ''Problemas al consultar solicitud''); ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(210880753382038097)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AjaxAplicarSolicitud'
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
'        update fi_g_fsclzc_expdn_cndd_vgnc a set a.indcdor_blqdo = ''N''',
'        where a.id_slctud = :P87_ID_SLCTUD;',
'        ',
'        update fi_g_expedientes_analisis a set fcha_aplco = sysdate,',
'                                                id_usrio_aplco = :F_ID_USRIO,',
'                                                cdgo_rspta = ''APL''',
'                                                ,obsrvcion_aplcdo = :P87_OBSRVCION',
'        where a.id_expdnte_anlsis = 61 ;',
'/*',
'    for i in 1..apex_application.g_f01.count loop',
'        v_cnddtoVgncia := v_cnddtoVgncia || apex_application.g_f01(i);',
'    end loop;',
'    ',
'    ',
'    ',
'    pkg_fi_fiscalizacion.prc_rg_expediente_analisis(p_cdgo_clnte	         => :F_CDGO_CLNTE,',
'                                                       p_id_usrio            => :F_ID_USRIO,',
'                                                       p_id_fncnrio          => :F_ID_FNCNRIO,',
'                                                       p_expediente        	 => v_cnddtoVgncia,',
'                                                       p_id_slctud           => :P87_ID_SLCTUD,',
'                                                       p_obsrvcion           => :P87_OBSRVCION,',
'                                                       P_ID_IMPSTO           => :P87_ID_IMPSTO,',
'                                                       P_ID_IMPSTO_sbmpsto   => :P87_ID_IMPSTO_SBMPSTO,',
'                                                       P_fcha_rgtro          => sysdate,',
'                                                       p_instancia_fljo      => :P87_ID_INSTNCIA_FLJO,',
'                                                       p_instancia_fljo_pdre => :P87_ID_INSTNCIA_FLJO_PDRE,',
'                                                       p_id_fljo_trea        => :F_ID_FLJO_TREA,',
'                                                       p_id_fsclzdor         => 1,',
'                                                       o_cdgo_rspsta         => v_cdgo_rspsta,',
'                                                       o_mnsje_rspsta        => v_mnsje_rspsta);',
'',
'',
'    if v_cdgo_rspsta > 0 then',
'        raise v_exception;',
'    end if;*/',
'    ',
'                                              ',
'    apex_json.open_object;',
'    --apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'   -- apex_json.write(''o_mnsje_rspsta'', ''1''||v_mnsje_rspsta);',
'    apex_json.close_object;',
'    ',
'exception',
'    when v_exception then',
'        rollback;',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(213298881981534501)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AjaxRechazarAnalisis'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    ',
'    v_cdgo_rspsta   number := 0;',
'    v_mnsje_rspsta  varchar2(1000) := ''ok'';',
'    v_cnddtoVgncia  clob;',
'    v_exception     exception;',
'    v_ttal_obsrvcion    number;',
'    v_ttal_obsrvcion_2   number;',
'',
'',
'begin    ',
'        begin',
'            select count(*)',
'            into v_ttal_obsrvcion',
'            from fi_g_expndnts_analisis_obsvcion a',
'            where a.id_expdnte_anlsis = :P87_ID_EXPDNTE_ANLSIS ',
'            and a.indcdor_cnfrmdo = ''N'';',
'        exception',
'            when no_data_found    then',
'                       null;',
'            when others    then',
'                    v_cdgo_rspsta    := 1 ;',
'                    v_mnsje_rspsta   := v_cdgo_rspsta||'' - Error al consultar el total de observaciones'';',
'        end;',
'        ',
'        if v_ttal_obsrvcion > 0  then ',
'                v_cdgo_rspsta    := 2 ;',
'                v_mnsje_rspsta   := v_cdgo_rspsta||'' - Por favor confirme todas las observaciones.'';',
'        end if;',
'        ',
'        begin',
'            select count(*)',
'            into v_ttal_obsrvcion_2',
'            from fi_g_expndnts_analisis_obsvcion a',
'            where a.id_expdnte_anlsis = :P87_ID_EXPDNTE_ANLSIS ;',
'            --and a.indcdor_cnfrmdo = ''S'';',
'        exception',
'            when no_data_found    then',
'                       null;',
'            when others    then',
'                    v_cdgo_rspsta    := 1 ;',
'                    v_mnsje_rspsta   := v_cdgo_rspsta||'' - Error al consultar el total de observaciones'';',
'        end;',
'        ',
'        if v_ttal_obsrvcion_2 = 0 then',
'                v_cdgo_rspsta    := 3 ;',
unistr('                v_mnsje_rspsta   := v_cdgo_rspsta||'' - Debe digitar al menos una (1) observaci\00F3n.'';'),
'        end if;',
'        ',
'        /*              ',
'        begin',
'            delete ',
'            from fi_g_expndnts_anlsis_dtlle a ',
'            where a.id_expdnte_anlsis = :P87_ID_EXPDNTE_ANLSIS;',
'        exception ',
'           when    no_data_found    then',
'                   v_cdgo_rspsta     := 5 ;',
unistr('                   v_mnsje_rspsta    := v_cdgo_rspsta||'' - No s\00E9 encontr\00F3 expediente an\00E1lisis detalle'';'),
'           when    others            then',
'                   v_cdgo_rspsta     := 6 ;',
unistr('                    v_mnsje_rspsta   := v_cdgo_rspsta||'' - Error al eliminar el expediente an\00E1lisis detalle'';'),
'           ',
'        end;',
'',
'        if v_cdgo_rspsta > 0 then',
'            raise v_exception;',
'        end if;*/',
'       ',
'       :P87_INDCDOR_RCHZAR := ''S'';',
'        ',
'        /*begin',
'            delete ',
'            from fi_g_expedientes_analisis a ',
'            where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO;',
'        exception ',
'           when    no_data_found    then',
'                   v_cdgo_rspsta     := 7 ;',
unistr('                   v_mnsje_rspsta    := v_cdgo_rspsta||'' - No s\00E9 encontr\00F3 expediente an\00E1lisis'';'),
'           when    others            then',
'                   v_cdgo_rspsta     := 8 ;',
unistr('                    v_mnsje_rspsta   := v_cdgo_rspsta||'' - Error al eliminar el expediente an\00E1lisis'';'),
'           ',
'        end;',
'        ',
'    commit;*/',
'    ',
'   /* owa_util.mime_header(''application/json'', false);',
'    htp.p(''cache-control: no-cache'');',
'    htp.p(''pragma: no-cache''); ',
'    owa_util.http_header_close;',
'    ',
'    htp.p(''{"o_cdgo_rspsta" :''||v_cdgo_rspsta||',
'          '',"o_mnsje_rspsta":"''||v_mnsje_rspsta||''"}'');*/',
'                                              ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'    ',
'exception',
'    when v_exception then',
'        rollback;',
'        :P87_INDCDOR_RCHZAR := ''N'';',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(211095949799742901)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AjaxRechazarSolicitud'
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
'        update fi_g_fsclzc_expdn_cndd_vgnc a set a.indcdor_blqdo = ''N''',
'        where a.id_slctud = :P87_ID_SLCTUD;',
'        ',
'        update fi_g_expedientes_analisis a set fcha_rchzo = sysdate,',
'                                                id_usrio_rchzo = :F_ID_USRIO,',
'                                                cdgo_rspta = ''RCH''',
'                                               ,obsrvcion_rchzo = :P87_OBSRVCION',
'        where a.id_expdnte_anlsis = 61 ;',
'/*',
'    for i in 1..apex_application.g_f01.count loop',
'        v_cnddtoVgncia := v_cnddtoVgncia || apex_application.g_f01(i);',
'    end loop;',
'    ',
'    ',
'    ',
'    pkg_fi_fiscalizacion.prc_rg_expediente_analisis(p_cdgo_clnte	         => :F_CDGO_CLNTE,',
'                                                       p_id_usrio            => :F_ID_USRIO,',
'                                                       p_id_fncnrio          => :F_ID_FNCNRIO,',
'                                                       p_expediente        	 => v_cnddtoVgncia,',
'                                                       p_id_slctud           => :P87_ID_SLCTUD,',
'                                                       p_obsrvcion           => :P87_OBSRVCION,',
'                                                       P_ID_IMPSTO           => :P87_ID_IMPSTO,',
'                                                       P_ID_IMPSTO_sbmpsto   => :P87_ID_IMPSTO_SBMPSTO,',
'                                                       P_fcha_rgtro          => sysdate,',
'                                                       p_instancia_fljo      => :P87_ID_INSTNCIA_FLJO,',
'                                                       p_instancia_fljo_pdre => :P87_ID_INSTNCIA_FLJO_PDRE,',
'                                                       p_id_fljo_trea        => :F_ID_FLJO_TREA,',
'                                                       p_id_fsclzdor         => 1,',
'                                                       o_cdgo_rspsta         => v_cdgo_rspsta,',
'                                                       o_mnsje_rspsta        => v_mnsje_rspsta);',
'',
'',
'    if v_cdgo_rspsta > 0 then',
'        raise v_exception;',
'    end if;*/',
'    ',
'                                              ',
'    apex_json.open_object;',
'    --apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'   -- apex_json.write(''o_mnsje_rspsta'', ''1''||v_mnsje_rspsta);',
'    apex_json.close_object;',
'    ',
'exception',
'    when v_exception then',
'        rollback;',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(211518685702160001)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DESCARGA'
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
'        --apex_application.g_print_success_message := ''<span style="color:white">ITEM [''||:P149_ID_RNTA_ADJNTO||'']!'';',
'     insert into muerto (v_001, v_002, t_001)  values (''DESCARGA '', v_file_name, sysdate ) ; commit;',
'',
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
'        where id_adjnto  =  :P87_ID_ADJNTO;',
'',
'    if  v_file_blob is null and v_file_bfile is not null then',
'    ',
'            -- apex_application.g_print_success_message := ''<span style="color:white">ENTRO [''||:P149_ID_RNTA_ADJNTO||'']!'';',
'             pkg_gd_utilidades.prc_co_archco_dsco ( p_bfile          => v_file_bfile',
'                                                , o_archvo_blob      => v_file_blob ',
'                                                , o_cdgo_rspsta      => o_cdgo_rspsta ',
'                                                , o_mnsje_rspsta     => o_mnsje_rspsta) ;   ',
'        ',
'    end if;',
'    ',
'    :P87_ID_ADJNTO := null;',
'    ',
'     htp.init;',
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
'           insert into muerto (v_001, v_002, t_001)  values (''ERROR'', v_file_name, sysdate ) ; commit;',
'',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
end;
/
