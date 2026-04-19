prompt --application/pages/page_20250_006
begin
wwv_flow_api.create_page(
 p_id=>2025039
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Consignar y Compensar T\00EDtulos Judiciales')
,p_step_title=>unistr('Consignar y Compensar T\00EDtulos Judiciales')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/accounting.min.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function seleccionCarteraCompensar(staticId) {',
'    console.log(''INICIA seleccionCarteraCompensar'');',
'',
'    if (!apex.region(staticId)) {',
unistr('        console.error("No existe la regi\00F3n con Static ID: " + staticId);'),
'        return;',
'    }',
'',
'    var crtra_slccnda = 0;',
'    var ttl_cartera_slccnda = 0;',
'    var valor_titulo = 0;',
'    var vlor_rmnnte = 0;',
'    var valorTotalAplicar = 0;',
'    var table;',
'    var valor_aplicar_final = 0;',
'    var v_vlor_dscnto_aplcar = 0;',
'    var vlor_ttal_aplccion = 0;',
'    var valorTotalAplicacion = 0;',
'',
'    valor_titulo = $v("P2025039_VLOR_TTLOS").replace(/\$|\.+/g, '''');',
'    console.log(''valor titulo: '' + valor_titulo);',
'',
'    apex.item("P2025039_SLDO_RMNTE").setValue("$" + valor_titulo.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'    console.log(''Saldo remanente inicial: '' + apex.item("P2025039_SLDO_RMNTE").getValue());',
'    apex.item("P2025039_VLOR_RMNNTE_TMP").setValue(valor_titulo);',
'',
'    var view = apex.region(staticId).widget().interactiveGrid("getViews", "grid");',
'    var model = view.model;',
'    var records = view.view$.grid("getSelectedRecords");',
'',
'    model.forEach(function (dato) {',
'        crtra_slccnda = parseInt(model.getValue(dato, "VLOR_TTAL_APLCAR").replace(/\$|\.+/g, ''''));',
'        if (!isNaN(crtra_slccnda)) {',
'            ttl_cartera_slccnda += crtra_slccnda;',
'        }',
'',
'    });',
'    console.log(''ttl_cartera_slccnda model: '' + ttl_cartera_slccnda);',
'    apex.item("P2025039_VLOR_SLCCNDO").setValue("$" + ttl_cartera_slccnda.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'',
'',
'    records.map((data) => {',
'        console.log(data)',
'        valorTotalAplicar = parseInt(model.getValue(data, "VLOR_TTAL_OCULTO"));',
'        console.log(''Valor seleccionado a aplicar: '' + valorTotalAplicar);',
'',
'        valorTotalAplicacion = parseInt(model.getValue(data, "VLOR_TTAL_APLCCION").replace(/\$|\.+/g, ''''));',
'',
'        if (Number(valorTotalAplicar) > 0 && Number(valorTotalAplicacion) < Number(valorTotalAplicar)) {',
'',
'            valorTotalAplicacion = valorTotalAplicar;',
'            console.log(''valor_titulo 2: '' + valor_titulo);',
'            console.log(''ttl_cartera_slccnda 2: '' + ttl_cartera_slccnda);',
'            console.log(''remanente de titulo 2: '' + vlor_rmnnte);',
'',
'            valor_aplicar_final = valor_titulo - ttl_cartera_slccnda;',
'',
'            console.log(''Valor_titulo: '' + Number(valor_titulo));',
'            console.log(''ttl_cartera_slccnda: '' + Number(ttl_cartera_slccnda));',
'            console.log(''Valor aplicar despues de restar: '' + valor_aplicar_final);',
'            console.log(''valorTotalAplicar: '' + valorTotalAplicar);',
'',
'            v_vlor_dscnto_aplcar = parseInt(model.getValue(data, "VLOR_DSCNTO_OCLTO"));',
'            console.log(''Valor descuento a aplicar: '' + v_vlor_dscnto_aplcar);',
'',
'            if (Number(valor_titulo) >= Number(ttl_cartera_slccnda) && Number(valor_aplicar_final) >= Number(valorTotalAplicar)) {',
'                console.log(''entreif 1: '' + valorTotalAplicar);',
'                model.setValue(data, "VLOR_TTAL_APLCAR", formatoNumero(valorTotalAplicar, { decimal: '','', thousand: ''.'', precision: 0 }));',
'',
'                model.setValue(data, "VLOR_TTAL_APLCCION", "" + formatoNumero(valorTotalAplicar, { decimal: '','', thousand: ''.'', precision: 0 }));',
'',
'                model.setValue(data, "VLOR_DSCNTO_APLCCION", "$" + formatoNumero(v_vlor_dscnto_aplcar, { decimal: '','', thousand: ''.'', precision: 0 }));',
'',
'                ttl_cartera_slccnda += valorTotalAplicar;',
'                apex.item("P2025039_VLOR_SLCCNDO").setValue("$" + ttl_cartera_slccnda.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'',
'            } else if (valorTotalAplicar == ttl_cartera_slccnda && Number(valor_titulo) >= Number(ttl_cartera_slccnda)) {',
'                console.log(''entre if 2: '' + valorTotalAplicar);',
'                model.setValue(data, "VLOR_TTAL_APLCAR", formatoNumero(valorTotalAplicar, { decimal: '','', thousand: ''.'', precision: 0 }));',
'',
'                model.setValue(data, "VLOR_TTAL_APLCCION", "" + formatoNumero(valorTotalAplicar, { decimal: '','', thousand: ''.'', precision: 0 }));',
'',
'                model.setValue(data, "VLOR_DSCNTO_APLCCION", "$" + formatoNumero(v_vlor_dscnto_aplcar, { decimal: '','', thousand: ''.'', precision: 0 }));',
'',
'                ttl_cartera_slccnda += valorTotalAplicar;',
'                apex.item("P2025039_VLOR_SLCCNDO").setValue("$" + ttl_cartera_slccnda.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'',
'            } else if (Number(valor_aplicar_final) > 0 && Number(valor_aplicar_final) <= Number(valorTotalAplicar)) {',
'                console.log(''entre if 3 - valor_aplicar_final: '' + valor_aplicar_final);',
'                model.setValue(data, "VLOR_TTAL_APLCAR", formatoNumero(valor_aplicar_final, { decimal: '','', thousand: ''.'', precision: 0 }));',
'',
'                if (Number(valor_aplicar_final) < Number(valorTotalAplicar)) {',
'                    // Se valida si hay descuento. ',
'                    // Si hay, se le suma el descuento al valor total y el descuento queda en cero(0)',
'                    if (Number(v_vlor_dscnto_aplcar) > 0) {',
'                        console.log(''Docuemnto de abono'');',
'                        vlor_ttal_aplccion = valorTotalAplicar + v_vlor_dscnto_aplcar;',
'',
'                        model.setValue(data, "VLOR_TTAL_APLCCION", "" + formatoNumero(vlor_ttal_aplccion, { decimal: '','', thousand: ''.'', precision: 0 }));',
'                    } else {',
'                        console.log(''Documento de abono descuento 0'');',
'                        model.setValue(data, "VLOR_TTAL_APLCCION", "" + formatoNumero(valorTotalAplicar, { decimal: '','', thousand: ''.'', precision: 0 }));',
'                    }',
'                    model.setValue(data, "VLOR_DSCNTO_APLCCION", "$" + 0);',
'                    // Tipo de documento de abono',
'                    model.setValue(data, "TPO_DCMNTO", ''DAB'');',
'                } else {',
'                    console.log(''Documento normal'');',
'                    model.setValue(data, "VLOR_TTAL_APLCCION", "" + formatoNumero(valorTotalAplicar, { decimal: '','', thousand: ''.'', precision: 0 }));',
'                    model.setValue(data, "VLOR_DSCNTO_APLCCION", "$" + formatoNumero(v_vlor_dscnto_aplcar, { decimal: '','', thousand: ''.'', precision: 0 }));',
'                }',
'',
'                ttl_cartera_slccnda += valor_aplicar_final;',
'                apex.item("P2025039_VLOR_SLCCNDO").setValue("$" + ttl_cartera_slccnda.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'            }',
'',
'            vlor_rmnnte = valor_titulo - ttl_cartera_slccnda;',
'            if (Number(vlor_rmnnte) < 0) {',
'                vlor_rmnnte = 0;',
'            }',
'            apex.item("P2025039_SLDO_RMNTE").setValue("$" + vlor_rmnnte.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'            apex.item("P2025039_VLOR_RMNNTE_TMP").setValue(vlor_rmnnte);',
'',
'            // FIN NUEVO    ',
'        }',
'    })',
'',
'',
'    //buildJsonCartera',
' /*   var region = apex.region(staticId);',
'',
'    if (region) {',
'',
'        var view = apex.region(staticId).widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'',
'        var json = records.map((cartera) => {',
'            return {',
'                "ID_IMPSTO": model.getValue(cartera, "ID_IMPSTO"),',
'                "ID_IMPSTO_SBMPSTO": model.getValue(cartera, "ID_IMPSTO_SBMPSTO"),',
'                "ID_SJTO_IMPSTO": model.getValue(cartera, "ID_SJTO_IMPSTO"),',
'                "ID_SJTO_RSPNSBLE": model.getValue(cartera, "ID_SJTO_RSPNSBLE"),',
'                "VGNCIA": model.getValue(cartera, "VGNCIA"),',
'                "ID_PRDO": model.getValue(cartera, "ID_PRDO"),',
'                "CNSCTVO_EMBRGO": model.getValue(cartera, "CNSCTVO_EMBRGO"),',
'                "VLOR_TTAL": model.getValue(cartera, "VLOR_TTAL"),',
'                "VLOR_DSCNTO": model.getValue(cartera, "VLOR_DSCNTO"),',
'                "VLOR_TTAL_APLCAR": model.getValue(cartera, "VLOR_TTAL_APLCAR"),',
'                "VLOR_TTAL_APLCCION": model.getValue(cartera, "VLOR_TTAL_APLCCION"),',
'                "VLOR_DSCNTO_APLCCION": model.getValue(cartera, "VLOR_DSCNTO_APLCCION"),',
'                "TPO_DCMNTO": model.getValue(cartera, "TPO_DCMNTO"),',
'                "CDGO_MVMNTO_ORGN": model.getValue(cartera, "CDGO_MVMNTO_ORGN"),',
'                "ID_ORGEN": model.getValue(cartera, "ID_ORGEN")',
'            };',
'        });',
'',
'      //  $s(''P2025039_JSON_CRTRAS_2'', JSON.stringify(json));',
'        localStorage.setItem(''JSON_CRTRAS_'' + staticId, JSON.stringify(json));',
'        console.log(''json_cartera '' + staticId+'':'' + JSON.stringify(json));',
'    };*/',
'    //end buildJsonCartera',
'    saldoTitulos(staticId);',
'};',
'',
'function saldoTitulos(region) {',
'',
'    var v_vlor_ttlos = 0;',
'    var v_vlor_sldo_rmnte = 0;',
'    var v_vlor_ttal_slccndo = 0;',
'',
'    if (region == ''cartera2'') {',
'',
'        v_vlor_ttlos = $v("P2025039_SLDO_RMNTE").replace(/\$|\.+/g, '''');',
'        v_vlor_ttal_slccndo = $v("P2025039_VLOR_SLCCNDO").replace(/\$|\.+/g, '''');',
'',
'        v_vlor_sldo_rmnte = v_vlor_ttlos - v_vlor_ttal_slccndo;',
'        if (v_vlor_sldo_rmnte < 0) {',
'            v_vlor_sldo_rmnte = 0;',
'        }',
'        apex.item("P2025039_VLOR_RMNNTE").setValue("$" + v_vlor_sldo_rmnte.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'    }',
'    else if (region == ''Cartera'') {',
'        v_vlor_ttlos = $v("P2025039_VLOR_TTLOS").replace(/\$|\.+/g, '''');',
'        v_vlor_ttal_slccndo = $v("P2025039_VLOR_SLCCNDO").replace(/\$|\.+/g, '''');',
'',
'        v_vlor_sldo_rmnte = v_vlor_ttlos - v_vlor_ttal_slccndo;',
'        if (v_vlor_sldo_rmnte < 0) {',
'            v_vlor_sldo_rmnte = 0;',
'        }',
'        apex.item("P2025039_SLDO_RMNTE").setValue("$" + v_vlor_sldo_rmnte.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'    }',
'}',
'function obtenerCartera(staticId) {',
'',
'    var region = apex.region(staticId);',
'',
'    if (region) {',
'',
'        var view = apex.region(staticId).widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'',
'        var records = model._data.filter(function (record) {',
'            return model.getValue(record, "VLOR_TTAL_APLCAR").trim().replace(/\./g, "") > 0',
'        });',
'',
'        //Obtenemos un json con los datos seleccionados que no han sido procesados',
'        var jsonCartera = records.map((cartera) => {',
'            return {',
'                "ID_IMPSTO":            model.getValue(cartera, "ID_IMPSTO"),',
'                "ID_IMPSTO_SBMPSTO":    model.getValue(cartera, "ID_IMPSTO_SBMPSTO"),',
'                "ID_SJTO_IMPSTO":       model.getValue(cartera, "ID_SJTO_IMPSTO"),',
'                "VGNCIA":               model.getValue(cartera, "VGNCIA"),',
'                "PRDO":                 model.getValue(cartera, "PRDO"),',
'                "ID_PRDO":              model.getValue(cartera, "ID_PRDO"),',
'                "CNSCTVO_EMBRGO":       model.getValue(cartera, "CNSCTVO_EMBRGO"),',
'                "VLOR_SLDO_CPTAL":      model.getValue(cartera, "VLOR_SLDO_CPTAL").trim().replace(/\./g, "").replace(''$'', ''''),',
'                "VLOR_SLDO_INTRES":     model.getValue(cartera, "VLOR_SLDO_INTRES").trim().replace(/\./g, "").replace(''$'', ''''),',
'                "VLOR_TTAL":            model.getValue(cartera, "VLOR_TTAL").trim().replace(/\./g, "").replace(''$'', ''''),',
'                "VLOR_DSCNTO":          model.getValue(cartera, "VLOR_DSCNTO").trim().replace(/\./g, "").replace(''$'', ''''),',
'                "VLOR_TTAL_APLCAR":     model.getValue(cartera, "VLOR_TTAL_APLCAR").trim().replace(/\./g, "").replace(''$'', ''''),',
'                "VLOR_TTAL_APLCCION":   model.getValue(cartera, "VLOR_TTAL_APLCCION").trim().replace(/\./g, "").replace(''$'', ''''),',
'                "VLOR_DSCNTO_APLCCION": model.getValue(cartera, "VLOR_DSCNTO_APLCCION").trim().replace(/\./g, "").replace(''$'', ''''),',
'                "TPO_DCMNTO":           model.getValue(cartera, "TPO_DCMNTO"),',
'                "CDGO_MVMNTO_ORGN":     model.getValue(cartera, "CDGO_MVMNTO_ORGN"),',
'                "ID_ORGEN":             model.getValue(cartera, "ID_ORGEN")',
'            };',
'        });',
'',
'        window.localStorage.setItem(''jsoncartera_''+ staticId, JSON.stringify(jsonCartera));',
'       // $s(''P257_JSON_CRTRAS'', JSON.stringify(jsonCartera));',
'        console.log(''json_cartera de obtenerCartera(): '' + JSON.stringify(jsonCartera));',
'',
'    }',
'}',
'',
'function seleccionCartera() {',
'',
'    console.log(''INICIA seleccionCartera'');',
'',
'    var crtra_slccnda = 0;',
'    var ttl_cartera_slccnda = 0;',
'    var cartera_slccnda = 0;',
'    var valor_titulo = 0;',
'    var vlor_rmnnte = 0;',
'    var valorTotalAplicar = 0;',
'    var table;',
'    var valor_aplicar_final = 0;',
'    var v_vlor_dscnto_aplcar = 0;',
'    var vlor_ttal_aplccion = 0;',
'    var valorTotalAplicacion = 0;',
'',
'    valor_titulo = $v("P2025039_VLOR_TTLOS").replace(/\$|\.+/g, '''');',
'    console.log(''valor titulo: '' + valor_titulo);',
'    ttl_cartera_slccnda = $v("P2025039_VLOR_SLCCNDO").replace(/\$|\.+/g, '''');',
'    console.log(''ttl_cartera_slccnda: '' + ttl_cartera_slccnda);',
'    ',
'    apex.item("P2025039_VLOR_RMNNTE_TMP").setValue(valor_titulo);',
'    ',
'    var view = apex.region("cartera2").widget().interactiveGrid("getViews", "grid");',
'    var model = view.model;',
'    var records = view.view$.grid("getSelectedRecords");',
'',
'    model.forEach(function (dato) {',
'        crtra_slccnda = parseInt(model.getValue(dato, "VLOR_TTAL_APLCAR").replace(/\$|\.+/g, ''''));',
'        if (!isNaN(crtra_slccnda)) {',
'            cartera_slccnda += crtra_slccnda;',
'        }',
'',
'    });',
'  //  console.log(''cartera_slccnda model: '' + cartera_slccnda);',
'  //  ttl_cartera_slccnda = Number(ttl_cartera_slccnda) + Number(cartera_slccnda);',
'  //  console.log(''ttl_cartera_slccnda model: '' + ttl_cartera_slccnda);',
'  //  apex.item("P2025039_VLOR_SLCCNDO").setValue("$" + ttl_cartera_slccnda.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'',
'    records.map((data) => {',
'        console.log(data)',
'        valorTotalAplicar = parseInt(model.getValue(data, "VLOR_TTAL_OCULTO"));',
'        console.log(''Valor seleccionado a aplicar: '' + valorTotalAplicar);',
'',
'        valorTotalAplicacion = parseInt(model.getValue(data, "VLOR_TTAL_APLCCION").replace(/\$|\.+/g, ''''));',
'',
'        if (Number(valorTotalAplicar) > 0 && Number(valorTotalAplicacion) < Number(valorTotalAplicar)) {',
'',
'            valorTotalAplicacion = valorTotalAplicar;',
'           ',
'            valor_aplicar_final = valor_titulo - ttl_cartera_slccnda;',
'',
'            console.log(''Valor_titulo: '' + Number(valor_titulo));',
'            console.log(''ttl_cartera_slccnda: '' + Number(ttl_cartera_slccnda));',
'            console.log(''Valor aplicar despues de restar: '' + valor_aplicar_final);',
'            console.log(''valorTotalAplicar: '' + valorTotalAplicar);',
'',
'            v_vlor_dscnto_aplcar = parseInt(model.getValue(data, "VLOR_DSCNTO_OCLTO"));',
'            console.log(''Valor descuento a aplicar: '' + v_vlor_dscnto_aplcar);',
'',
'            if (Number(valor_titulo) >= Number(ttl_cartera_slccnda) && Number(valor_aplicar_final) >= Number(valorTotalAplicar)) {',
'                console.log(''entreif 1: '' + valorTotalAplicar);',
'                model.setValue(data, "VLOR_TTAL_APLCAR", formatoNumero(valorTotalAplicar, { decimal: '','', thousand: ''.'', precision: 0 }));',
'',
'                model.setValue(data, "VLOR_TTAL_APLCCION", "" + formatoNumero(valorTotalAplicar, { decimal: '','', thousand: ''.'', precision: 0 }));',
'',
'                model.setValue(data, "VLOR_DSCNTO_APLCCION", "$" + formatoNumero(v_vlor_dscnto_aplcar, { decimal: '','', thousand: ''.'', precision: 0 }));',
'',
'                ttl_cartera_slccnda = Number(ttl_cartera_slccnda) + Number(valorTotalAplicar);',
'                console.log(''valorTotalseleccionado: '' + ttl_cartera_slccnda);',
'',
'                apex.item("P2025039_VLOR_SLCCNDO").setValue("$" + ttl_cartera_slccnda.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'',
'            } else if (valorTotalAplicar == ttl_cartera_slccnda && Number(valor_titulo) >= Number(ttl_cartera_slccnda)) {',
'                console.log(''entre if 2: '' + valorTotalAplicar);',
'                model.setValue(data, "VLOR_TTAL_APLCAR", formatoNumero(valorTotalAplicar, { decimal: '','', thousand: ''.'', precision: 0 }));',
'',
'                model.setValue(data, "VLOR_TTAL_APLCCION", "" + formatoNumero(valorTotalAplicar, { decimal: '','', thousand: ''.'', precision: 0 }));',
'',
'                model.setValue(data, "VLOR_DSCNTO_APLCCION", "$" + formatoNumero(v_vlor_dscnto_aplcar, { decimal: '','', thousand: ''.'', precision: 0 }));',
'',
'                ttl_cartera_slccnda += valorTotalAplicar;',
'                apex.item("P2025039_VLOR_SLCCNDO").setValue("$" + ttl_cartera_slccnda.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'',
'            } else if (Number(valor_aplicar_final) > 0 && Number(valor_aplicar_final) <= Number(valorTotalAplicar)) {',
'                console.log(''entre if 3 - valor_aplicar_final: '' + valor_aplicar_final);',
'                model.setValue(data, "VLOR_TTAL_APLCAR", formatoNumero(valor_aplicar_final, { decimal: '','', thousand: ''.'', precision: 0 }));',
'',
'                if (Number(valor_aplicar_final) < Number(valorTotalAplicar)) {',
'                    // Se valida si hay descuento. ',
'                    // Si hay, se le suma el descuento al valor total y el descuento queda en cero(0)',
'                    if (Number(v_vlor_dscnto_aplcar) > 0) {',
'                        console.log(''Docuemnto de abono'');',
'                        vlor_ttal_aplccion = valorTotalAplicar + v_vlor_dscnto_aplcar;',
'',
'                        model.setValue(data, "VLOR_TTAL_APLCCION", "" + formatoNumero(vlor_ttal_aplccion, { decimal: '','', thousand: ''.'', precision: 0 }));',
'                    } else {',
'                        console.log(''Documento de abono descuento 0'');',
'                        model.setValue(data, "VLOR_TTAL_APLCCION", "" + formatoNumero(valorTotalAplicar, { decimal: '','', thousand: ''.'', precision: 0 }));',
'                    }',
'                    model.setValue(data, "VLOR_DSCNTO_APLCCION", "$" + 0);',
'                    // Tipo de documento de abono',
'                    model.setValue(data, "TPO_DCMNTO", ''DAB'');',
'                } else {',
'                    console.log(''Documento normal'');',
'                    model.setValue(data, "VLOR_TTAL_APLCCION", "" + formatoNumero(valorTotalAplicar, { decimal: '','', thousand: ''.'', precision: 0 }));',
'                    model.setValue(data, "VLOR_DSCNTO_APLCCION", "$" + formatoNumero(v_vlor_dscnto_aplcar, { decimal: '','', thousand: ''.'', precision: 0 }));',
'                }',
'',
'                ttl_cartera_slccnda += valor_aplicar_final;',
'                apex.item("P2025039_VLOR_SLCCNDO").setValue("$" + ttl_cartera_slccnda.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'            }',
'',
'            vlor_rmnnte = valor_titulo - ttl_cartera_slccnda;',
'            if (Number(vlor_rmnnte) < 0) {',
'                vlor_rmnnte = 0;',
'            }',
'            apex.item("P2025039_SLDO_RMNTE").setValue("$" + vlor_rmnnte.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'            apex.item("P2025039_VLOR_RMNNTE_TMP").setValue(vlor_rmnnte);',
'',
'            // FIN NUEVO    ',
'        }',
'    })',
'',
'   // saldoTitulos("cartera2");',
'};'))
,p_javascript_code_onload=>'apex.item("Save").hide();'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ACARABALLO'
,p_last_upd_yyyymmddhh24miss=>'20260218153634'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26031113874554801)
,p_plug_name=>unistr('<b>Proceso Puntual T\00EDtulo Judicial No. &P2025039_NMRO_TTLO_JDCIAL. A Nombre De &P2025039_NMBRES_DMNDDO. Con Identificaci\00F3n No. &P2025039_IDNTFCCION_DMNDDO.</b>')
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
 p_id=>wwv_flow_api.id(26031261899554802)
,p_plug_name=>unistr('Par\00E1metros')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--accent1:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26032003203554810)
,p_plug_name=>'Cartera'
,p_region_name=>'Cartera'
,p_region_template_options=>'#DEFAULT#:t-Region--accent1:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with carteras as',
'(select  k.nmro_prcso_jrdco,',
'         k.cnsctvo_embrgo,',
'         k.idntfccion_sjto,',
'         k.id_impsto,',
'         k.id_impsto_sbmpsto,',
'         k.vgncia,',
'         k.prdo,',
'         k.id_prdo,',
'         k.id_sjto_impsto,',
'         sum(k.vlor_sldo_cptal) as vlor_sldo_cptal,',
'         sum(k.vlor_intres) as vlor_sldo_intres,',
'         sum(k.vlor_dscnto) vlor_dscnto,',
'         sum(k.vlor_sldo_cptal) + sum(k.vlor_intres) - sum(k.vlor_dscnto) vlor_ttal,',
'         sum(k.vlor_sldo_cptal) + sum(k.vlor_intres) - sum(k.vlor_dscnto) vlor_ttal_oculto,',
'         0 vlor_ttal_aplcar,',
'         0 vlor_dscnto_aplccion,',
'         0 vlor_ttal_aplccion,',
'         sum(k.vlor_dscnto) vlor_dscnto_oclto,',
'         ''DNO'' tpo_dcmnto,',
'         k.cdgo_mvmnto_orgn,',
'         k.id_orgen',
'from (',
'select g.nmro_prcso_jrdco,',
'       c.cnsctvo_embrgo,',
'       f.idntfccion_sjto,',
'       a.id_impsto,',
'       a.id_impsto_sbmpsto,',
'       a.vgncia,',
'       z.prdo,',
'       a.id_prdo,',
'       a.id_sjto_impsto,     ',
'       z.id_cncpto,',
'       z.dscrpcion_cncpto dscrpcion,',
'       z.vlor_sldo_cptal,',
'       z.vlor_intres,       ',
'       nvl((select case',
'                              when sum(vlor_dscnto) < z.vlor_sldo_cptal and',
'                                   sum(vlor_dscnto) > 0 then',
'                               sum(vlor_dscnto)',
'                              when sum(vlor_dscnto) > z.vlor_sldo_cptal and',
'                                   sum(vlor_dscnto) > 0 then',
'                               z.vlor_sldo_cptal',
'                            end as vlor_dscnto',
'                       from table(pkg_re_documentos.fnc_cl_descuento_x_vgncia_prdo(p_cdgo_clnte           => a.cdgo_clnte,',
'                                                                                   p_id_impsto            => a.id_impsto,',
'                                                                                   p_id_impsto_sbmpsto    => a.id_impsto_sbmpsto,',
'                                                                                   p_vgncia               => a.vgncia,',
'                                                                                   p_id_prdo              => a.id_prdo,',
'                                                                                   p_id_cncpto            => z.id_cncpto,',
'                                                                                   p_id_sjto_impsto       => a.id_sjto_impsto,',
'                                                                                   p_fcha_pryccion        => :P2025039_FCHA_PRYCCION,',
'                                                                                   p_vlor                 => z.vlor_sldo_cptal,',
'                                                                                   p_cdna_vgncia_prdo_pgo => (select json_object(''VGNCIA_PRDO''',
'                                                                                                                                 value',
'                                                                                                                                 json_arrayagg(json_object(''vgncia''',
'                                                                                                                                                           value',
'                                                                                                                                                           vgncia,',
'                                                                                                                                                           ''prdo''',
'                                                                                                                                                           value prdo,',
'                                                                                                                                                           ''id_orgen''',
'                                                                                                                                                           value',
'                                                                                                                                                           id_orgen)',
'                                                                                                                                               order by',
'                                                                                                                                               vgncia,',
'                                                                                                                                               prdo,',
'                                                                                                                                               id_orgen',
'                                                                                                                                               returning clob)',
'                                                                                                                                 returning clob) vgncias_prdo',
'                                                                                                                from (select x.vgncia,',
'                                                                                                                             y.prdo,',
'                                                                                                                             x.id_orgen',
'                                                                                                                        from gf_g_mvmntos_cncpto_cnslddo x',
'                                                                                                                        join v_df_i_periodos y on x.id_prdo = y.id_prdo',
'                                                                                                                        join si_i_sujetos_impuesto z on z.id_sjto_impsto = x.id_sjto_impsto',
'                                                                                                                                                        and z.id_sjto_estdo = 1',
'                                                                                                                       where x.vlor_sldo_cptal > 0',
'                                                                                                                         and x.cdgo_mvnt_fncro_estdo in',
'                                                                                                                             (''NO'',',
'                                                                                                                              ''CN'')',
'                                                                                                                         and x.id_sjto_impsto = a.id_sjto_impsto',
'                                                                                                                       group by x.vgncia,',
'                                                                                                                                y.prdo,',
'                                                                                                                                x.id_orgen)), --:P257_JSON_VGNCIAS_PRDO,',
'                                                                                   p_cdna_vgncia_prdo_ps  => null))),',
'                     0) + nvl((select vlor_dscnto',
'                                from table(pkg_re_documentos.fnc_cl_descuento_x_vgncia_prdo(p_cdgo_clnte           => a.cdgo_clnte,',
'                                                                                            p_id_impsto            => a.id_impsto,',
'                                                                                            p_id_impsto_sbmpsto    => a.id_impsto_sbmpsto,',
'                                                                                            p_vgncia               => a.vgncia,',
'                                                                                            p_id_prdo              => a.id_prdo,',
'                                                                                            p_id_cncpto            => z.id_cncpto_intres_mra,',
'                                                                                            p_id_sjto_impsto       => a.id_sjto_impsto,',
'                                                                                            p_fcha_pryccion        => :P2025039_FCHA_PRYCCION, --:P257_FCHA_PRYCCION,',
'                                                                                            p_vlor                 => z.vlor_intres,',
'                                                                                            p_cdna_vgncia_prdo_pgo => (select json_object(''VGNCIA_PRDO''',
'                                                                                                                                          value',
'                                                                                                                                          json_arrayagg(json_object(''vgncia''',
'                                                                                                                                                                    value',
'                                                                                                                                                                    vgncia,',
'                                                                                                                                                                    ''prdo''',
'                                                                                                                                                                    value prdo,',
'                                                                                                                                                                    ''id_orgen''',
'                                                                                                                                                                    value',
'                                                                                                                                                                    id_orgen)',
'                                                                                                                                                        order by',
'                                                                                                                                                        vgncia,',
'                                                                                                                                                        prdo,',
'                                                                                                                                                        id_orgen',
'                                                                                                                                                        returning clob)',
'                                                                                                                                          returning clob) vgncias_prdo',
'                                                                                                                         from (select x.vgncia,',
'                                                                                                                                      y.prdo,',
'                                                                                                                                      x.id_orgen',
'                                                                                                                                 from gf_g_mvmntos_cncpto_cnslddo x',
'                                                                                                                                 join v_df_i_periodos y on x.id_prdo = y.id_prdo',
'                                                                                                                                 join si_i_sujetos_impuesto z on z.id_sjto_impsto = x.id_sjto_impsto',
'                                                                                                                                  and z.id_sjto_estdo = 1',
'                                                                                                                                where x.vlor_sldo_cptal > 0',
'                                                                                                                                  and x.cdgo_mvnt_fncro_estdo in',
'                                                                                                                                      (''NO'',',
'                                                                                                                                       ''CN'')',
'                                                                                                                                  and x.id_sjto_impsto = a.id_sjto_impsto',
'                                                                                                                                group by x.vgncia,',
'                                                                                                                                         y.prdo,',
'                                                                                                                                         x.id_orgen)), --:P257_JSON_VGNCIAS_PRDO,',
'                                                                                            p_cdna_vgncia_prdo_ps  => null',
'                                                                                            -- Ley 2155',
'                                                                                           ,',
'                                                                                            p_cdgo_mvmnto_orgn => a.cdgo_mvmnto_orgn,',
'                                                                                            p_id_orgen         => a.id_orgen,',
'                                                                                            p_vlor_cptal       => z.vlor_sldo_cptal,',
'                                                                                            P_ID_CNCPTO_BASE   => z.id_cncpto))),',
'                              0) as vlor_dscnto,',
'                 (z.vlor_sldo_cptal + z.vlor_intres) as total,',
'                 0 vlor_ttal_aplcar,',
'                 0 vlor_dscnto_aplccion,',
'                 0 vlor_ttal_aplccion,',
'                 ''DNO'' tpo_dcmnto,',
'                 a.cdgo_mvmnto_orgn,',
'                 a.id_orgen',
'from gf_g_movimientos_financiero a',
'join mc_g_embargos_cartera_detalle b on a.cdgo_clnte = b.cdgo_clnte and',
'                                       a.id_impsto = b.id_impsto and',
'                                       a.id_impsto_sbmpsto = b.id_impsto_sbmpsto and',
'                                       a.id_sjto_impsto = b.id_sjto_impsto and',
'                                       a.vgncia = b.vgncia and',
'                                       a.id_prdo = b.id_prdo and',
'                                       a.cdgo_mvmnto_orgn = b.cdgo_mvmnto_orgn and',
'                                       a.id_orgen = b.id_orgen',
'join table(pkg_gf_movimientos_financiero.fnc_co_mvmnto_x_cncpto(p_cdgo_clnte => b.cdgo_clnte, ',
'                                                                p_id_impsto => b.id_impsto, ',
'                                                                p_id_impsto_sbmpsto => b.id_impsto_sbmpsto, ',
'                                                                p_id_sjto_impsto => b.id_sjto_impsto, ',
'                                                                p_fcha_vncmnto => :P2025039_FCHA_PRYCCION))z on a.id_mvmnto_fncro = z.id_mvmnto_fncro ',
'join mc_g_embargos_resolucion      c on b.id_embrgos_crtra = c.id_embrgos_crtra',
'left join mc_g_embrgos_crt_prc_jrd      d on c.id_embrgos_crtra = d.id_embrgos_crtra',
'left join cb_g_procesos_juridico         g on d.id_prcsos_jrdco = g.id_prcsos_jrdco',
'join v_si_i_sujetos_impuesto       f on a.id_impsto = f.id_impsto and',
'                                        a.id_sjto_impsto = f.id_sjto_impsto',
'where a.id_sjto_impsto = :P2025039_ID_SJTO_IMPSTO ',
'and z.vlor_sldo_cptal > 0) k',
'group by k.nmro_prcso_jrdco,',
'         k.cnsctvo_embrgo,',
'         k.idntfccion_sjto,',
'         k.id_impsto,',
'         k.id_impsto_sbmpsto,',
'         k.vgncia,',
'         k.prdo,',
'         k.id_prdo,',
'         k.id_sjto_impsto,',
'         k.cdgo_mvmnto_orgn,',
'         k.id_orgen)',
'select rownum,         ',
'	   t.nmro_prcso_jrdco,',
'       t.cnsctvo_embrgo,',
'       t.idntfccion_sjto,',
'       t.id_impsto,',
'       t.id_impsto_sbmpsto,',
'       t.vgncia,',
'       t.prdo,',
'       t.id_prdo,',
'       t.id_sjto_impsto,',
'       t.vlor_sldo_cptal,',
'       t.vlor_sldo_intres,',
'       t.vlor_dscnto,',
'       t.vlor_ttal,',
'       t.vlor_ttal_oculto,',
'       t.vlor_ttal_aplcar,',
'       t.vlor_dscnto_aplccion,',
'       t.vlor_ttal_aplccion,',
'       t.vlor_dscnto_oclto,',
'       t.tpo_dcmnto,',
'       t.cdgo_mvmnto_orgn,',
'       t.id_orgen',
'from carteras t'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gf_g_titulos_judicial a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'and a.cdgo_ttlo_jdcial_estdo = ''CYC''',
'and a.id_ttlo_jdcial not in (select z.id_ttlo_jdcial ',
'                            from gf_g_titulos_jdcial_impsto z',
'                            where z.id_ttlo_jdcial = a.id_ttlo_jdcial)',
'and exists (select 2',
'            from (select ((select sum(x.vlor)',
'                           from gf_g_titulos_judicial x',
'                          where x.id_instncia_fljo = a.id_instncia_fljo',
'                            and x.cdgo_ttlo_jdcial_estdo = ''CYC'') -',
'                       (select nvl(sum(k.vlor_ttal_aplcar), 0)',
'                           from gf_g_titulos_jdcial_vgncia k',
'                          where k.id_instncia_fljo = a.id_instncia_fljo)) vlor_t',
'                  from dual)',
'         where vlor_t > 0)'))
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(26032214379554812)
,p_name=>'NMRO_PRCSO_JRDCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_PRCSO_JRDCO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'No. Proceso'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(26032351871554813)
,p_name=>'CNSCTVO_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNSCTVO_EMBRGO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Embargo'
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
 p_id=>wwv_flow_api.id(26032450094554814)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n<br> Sujeto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(26032520915554815)
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
 p_id=>wwv_flow_api.id(26032626927554816)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
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
 p_id=>wwv_flow_api.id(26032767306554817)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(26032892519554818)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(26032952647554819)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
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
 p_id=>wwv_flow_api.id(26033094115554820)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
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
 p_id=>wwv_flow_api.id(26033379421554823)
,p_name=>'VLOR_SLDO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Saldo <br>Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'formatcurrency'
,p_attribute_03=>'right'
,p_format_mask=>'FM999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(26033507566554825)
,p_name=>'VLOR_DSCNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DSCNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Descuento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
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
 p_id=>wwv_flow_api.id(26033792948554827)
,p_name=>'VLOR_TTAL_APLCAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_APLCAR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total <br>Aplicar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'formatcurrency'
,p_attribute_03=>'right'
,p_format_mask=>'FM999G999G999G999G999G999G990'
,p_item_attributes=>'onkeypress="return  validarExpresion(event, ''numeroEntero'')"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:0});" '
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
 p_id=>wwv_flow_api.id(26033869936554828)
,p_name=>'VLOR_DSCNTO_APLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DSCNTO_APLCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Descuento<br>Aplicaci\00F3n')
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(26033970297554829)
,p_name=>'VLOR_TTAL_APLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_APLCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Total<br>Aplicaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'formatcurrency'
,p_attribute_03=>'right'
,p_format_mask=>'FM999G999G999G999G999G999G990'
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(26034066128554830)
,p_name=>'TPO_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_DCMNTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo de<br>Documento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>3
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
 p_id=>wwv_flow_api.id(26034164721554831)
,p_name=>'CDGO_MVMNTO_ORGN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVMNTO_ORGN'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(26034253231554832)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>230
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
 p_id=>wwv_flow_api.id(26160971492354909)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(26161090436354910)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(26161276306354912)
,p_name=>'ROWNUM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWNUM'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>240
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(26259026978266601)
,p_name=>'VLOR_SLDO_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Saldo <br>Inter\00E9s')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'formatcurrency'
,p_attribute_02=>'VALUE'
,p_format_mask=>'FM999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(26259157463266602)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Valor Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>260
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'formatcurrency'
,p_attribute_02=>'VALUE'
,p_format_mask=>'FM999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(26259216320266603)
,p_name=>'VLOR_TTAL_OCULTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_OCULTO'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(26259335928266604)
,p_name=>'VLOR_DSCNTO_OCLTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DSCNTO_OCLTO'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(26032125354554811)
,p_internal_uid=>26032125354554811
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
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU'
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
 p_id=>wwv_flow_api.id(26045551826218021)
,p_interactive_grid_id=>wwv_flow_api.id(26032125354554811)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(26045618708218020)
,p_report_id=>wwv_flow_api.id(26045551826218021)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26729421107141)
,p_view_id=>wwv_flow_api.id(26045618708218020)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(26160971492354909)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(36701327090494)
,p_view_id=>wwv_flow_api.id(26045618708218020)
,p_display_seq=>22
,p_column_id=>wwv_flow_api.id(26161276306354912)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26046112930218016)
,p_view_id=>wwv_flow_api.id(26045618708218020)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(26032214379554812)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>92
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26046670200218012)
,p_view_id=>wwv_flow_api.id(26045618708218020)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(26032351871554813)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>102
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26047127748218010)
,p_view_id=>wwv_flow_api.id(26045618708218020)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(26032450094554814)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>144
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26047675044218009)
,p_view_id=>wwv_flow_api.id(26045618708218020)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(26032520915554815)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>73.225
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26048125079218007)
,p_view_id=>wwv_flow_api.id(26045618708218020)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(26032626927554816)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26048683894218006)
,p_view_id=>wwv_flow_api.id(26045618708218020)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(26032767306554817)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>83
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26049122738218004)
,p_view_id=>wwv_flow_api.id(26045618708218020)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(26032892519554818)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26049651452218003)
,p_view_id=>wwv_flow_api.id(26045618708218020)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(26032952647554819)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26050148204218001)
,p_view_id=>wwv_flow_api.id(26045618708218020)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(26033094115554820)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26051662704217997)
,p_view_id=>wwv_flow_api.id(26045618708218020)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(26033379421554823)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26052619108217994)
,p_view_id=>wwv_flow_api.id(26045618708218020)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(26033507566554825)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26053690726217991)
,p_view_id=>wwv_flow_api.id(26045618708218020)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(26033792948554827)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26054140584217989)
,p_view_id=>wwv_flow_api.id(26045618708218020)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(26033869936554828)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>128
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26054662369217988)
,p_view_id=>wwv_flow_api.id(26045618708218020)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(26033970297554829)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26055132823217986)
,p_view_id=>wwv_flow_api.id(26045618708218020)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(26034066128554830)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26055528376217985)
,p_view_id=>wwv_flow_api.id(26045618708218020)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(26034164721554831)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26056033265217983)
,p_view_id=>wwv_flow_api.id(26045618708218020)
,p_display_seq=>21
,p_column_id=>wwv_flow_api.id(26034253231554832)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26264909551266082)
,p_view_id=>wwv_flow_api.id(26045618708218020)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(26259026978266601)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26265441117266078)
,p_view_id=>wwv_flow_api.id(26045618708218020)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(26259157463266602)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26265931145266076)
,p_view_id=>wwv_flow_api.id(26045618708218020)
,p_display_seq=>25
,p_column_id=>wwv_flow_api.id(26259216320266603)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26266494097266074)
,p_view_id=>wwv_flow_api.id(26045618708218020)
,p_display_seq=>26
,p_column_id=>wwv_flow_api.id(26259335928266604)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26277407024856001)
,p_plug_name=>'Cartera a Compensar'
,p_region_name=>'cartera2'
,p_region_template_options=>'#DEFAULT#:t-Region--accent3:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rownum,',
'       k.idntfccion_sjto,',
'       k.id_impsto,',
'       k.id_impsto_sbmpsto,',
'       k.vgncia,',
'       k.prdo,',
'       k.id_prdo,',
'       k.id_sjto_impsto,     ',
'       k.id_cncpto,',
'       k.dscrpcion,',
'       k.vlor_sldo_cptal,',
'       k.vlor_sldo_intres,',
'       k.vlor_dscnto,',
'       (k.total - k.vlor_dscnto) vlor_ttal,',
'       k.vlor_ttal_aplcar,',
'       k.vlor_dscnto_aplccion,',
'       k.vlor_ttal_aplccion,',
'       k.vlor_dscnto vlor_dscnto_oclto,',
'       (k.vlor_sldo_cptal + k.vlor_sldo_intres - k.vlor_dscnto)vlor_ttal_oculto,',
'       k.tpo_dcmnto,',
'       k.cdgo_mvmnto_orgn,',
'       k.id_orgen',
'from (       ',
'select ',
'       f.idntfccion_sjto,',
'       a.id_impsto,',
'       a.id_impsto_sbmpsto,',
'       a.vgncia,',
'       z.prdo,',
'       a.id_prdo,',
'       a.id_sjto_impsto,     ',
'       z.id_cncpto,',
'       z.dscrpcion_cncpto dscrpcion,',
'       z.vlor_sldo_cptal,',
'       z.vlor_intres as vlor_sldo_intres,       ',
'       nvl((select case',
'                              when sum(vlor_dscnto) < z.vlor_sldo_cptal and',
'                                   sum(vlor_dscnto) > 0 then',
'                               sum(vlor_dscnto)',
'                              when sum(vlor_dscnto) > z.vlor_sldo_cptal and',
'                                   sum(vlor_dscnto) > 0 then',
'                               z.vlor_sldo_cptal',
'                            end as vlor_dscnto',
'                       from table(pkg_re_documentos.fnc_cl_descuento_x_vgncia_prdo(p_cdgo_clnte           => a.cdgo_clnte,',
'                                                                                   p_id_impsto            => a.id_impsto,',
'                                                                                   p_id_impsto_sbmpsto    => a.id_impsto_sbmpsto,',
'                                                                                   p_vgncia               => a.vgncia,',
'                                                                                   p_id_prdo              => a.id_prdo,',
'                                                                                   p_id_cncpto            => z.id_cncpto,',
'                                                                                   p_id_sjto_impsto       => a.id_sjto_impsto,',
'                                                                                   p_fcha_pryccion        => :P2025039_FCHA_PRYCCION,',
'                                                                                   p_vlor                 => z.vlor_sldo_cptal,',
'                                                                                   p_cdna_vgncia_prdo_pgo => (select json_object(''VGNCIA_PRDO''',
'                                                                                                                                 value',
'                                                                                                                                 json_arrayagg(json_object(''vgncia''',
'                                                                                                                                                           value',
'                                                                                                                                                           vgncia,',
'                                                                                                                                                           ''prdo''',
'                                                                                                                                                           value prdo,',
'                                                                                                                                                           ''id_orgen''',
'                                                                                                                                                           value',
'                                                                                                                                                           id_orgen)',
'                                                                                                                                               order by',
'                                                                                                                                               vgncia,',
'                                                                                                                                               prdo,',
'                                                                                                                                               id_orgen',
'                                                                                                                                               returning clob)',
'                                                                                                                                 returning clob) vgncias_prdo',
'                                                                                                                from (select x.vgncia,',
'                                                                                                                             y.prdo,',
'                                                                                                                             x.id_orgen',
'                                                                                                                        from gf_g_mvmntos_cncpto_cnslddo x',
'                                                                                                                        join v_df_i_periodos y on x.id_prdo = y.id_prdo',
'                                                                                                                        join si_i_sujetos_impuesto z on z.id_sjto_impsto = x.id_sjto_impsto',
'                                                                                                                                                        and z.id_sjto_estdo = 1',
'                                                                                                                       where x.vlor_sldo_cptal > 0',
'                                                                                                                         and x.cdgo_mvnt_fncro_estdo in',
'                                                                                                                             (''NO'',',
'                                                                                                                              ''CN'')',
'                                                                                                                         and x.id_sjto_impsto = a.id_sjto_impsto',
'                                                                                                                       group by x.vgncia,',
'                                                                                                                                y.prdo,',
'                                                                                                                                x.id_orgen)), --:P257_JSON_VGNCIAS_PRDO,',
'                                                                                   p_cdna_vgncia_prdo_ps  => null))),',
'                     0) + nvl((select vlor_dscnto',
'                                from table(pkg_re_documentos.fnc_cl_descuento_x_vgncia_prdo(p_cdgo_clnte           => a.cdgo_clnte,',
'                                                                                            p_id_impsto            => a.id_impsto,',
'                                                                                            p_id_impsto_sbmpsto    => a.id_impsto_sbmpsto,',
'                                                                                            p_vgncia               => a.vgncia,',
'                                                                                            p_id_prdo              => a.id_prdo,',
'                                                                                            p_id_cncpto            => z.id_cncpto_intres_mra,',
'                                                                                            p_id_sjto_impsto       => a.id_sjto_impsto,',
'                                                                                            p_fcha_pryccion        => :P2025039_FCHA_PRYCCION, --:P257_FCHA_PRYCCION,',
'                                                                                            p_vlor                 => z.vlor_intres,',
'                                                                                            p_cdna_vgncia_prdo_pgo => (select json_object(''VGNCIA_PRDO''',
'                                                                                                                                          value',
'                                                                                                                                          json_arrayagg(json_object(''vgncia''',
'                                                                                                                                                                    value',
'                                                                                                                                                                    vgncia,',
'                                                                                                                                                                    ''prdo''',
'                                                                                                                                                                    value prdo,',
'                                                                                                                                                                    ''id_orgen''',
'                                                                                                                                                                    value',
'                                                                                                                                                                    id_orgen)',
'                                                                                                                                                        order by',
'                                                                                                                                                        vgncia,',
'                                                                                                                                                        prdo,',
'                                                                                                                                                        id_orgen',
'                                                                                                                                                        returning clob)',
'                                                                                                                                          returning clob) vgncias_prdo',
'                                                                                                                         from (select x.vgncia,',
'                                                                                                                                      y.prdo,',
'                                                                                                                                      x.id_orgen',
'                                                                                                                                 from gf_g_mvmntos_cncpto_cnslddo x',
'                                                                                                                                 join v_df_i_periodos y on x.id_prdo = y.id_prdo',
'                                                                                                                                 join si_i_sujetos_impuesto z on z.id_sjto_impsto = x.id_sjto_impsto',
'                                                                                                                                  and z.id_sjto_estdo = 1',
'                                                                                                                                where x.vlor_sldo_cptal > 0',
'                                                                                                                                  and x.cdgo_mvnt_fncro_estdo in',
'                                                                                                                                      (''NO'',',
'                                                                                                                                       ''CN'')',
'                                                                                                                                  and x.id_sjto_impsto = a.id_sjto_impsto',
'                                                                                                                                group by x.vgncia,',
'                                                                                                                                         y.prdo,',
'                                                                                                                                         x.id_orgen)), --:P257_JSON_VGNCIAS_PRDO,',
'                                                                                            p_cdna_vgncia_prdo_ps  => null',
'                                                                                            -- Ley 2155',
'                                                                                           ,',
'                                                                                            p_cdgo_mvmnto_orgn => a.cdgo_mvmnto_orgn,',
'                                                                                            p_id_orgen         => a.id_orgen,',
'                                                                                            p_vlor_cptal       => z.vlor_sldo_cptal,',
'                                                                                            P_ID_CNCPTO_BASE   => z.id_cncpto))),',
'                              0) as vlor_dscnto,',
'                 (z.vlor_sldo_cptal + z.vlor_intres) as total,',
'                 0 vlor_ttal_aplcar,',
'                 0 vlor_dscnto_aplccion,',
'                 0 vlor_ttal_aplccion,',
'                 ''DNO'' tpo_dcmnto,',
'                 a.cdgo_mvmnto_orgn,',
'                 a.id_orgen',
'from gf_g_movimientos_financiero a',
'join table(pkg_gf_movimientos_financiero.fnc_co_mvmnto_x_cncpto(p_cdgo_clnte => a.cdgo_clnte, ',
'                                                                p_id_impsto => a.id_impsto, ',
'                                                                p_id_impsto_sbmpsto => a.id_impsto_sbmpsto, ',
'                                                                p_id_sjto_impsto => a.id_sjto_impsto, ',
'                                                                p_fcha_vncmnto => :P2025039_FCHA_PRYCCION))z on a.id_mvmnto_fncro = z.id_mvmnto_fncro ',
'join v_si_i_sujetos_impuesto       f on a.id_impsto = f.id_impsto and',
'                                        a.id_sjto_impsto = f.id_sjto_impsto',
'where a.id_sjto_impsto = :P2025039_ID_SJTO_IMPSTO ',
'and z.vlor_sldo_cptal > 0',
'and not exists (select 1 from mc_g_embargos_cartera_detalle cd ',
'                where cd.id_sjto_impsto = a.id_sjto_impsto',
'                and cd.id_impsto = a.id_impsto',
'                and cd.id_impsto_sbmpsto = a.id_impsto_sbmpsto',
'                and cd.vgncia = a.vgncia',
'                and cd.id_prdo = a.id_prdo',
'                and cd.id_orgen = a.id_orgen)',
'and not exists (select 1 from cb_g_procesos_jrdco_mvmnto mv ',
'                where mv.id_sjto_impsto = a.id_sjto_impsto',
'                and mv.id_impsto = a.id_impsto',
'                and mv.id_impsto_sbmpsto = a.id_impsto_sbmpsto',
'                and mv.vgncia = a.vgncia',
'                and mv.id_prdo = a.id_prdo',
'                and mv.id_orgen = a.id_orgen))k'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gf_g_titulos_judicial a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'and a.cdgo_ttlo_jdcial_estdo = ''CYC''',
'and a.id_ttlo_jdcial not in (select z.id_ttlo_jdcial ',
'                            from gf_g_titulos_jdcial_impsto z',
'                            where z.id_ttlo_jdcial = a.id_ttlo_jdcial)',
'and exists (select 2',
'            from (select ((select sum(x.vlor)',
'                           from gf_g_titulos_judicial x',
'                          where x.id_instncia_fljo = a.id_instncia_fljo',
'                            and x.cdgo_ttlo_jdcial_estdo = ''CYC'') -',
'                       (select nvl(sum(k.vlor_ttal_aplcar), 0)',
'                           from gf_g_titulos_jdcial_vgncia k',
'                          where k.id_instncia_fljo = a.id_instncia_fljo)) vlor_t',
'                  from dual)',
'         where vlor_t > 0)'))
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(26277693184856003)
,p_name=>'ROWNUM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWNUM'
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
 p_id=>wwv_flow_api.id(26277752952856004)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(26277857945856005)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(177369392791050685)
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
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(26277982022856006)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Sub - Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto, id_impsto_sbmpsto',
'from df_i_impuestos_subimpuesto  ',
'where id_impsto = :ID_IMPSTO'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'ID_IMPSTO'
,p_ajax_items_to_submit=>'ID_IMPSTO,ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(26278018688856007)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
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
 p_id=>wwv_flow_api.id(26278140185856008)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(26278231152856009)
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
 p_id=>wwv_flow_api.id(26278394575856010)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
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
 p_id=>wwv_flow_api.id(26278449932856011)
,p_name=>'VLOR_SLDO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Saldo <br>Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'formatcurrency'
,p_attribute_03=>'right'
,p_format_mask=>'FM999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(26278684090856013)
,p_name=>'VLOR_DSCNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DSCNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Descuento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
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
 p_id=>wwv_flow_api.id(26278950985856016)
,p_name=>'VLOR_TTAL_APLCAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_APLCAR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total <br>Aplicar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'formatcurrency'
,p_attribute_03=>'right'
,p_format_mask=>'FM999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(26279067258856017)
,p_name=>'VLOR_DSCNTO_APLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DSCNTO_APLCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Descuento<br>Aplicaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
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
 p_id=>wwv_flow_api.id(26279138742856018)
,p_name=>'VLOR_TTAL_APLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_APLCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Total<br>Aplicaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'formatcurrency'
,p_attribute_03=>'right'
,p_format_mask=>'FM999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(26279363162856020)
,p_name=>'TPO_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_DCMNTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo de<br>Documento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>3
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
 p_id=>wwv_flow_api.id(26279499874856021)
,p_name=>'CDGO_MVMNTO_ORGN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVMNTO_ORGN'
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
 p_id=>wwv_flow_api.id(26279514879856022)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
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
 p_id=>wwv_flow_api.id(26279756889856024)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(26279824209856025)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(26330940964633701)
,p_name=>'ID_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>230
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
 p_id=>wwv_flow_api.id(26331021492633702)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
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
 p_id=>wwv_flow_api.id(26331384758633705)
,p_name=>'VLOR_DSCNTO_OCLTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DSCNTO_OCLTO'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(26331468960633706)
,p_name=>'VLOR_TTAL_OCULTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_OCULTO'
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
 p_id=>wwv_flow_api.id(26346218169264301)
,p_name=>'VLOR_SLDO_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Saldo <br>Inter\00E9s')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>290
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'formatcurrency'
,p_attribute_03=>'right'
,p_format_mask=>'FM999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(26352808412248102)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>300
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'formatcurrency'
,p_attribute_03=>'right'
,p_format_mask=>'FM999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(26277502327856002)
,p_internal_uid=>26277502327856002
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
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU'
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
 p_id=>wwv_flow_api.id(26283076231825602)
,p_interactive_grid_id=>wwv_flow_api.id(26277502327856002)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(26283150899825601)
,p_report_id=>wwv_flow_api.id(26283076231825602)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4038919723134)
,p_view_id=>wwv_flow_api.id(26283150899825601)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(26279756889856024)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(31244163999919)
,p_view_id=>wwv_flow_api.id(26283150899825601)
,p_display_seq=>21
,p_column_id=>wwv_flow_api.id(26330940964633701)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(31909552999918)
,p_view_id=>wwv_flow_api.id(26283150899825601)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(26331021492633702)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>250
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26283608691825600)
,p_view_id=>wwv_flow_api.id(26283150899825601)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(26277693184856003)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26284188438825598)
,p_view_id=>wwv_flow_api.id(26283150899825601)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(26277752952856004)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26284694240825596)
,p_view_id=>wwv_flow_api.id(26283150899825601)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(26277857945856005)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>168
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26285190224825595)
,p_view_id=>wwv_flow_api.id(26283150899825601)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(26277982022856006)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26285665526825593)
,p_view_id=>wwv_flow_api.id(26283150899825601)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(26278018688856007)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26286198214825591)
,p_view_id=>wwv_flow_api.id(26283150899825601)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(26278140185856008)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26286603413825589)
,p_view_id=>wwv_flow_api.id(26283150899825601)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(26278231152856009)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26287190341825587)
,p_view_id=>wwv_flow_api.id(26283150899825601)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(26278394575856010)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26287558478825586)
,p_view_id=>wwv_flow_api.id(26283150899825601)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(26278449932856011)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26288592911825582)
,p_view_id=>wwv_flow_api.id(26283150899825601)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(26278684090856013)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26290050299825577)
,p_view_id=>wwv_flow_api.id(26283150899825601)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(26278950985856016)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26290599391825575)
,p_view_id=>wwv_flow_api.id(26283150899825601)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(26279067258856017)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26291044212825573)
,p_view_id=>wwv_flow_api.id(26283150899825601)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(26279138742856018)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26292082668825570)
,p_view_id=>wwv_flow_api.id(26283150899825601)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(26279363162856020)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26292559584825568)
,p_view_id=>wwv_flow_api.id(26283150899825601)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(26279499874856021)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26293076912825567)
,p_view_id=>wwv_flow_api.id(26283150899825601)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(26279514879856022)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26345236817474261)
,p_view_id=>wwv_flow_api.id(26283150899825601)
,p_display_seq=>22
,p_column_id=>wwv_flow_api.id(26331384758633705)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26345733832474259)
,p_view_id=>wwv_flow_api.id(26283150899825601)
,p_display_seq=>23
,p_column_id=>wwv_flow_api.id(26331468960633706)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26352216384259314)
,p_view_id=>wwv_flow_api.id(26283150899825601)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(26346218169264301)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26360240567238664)
,p_view_id=>wwv_flow_api.id(26283150899825601)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(26352808412248102)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26376110309781201)
,p_plug_name=>'Tab'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26376261085781202)
,p_plug_name=>'<b>Cartera Consignada Y Compensada</b>'
,p_parent_plug_id=>wwv_flow_api.id(26376110309781201)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select k.id_impsto,',
'       k.id_impsto_sbmpsto,',
'       k.id_sjto_impsto,',
'       k.vgncia,',
'       k.id_prdo,',
'       k.vlor_cptal,',
'       k.vlor_intres,',
'       k.vlor_dscto,',
'       k.vlor_ttal,',
'       k.vlor_ttal_ttlo,',
'       k.id_orgen,',
'       k.vlor_ttal_aplcar,',
'       k.vlor_ttal_aplccion,',
'       k.vlor_dscnto_aplccion,',
'       k.tpo_dcmnto,',
'       k.cdgo_mvmnto_orgn,',
'       k.prdo,',
'       k.id_instncia_fljo,',
'       k.cdgo_mvmnto_tpo',
' from(',
'select b.id_impsto,',
'       b.id_impsto_sbmpsto,',
'       b.id_sjto_impsto,',
'       b.vgncia,',
'       b.id_prdo,',
'       b.vlor_cptal,',
'       b.vlor_intres,',
'       b.vlor_dscto,',
'       b.vlor_ttal,',
'       b.vlor_ttal_ttlo,',
'       b.id_orgen,',
'       b.vlor_ttal_aplcar,',
'       b.vlor_ttal_aplccion,',
'       b.vlor_dscnto_aplccion,',
'       b.tpo_dcmnto,',
'       b.cdgo_mvmnto_orgn,',
'       b.prdo,',
'       b.id_instncia_fljo,',
'       b.cdgo_mvmnto_tpo',
'  from v_gf_g_titulos_jdcial_vgncia b  ',
'  --join gf_g_titulos_judicial c on b.id_instncia_fljo = c.id_instncia_fljo',
' where b.id_instncia_fljo = :F_ID_INSTNCIA_FLJO --and c.cdgo_ttlo_jdcial_estdo in (''ACN'',''ATJ'')',
' order by b.id_ttlo_jdcial_vgncia)k;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(26376486276781204)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(177369392791050685)
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
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(26376599221781205)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Sub Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(177369818921050685)
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
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(26376683846781206)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
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
 p_id=>wwv_flow_api.id(26376797901781207)
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
 p_id=>wwv_flow_api.id(26376806238781208)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
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
 p_id=>wwv_flow_api.id(26376924173781209)
,p_name=>'VLOR_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(26377023090781210)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Inter\00E9s')
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
 p_id=>wwv_flow_api.id(26377186304781211)
,p_name=>'VLOR_DSCTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DSCTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor <br>Descuento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(26377281554781212)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(26377308150781213)
,p_name=>'VLOR_TTAL_TTLO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_TTLO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor <br>Total T\00EDtulo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(26377441920781214)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
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
 p_id=>wwv_flow_api.id(26377521966781215)
,p_name=>'VLOR_TTAL_APLCAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_APLCAR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Total <br>a Aplicar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(26377660411781216)
,p_name=>'VLOR_TTAL_APLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_APLCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Total<br>Aplicaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
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
 p_id=>wwv_flow_api.id(26377743177781217)
,p_name=>'VLOR_DSCNTO_APLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DSCNTO_APLCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Descuento <br>Aplicaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(26377867872781218)
,p_name=>'TPO_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_DCMNTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo Documento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(26377971418781219)
,p_name=>'CDGO_MVMNTO_ORGN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVMNTO_ORGN'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(26378025763781220)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(184069937811281775)
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
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(26378138561781221)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
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
 p_id=>wwv_flow_api.id(26378261669781222)
,p_name=>'CDGO_MVMNTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVMNTO_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Consignar/Compensar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'CENTER'
,p_is_required=>false
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(26376384658781203)
,p_internal_uid=>26376384658781203
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
 p_id=>wwv_flow_api.id(26382349115773247)
,p_interactive_grid_id=>wwv_flow_api.id(26376384658781203)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(26382489796773246)
,p_report_id=>wwv_flow_api.id(26382349115773247)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26382916512773244)
,p_view_id=>wwv_flow_api.id(26382489796773246)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(26376486276781204)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>170
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26383465903773242)
,p_view_id=>wwv_flow_api.id(26382489796773246)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(26376599221781205)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>144
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26383994150773240)
,p_view_id=>wwv_flow_api.id(26382489796773246)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(26376683846781206)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26384447919773239)
,p_view_id=>wwv_flow_api.id(26382489796773246)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(26376797901781207)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26384917251773237)
,p_view_id=>wwv_flow_api.id(26382489796773246)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(26376806238781208)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26385415339773235)
,p_view_id=>wwv_flow_api.id(26382489796773246)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(26376924173781209)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26385985588773234)
,p_view_id=>wwv_flow_api.id(26382489796773246)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(26377023090781210)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26386461473773232)
,p_view_id=>wwv_flow_api.id(26382489796773246)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(26377186304781211)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26386904129773231)
,p_view_id=>wwv_flow_api.id(26382489796773246)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(26377281554781212)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26387426012773230)
,p_view_id=>wwv_flow_api.id(26382489796773246)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(26377308150781213)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26387920968773228)
,p_view_id=>wwv_flow_api.id(26382489796773246)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(26377441920781214)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26388449411773227)
,p_view_id=>wwv_flow_api.id(26382489796773246)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(26377521966781215)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26388963419773225)
,p_view_id=>wwv_flow_api.id(26382489796773246)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(26377660411781216)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26389467764773224)
,p_view_id=>wwv_flow_api.id(26382489796773246)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(26377743177781217)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>118
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26389922980773222)
,p_view_id=>wwv_flow_api.id(26382489796773246)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(26377867872781218)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>124
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26390485537773221)
,p_view_id=>wwv_flow_api.id(26382489796773246)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(26377971418781219)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26390992196773219)
,p_view_id=>wwv_flow_api.id(26382489796773246)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(26378025763781220)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26391476083773218)
,p_view_id=>wwv_flow_api.id(26382489796773246)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(26378138561781221)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26392638588720496)
,p_view_id=>wwv_flow_api.id(26382489796773246)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(26378261669781222)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26378336213781223)
,p_plug_name=>'<b>Cartera Vigencias Futuras</b>'
,p_parent_plug_id=>wwv_flow_api.id(26376110309781201)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>70
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from (',
'select a.id_ttlo_jdcial_sldo_fvor,',
'       a.id_ttlo_jdcial,',
'       a.id_instncia_fljo,',
'       a.id_sjto_impsto,',
'       a.idntfccion_sjto,',
'       a.vlor_sldo_fvor,',
'       a.obsrvcnes,',
'       a.fcha_rgstro,',
'       a.id_fncnrio',
'  from gf_g_titulos_judicial_saldo_favor a',
' where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
' order by a.id_ttlo_jdcial_sldo_fvor);'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(26378588691781225)
,p_name=>'ID_TTLO_JDCIAL_SLDO_FVOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_SLDO_FVOR'
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
 p_id=>wwv_flow_api.id(26378631239781226)
,p_name=>'ID_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL'
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
 p_id=>wwv_flow_api.id(26378781465781227)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
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
 p_id=>wwv_flow_api.id(26378807472781228)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
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
 p_id=>wwv_flow_api.id(26378965943781229)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(26379046595781230)
,p_name=>'VLOR_SLDO_FVOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_FVOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Saldo A Favor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(26379195443781231)
,p_name=>'OBSRVCNES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCNES'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Observaciones'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(26379253950781232)
,p_name=>'FCHA_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha De Registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_04=>'both'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
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
 p_id=>wwv_flow_api.id(26379394622781233)
,p_name=>'ID_FNCNRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FNCNRIO'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(26378464624781224)
,p_internal_uid=>26378464624781224
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
 p_id=>wwv_flow_api.id(26394923115620940)
,p_interactive_grid_id=>wwv_flow_api.id(26378464624781224)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(26395024360620940)
,p_report_id=>wwv_flow_api.id(26394923115620940)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26395506422620939)
,p_view_id=>wwv_flow_api.id(26395024360620940)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(26378588691781225)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26396045274620937)
,p_view_id=>wwv_flow_api.id(26395024360620940)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(26378631239781226)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26396547480620936)
,p_view_id=>wwv_flow_api.id(26395024360620940)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(26378781465781227)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26397015960620934)
,p_view_id=>wwv_flow_api.id(26395024360620940)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(26378807472781228)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26397530257620933)
,p_view_id=>wwv_flow_api.id(26395024360620940)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(26378965943781229)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26398020777620931)
,p_view_id=>wwv_flow_api.id(26395024360620940)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(26379046595781230)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26398593543620930)
,p_view_id=>wwv_flow_api.id(26395024360620940)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(26379195443781231)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26399089826620928)
,p_view_id=>wwv_flow_api.id(26395024360620940)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(26379253950781232)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26399512486620927)
,p_view_id=>wwv_flow_api.id(26395024360620940)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(26379394622781233)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(444633233723940241)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
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
 p_id=>wwv_flow_api.id(26160855745354908)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(444633233723940241)
,p_button_name=>'Save'
,p_button_static_id=>'Save'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26197191683364501)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(444633233723940241)
,p_button_name=>'BTN_RETURN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-undo-arrow'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26031334056554803)
,p_name=>'P2025039_NMRO_TTLO_JDCIAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(26031261899554802)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26031668971554806)
,p_name=>'P2025039_ID_TTLO_JDCIAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(26031261899554802)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26031702139554807)
,p_name=>'P2025039_IDNTFCCION_DMNDDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(26031261899554802)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26031910583554809)
,p_name=>'P2025039_ID_SJTO_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(26031261899554802)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26160116929354901)
,p_name=>'P2025039_FCHA_PRYCCION'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(26031261899554802)
,p_prompt=>unistr('<b>Fecha De Proyecci\00F3n</b>')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>10
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26160404222354904)
,p_name=>'P2025039_VLOR_TTLOS'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(26031261899554802)
,p_prompt=>unistr('<b>Valor T\00EDtulos</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26160541299354905)
,p_name=>'P2025039_VLOR_SLCCNDO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(26031261899554802)
,p_item_default=>'0'
,p_prompt=>'<b>Valor Seleccionado</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26160684260354906)
,p_name=>'P2025039_SLDO_RMNTE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(26031261899554802)
,p_item_default=>'0'
,p_prompt=>'<b>Remanente</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26249552234458805)
,p_name=>'P2025039_VLOR_RMNNTE_TMP'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(26031261899554802)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26279692532856023)
,p_name=>'P2025039_NMBRES_DMNDDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(26031261899554802)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26363011074681003)
,p_name=>'P2025039_JSON_TTLOS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(26031261899554802)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(26160772239354907)
,p_computation_sequence=>10
,p_computation_item=>'P2025039_VLOR_TTLOS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(vlor_t, :F_FRMTO_MNDA)',
'  from (select ((select sum(a.vlor)',
'                   from gf_g_titulos_judicial a',
'                  where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                    and a.cdgo_ttlo_jdcial_estdo = ''CYC'') -',
'               (select nvl(sum(b.vlor_ttal_aplcar), 0)',
'                   from gf_g_titulos_jdcial_vgncia_temp b',
'                  where b.id_instncia_fljo = :F_ID_INSTNCIA_FLJO) -',
'               (select nvl(sum(b.vlor_sldo_fvor), 0)',
'                    from gf_g_titulos_judicial_saldo_favor b',
'                   where b.id_instncia_fljo = :F_ID_INSTNCIA_FLJO)) vlor_t',
'          from dual);'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26160246413354902)
,p_name=>'Al cambiar P2025039_FCHA_PRYCCION'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2025039_FCHA_PRYCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26160336875354903)
,p_event_id=>wwv_flow_api.id(26160246413354902)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26249179012458801)
,p_name=>'Al iniciar el IG Cartera'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(26032003203554810)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26249270860458802)
,p_event_id=>wwv_flow_api.id(26249179012458801)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'TPO_DCMNTO,VLOR_DSCNTO_APLCCION,VLOR_TTAL_APLCCION,VLOR_TTAL_APLCAR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26249335999458803)
,p_name=>'Al seleccionar una fila del IG Cartera'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(26032003203554810)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26249415641458804)
,p_event_id=>wwv_flow_api.id(26249335999458803)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'seleccionCarteraCompensar("Cartera");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26280079629856027)
,p_name=>'Al Iniciar el IG cartera2'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(26277407024856001)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26280137819856028)
,p_event_id=>wwv_flow_api.id(26280079629856027)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'TPO_DCMNTO,VLOR_DSCNTO_APLCCION,VLOR_TTAL_APLCCION,VLOR_TTAL_APLCAR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26280373037856030)
,p_name=>'Al seleccionar una fila del IG cartera2'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(26277407024856001)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26280486943856031)
,p_event_id=>wwv_flow_api.id(26280373037856030)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'seleccionCartera();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26280591435856032)
,p_name=>'Al dar clic en Save'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(26160855745354908)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26280630973856033)
,p_event_id=>wwv_flow_api.id(26280591435856032)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function registrarcartera(){',
'    obtenerCartera("Cartera");',
'    obtenerCartera("cartera2");',
'    ',
'    let json_consignar = window.localStorage.jsoncartera_Cartera;',
'    let json_compensar = window.localStorage.jsoncartera_cartera2;',
'    let fcha_pryccion  = apex.item("P2025039_FCHA_PRYCCION").getValue();',
'    ',
'    apex.server.process("registrarCartera",{',
'        f01: json_compensar,',
'        f02: json_consignar,',
'        x01: fcha_pryccion,',
'        pageItems: "#F_CDGO_CLNTE, #F_ID_USRIO, #P2025039_JSON_TTLOS"',
'    },{',
'        success: function(data){',
'            if(data.o_cdgo_rspsta !== 0){',
'                Swal.fire({        ',
'                            icon: ''error'',',
unistr('                            title:  ''<H2 >Validaci\00F3n</H2>'','),
'                            html:   `<h4>${data.o_cdgo_rspsta+''-''+data.o_mnsje_rspsta}</h4>`',
'                        }); ',
'            }else{',
'                 Swal.fire({        ',
'                            icon: ''success'',',
'                            title:  ''<H2 >Success</H2>'',',
'                            html:   `<h4>${data.o_mnsje_rspsta}</h4>`',
'                        }).then((result) => {',
'                             apex.item("Save").hide();',
'                             apex.region("Cartera").hide();',
'                             apex.region("cartera2").hide();',
'                         });',
'            }',
'        }',
'    });',
'}',
'',
'registrarcartera();'))
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26323471601166201)
,p_name=>'Al cambiar P2025039_SLDO_RMNTE'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2025039_SLDO_RMNTE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26323515842166202)
,p_event_id=>wwv_flow_api.id(26323471601166201)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let valor = apex.item("P2025039_SLDO_RMNTE").getValue().replace(/\$|\.+/g, '''');',
'',
'valor = parseInt(valor, 10) || 0;',
'',
'if (valor === 0) {',
'    apex.item("Save").show();',
'} else {',
'    apex.item("Save").hide();',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26031530708554805)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar_datos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'     select idntfccion_dmnddo',
'            , id_ttlo_jdcial',
'            , nmro_ttlo_jdcial',
'            , nmbre_dmnddo',
'       into :P2025039_IDNTFCCION_DMNDDO',
'           ,:P2025039_ID_TTLO_JDCIAL',
'           ,:P2025039_NMRO_TTLO_JDCIAL',
'           ,:P2025039_NMBRES_DMNDDO',
'       from v_gf_g_titulos_judicial',
'      where id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'      and rownum = 1;      ',
'exception',
'    when others then',
'        :P2025039_IDNTFCCION_DMNDDO := null;',
'        :P2025039_ID_TTLO_JDCIAL    := null;',
'        :P2025039_NMRO_TTLO_JDCIAL  := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26031843819554808)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Datos_Complementarios'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select b.id_sjto_impsto into :P2025039_ID_SJTO_IMPSTO',
'    from mc_g_embargos_responsable a',
'    join mc_g_embargos_cartera_detalle b on a.id_embrgos_crtra = b.id_embrgos_crtra',
'    where idntfccion = :P2025039_IDNTFCCION_DMNDDO',
'    fetch first row only;',
'exception',
'    when others then',
'        :P2025039_ID_SJTO_IMPSTO := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26363116739681004)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('JsonT\00EDtulos')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select json_arrayagg(',
'                    json_object(''ID_TTLO_JDCIAL''   value a.id_ttlo_jdcial,',
'                                ''ID_INSTNCIA_FLJO'' value a.id_instncia_fljo',
'                                )returning clob',
'                    ) into :P2025039_JSON_TTLOS',
'from gf_g_titulos_judicial a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26362959099681002)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'registrarCartera'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta number := 0;',
'    o_mnsje_rspsta varchar2(4000);',
'    v_json_compensar clob;',
'    v_json_consignar clob;',
'    v_json_ttlos     clob;',
'    v_fcha_pryccion  date;',
'begin',
'    ',
'    v_fcha_pryccion := apex_application.g_x01;',
'    ',
'    for i in 1..apex_application.g_f01.count loop',
'        v_json_compensar := v_json_compensar || apex_application.g_f01(i);',
'    end loop;',
'    ',
'    for i in 1..apex_application.g_f02.count loop',
'        v_json_consignar := v_json_consignar || apex_application.g_f02(i);',
'    end loop;    ',
'    ',
'    ',
'    pkg_gf_titulos_judicial.prc_rg_titulo_vigencias(p_cdgo_clnte    => :F_CDGO_CLNTE,',
'                                                    p_json_ttlos    => :P2025039_JSON_TTLOS,',
'                                                    p_json_crtra    => v_json_consignar,',
'                                                    p_json_compnsar => v_json_compensar,',
'                                                    p_id_usrio      => :F_ID_USRIO,',
'                                                    p_fcha_pryccion => v_fcha_pryccion,',
'                                                    o_cdgo_rspsta   => o_cdgo_rspsta,',
'                                                    o_mnsje_rspsta  => o_mnsje_rspsta);',
'     ',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'    apex_json.close_object();',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
