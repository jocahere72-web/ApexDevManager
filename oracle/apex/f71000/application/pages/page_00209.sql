prompt --application/pages/page_00209
begin
wwv_flow_api.create_page(
 p_id=>209
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Compensaci\00F3n Saldo a Favor')
,p_step_title=>unistr('Compensaci\00F3n Saldo a Favor')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
''))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// proporcional',
'var valor_X_Compensar = []; ',
'',
'function obtenerSaldoFavor() {',
'    ',
'    //console.log(''INICIA obtenerSaldoFavor'');',
'    var region = apex.region("saf");',
'    if ( apex.item("P209_INDCDOR_DSTRBCION").getValue() === "A" ) {',
'		var regionCartera = apex.region("cartera1");',
'	}',
'	',
'    if (region) {',
'        var view = apex.region("saf").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'',
'        //Obtenemos un json con los datos seleccionados que no han sido procesados',
'        var json = records.map((record) => {',
'            return {',
'                "id_sldo_fvor": model.getValue(record, "ID_SLDO_FVOR"),',
'                "vlor_sldo_fvor": model.getValue(record, "SALDO_FAVOR_OCULTO")',
'            };',
'        });',
'',
'        var saf = json[0].vlor_sldo_fvor;',
'        //console.log(''valor SAF: ''+saf);',
'',
'        $s(''P209_SALDO_FAVOR'', json.length > 0 ? json[0].vlor_sldo_fvor : ''''); ',
'        console.log(''valor P209_SALDO_FAVOR: ''+apex.item("P209_SALDO_FAVOR").getValue());',
'',
'        //Seteamos el valor del json en forma de cadena al item ',
'        $s(''P209_JSON_SALDO_FAVOR'', json.length > 0 ? JSON.stringify(json) : '''');',
'        ',
'        $s(''P209_ID_SAF'', json.length > 0 ? json[0].id_sldo_fvor : '''');',
'',
'        //Cartera',
'',
'		if ( apex.item("P209_INDCDOR_DSTRBCION").getValue() === "A" ) {',
'			var viewCartera = apex.region("cartera1").widget().interactiveGrid("getViews", "grid");',
'			var modelCartera = viewCartera.model;',
'			',
'			var recordsCartera = modelCartera._data.filter(function (record) {',
'				return modelCartera.getValue(record, "INDCDOR_MVMNTO_BLQDO") === "N"',
'			});',
'',
'		   recordsCartera.map((data) => {',
'				modelCartera.setValue(data, "VLOR_CMPNSCION", 0);',
'				let valorXCompensar = modelCartera.getValue(data, "VLOR_X_CMPNSAR_OCULTO");    ',
'				if (Number(saf) >= Number(valorXCompensar)) {',
'					modelCartera.setValue(data, "VLOR_CMPNSCION", formatoNumero(valorXCompensar,{decimal:'','',thousand:''.'',precision:0}));',
'					saf -= valorXCompensar;',
'				} else if (Number(saf) > 0) {',
'					modelCartera.setValue(data, "VLOR_CMPNSCION", formatoNumero(saf,{decimal:'','',thousand:''.'',precision:0}));',
'					saf = 0;',
'				}',
'			}',
'			);            ',
'            //apex.region(''cartera1'').refresh();',
'		} ',
'    };',
'}',
'',
'',
'function obtenerCartera() {',
'',
'    if ( apex.item("P209_INDCDOR_DSTRBCION").getValue() === "V" ) {',
'		var region = apex.region("cartera");	}',
'	else if ( apex.item("P209_INDCDOR_DSTRBCION").getValue() === "A" ) { ',
'		var region = apex.region("cartera1");	}',
'	else if ( apex.item("P209_INDCDOR_DSTRBCION").getValue() === "P" ) { ',
'		var region = apex.region("cartera2");',
'	}',
'    var ttlXCmpnsar = 0;',
'    var ttlCmpnscion = 0;',
'',
'    if (region) {',
'',
'        //var view = apex.region("cartera").widget().interactiveGrid("getViews", "grid");',
'		if ( apex.item("P209_INDCDOR_DSTRBCION").getValue() === "V" ) {',
'			var view = apex.region("cartera").widget().interactiveGrid("getViews", "grid");		}',
'		else if ( apex.item("P209_INDCDOR_DSTRBCION").getValue() === "A" ) { ',
'			var view = apex.region("cartera1").widget().interactiveGrid("getViews", "grid");	}',
'		else if ( apex.item("P209_INDCDOR_DSTRBCION").getValue() === "P" ) { ',
'			var view = apex.region("cartera2").widget().interactiveGrid("getViews", "grid");',
'		}',
'		',
'        var model = view.model;',
'',
'        var records = model._data.filter(function (record) {',
'            //console.log(model.getValue(record, "VLOR_CMPNSCION").trim().replace(/\./g, ""));',
'			if ( apex.item("P209_INDCDOR_DSTRBCION").getValue() === "P" ) {',
'				return model.getValue(record, "VLOR_CMPNSCION_OCULTO").trim().replace(/\./g, "") > 0',
'			}',
'			else if ( apex.item("P209_INDCDOR_DSTRBCION").getValue() === "V" ||',
'			          apex.item("P209_INDCDOR_DSTRBCION").getValue() === "A"',
'					){	',
'				return model.getValue(record, "VLOR_CMPNSCION").trim().replace(/\./g, "") > 0',
'			}',
'        });',
'        ',
'        records.forEach(function (element) {',
'            //console.log("VALOR " + Number(model.getValue(element, "VLOR_CMPNSCION_OCULTO").trim().replace(/\./g, "")));',
'			',
'			if ( apex.item("P209_INDCDOR_DSTRBCION").getValue() === "P" ) {',
'				ttlCmpnscion += Number(model.getValue(element, "VLOR_CMPNSCION_OCULTO").trim().replace(/\./g, ""));',
'				ttlXCmpnsar += Number(model.getValue(element, "VLOR_X_CMPNSAR_OCULTO"));',
'			}',
'			else if ( apex.item("P209_INDCDOR_DSTRBCION").getValue() === "V" ||',
'			          apex.item("P209_INDCDOR_DSTRBCION").getValue() === "A"',
'					){	',
'				ttlCmpnscion += Number(model.getValue(element, "VLOR_CMPNSCION").trim().replace(/\./g, ""));',
'				ttlXCmpnsar += Number(model.getValue(element, "VLOR_X_CMPNSAR_OCULTO"));',
'			}',
'        });',
'                ',
'        //Obtenemos un json con los datos seleccionados que no han sido procesados',
'        var json = records.map((record) => {',
'			if ( apex.item("P209_INDCDOR_DSTRBCION").getValue() === "P" ) {',
'				return {',
'					"id_impsto": model.getValue(record, "ID_IMPSTO"),',
'					"id_impsto_sbmpsto": model.getValue(record, "ID_IMPSTO_SBMPSTO"),',
'					"id_sjto_impsto": model.getValue(record, "ID_SJTO_IMPSTO"),',
'					"vgncia": model.getValue(record, "VGNCIA"),',
'					"id_prdo": model.getValue(record, "ID_PRDO"),',
'					"id_cncpto": model.getValue(record, "ID_CNCPTO"),',
'					"valor_compensado": model.getValue(record, "VLOR_CMPNSCION_OCULTO").trim().replace(/\./g, ""),',
'					"vlor_sldo_cptal": model.getValue(record, "SALDO_CAPITAL_OCULTO"),',
'					"vlor_intres": model.getValue(record, "SALDO_INTERES_OCULTO"),',
'					"total_deuda": model.getValue(record, "TOTAL_OCULTO"),',
'					"vlor_x_cmpnsar": model.getValue(record, "VLOR_X_CMPNSAR_OCULTO"),',
'					"id_mvmnto_fncro": model.getValue(record, "ID_MVMNTO_FNCRO")            ',
'				};',
'			}',
'			else if ( apex.item("P209_INDCDOR_DSTRBCION").getValue() === "V" ||',
'			          apex.item("P209_INDCDOR_DSTRBCION").getValue() === "A"',
'					){	',
'				return {',
'					"id_impsto": model.getValue(record, "ID_IMPSTO"),',
'					"id_impsto_sbmpsto": model.getValue(record, "ID_IMPSTO_SBMPSTO"),',
'					"id_sjto_impsto": model.getValue(record, "ID_SJTO_IMPSTO"),',
'					"vgncia": model.getValue(record, "VGNCIA"),',
'					"id_prdo": model.getValue(record, "ID_PRDO"),',
'					"id_cncpto": model.getValue(record, "ID_CNCPTO"),',
'					"valor_compensado": model.getValue(record, "VLOR_CMPNSCION").trim().replace(/\./g, ""),',
'					"vlor_sldo_cptal": model.getValue(record, "SALDO_CAPITAL_OCULTO"),',
'					"vlor_intres": model.getValue(record, "SALDO_INTERES_OCULTO"),',
'					"total_deuda": model.getValue(record, "TOTAL_OCULTO"),',
'					"vlor_x_cmpnsar": model.getValue(record, "VLOR_X_CMPNSAR_OCULTO"),',
'					"id_mvmnto_fncro": model.getValue(record, "ID_MVMNTO_FNCRO")       ',
'			    }',
'			};',
'        });',
'		window.localStorage.setItem(''jsoncartera'', JSON.stringify(json));',
'',
'        //Seteamos el valor de la compensacion en el item',
'        //$s(''P209_COMPENSACION'', json.length > 0 ? json[0].valor_compensado : ''''); ',
'',
'        $s(''P209_COMPENSACION'', ttlCmpnscion);',
'',
'        //Seteamos el total de la deuda en el item',
'        $s(''P209_TOTAL_DEUDA'', json.length > 0 ? json[0].total_deuda : '''');',
'',
'        $s(''P209_VALOR_X_CMPNSAR'', ttlXCmpnsar);',
'',
'        window.localStorage.setItem(''jsonCartera'', JSON.stringify(json));',
'',
'        //apex.region("cartera").widget().interactiveGrid("setSelectedRecords", records);',
'		if ( apex.item("P209_INDCDOR_DSTRBCION").getValue() === "V" ) {',
'			apex.region("cartera").widget().interactiveGrid("setSelectedRecords", records);		}',
'		else if ( apex.item("P209_INDCDOR_DSTRBCION").getValue() === "A" ) { ',
'			apex.region("cartera1").widget().interactiveGrid("setSelectedRecords", records);		}',
'		else if ( apex.item("P209_INDCDOR_DSTRBCION").getValue() === "P" ) { ',
'			apex.region("cartera2").widget().interactiveGrid("setSelectedRecords", records);',
'		}',
'		',
'        return json;',
'	}',
'}',
'',
'',
'function validaCompensacion() {',
'    ',
'    var ttl_cmpnsar = 0;',
'    var table;',
'    var valorXCompensar = 0;',
'    var val_saf_final = 0;',
'       ',
'    console.log(''Se ejecuto la funcion validaCompensacion'');',
'    ',
'    if ( apex.item("P209_INDCDOR_DSTRBCION").getValue() === "V" ) {',
'		',
'		///var regionSAF = apex.region("saf"); // NLCZ',
'		',
'        ///if (regionSAF) {// NLCZ	',
'        ///console.log(''Se ejecuto regionSAF'');',
'		var view = apex.region("saf").widget().interactiveGrid("getViews", "grid");		',
'		var model = view.model;',
'		var records = view.view$.grid("getSelectedRecords");',
'',
'		//Obtenemos un json con los datos seleccionados que no han sido procesados',
'		var json = records.map((record) => {',
'			return {',
'				"id_sldo_fvor": model.getValue(record, "ID_SLDO_FVOR"),',
'				"vlor_sldo_fvor": model.getValue(record, "SALDO_FAVOR_OCULTO")',
'			};',
'		});',
'',
'		if ( json.length > 0 ) {',
'            console.log(''JSON CON DATOS'');',
'            var saf = json[0].vlor_sldo_fvor;  ',
'    ',
'			var viewCartera = apex.region("cartera").widget().interactiveGrid("getViews", "grid");',
'			var modelCartera = viewCartera.model;',
'			var recordsCartera = modelCartera._data.filter(function (record) {',
'				return modelCartera.getValue(record, "INDCDOR_MVMNTO_BLQDO") === "N"',
'			});',
'		',
'			modelCartera.forEach(function(dato) {',
'				ttl_cmpnsar = ttl_cmpnsar + parseInt(modelCartera.getValue(dato,"VLOR_CMPNSCION").replace(/\./g, ''''));//jga',
'			});    ',
'			console.log(''total compensar inicial: ''+ttl_cmpnsar);',
'		',
'			table = apex.region("cartera").widget().interactiveGrid("getViews").grid.getSelectedRecords();',
'	   ',
'			table.map((data) => {',
'			',
'				console.log(data)',
'				valorXCompensar = modelCartera.getValue(data, "VLOR_X_CMPNSAR_OCULTO"); //jga',
'				',
'				console.log(''valorXCompensar: ''+valorXCompensar);',
'				//console.log(''saldo a favor despues de restar: ''+ saf);',
'				',
'				val_saf_final = saf - ttl_cmpnsar;',
'				console.log(''saldo a favor despues de restar: ''+ val_saf_final); ',
'				',
'				if (Number(saf) >= Number(ttl_cmpnsar) && Number(val_saf_final) >= Number(valorXCompensar)) {',
'					console.log(''if 1: ''+valorXCompensar);',
unistr('					console.log("entre aqu\00ED 1")'),
'					modelCartera.setValue(data, "VLOR_CMPNSCION", formatoNumero(valorXCompensar,{decimal:'','',thousand:''.'',precision:0}));',
'					//saf -= ttl_cmpnsar;',
'				}else if (valorXCompensar == ttl_cmpnsar && Number(saf) >= Number(ttl_cmpnsar)) {',
'					console.log(''if 2: ''+valorXCompensar);',
unistr('					 console.log("entre aqu\00ED 2")'),
'					modelCartera.setValue(data, "VLOR_CMPNSCION", formatoNumero(valorXCompensar,{decimal:'','',thousand:''.'',precision:0}));',
'				}else if (Number(val_saf_final) > 0 && Number(val_saf_final) <= Number(valorXCompensar)) {',
'					console.log(''if 3 - val_saf_final: ''+val_saf_final);',
'					modelCartera.setValue(data, "VLOR_CMPNSCION", formatoNumero(val_saf_final,{decimal:'','',thousand:''.'',precision:0}));',
unistr('					 console.log("entre aqu\00ED 3")'),
'				}else if (Number(val_saf_final) > 0 && Number(val_saf_final) <= Number(valorXCompensar)) {//jga',
'					console.log(''if 3 - val_saf_final: ''+val_saf_final);',
'					modelCartera.setValue(data, "VLOR_CMPNSCION", formatoNumero(valor_total_nuevo,{decimal:'','',thousand:''.'',precision:0}));',
unistr('				 console.log("entre aqu\00ED 4")'),
'				}',
'			});	',
'        }',
'		',
'	}',
'	',
'        ',
'    //var view = apex.region("cartera").widget().interactiveGrid("getViews", "grid");		',
'    if ( apex.item("P209_INDCDOR_DSTRBCION").getValue() === "V" ) {',
'        var regionCartera = apex.region("cartera");',
'        var view = apex.region("cartera").widget().interactiveGrid("getViews", "grid"); }',
'    else if ( apex.item("P209_INDCDOR_DSTRBCION").getValue() === "A" ) { ',
'        var regionCartera = apex.region("cartera1");',
'        var view = apex.region("cartera1").widget().interactiveGrid("getViews", "grid"); }',
'    else if ( apex.item("P209_INDCDOR_DSTRBCION").getValue() === "P" ) { ',
'        var regionCartera = apex.region("cartera2");',
'        var view = apex.region("cartera2").widget().interactiveGrid("getViews", "grid"); ',
'    }	',
'    ',
'    if (regionCartera) {',
'		',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        var jsonCartera = records.map(function(e){',
'            return {',
'                "vlor_x_cmpnsar": model.getValue(e, "VLOR_X_CMPNSAR"),',
'                "valor_compensacion" : model.getValue(e, "VLOR_CMPNSCION")',
'            }',
'        });',
'        console.log(''jsonCartera'' + JSON.stringify(jsonCartera) );',
'        return jsonCartera;',
'        ',
'    };',
'}',
'',
'',
'function saldo_favor() {',
'    ',
'    var view = apex.region("saf").widget().interactiveGrid("getViews", "grid");',
'    var model = view.model;',
'    var records = view.view$.grid("getSelectedRecords");',
'',
'    //Obtenemos un json con los datos seleccionados que no han sido procesados',
'    var json = records.map((record) => {',
'        return {',
'            "id_sldo_fvor": model.getValue(record, "ID_SLDO_FVOR"),',
'            "vlor_sldo_fvor": model.getValue(record, "SALDO_FAVOR_OCULTO")',
'        };',
'    });',
'',
'    var saf = json[0].vlor_sldo_fvor;',
'    ',
'    return saf;',
'}',
'',
'',
'function validaCompensacion_2(p_this) {',
'    ',
'    console.log( ''validaCompensacion_2 item_vlor: ''+ p_this );//jga',
'    ',
'   /* var item_vlor = p_this.triggeringElement.value;',
'    console.log( ''item_vlor: ''+ item_vlor );*/',
'    ',
'    var ttl_cmpnsar = 0;    ',
'    var viewCartera = apex.region("cartera").widget().interactiveGrid("getViews", "grid");',
'    var modelCartera = viewCartera.model;',
'',
'    modelCartera.forEach(function(dato) {',
'       //ttl_cmpnsar = ttl_cmpnsar + parseInt(modelCartera.getFieldKey(dato,"VLOR_CMPNSCION").replace(/\./g, ''''));',
'       console.log( ''valores compensados: ''+ parseInt(modelCartera.getValue(dato,"VLOR_CMPNSCION").replace(/\./g, '''')) );       ',
'       ttl_cmpnsar = ttl_cmpnsar + parseInt(modelCartera.getValue(dato,"VLOR_CMPNSCION").replace(/\./g, ''''));',
'       //console.log(''VLOR_X_CMPNSAR_OCULTO: ''+modelCartera.getValue(dato,"VLOR_X_CMPNSAR_OCULTO"));',
'    });',
'    ',
'    console.log(''validaCompensacion_2 total compensar: ''+ttl_cmpnsar);    ',
'    ',
'    return ttl_cmpnsar;',
'}',
'',
'',
'function ocultarBtnGuardar() {',
'    var view = apex.region("saf").widget().interactiveGrid("getViews", "grid");',
'    var model = view.model;',
'    if (model._data.length === 0) {',
'        $("#Btn_Guardar").hide();',
'    }',
'}',
'',
'function fnc_validar_saldo_disponible(){',
'    ',
'		console.log("inicia fnc_validar_saldo_disponible 1");',
'    ',
'    if ( apex.item("P209_INDCDOR_DSTRBCION").getValue() === "P" ) {',
'		console.log("inicia fnc_validar_saldo_disponible");',
'					   ',
'		try{',
'			',
'			apex.server.process("validaDisponibleSF",{',
'				pageItems: "P209_ID_SAF"',
'			},{',
'				success: function(data){',
'                    ',
'                    ',
'					   console.log(''respuesta: ''+data.o_vlor_sldo_dspnble );',
'                    ',
'					if(data.o_cdgo_rspsta != 0){',
'					   console.log(data.o_cdgo_rspsta);',
'					   apex.message.clearErrors();',
'					   apex.message.showErrors ([',
'						   {',
'							   type:       "error",',
'							   location:   "page",',
'							   message:    data.o_mnsje_rspsta,',
'							   unsafe:     false',
'						   }',
'					   ]);',
'					}else{',
unistr('					   //apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'					   //apex.item("P209_SALDO_FAVOR").setValue(data.o_vlor_sldo_dspnble);',
'                       $s(''P209_SALDO_FAVOR'', data.o_vlor_sldo_dspnble);',
'                        ',
'					   //console.log(''saldo disponible: ''+ apex.item("P209_INDCDOR_DSTRBCION").getValue() );',
'					   //apex.region(''cartera2'').refresh();',
'                        apex.region(''cartera1'').refresh();',
'					}',
'				}',
'			})',
'		}catch(e){',
'			console.log(e);',
'		}',
'	}',
'}',
'',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'ocultarBtnGuardar();',
'//fnc_validar_saldo_disponible();',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*.a-IG-controlsContainer{',
'    display: none;   ',
'}',
'*/'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NCARRASQUILLA'
,p_last_upd_yyyymmddhh24miss=>'20231025115531'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(103986259529655504)
,p_plug_name=>'Parametros'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_api.id(177331524321050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108228206798134601)
,p_plug_name=>'Saldos a Favor'
,p_region_name=>'saf'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_sldo_fvor,',
'       a.id_sjto_impsto,',
'       a.id_impsto,',
'       a.id_impsto_sbmpsto,',
'       a.sldo_fvor_dspnble as saldo_favor,',
'       a.sldo_fvor_dspnble as saldo_favor_oculto,',
'       a.obsrvcion,',
'       a.nmbre_impsto,',
'       a.nmbre_sldo_fvor_tpo',
'from v_gf_g_saldos_favor    a',
'where a.id_sjto_impsto =  :P209_SJTO_IMPSTO   ',
'and a.indcdor_rcncdo = ''S''',
'and a.sldo_fvor_dspnble > 0',
'union',
'select a.id_sldo_fvor,',
'       a.id_sjto_impsto,',
'       a.id_impsto,',
'       a.id_impsto_sbmpsto,',
'       a.sldo_fvor_dspnble as saldo_favor,',
'       a.sldo_fvor_dspnble as saldo_favor_oculto,',
'       a.obsrvcion,',
'       a.nmbre_impsto,',
'       a.nmbre_sldo_fvor_tpo ',
'from v_gf_g_saldos_favor            a  ',
'join gf_g_sldos_fvor_slctud_dtll    b   on  a.id_sldo_fvor          =   b.id_sldo_fvor',
'join gf_g_saldos_favor_solicitud    c   on  b.id_sldo_fvor_slctud   =   c.id_sldo_fvor_slctud',
'where c.id_sldo_fvor_slctud = :P209_ID_SLDO_FVOR_SLCTUD',
'and   b.indcdor_rcncdo = ''S''',
'and   a.sldo_fvor_dspnble > 0;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108228862985134607)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108228918561134608)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108230054819134619)
,p_name=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>2000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108230189104134620)
,p_name=>'ID_SLDO_FVOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLDO_FVOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'# Saldo a Favor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108230294439134621)
,p_name=>'SALDO_FAVOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SALDO_FAVOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Saldo Favor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(108230378569134622)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(108230472433134623)
,p_name=>'NMBRE_SLDO_FVOR_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_SLDO_FVOR_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo de Saldo a Favor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(112630927762158001)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(112631070036158002)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(112631171856158003)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(112757388347754003)
,p_name=>'SALDO_FAVOR_OCULTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SALDO_FAVOR_OCULTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(108228319019134602)
,p_internal_uid=>108228319019134602
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
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
,p_enable_save_public_report=>true
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
 p_id=>wwv_flow_api.id(108234613646138984)
,p_interactive_grid_id=>wwv_flow_api.id(108228319019134602)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(108234766582138985)
,p_report_id=>wwv_flow_api.id(108234613646138984)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108240089869162173)
,p_view_id=>wwv_flow_api.id(108234766582138985)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(108228862985134607)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108251695415378268)
,p_view_id=>wwv_flow_api.id(108234766582138985)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(108230054819134619)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>329
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108254307935380535)
,p_view_id=>wwv_flow_api.id(108234766582138985)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(108230189104134620)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>104
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108254886592380537)
,p_view_id=>wwv_flow_api.id(108234766582138985)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(108230294439134621)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>142
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108255355327380538)
,p_view_id=>wwv_flow_api.id(108234766582138985)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(108230378569134622)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>273
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108255804840380540)
,p_view_id=>wwv_flow_api.id(108234766582138985)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(108230472433134623)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>191
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(112636938608160734)
,p_view_id=>wwv_flow_api.id(108234766582138985)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(112630927762158001)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(112637407905160737)
,p_view_id=>wwv_flow_api.id(108234766582138985)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(112631070036158002)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(112637815824160739)
,p_view_id=>wwv_flow_api.id(108234766582138985)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(112631171856158003)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(112774879167895163)
,p_view_id=>wwv_flow_api.id(108234766582138985)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(112757388347754003)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108229122856134610)
,p_plug_name=>unistr('Detalle de la Compensaci\00F3n')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from (',
'select f.nmbre_impsto,',
'       a.sldo_fvor_dspnble as vlor_sldo_fvor,',
'       sum(b.vlor_cmpnscion),',
'       b.vgncia,',
'       b.id_prdo,',
'       b.id_impsto,',
'       b.id_impsto_sbmpsto,',
'       b.id_sjto_impsto,',
'       b.id_sldo_fvor,',
'       e.prdo,',
'       f.idntfccion_sjto_frmtda,',
'       c.id_sld_fvr_cmpnscion,',
'       b.id_mvmnto_fncro',
'from v_gf_g_saldos_favor          a',
'join gf_g_sldos_fvr_cmpnscn_dtll  b on a.id_sldo_fvor         = b.id_sldo_fvor',
'join gf_g_saldos_favor_cmpnscion  c on b.id_sld_fvr_cmpnscion = c.id_sld_fvr_cmpnscion',
'join df_i_conceptos               d on b.id_cncpto            = d.id_cncpto',
'join df_i_periodos                e on b.id_prdo              = e.id_prdo and ',
'                                       b.vgncia               =  e.vgncia',
'join v_si_i_sujetos_impuesto      f on b.id_sjto_impsto       = f.id_sjto_impsto',
'where c.id_sldo_fvor_slctud = :P209_ID_SLDO_FVOR_SLCTUD ',
'and not a.estdo = ''AN'' ',
'group by f.nmbre_impsto,',
'         a.sldo_fvor_dspnble, ',
'         b.vgncia, b.id_prdo, ',
'         b.id_impsto, ',
'         b.id_impsto_sbmpsto, ',
'         b.id_sjto_impsto, ',
'         b.id_sldo_fvor, ',
'         e.prdo, ',
'         f.idntfccion_sjto_frmtda,',
'         c.id_sld_fvr_cmpnscion,',
'         b.id_mvmnto_fncro',
'order by b.id_sldo_fvor , b.vgncia',
')'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(39345592144121301)
,p_name=>'SUM(B.VLOR_CMPNSCION)'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SUM(B.VLOR_CMPNSCION)'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total Compensado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(39345657962121302)
,p_name=>'BTN_VIEW'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">  ',
'        <span class="fa fa-eye" aria-hidden="true"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=&APP_ID.:264:&SESSION.::&DEBUG.:RP,264:P264_ID_SLD_FVR_CMPNSCION,P264_ID_SLD_FVR,P264_VGNCIA,P264_ID_PRDO,P264_ID_MVMNTO_FNCRO:&ID_SLD_FVR_CMPNSCION.,&ID_SLDO_FVOR.,&VGNCIA.,&ID_PRDO.,&ID_MVMNTO_FNCRO.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(39347386141121319)
,p_name=>'ID_SLD_FVR_CMPNSCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLD_FVR_CMPNSCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Sld Fvr Cmpnscion'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>210
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
 p_id=>wwv_flow_api.id(46272309734379103)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
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
 p_id=>wwv_flow_api.id(63700474296200402)
,p_name=>'ID_MVMNTO_FNCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_MVMNTO_FNCRO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>230
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108229486780134613)
,p_name=>'VLOR_SLDO_FVOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_FVOR'
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
 p_id=>wwv_flow_api.id(108229648591134615)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(108230585884134624)
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
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108429971861151301)
,p_name=>'BTN_ELIMINAR'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">  ',
'        <span class="fa fa-trash-o" aria-hidden="true"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=&APP_ID.:209:&SESSION.:Eliminar:&DEBUG.:RP:P209_ID_IMPSTO,P209_ID_IMPSTO_SBMPSTO,P209_ID_SJTO_IMPSTO_C,P209_VGNCIA,P209_ID_PRDO,P209_ID_SLDOS_FVR:&ID_IMPSTO.,&ID_IMPSTO_SBMPSTO.,&ID_SJTO_IMPSTO.,&VGNCIA.,&ID_PRDO.,&ID_SLDO_FVOR.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(111911985478629502)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(118490884356325204)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attribute_01=>'N'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(118490943708325205)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attribute_01=>'N'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(118491033750325206)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attribute_01=>'N'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(118491112703325207)
,p_name=>'ID_SLDO_FVOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLDO_FVOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'# Saldo a Favor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
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
 p_id=>wwv_flow_api.id(119164364456643701)
,p_name=>'IDNTFCCION_SJTO_FRMTDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO_FRMTDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(108229235844134611)
,p_internal_uid=>108229235844134611
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
,p_enable_save_public_report=>true
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
 p_id=>wwv_flow_api.id(108244058764305568)
,p_interactive_grid_id=>wwv_flow_api.id(108229235844134611)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(108244121670305569)
,p_report_id=>wwv_flow_api.id(108244058764305568)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3022968422818)
,p_view_id=>wwv_flow_api.id(108244121670305569)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(111911985478629502)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>67
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(15426185144031)
,p_view_id=>wwv_flow_api.id(108244121670305569)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(108230585884134624)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(39351525527121542)
,p_view_id=>wwv_flow_api.id(108244121670305569)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(39345592144121301)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>136
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(39364082948195792)
,p_view_id=>wwv_flow_api.id(108244121670305569)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(39345657962121302)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>46
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(39371956016247017)
,p_view_id=>wwv_flow_api.id(108244121670305569)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(39347386141121319)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(46299403276503163)
,p_view_id=>wwv_flow_api.id(108244121670305569)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(46272309734379103)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>198
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(63706724768209231)
,p_view_id=>wwv_flow_api.id(108244121670305569)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(63700474296200402)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108245136028305571)
,p_view_id=>wwv_flow_api.id(108244121670305569)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(108229486780134613)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>189
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108246106013305573)
,p_view_id=>wwv_flow_api.id(108244121670305569)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(108229648591134615)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>74
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108435508614153545)
,p_view_id=>wwv_flow_api.id(108244121670305569)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(108429971861151301)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>50
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(118686738699643427)
,p_view_id=>wwv_flow_api.id(108244121670305569)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(118490884356325204)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(118687228251643431)
,p_view_id=>wwv_flow_api.id(108244121670305569)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(118490943708325205)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(118687785104643433)
,p_view_id=>wwv_flow_api.id(108244121670305569)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(118491033750325206)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(118688297623643435)
,p_view_id=>wwv_flow_api.id(108244121670305569)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(118491112703325207)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(119170336303643932)
,p_view_id=>wwv_flow_api.id(108244121670305569)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(119164364456643701)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>246
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(7003000016)
,p_view_id=>wwv_flow_api.id(108244121670305569)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(39345592144121301)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(198704200808512981)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from WF_G_INSTANCIAS_TRANSICION',
'where ID_INSTNCIA_FLJO = :F_ID_INSTNCIA_FLJO and',
'      ID_FLJO_TREA_ORGEN = :F_ID_FLJO_TREA and',
'      ID_ESTDO_TRNSCION in (1,2);'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(211327173222537703)
,p_plug_name=>'Obligaciones a Compensar'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(111091911528692902)
,p_plug_name=>unistr('Informaci\00F3n de la cartera-Vigencia')
,p_region_name=>'cartera'
,p_parent_plug_id=>wwv_flow_api.id(211327173222537703)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  id_fcha_crt_fch_pry ',
'        , a.id_mvmnto_fncro',
'        , a.id_impsto',
'        , a.id_impsto_sbmpsto',
'        , a.id_sjto_impsto',
'        , a.vgncia',
'        , a.prdo',
'        , a.id_prdo',
'        , a.id_cncpto',
'        , nvl2(b.id_sld_fvr_cmpnscion, ''U'', ''I'') as action',
'        , a.dscrpcion_cncpto',
'        , a.vlor_sldo_cptal',
'        , a.saldo_capital_oculto',
'        , a.vlor_intres',
'        , a.saldo_interes_oculto',
'        , a.cdgo_mvnt_fncro_estdo',
'        , a.dscrpcion_mvnt_fncro_estdo',
'        , a.total',
'        , a.total_oculto',
'        , a.vlor_cmpnscion',
'        , ( a.vlor_sldo_cptal + a.vlor_intres ) - nvl( b.vlor_cmpnscion , 0 ) as vlor_x_cmpnsar',
'        , ( a.vlor_sldo_cptal + a.vlor_intres ) - nvl( b.vlor_cmpnscion , 0 ) as vlor_x_cmpnsar_oculto',
'        , case when a.indcdor_mvmnto_blqdo = ''S'' then ''Bloqueada'' else ''Normal'' end estdo',
'        , a.indcdor_mvmnto_blqdo',
'        , a.cdgo_mvmnto_orgn , a.id_orgen -- req. 0023663',
'from 	gf_g_crtra_fcha_pryccion a',
'left 	join (select b.id_mvmnto_fncro',
'                   ,b.vgncia',
'                   ,b.id_cncpto',
'                   ,b.id_sld_fvr_cmpnscion',
'                   ,sum(b.vlor_cmpnscion) + (select nvl(sum(z.vlor_cmpnscion), 0) ',
'                                             from 	gf_g_sldos_fvr_cmpnscn_dtll z',
'                                             where 	z.id_mvmnto_fncro = b.id_mvmnto_fncro',
'                                             and   	z.vgncia = b.vgncia',
'                                             and   	z.id_cncpto_rlcnal = b.id_cncpto',
'                                             and   	z.id_sld_fvr_cmpnscion = b.id_sld_fvr_cmpnscion) as vlor_cmpnscion',
'            from 	gf_g_saldos_favor_cmpnscion a',
'            join 	gf_g_sldos_fvr_cmpnscn_dtll b on a.id_sld_fvr_cmpnscion = b.id_sld_fvr_cmpnscion',
'            where 	id_sldo_fvor_slctud = :P209_ID_SLDO_FVOR_SLCTUD',
'            and 	b.id_sjto_impsto    = nvl(:P209_ID_SJTO_IMPSTO, :P209_SJTO_IMPSTO) ',
'            and 	b.indcdor_cncpto    = ''C'' ',
'            group by b.id_mvmnto_fncro, b.vgncia, b.id_cncpto, b.id_sld_fvr_cmpnscion',
'            order by b.vgncia ) b on a.id_mvmnto_fncro = b.id_mvmnto_fncro  and',
'                                     a.vgncia          = b.vgncia         and',
'                                     a.id_cncpto       = b.id_cncpto',
'                                     ',
'where a.id_sldo_fvor_slctud = :P209_ID_SLDO_FVOR_SLCTUD',
'and   a.id_sjto_impsto      = nvl(:P209_ID_SJTO_IMPSTO, :P209_SJTO_IMPSTO) ',
'and ( a.vlor_sldo_cptal + a.vlor_intres ) - nvl( b.vlor_cmpnscion , 0 ) > 0;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P209_INDCDOR_DSTRBCION'
,p_plug_display_when_cond2=>'V'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(16613622484459702)
,p_name=>'DSCRPCION_MVNT_FNCRO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_MVNT_FNCRO_ESTDO'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(18350964789886727)
,p_name=>'ACTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>220
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
 p_id=>wwv_flow_api.id(23823555932413101)
,p_name=>'ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(23823611635413102)
,p_name=>'INDCDOR_MVMNTO_BLQDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_MVMNTO_BLQDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>240
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>1
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(46230900368089501)
,p_name=>'ID_MVMNTO_FNCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_MVMNTO_FNCRO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>260
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
 p_id=>wwv_flow_api.id(63206061166060904)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(111092804101692911)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(111092970694692912)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(111093064409692913)
,p_name=>'DSCRPCION_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(111093120132692914)
,p_name=>'VLOR_SLDO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_02=>'VALUE'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(111093271174692915)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Intereses'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attribute_02=>'VALUE'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(111093334800692916)
,p_name=>'TOTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attribute_02=>'VALUE'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(111094374385692926)
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
 p_id=>wwv_flow_api.id(111094491059692927)
,p_name=>'ID_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNCPTO'
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
 p_id=>wwv_flow_api.id(114565465716691801)
,p_name=>'VLOR_CMPNSCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_CMPNSCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Compesaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'formatcurrency'
,p_attribute_03=>'right'
,p_format_mask=>'FM999G999G999G999G999G999G990'
,p_item_attributes=>'onkeypress="return  validarExpresion(event, ''numeroEntero'')"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:0});" '
,p_is_required=>false
,p_max_length=>12
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
 p_id=>wwv_flow_api.id(114565504598691802)
,p_name=>'VLOR_X_CMPNSAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_X_CMPNSAR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Valor por Compensar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attribute_02=>'VALUE'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(114683518321779401)
,p_name=>'TOTAL_OCULTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOTAL_OCULTO'
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
 p_id=>wwv_flow_api.id(114683635467779402)
,p_name=>'SALDO_CAPITAL_OCULTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SALDO_CAPITAL_OCULTO'
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
 p_id=>wwv_flow_api.id(114683782930779403)
,p_name=>'SALDO_INTERES_OCULTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SALDO_INTERES_OCULTO'
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
 p_id=>wwv_flow_api.id(114683806563779404)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
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
 p_id=>wwv_flow_api.id(114684343604779409)
,p_name=>'VLOR_X_CMPNSAR_OCULTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_X_CMPNSAR_OCULTO'
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
 p_id=>wwv_flow_api.id(114684547371779411)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
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
 p_id=>wwv_flow_api.id(114684696055779412)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(115198765048375301)
,p_name=>'CDGO_MVNT_FNCRO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVNT_FNCRO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
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
 p_id=>wwv_flow_api.id(211905000417655612)
,p_name=>'ID_FCHA_CRT_FCH_PRY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FCHA_CRT_FCH_PRY'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>270
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(211905189292655613)
,p_name=>'CDGO_MVMNTO_ORGN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVMNTO_ORGN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>280
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(211905264218655614)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>290
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(111092775554692910)
,p_internal_uid=>111092775554692910
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET'
,p_enable_save_public_report=>true
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
 p_id=>wwv_flow_api.id(111103653741724130)
,p_interactive_grid_id=>wwv_flow_api.id(111092775554692910)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(111103745944724130)
,p_report_id=>wwv_flow_api.id(111103653741724130)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16634444801555480)
,p_view_id=>wwv_flow_api.id(111103745944724130)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(16613622484459702)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18355174975012623)
,p_view_id=>wwv_flow_api.id(111103745944724130)
,p_display_seq=>24
,p_column_id=>wwv_flow_api.id(18350964789886727)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23829575825413322)
,p_view_id=>wwv_flow_api.id(111103745944724130)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(23823555932413101)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>60
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23833128247441457)
,p_view_id=>wwv_flow_api.id(111103745944724130)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(23823611635413102)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(46237041755092615)
,p_view_id=>wwv_flow_api.id(111103745944724130)
,p_display_seq=>28
,p_column_id=>wwv_flow_api.id(46230900368089501)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(111104208707724133)
,p_view_id=>wwv_flow_api.id(111103745944724130)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(111092804101692911)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>88
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(111104719531724137)
,p_view_id=>wwv_flow_api.id(111103745944724130)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(111092970694692912)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>64
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(111105258198724138)
,p_view_id=>wwv_flow_api.id(111103745944724130)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(111093064409692913)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>138
,p_sort_order=>2
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(111105780941724140)
,p_view_id=>wwv_flow_api.id(111103745944724130)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(111093120132692914)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(111106266895724141)
,p_view_id=>wwv_flow_api.id(111103745944724130)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(111093271174692915)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(111106758648724142)
,p_view_id=>wwv_flow_api.id(111103745944724130)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(111093334800692916)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(111138514870935787)
,p_view_id=>wwv_flow_api.id(111103745944724130)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(111094374385692926)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(111139039901935789)
,p_view_id=>wwv_flow_api.id(111103745944724130)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(111094491059692927)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114571498004692024)
,p_view_id=>wwv_flow_api.id(111103745944724130)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(114565465716691801)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>128
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114571943791692027)
,p_view_id=>wwv_flow_api.id(111103745944724130)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(114565504598691802)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>145
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114689509173780174)
,p_view_id=>wwv_flow_api.id(111103745944724130)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(114683518321779401)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114691979747797742)
,p_view_id=>wwv_flow_api.id(111103745944724130)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(114683635467779402)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114692458008797743)
,p_view_id=>wwv_flow_api.id(111103745944724130)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(114683782930779403)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114697013818820859)
,p_view_id=>wwv_flow_api.id(111103745944724130)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(114683806563779404)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114725758972992453)
,p_view_id=>wwv_flow_api.id(111103745944724130)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(114684343604779409)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114728441038034274)
,p_view_id=>wwv_flow_api.id(111103745944724130)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(114684547371779411)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114735028418061233)
,p_view_id=>wwv_flow_api.id(111103745944724130)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(114684696055779412)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(115204820054375638)
,p_view_id=>wwv_flow_api.id(111103745944724130)
,p_display_seq=>21
,p_column_id=>wwv_flow_api.id(115198765048375301)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(211921432318051388)
,p_view_id=>wwv_flow_api.id(111103745944724130)
,p_display_seq=>29
,p_column_id=>wwv_flow_api.id(211905000417655612)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(211921892417051393)
,p_view_id=>wwv_flow_api.id(111103745944724130)
,p_display_seq=>30
,p_column_id=>wwv_flow_api.id(211905189292655613)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(211922351172051396)
,p_view_id=>wwv_flow_api.id(111103745944724130)
,p_display_seq=>31
,p_column_id=>wwv_flow_api.id(211905264218655614)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(134288538661382401)
,p_plug_name=>unistr('Informaci\00F3n de la cartera')
,p_region_name=>'cartera2'
,p_parent_plug_id=>wwv_flow_api.id(211327173222537703)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from (select  id_fcha_crt_fch_pry ',
'        , a.id_mvmnto_fncro',
'        , a.id_impsto',
'        , a.id_impsto_sbmpsto',
'        , a.id_sjto_impsto',
'        , a.vgncia',
'        , a.prdo',
'        , a.id_prdo',
'        , a.id_cncpto',
'        , nvl2(b.id_sld_fvr_cmpnscion, ''U'', ''I'') as action',
'        , a.dscrpcion_cncpto',
'        , a.vlor_sldo_cptal',
'        , a.saldo_capital_oculto',
'        , a.vlor_intres',
'        , a.saldo_interes_oculto',
'        , a.cdgo_mvnt_fncro_estdo',
'        , a.dscrpcion_mvnt_fncro_estdo',
'        , a.total',
'        , a.total_oculto',
'        , r.vlor_dstrbdo vlor_cmpnscion',
'        , r.vlor_dstrbdo vlor_cmpnscion_oculto',
'        , ( a.vlor_sldo_cptal + a.vlor_intres ) - nvl( b.vlor_cmpnscion , 0 ) as vlor_x_cmpnsar',
'        , ( a.vlor_sldo_cptal + a.vlor_intres ) - nvl( b.vlor_cmpnscion , 0 ) as vlor_x_cmpnsar_oculto',
'        , case when a.indcdor_mvmnto_blqdo = ''S'' then ''Bloqueada'' else ''Normal'' end estdo',
'        , a.indcdor_mvmnto_blqdo',
'        , a.cdgo_mvmnto_orgn , a.id_orgen -- req. 0023663',
'from 	gf_g_crtra_fcha_pryccion a',
'left 	join (select b.id_mvmnto_fncro',
'                   ,b.vgncia',
'                   ,b.id_cncpto',
'                   ,b.id_sld_fvr_cmpnscion',
'                   ,sum(b.vlor_cmpnscion) + (select nvl(sum(z.vlor_cmpnscion), 0) ',
'                                             from 	gf_g_sldos_fvr_cmpnscn_dtll z',
'                                             where 	z.id_mvmnto_fncro = b.id_mvmnto_fncro',
'                                             and   	z.vgncia = b.vgncia',
'                                             and   	z.id_cncpto_rlcnal = b.id_cncpto',
'                                             and   	z.id_sld_fvr_cmpnscion = b.id_sld_fvr_cmpnscion) as vlor_cmpnscion',
'            from 	gf_g_saldos_favor_cmpnscion a',
'            join 	gf_g_sldos_fvr_cmpnscn_dtll b on a.id_sld_fvr_cmpnscion = b.id_sld_fvr_cmpnscion',
'            where 	id_sldo_fvor_slctud = :P209_ID_SLDO_FVOR_SLCTUD',
'            and 	b.id_sjto_impsto    = nvl(:P209_ID_SJTO_IMPSTO, :P209_SJTO_IMPSTO) ',
'            and 	b.indcdor_cncpto    = ''C'' ',
'            group by b.id_mvmnto_fncro, b.vgncia, b.id_cncpto, b.id_sld_fvr_cmpnscion',
'            order by b.vgncia ) b on a.id_mvmnto_fncro = b.id_mvmnto_fncro  and',
'                                     a.vgncia          = b.vgncia         and',
'                                     a.id_cncpto       = b.id_cncpto',
'									 ',
'left join ( select sum(vlor_hber) vlor_dstrbdo, id_impsto_sbmpsto , vgncia, id_cncpto',
'       from table(pkg_gf_saldos_favor.prc_ap_sldo_fvor_prprcnal( p_cdgo_clnte        => :F_CDGO_CLNTE ,',
'                                                                 p_id_impsto         => :P209_ID_IMPSTO ,',
'                                                                 --p_id_impsto_sbmpsto => :P209_ID_IMPSTO_SBMPSTO ,',
'                                                                 p_id_sjto_impsto    => nvl(:P209_ID_SJTO_IMPSTO, :P209_SJTO_IMPSTO) ,',
'                                                                 p_fcha_vncmnto      => sysdate ,',
'                                                                 p_vlor_sldo_fvor    => (case when nvl(to_number(:P209_VLOR_CMPNSAR_VGNCIA),0) = 0 then',
'                                                                                            to_number(:P209_SALDO_FAVOR)',
'                                                                                         when to_number(:P209_VLOR_CMPNSAR_VGNCIA) > to_number(:P209_SALDO_FAVOR) then',
'                                                                                            to_number(:P209_SALDO_FAVOR)',
'                                                                                         else',
'                                                                                            to_number(:P209_VLOR_CMPNSAR_VGNCIA) ',
'                                                                                         end ),',
'                                                                 p_id_sldo_fvor_slctud  => :P209_ID_SLDO_FVOR_SLCTUD,',
'                                                                 p_vgncias_cmpnsar   => :P209_VGNCIAS_COMPENSAR',
'                                                               ) )',
'        group by id_impsto_sbmpsto , vgncia, id_cncpto ) r on r.id_impsto_sbmpsto = a.id_impsto_sbmpsto ',
'                                                          and r.vgncia = a.vgncia and r.id_cncpto = a.id_cncpto  ',
'														  ',
'where a.id_sldo_fvor_slctud = :P209_ID_SLDO_FVOR_SLCTUD',
'and   a.id_sjto_impsto      = nvl(:P209_ID_SJTO_IMPSTO, :P209_SJTO_IMPSTO) ',
'and ( a.vlor_sldo_cptal + a.vlor_intres ) - nvl( b.vlor_cmpnscion , 0 ) > 0',
'order by vgncia               ',
');'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P209_INDCDOR_DSTRBCION'
,p_plug_display_when_cond2=>'P'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(134288714639382403)
,p_name=>'INDCDOR_MVMNTO_BLQDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_MVMNTO_BLQDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>1
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(134288915697382405)
,p_name=>'ID_MVMNTO_FNCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_MVMNTO_FNCRO'
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
 p_id=>wwv_flow_api.id(134289098343382406)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>40
,p_attribute_01=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(134289187540382407)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Vigencia'
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
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(134289260216382408)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(134289367180382409)
,p_name=>'DSCRPCION_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(134289487350382410)
,p_name=>'VLOR_SLDO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attribute_02=>'VALUE'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(134289543519382411)
,p_name=>'DSCRPCION_MVNT_FNCRO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_MVNT_FNCRO_ESTDO'
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
 p_id=>wwv_flow_api.id(134289685077382412)
,p_name=>'ACTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'N'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(134289770904382413)
,p_name=>'ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(134289887343382414)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Intereses'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attribute_02=>'VALUE'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(134289929676382415)
,p_name=>'TOTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_attribute_02=>'VALUE'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(134290032277382416)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
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
 p_id=>wwv_flow_api.id(134290149621382417)
,p_name=>'ID_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNCPTO'
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
 p_id=>wwv_flow_api.id(134290298267382418)
,p_name=>'VLOR_CMPNSCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_CMPNSCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Compesaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'formatcurrency'
,p_attribute_03=>'right'
,p_format_mask=>'FML999G999G999G999G990'
,p_item_attributes=>'onkeypress="return  validarExpresion(event, ''numeroEntero'')"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:0});" '
,p_is_required=>false
,p_max_length=>12
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
 p_id=>wwv_flow_api.id(134290332797382419)
,p_name=>'VLOR_X_CMPNSAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_X_CMPNSAR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Valor por Compensar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'RIGHT'
,p_attribute_02=>'VALUE'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(134290447213382420)
,p_name=>'TOTAL_OCULTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOTAL_OCULTO'
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
 p_id=>wwv_flow_api.id(134290565287382421)
,p_name=>'SALDO_CAPITAL_OCULTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SALDO_CAPITAL_OCULTO'
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
 p_id=>wwv_flow_api.id(134290603964382422)
,p_name=>'SALDO_INTERES_OCULTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SALDO_INTERES_OCULTO'
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
 p_id=>wwv_flow_api.id(134290755745382423)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
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
 p_id=>wwv_flow_api.id(134290883790382424)
,p_name=>'VLOR_X_CMPNSAR_OCULTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_X_CMPNSAR_OCULTO'
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
 p_id=>wwv_flow_api.id(134290907456382425)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>230
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(134291084499382426)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
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
 p_id=>wwv_flow_api.id(134291184920382427)
,p_name=>'CDGO_MVNT_FNCRO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVNT_FNCRO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>250
,p_attribute_01=>'N'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(141221659962239306)
,p_name=>'CDGO_MVMNTO_ORGN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVMNTO_ORGN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>270
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(141221783143239307)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>280
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(141318574036574501)
,p_name=>'ID_FCHA_CRT_FCH_PRY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FCHA_CRT_FCH_PRY'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>290
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
 p_id=>wwv_flow_api.id(142183260744490401)
,p_name=>'VLOR_CMPNSCION_OCULTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_CMPNSCION_OCULTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>300
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(134288677911382402)
,p_internal_uid=>134288677911382402
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET'
,p_enable_save_public_report=>true
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
 p_id=>wwv_flow_api.id(134294558286403508)
,p_interactive_grid_id=>wwv_flow_api.id(134288677911382402)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(134294642296403511)
,p_report_id=>wwv_flow_api.id(134294558286403508)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134295140826403529)
,p_view_id=>wwv_flow_api.id(134294642296403511)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(134288714639382403)
,p_is_visible=>false
,p_is_frozen=>false
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134296454173403544)
,p_view_id=>wwv_flow_api.id(134294642296403511)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(134288915697382405)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134297358143403548)
,p_view_id=>wwv_flow_api.id(134294642296403511)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(134289187540382407)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>88
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134297847875403549)
,p_view_id=>wwv_flow_api.id(134294642296403511)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(134289260216382408)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>64
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134298215601403552)
,p_view_id=>wwv_flow_api.id(134294642296403511)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(134289367180382409)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>138
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134298736546403554)
,p_view_id=>wwv_flow_api.id(134294642296403511)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(134289487350382410)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134299292704403557)
,p_view_id=>wwv_flow_api.id(134294642296403511)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(134289543519382411)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134299739224403560)
,p_view_id=>wwv_flow_api.id(134294642296403511)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(134289685077382412)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134300278159403562)
,p_view_id=>wwv_flow_api.id(134294642296403511)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(134289770904382413)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>60
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134300757505403563)
,p_view_id=>wwv_flow_api.id(134294642296403511)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(134289887343382414)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134301271057403565)
,p_view_id=>wwv_flow_api.id(134294642296403511)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(134289929676382415)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134301755013403567)
,p_view_id=>wwv_flow_api.id(134294642296403511)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(134290032277382416)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134302289168403569)
,p_view_id=>wwv_flow_api.id(134294642296403511)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(134290149621382417)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134302714954403571)
,p_view_id=>wwv_flow_api.id(134294642296403511)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(134290298267382418)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>128
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134303258188403574)
,p_view_id=>wwv_flow_api.id(134294642296403511)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(134290332797382419)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>145
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134303762182403576)
,p_view_id=>wwv_flow_api.id(134294642296403511)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(134290447213382420)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134304239383403584)
,p_view_id=>wwv_flow_api.id(134294642296403511)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(134290565287382421)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134304756091403587)
,p_view_id=>wwv_flow_api.id(134294642296403511)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(134290603964382422)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134305296790403589)
,p_view_id=>wwv_flow_api.id(134294642296403511)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(134290755745382423)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134305731329403591)
,p_view_id=>wwv_flow_api.id(134294642296403511)
,p_display_seq=>21
,p_column_id=>wwv_flow_api.id(134290883790382424)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134306206474403593)
,p_view_id=>wwv_flow_api.id(134294642296403511)
,p_display_seq=>22
,p_column_id=>wwv_flow_api.id(134290907456382425)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134306785727403594)
,p_view_id=>wwv_flow_api.id(134294642296403511)
,p_display_seq=>23
,p_column_id=>wwv_flow_api.id(134291084499382426)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134307280575403596)
,p_view_id=>wwv_flow_api.id(134294642296403511)
,p_display_seq=>24
,p_column_id=>wwv_flow_api.id(134291184920382427)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(141247008432242617)
,p_view_id=>wwv_flow_api.id(134294642296403511)
,p_display_seq=>26
,p_column_id=>wwv_flow_api.id(141221659962239306)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(141247500194242619)
,p_view_id=>wwv_flow_api.id(134294642296403511)
,p_display_seq=>27
,p_column_id=>wwv_flow_api.id(141221783143239307)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(141324464616574984)
,p_view_id=>wwv_flow_api.id(134294642296403511)
,p_display_seq=>29
,p_column_id=>wwv_flow_api.id(141318574036574501)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(142190551617519946)
,p_view_id=>wwv_flow_api.id(134294642296403511)
,p_display_seq=>30
,p_column_id=>wwv_flow_api.id(142183260744490401)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(208715588114661001)
,p_plug_name=>unistr('Informaci\00F3n de la cartera-Vigencia Antigua')
,p_region_name=>'cartera1'
,p_parent_plug_id=>wwv_flow_api.id(211327173222537703)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from (select  id_fcha_crt_fch_pry ',
'        , a.id_mvmnto_fncro',
'        , a.id_impsto',
'        , a.id_impsto_sbmpsto',
'        , a.id_sjto_impsto',
'        , a.vgncia',
'        , a.prdo',
'        , a.id_prdo',
'        , a.id_cncpto',
'        , nvl2(b.id_sld_fvr_cmpnscion, ''U'', ''I'') as action',
'        , a.dscrpcion_cncpto',
'        , a.vlor_sldo_cptal',
'        , a.saldo_capital_oculto',
'        , a.vlor_intres',
'        , a.saldo_interes_oculto',
'        , a.cdgo_mvnt_fncro_estdo',
'        , a.dscrpcion_mvnt_fncro_estdo',
'        , a.total',
'        , a.total_oculto',
'        , a.vlor_cmpnscion',
'        , ( a.vlor_sldo_cptal + a.vlor_intres ) - nvl( b.vlor_cmpnscion , 0 ) as vlor_x_cmpnsar',
'        , ( a.vlor_sldo_cptal + a.vlor_intres ) - nvl( b.vlor_cmpnscion , 0 ) as vlor_x_cmpnsar_oculto',
'        , case when a.indcdor_mvmnto_blqdo = ''S'' then ''Bloqueada'' else ''Normal'' end estdo',
'        , a.indcdor_mvmnto_blqdo',
'        , a.cdgo_mvmnto_orgn , a.id_orgen -- req. 0023663',
'from 	gf_g_crtra_fcha_pryccion a',
'left 	join (select b.id_mvmnto_fncro',
'                   ,b.vgncia',
'                   ,b.id_cncpto',
'                   ,b.id_sld_fvr_cmpnscion',
'                   ,sum(b.vlor_cmpnscion) + (select nvl(sum(z.vlor_cmpnscion), 0) ',
'                                             from 	gf_g_sldos_fvr_cmpnscn_dtll z',
'                                             where 	z.id_mvmnto_fncro = b.id_mvmnto_fncro',
'                                             and   	z.vgncia = b.vgncia',
'                                             and   	z.id_cncpto_rlcnal = b.id_cncpto',
'                                             and   	z.id_sld_fvr_cmpnscion = b.id_sld_fvr_cmpnscion) as vlor_cmpnscion',
'            from 	gf_g_saldos_favor_cmpnscion a',
'            join 	gf_g_sldos_fvr_cmpnscn_dtll b on a.id_sld_fvr_cmpnscion = b.id_sld_fvr_cmpnscion',
'            where 	id_sldo_fvor_slctud = :P209_ID_SLDO_FVOR_SLCTUD',
'            and 	b.id_sjto_impsto    = nvl(:P209_ID_SJTO_IMPSTO, :P209_SJTO_IMPSTO) ',
'            and 	b.indcdor_cncpto    = ''C'' ',
'            group by b.id_mvmnto_fncro, b.vgncia, b.id_cncpto, b.id_sld_fvr_cmpnscion',
'            order by b.vgncia ) b on a.id_mvmnto_fncro = b.id_mvmnto_fncro  and',
'                                     a.vgncia          = b.vgncia         and',
'                                     a.id_cncpto       = b.id_cncpto',
'                                     ',
'where a.id_sldo_fvor_slctud = :P209_ID_SLDO_FVOR_SLCTUD',
'and   a.id_sjto_impsto      = nvl(:P209_ID_SJTO_IMPSTO, :P209_SJTO_IMPSTO) ',
'and ( a.vlor_sldo_cptal + a.vlor_intres ) - nvl( b.vlor_cmpnscion , 0 ) > 0',
'order by vgncia               ',
');'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P209_INDCDOR_DSTRBCION'
,p_plug_display_when_cond2=>'A'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(141221225491239302)
,p_name=>'ID_FCHA_CRT_FCH_PRY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FCHA_CRT_FCH_PRY'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>260
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(141221313445239303)
,p_name=>'CDGO_MVMNTO_ORGN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVMNTO_ORGN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>270
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
 p_id=>wwv_flow_api.id(141221412329239304)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>280
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
 p_id=>wwv_flow_api.id(208715724945661003)
,p_name=>'DSCRPCION_MVNT_FNCRO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_MVNT_FNCRO_ESTDO'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(208715874760661004)
,p_name=>'ACTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
,p_attribute_01=>'N'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(208715965523661005)
,p_name=>'ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(208716002917661006)
,p_name=>'INDCDOR_MVMNTO_BLQDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_MVMNTO_BLQDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>230
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>1
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(208716259897661008)
,p_name=>'ID_MVMNTO_FNCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_MVMNTO_FNCRO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>250
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(208716307776661009)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(208716404181661010)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(208716502846661011)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(208716639921661012)
,p_name=>'DSCRPCION_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(208716718951661013)
,p_name=>'VLOR_SLDO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attribute_02=>'VALUE'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(208716815496661014)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Intereses'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_02=>'VALUE'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(208716952045661015)
,p_name=>'TOTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attribute_02=>'VALUE'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(208717058433661016)
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
 p_id=>wwv_flow_api.id(208717105263661017)
,p_name=>'ID_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNCPTO'
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
 p_id=>wwv_flow_api.id(208717282567661018)
,p_name=>'VLOR_CMPNSCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_CMPNSCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Compesaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'formatcurrency'
,p_attribute_03=>'right'
,p_format_mask=>'FM999G999G999G999G999G999G990'
,p_item_attributes=>'onkeypress="return  validarExpresion(event, ''numeroEntero'')"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:0});" '
,p_is_required=>false
,p_max_length=>12
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
 p_id=>wwv_flow_api.id(208717398938661019)
,p_name=>'VLOR_X_CMPNSAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_X_CMPNSAR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Valor por Compensar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attribute_02=>'VALUE'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(208717409988661020)
,p_name=>'TOTAL_OCULTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOTAL_OCULTO'
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
 p_id=>wwv_flow_api.id(208717508010661021)
,p_name=>'SALDO_CAPITAL_OCULTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SALDO_CAPITAL_OCULTO'
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
 p_id=>wwv_flow_api.id(208717663431661022)
,p_name=>'SALDO_INTERES_OCULTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SALDO_INTERES_OCULTO'
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
 p_id=>wwv_flow_api.id(208717762824661023)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
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
 p_id=>wwv_flow_api.id(208717854209661024)
,p_name=>'VLOR_X_CMPNSAR_OCULTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_X_CMPNSAR_OCULTO'
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
 p_id=>wwv_flow_api.id(208717994684661025)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
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
 p_id=>wwv_flow_api.id(208718002406661026)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
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
 p_id=>wwv_flow_api.id(208718151593661027)
,p_name=>'CDGO_MVNT_FNCRO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVNT_FNCRO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attribute_01=>'N'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(208715687897661002)
,p_internal_uid=>208715687897661002
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET'
,p_enable_save_public_report=>true
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
 p_id=>wwv_flow_api.id(208723046726688931)
,p_interactive_grid_id=>wwv_flow_api.id(208715687897661002)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(208723175830688931)
,p_report_id=>wwv_flow_api.id(208723046726688931)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(141242080411849987)
,p_view_id=>wwv_flow_api.id(208723175830688931)
,p_display_seq=>25
,p_column_id=>wwv_flow_api.id(141221225491239302)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(141242486740849996)
,p_view_id=>wwv_flow_api.id(208723175830688931)
,p_display_seq=>26
,p_column_id=>wwv_flow_api.id(141221313445239303)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(141242931535849998)
,p_view_id=>wwv_flow_api.id(208723175830688931)
,p_display_seq=>27
,p_column_id=>wwv_flow_api.id(141221412329239304)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(208723697743688935)
,p_view_id=>wwv_flow_api.id(208723175830688931)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(208715724945661003)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(208724151733688939)
,p_view_id=>wwv_flow_api.id(208723175830688931)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(208715874760661004)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(208724680414688941)
,p_view_id=>wwv_flow_api.id(208723175830688931)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(208715965523661005)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(208725118962688943)
,p_view_id=>wwv_flow_api.id(208723175830688931)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(208716002917661006)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(208726125992688947)
,p_view_id=>wwv_flow_api.id(208723175830688931)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(208716259897661008)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(208727058917688950)
,p_view_id=>wwv_flow_api.id(208723175830688931)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(208716404181661010)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(208727559360688952)
,p_view_id=>wwv_flow_api.id(208723175830688931)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(208716502846661011)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(208728021474688954)
,p_view_id=>wwv_flow_api.id(208723175830688931)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(208716639921661012)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(208728594277688955)
,p_view_id=>wwv_flow_api.id(208723175830688931)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(208716718951661013)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(208729029065688957)
,p_view_id=>wwv_flow_api.id(208723175830688931)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(208716815496661014)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(208729522194688960)
,p_view_id=>wwv_flow_api.id(208723175830688931)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(208716952045661015)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(208730066376688962)
,p_view_id=>wwv_flow_api.id(208723175830688931)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(208717058433661016)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(208730522865688963)
,p_view_id=>wwv_flow_api.id(208723175830688931)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(208717105263661017)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(208731089527688965)
,p_view_id=>wwv_flow_api.id(208723175830688931)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(208717282567661018)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(208731545746688967)
,p_view_id=>wwv_flow_api.id(208723175830688931)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(208717398938661019)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(208732069052688969)
,p_view_id=>wwv_flow_api.id(208723175830688931)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(208717409988661020)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(208732577464688970)
,p_view_id=>wwv_flow_api.id(208723175830688931)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(208717508010661021)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(208733038294688972)
,p_view_id=>wwv_flow_api.id(208723175830688931)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(208717663431661022)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(208733583036688974)
,p_view_id=>wwv_flow_api.id(208723175830688931)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(208717762824661023)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(208734093219688975)
,p_view_id=>wwv_flow_api.id(208723175830688931)
,p_display_seq=>21
,p_column_id=>wwv_flow_api.id(208717854209661024)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(208734526459688977)
,p_view_id=>wwv_flow_api.id(208723175830688931)
,p_display_seq=>22
,p_column_id=>wwv_flow_api.id(208717994684661025)
,p_is_visible=>true
,p_is_frozen=>false
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(208735095600688979)
,p_view_id=>wwv_flow_api.id(208723175830688931)
,p_display_seq=>23
,p_column_id=>wwv_flow_api.id(208718002406661026)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(208735535897688981)
,p_view_id=>wwv_flow_api.id(208723175830688931)
,p_display_seq=>24
,p_column_id=>wwv_flow_api.id(208718151593661027)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(211904375055655605)
,p_plug_name=>'Datos Generales'
,p_parent_plug_id=>wwv_flow_api.id(211327173222537703)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P209_INDCDOR_DSTRBCION = ''P'' or :P209_INDCDOR_FCHA_INTRES = ''S'''
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(367485648515329626)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>50
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
'<i>',
'Funcionalidad que permite: <br><br>',
'',
'Visualizar los saldos a favor reconocidos en la solicitud.<br><br>',
'Consultar el Sujeto Tributo al que se le va a compensar las deudas.<br><br>',
'Compensar carteras que no se encuentren bloqueadas.<br><br>',
unistr('Registrar la Compensaci\00F3n.<br><br>'),
unistr('Eliminar la Compensaci\00F3n.<br><br>'),
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(368052279573945814)
,p_plug_name=>'Responsables'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_rzon_scial,',
'       a.dscrpcion_idntfccion_tpo ,',
'       a.idntfccion_rspnsble ',
'from v_si_i_sujetos_responsable a',
'where a.cdgo_clnte     = :F_CDGO_CLNTE',
'and a.id_sjto_impsto   =  nvl(:P209_ID_SJTO_IMPSTO, :P209_SJTO_IMPSTO);'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>':P209_ID_SJTO_IMPSTO is not null or :P209_SJTO_IMPSTO is not null'
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
 p_id=>wwv_flow_api.id(368463032102889584)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'La consulta no arrojo resultado'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'AALFARO'
,p_internal_uid=>368463032102889584
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(111297320821449487)
,p_db_column_name=>'DSCRPCION_IDNTFCCION_TPO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Tipo Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(111297717666449487)
,p_db_column_name=>'IDNTFCCION_RSPNSBLE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(111296996868449483)
,p_db_column_name=>'NMBRE_RZON_SCIAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Raz\00F3n Social')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(368485427714165086)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1112985'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_IDNTFCCION_TPO:IDNTFCCION_RSPNSBLE:NMBRE_RZON_SCIAL'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(105327201516587521)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(198704200808512981)
,p_button_name=>'Btn_Regresar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:201:&SESSION.::&DEBUG.:RP,201::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(104226352839635225)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(198704200808512981)
,p_button_name=>'Btn_Guardar'
,p_button_static_id=>'Btn_Guardar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P209_ID_SJTO_IMPSTO is not null or :P209_SJTO_IMPSTO is not null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(118266121761105231)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(198704200808512981)
,p_button_name=>'BTN_CONSULTA_PARAMETROS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Compensar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3:P3_NMRO_APP,P3_NMRO_PGNA,P3_NMBRE_ITEM,P3_VLDAR_CRTRA,P3_NMBRE_ITEM_IMPSTO,P3_NMBRE_ITEM_SBIMPSTO:&APP_ID.,&APP_PAGE_ID.,P209_ID_SJTO_IMPSTO,S,P209_ID_IMPSTO,P209_ID_IMPSTO_SBMPSTO'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(134546585167751701)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(198704200808512981)
,p_button_name=>'BTN_CNSLTA_SJTOS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Consulta Sujetos Cartera'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:386:&SESSION.::&DEBUG.:RP,386:P386_IDNTFCCION_RSPNSBLE,P386_NMBRE_RSPNSBLE,P386_NMRO_APP,P386_NMRO_PGNA,P386_NMBRE_ITEM,P386_NMBRE_ITEM_IMPSTO,P386_NMBRE_ITEM_SBIMPSTO,P386_ID_SJTO_IMPSTO:&P209_IDNTFCCION_RSPNSBLE.,&P209_NMBRE_RSPNSBLE.,&APP_ID.,&APP_PAGE_ID.,P209_ID_SJTO_IMPSTO,P209_ID_IMPSTO,P209_ID_IMPSTO_SBMPSTO,&P209_SJTO_IMPSTO.'
,p_button_condition=>'P209_INDCDOR_DSTRBCION'
,p_button_condition2=>'P'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-credit-card'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(211945263491542702)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(211904375055655605)
,p_button_name=>'BTN_DSTRBIUR_SF'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Distribuir<br>Saldo a Favor'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P209_INDCDOR_DSTRBCION'
,p_button_condition2=>'P'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-money'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(134291637524382432)
,p_branch_name=>'Ir a 209'
,p_branch_action=>'f?p=&APP_ID.:209:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(211945263491542702)
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104752626461428501)
,p_name=>'P209_ID_SLDO_FVOR_SLCTUD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(103986259529655504)
,p_prompt=>'id_sldo_fvor_slctud'
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
 p_id=>wwv_flow_api.id(105689375764668005)
,p_name=>'P209_ID_SOLICITUD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(103986259529655504)
,p_prompt=>'id_solicitud'
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
 p_id=>wwv_flow_api.id(106014373550717201)
,p_name=>'P209_SJTO_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(103986259529655504)
,p_prompt=>'sjto_impsto'
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
 p_id=>wwv_flow_api.id(108430140278151303)
,p_name=>'P209_ID_SLDOS_FVR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(103986259529655504)
,p_prompt=>'id_sldos_fvr'
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
 p_id=>wwv_flow_api.id(111094573251692928)
,p_name=>'P209_SALDO_FAVOR'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(103986259529655504)
,p_prompt=>'saldo_favor'
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
 p_id=>wwv_flow_api.id(111094691103692929)
,p_name=>'P209_COMPENSACION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(103986259529655504)
,p_prompt=>'compensacion'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111094919756692932)
,p_name=>'P209_JSON_CARTERA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(103986259529655504)
,p_prompt=>'json_cartera'
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
 p_id=>wwv_flow_api.id(111095074202692933)
,p_name=>'P209_JSON_SALDO_FAVOR'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(103986259529655504)
,p_prompt=>'json_saldo_favor'
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
 p_id=>wwv_flow_api.id(112757531916754005)
,p_name=>'P209_TOTAL_DEUDA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(103986259529655504)
,p_prompt=>'total_deuda'
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
 p_id=>wwv_flow_api.id(114229657811610905)
,p_name=>'P209_ID_SJTO_IMPSTO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(103986259529655504)
,p_prompt=>'id_sjto_impsto'
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
 p_id=>wwv_flow_api.id(114229794450610906)
,p_name=>'P209_ID_IMPSTO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(103986259529655504)
,p_prompt=>'id_impsto'
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
 p_id=>wwv_flow_api.id(114684450995779410)
,p_name=>'P209_VALOR_X_CMPNSAR'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(103986259529655504)
,p_prompt=>'valor_x_cmpnsar'
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
 p_id=>wwv_flow_api.id(115166115947028202)
,p_name=>'P209_DEFINICION'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(103986259529655504)
,p_prompt=>'definicion'
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
 p_id=>wwv_flow_api.id(118491287182325208)
,p_name=>'P209_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(103986259529655504)
,p_prompt=>'id_impsto_sbmpsto'
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
 p_id=>wwv_flow_api.id(118491328791325209)
,p_name=>'P209_ID_SJTO_IMPSTO_C'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(103986259529655504)
,p_prompt=>'id_sjto_impsto_c'
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
 p_id=>wwv_flow_api.id(118491480158325210)
,p_name=>'P209_VGNCIA'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(103986259529655504)
,p_prompt=>'vgncia'
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
 p_id=>wwv_flow_api.id(118491550866325211)
,p_name=>'P209_ID_PRDO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(103986259529655504)
,p_prompt=>'id_prdo'
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
 p_id=>wwv_flow_api.id(123081666473043701)
,p_name=>'P209_ORDENAMIENTO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(103986259529655504)
,p_prompt=>'ORDENAMIENTO'
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
 p_id=>wwv_flow_api.id(124015987696332203)
,p_name=>'P209_ID_SAF'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(103986259529655504)
,p_prompt=>'ID_SAF'
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
 p_id=>wwv_flow_api.id(124188005949942801)
,p_name=>'P209_CMPNSCIONAUTMTCA'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(103986259529655504)
,p_prompt=>'Nuevo'
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
 p_id=>wwv_flow_api.id(134599455595485810)
,p_name=>'P209_IDNTFCCION_RSPNSBLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(368052279573945814)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134600418298485820)
,p_name=>'P209_NMBRE_RSPNSBLE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(368052279573945814)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141318616405574502)
,p_name=>'P209_VLOR_CMPNSAR_VGNCIA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(211904375055655605)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(204508447137979546)
,p_name=>'P209_INDCDOR_DSTRBCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(211327173222537703)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(211904412317655606)
,p_name=>'P209_FCHA_INTRES'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(211904375055655605)
,p_item_default=>'select sysdate from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>unistr('<b>Fecha Proyecci\00F3n Inter\00E9s</b>')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_colspan=>5
,p_display_when=>'P209_INDCDOR_FCHA_INTRES'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0m'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(211905471052655616)
,p_name=>'P209_VLOR_CMPNSAR_VGNCIA_2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(211904375055655605)
,p_use_cache_before_default=>'NO'
,p_item_default=>'0'
,p_prompt=>'<b>Valor a Compensar</b>'
,p_display_as=>'PLUGIN_AUTONUMERIC'
,p_cSize=>30
,p_colspan=>4
,p_display_when=>'P209_INDCDOR_DSTRBCION'
,p_display_when2=>'P'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'P209_VLOR_CMPNSAR_VGNCIA'
,p_attribute_02=>'10000000000000'
,p_attribute_03=>'0'
,p_attribute_05=>'$'
,p_attribute_06=>'p'
,p_attribute_07=>','
,p_attribute_09=>'0'
,p_attribute_10=>'null'
,p_attribute_11=>'null'
,p_attribute_12=>'null'
,p_attribute_13=>'3'
,p_attribute_14=>'.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(211905575842655617)
,p_name=>'P209_VGNCIAS_COMPENSAR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(211904375055655605)
,p_prompt=>'<b>Vigencias a Compensar</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  distinct a.vgncia d, a.vgncia r',
'from 	gf_g_crtra_fcha_pryccion a',
'    left join ( select b.id_mvmnto_fncro',
'                       ,b.vgncia',
'                       ,b.id_cncpto',
'                       ,b.id_sld_fvr_cmpnscion',
'                       ,sum(b.vlor_cmpnscion) vlor_cptal_cmpnsdo',
'					   ,(select nvl(sum(z.vlor_cmpnscion), 0) ',
'						 from   gf_g_sldos_fvr_cmpnscn_dtll z',
'						 where  z.id_mvmnto_fncro      = b.id_mvmnto_fncro',
'						 and    z.vgncia               = b.vgncia',
'						 and    z.id_cncpto_rlcnal     = b.id_cncpto',
'						 and    z.id_sld_fvr_cmpnscion = b.id_sld_fvr_cmpnscion ) vlor_intres_cmpnsdo',
'                from 	gf_g_saldos_favor_cmpnscion c',
'                join 	gf_g_sldos_fvr_cmpnscn_dtll b on c.id_sld_fvr_cmpnscion = b.id_sld_fvr_cmpnscion',
'                where 	id_sldo_fvor_slctud = :P209_ID_SLDO_FVOR_SLCTUD',
'                and 	b.id_sjto_impsto    = nvl(:P209_ID_SJTO_IMPSTO, :P209_SJTO_IMPSTO) ',
'                and 	b.indcdor_cncpto    = ''C''',
'                group by b.id_mvmnto_fncro, b.vgncia, b.id_cncpto, b.id_sld_fvr_cmpnscion',
'                order by b.vgncia ) d on a.id_mvmnto_fncro = d.id_mvmnto_fncro  and',
'                                         a.vgncia          = d.vgncia           and',
'                                         a.id_cncpto       = d.id_cncpto ',
'where a.id_sldo_fvor_slctud = :P209_ID_SLDO_FVOR_SLCTUD',
'and   a.id_sjto_impsto      = nvl(:P209_ID_SJTO_IMPSTO, :P209_SJTO_IMPSTO)',
'and   (a.vlor_sldo_cptal+a.vlor_intres) > ( nvl(vlor_cptal_cmpnsdo,0) + nvl(vlor_intres_cmpnsdo,0) )',
'order by a.vgncia;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_display_when=>'P209_INDCDOR_DSTRBCION'
,p_display_when2=>'P'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'MULTI'
,p_attribute_08=>'CIC'
,p_attribute_10=>'70%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(211945188204542701)
,p_name=>'P209_INDCDOR_FCHA_INTRES'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(211327173222537703)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(141498518236791502)
,p_computation_sequence=>10
,p_computation_item=>'P209_FCHA_INTRES'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select sysdate from dual'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(108230954065134628)
,p_name=>'Selecciona saldos a favor'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(108228206798134601)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108231028823134629)
,p_event_id=>wwv_flow_api.id(108230954065134628)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'obtenerSaldoFavor();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(111095340852692936)
,p_name=>'Nuevo'
,p_event_sequence=>30
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(111091911528692902)
,p_triggering_element=>'VALOR_COMPENSADO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(111095473741692937)
,p_event_id=>wwv_flow_api.id(111095340852692936)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log($(this.triggeringElement).val());',
'',
'$s(''P209_COMPENSACION'', $(this.triggeringElement).val());'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(118295545617394902)
,p_name=>unistr('Guardar_Compensaci\00F3n')
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(104226352839635225)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(118295669415394903)
,p_event_id=>wwv_flow_api.id(118295545617394902)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function fnc_guardarCompensacion(){',
'    try{',
'        ',
'        obtenerCartera();',
'        ',
'        apex.server.process("ajaxGuardarCompensacion",{',
'            f01: window.localStorage.jsonCartera,',
'            pageItems: "#F_CDGO_CLNTE, #P209_ID_SLDO_FVOR_SLCTUD, #P209_COMPENSACION, #P209_JSON_SALDO_FAVOR, #P209_SALDO_FAVOR, #P209_VALOR_X_CMPNSAR"',
'        },{',
'            success: function(data){',
'                if(data.o_cdgo_rspsta != 0){',
'                   console.log(data.o_cdgo_rspsta);',
'                   apex.message.clearErrors();',
'                   apex.message.showErrors ([',
'                       {',
'                           type:       "error",',
'                           location:   "page",',
'                           message:    data.o_mnsje_rspsta,',
'                           unsafe:     false',
'                       }',
'                   ]);',
'                }else{',
unistr('                   apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                   apex.submit();',
'                }',
'            }',
'        })',
'    }catch(e){',
'        console.log(e);',
'    }',
'}',
'',
'',
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de realizar la compensaci\00F3n?", function(okPressed) {'),
'    if(okPressed) {',
'        fnc_guardarCompensacion();',
'    }',
'});',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(124016234245332206)
,p_name=>unistr('Almacena el saldo a favor en sesi\00F3n ')
,p_event_sequence=>60
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(108228206798134601)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(124016395716332207)
,p_event_id=>wwv_flow_api.id(124016234245332206)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P209_ID_SAF,P209_SALDO_FAVOR'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(124016449446332208)
,p_name=>'Refrescar'
,p_event_sequence=>70
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(108228206798134601)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(124016535696332209)
,p_event_id=>wwv_flow_api.id(124016449446332208)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(134288538661382401)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(39555345718795702)
,p_name=>'Desactiva la columna vlor_cmpnscion'
,p_event_sequence=>80
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(111091911528692902)
,p_triggering_element=>'INDCDOR_MVMNTO_BLQDO'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'INDCDOR_MVMNTO_BLQDO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39555426323795703)
,p_event_id=>wwv_flow_api.id(39555345718795702)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'VLOR_CMPNSCION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(63206453625060908)
,p_name=>'Al tener el foco'
,p_event_sequence=>80
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(111091911528692902)
,p_triggering_element=>'VLOR_CMPNSCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusin'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(63206512739060909)
,p_event_id=>wwv_flow_api.id(63206453625060908)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'valor_X_Compensar = validaCompensacion();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(63205772499060901)
,p_name=>'Valida valor compensando'
,p_event_sequence=>90
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(111091911528692902)
,p_triggering_element=>'VLOR_CMPNSCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(63205862888060902)
,p_event_id=>wwv_flow_api.id(63205772499060901)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(''En Valida valor compensando'');',
'var valorCompensacion = Number(this.triggeringElement.value.trim().replace(/\./g, ""));',
'var valor_x_compensacion = Number(valor_X_Compensar)//[0].vlor_x_cmpnsar.trim().replace(/\./g, "").replace(/\$/g, "")) ',
'',
'if (!Number.isInteger(valor_x_compensacion)) {',
'    valor_x_compensacion = 0;',
'}',
'//apex.item("P209_TOTAL_COMPENSA_VIGENCIA2").setValue(valorCompensacion);',
'//apex.item("P209_VLOR_NVO").setValue(valor_x_compensacion);',
'',
'console.log(''valorCompensacion: ''+valorCompensacion);',
'console.log(''valor_x_compensacion: ''+valor_x_compensacion);',
'',
'if(valorCompensacion > valor_x_compensacion ){',
'    console.log("valorCompensacion=>"+valorCompensacion)',
'    //console.log(''Entro al if Valida valor compensando.'');',
'    this.triggeringElement.value = valor_X_Compensar[0].valor_compensacion;',
'    console.log(''ASIGNADO if Valida valor compensando.'');',
'    ',
'    //apex.item("P209_VLOR_NVO2").setValue(valor_x_compensacion)  ;',
'    //validaCompensacion(this.triggeringElement.value);',
'    // validaCompensacion(5000);',
'     ',
'}',
'',
''))
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(63206258168060906)
,p_name=>unistr('Validar compensaci\00F3n')
,p_event_sequence=>100
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(111091911528692902)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(63206377125060907)
,p_event_id=>wwv_flow_api.id(63206258168060906)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validaCompensacion();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(126448119279011303)
,p_name=>'Validar_compensacion'
,p_event_sequence=>120
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(111091911528692902)
,p_triggering_element=>'VLOR_CMPNSCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(126448253000011304)
,p_event_id=>wwv_flow_api.id(126448119279011303)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(''En Validar compensacion'');',
'//var nuevo_valor;',
'var saf = saldo_favor();',
'var valor_total = validaCompensacion_2(Number(this.triggeringElement.value.trim().replace(/\./g, "")));//jga',
'var valor_x_compensacion = Number(valor_X_Compensar)//[0].vlor_x_cmpnsar.trim().replace(/\./g, "").replace(/\$/g, "")) ',
'',
'if (!Number.isInteger(valor_x_compensacion)) {',
'    valor_x_compensacion = 0;',
'}',
'//apex.item("P209_VALIDA_COMPENSA_VIGENCIA3").setValue(valor_total);',
'console.log(''sale de validaCompensacion_2'');',
'',
'var valorCompensacion = Number(this.triggeringElement.value.trim().replace(/\./g, ""));',
'//apex.item("P209_VALOR_NUEVO3").setValue(valorCompensacion);',
'console.log(''valorCompensacion=>''+valorCompensacion);',
'',
'if(valor_total >= saf ){//jga    ',
'    this.triggeringElement.value = valor_X_Compensar[0].valor_compensacion;',
'    //apex.item("P209_VALOR_NUEVO_FIJO3").setValue(valor_X_Compensar[0].valor_compensacion);',
'}',
'',
'if ( valorCompensacion===0)',
'    this.triggeringElement.value =0;',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(135036257449090705)
,p_name=>'Calcula valor distribuido'
,p_event_sequence=>130
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(108228206798134601)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(135036371480090706)
,p_event_id=>wwv_flow_api.id(135036257449090705)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select sum(r.vlor_dstrbdo) into :P209_TTAL_DSTRBIDO ',
'    from v_gf_g_cartera_x_concepto a',
'    left join (select b.id_mvmnto_fncro',
'                       ,b.vgncia',
'                       ,b.id_cncpto',
'                       ,b.id_sld_fvr_cmpnscion',
'                       ,sum(b.vlor_cmpnscion) + (select nvl(sum(z.vlor_cmpnscion), 0) ',
'                                                 from gf_g_sldos_fvr_cmpnscn_dtll z',
'                                                 where z.id_mvmnto_fncro = b.id_mvmnto_fncro',
'                                                 and   z.vgncia = b.vgncia',
'                                                 and   z.id_cncpto_rlcnal = b.id_cncpto',
'                                                 and   z.id_sld_fvr_cmpnscion = b.id_sld_fvr_cmpnscion) as vlor_cmpnscion',
'                from gf_g_saldos_favor_cmpnscion a',
'                join gf_g_sldos_fvr_cmpnscn_dtll b on a.id_sld_fvr_cmpnscion = b.id_sld_fvr_cmpnscion',
'                where id_sldo_fvor_slctud = :P209_ID_SLDO_FVOR_SLCTUD',
'                and b.id_sjto_impsto      = nvl(:P209_ID_SJTO_IMPSTO, :P209_SJTO_IMPSTO) ',
'                and b.indcdor_cncpto = ''C'' ',
'                group by b.id_mvmnto_fncro, b.vgncia, b.id_cncpto, b.id_sld_fvr_cmpnscion',
'                order by b.vgncia ) b on a.id_mvmnto_fncro = b.id_mvmnto_fncro  and',
'                                         a.vgncia          = b.vgncia         and',
'                                         a.id_cncpto = b.id_cncpto                                     ',
'    left join ( select sum(vlor_hber) vlor_dstrbdo, id_impsto_sbmpsto , vgncia, id_cncpto',
'           from table(pkg_gf_saldos_favor.prc_ap_sldo_fvor_prprcnal( p_cdgo_clnte        => :F_CDGO_CLNTE ,',
'                                                                     p_id_impsto         => :P209_ID_IMPSTO , ',
'                                                                     p_id_sjto_impsto    => nvl(:P209_ID_SJTO_IMPSTO, :P209_SJTO_IMPSTO) ,',
'                                                                     p_fcha_vncmnto      => sysdate ,',
'                                                                     p_vlor_sldo_fvor    => :P209_SALDO_FAVOR',
'                                                                   ) )',
'            group by id_impsto_sbmpsto , vgncia, id_cncpto ) r on r.id_impsto_sbmpsto = a.id_impsto_sbmpsto ',
'                                                              and r.vgncia = a.vgncia and r.id_cncpto = a.id_cncpto            ',
'',
'',
'    where a.id_sjto_impsto = nvl(:P209_ID_SJTO_IMPSTO, :P209_SJTO_IMPSTO)',
'    and a.cdgo_mvnt_fncro_estdo = ''NO''',
'    and a.vlor_sldo_cptal + a.vlor_intres > 0',
'    and ( a.vlor_sldo_cptal + a.vlor_intres ) - nvl( b.vlor_cmpnscion , 0 ) > 0',
'    order by  a.vgncia  , a.id_prdo   , a.id_cncpto',
'    ;',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(208718440243661030)
,p_name=>unistr('Validar compensaci\00F3n1')
,p_event_sequence=>150
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(208715588114661001)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(208718516713661031)
,p_event_id=>wwv_flow_api.id(208718440243661030)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validaCompensacion();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(208753664448999801)
,p_name=>'Al tener el foco1'
,p_event_sequence=>160
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(208715588114661001)
,p_triggering_element=>'VLOR_CMPNSCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusin'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(208753748911999802)
,p_event_id=>wwv_flow_api.id(208753664448999801)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'valor_X_Compensar = validaCompensacion();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(208753844409999803)
,p_name=>'Valida valor compensando1'
,p_event_sequence=>170
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(208715588114661001)
,p_triggering_element=>'VLOR_CMPNSCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(208753930526999804)
,p_event_id=>wwv_flow_api.id(208753844409999803)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var valorCompensacion = Number(this.triggeringElement.value.trim().replace(/\./g, ""));',
'var valor_x_compensacion = Number(valor_X_Compensar[0].vlor_x_cmpnsar.trim().replace(/\./g, "").replace(/\$/g, "")) ',
'',
'if(valorCompensacion > valor_x_compensacion ){',
'    this.triggeringElement.value = valor_X_Compensar[0].valor_compensacion;',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(208754037428999805)
,p_name=>'Desactiva la columna vlor_cmpnscion|'
,p_event_sequence=>180
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(208715588114661001)
,p_triggering_element=>'INDCDOR_MVMNTO_BLQDO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(208754123376999806)
,p_event_id=>wwv_flow_api.id(208754037428999805)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'VLOR_CMPNSCION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(211904577324655607)
,p_name=>'Al_seleccionar_fecha'
,p_event_sequence=>190
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P209_FCHA_INTRES'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(211904667439655608)
,p_event_id=>wwv_flow_api.id(211904577324655607)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P209_FCHA_INTRES'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(211904762814655609)
,p_event_id=>wwv_flow_api.id(211904577324655607)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_vlor_intres    number;',
'begin',
'	',
'    insert into muerto (n_001 , v_001, v_002, t_001) values ( 1 , ''P209_FCHA_INTRES'' , :P209_FCHA_INTRES , systimestamp); commit;',
'    ',
'	for reg in ( select * from gf_g_crtra_fcha_pryccion ',
'                 where id_sldo_fvor_slctud = :P209_ID_SLDO_FVOR_SLCTUD ',
'                 and   id_sjto_impsto = nvl(:P209_ID_SJTO_IMPSTO, :P209_SJTO_IMPSTO)',
'               )',
'	loop	',
'	   ',
'		v_vlor_intres := pkg_gf_movimientos_financiero.fnc_cl_interes_mora (  p_cdgo_clnte         => :F_CDGO_CLNTE,',
'																			  p_id_impsto          => reg.id_impsto,',
'																			  p_id_impsto_sbmpsto  => reg.id_impsto_sbmpsto,',
'																			  p_vgncia             => reg.vgncia,',
'																			  p_id_prdo            => reg.id_prdo,',
'																			  p_id_cncpto          => reg.id_cncpto,',
'																			  p_cdgo_mvmnto_orgn   => reg.cdgo_mvmnto_orgn,',
'																			  p_id_orgen           => reg.id_orgen,',
'																			  p_vlor_cptal         => reg.vlor_sldo_cptal,',
'																			  p_indcdor_clclo      => ''CLD'',',
'																			  p_fcha_pryccion      => :P209_FCHA_INTRES );',
'		',
'        --insert into muerto (n_001 , v_001, v_002, t_001) values ( 1 , ''concepto: '' ||reg.id_cncpto , v_vlor_intres , systimestamp); commit;',
'        ',
'		update 	gf_g_crtra_fcha_pryccion ',
'		set		vlor_intres             = v_vlor_intres ,',
'                saldo_interes_oculto    = v_vlor_intres ,',
'                total 					= reg.vlor_sldo_cptal + v_vlor_intres , ',
'				total_oculto 			= reg.vlor_sldo_cptal + v_vlor_intres ,  ',
'				vlor_x_cmpnsar 			= reg.vlor_sldo_cptal + v_vlor_intres ,',
'				vlor_x_cmpnsar_oculto	= reg.vlor_sldo_cptal + v_vlor_intres   ',
'		where 	id_sldo_fvor_slctud 	= :P209_ID_SLDO_FVOR_SLCTUD',
'        and     id_sjto_impsto          = nvl(:P209_ID_SJTO_IMPSTO, :P209_SJTO_IMPSTO) ',
'		and		id_fcha_crt_fch_pry     = reg.id_fcha_crt_fch_pry ;',
'		',
'	end loop;',
'	commit;',
'    ',
'end;',
''))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(211904980055655611)
,p_event_id=>wwv_flow_api.id(211904577324655607)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('// si es distribuci\00F3n por Vigencia antigua'),
'if ( apex.item("P209_INDCDOR_DSTRBCION").getValue() === ''A'' ) {',
'    console.log("Vigencia antigua");',
'    //apex.region(''cartera1'').refresh();',
'    apex.submit();',
'}else{',
unistr('    // si es distribuci\00F3n por vigencia puntual'),
'    if( apex.item("P209_INDCDOR_DSTRBCION").getValue() === ''V'' ) {',
'        console.log("Vigencia puntual");',
'        apex.region(''cartera'').refresh();',
'    }',
'    else{',
unistr('        // si es distribuci\00F3n proporcional'),
'        console.log("Vigencia proporcional");',
'        apex.region(''cartera2'').refresh();',
'    }',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(211945638396542706)
,p_name=>'al hacer clic'
,p_event_sequence=>210
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(211945263491542702)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(211962029918368901)
,p_event_id=>wwv_flow_api.id(211945638396542706)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var v_vlor_ttal_sf = parseInt(apex.item("P209_SALDO_FAVOR").getValue()) ;',
'console.log(''v_vlor_ttal_sf: ''+v_vlor_ttal_sf);',
'',
'var v_vlor_vgncias = parseInt(apex.item("P209_VLOR_CMPNSAR_VGNCIA").getValue());',
'//val = val.replace(/,/g, ":")',
'',
'console.log(''v_vlor_vgncias: ''+v_vlor_vgncias);',
'',
'if ( v_vlor_vgncias > v_vlor_ttal_sf ){',
'    apex.message.showErrors([',
'        {',
'            type: "error",',
'            location: [ "page" ],',
'            pageItem: "P209_VLOR_CMPNSAR_VGNCIA",',
'            message: "Valor a compensar debe ser menor o igual al Saldo a Favor",',
'            unsafe: false',
'        }',
'    ]);',
'}',
'// else{  console.log(''se asigna : ''+apex.item("P209_VLOR_CMPNSAR_VGNCIA").getValue()); }',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(211962104639368902)
,p_event_id=>wwv_flow_api.id(211945638396542706)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P209_VLOR_CMPNSAR_VGNCIA,P209_VGNCIAS_COMPENSAR'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(211945747772542707)
,p_event_id=>wwv_flow_api.id(211945638396542706)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(134288538661382401)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(141319129486574507)
,p_name=>'Al cambiar valor'
,p_event_sequence=>220
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P209_VLOR_CMPNSAR_VGNCIA_2'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(141319373614574509)
,p_event_id=>wwv_flow_api.id(141319129486574507)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P209_VLOR_CMPNSAR_VGNCIA_2'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(142236772607383501)
,p_name=>unistr('al cargar la p\00E1gina')
,p_event_sequence=>230
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(142236851252383502)
,p_event_id=>wwv_flow_api.id(142236772607383501)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    :P209_VGNCIAS_COMPENSAR := null;',
'    :P209_VLOR_CMPNSAR_VGNCIA_2 := null;',
'    :P209_VLOR_CMPNSAR_VGNCIA := null;',
'end;'))
,p_attribute_02=>'P209_VLOR_CMPNSAR_VGNCIA_2,P209_VLOR_CMPNSAR_VGNCIA,P209_VGNCIAS_COMPENSAR'
,p_attribute_03=>'P209_VLOR_CMPNSAR_VGNCIA_2,P209_VLOR_CMPNSAR_VGNCIA,P209_VGNCIAS_COMPENSAR'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(112757413402754004)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Elimina un detalle de la compensacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_compensacion  number;',
'   v_id_sldo_fvor  number;',
'   v_error         exception;',
'begin',
'',
'    begin',
'        select id_sldo_fvor ',
'        into   v_id_sldo_fvor',
'        from gf_g_sldos_fvr_dvlcion_dtll',
'        where id_sldo_fvor = :P209_ID_SLDOS_FVR',
'        and id_sldo_fvor_dvlcion= (select id_sldo_fvor_dvlcion ',
'                                   from gf_g_saldos_favor_devlucion',
'                                   where id_sldo_fvor_slctud = :P209_ID_SLDO_FVOR_SLCTUD)',
'        group by id_sldo_fvor;',
'    exception',
'        when others then',
'            null;',
'    end;',
'    ',
'    if v_id_sldo_fvor is not null then',
unistr('       --raise_application_error(-20008, ''Para eliminar la compensaci\00F3n debe eliminar el saldo a favor '' || :P209_ID_SLDOS_FVR || '' de la devoluci\00F3n'');'),
'        apex_error.add_error (',
'        p_message          => ''Invalid Customer ID!'',',
'        p_display_location =>  apex_error.c_inline_with_field_and_notif',
'        );',
'        return;',
'    end if;',
'    ',
'    ',
'    ',
unistr('     --Elimina el detalle compensaci\00F3n detalle'),
'    begin',
'        delete from gf_g_sldos_fvr_cmpnscn_dtll ',
'        where id_impsto  = :P209_ID_IMPSTO ',
'        and   id_impsto_sbmpsto     = :P209_ID_IMPSTO_SBMPSTO ',
'        and   id_sjto_impsto = :P209_ID_SJTO_IMPSTO_C ',
'        and   vgncia  = :P209_VGNCIA ',
'        and   id_prdo = :P209_ID_PRDO ',
'        and   id_sldo_fvor = :P209_ID_SLDOS_FVR;',
'    exception',
'        when others then',
'            raise v_error;',
'    end;',
'    ',
unistr('     --Elimina la compensaci\00F3n si no tiene detalle'),
'    begin',
'        select count(a.id_sld_fvr_cmpnscion) ',
'        into v_compensacion',
'        from gf_g_saldos_favor_cmpnscion a',
'        join gf_g_sldos_fvr_cmpnscn_dtll b on a.id_sld_fvr_cmpnscion = b.id_sld_fvr_cmpnscion',
'        where a.id_sldo_fvor_slctud = :P209_ID_SLDO_FVOR_SLCTUD; ',
'        ',
'        if(v_compensacion = 0) then',
'            delete from gf_g_saldos_favor_cmpnscion a',
'            where a.id_sldo_fvor_slctud = :P209_ID_SLDO_FVOR_SLCTUD;',
'            commit;',
'        end if;',
'    exception',
'        when others then',
'            raise v_error;',
'    end;',
'    ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Eliminar'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>unistr('Se elimino la compensaci\00F3n correctamente')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(115223261227456501)
,p_process_sequence=>40
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consulta la definici\00F3n de cliente')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte => :F_CDGO_CLNTE, p_cdgo_dfncion_clnte_ctgria => ''SAF'', p_cdgo_dfncion_clnte => ''CSA'') ',
'    into :P209_DEFINICION',
'    from dual;',
'    ',
'    select pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte => :F_CDGO_CLNTE, p_cdgo_dfncion_clnte_ctgria => ''SAF'', p_cdgo_dfncion_clnte => ''OCD'') ',
'    into :P209_ORDENAMIENTO',
'    from dual;',
'    ',
'    select pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte => :F_CDGO_CLNTE, p_cdgo_dfncion_clnte_ctgria => ''SAF'', p_cdgo_dfncion_clnte => ''COA'') ',
'    into :P209_CMPNSCIONAUTMTCA',
'     from dual;',
'     ',
'    select  id_impsto',
'    into    :P209_ID_IMPSTO',
'    from    si_i_sujetos_impuesto where id_sjto_impsto = :P209_SJTO_IMPSTO;',
'    ',
'    begin',
'        -- responsable principal',
'        select  idntfccion , ',
'                nvl2(a.sgndo_nmbre, a.prmer_nmbre || '' '' || a.sgndo_nmbre, a.prmer_nmbre)',
'                || '' '' || nvl2(a.sgndo_aplldo, a.prmer_aplldo || '' '' || a.sgndo_aplldo, a.prmer_aplldo)',
'        into    :P209_IDNTFCCION_RSPNSBLE , :P209_NMBRE_RSPNSBLE',
'        from    si_i_sujetos_responsable a',
'        where   id_sjto_impsto = :P209_SJTO_IMPSTO and prncpal_s_n = ''S''',
'         fetch first 1 row only;',
'    exception',
'        when others then',
unistr('            raise_application_error(-20001, ''No se encontr\00F3 responsable principal'');'),
'    end;',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(28772055989558316)
,p_process_sequence=>50
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Crea coleccion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''COMPENSACION'');',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(211904891654655610)
,p_process_sequence=>60
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta Cartera'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'begin',
'',
'    delete from gf_g_crtra_fcha_pryccion ',
'    where id_sldo_fvor_slctud = :P209_ID_SLDO_FVOR_SLCTUD',
'    and   id_sjto_impsto = nvl(:P209_ID_SJTO_IMPSTO, :P209_SJTO_IMPSTO) ;',
'',
'    insert into gf_g_crtra_fcha_pryccion  ',
'    select  rownum',
'            , :P209_ID_SLDO_FVOR_SLCTUD',
'            , a.id_mvmnto_fncro',
'            , a.id_impsto',
'            , a.id_impsto_sbmpsto',
'            , a.id_sjto_impsto',
'            , a.vgncia',
'            , a.prdo',
'            , a.id_prdo',
'            , a.id_cncpto',
'            , a.dscrpcion_cncpto',
'            , a.vlor_sldo_cptal',
'            , a.vlor_sldo_cptal  saldo_capital_oculto',
'            , a.vlor_intres',
'            , a.vlor_intres  saldo_interes_oculto',
'            , a.cdgo_mvnt_fncro_estdo',
'            , a.dscrpcion_mvnt_fncro_estdo',
'            , a.vlor_sldo_cptal + a.vlor_intres  total',
'            , a.vlor_sldo_cptal + a.vlor_intres  total_oculto',
'            , 0 vlor_cmpnscion',
'            , ( a.vlor_sldo_cptal + a.vlor_intres )  vlor_x_cmpnsar',
'            , ( a.vlor_sldo_cptal + a.vlor_intres )  vlor_x_cmpnsar_oculto',
'            , case when a.indcdor_mvmnto_blqdo = ''S'' then ''Bloqueada'' else ''Normal'' end estdo',
'            , a.indcdor_mvmnto_blqdo',
'            , a.cdgo_mvmnto_orgn , a.id_orgen , a.cdgo_clnte , fcha_vncmnto , id_impsto_acto_cncpto , cdgo_prdcdad , cdgo_cncpto -- req. 0023663',
'    from v_gf_g_cartera_x_concepto a',
'    where a.id_sjto_impsto = nvl(:P209_ID_SJTO_IMPSTO, :P209_SJTO_IMPSTO)  --3357386',
'    and a.cdgo_mvnt_fncro_estdo = ''NO''',
'    and a.vlor_sldo_cptal + a.vlor_intres > 0 ;',
'    ',
'    commit;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from gf_g_crtra_fcha_pryccion where id_sldo_fvor_slctud = :P209_ID_SLDO_FVOR_SLCTUD',
'and   id_sjto_impsto = nvl(:P209_ID_SJTO_IMPSTO, :P209_SJTO_IMPSTO) ; '))
,p_process_when_type=>'NOT_EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(141221177616239301)
,p_process_sequence=>70
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Valida disponible del saldo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_sldo_fvor_dspnble    number;',
'begin',
'    select sldo_fvor_dspnble into v_sldo_fvor_dspnble',
'    from   v_gf_g_saldos_favor where id_sldo_fvor = :P209_ID_SAF ;',
'    ',
'    if v_sldo_fvor_dspnble = 0 then',
'       :P209_SALDO_FAVOR := 0;',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P209_INDCDOR_DSTRBCION'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'P'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(204508326276979545)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Configuraci\00F3n General')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  indcdor_dstrbcion , indcdor_fcha_intres ',
'    into    :P209_INDCDOR_DSTRBCION , :P209_INDCDOR_FCHA_INTRES',
'    from    gi_d_saldos_favor_cnfgrcion a',
'    where   cdgo_clnte = :F_CDGO_CLNTE  ;',
'exception',
'    when others then',
unistr('        raise_application_error(-20001, ''No se encontr\00F3 CONFICURACION GENERAL'');'),
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(118295830604394905)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajaxGuardarCompensacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(1000);',
'    v_cartera         clob;',
'    v_exception       exception;',
'    v_vlor_cmpensar   number;',
'begin',
'',
'    for i in 1..apex_application.g_f01.count loop',
'        v_cartera := v_cartera || apex_application.g_f01(i);',
'    end loop;',
'',
'',
'    select sldo_fvor_dspnble into :P209_SALDO_FAVOR',
'    from   v_gf_g_saldos_favor where id_sldo_fvor = :P209_ID_SAF ;',
'    ',
'    insert into muerto (n_001, v_001, v_002 , t_001) values (1 , ''P209_SALDO_FAVOR1'' , :P209_SALDO_FAVOR, systimestamp ); commit;',
'    ',
'    ',
'    if(to_number(:P209_COMPENSACION) > to_number(:P209_SALDO_FAVOR) ) then',
'        v_cdgo_rspsta := 1;',
unistr('        v_mnsje_rspsta := ''El valor de la compensaci\00F3n no puede ser mayor que el valor del saldo a favor'';'),
'    elsif(not to_number(:P209_COMPENSACION) > 0) then',
'        v_cdgo_rspsta := 3;',
unistr('        v_mnsje_rspsta := ''El valor de la compensaci\00F3n debe ser mayor a cero'';'),
'    elsif(to_number(:P209_COMPENSACION) > to_number(:P209_VALOR_X_CMPNSAR) ) then',
'        v_cdgo_rspsta := 2;',
unistr('        v_mnsje_rspsta := ''El valor de la compensaci\00F3n no puede ser mayor al total de la deuda'';'),
'    else',
'       -- Se valida el valor a comepnsar',
'       select decode(:P209_VLOR_CMPNSAR_VGNCIA , 0 , :P209_SALDO_FAVOR , :P209_VLOR_CMPNSAR_VGNCIA ) ',
'       into   v_vlor_cmpensar',
'       from   dual ;',
'        ',
'       pkg_gf_saldos_favor.prc_rg_saldos_favor_cmpnscion(p_cdgo_clnte            => :F_CDGO_CLNTE,',
'                                                          p_id_sldo_fvor_slctud   => :P209_ID_SLDO_FVOR_SLCTUD,',
'                                                          p_json_cartera          => v_cartera,',
'										                  p_id_sldo_fvor	      => :P209_ID_SAF,',
'                                                          p_vlor_sldo_fvor        => v_vlor_cmpensar, -- :P209_SALDO_FAVOR',
'                                                          o_cdgo_rspsta           => v_cdgo_rspsta,',
'                                                          o_mnsje_rspsta          => v_mnsje_rspsta) ;',
'                                                          ',
'       --insert into muerto (c_001) values (v_cartera);',
'        ',
'       if v_cdgo_rspsta > 0 then',
'           raise v_exception;',
'       end if;',
'',
'    end if;',
'    ',
'',
'    select sldo_fvor_dspnble into :P209_SALDO_FAVOR',
'    from   v_gf_g_saldos_favor where id_sldo_fvor = :P209_ID_SAF ;',
'    ',
'    insert into muerto (n_001, v_001, v_002 , t_001) values (1 , ''P209_SALDO_FAVOR1'' , :P209_SALDO_FAVOR, systimestamp ); commit;',
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
'        apex_json.close_object;   ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(104226352839635225)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(141498420400791501)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'validaDisponibleSF'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(1000); ',
'    v_exception       exception;',
'    v_vlor_sldo_dspnble   number;',
'begin',
'',
'    select sldo_fvor_dspnble into v_vlor_sldo_dspnble',
'    from   v_gf_g_saldos_favor where id_sldo_fvor = :P209_ID_SAF ;',
'    ',
'    insert into muerto (n_001, v_001, v_002 , t_001) values (1 , ''v_vlor_sldo_dspnble ajax'' , v_vlor_sldo_dspnble, systimestamp ); commit;',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.write(''o_vlor_sldo_dspnble'', v_vlor_sldo_dspnble);',
'    apex_json.close_object;',
'',
'exception',
'    when v_exception then',
'        rollback;',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.write(''o_vlor_sldo_dspnble'', 0);',
'        apex_json.close_object;   ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
