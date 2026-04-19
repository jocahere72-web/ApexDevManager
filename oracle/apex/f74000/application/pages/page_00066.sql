prompt --application/pages/page_00066
begin
wwv_flow_api.create_page(
 p_id=>66
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>unistr('Gesti\00F3n de Fiscalizaci\00F3n desconocidos')
,p_step_title=>unistr('Gesti\00F3n de Fiscalizaci\00F3n desconocidos')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var v_json = '''';',
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
'        console.log(''buildJson'',jsonCandidatos);',
'        $s(''P66_JSON'', JSON.stringify(jsonCandidatos));',
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
'                        "ID_PRDO" : o.ID_PRDO,  ',
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
'   // $s(''P66_JSON'', JSON.stringify(jsonCandidatos));',
'   // apex.item("P66_JSON").setValue( JSON.stringify(jsonCandidatos));',
'    window.localStorage.setItem(''jsonCandidatos'', JSON.stringify(jsonCandidatos));',
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
'        try {',
'          var popup = apex.widget.waitPopup();',
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
'        console.log(v_json)',
unistr('        if(v_json.includes(''Requerimiento de Inscripci\00F3n'') || v_json.includes(''Pliego de Cargos'') || v_json.includes(''Resoluci\00F3n Sanci\00F3n'') || v_json.includes(''Inscripci\00F3n Oficiosa'')){'),
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
'function json_itemSession(p_json){    ',
'    apex.server.process("set_p66_json", {',
'        f01:JSON.stringify(p_json)',
'    }, {',
'        success: function (data) { ',
'          ',
'                console.log(data.P66_JSON);          ',
'        },',
'        error: function () {',
'            console.log(arguments);',
'        }',
'    });',
'}',
''))
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
,p_last_upd_yyyymmddhh24miss=>'20211203095820'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(204750292784293251)
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
 p_id=>wwv_flow_api.id(204750052096293249)
,p_plug_name=>'Candidatos Asignados'
,p_parent_plug_id=>wwv_flow_api.id(204750292784293251)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36491913657968646)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(241214208208102241)
,p_plug_name=>'Tab'
,p_parent_plug_id=>wwv_flow_api.id(204750052096293249)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(36509862944968653)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct 1',
'from v_fi_g_candidatos           a',
'join v_fi_g_fiscalizacion_lote   d     on a.id_fsclzcion_lte = d.id_fsclzcion_lte',
'join fi_g_candidatos_funcionario b     on a.id_cnddto        = b.id_cnddto',
'left join fi_g_fiscalizacion_expdnte c on a.id_cnddto        = c.id_cnddto',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and b.id_fncnrio = :f_id_fncnrio',
'and c.id_expdnte is null;'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(241214360591102242)
,p_plug_name=>'Vigencia'
,p_region_name=>'vigencia'
,p_parent_plug_id=>wwv_flow_api.id(241214208208102241)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    a.id_cnddto_vgncia,',
'    a.id_cnddto,',
'    a.vgncia,',
'    a.id_prdo,',
'    b.prdo,',
'    c.candidato,',
'    c.id_sjto_impsto',
'from fi_g_candidatos_vigencia       a',
'join v_fi_g_candidatos              c   on  a.id_cnddto = c.id_cnddto',
'join df_i_periodos                  b   on  a.id_prdo = b.id_prdo',
'where a.id_cnddto in (select a.id_cnddto from json_table(:P66_JSON, ''$[*]'' columns(id_cnddto number path ''$.ID_CNDDTO'')) a);'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(194171436079510358)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(204169209528150447)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(204169317691150448)
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
 p_id=>wwv_flow_api.id(212677710217004548)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
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
 p_id=>wwv_flow_api.id(241215660417102255)
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
 p_id=>wwv_flow_api.id(241215733674102256)
,p_name=>'ID_CNDDTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNDDTO'
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
 p_id=>wwv_flow_api.id(241215856872102257)
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
 p_id=>wwv_flow_api.id(241215973236102258)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(241215533932102254)
,p_internal_uid=>241215533932102254
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
 p_id=>wwv_flow_api.id(241249980369218574)
,p_interactive_grid_id=>wwv_flow_api.id(241215533932102254)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(241250086506218574)
,p_report_id=>wwv_flow_api.id(241249980369218574)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(204175163751151818)
,p_view_id=>wwv_flow_api.id(241250086506218574)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(204169209528150447)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>101
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(204177699682233849)
,p_view_id=>wwv_flow_api.id(241250086506218574)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(204169317691150448)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>208
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(212684094207006262)
,p_view_id=>wwv_flow_api.id(241250086506218574)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(212677710217004548)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(241250568942218579)
,p_view_id=>wwv_flow_api.id(241250086506218574)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(241215660417102255)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(241251084309218581)
,p_view_id=>wwv_flow_api.id(241250086506218574)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(241215733674102256)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(241251605188218583)
,p_view_id=>wwv_flow_api.id(241250086506218574)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(241215856872102257)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(241252075009218584)
,p_view_id=>wwv_flow_api.id(241250086506218574)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(241215973236102258)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(241214504597102243)
,p_plug_name=>'Candidatos'
,p_region_name=>'candidatos'
,p_parent_plug_id=>wwv_flow_api.id(241214208208102241)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    a.id_cnddto,',
'    a.id_impsto,',
'    a.nmbre_impsto,',
'    a.id_impsto_sbmpsto,',
'    a.nmbre_impsto_sbmpsto,',
'    a.candidato,',
'    a.indcdor_asgndo,',
'    a.cdgo_cnddto_estdo,',
'    a.nmbre,',
'    a.nmbre_prgrma,',
'    a.nmbre_sbprgrma,',
'    d.idntfccion_sjto,',
'    c.id_fsclzcion_expdnte',
'from v_fi_g_candidatos           a',
'join fi_g_candidatos_funcionario b     on a.id_cnddto      = b.id_cnddto',
'join v_si_i_sujetos_impuesto     d     on a.id_sjto_impsto = d.id_sjto_impsto  ',
'left join fi_g_fiscalizacion_expdnte c on a.id_cnddto      = c.id_cnddto',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and b.id_fncnrio = :f_id_fncnrio',
'and a.cdgo_cnddto_estdo = ''ACT'' and a.cdgo_prgrma = ''OD''',
'and c.id_expdnte is null; ',
'',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(193810565547007948)
,p_name=>'CANDIDATO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANDIDATO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Candidato'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(193810684759007949)
,p_name=>'INDCDOR_ASGNDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_ASGNDO'
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
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(193810741023007950)
,p_name=>'NMBRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(194944221278666947)
,p_name=>'ID_FSCLZCION_EXPDNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FSCLZCION_EXPDNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Fsclzcion Expdnte'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>150
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
 p_id=>wwv_flow_api.id(199372214464541647)
,p_name=>'NMBRE_PRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_PRGRMA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Programa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
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
 p_id=>wwv_flow_api.id(199372243206541648)
,p_name=>'NMBRE_SBPRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_SBPRGRMA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Subprograma'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
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
 p_id=>wwv_flow_api.id(204750406911293252)
,p_name=>'BTN_ELMNAR'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_LINK'
,p_heading=>unistr('Acci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:66:&SESSION.::&DEBUG.:RP:P66_ID_CNDDTO:&ID_CNDDTO.'
,p_link_text=>'<span class="fa fa-trash-o" aria-hidden="true"></span>'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(217364203441018447)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(241214664781102245)
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(241214949417102248)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(241215012765102249)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(241215190151102250)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
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
 p_id=>wwv_flow_api.id(241215234448102251)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'SubTributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(241215441594102253)
,p_name=>'CDGO_CNDDTO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CNDDTO_ESTDO'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(241736907505712442)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(241214519332102244)
,p_internal_uid=>241214519332102244
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
'    window.localStorage.removeItem(''jsonCandidatos'');',
'    config.initialSelection = false;',
'       return selectAll(config, {',
'           name: ''Seleccionar Todos'',',
'           action: allCandidato',
'       }) ;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(241231105690161514)
,p_interactive_grid_id=>wwv_flow_api.id(241214519332102244)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(241231220055161515)
,p_report_id=>wwv_flow_api.id(241231105690161514)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(193824591633025393)
,p_view_id=>wwv_flow_api.id(241231220055161515)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(193810565547007948)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>147
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(193825058370025398)
,p_view_id=>wwv_flow_api.id(241231220055161515)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(193810684759007949)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(193825532427025400)
,p_view_id=>wwv_flow_api.id(241231220055161515)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(193810741023007950)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(194950161725667071)
,p_view_id=>wwv_flow_api.id(241231220055161515)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(194944221278666947)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(199378228183541936)
,p_view_id=>wwv_flow_api.id(241231220055161515)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(199372214464541647)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>156
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(199378686718541940)
,p_view_id=>wwv_flow_api.id(241231220055161515)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(199372243206541648)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>159
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(204769581971959812)
,p_view_id=>wwv_flow_api.id(241231220055161515)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(204750406911293252)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>59
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(217370164570018870)
,p_view_id=>wwv_flow_api.id(241231220055161515)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(217364203441018447)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(241231657389161529)
,p_view_id=>wwv_flow_api.id(241231220055161515)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(241214664781102245)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(241233161497161538)
,p_view_id=>wwv_flow_api.id(241231220055161515)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(241214949417102248)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(241233636027161540)
,p_view_id=>wwv_flow_api.id(241231220055161515)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(241215012765102249)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>240
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(241234167195161541)
,p_view_id=>wwv_flow_api.id(241231220055161515)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(241215190151102250)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(241234638582161543)
,p_view_id=>wwv_flow_api.id(241231220055161515)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(241215234448102251)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>159
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(241235631349161554)
,p_view_id=>wwv_flow_api.id(241231220055161515)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(241215441594102253)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(204750201773293250)
,p_plug_name=>'Candidatos Fiscalizados'
,p_parent_plug_id=>wwv_flow_api.id(204750292784293251)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(194832442834026848)
,p_plug_name=>unistr('Fiscalizaci\00F3n')
,p_region_name=>'fiscalizacion'
,p_parent_plug_id=>wwv_flow_api.id(204750201773293250)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>30
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
'        f.dscrpcion_trea,',
'        c.nmro_expdnte,',
'        trunc(c.fcha_aprtra ) as fcha_aprtra',
'        ,trunc(fcha_crcion)   as fcha_gnra',
'        ,ac.id_acto as id_acto',
'        ,max(y.id_ntfccion_dtlle ) as id_ntfccion_dtlle',
'		,nvl((case  when ac.id_acto is null then  ',
'				''No''  ',
'			  else  ',
unistr('				''S\00ED'' '),
'			  end ), ''No'') as generado',
'',
'        ,nvl(( case  when y.id_ntfccion_dtlle is not  null  then ',
unistr('                ''S\00ED''  '),
'                else  ',
'                ''No'' end), ''No'') as notificado       ',
'from v_fi_g_candidatos              a',
'join fi_g_candidatos_funcionario    b   on  a.id_cnddto             =   b.id_cnddto',
'join fi_g_fiscalizacion_expdnte     c   on  a.id_cnddto             =   c.id_cnddto    ',
'join wf_g_instancias_transicion     d   on  c.id_instncia_fljo      =   d.id_instncia_fljo',
'join wf_d_flujos_tarea              e   on  d.id_fljo_trea_orgen    =   e.id_fljo_trea',
'join wf_d_tareas                    f   on  e.id_trea               =   f.id_trea',
'join v_si_i_sujetos_impuesto        g   on  a.id_sjto_impsto        =   g.id_sjto_impsto',
'join fi_g_fsclzcion_expdnte_acto    ac  on  ac.id_fsclzcion_expdnte =   c.id_fsclzcion_expdnte',
'                                        and ac.id_fljo_trea         =   e.id_fljo_trea',
'left join nt_g_notificaciones       w   on ac.id_acto  = w.id_acto ',
'                                            ',
'left join nt_g_notificaciones_detalle y on w.id_ntfccion = y.id_ntfccion and y.id_ntfccion is not null',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and b.id_fncnrio = :F_ID_FNCNRIO',
'and c.cdgo_expdnte_estdo = ''ABT''',
'and d.id_estdo_trnscion in (1,2) ',
'and a.id_impsto = :P66_IMPUESTO',
'and a.id_prgrma = :P66_PRGRMA',
'and a.id_sbprgrma = :P66_SUBPRGRMA',
'and g.idntfccion_sjto   = nvl(:P66_IDNTFCCION_SJTO, g.idntfccion_sjto)',
'and e.id_fljo_trea = nvl(:P66_ETPA, e.id_fljo_trea)',
'group by  a.id_sjto_impsto, g.idntfccion_sjto, a.id_cnddto, a.candidato, c.id_fsclzcion_expdnte, ',
'a.nmbre_impsto, a.nmbre_impsto_sbmpsto, a.id_prgrma, a.nmbre_prgrma, a.id_sbprgrma, ',
'a.nmbre_sbprgrma, c.id_instncia_fljo, d.id_fljo_trea_orgen, f.dscrpcion_trea, c.nmro_expdnte, ',
'trunc(c.fcha_aprtra ), c.fcha_aprtra, c.fcha_aprtra, trunc(fcha_crcion), fcha_crcion, ',
unistr('fcha_crcion, ac.id_acto, nvl((case when ac.id_acto is null then ''No'' else ''S\00ED'' end ), ''No''), (case when ac.id_acto is null then ''No'' else ''S\00ED'' end ), case when ac.id_acto is null then ''No'' else ''S\00ED'' end, '),
unistr('ac.id_acto, ''No'', ''S\00ED'', ''No'', nvl(( case when y.id_ntfccion_dtlle is not null  then ''S\00ED'' else ''No'' end), ''No'') '),
'order by  c.nmro_expdnte  );'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P66_PRGRMA,P66_SUBPRGRMA,P66_ETPA,P66_IDNTFCCION_SJTO,P66_IMPUESTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(13750817342806201)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
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
 p_id=>wwv_flow_api.id(13750937823806202)
,p_name=>'ID_NTFCCION_DTLLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_NTFCCION_DTLLE'
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
 p_id=>wwv_flow_api.id(13960931847951501)
,p_name=>'GENERADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GENERADO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFActo Generado?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
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
 p_id=>wwv_flow_api.id(13961010274951502)
,p_name=>'NOTIFICADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTIFICADO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFActo Notificado?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
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
 p_id=>wwv_flow_api.id(14625134605421701)
,p_name=>'FCHA_GNRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_GNRA'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha del acto '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
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
 p_id=>wwv_flow_api.id(158831816207215548)
,p_name=>'FCHA_APRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_APRTRA'
,p_data_type=>'DATE'
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
 p_id=>wwv_flow_api.id(194832863932026852)
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
'<button onclick="iniciar_flujo(&ID_INSTNCIA_FLJO.,&ID_FLJO_TREA.)" style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton">Ir al Flujo &ID_INSTNCIA_FLJO.<span class="fa fa-external-link-square"></span>',
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
 p_id=>wwv_flow_api.id(199372333213541649)
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
 p_id=>wwv_flow_api.id(199372487735541650)
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
 p_id=>wwv_flow_api.id(199372623753541651)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'SubTributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(199372670811541652)
,p_name=>'NMBRE_PRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_PRGRMA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Programa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(199372743774541653)
,p_name=>'NMBRE_SBPRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_SBPRGRMA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Subprograma'
,p_heading_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(213176638951336654)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(213240326707803647)
,p_name=>'ID_FLJO_TREA_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA_ORGEN'
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
 p_id=>wwv_flow_api.id(213290057937410247)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
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
 p_id=>wwv_flow_api.id(213317306086488747)
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
 p_id=>wwv_flow_api.id(213317386896488748)
,p_name=>'ID_CNDDTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNDDTO'
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
 p_id=>wwv_flow_api.id(213317457607488749)
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
 p_id=>wwv_flow_api.id(216569259038829547)
,p_name=>'DSCRPCION_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_TREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Etapa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
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
 p_id=>wwv_flow_api.id(217790993545950647)
,p_name=>'ID_PRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRGRMA'
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
 p_id=>wwv_flow_api.id(217791050310950648)
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(219708399102113047)
,p_name=>'NMRO_EXPDNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_EXPDNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'No. Expediente'
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
 p_id=>wwv_flow_api.id(194832592497026849)
,p_internal_uid=>194832592497026849
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
'  window.localStorage.removeItem(''jsonFlujos'');',
'   return selectAll(config, {',
'       name: ''Seleccionar Todos'',',
'       action: allFlujos',
'   }) ;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(194843897220063306)
,p_interactive_grid_id=>wwv_flow_api.id(194832592497026849)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(194843956640063306)
,p_report_id=>wwv_flow_api.id(194843897220063306)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13756749777807971)
,p_view_id=>wwv_flow_api.id(194843956640063306)
,p_display_seq=>21
,p_column_id=>wwv_flow_api.id(13750817342806201)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13757290591807992)
,p_view_id=>wwv_flow_api.id(194843956640063306)
,p_display_seq=>22
,p_column_id=>wwv_flow_api.id(13750937823806202)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13967068093952337)
,p_view_id=>wwv_flow_api.id(194843956640063306)
,p_display_seq=>23
,p_column_id=>wwv_flow_api.id(13960931847951501)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13967690323952343)
,p_view_id=>wwv_flow_api.id(194843956640063306)
,p_display_seq=>24
,p_column_id=>wwv_flow_api.id(13961010274951502)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14631262423435984)
,p_view_id=>wwv_flow_api.id(194843956640063306)
,p_display_seq=>25
,p_column_id=>wwv_flow_api.id(14625134605421701)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(158856310390741299)
,p_view_id=>wwv_flow_api.id(194843956640063306)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(158831816207215548)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(194845449819063316)
,p_view_id=>wwv_flow_api.id(194843956640063306)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(194832863932026852)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(199396225057807050)
,p_view_id=>wwv_flow_api.id(194843956640063306)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(199372333213541649)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(199396676241807052)
,p_view_id=>wwv_flow_api.id(194843956640063306)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(199372487735541650)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(199397129772807053)
,p_view_id=>wwv_flow_api.id(194843956640063306)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(199372623753541651)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(199397704080807054)
,p_view_id=>wwv_flow_api.id(194843956640063306)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(199372670811541652)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(199398158778807056)
,p_view_id=>wwv_flow_api.id(194843956640063306)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(199372743774541653)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213246233937804785)
,p_view_id=>wwv_flow_api.id(194843956640063306)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(213240326707803647)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213296349692595380)
,p_view_id=>wwv_flow_api.id(194843956640063306)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(213290057937410247)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213323182545493029)
,p_view_id=>wwv_flow_api.id(194843956640063306)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(213317306086488747)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213323693036493036)
,p_view_id=>wwv_flow_api.id(194843956640063306)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(213317386896488748)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(213324210445493038)
,p_view_id=>wwv_flow_api.id(194843956640063306)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(213317457607488749)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(216575266994829788)
,p_view_id=>wwv_flow_api.id(194843956640063306)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(216569259038829547)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(217797185472952193)
,p_view_id=>wwv_flow_api.id(194843956640063306)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(217790993545950647)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(217797696956952200)
,p_view_id=>wwv_flow_api.id(194843956640063306)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(217791050310950648)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(219714382843113273)
,p_view_id=>wwv_flow_api.id(194843956640063306)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(219708399102113047)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(213167933230511147)
,p_plug_name=>'Total de flujos por etapa'
,p_parent_plug_id=>wwv_flow_api.id(204750201773293250)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(count(c.id_instncia_fljo), 0) as cantidad,',
'       d.id_fljo_trea_orgen,',
'       f.dscrpcion_trea ',
'from fi_g_candidatos                a',
'join fi_g_candidatos_funcionario    b   on  a.id_cnddto             =   b.id_cnddto',
'join fi_g_fiscalizacion_expdnte     c   on  a.id_cnddto             =   c.id_cnddto',
'join wf_g_instancias_transicion     d   on  c.id_instncia_fljo      =   d.id_instncia_fljo',
'join wf_d_flujos_tarea              e   on  d.id_fljo_trea_orgen    =   e.id_fljo_trea',
'join wf_d_tareas                    f   on  e.id_trea               =   f.id_trea',
'join v_si_i_sujetos_impuesto        g   on  a.id_sjto_impsto        =   g.id_sjto_impsto',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and b.id_fncnrio = :F_ID_FNCNRIO',
'and c.cdgo_expdnte_estdo = ''ABT''',
'and d.id_estdo_trnscion in (1,2) ',
'and a.id_prgrma = :P66_PRGRMA',
'and a.id_sbprgrma = :P66_SUBPRGRMA',
'and g.idntfccion_sjto = nvl(:P66_IDNTFCCION_SJTO, g.idntfccion_sjto)',
'and e.id_fljo_trea = nvl(:P66_ETPA, e.id_fljo_trea)',
'group by d.id_fljo_trea_orgen, ',
'         f.dscrpcion_trea;'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'CANTIDAD'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'DSCRPCION_TREA'
);
end;
/
begin
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(213175932218336647)
,p_plug_name=>unistr('Par\00E1metros busquedas ')
,p_parent_plug_id=>wwv_flow_api.id(204750201773293250)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36491913657968646)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(232269135778863150)
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
 p_id=>wwv_flow_api.id(232269366109864324)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>40
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
unistr('<i>Funcionalidad que permite iniciar el proceso de fiscalizaci\00F3n a los candidatos asignados por el lider de fiscalizaci\00F3n adicionalmente permite eliminar el candidato o una vigencia per\00EDodo en especifica que no se va a fiscalizar.</i>'),
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
 p_id=>wwv_flow_api.id(145055032722197570)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(232269135778863150)
,p_button_name=>'BTN_INCIAR_FSCLZCION'
,p_button_static_id=>'iniciarFisca'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Iniciar Fiscalizaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-play'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(145055402478197572)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(232269135778863150)
,p_button_name=>'BTN_FSCLZCION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>unistr('Fiscalizaci\00F3n Puntual')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:RP,32::'
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(145055816505197572)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(232269135778863150)
,p_button_name=>'BTN_RSLTDO_PRCSO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Resultado <br> del cambio de etapa <br>'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:39:&SESSION.::&DEBUG.:RP,39::'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from fi_g_fsclzcn_expdnt_act_trnscn',
'where cdgo_clnte = :F_CDGO_CLNTE;'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(145056235764197585)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(232269135778863150)
,p_button_name=>'BTN_TRNSCION_MSVA'
,p_button_static_id=>'trnscion_msva'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Cambiar de Etapa'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-box-arrow-in-east'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(145056605109197585)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(232269135778863150)
,p_button_name=>'BTN_CSLES'
,p_button_static_id=>'BTN_CSLES'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Causales'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.:RP:P21_ID_ACTO_TPO:&P66_ID_ACTO_TPO.'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-file-text-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(145057063177197588)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(232269135778863150)
,p_button_name=>'BTN_ACTO_TIPO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555595557968673)
,p_button_image_alt=>'Tipo de Acto'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:43:&SESSION.::&DEBUG.:RP::'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13740947143688907)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(232269135778863150)
,p_button_name=>'BTN_NOTIFICAR_ACTOS'
,p_button_static_id=>'btn_ntfcar_actos'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Enviar a Notificar Actos'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(145050753219197544)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(213175932218336647)
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
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(145068245793197629)
,p_branch_name=>'Ir a la pagina 66'
,p_branch_action=>'f?p=&APP_ID.:66:&SESSION.::&DEBUG.:RP,66::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'BORRAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(145041400316197515)
,p_name=>'P66_JSON'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(241214504597102243)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(145041789298197519)
,p_name=>'P66_ID_CNDDTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(241214504597102243)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(145051199977197551)
,p_name=>'P66_IMPUESTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(213175932218336647)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTOS_X_MENU_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_impsto || '' ['' || a.cdgo_impsto || '']''display,',
'       a.id_impsto value',
'  from v_sg_g_menu_impuesto     a',
'  join sg_g_usuarios_impuesto   b on a.id_impsto = b.id_impsto',
' where a.cdgo_clnte       = :F_CDGO_CLNTE',
'   and a.id_aplccion_grpo = :F_ID_APLCCION_GRPO',
'   and a.id_mnu           = :F_ID_MNU',
'   and b.id_usrio         = :F_ID_USRIO',
'   and a.actvo            = ''S''',
'   and b.actvo            = ''S''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(145051586313197552)
,p_name=>'P66_PRGRMA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(213175932218336647)
,p_prompt=>'Programa'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_prgrma as d,',
'        a.id_prgrma as r ',
'from fi_d_programas a where  a.cdgo_prgrma = ''OD'';'))
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
 p_id=>wwv_flow_api.id(145051998129197565)
,p_name=>'P66_SUBPRGRMA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(213175932218336647)
,p_prompt=>'SubPrograma'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_sbprgrma as d,',
'        a.id_sbprgrma as r ',
'from fi_d_subprogramas a',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.id_prgrma = :P66_PRGRMA',
'and actvo = ''S'';',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P66_PRGRMA'
,p_ajax_items_to_submit=>'P66_SUBPRGRMA'
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
 p_id=>wwv_flow_api.id(145052398673197565)
,p_name=>'P66_FLJO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(213175932218336647)
,p_prompt=>'Flujo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion_fljo as d,',
'       a.id_fljo as r',
'from wf_d_flujos a',
'where a.id_fljo = (select  b.id_fljo ',
'                   from fi_d_programas b',
'                   where b.id_prgrma = :P66_PRGRMA);'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P66_PRGRMA'
,p_ajax_items_to_submit=>'P66_FLJO'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(145052733450197566)
,p_name=>'P66_ETPA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(213175932218336647)
,p_prompt=>'Etapa'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_trea,',
'       a.id_fljo_trea',
'from wf_d_flujos_tarea  a',
'join wf_d_tareas        b   on  a.id_trea   =   b.id_trea',
'where a.id_fljo = :P66_FLJO',
'order by b.nmbre_trea;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P66_FLJO'
,p_ajax_items_to_submit=>'P66_ETPA'
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
 p_id=>wwv_flow_api.id(145053101254197566)
,p_name=>'P66_IDNTFCCION_SJTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(213175932218336647)
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
 p_id=>wwv_flow_api.id(145053545743197566)
,p_name=>'P66_CSAL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(213175932218336647)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(145053940250197567)
,p_name=>'P66_CDGO_FLJO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(213175932218336647)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(145054343231197567)
,p_name=>'P66_ID_TPO_ACTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(213175932218336647)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(145057812394197595)
,p_validation_name=>'Requerido'
,p_validation_sequence=>10
,p_validation=>'P66_IMPUESTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione el Impuesto'
,p_when_button_pressed=>wwv_flow_api.id(68147939801139306)
,p_associated_item=>wwv_flow_api.id(145051199977197551)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(145058283302197599)
,p_validation_name=>'Requerido programa'
,p_validation_sequence=>20
,p_validation=>'P66_PRGRMA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione el Programa'
,p_when_button_pressed=>wwv_flow_api.id(68147939801139306)
,p_associated_item=>wwv_flow_api.id(145051586313197552)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(145058687669197600)
,p_validation_name=>'Requerido subprograma'
,p_validation_sequence=>30
,p_validation=>'P66_SUBPRGRMA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione el Subprograma'
,p_when_button_pressed=>wwv_flow_api.id(68147939801139306)
,p_associated_item=>wwv_flow_api.id(145051998129197565)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(145059009596197604)
,p_validation_name=>'Requerido flujo'
,p_validation_sequence=>40
,p_validation=>'P66_FLJO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione el Flujo'
,p_when_button_pressed=>wwv_flow_api.id(68147939801139306)
,p_associated_item=>wwv_flow_api.id(145052398673197565)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(145061307634197607)
,p_name=>'Al seleccionar un candidato'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(241214504597102243)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(145061838831197608)
,p_event_id=>wwv_flow_api.id(145061307634197607)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P66_JSON'
,p_attribute_01=>'buildJsonCandidatos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(145062264926197609)
,p_event_id=>wwv_flow_api.id(145061307634197607)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P66_JSON'
,p_attribute_03=>'P66_JSON'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(145062729161197609)
,p_event_id=>wwv_flow_api.id(145061307634197607)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(241214360591102242)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(145063174931197613)
,p_name=>'Al seleccionar una vigencia'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(241214360591102242)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(145063632094197613)
,p_event_id=>wwv_flow_api.id(145063174931197613)
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
 p_id=>wwv_flow_api.id(145064089925197614)
,p_name=>'Abrir Expediente'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(145055032722197570)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(145064566508197627)
,p_event_id=>wwv_flow_api.id(145064089925197614)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function abrirExpediente() {',
'    try {',
'        var popup = apex.widget.waitPopup();',
'        var json = window.localStorage.jsonVigencia;',
'        await apex.server.process("ajaxAbrirExpediente", {',
'            f01: json,',
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
unistr('apex.message.confirm("\00BFEst\00E1 seguro de iniciar el proceso de Fiscalizaci\00F3n?", function(okPressed) {'),
'   if(okPressed) {',
'       abrirExpediente();',
'   } ',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(145064901649197627)
,p_name=>'Al Seleccionar'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(194832442834026848)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(145065429923197627)
,p_event_id=>wwv_flow_api.id(145064901649197627)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'buildJsonFlujos();',
'ocultarBotonTransicionMasiva();',
'ocultarBotonEnviarNotificar();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(145065832263197627)
,p_name=>'Cambiar de Etapa'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(145056235764197585)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(145066333147197628)
,p_event_id=>wwv_flow_api.id(145065832263197627)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function cambiarEtapa() {',
'    try{',
'        var popup = apex.widget.waitPopup();',
'        if ($("#P66_CDGO_FLJO").val() == ''FOD'' ){',
'            $("#P66_ID_TPO_ACTO").val(window.localStorage.id_tpo_acto);',
'        }    ',
'        ',
'        await apex.server.process("ActoTransicionMasiva", {',
'            f01: window.localStorage.jsonFlujos,',
'            pageItems: "#P66_PRGRMA, #P66_ID_TPO_ACTO"',
'        },{',
'            success: function(data) {',
'              //  popup.remove();',
'                if(data.o_cdgo_rspsta > 0){',
'                    popup.remove();',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors([',
'                        {',
'                                type:       "error",',
'                                location:   "page",',
'                                message:    data.o_mnsje_rspsta,',
'                                unsafe:     false',
'                        }',
'                    ]);',
'                }else{',
'                   // popup.remove();',
unistr('                    apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                  //  location.reload();',
'                    apex.submit();',
'                    ',
'                }',
'            }',
'            ',
'        })',
'        ',
'    }catch(e){',
'        popup.remove();',
'        console.log(e);',
'    }',
'    ',
'}',
'',
unistr('apex.message.confirm("\00BFEst\00E1 seguro de cambiar de etapa los flujos seleccionados?", function(okPressed) {'),
'   if(okPressed) {',
'       cambiarEtapa();',
'   } ',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(145066779036197628)
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
 p_id=>wwv_flow_api.id(145067295450197628)
,p_event_id=>wwv_flow_api.id(145066779036197628)
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
 p_id=>wwv_flow_api.id(145067771729197629)
,p_event_id=>wwv_flow_api.id(145066779036197628)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(232269135778863150)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13741110494690840)
,p_name=>unistr('clic en el bot\00F3n notificar actos')
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(13740947143688907)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13741528835690849)
,p_event_id=>wwv_flow_api.id(13741110494690840)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'notificarActos();',
'ocultarBotonEnviarNotificar();',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(145060114346197606)
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
'                                          p_id_cnddto      => :P66_ID_CNDDTO,',
'                                          o_cdgo_rspsta    => o_cdgo_rspsta,',
'                                          o_mnsje_rspsta   => o_mnsje_rspsta);',
'                                          ',
'    :P66_ID_CNDDTO := null;',
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
,p_process_when=>'P66_ID_CNDDTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(145060966701197606)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Tipo de Acto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'   select cdgo_fljo',
'   into :P66_CDGO_FLJO',
'   from wf_d_flujos',
'   where id_fljo = :P66_FLJO;',
'    ',
'exception',
'    when others then',
'        :P66_CDGO_FLJO :=null;    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(145059308066197604)
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
'    pkg_fi_fiscalizacion.prc_rg_expediente_acto_masivo(p_cdgo_clnte	         => :F_CDGO_CLNTE,',
'                                                       p_id_usrio            => :F_ID_USRIO,',
'                                                       p_id_fncnrio          => :F_ID_FNCNRIO,',
'                                                       p_candidato_vigencia	 => v_cnddtoVgncia,',
'                                                       o_cdgo_rspsta         => v_cdgo_rspsta,',
'                                                       o_mnsje_rspsta        => v_mnsje_rspsta);',
'    if v_cdgo_rspsta > 0 then',
'        raise v_exception;',
'    end if;',
'    ',
'                                              ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
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
 p_id=>wwv_flow_api.id(145059719612197605)
,p_process_sequence=>20
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
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(145060534779197606)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ActoTransicionMasiva'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(1000);',
'    v_fljos           clob;',
'    v_exception       exception;',
'',
'begin',
'    ',
'    for i in 1..apex_application.g_f01.count loop',
'        v_fljos := v_fljos || apex_application.g_f01(i);',
'    end loop;',
'    ',
'    ',
'    --Se borran los registros de la tabla temporal',
'    begin',
'      delete from fi_g_fsclzcn_expdnt_act_trnscn;',
'    end;',
'    ',
'    ',
'    pkg_fi_fiscalizacion.prc_rg_acto_transicion_masiva(p_cdgo_clnte     => :F_CDGO_CLNTE,',
'                                                       p_id_usrio       => :F_ID_USRIO,',
'                                                       p_id_fncnrio   	=> :F_ID_FNCNRIO,',
'                                                       p_id_prgrma      => :P66_PRGRMA,',
'                                                       p_json           => v_fljos,',
'                                                       p_id_acto_tpo    => :P66_ID_TPO_ACTO,',
'                                                       o_cdgo_rspsta	=> v_cdgo_rspsta,',
'                                                       o_mnsje_rspsta	=> v_mnsje_rspsta);',
'    if v_cdgo_rspsta > 0 then',
'        raise v_exception;',
'    end if;',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'',
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
 p_id=>wwv_flow_api.id(13742255484695021)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'NotificarActos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_mnsje_tpo    varchar2(20);',
'    v_mnsje        varchar(32000);',
'    v_json         clob;',
'begin',
'    --owa_util.mime_header(''application/json'', false);',
'    for i in 1..apex_application.g_f01.count ',
'    loop',
'        v_json := v_json ||  apex_application.g_f01(i);',
'    end loop;',
'    ',
'    pkg_nt_notificacion.prc_rg_notificaciones_actos(',
'        p_cdgo_clnte            => :F_CDGO_CLNTE,',
'        p_json_actos            => v_json,',
'        p_id_usrio              => :F_ID_USRIO,',
'        p_id_fncnrio            => :F_ID_FNCNRIO,',
'        o_mnsje_tpo             => v_mnsje_tpo,',
'        o_mnsje                 => v_mnsje',
'    );',
'        ',
'    apex_json.open_object;',
'    if(v_mnsje_tpo = ''ERROR'') then',
'        rollback;',
'        apex_json.write(''mensaje'', v_mnsje);',
'        apex_json.write(''tipo'', v_mnsje_tpo);',
'        --htp.p(apex_escape.html(''{"mensaje":"''||v_mnsje||''", "tipo":"''||v_mnsje_tpo||''"}''));',
'    else',
'        commit;',
'        apex_json.write(''mensaje'', ''Acto(s) enviado(s) a notificar exitosamente'');',
'        apex_json.write(''tipo'', 0);',
'        --htp.p(''{"mensaje":"Actos enviados a notificar", "tipo":"0"}'');',
'    end if;',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13742536218696081)
,p_process_sequence=>60
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CrearActosLote'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_mnsje_tpo    varchar2(20);',
'    v_mnsje        varchar(32000);',
'    v_id_entdad_clnte_mdio number;',
'    v_id_lote      number;',
'    v_json         clob;',
'    v_cdgo_mdio    varchar2(10);',
'    v_nt_espcial   number := 1;',
'',
'begin',
'    begin',
'        for c_actos in (',
'                          select a.id_acto_tpo as id_acto_tpo,',
'                                 a.id_fljo_trea as id_fljo_trea',
'                            from fi_g_fsclzcion_expdnte_acto a',
'                            join fi_g_fiscalizacion_expdnte  b on a.id_fsclzcion_expdnte = b.id_fsclzcion_expdnte',
'                           where a.id_fljo_trea = nvl(:P66_ETPA, a.id_fljo_trea)',
'                        group by id_acto_tpo, id_fljo_trea',
'                    )loop',
'',
'                select a.id_entdad_clnte_mdio',
'                    into v_id_entdad_clnte_mdio',
'                    from nt_d_entidad_cliente_medio  a',
'                    join nt_d_acto_medio_orden b on b.id_mdio = a.id_mdio',
'                   where b.id_acto_tpo = c_actos.id_acto_tpo',
'                     and rownum = 1',
'                order by b.orden;         ',
'',
'                insert into nt_g_lote (cdgo_clnte, id_entdad_clnte_mdio,    dscrpcion,                            fcha_gnrcion,  id_fncnrio_gnrcion, id_acto_tpo)',
unistr('                            values (:F_CDGO_CLNTE, v_id_entdad_clnte_mdio, ''Lote de Notificaci\00F3n - Fiscalizaci\00F3n'', systimestamp, :F_ID_FNCNRIO,      c_actos.id_acto_tpo)'),
'                         return id_lte into v_id_lote;',
'                ',
'        end loop;',
'    exception when others then',
'                apex_json.open_object;',
'                apex_json.write(''mensaje'', ''error en el loop'');',
'                apex_json.write(''tipo'', 10);',
'                apex_json.close_object;',
'    end;',
'    ',
'    for i in 1..apex_application.g_f01.count  loop',
'        v_json := v_json ||  apex_application.g_f01(i);',
'    end loop;',
'    ',
'    select json_arrayagg(json_object(key ''ID_NTFCCION_DTLLE'' value c.id_ntfccion_dtlle))',
'      into v_json ',
'      from gn_g_actos a',
'      join nt_g_notificaciones b on b.id_acto = a.id_acto',
'      join nt_g_notificaciones_detalle c on c.id_ntfccion = b.id_ntfccion',
'      join (Select ID_ACTO From json_table(v_json,''$[*]''columns ID_ACTO PATH ''$.ID_ACTO'')) d on a.id_acto = d.id_acto',
'     where not exists (select z.fcha_gnrcion ',
'                       from nt_g_notificaciones_detalle z',
'                      where c.id_ntfccion = z.id_ntfccion ',
'                        and c.fcha_gnrcion < z.fcha_gnrcion',
'                       );',
'                       ',
'    begin ',
'        pkg_nt_notificacion.prc_rg_detalle_lotes(',
'                p_id_lote                  => v_id_lote,',
'                p_id_ntfccion_dtlle_json   => v_json,',
'                o_mnsje_tpo                => v_mnsje_tpo,',
'                o_mnsje                    => v_mnsje       ',
'        );',
'     exception when others then',
'            apex_json.open_object;',
'            apex_json.write(''mensaje'', ''error en => pkg_nt_notificacion.prc_rg_detalle_lotes'');',
'            apex_json.write(''tipo'', 10);',
'            apex_json.close_object;',
'            commit;',
'    end;',
'',
'    --Consultamos el Medio Asociado al Lote',
'    begin    ',
'        select b.cdgo_mdio',
'        into v_cdgo_mdio',
'        from nt_g_lote a',
'        inner join v_nt_d_ntfccion_mdio_entdd b on a.id_entdad_clnte_mdio = b.id_entdad_clnte_mdio',
'        where a.id_lte = v_id_lote;',
'        ',
'        if v_cdgo_mdio = ''GCT'' then',
'            v_nt_espcial := 1;',
'        elsif v_cdgo_mdio = ''EDT'' then',
'            v_nt_espcial := 1;',
'        elsif v_cdgo_mdio = ''PSA'' then',
'            v_nt_espcial := 1;',
'        else ',
'            v_nt_espcial := 0;',
'            pkg_nt_notificacion.prc_ac_lote(',
'                p_id_lote       => v_id_lote,',
'                p_id_fncnrio    => :F_ID_FNCNRIO,',
'                o_mnsje_tpo     => v_mnsje_tpo,',
'                o_mnsje         => v_mnsje',
'            );',
'        end if;',
'        ',
'        exception when others then',
'            apex_json.open_object;',
'            apex_json.write(''mensaje'', ''error en Consultamos el Medio Asociado al Lote'');',
'            apex_json.write(''tipo'', 10);',
'            apex_json.close_object;',
'            commit;',
'    end;  ',
'    ',
'    apex_json.open_object;',
'    if(v_mnsje_tpo = ''ERROR'') then',
'        rollback;',
'        apex_json.write(''mensaje'', v_mnsje);',
'        apex_json.write(''tipo'', v_mnsje_tpo);',
'        --htp.p(apex_escape.html(''{"mensaje":"''||v_mnsje||''", "tipo":"''||v_mnsje_tpo||''"}''));',
'    else',
'        commit;',
unistr('        apex_json.write(''mensaje'', ''Lote de notificaci\00F3n creado exitosamente'');'),
'        apex_json.write(''tipo'', 0);',
'        apex_json.write(''nt_espcial'', v_nt_espcial);',
'        apex_json.write(''medio'', v_cdgo_mdio);',
'        apex_json.write(''url'', ''f?p=65000:13:&APP_SESSION.::NO::F_ID_MNU,P13_ID_LTE:513,'' || v_id_lote);',
'        --htp.p(''{"mensaje":"Actos enviados a notificar", "tipo":"0"}'');',
'    end if;',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14271949738929901)
,p_process_sequence=>70
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set_p66_json'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'v_json  clob ;',
'',
'',
'begin',
'for i in 1..apex_application.g_f01.count loop',
'        v_json := v_json || apex_application.g_f01(i);',
' end loop;	',
'    ',
'apex_util.Set_session_state(''P66_JSON'', v_json);',
'apex_json.Open_Object();',
'apex_json.write(''P66_JSON'', v_json);',
'apex_json.close_Object();',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
