prompt --application/pages/page_00089
begin
wwv_flow_api.create_page(
 p_id=>89
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>unistr('Gesti\00F3n de An\00E1lisis de expediente')
,p_step_title=>unistr('Gesti\00F3n de An\00E1lisis de expediente')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var v_json = '''';',
'',
'',
'function buildJsonCandidatos() {',
'    ',
'    var region = apex.region(''candidatos'');',
'    ',
'    if(region) {',
'        ',
'        var view = apex.region("candidatos").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        var jsonCandidatos = records.map((candidato) => {',
'            return {"ID_CNDDTO" : model.getValue(candidato, "ID_CNDDTO")}; ',
'        });',
'        $s(''P11_JSON'', JSON.stringify(jsonCandidatos));',
'        window.localStorage.setItem(''jsonCandidatos'', JSON.stringify(jsonCandidatos));',
'    }',
'}',
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
'            return {"ID_CNDDTO" : model.getValue(vigencia, "ID_CNDDTO"),',
'                    "VGNCIA"    : model.getValue(vigencia, "VGNCIA"),',
'                    "ID_PRDO"   : model.getValue(vigencia, "ID_PRDO"),',
'                    "DCLRCION_VGNCIA_FRMLRIO"   : model.getValue(vigencia, "DCLRCION_VGNCIA_FRMLRIO"),',
'                    "ID_SJTO_IMPSTO"   : model.getValue(vigencia, "ID_SJTO_IMPSTO"),',
'                    "ID_CNDDTO_VGNCIA"   : model.getValue(vigencia, "ID_CNDDTO_VGNCIA")',
'                   }; ',
'        });',
'        ',
'        var c = jsonVigencia.map(function(e){return e.ID_CNDDTO}).filter(function(f,i,r){return r.indexOf(f) === i})',
'        ',
'        buildJson(c, jsonVigencia);',
'',
'    }',
'}',
'',
'function buildJsonFlujos() {',
'    ',
'    var region = apex.region(''fiscalizacion'');',
'    ',
'    if(region) {',
'        ',
'        var view = apex.region("fiscalizacion").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        var jsonFlujos = records.map((flujo) => {',
'            return {',
'                        "ID_INSTNCIA_FLJO": model.getValue(flujo, "ID_INSTNCIA_FLJO"),',
'                        "ID_FLJO_TREA_ORGEN": model.getValue(flujo, "ID_FLJO_TREA_ORGEN"),',
'                        "ID_SJTO_IMPSTO": model.getValue(flujo, "ID_SJTO_IMPSTO"),',
'                        "ID_FSCLZCION_EXPDNTE": model.getValue(flujo, "ID_FSCLZCION_EXPDNTE"),',
'                        "ID_CNDDTO": model.getValue(flujo, "ID_CNDDTO"),',
'                        "IDNTFCCION_SJTO": model.getValue(flujo, "IDNTFCCION_SJTO"),',
'                        "ID_PRGRMA": model.getValue(flujo, "ID_PRGRMA"),',
'                        "ID_SBPRGRMA": model.getValue(flujo, "ID_SBPRGRMA")',
'                   }; ',
'        });',
'        ',
'        window.localStorage.setItem(''jsonFlujos'', JSON.stringify(jsonFlujos));',
'    }',
'}',
'',
'function iniciar_flujo(id_instancia,id_fljo_trea){    ',
'    apex.server.process("AjaxIrFlujo", {f01: id_instancia, f02: id_fljo_trea}, {',
'        success: function (data) { ',
'            if (data.type === ''OK'') {',
'                console.log(data.test);',
'                window.localStorage.clear();',
'                window.location.href = data.url;',
'            }else{',
'                apex.message.showErrors({',
'                    type: apex.message.TYPE.ERROR,',
'                    location: ["page"],',
'                    message: data.msg,',
'                    unsafe: false',
'                });',
'            }',
'        },',
'        error: function () {',
'            console.log(arguments);',
'        }',
'    });',
'}',
'',
'function ocultarBotonInciarFsclzcion(){',
'    if(JSON.parse(window.localStorage.jsonVigencia).length > 0){',
'        apex.item(''iniciarFisca'').show();',
'    }else{',
'        apex.item(''iniciarFisca'').hide();',
'    }	',
'    ',
'}',
'',
'function ocultarBotonTransicionMasiva(){',
'    if(JSON.parse(window.localStorage.jsonFlujos).length > 0){',
'        apex.item(''trnscion_msva'').show();',
'    }else{',
'        apex.item(''trnscion_msva'').hide();',
'    }	',
'    ',
'}',
'',
'',
'',
'function buildJson(candidato, json) {',
'    ',
'    candidato = candidato.map(function(c) {',
'        return {"ID_CNDDTO" : c, "VGNCIA" : []}',
'    })',
'    ',
'    candidato.forEach(function(c) {',
'        json.forEach(function(o) {',
'            if (c.ID_CNDDTO == o.ID_CNDDTO) {',
'                c.VGNCIA.push(',
'                    {',
'                        "VGNCIA" : o.VGNCIA, ',
'                        "ID_PRDO" : o.ID_PRDO, ',
'                        "DCLRCION_VGNCIA_FRMLRIO" : o.DCLRCION_VGNCIA_FRMLRIO, ',
'                        "ID_SJTO_IMPSTO" : o.ID_SJTO_IMPSTO, ',
'                        "ID_CNDDTO_VGNCIA" : o.ID_CNDDTO_VGNCIA',
'                    }',
'                )',
'            }',
'        })',
'    })',
'    ',
'    window.localStorage.setItem(''jsonVigencia'', JSON.stringify(candidato));',
'    ',
'}',
'',
'function allFlujos(e,btn,ig, data){',
'   ',
'    var jsonFlujos = data.map((flujo) => {',
'        return {',
'            "ID_INSTNCIA_FLJO": flujo.ID_INSTNCIA_FLJO,',
'            "ID_FLJO_TREA_ORGEN": flujo.ID_FLJO_TREA_ORGEN,',
'            "ID_SJTO_IMPSTO": flujo.ID_SJTO_IMPSTO,',
'            "ID_FSCLZCION_EXPDNTE": flujo.ID_FSCLZCION_EXPDNTE,',
'            "ID_CNDDTO": flujo.ID_CNDDTO,',
'            "IDNTFCCION_SJTO": flujo.IDNTFCCION_SJTO,',
'            "ID_PRGRMA": flujo.ID_PRGRMA,',
'            "ID_SBPRGRMA": flujo.ID_SBPRGRMA',
'        }; ',
'    });',
'    ',
'    window.localStorage.setItem(''jsonFlujos'', JSON.stringify(jsonFlujos));',
'}',
'',
'',
'function allCandidato(e,btn,ig, data){',
'    ',
'    var jsonCandidatos = data.map((candidato) => {',
'            return {"ID_CNDDTO" : candidato.ID_CNDDTO}; ',
'    });',
'    console.log(''allcandidato'',jsonCandidatos);',
'    //$s(''P11_JSON'', JSON.stringify(jsonCandidatos));',
'    // apex.item("P11_JSON").setValue( JSON.stringify(jsonCandidatos));',
'    window.localStorage.setItem(''jsonCandidatos'', JSON.stringify(jsonCandidatos)); ',
'    json_itemSession(jsonCandidatos);',
'    ',
'}',
'',
'function allVigencia(e,btn,ig, data){',
'    ',
'    var jsonVigencia = data.map((vigencia) => {',
'        return {"ID_CNDDTO" : vigencia.ID_CNDDTO,',
'                "VGNCIA"    : vigencia.VGNCIA,',
'                "ID_PRDO"   : vigencia.ID_PRDO,',
'                "DCLRCION_VGNCIA_FRMLRIO"   : vigencia.DCLRCION_VGNCIA_FRMLRIO,',
'                "ID_SJTO_IMPSTO"   : vigencia.ID_SJTO_IMPSTO,',
'                "ID_CNDDTO_VGNCIA"   : vigencia.ID_CNDDTO_VGNCIA,',
'                }; ',
'    });',
'    ',
'    var c = jsonVigencia.map(function(e){return e.ID_CNDDTO}).filter(function(f,i,r){return r.indexOf(f) === i})',
'        ',
'    buildJson(c, jsonVigencia);',
'  ',
'}',
'',
'//---------------------INICIO NOTIFICACION MASIVA---------------------------------------------------------------------//',
'',
'',
'function obtenerActos(){',
'    var region = apex.region("fiscalizacion");',
'    var responsables  = [];',
'    if (region) {',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;  ',
'        var records = view.view$.grid("getSelectedRecords");',
'        if($.isEmptyObject(records) == false){',
'            for(let i=0; i<records.length; i++){',
'                if((model.getValue(records[i], "GENERADO") === ''No'' ? false : true) === true && model.getValue(records[i], "NOTIFICADO")  === ''No'')',
'                responsables.push({"ID_ACTO": model.getValue(records[i], "ID_ACTO").trim(),',
'                                   "DSCRPCION_TREA": model.getValue(records[i], "DSCRPCION_TREA"),',
'                                   "ID_NTFCCION_DTLLE": model.getValue(records[i], "ID_NTFCCION_DTLLE")});',
'            }',
'           v_json = JSON.stringify(responsables);',
'        }',
'        else{',
'           v_json = '''';',
'        }',
'    }',
'}',
'',
'const peticionServerProcess = (proc, json = {}) => {',
'  return apex.server.process(proc, json);',
'}',
'',
'async function notificarActos() {',
'  obtenerActos()',
'  let $await;',
'  if (v_json) {',
'    //alert(''Numero de actos por notificar: '' + JSON.parse(v_json).length + ''.'')',
'    ',
'    var count = JSON.parse(v_json).length;  ',
unistr('    apex.message.confirm(''\00BFEst\00E1 seguro de enviar a notificar '' + count + '' acto(s)?'', async d => {'),
'      if (d) {',
'        var popup = apex.widget.waitPopup();',
'        try {',
'          const respNotificarActo = await peticionServerProcess(''NotificarActos'', { f01: v_json });',
'          console.log(respNotificarActo)',
'          if(respNotificarActo.tipo === ''ERROR''){',
'              popup.remove();',
'              apex.message.clearErrors();',
'              apex.message.showErrors([',
'                {',
'                  type: "error",',
'                  location: ["page"],',
'                  message: respNotificarActo.mensaje,',
'                  unsafe: false',
'                }]);',
'          } else {',
'              const respCrearActosLote = await peticionServerProcess(''CrearActosLote'', { f01: v_json });',
'              if(respCrearActosLote.tipo === ''ERROR''){',
'                  popup.remove();',
'                  apex.message.clearErrors();',
'                  apex.message.showErrors([',
'                    {',
'                      type: "error",',
'                      location: ["page"],',
'                      message: respCrearActosLote.mensaje,',
'                      unsafe: false',
'                    }]);',
'              } else {',
'                  popup.remove();',
'                 if(respCrearActosLote.nt_espcial === 1){',
'                    window.open(respCrearActosLote.url, ''_blank'');',
'                    apex.message.showPageSuccess(respCrearActosLote.mensaje);',
'                    apex.region("fiscalizacion").refresh();',
'                  } else {',
'                      apex.message.showPageSuccess(respCrearActosLote.mensaje);',
'                      apex.region("fiscalizacion").refresh();',
'                  }',
'              }',
'          }',
'        } catch (e) {',
'            popup.remove();',
'            console.log(e);',
'        } finally {',
'            popup.remove();',
'        }',
'      }',
'    })',
'  } else {',
'    apex.message.clearErrors();',
'    apex.message.showErrors([',
'      {',
'        type: "error",',
'        location: ["page"],',
unistr('        message: "Ning\00FAn acto seleccionado, por favor verifique!",'),
'        unsafe: false',
'      }]);',
'  }',
'}',
'',
'function seleccionarTodos(e, btn, grid, datos ){',
'    v_json = JSON.stringify(datos.map((m) => {',
'        return {"ID_ACTO": m["ID_ACTO"],',
'                "DSCRPCION_TREA" : m["DSCRPCION_TREA"],',
'                "ID_NTFCCION_DTLLE": m["ID_NTFCCION_DTLLE"]} ',
'    })); ',
'}',
'',
'function ocultarBotonEnviarNotificar(){',
'    obtenerActos();',
'    if(v_json !== ''''){',
unistr('        if(v_json.includes(''Emplazamiento'') || v_json.includes(''Resoluci\00F3n Por No Declarar'') || v_json.includes(''Liquidaci\00F3n de Aforo'')){'),
'            apex.item(''btn_ntfcar_actos'').show();',
'        } else {',
'            apex.item(''btn_ntfcar_actos'').hide();',
'            //apex.message.alert("El acto no es notificable.");',
'        }',
'    } else {',
'      apex.item(''btn_ntfcar_actos'').hide();',
'    }',
'}        ',
'',
'//---------------------FIN NOTIFICACION MASIVA---------------------------------------------------------------------//',
'',
'function json_itemSession(p_json){  ',
'    console.log(p_json); ',
'    let array = p_json.length <= 1001 ? p_json : p_json.slice(0, 1000);',
'    apex.server.process("set_p11_json", {',
'        f01:JSON.stringify(p_json)',
'    }, {',
'        success: function (data) { ',
'          console.log(data.P8_JSON);      ',
'                console.log(data.P11_JSON);          ',
'        },',
'        error: function () {',
'            console.log(arguments);',
'        }',
'    });',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''iniciarFisca'').hide();',
'apex.item(''trnscion_msva'').hide();',
'/*apex.jQuery( apex.gPageContext$ ).on( "apexreadyend", function( e ) {',
'   $(''#BTN_CSLES'').click();',
'});*/',
'',
'//---------------------INICIO NOTIFICACION MASIVA---------------------------------------------------------------------//',
'',
'apex.region("fiscalizacion").widget().interactiveGrid("setSelectedRecords", []);',
'apex.item(''btn_ntfcar_actos'').hide();',
'//---------------------FIN NOTIFICACION MASIVA---------------------------------------------------------------------//',
''))
,p_step_template=>wwv_flow_api.id(36470205860968633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'LARIZA'
,p_last_upd_yyyymmddhh24miss=>'20231120155128'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(211668103107712301)
,p_plug_name=>unistr('An\00E1lisis Expedientes')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(211692840273859401)
,p_plug_name=>unistr('Par\00E1metros busquedas ')
,p_parent_plug_id=>wwv_flow_api.id(211668103107712301)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(261477592413550382)
,p_plug_name=>unistr('Fiscalizaci\00F3n')
,p_region_name=>'fiscalizacion'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select *',
'from (select a.id_instncia_fljo',
'            ,a.id_expdnte_anlsis',
'            ,a.id_fsclzcion_expdnte',
'            ,a.id_prgrma',
'            ,a.id_sbprgrma',
'            , a.id_impsto',
'            , a.idntfccion_sjto            ',
'            , case when a.cdgo_rspta = ''REG'' THEN ''Registrada''	end as cdgo_rspta			',
'            , to_char(a.fcha_rgstro,''dd/mm/yyyy'') as fcha_rgstro',
'            , a.nmbre_usrio_rgstro	',
'            ,f.dscrpcion_trea',
'        from v_fi_g_expedientes_analisis a',
'        join wf_g_instancias_transicion     d   on  a.id_instncia_fljo      =   d.id_instncia_fljo',
'        join wf_d_flujos_tarea              e   on  d.id_fljo_trea_orgen    =   e.id_fljo_trea',
'        join wf_d_tareas                    f   on  e.id_trea               =   f.id_trea',
'        where a.id_impsto = :P89_IMPUESTO',
'        and a.id_prgrma = :P89_PRGRMA',
'        and a.id_sbprgrma = nvl(:P89_SUBPRGRMA,  a.id_sbprgrma)',
'        --and a.cdgo_rspta = ''REG''',
'        and a.cdgo_clnte = :F_CDGO_CLNTE',
'        and a.id_usrio_rgstro = :F_ID_USRIO',
'        and d.id_estdo_trnscion in (1,2) ',
'        and e.id_fljo_trea = nvl(:P89_ETPA, e.id_fljo_trea)',
'        and (to_char(a.fcha_rgstro,''dd/mm/yyyy'')  between :P89_FCHA_RGSTRO_DSDE  and :P89_FCHA_RGSTRO_HSTA',
'             or :P89_FCHA_RGSTRO_DSDE is null or :P89_FCHA_RGSTRO_HSTA is null)',
'        group by      a.id_instncia_fljo',
'                    , a.id_expdnte_anlsis',
'                    , a.id_fsclzcion_expdnte',
'                    , a.id_prgrma',
'                    , a.id_sbprgrma',
'                    , a.id_impsto',
'                    , a.idntfccion_sjto            ',
'                    , a.cdgo_rspta					',
'                    , a.fcha_rgstro	                 	',
'                    , a.nmbre_usrio_rgstro	',
'                    ,f.dscrpcion_trea',
'        order by  a.fcha_rgstro  desc',
'     ',
'     );'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(211668218498712302)
,p_name=>'ID_EXPDNTE_ANLSIS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EXPDNTE_ANLSIS'
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
 p_id=>wwv_flow_api.id(211668472645712304)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
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
 p_id=>wwv_flow_api.id(211668834083712308)
,p_name=>'CDGO_RSPTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_RSPTA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Estado de<br> An\00E1lisis')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>280
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
 p_id=>wwv_flow_api.id(211669185064712311)
,p_name=>'NMBRE_USRIO_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_USRIO_RGSTRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Usuario registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>310
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
 p_id=>wwv_flow_api.id(211819726009718102)
,p_name=>'FCHA_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>320
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
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
 p_id=>wwv_flow_api.id(261478013511550386)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Flujo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button onclick="iniciar_flujo(&ID_INSTNCIA_FLJO.,&ID_FLJO_TREA.)" style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton">Ir al Flujo <br> &ID_INSTNCIA_FLJO.<span class="fa fa-external-link-square"></span>',
'</button>'))
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(279962455666012281)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(279962607187012283)
,p_name=>'ID_FSCLZCION_EXPDNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FSCLZCION_EXPDNTE'
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
 p_id=>wwv_flow_api.id(283214408618353081)
,p_name=>'DSCRPCION_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_TREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Etapa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(284436143125474181)
,p_name=>'ID_PRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRGRMA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Programa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_prgrma as d,',
'        a.id_prgrma as r ',
'from fi_d_programas a where  a.cdgo_prgrma != ''OD'';'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
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
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(284436199890474182)
,p_name=>'ID_SBPRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SBPRGRMA'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(261477742076550383)
,p_internal_uid=>261477742076550383
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_no_data_found_message=>'No se encontraron expedientes'
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
 p_id=>wwv_flow_api.id(261489046799586840)
,p_interactive_grid_id=>wwv_flow_api.id(261477742076550383)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(261489106219586840)
,p_report_id=>wwv_flow_api.id(261489046799586840)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(211702210640040030)
,p_view_id=>wwv_flow_api.id(261489106219586840)
,p_display_seq=>27
,p_column_id=>wwv_flow_api.id(211668218498712302)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(211703207573040042)
,p_view_id=>wwv_flow_api.id(261489106219586840)
,p_display_seq=>29
,p_column_id=>wwv_flow_api.id(211668472645712304)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(211705219523040051)
,p_view_id=>wwv_flow_api.id(261489106219586840)
,p_display_seq=>33
,p_column_id=>wwv_flow_api.id(211668834083712308)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(211706761372040056)
,p_view_id=>wwv_flow_api.id(261489106219586840)
,p_display_seq=>36
,p_column_id=>wwv_flow_api.id(211669185064712311)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(211827125871726843)
,p_view_id=>wwv_flow_api.id(261489106219586840)
,p_display_seq=>38
,p_column_id=>wwv_flow_api.id(211819726009718102)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(261490599398586850)
,p_view_id=>wwv_flow_api.id(261489106219586840)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(261478013511550386)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(279968332125016563)
,p_view_id=>wwv_flow_api.id(261489106219586840)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(279962455666012281)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(279969360025016572)
,p_view_id=>wwv_flow_api.id(261489106219586840)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(279962607187012283)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(283220416574353322)
,p_view_id=>wwv_flow_api.id(261489106219586840)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(283214408618353081)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(284442335052475727)
,p_view_id=>wwv_flow_api.id(261489106219586840)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(284436143125474181)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(284442846536475734)
,p_view_id=>wwv_flow_api.id(261489106219586840)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(284436199890474182)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(268807000042784217)
,p_plug_name=>'Container'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(296325843037354116)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>30
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
 p_id=>wwv_flow_api.id(296326073368355290)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
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
unistr('<i>Funcionalidad que permite gestionar el proceso de solicitud de an\00E1lisis de expedientes.</i>'),
'</p>',
'',
'',
'<p align="justify">',
unistr('<i>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>'),
'</p>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(211783969610519426)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(211692840273859401)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_column_span=>3
,p_grid_column=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(209131694607688474)
,p_branch_name=>'Ir a la pagina 11'
,p_branch_action=>'f?p=&APP_ID.:89:&SESSION.::&DEBUG.:RP,11::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'BORRAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(211698488893869641)
,p_name=>'P89_IMPUESTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(211692840273859401)
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
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(211750169284949801)
,p_name=>'P89_ETPA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(211692840273859401)
,p_prompt=>unistr('Etapa expediente an\00E1lisis')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.dscrpcion_trea,',
'       a.id_fljo_trea',
'from wf_d_flujos_tarea  a',
'join wf_d_tareas        b   on  a.id_trea   =   b.id_trea',
'where a.id_fljo = ( select c.id_fljo ',
'                    from wf_d_flujos c',
'                    where c.cdgo_fljo = ''SAE'')',
'order by b.dscrpcion_trea;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(211760691526071701)
,p_name=>'P89_FCHA_RGSTRO_DSDE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(211692840273859401)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select to_date (''01/'' || extract(MONTH from sysdate) || ''/'' || extract(year from sysdate)) fcha_incio',
'    from dual'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Fecha Registro Desde'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(211760894011071703)
,p_name=>'P89_FCHA_RGSTRO_HSTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(211692840273859401)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select LAST_DAY(SYSDATE)',
'   from dual'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Fecha Registro Hasta'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(211760927720071704)
,p_name=>'P89_ID_USRIO_RGSTRO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(211692840273859401)
,p_prompt=>'Usuario'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_USUARIOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trcro || '' ['' ||idntfccion || '']'' as d,',
'       id_usrio as r',
'  from v_sg_g_usuarios',
' where cdgo_clnte        = :F_CDGO_CLNTE',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(211800306401196423)
,p_name=>'P89_PRGRMA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(211692840273859401)
,p_prompt=>'Prgrma'
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
 p_id=>wwv_flow_api.id(211802042113204270)
,p_name=>'P89_SUBPRGRMA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(211692840273859401)
,p_prompt=>'SubPrograma'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_sbprgrma as d,',
'        a.id_sbprgrma as r ',
'from fi_d_subprogramas a',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.id_prgrma = :P89_PRGRMA',
'and actvo = ''S'';',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P89_PRGRMA'
,p_ajax_items_to_submit=>'P89_SUBPRGRMA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(211807673298284001)
,p_validation_name=>'requerido'
,p_validation_sequence=>10
,p_validation=>'P89_IMPUESTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione el tributo'
,p_associated_item=>wwv_flow_api.id(211698488893869641)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(211807717015284002)
,p_validation_name=>'requerido programa'
,p_validation_sequence=>20
,p_validation=>'P89_PRGRMA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione el programa'
,p_associated_item=>wwv_flow_api.id(211800306401196423)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(209129224363688470)
,p_name=>'Capturar el evento dialogclose'
,p_event_sequence=>60
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(209129711138688471)
,p_event_id=>wwv_flow_api.id(209129224363688470)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  delete from fi_g_fsclzcn_expdnt_act_trnscn;',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(209130217618688471)
,p_event_id=>wwv_flow_api.id(209129224363688470)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(296325843037354116)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(209130616437688471)
,p_name=>unistr('clic en el bot\00F3n notificar actos')
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(147691084960258551)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(209131156771688473)
,p_event_id=>wwv_flow_api.id(209130616437688471)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'notificarActos();',
'ocultarBotonEnviarNotificar();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(209122867199688458)
,p_name=>'Al seleccionar un nuevo medio-entidad'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P89_MEDIO_ENTIDAD'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(209123398952688461)
,p_event_id=>wwv_flow_api.id(209122867199688458)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(296326073368355290)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(209121257175688456)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Elimina Candidato'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta    number;',
'    o_mnsje_rspsta   number;',
'begin',
'',
'    pkg_fi_fiscalizacion.prc_el_candidato(p_cdgo_clnte	   => :F_CDGO_CLNTE,',
'                                          p_id_cnddto      => :P_11_ID_CNDDTO,',
'                                          o_cdgo_rspsta    => o_cdgo_rspsta,',
'                                          o_mnsje_rspsta   => o_mnsje_rspsta);',
'                                          ',
'    :P_11_ID_CNDDTO := null;',
'    ',
'    ',
'    if (o_cdgo_rspsta > 0) then',
'         raise_application_error(-20001, o_mnsje_rspsta);',
'    end if;',
'',
'',
'',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P_11_ID_CNDDTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(209119238868688449)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Json Actos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    p_trea number := :P89_ETPA;',
'cursor c_actos is',
'     select a.id_acto as id_acto,',
'            a.id_acto_tpo as id_acto_tpo,',
'            a.id_fljo_trea as id_fljo_trea,',
'            a.id_fncnrio as id_fncnrio',
'      from fi_g_fsclzcion_expdnte_acto a',
'      join fi_g_fiscalizacion_expdnte b on a.id_fsclzcion_expdnte = b.id_fsclzcion_expdnte',
'     where a.id_fljo_trea = nvl(:P89_ETPA, a.id_fljo_trea);',
'begin',
'    for c in c_actos loop',
'        APEX_JSON.initialize_clob_output;',
'        APEX_JSON.open_object;',
'        APEX_JSON.write(''id_acto:'', c.id_acto);',
'        APEX_JSON.write(''id_acto_tpo:'', c.id_acto_tpo);',
'        APEX_JSON.write(''id_fljo_trea:'', c.id_fljo_trea);',
'        APEX_JSON.write(''id_fncnrio:'', c.id_fncnrio);',
'        APEX_JSON.close_object;',
'        --dbms_output.put_line(apex_json.get_clob_output);',
'    end loop;',
'',
' apex_json.free_output;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(209122037466688457)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Tipo de Acto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'   select cdgo_fljo',
'   into :P89_CDGO_FLJO',
'   from wf_d_flujos',
'   where id_fljo = :P89_FLJO;',
'    ',
'exception',
'    when others then',
'        :P89_CDGO_FLJO :=null;    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(209120473284688456)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajaxAbrirExpediente'
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
'    begin',
'         delete from fi_g_fsclzcn_expdnt_act_trnscn;',
'',
'          commit;',
'    end;',
'    ',
'    pkg_fi_fiscalizacion.prc_rg_expediente_acto_masivo(p_cdgo_clnte	         => :F_CDGO_CLNTE,',
'                                                       p_id_usrio            => :F_ID_USRIO,',
'                                                       p_id_fncnrio          => :F_ID_FNCNRIO,',
'                                                       p_candidato_vigencia	 => v_cnddtoVgncia,',
'                                                       o_cdgo_rspsta         => v_cdgo_rspsta,',
'                                                       o_mnsje_rspsta        => v_mnsje_rspsta);',
'    /*if v_cdgo_rspsta > 0 then',
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
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(211714038262081314)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AjaxIrFlujo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_id_instncia_fljo number := apex_application.g_f01(1);',
'   v_id_fljo_trea number;-- := apex_application.g_f02(1);',
'   v_url varchar2(4000);',
'   v_id_fljo_trea_orgen number;',
'   ',
'   begin',
'   ',
'       begin',
'           select id_fljo_trea_orgen',
'           into v_id_fljo_trea_orgen',
'           from wf_g_instancias_transicion',
'           where id_instncia_fljo = v_id_instncia_fljo',
'           and id_estdo_trnscion in (1,2);',
'           --insert into muerto(v_001) values (v_id_fljo_trea_orgen); commit;',
'       exception',
'           when no_data_found then',
'               begin',
'                   select distinct first_value(id_fljo_trea_orgen) over (order by id_instncia_trnscion desc)',
'                   into v_id_fljo_trea_orgen',
'                   from wf_g_instancias_transicion',
'                   where id_instncia_fljo = v_id_instncia_fljo;',
'                   ',
'              exception',
'                  when others then',
'                      v_id_fljo_trea_orgen := null;',
'              end;',
'           when others then',
'               v_id_fljo_trea_orgen := null;',
'       end;',
'       ',
'       apex_util.set_session_state(''F_ID_INSTNCIA_FLJO'', v_id_instncia_fljo );',
'       apex_util.set_session_state(''F_ID_FLJO_TREA'', v_id_fljo_trea_orgen );            	',
'       v_url := pkg_pl_workflow_1_0.fnc_gn_tarea_url(p_id_instncia_fljo => v_id_instncia_fljo,',
'                                                     p_id_fljo_trea     => v_id_fljo_trea_orgen,',
'                                                     p_clear_session    => ''S'');',
'       apex_json.open_object;',
'       apex_json.write(''type'', ''OK'');',
'       apex_json.write(''msg'', ''Url generada exitosamente'');',
'       apex_json.write(''url'', v_url);',
'       apex_json.write(''test'', 1);',
'       apex_json.close_all();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
