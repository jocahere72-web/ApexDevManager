prompt --application/pages/page_20250_005
begin
wwv_flow_api.create_page(
 p_id=>2025038
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Compensar T\00EDtulos Judiciales')
,p_step_title=>unistr('Compensar T\00EDtulos Judiciales')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var valor_X_Aplicar = [];',
'',
'function saldosTitulos() {',
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
'    valor_titulo = $v("P2025038_VLOR_TTLO").replace(/\$|\.+/g, '''');',
'    console.log(''valor titulo: '' + valor_titulo);',
'',
'    apex.item("P2025038_SLDO_RMNTE").setValue("$" + valor_titulo.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'    ',
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
'    apex.item("P2025038_VLOR_CMPNSDO").setValue("$" + ttl_cartera_slccnda.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'    ',
'    records.map((data) => {',
'        console.log(data)',
'        valorTotalAplicar = parseInt(model.getValue(data, "VLOR_TTAL_OCULTO"));',
'        console.log(''Valor seleccionado a aplicar: '' + valorTotalAplicar);',
'       ',
'        valorTotalAplicacion = parseInt(model.getValue(data, "VLOR_TTAL_APLCCION").replace(/\$|\.+/g, ''''));',
'',
'        if (Number(valorTotalAplicar) > 0 && Number(valorTotalAplicacion) < Number(valorTotalAplicar)) {',
'',
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
'                // se coloca el descuento a aplicar completo ',
'                //v_vlor_dscnto_aplcar = parseInt(model.getValue(data,"VLOR_DSCNTO_OCLTO"));',
'                model.setValue(data, "VLOR_DSCNTO_APLCCION", "$" + formatoNumero(v_vlor_dscnto_aplcar, { decimal: '','', thousand: ''.'', precision: 0 }));',
'',
'                ttl_cartera_slccnda += valorTotalAplicar;',
'                console.log(''ttl_cartera_slccnda: '' + Number(ttl_cartera_slccnda));',
'                apex.item("P2025038_VLOR_CMPNSDO").setValue("$" + ttl_cartera_slccnda.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
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
'                apex.item("P2025038_VLOR_CMPNSDO").setValue("$" + ttl_cartera_slccnda.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
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
'                apex.item("P2025038_VLOR_CMPNSDO").setValue("$" + ttl_cartera_slccnda.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'            }',
'',
'            vlor_rmnnte = valor_titulo - ttl_cartera_slccnda;',
'            if (Number(vlor_rmnnte) < 0) {',
'                vlor_rmnnte = 0;',
'            }',
'            apex.item("P2025038_SLDO_RMNTE").setValue("$" + vlor_rmnnte.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'            //apex.item("P257_VLOR_RMNNTE_TMP").setValue(vlor_rmnnte);',
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
'function saldoTitulos(region) {',
'',
'    var v_vlor_ttlos = 0;',
'    var v_vlor_sldo_rmnte = 0;',
'    var v_vlor_ttal_slccndo = 0;',
'',
'    if (region == ''cartera2'') {',
'',
'        v_vlor_ttlos = $v("P2025038_VLOR_TTLO").replace(/\$|\.+/g, '''');',
'        v_vlor_ttal_slccndo = $v("P2025038_VLOR_CMPNSDO").replace(/\$|\.+/g, '''');',
'',
'        v_vlor_sldo_rmnte = v_vlor_ttlos - v_vlor_ttal_slccndo;',
'        if (v_vlor_sldo_rmnte < 0) {',
'            v_vlor_sldo_rmnte = 0;',
'        }',
'        apex.item("P2025038_SLDO_RMNTE").setValue("$" + v_vlor_sldo_rmnte.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'    }',
'    else if (region == ''cartera'') {',
'        v_vlor_ttlos = $v("P2025038_VLOR_TTLO").replace(/\$|\.+/g, '''');',
'        v_vlor_ttal_slccndo = $v("P2025038_VLOR_CMPNSDO").replace(/\$|\.+/g, '''');',
'',
'        v_vlor_sldo_rmnte = v_vlor_ttlos - v_vlor_ttal_slccndo;',
'        if (v_vlor_sldo_rmnte < 0) {',
'            v_vlor_sldo_rmnte = 0;',
'        }',
'        apex.item("P2025038_SLDO_RMNTE").setValue("$" + v_vlor_sldo_rmnte.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'    }',
'}',
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
'        ',
'        window.localStorage.setItem(''jsoncartera'', JSON.stringify(jsonCartera));',
'        $s(''P257_JSON_CRTRAS'', JSON.stringify(jsonCartera));',
'        console.log(''json_cartera de obtenerCartera(): '' + JSON.stringify(jsonCartera));',
'        ',
'    }',
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
'        $s(''P2025038_JSON_TTLOS'', JSON.stringify(jsonTitulos));',
'        console.log(''json_titulos: '' + JSON.stringify(jsonTitulos))',
'        //window.localStorage.setItem(''jsonTitulos'', JSON.stringify(jsonTitulos));',
'    }',
'};'))
,p_javascript_code_onload=>'buildJsonTitulos();'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ACARABALLO'
,p_last_upd_yyyymmddhh24miss=>'20250907202309'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19111654054371501)
,p_plug_name=>unistr('Par\00E1metros ')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19115537289371540)
,p_plug_name=>unistr('Datos Del T\00EDtulo')
,p_parent_plug_id=>wwv_flow_api.id(19111654054371501)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19112189326371506)
,p_plug_name=>'Cartera'
,p_region_name=>'cartera'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with carteras as',
' (select rownum, t.*',
'    from (select k.idntfccion_sjto,',
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
'            from (select b.idntfccion_sjto,',
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
'                      on c.id_mvmnto_fncro = d.id_mvmnto_fncro                  ',
'                    where c.id_impsto = :P2025038_ID_IMPSTO',
'                     and c.id_impsto_sbmpsto = :P2025038_ID_IMPSTO_SBMPSTO',
'                     and a.idntfccion like (case',
'                           when pkg_gf_titulos_judicial.fnc_ca_nit_cc(:P257_IDNTFCCION_DMNDDO) = ''N'' then',
'                            (''%'' ||',
'                            substr(nvl(substr(ltrim(:P2025038_IDNTFCCION_DMNDDO, 0),',
'                                               1,',
'                                               instr(:P2025038_IDNTFCCION_DMNDDO,',
'                                                     ''-'')),',
'                                        ltrim(:P2025038_IDNTFCCION_DMNDDO, 0)),',
'                                    1,',
'                                    9) || ''%'')',
'                           else',
'                            (''%'' ||',
'                            nvl(substr(ltrim(:P2025038_IDNTFCCION_DMNDDO, 0),',
'                                        1,',
'                                        instr(:P2025038_IDNTFCCION_DMNDDO, ''-'')),',
'                                 ltrim(:P2025038_IDNTFCCION_DMNDDO, 0)) || ''%'')',
'                         end)',
'                     and (d.vlor_sldo_cptal + d.vlor_intres) > 0',
'                     and c.cdgo_mvnt_fncro_estdo in (''NO'', ''CN'')',
'                     and a.prncpal_s_n = ''S''',
'                     and not exists (select 1 from mc_g_embargos_cartera_detalle z ',
'                                     where z.id_sjto_impsto = c.id_sjto_impsto',
'                                     and z.vgncia = d.vgncia',
'                                     and z.id_prdo = d.id_prdo',
'                                     and z.id_cncpto = d.id_cncpto)',
'                   order by d.vgncia desc, d.cdgo_cncpto) k                    ',
'           group by k.idntfccion_sjto,',
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
'              on m.id_instncia_fljo = l.id_instncia_fljo',
'            join gf_g_titulos_jdcial_vgncia n',
'              on n.id_ttlo_jdcial_impsto = m.id_ttlo_jdcial_impsto',
'           where l.idntfccion_dmnddo like (case',
'                   when pkg_gf_titulos_judicial.fnc_ca_nit_cc(:P2025038_IDNTFCCION_DMNDDO) = ''N'' then',
'                    (''%'' ||',
'                    substr(nvl(substr(ltrim(:P2025038_IDNTFCCION_DMNDDO, 0),',
'                                       1,',
'                                       instr(:P2025038_IDNTFCCION_DMNDDO, ''-'')),',
'                                ltrim(:P2025038_IDNTFCCION_DMNDDO, 0)),',
'                            1,',
'                            9) || ''%'')',
'                   else',
'                    (''%'' || nvl(substr(ltrim(:P2025038_IDNTFCCION_DMNDDO, 0),',
'                                       1,',
'                                       instr(:P2025038_IDNTFCCION_DMNDDO, ''-'')),',
'                                ltrim(:P2025038_IDNTFCCION_DMNDDO, 0)) || ''%'')',
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
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(19112342410371508)
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
 p_id=>wwv_flow_api.id(19112676017371511)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n <br>Sujeto')
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
 p_id=>wwv_flow_api.id(19112779523371512)
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
 p_id=>wwv_flow_api.id(19112808491371513)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
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
 p_id=>wwv_flow_api.id(19112944329371514)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencias'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(19113046690371515)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Per\00EDodos')
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
 p_id=>wwv_flow_api.id(19113181886371516)
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
 p_id=>wwv_flow_api.id(19113253187371517)
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
 p_id=>wwv_flow_api.id(19113313186371518)
,p_name=>'ID_SJTO_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_RSPNSBLE'
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(19113464109371519)
,p_name=>'VLOR_SLDO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Saldo<br> Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(19113569669371520)
,p_name=>'VLOR_SLDO_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Saldo <br>Inter\00E9s')
,p_heading_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(19113651340371521)
,p_name=>'VLOR_DSCNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DSCNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Descuentos'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(19113780654371522)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Saldo Total'
,p_heading_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(19113886948371523)
,p_name=>'VLOR_TTAL_OCULTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_OCULTO'
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
 p_id=>wwv_flow_api.id(19113906564371524)
,p_name=>'VLOR_TTAL_APLCAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_APLCAR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor a <br>Compensar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
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
 p_id=>wwv_flow_api.id(19114062689371525)
,p_name=>'VLOR_DSCNTO_APLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DSCNTO_APLCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor <br>Descuento Compensado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(19114163164371526)
,p_name=>'VLOR_TTAL_APLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_APLCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
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
 p_id=>wwv_flow_api.id(19114245906371527)
,p_name=>'VLOR_DSCNTO_OCLTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DSCNTO_OCLTO'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(19114344976371528)
,p_name=>'TPO_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_DCMNTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Tipo <br>Compensaci\00F3n')
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
 p_id=>wwv_flow_api.id(19114455936371529)
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
 p_id=>wwv_flow_api.id(19114584832371530)
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
 p_id=>wwv_flow_api.id(19116460018371549)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(19116582621371550)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(19112265502371507)
,p_internal_uid=>19112265502371507
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
 p_id=>wwv_flow_api.id(19119137366450611)
,p_interactive_grid_id=>wwv_flow_api.id(19112265502371507)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(19119243683450611)
,p_report_id=>wwv_flow_api.id(19119137366450611)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19119728450450614)
,p_view_id=>wwv_flow_api.id(19119243683450611)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(19112342410371508)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19121237436450621)
,p_view_id=>wwv_flow_api.id(19119243683450611)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(19112676017371511)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19121762584450622)
,p_view_id=>wwv_flow_api.id(19119243683450611)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(19112779523371512)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19122263056450624)
,p_view_id=>wwv_flow_api.id(19119243683450611)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(19112808491371513)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19122762778450625)
,p_view_id=>wwv_flow_api.id(19119243683450611)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(19112944329371514)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19123221087450627)
,p_view_id=>wwv_flow_api.id(19119243683450611)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(19113046690371515)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19123713367450629)
,p_view_id=>wwv_flow_api.id(19119243683450611)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(19113181886371516)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19124256417450630)
,p_view_id=>wwv_flow_api.id(19119243683450611)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(19113253187371517)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19124758719450632)
,p_view_id=>wwv_flow_api.id(19119243683450611)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(19113313186371518)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19125286149450634)
,p_view_id=>wwv_flow_api.id(19119243683450611)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(19113464109371519)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19125703633450635)
,p_view_id=>wwv_flow_api.id(19119243683450611)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(19113569669371520)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19126215975450637)
,p_view_id=>wwv_flow_api.id(19119243683450611)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(19113651340371521)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19126793672450639)
,p_view_id=>wwv_flow_api.id(19119243683450611)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(19113780654371522)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19127260574450640)
,p_view_id=>wwv_flow_api.id(19119243683450611)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(19113886948371523)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19127792061450642)
,p_view_id=>wwv_flow_api.id(19119243683450611)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(19113906564371524)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19128202110450643)
,p_view_id=>wwv_flow_api.id(19119243683450611)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(19114062689371525)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19128767453450645)
,p_view_id=>wwv_flow_api.id(19119243683450611)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(19114163164371526)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19129271324450646)
,p_view_id=>wwv_flow_api.id(19119243683450611)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(19114245906371527)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19129703859450648)
,p_view_id=>wwv_flow_api.id(19119243683450611)
,p_display_seq=>21
,p_column_id=>wwv_flow_api.id(19114344976371528)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19130277235450649)
,p_view_id=>wwv_flow_api.id(19119243683450611)
,p_display_seq=>22
,p_column_id=>wwv_flow_api.id(19114455936371529)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19130736221450651)
,p_view_id=>wwv_flow_api.id(19119243683450611)
,p_display_seq=>23
,p_column_id=>wwv_flow_api.id(19114584832371530)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19170427204797355)
,p_view_id=>wwv_flow_api.id(19119243683450611)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(19116460018371549)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19115681131371541)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
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
 p_id=>wwv_flow_api.id(19115776704371542)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
'Esta funcionalidad permite:<br><br>',
unistr('Proyectar la Compensaci\00F3n del T\00EDtulo Judicial.<br><br>'),
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19164952076791706)
,p_plug_name=>unistr('<b>Proceso Puntual T\00EDtulo Judicial No. &P2025038_NMRO_TTLO_JDCIAL. </b>')
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
 p_id=>wwv_flow_api.id(19192216742246701)
,p_plug_name=>unistr('<b>T\00EDtulos Registrados </b>')
,p_region_name=>'titulos'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
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
'  join df_s_identificaciones_tipo b',
'    on b.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo_dmnddo',
'  join df_c_areas c',
'    on c.id_area = a.id_ttlo_jdcial_area',
'  join df_c_bancos d',
'    on d.id_bnco = a.id_bnco_cnsgnnte',
'  join df_c_bancos e',
'    on e.id_bnco = a.id_bnco_rcddr',
'  left join gf_d_titulos_judicial_estdo f',
'    on f.cdgo_ttlo_jdcial_estdo = a.cdgo_ttlo_jdcial_estdo',
' where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(19192482379246703)
,p_name=>'ID_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL'
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
 p_id=>wwv_flow_api.id(19192596556246704)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
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
 p_id=>wwv_flow_api.id(19192606241246705)
,p_name=>'ID_TTLO_JDCIAL_CRGDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_CRGDO'
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
 p_id=>wwv_flow_api.id(19192749079246706)
,p_name=>'NMRO_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_JDCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('N\00FAmero T\00EDtulo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(19192842495246707)
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
 p_id=>wwv_flow_api.id(19192980159246708)
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
 p_id=>wwv_flow_api.id(19193094992246709)
,p_name=>'ID_TTLO_JDCIAL_AREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_AREA'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(19193103782246710)
,p_name=>'CDGO_IDNTFCCION_TPO_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_IDNTFCCION_TPO_DMNDDO'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(19193227543246711)
,p_name=>'IDNTFCCION_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n <br>Demandado')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(19193336295246712)
,p_name=>'NMBRE_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombres'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(19193449614246713)
,p_name=>'NMRO_TTLO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_PDRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(19193514486246714)
,p_name=>'ID_TTLO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_PDRE'
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
 p_id=>wwv_flow_api.id(19193665678246715)
,p_name=>'CDGO_ENTDAD_CNSGNNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ENTDAD_CNSGNNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(19193774780246716)
,p_name=>'ID_BNCO_CNSGNNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_BNCO_CNSGNNTE'
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
 p_id=>wwv_flow_api.id(19193833344246717)
,p_name=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Estado T\00EDtulo<br>Judicial')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
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
 p_id=>wwv_flow_api.id(19193934137246718)
,p_name=>'TTLO_JDCIAL_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TTLO_JDCIAL_ESTDO'
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
 p_id=>wwv_flow_api.id(19194025451246719)
,p_name=>'ID_EMBRGO_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGO_RSLCION'
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
 p_id=>wwv_flow_api.id(19194157992246720)
,p_name=>'ID_INSTNCIA_FLJO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO_PDRE'
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
 p_id=>wwv_flow_api.id(19194282307246721)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
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
 p_id=>wwv_flow_api.id(19194330612246722)
,p_name=>'ID_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTUD'
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
 p_id=>wwv_flow_api.id(19194459874246723)
,p_name=>'CDGO_ENTDAD_RCDDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ENTDAD_RCDDR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(19194592194246724)
,p_name=>'ID_BNCO_RCDDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_BNCO_RCDDR'
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
 p_id=>wwv_flow_api.id(19194649897246725)
,p_name=>'CNSCTVO_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNSCTVO_EMBRGO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'No. Embargo'
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
end;
/
begin
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(19192342188246702)
,p_internal_uid=>19192342188246702
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
 p_id=>wwv_flow_api.id(19199818380252817)
,p_interactive_grid_id=>wwv_flow_api.id(19192342188246702)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(19199923575252817)
,p_report_id=>wwv_flow_api.id(19199818380252817)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19200402660252818)
,p_view_id=>wwv_flow_api.id(19199923575252817)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(19192482379246703)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19200957528252820)
,p_view_id=>wwv_flow_api.id(19199923575252817)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(19192596556246704)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19201406347252821)
,p_view_id=>wwv_flow_api.id(19199923575252817)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(19192606241246705)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19201905949252823)
,p_view_id=>wwv_flow_api.id(19199923575252817)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(19192749079246706)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19202483536252824)
,p_view_id=>wwv_flow_api.id(19199923575252817)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(19192842495246707)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19202924177252826)
,p_view_id=>wwv_flow_api.id(19199923575252817)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(19192980159246708)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19203490962252827)
,p_view_id=>wwv_flow_api.id(19199923575252817)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(19193094992246709)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19203973938252829)
,p_view_id=>wwv_flow_api.id(19199923575252817)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(19193103782246710)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19204419414252831)
,p_view_id=>wwv_flow_api.id(19199923575252817)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(19193227543246711)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19204961207252832)
,p_view_id=>wwv_flow_api.id(19199923575252817)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(19193336295246712)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19205433449252834)
,p_view_id=>wwv_flow_api.id(19199923575252817)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(19193449614246713)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19205965410252835)
,p_view_id=>wwv_flow_api.id(19199923575252817)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(19193514486246714)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19206400060252836)
,p_view_id=>wwv_flow_api.id(19199923575252817)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(19193665678246715)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19206902015252838)
,p_view_id=>wwv_flow_api.id(19199923575252817)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(19193774780246716)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19207463002252840)
,p_view_id=>wwv_flow_api.id(19199923575252817)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(19193833344246717)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19207982094252841)
,p_view_id=>wwv_flow_api.id(19199923575252817)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(19193934137246718)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19208422525252843)
,p_view_id=>wwv_flow_api.id(19199923575252817)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(19194025451246719)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19208953188252844)
,p_view_id=>wwv_flow_api.id(19199923575252817)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(19194157992246720)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19209466485252846)
,p_view_id=>wwv_flow_api.id(19199923575252817)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(19194282307246721)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19209965485252847)
,p_view_id=>wwv_flow_api.id(19199923575252817)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(19194330612246722)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19210409036252849)
,p_view_id=>wwv_flow_api.id(19199923575252817)
,p_display_seq=>21
,p_column_id=>wwv_flow_api.id(19194459874246723)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19210947305252850)
,p_view_id=>wwv_flow_api.id(19199923575252817)
,p_display_seq=>22
,p_column_id=>wwv_flow_api.id(19194592194246724)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(19211407910252852)
,p_view_id=>wwv_flow_api.id(19199923575252817)
,p_display_seq=>23
,p_column_id=>wwv_flow_api.id(19194649897246725)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19212207523266006)
,p_plug_name=>'Registro Saldos Vigencias Futuras'
,p_region_name=>'saf'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400'
,p_plug_template=>wwv_flow_api.id(177331524321050607)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19212331838266007)
,p_plug_name=>unistr('Saldos Pendientes De Los T\00EDtulos')
,p_parent_plug_id=>wwv_flow_api.id(19212207523266006)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19212560548266009)
,p_plug_name=>'Registro De Datos Vigencias Futuras'
,p_parent_plug_id=>wwv_flow_api.id(19212207523266006)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>70
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19187015054144201)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(19112189326371506)
,p_button_name=>'BTN_ADD_CTRA'
,p_button_static_id=>'BTN_ADD_CTRA'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P2025038_VLOR_TTLO'
,p_button_condition2=>'$0'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19213428321266018)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(19115681131371541)
,p_button_name=>'BTN_VGNCIAS_FTRAS'
,p_button_static_id=>'BTN_VGNCIAS_FTRAS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Vigencias Futuras'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P2025038_VLOR_TTLO'
,p_button_condition2=>'$0'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19227037691589302)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(19115681131371541)
,p_button_name=>'BTN_RGSTRAR_CRTRA'
,p_button_static_id=>'BTN_RGSTRAR_CRTRA'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar Cartera'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P2025038_VLOR_TTLO'
,p_button_condition2=>'$0'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19115072369371535)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(19111654054371501)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19212983530266013)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(19212560548266009)
,p_button_name=>'BTN_RGSTRAR_SAF'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Registrar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19111702356371502)
,p_name=>'P2025038_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(19111654054371501)
,p_prompt=>'Tributo'
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
,p_attribute_10=>'60%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19111891545371503)
,p_name=>'P2025038_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(19111654054371501)
,p_prompt=>'Sub - Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where id_impsto = :P2025038_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P2025038_ID_IMPSTO'
,p_ajax_items_to_submit=>'P2025038_ID_IMPSTO,P2025038_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'60%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19111911315371504)
,p_name=>'P2025038_FCHA_PRYCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(19111654054371501)
,p_prompt=>unistr('Fecha De Proyecci\00F3n')
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19112002802371505)
,p_name=>'P2025038_IDNTFCCION_SJTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(19111654054371501)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19114620150371531)
,p_name=>'P2025038_IDNTFCCION_DMNDDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(19111654054371501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19114879427371533)
,p_name=>'P2025038_ID_TTLO_JDCIAL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(19111654054371501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19114986674371534)
,p_name=>'P2025038_NMRO_TTLO_JDCIAL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(19111654054371501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19115145139371536)
,p_name=>'P2025038_VLOR_TTLO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(19115537289371540)
,p_prompt=>unistr('Valor T\00EDtulo')
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19115206502371537)
,p_name=>'P2025038_VLOR_CMPNSDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(19115537289371540)
,p_item_default=>'0'
,p_prompt=>'Valor Seleccionado'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
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
 p_id=>wwv_flow_api.id(19115349378371538)
,p_name=>'P2025038_SLDO_RMNTE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(19115537289371540)
,p_prompt=>'Saldo Por Compensar'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
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
 p_id=>wwv_flow_api.id(19211782370266001)
,p_name=>'P2025038_JSON_TTLOS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(19111654054371501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19211872805266002)
,p_name=>'P2025038_JSON_FRCCNR'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(19111654054371501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19211911710266003)
,p_name=>'P2025038_JSON_DVLVR'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(19111654054371501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19212067734266004)
,p_name=>'P2025038_JSON_CNSGNR'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(19111654054371501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19212404709266008)
,p_name=>'P2025038_SLDO_TTLO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(19212331838266007)
,p_prompt=>unistr('Saldo Restante Del T\00EDtulo')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19212650144266010)
,p_name=>'P2025038_IDNTFCCION_SJTO_SAF'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(19212560548266009)
,p_prompt=>unistr('Identificaci\00F3n')
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
 p_id=>wwv_flow_api.id(19212738196266011)
,p_name=>'P2025038_VLOR_SLDO_FVOR'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(19212560548266009)
,p_prompt=>'Valor Saldo A Favor'
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
 p_id=>wwv_flow_api.id(19212890987266012)
,p_name=>'P2025038_OBSRVCNES'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(19212560548266009)
,p_prompt=>'Observaciones'
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
 p_id=>wwv_flow_api.id(19269004649224901)
,p_name=>'P2025038_CDGO_TREA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(19111654054371501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(19115411014371539)
,p_computation_sequence=>10
,p_computation_item=>'P2025038_VLOR_TTLO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(vlor_t, :F_FRMTO_MNDA)',
'  from (select ((select sum(a.vlor)',
'                   from gf_g_titulos_judicial a',
'                  where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                    and a.cdgo_ttlo_jdcial_estdo = ''CMP'') -',
'               (select nvl(sum(b.vlor_ttal_aplcar), 0)',
'                   from gf_g_titulos_jdcial_vgncia b',
'                  where b.id_instncia_fljo = :F_ID_INSTNCIA_FLJO) -     ',
'               (select nvl(sum(b.vlor_ttal_aplcar), 0)',
'                   from gf_g_titulos_jdcial_vgncia_temp b',
'                  where b.id_instncia_fljo = :F_ID_INSTNCIA_FLJO) -',
'               (select nvl(sum(b.vlor_sldo_fvor), 0)',
'                   from gf_g_titulos_judicial_saldo_favor b',
'                  where b.id_instncia_fljo = :F_ID_INSTNCIA_FLJO)) vlor_t',
'          from dual);'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(19115806209371543)
,p_computation_sequence=>20
,p_computation_item=>'P2025038_SLDO_RMNTE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'to_char((NVL(',
'  TO_NUMBER(',
'    NULLIF(REGEXP_REPLACE(:P2025038_VLOR_TTLO, ''[^0-9\-]'', ''''), '''')',
'  ),',
'  0',
')',
'-',
'NVL(',
'  TO_NUMBER(',
'    NULLIF(REGEXP_REPLACE(:P2025038_VLOR_CMPNSDO, ''[^0-9\-]'', ''''), '''')',
'  ),',
'  0',
')), :F_FRMTO_MNDA)'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19116201727371547)
,p_name=>'Al seleccionar una fila de cartera'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(19112189326371506)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19116301482371548)
,p_event_id=>wwv_flow_api.id(19116201727371547)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'saldosTitulos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19116008112371545)
,p_name=>'Al inicializar Cartera'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(19112189326371506)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19116159710371546)
,p_event_id=>wwv_flow_api.id(19116008112371545)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'TPO_DCMNTO,VLOR_DSCNTO_APLCCION,VLOR_TTAL_APLCCION,VLOR_TTAL_APLCAR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19164745787791704)
,p_name=>'Al tener el foco'
,p_event_sequence=>30
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(19112189326371506)
,p_triggering_element=>'VLOR_TTAL_APLCAR'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19164846257791705)
,p_event_id=>wwv_flow_api.id(19164745787791704)
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
 p_id=>wwv_flow_api.id(19164584451791702)
,p_name=>'valida_valor_compensado'
,p_event_sequence=>40
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(19112189326371506)
,p_triggering_element=>'VLOR_TTAL_APLCAR'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19164655374791703)
,p_event_id=>wwv_flow_api.id(19164584451791702)
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
 p_id=>wwv_flow_api.id(19187147840144202)
,p_name=>'Al dar clic en BTN_ADD_CTRA'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(19187015054144201)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19187282708144203)
,p_event_id=>wwv_flow_api.id(19187147840144202)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function fnc_guardacarteraTemp(){',
'    try{',
'        ',
'        obtenerCartera();',
'        ',
'        let v_json = JSON.parse(localStorage.getItem(''jsoncartera'') || ''[]'');',
'        ',
'        if (v_json.length === 0){',
'            apex.message.alert(''Debe seleccionar al menos un registro con valor a aplicar mayor a cero'');',
'            return;',
'        }',
'        console.log(''Jeson cartera No 2: '', JSON.stringify(v_json));',
'        ',
'        apex.server.process("GuardarCaretraTemp",{',
'            f01: JSON.stringify(v_json),',
'            pageItems: "#F_CDGO_CLNTE, #P2025038_JSON_TTLOS, #F_ID_USRIO"',
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
'                }',
'            }',
'        })',
'    }catch(e){',
'        console.log(e);',
'    }',
'}',
'',
'function limpiarItems(){',
'    apex.item("P2025038_ID_IMPSTO").setValue("");',
'    apex.item("P2025038_ID_IMPSTO_SBMPSTO").setValue("");',
'    apex.item("P2025038_IDNTFCCION_SJTO").setValue("");',
'    apex.region("cartera").refresh();',
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
 p_id=>wwv_flow_api.id(19213037148266014)
,p_name=>'Al dar clien en BTN_RGSTRAR_SAF'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(19212983530266013)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19213159051266015)
,p_event_id=>wwv_flow_api.id(19213037148266014)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function registro() {',
'    try {',
'        apex.server.process("GuardarVigenciasFuturas",',
'            {',
'                pageItems: "#F_CDGO_CLNTE, #F_ID_FNCNRIO, #F_ID_USRIO, #F_ID_INSTNCIA_FLJO, #P2025038_IDNTFCCION_SJTO_SAF, #P2025038_VLOR_SLDO_FVOR, #P2025038_OBSRVCNES"',
'            },',
'            {',
'                success: function (data) {',
'                    if (data.o_cdgo_rspsta != 0) {',
'                        console.log(''RESPUESTA: '' + data.o_cdgo_rspsta);',
'                        apex.message.clearErrors();',
'                        apex.message.showErrors([{',
'                            type: "error",',
'                            location: "page",',
'                            message: data.o_mnsje_rspsta,',
'                            unsafe: false',
'                        }]);',
'                    } else {',
unistr('                        apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                        apex.item("P2025038_IDNTFCCION_SJTO_SAF").setValue("");',
'                        apex.item("P2025038_VLOR_SLDO_FVOR").setValue("");',
'                        apex.item("P2025038_OBSRVCNES").setValue("");',
'                        apex.submit();',
'                    }',
'                }',
'            }',
'        )',
'    } catch (e) {',
'        console.log(e);',
'    }',
'}',
'',
'function parseCurrency(value) {',
'    if (!value) return 0;',
unistr('    // Quita el s\00EDmbolo de pesos y espacios'),
'    value = value.replace(/\$/g, '''').trim();',
unistr('    // Si hay dos puntos (miles y decimales), elimina los de miles y conserva el \00FAltimo como decimal'),
'    let parts = value.split(''.'');',
'    if (parts.length > 2) {',
unistr('        let decimal = parts.pop(); // \00FAltima parte como decimales'),
'        value = parts.join('''') + ''.'' + decimal;',
'    }',
'    // Quita cualquier coma',
'    value = value.replace(/,/g, '''');',
'    return Number(value);',
'}',
'',
'function mostrarError(item, mensaje) {',
'    apex.message.clearErrors();',
'    apex.message.showErrors([{',
'        type: "error",',
'        location: "inline",',
'        pageItem: item,',
'        message: mensaje,',
'        unsafe: false',
'    }]);',
'}',
'',
'function validacion() {',
'    var idntficcion_sjto = apex.item("P2025038_IDNTFCCION_SJTO_SAF").getValue();',
'    var vlor_saf_raw = apex.item("P2025038_VLOR_SLDO_FVOR").getValue();',
'    var obs = apex.item("P2025038_OBSRVCNES").getValue();',
'    var vlor_ttlo_raw = apex.item("P2025038_SLDO_TTLO").getValue();',
'',
'    console.log(''vlor_ttlo:'', vlor_ttlo_raw);',
'    console.log(''vlor_saf:'', vlor_saf_raw);',
'',
unistr('    // Validaciones de campos vac\00EDos antes de convertir a n\00FAmero'),
'    if (idntficcion_sjto.trim() === "") {',
'        mostrarError("P2025038_IDNTFCCION_SJTO_SAF", "Por favor diligencie todos los campos requeridos!!!.");',
'        return;',
'    }',
'    if (vlor_saf_raw.trim() === "") {',
'        mostrarError("P2025038_VLOR_SLDO_FVOR", "Por favor diligencie todos los campos requeridos!!!.");',
'        return;',
'    }',
'    if (obs.trim() === "") {',
'        mostrarError("P2025038_OBSRVCNES", "Por favor diligencie todos los campos requeridos!!!.");',
'        return;',
'    }',
'',
unistr('    // Convertir a n\00FAmero solo si no est\00E1n vac\00EDos'),
'    var vlor_ttlo = parseCurrency(vlor_ttlo_raw);',
'    var vlor_saf = parseCurrency(vlor_saf_raw);',
'',
'    if (isNaN(vlor_ttlo) || isNaN(vlor_saf)) {',
unistr('        mostrarError("P2025038_VLOR_SLDO_FVOR", "Formato num\00E9rico inv\00E1lido.");'),
'        return;',
'    }',
'',
'    if (vlor_saf > vlor_ttlo) {',
unistr('        mostrarError("P2025038_VLOR_SLDO_FVOR", "El valor a registrar no puede superar el saldo del t\00EDtulo!!!.");'),
'        return;',
'    }',
'',
unistr('    // Confirmaci\00F3n antes de guardar'),
unistr('    apex.message.confirm("\00BFEst\00E1 seguro de guardar este saldo para vigencias futuras?", function (okPressed) {'),
'        if (okPressed) {',
'            registro();',
'        }',
'    });',
'}',
'',
'validacion();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19213599333266019)
,p_name=>'Al dar click BTN_VGNCIAS_FTRAS'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(19213428321266018)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19213630309266020)
,p_event_id=>wwv_flow_api.id(19213599333266019)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function abrirSAF() {',
'    var saldo;',
'    var valor_titulo = $v("P2025038_VLOR_TTLO").replace(/\$|\.+/g, '''');',
'    var sldo_aplcdo = $v("P2025038_VLOR_CMPNSDO").replace(/\$|\.+/g, '''');',
'    ',
'    console.log(''valor_titulo: '' + valor_titulo);',
'    console.log(''sldo_aplcdo: '' + sldo_aplcdo);',
'',
'    valor_titulo = Number(valor_titulo);',
'    sldo_aplcdo = Number(sldo_aplcdo);',
'',
'    if (valor_titulo > 0) {',
'        saldo = valor_titulo - sldo_aplcdo;',
'    } ',
'',
'    console.log(''saldo: '' + saldo);',
'',
'    if (saldo > 0) {',
'        apex.item("P2025038_SLDO_TTLO").setValue("$" + saldo.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, "."));',
'        apex.item("P2025038_VLOR_SLDO_FVOR").setValue(saldo);',
'    } else {',
'        apex.item("P2025038_SLDO_TTLO").setValue("$0.00");',
'    }',
'    apex.item("P2025038_IDNTFCCION_SJTO_SAF").setValue(""); ',
'    //apex.item("P2025038_VLOR_SLDO_FVOR").setValue("");',
'    apex.item("P2025038_OBSRVCNES").setValue("");',
'    openModal("saf");',
'}',
'',
'abrirSAF();',
''))
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19227168460589303)
,p_name=>'Al dar clic en BTN_RGSTRAR_CRTRA'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(19227037691589302)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19227281153589304)
,p_event_id=>wwv_flow_api.id(19227168460589303)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function fnc_guardarRemanenteCP(){',
'    try{',
'                    ',
'        apex.server.process("GuardarRemanenteCP",{',
'             pageItems: "#F_CDGO_CLNTE, #P2025038_JSON_TTLOS, #F_ID_USRIO"',
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
'                    $("#BTN_RGSTRAR_CRTRA").hide();                    ',
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
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19114708800371532)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar_Datos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'     select idntfccion_dmnddo',
'            , id_ttlo_jdcial',
'            , nmro_ttlo_jdcial',
'        --    , vlor',
'       into :P2025038_IDNTFCCION_DMNDDO',
'           ,:P2025038_ID_TTLO_JDCIAL',
'           ,:P2025038_NMRO_TTLO_JDCIAL',
'       --    , :P2025038_VLOR_TTLO',
'       from v_gf_g_titulos_judicial',
'      where id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'      and rownum = 1;',
'exception',
'    when others then',
'        :P2025038_IDNTFCCION_DMNDDO := null;',
'        :P2025038_ID_TTLO_JDCIAL := null;',
'        :P2025038_NMRO_TTLO_JDCIAL := null;',
'      --  :P2025038_VLOR_TTLO := 0;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19187388300144204)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'JsonTitulos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    for c_ttlos in (select id_ttlo_jdcial, ',
'                           ttlo_jdcial_estdo,',
'                           id_instncia_fljo ',
'                    from json_table(:P2025038_JSON_TTLOS, ''$[*]'' ',
'                                     columns (id_ttlo_jdcial            varchar2 path ''$.ID_TTLO_JDCIAL'',',
'                                              ttlo_jdcial_estdo    varchar2 path ''$.TTLO_JDCIAL_ESTDO'',',
'                                              id_instncia_fljo    varchar2 path ''$.ID_INSTNCIA_FLJO''))',
'    )loop',
'            if c_ttlos.ttlo_jdcial_estdo in (''ACN'',''CNS'',''ATJ'',''CMP'',''CYC'') then',
'                select json_arrayagg(',
'                           json_object (',
'                               ''id_ttlo_jdcial'' value id_ttlo_jdcial',
'                           )',
'                       ) as json_titulos',
'                into :P2025038_JSON_CNSGNR',
'                from (',
'                    /*select a.id_ttlo_jdcial from gf_g_titulos_judicial a',
'                    where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                    and a.cdgo_ttlo_jdcial_estdo in (''ACN'', ''CNS'', ''ATJ'')*/',
'                    select id_ttlo_jdcial, ',
'                           ttlo_jdcial_estdo,',
'                           id_instncia_fljo',
'                    from json_table(:P2025038_JSON_TTLOS, ''$[*]'' ',
'                                     columns (id_ttlo_jdcial            varchar2 path ''$.ID_TTLO_JDCIAL'',',
'                                              ttlo_jdcial_estdo    varchar2 path ''$.TTLO_JDCIAL_ESTDO'',',
'                                              id_instncia_fljo    varchar2 path ''$.ID_INSTNCIA_FLJO'')) a',
'                    where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                    and a.ttlo_jdcial_estdo in (''ACN'', ''CNS'', ''ATJ'',''CMP'',''CYC'')',
'                );',
'            elsif c_ttlos.ttlo_jdcial_estdo in (''ASL'',''SDT'',''CDT'') then',
'                select json_arrayagg(',
'                           json_object (',
'                               ''id_ttlo_jdcial'' value id_ttlo_jdcial',
'                           )',
'                       ) as json_titulos',
'                into :P2025038_JSON_DVLVR',
'                from (',
'                    /*select a.id_ttlo_jdcial from gf_g_titulos_judicial a',
'                    where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                    and a.cdgo_ttlo_jdcial_estdo in (''ASL'', ''SDT'', ''CDT'')*/',
'                    select id_ttlo_jdcial, ',
'                           ttlo_jdcial_estdo,',
'                           id_instncia_fljo',
'                    from json_table(:P2025038_JSON_TTLOS, ''$[*]'' ',
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
'                into :P2025038_JSON_FRCCNR',
'                from (',
'                    /*select a.id_ttlo_jdcial from gf_g_titulos_judicial a',
'                    where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                    and a.cdgo_ttlo_jdcial_estdo = ''FRC''*/',
'                    ',
'                    select id_ttlo_jdcial, ',
'                           ttlo_jdcial_estdo,',
'                           id_instncia_fljo',
'                    from json_table(:P2025038_JSON_TTLOS, ''$[*]'' ',
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
 p_id=>wwv_flow_api.id(19212128196266005)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GuardarCaretraTemp'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	v_cdgo_rspsta  number := 0;',
'	v_mnsje_rspsta varchar2(1000);',
'	v_exception    exception;',
'	v_json         clob;',
'begin  ',
'',
'	for i in 1..apex_application.g_f01.count loop',
'		v_json := v_json || apex_application.g_f01(i);',
'	end loop; ',
'',
'	pkg_gf_titulos_judicial.prc_rg_titulo_vigencias_temp(p_cdgo_clnte    => :F_CDGO_CLNTE,',
'														 p_json_ttlos    => :P2025038_JSON_TTLOS,',
'														 p_json_crtra    => v_json,',
'														 p_fcha_pryccion => :P2025038_FCHA_PRYCCION,',
'														 o_cdgo_rspsta   => v_cdgo_rspsta,',
'														 o_mnsje_rspsta  => v_mnsje_rspsta);',
'',
'	if v_cdgo_rspsta > 0 then',
'		raise v_exception;  ',
'	end if;',
'',
'	apex_json.open_object;',
'	apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'	apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'	apex_json.close_object;',
'',
'exception',
'	when v_exception then',
'		rollback;',
'		apex_json.open_object;',
'		apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'		apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'		apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19213244962266016)
,p_process_sequence=>20
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
'      insert into muerto(n_001,v_001) values(1000,:F_ID_FNCNRIO);commit;',
'      pkg_gf_titulos_judicial.prc_rg_titulos_judicial_saf(p_cdgo_clnte       => :F_CDGO_CLNTE,',
'                                                          p_id_instncia_fljo => :F_ID_INSTNCIA_FLJO,',
'                                                          p_idntfccion_sjto  => :P2025038_IDNTFCCION_SJTO_SAF,',
'                                                          p_vlor_sldo_fvor   => :P2025038_VLOR_SLDO_FVOR,',
'                                                          p_obsrvcnes        => :P2025038_OBSRVCNES,',
'                                                          p_fcha_rgstro      => sysdate,',
'                                                          p_id_fncnrio       => :F_ID_USRIO,',
'                                                          o_cdgo_rspsta      => v_cdgo_rspsta,',
'                                                          o_mnsje_rspsta     => v_mnsje_rspsta);',
'',
'      if v_cdgo_rspsta > 0 then',
'            raise v_exception;',
'      end if;',
'',
'      apex_json.open_object;',
'      apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'      apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'      apex_json.close_object;',
'',
'exception',
'      when v_exception then',
'            rollback;',
'            apex_json.open_object;',
'            apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'            apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'            apex_json.close_object;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19227360041589305)
,p_process_sequence=>30
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
'                                                       p_json_ttlos   => :P2025038_JSON_TTLOS,',
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
);
end;
/
