prompt --application/pages/page_00257
begin
wwv_flow_api.create_page(
 p_id=>257
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Proyecci\00F3n de Aplicaci\00F3n')
,p_step_title=>unistr('Proyecci\00F3n de Aplicaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/accounting.min.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var valor_X_Aplicar = [];',
'       ',
'function ocultarRegion(){   ',
'               ',
'        if(apex.item("P257_TIPO_CONSULTA").getValue() == ''IMP''){',
'            $x_Show("carteraImp");',
'            $x_Hide("cartera2");',
'            apex.item("P257_ID_IMPSTO_1").show();   ',
'            apex.item("P257_ID_IMPSTO_SBMPSTO").show(); ',
'            //apex.item("BTN_CNSLTAR_CRTRAS").show(); ',
'            $("#BTN_CNSLTAR_CRTRAS").show();',
'            $("#BTN_ADD_CRTRA").hide();',
'        }else if(apex.item("P257_TIPO_CONSULTA").getValue() == ''IDT''){',
'            $x_Show("cartera2");',
'            $x_Hide("carteraImp");',
'            $x_Hide("cartera");',
'            apex.item("P257_ID_IMPSTO_1").hide();   ',
'            apex.item("P257_ID_IMPSTO_SBMPSTO").hide(); ',
'           // apex.item("BTN_CNSLTAR_CRTRAS").hide(); ',
'            $("#BTN_CNSLTAR_CRTRAS").hide();',
'            $("#BTN_RGSTRAR_CRTRA").hide(); ',
'        }',
'       else{',
'        $x_Hide("cartera2");',
'        $x_Hide("carteraImp");',
'        $x_Hide("cartera");',
'        apex.item("P257_ID_IMPSTO_1").hide();   ',
'        apex.item("P257_ID_IMPSTO_SBMPSTO").hide(); ',
'        apex.item("P257_IDNTFCCION_SJTO_CM").setValue("");',
'        apex.item("P257_ID_IMPSTO_CM").setValue("");',
'        $("#BTN_CNSLTAR_CRTRAS").hide();',
'        $("#BTN_ADD_CRTRA").hide();        ',
'       ',
'    }',
'}',
'',
'function validaValorTitulo() {',
'',
'    console.log(''INICIA validaValorTitulo'');',
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
'    valor_titulo = $v("P257_VALOR_TTLO").replace(/\$|\.+/g, '''');',
'    console.log(''valor titulo: '' + valor_titulo);',
'',
'    apex.item("P257_VLOR_RMNNTE").setValue("$" + valor_titulo.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'    apex.item("P257_VLOR_RMNNTE_TMP").setValue(valor_titulo);',
'',
'    var view = apex.region("cartera").widget().interactiveGrid("getViews", "grid");',
'    var model = view.model;',
'    var records = view.view$.grid("getSelectedRecords");',
'',
'    model.forEach(function (dato) {',
'        crtra_slccnda = parseInt(model.getValue(dato, "VLOR_TTAL_APLCAR").replace(/\$|\.+/g, ''''));',
'        if (!isNaN(crtra_slccnda)) {',
'            ttl_cartera_slccnda += crtra_slccnda;',
'        }',
'    });',
'',
'    console.log(''total cartera seleccionada en la grilla: '' + ttl_cartera_slccnda);',
'    apex.item("P257_VLOR_SLCCNDO").setValue("$" + ttl_cartera_slccnda.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'',
'    ///table = apex.region("cartera").widget().interactiveGrid("getViews").grid.getSelectedRecords();',
'    ///table.map((data) => {',
'    records.map((data) => {',
'        console.log(data)',
'        valorTotalAplicar = parseInt(model.getValue(data, "VLOR_TTAL_OCULTO"));',
'        console.log(''Valor seleccionado a aplicar: '' + valorTotalAplicar);',
'        //valorTotalAplicacion = valorTotalAplicar;',
'',
'        valorTotalAplicacion = parseInt(model.getValue(data, "VLOR_TTAL_APLCCION").replace(/\$|\.+/g, ''''));',
'',
'        if (Number(valorTotalAplicar) > 0 && Number(valorTotalAplicacion) < Number(valorTotalAplicar)) {',
'',
'            ///vlor_rmnnte = valor_titulo - ttl_cartera_slccnda;',
'            console.log(''valor_titulo 2: '' + valor_titulo);',
'            console.log(''ttl_cartera_slccnda 2: '' + ttl_cartera_slccnda);',
'            console.log(''remanente de titulo 2: '' + vlor_rmnnte);',
'',
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
'                // se coloca el descuento a aplicar completo ',
'                //v_vlor_dscnto_aplcar = parseInt(model.getValue(data,"VLOR_DSCNTO_OCLTO"));',
'                model.setValue(data, "VLOR_DSCNTO_APLCCION", "$" + formatoNumero(v_vlor_dscnto_aplcar, { decimal: '','', thousand: ''.'', precision: 0 }));',
'',
'                ttl_cartera_slccnda += valorTotalAplicar;',
'                console.log(''ttl_cartera_slccnda: '' + Number(ttl_cartera_slccnda));',
'                apex.item("P257_VLOR_SLCCNDO").setValue("$" + ttl_cartera_slccnda.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'',
'            } else if (valorTotalAplicar == ttl_cartera_slccnda && Number(valor_titulo) >= Number(ttl_cartera_slccnda)) {',
'                console.log(''entre if 2: '' + valorTotalAplicar);',
'                model.setValue(data, "VLOR_TTAL_APLCAR", formatoNumero(valorTotalAplicar, { decimal: '','', thousand: ''.'', precision: 0 }));',
'',
'                model.setValue(data, "VLOR_TTAL_APLCCION", "" + formatoNumero(valorTotalAplicar, { decimal: '','', thousand: ''.'', precision: 0 }));',
'                // se coloca el descuento a aplicar completo ',
'                //v_vlor_dscnto_aplcar = parseInt(model.getValue(data,"VLOR_DSCNTO_OCLTO"));',
'                model.setValue(data, "VLOR_DSCNTO_APLCCION", "$" + formatoNumero(v_vlor_dscnto_aplcar, { decimal: '','', thousand: ''.'', precision: 0 }));',
'',
'                ttl_cartera_slccnda += valorTotalAplicar;',
'                console.log(''ttl_cartera_slccnda: '' + Number(ttl_cartera_slccnda));',
'                apex.item("P257_VLOR_SLCCNDO").setValue("$" + ttl_cartera_slccnda.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'',
'            } else if (Number(valor_aplicar_final) > 0 && Number(valor_aplicar_final) <= Number(valorTotalAplicar)) {',
'                console.log(''entre if 3 - valor_aplicar_final: '' + valor_aplicar_final);',
'                model.setValue(data, "VLOR_TTAL_APLCAR", formatoNumero(valor_aplicar_final, { decimal: '','', thousand: ''.'', precision: 0 }));',
'',
'                //v_vlor_dscnto_aplcar = parseInt(model.getValue(data,"VLOR_DSCNTO_OCLTO"));',
'',
'                if (Number(valor_aplicar_final) < Number(valorTotalAplicar)) {',
'                    // Se valida si hay descuento. ',
'                    // Si hay, se le suma el descuento al valor total y el descuento queda en cero(0)',
'                    if (Number(v_vlor_dscnto_aplcar) > 0) {',
'                        console.log(''Docuemnto de abono'');',
'                        vlor_ttal_aplccion = valorTotalAplicar + v_vlor_dscnto_aplcar; //revisar!',
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
'                console.log(''ttl_cartera_slccnda: '' + Number(ttl_cartera_slccnda));',
'                apex.item("P257_VLOR_SLCCNDO").setValue("$" + ttl_cartera_slccnda.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'            }',
'',
'            vlor_rmnnte = valor_titulo - ttl_cartera_slccnda;',
'            if (Number(vlor_rmnnte) < 0) {',
'                vlor_rmnnte = 0;',
'            }',
'            apex.item("P257_VLOR_RMNNTE").setValue("$" + vlor_rmnnte.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'            apex.item("P257_VLOR_RMNNTE_TMP").setValue(vlor_rmnnte);',
'',
'            // FIN NUEVO    ',
'        }',
'    })',
'',
'    //buildJsonCartera',
'    var region = apex.region(''cartera'');',
'',
'    if (region) {',
'',
'        var view = apex.region("cartera").widget().interactiveGrid("getViews", "grid");',
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
'        $s(''P257_JSON_CRTRAS'', JSON.stringify(json));',
'        //    console.log(''json_cartera P257_JSON_CRTRAS: '' + JSON.stringify(json));',
'    };',
'    //end buildJsonCartera',
'    saldoTitulos("cartera");',
'};',
'',
'function validaValorTituloCP() {',
'',
'    console.log(''INICIA validaValorTituloCP'');',
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
'',
'    valor_titulo = $v("P257_VALOR_TTLO_CM").replace(/\$|\.+/g, '''');',
'    console.log(''valor titulo: '' + valor_titulo);',
'',
'    // vlor_rmnnte = valor_titulo - ttl_cartera_slccnda;',
'',
'    apex.item("P257_VLOR_RMNNTE_CM").setValue("$" + valor_titulo.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'    apex.item("P257_VLOR_RMNNTE_TMP_CM").setValue(valor_titulo);',
'',
'    var view = apex.region("cartera2").widget().interactiveGrid("getViews", "grid");',
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
'    apex.item("P257_VLOR_SLCCNDO_CM").setValue("$" + ttl_cartera_slccnda.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'',
'',
'    records.map((data) => {',
'        console.log(data)',
'        valorTotalAplicar = parseInt(model.getValue(data, "VLOR_TTAL_OCULTO"));',
'        console.log(''Valor seleccionado a aplicar: '' + valorTotalAplicar);',
'',
'        valorTotalAplicacion = parseInt(model.getValue(data, "VLOR_TTAL_APLCCION").replace(/\$|\.+/g, ''''));',
'        ',
'        if (Number(valorTotalAplicar) > 0 && Number(valorTotalAplicacion) < Number(valorTotalAplicar) ) {',
'            ',
'            valorTotalAplicacion = valorTotalAplicar;',
'',
'            ///vlor_rmnnte = valor_titulo - ttl_cartera_slccnda;',
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
'                apex.item("P257_VLOR_SLCCNDO_CM").setValue("$" + ttl_cartera_slccnda.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
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
'                apex.item("P257_VLOR_SLCCNDO_CM").setValue("$" + ttl_cartera_slccnda.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
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
'                apex.item("P257_VLOR_SLCCNDO_CM").setValue("$" + ttl_cartera_slccnda.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'            }',
'',
'            vlor_rmnnte = valor_titulo - ttl_cartera_slccnda;',
'            if (Number(vlor_rmnnte) < 0) {',
'                vlor_rmnnte = 0;',
'            }',
'            apex.item("P257_VLOR_RMNNTE_CM").setValue("$" + vlor_rmnnte.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'            apex.item("P257_VLOR_RMNNTE_TMP_CM").setValue(vlor_rmnnte);',
'',
'            // FIN NUEVO    ',
'        }',
'    })',
'',
'',
'    //buildJsonCartera',
'    var region = apex.region(''cartera2'');',
'',
'    if (region) {',
'',
'        var view = apex.region("cartera2").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'',
'        var json = records.map((cartera2) => {',
'            return {',
'                "ID_IMPSTO": model.getValue(cartera2, "ID_IMPSTO"),',
'                "ID_IMPSTO_SBMPSTO": model.getValue(cartera2, "ID_IMPSTO_SBMPSTO"),',
'                "ID_SJTO_IMPSTO": model.getValue(cartera2, "ID_SJTO_IMPSTO"),',
'                "ID_SJTO_RSPNSBLE": model.getValue(cartera2, "ID_SJTO_RSPNSBLE"),',
'                "VGNCIA": model.getValue(cartera2, "VGNCIA"),',
'                "ID_PRDO": model.getValue(cartera2, "ID_PRDO"),',
'                "CNSCTVO_EMBRGO": model.getValue(cartera2, "CNSCTVO_EMBRGO"),',
'                "VLOR_TTAL": model.getValue(cartera2, "VLOR_TTAL"),',
'                "VLOR_DSCNTO": model.getValue(cartera2, "VLOR_DSCNTO"),',
'                "VLOR_TTAL_APLCAR": model.getValue(cartera2, "VLOR_TTAL_APLCAR"),',
'                "VLOR_TTAL_APLCCION": model.getValue(cartera2, "VLOR_TTAL_APLCCION"),',
'                "VLOR_DSCNTO_APLCCION": model.getValue(cartera2, "VLOR_DSCNTO_APLCCION"),',
'                "TPO_DCMNTO": model.getValue(cartera2, "TPO_DCMNTO"),',
'                "CDGO_MVMNTO_ORGN": model.getValue(cartera2, "CDGO_MVMNTO_ORGN"),',
'                "ID_ORGEN": model.getValue(cartera2, "ID_ORGEN")',
'            };',
'        });',
'',
'        $s(''P257_JSON_CRTRAS_2'', JSON.stringify(json));',
'        console.log(''json_cartera2: '' + JSON.stringify(json));',
'    };',
'    //end buildJsonCartera',
'    saldoTitulos("cartera2");',
'};',
'',
'function validaAplicacion_2(p_this) {',
'',
'    console.log(''item_vlor: '' + p_this);//jga  ',
'',
'    var ttl_aplcar = 0;',
'    var viewCartera = apex.region("cartera").widget().interactiveGrid("getViews", "grid");',
'    var modelCartera = viewCartera.model;',
'',
'    modelCartera.forEach(function (dato) {',
'        console.log(''valores compensados: '' + parseInt(modelCartera.getValue(dato, "VLOR_TTAL").replace(/\./g, '''')));',
'        ttl_aplcar = ttl_aplcar + parseInt(modelCartera.getValue(dato, "VLOR_TTAL").replace(/\./g, ''''));',
'    });',
'',
'    console.log(''total aplicar: '' + ttl_aplcar);',
'',
'    return ttl_aplcar;',
'}',
'',
'function validaAplicacion_3(p_this) {',
'',
'    console.log(''item_vlor: '' + p_this);//jga  ',
'',
'    var ttl_aplcar = 0;',
'    var viewCartera = apex.region("cartera2").widget().interactiveGrid("getViews", "grid");',
'    var modelCartera = viewCartera.model;',
'',
'    modelCartera.forEach(function (dato) {',
'        console.log(''valores compensados: '' + parseInt(modelCartera.getValue(dato, "VLOR_TTAL").replace(/\./g, '''')));',
'        ttl_aplcar = ttl_aplcar + parseInt(modelCartera.getValue(dato, "VLOR_TTAL").replace(/\./g, ''''));',
'    });',
'',
'    console.log(''total aplicar: '' + ttl_aplcar);',
'',
'    return ttl_aplcar;',
'}',
'',
'function buildJsonTitulos() {',
'',
'    var region = apex.region(''titulos'');',
'',
'    if (region) {',
'',
'        var view = apex.region("titulos").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = model._data;//view.view$.grid("getSelectedRecords");',
'',
'        var jsonTitulos = records.map((titulos) => {',
'            return {',
'                "ID_TTLO_JDCIAL": model.getValue(titulos, "ID_TTLO_JDCIAL"),',
'                "TTLO_JDCIAL_ESTDO": model.getValue(titulos, "TTLO_JDCIAL_ESTDO"),',
'                "ID_INSTNCIA_FLJO": model.getValue(titulos, "ID_INSTNCIA_FLJO")',
'            };',
'        });',
'        $s(''P257_JSON_TTLOS'', JSON.stringify(jsonTitulos));',
'        console.log(''json_titulos: '' + JSON.stringify(jsonTitulos))',
'        //window.localStorage.setItem(''jsonTitulos'', JSON.stringify(jsonTitulos));',
'    }',
'};',
'',
'',
'',
'function obtenerCartera() {',
'',
'    var region = apex.region("cartera");',
'',
'    if (region) {',
'',
'        var view = apex.region("cartera").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'',
'        var records = model._data.filter(function (record) {',
'            return model.getValue(record, "VLOR_TTAL_APLCAR").trim().replace(/\./g, "") > 0',
'        });',
'',
'        //Obtenemos un json con los datos seleccionados que no han sido procesados',
'        var jsonCartera = records.map((cartera) => {',
'            return {',
'                "ID_IMPSTO": model.getValue(cartera, "ID_IMPSTO"),',
'                "ID_IMPSTO_SBMPSTO": model.getValue(cartera, "ID_IMPSTO_SBMPSTO"),',
'                "ID_SJTO_IMPSTO": model.getValue(cartera, "ID_SJTO_IMPSTO"),',
'                "ID_SJTO_RSPNSBLE": model.getValue(cartera, "ID_SJTO_RSPNSBLE"),',
'                "VGNCIA": model.getValue(cartera, "VGNCIA"),',
'                "PRDO": model.getValue(cartera, "PRDO"),',
'                "ID_PRDO": model.getValue(cartera, "ID_PRDO"),',
'                "CNSCTVO_EMBRGO": model.getValue(cartera, "CNSCTVO_EMBRGO"),',
'                "VLOR_SLDO_CPTAL": model.getValue(cartera, "VLOR_SLDO_CPTAL").trim().replace(/\./g, "").replace(''$'', ''''),',
'                "VLOR_SLDO_INTRES": model.getValue(cartera, "VLOR_SLDO_INTRES").trim().replace(/\./g, "").replace(''$'', ''''),',
'                "VLOR_TTAL": model.getValue(cartera, "VLOR_TTAL").trim().replace(/\./g, "").replace(''$'', ''''),',
'                "VLOR_DSCNTO": model.getValue(cartera, "VLOR_DSCNTO").trim().replace(/\./g, "").replace(''$'', ''''),',
'                "VLOR_TTAL_APLCAR": model.getValue(cartera, "VLOR_TTAL_APLCAR").trim().replace(/\./g, "").replace(''$'', ''''),',
'                "VLOR_TTAL_APLCCION": model.getValue(cartera, "VLOR_TTAL_APLCCION").trim().replace(/\./g, "").replace(''$'', ''''),',
'                "VLOR_DSCNTO_APLCCION": model.getValue(cartera, "VLOR_DSCNTO_APLCCION").trim().replace(/\./g, "").replace(''$'', ''''),',
'                "TPO_DCMNTO": model.getValue(cartera, "TPO_DCMNTO"),',
'                "CDGO_MVMNTO_ORGN": model.getValue(cartera, "CDGO_MVMNTO_ORGN"),',
'                "ID_ORGEN": model.getValue(cartera, "ID_ORGEN")',
'            };',
'        });',
'        //replace(/\$|\.+/g, ''''),',
'        window.localStorage.setItem(''jsoncartera'', JSON.stringify(jsonCartera));',
'        $s(''P257_JSON_CRTRAS'', JSON.stringify(jsonCartera));',
'        console.log(''json_cartera de obtenerCartera(): '' + JSON.stringify(jsonCartera));',
'',
'        //apex.region("cartera").widget().interactiveGrid("setSelectedRecords", records);',
'',
'        //return json;',
'    }',
'}',
'',
'function obtenerCarteraCP() {',
'',
'    var region = apex.region("cartera2");',
'',
'    if (region) {',
'',
'        var view = apex.region("cartera2").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'',
'        var records = model._data.filter(function (record) {',
'            return model.getValue(record, "VLOR_TTAL_APLCAR").trim().replace(/\./g, "") > 0',
'        });',
'',
'        //Obtenemos un json con los datos seleccionados que no han sido procesados',
'        var jsonCarteraTemp = records.map((cartera2) => {',
'            return {',
'                "ID_IMPSTO": model.getValue(cartera2, "ID_IMPSTO"),',
'                "ID_IMPSTO_SBMPSTO": model.getValue(cartera2, "ID_IMPSTO_SBMPSTO"),',
'                "ID_SJTO_IMPSTO": model.getValue(cartera2, "ID_SJTO_IMPSTO"),',
'                "ID_SJTO_RSPNSBLE": model.getValue(cartera2, "ID_SJTO_RSPNSBLE"),',
'                "VGNCIA": model.getValue(cartera2, "VGNCIA"),',
'                "PRDO": model.getValue(cartera2, "PRDO"),',
'                "ID_PRDO": model.getValue(cartera2, "ID_PRDO"),',
'                "CNSCTVO_EMBRGO": model.getValue(cartera2, "CNSCTVO_EMBRGO"),',
'                "VLOR_SLDO_CPTAL": model.getValue(cartera2, "VLOR_SLDO_CPTAL").trim().replace(/\./g, "").replace(''$'', ''''),',
'                "VLOR_SLDO_INTRES": model.getValue(cartera2, "VLOR_SLDO_INTRES").trim().replace(/\./g, "").replace(''$'', ''''),',
'                "VLOR_TTAL": model.getValue(cartera2, "VLOR_TTAL").trim().replace(/\./g, "").replace(''$'', ''''),',
'                "VLOR_DSCNTO": model.getValue(cartera2, "VLOR_DSCNTO").trim().replace(/\./g, "").replace(''$'', ''''),',
'                "VLOR_TTAL_APLCAR": model.getValue(cartera2, "VLOR_TTAL_APLCAR").trim().replace(/\./g, "").replace(''$'', ''''),',
'                "VLOR_TTAL_APLCCION": model.getValue(cartera2, "VLOR_TTAL_APLCCION").trim().replace(/\./g, "").replace(''$'', ''''),',
'                "VLOR_DSCNTO_APLCCION": model.getValue(cartera2, "VLOR_DSCNTO_APLCCION").trim().replace(/\./g, "").replace(''$'', ''''),',
'                "TPO_DCMNTO": model.getValue(cartera2, "TPO_DCMNTO"),',
'                "CDGO_MVMNTO_ORGN": model.getValue(cartera2, "CDGO_MVMNTO_ORGN"),',
'                "ID_ORGEN": model.getValue(cartera2, "ID_ORGEN")',
'            };',
'        });',
'        //replace(/\$|\.+/g, ''''),',
'        window.localStorage.setItem(''jsonCarteraTemp'', JSON.stringify(jsonCarteraTemp));',
'        $s(''P257_JSON_CRTRAS_2'', JSON.stringify(jsonCarteraTemp));',
'        console.log(''jsonCarteraTemp: '' + JSON.stringify(jsonCarteraTemp));',
'       ',
'',
'        //apex.region("cartera").widget().interactiveGrid("setSelectedRecords", records);',
'',
'        //return json;',
'    }',
'}',
'',
'function limpiarItems(){',
'    apex.item("P257_ID_IMPSTO_CM").setValue("");',
'    apex.item("P257_ID_IMPSTO_SBMPSTO_CM").setValue("");',
'    apex.item("P257_IDNTFCCION_SJTO_CM").setValue("");',
'}',
'',
'function desmarcarVigencia(region) {',
'',
'    console.log(''Inicia desmarcarVigencia'');',
'',
'    var v_vlor_ttal_slccndo = 0;',
'    var v_vlor_ttlos = 0;',
'    var v_vlor_sldo_rmnte = 0;',
'    var v_vlor_ttal_plcar = 0;',
'    var v_vlor_ttal_aplccion = 0;',
'    var v_vlor_dscnto_aplccion = 0;',
'    var v_crtra_slccnda = 0;',
'    var v_tpo_dcmnto;',
'',
'    if (region == ''cartera'') {',
'',
'        var view = apex.region("cartera").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        v_vlor_ttlos = $v("P257_VALOR_TTLO").replace(/\$|\.+/g, '''');',
'        v_vlor_ttal_slccndo = $v("P257_VLOR_SLCCNDO").replace(/\$|\.+/g, '''');',
'        v_vlor_sldo_rmnte = $v("P257_VLOR_RMNNTE").replace(/\$|\.+/g, '''');',
'',
'        records.map((data) => {',
'            ',
'            console.log(''valor titulos: '' + v_vlor_ttlos);',
'            console.log(''valor seleccionado antes: '' + v_vlor_ttal_slccndo);',
'            console.log(''valor remannete antes: '' + v_vlor_sldo_rmnte);',
'',
'            v_vlor_ttal_plcar = parseInt(model.getValue(data, "VLOR_TTAL_APLCAR").replace(/\$|\.+/g, ''''));',
'            v_vlor_ttal_aplccion = parseInt(model.getValue(data, "VLOR_TTAL_APLCCION").replace(/\$|\.+/g, ''''));',
'            v_vlor_dscnto_aplccion = parseInt(model.getValue(data, "VLOR_DSCNTO_APLCCION").replace(/\$|\.+/g, ''''));',
'',
'            console.log(''Valor aplicar: '' + v_vlor_ttal_plcar);',
'            console.log(''Valor Aplicacion: '' + v_vlor_ttal_aplccion);',
'            console.log(''Valor descuenot aplicacion: '' + v_vlor_dscnto_aplccion);',
'',
'            v_vlor_ttal_slccndo = v_vlor_ttal_slccndo - v_vlor_ttal_plcar;',
'            v_vlor_sldo_rmnte = v_vlor_ttlos - v_vlor_ttal_slccndo;',
'',
unistr('            console.log(''valor seleccionado despu\00E9s: '' + v_vlor_ttal_slccndo);'),
unistr('            console.log(''valor remannete despu\00E9s: '' + v_vlor_sldo_rmnte);'),
'',
'            model.setValue(data, "VLOR_TTAL_APLCAR", "" + 0);',
'            model.setValue(data, "VLOR_TTAL_APLCCION", "" + 0);',
'            model.setValue(data, "VLOR_DSCNTO_APLCCION", "" + 0);',
'            model.setValue(data, "TPO_DCMNTO", ''DNO'');',
'',
'            apex.item("P257_VLOR_SLCCNDO").setValue("$" + v_vlor_ttal_slccndo.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'            apex.item("P257_VLOR_RMNNTE").setValue("$" + v_vlor_sldo_rmnte.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'        });',
'        view.setSelectedRecords([]);',
'         saldoTitulos("cartera");',
'    }',
'    else if (region == ''cartera2'') {',
'',
'        var view = apex.region("cartera2").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'',
'        v_vlor_ttlos = $v("P257_VALOR_TTLO_CM").replace(/\$|\.+/g, '''');',
'        v_vlor_ttal_slccndo = $v("P257_VLOR_SLCCNDO_CM").replace(/\$|\.+/g, '''');',
'        v_vlor_sldo_rmnte = $v("P257_VLOR_RMNNTE_CM").replace(/\$|\.+/g, '''');',
'        ',
'        console.log(''valor titulos: '' + v_vlor_ttlos);',
'        console.log(''valor seleccionado antes: '' + v_vlor_ttal_slccndo);',
'        console.log(''valor remannete antes: '' + v_vlor_sldo_rmnte);',
'        ',
'        records.map((data) => {',
'',
'            v_vlor_ttal_plcar = parseInt(model.getValue(data, "VLOR_TTAL_APLCAR").replace(/\$|\.+/g, ''''));',
'',
'            console.log(''Valor aplicar: '' + v_vlor_ttal_plcar);',
'',
'            model.setValue(data, "VLOR_TTAL_APLCAR", "" + 0);',
'            model.setValue(data, "VLOR_TTAL_APLCCION", "" + 0);',
'            model.setValue(data, "VLOR_DSCNTO_APLCCION", "" + 0);',
'            model.setValue(data, "TPO_DCMNTO", ''DNO'');',
'         //   model.setValue(data,"APEX$ROW_SELECTOR",null);',
'            ',
'        });   ',
'            ',
'        v_vlor_ttal_slccndo = v_vlor_ttal_slccndo - v_vlor_ttal_plcar;',
'        v_vlor_sldo_rmnte = v_vlor_ttlos - v_vlor_ttal_slccndo;',
'            ',
unistr('        console.log(''valor seleccionado despu\00E9s: '' + v_vlor_ttal_slccndo);'),
unistr('        console.log(''valor remannete despu\00E9s: '' + v_vlor_sldo_rmnte);'),
'',
'        apex.item("P257_VLOR_SLCCNDO_CM").setValue("$" + v_vlor_ttal_slccndo.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'        apex.item("P257_VLOR_RMNNTE_CM").setValue("$" + v_vlor_sldo_rmnte.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'',
'        view.setSelectedRecords([]);',
'    }',
'    saldoTitulos("cartera2");',
'}',
'',
'function saldoTitulos(region){',
'    ',
'    var v_vlor_ttlos = 0;',
'    var v_vlor_sldo_rmnte = 0;',
'    var v_vlor_ttal_slccndo = 0;',
'    ',
'    if (region == ''cartera2'') {',
'    ',
'        v_vlor_ttlos = $v("P257_VALOR_TTLO_CM").replace(/\$|\.+/g, '''');',
'        v_vlor_ttal_slccndo = $v("P257_VLOR_SLCCNDO_CM").replace(/\$|\.+/g, '''');',
'    ',
'        v_vlor_sldo_rmnte = v_vlor_ttlos - v_vlor_ttal_slccndo;',
'         if (v_vlor_sldo_rmnte < 0) {',
'            v_vlor_sldo_rmnte = 0;',
'        }',
'        apex.item("P257_VLOR_RMNNTE_CM").setValue("$" + v_vlor_sldo_rmnte.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'    }',
'    else if (region == ''cartera'') {',
'        v_vlor_ttlos = $v("P257_VALOR_TTLO").replace(/\$|\.+/g, '''');',
'        v_vlor_ttal_slccndo = $v("P257_VLOR_SLCCNDO").replace(/\$|\.+/g, '''');',
'    ',
'        v_vlor_sldo_rmnte = v_vlor_ttlos - v_vlor_ttal_slccndo;',
'        if (v_vlor_sldo_rmnte < 0) {',
'            v_vlor_sldo_rmnte = 0;',
'        }',
'        apex.item("P257_VLOR_RMNNTE").setValue("$" + v_vlor_sldo_rmnte.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'    }',
'}',
'',
'function validoSaldo() {',
'    ',
'    var v_vlor_sldo_rmnte1 = parseFloat($v("P257_VLOR_RMNNTE").replace(/\$|,/g, '''')) || 0;',
'    var v_vlor_sldo_rmnte2 = parseFloat($v("P257_VLOR_RMNNTE_CM").replace(/\$|,/g, '''')) || 0;',
'',
'    ',
'    if (v_vlor_sldo_rmnte1 === 0 && v_vlor_sldo_rmnte2 === 0) {',
'        $("#BTN_VGNCIAS_FTRAS").hide();',
'    }',
'}',
'',
'',
'    ',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'buildJsonTitulos();',
'ocultarRegion();',
'console.log(''item: ''+apex.item("P257_TIPO_CONSULTA").getValue())'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_browser_cache=>'N'
,p_last_updated_by=>'ACONDE'
,p_last_upd_yyyymmddhh24miss=>'20260225230143'
);
end;
/
begin
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(11815637842526101)
,p_plug_name=>unistr('<b>Proceso Puntual T\00EDtulo Judicial No. &P257_NMRO_TTLO_JDCIAL. </b>')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22157691113117201)
,p_plug_name=>unistr('<b>Cartera Comprometidas Por Otros T\00EDtulos</b>')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>100
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_ttlo_jdcial,',
'       b.id_impsto,',
'       b.id_impsto_sbmpsto,',
'       d.idntfccion_sjto,',
'       c.vgncia,',
'       c.id_prdo,',
'       c.vlor_cptal,',
'       c.vlor_intres,',
'       c.vlor_dscto,',
'       c.vlor_ttal,',
'       c.vlor_ttal_ttlo,',
'       c.id_orgen,',
'       c.vlor_ttal_aplcar,',
'       c.vlor_ttal_aplccion,',
'       c.vlor_dscnto_aplccion,',
'       case',
'         when c.tpo_dcmnto = ''DAB'' then',
'          ''Abono''',
'         else',
'          ''Pago Total''',
'       end as tpo_dcmnto,',
'       c.cdgo_mvmnto_orgn,',
'       c.prdo',
'  from gf_g_titulos_judicial a',
'  join gf_g_titulos_jdcial_impsto b',
'    on b.id_ttlo_jdcial = a.id_ttlo_jdcial',
'  join gf_g_titulos_jdcial_vgncia c',
'    on c.id_ttlo_jdcial_impsto = b.id_ttlo_jdcial_impsto',
'  join v_si_i_sujetos_impuesto d',
'    on d.id_sjto_impsto = b.id_sjto_impsto',
' where a.idntfccion_dmnddo = :P257_IDNTFCCION_DMNDDO',
'   and a.cdgo_ttlo_jdcial_estdo != ''CNS'' --Consignado',
'   and a.id_instncia_fljo != :F_ID_INSTNCIA_FLJO;',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  1  ',
' from   gf_g_titulos_judicial a join gf_g_titulos_jdcial_impsto b  on b.id_ttlo_jdcial = a.id_ttlo_jdcial',
'                                join gf_g_titulos_jdcial_vgncia c  on c.id_ttlo_jdcial_impsto = b.id_ttlo_jdcial_impsto',
' where  a.idntfccion_dmnddo = :P257_IDNTFCCION_DMNDDO',
'        and a.cdgo_ttlo_jdcial_estdo != ''ATJ''   --Consignado',
'        and a.id_instncia_fljo != :F_ID_INSTNCIA_FLJO;'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(22157863853117203)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_is_required=>true
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(22157937457117204)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(22158037208117205)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Sub Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_is_required=>true
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(22158101184117206)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(22158280303117207)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Inter\00E9s')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
,p_is_required=>true
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(22158311485117208)
,p_name=>'VLOR_TTAL_TTLO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_TTLO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Total T\00EDtulo')
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
 p_id=>wwv_flow_api.id(22158468602117209)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Origen'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(22158509701117210)
,p_name=>'VLOR_TTAL_APLCAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_APLCAR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Total <br> a Aplicar'
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
 p_id=>wwv_flow_api.id(22158659446117211)
,p_name=>'VLOR_TTAL_APLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_APLCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Total<br>Aplicaci\00F3n')
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
 p_id=>wwv_flow_api.id(22158763046117212)
,p_name=>'VLOR_DSCNTO_APLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DSCNTO_APLCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Descuento <br>Aplicaci\00F3n')
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
 p_id=>wwv_flow_api.id(22158893038117213)
,p_name=>'TPO_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_DCMNTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo <br>Documento'
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
 p_id=>wwv_flow_api.id(22158971544117214)
,p_name=>'CDGO_MVMNTO_ORGN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVMNTO_ORGN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Movimiento<br> Origen'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(22159081699117215)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
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
 p_id=>wwv_flow_api.id(22159109074117216)
,p_name=>'VLOR_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(22159210731117217)
,p_name=>'VLOR_DSCTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DSCTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Descuento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
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
 p_id=>wwv_flow_api.id(22159357747117218)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
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
 p_id=>wwv_flow_api.id(22159403717117219)
,p_name=>'NMRO_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_JDCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('No. T\00EDtulo<br> Judicial')
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(25336222177114901)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(22157799286117202)
,p_internal_uid=>22157799286117202
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
 p_id=>wwv_flow_api.id(22164494063138541)
,p_interactive_grid_id=>wwv_flow_api.id(22157799286117202)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(22164533907138541)
,p_report_id=>wwv_flow_api.id(22164494063138541)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22165088825138557)
,p_view_id=>wwv_flow_api.id(22164533907138541)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(22157863853117203)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>83
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22165575493138561)
,p_view_id=>wwv_flow_api.id(22164533907138541)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(22157937457117204)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>184
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22166035375138564)
,p_view_id=>wwv_flow_api.id(22164533907138541)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(22158037208117205)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>176
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22166544847138565)
,p_view_id=>wwv_flow_api.id(22164533907138541)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(22158101184117206)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>72
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22167015590138567)
,p_view_id=>wwv_flow_api.id(22164533907138541)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(22158280303117207)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>123
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22167589134138570)
,p_view_id=>wwv_flow_api.id(22164533907138541)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(22158311485117208)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22168009308138571)
,p_view_id=>wwv_flow_api.id(22164533907138541)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(22158468602117209)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>87
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22168522074138576)
,p_view_id=>wwv_flow_api.id(22164533907138541)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(22158509701117210)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>118
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22169066584138578)
,p_view_id=>wwv_flow_api.id(22164533907138541)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(22158659446117211)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22169592060138580)
,p_view_id=>wwv_flow_api.id(22164533907138541)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(22158763046117212)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>114
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22170033466138583)
,p_view_id=>wwv_flow_api.id(22164533907138541)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(22158893038117213)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>92
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22170501326138585)
,p_view_id=>wwv_flow_api.id(22164533907138541)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(22158971544117214)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>94
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22171003613138587)
,p_view_id=>wwv_flow_api.id(22164533907138541)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(22159081699117215)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>91
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22171540814138589)
,p_view_id=>wwv_flow_api.id(22164533907138541)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(22159109074117216)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22172032766138591)
,p_view_id=>wwv_flow_api.id(22164533907138541)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(22159210731117217)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>118
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22172533353138593)
,p_view_id=>wwv_flow_api.id(22164533907138541)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(22159357747117218)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>115
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22174273856153889)
,p_view_id=>wwv_flow_api.id(22164533907138541)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(22159403717117219)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(25342237860115352)
,p_view_id=>wwv_flow_api.id(22164533907138541)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(25336222177114901)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>180
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(130335000001)
,p_view_id=>wwv_flow_api.id(22164533907138541)
,p_execution_seq=>5
,p_name=>'Documento de Abono'
,p_background_color=>'#99FF99'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(22158893038117213)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'DAB'
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(115428000004)
,p_view_id=>wwv_flow_api.id(22164533907138541)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(22159109074117216)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(273979000007)
,p_view_id=>wwv_flow_api.id(22164533907138541)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(22158280303117207)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(299086000007)
,p_view_id=>wwv_flow_api.id(22164533907138541)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(22159210731117217)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(428563000007)
,p_view_id=>wwv_flow_api.id(22164533907138541)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(22159357747117218)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(542667000007)
,p_view_id=>wwv_flow_api.id(22164533907138541)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(22158509701117210)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24682770243334513)
,p_plug_name=>unistr('<b>Consulta Cartera Por Identificaci\00F3n</b>')
,p_region_name=>'cartera2'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with carteras as',
' (select k.nmro_prcso_jrdco,',
'         k.cnsctvo_embrgo,',
'         k.idntfccion_sjto,',
'         k.id_impsto,',
'         k.id_impsto_sbmpsto,',
'         k.vgncia,',
'         k.prdo,',
'         k.id_prdo,',
'         k.id_sjto_impsto,',
'         k.id_sjto_rspnsble,',
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
'    from (select a.nmro_prcso_jrdco,',
'                 a.cnsctvo_embrgo,',
'                 i.idntfccion_sjto,',
'                 f.id_impsto,',
'                 f.id_impsto_sbmpsto,',
'                 b.vgncia,',
'                 b.prdo,',
'                 b.id_prdo,',
'                 f.id_sjto_impsto,',
'                 r.id_sjto_rspnsble,',
'                 b.vlor_sldo_cptal,',
'                 b.vlor_intres,',
'                 (b.vlor_sldo_cptal + b.vlor_intres) as total,',
'                 nvl((select case',
'                              when sum(vlor_dscnto) < b.vlor_sldo_cptal and',
'                                   sum(vlor_dscnto) > 0 then',
'                               sum(vlor_dscnto)',
'                              when sum(vlor_dscnto) > b.vlor_sldo_cptal and',
'                                   sum(vlor_dscnto) > 0 then',
'                               b.vlor_sldo_cptal',
'                            end as vlor_dscnto',
'                       from table(pkg_re_documentos.fnc_cl_descuento_x_vgncia_prdo(p_cdgo_clnte           => f.cdgo_clnte,',
'                                                                                   p_id_impsto            => f.id_impsto,',
'                                                                                   p_id_impsto_sbmpsto    => f.id_impsto_sbmpsto,',
'                                                                                   p_vgncia               => b.vgncia,',
'                                                                                   p_id_prdo              => b.id_prdo,',
'                                                                                   p_id_cncpto            => b.id_cncpto,',
'                                                                                   p_id_sjto_impsto       => f.id_sjto_impsto,',
'                                                                                   p_fcha_pryccion        => :P257_FCHA_PRYCCION,',
'                                                                                   p_vlor                 => b.vlor_sldo_cptal,',
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
'                                                                                                                        join v_df_i_periodos y',
'                                                                                                                          on x.id_prdo =',
'                                                                                                                             y.id_prdo',
'                                                                                                                        join si_i_sujetos_impuesto z',
'                                                                                                                          on z.id_sjto_impsto =',
'                                                                                                                             x.id_sjto_impsto',
'                                                                                                                         and z.id_sjto_estdo = 1',
'                                                                                                                       where x.vlor_sldo_cptal > 0',
'                                                                                                                         and x.cdgo_mvnt_fncro_estdo in',
'                                                                                                                             (''NO'',',
'                                                                                                                              ''CN'')',
'                                                                                                                         and x.id_sjto_impsto =',
'                                                                                                                             f.id_sjto_impsto',
'                                                                                                                       group by x.vgncia,',
'                                                                                                                                y.prdo,',
'                                                                                                                                x.id_orgen)), --:P257_JSON_VGNCIAS_PRDO,',
'                                                                                   p_cdna_vgncia_prdo_ps  => null))),',
'                     0) + nvl((select vlor_dscnto',
'                                from table(pkg_re_documentos.fnc_cl_descuento_x_vgncia_prdo(p_cdgo_clnte           => f.cdgo_clnte,',
'                                                                                            p_id_impsto            => f.id_impsto,',
'                                                                                            p_id_impsto_sbmpsto    => f.id_impsto_sbmpsto,',
'                                                                                            p_vgncia               => b.vgncia,',
'                                                                                            p_id_prdo              => b.id_prdo,',
'                                                                                            p_id_cncpto            => b.id_cncpto_intres_mra,',
'                                                                                            p_id_sjto_impsto       => f.id_sjto_impsto,',
'                                                                                            p_fcha_pryccion        => :P257_FCHA_PRYCCION, --:P257_FCHA_PRYCCION,',
'                                                                                            p_vlor                 => b.vlor_intres,',
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
'                                                                                                                                 join v_df_i_periodos y',
'                                                                                                                                   on x.id_prdo =',
'                                                                                                                                      y.id_prdo',
'                                                                                                                                 join si_i_sujetos_impuesto z',
'                                                                                                                                   on z.id_sjto_impsto =',
'                                                                                                                                      x.id_sjto_impsto',
'                                                                                                                                  and z.id_sjto_estdo = 1',
'                                                                                                                                where x.vlor_sldo_cptal > 0',
'                                                                                                                                  and x.cdgo_mvnt_fncro_estdo in',
'                                                                                                                                      (''NO'',',
'                                                                                                                                       ''CN'')',
'                                                                                                                                  and x.id_sjto_impsto =',
'                                                                                                                                      f.id_sjto_impsto',
'                                                                                                                                group by x.vgncia,',
'                                                                                                                                         y.prdo,',
'                                                                                                                                         x.id_orgen)), --:P257_JSON_VGNCIAS_PRDO,',
'                                                                                            p_cdna_vgncia_prdo_ps  => null',
'                                                                                            -- Ley 2155',
'                                                                                           ,',
'                                                                                            p_cdgo_mvmnto_orgn => b.cdgo_mvmnto_orgn,',
'                                                                                            p_id_orgen         => b.id_orgen,',
'                                                                                            p_vlor_cptal       => b.vlor_sldo_cptal,',
'                                                                                            P_ID_CNCPTO_BASE   => b.id_cncpto))),',
'                              0) as vlor_dscnto,',
'                 b.cdgo_mvmnto_orgn,',
'                 b.id_orgen',
'            from gf_g_movimientos_financiero f',
'            left join (select id_mvmnto_fncro,',
'                             cdgo_clnte,',
'                             id_impsto,',
'                             id_impsto_sbmpsto,',
'                             id_sjto_impsto,',
'                             nmro_prcso_jrdco,',
'                             cnsctvo_embrgo',
'                        from v_mc_g_embargos_cartera_detalle',
'                       group by id_mvmnto_fncro,',
'                                cdgo_clnte,',
'                                id_impsto,',
'                                id_impsto_sbmpsto,',
'                                id_sjto_impsto,',
'                                nmro_prcso_jrdco,',
'                                cnsctvo_embrgo) a',
'              on f.id_mvmnto_fncro = a.id_mvmnto_fncro',
'             and a.cdgo_clnte = f.cdgo_clnte',
'             and a.id_impsto = f.id_impsto',
'             and a.id_impsto_sbmpsto = f.id_impsto_sbmpsto',
'             and a.id_sjto_impsto = f.id_sjto_impsto',
'            join v_si_i_sujetos_impuesto i',
'              on i.id_sjto_impsto = f.id_sjto_impsto',
'             and i.id_sjto_estdo = 1',
'            join table(pkg_gf_movimientos_financiero.fnc_co_mvmnto_x_cncpto(p_cdgo_clnte => f.cdgo_clnte, p_id_impsto => f.id_impsto, p_id_impsto_sbmpsto => f.id_impsto_sbmpsto, p_id_sjto_impsto => f.id_sjto_impsto, p_fcha_vncmnto => :P257_FCHA_PRYCC'
||'ION)) b',
'              on f.id_mvmnto_fncro = b.id_mvmnto_fncro',
'             and f.vgncia = b.vgncia',
'             and f.id_prdo = b.id_prdo',
'            join si_i_sujetos_responsable r',
'              on i.id_sjto_impsto = r.id_sjto_impsto',
'             and r.prncpal_s_n = ''S''',
'           where f.cdgo_clnte = :F_CDGO_CLNTE',
'             and b.vlor_sldo_cptal > 0',
'             and f.cdgo_mvnt_fncro_estdo in (''NO'', ''CN'')',
'             and f.id_impsto = :P257_ID_IMPSTO_CM',
'             and f.id_impsto_sbmpsto = :P257_ID_IMPSTO_SBMPSTO_CM',
'             and (i.idntfccion_sjto = :P257_IDNTFCCION_SJTO_CM or',
'                 :P257_IDNTFCCION_SJTO_CM is null)',
'             and (a.nmro_prcso_jrdco = :P257_NMRO_PRCSO_JRDCO or',
'                 :P257_NMRO_PRCSO_JRDCO is null)) k',
'   where not exists (select n.vgncia, n.id_prdo, n.id_orgen',
'            from gf_g_titulos_judicial l',
'            join gf_g_titulos_jdcial_impsto m',
'              on m.id_ttlo_jdcial = l.id_ttlo_jdcial',
'            join gf_g_titulos_jdcial_vgncia n',
'              on n.id_ttlo_jdcial_impsto = m.id_ttlo_jdcial_impsto',
'           where l.cdgo_ttlo_jdcial_estdo != ''ATJ'' --Consignado',
'             and l.id_instncia_fljo != :F_ID_INSTNCIA_FLJO',
'             and m.id_sjto_impsto = k.id_sjto_impsto',
'             and n.vgncia = k.vgncia',
'             and n.id_prdo = k.id_prdo',
'             and n.id_orgen = k.id_orgen)',
'     and not exists (select 1',
'            from gf_g_titulos_jdcial_vgncia_temp o',
'           where o.id_sjto_impsto = k.id_sjto_impsto',
'             and o.vgncia = k.vgncia',
'             and o.id_prdo = k.id_prdo',
'             and o.id_orgen = k.id_orgen)',
'   group by k.nmro_prcso_jrdco,',
'            k.cnsctvo_embrgo,',
'            k.idntfccion_sjto,',
'            k.id_impsto,',
'            k.id_impsto_sbmpsto,',
'            k.vgncia,',
'            k.prdo,',
'            k.id_prdo,',
'            k.id_sjto_impsto,',
'            k.id_sjto_rspnsble,',
'            k.cdgo_mvmnto_orgn,',
'            k.id_orgen',
'   order by k.idntfccion_sjto, k.vgncia desc, k.prdo)',
'select rownum, t.* from carteras t;',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'		select 1 as valor',
'  from gf_g_titulos_judicial a',
' where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'   and a.cdgo_ttlo_jdcial_estdo = ''ACN''',
'   and a.id_ttlo_jdcial not in',
'       (select z.id_ttlo_jdcial',
'          from gf_g_titulos_jdcial_impsto z',
'         where z.id_ttlo_jdcial = a.id_ttlo_jdcial)',
'   and exists',
' (select 2',
'          from (select ((select sum(x.vlor)',
'                           from gf_g_titulos_judicial x',
'                          where x.id_instncia_fljo = a.id_instncia_fljo',
'                            and x.cdgo_ttlo_jdcial_estdo = ''ACN'') -',
'                       (select nvl(sum(k.vlor_ttal_aplcar), 0)',
'                           from gf_g_titulos_jdcial_vgncia_temp k',
'                          where k.id_instncia_fljo = a.id_instncia_fljo)) vlor_t',
'                  from dual)',
'         where vlor_t > 0);'))
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(24684104340334527)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
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
 p_id=>wwv_flow_api.id(24684364755334529)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
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
 p_id=>wwv_flow_api.id(24684469601334530)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(24684507176334531)
,p_name=>'VLOR_SLDO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Saldo Capital'
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
 p_id=>wwv_flow_api.id(24684674758334532)
,p_name=>'VLOR_SLDO_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Saldo Inter\00E9s')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(24684758221334533)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Valor Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(24684804066334534)
,p_name=>'VLOR_DSCNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DSCNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Valor Descuento'
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
 p_id=>wwv_flow_api.id(24684949109334535)
,p_name=>'VLOR_TTAL_OCULTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_OCULTO'
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
 p_id=>wwv_flow_api.id(24685053425334536)
,p_name=>'VLOR_TTAL_APLCAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_APLCAR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Total<br> a Aplicar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
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
 p_id=>wwv_flow_api.id(24685105610334537)
,p_name=>'ROWNUM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWNUM'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(24685236856334538)
,p_name=>'VLOR_DSCNTO_OCLTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DSCNTO_OCLTO'
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
 p_id=>wwv_flow_api.id(24685370034334539)
,p_name=>'TPO_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_DCMNTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo de<br>Documento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(24685450183334540)
,p_name=>'VLOR_DSCNTO_APLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DSCNTO_APLCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Descuento<br>Aplicaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
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
 p_id=>wwv_flow_api.id(24685582497334541)
,p_name=>'VLOR_TTAL_APLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_APLCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Total<br>Aplicaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
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
 p_id=>wwv_flow_api.id(24685624128334542)
,p_name=>'CDGO_MVMNTO_ORGN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVMNTO_ORGN'
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
 p_id=>wwv_flow_api.id(24685783470334543)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
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
 p_id=>wwv_flow_api.id(24685876559334544)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
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
 p_id=>wwv_flow_api.id(24685969792334545)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
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
 p_id=>wwv_flow_api.id(24686187309334547)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_is_required=>false
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
 p_id=>wwv_flow_api.id(24686247047334548)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>260
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
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
 p_id=>wwv_flow_api.id(24686358984334549)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>270
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
,p_include_in_export=>false
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(33101577270708901)
,p_name=>'CNSCTVO_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNSCTVO_EMBRGO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'No. Embargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>290
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
 p_id=>wwv_flow_api.id(33464448629967302)
,p_name=>'ID_SJTO_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_RSPNSBLE'
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(33464533239967303)
,p_name=>'NMRO_PRCSO_JRDCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_PRCSO_JRDCO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('No. Proceso <br>Jur\00EDdico')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>280
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(24683851014334524)
,p_internal_uid=>24683851014334524
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
 p_id=>wwv_flow_api.id(24703830657408811)
,p_interactive_grid_id=>wwv_flow_api.id(24683851014334524)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(24703943581408814)
,p_report_id=>wwv_flow_api.id(24703830657408811)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(24705454156408827)
,p_view_id=>wwv_flow_api.id(24703943581408814)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(24684104340334527)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(24706450227408831)
,p_view_id=>wwv_flow_api.id(24703943581408814)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(24684364755334529)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(24707307985408839)
,p_view_id=>wwv_flow_api.id(24703943581408814)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(24684507176334531)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(24707808577408841)
,p_view_id=>wwv_flow_api.id(24703943581408814)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(24684674758334532)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(24708394566408843)
,p_view_id=>wwv_flow_api.id(24703943581408814)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(24684758221334533)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(24708814771408845)
,p_view_id=>wwv_flow_api.id(24703943581408814)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(24684804066334534)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(24709302433408847)
,p_view_id=>wwv_flow_api.id(24703943581408814)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(24684949109334535)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(24709809592408850)
,p_view_id=>wwv_flow_api.id(24703943581408814)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(24685053425334536)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(24710396938408852)
,p_view_id=>wwv_flow_api.id(24703943581408814)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(24685105610334537)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(24710889813408855)
,p_view_id=>wwv_flow_api.id(24703943581408814)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(24685236856334538)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(24711389362408857)
,p_view_id=>wwv_flow_api.id(24703943581408814)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(24685370034334539)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(24711862327408859)
,p_view_id=>wwv_flow_api.id(24703943581408814)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(24685450183334540)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(24712324481408861)
,p_view_id=>wwv_flow_api.id(24703943581408814)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(24685582497334541)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(24712809000408863)
,p_view_id=>wwv_flow_api.id(24703943581408814)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(24685624128334542)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(24713320172408865)
,p_view_id=>wwv_flow_api.id(24703943581408814)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(24685783470334543)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(24713899491408867)
,p_view_id=>wwv_flow_api.id(24703943581408814)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(24685876559334544)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(24714309885408869)
,p_view_id=>wwv_flow_api.id(24703943581408814)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(24685969792334545)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(24715370054408885)
,p_view_id=>wwv_flow_api.id(24703943581408814)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(24686187309334547)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(24715895527408888)
,p_view_id=>wwv_flow_api.id(24703943581408814)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(24686247047334548)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(24716326895408890)
,p_view_id=>wwv_flow_api.id(24703943581408814)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(24686358984334549)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>180
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33107573281709516)
,p_view_id=>wwv_flow_api.id(24703943581408814)
,p_display_seq=>21
,p_column_id=>wwv_flow_api.id(33101577270708901)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33472964746309845)
,p_view_id=>wwv_flow_api.id(24703943581408814)
,p_display_seq=>22
,p_column_id=>wwv_flow_api.id(33464448629967302)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33474439433337049)
,p_view_id=>wwv_flow_api.id(24703943581408814)
,p_display_seq=>23
,p_column_id=>wwv_flow_api.id(33464533239967303)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25490994394911401)
,p_plug_name=>unistr('<b>Par\00E1metros De Aplicaci\00F3n</b>')
,p_region_name=>'choice_cartera'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NOT_EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1 ',
' from gf_g_titulos_jdcial_impsto',
' where id_ttlo_jdcial = :P257_ID_TTLO_JDCIAL;'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(27110243292368501)
,p_plug_name=>'Registro Saldos Vigencias Futuras'
,p_region_name=>'saf'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size720x480'
,p_plug_template=>wwv_flow_api.id(177331524321050607)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(29909050554264101)
,p_plug_name=>unistr('Saldos Pendientes De Los T\00EDtulos')
,p_parent_plug_id=>wwv_flow_api.id(27110243292368501)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(29909163433264102)
,p_plug_name=>'Registro De Datos Vigencias Futuras'
,p_parent_plug_id=>wwv_flow_api.id(27110243292368501)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(27645030414970612)
,p_plug_name=>'<b>Cartera a Consignar</b>'
,p_region_name=>'cartera'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>70
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with carteras as',
' (select rownum, t.*',
'    from (select k.nmro_prcso_jrdco,',
'                 k.cnsctvo_embrgo,',
'                 k.idntfccion_sjto,',
'                 k.id_impsto,',
'                 k.id_impsto_sbmpsto,',
'                 k.vgncia,',
'                 k.prdo,',
'                 k.id_prdo,',
'                 k.id_sjto_impsto,',
'                 k.id_sjto_rspnsble,',
'                 sum(k.vlor_sldo_cptal) as vlor_sldo_cptal,',
'                 sum(k.vlor_intres) as vlor_sldo_intres,',
'                 sum(k.vlor_dscnto) vlor_dscnto,',
'                 sum(k.vlor_sldo_cptal) + sum(k.vlor_intres) -',
'                 sum(k.vlor_dscnto) vlor_ttal,',
'                 sum(k.vlor_sldo_cptal) + sum(k.vlor_intres) -',
'                 sum(k.vlor_dscnto) vlor_ttal_oculto,',
'                 0 vlor_ttal_aplcar,',
'                 0 vlor_dscnto_aplccion,',
'                 0 vlor_ttal_aplccion,',
'                 sum(k.vlor_dscnto) vlor_dscnto_oclto,',
'                 ''DNO'' tpo_dcmnto,',
'                 k.cdgo_mvmnto_orgn,',
'                 k.id_orgen',
'            from (select h.nmro_prcso_jrdco,',
'                         h.cnsctvo_embrgo,',
'                         b.idntfccion_sjto,',
'                         c.id_impsto,',
'                         c.id_impsto_sbmpsto,',
'                         d.vgncia,',
'                         d.prdo,',
'                         d.id_prdo,',
'                         c.id_sjto_impsto,',
'                         a.id_sjto_rspnsble,',
'                         d.vlor_sldo_cptal,',
'                         d.vlor_intres,',
'                         (d.vlor_sldo_cptal + d.vlor_intres) as total,',
'                         nvl((select case',
'                                      when sum(vlor_dscnto) < d.vlor_sldo_cptal and',
'                                           sum(vlor_dscnto) > 0 then',
'                                       sum(vlor_dscnto)',
'                                      when sum(vlor_dscnto) > d.vlor_sldo_cptal and',
'                                           sum(vlor_dscnto) > 0 then',
'                                       d.vlor_sldo_cptal',
'                                    end as vlor_dscnto',
'                               from table(pkg_re_documentos.fnc_cl_descuento_x_vgncia_prdo(p_cdgo_clnte           => c.cdgo_clnte,',
'                                                                                           p_id_impsto            => c.id_impsto,',
'                                                                                           p_id_impsto_sbmpsto    => c.id_impsto_sbmpsto,',
'                                                                                           p_vgncia               => d.vgncia,',
'                                                                                           p_id_prdo              => d.id_prdo,',
'                                                                                           p_id_cncpto            => d.id_cncpto,',
'                                                                                           p_id_sjto_impsto       => c.id_sjto_impsto,',
'                                                                                           p_fcha_pryccion        => :P257_FCHA_PRYCCION,',
'                                                                                           p_vlor                 => d.vlor_sldo_cptal,',
'                                                                                           p_cdna_vgncia_prdo_pgo => :P257_JSON_VGNCIAS_PRDO,',
'                                                                                           p_cdna_vgncia_prdo_ps  => null))),',
'                             0) + nvl((select vlor_dscnto',
'                                        from table(pkg_re_documentos.fnc_cl_descuento_x_vgncia_prdo(p_cdgo_clnte           => c.cdgo_clnte,',
'                                                                                                    p_id_impsto            => c.id_impsto,',
'                                                                                                    p_id_impsto_sbmpsto    => c.id_impsto_sbmpsto,',
'                                                                                                    p_vgncia               => d.vgncia,',
'                                                                                                    p_id_prdo              => d.id_prdo,',
'                                                                                                    p_id_cncpto            => d.id_cncpto_intres_mra,',
'                                                                                                    p_id_sjto_impsto       => c.id_sjto_impsto,',
'                                                                                                    p_fcha_pryccion        => :P257_FCHA_PRYCCION, --:P257_FCHA_PRYCCION,',
'                                                                                                    p_vlor                 => d.vlor_intres,',
'                                                                                                    p_cdna_vgncia_prdo_pgo => :P257_JSON_VGNCIAS_PRDO,',
'                                                                                                    p_cdna_vgncia_prdo_ps  => null',
'                                                                                                    -- Ley 2155',
'                                                                                                   ,',
'                                                                                                    p_cdgo_mvmnto_orgn => d.cdgo_mvmnto_orgn,',
'                                                                                                    p_id_orgen         => d.id_orgen,',
'                                                                                                    p_vlor_cptal       => d.vlor_sldo_cptal,',
'                                                                                                    P_ID_CNCPTO_BASE   => d.id_cncpto))),',
'                                      0) as vlor_dscnto,',
'                         d.cdgo_mvmnto_orgn,',
'                         d.id_orgen',
'                    from si_i_sujetos_responsable a',
'                    join v_si_i_sujetos_impuesto b',
'                      on a.id_sjto_impsto = b.id_sjto_impsto',
'                     and b.id_sjto_estdo = 1',
'                    join gf_g_movimientos_financiero c',
'                      on b.id_sjto_impsto = c.id_sjto_impsto',
'                    join table(pkg_gf_movimientos_financiero.fnc_co_mvmnto_x_cncpto(p_cdgo_clnte => c.cdgo_clnte, p_id_impsto => c.id_impsto, p_id_impsto_sbmpsto => c.id_impsto_sbmpsto, p_id_sjto_impsto => b.id_sjto_impsto, p_fcha_vncmnto => :P257_FC'
||'HA_PRYCCION)) d',
'                      on c.id_mvmnto_fncro = d.id_mvmnto_fncro                    ',
'                    left join (select id_mvmnto_fncro,',
'                             cdgo_clnte,',
'                             id_impsto,',
'                             id_impsto_sbmpsto,',
'                             id_sjto_impsto,',
'                             nmro_prcso_jrdco,',
'                             cnsctvo_embrgo',
'                        from v_mc_g_embargos_cartera_detalle',
'                       group by id_mvmnto_fncro,',
'                                cdgo_clnte,',
'                                id_impsto,',
'                                id_impsto_sbmpsto,',
'                                id_sjto_impsto,',
'                                nmro_prcso_jrdco,',
'                                cnsctvo_embrgo) h',
'                      on c.id_mvmnto_fncro = h.id_mvmnto_fncro',
'                        and c.cdgo_clnte = h.cdgo_clnte',
'                        and c.id_impsto = h.id_impsto',
'                        and c.id_impsto_sbmpsto = h.id_impsto_sbmpsto',
'                        and c.id_sjto_impsto = h.id_sjto_impsto                 ',
'                    where c.id_impsto = :P257_ID_IMPSTO_1',
'                     and c.id_impsto_sbmpsto = :P257_ID_IMPSTO_SBMPSTO',
'                     and a.idntfccion like (case',
'                           when pkg_gf_titulos_judicial.fnc_ca_nit_cc(:P257_IDNTFCCION_DMNDDO) = ''N'' then',
'                            (''%'' ||',
'                            substr(nvl(substr(ltrim(:P257_IDNTFCCION_DMNDDO, 0),',
'                                               1,',
'                                               instr(:P257_IDNTFCCION_DMNDDO,',
'                                                     ''-'')),',
'                                        ltrim(:P257_IDNTFCCION_DMNDDO, 0)),',
'                                    1,',
'                                    9) || ''%'')',
'                           else',
'                            (''%'' ||',
'                            nvl(substr(ltrim(:P257_IDNTFCCION_DMNDDO, 0),',
'                                        1,',
'                                        instr(:P257_IDNTFCCION_DMNDDO, ''-'')),',
'                                 ltrim(:P257_IDNTFCCION_DMNDDO, 0)) || ''%'')',
'                         end)',
'                     and d.vlor_sldo_cptal > 0',
'                     and c.cdgo_mvnt_fncro_estdo in (''NO'', ''CN'')',
'                     and a.prncpal_s_n = ''S''',
'                   order by d.vgncia desc, d.cdgo_cncpto) k',
'           group by k.nmro_prcso_jrdco,',
'                    k.cnsctvo_embrgo,',
'                    k.idntfccion_sjto,',
'                    k.id_impsto,',
'                    k.id_impsto_sbmpsto,',
'                    k.vgncia,',
'                    k.prdo,',
'                    k.id_prdo,',
'                    k.id_sjto_impsto,',
'                    k.id_sjto_rspnsble,',
'                    k.cdgo_mvmnto_orgn,',
'                    k.id_orgen) t',
'   where not exists',
'   (select n.vgncia, n.id_prdo, n.id_orgen',
'            from gf_g_titulos_judicial l',
'            join gf_g_titulos_jdcial_impsto m',
'              on m.id_ttlo_jdcial = l.id_ttlo_jdcial',
'            join gf_g_titulos_jdcial_vgncia n',
'              on n.id_ttlo_jdcial_impsto = m.id_ttlo_jdcial_impsto',
'           where l.idntfccion_dmnddo like (case',
'                   when pkg_gf_titulos_judicial.fnc_ca_nit_cc(:P257_IDNTFCCION_DMNDDO) = ''N'' then',
'                    (''%'' ||',
'                    substr(nvl(substr(ltrim(:P257_IDNTFCCION_DMNDDO, 0),',
'                                       1,',
'                                       instr(:P257_IDNTFCCION_DMNDDO, ''-'')),',
'                                ltrim(:P257_IDNTFCCION_DMNDDO, 0)),',
'                            1,',
'                            9) || ''%'')',
'                   else',
'                    (''%'' || nvl(substr(ltrim(:P257_IDNTFCCION_DMNDDO, 0),',
'                                       1,',
'                                       instr(:P257_IDNTFCCION_DMNDDO, ''-'')),',
'                                ltrim(:P257_IDNTFCCION_DMNDDO, 0)) || ''%'')',
'                 end)',
'             and l.cdgo_ttlo_jdcial_estdo != ''ATJ'' --Consignado',
'             and l.id_instncia_fljo != :F_ID_INSTNCIA_FLJO',
'             and m.id_sjto_impsto = t.id_sjto_impsto',
'             and n.vgncia = t.vgncia',
'             and n.id_prdo = t.id_prdo',
'             and n.id_orgen = t.id_orgen)',
'     and not exists (select 1',
'            from gf_g_titulos_jdcial_vgncia_temp o',
'           where o.id_sjto_impsto = t.id_sjto_impsto',
'             and o.vgncia = t.vgncia',
'             and o.id_prdo = t.id_prdo',
'             and o.id_orgen = t.id_orgen)',
'   order by t.id_sjto_impsto, t.vgncia , t.prdo)',
'select * from carteras;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gf_g_titulos_judicial a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'and a.cdgo_ttlo_jdcial_estdo = ''ACN''',
'and a.id_ttlo_jdcial not in (select z.id_ttlo_jdcial ',
'                            from gf_g_titulos_jdcial_impsto z',
'                            where z.id_ttlo_jdcial = a.id_ttlo_jdcial)',
'                              and exists',
' (select 2',
'          from (select ((select sum(x.vlor)',
'                           from gf_g_titulos_judicial x',
'                          where x.id_instncia_fljo = a.id_instncia_fljo',
'                            and x.cdgo_ttlo_jdcial_estdo = ''ACN'') -',
'                       (select nvl(sum(k.vlor_ttal_aplcar), 0)',
'                           from gf_g_titulos_jdcial_vgncia_temp k',
'                          where k.id_instncia_fljo = a.id_instncia_fljo)) vlor_t',
'                  from dual)',
'         where vlor_t > 0)',
'         and :P257_ID_IMPSTO_1 is not null',
'         and :P257_ID_IMPSTO_SBMPSTO is not null'))
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3283543853774601)
,p_name=>'NMRO_PRCSO_JRDCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_PRCSO_JRDCO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('No. Proceso <br>Jur\00EDdico')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>310
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
 p_id=>wwv_flow_api.id(17295430801380401)
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17295557447380402)
,p_name=>'ID_SJTO_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_RSPNSBLE'
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
 p_id=>wwv_flow_api.id(17295610539380403)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
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
 p_id=>wwv_flow_api.id(18616877297383732)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(19040880877849602)
,p_name=>'VLOR_SLDO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Saldo Capital'
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
 p_id=>wwv_flow_api.id(21410040741005802)
,p_name=>'VLOR_SLDO_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Saldo Inter\00E9s')
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
 p_id=>wwv_flow_api.id(21410147866005803)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Valor Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
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
 p_id=>wwv_flow_api.id(21410485634005806)
,p_name=>'VLOR_DSCNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DSCNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Valor <br>Descuento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
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
 p_id=>wwv_flow_api.id(21445179809813701)
,p_name=>'VLOR_TTAL_OCULTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_OCULTO'
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
 p_id=>wwv_flow_api.id(21445288876813702)
,p_name=>'VLOR_TTAL_APLCAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_APLCAR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Total<br> a Aplicar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
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
 p_id=>wwv_flow_api.id(21515152057229001)
,p_name=>'ROWNUM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWNUM'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>230
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21515201210229002)
,p_name=>'VLOR_DSCNTO_OCLTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DSCNTO_OCLTO'
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
 p_id=>wwv_flow_api.id(21515323504229003)
,p_name=>'TPO_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_DCMNTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo de<br>Documento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21515440205229004)
,p_name=>'VLOR_DSCNTO_APLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DSCNTO_APLCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Descuento<br>Aplicaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>260
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
 p_id=>wwv_flow_api.id(21515508458229005)
,p_name=>'VLOR_TTAL_APLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_APLCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Total<br>Aplicaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>270
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
 p_id=>wwv_flow_api.id(21515873217229008)
,p_name=>'CDGO_MVMNTO_ORGN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVMNTO_ORGN'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(21515970508229009)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>290
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
 p_id=>wwv_flow_api.id(27685052424693804)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
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
 p_id=>wwv_flow_api.id(27685181574693805)
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
 p_id=>wwv_flow_api.id(27686423111693817)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_is_required=>false
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
 p_id=>wwv_flow_api.id(27686469830693818)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
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
 p_id=>wwv_flow_api.id(33110651038948001)
,p_name=>'CNSCTVO_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNSCTVO_EMBRGO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'No. Embargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>300
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
 p_id=>wwv_flow_api.id(224785891882741704)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
,p_include_in_export=>false
,p_escape_on_http_output=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(27645315519970614)
,p_internal_uid=>27645315519970614
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
 p_id=>wwv_flow_api.id(27650444091983578)
,p_interactive_grid_id=>wwv_flow_api.id(27645315519970614)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>20
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(27650580372983578)
,p_report_id=>wwv_flow_api.id(27650444091983578)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1994185012371)
,p_view_id=>wwv_flow_api.id(27650580372983578)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(21410147866005803)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>99
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10209213272525)
,p_view_id=>wwv_flow_api.id(27650580372983578)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(19040880877849602)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3289549977778051)
,p_view_id=>wwv_flow_api.id(27650580372983578)
,p_display_seq=>27
,p_column_id=>wwv_flow_api.id(3283543853774601)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17301429957381683)
,p_view_id=>wwv_flow_api.id(27650580372983578)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(17295430801380401)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17303087687461329)
,p_view_id=>wwv_flow_api.id(27650580372983578)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(17295557447380402)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17303575330461332)
,p_view_id=>wwv_flow_api.id(27650580372983578)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(17295610539380403)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21419529155135990)
,p_view_id=>wwv_flow_api.id(27650580372983578)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(21410040741005802)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21427757040290777)
,p_view_id=>wwv_flow_api.id(27650580372983578)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(21410485634005806)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21451454205822098)
,p_view_id=>wwv_flow_api.id(27650580372983578)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(21445179809813701)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21452138477822103)
,p_view_id=>wwv_flow_api.id(27650580372983578)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(21445288876813702)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21521216084233093)
,p_view_id=>wwv_flow_api.id(27650580372983578)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(21515152057229001)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21537555025247921)
,p_view_id=>wwv_flow_api.id(27650580372983578)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(21515201210229002)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21538032164247923)
,p_view_id=>wwv_flow_api.id(27650580372983578)
,p_display_seq=>21
,p_column_id=>wwv_flow_api.id(21515323504229003)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21567442669828952)
,p_view_id=>wwv_flow_api.id(27650580372983578)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(21515440205229004)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21568014914828956)
,p_view_id=>wwv_flow_api.id(27650580372983578)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(21515508458229005)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21624739443353005)
,p_view_id=>wwv_flow_api.id(27650580372983578)
,p_display_seq=>24
,p_column_id=>wwv_flow_api.id(21515873217229008)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21625334942353007)
,p_view_id=>wwv_flow_api.id(27650580372983578)
,p_display_seq=>25
,p_column_id=>wwv_flow_api.id(21515970508229009)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(27691245441704349)
,p_view_id=>wwv_flow_api.id(27650580372983578)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(27685052424693804)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(27691763239704350)
,p_view_id=>wwv_flow_api.id(27650580372983578)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(27685181574693805)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(27708368468859164)
,p_view_id=>wwv_flow_api.id(27650580372983578)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(27686423111693817)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>2
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(27708917922859166)
,p_view_id=>wwv_flow_api.id(27650580372983578)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(27686469830693818)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>86
,p_sort_order=>3
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33116640315948370)
,p_view_id=>wwv_flow_api.id(27650580372983578)
,p_display_seq=>26
,p_column_id=>wwv_flow_api.id(33110651038948001)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(224791912593741938)
,p_view_id=>wwv_flow_api.id(27650580372983578)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(224785891882741704)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>267
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(103140007561)
,p_view_id=>wwv_flow_api.id(27650580372983578)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(21445288876813702)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(3083216021440)
,p_view_id=>wwv_flow_api.id(27650580372983578)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(19040880877849602)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(3127889021444)
,p_view_id=>wwv_flow_api.id(27650580372983578)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(21410040741005802)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(3301960021444)
,p_view_id=>wwv_flow_api.id(27650580372983578)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(21410147866005803)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(29909376560264104)
,p_plug_name=>'Tab'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21217737841835401)
,p_plug_name=>'<b>Cartera Consignada</b>'
,p_parent_plug_id=>wwv_flow_api.id(29909376560264104)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>90
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
'       k.id_instncia_fljo',
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
'       b.id_instncia_fljo',
'  from gf_g_titulos_jdcial_vgncia b  ',
' where b.id_instncia_fljo = :F_ID_INSTNCIA_FLJO --and c.cdgo_ttlo_jdcial_estdo in (''ACN'',''ATJ'')',
' order by b.id_ttlo_jdcial_vgncia)k;',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1 ',
' from gf_g_titulos_jdcial_impsto',
' where id_instncia_fljo = :F_ID_INSTNCIA_FLJO'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21219322383835417)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
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
 p_id=>wwv_flow_api.id(21219415481835418)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21219572433835419)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Sub Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21219730006835421)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21220055047835424)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Inter\00E9s')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21867759020038401)
,p_name=>'VLOR_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
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
 p_id=>wwv_flow_api.id(21867817794038402)
,p_name=>'VLOR_DSCTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DSCTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Descuento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
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
 p_id=>wwv_flow_api.id(21867913666038403)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
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
 p_id=>wwv_flow_api.id(21868026633038404)
,p_name=>'VLOR_TTAL_TTLO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_TTLO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Total T\00EDtulo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
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
 p_id=>wwv_flow_api.id(21868135045038405)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Orgen'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21868265612038406)
,p_name=>'VLOR_TTAL_APLCAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_APLCAR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Total a Aplicar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
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
 p_id=>wwv_flow_api.id(21868316584038407)
,p_name=>'VLOR_TTAL_APLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_APLCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Total<br>Aplicaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
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
 p_id=>wwv_flow_api.id(21868427964038408)
,p_name=>'VLOR_DSCNTO_APLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DSCNTO_APLCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Descuento <br>Aplicaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
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
 p_id=>wwv_flow_api.id(21868512395038409)
,p_name=>'TPO_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_DCMNTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo Documento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
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
 p_id=>wwv_flow_api.id(21868691464038410)
,p_name=>'CDGO_MVMNTO_ORGN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVMNTO_ORGN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Cdgo Mvmnto Orgn'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>240
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(21868787208038411)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(28690512369021301)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
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
 p_id=>wwv_flow_api.id(28690642558021302)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(21218665915835410)
,p_internal_uid=>21218665915835410
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
 p_id=>wwv_flow_api.id(21226162572838104)
,p_interactive_grid_id=>wwv_flow_api.id(21218665915835410)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(21226249162838104)
,p_report_id=>wwv_flow_api.id(21226162572838104)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21227681529838131)
,p_view_id=>wwv_flow_api.id(21226249162838104)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(21219322383835417)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21228188852838133)
,p_view_id=>wwv_flow_api.id(21226249162838104)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(21219415481835418)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>212
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21228643942838136)
,p_view_id=>wwv_flow_api.id(21226249162838104)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(21219572433835419)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>179
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21229197787838138)
,p_view_id=>wwv_flow_api.id(21226249162838104)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(21219730006835421)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>86
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21229662696838140)
,p_view_id=>wwv_flow_api.id(21226249162838104)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(21220055047835424)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>134
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21873724492038544)
,p_view_id=>wwv_flow_api.id(21226249162838104)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(21867759020038401)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>125.47300000000001
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21874250766038547)
,p_view_id=>wwv_flow_api.id(21226249162838104)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(21867817794038402)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>122
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21874703568038549)
,p_view_id=>wwv_flow_api.id(21226249162838104)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(21867913666038403)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109.8555
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21875239598038551)
,p_view_id=>wwv_flow_api.id(21226249162838104)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(21868026633038404)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21875732016038553)
,p_view_id=>wwv_flow_api.id(21226249162838104)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(21868135045038405)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21876280116038556)
,p_view_id=>wwv_flow_api.id(21226249162838104)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(21868265612038406)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>161.977
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21876782243038559)
,p_view_id=>wwv_flow_api.id(21226249162838104)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(21868316584038407)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>146
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21877285223038562)
,p_view_id=>wwv_flow_api.id(21226249162838104)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(21868427964038408)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>139
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21877731414038564)
,p_view_id=>wwv_flow_api.id(21226249162838104)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(21868512395038409)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>128
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21878238690038567)
,p_view_id=>wwv_flow_api.id(21226249162838104)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(21868691464038410)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21878799060038569)
,p_view_id=>wwv_flow_api.id(21226249162838104)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(21868787208038411)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28696503551021606)
,p_view_id=>wwv_flow_api.id(21226249162838104)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(28690512369021301)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28697026346021621)
,p_view_id=>wwv_flow_api.id(21226249162838104)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(28690642558021302)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(139823000000)
,p_view_id=>wwv_flow_api.id(21226249162838104)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(21867817794038402)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(990672009989)
,p_view_id=>wwv_flow_api.id(21226249162838104)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(21867759020038401)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(1072278009989)
,p_view_id=>wwv_flow_api.id(21226249162838104)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(21867913666038403)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(1127633009989)
,p_view_id=>wwv_flow_api.id(21226249162838104)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(21868265612038406)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(9509912121723)
,p_view_id=>wwv_flow_api.id(21226249162838104)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(21220055047835424)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(29909486815264105)
,p_plug_name=>'<b>Cartera Vigencias Futuras</b>'
,p_parent_plug_id=>wwv_flow_api.id(29909376560264104)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>100
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
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from gf_g_titulos_judicial_saldo_favor a',
' where a.id_ttlo_jdcial = :P257_ID_TTLO_JDCIAL;'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(29909670428264107)
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
 p_id=>wwv_flow_api.id(29909766547264108)
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
 p_id=>wwv_flow_api.id(29909869773264109)
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
 p_id=>wwv_flow_api.id(29909992621264110)
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
 p_id=>wwv_flow_api.id(29910068418264111)
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
 p_id=>wwv_flow_api.id(29910169251264112)
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
 p_id=>wwv_flow_api.id(29910263645264113)
,p_name=>'OBSRVCNES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCNES'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Observaciones'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(29910345565264114)
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
 p_id=>wwv_flow_api.id(29910400617264115)
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
 p_id=>wwv_flow_api.id(29909524609264106)
,p_internal_uid=>29909524609264106
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
 p_id=>wwv_flow_api.id(29949251888689463)
,p_interactive_grid_id=>wwv_flow_api.id(29909524609264106)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(29949388333689531)
,p_report_id=>wwv_flow_api.id(29949251888689463)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29949774355689596)
,p_view_id=>wwv_flow_api.id(29949388333689531)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(29909670428264107)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29950195847689641)
,p_view_id=>wwv_flow_api.id(29949388333689531)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(29909766547264108)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29950636995689650)
,p_view_id=>wwv_flow_api.id(29949388333689531)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(29909869773264109)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29951147158689652)
,p_view_id=>wwv_flow_api.id(29949388333689531)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(29909992621264110)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29951690137689654)
,p_view_id=>wwv_flow_api.id(29949388333689531)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(29910068418264111)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29952102355689656)
,p_view_id=>wwv_flow_api.id(29949388333689531)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(29910169251264112)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29952608394689658)
,p_view_id=>wwv_flow_api.id(29949388333689531)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(29910263645264113)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29953110796689660)
,p_view_id=>wwv_flow_api.id(29949388333689531)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(29910345565264114)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29953642434689661)
,p_view_id=>wwv_flow_api.id(29949388333689531)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(29910400617264115)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(33899566588534228)
,p_plug_name=>unistr('T\00EDtulos Registrados')
,p_region_name=>'titulos'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_ttlo_jdcial,',
'       a.cdgo_clnte,',
'       a.id_ttlo_jdcial_crgdo,',
'       a.nmro_ttlo_jdcial,',
'       a.fcha_cnsttcion,',
'       a.vlor,',
'       decode(a.id_ttlo_jdcial_area,',
'              a.id_ttlo_jdcial_area,',
'              c.nmbre_area,',
'              ''-'') as id_ttlo_jdcial_area,',
'       decode(a.cdgo_idntfccion_tpo_dmnddo,',
'              a.cdgo_idntfccion_tpo_dmnddo,',
'              b.dscrpcion_idntfccion_tpo,',
'              ''-'') as cdgo_idntfccion_tpo_dmnddo,',
'       a.idntfccion_dmnddo,',
'       a.nmbre_dmnddo,',
'       a.nmro_ttlo_pdre,',
'       a.id_ttlo_pdre,',
'       a.cdgo_entdad_cnsgnnte || '' - '' || d.nmbre_bnco as cdgo_entdad_cnsgnnte,',
'       a.id_bnco_cnsgnnte,',
'       decode(a.cdgo_ttlo_jdcial_estdo,',
'              a.cdgo_ttlo_jdcial_estdo,',
'              f.dscrpcion,',
'              ''-'') as cdgo_ttlo_jdcial_estdo,',
'       a.cdgo_ttlo_jdcial_estdo as ttlo_jdcial_estdo,',
'       a.id_embrgo_rslcion,',
'       a.id_instncia_fljo_pdre,',
'       a.id_instncia_fljo,',
'       a.id_slctud,',
'       a.cdgo_entdad_rcddr || '' - '' || e.nmbre_bnco as cdgo_entdad_rcddr,',
'       a.id_bnco_rcddr,',
'       a.cnsctvo_embrgo',
'  from gf_g_titulos_judicial a',
'  join df_s_identificaciones_tipo b on b.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo_dmnddo',
'  join df_c_areas c on c.id_area = a.id_ttlo_jdcial_area',
'  join df_c_bancos d on d.id_bnco = a.id_bnco_cnsgnnte',
'  join df_c_bancos e on e.id_bnco = a.id_bnco_rcddr',
'  left join gf_d_titulos_judicial_estdo f on f.cdgo_ttlo_jdcial_estdo = a.cdgo_ttlo_jdcial_estdo',
' where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18305207512667909)
,p_name=>'TTLO_JDCIAL_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TTLO_JDCIAL_ESTDO'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(33899704418534230)
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
 p_id=>wwv_flow_api.id(33899849965534231)
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
 p_id=>wwv_flow_api.id(33899933171534232)
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
 p_id=>wwv_flow_api.id(33900027491534233)
,p_name=>'NMRO_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_JDCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('N\00FAmero T\00EDtulo<br>Judicial')
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
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(33900134025534234)
,p_name=>'FCHA_CNSTTCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_CNSTTCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Fecha<br>Constituci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(33900271996534235)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Valor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(33900517649534238)
,p_name=>'ID_TTLO_JDCIAL_AREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_AREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('\00C1rea')
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
 p_id=>wwv_flow_api.id(33900685330534240)
,p_name=>'IDNTFCCION_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Identificaci\00F3n<br>Demandado')
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
 p_id=>wwv_flow_api.id(33900804239534241)
,p_name=>'NMBRE_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Nombre<br>Demandado'
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
 p_id=>wwv_flow_api.id(33900972308534242)
,p_name=>'NMRO_TTLO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_PDRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('N\00FAmero T\00EDtulo<br>Judicial Padre')
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
 p_id=>wwv_flow_api.id(33901022323534243)
,p_name=>'ID_TTLO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_PDRE'
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(33901142010534244)
,p_name=>'CDGO_ENTDAD_CNSGNNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ENTDAD_CNSGNNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Entidad<br>Consignante'
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(33901241528534245)
,p_name=>'ID_BNCO_CNSGNNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_BNCO_CNSGNNTE'
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
 p_id=>wwv_flow_api.id(33901368216534246)
,p_name=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
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
,p_include_in_export=>false
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(33901397112534247)
,p_name=>'ID_EMBRGO_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGO_RSLCION'
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
 p_id=>wwv_flow_api.id(33901498725534248)
,p_name=>'ID_INSTNCIA_FLJO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO_PDRE'
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
 p_id=>wwv_flow_api.id(33901663149534249)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
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
 p_id=>wwv_flow_api.id(33901731304534250)
,p_name=>'ID_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTUD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Id Solicitud<br>PQR'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
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
 p_id=>wwv_flow_api.id(33901852948534251)
,p_name=>'CDGO_ENTDAD_RCDDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ENTDAD_RCDDR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Entidad<br>Recaudadora'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
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
 p_id=>wwv_flow_api.id(33901896868534252)
,p_name=>'ID_BNCO_RCDDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_BNCO_RCDDR'
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
 p_id=>wwv_flow_api.id(34047546722190035)
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
 p_id=>wwv_flow_api.id(34076575432804357)
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
 p_id=>wwv_flow_api.id(33899658868534229)
,p_internal_uid=>33899658868534229
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
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
 p_id=>wwv_flow_api.id(33908728778558558)
,p_interactive_grid_id=>wwv_flow_api.id(33899658868534229)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(33908826615558560)
,p_report_id=>wwv_flow_api.id(33908728778558558)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17202344083004811)
,p_view_id=>wwv_flow_api.id(33908826615558560)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(34047546722190035)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>97
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18335913216189544)
,p_view_id=>wwv_flow_api.id(33908826615558560)
,p_display_seq=>24
,p_column_id=>wwv_flow_api.id(18305207512667909)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33909354139558562)
,p_view_id=>wwv_flow_api.id(33908826615558560)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(33899704418534230)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33909881668558564)
,p_view_id=>wwv_flow_api.id(33908826615558560)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(33899849965534231)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33910299540558565)
,p_view_id=>wwv_flow_api.id(33908826615558560)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(33899933171534232)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33910833729558567)
,p_view_id=>wwv_flow_api.id(33908826615558560)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(33900027491534233)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33911371361558569)
,p_view_id=>wwv_flow_api.id(33908826615558560)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(33900134025534234)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>88
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33911867701558570)
,p_view_id=>wwv_flow_api.id(33908826615558560)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(33900271996534235)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>122
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33913322152558575)
,p_view_id=>wwv_flow_api.id(33908826615558560)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(33900517649534238)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33914377869558578)
,p_view_id=>wwv_flow_api.id(33908826615558560)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(33900685330534240)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>98
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33914807808558579)
,p_view_id=>wwv_flow_api.id(33908826615558560)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(33900804239534241)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>163
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33915347504558581)
,p_view_id=>wwv_flow_api.id(33908826615558560)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(33900972308534242)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>102
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33915846557558582)
,p_view_id=>wwv_flow_api.id(33908826615558560)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(33901022323534243)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33916323587558584)
,p_view_id=>wwv_flow_api.id(33908826615558560)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(33901142010534244)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>134
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33916793372558585)
,p_view_id=>wwv_flow_api.id(33908826615558560)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(33901241528534245)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33917370327558587)
,p_view_id=>wwv_flow_api.id(33908826615558560)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(33901368216534246)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>154
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33917811209558588)
,p_view_id=>wwv_flow_api.id(33908826615558560)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(33901397112534247)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33918301053558590)
,p_view_id=>wwv_flow_api.id(33908826615558560)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(33901498725534248)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33918882646558593)
,p_view_id=>wwv_flow_api.id(33908826615558560)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(33901663149534249)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33919316036558595)
,p_view_id=>wwv_flow_api.id(33908826615558560)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(33901731304534250)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>76
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33919883534558597)
,p_view_id=>wwv_flow_api.id(33908826615558560)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(33901852948534251)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>131
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(33920298904558599)
,p_view_id=>wwv_flow_api.id(33908826615558560)
,p_display_seq=>23
,p_column_id=>wwv_flow_api.id(33901896868534252)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(34174247903707767)
,p_view_id=>wwv_flow_api.id(33908826615558560)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(34076575432804357)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>92
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(44412126282887907)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
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
 p_id=>wwv_flow_api.id(418455426952061609)
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
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(15892423975963418)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(418455426952061609)
,p_button_name=>'REGRESAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(17237777779599802)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(418455426952061609)
,p_button_name=>'BTN_RGSTRAR_CRTRA'
,p_button_static_id=>'BTN_RGSTRAR_CRTRA'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar Cartera'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gf_g_titulos_judicial a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'and a.cdgo_ttlo_jdcial_estdo = ''ACN''',
'and a.id_ttlo_jdcial not in (select z.id_ttlo_jdcial ',
'                            from gf_g_titulos_jdcial_impsto z',
'                            where z.id_ttlo_jdcial = a.id_ttlo_jdcial)',
'and :P257_FCHA_PRYCCION is not null',
'and :P257_ID_IMPSTO_1 is not null',
'and :P257_ID_IMPSTO_SBMPSTO is not null',
'and exists',
' (select 2',
'          from (select ((select sum(x.vlor)',
'                           from gf_g_titulos_judicial x',
'                          where x.id_instncia_fljo = a.id_instncia_fljo',
'                            and x.cdgo_ttlo_jdcial_estdo = ''ACN'') -',
'                       (select nvl(sum(k.vlor_ttal_aplcar), 0)',
'                           from gf_g_titulos_jdcial_vgncia_temp k',
'                          where k.id_instncia_fljo = a.id_instncia_fljo)) vlor_t',
'                  from dual)',
'         where vlor_t > 0)'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(24639314609771406)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(418455426952061609)
,p_button_name=>'BTN_RGSTRAR_CRTRA_CP'
,p_button_static_id=>'BTN_RGSTRAR_CRTRA_CP'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar Cartera'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM gf_g_titulos_judicial a',
' WHERE a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'   AND a.cdgo_ttlo_jdcial_estdo = ''ACN''',
'   AND a.id_ttlo_jdcial NOT IN (',
'         SELECT z.id_ttlo_jdcial',
'           FROM gf_g_titulos_jdcial_impsto z',
'          WHERE z.id_ttlo_jdcial = a.id_ttlo_jdcial)',
'   AND a.id_instncia_fljo IN (',
'         SELECT b.id_instncia_fljo',
'           FROM gf_g_titulos_jdcial_vgncia_temp b',
'          WHERE b.id_instncia_fljo = a.id_instncia_fljo)',
'   AND (',
'       ROUND(',
'           (SELECT NVL(SUM(a.vlor), 0)',
'              FROM gf_g_titulos_judicial a',
'             WHERE a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'               AND a.cdgo_ttlo_jdcial_estdo = ''ACN'')',
'           -',
'           (SELECT NVL(SUM(b.vlor_ttal_aplcar), 0)',
'              FROM gf_g_titulos_jdcial_vgncia_temp b',
'             WHERE b.id_instncia_fljo = :F_ID_INSTNCIA_FLJO)',
'           -',
'           (SELECT NVL(SUM(c.vlor_sldo_fvor), 0)',
'              FROM gf_g_titulos_judicial_saldo_favor c',
'             WHERE c.id_instncia_fljo = :F_ID_INSTNCIA_FLJO)',
'       )',
'   ) = 0'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(17464796614712102)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(418455426952061609)
,p_button_name=>'BTN_SGNTE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(29560213368973708)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(29909163433264102)
,p_button_name=>'BTN_RGSTRAR_SAF'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(15705124413098901)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(418455426952061609)
,p_button_name=>'BTN_RCHZAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Rechazar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:256:&SESSION.::&DEBUG.:RP,256:P256_INDCDOR_MTVO:R'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_cartera number;  ',
'begin',
'',
'  select sum(nvl(j.vlor, 0)) - sum(nvl(v.vlor_ttal_aplcar, 0)) +',
'         sum(nvl(t.vlor_ttal_aplcar, 0))',
'    into v_cartera',
'    from gf_g_titulos_jdcial_vgncia v',
'    join gf_g_titulos_jdcial_impsto i',
'      on i.id_ttlo_jdcial_impsto = v.id_ttlo_jdcial_impsto',
'    join gf_g_titulos_judicial j',
'      on j.id_ttlo_jdcial = i.id_ttlo_jdcial',
'    left join gf_g_titulos_jdcial_vgncia_temp t',
'      on t.id_instncia_fljo = j.id_instncia_fljo',
'   where j.id_instncia_fljo = :F_ID_INSTNCIA_FLJO;',
'',
'  if v_cartera > 0 then',
'    return true;',
'  else',
'     return false;',
'  end if;',
'  ',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(29559543928973701)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(418455426952061609)
,p_button_name=>'BTN_VGNCIAS_FTRAS'
,p_button_static_id=>'BTN_VGNCIAS_FTRAS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Vigencias Futuras'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_cartera number;  ',
'begin',
'',
'  select sum(nvl(j.vlor, 0)) - sum(nvl(v.vlor_ttal_aplcar, 0)) +',
'         sum(nvl(t.vlor_ttal_aplcar, 0))',
'    into v_cartera',
'    from gf_g_titulos_jdcial_vgncia v',
'    join gf_g_titulos_jdcial_impsto i',
'      on i.id_ttlo_jdcial_impsto = v.id_ttlo_jdcial_impsto',
'    join gf_g_titulos_judicial j',
'      on j.id_ttlo_jdcial = i.id_ttlo_jdcial',
'    left join gf_g_titulos_jdcial_vgncia_temp t',
'      on t.id_instncia_fljo = j.id_instncia_fljo',
'   where j.id_instncia_fljo = :F_ID_INSTNCIA_FLJO;',
'',
'  if v_cartera > 0 then',
'    return true;',
'  else',
'    return false;',
'  end if;',
'  ',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-money'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18813937412096001)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(25490994394911401)
,p_button_name=>'BTN_PRYCTR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Proyectar Intereses'
,p_button_position=>'BODY'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-paper-plane'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26079455165636701)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(25490994394911401)
,p_button_name=>'BTN_CNSLTAR_CRTRAS'
,p_button_static_id=>'BTN_CNSLTAR_CRTRAS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-paper-plane'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(24683787772334523)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(24682770243334513)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-paper-plane'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(24809316244035903)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(24682770243334513)
,p_button_name=>'BTN_ADD_CRTRA'
,p_button_static_id=>'BTN_ADD_CRTRA'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gf_g_titulos_judicial a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'and a.cdgo_ttlo_jdcial_estdo = ''ACN''',
'and a.id_ttlo_jdcial not in (select z.id_ttlo_jdcial ',
'                            from gf_g_titulos_jdcial_impsto z',
'                            where z.id_ttlo_jdcial = a.id_ttlo_jdcial)',
'                            and (:P257_IDNTFCCION_SJTO_CM is not null or :P257_NMRO_PRCSO_JRDCO is not null)',
'                            and :P257_ID_IMPSTO_CM is not null'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(25459851406851401)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(27645030414970612)
,p_button_name=>'BTN_RETIRAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Retirar Vigencia'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(25365246148012803)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(24682770243334513)
,p_button_name=>'BTN_DESELECCIONAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Retirar Vigencia'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(19374287179993802)
,p_branch_name=>'P257_BRANCH'
,p_branch_action=>'f?p=&APP_ID.:&P257_BRANCH.:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P257_RETURN_TRIGGER'
,p_branch_condition_text=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3888986992897501)
,p_name=>'P257_JSON_CRTRA_PRDO_CM'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(24682770243334513)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16257932273422161)
,p_name=>'P257_JSON_CRTRAS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(27645030414970612)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17064089335578502)
,p_name=>'P257_VALOR_TTLO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(27645030414970612)
,p_prompt=>unistr('<b>Valor T\00EDtulo a Consignar</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_column=>2
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gf_g_titulos_judicial a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'and a.cdgo_ttlo_jdcial_estdo = ''ACN''',
'and a.id_ttlo_jdcial not in (select z.id_ttlo_jdcial ',
'                            from gf_g_titulos_jdcial_impsto z',
'                            where z.id_ttlo_jdcial = a.id_ttlo_jdcial)'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17639468304397201)
,p_name=>'P257_FCHA_PRYCCION'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(25490994394911401)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pk_util_calendario.fnc_cl_antrior_dia_habil(p_cdgo_clnte => :F_CDGO_CLNTE,',
'                                                   p_fecha      => last_day(sysdate))',
'  from dual'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>unistr('<b>Fecha Proyecci\00F3n</b>')
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>20
,p_begin_on_new_line=>'N'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gf_g_titulos_judicial a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'and a.cdgo_ttlo_jdcial_estdo = ''ACN''',
'and a.id_ttlo_jdcial not in (select z.id_ttlo_jdcial ',
'                            from gf_g_titulos_jdcial_impsto z',
'                            where z.id_ttlo_jdcial = a.id_ttlo_jdcial)'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione la fecha proyectada con la cual se calcular\00E1n los intereses y descuentos.')
,p_attribute_03=>'&P257_ULTIMO_DIA_HABIL.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18169490895993001)
,p_name=>'P257_VLOR_RMNNTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(27645030414970612)
,p_prompt=>'<b>Saldo Remanente</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gf_g_titulos_judicial a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'and a.cdgo_ttlo_jdcial_estdo = ''ACN''',
'and a.id_ttlo_jdcial not in (select z.id_ttlo_jdcial ',
'                            from gf_g_titulos_jdcial_impsto z',
'                            where z.id_ttlo_jdcial = a.id_ttlo_jdcial)'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18169508799993002)
,p_name=>'P257_VLOR_SLCCNDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(27645030414970612)
,p_prompt=>'<b>Valor Cartera Seleccionada</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gf_g_titulos_judicial a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'and a.cdgo_ttlo_jdcial_estdo = ''ACN''',
'and a.id_ttlo_jdcial not in (select z.id_ttlo_jdcial ',
'                            from gf_g_titulos_jdcial_impsto z',
'                            where z.id_ttlo_jdcial = a.id_ttlo_jdcial)'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18202304403537701)
,p_name=>'P257_VALOR_DVLCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(27645030414970612)
,p_prompt=>unistr('<b>Valor T\00EDtulo a Devolver</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gf_g_titulos_judicial a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'and a.cdgo_ttlo_jdcial_estdo = ''ASL''',
';'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18304412224667901)
,p_name=>'P257_RSPSTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(33899566588534228)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18304565470667902)
,p_name=>'P257_JSON_TTLOS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(33899566588534228)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18304848639667905)
,p_name=>'P257_VLOR_TTAL'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(27645030414970612)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18305485045667911)
,p_name=>'P257_JSON_CNSGNR'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(33899566588534228)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18305595363667912)
,p_name=>'P257_JSON_DVLVR'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(33899566588534228)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18305697098667913)
,p_name=>'P257_JSON_FRCCNR'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(33899566588534228)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19374177458993801)
,p_name=>'P257_BRANCH'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(33899566588534228)
,p_item_default=>'&APP_PAGE_ID.'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19374597780993805)
,p_name=>'P257_RETURN_TRIGGER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(33899566588534228)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21308518720116301)
,p_name=>'P257_VLOR_RMNNTE_TMP'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(27645030414970612)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21430025435655002)
,p_name=>'P257_JSON_VGNCIAS_PRDO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(33899566588534228)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21498240722487802)
,p_name=>'P257_ULTIMO_DIA_HABIL'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(33899566588534228)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21504909861536204)
,p_name=>'P257_NMRO_TTLO_JDCIAL'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(33899566588534228)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21859325919983102)
,p_name=>'P257_ID_IMPSTO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(27645030414970612)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24682860551334514)
,p_name=>'P257_FCHA_PRYCCION_CM'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(24682770243334513)
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gf_g_titulos_judicial a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'and a.cdgo_ttlo_jdcial_estdo = ''ACN''',
'and a.id_ttlo_jdcial not in (select z.id_ttlo_jdcial ',
'                            from gf_g_titulos_jdcial_impsto z',
'                            where z.id_ttlo_jdcial = a.id_ttlo_jdcial)'))
,p_display_when_type=>'EXISTS'
,p_help_text=>unistr('Seleccione la fecha proyectada con la cual se calcular\00E1n los intereses y descuentos.')
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24682951725334515)
,p_name=>'P257_VALOR_TTLO_CM'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(24682770243334513)
,p_prompt=>unistr('<b>Valor T\00EDtulo a Consignar</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_column=>2
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gf_g_titulos_judicial a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'and a.cdgo_ttlo_jdcial_estdo = ''ACN''',
'and a.id_ttlo_jdcial not in (select z.id_ttlo_jdcial ',
'                            from gf_g_titulos_jdcial_impsto z',
'                            where z.id_ttlo_jdcial = a.id_ttlo_jdcial)'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24683004270334516)
,p_name=>'P257_VLOR_SLCCNDO_CM'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(24682770243334513)
,p_item_default=>'0'
,p_prompt=>'<b>Valor Cartera Seleccionada</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gf_g_titulos_judicial a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'and a.cdgo_ttlo_jdcial_estdo = ''ACN''',
'and a.id_ttlo_jdcial not in (select z.id_ttlo_jdcial ',
'                            from gf_g_titulos_jdcial_impsto z',
'                            where z.id_ttlo_jdcial = a.id_ttlo_jdcial)'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24683117086334517)
,p_name=>'P257_VLOR_RMNNTE_CM'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(24682770243334513)
,p_item_default=>'0'
,p_prompt=>'<b>Saldo Remanente</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gf_g_titulos_judicial a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'and a.cdgo_ttlo_jdcial_estdo = ''ACN''',
'and a.id_ttlo_jdcial not in (select z.id_ttlo_jdcial ',
'                            from gf_g_titulos_jdcial_impsto z',
'                            where z.id_ttlo_jdcial = a.id_ttlo_jdcial)'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24683284192334518)
,p_name=>'P257_VALOR_DVLCION_CM'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(24682770243334513)
,p_prompt=>unistr('<b>Valor T\00EDtulo a Devolver</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gf_g_titulos_judicial a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'and a.cdgo_ttlo_jdcial_estdo = ''ASL''',
';'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24683392236334519)
,p_name=>'P257_JSON_CRTRAS_2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(24682770243334513)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24683452069334520)
,p_name=>'P257_VLOR_TTAL_CM'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(24682770243334513)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24683524503334521)
,p_name=>'P257_VLOR_RMNNTE_TMP_CM'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(24682770243334513)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24683682403334522)
,p_name=>'P257_ID_IMPSTO_CM'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(24682770243334513)
,p_prompt=>'<b>Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24686402883334550)
,p_name=>'P257_ID_IMPSTO_SBMPSTO_CM'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(24682770243334513)
,p_prompt=>'<b>Sub Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where id_impsto = :P257_ID_IMPSTO_CM',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P257_ID_IMPSTO_CM'
,p_ajax_items_to_submit=>'P257_ID_IMPSTO_CM,P257_ID_IMPSTO_SBMPSTO_CM'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24732531797443301)
,p_name=>'P257_IDNTFCCION_SJTO_CM'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(24682770243334513)
,p_prompt=>unistr('<b>Identificaci\00F3n</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24844840280594503)
,p_name=>'P257_JSON_CRTRAS_TEMP'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(24682770243334513)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25491022156911402)
,p_name=>'P257_TIPO_CONSULTA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(25490994394911401)
,p_prompt=>'<b>Tipo De Consulta</b>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Cartera Por Impuestos;IMP,Cartera Por Identificaci\00F3n;IDT')
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25954415134567801)
,p_name=>'P257_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(25490994394911401)
,p_prompt=>'<b>Sub Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where id_impsto = :P257_ID_IMPSTO_1',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P257_ID_IMPSTO_1'
,p_ajax_items_to_submit=>'P257_ID_IMPSTO_1,P257_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'N'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25963875229746501)
,p_name=>'P257_ID_IMPSTO_1'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(25490994394911401)
,p_prompt=>'<b>Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26872475114095002)
,p_name=>'P257_EXSTE_RGSTRO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(25490994394911401)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29559812980973704)
,p_name=>'P257_SLDO_TTLO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(29909050554264101)
,p_prompt=>unistr('Saldo Restante Del T\00EDtulo')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29559964242973705)
,p_name=>'P257_IDNTFCCION_SJTO_SAF'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(29909163433264102)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29560017285973706)
,p_name=>'P257_VLOR_SLDO_FVOR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(29909163433264102)
,p_prompt=>'Valor Saldo A Favor'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29560181454973707)
,p_name=>'P257_OBSRVCNES'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(29909163433264102)
,p_prompt=>'Observaciones'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cHeight=>8
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29593457134962702)
,p_name=>'P257_ID_FNCNRIO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(29909163433264102)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32501051271625201)
,p_name=>'P257_NMRO_PRCSO_JRDCO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(24682770243334513)
,p_prompt=>unistr('<b>No. Proceso Jur\00EDdico</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Tenga en cuenta que, si el proceso jur\00EDdico no corresponde a la identificaci\00F3n del sujeto suministrada, no le consultar\00E1 cartera.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(207772323976754148)
,p_name=>'P257_IDNTFCCION_DMNDDO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(33899566588534228)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(207775952952754150)
,p_name=>'P257_ID_TTLO_JDCIAL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(33899566588534228)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2420278650268443801)
,p_name=>'P257_JSON_PRJR_EMBRGO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(24682770243334513)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(21429915073655001)
,p_computation_sequence=>20
,p_computation_item=>'P257_JSON_VGNCIAS_PRDO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select json_object(''VGNCIA_PRDO'' value',
'                   JSON_ARRAYAGG(json_object(''vgncia'' value vgncia,',
'                                             ''prdo'' value prdo,',
'                                             ''id_orgen'' value id_orgen)',
'                                 order by vgncia,',
'                                 prdo,',
'                                 id_orgen returning clob) returning clob) vgncias_prdo',
'  from (select a.vgncia, b.prdo, a.id_orgen',
'          from gf_g_mvmntos_cncpto_cnslddo a',
'          join v_df_i_periodos b',
'            on a.id_prdo = b.id_prdo',
'          join si_i_sujetos_responsable c',
'            on c.id_sjto_impsto = a.id_sjto_impsto',
'         where c.idntfccion like (case',
'                when pkg_gf_titulos_judicial.fnc_ca_nit_cc(c.idntfccion) = ''N'' then',
'                 (''%'' || substr(nvl(substr(ltrim(:P257_IDNTFCCION_DMNDDO, 0),',
'                                           1,',
'                                           instr(:P257_IDNTFCCION_DMNDDO, ''-'')),',
'                                    ltrim(:P257_IDNTFCCION_DMNDDO, 0)),',
'                                1,',
'                                9) || ''%'')',
'                else',
'                 (''%'' || nvl(substr(ltrim(:P257_IDNTFCCION_DMNDDO, 0),',
'                                    1,',
'                                    instr(:P257_IDNTFCCION_DMNDDO, ''-'')),',
'                             ltrim(:P257_IDNTFCCION_DMNDDO, 0)) || ''%'')',
'               end)',
'           and a.vlor_sldo_cptal > 0',
'           and a.cdgo_mvnt_fncro_estdo in (''NO'', ''CN'')',
'         group by a.vgncia, b.prdo, a.id_orgen)',
'         ',
'/*select json_object(''VGNCIA_PRDO'' value',
'                   JSON_ARRAYAGG(json_object(''vgncia'' value vgncia,',
'                                             ''prdo'' value prdo,',
'                                             ''id_orgen'' value id_orgen)',
'                                 order by vgncia,',
'                                 prdo,',
'                                 id_orgen returning clob) returning clob) vgncias_prdo',
'  from (select b.vgncia, b.prdo, b.id_orgen',
'          from v_si_i_sujetos_responsable a',
'          join v_gf_g_cartera_x_vigencia b',
'            on b.id_sjto_impsto = a.id_sjto_impsto',
'         where a.idntfccion_rspnsble like (case',
'                when pkg_gf_titulos_judicial.fnc_ca_nit_cc(a.idntfccion_rspnsble) = ''N'' then',
'                 (''%'' || substr(nvl(substr(ltrim(:P257_IDNTFCCION_DMNDDO, 0),',
'                                           1,',
'                                           instr(:P257_IDNTFCCION_DMNDDO, ''-'')),',
'                                    ltrim(:P257_IDNTFCCION_DMNDDO, 0)),',
'                                1,',
'                                9) || ''%'')',
'                else',
'                 (''%'' || nvl(substr(ltrim(:P257_IDNTFCCION_DMNDDO, 0),',
'                                    1,',
'                                    instr(:P257_IDNTFCCION_DMNDDO, ''-'')),',
'                             ltrim(:P257_IDNTFCCION_DMNDDO, 0)) || ''%'')',
'               end)',
'           and b.vlor_sldo_cptal > 0',
'           and b.cdgo_mvnt_fncro_estdo = ''NO'')*/',
''))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(24754024562616601)
,p_computation_sequence=>10
,p_computation_item=>'P257_VALOR_TTLO_CM'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(vlor_t, :F_FRMTO_MNDA)',
'  from (select ((select sum(a.vlor)',
'                   from gf_g_titulos_judicial a',
'                  where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                    and a.cdgo_ttlo_jdcial_estdo = ''ACN'') -',
'               (select nvl(sum(b.vlor_ttal_aplcar), 0)',
'                   from gf_g_titulos_jdcial_vgncia_temp b',
'                  where b.id_instncia_fljo = :F_ID_INSTNCIA_FLJO) -',
'               (select nvl(sum(b.vlor_sldo_fvor), 0)',
'                    from gf_g_titulos_judicial_saldo_favor b',
'                   where b.id_instncia_fljo = :F_ID_INSTNCIA_FLJO)) vlor_t',
'          from dual);'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(17254430370483901)
,p_computation_sequence=>10
,p_computation_item=>'P257_VALOR_TTLO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select to_char(sum(a.vlor), :F_FRMTO_MNDA)',
'from gf_g_titulos_judicial a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'and a.cdgo_ttlo_jdcial_estdo = ''ACN''',
';*/',
'',
'select to_char(vlor_t, :F_FRMTO_MNDA)',
'  from (select ((select sum(a.vlor)',
'                   from gf_g_titulos_judicial a',
'                  where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                    and a.cdgo_ttlo_jdcial_estdo = ''ACN'') - ',
'                (select nvl(sum(b.vlor_ttal_aplcar), 0)',
'                   from gf_g_titulos_jdcial_vgncia_temp b',
'                  where b.id_instncia_fljo = :F_ID_INSTNCIA_FLJO)-',
'               ((select nvl(sum(b.vlor_sldo_fvor), 0)',
'                    from gf_g_titulos_judicial_saldo_favor b',
'                   where b.id_instncia_fljo = :F_ID_INSTNCIA_FLJO))) vlor_t',
'          from dual);'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(18202407571537702)
,p_computation_sequence=>30
,p_computation_item=>'P257_VALOR_DVLCION'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(sum(a.vlor), :F_FRMTO_MNDA)',
'from gf_g_titulos_judicial a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'and a.cdgo_ttlo_jdcial_estdo = ''ASL''',
';'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(21498144909487801)
,p_computation_sequence=>40
,p_computation_item=>'P257_ULTIMO_DIA_HABIL'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select pk_util_calendario.fnc_cl_antrior_dia_habil(p_cdgo_clnte => :F_CDGO_CLNTE, p_fecha => last_day(sysdate)) from dual'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(21302830613054101)
,p_validation_name=>'El valor seleccionado no puede ser mayor al valor del titulo'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    if  to_number(:P257_VLOR_RMNNTE_TMP) <  0 then',
'        return false;',
'    else',
'        return true;',
'    end if;',
'',
'end ;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('El valor de la cartera seleccionada, es mayor al valor del t\00EDtulo.  Por favor verifique.')
,p_when_button_pressed=>wwv_flow_api.id(17237777779599802)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(24639772604771410)
,p_validation_name=>'El valor seleccionado no puede ser mayor al valor del titulo_cp'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    if  to_number(:P257_VLOR_RMNNTE_TMP_CM) <  0 then',
'        return false;',
'    else',
'        return true;',
'    end if;',
'',
'end ;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('El valor de la cartera seleccionada, es mayor al valor del t\00EDtulo.  Por favor verifique.')
,p_when_button_pressed=>wwv_flow_api.id(24639314609771406)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(17464808724712103)
,p_name=>'Borrar Ruta'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(17464796614712102)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(17464925997712104)
,p_event_id=>wwv_flow_api.id(17464808724712103)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'window.localStorage.removeItem(''wf_link'');',
'apex.submit(''BTN_SGNTE'');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(15705215475098902)
,p_name=>'Borrar Ruta Actual'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(15705124413098901)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(15705316129098903)
,p_event_id=>wwv_flow_api.id(15705215475098902)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'window.localStorage.removeItem(''wf_link'');',
'/*apex.submit(''BTN_RCHZAR'');*/'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(18140548570304505)
,p_name=>'Al seleccionar valores de cartera'
,p_event_sequence=>120
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(27645030414970612)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(18140938644304525)
,p_event_id=>wwv_flow_api.id(18140548570304505)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'validaValorTitulo();',
'apex.item("BTN_RGSTRAR_CRTRA").show();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(24761362457734701)
,p_name=>'Al seleccionar valores de cartera_1'
,p_event_sequence=>130
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(24682770243334513)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(24761460760734702)
,p_event_id=>wwv_flow_api.id(24761362457734701)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validaValorTituloCP();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(18304634479667903)
,p_name=>'Seleccionar Titulos'
,p_event_sequence=>140
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(33899566588534228)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(18304727747667904)
,p_event_id=>wwv_flow_api.id(18304634479667903)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'buildJsonTitulos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21515653536229006)
,p_name=>'Al iniciar fila en la grid'
,p_event_sequence=>170
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(27645030414970612)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21515766141229007)
,p_event_id=>wwv_flow_api.id(21515653536229006)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'TPO_DCMNTO,VLOR_DSCNTO_APLCCION,VLOR_TTAL_APLCCION,VLOR_TTAL_APLCAR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21669318801235401)
,p_name=>'Guardar_remanente'
,p_event_sequence=>180
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(17237777779599802)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21669445588235402)
,p_event_id=>wwv_flow_api.id(21669318801235401)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function fnc_guardarRemanente(){',
'               ',
'                    ',
'        try{',
'',
'            obtenerCartera();',
'            ',
'',
'            apex.server.process("GuardarRemanente",{',
'                f01: window.localStorage.jsonCartera,',
'                pageItems: "#F_CDGO_CLNTE, #P257_JSON_CRTRAS, #P257_JSON_TTLOS, #F_ID_USRIO, #P257_FCHA_PRYCCION"',
'            },{',
'                success: function(data){',
'                    if(data.o_cdgo_rspsta != 0){',
'                       console.log(''RESPUESTA: ''+data.o_cdgo_rspsta);',
'                       apex.message.clearErrors();',
'                       apex.message.showErrors ([',
'                           {',
'                               type:       "error",',
'                               location:   "page",',
'                               message:    data.o_mnsje_rspsta,',
'                               unsafe:     false',
'                           }',
'                       ]);',
'',
'                    }else{',
'                       apex.message.showPageSuccess(data.o_mnsje_rspsta);',
'                       setTimeout(function() {',
'                            apex.submit();',
'                        }, 100);',
'                    }',
'                }',
'            })',
'        }catch(e){',
'            console.log(e);',
'        }   ',
'            ',
'}',
'',
'',
'',
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de guardar esta cartera?", function(okPressed) {'),
'    if(okPressed) {',
'        fnc_guardarRemanente();',
'    }',
'}); '))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(24639479000771407)
,p_name=>'Guardar_remanente_CP'
,p_event_sequence=>190
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(24639314609771406)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(24639567321771408)
,p_event_id=>wwv_flow_api.id(24639479000771407)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function fnc_guardarRemanenteCP(){',
'    try{',
'                    ',
'        apex.server.process("GuardarRemanenteCP",{',
'             pageItems: "#F_CDGO_CLNTE, #P257_JSON_TTLOS, #F_ID_USRIO"',
'        },{',
'            success: function(data){',
'                if(data.o_cdgo_rspsta != 0){',
'                   console.log(''RESPUESTA: ''+data.o_cdgo_rspsta);',
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
unistr('                   apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");  '),
'                    $("#BTN_RGSTRAR_CRTRA_CP").hide(); ',
'                    apex.item("P257_ID_IMPSTO_1").hide();   ',
'                    apex.item("P257_ID_IMPSTO_SBMPSTO").hide();  ',
'                    apex.item("P257_TIPO_CONSULTA").setValue("");',
'                    setTimeout(function() {',
'                        apex.submit();',
'                    }, 100);',
'                }',
'            }',
'        })',
'    }catch(e){',
'        console.log(e);',
'    }',
'}',
'',
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de guardar esta cartera?", function(okPressed) {'),
'    if(okPressed) {',
'        fnc_guardarRemanenteCP();',
'    }',
'});',
'',
'',
'',
'',
' '))
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(24744537675515101)
,p_name=>'Al cambiar impuesto'
,p_event_sequence=>200
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P257_ID_IMPSTO_CM'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(24744690301515102)
,p_event_id=>wwv_flow_api.id(24744537675515101)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select min(id_impsto_sbmpsto)',
'      into :P257_ID_IMPSTO_SBMPSTO_CM       ',
'      from df_i_impuestos_subimpuesto',
'     where id_impsto = :P257_ID_IMPSTO_CM;',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(24437699173173003)
,p_name=>'Al cambiar tributo'
,p_event_sequence=>210
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P257_P_ID_IMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(24437799626173004)
,p_event_id=>wwv_flow_api.id(24437699173173003)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select min(id_impsto_sbmpsto)',
'      into :P257_P_ID_IMPSTO_SBMPSTO       ',
'      from df_i_impuestos_subimpuesto',
'     where id_impsto = :P257_P_ID_IMPSTO;',
'end;'))
,p_attribute_02=>'P257_P_ID_IMPSTO,P257_P_ID_IMPSTO_SBMPSTO'
,p_attribute_03=>'P257_P_ID_IMPSTO_SBMPSTO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(24761579495734703)
,p_name=>'Al iniciar grid'
,p_event_sequence=>210
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(24682770243334513)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(24761621291734704)
,p_event_id=>wwv_flow_api.id(24761579495734703)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'TPO_DCMNTO,VLOR_DSCNTO_APLCCION,VLOR_TTAL_APLCCION,VLOR_TTAL_APLCAR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(24761788847734705)
,p_name=>'Al tener foco'
,p_event_sequence=>220
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(24682770243334513)
,p_triggering_element=>'VLOR_TTAL_APLCAR'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(24761887989734706)
,p_event_id=>wwv_flow_api.id(24761788847734705)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'valor_X_Aplicar = validaValorTituloCP();',
'console.log(''Valor valor_X_Aplicar item vlor_ttal_aplcar : ''+valor_x_Aplicar);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(24761939578734707)
,p_name=>'Valida_valor_aplicado'
,p_event_sequence=>230
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(24682770243334513)
,p_triggering_element=>'VLOR_TTAL_APLCAR'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(24762028462734708)
,p_event_id=>wwv_flow_api.id(24761939578734707)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(''En Valida valor aplicacion'');',
'',
'var valorAplicacion = Number(this.triggeringElement.value.trim().replace(/\./g, ""));',
'var valor_x_aplicacion = Number(valor_X_Aplicar)//[0].vlor_x_cmpnsar.trim().replace(/\./g, "").replace(/\$/g, "")) ',
'',
'if (!Number.isInteger(valor_x_aplicacion)) {',
'    valor_x_aplicacion = 0;',
'}',
'//apex.item("P209_VLOR_NVO").setValue(valor_x_aplicacion);',
'',
'console.log(''valorAplicacion: ''+valorAplicacion);',
'console.log(''valor_x_aplicacion: ''+valor_x_aplicacion);',
'',
'if(valorAplicacion > valor_x_aplicacion ){',
'    console.log("valorAplicacion=>"+valorAplicacion)',
'    this.triggeringElement.value = valor_X_Aplicar[0].valor_aplicacion;',
'     ',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(24844642628594501)
,p_name=>'Al hacer click BTN_ADD_CRTRA'
,p_event_sequence=>240
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(24809316244035903)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(24844780652594502)
,p_event_id=>wwv_flow_api.id(24844642628594501)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function fnc_guardacarteraTemp(){',
'    try{',
'        ',
'        obtenerCarteraCP();',
'        ',
'        let v_json = JSON.parse($v(''P257_JSON_CRTRAS_2'')) || [];',
'        ',
'        if (v_json.length === 0){',
'            apex.message.alert(''Debe seleccionar al menos un registro con valor a aplicar mayor a cero'');',
'            return;',
'        }',
'        console.log(''Jeson cartera No 2: '', JSON.stringify(v_json));',
'        ',
'        apex.server.process("GuardarCaretraTemp",{',
'            f01: JSON.stringify(v_json),',
'            pageItems: "#F_CDGO_CLNTE, #P257_JSON_TTLOS, #F_ID_USRIO"',
'        },{',
'            success: function(data){',
'                if(data.o_cdgo_rspsta != 0){',
'                   console.log(''RESPUESTA: ''+data.o_cdgo_rspsta);',
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
'                   limpiarItems();',
'                   $("#BTN_RGSTRAR_CRTRA").show(); ',
'                   apex.submit();',
'                }',
'            }',
'        })',
'    }catch(e){',
'        console.log(e);',
'    }',
'}',
'',
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de guardar la cartera?", function(okPressed) {'),
'    if(okPressed) {',
'        fnc_guardacarteraTemp();',
'    }',
'});',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(25365324658012804)
,p_name=>'Al dar click BTN_DESELECCIONAR'
,p_event_sequence=>260
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(25365246148012803)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(25365428976012805)
,p_event_id=>wwv_flow_api.id(25365324658012804)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'desmarcarVigencia(''cartera2'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(25459950081851402)
,p_name=>'Al hacer click BTN_RETIRAR'
,p_event_sequence=>270
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(25459851406851401)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(25460077649851403)
,p_event_id=>wwv_flow_api.id(25459950081851402)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'desmarcarVigencia(''cartera'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(25520865207615101)
,p_name=>'Al cambia P257_TIPO_CONSULTA'
,p_event_sequence=>280
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P257_TIPO_CONSULTA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(25520921022615102)
,p_event_id=>wwv_flow_api.id(25520865207615101)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function tipoConsulta() {',
'    ',
'    var seleccion = apex.item("P257_TIPO_CONSULTA").getValue();',
'',
'    if (seleccion === ''IMP'') {',
'        $x_Hide("cartera2");',
'        apex.item("P257_ID_IMPSTO_1").show();',
'        apex.item("P257_ID_IMPSTO_SBMPSTO").show();',
'        $("#BTN_ADD_CRTRA").hide();',
'        $("#BTN_CNSLTAR_CRTRAS").show();',
'    }',
'    else if (seleccion === ''IDT'' || seleccion === ''PJD'') {',
'        $x_Hide("carteraImp");',
'        $x_Show("cartera2");',
'        $x_Hide("cartera");',
'        apex.item("P257_ID_IMPSTO_1").setValue("");',
'        apex.item("P257_ID_IMPSTO_SBMPSTO").setValue("");',
'        $("#BTN_CNSLTAR_CRTRAS").hide();',
'        $("#BTN_RGSTRAR_CRTRA").hide();',
'        apex.item("P257_ID_IMPSTO_1").hide();',
'        apex.item("P257_ID_IMPSTO_SBMPSTO").hide();',
'    } else {',
'        ocultarRegion();',
'    }',
'}',
'',
'tipoConsulta();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(25954559112567802)
,p_name=>'Al cambia P257_ID_IMPSTO_1'
,p_event_sequence=>290
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P257_ID_IMPSTO_1'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(25954639592567803)
,p_event_id=>wwv_flow_api.id(25954559112567802)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select min(id_impsto_sbmpsto)',
'      into :P257_ID_IMPSTO_SBMPSTO       ',
'      from df_i_impuestos_subimpuesto',
'     where id_impsto = :P257_ID_IMPSTO_1;',
'end;'))
,p_attribute_02=>'P257_ID_IMPSTO_1,P257_ID_IMPSTO_SBMPSTO'
,p_attribute_03=>'P257_ID_IMPSTO_SBMPSTO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(29559639214973702)
,p_name=>'Al dar click BTN_VGNCIAS_FTRAS'
,p_event_sequence=>300
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(29559543928973701)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29559750316973703)
,p_event_id=>wwv_flow_api.id(29559639214973702)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function abrirSAF() {',
'    var saldo;',
'    var valor_titulo = $v("P257_VALOR_TTLO").replace(/\$|\.+/g, '''');',
'    var valor_titulo_cm = $v("P257_VALOR_TTLO_CM").replace(/\$|\.+/g, '''');',
'    var sldo_aplcdo = $v("P257_VLOR_SLCCNDO").replace(/\$|\.+/g, '''');',
'    var sldo_aplcdo_b = $v("P257_VLOR_SLCCNDO_CM").replace(/\$|\.+/g, '''');',
'    ',
'    console.log(''valor_titulo: '' + valor_titulo);',
'    console.log(''sldo_aplcdo: '' + sldo_aplcdo);',
'    console.log(''sldo_aplcdo_b: '' + sldo_aplcdo_b);',
'',
'    valor_titulo = Number(valor_titulo);',
'    valor_titulo_cm = Number(valor_titulo_cm);',
'    sldo_aplcdo = Number(sldo_aplcdo);',
'    sldo_aplcdo_b = Number(sldo_aplcdo_b);',
'',
'    if (valor_titulo > 0) {',
'        saldo = valor_titulo - sldo_aplcdo;',
'    } else if (valor_titulo_cm > 0) {',
'        saldo = valor_titulo_cm - sldo_aplcdo_b;',
'    }',
'',
'    console.log(''saldo: '' + saldo);',
'',
'    if (saldo > 0) {',
'        apex.item("P257_SLDO_TTLO").setValue("$" + saldo.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'    } else {',
'        apex.item("P257_SLDO_TTLO").setValue("$0.00");',
'    }',
'    apex.item("P257_IDNTFCCION_SJTO_SAF").setValue(""); ',
'    apex.item("P257_VLOR_SLDO_FVOR").setValue("");',
'    apex.item("P257_OBSRVCNES").setValue("");',
'    openModal("saf");',
'}',
'',
'abrirSAF();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(29578257148417901)
,p_name=>'Al dar click BTN_RGSTRAR_SAF'
,p_event_sequence=>320
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(29560213368973708)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29578378671417902)
,p_event_id=>wwv_flow_api.id(29578257148417901)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function registro(){',
'    ',
'     try{        ',
'                    ',
'        apex.server.process("GuardarVigenciasFuturas",{',
'             pageItems: "#F_CDGO_CLNTE, #F_ID_INSTNCIA_FLJO, #P257_IDNTFCCION_SJTO_SAF, #P257_VLOR_SLDO_FVOR, #P257_OBSRVCNES, #P257_ID_FNCNRIO"',
'        },{',
'            success: function(data){',
'                if(data.o_cdgo_rspsta != 0){',
'                   console.log(''RESPUESTA: ''+data.o_cdgo_rspsta);',
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
'                   apex.item("P257_IDNTFCCION_SJTO_SAF").setValue(""); ',
'                   apex.item("P257_VLOR_SLDO_FVOR").setValue("");',
'                   apex.item("P257_OBSRVCNES").setValue("");',
'                   apex.submit();',
'                }',
'            }',
'        })',
'    }catch(e){',
'        console.log(e);',
'    }',
'}',
'',
'function validacion() {',
'    var idntficcion_sjto = apex.item("P257_IDNTFCCION_SJTO_SAF").getValue();',
'    var vlor_saf = apex.item("P257_VLOR_SLDO_FVOR").getValue();',
'    var obs = apex.item("P257_OBSRVCNES").getValue();',
'',
'    if (idntficcion_sjto === "") {',
'        apex.message.clearErrors();',
'        apex.message.showErrors([{',
'            type: "error",',
'            location: "inline",',
'            pageItem: "P257_IDNTFCCION_SJTO_SAF",',
'            message: "Por favor diligencie todos los campos requeridos!!!.",',
'            unsafe: false',
'        }]);',
'    }else if (vlor_saf === "") {',
'        apex.message.clearErrors();',
'        apex.message.showErrors([{',
'            type: "error",',
'            location: "inline",',
'            pageItem: "P257_VLOR_SLDO_FVOR",',
'            message: "Por favor diligencie todos los campos requeridos!!!.",',
'            unsafe: false',
'        }]);',
'    }else if (obs === ""){',
'        apex.message.clearErrors();',
'        apex.message.showErrors([{',
'            type: "error",',
'            location: "inline",',
'            pageItem: "P257_OBSRVCNES",',
'            message: "Por favor diligencie todos los campos requeridos!!!.",',
'            unsafe: false',
'        }]);',
'    }    ',
'    else {',
unistr('        apex.message.confirm("\00BFEst\00E1 seguro de guardar este saldo para vigencias futuras?", function (okPressed) {'),
'            if (okPressed) {',
'                registro();',
'            }',
'        });',
'    }',
'}',
'',
'validacion();',
'',
'',
' '))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3459256589655602)
,p_name=>'Al dar clic en BTN_CONSULTAR'
,p_event_sequence=>330
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(24683787772334523)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3459367468655603)
,p_event_id=>wwv_flow_api.id(3459256589655602)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function consultar() {',
'    ',
'    var idntfccion_sjto = apex.item("P257_IDNTFCCION_SJTO_CM").getValue();',
'    var nmro_prcso_jrdco = apex.item("P257_NMRO_PRCSO_JRDCO").getValue();',
'',
'    if (idntfccion_sjto === "" && nmro_prcso_jrdco === "") {',
'        apex.message.clearErrors();',
'        apex.message.showErrors([{',
'            type: "error",',
'            location: "page",',
unistr('            message: "Al menos debe llenar un criterio de b\00FAsqueda, por proceso o por Identificaci\00F3n",'),
'            unsafe: false',
'        }]);',
'        return;',
'    }else{',
'        apex.submit();',
'    }',
'',
' /*   apex.server.process("JsonCarteras", {',
'        pageItems: "#P257_IDNTFCCION_SJTO_CM, #P257_NMRO_PRCSO_JRDCO"',
'    }, {',
'        success: function(data) {',
'            if (data.o_cdgo_rspsta !== 0) {',
'                console.log(''RESPUESTA: '' + data.o_mnsje_rspsta);',
'                apex.message.clearErrors();',
'                apex.message.showErrors([{',
'                    type: "error",',
'                    location: "page",',
'                    message: data.o_mnsje_rspsta,',
'                    unsafe: false',
'                }]);',
'            } else {',
'                console.log(''Json devuelto: ''||data.o_vgncias_prdo);',
'                apex.item("P257_JSON_CRTRA_PRDO_CM").setValue(data.o_vgncias_prdo);',
'                apex.submit();',
'            }',
'        },',
'        error: function(xhr, status, error) {',
'            console.error("Error en la llamada al proceso de servidor: ", status, error);',
'            apex.message.showErrors([{',
'                type: "error",',
'                location: "page",',
unistr('                message: "Ocurri\00F3 un error al procesar la solicitud. Intente nuevamente.",'),
'                unsafe: false',
'            }]);',
'        }',
'    });*/',
'    ',
'}',
'',
'consultar();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19374361517993803)
,p_name=>'Al dar clic en REGRESAR'
,p_event_sequence=>340
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(15892423975963418)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19374496189993804)
,p_event_id=>wwv_flow_api.id(19374361517993803)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var origen = localStorage.getItem("pagina_origen");',
'',
'if (origen) {',
unistr('    // \00BF Caso 1: viniste desde irFlujo'),
'    window.location.href = origen;',
'    localStorage.removeItem("pagina_origen");',
'} else {',
unistr('    // \00BF Caso 2: viniste de otra p\00E1gina \00BF deja que APEX Branch act\00FAe'),
'    $s("P257_RETURN_TRIGGER", "Y"); // disparamos un valor',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(17237688144599801)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar Carteras'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'begin',
'',
'    insert into muerto3_tmp (v_001,c_001,t_001) values (''json de process registrar cartera'',:P257_JSON_CRTRAS,systimestamp);',
'    commit;',
'',
'    if :P257_JSON_CRTRAS <> ''[]'' then   ',
'        ',
'        pkg_gf_titulos_judicial.prc_rg_titulo_vigencias(p_cdgo_clnte	  =>    :F_CDGO_CLNTE,',
'                                                        p_json_ttlos      =>    :P257_JSON_TTLOS,',
'                                                        p_json_crtra      =>    :P257_JSON_CRTRAS,',
'                                                        p_id_usrio        =>    :F_ID_USRIO, ',
'                                                        p_fcha_pryccion   =>    :P257_FCHA_PRYCCION,',
'                                                        o_cdgo_rspsta	  =>    v_cdgo_rspsta,',
'                                                        o_mnsje_rspsta	  =>    :P257_RSPSTA);',
'            if v_cdgo_rspsta > 0 then',
'                    raise_application_error(-20001, :P257_RSPSTA);',
'            end if;',
'',
'        --apex_util.set_session_state(''F_ID_FLJO_TREA'','''');',
'    else',
'        --raise_application_error(-20001, ''Por favor seleccione al menos una vigencia para registrar cartera.'');',
'        apex_error.add_error (  p_message          => ''Por favor seleccione al menos una vigencia para registrar cartera.'',',
'                                p_display_location => apex_error.c_inline_in_notification );',
'    end if;',
'end;'))
,p_process_error_message=>'&P257_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(17237777779599802)
,p_process_when_type=>'NEVER'
,p_process_success_message=>'&P257_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(24639644926771409)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar Carteras_CP'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_cdgo_rspsta  number := 0;',
'  v_mnsje_rspsta varchar2(1000);',
'  v_exception    exception;',
'begin',
'  pkg_gf_titulos_judicial.prc_rg_titulo_vigencias_fnal(p_cdgo_clnte   => :F_CDGO_CLNTE,',
'                                                       p_json_ttlos   => :P257_JSON_TTLOS,',
'                                                       p_id_usrio     => :F_ID_USRIO,',
'                                                       o_cdgo_rspsta  => v_cdgo_rspsta,',
'                                                       o_mnsje_rspsta => v_mnsje_rspsta);',
'',
'  if v_cdgo_rspsta > 0 then',
'     raise v_exception;  ',
'  end if;',
'  ',
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
'  ',
'end;'))
,p_process_error_message=>'&P257_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(24639314609771406)
,p_process_when_type=>'NEVER'
,p_process_success_message=>'&P257_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(17465083004712105)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Siguiente Tarea'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'begin',
'    --if :P257_VLOR_SLCCNDO < :P257_VALOR_TTLO then',
'        pkg_gf_titulos_judicial.prc_gn_sgte_trnscion(p_cdgo_clnte	  =>    :F_CDGO_CLNTE,',
'                                                    p_json_ttlos      =>    :P257_JSON_TTLOS,',
'                                                    p_id_ttlo_jdcial  =>    :P257_ID_TTLO_JDCIAL,   ',
'                                                    p_id_usrio        =>    :F_ID_USRIO,',
'                                                    o_cdgo_rspsta	  =>    v_cdgo_rspsta,',
'                                                    o_mnsje_rspsta	  =>    :P257_RSPSTA);',
'',
'        apex_util.set_session_state(''F_ID_FLJO_TREA'','''');',
'    /*else',
unistr('        raise_application_error(-20001, ''La cartera seleccionada supera el valor del t\00EDtulo, por favor verifique.'');'),
'    end if;*/',
'end;'))
,p_process_error_message=>'&P257_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(17464796614712102)
,p_process_when_type=>'NEVER'
,p_process_success_message=>'&P257_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18257354774529657)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Construir Json T\00EDtulos')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    for c_ttlos in (select id_ttlo_jdcial, ',
'                           ttlo_jdcial_estdo,',
'                           id_instncia_fljo ',
'                    from json_table(:P257_JSON_TTLOS, ''$[*]'' ',
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
'                into :P257_JSON_CNSGNR',
'                from (',
'                    /*select a.id_ttlo_jdcial from gf_g_titulos_judicial a',
'                    where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                    and a.cdgo_ttlo_jdcial_estdo in (''ACN'', ''CNS'', ''ATJ'')*/',
'                    select id_ttlo_jdcial, ',
'                           ttlo_jdcial_estdo,',
'                           id_instncia_fljo',
'                    from json_table(:P257_JSON_TTLOS, ''$[*]'' ',
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
'                into :P257_JSON_DVLVR',
'                from (',
'                    /*select a.id_ttlo_jdcial from gf_g_titulos_judicial a',
'                    where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                    and a.cdgo_ttlo_jdcial_estdo in (''ASL'', ''SDT'', ''CDT'')*/',
'                    select id_ttlo_jdcial, ',
'                           ttlo_jdcial_estdo,',
'                           id_instncia_fljo',
'                    from json_table(:P257_JSON_TTLOS, ''$[*]'' ',
'                                     columns (id_ttlo_jdcial            varchar2 path ''$.ID_TTLO_JDCIAL'',',
'                                              ttlo_jdcial_estdo    varchar2 path ''$.TTLO_JDCIAL_ESTDO'',',
'                                              id_instncia_fljo    varchar2 path ''$.ID_INSTNCIA_FLJO'')) a',
'                    where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                    and a.ttlo_jdcial_estdo in (''ASL'', ''SDT'', ''CDT'')',
'                );',
'            elsif c_ttlos.ttlo_jdcial_estdo = ''FRC'' then',
'                select json_arrayagg(',
'                           json_object (',
'                               ''id_ttlo_jdcial'' value id_ttlo_jdcial',
'                           )',
'                       ) as json_titulos',
'                into :P257_JSON_FRCCNR',
'                from (',
'                    /*select a.id_ttlo_jdcial from gf_g_titulos_judicial a',
'                    where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                    and a.cdgo_ttlo_jdcial_estdo = ''FRC''*/',
'                    ',
'                    select id_ttlo_jdcial, ',
'                           ttlo_jdcial_estdo,',
'                           id_instncia_fljo',
'                    from json_table(:P257_JSON_TTLOS, ''$[*]'' ',
'                                     columns (id_ttlo_jdcial            varchar2 path ''$.ID_TTLO_JDCIAL'',',
'                                              ttlo_jdcial_estdo    varchar2 path ''$.TTLO_JDCIAL_ESTDO'',',
'                                              id_instncia_fljo    varchar2 path ''$.ID_INSTNCIA_FLJO'')) a',
'                    where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                    and a.ttlo_jdcial_estdo = ''FRC''',
'                );',
'            end if;',
'    end loop;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(207771374323752696)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargue de Datos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'     select idntfccion_dmnddo',
'            , id_ttlo_jdcial',
'            , nmro_ttlo_jdcial',
'       into :P257_IDNTFCCION_DMNDDO',
'           ,:P257_ID_TTLO_JDCIAL',
'           ,:P257_NMRO_TTLO_JDCIAL',
'       from v_gf_g_titulos_judicial',
'      where id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'      and rownum = 1;',
'exception',
'    when others then',
'        :P257_IDNTFCCION_DMNDDO := null;',
'        :P257_ID_TTLO_JDCIAL := null;',
'        :P257_NMRO_TTLO_JDCIAL := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26872316300095001)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DatoscarteraValida'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  select 1',
'    into :P257_EXSTE_RGSTRO',
'    from gf_g_titulos_jdcial_vgncia_temp a',
'   where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'     and rownum = 1;',
'exception',
'  when others then',
'    :P257_EXSTE_RGSTRO := 0;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(29593346483962701)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DatosSesion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
' v_usrio varchar2(100);',
'begin',
'',
'  v_usrio := :APP_USER;',
'  ',
'  select a.id_fncnrio',
'  into :P257_ID_FNCNRIO',
'  from v_sg_g_usuarios a',
' where a.user_name = v_usrio; ',
' exception when others then',
'  :P257_ID_FNCNRIO := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21669550119235403)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GuardarRemanente'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta	number := 0;',
'    v_mnsje_rspsta  varchar2(1000);',
'    v_cartera       clob;',
'    v_exception     exception;',
'begin',
'         ',
'	for i in 1..apex_application.g_f01.count loop',
'        v_cartera := v_cartera || apex_application.g_f01(i);',
'    end loop;    ',
'    ',
'  --  if (:P257_VLOR_RMNNTE = 0 ) then ',
'  insert into muerto3_tmp(v_001,c_001,t_001)values(''llego con json'',:P257_JSON_CRTRAS,systimestamp);',
'  commit;',
'       ',
'       pkg_gf_titulos_judicial.prc_rg_titulo_vigencias(p_cdgo_clnte	   => :F_CDGO_CLNTE,',
'                                                       p_json_ttlos    => :P257_JSON_TTLOS,',
'                                                       p_json_crtra    => :P257_JSON_CRTRAS,',
'                                                       p_fcha_pryccion => :P257_FCHA_PRYCCION,',
'                                                       p_id_usrio      => :F_ID_USRIO, ',
'                                                       o_cdgo_rspsta   => v_cdgo_rspsta,',
'                                                       o_mnsje_rspsta  => v_mnsje_rspsta);',
'    ',
'',
'    if v_cdgo_rspsta > 0 then',
'       raise v_exception;     ',
'    end if;',
'  ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta); ',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'',
'	exception',
'	    when v_exception then',
'			rollback;',
'			apex_json.open_object;',
'			apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'			apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'			apex_json.close_object;   ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(17237777779599802)
,p_process_success_message=>unistr('\00A1Cartera registrada al T\00EDtulo Judicial Exitosamente!')
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(29560677180973712)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'validarSujeto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_sjto_impsto v_si_i_sujetos_impuesto.id_sjto_impsto%type;',
'begin ',
'   ',
'    select id_sjto_impsto',
'      into v_id_sjto_impsto',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte      = :F_CDGO_CLNTE',
'       and idntfccion_sjto = :P257_IDNTFCCION_SJTO_SAF',
'       ;',
'   ',
'          apex_json.open_object;',
'          apex_json.write(''exists'', true); ',
'          apex_json.write(''id_sjto_impsto'', v_id_sjto_impsto); ',
'          ',
'          apex_json.close_object;',
'    exception ',
'        when too_many_rows then',
'            apex_json.open_object;',
'            apex_json.write(''exists'', true); ',
'            apex_json.close_object;',
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
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(29578410999417903)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GuardarVigenciasFuturas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_cdgo_rspsta  number := 0;',
'  v_mnsje_rspsta varchar2(1000);',
'  v_cartera      clob;',
'  v_exception    exception;',
'begin',
' ',
'  pkg_gf_titulos_judicial.prc_rg_titulos_judicial_saf(p_cdgo_clnte       => :F_CDGO_CLNTE,',
'                                                      p_id_instncia_fljo => :F_ID_INSTNCIA_FLJO,',
'                                                      p_idntfccion_sjto  => :P257_IDNTFCCION_SJTO_SAF,',
'                                                      p_vlor_sldo_fvor   => :P257_VLOR_SLDO_FVOR,',
'                                                      p_obsrvcnes        => :P257_OBSRVCNES,',
'                                                      p_fcha_rgstro      => sysdate,',
'                                                      p_id_fncnrio       => :P257_ID_FNCNRIO,',
'                                                      o_cdgo_rspsta      => v_cdgo_rspsta,',
'                                                      o_mnsje_rspsta     => v_mnsje_rspsta);',
'',
'  if v_cdgo_rspsta > 0 then',
'    raise v_exception;',
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
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(24853493229042201)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GuardarCaretraTemp'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_cdgo_rspsta  number := 0;',
'  v_mnsje_rspsta varchar2(1000);',
'  v_exception    exception;',
'  v_json         clob;',
'begin',
'',
'  /* -- colocar llamado a actualizaEmbargo',
'   insert into muerto (n_001,v_001,c_001,t_001) values (150011,''F_CDGO_CLNTE:''||:F_CDGO_CLNTE||'', P257_JSON_PRJR_EMBRGO'',:P257_JSON_CRTRAS_2, systimestamp);',
'   commit;',
'',
'   pkg_gf_titulos_judicial.prc_ac_titulos_judicial_embargos(p_cdgo_clnte         => :F_CDGO_CLNTE,',
'                                                            p_id_instncia_fljo   => :F_ID_INSTNCIA_FLJO,',
'                                                            p_json_ttlos         => :P257_JSON_CRTRAS_2,',
'                                                            o_cdgo_rspsta        => v_cdgo_rspsta,',
'                                                            o_mnsje_rspsta       => v_mnsje_rspsta);',
'',
'   if v_cdgo_rspsta > 0 then',
'      raise v_exception;',
'   --else ',
'    --commit;',
'   end if;  */',
'   ',
'   for i in 1..apex_application.g_f01.count loop',
'        v_json := v_json || apex_application.g_f01(i);',
'    end loop; ',
'   ',
'  pkg_gf_titulos_judicial.prc_rg_titulo_vigencias_temp(p_cdgo_clnte    => :F_CDGO_CLNTE,',
'                                                       p_json_ttlos    => :P257_JSON_TTLOS,',
'                                                       p_json_crtra    => v_json,',
'                                                       p_fcha_pryccion => :P257_FCHA_PRYCCION,',
'                                                       o_cdgo_rspsta   => v_cdgo_rspsta,',
'                                                       o_mnsje_rspsta  => v_mnsje_rspsta);',
'',
'  if v_cdgo_rspsta > 0 then',
'    raise v_exception;  ',
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
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(24809316244035903)
,p_process_success_message=>unistr('\00A1Cartera registrada Exitosamente!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(24639253864771405)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GuardarRemanenteCP'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_cdgo_rspsta  number := 0;',
'  v_mnsje_rspsta varchar2(1000);',
'  v_exception    exception; ',
'begin',
' ',
'  pkg_gf_titulos_judicial.prc_rg_titulo_vigencias_fnal(p_cdgo_clnte   => :F_CDGO_CLNTE,',
'                                                       p_json_ttlos   => :P257_JSON_TTLOS,',
'                                                       p_id_usrio     => :F_ID_USRIO,',
'                                                       o_cdgo_rspsta  => v_cdgo_rspsta,',
'                                                       o_mnsje_rspsta => v_mnsje_rspsta);                                                       ',
'                                                         ',
'   ',
'',
'  if v_cdgo_rspsta > 0 then',
'    raise v_exception;  ',
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
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(24639314609771406)
,p_process_success_message=>unistr('\00A1Cartera registrada al T\00EDtulo Judicial Exitosamente!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3889077119897502)
,p_process_sequence=>60
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'JsonCarteras'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_vgncias_prdo clob;',
'  v_cdgo_rspsta  number;',
'  v_mnsje_rspsta varchar2(4000);',
'  v_exception    exception; ',
'begin',
'',
'  v_cdgo_rspsta  := 0;',
unistr('  v_mnsje_rspsta := ''Jeson generado con \00E9xito'';  '),
' insert into muerto (n_001,v_001) values (20241118,''Parametros de entrada: ''||:P257_IDNTFCCION_SJTO_CM);commit;',
'',
'  begin',
'    SELECT JSON_OBJECT(''VGNCIA_PRDO'' VALUE',
'                       JSON_ARRAYAGG(JSON_OBJECT(''vgncia'' VALUE vgncia,',
'                                                 ''prdo'' VALUE prdo,',
'                                                 ''id_orgen'' VALUE id_orgen)',
'                                     ORDER BY vgncia,',
'                                     prdo,',
'                                     id_orgen RETURNING CLOB) RETURNING CLOB) vgncias_prdo',
'      into v_vgncias_prdo',
'      FROM (SELECT a.vgncia, a.prdo, a.id_orgen',
'              FROM v_gf_g_cartera_x_vigencia a',
'              JOIN v_si_i_sujetos_impuesto b',
'                ON a.id_sjto_impsto = b.id_sjto_impsto',
'               AND b.id_sjto_estdo = 1',
'             WHERE vlor_sldo_cptal > 0',
'               AND cdgo_mvnt_fncro_estdo = ''NO''',
'               AND b.idntfccion_sjto = :P257_IDNTFCCION_SJTO_CM);',
'  exception',
'    when others then',
'      v_cdgo_rspsta  := 1;',
unistr('      v_mnsje_rspsta := ''Ocurri\00F3 un error al construir el Jason de las carteras. '' ||'),
'                        sqlerrm;',
'      raise v_exception;',
'  end;',
'  ',
'  apex_util.set_session_state(''P257_JSON_CRTRA_PRDO_CM'', v_vgncias_prdo);',
'    ',
'',
'  apex_json.open_object;',
'  apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'  apex_json.write(''o_vgncias_prdo'', v_vgncias_prdo);',
'  apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'  apex_json.close_object;',
'',
'exception',
'  when v_exception then',
'    rollback;',
'   -- dbms_output.put_line(''Ocurrio un error en la ejecucion: '' || sqlerrm);',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
