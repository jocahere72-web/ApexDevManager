prompt --application/pages/page_00312
begin
wwv_flow_api.create_page(
 p_id=>312
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Formulario Bimestral'
,p_alias=>'DL_FRM_ICA_BIMESTRAL'
,p_step_title=>'Formulario Bimestral'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1',
'#IMAGE_PREFIX#javascript/infortributos/js/accounting.min.js',
'#IMAGE_PREFIX#javascript/infortributos/Declaraciones/formularioDeclaracionV2.js?v=0020'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('//MONTER\00CDA'),
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
unistr('var pageId = &APP_PAGE_ID.;  // Extrae el n\00FAmero de la pagina.'),
'var estado_calculo = true;',
'',
'async function validarSujetoTributo(){',
'    let $waitPopup = apex.widget.waitPopup();',
'    try{',
'        await apex.server.process ( "ajax_validarSujetoTributo", {',
'            pageItems: "#P"+pageId+"_ID_DCLRCION_VGNCIA_FRMLRIO,#P"+pageId+"_IDNTFCCION"',
'        }, {',
'            success: function( pData ){',
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
'                    apex.item( ''P''+pageId+''_ID_SJTO_IMPSTO'' ).setValue( pData.o_mnsje_rspsta );',
'                    apex.item( ''P''+pageId+''_MSTRAR_FRMLRIO'').setValue( "S" );',
'                    apex.submit();',
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
'function calcularId() {',
'    var region = apex.region(''actividad'');',
'',
'    if (region) {',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        var seq = 0;',
'        var vlor_igrsos_grvdos = 0;',
'        var vlor_impuesto = 0;',
'        var json = records.map((record) => {',
'            return {',
'                "SEQ_ID": model.getValue(record, "SEQ_ID")',
'            };',
'        });',
'',
'        if (json.length > 0) {',
'            const promises = records.map((data) => {',
'                seq = model.getValue(data, "SEQ_ID");',
'                apex.item(''P'' + pageId + ''_SEQ_ID'').setValue(seq);',
'            });',
'',
'            Promise.all(promises).then(() => {',
'            }).catch((error) => {',
'                console.error("Error al actualizar valores de impuesto:", error);',
'            });',
'        }',
'    }    ',
'};',
'',
'async function agregarActividad() {',
'    var grid = apex.region("actividad").widget();',
'    var view = grid.interactiveGrid("getViews", "grid");',
'    var model = view.model;',
'    var newRecord = model.insertNewRecord();  ',
unistr('    apex.message.showPageSuccess("Actividad a\00F1adida.");'),
'    setTimeout(function() {',
'                $(''.t-Alert--success'').fadeOut(''slow'');',
'            }, 1000);',
'};',
'',
'async function eliminarActividad() {',
unistr('    apex.message.confirm("\00BFEst\00E1s seguro que desea eliminar la actividad?", function (okPressed) {'),
'        if (okPressed) {',
'            setTimeout(function () {',
'                var region = apex.region("actividad");',
'                if (!region) {',
unistr('                    console.error("No se encontr\00F3 la regi\00F3n del IG.");'),
'                    return;',
'                }',
'',
'                var view = region.widget().interactiveGrid("getViews", "grid");',
'                if (!view) {',
unistr('                    console.error("No se encontr\00F3 la vista del IG.");'),
'                    return;',
'                }',
'',
'                var model = view.model;',
'                if (!model) {',
unistr('                    console.error("No se encontr\00F3 el modelo de datos del IG.");'),
'                    return;',
'                }',
'',
'                var selectedRecords = view.getSelectedRecords();',
'                if (!selectedRecords || selectedRecords.length === 0) {',
'                    console.warn("No hay filas seleccionadas para eliminar.");',
'                    return;',
'                }',
'',
'                // Eliminar visualmente los registros seleccionados',
'                region.widget().interactiveGrid("getActions").invoke("selection-delete");',
'',
unistr('                // Ejecutar funciones despu\00E9s de eliminar'),
'                setTimeout(() => {',
'                    calculoTotalActividades();',
'                    buildJsonActividadesEstampilla();',
'                }, 300);',
'            }, 200);',
'        }',
'    });',
'}',
'',
'',
'async function calculoActividad() {',
'    var tipo_declaracion = apex.item(''P''+pageId+''_TIPO_DCLRCION'').getValue();   ',
'    ',
'    var region = apex.region(''actividad'');',
'    if (!region) {',
unistr('        console.error(''No se encontr\00F3 la regi\00F3n "actividad"'');'),
'        return;',
'    }',
'    var view = region.widget().interactiveGrid("getViews", "grid");',
'    var model = view.model;',
'    let contadorFLA = 0;        ',
'    model.forEach(function(record) {        ',
'        contadorFLA++;',
'        //debugger;',
'        var trfaStr = model.getValue(record, "TRFA") || "0";',
'        var id_esquema = model.getValue(record, "TRFA") || "0";',
'        var trfa = parseFloat(trfaStr.toString().replace('','', ''.'')) || 0;  ',
'        console.log(''Valor TARIFA => ''+trfa);',
'        var ingrss_ordnrios = parseFloat(model.getValue(record, "INGRSS_ORDNRIOS")) || 0; //item 9',
'        var ingrss_actvdad  = parseFloat(model.getValue(record, "INGRSS_ACTVDAD")) || 0; //item 10',
'        ',
'        var INGRSS_GRVBLE = ingrss_ordnrios - ingrss_actvdad; //item 11',
'        var vlor_impuesto = (trfa * INGRSS_GRVBLE) / 1000;  ',
'        console.log(''Valor TARIFA => ''+vlor_impuesto);',
'',
'        if ( ingrss_actvdad > ingrss_ordnrios) {',
'            apex.message.clearErrors();',
'                    apex.message.showErrors ([',
'                        {',
'                            type:       "error",',
'                            location:   "page",',
'                            message:    "El valor ingresado no puede ser mayor a la columna 9. INGRESOS ORDINARIOS Y EXTRAORDINARIOS DEL PERIODO EN EL MUNICIPIO ($COP).",',
'                            unsafe:     false',
'                        }',
'                    ]);',
'            ',
'            model.setValue(record, "INGRSS_ACTVDAD", redondearAlMultiploDeMil(0));',
'            model.setValue(record, "VLOR_ESTMPLLA", redondearAlMultiploDeMil(vlor_impuesto));',
'            ',
'            setTimeout(function() {',
'                $(''.t-Alert-wrap'').fadeOut(''slow'');',
'            }, 6000);',
'            ',
'        }else{      ',
'             if (isNaN(ingrss_actvdad)) {',
'                   model.setValue(record, "INGRSS_ACTVDAD", redondearAlMultiploDeMil(0));',
'             };',
'            model.setValue(record, "INGRSS_GRVBLE", redondearAlMultiploDeMil(INGRSS_GRVBLE));',
'            model.setValue(record, "VLOR_ESTMPLLA", redondearAlMultiploDeMil(vlor_impuesto));     ',
'        };        ',
'  });',
'    setTimeout(function() {calculoTotalActividades(); }, 300);    ',
'    setTimeout(function() {buildJsonActividadesEstampilla(); }, 300);  ',
'};',
'',
'async function valorCalculado() {',
'    var region = apex.region("actividad");',
'    if (!region) {',
unistr('        console.error("No se encontr\00F3 la regi\00F3n del IG.");'),
'        return;',
'    }',
'    var grid = region.widget(); ',
'    setTimeout(function() {',
'                        calculoActividad();  $(''.t-Alert--success'').fadeOut(''slow'');         ',
'                    }, 300);',
'};',
'function habilitarItems(){',
unistr('//regi\00F3n informaci\00F3n contribuyente'),
'apex.item( ''P'' + pageId + ''_TPO_IDENTIFICACION'' ).enable();',
'apex.item( ''P'' + pageId + ''_IDENTIFICACION'' ).enable();    ',
'apex.item( ''P'' + pageId + ''_DIGITO_VERIFICACION'' ).enable();',
'apex.item( ''P'' + pageId + ''_CNSRCIO_UNION_TMPRL'' ).setValue(''N'');',
'apex.item( ''P'' + pageId + ''_RLZA_ACTDS_PNIO_AUTNMO'' ).setValue(''N'');',
'apex.item( ''P'' + pageId + ''_CNCLCION_ESTBLCMIENTO'' ).setValue(''N'');    ',
unistr('//regi\00F3n Base gravable'),
'apex.item( ''P'' + pageId + ''_MENOS_AUTORRETENCIONES'' ).enable();',
'apex.item( ''P'' + pageId + ''_TTL_INGRS_ORIOS_EXTRS_PAIS'' ).enable();',
'apex.item( ''P'' + pageId + ''_CLCLO_CNCPTO_ANT_ANTICIPO'' ).show();',
'apex.item( ''P'' + pageId + ''_TTL_INGRS_ORIOS_EXTRS_MNCPIO'' ).show();',
'apex.item( ''P'' + pageId + ''_TOTAL_INGRESOS_GRVBLES'' ).enable();    ',
'apex.item( ''P'' + pageId + ''_MNS_INGRSS_FUERA_MNCPIO'' ).enable();',
'apex.item( ''P'' + pageId + ''_MNS_INGRSOS_DEV_REB_DES'' ).enable();',
'apex.item( ''P'' + pageId + ''_MNS_INGRSOS_EXPRTCIONS'' ).enable();',
'apex.item( ''P'' + pageId + ''_MNS_INGRSOS_VNTA_ACT_FIJS'' ).enable();',
'apex.item( ''P'' + pageId + ''_MNS_INGRSOS_ACTVDDS_EXCLDS'' ).enable();',
'apex.item( ''P'' + pageId + ''_MNS_INGRSOS_ACTVDDS_EXENTAS'' ).enable();',
'apex.item( ''P'' + pageId + ''_MENS_VLR_EXNCN_EXNRCN_IMPSTO'' ).enable();',
'apex.item( ''P'' + pageId + ''_MNS_VLR_EXNCION_SBRE_IMPSTO'' ).enable();',
'apex.item( ''P'' + pageId + ''_MNS_RTNCNES_PRCTCRON_PRDO'' ).enable();',
'apex.item( ''P'' + pageId + ''_AUTORRETNCNES_AVSOS_TBLROS'' ).enable();',
'apex.item( ''P'' + pageId + ''_AUTO_RRTNCNES_SBRTSA_BMBROS'' ).enable();',
'apex.item( ''P'' + pageId + ''_TOTAL_AUTORRETENCIONES'' ).enable();',
unistr('//regi\00F3n Activdades'),
'apex.item( ''P'' + pageId + ''_TOTAL_INGRESOS_GRAVADS'' ).show();',
'apex.item( ''P'' + pageId + ''_TOTAL_IMPUESTO'' ).show();',
'apex.item( ''P'' + pageId + ''_IMPUESTO_LEY'' ).show();',
unistr('//region liquidaci\00F3n privada'),
'apex.item( ''P'' + pageId + ''_TTAL_PGOS_ABNOS_CUENTA_ICA'' ).enable();	',
'apex.item( ''P'' + pageId + ''_TTL_IMPSTO_INDSTRIA_CMRCIO'' ).enable();',
'apex.item( ''P'' + pageId + ''_CALCULO_INTRSS_INTRIA_CMRCIO'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_INTRIA_CRCIO'' ).enable();',
'apex.item( ''P'' + pageId + ''_CLCLO_INTRSS_AVSS_TBLRS'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_AVSS_TBS'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_INTRSES_STSA_BMRL'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_STSA_BMRL'' ).enable();',
'apex.item( ''P'' + pageId + ''_CLCLO_INTRSES_STSA_SGRD'' ).enable();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_STSA_SGRD'' ).enable();',
'apex.item( ''P'' + pageId + ''_CLCLO_DESCUENTO_SANCION'' ).show();',
'apex.item( ''P'' + pageId + ''_IMPUESTO_AVISOS_TABLEROS'').show();',
'apex.item( ''P'' + pageId + ''_SOBRETASA_SEGURIDAD'').enable();',
'apex.item( ''P'' + pageId + ''_ANTICIPO_ANIO_SIGUIENTE'').enable();',
'apex.item( ''P'' + pageId + ''_SANCION_SUGERIDA'' ).enable();',
'apex.item( ''P'' + pageId + ''_TOTAL_SALDO_CARGO'' ).enable();',
'apex.item( ''P'' + pageId + ''_TOTAL_SALDO_FAVOR'' ).enable();			 ',
'apex.item( ''P'' + pageId + ''_MENS_RTNCINES_PRCTRON_PRDO'').show();',
'apex.item( ''P'' + pageId + ''_DESCUENTO_PRONTO_PAGO'' ).show();',
'apex.item( ''P'' + pageId + ''_INTERESES_MORA'' ).enable();',
'apex.item( ''P'' + pageId + ''_TOTAL_PAGAR'' ).enable(); ',
'apex.item( ''P'' + pageId + ''_VALOR_PAGAR'' ).show();',
'apex.item( ''P'' + pageId + ''_TOTAL_PAGAR_PAGO_VOLUNTARIO'' ).enable();',
'apex.item( ''P'' + pageId + ''_TARIFA'' ).enable();    ',
'apex.item( ''P'' + pageId + ''_SANCION_MANUAL'').show();',
'apex.item( ''P'' + pageId + ''_NMRO_ESTBLCMIENTS'').show();',
'apex.item( ''P'' + pageId + ''_AVISOS_TABLEROS'').show();',
'apex.item( ''P'' + pageId + ''_AUTORRETNCNES_AVSOS_TBLROS'').show();',
'apex.item( ''P'' + pageId + ''_NMRO_ESTBLCMIENTS'').show();',
'apex.item( ''P'' + pageId + ''_CNSRCIO_UNION_TMPRL'').show();',
'apex.item( ''P'' + pageId + ''_RLZA_ACTDS_PNIO_AUTNMO'').show();',
'apex.item( ''P'' + pageId + ''_CNCLCION_ESTBLCMIENTO'').show();  ',
'apex.item( ''P'' + pageId + ''_GENERACION_ENERGIA'' ).show();',
'apex.item( ''P'' + pageId + ''_IMPUESTO_LEY'' ).show();',
'apex.item( ''P'' + pageId + ''_SALDO_FAVOR_AVISOS_TABLEROS'').show();',
'apex.item( ''P'' + pageId + ''_CONCEPTO_AVISOS_TABLEROS'').show();',
'apex.item( ''P'' + pageId + ''_DIFERENCIA_AVISOS_TABLEROS'').show();',
'apex.item( ''P'' + pageId + ''_CLCLO_ANTERIOR_AVISOS_TBLRS'').show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DFCIA_PGO_AVSS_TBLRS'').show();',
'apex.item( ''P'' + pageId + ''_VLR_PAGO_AVISOS_TABLEROS'').show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_AVSS_TBLRS'').show();',
'apex.item( ''P'' + pageId + ''_CLCLO_SLDO_FVR_PGO_AVSS_TBS'').show();',
'apex.item( ''P'' + pageId + ''_PGO_UNDDS_CMRCLS'').show();',
'apex.item( ''P'' + pageId + ''_SOBRETASA_BOMBERIL'').show();',
'apex.item( ''P'' + pageId + ''_SLDO_FVR_CNPTO_SBTSA_BMRL'').show();',
'apex.item( ''P'' + pageId + ''_DFRNCIA_CNCPTO_SBTSA_BMRL'').show();',
'apex.item( ''P'' + pageId + ''_CNCPTO_SBRTSA_BMBRL'').show();',
'apex.item( ''P'' + pageId + ''_CLCLO_CNCPTO_ANT_STSA_BMRL'').show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DIF_PGO_STSA_BMRL'').show();',
'apex.item( ''P'' + pageId + ''_CLCLO_VLR_PGO_STSA_BMRL'').show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_STSA_BMRL'').show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_STSA_BMRL'').show();',
'apex.item( ''P'' + pageId + ''_CLCLO_SLDO_FVR_PGO_STSA_BMRL'').show();',
'apex.item( ''P'' + pageId + ''_SOBRETASA_SEGURIDAD'').show();',
'apex.item( ''P'' + pageId + ''_CNCPTO_SBRTSA_SGRDD'').show();',
'apex.item( ''P'' + pageId + ''_DFRNCIA_CNCPTO_STSA_SGRD'').show();',
'apex.item( ''P'' + pageId + ''_SLDO_FVR_CNCPTO_STSA_SGRD'').show();',
'apex.item( ''P'' + pageId + ''_CLCLO_CNCPTO_ANT_STSA_SGRD'').show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DIF_PGO_STSA_SGRD'').show();',
'apex.item( ''P'' + pageId + ''_CALCULO_PGO_STSA_SGRD'').show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_STSA_SGRD'').show();',
'apex.item( ''P'' + pageId + ''_CLCLO_INTRSES_STSA_SGRD'').show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_STSA_SGRD'').show();',
'apex.item( ''P'' + pageId + ''_CLCLO_SLDO_FVR_PGO_STSA_SGRD'').show();',
'apex.item( ''P'' + pageId + ''_TOTAL_IMPUESTO_CARGO'').show();',
'apex.item( ''P'' + pageId + ''_CALCULO_TOTAL_SALDO_CARGO'' ).show();',
'apex.item( ''P'' + pageId + ''_TOTAL_SALDO_CARGO'' ).show();',
'apex.item( ''P'' + pageId + ''_MENOS_SLDO_FVR_PRDO_ANTRIOR'').show(); ',
'apex.item( ''P'' + pageId + ''_APORTE_VOLUNTARIO'').show();    ',
'apex.item( ''P'' + pageId + ''_VALOR_PAGO_VOLUNTARIO'').show();  ',
'apex.item( ''P'' + pageId + ''_TOTAL_PAGAR_PAGO_VOLUNTARIO'').enable(); ',
'apex.item( ''P'' + pageId + ''_DESTINO_APORTE_VOLUNTARIO'').enable();',
'apex.item( ''P'' + pageId + ''_MENS_ANTCPO_LIQDDO_ANIO_ANTR'' ).enable();   ',
'apex.item( ''P'' + pageId + ''_ETIQUETA_PRINCIPAL'').show();',
'apex.item( ''P'' + pageId + ''_ETIQUETA_SECUNDARIA'').show();',
'apex.item( ''P'' + pageId + ''_CALCULO_VALOR_PAGAR_BANCOS'').enable();     ',
'apex.item( ''P'' + pageId + ''_TPO_IDNTFCCION_DCLRNTE_FRMA'' ).enable();',
'apex.item( ''P'' + pageId + ''_IDNTFCCION_RPRSNTNTE'' ).enable();',
'apex.item( ''P'' + pageId + ''_TPO_IDENTIFICACION_REVISOR'' ).enable();',
'apex.item( ''P'' + pageId + ''_IDENTIFICACION_REVISOR'' ).enable();',
'apex.item( ''P'' + pageId + ''_CLCLO_DCLRCION_CRRCCION'').show();',
'apex.item( ''P'' + pageId + ''_VALOR_PAGAR_BANCOS'').show();',
'apex.item( ''P'' + pageId + ''_CLCLO_CNCPTO_ANT_ANTICIPO'' ).show();',
'apex.item( ''P'' + pageId + ''_CALCULO_PGO_ANTICIPO'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DIF_PGO_ANTICIPO'' ).show();',
'apex.item( ''P'' + pageId + ''_CALCULO_INTERES_ANTICIPO'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_ANTICIPO'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_SLDO_FVR_PGO_ANTICIPO'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_INTRIA_CRCIO'' ).show(); ',
'apex.item( ''P'' + pageId + ''_CLCLO_INTRSES_STSA_SGRD'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_STSA_SGRD'' ).show();',
'//apex.item( ''P'' + pageId + ''_DESCUENTO_TARIFA'' ).enable();    ',
'document.addEventListener(''keydown'', function(event) {',
'        if (event.key === "Escape" || event.keyCode === 27) {',
unistr('           // event.preventDefault(); // Evita que "Esc" cancele el env\00EDo'),
'            deshabilitarItems(); ',
'            console.log("Tecla Esc deshabilitada.");',
'        }',
'    });',
'}',
'',
'function deshabilitarItems() {  ',
'apex.item( ''P'' + pageId + ''_CLCLO_DCLRCION_CRRCCION'').hide();',
'apex.item( ''P'' + pageId + ''_ID_DCLRCION_V2'').hide();',
'apex.item( ''P'' + pageId + ''_ID_DCLRCION'').hide();',
'apex.item( ''P'' + pageId + ''_NMBRE_RSPNS_FRMA'').hide();',
'apex.item( ''P'' + pageId + ''_ID_PAGE'').hide();',
'apex.item( ''P'' + pageId + ''_JSON_ITEM'').hide();',
'apex.item( ''P'' + pageId + ''_JSON_VALORES'').hide();',
'apex.item( ''P'' + pageId + ''_ITEMS_FECHA'').hide();  ',
'apex.item( ''P'' + pageId + ''_CLCLA_FCHA_PRSNTCION_FINAL'').hide(); ',
'apex.item( ''P'' + pageId + ''_CLCLA_FCHA_PRSNTCION_FINAL_1'' ).disable(); ',
'apex.item( ''P'' + pageId + ''_TPO_IDENTIFICACION'' ).disable();',
'apex.item( ''P'' + pageId + ''_IDENTIFICACION'' ).disable();    ',
'apex.item( ''P'' + pageId + ''_CORREO_ELECTRONICO'' ).enable();',
'apex.item( ''P'' + pageId + ''_DIGITO_VERIFICACION'' ).disable();',
'apex.item( ''P'' + pageId + ''_AVISOS_TABLEROS'').hide();',
'apex.item( ''P'' + pageId + ''_AUTORRETNCNES_AVSOS_TBLROS'').hide();',
'apex.item( ''P'' + pageId + ''_NMRO_ESTBLCMIENTS'').hide();',
'apex.item( ''P'' + pageId + ''_TTL_INGRS_ORIOS_EXTRS_PAIS'' ).disable();',
'apex.item( ''P'' + pageId + ''_TTL_INGRS_ORIOS_EXTRS_MNCPIO'' ).hide();',
'apex.item( ''P'' + pageId + ''_TOTAL_INGRESOS_GRVBLES'' ).disable();    ',
'apex.item( ''P'' + pageId + ''_MNS_INGRSOS_VNTA_ACT_FIJS'' ).hide();',
'apex.item( ''P'' + pageId + ''_MNS_INGRSOS_ACTVDDS_EXCLDS'' ).hide();',
'apex.item( ''P'' + pageId + ''_MNS_INGRSOS_ACTVDDS_EXENTAS'' ).hide();',
'apex.item( ''P'' + pageId + ''_MNS_VLR_EXNCION_SBRE_IMPSTO'').hide();',
'apex.item( ''P'' + pageId + ''_MNS_RTNCNES_PRCTCRON_PRDO'' ).hide();',
'apex.item( ''P'' + pageId + ''_AUTORRETNCNES_AVSOS_TBLROS'' ).disable();    ',
'apex.item( ''P'' + pageId + ''_MENS_VLR_EXNCN_EXNRCN_IMPSTO'' ).disable();',
'apex.item( ''P'' + pageId + ''_MENOS_RETENCIONES'' ).hide(); ',
'apex.item( ''P'' + pageId + ''_TOTAL_AUTORRETENCIONES'' ).hide();   ',
'apex.item( ''P'' + pageId + ''_MENOS_AUTORRETENCIONES'' ).disable();',
'apex.item( ''P'' + pageId + ''_MENS_ANTCPO_LIQDDO_ANIO_ANTR'' ).disable();',
'apex.item( ''P'' + pageId + ''_ANTICIPO_ANIO_SIGUIENTE'' ).hide();',
'apex.item( ''P'' + pageId + ''_TOTAL_SALDO_FAVOR'' ).hide();',
'apex.item( ''P'' + pageId + ''_MENS_RTNCINES_PRCTRON_PRDO'').hide();',
'apex.item( ''P'' + pageId + ''_TOTAL_INGRESOS_GRAVADS'' ).hide();',
'apex.item( ''P'' + pageId + ''_TOTAL_IMPUESTO'' ).hide();',
'apex.item( ''P'' + pageId + ''_IMPUESTO_LEY'' ).hide();',
'apex.item( ''P'' + pageId + ''_TTAL_PGOS_ABNOS_CUENTA_ICA'' ).disable();	',
'apex.item( ''P'' + pageId + ''_TTL_IMPSTO_INDSTRIA_CMRCIO'' ).disable();	',
'apex.item( ''P'' + pageId + ''_CONCEPTO_INDUSTRIA_COMERCIO'' ).hide();',
'apex.item( ''P'' + pageId + ''_SLDO_FVR_CNCPTO_INTRIA_CMRCIO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_CNCPTO_ANT_INTRIA_CRCIO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DFCIA_PGO_INTRIA_CMRCIO'' ).hide();',
'apex.item( ''P'' + pageId + ''_VALOR_PAGO_INDUSTRIA_COMERCIO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CALCULO_DSCNTO_INTRIA_CMRCIO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CALCULO_INTRSS_INTRIA_CMRCIO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_INTRIA_CRCIO'' ).disable();',
'apex.item( ''P'' + pageId + ''_CLCLO_SLDO_FVR_PGO_INTRIA_CCIO'' ).hide();    ',
'apex.item( ''P'' + pageId + ''_TOTAL_IMPUESTO_CARGO'' ).hide();	',
'apex.item( ''P'' + pageId + ''_IMPUESTO_AVISOS_TABLEROS'').hide();',
'apex.item( ''P'' + pageId + ''_SOBRETASA_BOMBERIL'').disable();',
'apex.item( ''P'' + pageId + ''_SOBRETASA_SEGURIDAD'').disable();',
'apex.item( ''P'' + pageId + ''_ANTICIPO_ANIO_SIGUIENTE'').disable();',
'apex.item( ''P'' + pageId + ''_SANCION_SUGERIDA'' ).disable();',
'apex.item( ''P'' + pageId + ''_TOTAL_SALDO_CARGO'' ).disable();',
'apex.item( ''P'' + pageId + ''_TOTAL_SALDO_FAVOR'' ).disable();			 ',
'apex.item( ''P'' + pageId + ''_DESCUENTO_PRONTO_PAGO'' ).hide();',
'apex.item( ''P'' + pageId + ''_INTERESES_MORA'' ).disable();',
'apex.item( ''P'' + pageId + ''_TOTAL_PAGAR'' ).disable(); ',
'apex.item( ''P'' + pageId + ''_VALOR_PAGAR'' ).hide();',
'apex.item( ''P'' + pageId + ''_TOTAL_PAGAR_PAGO_VOLUNTARIO'' ).disable();',
'apex.item( ''P'' + pageId + ''_TARIFA'' ).disable();    ',
'apex.item( ''P'' + pageId + ''_SANCION_MANUAL'').hide();',
'apex.item( ''P'' + pageId + ''_CNSRCIO_UNION_TMPRL'').hide();',
'apex.item( ''P'' + pageId + ''_RLZA_ACTDS_PNIO_AUTNMO'').hide();',
'apex.item( ''P'' + pageId + ''_CNCLCION_ESTBLCMIENTO'').hide();  ',
'apex.item( ''P'' + pageId + ''_GENERACION_ENERGIA'' ).hide();',
'apex.item( ''P'' + pageId + ''_IMPUESTO_LEY'' ).hide();',
'apex.item( ''P'' + pageId + ''_SALDO_FAVOR_AVISOS_TABLEROS'').hide();',
'apex.item( ''P'' + pageId + ''_CONCEPTO_AVISOS_TABLEROS'').hide();',
'apex.item( ''P'' + pageId + ''_DIFERENCIA_AVISOS_TABLEROS'').hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_ANTERIOR_AVISOS_TBLRS'').hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DFCIA_PGO_AVSS_TBLRS'').hide();',
'apex.item( ''P'' + pageId + ''_VLR_PAGO_AVISOS_TABLEROS'').hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_AVSS_TBLRS'').hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_INTRSS_AVSS_TBLRS'').hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_AVSS_TBS'').hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_SLDO_FVR_PGO_AVSS_TBS'').hide();',
'apex.item( ''P'' + pageId + ''_PGO_UNDDS_CMRCLS'').hide();',
'apex.item( ''P'' + pageId + ''_AUTO_RRTNCNES_SBRTSA_BMBROS'').hide();',
'apex.item( ''P'' + pageId + ''_SOBRETASA_BOMBERIL'').hide();',
'apex.item( ''P'' + pageId + ''_SLDO_FVR_CNPTO_SBTSA_BMRL'').hide();',
'apex.item( ''P'' + pageId + ''_DFRNCIA_CNCPTO_SBTSA_BMRL'').hide();',
'apex.item( ''P'' + pageId + ''_CNCPTO_SBRTSA_BMBRL'').hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_CNCPTO_ANT_STSA_BMRL'').hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DIF_PGO_STSA_BMRL'').hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_VLR_PGO_STSA_BMRL'').hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_STSA_BMRL'').hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_INTRSES_STSA_BMRL'').hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_STSA_BMRL'').hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_SLDO_FVR_PGO_STSA_BMRL'').hide();',
'apex.item( ''P'' + pageId + ''_SOBRETASA_SEGURIDAD'').hide();',
'apex.item( ''P'' + pageId + ''_CNCPTO_SBRTSA_SGRDD'').hide();',
'apex.item( ''P'' + pageId + ''_DFRNCIA_CNCPTO_STSA_SGRD'').hide();',
'apex.item( ''P'' + pageId + ''_SLDO_FVR_CNCPTO_STSA_SGRD'').hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_CNCPTO_ANT_STSA_SGRD'').hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DIF_PGO_STSA_SGRD'').hide();',
'apex.item( ''P'' + pageId + ''_CALCULO_PGO_STSA_SGRD'').hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_STSA_SGRD'').hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_INTRSES_STSA_SGRD'').disable();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_STSA_SGRD'').disable();',
'apex.item( ''P'' + pageId + ''_CLCLO_SLDO_FVR_PGO_STSA_SGRD'').hide();',
'apex.item( ''P'' + pageId + ''_SLDO_FVR_CNCPTO_ANTCPO'' ).hide();',
'apex.item( ''P'' + pageId + ''_DFRNCIA_CNCPTO_ANTCPO'' ).hide();',
'apex.item( ''P'' + pageId + ''_VALOR_CONCEPTO_ANTICIPO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CALCULO_INTERES_ANTICIPO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_IMPSTO_CRGO_SNCION'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_NETO_SANCION'' ).hide();',
'apex.item( ''P'' + pageId + ''_SANCION_SELECCIONADA'' ).hide();',
'apex.item( ''P'' + pageId + ''_DIFERENCIA_CNCPTO_SNCION'' ).hide();',
'apex.item( ''P'' + pageId + ''_CALCULO_DFRNCIA_PGO_SNCION'' ).hide();',
'apex.item( ''P'' + pageId + ''_VALOR_CONCEPTO_SANCION'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DESCUENTO_SANCION'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_SLDO_FVR_PGO_SNCION'' ).hide();',
'apex.item( ''P'' + pageId + ''_MENOS_SLDO_FVR_PRDO_ANTRIOR'' ).hide();',
'apex.item( ''P'' + pageId + ''_CALCULO_TOTAL_SALDO_CARGO'' ).hide();',
'apex.item( ''P'' + pageId + ''_TIPO_SANCION'').disable();    ',
'apex.item( ''P'' + pageId + ''_ITEM_CERO'' ).hide();',
'apex.item( ''P'' + pageId + ''_ETIQUETA'' ).hide();',
'apex.item( ''P'' + pageId + ''_SANCION_MANUAL'').hide();    ',
'apex.item( ''P'' + pageId + ''_MENOS_SLDO_FVR_PRDO_ANTRIOR'').hide();     ',
'apex.item( ''P'' + pageId + ''_DESTINO_APORTE_VOLUNTARIO'').disable();',
'apex.item( ''P'' + pageId + ''_APORTE_VOLUNTARIO'').hide();    ',
'apex.item( ''P'' + pageId + ''_VALOR_PAGO_VOLUNTARIO'').hide();  ',
'apex.item( ''P'' + pageId + ''_TOTAL_PAGAR_PAGO_VOLUNTARIO'').hide();     ',
'apex.item( ''P'' + pageId + ''_JSON_ACTVDDES'').hide();   ',
'apex.item( ''P'' + pageId + ''_CLCLO_CNCPTO_INDSTRIA_CMRCIO'').hide();',
'apex.item( ''P'' + pageId + ''_TPO_IDNTFCCION_DCLRNTE_FRMA'' ).disable();',
'apex.item( ''P'' + pageId + ''_IDNTFCCION_RPRSNTNTE'' ).disable();',
'apex.item( ''P'' + pageId + ''_TPO_IDENTIFICACION_REVISOR'' ).disable();',
'apex.item( ''P'' + pageId + ''_IDENTIFICACION_REVISOR'' ).disable();',
'apex.item( ''P'' + pageId + ''_TARIFA'' ).disable();',
'apex.item( ''P'' + pageId + ''_ETIQUETA_PRINCIPAL'').hide();',
'apex.item( ''P'' + pageId + ''_ETIQUETA_SECUNDARIA'').hide();',
'apex.item( ''P'' + pageId + ''_CALCULO_VALOR_PAGAR_BANCOS'').hide();',
'apex.item( ''P'' + pageId + ''_VALOR_PAGAR_BANCOS'').hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_CNCPTO_ANT_ANTICIPO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CALCULO_PGO_ANTICIPO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DIF_PGO_ANTICIPO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CALCULO_INTERES_ANTICIPO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_ANTICIPO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_SLDO_FVR_PGO_ANTICIPO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_INTRIA_CRCIO'' ).hide(); ',
'apex.item( ''P'' + pageId + ''_CLCLO_INTRSES_STSA_SGRD'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_STSA_SGRD'' ).hide(); ',
'//apex.item( ''P'' + pageId + ''_DESCUENTO_TARIFA'' ).disable();',
'};',
'',
'function calculoTotalActividades() {',
'    var region = apex.region(''actividad'');',
'    var INGRSS_ORDNRIOS = 0; var INGRSS_ACTVDAD = 0; var INGRSS_GRVBLE = 0; var VLOR_ESTMPLLA = 0; var v_total_impuesto =0;',
'    var TTAL_INGRSS_ORDNRIOS = 0; var TTAL_INGRSS_ACTVDAD = 0; var TTAL_INGRSS_GRVBLE = 0; var TTAL_VLOR_ESTMPLLA = 0; var ttal_v_total_impuesto =0;',
'',
'    if (region) {',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = model._data.filter(function (f) { return f.FCHA_INCIO !== ''''});',
'',
'        records.forEach((actividad) => {',
'            INGRSS_ORDNRIOS  = parseFloat(accounting.unformat(model.getValue(actividad, "INGRSS_ORDNRIOS"), ","));',
'            INGRSS_ACTVDAD   = parseFloat(accounting.unformat(model.getValue(actividad, "INGRSS_ACTVDAD"), ","));',
'            INGRSS_GRVBLE    = parseFloat(accounting.unformat(model.getValue(actividad, "INGRSS_GRVBLE"), ","));',
'            v_total_impuesto = parseFloat(accounting.unformat(model.getValue(actividad, "VLOR_ESTMPLLA"), ","));',
'',
'            if (!isNaN(INGRSS_ORDNRIOS)) {',
'                TTAL_INGRSS_ORDNRIOS  += INGRSS_ORDNRIOS;',
'                TTAL_INGRSS_ACTVDAD   += INGRSS_ACTVDAD;',
'                TTAL_INGRSS_GRVBLE    += INGRSS_GRVBLE;',
'                ttal_v_total_impuesto += v_total_impuesto;',
'            }',
'        });',
'        v_total_impuesto = v_total_impuesto ?? 0;',
'        ',
'        apex.item(''P''+pageId+''_MENS_VLR_EXNCN_SBRE_IMPSTO'').setValue(parseFloat(TTAL_INGRSS_ORDNRIOS)|| 0);',
'        apex.item(''P''+pageId+''_MENS_VLR_EXNCN_EXNRCN_IMPSTO'').setValue(parseFloat(TTAL_INGRSS_ACTVDAD)|| 0);',
'        apex.item(''P''+pageId+''_TTAL_PGOS_ABNOS_CUENTA_ICA'').setValue(redondearAlMultiploDeMil(parseFloat(TTAL_INGRSS_GRVBLE)) || 0);',
'        apex.item(''P''+pageId+''_TTL_IMPSTO_INDSTRIA_CMRCIO'').setValue(redondearAlMultiploDeMil(parseFloat(ttal_v_total_impuesto)) || 0);',
'',
'    }',
'};',
'',
'',
unistr('//Funci\00F3n que calcula los valores de los concepto industria y comercio, avisos y tablero y sobretasa bomberil'),
'function calculoItem17() {',
'    var TTL_IMPSTO_INDSTRIA_CMRCIO   =  parseFloat(apex.item(''P''+pageId+''_TTL_IMPSTO_INDSTRIA_CMRCIO'').getValue()) ?? 0;',
'    var DESCUENTO_TARIFA   =  parseFloat(apex.item(''P''+pageId+''_DESCUENTO_TARIFA'').getValue()) ?? 0;',
'',
unistr('	var indicador_avisostablero      = apex.item(''P''+pageId+''_AVISOS_TABLEROS'').getValue(); // Consulta el valor del items \00BFAvisos y tableros?'),
'	if (DESCUENTO_TARIFA > 0 ) {',
'		var VLOR_RTNCION_DSCNTO = redondearAlMultiploDeMil((parseFloat(TTL_IMPSTO_INDSTRIA_CMRCIO) * DESCUENTO_TARIFA) / 100);',
'		apex.item(''P''+pageId+''_MENOS_AUTORRETENCIONES'').setValue(VLOR_RTNCION_DSCNTO); 		',
'	}else{',
'		apex.item(''P''+pageId+''_MENOS_AUTORRETENCIONES'').setValue(0); ',
'        //apex.item(''P''+pageId+''_IMPUESTO_AVISOS_TABLEROS'').refresh(); ',
'	}    ',
'    var SOBRETASA_BOMBERIL = 0; //redondearAlMultiploDeMil((parseFloat(TTL_IMPSTO_INDSTRIA_CMRCIO) * 7) / 100);',
'    apex.item(''P''+pageId+''_SOBRETASA_BOMBERIL'').setValue(SOBRETASA_BOMBERIL); ',
'};',
'',
unistr('//Funci\00F3n que calcula el item 25'),
'function calculoItem25(){',
'    var item10 = parseFloat(apex.item(''P''+pageId+''_TTL_IMPSTO_INDSTRIA_CMRCIO'').getValue()) ?? 0;   ',
'    var item25 = item10 ;    ',
'    if (item25 < 0 ){',
'        apex.item(''P''+pageId+''_TOTAL_IMPUESTO_CARGO'').setValue(0 || 0);',
'        apex.item(''P''+pageId+''_CLCLO_IMPSTO_CRGO_SNCION'').setValue(0 || 0);																					  ',
'    }else{																	   ',
'        apex.item(''P''+pageId+''_TOTAL_IMPUESTO_CARGO'').setValue(item25 || 0);',
'        apex.item(''P''+pageId+''_CLCLO_IMPSTO_CRGO_SNCION'').setValue(item25 || 0);',
'    }',
'    calculoItem33();',
'};',
'',
unistr('function calculoItem33(){ //33. C\00C1LCULO  TOTAL SALDO A CARGO (RENGL\00D3N 25-26-27-28-29+30+31-32)'),
'    var item22 = parseFloat(apex.item(''P''+pageId+''_TOTAL_IMPUESTO_CARGO'').getValue()) ?? 0;',
'',
'    var item10 = parseFloat(apex.item(''P''+pageId+''_TTL_IMPSTO_INDSTRIA_CMRCIO'').getValue()) ?? 0;    ',
'    var item24 = parseFloat(apex.item(''P''+pageId+''_CLCLO_NETO_SANCION'').getValue()) ?? 0;',
'    //var item32 = parseFloat(apex.item(''P''+pageId+''_MENOS_SLDO_FVR_PRDO_ANTRIOR'').getValue()) ?? 0;',
'    var item33 = item10 + item24;',
'    if (item33 < 0) {',
'         apex.item(''P''+pageId+''_TOTAL_SALDO_CARGO'').setValue(0 || 0);',
'    }else{',
'		  apex.item(''P''+pageId+''_TOTAL_SALDO_CARGO'').setValue( item33|| 0);',
'    }',
'    item33 = item33 - item24;',
'    if (item33 < 0) { ',
'         apex.item(''P''+pageId+''_CALCULO_TOTAL_SALDO_CARGO'').setValue(0 || 0);',
'    }else{',
'         apex.item(''P''+pageId+''_CALCULO_TOTAL_SALDO_CARGO'').setValue( item33 || 0);',
'    }',
'	CLCLO_CNCPTO_INDSTRIA_CMRCIO();',
'};',
unistr('function CLCLO_CNCPTO_INDSTRIA_CMRCIO (){ //4777 - C\00C1LCULO CONCEPTO INDUSTRIA COMERCIO     '),
'    var TOTAL_SALDO_CARGO        = parseFloat(apex.item(''P''+pageId+''_TOTAL_SALDO_CARGO'').getValue()) ?? 0;    ',
'    var item10 = parseFloat(apex.item(''P''+pageId+''_TTL_IMPSTO_INDSTRIA_CMRCIO'').getValue()) ?? 0;      ',
'    var CLCLO_NETO_SANCION       = parseFloat(apex.item(''P''+pageId+''_CLCLO_NETO_SANCION'').getValue()) ?? 0;          ',
'    var DESCUENTO_TARIFA   =  parseFloat(apex.item(''P''+pageId+''_DESCUENTO_TARIFA'').getValue()) ?? 0;    ',
'',
'    var CLCLO_CNCPTO_INDSTRIA_CMRCIO  = ( item10 *  DESCUENTO_TARIFA ) / 100;',
'    if (CLCLO_CNCPTO_INDSTRIA_CMRCIO < 0) { //Condicion que valida el valor del concepto ICA y el saldo a favor del concepto ICA',
'         apex.item(''P''+pageId+''_CLCLO_CNCPTO_INDSTRIA_CMRCIO'').setValue(CLCLO_CNCPTO_INDSTRIA_CMRCIO || 0); ',
'         apex.item(''P''+pageId+''_SLDO_FVR_CNCPTO_INTRIA_CMRCIO'').setValue((1 - 2) * CLCLO_CNCPTO_INDSTRIA_CMRCIO || 0);',
'         apex.item(''P''+pageId+''_CONCEPTO_INDUSTRIA_COMERCIO'').setValue(0 || 0);    ',
'    }else{',
'         apex.item(''P''+pageId+''_CLCLO_CNCPTO_INDSTRIA_CMRCIO'').setValue(CLCLO_CNCPTO_INDSTRIA_CMRCIO || 0); ',
'         apex.item(''P''+pageId+''_CONCEPTO_INDUSTRIA_COMERCIO'').setValue( CLCLO_CNCPTO_INDSTRIA_CMRCIO|| 0);  //4778',
'         apex.item(''P''+pageId+''_SLDO_FVR_CNCPTO_INTRIA_CMRCIO'').setValue(0 || 0);',
'    }        ',
'    ',
'    CONCEPTO_AVISOS_TABLEROS(); ',
'    CNCPTO_SBRTSA_BMBRL(); ',
'    CNCPTO_SBRTSA_SGRDD(); ',
'    //CNCPTO_ANTICIPO_ANIO_SIGUIENTE();',
'    CNCPTO_DIFERENCIA_CNCPTO_SNCION ();  ',
'};',
'',
unistr('function calcularItem40(){  //40. TOTAL A PAGAR CON PAGO VOLUNTARIO (Rengl\00F3n 38 + 39)    '),
'        // debugger;',
'     var item38 = parseFloat(apex.item(''P''+pageId+''_TOTAL_PAGAR'').getValue()) ?? 0 ;',
'     var item39 = parseFloat(apex.item(''P''+pageId+''_VALOR_PAGO_VOLUNTARIO'').getValue()) ?? 0; ',
'     var vlor_pgo_bnco = parseFloat(apex.item(''P''+pageId+''_VALOR_PAGAR_BANCOS'').getValue()) ?? 0; ',
'     var vlor_ttal_pgo_vlntrio = parseFloat(apex.item(''P''+pageId+''_TOTAL_PAGAR_PAGO_VOLUNTARIO'').getValue()) ?? 0; ',
'     ',
'     var VALOR_PAGO_SANCION  = parseFloat(apex.item(''P'' + pageId + ''_VALOR_CONCEPTO_SANCION'').getValue()) || 0;    ',
unistr('	 var CLCLO_DESCUENTO_SANCION = parseFloat(apex.item(''P'' + pageId + ''_CLCLO_DESCUENTO_SANCION'').getValue()) || 0;   // descuento SANCI\00D3N'),
'     var VLOR_PGO_SNCION = (VALOR_PAGO_SANCION - CLCLO_DESCUENTO_SANCION);',
'     var VALOR_PAGO_ICA = parseFloat(apex.item(''P'' + pageId + ''_VALOR_PAGO_INDUSTRIA_COMERCIO'').getValue()) || 0;',
'',
'     var VALOR_CNCPTO_ANT_ICA = parseFloat(apex.item(''P'' + pageId + ''_CLCLO_CNCPTO_ANT_INTRIA_CRCIO'').getValue()) || 0;',
'    var VLOR_CONCEPTO_ANT_AVS0S_TBLROS = parseFloat(apex.item(''P'' + pageId + ''_CLCLO_ANTERIOR_AVISOS_TBLRS'').getValue()) || 0;',
'    var VLOR_CONCEPTO_ANT_STSA_BMRL = parseFloat(apex.item(''P'' + pageId + ''_CLCLO_CNCPTO_ANT_STSA_BMRL'').getValue()) || 0;',
'    var VLOR_CONCEPTO_ANT_SBRTSA_SGRDD = parseFloat(apex.item(''P'' + pageId + ''_CLCLO_CNCPTO_ANT_STSA_SGRD'').getValue()) || 0;',
'',
'    var vlor_pgo_cnpto_ant = VALOR_CNCPTO_ANT_ICA + VLOR_CONCEPTO_ANT_AVS0S_TBLROS + VLOR_CONCEPTO_ANT_STSA_BMRL + VLOR_CONCEPTO_ANT_SBRTSA_SGRDD;',
'    ',
'    var totalApagar = (item38 + item39);    ',
'    if (totalApagar >= 0 ){              ',
'        if (vlor_ttal_pgo_vlntrio != totalApagar ){',
'            apex.item(''P''+pageId+''_TOTAL_PAGAR_PAGO_VOLUNTARIO'').setValue(totalApagar || 0);     ',
'            apex.item(''P''+pageId+''_VALOR_PAGAR_BANCOS'').setValue(totalApagar ?? 0);     ',
'            apex.item(''P'' + pageId + ''_CALCULO_VALOR_PAGAR_BANCOS'')?.setValue(totalApagar ?? 0);',
'            apex.item(''P'' + pageId + ''_DESTINO_APORTE_VOLUNTARIO'')?.setValue(VLOR_PGO_SNCION ?? 0); ',
'            apex.item(''P'' + pageId + ''_MENS_ANTCPO_LIQDDO_ANIO_ANTR'')?.setValue(VALOR_PAGO_ICA ?? 0); ',
'            apex.item(''P'' + pageId + ''_AUTORRETNCNES_AVSOS_TBLROS'')?.setValue(vlor_pgo_cnpto_ant ?? 0);            ',
'        }   ',
'    }else{',
'        apex.item(''P''+pageId+''_TOTAL_PAGAR_PAGO_VOLUNTARIO'').setValue(0 || 0); ',
'        apex.item(''P''+pageId+''_VALOR_PAGAR_BANCOS'').setValue(0 ?? 0);     ',
'        apex.item(''P'' + pageId + ''_CALCULO_VALOR_PAGAR_BANCOS'')?.setValue(0 ?? 0);',
'    }     ',
'};'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'deshabilitarItems();',
'//calculoActividadesGravadas();',
'//buildJsonActividades(); ',
'calculoItem17();',
'//calculoTotalActividades();',
'//calculoValorPago();',
'//calcularItem38();',
'//calcularItem40();',
'//validarValorBanco();*/'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
,p_step_template=>wwv_flow_api.id(252164311814651356)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'SANDION'
,p_last_upd_yyyymmddhh24miss=>'20260303155922'
);
end;
/
begin
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(145720429892590562)
,p_plug_name=>'Encabezado Formulario'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'GI_G_DECLARACIONES_V2'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P312_ID_DCLRCION'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P312_ID_DCLRCION_VGNCIA_FRMLRIO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22229398677667635)
,p_plug_name=>unistr('LIQUIDACI\00D3N PRIVADA')
,p_region_name=>'actividad'
,p_parent_plug_id=>wwv_flow_api.id(145720429892590562)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT rownum AS ID_TMP,',
'       null AS IDNTFCCION,',
'       null AS DSCRPCION,',
'       null AS INGRSS_ORDNRIOS,',
'       null AS INGRSS_ACTVDAD,',
'       null AS INGRSS_GRVBLE,',
'       null AS VLOR_ESTMPLLA,',
'       null AS TRFA',
'FROM dual',
'WHERE 1=0',
';'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>':P312_ID_DCLRCION_VGNCIA_FRMLRIO is not null and :P312_IDNTFCCION is not null and :P312_MSTRAR_FRMLRIO = ''S'''
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(8530207486226111)
,p_name=>'ID_TMP'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TMP'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(8530370223226112)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('C\00D3DIGO CIIU')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  ',
'    a.cdgo_dclrcns_esqma_trfa || '' - '' || a.dscrpcion d,',
'    a.id_dclrcns_esqma_trfa r',
'from    pkg_gi_declaraciones.fnc_co_esquema_tarifario    (',
'                                                            p_cdgo_clnte                    =>  :F_CDGO_CLNTE,',
'                                                            p_id_dclrcion_vgncia_frmlrio    =>  :P312_ID_DCLRCION_VGNCIA_FRMLRIO',
'                                                        )   a',
'order by    a.dscrpcion'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_null_text=>'---- seleccione una actividad ----'
,p_lov_null_value=>'0'
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
,p_column_comment=>unistr('C\00D3DIGO CIIU')
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(8530881525226117)
,p_name=>'VLOR_ESTMPLLA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_ESTMPLLA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_heading=>unistr('13. TOTAL VALOR DE  <br />AUTORRETENCI\00D3N ($COP)')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    //allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_is_required=>false
,p_max_length=>0
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
,p_column_comment=>'VLOR_ESTMPLLA'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(8531023613226119)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_display_condition_type=>'NEVER'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(8531144443226120)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_display_condition_type=>'NEVER'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(8531326493226122)
,p_name=>'INGRSS_ORDNRIOS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INGRSS_ORDNRIOS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_heading=>'9. INGRESOS ORDINARIOS Y <br />EXTRAORDINARIOS DEL PERIODO <br />EN EL MUNICIPIO ($COP)'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    //allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_is_required=>false
,p_max_length=>0
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
 p_id=>wwv_flow_api.id(8531470262226123)
,p_name=>'INGRSS_ACTVDAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INGRSS_ACTVDAD'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_heading=>unistr('10. INGRESO POR ACTIVIDAD  <br /> EXCLU\00CDDA, EXENTA, NO SUJETA,  <br /> EXPORTACI\00D3N,  DEVOLUCI\00D3N,  <br /> REBAJAS  Y  DESCUENTOS <br /> EN EL MUNICIPIO ($COP)')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    //allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_is_required=>false
,p_max_length=>0
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
,p_column_comment=>'INGRSS_ACTVDAD'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(8531681674226125)
,p_name=>'INGRSS_GRVBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INGRSS_GRVBLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_heading=>'11. INGRESOS GRAVABLE DEL  <br />PERIODO EN EL MUNICIPIO ($COP)'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    //allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_is_required=>false
,p_max_length=>0
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
,p_column_comment=>'INGRSS_GRVBLE'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(8531755042226126)
,p_name=>'TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TRFA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'12. TARIFA'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>0
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
 p_id=>wwv_flow_api.id(8871104440946805)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(8871235516946806)
,p_name=>'AGREGAR'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_attribute_01=>'<a href="javascript:agregarActividad();"> <span class="fa fa-plus"></span></a>'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(8873734962946831)
,p_name=>'ID_ACTIVIDAD'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(22230196548667643)
,p_name=>'ELIMINAR'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attribute_01=>'<a href="javascript:eliminarActividad();"> <span class="fa fa-trash"></span></a>'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(22229560879667636)
,p_internal_uid=>22229560879667636
,p_is_editable=>true
,p_edit_operations=>'i:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
,p_lazy_loading=>true
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
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
 p_id=>wwv_flow_api.id(22484138704284290)
,p_interactive_grid_id=>wwv_flow_api.id(22229560879667636)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(22484230936284290)
,p_report_id=>wwv_flow_api.id(22484138704284290)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14835729375594)
,p_view_id=>wwv_flow_api.id(22484230936284290)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(8871104440946805)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>177
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30281305185007)
,p_view_id=>wwv_flow_api.id(22484230936284290)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(8871235516946806)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8777612302902535)
,p_view_id=>wwv_flow_api.id(22484230936284290)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(8530207486226111)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>134
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8778191376902532)
,p_view_id=>wwv_flow_api.id(22484230936284290)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(8530370223226112)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>206
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8780647553902525)
,p_view_id=>wwv_flow_api.id(22484230936284290)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(8530881525226117)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>171
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8784630870873514)
,p_view_id=>wwv_flow_api.id(22484230936284290)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(8531023613226119)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8797534927873465)
,p_view_id=>wwv_flow_api.id(22484230936284290)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(8531326493226122)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>213
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8798000616873464)
,p_view_id=>wwv_flow_api.id(22484230936284290)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(8531470262226123)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>201
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8798557950873462)
,p_view_id=>wwv_flow_api.id(22484230936284290)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(8531681674226125)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>216
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8799018128873461)
,p_view_id=>wwv_flow_api.id(22484230936284290)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(8531755042226126)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>79
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9024830617263717)
,p_view_id=>wwv_flow_api.id(22484230936284290)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(8873734962946831)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>89
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22487716617284301)
,p_view_id=>wwv_flow_api.id(22484230936284290)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(22230196548667643)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>161
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22229380570667634)
,p_plug_name=>'.'
,p_parent_plug_id=>wwv_flow_api.id(22229398677667635)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252169105903651390)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22609492731966495)
,p_plug_name=>'Actividad_Economica'
,p_region_name=>'gestionActividadEconomica'
,p_parent_plug_id=>wwv_flow_api.id(22229398677667635)
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size720x480'
,p_plug_template=>wwv_flow_api.id(252177660597651395)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_column_width=>'width: 848px; '
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(145830177633597695)
,p_plug_name=>'Opciones de Uso'
,p_parent_plug_id=>wwv_flow_api.id(145720429892590562)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P312_ID_DCLRCION_VGNCIA_FRMLRIO is not null and :P312_IDNTFCCION is not null and :P312_MSTRAR_FRMLRIO = ''S'''
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(145830246506597696)
,p_plug_name=>'DATOS GENERALES'
,p_parent_plug_id=>wwv_flow_api.id(145720429892590562)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P312_ID_DCLRCION_VGNCIA_FRMLRIO is not null and :P312_IDNTFCCION is not null and :P312_MSTRAR_FRMLRIO = ''S'''
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(145830309928597697)
,p_plug_name=>unistr('C. Base de Autoretenci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(145720429892590562)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(145830589428597699)
,p_plug_name=>'AUTORRETENCIONES DEL IMPUESTO DE INDUSTRIA Y COMERCIO'
,p_parent_plug_id=>wwv_flow_api.id(145720429892590562)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
,p_plug_display_sequence=>70
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P312_ID_DCLRCION_VGNCIA_FRMLRIO is not null and :P312_IDNTFCCION is not null and :P312_MSTRAR_FRMLRIO = ''S'''
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(145830634329597700)
,p_plug_name=>'E. Pago'
,p_parent_plug_id=>wwv_flow_api.id(145720429892590562)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
,p_plug_display_sequence=>80
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P312_ID_DCLRCION_VGNCIA_FRMLRIO is not null and :P312_IDNTFCCION is not null and :P312_MSTRAR_FRMLRIO = ''S'''
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(145830714754597701)
,p_plug_name=>'F. Firmas'
,p_parent_plug_id=>wwv_flow_api.id(145720429892590562)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
,p_plug_display_sequence=>90
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P312_ID_DCLRCION_VGNCIA_FRMLRIO is not null and :P312_IDNTFCCION is not null and :P312_MSTRAR_FRMLRIO = ''S'''
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21849934781976144)
,p_plug_name=>'Firma del declarante'
,p_parent_plug_id=>wwv_flow_api.id(145830714754597701)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22953354924157395)
,p_plug_name=>'Firma del  contador o revisor fiscal'
,p_parent_plug_id=>wwv_flow_api.id(145830714754597701)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(145831184789597705)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(329806924894161968)
,p_plug_name=>unistr('B\00FAsqueda Sujeto Tributo')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>':P312_ID_DCLRCION_VGNCIA_FRMLRIO is not null and :P312_ID_SJTO_IMPSTO is null'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7245656145419052)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(145831184789597705)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_image_alt=>'Delete'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7246083736419053)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(145831184789597705)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'BELOW_BOX'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7275107438419073)
,p_button_sequence=>650
,p_button_plug_id=>wwv_flow_api.id(22229380570667634)
,p_button_name=>'BTN_ACTUALIZAR_COLUMNA'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_image_alt=>'Btn Actualizar Columna'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7275549011419074)
,p_button_sequence=>660
,p_button_plug_id=>wwv_flow_api.id(22229380570667634)
,p_button_name=>'BTN_GUARDARJSON'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_image_alt=>'btn calulo formulario'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7246764270419053)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(329806924894161968)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7328174017419109)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(22229398677667635)
,p_button_name=>'BTN_AGREGAR_ACTIVIDAD'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar Actividad'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa fa-plus'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>10
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7274411805419073)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(22229398677667635)
,p_button_name=>'BTN_MOSTRAR_REGION_ACTIVIDADES'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Agregar Actividad'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7249085957419055)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(145720429892590562)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Registrar Declaraci\00F3n')
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_execute_validations=>'N'
,p_button_condition=>'P312_ID_SJTO_IMPSTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6905643277135724)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(145720429892590562)
,p_button_name=>'BTN_SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_image_alt=>'HACER SUBMIT'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7248656273419055)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(145720429892590562)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'f?p=&APP_ID.:312:&SESSION.::&DEBUG.:::'
,p_button_condition=>'P312_ID_SJTO_IMPSTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7328543944419109)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(22609492731966495)
,p_button_name=>'BTN_NUEVA_ACTIVIDAD'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_image_alt=>'Nueva Actividad'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7328947206419109)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(22609492731966495)
,p_button_name=>'BTN_CANCELAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7248291011419054)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(145720429892590562)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:&P312_BRANCH.:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(7443988863419173)
,p_branch_name=>'Go To Page 3'
,p_branch_action=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,1:P3_ID_DCLRCION:&P312_ID_DCLRCION_V2.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(7249085957419055)
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6464971998887145)
,p_name=>'P312_INDICADOR_EXTEMPORANEO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(145830177633597695)
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>':P312_ID_DCLRCION_VGNCIA_FRMLRIO IS NOT NULL AND :P312_IDNTFCCION IS NOT NULL'
,p_display_when_type=>'SQL_EXPRESSION'
,p_attribute_01=>'N'
,p_item_comment=>'INDICADOR EXTEMPORANEO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6904734300135715)
,p_name=>'P312_MENS_VLR_EXNCN_SBRE_IMPSTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('TOTAL DE INGRESOS RENGL\00D3N 9')
,p_source=>'MENS_VLR_EXNCN_SBRE_IMPSTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('TOTAL DE INGRESOS RENGL\00D3N 9')
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6904893733135716)
,p_name=>'P312_MENS_RTNCINES_PRCTRON_PRDO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'19. MENOS RETENCIONES QUE LE PRACTICARON EN EL PERIODO'
,p_source=>'MENS_RTNCINES_PRCTRON_PRDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'19. MENOS RETENCIONES QUE LE PRACTICARON EN EL PERIODO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7247133579419053)
,p_name=>'P312_IDNTFCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(329806924894161968)
,p_prompt=>'CC/NIT:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_item_comment=>'CC/NIT:'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7247572948419054)
,p_name=>'P312_ID_PAGE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(329806924894161968)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7249442728419055)
,p_name=>'P312_TIPO_DECLARACION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'TIPO DECLARACION '
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7249801813419056)
,p_name=>'P312_ID_DCLRCION'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>'ID_DCLRCION'
,p_source=>'ID_DCLRCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_03=>'right'
,p_item_comment=>'ID_DECLARACION '
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7250253370419056)
,p_name=>'P312_ID_DCLRCION_V2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>'ID_DCLRCION_v2'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_03=>'right'
,p_item_comment=>'ID_DECLARACION '
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7250697358419056)
,p_name=>'P312_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>unistr('Tipo Declaraci\00F3n ')
,p_source=>'ID_DCLRCION_VGNCIA_FRMLRIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      b.dscrpcion,',
'            a.id_dclrcion_vgncia_frmlrio',
'from        gi_d_dclrcnes_vgncias_frmlr a',
'inner join  gi_d_formularios            b   on  b.id_frmlrio            =   a.id_frmlrio',
'where       a.id_dclrcion_vgncia_frmlrio    =   :P312_ID_DCLRCION_VGNCIA_FRMLRIO;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>unistr('Tipo Declaraci\00F3n ')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7251009247419057)
,p_name=>'P312_VGNCIA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>'Vigencia'
,p_source=>'VGNCIA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      c.vgncia text,',
'            c.vgncia value',
'from        gi_d_dclrcnes_vgncias_frmlr a',
'inner join  gi_d_dclrcnes_tpos_vgncias  b   on  b.id_dclrcion_tpo_vgncia    =   b.id_dclrcion_tpo_vgncia',
'inner join  df_i_periodos               c   on  c.id_prdo                   =   b.id_prdo;',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P312_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_ajax_items_to_submit=>'P312_VGNCIA'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>7
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>'Vigencia'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7251465547419057)
,p_name=>'P312_ID_PRDO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>'Periodo'
,p_source=>'ID_PRDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      c.prdo || '' - '' || c.dscrpcion,',
'            c.id_prdo',
'from        gi_d_dclrcnes_vgncias_frmlr a',
'inner join  gi_d_dclrcnes_tpos_vgncias  b   on  b.id_dclrcion_tpo_vgncia    =   b.id_dclrcion_tpo_vgncia',
'inner join  df_i_periodos               c   on  c.id_prdo                   =   b.id_prdo;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P312_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_ajax_items_to_submit=>'P312_ID_PRDO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>10
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>'Periodo'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7251856523419057)
,p_name=>'P312_JSON_ITEM'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>'P312_JSON_ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_item_comment=>'JSON_ITEMS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7252297764419057)
,p_name=>'P312_JSON_VALORES'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>'P312_JSON_VALORES'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_item_comment=>'JSON_ITEMS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7252620751419057)
,p_name=>'P312_ID_SJTO_IMPSTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_source=>'ID_SJTO_IMPSTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'ID_SUJETO_IMPUESTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7253047028419058)
,p_name=>'P312_INTERESES_MORA_PGO_ANTERIOR'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'MOSTRAR_FORMULARIO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7253437244419058)
,p_name=>'P312_MSTRAR_FRMLRIO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'MOSTRAR_FORMULARIO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7253871278419058)
,p_name=>'P312_BRANCH'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'BRANCH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7254257762419058)
,p_name=>'P312_CDGO_CLNTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'CODIGO_CLIENTE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7254674338419059)
,p_name=>'P312_ID_IMPSTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_source=>'ID_IMPSTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_IMPUESTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7255076979419059)
,p_name=>'P312_ID_IMPSTO_SBMPSTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_source=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_SUBIMPUESTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7255437464419059)
,p_name=>'P312_NMRO_CNSCTVO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_source=>'NMRO_CNSCTVO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'NUMERO_CONSECUTIVO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7255856909419059)
,p_name=>'P312_CDGO_DCLRCION_ESTDO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_source=>'CDGO_DCLRCION_ESTDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'CODIGO_DECLARACION_ESTADO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7256255976419060)
,p_name=>'P312_ID_DCLRCION_USO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_source=>'ID_DCLRCION_USO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_DECLARACION_USO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7256661528419060)
,p_name=>'P312_ID_DCLRCION_CRRCCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_source=>'ID_DCLRCION_CRRCCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_DECLARACION_CORRECCION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7257036822419060)
,p_name=>'P312_ID_USRIO_RGSTRO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_source=>'ID_USRIO_RGSTRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_USUARIO_REGISTRO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7257412818419060)
,p_name=>'P312_FCHA_RGSTRO'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_source=>'FCHA_RGSTRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'FEHCA_REGISTRO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7257896171419061)
,p_name=>'P312_ID_USRIO_ULTIMA_MDFCCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_source=>'ID_USRIO_ULTIMA_MDFCCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_USUARIO_ULTIMA_MODIFICACION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7258261507419061)
,p_name=>'P312_FCHA_ULTMA_MDFCCION'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_source=>'FCHA_ULTMA_MDFCCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'FECHA_ULTIMA_MODIFICACION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7258660021419061)
,p_name=>'P312_FCHA_PRSNTCION'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_source=>'FCHA_PRSNTCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'FECHA_PRESENTACION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7259022563419061)
,p_name=>'P312_ID_USRIO_APLCCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_source=>'ID_USRIO_APLCCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_USUARIO_APLICION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7259453702419061)
,p_name=>'P312_FCHA_APLCCION'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_source=>'FCHA_APLCCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'FECHA_APLICACION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7259853077419062)
,p_name=>'P312_BSE_GRVBLE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_source=>'BSE_GRVBLE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'BASE_GRAVABLE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7260218595419062)
,p_name=>'P312_VLOR_TTAL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_source=>'VLOR_TTAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'VALOR_TOTAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7260662776419062)
,p_name=>'P312_VLOR_PAGO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_source=>'VLOR_PAGO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'VALOR_PAGO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7261040648419062)
,p_name=>'P312_ID_RCDO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_source=>'ID_RCDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_RECAUDO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7261479469419062)
,p_name=>'P312_ID_LQDCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_source=>'ID_LQDCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_LIQUIDACION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7261892352419063)
,p_name=>'P312_ID_USRIO_ANLCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_source=>'ID_USRIO_ANLCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_USUARIO_ANULACION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7262269863419063)
,p_name=>'P312_FCHA_ANLCION'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_source=>'FCHA_ANLCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'FECHA_ANULACION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7262616760419063)
,p_name=>'P312_FCHA_PRSNTCION_PRYCTDA'
,p_source_data_type=>'DATE'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_source=>'FCHA_PRSNTCION_PRYCTDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'FECHA_PRESENTACION_PROYECTADA '
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7263091469419063)
,p_name=>'P312_ID_DCMNTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_source=>'ID_DCMNTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_DOCUMENTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7263405241419064)
,p_name=>'P312_ID_CNDDTO_VGNCIA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_source=>'ID_CNDDTO_VGNCIA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_CANDIDATO_VIGENCIA'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7263855032419064)
,p_name=>'P312_INDCDOR_MGRDO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_source=>'INDCDOR_MGRDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'INDICADOR_MIGRADO '
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7264244995419064)
,p_name=>'P312_CDGO_ORGN_TPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_source=>'CDGO_ORGN_TPO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'CODIGO_ORIGEN_TIPO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7264659979419064)
,p_name=>'P312_NMBRE_RSPNS_FRMA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>'Nmbre Rspns Frma'
,p_source=>'NMBRE_RSPNS_FRMA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>100
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7266479606419066)
,p_name=>'P312_NOMBRES_DECLARANTE_REVISOR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(22953354924157395)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>'NOMBRES Y APELLIDOS CONTADOR O REVISOR FISCAL'
,p_source=>'ID_SJTO_RSPNSBLE_FR_RVS_CNTDOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  trim(a.prmer_nmbre) || '' '' ||trim(a.sgndo_nmbre) ||'' '' || trim(a.prmer_aplldo) ||'' ''|| trim(a.sgndo_aplldo)  text,',
'a.id_sjto_rspnsble value',
'from si_i_sujetos_responsable a',
'where a.id_sjto_impsto = :P312_ID_SJTO_IMPSTO',
'and a.cdgo_tpo_rspnsble in (''RF'', ''CO'', ''RS'')',
'and a.actvo = ''S''',
'order by a.prmer_nmbre,',
'a.prmer_aplldo'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>'NOMBRES Y APELLIDOS REVISOR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7266893643419066)
,p_name=>'P312_TPO_IDENTIFICACION_REVISOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(22953354924157395)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_idntfccion_tpo ',
'from df_s_identificaciones_tipo',
'where cdgo_idntfccion_tpo IN( select b.cdgo_idntfccion_tpo ',
'                              from si_i_sujetos_responsable b ',
'                              where b.id_sjto_rspnsble  = :P312_NOMBRES_DECLARANTE_REVISOR) ',
'order by dscrpcion_idntfccion_tpo asc;'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>unistr('TIPO DE IDENTIFICACI\00D3N REVISOR')
,p_source=>'CDGO_IDNTFCCION_TPO_RSP_FRMA_R'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_idntfccion_tpo d,',
'cdgo_idntfccion_tpo r',
'from df_s_identificaciones_tipo',
'order by dscrpcion_idntfccion_tpo asc'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>unistr('TIPO DE IDENTIFICACI\00D3N REVISOR')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7267269069419066)
,p_name=>'P312_IDENTIFICACION_REVISOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(22953354924157395)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>unistr('N\00B0 IDENTIFICACI\00D3N REVISOR')
,p_source=>'IDNTFCCION_RSPNS_FR_RVS_CNTDOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>100
,p_cMaxlength=>20
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
,p_item_comment=>unistr('N\00B0 IDENTIFICACI\00D3N REVISOR')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7267637274419066)
,p_name=>'P312_TARJETA_PROFESIONAL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(22953354924157395)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>'TARJETA PROFESIONAL'
,p_source=>'TARJETA_PROFESIONAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>50
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_item_comment=>'TARJETA PROFESIONAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7268055386419067)
,p_name=>'P312_REVISADO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(22953354924157395)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_idntfccion_tpo ',
'from df_s_identificaciones_tipo',
'where cdgo_idntfccion_tpo IN( select b.cdgo_idntfccion_tpo ',
'                              from si_i_sujetos_responsable b ',
'                              where b.id_sjto_rspnsble  = :P312_NOMBRES_DECLARANTE_REVISOR) ',
'order by dscrpcion_idntfccion_tpo asc;'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'REVISADO'
,p_source=>'REVISADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion_rspnsble_tpo d,',
'        a.cdgo_rspnsble_tpo r',
'from    df_s_responsables_tipo  a',
'where   a.cdgo_rspnsble_tpo in (''RF'', ''CO'')',
'order by dscrpcion_rspnsble_tpo'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>'REVISADO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7268477176419067)
,p_name=>'P312_ETIQUETA_SECUNDARIA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(22953354924157395)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>'ETIQUETA SECUNDARIA'
,p_source=>'ETQUETA_FRMA_SCNDRIA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_item_comment=>'ETIQUETA FIRMA SECUNDARIO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7269177229419067)
,p_name=>'P312_NOMBRES_DECLARANTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(21849934781976144)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>'NOMBRES Y APELLIDOS DEL DECLARANTE'
,p_source=>'ID_SJTO_RSPNSBLE_FRMA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.prmer_nmbre || '' '' || a.prmer_aplldo || '' '' || a.sgndo_aplldo text,',
'         a.id_sjto_rspnsble value',
'    from si_i_sujetos_responsable a',
'   where a.id_sjto_impsto = :P312_ID_SJTO_IMPSTO',
'     and a.cdgo_tpo_rspnsble in (''L'',''A'', ''R'', ''P'', ''LS'')',
'     and a.actvo = ''S''',
'order by a.prmer_nmbre,',
'         a.prmer_aplldo,',
'         a.sgndo_aplldo'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>'NOMBRES Y APELLIDOS DEL DECLARANTE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7269551960419068)
,p_name=>'P312_TPO_IDNTFCCION_DCLRNTE_FRMA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(21849934781976144)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_idntfccion_tpo ',
'from df_s_identificaciones_tipo',
'where cdgo_idntfccion_tpo IN( select b.cdgo_idntfccion_tpo ',
'                              from si_i_sujetos_responsable b ',
'                              where b.id_sjto_rspnsble  = :P312_NOMBRES_DECLARANTE) ',
'order by dscrpcion_idntfccion_tpo asc;'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>unistr('TIPO DE IDENTIFICACI\00D3N')
,p_source=>'CDGO_IDNTFCCION_TPO_RSPNS_FRMA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion_idntfccion_tpo d,',
'       a.cdgo_idntfccion_tpo r',
'from df_s_identificaciones_tipo a',
'where a.cdgo_idntfccion_tpo in (select  a.cdgo_idntfccion_tpo',
'from    si_i_sujetos_responsable    a',
'where   a.id_sjto_rspnsble  = :P312_NOMBRES_DECLARANTE )',
'order by dscrpcion_idntfccion_tpo asc;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P312_NOMBRES_DECLARANTE'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>unistr('TIPO DE IDENTIFICACI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7269908437419068)
,p_name=>'P312_IDNTFCCION_RPRSNTNTE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(21849934781976144)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>unistr('N\00B0 IDENTIFICACI\00D3N')
,p_source=>'IDNTFCCION_RSPNS_FRMA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_item_comment=>unistr('N\00B0 IDENTIFICACI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7270390168419068)
,p_name=>'P312_ETIQUETA_PRINCIPAL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(21849934781976144)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>'ETIQUETA FIRMA PRINCIPAL'
,p_source=>'ETQUETA_FRMA_PRNCPAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_item_comment=>'ETIQUETA FIRMA PRINCIPAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7275993103419074)
,p_name=>'P312_TOTAL_INGRESOS_GRAVADS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(22229380570667634)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'TOTAL INGRESOS GRAVADOS'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
,p_source=>'TTAL_INGRSOS_GRVDAS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>50
,p_colspan=>6
,p_grid_column=>1
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    //allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'TOTAL INGRESOS GRAVADOS'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7276396588419074)
,p_name=>'P312_TOTAL_IMPUESTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(22229380570667634)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'TOTAL IMPUESTO'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
,p_source=>'TTAL_IMPSTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    //allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'TOTAL IMPUESTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7276730090419074)
,p_name=>'P312_GENERACION_ENERGIA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(22229380570667634)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('18 GENERACI\00D3N DE ENERG\00CDA - CAPACIDAD INSTALADA KW')
,p_source=>'GNRCION_ENRGIA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>100
,p_colspan=>6
,p_grid_column=>1
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
,p_item_comment=>unistr('18 GENERACI\00D3N DE ENERG\00CDA - CAPACIDAD INSTALADA KW')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7277125676419074)
,p_name=>'P312_IMPUESTO_LEY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(22229380570667634)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'19. IMPUESTO LEY 56 DE 1981'
,p_source=>'IMPSTO_LEY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_column=>7
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'   // allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'19. IMPUESTO LEY 56 DE 1981'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7277564158419075)
,p_name=>'P312_JSON_ACTVDDES'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(22229380570667634)
,p_prompt=>'Json Actvddes'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7277915848419075)
,p_name=>'P312_ACTIVIDADES_GRAVADAS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(22229380570667634)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_DCLRCNS_ESQMA_TRFA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ACTIVIDADES GRAVADAS '
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7278348288419075)
,p_name=>'P312_IMPUESTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(22229380570667634)
,p_use_cache_before_default=>'NO'
,p_source=>'VLOR_IPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'IMPUESTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7279063371419076)
,p_name=>'P312_CLASIFICACION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(145830177633597695)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>unistr('CLASIFICACI\00D3N')
,p_source=>'ID_CLASIFICACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_sjto_tpo text,',
'        a.id_sjto_tpo    value',
'from    df_i_sujetos_tipo   a',
'where exists(select      1',
'             from        gi_d_dclrcnes_vgncias_frmlr b',
'             inner join  gi_d_dclrcnes_tpos_vgncias  c   on  c.id_dclrcion_tpo_vgncia=   b.id_dclrcion_tpo_vgncia',
'             inner join  gi_d_dclrcnes_tpos_sjto     d   on  d.id_dclrcn_tpo         =   c.id_dclrcn_tpo',
'             where       b.id_dclrcion_vgncia_frmlrio  =   :P312_ID_DCLRCION_VGNCIA_FRMLRIO',
'             and         d.id_sjto_tpo                 =   a.id_sjto_tpo)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>unistr('CLASIFICACI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7279446529419076)
,p_name=>'P312_OPCION_DE_USO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(145830177633597695)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>unistr('OPCI\00D3N DE USO')
,p_source=>'CDGO_OPCION_DE_USO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_dclrcion_uso    text,',
'        a.cdgo_dclrcion_uso     value',
'from    gi_d_declaraciones_uso  a',
'where   a.cdgo_clnte        =   :F_CDGO_CLNTE',
'and     cdgo_dclrcion_uso   <> ''PAC''',
'order by a.nmbre_dclrcion_uso'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>unistr('OPCI\00D3N DE USO')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7279867370419076)
,p_name=>'P312_FCHA_MAXIMA_PRSNTCION'
,p_source_data_type=>'DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(145830177633597695)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>unistr('FECHA M\00C1XIMA DE PRESENTACI\00D3N')
,p_format_mask=>'DD/MM/YYYY'
,p_source=>'FCHA_MXMA_PRSNTCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'+0d'
,p_attribute_03=>'&P312_CLCLA_FCHA_PRSNTCION_FINAL.'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_item_comment=>unistr('FECHA M\00C1XIMA DE PRESENTACI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7280251066419077)
,p_name=>'P312_ITEMS_FECHA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(145830177633597695)
,p_prompt=>'Items Fecha'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7280692935419077)
,p_name=>'P312_CLCLO_DCLRCION_CRRCCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(145830177633597695)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>unistr('C\00C1LCULO DECLARACI\00D3N DE CORRECCI\00D3N')
,p_source=>'CLCLO_DCLRCION_CRRCCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_colspan=>4
,p_grid_column=>1
,p_display_when=>':P312_ID_DCLRCION_VGNCIA_FRMLRIO IS NOT NULL AND :P312_IDNTFCCION IS NOT NULL'
,p_display_when_type=>'SQL_EXPRESSION'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
,p_item_comment=>unistr('C\00C1LCULO DECLARACI\00D3N DE CORRECCI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7281059946419077)
,p_name=>'P312_NMRO_DCLRCION_ANTRIOR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(145830177633597695)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmro_cnsctvo',
'from    gi_g_declaraciones  a',
'where   a.id_dclrcion   = :P130_CLCLO_DCLRCION_CRRCCION'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>unistr('N\00DAMERO DE DECLARACI\00D3N ANTERIOR')
,p_source=>'NMRO_DCLRCION_ANTRIOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
,p_item_comment=>unistr('N\00DAMERO DE DECLARACI\00D3N ANTERIOR')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7281400540419077)
,p_name=>'P312_CLCLA_FCHA_PRSNTCION_FINAL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(145830177633597695)
,p_prompt=>unistr('CALCULA FECHA PRESENTACI\00D3N FINAL')
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char( pkg_gi_declaraciones_funciones.fnc_co_fcha_mxma_prsntcion( p_id_dclrcion_vgncia_frmlrio =>  :P312_ID_DCLRCION_VGNCIA_FRMLRIO,',
'                                                                          p_idntfccion => :P312_IDNTFCCION , ',
'                                                                          p_id_sjto_tpo => :P312_ID_SJTO_IMPSTO ),',
'                                                                          ''dd/mm/yyyy'' ) as fecha from dual'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_item_comment=>unistr('CALCULA FECHA PRESENTACI\00D3N FINAL')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7282112296419078)
,p_name=>'P312_NMBRES_RZN_SCIAL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_api.id(145830246506597696)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>unistr('1. NOMBRES Y APELLIDOS O RAZ\00D3N SOCIAL:')
,p_source=>'NMBRES_RZN_SCIAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_colspan=>6
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_item_comment=>unistr('1. NOMBRES Y APELLIDOS O RAZ\00D3N SOCIAL')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7282528279419078)
,p_name=>'P312_TPO_IDENTIFICACION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_api.id(145830246506597696)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>unistr('2. TIPO DE IDENTIFICACI\00D3N')
,p_source=>'CDGO_IDNTFCCION_TPO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_idntfccion_tpo d,',
'cdgo_idntfccion_tpo r',
'from df_s_identificaciones_tipo',
'order by dscrpcion_idntfccion_tpo asc'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>5
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>unistr('2. TIPO DE IDENTIFICACI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7282916963419078)
,p_name=>'P312_IDENTIFICACION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_api.id(145830246506597696)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>unistr('IDENTIFICACI\00D3N ')
,p_source=>'IDNTFCCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>6
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_item_comment=>unistr('IDENTIFICACI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7283376139419078)
,p_name=>'P312_IDENTIFICACION_ANTERIOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_api.id(145830246506597696)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_source=>'IDNTFCCION_ANT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>unistr('IDENTIFICACI\00D3N ANTERIOR')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7283729918419079)
,p_name=>'P312_DIGITO_VERIFICACION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_api.id(145830246506597696)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>'DV'
,p_source=>'DGTO_VRFCCION_DCLRNTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_item_comment=>unistr('D\00CDGITO DE VERIFICACI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7284120428419079)
,p_name=>'P312_DRCCION_NTFCCION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_api.id(145830246506597696)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>unistr('3. DIRECCI\00D3N DE NOTIFICACI\00D3N')
,p_source=>'DRCCION_NTFCCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>30
,p_colspan=>6
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
,p_item_comment=>unistr('3. DIRECCI\00D3N DE NOTIFICACI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7284558448419079)
,p_name=>'P312_DEPARTAMENTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_api.id(145830246506597696)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>'DEPARTAMENTO'
,p_source=>'ID_DPRTMNTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_dprtmnto    as text,',
'        a.id_dprtmnto       as value',
'from    df_s_departamentos  a',
'order by a.nmbre_dprtmnto;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>'DEPARTAMENTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7284929536419079)
,p_name=>'P312_MUNICIPIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_api.id(145830246506597696)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>unistr('MUNICIPIO O DISTRITO DE LA DIRECCI\00D3N')
,p_source=>'ID_MNCPIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_mncpio  as text,',
'        a.id_mncpio     as value',
'from    df_s_municipios a ',
'order by    a.nmbre_mncpio;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>unistr('MUNICIPIO O DISTRITO DE LA DIRECCI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7285384183419080)
,p_name=>'P312_TELEFONO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_api.id(145830246506597696)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>unistr('4. TEL\00C9FONO')
,p_source=>'TLFNO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_tag_attributes=>'onkeypress="return  validarExpresion(event, ''numeroEntero'')" '
,p_colspan=>6
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
,p_item_comment=>unistr('4. TEL\00C9FONO')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7285751421419080)
,p_name=>'P312_CORREO_ELECTRONICO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_api.id(145830246506597696)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>unistr('5. CORREO <br />ELECTR\00D3NICO')
,p_source=>'CRREO_ELCTRNCO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_colspan=>6
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'EMAIL'
,p_attribute_05=>'NONE'
,p_item_comment=>unistr('5. CORREO ELECTR\00D3NICO')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7286187624419080)
,p_name=>'P312_NMRO_ESTBLCMIENTS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_api.id(145830246506597696)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>'6. No. ESTABLECIMIENTOS'
,p_source=>'NMRO_ESTBLCMNTOS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
,p_item_comment=>'6. No. ESTABLECIMIENTOS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7286535727419080)
,p_name=>'P312_AVISOS_TABLEROS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_api.id(145830246506597696)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'S'
,p_prompt=>'AVISOS Y TABLEROS'
,p_source=>'AVSS_TBLRS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:S\00ED;S,No;N')
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>'AVISOS Y TABLEROS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7286932621419081)
,p_name=>'P312_CNSRCIO_UNION_TMPRL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_api.id(145830246506597696)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'N'
,p_prompt=>unistr('ES UN CONSORCIO O UNI\00D3N TEMPORAL')
,p_source=>'CNSRCIO_UNION_TMPRAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:S\00ED;S,No;N')
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>unistr('ES UN CONSORCIO O UNI\00D3N TEMPORAL')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7287339275419081)
,p_name=>'P312_RLZA_ACTDS_PNIO_AUTNMO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_api.id(145830246506597696)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'N'
,p_prompt=>unistr('REALIZA ACTIVIDADES A TRAV\00C9S DE PATRIMONIO AUT\00D3NOMO')
,p_source=>'RLZA_ACTDS_PNIO_AUTNMO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:S\00ED;S,No;N')
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>unistr('REALIZA ACTIVIDADES A TRAV\00C9S DE PATRIMONIO AUT\00D3NOMO')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7287707347419081)
,p_name=>'P312_CNCLCION_ESTBLCMIENTO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_api.id(145830246506597696)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'N'
,p_prompt=>unistr('\00BFESTA DECLARACI\00D3N ES POR CANCELACI\00D3N DEL ESTABLECIMIENTO?')
,p_source=>'CNCLCION_ESTBLCMIENTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:S\00ED;S,No;N')
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>6
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>unistr('\00BFESTA DECLARACI\00D3N ES POR CANCELACI\00D3N DEL ESTABLECIMIENTO?')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7288423516419082)
,p_name=>'P312_TTL_INGRS_ORIOS_EXTRS_PAIS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_api.id(145830309928597697)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'11. TOTAL INGRESOS ORDINARIOS Y EXTRAORDINARIOS DEL PERIODO <br />BASE DE AUTORETENCION'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
,p_source=>'TTL_INGRS_ORIOS_EXTRS_PAIS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_cattributes_element=>'''numeroEntero'');"'
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    //allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'11. TOTAL INGRESOS ORDINARIOS Y EXTRAORDINARIOS DEL PERIODO BASE DE AUTORETENCION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7288802848419082)
,p_name=>'P312_MNS_INGRSS_FUERA_MNCPIO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(145830177633597695)
,p_item_default=>'0'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'12. MENOS  INGRESOS OBTENIDOS FUERA DE ESTE DISTRITO',
''))
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7289282045419082)
,p_name=>'P312_TTL_INGRS_ORIOS_EXTRS_MNCPIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_api.id(145830309928597697)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('10. TOTAL INGRESOS ORDINARIOS Y EXTRAORDINARIOS EN ESTE MUNICIPIO (rengl\00F3n 8 menos 9)')
,p_format_mask=>'FM$999G999G999G999G999G999G990'
,p_source=>'TTL_INGRS_ORIOS_EXTRS_MNCPIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_cMaxlength=>255
,p_cattributes_element=>'''numeroEntero'');"'
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    //allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('10. TOTAL INGRESOS ORDINARIOS Y EXTRAORDINARIOS EN ESTE MUNICIPIO (rengl\00F3n 8 menos 9)')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7289604214419082)
,p_name=>'P312_MNS_INGRSOS_DEV_REB_DES'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_api.id(145830309928597697)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'14. MENOS DEVOLUCIONES, REABAJAS, DESCUENTO'
,p_source=>'MNS_INGRSOS_DVLCION_RBJA_DSNTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'   // allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'14. MENOS DEVOLUCIONES, REABAJAS, DESCUENTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7290098453419083)
,p_name=>'P312_MNS_INGRSOS_EXPRTCIONS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_api.id(145830309928597697)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'15. MENOS INGRESOS POR OTRAS ACTIVIDADES EXCLUIDAS O NO SUJETAS'
,p_source=>'MNS_INGRSOS_EXPRTCIONS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_cMaxlength=>255
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    //allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'15. MENOS INGRESOS POR OTRAS ACTIVIDADES EXCLUIDAS O NO SUJETAS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7290474630419083)
,p_name=>'P312_MNS_INGRSOS_VNTA_ACT_FIJS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_api.id(145830309928597697)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'14. MENOS DEVOLUCIONES Y SUBSIDIOS E IMPUESTOS PERCIBIDOS'
,p_source=>'MNS_INGRSOS_VNTA_ACTVOS_FJOS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'   // allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'13. MENOS INGRESOS POR VENTA DE ACTIVOS FIJOS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7290882252419083)
,p_name=>'P312_MNS_INGRSOS_ACTVDDS_EXCLDS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_api.id(145830309928597697)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'15. MENOS INGRESOS POR ACTIVIDADES EXENTAS Y NO SUJETAS'
,p_source=>'MNS_INGRSOS_ACTVDDES_EXCLDAS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    //allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'14. MENOS INGRESOS POR ACTIVIDADES EXCLUIDAS O NO SUJETAS Y OTROS INGRESOS NO GRAVADOS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7291299539419083)
,p_name=>'P312_MNS_INGRSOS_ACTVDDS_EXENTAS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>600
,p_item_plug_id=>wwv_flow_api.id(145830309928597697)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'16. TOTAL INGRESOS NETOS GRAVABLES BASE DE AUTORETENCION(NO)'
,p_source=>'MNS_INGRSOS_ACTVDDES_EXNTAS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    //allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'16. TOTAL INGRESOS NETOS GRAVABLES BASE DE AUTORETENCION(NO)'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7291650819419084)
,p_name=>'P312_TOTAL_INGRESOS_GRVBLES'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>610
,p_item_plug_id=>wwv_flow_api.id(145830309928597697)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>'16. TOTAL INGRESOS NETOS GRAVABLES BASE DE AUTORETENCION'
,p_source=>'TTAL_INGRESOS_GRVBLES'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    //allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'16. TOTAL INGRESOS NETOS GRAVABLES BASE DE AUTORETENCION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7292007991419084)
,p_name=>'P312_MNS_VLR_EXNCION_SBRE_IMPSTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>620
,p_item_plug_id=>wwv_flow_api.id(145830309928597697)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>'18. MENOS VALOR DE EXENCION SOBRE EL IMPUESTO'
,p_source=>'MNS_VLR_EXNCION_SBRE_IMPSTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'   // allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'18. MENOS VALOR DE EXENCION SOBRE EL IMPUESTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7292411025419084)
,p_name=>'P312_MNS_RTNCNES_PRCTCRON_PRDO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>630
,p_item_plug_id=>wwv_flow_api.id(145830309928597697)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>'19. MENOS RETENCIONES QUE LE PRACTICARON EN EL PERIODO'
,p_source=>'MNS_RTNCNES_PRCTCRON_PRDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'   // allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'19. MENOS RETENCIONES QUE LE PRACTICARON EN EL PERIODO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7292846169419084)
,p_name=>'P312_AUTORRETNCNES_AVSOS_TBLROS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(145830634329597700)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>'20. AUTORRETENCIONES DEL IMPUESTO DE AVISOS Y TABLEROS'
,p_source=>'AUTORRETNCNES_AVSOS_TBLROS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    //allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'20. AUTORRETENCIONES DEL IMPUESTO DE AVISOS Y TABLEROS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7293278146419085)
,p_name=>'P312_AUTO_RRTNCNES_SBRTSA_BMBROS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>650
,p_item_plug_id=>wwv_flow_api.id(145830309928597697)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>'21. AUTORRETENCIONES DE SOBRETASA CUERPO DE BOMBEROS'
,p_source=>'AUTO_RRTNCNES_SBRTSA_BMBROS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'   // allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'21. AUTORRETENCIONES DE SOBRETASA CUERPO DE BOMBEROS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7293625132419085)
,p_name=>'P312_TOTAL_AUTORRETENCIONES'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>660
,p_item_plug_id=>wwv_flow_api.id(145830309928597697)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>'22. TOTAL AUTORRETENCIONES'
,p_source=>'TOTAL_AUTORRETENCIONES'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    //allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'22. TOTAL AUTORRETENCIONES'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7294340115419086)
,p_name=>'P312_TTAL_PGOS_ABNOS_CUENTA_ICA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('TOTAL DE INGRESOS RENGL\00D3N 11')
,p_source=>'TTAL_PGOS_ABNOS_CUENTA_ICA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('TOTAL DE INGRESOS RENGL\00D3N 11')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7294704703419086)
,p_name=>'P312_TTL_IMPSTO_INDSTRIA_CMRCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('TOTAL DE AUTORRETENCIONES RENGL\00D3N 13')
,p_source=>'TTAL_IMPSTO_INDSTRIA_CMRCIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('TOTAL DE AUTORRETENCIONES RENGL\00D3N 13')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7295154743419086)
,p_name=>'P312_CLCLO_CNCPTO_INDSTRIA_CMRCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO CONCEPTO INDUSTRIA COMERCIO')
,p_source=>'CLCLO_CNCPTO_INDSTRIA_CMRCIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_cMaxlength=>255
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'   // minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO CONCEPTO INDUSTRIA COMERCIO')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7295538486419086)
,p_name=>'P312_CONCEPTO_INDUSTRIA_COMERCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'CONCEPTO IMPUESTO INDUSTRIA Y COMERCIO'
,p_source=>'CNCPTO_INDSTRIA_CMRCIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'CONCEPTO IMPUESTO INDUSTRIA Y COMERCIO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7295932396419087)
,p_name=>'P312_SLDO_FVR_CNCPTO_INTRIA_CMRCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'SALDO A FAVOR CONCEPTO IMPUESTO INDUSTRIA Y COMERCIO'
,p_source=>'SLDO_FVOR_CNCPTO_INDSTRI_CMRCI'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'SALDO A FAVOR CONCEPTO IMPUESTO INDUSTRIA Y COMERCIO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7296305046419087)
,p_name=>'P312_CLCLO_CNCPTO_ANT_INTRIA_CRCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO CONCEPTO ANTERIOR IMPUESTO INDUSTRIA Y COMERCIO')
,p_source=>'CLCLO_CNCPTO_ANTRIOR_INDS_CCIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO CONCEPTO ANTERIOR IMPUESTO INDUSTRIA Y COMERCIO')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7296740770419087)
,p_name=>'P312_CLCLO_DFCIA_PGO_INTRIA_CMRCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO DIFERENCIA PAGO IMPUESTO INDUSTRIA Y COMERCIO')
,p_source=>'CLCLO_DFRNCIA_PGO_INDST_CMRCIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    //minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO DIFERENCIA PAGO IMPUESTO INDUSTRIA Y COMERCIO')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7297127812419087)
,p_name=>'P312_VALOR_PAGO_INDUSTRIA_COMERCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'VALOR DE PAGO IMPUESTO INDUSTRIA Y COMERCIO'
,p_source=>'VLOR_PGO_INDSTRIA_CMRCIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'VALOR DE PAGO IMPUESTO INDUSTRIA Y COMERCIO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7297539367419088)
,p_name=>'P312_CALCULO_DSCNTO_INTRIA_CMRCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO DESCUENTO IMPUESTO INDUSTRIA Y COMERCIO ')
,p_source=>'CLCLO_DSCNTO_INDSTRIA_CMRCIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'CALCULO DESCUENTO IMPUESTO INDUSTRIA Y COMERCIO '
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7297996913419088)
,p_name=>'P312_CALCULO_INTRSS_INTRIA_CMRCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'INTERESES IMPUESTO INDUSTRIA Y COMERCIO'
,p_source=>'CLCLO_INTRES_INDSTRIA_CMRCIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO INTERESES IMPUESTO INDUSTRIA Y COMERCIO')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7298328287419088)
,p_name=>'P312_CLCLO_DSCNTO_INT_INTRIA_CRCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'DESCUENTO INTERESES IMPUESTO INDUSTRIA Y COMERCIO'
,p_source=>'CLCLO_DSCNTO_INTRES_IND_CMRCIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO DESCUENTO INTERESES IMPUESTO INDUSTRIA Y COMERCIO')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7298702430419088)
,p_name=>'P312_CLCLO_SLDO_FVR_PGO_INTRIA_CCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO SALDO A FAVOR PAGO IMPUESTO INDUSTRIA Y COMERCIO')
,p_source=>'CLCLO_SLDO_FVOR_PGO_INDS_CMRCI'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    //minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO SALDO A FAVOR PAGO IMPUESTO INDUSTRIA Y COMERCIO')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7299195341419088)
,p_name=>'P312_IMPUESTO_AVISOS_TABLEROS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('20. AUTORETENCIONES DE IMPUESTOS DE AVISOS Y TABLEROS(15% del rengl\00F3n 17)')
,p_source=>'ID_IMPSTO_AVSOS_TBLROS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('20. AUTORETENCIONES DE IMPUESTOS DE AVISOS Y TABLEROS(15% del rengl\00F3n 17)')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7299545729419089)
,p_name=>'P312_SALDO_FAVOR_AVISOS_TABLEROS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'SALDO A FAVOR CONCEPTO AVISOS Y TABLEROS'
,p_source=>'SLDO_FVOR_AVSOS_TBLROS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'SALDO A FAVOR CONCEPTO AVISOS Y TABLEROS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7299929161419089)
,p_name=>'P312_CONCEPTO_AVISOS_TABLEROS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'CONCEPTO AVISOS Y TABLEROS'
,p_source=>'CNCPTO_AVSOS_TBLROS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'CONCEPTO AVISOS Y TABLEROS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7300317106419089)
,p_name=>'P312_DIFERENCIA_AVISOS_TABLEROS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'DIFERENCIA CONCEPTO AVISOS Y TABLEROS'
,p_source=>'CLCLO_DFRNCIA_AVSOS_TBLROS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    //emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'   // minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'DIFERENCIA CONCEPTO AVISOS Y TABLEROS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7300731640419090)
,p_name=>'P312_CLCLO_ANTERIOR_AVISOS_TBLRS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO ANTERIOR CONCEPTO IMPUESTO DE AVISOS Y TABLEROS')
,p_source=>'CLCLO_ANTRIOR_AVSOS_TBLRS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO ANTERIOR CONCEPTO IMPUESTO DE AVISOS Y TABLEROS')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7301109011419090)
,p_name=>'P312_CLCLO_DFCIA_PGO_AVSS_TBLRS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO DIFERENCIA PAGO IMPUESTO DE AVISOS Y TABLEROS')
,p_source=>'CLCLO_DFRNCIA_PGO_AVSOS_TBLROS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    //minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO DIFERENCIA PAGO IMPUESTO DE AVISOS Y TABLEROS')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7301514543419090)
,p_name=>'P312_VLR_PAGO_AVISOS_TABLEROS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'VALOR PAGO IMPUESTO DE AVISOS Y TABLEROS'
,p_source=>'VLR_PGO_AVSOS_TBLROS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'VALOR PAGO IMPUESTO DE AVISOS Y TABLEROS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7301941967419090)
,p_name=>'P312_CLCLO_DSCNTO_AVSS_TBLRS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO DESCUENTO IMPUESTO DE AVISOS Y TABLEROS')
,p_source=>'CLCLO_DSCNTO_AVSOS_TBLROS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO DESCUENTO IMPUESTO DE AVISOS Y TABLEROS')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7302348462419090)
,p_name=>'P312_CLCLO_INTRSS_AVSS_TBLRS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'INTERESES IMPUESTO DE AVISOS Y TABLEROS'
,p_source=>'CLCLO_INTRES_AVSOS_TBLROS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO INTERESES IMPUESTO DE AVISOS Y TABLEROS')
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7302722658419091)
,p_name=>'P312_CLCLO_DSCNTO_INT_AVSS_TBS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'DESCUENTO INTERESES IMPUESTO DE AVISOS Y TABLERO'
,p_source=>'CLCLO_DSCNTO_INTRES_AVSOS_TBLR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO DESCUENTO INTERESES IMPUESTO DE AVISOS Y TABLEROS')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7303108226419091)
,p_name=>'P312_CLCLO_SLDO_FVR_PGO_AVSS_TBS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO SALDO A FAVOR PAGO IMPUESTO DE AVISOS Y TABLEROS')
,p_source=>'CLCLO_SLDO_FVOR_PGO_AVSOS_TBLR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO SALDO A FAVOR PAGO IMPUESTO DE AVISOS Y TABLEROS')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7303585666419091)
,p_name=>'P312_PGO_UNDDS_CMRCLS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'22. PAGO POR UNIDADES COMERCIALES ADICIONALES DEL SECTOR FINANCIERO'
,p_source=>'PGO_UNDDS_CMRCLES'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'22. PAGO POR UNIDADES COMERCIALES ADICIONALES DEL SECTOR FINANCIERO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7303926030419091)
,p_name=>'P312_SOBRETASA_BOMBERIL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('21. AUTORRETENCIONES DE SOBRETASA CUERPO DE BOMBEROS (7% del rengl\00F3n 17)')
,p_source=>'ID_SBRTSA_BMBRIL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('21. AUTORRETENCIONES DE SOBRETASA CUERPO DE BOMBEROS (7% del rengl\00F3n 17)')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7304323859419092)
,p_name=>'P312_SLDO_FVR_CNPTO_SBTSA_BMRL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'SALDO A FAVOR CONCEPTO SOBRETASA BOMBERIL'
,p_source=>'SLDO_FVOR_CNPTO_SBRTSA_BMBRIL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'SALDO A FAVOR CONCEPTO SOBRETASA BOMBERIL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7304739907419092)
,p_name=>'P312_DFRNCIA_CNCPTO_SBTSA_BMRL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'DIFERENCIA CONCEPTO SOBRETASA BOMBERIL'
,p_source=>'DFRNCIA_CNCPTO_SBRTSA_BMBRIL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    //emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    //minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'DIFERENCIA CONCEPTO SOBRETASA BOMBERIL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7305127230419092)
,p_name=>'P312_CNCPTO_SBRTSA_BMBRL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'CONCEPTO SOBRETASA BOMBERIL'
,p_source=>'CNCPTO_SBRTSA_BMBRIL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'CONCEPTO SOBRETASA BOMBERIL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7305509469419092)
,p_name=>'P312_CLCLO_CNCPTO_ANT_STSA_BMRL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'CALCULO CONCEPTO ANTERIOR SOBRETASA BOMBERIL'
,p_source=>'CLCLO_CNCPTO_ANTRIOR_SBR_BMBRL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'CALCULO CONCEPTO ANTERIOR SOBRETASA BOMBERIL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7305936633419093)
,p_name=>'P312_CLCLO_DIF_PGO_STSA_BMRL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO DIFERENCIA PAGO SOBRETASA BOMBERIL')
,p_source=>'CLCLO_DFRNCIA_PGO_SBRTS_BMBRIL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'   // minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO DIFERENCIA PAGO SOBRETASA BOMBERIL')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7306385224419093)
,p_name=>'P312_CLCLO_VLR_PGO_STSA_BMRL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO VALOR PAGO IMPUESTO SOBRETASA BOMBERIL')
,p_source=>'CLCLO_VLR_PGO_SBRTSA_BMBRIL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO VALOR PAGO IMPUESTO SOBRETASA BOMBERIL')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7306724573419094)
,p_name=>'P312_CLCLO_DSCNTO_STSA_BMRL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('23. C\00C1LCULO DESCUENTO SOBRETASA BOMBERIL')
,p_source=>'CLCLO_DSCNTO_SBRTSA_BMBRIL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('23. C\00C1LCULO DESCUENTO SOBRETASA BOMBERIL')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7307105625419094)
,p_name=>'P312_CLCLO_INTRSES_STSA_BMRL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'INTERESES SOBRETASA BOMBERIL'
,p_source=>'CLCLO_INTRSES_SBRTSA_BMBRIL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('23. C\00C1LCULO INTERESES SOBRETASA BOMBERIL')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7307502594419095)
,p_name=>'P312_CLCLO_DSCNTO_INT_STSA_BMRL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'DESCUENTO INTERESES SOBRETASA BOMBERIL'
,p_source=>'CLCLO_DSCNTO_INTRES_SBR_BMBRIL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('23. C\00C1LCULO DESCUENTO INTERESES SOBRETASA BOMBERIL')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7307986765419095)
,p_name=>'P312_CLCLO_SLDO_FVR_PGO_STSA_BMRL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO SALDO A FAVOR PAGO SOBRETASA BOMBERIL')
,p_source=>'CLCLO_SLDO_FVR_PGO_SBRT_BMBRIL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO SALDO A FAVOR PAGO SOBRETASA BOMBERIL')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7308305826419095)
,p_name=>'P312_SOBRETASA_SEGURIDAD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('24. SOBRETASA DE SEGURIDAD (LEY 1421 de 2011) (Si la hay, liqu\00EDdela seg\00FAn el acuerdo municipal o distrital)')
,p_source=>'ID_SBRTSA_SGRDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('24. SOBRETASA DE SEGURIDAD (LEY 1421 de 2011) (Si la hay, liqu\00EDdela seg\00FAn el acuerdo municipal o distrital)')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7308709849419096)
,p_name=>'P312_CNCPTO_SBRTSA_SGRDD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'CONCEPTO SOBRETASA DE SEGURIDAD'
,p_source=>'CNCPTO_SBRTSA_SGRDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'CONCEPTO SOBRETASA DE SEGURIDAD'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7309100253419096)
,p_name=>'P312_DFRNCIA_CNCPTO_STSA_SGRD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'DIFERENCIA CONCEPTO SOBRETASA DE SEGURIDAD'
,p_source=>'CLCLO_DFRNCIA_CNCPTO_SB_SGRDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    //emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    //minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'DIFERENCIA CONCEPTO SOBRETASA DE SEGURIDAD'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7309598128419096)
,p_name=>'P312_SLDO_FVR_CNCPTO_STSA_SGRD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'SALDO A FAVOR CONCEPTO SOBRETASA DE SEGURIDAD'
,p_source=>'SLDO_FVR_CNCPTO_SBRTSA_SGRDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'SALDO A FAVOR CONCEPTO SOBRETASA DE SEGURIDAD'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7309920338419096)
,p_name=>'P312_CLCLO_CNCPTO_ANT_STSA_SGRD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO CONCEPTO ANTERIOR SOBRETASA DE SEGURIDAD')
,p_source=>'CLCLO_CNCPTO_ANTRIOR_SB_SGRDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO CONCEPTO ANTERIOR SOBRETASA DE SEGURIDAD')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7310303768419097)
,p_name=>'P312_CLCLO_DIF_PGO_STSA_SGRD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO DIFERENCIA PAGO SOBRETASA DE SEGURIDAD')
,p_source=>'CLCLO_DFRNCIA_PGO_SBRTS_SGRDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    //minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO DIFERENCIA PAGO SOBRETASA DE SEGURIDAD')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7310793218419097)
,p_name=>'P312_CALCULO_PGO_STSA_SGRD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO PAGO SOBRETASA DE SEGURIDAD')
,p_source=>'CLCLO_PGO_SBRTSA_SGRDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO PAGO SOBRETASA DE SEGURIDAD')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7311148038419097)
,p_name=>'P312_CLCLO_DSCNTO_STSA_SGRD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO DESCUENTO SOBRETASA DE SEGURIDAD')
,p_source=>'CLCLO_DSCNTO_SBRTSA_SGRDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO DESCUENTO SOBRETASA DE SEGURIDAD')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7311512426419098)
,p_name=>'P312_CLCLO_INTRSES_STSA_SGRD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO INTERESES SOBRETASA DE SEGURIDAD')
,p_source=>'CLCLO_INTRES_SBRTSA_SGRDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO INTERESES SOBRETASA DE SEGURIDAD')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7311907693419098)
,p_name=>'P312_CLCLO_DSCNTO_INT_STSA_SGRD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO DESCUENTO INTERESES  SOBRETASA DE SEGURIDAD')
,p_source=>'CLCLO_DSCNTO_INTRES_SBR_SGRDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('C\00C1LCULO DESCUENTO INTERESES SOBRETASA DE SEGURIDAD'),
''))
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7312362455419098)
,p_name=>'P312_CLCLO_SLDO_FVR_PGO_STSA_SGRD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO SALDO A FAVOR PAGO SOBRETASA DE SEGURIDAD')
,p_source=>'CLCLO_SLDO_FVR_PGO_SBRT_SGRDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO SALDO A FAVOR PAGO SOBRETASA DE SEGURIDAD')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7312709262419098)
,p_name=>'P312_TOTAL_IMPUESTO_CARGO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'22. TOTAL AUTORRETENCIONES (renglones 17-18-19+20+21)'
,p_source=>'TTL_IMPSTO_CRGO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'22. TOTAL AUTORRETENCIONES (renglones 17-18-19+20+21)'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7313121835419099)
,p_name=>'P312_MENS_VLR_EXNCN_EXNRCN_IMPSTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('TOTAL DE INGRESOS RENGL\00D3N 10')
,p_source=>'MENS_VLR_EXNCION_EXNRCI_IMPSTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('TOTAL DE INGRESOS RENGL\00D3N 10')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7313551697419099)
,p_name=>'P312_MENOS_RETENCIONES'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'MENOS RETENCIONES QUE LE PRACTICARON EN EL PERIODO'
,p_source=>'MNS_RTNCNES'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'MENOS RETENCIONES QUE LE PRACTICARON EN EL PERIODO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7313959178419099)
,p_name=>'P312_MENOS_AUTORRETENCIONES'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>810
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('VALOR DE AUTORRETENCIONES CON REDUCCI\00D3N DE TARIFA')
,p_source=>'MNS_AUTRRTNCNES'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('VALOR DE AUTORRETENCIONES CON REDUCCI\00D3N DE TARIFA')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7314356180419099)
,p_name=>'P312_MENS_ANTCPO_LIQDDO_ANIO_ANTR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(145830634329597700)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'13.VALOR PAGO DE RETENCIONES'
,p_source=>'MNS_ANTCPO_LIQDDO_ANIO_ANTRIOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'13.VALOR PAGO DE RETENCIONES'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7314750045419100)
,p_name=>'P312_ANTICIPO_ANIO_SIGUIENTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('30. ANTICIPO DEL A\00D1O SIGUIENTE (40% seg\00FAn Acuerdo Municipal)')
,p_source=>'ANTCPO_ANIO_SGNTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('30. ANTICIPO DEL A\00D1O SIGUIENTE (40% seg\00FAn Acuerdo Municipal)')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7315138310419100)
,p_name=>'P312_SLDO_FVR_CNCPTO_ANTCPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'SALDO A FAVOR CONCEPTO ANTICIPO'
,p_source=>'SLDO_FVR_CNCPTO_ANTCPO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_cMaxlength=>255
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    //minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'SALDO A FAVOR CONCEPTO ANTICIPO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7315535795419100)
,p_name=>'P312_DFRNCIA_CNCPTO_ANTCPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'DIFERENCIA CONCEPTO ANTICIPO'
,p_source=>'DFRNCIA_CNCPTO_ANTCPO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_cMaxlength=>255
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'   // minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'DIFERENCIA CONCEPTO ANTICIPO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7315909664419101)
,p_name=>'P312_VALOR_CONCEPTO_ANTICIPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'VALOR CONCEPTO ANTICIPO'
,p_source=>'VLR_CNCPTO_ANTCPO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'VALOR CONCEPTO ANTICIPO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7316331243419101)
,p_name=>'P312_CALCULO_INTERES_ANTICIPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>620
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO  INTERES ANTICIPO')
,p_source=>'CLCLO_INTRS_ANTCPO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO  INTERES ANTICIPO')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7316743852419101)
,p_name=>'P312_TIPO_SANCION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>650
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'EXT'
,p_prompt=>unistr('TIPO SANCI\00D3N')
,p_source=>'TPO_SNCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion         text,',
'        a.cdgo_sncion_tpo   value',
'from    gi_d_sanciones_tipo a',
'where   1 = case --when :RGN67ATR292FLAX is null and a.cdgo_sncion_tpo is not null then 1',
'                 when :P312_OPCION_DE_USO = ''DCO'' and a.cdgo_sncion_tpo <> ''EXT'' then 1',
'                 when :P312_OPCION_DE_USO = ''DIN'' and a.cdgo_sncion_tpo <> ''COR'' then 1',
'                else 0',
'            end',
'and a.cdgo_sncion_tpo IN (''EXT'',''COR'')',
'order by a.dscrpcion'))
,p_lov_cascade_parent_items=>'P312_OPCION_DE_USO'
,p_ajax_items_to_submit=>'P312_TIPO_SANCION,P312_TIPO_CALCULO_SANCION'
,p_ajax_optimize_refresh=>'N'
,p_cHeight=>1
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>unistr('TIPO SANCI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7317107037419101)
,p_name=>'P312_TIPO_CALCULO_SANCION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>660
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'S'
,p_prompt=>unistr('TIPO C\00C1LCULO SANCI\00D3N')
,p_source=>'TPO_CLCLO_SNCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.text,',
'        a.value',
'from    json_table((select  json_array(json_object(key ''text'' is ''MANUAL'', key ''value'' is ''M'', key ''tipo'' is ''INX''),',
'                                       json_object(key ''text'' is ''MANUAL'', key ''value'' is ''M'', key ''tipo'' is ''OTRA''),',
'                                       json_object(key ''text'' is ''MANUAL'', key ''value'' is ''M'', key ''tipo'' is ''COR''),',
'                                       json_object(key ''text'' is ''MANUAL'', key ''value'' is ''M'', key ''tipo'' is ''EXT''),',
'                                       json_object(key ''text'' is ''SUGERIDA'', key ''value'' is ''S'', key ''tipo'' is ''EXT''),',
'                                       json_object(key ''text'' is ''SUGERIDA'', key ''value'' is ''S'', key ''tipo'' is ''COR'')',
'                                      )',
'                    from    dual), ''$[*]'' columns (text varchar2(10) path ''$.text'',',
'                                                   value varchar2(10) path ''$.value'',',
'                                                   tipo varchar(10) path ''$.tipo'')) a',
'',
'where   a.tipo              = :P312_TIPO_SANCION',
'--and     value = ''S''',
'and     :P312_TIPO_SANCION  is not null'))
,p_lov_cascade_parent_items=>'P312_TIPO_SANCION'
,p_ajax_items_to_submit=>'P312_TIPO_CALCULO_SANCION'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>unistr('TIPO C\00C1LCULO SANCI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7317565524419102)
,p_name=>'P312_SANCION_MANUAL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>670
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'23. MAS SANCIONES'
,p_source=>'SNCION_MNUAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'23. MAS SANCIONES'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7317937660419102)
,p_name=>'P312_SANCION_SUGERIDA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>680
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'23. MAS SANCIONES (SUGERIDA)'
,p_source=>'SNCION_SGRDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'23. MAS SANCIONES (SUGERIDA)'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7318396083419102)
,p_name=>'P312_CLCLO_IMPSTO_CRGO_SNCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>690
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO IMPUESTO A CARGO SANCI\00D3N')
,p_source=>'CLCLO_IMPSTO_CRGO_SNCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_cMaxlength=>255
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO IMPUESTO A CARGO SANCI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7318713929419102)
,p_name=>'P312_CLCLO_NETO_SANCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>700
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO NETO SANCI\00D3N')
,p_source=>'CLCLO_NTO_SNCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO NETO SANCI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7319186437419103)
,p_name=>'P312_SANCION_SELECCIONADA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>710
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'concepto SANCION'
,p_source=>'SNCION_SLCCNDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_cMaxlength=>5
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'   // minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'concepto SANCION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7319554127419103)
,p_name=>'P312_DIFERENCIA_CNCPTO_SNCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>720
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('DIFERENCIA CONCEPTO SANCI\00D3N')
,p_source=>'DFRNCIA_CNCPTO_SNCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    //emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'   // minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('DIFERENCIA CONCEPTO SANCI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7319958521419103)
,p_name=>'P312_CALCULO_DFRNCIA_PGO_SNCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>730
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO DIFERENCIA PAGO SANCI\00D3N')
,p_source=>'CLCLO_DFRNCIA_PGO_SNCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'   // minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO DIFERENCIA PAGO SANCI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7320308344419103)
,p_name=>'P312_VALOR_CONCEPTO_SANCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>740
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('Calculo pago IMPUESTO SANCI\00D3N')
,p_source=>'VLR_CNCPTO_SNCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    //minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('Calculo pago IMPUESTO SANCI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7320777477419104)
,p_name=>'P312_CLCLO_DESCUENTO_SANCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>750
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO DESCUENTO SANCI\00D3N')
,p_source=>'CLCLO_DSCNTO_SNCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO DESCUENTO SANCI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7321172512419104)
,p_name=>'P312_CLCLO_SLDO_FVR_PGO_SNCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>760
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO SALDO A FAVOR PAGO SANCI\00D3N')
,p_source=>'CLCLO_SLDO_FVR_PGO_SNCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_cMaxlength=>255
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO SALDO A FAVOR PAGO SANCI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7321594487419104)
,p_name=>'P312_MENOS_SLDO_FVR_PRDO_ANTRIOR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>770
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('32. MENOS SALDO A FAVOR DEL PERIODO ANTERIOR SIN SOLICITUD DE DEVOLUCI\00D3N O COMPENSACI\00D3N')
,p_source=>'MNS_SLDO_FVR_PRDO_ANTRIOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('32. MENOS SALDO A FAVOR DEL PERIODO ANTERIOR SIN SOLICITUD DE DEVOLUCI\00D3N O COMPENSACI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7321935708419104)
,p_name=>'P312_CALCULO_TOTAL_SALDO_CARGO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>780
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('24.CALCULO TOTAL SALDO A CARGO (rengl\00F3n 22+23)')
,p_source=>'CLCLO_TTL_SLDO_CRGO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'   // minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('24.CALCULO TOTAL SALDO A CARGO (rengl\00F3n 22+23)')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7322322488419105)
,p_name=>'P312_TOTAL_SALDO_CARGO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>790
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'10.TOTAL A PAGAR'
,p_source=>'TTL_SLDO_CRGO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'10.TOTAL A PAGAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7322761968419105)
,p_name=>'P312_TOTAL_SALDO_FAVOR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>800
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('34. TOTAL SALDO A FAVOR (RENGL\00D3N 25-26-27-28-29+30+31-32) SI EL RESULTADO ES MENOR A CERO')
,p_source=>'TTL_SLDO_FVOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('34. TOTAL SALDO A FAVOR (RENGL\00D3N 25-26-27-28-29+30+31-32) SI EL RESULTADO ES MENOR A CERO')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7323173301419105)
,p_name=>'P312_ITEM_CERO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>820
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'ITEM CERO'
,p_source=>'ITEM_CERO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'   // allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}',
''))
,p_item_comment=>'ITEM CERO'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7323849349419106)
,p_name=>'P312_VALOR_PAGAR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(145830634329597700)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'27. VALOR A PAGAR POR IMPUESTO'
,p_source=>'VLR_PGR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    //minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'27. VALOR A PAGAR POR IMPUESTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7324213871419106)
,p_name=>'P312_DESCUENTO_PRONTO_PAGO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(145830634329597700)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'VALOR PAGADO EN LA DECLARACION ANTERIOR'
,p_source=>'DSCNTO_PRNTO_PGO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'VALOR PAGADO EN LA DECLARACION ANTERIOR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7324694268419106)
,p_name=>'P312_DESTINO_APORTE_VOLUNTARIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(145830634329597700)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'11.VALOR PAGOS SANCIONES'
,p_source=>'DSTNO_APRTE_VLNTRIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    //minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'11.VALOR PAGOS SANCIONES'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7325051347419107)
,p_name=>'P312_INTERESES_MORA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(145830634329597700)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'15.VALOR PAGO INTERESES DE MORA (CON DESCUENTO SI APLICA)'
,p_source=>'INTRSES_MRA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'15.VALOR PAGO INTERESES DE MORA (CON DESCUENTO SI APLICA)'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7325425151419107)
,p_name=>'P312_TOTAL_PAGAR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(145830634329597700)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'PAGO TOTAL'
,p_source=>'TTL_PGAR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    //allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'   // minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'PAGO TOTAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7325890730419107)
,p_name=>'P312_APORTE_VOLUNTARIO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(145830634329597700)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'N'
,p_prompt=>'DESEO HACER APORTE VOLUNTARIO'
,p_source=>'APRTE_VLNTRIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:S\00ED;S,No;N')
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>'DESEO HACER APORTE VOLUNTARIO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7326226503419107)
,p_name=>'P312_VALOR_PAGO_VOLUNTARIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(145830634329597700)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('39. LIQUIDE EL VALOR DEL PAGO VOLUNTARIO (Seg\00FAn instrucciones del municipio/distrito)')
,p_source=>'VLR_PGO_VLNTRIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('39. LIQUIDE EL VALOR DEL PAGO VOLUNTARIO (Seg\00FAn instrucciones del municipio/distrito)')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7326670901419107)
,p_name=>'P312_TOTAL_PAGAR_PAGO_VOLUNTARIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(145830634329597700)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('40. TOTAL A PAGAR CON PAGO VOLUNTARIO (Rengl\00F3n 38 + 39)')
,p_source=>'TTL_PGAR_PGO_VLNTRIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    //minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('40. TOTAL A PAGAR CON PAGO VOLUNTARIO (Rengl\00F3n 38 + 39)')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7327052499419108)
,p_name=>'P312_VALOR_PAGAR_BANCOS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(145830634329597700)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>'VALOR A PAGAR EN BANCOS'
,p_source=>'VLR_PGAR_BNCOS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'VALOR A PAGAR EN BANCOS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7327481344419108)
,p_name=>'P312_CALCULO_VALOR_PAGAR_BANCOS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(145830634329597700)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO  A PAGAR BANCOS')
,p_source=>'CLCLO_VLR_PGAR_BNCOS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO  A PAGAR BANCOS')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7329305569419109)
,p_name=>'P312_ACTIVIDAD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(22229398677667635)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_DCLRCNS_ESQMA_TRFA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ACTIVIDADES GRAVADAS '
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7329789874419109)
,p_name=>'P312_ACTIVIDAD_DESCRIPCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(22229398677667635)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7330134683419110)
,p_name=>'P312_TARIFA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(22229398677667635)
,p_use_cache_before_default=>'NO'
,p_source=>'TRFA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'TARIFA'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7330514849419110)
,p_name=>'P312_INGRSS_ORDNRIOS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(22229398677667635)
,p_use_cache_before_default=>'NO'
,p_item_default=>'0'
,p_source=>'VLOR_IGRSOS_GRVDOS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'9. INGRESOS ORDINARIOS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7330982473419110)
,p_name=>'P312_VLOR_IPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(22229398677667635)
,p_use_cache_before_default=>'NO'
,p_source=>'VLOR_IPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'IMPUESTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7331397058419110)
,p_name=>'P312_SEQ_ID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(22229398677667635)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8871940123946813)
,p_name=>'P312_CLCLO_CNCPTO_ANT_ANTICIPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('30. C\00C1LCULO CONCEPTO ANTERIOR ANTICIPO')
,p_source=>'CLCLO_CNCPTO_ANTRIOR_ANTCPO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'VALOR CONCEPTO ANTICIPO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8872001785946814)
,p_name=>'P312_CALCULO_PGO_ANTICIPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>600
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('30. C\00C1LCULO PAGO CONCEPTO ANTICIPO')
,p_source=>'CLCLO_PGO_CNCPTO_ANTCPO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'VALOR CONCEPTO ANTICIPO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8872180750946815)
,p_name=>'P312_CLCLO_DIF_PGO_ANTICIPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>610
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('30. C\00C1LCULO DIFERENCIA PAGO ANTICIPO')
,p_source=>'CLCLO_DFRNCIA_PGO_CNCPTO_ANTCPO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'   // minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'VALOR CONCEPTO ANTICIPO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8874508263946839)
,p_name=>'P312_INGRSS_ACTVDAD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(22229398677667635)
,p_use_cache_before_default=>'NO'
,p_item_default=>'0'
,p_source=>'INGRSS_ACTVDAD'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'10. INGRESOS ACTIVIDAD'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8874641912946840)
,p_name=>'P312_INGRSS_GRVBLE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(22229398677667635)
,p_use_cache_before_default=>'NO'
,p_item_default=>'0'
,p_source=>'INGRSS_GRVBLE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'11. INGRSOS GRAVABLE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8875485166946848)
,p_name=>'P312_DESCUENTO_TARIFA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(145830177633597695)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_prompt=>'DESCUENTO EN TARIFA'
,p_source=>'MNS_INGRSS_FUERA_MNCPIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
,p_item_comment=>'DESCUENTO EN TARIFA'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8938440927259933)
,p_name=>'P312_CLCLO_DSCNTO_INT_ANTICIPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>630
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('30. C\00C1LCULO DESCUENTO INTERESES CONCEPTO ANTICIPO')
,p_source=>'CLCLO_DSCNTO_INTRES_CNCPTO_ANTCPO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'   // allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}',
''))
,p_item_comment=>unistr('30. C\00C1LCULO DESCUENTO INTERESES CONCEPTO ANTICIPO')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8938765842254596)
,p_name=>'P312_CLCLO_SLDO_FVR_PGO_ANTICIPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>640
,p_item_plug_id=>wwv_flow_api.id(145830589428597699)
,p_item_source_plug_id=>wwv_flow_api.id(145720429892590562)
,p_item_default=>'0'
,p_prompt=>unistr('30. C\00C1LCULO SALDO A FAVOR PAGO ANTICIPO')
,p_source=>'CLCLO_SLDO_FVR_PGO_SNCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'   // allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    currencySymbol: "$",',
'    currencySymbolPlacement: "p",',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0, ',
'    digitGroupSeparator: ".",',
'',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
'',
'    emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}',
''))
,p_item_comment=>unistr('30. C\00C1LCULO SALDO A FAVOR PAGO ANTICIPO')
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(7380641873419142)
,p_computation_sequence=>10
,p_computation_item=>'P312_CLCLA_FCHA_PRSNTCION_FINAL'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char( pkg_gi_declaraciones_funciones.fnc_co_fcha_mxma_prsntcion( p_id_dclrcion_vgncia_frmlrio =>  :P312_ID_DCLRCION_VGNCIA_FRMLRIO,',
'                                                                          p_idntfccion => :P312_IDNTFCCION , ',
'                                                                          p_id_sjto_tpo => :P312_ID_SJTO_IMPSTO ),',
'                                                                          ''dd/mm/yyyy'' ) as fecha from dual',
'                                                                                                                                               '))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(7381043659419142)
,p_computation_sequence=>20
,p_computation_item=>'P312_ID_PAGE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7384211532419144)
,p_validation_name=>'P312_FCHA_RGSTRO must be timestamp'
,p_validation_sequence=>130
,p_validation=>'P312_FCHA_RGSTRO'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>unistr('#LABEL# no es una fecha val\00EDda.')
,p_associated_item=>wwv_flow_api.id(7257412818419060)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7384655128419144)
,p_validation_name=>'P312_FCHA_ULTMA_MDFCCION must be timestamp'
,p_validation_sequence=>150
,p_validation=>'P312_FCHA_ULTMA_MDFCCION'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>unistr('#LABEL# no es una fecha val\00EDda.')
,p_associated_item=>wwv_flow_api.id(7258261507419061)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7385013870419144)
,p_validation_name=>'P312_FCHA_PRSNTCION must be timestamp'
,p_validation_sequence=>160
,p_validation=>'P312_FCHA_PRSNTCION'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>unistr('#LABEL# no es una fecha val\00EDda.')
,p_associated_item=>wwv_flow_api.id(7258660021419061)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7385432772419144)
,p_validation_name=>'P312_FCHA_APLCCION must be timestamp'
,p_validation_sequence=>180
,p_validation=>'P312_FCHA_APLCCION'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>unistr('#LABEL# no es una fecha val\00EDda.')
,p_associated_item=>wwv_flow_api.id(7259453702419061)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7385861935419144)
,p_validation_name=>'P312_FCHA_ANLCION must be timestamp'
,p_validation_sequence=>250
,p_validation=>'P312_FCHA_ANLCION'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>unistr('#LABEL# no es una fecha val\00EDda.')
,p_associated_item=>wwv_flow_api.id(7262269863419063)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7386245059419144)
,p_validation_name=>'P312_FCHA_PRSNTCION_PRYCTDA must be timestamp'
,p_validation_sequence=>260
,p_validation=>'P312_FCHA_PRSNTCION_PRYCTDA'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>unistr('#LABEL# no es una fecha val\00EDda.')
,p_associated_item=>wwv_flow_api.id(7262616760419063)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7382633121419143)
,p_validation_name=>'Validar que P312_FCHA_MAXIMA_PRSNTCION no este vacio'
,p_validation_sequence=>340
,p_validation=>'P312_FCHA_MAXIMA_PRSNTCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo FECHA M\00C1XIMA PRESENTACI\00D3N esta vac\00EDo ')
,p_when_button_pressed=>wwv_flow_api.id(8885409938100729)
,p_associated_item=>wwv_flow_api.id(7279867370419076)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7381892388419142)
,p_validation_name=>'Validar que P312_CLASIFICACION no este vacio'
,p_validation_sequence=>350
,p_validation=>'P312_CLASIFICACION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo CLASIFICACI\00D3N esta vac\00EDo ')
,p_when_button_pressed=>wwv_flow_api.id(8885409938100729)
,p_associated_item=>wwv_flow_api.id(7279063371419076)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7382298075419143)
,p_validation_name=>unistr('Validar que P312_OPCION_DE_USO no este vac\00EDo')
,p_validation_sequence=>360
,p_validation=>'P312_OPCION_DE_USO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo TIPO DE USO esta vac\00EDo ')
,p_when_button_pressed=>wwv_flow_api.id(8885409938100729)
,p_associated_item=>wwv_flow_api.id(7279446529419076)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7383824578419143)
,p_validation_name=>'Validar que no este vacio'
,p_validation_sequence=>370
,p_validation=>'P312_TOTAL_INGRESOS_GRAVADS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'El campo TOTAL INGRESOS GRAVADOS esta vacio '
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(8885409938100729)
,p_associated_item=>wwv_flow_api.id(7275993103419074)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7381410356419142)
,p_validation_name=>'Validar que P312_NOMBRES_DECLARANTE no este vacio'
,p_validation_sequence=>380
,p_validation=>'P312_NOMBRES_DECLARANTE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'El campo NOMBRES Y APELLIDOS DEL DECLARANTE esta vacio '
,p_when_button_pressed=>wwv_flow_api.id(8885409938100729)
,p_associated_item=>wwv_flow_api.id(7269177229419067)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7383493195419143)
,p_validation_name=>'validar estructura email'
,p_validation_sequence=>390
,p_validation=>'P312_CORREO_ELECTRONICO'
,p_validation2=>'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>unistr('Ingrese un correo v\00E1lido ')
,p_when_button_pressed=>wwv_flow_api.id(8885409938100729)
,p_associated_item=>wwv_flow_api.id(7285751421419080)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7383054116419143)
,p_validation_name=>unistr('validar P312_CORREO_ELECTRONICO no este vac\00EDo')
,p_validation_sequence=>400
,p_validation=>'P312_CORREO_ELECTRONICO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo CORREO esta vac\00EDo ')
,p_when_button_pressed=>wwv_flow_api.id(8885409938100729)
,p_associated_item=>wwv_flow_api.id(7285751421419080)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6905190541135719)
,p_validation_name=>unistr('Validar que el campo P312_AVISOS_TABLEROS no este vac\00EDo')
,p_validation_sequence=>410
,p_validation=>'P312_AVISOS_TABLEROS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo  \00BFAVISOS Y TABLEROS? est\00E1 vac\00EDo.')
,p_associated_item=>wwv_flow_api.id(7286535727419080)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7392944096419149)
,p_name=>'Al perder el foco redondear valor item 11'
,p_event_sequence=>1
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_MNS_INGRSOS_DEV_REB_DES'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7393497170419150)
,p_event_id=>wwv_flow_api.id(7392944096419149)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'redondeoMilMasCercano(''P''+pageId+''_MNS_INGRSOS_DEV_REB_DES'');',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7393868657419150)
,p_name=>'Al perder el foco redondear valor item 12'
,p_event_sequence=>1
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_MNS_INGRSOS_EXPRTCIONS'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7394340974419150)
,p_event_id=>wwv_flow_api.id(7393868657419150)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'redondeoMilMasCercano(''P''+pageId+''_MNS_INGRSOS_EXPRTCIONS'');',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7394731700419150)
,p_name=>'Al perder el foco redondear valor item 13'
,p_event_sequence=>1
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_MNS_INGRSOS_VNTA_ACT_FIJS'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7395286237419150)
,p_event_id=>wwv_flow_api.id(7394731700419150)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'redondeoMilMasCercano(''P''+pageId+''_MNS_INGRSOS_VNTA_ACT_FIJS'');',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7395687673419151)
,p_name=>'Al perder el foco redondear valor item 14'
,p_event_sequence=>1
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_MNS_INGRSOS_ACTVDDS_EXCLDS'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7396108163419151)
,p_event_id=>wwv_flow_api.id(7395687673419151)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'redondeoMilMasCercano(''P''+pageId+''_MNS_INGRSOS_ACTVDDS_EXCLDS'');',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7396536117419151)
,p_name=>'Al perder el foco redondear valor item 15'
,p_event_sequence=>1
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_MNS_INGRSOS_ACTVDDS_EXENTAS'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7397010702419151)
,p_event_id=>wwv_flow_api.id(7396536117419151)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'redondeoMilMasCercano(''P''+pageId+''_MNS_INGRSOS_ACTVDDS_EXENTAS'');',
''))
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7397417906419152)
,p_name=>'Al perder el foco redondear valor item 22'
,p_event_sequence=>1
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_PGO_UNDDS_CMRCLS'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7397903961419152)
,p_event_id=>wwv_flow_api.id(7397417906419152)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'redondeoMilMasCercano(''P''+pageId+''_PGO_UNDDS_CMRCLS'');',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7398393390419152)
,p_name=>'Al perder el foco redondear valor item 26'
,p_event_sequence=>1
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_MENS_VLR_EXNCN_SBRE_IMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7398822393419152)
,p_event_id=>wwv_flow_api.id(7398393390419152)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'redondeoMilMasCercano(''P''+pageId+''_MENS_VLR_EXNCN_SBRE_IMPSTO'');',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7399254873419152)
,p_name=>'Al perder el foco redondear valor item 27'
,p_event_sequence=>1
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_MENS_RTNCINES_PRCTRON_PRDO'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7399760044419153)
,p_event_id=>wwv_flow_api.id(7399254873419152)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'redondeoMilMasCercano(''P''+pageId+''_MENS_RTNCINES_PRCTRON_PRDO'');',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7400189856419153)
,p_name=>'Al perder el foco redondear valor item 28'
,p_event_sequence=>1
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_MENOS_AUTORRETENCIONES'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7400621251419153)
,p_event_id=>wwv_flow_api.id(7400189856419153)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'redondeoMilMasCercano(''P''+pageId+''_MENOS_AUTORRETENCIONES'');',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7401082647419153)
,p_name=>'Al perder el foco redondear valor item 29'
,p_event_sequence=>1
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_MENS_ANTCPO_LIQDDO_ANIO_ANTR,P312_VALOR_PAGAR'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7401593035419153)
,p_event_id=>wwv_flow_api.id(7401082647419153)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'redondeoMilMasCercano(''P''+pageId+''_MENS_ANTCPO_LIQDDO_ANIO_ANTR'');',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7401969235419154)
,p_name=>'Al perder el foco redondear valor item 31 sancion manual'
,p_event_sequence=>1
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_SANCION_MANUAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7402410226419154)
,p_event_id=>wwv_flow_api.id(7401969235419154)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'redondeoMilMasCercano(''P''+pageId+''_SANCION_MANUAL'');',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7416226108419160)
,p_name=>'Al perder el foco redondear valor item 9'
,p_event_sequence=>1
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_MNS_INGRSS_FUERA_MNCPIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7416731848419161)
,p_event_id=>wwv_flow_api.id(7416226108419160)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'redondeoMilMasCercano(''P''+pageId+''_MNS_INGRSS_FUERA_MNCPIO'');',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7402810197419154)
,p_name=>'Al perder el foco redondear valor item 32'
,p_event_sequence=>21
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_MENOS_SLDO_FVR_PRDO_ANTRIOR'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7403307485419154)
,p_event_id=>wwv_flow_api.id(7402810197419154)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'redondeoMilMasCercano(''P''+pageId+''_MENOS_SLDO_FVR_PRDO_ANTRIOR'');',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7403732443419154)
,p_name=>'Al perder el foco redondear valor item 39'
,p_event_sequence=>31
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_VALOR_PAGO_VOLUNTARIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7404275152419155)
,p_event_id=>wwv_flow_api.id(7403732443419154)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'redondeoMilMasCercano(''P''+pageId+''_VALOR_PAGO_VOLUNTARIO'');',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7404623621419155)
,p_name=>'Al perder el foco redondear valor item valor a pagar bancos'
,p_event_sequence=>41
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_VALOR_PAGAR_BANCOS'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7405157649419155)
,p_event_id=>wwv_flow_api.id(7404623621419155)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function validarItemPagarBanco(){',
'    console.log(''Iniciando validarItemPagarBanco...'');',
'     var VALOR_PAGAR_BANCOS = parseFloat(apex.item(''P''+pageId+''_VALOR_PAGAR_BANCOS'').getValue()) ?? 0;',
'    // var calculo_PAGAR_BANCOS = parseFloat(apex.item(''P''+pageId+''_CALCULO_VALOR_PAGAR_BANCOS'').getValue()) ?? 0;',
'',
'    var TOTAL_PAGAR_PAGO_VOLUNTARIO = parseFloat(apex.item(''P''+pageId+''_TOTAL_PAGAR_PAGO_VOLUNTARIO'').getValue()) ?? 0;',
'    ',
'    console.log('' VALOR_PAGAR_BANCOS==>''+VALOR_PAGAR_BANCOS);',
'    console.log('' TOTAL_PAGAR_PAGO_VOLUNTARIO==>''+TOTAL_PAGAR_PAGO_VOLUNTARIO);   ',
'    ',
'    if (  VALOR_PAGAR_BANCOS  > TOTAL_PAGAR_PAGO_VOLUNTARIO ) {',
'          console.log(''Entro al if de mayor...'');',
'        apex.item(''P''+pageId+''_VALOR_PAGAR_BANCOS'').setValue( TOTAL_PAGAR_PAGO_VOLUNTARIO);',
'        apex.item(''P''+pageId+''_CALCULO_VALOR_PAGAR_BANCOS'').setValue( TOTAL_PAGAR_PAGO_VOLUNTARIO);',
'',
'    } else { ',
'       apex.item(''P''+pageId+''_VALOR_PAGAR_BANCOS'').setValue( VALOR_PAGAR_BANCOS);',
'       apex.item(''P''+pageId+''_CALCULO_VALOR_PAGAR_BANCOS'').setValue(VALOR_PAGAR_BANCOS || 0); ',
'        ',
'    }   ',
'}',
'',
'validarItemPagarBanco();',
'//redondeoMilMasCercano(''P''+pageId+''_VALOR_PAGAR_BANCOS'');',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7405505035419155)
,p_name=>unistr('Al dar clic al bot\00F3n consultar')
,p_event_sequence=>51
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8886517238100730)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7406099220419155)
,p_event_id=>wwv_flow_api.id(7405505035419155)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de haber digitado bien la identificaci\00F3n?", function( okPressed ) {'),
'        if( okPressed ) {',
'            validarSujetoTributo();',
'        }',
'    });'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7406411717419156)
,p_name=>'Al cambiar tipo calculo sancion calcular el valor sancion'
,p_event_sequence=>61
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_TIPO_CALCULO_SANCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7406971111419156)
,p_event_id=>wwv_flow_api.id(7406411717419156)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//calculoItem20();',
'calculoItem25();',
'calculoConcepto();',
'calculoItem25();',
'calculoItem33();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7407385522419156)
,p_name=>'Al calcular tipo de calculo sancion'
,p_event_sequence=>71
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_TIPO_CALCULO_SANCION'
,p_condition_element=>'P312_TIPO_CALCULO_SANCION'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7407847602419157)
,p_event_id=>wwv_flow_api.id(7407385522419156)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P312_SANCION_MANUAL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7408371518419157)
,p_event_id=>wwv_flow_api.id(7407385522419156)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P312_SANCION_MANUAL'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'0'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7408893710419157)
,p_event_id=>wwv_flow_api.id(7407385522419156)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P312_SANCION_MANUAL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7409390721419157)
,p_event_id=>wwv_flow_api.id(7407385522419156)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P312_SANCION_SUGERIDA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7409869883419157)
,p_event_id=>wwv_flow_api.id(7407385522419156)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P312_SANCION_SUGERIDA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7410295391419158)
,p_name=>'Al calcular tipo de calculo sancion vacio'
,p_event_sequence=>81
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_TIPO_CALCULO_SANCION'
,p_condition_element=>'P312_TIPO_CALCULO_SANCION'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7410772501419158)
,p_event_id=>wwv_flow_api.id(7410295391419158)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P312_SANCION_MANUAL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7411233483419158)
,p_event_id=>wwv_flow_api.id(7410295391419158)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P312_SANCION_SUGERIDA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7434290453419169)
,p_name=>'Al ingresar valor'
,p_event_sequence=>82
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_SANCION_MANUAL,P312_TIPO_CALCULO_SANCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7434707667419169)
,p_event_id=>wwv_flow_api.id(7434290453419169)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('var pageId = document.getElementById(''pFlowStepId'').value; // Extrae el n\00FAmero de la pagina.'),
'',
'function netosancion(){',
'     var    tipo_sancion = parseFloat(apex.item(''P''+pageId+''_SANCION_MANUAL'').getValue()) ?? 0;',
'     /*if (tipo_sancion < 471000){',
'        apex.item(''P''+pageId+''_CLCLO_NETO_SANCION'').setValue(471000 || 0);',
'     }else{*/',
'        apex.item(''P''+pageId+''_CLCLO_NETO_SANCION'').setValue(tipo_sancion || 0);',
'    // };',
'    ',
'     setTimeout(function() {',
'                     calculoItem25();',
'                    }, 500);',
'    ',
'     setTimeout(function() {',
'                         calculoConcepto();                             ',
'                    }, 500);',
'    ',
'     setTimeout(function() {',
'                          calculoValorPago ();',
'                    }, 500);',
'}',
'',
'netosancion();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7411641231419158)
,p_name=>'setear items fecha'
,p_event_sequence=>101
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_FCHA_MAXIMA_PRSNTCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7412141581419158)
,p_event_id=>wwv_flow_api.id(7411641231419158)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P312_ITEMS_FECHA'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'nvl(to_date(:P312_FCHA_MAXIMA_PRSNTCION,''dd/mm/yyyy''), ''14/04/2024'')'
,p_attribute_07=>'P312_FCHA_MAXIMA_PRSNTCION'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7414832427419160)
,p_name=>unistr('Al calcular clasificaci\00F3n')
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_CLASIFICACION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7415370435419160)
,p_event_id=>wwv_flow_api.id(7414832427419160)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P312_CLASIFICACION'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7415819276419160)
,p_event_id=>wwv_flow_api.id(7414832427419160)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validarValorBanco();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7413948738419159)
,p_name=>'Al calcular item 25'
,p_event_sequence=>111
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_PGO_UNDDS_CMRCLS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7414421389419159)
,p_event_id=>wwv_flow_api.id(7413948738419159)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'calculoItem25();',
'calculoItem33();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9478007754621031)
,p_name=>'setear item indicador extemporaneo'
,p_event_sequence=>111
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_FCHA_MAXIMA_PRSNTCION,P312_CLASIFICACION,P312_OPCION_DE_USO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9478150612621032)
,p_event_id=>wwv_flow_api.id(9478007754621031)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P312_INDICADOR_EXTEMPORANEO'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pkg_gi_declaraciones_funciones.fnc_vl_fecha_limite(  p_cdgo_clnte                  => :F_CDGO_CLNTE,',
'                                                            p_id_dclrcion_vgncia_frmlrio  => :P312_ID_DCLRCION_VGNCIA_FRMLRIO,',
'                                                            p_idntfccion	              => :P312_IDNTFCCION,',
'                                                            p_fcha_prsntcion              => :P312_FCHA_MAXIMA_PRSNTCION,',
'                                                            p_id_sjto_tpo	              => :P312_CLASIFICACION) as indcdor_extmprneo from dual'))
,p_attribute_07=>'P312_FCHA_MAXIMA_PRSNTCION,P312_INDICADOR_EXTEMPORANEO,P312_CLASIFICACION,P312_IDNTFCCION,P312_OPCION_DE_USO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6904942322135717)
,p_name=>'Al cambiar P312_AVISOS_TABLEROS'
,p_event_sequence=>121
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_AVISOS_TABLEROS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6905071126135718)
,p_event_id=>wwv_flow_api.id(6904942322135717)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function calculoAvisos(){',
unistr('    console.log("Entro en la funci\00F3n de validaci\00F3n calculoItem20 avisos y tableros.");'),
'   ',
'calculoItem17();',
'',
'}',
'',
'calculoAvisos();',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7412555469419159)
,p_name=>'Al actualizar item 8'
,p_event_sequence=>131
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_MNS_INGRSS_FUERA_MNCPIO,P312_MNS_INGRSOS_DEV_REB_DES,P312_MNS_INGRSOS_EXPRTCIONS,P312_MNS_INGRSOS_VNTA_ACT_FIJS,P312_MNS_INGRSOS_ACTVDDS_EXCLDS,P312_MNS_INGRSOS_ACTVDDS_EXENTAS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7413011676419159)
,p_event_id=>wwv_flow_api.id(7412555469419159)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'//regionBaseGravable();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7413537241419159)
,p_event_id=>wwv_flow_api.id(7412555469419159)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'//calculoItem16();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9478244176621033)
,p_name=>'Al cambiar  P312_CLASIFICACION'
,p_event_sequence=>131
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_CLASIFICACION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9478351484621034)
,p_event_id=>wwv_flow_api.id(9478244176621033)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P312_CLCLA_FCHA_PRSNTCION_FINAL'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char( pkg_gi_declaraciones_funciones.fnc_co_fcha_mxma_prsntcion( p_id_dclrcion_vgncia_frmlrio =>  :P312_ID_DCLRCION_VGNCIA_FRMLRIO,',
'                                                                          p_idntfccion => :P312_IDNTFCCION , ',
'                                                                          p_id_sjto_tpo => :P312_CLASIFICACION),',
'                                                                          ''dd/mm/yyyy'' ) as fecha from dual                                      '))
,p_attribute_07=>'P312_ID_DCLRCION_VGNCIA_FRMLRIO,P312_IDNTFCCION,P312_CLASIFICACION'
,p_attribute_08=>'N'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9478413880621035)
,p_event_id=>wwv_flow_api.id(9478244176621033)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('var pageId = &APP_PAGE_ID.;  // Extrae el n\00FAmero de la pagina.'),
'',
'var fechamax = apex.item(''P''+pageId+''_CLCLA_FCHA_PRSNTCION_FINAL'').getValue();',
'console.log(''fechamax => ''+fechamax);',
'var partesFecha = fechamax.split(''/'');',
'',
unistr('// Convertir el mes (posici\00F3n 1) a n\00FAmero, restar 1 y asegurar que tenga dos d\00EDgitos'),
'var ano = (parseInt(partesFecha[2]));',
'console.log(ano);',
'',
'var mes = (parseInt(partesFecha[1], 10) - 1).toString().padStart(2, ''0'');',
'console.log(mes);',
'',
'var dia = (parseInt(partesFecha[0])); ',
'console.log(dia);',
'',
'//var fechaModificada = fechaFormateada.replaceAll(''/'', '','');',
'',
'var maxDate = new Date(ano,mes,dia); ',
'',
'$(''#P312_FCHA_MAXIMA_PRSNTCION'').datepicker(''option'', ''maxDate'', maxDate);',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7435104886419169)
,p_name=>'Calcular item 17 al cambiar 13,14,15,16'
,p_event_sequence=>151
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_CLASIFICACION,P312_OPCION_DE_USO,P312_FCHA_MAXIMA_PRSNTCION,P312_TTL_IMPSTO_INDSTRIA_CMRCIO,P312_MENS_VLR_EXNCN_SBRE_IMPSTO,P312_MENS_RTNCINES_PRCTRON_PRDO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7435661214419170)
,p_event_id=>wwv_flow_api.id(7435104886419169)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setTimeout(function() {',
'                        calculoItem17();',
'                        console.log(''Fin calculo   calculoItem17();'');  ',
'                         $(''.t-Alert--success'').fadeOut(''slow'');             ',
'                    }, 500);                 ',
'              ',
'',
'setTimeout(function() {',
unistr('                       console.log("Esta funci\00F3n se ejecutar\00E1 despu\00E9s de 500 milisegundos calculoItem21()");'),
'                         calculoItem25();    ',
'                         calculoConcepto();',
'                        ',
'                        console.log(''Fin calculo  calculoItem21();'');                    ',
'                    }, 500);',
'',
'setTimeout(function() {',
unistr('                       console.log("Esta funci\00F3n se ejecutar\00E1 despu\00E9s de 500 milisegundos calculoItem21()");'),
'                        calculoValorPago ();',
'                        console.log(''Fin calculo  calculoValorPago ();'');                    ',
'                    }, 500);',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7418967027419161)
,p_name=>unistr('Al cambiar opci\00F3n de uso consultar declaracion inicial')
,p_event_sequence=>160
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_OPCION_DE_USO'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7419401954419162)
,p_event_id=>wwv_flow_api.id(7418967027419161)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P312_CLCLO_DCLRCION_CRRCCION > 0  and :P312_OPCION_DE_USO = ''DIN'' then',
'    :P312_OPCION_DE_USO := ''DCO'';',
'elsif :P312_CLCLO_DCLRCION_CRRCCION = 0  and :P312_OPCION_DE_USO = ''DCO'' then',
'    :P312_OPCION_DE_USO := ''DIN'';',
'end if;',
''))
,p_attribute_02=>'P312_OPCION_DE_USO,P312_CLCLO_DCLRCION_CRRCCION'
,p_attribute_03=>'P312_OPCION_DE_USO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7419857973419162)
,p_name=>'crear actividades'
,p_event_sequence=>161
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(7328174017419109)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7420307018419162)
,p_event_id=>wwv_flow_api.id(7419857973419162)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function crearActividad(){',
'    let $waitPopup = apex.widget.waitPopup();',
'    try{',
unistr('       //alert(''INICIANDO CREACI\00D3N'');'),
'        await apex.server.process ( "ajax_actividades", {',
'            pageItems: "#P312_ACTIVIDAD,#P312_TARIFA,#P312_VLOR_IPSTO,#P312_INGRESOS_GRAVADOS,#P312_ACTIVIDAD_DESCRIPCION"   ',
'        }, {',
'            success: function( pData ){',
'                console.log(pData);',
'                if (pData.o_cdgo_rspsta != 0){',
'                    console.log(pData.o_cdgo_rspsta);',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors ([',
'                        {',
'                            type:       "error",',
'                            location:   "page",',
'                            message:    pData.o_mnsje_rspsta,',
'                            unsafe:     false',
'                        }',
'                    ]);',
'                    console.log(''Antes de ocultar'');',
'                   setTimeout(function () {',
'                       /* var $errorAlert = $(''.a-Notification-item'');',
'                        if ($errorAlert.length > 0) {',
'                            console.log(''Ocultando notificaciones de error...'');',
'                            $errorAlert.fadeOut(''slow'');',
'                            */',
'                              $(''.t-Alert-wrap'').fadeOut(''slow'');  ',
'                             // $(''.a-Notification-item'').fadeOut(''slow'');  ',
'                       ',
'                        /*} else {',
unistr('                            console.log(''No se encontr\00F3 ninguna notificaci\00F3n de error.'');'),
'                        }*/',
'                    }, 3000); // Espera 1 segundo antes de intentar ocultarlas',
'                }else{',
'                    apex.region("actividad").refresh();   ',
'                    console.log(''Iniciando calculo...'');',
'                   // apex.theme.closeRegion("gestionActividadEconomica");',
'                       apex.message.showPageSuccess("Actividad agregada.");',
'                       limpiar_items();',
'                    setTimeout(function() {',
unistr('                       console.log("Esta funci\00F3n se ejecutar\00E1 despu\00E9s de 500 milisegundos (1 segundo).");'),
'                        calculoActividadesGravadas();',
'                        console.log(''Fin calculo...'');',
'                        $(''.t-Alert--success'').fadeOut(''slow'');             ',
'                    }, 500);                  ',
'                }',
'            }',
'        })',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        $waitPopup.remove();',
'    }',
'};',
'crearActividad();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7417128263419161)
,p_name=>'Al cambiar items de interes '
,p_event_sequence=>181
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_CLCLO_INTRSES_STSA_BMRL,P312_CLCLO_INTRSS_AVSS_TBLRS,P312_CALCULO_INTRSS_INTRIA_CMRCIO,P312_CALCULO_INTERES_ANTICIPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7417623315419161)
,p_event_id=>wwv_flow_api.id(7417128263419161)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculoInteres();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7418038775419161)
,p_name=>'Al cambiar P312_VALOR_PAGAR'
,p_event_sequence=>191
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_CALCULO_TOTAL_SALDO_CARGO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7418581333419161)
,p_event_id=>wwv_flow_api.id(7418038775419161)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>unistr('calculoValorPago(); //Funci\00F3n que calculo el valor del item valor  total a pagar')
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7422527364419163)
,p_name=>'prueba'
,p_event_sequence=>191
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(148543044974799405)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7423076335419163)
,p_event_id=>wwv_flow_api.id(7422527364419163)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(''Iniciando calculo...'');',
'calculoActividadesGravadas();',
'console.log(''Fin calculo...'');',
'buildJsonActividades();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7423444728419164)
,p_name=>'PROBAR SUMA COLUMNA'
,p_event_sequence=>201
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(136502625106520404)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7423977916419164)
,p_event_id=>wwv_flow_api.id(7423444728419164)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('// Espera a que la p\00E1gina se cargue completamente'),
'$(document).ready(function() {',
unistr('    // Obt\00E9n el objeto de Interactive Grid por su ID'),
'    var ig$ = apex.region("actividad").widget();',
'',
unistr('    // Define una funci\00F3n para calcular la suma total'),
'    function calcularSumaTotal() {',
'        var sumaTotal = 0;',
'        // Itera sobre cada fila del Interactive Grid',
'        ig$.interactiveGrid("getViews", "grid").model.fetchRecords(function(records) {',
'            records.forEach(function(record) {',
'                // Suma el valor de la columna ''VLOR_IGRSOS_GRVDOS'' de cada fila',
'                sumaTotal += parseFloat(record[ig$.interactiveGrid("getViews", "grid").model.getFieldKey("VLOR_IGRSOS_GRVDOS")]);',
'            });',
'            // Muestra la suma total en la consola o haz lo que desees con ella',
'            console.log("Suma Total: " + sumaTotal);',
'        });',
'    }',
'',
unistr('    // Llama a la funci\00F3n para calcular la suma total cuando sea necesario'),
'    calcularSumaTotal();',
'});',
''))
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7424318085419164)
,p_name=>'Al cambiar P312_IMPUESTO_LEY calcular valores formulario'
,p_event_sequence=>211
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_IMPUESTO_LEY'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7424822760419164)
,p_event_id=>wwv_flow_api.id(7424318085419164)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculoActividadesGravadas();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7420792808419162)
,p_name=>'calcular valor impuesto'
,p_event_sequence=>221
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_INGRSS_ORDNRIOS'
,p_condition_element=>'P312_ID_SJTO_IMPSTO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'keydown'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7421217772419163)
,p_event_id=>wwv_flow_api.id(7420792808419162)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//console.log("Antes de calcular impuesto");',
'//calcularImpuesto();',
unistr('var pageId = &APP_PAGE_ID.;  // Extrae el n\00FAmero de la pagina.'),
'async function valorCalculado (){',
'  $(document).on(''keyup input change'', ''#P''+pageId+''_INGRESOS_GRAVADOS'', function (event) {',
'    if (event.type === ''keyup'') {',
'        if (event.key === "Backspace" || event.key === "Delete") {',
'            calcularImpuesto(); // Detectar teclas de borrado',
'        }',
'    } else {',
'        calcularImpuesto(); // Ejecuta en cambio de valor o entrada',
'    }',
'});',
'    ',
'}',
'',
'valorCalculado();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9478747126621038)
,p_name=>'calcular valor impuesto al cambiar'
,p_event_sequence=>231
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_INGRSS_ORDNRIOS,P312_TARIFA'
,p_condition_element=>'P312_ID_SJTO_IMPSTO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9478845558621039)
,p_event_id=>wwv_flow_api.id(9478747126621038)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log("Antes de calcular impuesto");',
'calcularImpuesto();',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7421666673419163)
,p_name=>'Al cambiar actividad economica2'
,p_event_sequence=>241
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_ACTIVIDAD'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7422195044419163)
,p_event_id=>wwv_flow_api.id(7421666673419163)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P312_TARIFA,P312_ACTIVIDAD_DESCRIPCION'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.trfa,',
'       a.cdgo_dclrcns_esqma_trfa || '' - '' || a.dscrpcion',
'from gi_d_dclrcns_esqma_trfa a',
'where a.id_dclrcns_esqma_trfa = :P312_ACTIVIDAD'))
,p_attribute_07=>'P312_ACTIVIDAD'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7427023639419165)
,p_name=>'Al dar click boton BTN_NUEVA_ACTIVIDAD'
,p_event_sequence=>251
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(7328543944419109)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7427552408419166)
,p_event_id=>wwv_flow_api.id(7427023639419165)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function limpiar_items(){',
'    // Limpiamos Items',
'    apex.item("P312_ACTIVIDAD").setValue("");',
'    apex.item("P312_TARIFA").setValue("");',
'    apex.item("P312_INGRESOS_GRAVADOS").setValue("");',
'    apex.item("P312_VLOR_IPSTO").setValue("");',
'}',
'',
'// Limpiamos Items',
'limpiar_items();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7427973185419166)
,p_name=>'Al cambiar P312_VLOR_IPSTO'
,p_event_sequence=>261
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_VLOR_IPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7428423062419166)
,p_event_id=>wwv_flow_api.id(7427973185419166)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'redondeoMilMasCercano(''P''+pageId+''_VLOR_IPSTO'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7428831134419166)
,p_name=>'Al dar click boton BTN_CANCELAR'
,p_event_sequence=>271
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(7328947206419109)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7429372602419166)
,p_event_id=>wwv_flow_api.id(7428831134419166)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.theme.closeRegion("gestionActividadEconomica");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7425216669419165)
,p_name=>'Al cambiar P312_APORTE_VOLUNTARIO'
,p_event_sequence=>281
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_APORTE_VOLUNTARIO,P312_VALOR_PAGO_VOLUNTARIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7425756540419165)
,p_event_id=>wwv_flow_api.id(7425216669419165)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('function validarPagoVoluntario (){  // Funci\00F3n que valida si aporte voluntario es N, cambia el valor del item valor pago voluntario a cero.'),
'     var aprte_vlntrio =  apex.item(''P''+pageId+''_APORTE_VOLUNTARIO'').getValue();',
'     var vlor_aprte_vlntrio =  apex.item(''P''+pageId+''_VALOR_PAGO_VOLUNTARIO'').getValue();',
'   ',
'    if (aprte_vlntrio !== ''S'' && vlor_aprte_vlntrio > 0 ){',
'        // console.log(''Entro en if validarPagoVoluntario'');',
'        apex.item(''P''+pageId+''_VALOR_PAGO_VOLUNTARIO'').setValue(0 || 0); ',
'    }',
'    ',
'',
'    validarsumapagovoluntario();',
'}',
'',
'function validarsumapagovoluntario (){  ',
'    ',
'     var aprte_vlntrio      =  apex.item(''P''+pageId+''_APORTE_VOLUNTARIO'').getValue();',
'     var vlor_aprte_vlntrio =  apex.item(''P''+pageId+''_VALOR_PAGO_VOLUNTARIO'').getValue();',
'     var vlro_pgar_bncos    =  apex.item(''P''+pageId+''_VALOR_PAGAR_BANCOS'').getValue();',
'     var ttal_pgar_pgo_vlntrio    =  apex.item(''P''+pageId+''_TOTAL_PAGAR_PAGO_VOLUNTARIO'').getValue(); //item40',
'    ',
'   // apex.item(''P''+pageId+''_CALCULO_VALOR_PAGAR_BANCOS'').hide();    ',
'   // apex.item(''P''+pageId+''_VALOR_PAGAR_BANCOS'').hide();',
'    ',
'   // console.log(''aprte_vlntrio => ''+aprte_vlntrio);',
'   // console.log(''vlro_pgar_bncos => ''+vlro_pgar_bncos);',
'   // console.log(''ttal_pgar_pgo_vlntrio => ''+ttal_pgar_pgo_vlntrio);',
'',
'  ',
'    if (aprte_vlntrio === ''S'' && vlro_pgar_bncos < ttal_pgar_pgo_vlntrio ){',
'       //  console.log(''Entro en if ...'');',
'        ',
'        apex.item(''P''+pageId+''_VALOR_PAGAR_BANCOS'').setValue(ttal_pgar_pgo_vlntrio || 0); ',
'        apex.item(''P''+pageId+''_CALCULO_VALOR_PAGAR_BANCOS'').setValue(ttal_pgar_pgo_vlntrio || 0); ',
'',
'        ',
'    }else{',
'         // console.log(''_VALOR_PAGAR_BANCOS => ''+ttal_pgar_pgo_vlntrio);',
'          apex.item(''P''+pageId+''_VALOR_PAGAR_BANCOS'').setValue(ttal_pgar_pgo_vlntrio || 0); ',
'          apex.item(''P''+pageId+''_CALCULO_VALOR_PAGAR_BANCOS'').setValue(ttal_pgar_pgo_vlntrio || 0); ',
'',
'                ',
'',
'    }',
'}',
'',
'validarPagoVoluntario();',
'validarsumapagovoluntario();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7429715609419167)
,p_name=>'Al hacer clic BTN_MOSTRAR_REGION_ACTIVIDADES'
,p_event_sequence=>291
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8829604800100687)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7430263815419167)
,p_event_id=>wwv_flow_api.id(7429715609419167)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'BUTTON'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function limpiar_items(){',
'  // Limpiamos Items''',
'    apex.item("P312_ACTIVIDAD").setValue("");',
'    apex.item("P312_TARIFA").setValue("");',
'    apex.item("P312_INGRESOS_GRAVADOS").setValue("");',
'    apex.item("P312_VLOR_IPSTO").setValue("");',
'}',
'function mostrar_region_actividades() {',
'    // Limpiamos Items''',
'    limpiar_items();',
'    // Mostramos region''',
'    apex.theme.openRegion("gestionActividadEconomica");',
'}',
'mostrar_region_actividades();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7426164927419165)
,p_name=>'Al cambiar P312_VALOR_PAGAR '
,p_event_sequence=>301
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_VALOR_PAGAR'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7426673213419165)
,p_event_id=>wwv_flow_api.id(7426164927419165)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>unistr('calcularItem38();//Funci\00F3n que calcula el valor del item38')
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7431537550419167)
,p_name=>'Al hacer clic columna eliminar'
,p_event_sequence=>311
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(22229398677667635)
,p_triggering_element=>'ELIMINAR'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7432040102419168)
,p_event_id=>wwv_flow_api.id(7431537550419167)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calcularId();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7432403710419168)
,p_name=>'al seleccionar '
,p_event_sequence=>321
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(22229398677667635)
,p_triggering_element=>'SELECCIONAR'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'SEQ_ID'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7432922321419168)
,p_event_id=>wwv_flow_api.id(7432403710419168)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'ELIMINAR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7433375414419168)
,p_name=>'Al hacer clic BTN_CREATE'
,p_event_sequence=>331
,p_bind_type=>'bind'
,p_bind_event_type=>'apexbeforepagesubmit'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7433863082419168)
,p_event_id=>wwv_flow_api.id(7433375414419168)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('var pageId = &APP_PAGE_ID.;  // Extrae el n\00FAmero de la pagina.'),
'apex.item( ''P'' + pageId + ''_MNS_VLR_EXNCION_SBRE_IMPSTO'' ).enable();',
'//habilitarItems();',
'function validarCampos() {',
'    var campo1 = $v("P" + pageId + "_NOMBRES_DECLARANTE");  ',
'    var campo2 = $v("P" + pageId + "_CLASIFICACION");  ',
'    var campo3 = $v("P" + pageId + "_OPCION_DE_USO");',
'  /*  var campo4 = $v("P" + pageId + "_FCHA_RGSTRO");',
'    var campo5 = $v("P" + pageId + "_FCHA_ULTMA_MDFCCION");',
'    var campo6 = $v("P" + pageId + "_FCHA_PRSNTCION");',
'    var campo7 = $v("P" + pageId + "_FCHA_ANLCION");',
'    var campo8 = $v("P" + pageId + "_FCHA_PRSNTCION_PRYCTDA");*/',
'    var campo9 = $v("P" + pageId + "_FCHA_MAXIMA_PRSNTCION");',
'    var campo10 = $v("P" + pageId + "_CORREO_ELECTRONICO");',
'    var valid = true;',
unistr('    // Validar si los campos est\00E1n vac\00EDos'),
unistr('    console.log("Antes de validaci\00F3n");'),
'    ',
'    if (campo1.trim() === "") {console.log("valida 1."); valid = false; }',
'    if (campo2.trim() === "") {console.log("valida 2."); valid = false; }',
'    if (campo3.trim() === "") {console.log("valida 3."); valid = false; }',
'    /*if (campo4.trim() === "") {console.log("valida 4."); valid = false; }',
'    if (campo5.trim() === "") {console.log("valida 5."); valid = false; }',
'    if (campo6.trim() === "") {console.log("valida 6."); valid = false; }',
'    if (campo7.trim() === "") {console.log("valida 7."); valid = false; }',
'    if (campo8.trim() === "") {console.log("valida 8."); valid = false; }*/',
'    if (campo9.trim() === "") {console.log("valida 9."); valid = false; }',
'    if (campo10.trim() === "") {console.log("valida 10."); valid = false; }',
'',
'    if (!valid) {',
unistr('        deshabilitarItems(); // Si alguna validaci\00F3n falla, ejecuta deshabilitarItems'),
'         //apex.event.gCancelFlag = true;',
unistr('        console.log("Algunos campos est\00E1n vac\00EDos, deshabilitando \00EDtems.");'),
'    } else {',
unistr('        habilitarItems(); // Si todos los campos est\00E1n llenos, ejecuta habilitarItems'),
unistr('        console.log("Todos los campos est\00E1n llenos, habilitando \00EDtems.");'),
'        limpiarIG();',
'    }',
'}',
'validarCampos();',
'',
'function limpiarIG() {',
'    var region = apex.region("actividad"); // Reemplaza con el ID de tu IG',
'    if (region) {',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        ',
'        model.clearData(); // Elimina todas las filas del IG',
'        console.log("Interactive Grid limpiado correctamente.");',
'    } else {',
unistr('        console.error("No se encontr\00F3 la regi\00F3n ''actividad''.");'),
'    }',
'}',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7430697351419167)
,p_name=>'Al cambiar P312_TOTAL_PAGAR'
,p_event_sequence=>341
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_TOTAL_PAGAR,P312_VALOR_PAGO_VOLUNTARIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7431145692419167)
,p_event_id=>wwv_flow_api.id(7430697351419167)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>unistr('calcularItem40();//Funci\00F3n que calcula el valor del item340')
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7436929448419170)
,p_name=>'Al cambiar P312_NOMBRES_DECLARANTE'
,p_event_sequence=>351
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_NOMBRES_DECLARANTE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7437423471419170)
,p_event_id=>wwv_flow_api.id(7436929448419170)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P312_TPO_IDNTFCCION_DCLRNTE_FRMA,P312_IDNTFCCION_RPRSNTNTE'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  b.cdgo_idntfccion_tpo , ',
'        a.idntfccion_rspnsble        ',
'from    v_si_i_sujetos_responsable    a',
'join    df_s_identificaciones_tipo    b on a.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo                                    ',
'where   a.id_sjto_rspnsble  = :P312_NOMBRES_DECLARANTE;'))
,p_attribute_07=>'P312_NOMBRES_DECLARANTE'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7437847323419171)
,p_name=>'Al cambiar P312_NOMBRES_DECLARANTE_REVISOR'
,p_event_sequence=>361
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_NOMBRES_DECLARANTE_REVISOR'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7438350260419171)
,p_event_id=>wwv_flow_api.id(7437847323419171)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P312_TPO_IDENTIFICACION_REVISOR,P312_IDENTIFICACION_REVISOR'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  b.cdgo_idntfccion_tpo , ',
'        a.idntfccion_rspnsble        ',
'from    v_si_i_sujetos_responsable    a',
'join    df_s_identificaciones_tipo    b on a.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo                                    ',
'where   a.id_sjto_rspnsble  = :P312_NOMBRES_DECLARANTE_REVISOR;'))
,p_attribute_07=>'P312_NOMBRES_DECLARANTE_REVISOR'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7460587216830934)
,p_name=>unistr('Al dar clic al bot\00F3n consultar')
,p_event_sequence=>371
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(7246764270419053)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7460941023830947)
,p_event_id=>wwv_flow_api.id(7460587216830934)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de haber digitado bien la identificaci\00F3n?", function( okPressed ) {'),
'        if( okPressed ) {',
'            validarSujetoTributo();',
'        }',
'    });'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7464852676191624)
,p_name=>'Al hacer clic BTN_MOSTRAR_REGION_ACTIVIDADES'
,p_event_sequence=>381
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(7274411805419073)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7465229999191626)
,p_event_id=>wwv_flow_api.id(7464852676191624)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'BUTTON'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function limpiar_items(){',
'  // Limpiamos Items''',
'    apex.item("P311_ACTIVIDAD").setValue("");',
'    apex.item("P311_TARIFA").setValue("");',
'    apex.item("P311_INGRESOS_GRAVADOS").setValue("");',
'    apex.item("P311_VLOR_IPSTO").setValue("");',
'}',
'function mostrar_region_actividades() {',
'    // Limpiamos Items''',
'    limpiar_items();',
'    // Mostramos region''',
'    apex.theme.openRegion("gestionActividadEconomica");',
'}',
'mostrar_region_actividades();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7436085586419170)
,p_name=>'Al cambiar P312_CLCLO_NETO_SANCION'
,p_event_sequence=>391
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_CLCLO_NETO_SANCION,P312_MENS_VLR_EXNCN_SBRE_IMPSTO,P312_MENS_ANTCPO_LIQDDO_ANIO_ANTR,P312_MENOS_AUTORRETENCIONES,P312_MENS_RTNCINES_PRCTRON_PRDO,P312_SANCION_MANUAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7436572210419170)
,p_event_id=>wwv_flow_api.id(7436085586419170)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'calculoItem25();',
'setTimeout(function() {',
unistr('                       console.log("Esta funci\00F3n se ejecutar\00E1 despu\00E9s de 500 milisegundos calculoValorPago()");'),
'                     ',
'                          calculoValorPago ();                            ',
'                        console.log(''calculoValorPago'');                    ',
'                    }, 500);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7442477363419173)
,p_name=>'Al cambiar  P312_NOMBRE_DECLARANTE'
,p_event_sequence=>401
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_NOMBRES_DECLARANTE'
,p_condition_element=>'P312_NOMBRES_DECLARANTE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7442913935419173)
,p_event_id=>wwv_flow_api.id(7442477363419173)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P312_ETIQUETA_PRINCIPAL'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(w.dscrpcion, '''')  as descripcion_firma ',
'from',
'si_i_sujetos_responsable r',
'inner join ws_d_tipo_firma w on',
'r.cdgo_tpo_rspnsble  = w.cdgo_tpo_frma ',
'where r.id_sjto_rspnsble  =  :P312_NOMBRES_DECLARANTE',
'and r.prncpal_s_n =''S''',
'AND ROWNUM = 1'))
,p_attribute_07=>'P312_NOMBRES_DECLARANTE,P312_ETIQUETA_PRINCIPAL'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7443418499419173)
,p_event_id=>wwv_flow_api.id(7442477363419173)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P312_ETIQUETA_PRINCIPAL'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7441077921419172)
,p_name=>'Al cambiar  P312_IDENTIFICACION_REVISOR'
,p_event_sequence=>411
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_NOMBRES_DECLARANTE_REVISOR'
,p_condition_element=>'P312_NOMBRES_DECLARANTE_REVISOR'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7441567599419172)
,p_event_id=>wwv_flow_api.id(7441077921419172)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P312_ETIQUETA_SECUNDARIA'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select w.dscrpcion  as descripcion_firma from',
'si_i_sujetos_responsable r',
'inner join ws_d_tipo_firma w on',
'r.cdgo_tpo_rspnsble  = w.cdgo_tpo_frma ',
'where r.id_sjto_rspnsble  =  :P312_NOMBRES_DECLARANTE_REVISOR',
'AND ROWNUM = 1'))
,p_attribute_07=>'P312_NOMBRES_DECLARANTE_REVISOR,P312_ETIQUETA_SECUNDARIA'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7442041432419172)
,p_event_id=>wwv_flow_api.id(7441077921419172)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P312_ETIQUETA_SECUNDARIA'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7439254751419171)
,p_name=>'Actualizar etique'
,p_event_sequence=>421
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_NOMBRES_DECLARANTE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7439784021419171)
,p_event_id=>wwv_flow_api.id(7439254751419171)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P312_ETIQUETA_PRINCIPAL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7440165011419172)
,p_name=>'al cambiar etiqueta secundaria'
,p_event_sequence=>431
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P312_NOMBRES_DECLARANTE_REVISOR'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7440665877419172)
,p_event_id=>wwv_flow_api.id(7440165011419172)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P312_ETIQUETA_SECUNDARIA'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8870939408946803)
,p_name=>'Al cambiar actividad economica'
,p_event_sequence=>441
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(22229398677667635)
,p_triggering_element=>'IDNTFCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8871023890946804)
,p_event_id=>wwv_flow_api.id(8870939408946803)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'TRFA,DSCRPCION'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.cdgo_dclrcns_esqma_trfa || '' - '' || a.dscrpcion as DSCRPCION,',
'a.trfa as TRFA',
'from gi_d_dclrcns_esqma_trfa a',
'where a.id_dclrcns_esqma_trfa = :IDNTFCCION'))
,p_attribute_07=>'IDNTFCCION'
,p_attribute_08=>'N'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8873813880946832)
,p_event_id=>wwv_flow_api.id(8870939408946803)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'ID_ACTIVIDAD'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_dclrcns_esqma_trfa as ID_ACTIVIDAD',
'from gi_d_dclrcns_esqma_trfa a',
'where a.id_dclrcns_esqma_trfa = :IDNTFCCION'))
,p_attribute_07=>'IDNTFCCION'
,p_attribute_08=>'N'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12554893627384701)
,p_event_id=>wwv_flow_api.id(8870939408946803)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'INGRSS_ORDNRIOS,INGRSS_ACTVDAD,INGRSS_GRVBLE,VLOR_ESTMPLLA'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  0 as INGRSS_ORDNRIOS,',
'        0 as INGRSS_ACTVDAD,',
'        0 as INGRSS_GRVBLE,',
'        0 as VLOR_ESTMPLLA',
'from dual'))
,p_attribute_07=>'IDNTFCCION'
,p_attribute_08=>'N'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8873560318946829)
,p_name=>'Validar que no se repitan las actividades'
,p_event_sequence=>450
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(22229398677667635)
,p_triggering_element=>'IDNTFCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8873656952946830)
,p_event_id=>wwv_flow_api.id(8873560318946829)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function validarActividad() {',
'    const region = apex.region(''actividad'');',
'    if (!region) {',
unistr('        console.error(''No se encontr\00F3 la regi\00F3n "actividad"'');'),
'        return;',
'    }',
'',
'    const view = region.widget().interactiveGrid("getViews", "grid");',
'    const model = view.model;',
'',
'    const registrosPorActividad = {};',
'    const duplicadosAEliminar = [];',
'',
'    // Agrupar registros por ID_ACTIVIDAD',
'    model.forEach(function(record) {',
'        const idActividad = model.getValue(record, "ID_ACTIVIDAD") || "0";',
'        if (!registrosPorActividad[idActividad]) {',
'            registrosPorActividad[idActividad] = [];',
'        }',
'        registrosPorActividad[idActividad].push(record);',
'    });',
'',
'    // Detectar duplicados y preparar mensaje',
'    for (let id in registrosPorActividad) {',
'        if (id === "0") continue;',
'',
'        const registros = registrosPorActividad[id];',
'        if (registros.length > 1) {',
'            const duplicados = registros.slice(1);',
'            duplicados.forEach(d => duplicadosAEliminar.push(d));',
'',
unistr('            // Obtener descripci\00F3n desde el primer registro'),
unistr('            const descripcion = model.getValue(registros[0], "DSCRPCION") || "(Sin descripci\00F3n)";'),
'',
'            console.warn(`Actividad duplicada [${id}] (${descripcion}) encontrada ${registros.length} veces`);',
'            apex.message.clearErrors();',
'            apex.message.showErrors([{',
'                type: "error",',
'                location: "page",',
unistr('                message: `La actividad "${descripcion}" est\00E1 duplicada.`,'),
'                unsafe: false',
'            }]);',
'        }',
'    }',
'',
'    // Si hay duplicados, forzar blur y luego eliminar',
'    if (duplicadosAEliminar.length > 0) {',
'        document.activeElement.blur(); // Salir de la celda activa',
'',
'        setTimeout(() => {',
'            // Seleccionar y eliminar duplicados',
'            view.setSelectedRecords(duplicadosAEliminar);',
'            region.widget().interactiveGrid("getActions").invoke("selection-delete");',
'',
'            // Ocultar mensaje',
'            setTimeout(() => $(''.t-Alert-wrap'').fadeOut(''slow''), 4000);',
unistr('        }, 300); // Esperar un poco para que termine la edici\00F3n'),
'    }',
'}',
'',
'',
'setTimeout(function () {',
'    // Cancela ediciones antes de validar',
'    validarActividad();',
'}, 300);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8871367419946807)
,p_name=>'Habilitar columna INGRSS_GRVBLE'
,p_event_sequence=>451
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(22229398677667635)
,p_triggering_element=>'INGRSS_ORDNRIOS,INGRSS_ACTVDAD'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8871474454946808)
,p_event_id=>wwv_flow_api.id(8871367419946807)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'INGRSS_GRVBLE'
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8875024197946844)
,p_event_id=>wwv_flow_api.id(8871367419946807)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'INGRSS_GRVBLE,TRFA'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8875164471946845)
,p_event_id=>wwv_flow_api.id(8871367419946807)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'INGRSS_GRVBLE,VLOR_ESTMPLLA'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8871797167946811)
,p_name=>'calcular valor INGRSS_GRVBLE al cambiar'
,p_event_sequence=>455
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(22229398677667635)
,p_triggering_element=>'INGRSS_ORDNRIOS,INGRSS_ACTVDAD,TRFA,IDNTFCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8871894988946812)
,p_event_id=>wwv_flow_api.id(8871797167946811)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'valorCalculado();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8871580933946809)
,p_name=>'bloquear  columna INGRSS_GRVBLE'
,p_event_sequence=>461
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(22229398677667635)
,p_triggering_element=>'INGRSS_ORDNRIOS,INGRSS_ACTVDAD'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8871601564946810)
,p_event_id=>wwv_flow_api.id(8871580933946809)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'INGRSS_GRVBLE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8875290093946846)
,p_event_id=>wwv_flow_api.id(8871580933946809)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'INGRSS_GRVBLE,TRFA'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8875385651946847)
,p_event_id=>wwv_flow_api.id(8871580933946809)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'INGRSS_GRVBLE,VLOR_ESTMPLLA'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7392500067419149)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar_Actividad'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_exste boolean;',
'    v_cntdad number;',
'begin',
' ',
unistr('    -- Determinamos si la colecci\00F2n existe'),
'    if APEX_COLLECTION.COLLECTION_EXISTS(''ACTIVIDADES'') then ',
'              ',
'        select count(1) into v_cntdad',
'        from APEX_COLLECTIONS',
'        where collection_name = ''ACTIVIDADES''',
'        and seq_id = :P312_SEQ_ID;',
' ',
'         if v_cntdad > 0 then',
'            APEX_COLLECTION.DELETE_MEMBER(',
'            p_collection_name => ''ACTIVIDADES'',',
'            p_seq => :P312_SEQ_ID); ',
'        end if;',
'',
'    end if;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'ELIMINAR_ACTIVIDAD'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Actividad Eliminada Exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7265409161419065)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(145720429892590562)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Create Formu'
,p_attribute_01=>'TABLE'
,p_attribute_03=>'GI_G_DECLARACIONES_V2'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>'Error al registrar #SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(7249085957419055)
,p_process_success_message=>unistr('Declaraci\00F3n registrada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7391372187419148)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Registrar declaraci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar(4000);',
'    v_id_dclrcion        number;',
'    v_id_dclrcion_v1      number;',
'begin',
'    -- rrecorer el json actividades.',
'    -- insert en la tabla de activades  id_dclrcion => P312_ID_DCLRCION ',
'    ',
'',
'  --  v_id_dclrcion    :=     :P312_ID_DCLRCION;',
'    pkg_gi_declaraciones_utlddes.prc_hg_formulario(p_cdgo_clnte                 => :F_CDGO_CLNTE,',
'                                                  p_id_sjto_impsto              => :P312_ID_SJTO_IMPSTO,',
'                                                  p_id_dclrcion_v2              => :P312_ID_DCLRCION,',
'                                                  --p_id_cnddto_vgncia            => null,',
'                                                  p_id_dclrcion_vgncia_frmlrio  => :P312_ID_DCLRCION_VGNCIA_FRMLRIO,',
'                                                  p_id_pagina    		        => :APP_PAGE_ID,',
'                                                  p_id_usrio                    => :F_ID_USRIO,',
'                                                  p_id_orgen_tpo                => 1,',
'                                                  p_json_actvdds                => :P312_JSON_ACTVDDES,',
'                                                  o_id_dclrcion                 => v_id_dclrcion_v1,',
'                                                  o_cdgo_rspsta                 => v_cdgo_rspsta, ',
'                                                  o_mnsje_rspsta                => v_mnsje_rspsta);',
'',
'    if v_cdgo_rspsta > 0 then',
'        raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;',
'    :P312_ID_DCLRCION_V2 := v_id_dclrcion_v1;',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(7249085957419055)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7392171648419149)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar en Coleccion Actividades'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_prncpal               number;',
'    v_rgstros               number;',
'begin',
'',
'         ',
'        if (not apex_collection.collection_exists(p_collection_name => ''ACTIVIDADES'') ) then',
'            apex_collection.create_collection( p_collection_name => ''ACTIVIDADES'');',
'        end if;',
'  ',
'          -- Se valida si la Actividad ya esta registrada',
'        begin',
'            select count(*)',
'              into v_rgstros',
'             from apex_collections   a',
'             where collection_name   = ''ACTIVIDADES''',
'               and a.n003            = :P312_ACTIVIDAD ;',
'        ',
'            if v_rgstros > 0 then',
'                raise_application_error(-20003, ''Sr(a). '' || :F_NMBRE_USRIO || '', la Actividad ya se encuentra agregada. Por favor valide e intente nuevamente'');  ',
'            end if;',
'        end;-- FIN Se valida si la Actividad ya esta registrada      ',
'          ',
'        begin',
'            apex_collection.add_member(p_collection_name 	=> ''ACTIVIDADES''',
'                                     , p_n003               => :P312_ACTIVIDAD',
'									 , p_n004               => :P312_TARIFA',
'                                     , p_c001				=> :P312_VALOR );',
'      end;                     ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7389331789419147)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Calcular informaci\00F3n declarante firma')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.cdgo_idntfccion_tpo,',
'           b.idntfccion',
'     into  :P312_TPO_IDENTIFICACION_DECLARANTE_FIRMA,',
'           :P312_IDENTIFICACION_REPRESENTANTE',
'    from df_s_identificaciones_tipo a ',
'    join    si_i_sujetos_responsable b on a.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo',
'    where b.id_sjto_rspnsble  = :P312_ID_SJTO_IMPSTO ',
'    order by dscrpcion_idntfccion_tpo asc;',
'exception',
'      when no_data_found then',
'          :P312_TPO_IDENTIFICACION_DECLARANTE_FIRMA := null;',
'          :P312_IDENTIFICACION_REPRESENTANTE:= null;',
'  end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7389767525419147)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicia Declaracion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_id_page                       NUMBER         := :APP_PAGE_ID;',
'    v_id_dclrcion_vgncia_frmlrio    NUMBER         := :P312_ID_DCLRCION_VGNCIA_FRMLRIO;',
'    v_idntfccion                    VARCHAR2(50)   := :P312_IDNTFCCION;',
'    v_branch                        NUMBER         := :P312_BRANCH;',
'    v_id_sjto_impsto                NUMBER         := :P312_ID_SJTO_IMPSTO;',
'    v_mstrar_frmlrio                VARCHAR2(2)    := :P312_MSTRAR_FRMLRIO;',
'    --v_mstrar_frmlrio                VARCHAR2(50) := ''S'';',
'',
'',
'begin',
unistr('    -- Verifica si la colecci\00F3n existe y la crea o la trunca'),
'    if apex_collection.collection_exists(p_collection_name => ''ACTIVIDADES'') then',
'        APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''ACTIVIDADES'');',
'    end if;',
unistr('    -- Limpia la cach\00E9 de la p\00E1gina'),
'    APEX_UTIL.CLEAR_PAGE_CACHE(:APP_PAGE_ID);',
'    -- Restaurar los valores de los elementos usando set_session_state',
'  ',
'    apex_util.set_session_state(''P''||v_id_page||''_ID_DCLRCION_VGNCIA_FRMLRIO'', v_id_dclrcion_vgncia_frmlrio);',
'    apex_util.set_session_state(''P''||v_id_page||''_IDNTFCCION'', v_idntfccion);',
'    apex_util.set_session_state(''P''||v_id_page||''_ID_SJTO_IMPSTO'', v_id_sjto_impsto);',
'    apex_util.set_session_state(''P''||v_id_page||''_MSTRAR_FRMLRIO'', v_mstrar_frmlrio);',
'    apex_util.set_session_state(''P''||v_id_page||''_AVISOS_TABLEROS'', ''S''); ',
'    /*apex_util.set_session_state(''P''||v_id_page||''_CNSRCIO_UNION_TMPRL'', ''N'');   ',
'    apex_util.set_session_state(''P''||v_id_page||''_RLZA_ACTDS_PNIO_AUTNMO'', ''N'');   ',
'    apex_util.set_session_state(''P''||v_id_page||''_CNCLCION_ESTBLCMIENTO'', ''N'');   */',
'    apex_util.set_session_state(''P''||v_id_page||''_NMRO_ESTBLCMIENTS'', 0); ',
'    apex_util.set_session_state(''P''||v_id_page||''_BRANCH'', v_branch);  ',
'    ',
'exception',
'    when others then',
'        NULL;',
'end;',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7391713229419149)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'limpiar id_sjto_impsto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'        :P312_ID_SJTO_IMPSTO := null;',
'        :P312_ID_DCLRCION := NULL;',
'  exception ',
'    when others then null;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'iniciar_declaracion'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7265046546419064)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(145720429892590562)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Create Form'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7388160890419146)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Calcular Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select      d.id_impsto,',
'                d.id_impsto_sbmpsto,',
'                c.vgncia,',
'                c.id_prdo',
'    into        :P312_ID_IMPSTO,',
'                :P312_ID_IMPSTO_SBMPSTO,',
'                :P312_VGNCIA,',
'                :P312_ID_PRDO',
'    from        gi_d_dclrcnes_vgncias_frmlr a',
'    inner join  gi_d_dclrcnes_tpos_vgncias  b   on  b.id_dclrcion_tpo_vgncia    =   a.id_dclrcion_tpo_vgncia',
'    inner join  df_i_periodos               c   on  c.id_prdo                   =   b.id_prdo',
'    inner join  gi_d_declaraciones_tipo     d   on  d.id_dclrcn_tpo             =   b.id_dclrcn_tpo',
'    where       a.id_dclrcion_vgncia_frmlrio = :P312_ID_DCLRCION_VGNCIA_FRMLRIO;',
'    :P312_CDGO_CLNTE:= :F_CDGO_CLNTE;',
'    ',
'    :P312_ID_DCLRCION := NULL;',
'    :P312_ID_DCLRCION_V2 := NULL;',
'end;'))
,p_process_error_message=>'Problemas al consultar el impuesto asociado al formulario, #SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P312_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8875511325946849)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'calcular porcentaje a pagar impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'   select  nvl(replace(b.trfa, '','', ''.''),0) trfa',
'    into    :P312_DESCUENTO_TARIFA',
'    from    gi_d_dclrcns_esqma_trfa_tpo a',
'    join    gi_d_dclrcns_esqma_trfa     b   on  b.id_dclrcns_esqma_trfa_tpo =   a.id_dclrcns_esqma_trfa_tpo',
'    where   a.cdgo_clnte                    =       :P312_CDGO_CLNTE',
'    and     a.cdgo_dclrcns_esqma_trfa_tpo   =       ''AUT''',
'    and     b.cdgo_dclrcns_esqma_trfa       =       ''AUT''',
'    and     EXTRACT(YEAR FROM (b.fcha_hsta)) in (',
'        SELECT',
'        c.vgncia',
'    FROM',
'        gi_d_dclrcnes_tpos_vgncias c',
'    WHERE',
'            c.vgncia = EXTRACT(YEAR FROM(b.fcha_hsta))',
'        AND c.id_dclrcion_tpo_vgncia IN (',
'            SELECT',
'                d.id_dclrcion_tpo_vgncia',
'            FROM',
'                gi_d_dclrcnes_vgncias_frmlr d',
'            WHERE',
'                d.id_dclrcion_vgncia_frmlrio = :P312_ID_DCLRCION_VGNCIA_FRMLRIO',
'        ));',
'',
'end;'))
,p_process_error_message=>'Problemas al consultar el impuesto asociado al formulario, #SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P312_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7388977812419147)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Calcular  Informaci\00F3n Contribuyente')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  b.nmbre_rzon_scial,',
'            b.cdgo_idntfccion_tpo,',
'            case idntfccion_antrior',
'                when null then',
'                    a.idntfccion_sjto',
'                when a.idntfccion_sjto  then',
'                    a.idntfccion_sjto',
'            else',
'                a.idntfccion_sjto-- || '' / '' || a.idntfccion_antrior           ',
'            end idntfccion_antrior,',
'            a.drccion_ntfccion,',
'            a.tlfno,',
'            a.id_dprtmnto_ntfccion,',
'            a.id_mncpio_ntfccion,',
'            a.email',
'    into   :P312_NMBRES_RZN_SCIAL,',
'           :P312_TPO_IDENTIFICACION,',
'           :P312_IDENTIFICACION,',
'           :P312_DRCCION_NTFCCION,',
'           :P312_TELEFONO,',
'           :P312_DEPARTAMENTO,',
'           :P312_MUNICIPIO,',
'           :P312_CORREO_ELECTRONICO           ',
'    from v_si_i_sujetos_impuesto a',
'    join si_i_personas    b   on  a.id_sjto_impsto = b.id_sjto_impsto',
'    where a.IDNTFCCION_SJTO = :P312_IDNTFCCION',
'    and a.id_impsto         = :P312_ID_IMPSTO;',
'    ',
'     :P312_DIGITO_VERIFICACION := PKG_GI_DECLARACIONES_FUNCIONES.FNC_CA_DIGITO_VERIFICACION(P_IDENTIFICACION =>:P312_IDENTIFICACION);',
'    ',
'    :P312_CLCLO_CNCPTO_ANT_INTRIA_CRCIO  := 0;',
'    :P312_CLCLO_ANTERIOR_AVISOS_TBLRS  := 0;',
'    :P312_CLCLO_CNCPTO_ANT_STSA_BMRL   := 0;',
'    :P312_TOTAL_SALDO_FAVOR            := 0;',
'    :P312_CLCLO_CNCPTO_ANT_STSA_SGRD   := 0;',
'    :P312_INTERESES_MORA_PGO_ANTERIOR := 0;',
'    ',
'end;'))
,p_process_error_message=>unistr('Problemas al consultar la informaci\00F3n asociada al contribuyente, #SQLERRM_TEXT#')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P312_IDNTFCCION'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7390125455419147)
,p_process_sequence=>80
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Carga Actividades Economicas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    ',
'     if (not apex_collection.collection_exists(p_collection_name => ''ACTIVIDADES'') ) then',
'            apex_collection.create_collection( p_collection_name => ''ACTIVIDADES'');',
'     end if;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7387798094419146)
,p_process_sequence=>90
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Calcular declaraci\00F3n inicial')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_id_dclrcion_crrccion    number;',
'    v_nmro_cnsctvo            number;',
'    ',
'BEGIN',
'    --:P312_OPCION_DE_USO := ''DIN'';',
'    select pkg_gi_declaraciones_funciones.fnc_co_declaracion(p_id_dclrcion_vgncia_frmlrio => :P312_ID_DCLRCION_VGNCIA_FRMLRIO,',
'                                                             p_idntfccion                 => :P312_IDNTFCCION)',
'      into v_id_dclrcion_crrccion',
'      from dual;',
'     ',
'    if  v_id_dclrcion_crrccion > 0 then',
'       ',
'            :P312_CLCLO_DCLRCION_CRRCCION := v_id_dclrcion_crrccion;',
'',
'            select nmro_cnsctvo',
'              into v_nmro_cnsctvo',
'              from gi_g_declaraciones',
'             where id_dclrcion = :P312_CLCLO_DCLRCION_CRRCCION;',
'',
'           :P312_NMRO_DCLRCION_ANTRIOR := v_nmro_cnsctvo;',
'           --:P312_OPCION_DE_USO := ''DCO'';',
'        else',
'        ',
'           :P312_CLCLO_DCLRCION_CRRCCION := 0;',
'           :P312_NMRO_DCLRCION_ANTRIOR := 0;',
'           ',
'        end if;',
'        ',
'         if :P312_CLCLO_DCLRCION_CRRCCION > 0  and :P312_OPCION_DE_USO = ''DIN'' then',
'                :P312_OPCION_DE_USO := ''DCO'';',
'        elsif :P312_CLCLO_DCLRCION_CRRCCION = 0  and :P312_OPCION_DE_USO = ''DCO'' then',
'                :P312_OPCION_DE_USO := ''DIN'';',
'        end if;',
'    ',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P312_IDNTFCCION is not null and :P312_ID_DCLRCION_VGNCIA_FRMLRIO is not null'
,p_process_when_type=>'SQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7387330566419145)
,p_process_sequence=>100
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Calcular valor conepto anteriores'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_id_dclrcion_crrccion    number;',
'    v_nmro_cnsctvo            number;',
'    v_json_actvdds            clob ;',
'    ',
'BEGIN',
'    v_json_actvdds:= null;',
'        ',
'    v_json_actvdds := pkg_gi_declaraciones_utlddes.fnc_co_cncptos_antriores(p_id_dclrcion => :P312_CLCLO_DCLRCION_CRRCCION);',
'    ',
'    if v_json_actvdds  <> ''{"CONCEPTOS":null}'' then     ',
'        WITH extracted_data AS (',
'        SELECT',
'            nvl(jt.P312_CONCEPTO_INDUSTRIA_COMERCIO, ''0'') AS P312_CONCEPTO_INDUSTRIA_COMERCIO,',
'            nvl(jt.P312_CONCEPTO_AVISOS_TABLEROS, ''0'') AS P312_CONCEPTO_AVISOS_TABLEROS,',
'            nvl(jt.P312_CNCPTO_SBRTSA_BMBRL, ''0'') AS P312_CNCPTO_SBRTSA_BMBRL,',
'            nvl(jt.P312_TOTAL_SALDO_FAVOR, ''0'') AS P312_TOTAL_SALDO_FAVOR,',
'            nvl(jt.P312_CNCPTO_SBRTSA_SGRDD, ''0'') AS P312_CNCPTO_SBRTSA_SGRDD,',
'            nvl(jt.P312_ANTICIPO_ANIO_SIGUIENTE, ''0'') AS P312_ANTICIPO_ANIO_SIGUIENTE,',
'            nvl(jt.P312_INTERESES_MORA_PGO_ANTERIOR, ''0'') AS P312_INTERESES_MORA_PGO_ANTERIOR            ',
'        FROM JSON_TABLE(',
'            v_json_actvdds,',
'            ''$.CONCEPTOS[*]''',
'            COLUMNS (',
'                P312_CONCEPTO_INDUSTRIA_COMERCIO VARCHAR2(50) PATH ''$.P312_CONCEPTO_INDUSTRIA_COMERCIO'',',
'                P312_CONCEPTO_AVISOS_TABLEROS VARCHAR2(50) PATH ''$.P312_CONCEPTO_AVISOS_TABLEROS'',',
'                P312_CNCPTO_SBRTSA_BMBRL VARCHAR2(50) PATH ''$.P312_CNCPTO_SBRTSA_BMBRL'',',
'                P312_TOTAL_SALDO_FAVOR VARCHAR2(50) PATH ''$.P312_TOTAL_SALDO_FAVOR'',',
'                P312_CNCPTO_SBRTSA_SGRDD VARCHAR2(50) PATH ''$.P312_CNCPTO_SBRTSA_SGRDD'',',
'                P312_ANTICIPO_ANIO_SIGUIENTE    VARCHAR2(50) PATH ''$.P312_ANTICIPO_ANIO_SIGUIENTE'',',
'                P312_INTERESES_MORA_PGO_ANTERIOR  VARCHAR2(50) PATH ''$.P312_INTERESES_MORA''',
'                )',
'            ) jt',
'        )',
'        SELECT',
'            MAX(P312_CONCEPTO_INDUSTRIA_COMERCIO) AS CNCPTO_INDSTRIA_CMRCIO,',
'            MAX(P312_CONCEPTO_AVISOS_TABLEROS) AS CNCPTO_AVSOS_TBLROS,',
'            MAX(P312_CNCPTO_SBRTSA_BMBRL) AS CNCPTO_SBRTSA_BMBRIL,',
'            MAX(P312_TOTAL_SALDO_FAVOR) AS TTL_SLDO_FVOR,',
'            MAX(P312_CNCPTO_SBRTSA_SGRDD) AS CNCPTO_SBRTSA_SGRDAD,',
'            MAX(P312_INTERESES_MORA_PGO_ANTERIOR) AS INTRSES_MRA_ANT',
'           -- MAX(P312_ANTICIPO_ANIO_SIGUIENTE) AS ANTCPO_ANIO_SGNTE',
'        into ',
'            :P312_CLCLO_CNCPTO_ANT_INTRIA_CRCIO,',
'            :P312_CLCLO_ANTERIOR_AVISOS_TBLRS,',
'            :P312_CLCLO_CNCPTO_ANT_STSA_BMRL,',
'            :P312_TOTAL_SALDO_FAVOR,',
'            :P312_CLCLO_CNCPTO_ANT_STSA_SGRD,',
'            :P312_INTERESES_MORA_PGO_ANTERIOR',
'           -- :P312_MENS_ANTCPO_LIQDDO_ANIO_ANTR',
'',
'        FROM extracted_data;',
'     else ',
'        :P312_CLCLO_CNCPTO_ANT_INTRIA_CRCIO  := null;',
'        :P312_CLCLO_ANTERIOR_AVISOS_TBLRS    := null;',
'        :P312_CLCLO_CNCPTO_ANT_STSA_BMRL     := null;',
'        :P312_TOTAL_SALDO_FAVOR              := null;',
'        :P312_CLCLO_CNCPTO_ANT_STSA_SGRD     := null;',
'        :P312_INTERESES_MORA_PGO_ANTERIOR    := null;',
'   end if;',
'    ',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P312_CLCLO_DCLRCION_CRRCCION > 0'
,p_process_when_type=>'SQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7388553215419146)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_validarSujetoTributo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_prmtros        varchar2(2000) := ''validaSujetoTributo:''|| :F_CDGO_CLNTE ||'':''|| :P312_ID_DCLRCION_VGNCIA_FRMLRIO ||'':'' || :P312_IDNTFCCION;',
'    v_json           json_object_t;',
'    v_prueba         varchar2(1000);',
'begin',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'    v_json := json_object_t.parse(apex_web_service.make_rest_request(p_url          => :F_DRCCION_SRVDOR_PRVDO || ''declaraciones/gestion'',',
'                                                                     p_http_method  => ''POST'',',
'                                                                     p_parm_name    => apex_util.string_to_table(''p_accion:p_cdgo_clnte:p_id_dclrcion_vgncia_frmlrio:p_idntfccion''),',
'                                                                     p_parm_value   => apex_util.string_to_table(v_prmtros)));',
'                        ',
'    apex_json.open_object;',
'    --apex_json.write(''o_cdgo_rspsta'', v_json.get(''o_cdgo_rspsta'').to_string);',
'    --apex_json.write(''o_mnsje_rspsta'', v_json.get(''o_mnsje_rspsta'').to_string);',
'    apex_json.write(''o_cdgo_rspsta'', v_json.get_string (''o_cdgo_rspsta''));',
'    apex_json.write(''o_mnsje_rspsta'', v_json.get_string (''o_mnsje_rspsta''));',
'    apex_json.close_object;',
'                                                                     ',
'    exception',
'        when others then',
'            apex_json.open_object;',
'            apex_json.write(''o_cdgo_rspsta'', 100);',
'            apex_json.write(''o_mnsje_rspsta'', ''<details>'' ||  ',
unistr('													''<summary>'' || ''No fue posible validar la identificaci\00F3n del declarante, '' ||'),
'													''por favor intente nuevamente.</summary>'' ||',
'													''<p>'' || ''El servicio no pudo ser gestionado.'' || ''</p>'' ||',
'											  ''</details>'' || sqlerrm);',
'            apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7390524589419148)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_calculo_item'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_prmtros        varchar2(2000) := ''validaSujetoTributo:''|| :F_CDGO_CLNTE ||'':''|| :P312_ID_DCLRCION_VGNCIA_FRMLRIO ||'':'' || :P312_IDNTFCCION;',
'    v_json           json_object_t;',
'    v_prueba         varchar2(1000);',
'begin',
'        declare ',
'            v_cdgo_rspsta     number := 0;',
'            v_mnsje_rspsta    varchar(1000) := ''ok'';',
'            v_exception       exception;',
'            v_json            clob ;',
'            v_json_result     clob ;',
'            v_vlor_ttal       number := 0;',
'            v_vlor_sldo_fvor  number := 0;',
'        begin',
'',
'            for i in 1..apex_application.g_f01.count loop',
'                v_json := v_json || apex_application.g_f01(i);',
'            end loop;',
'            v_vlor_ttal     := apex_application.g_x01;',
'            v_vlor_sldo_fvor := apex_application.g_x02;',
'',
'           v_json_result := pkg_gi_declaraciones_funciones_2.fnc_cl_valor_concepto( p_cdgo_clnte                   => :F_CDGO_CLNTE,',
'                                                                                    p_id_dclrcion_vgncia_frmlrio   => :P312_ID_DCLRCION_VGNCIA_FRMLRIO,',
'                                                                                    p_idntfccion                   => :P312_IDNTFCCION,',
'                                                                                    p_id_dclrcion_crrccion         => :P312_CLCLO_DCLRCION_CRRCCION,',
'                                                                                    p_id_sjto_tpo                  => :P312_CLASIFICACION,',
'                                                                                    p_fcha_pryccion                => :P312_FCHA_MAXIMA_PRSNTCION,--',
'                                                                                    p_cdgo_sncion_tpo              => :P312_TIPO_SANCION,--''EXT'',',
'                                                                                    p_cdgo_dclrcion_uso            => :P312_OPCION_DE_USO, --''DIN'',',
'                                                                                    p_id_dclrcion_incial           => :P312_CLCLO_DCLRCION_CRRCCION,',
'                                                                                    p_impsto_crgo                  => :P312_TOTAL_SALDO_CARGO,--:P310_TOTAL_IMPUESTO_CARGO,',
'                                                                                    p_ingrsos_brtos                => 0,',
'                                                                                    p_saldo_favor                  => v_vlor_sldo_fvor,--:P310_TOTAL_SALDO_FAVOR,',
'                                                                                    p_vlor_ttal                    => v_vlor_ttal,--:P310_TOTAL_SALDO_CARGO,',
'                                                                                    p_json                         => v_json);',
'',
'',
'               -- insert into muerto (v_001,c_001,t_001)values(''JSON: '',v_json,sysdate); commit;',
'                insert into muerto (v_001,c_001,t_001)values(''v_json_result: ''||:P312_FCHA_MAXIMA_PRSNTCION ,v_json_result,sysdate); commit;',
'',
'                apex_json.open_object;',
'                --apex_json.write(''o_cdgo_rspsta'', v_json.get(''o_cdgo_rspsta'').to_string);',
'                --apex_json.write(''o_mnsje_rspsta'', v_json.get(''o_mnsje_rspsta'').to_string);',
'                apex_json.write(''o_json'', v_json_result);',
'',
'                apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'',
'                apex_json.write(''o_mnsje_rspsta'',v_mnsje_rspsta);',
'                apex_json.close_object;',
'',
'        exception',
'                when others then',
'                    apex_json.open_object;',
'                    apex_json.write(''o_cdgo_rspsta'', 100);',
'                    apex_json.write(''o_mnsje_rspsta'', ''<details>'' ||  ',
'                                                            ''<summary>'' || ''No fue posible realizar los calculos de los items, '' ||',
'                                                            ''por favor intente nuevamente.</summary>'' ||',
'                                                            ''<p>'' || ''El servicio no pudo ser gestionado.'' || ''</p>'' ||',
'                                                      ''</details>'' || sqlerrm);',
'                    apex_json.close_object;',
'        end;',
'',
'    ',
'    ',
'        apex_json.open_object;',
'        --apex_json.write(''o_cdgo_rspsta'', v_json.get(''o_cdgo_rspsta'').to_string);',
'        --apex_json.write(''o_mnsje_rspsta'', v_json.get(''o_mnsje_rspsta'').to_string);',
'        apex_json.write(''o_cdgo_rspsta'', v_json.get_string (''o_cdgo_rspsta''));',
'        apex_json.write(''o_mnsje_rspsta'', v_json.get_string (''o_mnsje_rspsta''));',
'        apex_json.close_object;',
'                                                                     ',
'    exception',
'        when others then',
'            apex_json.open_object;',
'            apex_json.write(''o_cdgo_rspsta'', 100);',
'            apex_json.write(''o_mnsje_rspsta'', ''<details>'' ||  ',
unistr('													''<summary>'' || ''No fue posible validar la identificaci\00F3n del declarante, '' ||'),
'													''por favor intente nuevamente.</summary>'' ||',
'													''<p>'' || ''El servicio no pudo ser gestionado.'' || ''</p>'' ||',
'											  ''</details>'' || sqlerrm);',
'            apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7386558399419145)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_actividades'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_prncpal               number;',
'    v_rgstros               number;',
'    v_nmbre_actvdad         varchar2(200);',
'    ',
'    v_exception     exception;',
'begin',
'',
'         ',
'        if (not apex_collection.collection_exists(p_collection_name => ''ACTIVIDADES'') ) then',
'            apex_collection.create_collection( p_collection_name => ''ACTIVIDADES'');',
'        end if;',
'        ',
'         if :P312_ACTIVIDAD is null then ',
'                  raise v_exception;',
'         end if;',
'  ',
'          -- Se valida si la Actividad ya esta registrada',
'        begin',
'            begin',
'                select count(a.n003), ',
'                        a.c001',
'                  into v_rgstros,',
'                       v_nmbre_actvdad',
'                 from apex_collections   a',
'                 where collection_name   = ''ACTIVIDADES''',
'                   and a.n003            = :P312_ACTIVIDAD',
'                   group by a.n003, a.c001;',
'                   ',
'                    ',
'              exception ',
'                  when no_data_found then',
'                        begin',
'                            apex_collection.add_member(p_collection_name 	=> ''ACTIVIDADES''',
'                                                     , p_n003               => :P312_ACTIVIDAD',
'                                                     , p_n004               => :P312_TARIFA',
'                                                     , p_n005               => :P312_INGRESOS_GRAVADOS',
'                                                     , p_n001				=> :P312_VLOR_IPSTO',
'                                                     , p_c001               => :P312_ACTIVIDAD_DESCRIPCION);',
'                        end;                     ',
'',
'                            apex_json.open_object;',
'                            --apex_json.write(''o_cdgo_rspsta'', v_json.get(''o_cdgo_rspsta'').to_string);',
'                            --apex_json.write(''o_mnsje_rspsta'', v_json.get(''o_mnsje_rspsta'').to_string);',
'                           -- apex_json.write(''o_json'', v_json_result);',
'',
'                            apex_json.write(''o_cdgo_rspsta'', 0);',
'                            apex_json.write(''o_mnsje_rspsta'',''ok'');',
'                            apex_json.close_object;',
'                  ',
'                when others then',
'                   null;',
'               end;',
'        ',
'             if v_rgstros > 0 then',
'                        raise v_exception;',
'                        --raise_application_error(-20001, ''Sr(a). '' || :F_NMBRE_USRIO || '', la Actividad ''||v_rgstros||'' ya se encuentra agregada. Por favor valide e intente nuevamente'');  ',
'             end if;',
'                  ',
'        end;-- FIN Se valida si la Actividad ya esta registrada      ',
'          ',
'       ',
'                                                                     ',
'    exception',
'        when v_exception then',
'          apex_json.open_object;',
'            if :P312_ACTIVIDAD is null then            ',
'                apex_json.write(''o_cdgo_rspsta'', 100);',
'                apex_json.write(''o_mnsje_rspsta'', ''<details>'' ||  ',
'                                                        ''<summary>'' ||  ''Sr(a). '' || :F_NMBRE_USRIO || '', el campo ACTIVIDAD ''||',
'                                                            ''<p>''',
unistr('                                                                  ||''est\00E1 vac\00EDo. Por favor valide e intente nuevamente.</summary>''||											'),
'                                                            ''<p>'' ||',
'                                                   ''</details>'' );',
'            end if;',
'            ',
'            if v_rgstros > 0 then            ',
'                apex_json.write(''o_cdgo_rspsta'', 100);',
'                apex_json.write(''o_mnsje_rspsta'', ''<details>'' ||  ',
'                                                        ''<summary>'' ||  ''Sr(a). '' || :F_NMBRE_USRIO || '', la Actividad: ''||',
'                                                            ''<p>'' ||v_nmbre_actvdad || ''<p>''',
'                                                                  ||''Ya se encuentra agregada. Por favor valide e intente nuevamente.</summary>''||											',
'                                                            ''<p>'' ||',
'                                                   ''</details>'' );',
'            end if;',
'            apex_json.close_object;',
'        when others then',
'            apex_json.open_object;',
'            apex_json.write(''o_cdgo_rspsta'', 100);',
'            apex_json.write(''o_mnsje_rspsta'', ''<details>'' ||  ',
unistr('													''<summary>'' ||  ''Sr(a). '' || :F_NMBRE_USRIO || '', No se pudo registrar la actividad econ\00F3mica: ''||  ''<p>'' '),
'                                                              ||''Ya se encuentra agregada. Por favor valide e intente nuevamente.</summary>''||											',
'                                                        ''<p>'' ||',
'                                               ''</details>''|| sqlerrm );',
'            apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7386993291419145)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_eliminar_Actividad'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_exste boolean;',
'    v_cntdad number;',
'    ',
'    v_prncpal               number;',
'    v_rgstros               number;',
'begin',
'',
unistr('    -- Determinamos si la colecci\00F2n existe'),
'    if APEX_COLLECTION.COLLECTION_EXISTS(''ACTIVIDADES'') then ',
'    ',
'        select count(1) into v_cntdad',
'        from APEX_COLLECTIONS',
'        where collection_name = ''ACTIVIDADES''',
'        and seq_id = :P312_SEQ_ID;',
'',
'        if v_cntdad > 0 then',
'            APEX_COLLECTION.DELETE_MEMBER(p_collection_name => ''ACTIVIDADES'',',
'                                          p_seq => :P312_SEQ_ID); ',
'        else',
'             raise_application_error(-20003, ''Sr(a). '' || :F_NMBRE_USRIO || '', la Actividad no se encuentra agregada. Por favor valide e intente nuevamente'');  ',
'        end if;',
'',
'    end if;                   ',
'',
'    apex_json.open_object;',
'    --apex_json.write(''o_cdgo_rspsta'', v_json.get(''o_cdgo_rspsta'').to_string);',
'    --apex_json.write(''o_mnsje_rspsta'', v_json.get(''o_mnsje_rspsta'').to_string);',
'   -- apex_json.write(''o_json'', v_json_result);',
'    ',
'    apex_json.write(''o_cdgo_rspsta'', 0);',
'    apex_json.write(''o_mnsje_rspsta'',''ok'');',
'    apex_json.close_object;',
'                                                                     ',
'    exception',
'        when others then',
'            apex_json.open_object;',
'            apex_json.write(''o_cdgo_rspsta'', 100);',
'            apex_json.write(''o_mnsje_rspsta'', ''<details>'' ||  ',
'													''<summary>'' || ''No fue posible eliminar, '' ||',
'													''por favor intente nuevamente.</summary>'' ||',
'													''<p>'' || ''El servicio no pudo ser gestionado.'' || ''</p>'' ||',
'											  ''</details>'' || sqlerrm);',
'            apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7390964918419148)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'redondear'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    ',
'    v_json           json_object_t;',
'    v_prueba         varchar2(1000);',
'     valor_rendondeo    number;',
'    v_cdgo_rspsta     number := 0;',
'    v_mnsje_rspsta    varchar(1000) := ''ok'';',
'    v_exception       exception;',
'    vlor_trfa            number := apex_application.g_x01;',
'    vlor_ingrsos_gravdos number := apex_application.g_x02;',
'',
'begin',
'    ',
'            select  round(vlor_ingrsos_gravdos, -3)',
'            into     valor_rendondeo',
'            from dual;',
'        ',
'',
' ',
'        apex_json.open_object;',
'       ',
'        apex_json.write(''o_valor_rendondeo'', valor_rendondeo);',
'        apex_json.write(''o_cdgo_rspsta'', 0);',
'        apex_json.write(''o_mnsje_rspsta'',''ok'');',
'        apex_json.close_object;',
'',
'       ',
'    ',
'  ',
'                                                                     ',
'    exception',
'        when others then',
'            apex_json.open_object;',
'            apex_json.write(''o_cdgo_rspsta'', 100);',
'            apex_json.write(''o_mnsje_rspsta'', ''<details>'' ||  ',
unistr('													''<summary>'' || ''No fue posible validar la identificaci\00F3n del declarante, '' ||'),
'													''por favor intente nuevamente.</summary>'' ||',
'													''<p>'' || ''El servicio no pudo ser gestionado.'' || ''</p>'' ||',
'											  ''</details>'' || sqlerrm);',
'            apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
end;
/
