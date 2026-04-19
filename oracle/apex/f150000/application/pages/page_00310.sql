prompt --application/pages/page_00310
begin
wwv_flow_api.create_page(
 p_id=>310
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Formulario Anual'
,p_alias=>'DL_FRM_ICA_ANUAL_V2020'
,p_step_title=>'Formulario Anual'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1',
'#IMAGE_PREFIX#javascript/infortributos/js/accounting.min.js',
'#IMAGE_PREFIX#javascript/infortributos/Declaraciones/formularioDeclaracionV2.js?v=0011',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js',
''))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
unistr('var pageId = &APP_PAGE_ID.;  // Extrae el n\00FAmero de la pagina.'),
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
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'',
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
'',
'            const promises = records.map((data) => {               ',
'                seq = model.getValue(data, "SEQ_ID");',
'                apex.item(''P'' + pageId + ''_SEQ_ID'').setValue(seq);',
'               // return model.setValue(data, "VLOR_IPSTO", redondearAlMultiploDeMil(vlor_impuesto));',
'            });',
'',
'            Promise.all(promises).then(() => {',
'            }).catch((error) => {',
'                console.error("Error al actualizar valores de impuesto:", error);',
'            });',
'        }',
'    }    ',
'}',
'',
'',
'async function eliminarActividad(p_seq_id){',
'    let $waitPopup = apex.widget.waitPopup();',
'    try{',
'        apex.item(''P'' + pageId + ''_SEQ_ID'').setValue(p_seq_id);',
'        await apex.server.process ( "ajax_eliminar_Actividad", {',
'            pageItems: "#P310_SEQ_ID"   ',
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
'                    apex.region("actividad").refresh();                      ',
'                    apex.message.showPageSuccess("Actividad eliminada.");',
'                    setTimeout(function() {',
'                          calculoActividadesGravadas();',
'                         $(''.t-Alert--success'').fadeOut(''slow'');         ',
'                    }, 1000);',
'                }',
'            }',
'        })',
'     ',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        $waitPopup.remove();',
'    }',
'};',
'',
'',
'function habilitarItems(){',
' //OPCIONES DE USO    ',
'apex.item( ''P'' + pageId + ''_ITEMS_FECHA'').show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DCLRCION_CRRCCION'').show();',
'apex.item( ''P'' + pageId + ''_CLCLA_FCHA_PRSNTCION_FINAL'').show();    ',
'apex.item( ''P'' + pageId + ''_JSON_ITEM'' ).setValue(''N'');',
'apex.item( ''P'' + pageId + ''_JSON_VALORES'' ).setValue(''N'');',
unistr('//INFORMACI\00D3N CONTRIBUYENTE    '),
'apex.item( ''P'' + pageId + ''_TPO_IDENTIFICACION'' ).enable();',
'apex.item( ''P'' + pageId + ''_IDENTIFICACION'' ).enable();',
'apex.item( ''P'' + pageId + ''_DIGITO_VERIFICACION'' ).enable();',
'apex.item( ''P'' + pageId + ''_SOBRETASA_BOMBERIL_TRFA'' ).show();',
'//ACTIVIDADES GRAVADAS',
'apex.item( ''P'' + pageId + ''_JSON_ACTVDDES'' ).show();',
unistr('//LIQUIDACI\00D3N PRIVADA'),
'apex.item( ''P'' + pageId + ''_CLCLO_CNCPTO_INDSTRIA_CMRCIO''  ).show();',
'apex.item( ''P'' + pageId + ''_CONCEPTO_INDUSTRIA_COMERCIO''   ).show();',
'apex.item( ''P'' + pageId + ''_SLDO_FVR_CNCPTO_INTRIA_CMRCIO'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_CNCPTO_ANT_INTRIA_CRCIO'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DFCIA_PGO_INTRIA_CMRCIO'' ).show();',
'apex.item( ''P'' + pageId + ''_VALOR_PAGO_INDUSTRIA_COMERCIO'' ).show();',
'apex.item( ''P'' + pageId + ''_CALCULO_DSCNTO_INTRIA_CMRCIO''  ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_INTRIA_CRCIO'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_SLDO_FVR_PGO_INTRIA_CCIO'').show();',
'apex.item( ''P'' + pageId + ''_CALCULO_INTRSS_INTRIA_CMRCIO''  ).show();',
'',
'apex.item( ''P'' + pageId + ''_SALDO_FAVOR_AVISOS_TABLEROS'' ).show();',
'apex.item( ''P'' + pageId + ''_CONCEPTO_AVISOS_TABLEROS'' ).show();',
'apex.item( ''P'' + pageId + ''_DIFERENCIA_AVISOS_TABLEROS'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_ANTERIOR_AVISOS_TBLRS'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DFCIA_PGO_AVSS_TBLRS'' ).show();',
'apex.item( ''P'' + pageId + ''_VLR_PAGO_AVISOS_TABLEROS'' ).show();',
'',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_AVSS_TBLRS'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_INTRSS_AVSS_TBLRS'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_AVSS_TBS'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_SLDO_FVR_PGO_AVSS_TBS'' ).show();',
'',
'apex.item( ''P'' + pageId + ''_SLDO_FVR_CNPTO_SBTSA_BMRL'' ).show();',
'apex.item( ''P'' + pageId + ''_DFRNCIA_CNCPTO_SBTSA_BMRL'' ).show();',
'apex.item( ''P'' + pageId + ''_CNCPTO_SBRTSA_BMBRL'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_CNCPTO_ANT_STSA_BMRL'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DIF_PGO_STSA_BMRL'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_VLR_PGO_STSA_BMRL'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_STSA_BMRL'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_INTRSES_STSA_BMRL'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_STSA_BMRL'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_SLDO_FVR_PGO_STSA_BMRL'' ).show();',
'',
'apex.item( ''P'' + pageId + ''_CNCPTO_SBRTSA_SGRDD'' ).show();',
'apex.item( ''P'' + pageId + ''_DFRNCIA_CNCPTO_STSA_SGRD'' ).show();',
'apex.item( ''P'' + pageId + ''_SLDO_FVR_CNCPTO_STSA_SGRD'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_CNCPTO_ANT_STSA_SGRD'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DIF_PGO_STSA_SGRD'' ).show();',
'apex.item( ''P'' + pageId + ''_CALCULO_PGO_STSA_SGRD'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_STSA_SGRD'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_INTRSES_STSA_SGRD'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_STSA_SGRD'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_SLDO_FVR_PGO_STSA_SGRD'' ).show();',
'',
'apex.item( ''P'' + pageId + ''_SLDO_FVR_CNCPTO_ANTCPO'' ).show();',
'apex.item( ''P'' + pageId + ''_DFRNCIA_CNCPTO_ANTCPO'' ).show();',
'apex.item( ''P'' + pageId + ''_VALOR_CONCEPTO_ANTICIPO'' ).show();',
'apex.item( ''P'' + pageId + ''_CALCULO_INTERES_ANTICIPO'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_CNCPTO_ANT_ANTICIPO'' ).show();',
'apex.item( ''P'' + pageId + ''_CALCULO_PGO_ANTICIPO'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DIF_PGO_ANTICIPO'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_ANTICIPO'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_SLDO_FVR_PGO_ANTICIPO'' ).show();',
'    ',
'apex.item( ''P'' + pageId + ''_CLCLO_IMPSTO_CRGO_SNCION'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_NETO_SANCION'' ).show();',
'apex.item( ''P'' + pageId + ''_SANCION_SELECCIONADA'' ).show();',
'apex.item( ''P'' + pageId + ''_DIFERENCIA_CNCPTO_SNCION'' ).show();',
'apex.item( ''P'' + pageId + ''_CALCULO_DFRNCIA_PGO_SNCION'' ).show();',
'apex.item( ''P'' + pageId + ''_VALOR_CONCEPTO_SANCION'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DESCUENTO_SANCION'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_SLDO_FVR_PGO_SNCION'' ).show();',
'apex.item( ''P'' + pageId + ''_MENOS_SLDO_FVR_PRDO_ANTRIOR'' ).show();',
'apex.item( ''P'' + pageId + ''_CALCULO_TOTAL_SALDO_CARGO'' ).show();',
'apex.item( ''P'' + pageId + ''_ITEM_CERO'' ).show();',
unistr('//regi\00F3n Base gravable'),
'apex.item( ''P'' + pageId + ''_TTL_INGRS_ORIOS_EXTRS_PAIS'' ).enable();',
'apex.item( ''P'' + pageId + ''_TTL_INGRS_ORIOS_EXTRS_MNCPIO'' ).enable();',
'apex.item( ''P'' + pageId + ''_TOTAL_INGRESOS_GRVBLES'' ).enable();',
unistr('//regi\00F3n Activdades'),
'apex.item( ''P'' + pageId + ''_TOTAL_INGRESOS_GRAVADS'' ).enable();',
'apex.item( ''P'' + pageId + ''_TOTAL_IMPUESTO'' ).enable();',
'apex.item( ''P'' + pageId + ''_IMPUESTO_LEY'' ).enable();',
unistr('//region liquidaci\00F3n privada'),
'apex.item( ''P'' + pageId + ''_TTL_IMPSTO_INDSTRIA_CMRCIO'' ).enable();	',
'apex.item( ''P'' + pageId + ''_TOTAL_IMPUESTO_CARGO'' ).enable();	',
'apex.item( ''P'' + pageId + ''_IMPUESTO_AVISOS_TABLEROS'').enable();',
'apex.item( ''P'' + pageId + ''_SOBRETASA_BOMBERIL'').enable();',
'apex.item( ''P'' + pageId + ''_SOBRETASA_SEGURIDAD'').enable();',
'apex.item( ''P'' + pageId + ''_ANTICIPO_ANIO_SIGUIENTE'').enable();',
'apex.item( ''P'' + pageId + ''_SANCION_SUGERIDA'' ).enable();',
'apex.item( ''P'' + pageId + ''_TOTAL_SALDO_CARGO'' ).enable();',
'apex.item( ''P'' + pageId + ''_TOTAL_SALDO_FAVOR'' ).enable();			 ',
'//region PAGO                                ',
'//apex.item( "P310_VALOR_PAGAR" ).enable();',
'apex.item( ''P'' + pageId + ''_DESCUENTO_PRONTO_PAGO'' ).enable();',
'apex.item( ''P'' + pageId + ''_INTERESES_MORA'' ).enable();',
'apex.item( ''P'' + pageId + ''_TOTAL_PAGAR'' ).enable(); ',
'apex.item( ''P'' + pageId + ''_VALOR_PAGAR'' ).enable();',
'apex.item( ''P'' + pageId + ''_TOTAL_PAGAR_PAGO_VOLUNTARIO'' ).enable();',
'//apex.item( ''P'' + pageId + ''_APORTE_VOLUNTARIO'' ).setValue(''N'');',
'apex.item( ''P'' + pageId + ''_TARIFA'' ).enable();',
'apex.item( ''P'' + pageId + ''_TOTAL_PAGAR_PAGO_VOLUNTARIO'' ).enable();',
'',
'apex.item( ''P'' + pageId + ''_TPO_IDNTFCCION_DCLRNTE_FRMA'' ).enable();',
'apex.item( ''P'' + pageId + ''_IDNTFCCION_RPRSNTNTE'' ).enable();',
'apex.item( ''P'' + pageId + ''_TPO_IDENTIFICACION_REVISOR'' ).enable();',
'apex.item( ''P'' + pageId + ''_IDENTIFICACION_REVISOR'' ).enable(); ',
'apex.item( ''P'' + pageId + ''_CALCULO_VALOR_PAGAR_BANCOS'').show();',
'apex.item( ''P'' + pageId + ''_CALCULO_VALOR_PAGAR_BANCOS'').enable();',
'   ',
' document.addEventListener(''keydown'', function(event) {',
'        if (event.key === "Escape" || event.keyCode === 27) {',
unistr('           // event.preventDefault(); // Evita que "Esc" cancele el env\00EDo'),
'            deshabilitarItems(); ',
'           // console.log("Tecla Esc deshabilitada.");',
'        }',
'    });   ',
' ',
'}',
'',
'function deshabilitarItems() {   ',
'apex.item( ''P'' + pageId + ''_ID_DCLRCION_V2'').hide();',
'apex.item( ''P'' + pageId + ''_ID_DCLRCION'').hide();',
'apex.item( ''P'' + pageId + ''_NMBRE_RSPNS_FRMA'').hide();',
'apex.item( ''P'' + pageId + ''_ID_PAGE'').hide();',
' //OPCIONES DE USO    ',
'apex.item( ''P'' + pageId + ''_ITEMS_FECHA'').hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DCLRCION_CRRCCION'').hide();',
'apex.item( ''P'' + pageId + ''_CLCLA_FCHA_PRSNTCION_FINAL'').hide();    ',
'apex.item( ''P'' + pageId + ''_JSON_ITEM'' ).hide();',
'apex.item( ''P'' + pageId + ''_JSON_VALORES'' ).hide();  ',
unistr('//INFORMACI\00D3N CONTRIBUYENTE    '),
'apex.item( ''P'' + pageId + ''_TPO_IDENTIFICACION'' ).disable();',
'apex.item( ''P'' + pageId + ''_IDENTIFICACION'' ).disable();',
'apex.item( ''P'' + pageId + ''_DIGITO_VERIFICACION'' ).disable();',
'apex.item( ''P'' + pageId + ''_SOBRETASA_BOMBERIL_TRFA'' ).hide();',
'//ACTIVIDADES GRAVADAS',
'apex.item( ''P'' + pageId + ''_JSON_ACTVDDES'' ).hide();',
unistr('//LIQUIDACI\00D3N PRIVADA'),
'apex.item( ''P'' + pageId + ''_CLCLO_CNCPTO_INDSTRIA_CMRCIO''  ).hide();',
'apex.item( ''P'' + pageId + ''_CONCEPTO_INDUSTRIA_COMERCIO''   ).hide();',
'apex.item( ''P'' + pageId + ''_SLDO_FVR_CNCPTO_INTRIA_CMRCIO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_CNCPTO_ANT_INTRIA_CRCIO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DFCIA_PGO_INTRIA_CMRCIO'' ).hide();',
'apex.item( ''P'' + pageId + ''_VALOR_PAGO_INDUSTRIA_COMERCIO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CALCULO_DSCNTO_INTRIA_CMRCIO''  ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_INTRIA_CRCIO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_SLDO_FVR_PGO_INTRIA_CCIO'').hide();',
'apex.item( ''P'' + pageId + ''_CALCULO_INTRSS_INTRIA_CMRCIO''  ).hide();',
'',
'apex.item( ''P'' + pageId + ''_SALDO_FAVOR_AVISOS_TABLEROS'' ).hide();',
'apex.item( ''P'' + pageId + ''_CONCEPTO_AVISOS_TABLEROS'' ).hide();',
'apex.item( ''P'' + pageId + ''_DIFERENCIA_AVISOS_TABLEROS'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_ANTERIOR_AVISOS_TBLRS'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DFCIA_PGO_AVSS_TBLRS'' ).hide();',
'apex.item( ''P'' + pageId + ''_VLR_PAGO_AVISOS_TABLEROS'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_AVSS_TBLRS'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_INTRSS_AVSS_TBLRS'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_AVSS_TBS'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_SLDO_FVR_PGO_AVSS_TBS'' ).hide();',
'apex.item( ''P'' + pageId + ''_SLDO_FVR_CNPTO_SBTSA_BMRL'' ).hide();',
'apex.item( ''P'' + pageId + ''_DFRNCIA_CNCPTO_SBTSA_BMRL'' ).hide();',
'apex.item( ''P'' + pageId + ''_CNCPTO_SBRTSA_BMBRL'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_CNCPTO_ANT_STSA_BMRL'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DIF_PGO_STSA_BMRL'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_VLR_PGO_STSA_BMRL'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_STSA_BMRL'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_INTRSES_STSA_BMRL'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_STSA_BMRL'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_SLDO_FVR_PGO_STSA_BMRL'' ).hide();',
'apex.item( ''P'' + pageId + ''_CNCPTO_SBRTSA_SGRDD'' ).hide();',
'apex.item( ''P'' + pageId + ''_DFRNCIA_CNCPTO_STSA_SGRD'' ).hide();',
'apex.item( ''P'' + pageId + ''_SLDO_FVR_CNCPTO_STSA_SGRD'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_CNCPTO_ANT_STSA_SGRD'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DIF_PGO_STSA_SGRD'' ).hide();',
'apex.item( ''P'' + pageId + ''_CALCULO_PGO_STSA_SGRD'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_STSA_SGRD'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_INTRSES_STSA_SGRD'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_STSA_SGRD'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_SLDO_FVR_PGO_STSA_SGRD'' ).hide();',
'apex.item( ''P'' + pageId + ''_SLDO_FVR_CNCPTO_ANTCPO'' ).hide();',
'apex.item( ''P'' + pageId + ''_DFRNCIA_CNCPTO_ANTCPO'' ).hide();',
'apex.item( ''P'' + pageId + ''_VALOR_CONCEPTO_ANTICIPO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CALCULO_INTERES_ANTICIPO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_CNCPTO_ANT_ANTICIPO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CALCULO_PGO_ANTICIPO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DIF_PGO_ANTICIPO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_ANTICIPO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_SLDO_FVR_PGO_ANTICIPO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_IMPSTO_CRGO_SNCION'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_NETO_SANCION'' ).hide();',
'apex.item( ''P'' + pageId + ''_SANCION_SELECCIONADA'' ).hide();',
'apex.item( ''P'' + pageId + ''_DIFERENCIA_CNCPTO_SNCION'' ).hide();',
'apex.item( ''P'' + pageId + ''_CALCULO_DFRNCIA_PGO_SNCION'' ).hide();',
'apex.item( ''P'' + pageId + ''_VALOR_CONCEPTO_SANCION'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DESCUENTO_SANCION'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_SLDO_FVR_PGO_SNCION'' ).hide();',
'//apex.item( ''P'' + pageId + ''_MENOS_SLDO_FVR_PRDO_ANTRIOR'' ).hide();ITEM 32',
'apex.item( ''P'' + pageId + ''_CALCULO_TOTAL_SALDO_CARGO'' ).hide();',
'apex.item( ''P'' + pageId + ''_ITEM_CERO'' ).hide();',
'//apex.item( ''P'' + pageId + ''_ETIQUETA'' ).hide();',
'apex.item( ''P'' + pageId + ''_SANCION_MANUAL'').hide();',
unistr('//regi\00F3n Base gravable'),
'apex.item( ''P'' + pageId + ''_TTL_INGRS_ORIOS_EXTRS_PAIS'' ).disable();',
'apex.item( ''P'' + pageId + ''_TTL_INGRS_ORIOS_EXTRS_MNCPIO'' ).disable();',
'apex.item( ''P'' + pageId + ''_TOTAL_INGRESOS_GRVBLES'' ).disable();',
unistr('//regi\00F3n Activdades'),
'apex.item( ''P'' + pageId + ''_TOTAL_INGRESOS_GRAVADS'' ).disable();',
'apex.item( ''P'' + pageId + ''_TOTAL_IMPUESTO'' ).disable();',
'apex.item( ''P'' + pageId + ''_IMPUESTO_LEY'' ).disable();',
unistr('//region liquidaci\00F3n privada'),
'apex.item( ''P'' + pageId + ''_TTL_IMPSTO_INDSTRIA_CMRCIO'' ).disable();	',
'apex.item( ''P'' + pageId + ''_TOTAL_IMPUESTO_CARGO'' ).disable();	',
'apex.item( ''P'' + pageId + ''_IMPUESTO_AVISOS_TABLEROS'').disable();',
'apex.item( ''P'' + pageId + ''_SOBRETASA_BOMBERIL'').disable();',
'apex.item( ''P'' + pageId + ''_SOBRETASA_SEGURIDAD'').disable();',
'apex.item( ''P'' + pageId + ''_ANTICIPO_ANIO_SIGUIENTE'').disable();',
'apex.item( ''P'' + pageId + ''_SANCION_SUGERIDA'' ).disable();',
'apex.item( ''P'' + pageId + ''_TOTAL_SALDO_CARGO'' ).disable();',
'apex.item( ''P'' + pageId + ''_TOTAL_SALDO_FAVOR'' ).disable();			 ',
'//region PAGO                                ',
'//apex.item( "P310_VALOR_PAGAR" ).disable();',
'apex.item( ''P'' + pageId + ''_DESCUENTO_PRONTO_PAGO'' ).disable();',
'apex.item( ''P'' + pageId + ''_INTERESES_MORA'' ).disable();',
'apex.item( ''P'' + pageId + ''_TOTAL_PAGAR'' ).disable(); ',
'apex.item( ''P'' + pageId + ''_VALOR_PAGAR'' ).disable();',
'apex.item( ''P'' + pageId + ''_APORTE_VOLUNTARIO'' ).hide();  ',
'apex.item( ''P'' + pageId + ''_VALOR_PAGO_VOLUNTARIO'' ).hide(); ',
'apex.item( ''P'' + pageId + ''_DESTINO_APORTE_VOLUNTARIO'' ).hide(); ',
'apex.item( ''P'' + pageId + ''_TOTAL_PAGAR_PAGO_VOLUNTARIO'' ).hide();',
'//apex.item( ''P'' + pageId + ''_APORTE_VOLUNTARIO'' ).setValue(''N'');',
'apex.item( ''P'' + pageId + ''_TPO_IDNTFCCION_DCLRNTE_FRMA'' ).disable();',
'apex.item( ''P'' + pageId + ''_IDNTFCCION_RPRSNTNTE'' ).disable();',
'apex.item( ''P'' + pageId + ''_TPO_IDENTIFICACION_REVISOR'' ).disable();',
'apex.item( ''P'' + pageId + ''_IDENTIFICACION_REVISOR'' ).disable();',
'apex.item( ''P'' + pageId + ''_TARIFA'' ).disable();',
'apex.item( ''P'' + pageId + ''_ETIQUETA_PRINCIPAL'').hide();',
'apex.item( ''P'' + pageId + ''_ETIQUETA_SECUNDARIA'').hide();',
'apex.item( ''P'' + pageId + ''_CALCULO_VALOR_PAGAR_BANCOS'').hide();',
'};',
'',
'',
'function calculoTotalActividades() {',
'    var region = apex.region(''actividad'');',
'    var v_total_ingresos_gravados = 0;',
'    var v_total_impuesto = 0;',
'    if (region) {',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = model._data.filter(function (f) { return f.TRFA !== ''''});',
'',
'        records.forEach((actividad) => {',
'            var v_ingresos_gravados = parseFloat(accounting.unformat(model.getValue(actividad, "VLOR_IGRSOS_GRVDOS"), ","));',
'            var v_impuesto = parseFloat(accounting.unformat(model.getValue(actividad, "VLOR_IPSTO"), ","));',
'',
'            if (!isNaN(v_ingresos_gravados)) {',
'                v_total_ingresos_gravados += v_ingresos_gravados;',
'                v_total_impuesto += v_impuesto;',
'            }',
'        });',
'',
'        v_total_ingresos_gravados = v_total_ingresos_gravados ?? 0;',
'        v_total_impuesto = v_total_impuesto ?? 0;',
'       // console.log(''P''+pageId+''_TOTAL_IMPUESTO => '' + parseFloat(v_total_impuesto));',
'         var v_generacion_energia         =  parseFloat(apex.item(''P''+pageId+''_GENERACION_ENERGIA'').getValue())?? 0;',
'         var ttal_impuesto_ley            =   redondearAlMultiploDeMil(parseFloat(v_generacion_energia) * 618.2) ;',
'        ',
'        apex.item(''P''+pageId+''_IMPUESTO_LEY'').setValue(parseFloat(ttal_impuesto_ley) || 0);',
unistr('      //var impuesto_ley = parseFloat(apex.item(''P''+pageId+''_IMPUESTO_LEY'').getValue()) ?? 0;   // Consulta el valor del items \00BFAvisos y tableros?'),
'        apex.item(''P''+pageId+''_TOTAL_INGRESOS_GRAVADS'').setValue(parseFloat(v_total_ingresos_gravados));',
'        apex.item(''P''+pageId+''_TOTAL_IMPUESTO'').setValue(parseFloat(v_total_impuesto));',
'        ',
'        var cncla_estblcmnto = apex.item(''P''+pageId+''_CNCLCION_ESTBLCMIENTO'').getValue();',
'        var es_agnt_autrtndr = apex.item(''P''+pageId+''_ES_AGNTE_AUTRTNDOR'').getValue();',
'        ',
'        if (cncla_estblcmnto == ''N'' && es_agnt_autrtndr == ''N'' ){',
'            var item30 = ( (v_total_impuesto + ttal_impuesto_ley)  * 40 )/100 ;',
'            apex.item(''P''+pageId+''_ANTICIPO_ANIO_SIGUIENTE'').enable();',
'            apex.item(''P''+pageId+''_ANTICIPO_ANIO_SIGUIENTE'').setValue(redondearAlMultiploDeMil(parseFloat(item30)) || 0);',
'            apex.item(''P''+pageId+''_ANTICIPO_ANIO_SIGUIENTE'').disable();',
'        }else{',
'            apex.item(''P''+pageId+''_ANTICIPO_ANIO_SIGUIENTE'').setValue(0);',
'            apex.item(''P''+pageId+''_ANTICIPO_ANIO_SIGUIENTE'').disable();',
'        }',
'    }    ',
'};',
'',
'function regionBaseGravable() {',
'    var item9 = parseFloat(apex.item(''P''+pageId+''_MNS_INGRSS_FUERA_MNCPIO'').getValue()) ?? 0;',
'    var item11 = parseFloat(apex.item(''P''+pageId+''_MNS_INGRSOS_DEV_REB_DES'').getValue()) ?? 0;',
'    var item12 = parseFloat(apex.item(''P''+pageId+''_MNS_INGRSOS_EXPRTCIONS'').getValue()) ?? 0;',
'    var item13 = parseFloat(apex.item(''P''+pageId+''_MNS_INGRSOS_VNTA_ACT_FIJS'').getValue()) ?? 0;',
'    var item14 = parseFloat(apex.item(''P''+pageId+''_MNS_INGRSOS_ACTVDDS_EXCLDS'').getValue()) ?? 0;',
'    var item15 = parseFloat(apex.item(''P''+pageId+''_MNS_INGRSOS_ACTVDDS_EXENTAS'').getValue()) ?? 0;',
'    var itemTotalIngresos = parseFloat(apex.item(''P''+pageId+''_TOTAL_INGRESOS_GRAVADS'').getValue()) ?? 0;',
'',
'    var total = item9 + item11 + item12 + item13 + item14 + item15 + itemTotalIngresos;',
'    apex.item(''P''+pageId+''_TTL_INGRS_ORIOS_EXTRS_PAIS'').setValue(total || 0);',
'    //var item8 = parseFloat(apex.item(''P''+pageId+''_TTL_INGRS_ORIOS_EXTRS_PAIS'').getValue()) ?? 0;',
'    ',
'    var calculoItem10 = parseFloat(total) - parseFloat(item9);',
'    //var calculoItem10 = parseFloat(item8) - parseFloat(item9);',
'    ',
'    if (calculoItem10 <= 0){',
'        apex.item(''P''+pageId+''_TTL_INGRS_ORIOS_EXTRS_MNCPIO'').setValue(0);',
'        apex.item(''P''+pageId+''_TTL_INGRS_ORIOS_EXTRS_MNCPIO'').refresh();',
'    }else{',
'        apex.item(''P''+pageId+''_TTL_INGRS_ORIOS_EXTRS_MNCPIO'').setValue(calculoItem10);',
'    }	',
'    calculoItem16();',
'};',
'',
'function calculoItem16() {',
'    var item10 = parseFloat(apex.item(''P''+pageId+''_TTL_INGRS_ORIOS_EXTRS_MNCPIO'').getValue()) ?? 0;',
'    var item11 = parseFloat(apex.item(''P''+pageId+''_MNS_INGRSOS_DEV_REB_DES'').getValue()) ?? 0;',
'    var item12 = parseFloat(apex.item(''P''+pageId+''_MNS_INGRSOS_EXPRTCIONS'').getValue()) ?? 0;',
'    var item13 = parseFloat(apex.item(''P''+pageId+''_MNS_INGRSOS_VNTA_ACT_FIJS'').getValue()) ?? 0;',
'    var item14 = parseFloat(apex.item(''P''+pageId+''_MNS_INGRSOS_ACTVDDS_EXCLDS'').getValue()) ?? 0;',
'    var item15 = parseFloat(apex.item(''P''+pageId+''_MNS_INGRSOS_ACTVDDS_EXENTAS'').getValue()) ?? 0;',
'    var total = item10 - item11 - item12 - item13 - item14 - item15;',
'    apex.item(''P''+pageId+''_TOTAL_INGRESOS_GRVBLES'').setValue(total || 0);',
'    ',
'    /*var item16 = parseFloat(apex.item(''P''+pageId+''_TOTAL_INGRESOS_GRVBLES'').getValue()) ?? 0;',
'    var itemTotalIngresos = parseFloat(apex.item(''P''+pageId+''_TOTAL_INGRESOS_GRAVADS'').getValue()) ?? 0;',
'    ',
'    if (item16 != itemTotalIngresos){',
'        apex.item(''P''+pageId+''_VALIDAITEM16'').setValue(''S'');',
'        apex.item(''P''+pageId+''_VALIDAITEM16'').refresh;',
'        console.log(''item16(''+item16+'') es diferente de itemTotalIngresos (''+itemTotalIngresos+'')'');',
'    }else{',
'        apex.item(''P''+pageId+''_VALIDAITEM16'').setValue(''N'');',
'        apex.item(''P''+pageId+''_VALIDAITEM16'').refresh;',
'        console.log(''item16(''+item16+'') es igual a itemTotalIngresos (''+itemTotalIngresos+'')'');',
'    }*/',
'};',
'',
unistr('//Funci\00F3n que calcula los valores de los concepto industria y comercio, avisos y tablero y sobretasa bomberil'),
'function calculoItem20() {',
'                ',
'                var valor_ttal_impsto            = apex.item(''P''+pageId+''_TOTAL_IMPUESTO'').getValue();  //Extrae el valor del item 17              ',
'                var indicador                    = apex.item(''P''+pageId+''_TIPO_CALCULO_SANCION'').getValue(); ',
'                var impsto_ley                   = apex.item(''P''+pageId+''_IMPUESTO_LEY'').getValue();                  ',
'                var TTL_IMPSTO_INDSTRIA_CMRCIO   =  redondearAlMultiploDeMil(parseFloat(valor_ttal_impsto) + parseFloat(impsto_ley));',
unistr('                var indicador_avisostablero      = apex.item(''P''+pageId+''_AVISOS_TABLEROS'').getValue(); // Consulta el valor del items \00BFAvisos y tableros?'),
'                var tarifa_sbtsa_bmbrl           = apex.item(''P''+pageId+''_SOBRETASA_BOMBERIL_TRFA'').getValue(); // Consulta tarifa para calcular Sobreta Bomberil (2% o 3%)',
'                var vgncia                       = apex.item(''P''+pageId+''_VGNCIA'').getValue(); ',
'                apex.item(''P''+pageId+''_TTL_IMPSTO_INDSTRIA_CMRCIO'').setValue(TTL_IMPSTO_INDSTRIA_CMRCIO); ',
'',
'                if (indicador_avisostablero ===''S'') {',
'                    var IMPUESTO_AVISOS_TABLEROS = redondearAlMultiploDeMil((parseFloat(TTL_IMPSTO_INDSTRIA_CMRCIO) * 15) / 100);',
'                    apex.item(''P''+pageId+''_IMPUESTO_AVISOS_TABLEROS'').setValue(IMPUESTO_AVISOS_TABLEROS); 	',
'                }else{',
'                    apex.item(''P''+pageId+''_IMPUESTO_AVISOS_TABLEROS'').setValue(0);',
'                }',
'                ',
'                if (vgncia <= 2023) {',
'                    var SOBRETASA_BOMBERIL = redondearAlMultiploDeMil((parseFloat(TTL_IMPSTO_INDSTRIA_CMRCIO) * 7) / 100);',
'                    apex.item(''P''+pageId+''_SOBRETASA_BOMBERIL'').setValue(SOBRETASA_BOMBERIL);',
'                }else{',
'                    var SOBRETASA_BOMBERIL = redondearAlMultiploDeMil((parseFloat(TTL_IMPSTO_INDSTRIA_CMRCIO) * 6) / 100);',
'                    apex.item(''P''+pageId+''_SOBRETASA_BOMBERIL'').setValue(SOBRETASA_BOMBERIL);',
'                }',
'    ',
'                //if (vgncia <= 2020) {',
'                    var SOBRETASA_SEGURIDAD = 0;//redondearAlMultiploDeMil((parseFloat(TTL_IMPSTO_INDSTRIA_CMRCIO) * 2) / 100);',
'                    apex.item(''P''+pageId+''_SOBRETASA_SEGURIDAD'').setValue(SOBRETASA_SEGURIDAD);',
'                //}',
'};',
'',
unistr('//Funci\00F3n que calcula el item 25'),
'function calculoItem25(){',
'    var item20 = parseFloat(apex.item(''P''+pageId+''_TTL_IMPSTO_INDSTRIA_CMRCIO'').getValue()) ?? 0;',
'    var item21 = parseFloat(apex.item(''P''+pageId+''_IMPUESTO_AVISOS_TABLEROS'').getValue()) ?? 0;',
'    var item22 = parseFloat(apex.item(''P''+pageId+''_PGO_UNDDS_CMRCLS'').getValue()) ?? 0;',
'    var item23 = parseFloat(apex.item(''P''+pageId+''_SOBRETASA_BOMBERIL'').getValue()) ?? 0;',
'    var item24 = parseFloat(apex.item(''P''+pageId+''_SOBRETASA_SEGURIDAD'').getValue()) ?? 0;',
'    var item25 = item20 + item21 + item22 + item23 + item24 ;',
'    apex.item(''P''+pageId+''_TOTAL_IMPUESTO_CARGO'').setValue(item25 || 0);',
'    apex.item(''P''+pageId+''_CLCLO_IMPSTO_CRGO_SNCION'').setValue(item25 || 0);',
'    calculoItem33();',
'	};',
'',
unistr('function calculoItem33(){ //33. C\00C1LCULO  TOTAL SALDO A CARGO (RENGL\00D3N 25-26-27-28-29+30+31-32)'),
'    var item25 = parseFloat(apex.item(''P''+pageId+''_TOTAL_IMPUESTO_CARGO'').getValue()) ?? 0;',
'    var item26 = parseFloat(apex.item(''P''+pageId+''_MENS_VLR_EXNCN_EXNRCN_IMPSTO'').getValue()) ?? 0;',
'    var item27 = parseFloat(apex.item(''P''+pageId+''_MENOS_RETENCIONES'').getValue()) ?? 0; ',
'    var item28 = parseFloat(apex.item(''P''+pageId+''_MENOS_AUTORRETENCIONES'').getValue()) ?? 0;',
'    var item29 = parseFloat(apex.item(''P''+pageId+''_MENS_ANTCPO_LIQDDO_ANIO_ANTR'').getValue()) ?? 0;',
'    var item30 = parseFloat(apex.item(''P''+pageId+''_ANTICIPO_ANIO_SIGUIENTE'').getValue()) ?? 0;',
'    var item31 = parseFloat(apex.item(''P''+pageId+''_CLCLO_NETO_SANCION'').getValue()) ?? 0;',
'    var item32 = parseFloat(apex.item(''P''+pageId+''_MENOS_SLDO_FVR_PRDO_ANTRIOR'').getValue()) ?? 0;',
'',
'	var item33 = item25 - item26 - item27 - item28 - item29  + item30 + item31 - item32;',
'',
'	 if (item33 < 0) { // Valida la diferencia del TOTAL SALDO A CARGO.',
'         apex.item(''P''+pageId+''_TOTAL_SALDO_CARGO'').setValue(0 || 0);',
'     }else{',
'         apex.item(''P''+pageId+''_TOTAL_SALDO_CARGO'').setValue( item33|| 0);',
'    }',
'    ',
'     var ttal_sldo_acrgo = item25 - item26 - item27 - item28 - item29  + item30 /*+ item31*/ - item32;',
'    if (ttal_sldo_acrgo < 0) { 																	  ',
'         apex.item(''P''+pageId+''_CALCULO_TOTAL_SALDO_CARGO'').setValue(0 || 0);																				',
'    }else{															 ',
'         apex.item(''P''+pageId+''_CALCULO_TOTAL_SALDO_CARGO'').setValue( ttal_sldo_acrgo || 0);																		  ',
'    }',
'	',
'	CLCLO_CNCPTO_INDSTRIA_CMRCIO();',
'};',
'',
'function limpiar_items(){',
'    apex.item(''P''+pageId+''_ACTIVIDAD'').setValue("");',
'    apex.item(''P''+pageId+''_TARIFA'').setValue("");',
'    apex.item(''P''+pageId+''_INGRESOS_GRAVADOS'').setValue("");',
'    apex.item(''P''+pageId+''_VLOR_IPSTO'').setValue("");',
'}',
'',
'//Item que contiene el calulo real del concepto de industria y comercio ( Calculo neto concepto IMPUESTO INDUSTRIA Y COMERCIO ) ',
'function CLCLO_CNCPTO_INDSTRIA_CMRCIO (){',
'    var TOTAL_SALDO_CARGO        = parseFloat(apex.item(''P''+pageId+''_TOTAL_SALDO_CARGO'').getValue()) ?? 0;       ',
'    var IMPUESTO_AVISOS_TABLEROS = parseFloat(apex.item(''P''+pageId+''_IMPUESTO_AVISOS_TABLEROS'').getValue()) ?? 0;',
'    var SOBRETASA_BOMBERIL       = parseFloat(apex.item(''P''+pageId+''_SOBRETASA_BOMBERIL'').getValue()) ?? 0;      ',
'    var SOBRETASA_SEGURIDAD      = parseFloat(apex.item(''P''+pageId+''_SOBRETASA_SEGURIDAD'').getValue()) ?? 0;     ',
'    var CLCLO_NETO_SANCION       = parseFloat(apex.item(''P''+pageId+''_CLCLO_NETO_SANCION'').getValue()) ?? 0;      ',
'    var ANTICIPO_ANIO_SIGUIENTE  = parseFloat(apex.item(''P''+pageId+''_ANTICIPO_ANIO_SIGUIENTE'').getValue()) ?? 0; ',
'    var CLCLO_PRCNTJE_ANTCIPO_SGNTE  = 0; 	',
'	var item20 = parseFloat(apex.item(''P''+pageId+''_TTL_IMPSTO_INDSTRIA_CMRCIO'').getValue()) ?? 0;  ',
'    var item22 = parseFloat(apex.item(''P''+pageId+''_PGO_UNDDS_CMRCLS'').getValue()) ?? 0;',
'	var item26 = parseFloat(apex.item(''P''+pageId+''_MENS_VLR_EXNCN_EXNRCN_IMPSTO'').getValue()) ?? 0;    ',
'	var item27 = parseFloat(apex.item(''P''+pageId+''_MENOS_RETENCIONES'').getValue()) ?? 0;    ',
'	var item28 = parseFloat(apex.item(''P''+pageId+''_MENOS_AUTORRETENCIONES'').getValue()) ?? 0;    ',
'	var item29 = parseFloat(apex.item(''P''+pageId+''_MENS_ANTCPO_LIQDDO_ANIO_ANTR'').getValue()) ?? 0;    ',
'	var item32 = parseFloat(apex.item(''P''+pageId+''_MENOS_SLDO_FVR_PRDO_ANTRIOR'').getValue()) ?? 0;    ',
unistr('    var indicador_avisostablero      = apex.item(''P''+pageId+''_AVISOS_TABLEROS'').getValue(); // Consulta el valor del items \00BFAvisos y tableros?'),
'    ',
'    if (indicador_avisostablero ===''S'') {',
'        CLCLO_PRCNTJE_ANTCIPO_SGNTE = redondearAlMultiploDeMil((parseFloat(ANTICIPO_ANIO_SIGUIENTE) * 78 ) / 100);',
'    }else{',
'        CLCLO_PRCNTJE_ANTCIPO_SGNTE = redondearAlMultiploDeMil((parseFloat(ANTICIPO_ANIO_SIGUIENTE) * 93 ) / 100);',
'    }  ',
'   /*var CLCLO_CNCPTO_INDSTRIA_CMRCIO  = (   IMPSTO_INDSTRIA_CMRCIO TOTAL_SALDO_CARGO   -  IMPUESTO_AVISOS_TABLEROS  - SOBRETASA_BOMBERIL - ',
'                                            SOBRETASA_SEGURIDAD  -  CLCLO_NETO_SANCION        - ANTICIPO_ANIO_SIGUIENTE  //si se quiere descontar anticipo del total saldo a cargo',
'                                        );*/ ',
'    var CLCLO_CNCPTO_INDSTRIA_CMRCIO  = (   item20  + item22 -  item26  - item27 - item28  -  item29 - item32  //si se quiere descontar anticipo del total saldo a cargo',
'                                        );',
'    ',
'    CLCLO_CNCPTO_INDSTRIA_CMRCIO = CLCLO_CNCPTO_INDSTRIA_CMRCIO ;//+ CLCLO_PRCNTJE_ANTCIPO_SGNTE;',
'    ',
'    if (CLCLO_CNCPTO_INDSTRIA_CMRCIO < 0) { //Condicion que valida el valor del concepto ICA y el saldo a favor del concepto ICA',
'         apex.item(''P''+pageId+''_CLCLO_CNCPTO_INDSTRIA_CMRCIO'').setValue(CLCLO_CNCPTO_INDSTRIA_CMRCIO || 0); ',
'         apex.item(''P''+pageId+''_SLDO_FVR_CNCPTO_INTRIA_CMRCIO'').setValue((1 - 2) * CLCLO_CNCPTO_INDSTRIA_CMRCIO || 0);',
'         apex.item(''P''+pageId+''_CONCEPTO_INDUSTRIA_COMERCIO'').setValue(0 || 0); ',
'    ',
'    }else{',
'         apex.item(''P''+pageId+''_CLCLO_CNCPTO_INDSTRIA_CMRCIO'').setValue(CLCLO_CNCPTO_INDSTRIA_CMRCIO || 0); ',
'         apex.item(''P''+pageId+''_CONCEPTO_INDUSTRIA_COMERCIO'').setValue( CLCLO_CNCPTO_INDSTRIA_CMRCIO|| 0);',
'         apex.item(''P''+pageId+''_SLDO_FVR_CNCPTO_INTRIA_CMRCIO'').setValue(0 || 0);',
'    }        ',
'    CONCEPTO_AVISOS_TABLEROS();',
'    CNCPTO_SBRTSA_BMBRL(); ',
'    CNCPTO_SBRTSA_SGRDD(); ',
'    CNCPTO_ANTICIPO_ANIO_SIGUIENTE(); ',
'    CNCPTO_DIFERENCIA_CNCPTO_SNCION ();',
'    ',
'};',
'',
unistr('function calcularItem40(){  //40. TOTAL A PAGAR CON PAGO VOLUNTARIO (Rengl\00F3n 38 + 39)    '),
'     var item38 = parseFloat(apex.item(''P''+pageId+''_TOTAL_PAGAR'').getValue()) ?? 0 ;',
'     var item39 = parseFloat(apex.item(''P''+pageId+''_VALOR_PAGO_VOLUNTARIO'').getValue()) ?? 0; ',
'     var vlor_pgo_bnco = parseFloat(apex.item(''P''+pageId+''_VALOR_PAGAR_BANCOS'').getValue()) ?? 0; ',
'     var vlor_ttal_pgo_vlntrio = parseFloat(apex.item(''P''+pageId+''_TOTAL_PAGAR_PAGO_VOLUNTARIO'').getValue()) ?? 0; ',
'     var totalApagar = (item38 + item39);',
'    if (totalApagar >= 0 ){         ',
'        if (vlor_ttal_pgo_vlntrio != totalApagar ){',
'            apex.item(''P''+pageId+''_TOTAL_PAGAR_PAGO_VOLUNTARIO'').setValue(totalApagar || 0); ',
'            apex.item(''P''+pageId+''_VALOR_PAGAR_BANCOS'').setValue(totalApagar ?? 0);     ',
'            apex.item(''P'' + pageId + ''_CALCULO_VALOR_PAGAR_BANCOS'')?.setValue(totalApagar ?? 0);          ',
'        }               ',
'        ',
'    }else{',
'        apex.item(''P''+pageId+''_TOTAL_PAGAR_PAGO_VOLUNTARIO'').setValue(0 || 0); ',
'        apex.item(''P''+pageId+''_VALOR_PAGAR_BANCOS'').setValue(0 ?? 0);     ',
'        apex.item(''P'' + pageId + ''_CALCULO_VALOR_PAGAR_BANCOS'')?.setValue(0 ?? 0);',
'    }',
'     ',
'};'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'deshabilitarItems();',
'calculoActividadesGravadas();',
'buildJsonActividades(); ',
'calculoItem20();',
'calculoTotalActividades();',
'calculoValorPago();',
'calcularItem38();',
'//calcularItem40();',
'//validarValorBanco();',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
,p_step_template=>wwv_flow_api.id(252164311814651356)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_browser_cache=>'N'
,p_last_updated_by=>'CNEGRETE'
,p_last_upd_yyyymmddhh24miss=>'20250625104928'
);
end;
/
begin
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(146432375401819096)
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
,p_ajax_items_to_submit=>'P310_ID_DCLRCION'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P310_ID_DCLRCION_VGNCIA_FRMLRIO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22941344186896169)
,p_plug_name=>unistr('C. Discriminaci\00F3n de Actividades Gravadas')
,p_region_name=>'actividad'
,p_parent_plug_id=>wwv_flow_api.id(146432375401819096)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   ',
'    seq_id',
'    ,n003 as ID_DCLRCNS_ESQMA_TRFA',
'    ,n004 as TRFA',
'    ,n005 as VLOR_IGRSOS_GRVDOS',
'    ,n001 as VLOR_IPSTO',
'    ,c001 as dscrpcion',
'    ,seq_id as eliminar',
'from   apex_collections	',
'where collection_name = ''ACTIVIDADES''  ',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>':P310_ID_DCLRCION_VGNCIA_FRMLRIO is not null and :P310_IDNTFCCION is not null and :P310_MSTRAR_FRMLRIO = ''S'''
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(22941622311896171)
,p_name=>'SEQ_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEQ_ID'
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
 p_id=>wwv_flow_api.id(22941703350896172)
,p_name=>'ID_DCLRCNS_ESQMA_TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCNS_ESQMA_TRFA'
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
 p_id=>wwv_flow_api.id(22941758305896173)
,p_name=>'TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TRFA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tarifa'
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
 p_id=>wwv_flow_api.id(22941889630896174)
,p_name=>'VLOR_IGRSOS_GRVDOS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_IGRSOS_GRVDOS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_heading=>'Valor Ingresos Gravados'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(22941970698896175)
,p_name=>'VLOR_IPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_IPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_heading=>'Valor Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(22942109306896176)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Actividad Economica'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(22942142057896177)
,p_name=>'ELIMINAR'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="javascript:eliminarActividad( &SEQ_ID. );"> <span class="fa fa-trash"></span></a>',
'',
''))
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(22941506388896170)
,p_internal_uid=>22941506388896170
,p_is_editable=>false
,p_lazy_loading=>false
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
 p_id=>wwv_flow_api.id(23196084213512824)
,p_interactive_grid_id=>wwv_flow_api.id(22941506388896170)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(23196176445512824)
,p_report_id=>wwv_flow_api.id(23196084213512824)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23196711211512825)
,p_view_id=>wwv_flow_api.id(23196176445512824)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(22941622311896171)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23197210744512827)
,p_view_id=>wwv_flow_api.id(23196176445512824)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(22941703350896172)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23197733826512829)
,p_view_id=>wwv_flow_api.id(23196176445512824)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(22941758305896173)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23198139620512830)
,p_view_id=>wwv_flow_api.id(23196176445512824)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(22941889630896174)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>160
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23198691411512832)
,p_view_id=>wwv_flow_api.id(23196176445512824)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(22941970698896175)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23199181662512834)
,p_view_id=>wwv_flow_api.id(23196176445512824)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(22942109306896176)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>539
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23199662126512835)
,p_view_id=>wwv_flow_api.id(23196176445512824)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(22942142057896177)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22941326079896168)
,p_plug_name=>unistr('Sub regi\00F3n actividades')
,p_parent_plug_id=>wwv_flow_api.id(22941344186896169)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252169105903651390)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(23321438241195029)
,p_plug_name=>'Actividad_Economica'
,p_region_name=>'gestionActividadEconomica'
,p_parent_plug_id=>wwv_flow_api.id(22941344186896169)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_column_width=>'width: 848px; '
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(146542123142826229)
,p_plug_name=>'Opciones de Uso'
,p_parent_plug_id=>wwv_flow_api.id(146432375401819096)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P310_ID_DCLRCION_VGNCIA_FRMLRIO is not null and :P310_IDNTFCCION is not null and :P310_MSTRAR_FRMLRIO = ''S'''
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(146542192015826230)
,p_plug_name=>unistr('A. Informaci\00F3n del contribuyente')
,p_parent_plug_id=>wwv_flow_api.id(146432375401819096)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P310_ID_DCLRCION_VGNCIA_FRMLRIO is not null and :P310_IDNTFCCION is not null and :P310_MSTRAR_FRMLRIO = ''S'''
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(146542255437826231)
,p_plug_name=>'B. Base Gravable'
,p_parent_plug_id=>wwv_flow_api.id(146432375401819096)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P310_ID_DCLRCION_VGNCIA_FRMLRIO is not null and :P310_IDNTFCCION is not null and :P310_MSTRAR_FRMLRIO = ''S'''
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(146542534937826233)
,p_plug_name=>unistr('D. Liquidaci\00F3n Privada')
,p_parent_plug_id=>wwv_flow_api.id(146432375401819096)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P310_ID_DCLRCION_VGNCIA_FRMLRIO is not null and :P310_IDNTFCCION is not null and :P310_MSTRAR_FRMLRIO = ''S'''
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(146542579838826234)
,p_plug_name=>'E. Pago'
,p_parent_plug_id=>wwv_flow_api.id(146432375401819096)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
,p_plug_display_sequence=>70
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P310_ID_DCLRCION_VGNCIA_FRMLRIO is not null and :P310_IDNTFCCION is not null and :P310_MSTRAR_FRMLRIO = ''S'''
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(146542660263826235)
,p_plug_name=>'F. Firmas'
,p_parent_plug_id=>wwv_flow_api.id(146432375401819096)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
,p_plug_display_sequence=>80
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P310_ID_DCLRCION_VGNCIA_FRMLRIO is not null and :P310_IDNTFCCION is not null and :P310_MSTRAR_FRMLRIO = ''S'''
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22561880291204678)
,p_plug_name=>'Firma del declarante'
,p_parent_plug_id=>wwv_flow_api.id(146542660263826235)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(23665300433385929)
,p_plug_name=>'Firma del  contador o revisor fiscal'
,p_parent_plug_id=>wwv_flow_api.id(146542660263826235)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(146543130298826239)
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
 p_id=>wwv_flow_api.id(330518870403390502)
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
,p_plug_display_when_condition=>':P310_ID_DCLRCION_VGNCIA_FRMLRIO is not null and :P310_ID_SJTO_IMPSTO is null'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8632530768708872)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(146543130298826239)
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
 p_id=>wwv_flow_api.id(8632969147708872)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(146543130298826239)
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
 p_id=>wwv_flow_api.id(8572869600708916)
,p_button_sequence=>650
,p_button_plug_id=>wwv_flow_api.id(22941326079896168)
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
 p_id=>wwv_flow_api.id(8573284374708915)
,p_button_sequence=>660
,p_button_plug_id=>wwv_flow_api.id(22941326079896168)
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
 p_id=>wwv_flow_api.id(8633624839708872)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(330518870403390502)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
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
 p_id=>wwv_flow_api.id(8568975568708920)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(22941344186896169)
,p_button_name=>'BTN_AGREGAR_ACTIVIDAD'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar Actividad'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa fa-plus'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>10
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8569308193708919)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(22941344186896169)
,p_button_name=>'BTN_CANCELAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8569787771708919)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(22941344186896169)
,p_button_name=>'BTN_MOSTRAR_REGION_ACTIVIDADES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Agregar Actividad 3'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8546468280708947)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(146432375401819096)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Registrar Declaraci\00F3n')
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_execute_validations=>'N'
,p_button_condition=>'P310_ID_SJTO_IMPSTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8547216780708946)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(146432375401819096)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'f?p=&APP_ID.:310:&SESSION.::&DEBUG.:::'
,p_button_condition=>'P310_ID_SJTO_IMPSTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8576784233708913)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(23321438241195029)
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
 p_id=>wwv_flow_api.id(8546889786708946)
,p_button_sequence=>440
,p_button_plug_id=>wwv_flow_api.id(146432375401819096)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:&P310_BRANCH.:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(8763185975708793)
,p_branch_name=>'Go To Page 3'
,p_branch_action=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,1:P3_ID_DCLRCION:&P310_ID_DCLRCION_V2.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(8546468280708947)
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8547604947708944)
,p_name=>'P310_TIPO_DECLARACION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'TIPO DECLARACION '
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8548094988708943)
,p_name=>'P310_ID_DCLRCION'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_source=>'ID_DCLRCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_DECLARACION '
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8548467838708942)
,p_name=>'P310_ID_DCLRCION_V2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_DECLARACION '
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8548897433708942)
,p_name=>'P310_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_prompt=>unistr('Tipo Declaraci\00F3n ')
,p_source=>'ID_DCLRCION_VGNCIA_FRMLRIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      b.dscrpcion,',
'            a.id_dclrcion_vgncia_frmlrio',
'from        gi_d_dclrcnes_vgncias_frmlr a',
'inner join  gi_d_formularios            b   on  b.id_frmlrio            =   a.id_frmlrio',
'where       a.id_dclrcion_vgncia_frmlrio    =   :P310_ID_DCLRCION_VGNCIA_FRMLRIO;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>unistr('Tipo Declaraci\00F3n ')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8549270123708941)
,p_name=>'P310_VGNCIA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
,p_lov_cascade_parent_items=>'P310_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_ajax_items_to_submit=>'P310_VGNCIA'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>6
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>'Vigencia'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8549668388708941)
,p_name=>'P310_ID_PRDO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
,p_lov_cascade_parent_items=>'P310_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_ajax_items_to_submit=>'P310_ID_PRDO'
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
 p_id=>wwv_flow_api.id(8550047223708941)
,p_name=>'P310_JSON_ITEM'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_prompt=>'P310_JSON_ITEM'
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
 p_id=>wwv_flow_api.id(8550464810708940)
,p_name=>'P310_JSON_VALORES'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_prompt=>'P310_JSON_VALORES'
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
 p_id=>wwv_flow_api.id(8550831318708940)
,p_name=>'P310_ID_SJTO_IMPSTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_source=>'ID_SJTO_IMPSTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'ID_SUJETO_IMPUESTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8551231868708940)
,p_name=>'P310_DSCNTO_INT_INTRIA_CRCIO_ANT'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'ID_SUJETO_IMPUESTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8551627485708940)
,p_name=>'P310_DSCNTO_INT_AVSS_TBS_ANT'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'ID_SUJETO_IMPUESTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8552010907708940)
,p_name=>'P310_DSCNTO_INT_STSA_BMRL_ANT'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'ID_SUJETO_IMPUESTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8552464557708939)
,p_name=>'P310_INTERESES_MORA_PGO_ANTERIOR'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'ID_SUJETO_IMPUESTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8552881697708939)
,p_name=>'P310_MSTRAR_FRMLRIO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'MOSTRAR_FORMULARIO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8553241494708939)
,p_name=>'P310_BRANCH'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'BRANCH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8553603917708939)
,p_name=>'P310_CDGO_CLNTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'CODIGO_CLIENTE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8554000016708938)
,p_name=>'P310_ID_IMPSTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_source=>'ID_IMPSTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_IMPUESTO'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8554451707708938)
,p_name=>'P310_ID_IMPSTO_SBMPSTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_source=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_SUBIMPUESTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8554846992708938)
,p_name=>'P310_NMRO_CNSCTVO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_source=>'NMRO_CNSCTVO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'NUMERO_CONSECUTIVO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8555251831708938)
,p_name=>'P310_CDGO_DCLRCION_ESTDO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_source=>'CDGO_DCLRCION_ESTDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'CODIGO_DECLARACION_ESTADO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8555686722708937)
,p_name=>'P310_ID_DCLRCION_USO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_source=>'ID_DCLRCION_USO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_DECLARACION_USO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8556095998708937)
,p_name=>'P310_ID_DCLRCION_CRRCCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_source=>'ID_DCLRCION_CRRCCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_DECLARACION_CORRECCION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8556428027708937)
,p_name=>'P310_ID_USRIO_RGSTRO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_source=>'ID_USRIO_RGSTRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_USUARIO_REGISTRO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8556886000708937)
,p_name=>'P310_FCHA_RGSTRO'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_source=>'FCHA_RGSTRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'FEHCA_REGISTRO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8557238290708937)
,p_name=>'P310_ID_USRIO_ULTIMA_MDFCCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_source=>'ID_USRIO_ULTIMA_MDFCCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_USUARIO_ULTIMA_MODIFICACION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8557699279708936)
,p_name=>'P310_FCHA_ULTMA_MDFCCION'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_source=>'FCHA_ULTMA_MDFCCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'FECHA_ULTIMA_MODIFICACION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8558056614708936)
,p_name=>'P310_FCHA_PRSNTCION'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_source=>'FCHA_PRSNTCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'FECHA_PRESENTACION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8558464874708936)
,p_name=>'P310_ID_USRIO_APLCCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_source=>'ID_USRIO_APLCCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_USUARIO_APLICION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8558870183708936)
,p_name=>'P310_FCHA_APLCCION'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_source=>'FCHA_APLCCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'FECHA_APLICACION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8559287075708936)
,p_name=>'P310_BSE_GRVBLE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_source=>'BSE_GRVBLE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'BASE_GRAVABLE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8559633468708935)
,p_name=>'P310_VLOR_TTAL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_source=>'VLOR_TTAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'VALOR_TOTAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8560082360708935)
,p_name=>'P310_VLOR_PAGO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_source=>'VLOR_PAGO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'VALOR_PAGO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8560463411708935)
,p_name=>'P310_ID_RCDO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_source=>'ID_RCDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_RECAUDO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8560830846708935)
,p_name=>'P310_ID_LQDCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_source=>'ID_LQDCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_LIQUIDACION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8561232897708935)
,p_name=>'P310_ID_USRIO_ANLCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_source=>'ID_USRIO_ANLCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_USUARIO_ANULACION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8561656035708934)
,p_name=>'P310_FCHA_ANLCION'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_source=>'FCHA_ANLCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'FECHA_ANULACION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8562076813708934)
,p_name=>'P310_FCHA_PRSNTCION_PRYCTDA'
,p_source_data_type=>'DATE'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_source=>'FCHA_PRSNTCION_PRYCTDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'FECHA_PRESENTACION_PROYECTADA '
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8562477416708933)
,p_name=>'P310_ID_DCMNTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_source=>'ID_DCMNTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_DOCUMENTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8562815611708933)
,p_name=>'P310_ID_CNDDTO_VGNCIA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_source=>'ID_CNDDTO_VGNCIA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_CANDIDATO_VIGENCIA'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8563203612708933)
,p_name=>'P310_INDCDOR_MGRDO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_source=>'INDCDOR_MGRDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'INDICADOR_MIGRADO '
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8563652099708933)
,p_name=>'P310_CDGO_ORGN_TPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_source=>'CDGO_ORGN_TPO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'CODIGO_ORIGEN_TIPO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8564054431708933)
,p_name=>'P310_NMBRE_RSPNS_FRMA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
 p_id=>wwv_flow_api.id(8570106682708918)
,p_name=>'P310_ACTIVIDAD_DESCRIPCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(22941344186896169)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8570566947708918)
,p_name=>'P310_ACTIVIDAD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(22941344186896169)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Actividad'
,p_source=>'ID_DCLRCNS_ESQMA_TRFA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  ',
'    a.cdgo_dclrcns_esqma_trfa || '' - '' || a.dscrpcion d,',
'    a.id_dclrcns_esqma_trfa r',
'from    pkg_gi_declaraciones.fnc_co_esquema_tarifario    (',
'                                                            p_cdgo_clnte                    =>  :F_CDGO_CLNTE,',
'                                                            p_id_dclrcion_vgncia_frmlrio    =>  :P310_ID_DCLRCION_VGNCIA_FRMLRIO',
'                                                        )   a',
'order by    a.dscrpcion'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
,p_item_comment=>'ACTIVIDADES GRAVADAS '
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8570970363708918)
,p_name=>'P310_INGRESOS_GRAVADOS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(22941344186896169)
,p_use_cache_before_default=>'NO'
,p_item_default=>'0'
,p_prompt=>'Ingresos Gravados'
,p_source=>'VLOR_IGRSOS_GRVDOS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>8
,p_field_template=>wwv_flow_api.id(252201432664651457)
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
,p_item_comment=>'INGRESOS GRAVADOS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8571363884708917)
,p_name=>'P310_TARIFA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(22941344186896169)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tarifa'
,p_source=>'TRFA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_item_comment=>'TARIFA'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8571720936708917)
,p_name=>'P310_VLOR_IPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(22941344186896169)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Valor calculado'
,p_source=>'VLOR_IPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>20
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(252201432664651457)
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
,p_item_comment=>'IMPUESTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8572152192708916)
,p_name=>'P310_SEQ_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(22941344186896169)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8573627993708915)
,p_name=>'P310_TOTAL_INGRESOS_GRAVADS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(22941326079896168)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8574042056708915)
,p_name=>'P310_TOTAL_IMPUESTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(22941326079896168)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>'17. TOTAL IMPUESTO'
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
,p_item_comment=>'17. TOTAL IMPUESTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8574412474708915)
,p_name=>'P310_GENERACION_ENERGIA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(22941326079896168)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('18 GENERACI\00D3N DE ENERG\00CDA - CAPACIDAD INSTALADA KW')
,p_source=>'GNRCION_ENRGIA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>100
,p_colspan=>6
,p_grid_column=>1
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    //allowDecimalPadding: false,',
'    caretPositionOnFocus: "start",',
'    //currencySymbol: "$",',
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
,p_item_comment=>unistr('18 GENERACI\00D3N DE ENERG\00CDA - CAPACIDAD INSTALADA KW')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8574875785708914)
,p_name=>'P310_IMPUESTO_LEY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(22941326079896168)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
,p_item_comment=>'19. IMPUESTO LEY 56 DE 1981'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8575288163708914)
,p_name=>'P310_JSON_ACTVDDES'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(22941326079896168)
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
 p_id=>wwv_flow_api.id(8575643072708914)
,p_name=>'P310_ACTIVIDADES_GRAVADAS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(22941326079896168)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_DCLRCNS_ESQMA_TRFA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ACTIVIDADES GRAVADAS '
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8576073307708913)
,p_name=>'P310_IMPUESTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(22941326079896168)
,p_use_cache_before_default=>'NO'
,p_source=>'VLOR_IPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'IMPUESTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8577451245708912)
,p_name=>'P310_CLASIFICACION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(146542123142826229)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
'             where       b.id_dclrcion_vgncia_frmlrio  =   :P310_ID_DCLRCION_VGNCIA_FRMLRIO',
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
 p_id=>wwv_flow_api.id(8577806517708912)
,p_name=>'P310_OPCION_DE_USO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(146542123142826229)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_prompt=>unistr('OPCI\00D3N DE USO')
,p_source=>'CDGO_OPCION_DE_USO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_dclrcion_uso    text,',
'        a.cdgo_dclrcion_uso     value',
'from    gi_d_declaraciones_uso  a',
'where   a.cdgo_clnte        =   :F_CDGO_CLNTE',
'and     cdgo_dclrcion_uso   <> ''PAC'' and a.cdgo_dclrcion_uso not in(''ANT'', ''RCO'')',
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
 p_id=>wwv_flow_api.id(8578251387708912)
,p_name=>'P310_FCHA_MAXIMA_PRSNTCION'
,p_source_data_type=>'DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(146542123142826229)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>unistr('FECHA M\00C1XIMA DE PRESENTACI\00D3N')
,p_format_mask=>'DD/MM/YYYY'
,p_source=>'FCHA_MXMA_PRSNTCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'+0d'
,p_attribute_03=>'&P310_CLCLA_FCHA_PRSNTCION_FINAL.'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_item_comment=>unistr('FECHA M\00C1XIMA DE PRESENTACI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8578607526708911)
,p_name=>'P310_ITEMS_FECHA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(146542123142826229)
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
 p_id=>wwv_flow_api.id(8579080206708911)
,p_name=>'P310_CLCLO_DCLRCION_CRRCCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(146542123142826229)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_prompt=>unistr('C\00C1LCULO DECLARACI\00D3N DE CORRECCI\00D3N')
,p_source=>'CLCLO_DCLRCION_CRRCCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_colspan=>4
,p_grid_column=>1
,p_display_when=>':P310_ID_DCLRCION_VGNCIA_FRMLRIO IS NOT NULL AND :P310_IDNTFCCION IS NOT NULL'
,p_display_when_type=>'SQL_EXPRESSION'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
,p_item_comment=>unistr('C\00C1LCULO DECLARACI\00D3N DE CORRECCI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8579441932708910)
,p_name=>'P310_NMRO_DCLRCION_ANTRIOR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(146542123142826229)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
,p_item_comment=>unistr('N\00DAMERO DE DECLARACI\00D3N ANTERIOR')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8579806481708910)
,p_name=>'P310_CLCLA_FCHA_PRSNTCION_FINAL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(146542123142826229)
,p_prompt=>unistr('CALCULA FECHA PRESENTACI\00D3N FINAL')
,p_format_mask=>'DD/MM/YYYY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char( pkg_gi_declaraciones_funciones.fnc_co_fcha_mxma_prsntcion( p_id_dclrcion_vgncia_frmlrio =>  :P310_ID_DCLRCION_VGNCIA_FRMLRIO,',
'                                                                          p_idntfccion => :P310_IDNTFCCION , ',
'                                                                          p_id_sjto_tpo => :P310_ID_SJTO_IMPSTO ),',
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
 p_id=>wwv_flow_api.id(8580234625708909)
,p_name=>'P310_INDICADOR_EXTEMPORANEO'
,p_item_sequence=>1460
,p_item_plug_id=>wwv_flow_api.id(146542123142826229)
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>':P310_ID_DCLRCION_VGNCIA_FRMLRIO IS NOT NULL AND :P310_IDNTFCCION IS NOT NULL'
,p_display_when_type=>'SQL_EXPRESSION'
,p_attribute_01=>'N'
,p_item_comment=>'INDICADOR EXTEMPORANEO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8580939715708909)
,p_name=>'P310_NMBRES_RZN_SCIAL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_api.id(146542192015826230)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
 p_id=>wwv_flow_api.id(8581333053708908)
,p_name=>'P310_TPO_IDENTIFICACION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_api.id(146542192015826230)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
,p_colspan=>6
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>unistr('2. TIPO DE IDENTIFICACI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8581798383708908)
,p_name=>'P310_IDENTIFICACION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_api.id(146542192015826230)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_prompt=>unistr('IDENTIFICACI\00D3N ')
,p_source=>'IDNTFCCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_colspan=>6
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_item_comment=>unistr('IDENTIFICACI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8582147152708908)
,p_name=>'P310_IDENTIFICACION_ANTERIOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_api.id(146542192015826230)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_source=>'IDNTFCCION_ANT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>unistr('IDENTIFICACI\00D3N ANTERIOR')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8582527173708908)
,p_name=>'P310_DIGITO_VERIFICACION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_api.id(146542192015826230)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_prompt=>'DV'
,p_source=>'DGTO_VRFCCION_DCLRNTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'center'
,p_item_comment=>unistr('D\00CDGITO DE VERIFICACI\00D3N')
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8582981312708907)
,p_name=>'P310_DRCCION_NTFCCION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_api.id(146542192015826230)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
 p_id=>wwv_flow_api.id(8583356851708907)
,p_name=>'P310_DEPARTAMENTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_api.id(146542192015826230)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
 p_id=>wwv_flow_api.id(8583751159708907)
,p_name=>'P310_MUNICIPIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_api.id(146542192015826230)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_prompt=>unistr('MUNICIPIO O DISTRITO DE LA <br />DIRECCI\00D3N')
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
 p_id=>wwv_flow_api.id(8584152328708907)
,p_name=>'P310_TELEFONO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_api.id(146542192015826230)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
 p_id=>wwv_flow_api.id(8584599985708906)
,p_name=>'P310_CORREO_ELECTRONICO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_api.id(146542192015826230)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_prompt=>unistr('5. CORREO ELECTR\00D3NICO')
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
 p_id=>wwv_flow_api.id(8584982967708906)
,p_name=>'P310_NMRO_ESTBLCMIENTS'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_api.id(146542192015826230)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_prompt=>'6. No .ESTABLECIMIENTOS'
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
 p_id=>wwv_flow_api.id(8585314962708906)
,p_name=>'P310_AVISOS_TABLEROS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_api.id(146542192015826230)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_prompt=>unistr('\00BFAVISOS Y TABLEROS?')
,p_source=>'AVSS_TBLRS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:S\00ED;S,No;N')
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>'AVISOS Y TABLEROS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8585727217708906)
,p_name=>'P310_CNSRCIO_UNION_TMPRL'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_api.id(146542192015826230)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'N'
,p_prompt=>unistr('\00BFES UN CONSORCIO O UNI\00D3N <br />TEMPORAL?')
,p_source=>'CNSRCIO_UNION_TMPRAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:S\00ED;S,No;N')
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>unistr('ES UN CONSORCIO O UNI\00D3N TEMPORAL')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8586146963708905)
,p_name=>'P310_RLZA_ACTDS_PNIO_AUTNMO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_api.id(146542192015826230)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'N'
,p_prompt=>unistr('\00BFREALIZA ACTIVIDADES A TRAV\00C9S DE PATRIMONIO AUT\00D3NOMO?')
,p_source=>'RLZA_ACTDS_PNIO_AUTNMO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:S\00ED;S,No;N')
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
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
 p_id=>wwv_flow_api.id(8586525023708905)
,p_name=>'P310_CNCLCION_ESTBLCMIENTO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_api.id(146542192015826230)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'N'
,p_prompt=>unistr('\00BFESTA DECLARACI\00D3N ES POR <br />CANCELACI\00D3N DEL ESTABLECIMIENTO?')
,p_source=>'CNCLCION_ESTBLCMIENTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:S\00ED;S,No;N')
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
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
 p_id=>wwv_flow_api.id(8586906699708905)
,p_name=>'P310_ES_AGNTE_AUTRTNDOR'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_api.id(146542192015826230)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'N'
,p_prompt=>unistr('\00BFES USTED UN AGENTE AUTORETENEDOR?')
,p_source=>'ES_AGNTE_AUTRTNDOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:S\00ED;S,No;N')
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>unistr('\00BFES USTED UN AGENTE AUTORETENEDOR?')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8587378182708905)
,p_name=>'P310_SOBRETASA_BOMBERIL_TRFA'
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_api.id(146542192015826230)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'TARIFA SOBRETASA BOMBERIL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8588019601708904)
,p_name=>'P310_TTL_INGRS_ORIOS_EXTRS_PAIS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_api.id(146542255437826231)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('8. TOTAL INGRESOS ORDINARIOS Y EXTRAORDINARIOS DEL PERIODO EN TODO EL PA\00CDS')
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
,p_item_comment=>unistr('8. TOTAL INGRESOS ORDINARIOS Y EXTRAORDINARIOS DEL PERIODO EN TODO EL PA\00CDS')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8588433270708904)
,p_name=>'P310_VALIDAITEM16'
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_api.id(146542255437826231)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8588876616708904)
,p_name=>'P310_MNS_INGRSS_FUERA_MNCPIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_api.id(146542255437826231)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>'9. MENOS INGRESOS FUERA DE ESTE MUNICIPIO O DISTRITO'
,p_source=>'MNS_INGRSS_FUERA_MNCPIO'
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
,p_item_comment=>'9. MENOS INGRESOS FUERA DE ESTE MUNICIPIO O DISTRITO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8589250930708903)
,p_name=>'P310_TTL_INGRS_ORIOS_EXTRS_MNCPIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_api.id(146542255437826231)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('10. TOTAL INGRESOS ORDINARIOS Y EXTRAORDINARIOS EN ESTE MUNICIPIO <br />(rengl\00F3n 8 menos 9)')
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
 p_id=>wwv_flow_api.id(8589682477708902)
,p_name=>'P310_MNS_INGRSOS_DEV_REB_DES'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_api.id(146542255437826231)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>'11. MENOS INGRESOS POR DEVOLUCIONES, REBAJAS, DESCUENTOS'
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
,p_item_comment=>'11. MENOS INGRESOS POR DEVOLUCIONES, REBAJAS, DESCUENTOS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8590015019708902)
,p_name=>'P310_MNS_INGRSOS_EXPRTCIONS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_api.id(146542255437826231)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>'12. MENOS INGRESOS POR EXPORTACIONES'
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
,p_item_comment=>'12. MENOS INGRESOS POR EXPORTACIONES'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8590486118708902)
,p_name=>'P310_MNS_INGRSOS_VNTA_ACT_FIJS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_api.id(146542255437826231)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>'13. MENOS INGRESOS POR VENTA DE ACTIVOS FIJOS'
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
,p_item_comment=>'13. MENOS INGRESOS POR VENTA DE ACTIVOS FIJOS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8590878322708902)
,p_name=>'P310_MNS_INGRSOS_ACTVDDS_EXCLDS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_api.id(146542255437826231)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>'14. MENOS INGRESOS POR ACTIVIDADES EXCLUIDAS O <br />NO SUJETAS Y OTROS INGRESOS NO GRAVADOS'
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
 p_id=>wwv_flow_api.id(8591286989708901)
,p_name=>'P310_MNS_INGRSOS_ACTVDDS_EXENTAS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>600
,p_item_plug_id=>wwv_flow_api.id(146542255437826231)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>'15. MENOS INGRESOS POR OTRAS ACTIVIDADES EXENTAS EN ESTE MUNICIPIO O <br />DISTRITO (POR ACUERDO)'
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
,p_item_comment=>'15. MENOS INGRESOS POR OTRAS ACTIVIDADES EXENTAS EN ESTE MUNICIPIO O DISTRITO (POR ACUERDO)'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8591645742708901)
,p_name=>'P310_TOTAL_INGRESOS_GRVBLES'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>610
,p_item_plug_id=>wwv_flow_api.id(146542255437826231)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_prompt=>unistr('16. TOTAL INGRESOS GRAVABLES (rengl\00F3n 10 menos 11, 12, 13, 14, 15)')
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
,p_item_comment=>unistr('16. TOTAL INGRESOS GRAVABLES (rengl\00F3n 10 menos 11, 12, 13, 14, 15)')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8592381207708900)
,p_name=>'P310_TTL_IMPSTO_INDSTRIA_CMRCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>650
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('20. TOTAL IMPUESTO DE INDUSTRIA Y COMERCIO (rengl\00F3n 17 + 19)')
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
,p_item_comment=>unistr('20. TOTAL IMPUESTO DE INDUSTRIA Y COMERCIO (rengl\00F3n 17 + 19)')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8592730908708900)
,p_name=>'P310_CLCLO_CNCPTO_INDSTRIA_CMRCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>660
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
'    //minimumValue: "0",',
'    modifyValueOnWheel: false',
'}',
''))
,p_item_comment=>unistr('C\00C1LCULO CONCEPTO INDUSTRIA COMERCIO')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8593154753708900)
,p_name=>'P310_CONCEPTO_INDUSTRIA_COMERCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>670
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
,p_item_comment=>'CONCEPTO IMPUESTO INDUSTRIA Y COMERCIO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8593533381708899)
,p_name=>'P310_SLDO_FVR_CNCPTO_INTRIA_CMRCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>680
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
,p_item_comment=>'SALDO A FAVOR CONCEPTO IMPUESTO INDUSTRIA Y COMERCIO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8593908114708899)
,p_name=>'P310_CLCLO_CNCPTO_ANT_INTRIA_CRCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>690
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
,p_item_comment=>unistr('C\00C1LCULO CONCEPTO ANTERIOR IMPUESTO INDUSTRIA Y COMERCIO')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8594396086708899)
,p_name=>'P310_CLCLO_DFCIA_PGO_INTRIA_CMRCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>700
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
'    //minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO DIFERENCIA PAGO IMPUESTO INDUSTRIA Y COMERCIO')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8594776204708899)
,p_name=>'P310_VALOR_PAGO_INDUSTRIA_COMERCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>710
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
,p_item_comment=>'VALOR DE PAGO IMPUESTO INDUSTRIA Y COMERCIO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8595168048708899)
,p_name=>'P310_CALCULO_DSCNTO_INTRIA_CMRCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>720
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
,p_item_comment=>'CALCULO DESCUENTO IMPUESTO INDUSTRIA Y COMERCIO '
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8595594654708898)
,p_name=>'P310_CALCULO_INTRSS_INTRIA_CMRCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>730
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO INTERESES IMPUESTO INDUSTRIA Y COMERCIO')
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
,p_item_comment=>unistr('C\00C1LCULO INTERESES IMPUESTO INDUSTRIA Y COMERCIO')
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8595920499708898)
,p_name=>'P310_CLCLO_DSCNTO_INT_INTRIA_CRCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>740
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO DESCUENTO INTERESES IMPUESTO INDUSTRIA Y COMERCIO')
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
,p_item_comment=>unistr('C\00C1LCULO DESCUENTO INTERESES IMPUESTO INDUSTRIA Y COMERCIO')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8596312593708898)
,p_name=>'P310_CLCLO_SLDO_FVR_PGO_INTRIA_CCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>750
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
,p_item_comment=>unistr('C\00C1LCULO SALDO A FAVOR PAGO IMPUESTO INDUSTRIA Y COMERCIO')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8596740492708898)
,p_name=>'P310_IMPUESTO_AVISOS_TABLEROS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>760
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('21. IMPUESTO DE AVISOS Y TABLEROS (15% de rengl\00F3n 20)')
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
,p_item_comment=>unistr('21. IMPUESTO DE AVISOS Y TABLEROS (15% de rengl\00F3n 20)')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8597197219708897)
,p_name=>'P310_SALDO_FAVOR_AVISOS_TABLEROS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>770
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>'21. SALDO A FAVOR CONCEPTO AVISOS Y TABLEROS'
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
,p_item_comment=>'21. SALDO A FAVOR CONCEPTO AVISOS Y TABLEROS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8597579992708897)
,p_name=>'P310_CONCEPTO_AVISOS_TABLEROS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>780
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>'21. CONCEPTO AVISOS Y TABLEROS'
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
,p_item_comment=>'21. CONCEPTO AVISOS Y TABLEROS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8597902880708897)
,p_name=>'P310_DIFERENCIA_AVISOS_TABLEROS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>790
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>'21. DIFERENCIA CONCEPTO AVISOS Y TABLEROS'
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
'    //emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'   // minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'21. DIFERENCIA CONCEPTO AVISOS Y TABLEROS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8598346104708896)
,p_name=>'P310_CLCLO_ANTERIOR_AVISOS_TBLRS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>800
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('21. C\00C1LCULO CONCEPTO ANTERIOR IMPUESTO DE AVISOS Y TABLEROS')
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
,p_item_comment=>unistr('21. C\00C1LCULO CONCEPTO ANTERIOR IMPUESTO DE AVISOS Y TABLEROS')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8598787425708896)
,p_name=>'P310_CLCLO_DFCIA_PGO_AVSS_TBLRS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>810
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('21. C\00C1LCULO DIFERENCIA PAGO IMPUESTO DE AVISOS Y TABLEROS')
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
'    //minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('21. C\00C1LCULO DIFERENCIA PAGO IMPUESTO DE AVISOS Y TABLEROS')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8599164292708896)
,p_name=>'P310_VLR_PAGO_AVISOS_TABLEROS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>820
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>'21. VALOR PAGO IMPUESTO DE AVISOS Y TABLEROS'
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
,p_item_comment=>'21. VALOR PAGO IMPUESTO DE AVISOS Y TABLEROS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8599516222708896)
,p_name=>'P310_CLCLO_DSCNTO_AVSS_TBLRS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>830
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('21. C\00C1LCULO DESCUENTO IMPUESTO DE AVISOS Y TABLEROS')
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
,p_item_comment=>unistr('21. C\00C1LCULO DESCUENTO IMPUESTO DE AVISOS Y TABLEROS')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8599954012708895)
,p_name=>'P310_CLCLO_INTRSS_AVSS_TBLRS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>840
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('21. C\00C1LCULO INTERESES IMPUESTO DE AVISOS Y TABLEROS')
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
,p_item_comment=>unistr('21. C\00C1LCULO INTERESES IMPUESTO DE AVISOS Y TABLEROS')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8600311205708895)
,p_name=>'P310_CLCLO_DSCNTO_INT_AVSS_TBS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>850
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('21. C\00C1LCULO DESCUENTO INTERESES IMPUESTO DE AVISOS Y TABLEROS')
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
,p_item_comment=>unistr('21. C\00C1LCULO DESCUENTO INTERESES IMPUESTO DE AVISOS Y TABLEROS')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8600710313708895)
,p_name=>'P310_CLCLO_SLDO_FVR_PGO_AVSS_TBS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>860
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('21. C\00C1LCULO SALDO A FAVOR PAGO IMPUESTO DE AVISOS Y TABLEROS')
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
,p_item_comment=>unistr('21. C\00C1LCULO SALDO A FAVOR PAGO IMPUESTO DE AVISOS Y TABLEROS')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8601196844708895)
,p_name=>'P310_PGO_UNDDS_CMRCLS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>880
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
,p_item_comment=>'22. PAGO POR UNIDADES COMERCIALES ADICIONALES DEL SECTOR FINANCIERO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8601554792708894)
,p_name=>'P310_SOBRETASA_BOMBERIL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>890
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('23. SOBRETASA BOMBERIL (Ley 1575 de 2012) (Si la hay, liqu\00EDdala seg\00FAn el acuerdo municipal o distrital)')
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
,p_item_comment=>'23. SOBRETASA BOMBERIL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8601962564708894)
,p_name=>'P310_SLDO_FVR_CNPTO_SBTSA_BMRL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>900
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>'23. SALDO A FAVOR CONCEPTO SOBRETASA BOMBERIL'
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
,p_item_comment=>'23. SALDO A FAVOR CONCEPTO SOBRETASA BOMBERIL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8602357259708894)
,p_name=>'P310_DFRNCIA_CNCPTO_SBTSA_BMRL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>910
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>'23. DIFERENCIA CONCEPTO SOBRETASA BOMBERIL'
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
'    //emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    //minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'23. DIFERENCIA CONCEPTO SOBRETASA BOMBERIL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8602798271708894)
,p_name=>'P310_CNCPTO_SBRTSA_BMBRL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>920
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>'23. CONCEPTO SOBRETASA BOMBERIL'
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
,p_item_comment=>'23. CONCEPTO SOBRETASA BOMBERIL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8603195839708893)
,p_name=>'P310_CLCLO_CNCPTO_ANT_STSA_BMRL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>930
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>'23. CALCULO CONCEPTO ANTERIOR SOBRETASA BOMBERIL'
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
,p_item_comment=>'23. CALCULO CONCEPTO ANTERIOR SOBRETASA BOMBERIL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8603508880708893)
,p_name=>'P310_CLCLO_DIF_PGO_STSA_BMRL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>940
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('23. C\00C1LCULO DIFERENCIA PAGO SOBRETASA BOMBERIL')
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
'   // minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('23. C\00C1LCULO DIFERENCIA PAGO SOBRETASA BOMBERIL')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8603936417708893)
,p_name=>'P310_CLCLO_VLR_PGO_STSA_BMRL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>950
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('23. C\00C1LCULO VALOR PAGO IMPUESTO SOBRETASA BOMBERIL')
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
,p_item_comment=>unistr('23. C\00C1LCULO VALOR PAGO IMPUESTO SOBRETASA BOMBERIL')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8604349379708893)
,p_name=>'P310_CLCLO_DSCNTO_STSA_BMRL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>960
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
,p_item_comment=>unistr('23. C\00C1LCULO DESCUENTO SOBRETASA BOMBERIL')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8604717224708892)
,p_name=>'P310_CLCLO_INTRSES_STSA_BMRL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>970
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('23. C\00C1LCULO INTERESES SOBRETASA BOMBERIL')
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
,p_item_comment=>unistr('23. C\00C1LCULO INTERESES SOBRETASA BOMBERIL')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8605193775708892)
,p_name=>'P310_CLCLO_DSCNTO_INT_STSA_BMRL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>980
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('23. C\00C1LCULO DESCUENTO INTERESES SOBRETASA BOMBERIL')
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
,p_item_comment=>unistr('23. C\00C1LCULO DESCUENTO INTERESES SOBRETASA BOMBERIL')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8605515387708892)
,p_name=>'P310_CLCLO_SLDO_FVR_PGO_STSA_BMRL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>990
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('23. C\00C1LCULO SALDO A FAVOR PAGO SOBRETASA BOMBERIL')
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
,p_item_comment=>unistr('23. C\00C1LCULO SALDO A FAVOR PAGO SOBRETASA BOMBERIL')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8605920094708892)
,p_name=>'P310_SOBRETASA_SEGURIDAD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1000
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
,p_item_comment=>unistr('24. SOBRETASA DE SEGURIDAD (LEY 1421 de 2011) (Si la hay, liqu\00EDdela seg\00FAn el acuerdo municipal o distrital)')
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8606305383708892)
,p_name=>'P310_CNCPTO_SBRTSA_SGRDD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1010
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>'24. CONCEPTO SOBRETASA DE SEGURIDAD'
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
,p_item_comment=>'24. CONCEPTO SOBRETASA DE SEGURIDAD'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8606737162708891)
,p_name=>'P310_DFRNCIA_CNCPTO_STSA_SGRD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1020
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>'24. DIFERENCIA CONCEPTO SOBRETASA DE SEGURIDAD'
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
'    //emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    //minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'24. DIFERENCIA CONCEPTO SOBRETASA DE SEGURIDAD'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8607101713708891)
,p_name=>'P310_SLDO_FVR_CNCPTO_STSA_SGRD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1030
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>'24. SALDO A FAVOR CONCEPTO SOBRETASA DE SEGURIDAD'
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
,p_item_comment=>'24. SALDO A FAVOR CONCEPTO SOBRETASA DE SEGURIDAD'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8607535832708891)
,p_name=>'P310_CLCLO_CNCPTO_ANT_STSA_SGRD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1040
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('24. C\00C1LCULO CONCEPTO ANTERIOR SOBRETASA DE SEGURIDAD')
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
,p_item_comment=>unistr('24. C\00C1LCULO CONCEPTO ANTERIOR SOBRETASA DE SEGURIDAD')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8607984214708890)
,p_name=>'P310_CLCLO_DIF_PGO_STSA_SGRD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1050
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('24. C\00C1LCULO DIFERENCIA PAGO SOBRETASA DE SEGURIDAD')
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
'    //minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('24. C\00C1LCULO DIFERENCIA PAGO SOBRETASA DE SEGURIDAD')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8608337285708890)
,p_name=>'P310_CALCULO_PGO_STSA_SGRD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1060
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('24. C\00C1LCULO PAGO SOBRETASA DE SEGURIDAD')
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
,p_item_comment=>unistr('24. C\00C1LCULO PAGO SOBRETASA DE SEGURIDAD')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8608777098708890)
,p_name=>'P310_CLCLO_DSCNTO_STSA_SGRD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1070
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('24. C\00C1LCULO DESCUENTO SOBRETASA DE SEGURIDAD')
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
,p_item_comment=>unistr('24. C\00C1LCULO DESCUENTO SOBRETASA DE SEGURIDAD')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8609184471708890)
,p_name=>'P310_CLCLO_INTRSES_STSA_SGRD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1080
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('24. C\00C1LCULO INTERESES SOBRETASA DE SEGURIDAD')
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
,p_item_comment=>unistr('24. C\00C1LCULO INTERESES SOBRETASA DE SEGURIDAD')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8609596724708889)
,p_name=>'P310_CLCLO_DSCNTO_INT_STSA_SGRD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1090
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('24. C\00C1LCULO DESCUENTO INTERESES  SOBRETASA DE SEGURIDAD')
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
,p_item_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('24. C\00C1LCULO DESCUENTO INTERESES SOBRETASA DE SEGURIDAD'),
''))
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8609916022708889)
,p_name=>'P310_CLCLO_SLDO_FVR_PGO_STSA_SGRD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1100
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('24. C\00C1LCULO SALDO A FAVOR PAGO SOBRETASA DE SEGURIDAD')
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
,p_item_comment=>unistr('24. C\00C1LCULO SALDO A FAVOR PAGO SOBRETASA DE SEGURIDAD')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8610338095708889)
,p_name=>'P310_TOTAL_IMPUESTO_CARGO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1110
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('25. TOTAL IMPUESTO A CARGO (RENGL\00D3N 20+21+22+23+24)')
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
,p_item_comment=>unistr('25. TOTAL IMPUESTO A CARGO (RENGL\00D3N 20+21+22+23+24)')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8610788490708889)
,p_name=>'P310_MENS_VLR_EXNCN_EXNRCN_IMPSTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1120
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('26. MENOS VALOR DE EXENCI\00D3N O EXONERACI\00D3N SOBRE EL IMPUESTO Y NO <br />SOBRE LOS INGRESOS')
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
,p_item_comment=>unistr('26. MENOS VALOR DE EXENCI\00D3N O EXONERACI\00D3N SOBRE EL IMPUESTO Y NO SOBRE LOS INGRESOS')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8611150867708888)
,p_name=>'P310_MENOS_RETENCIONES'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1130
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>'27. MENOS RETENCIONES QUE LE PRACTICARON A FAVOR DE ESTE MUNICIPO O <br />DISTRITO EN ESTE PERiODO '
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
,p_item_comment=>'27. MENOS RETENCIONES QUE LE PRACTICARON A FAVOR DE ESTE MUNICIPO O DISTRITO EN ESTE PERiODO '
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8611552958708888)
,p_name=>'P310_MENOS_AUTORRETENCIONES'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1140
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>'28. MENOS AUTORRETENCIONES PRACTICADAS A FAVOR DE ESTE MUNICIPIO O <br />DISTRITO EN ESTE PERIODO'
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
,p_item_comment=>'28. MENOS AUTORRETENCIONES PRACTICADAS A FAVOR DE ESTE MUNICIPIO O DISTRITO EN ESTE PERIODO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8611960899708888)
,p_name=>'P310_MENS_ANTCPO_LIQDDO_ANIO_ANTR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1150
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('29. MENOS ANTICIPO LIQUIDADO EN EL A\00D1O ANTERIOR')
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
,p_item_comment=>unistr('29. MENOS ANTICIPO LIQUIDADO EN EL A\00D1O ANTERIOR')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8612355128708888)
,p_name=>'P310_ANTICIPO_ANIO_SIGUIENTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1170
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
,p_item_comment=>unistr('30. ANTICIPO DEL A\00D1O SIGUIENTE (40% seg\00FAn Acuerdo Municipal)')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8612708163708888)
,p_name=>'P310_DFRNCIA_CNCPTO_ANTCPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1180
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>'30. DIFERENCIA CONCEPTO ANTICIPO'
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
,p_item_comment=>'30. DIFERENCIA CONCEPTO ANTICIPO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8613133596708887)
,p_name=>'P310_SLDO_FVR_CNCPTO_ANTCPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1190
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>'30. SALDO A FAVOR ANTICIPO'
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
,p_item_comment=>'30. SALDO A FAVOR ANTICIPO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8613459880708887)
,p_name=>'P310_VALOR_CONCEPTO_ANTICIPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1200
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>'30. CONCEPTO ANTICIPO'
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
,p_item_comment=>'30. CONCEPTO ANTICIPO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8613839736708887)
,p_name=>'P310_CLCLO_CNCPTO_ANT_ANTICIPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1210
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
,p_item_comment=>unistr('30. C\00C1LCULO CONCEPTO ANTERIOR ANTICIPO')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8614221887708887)
,p_name=>'P310_CALCULO_PGO_ANTICIPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1220
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
,p_item_comment=>unistr('30. C\00C1LCULO PAGO CONCEPTO ANTICIPO')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8614651613708886)
,p_name=>'P310_CLCLO_DIF_PGO_ANTICIPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1230
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
'    //minimumValue: "0",',
'    modifyValueOnWheel: false',
'}',
''))
,p_item_comment=>unistr('30. C\00C1LCULO DIFERENCIA PAGO ANTICIPO')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8615097407708886)
,p_name=>'P310_CALCULO_INTERES_ANTICIPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1240
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('30. C\00C1LCULO INTERES ANTICIPO')
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
,p_item_comment=>unistr('30. C\00C1LCULO INTERES ANTICIPO')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8615457091708886)
,p_name=>'P310_CLCLO_DSCNTO_INT_ANTICIPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1250
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
 p_id=>wwv_flow_api.id(8615820140708886)
,p_name=>'P310_CLCLO_SLDO_FVR_PGO_ANTICIPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1260
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('30. C\00C1LCULO SALDO A FAVOR PAGO ANTICIPO')
,p_source=>'CLCLO_SLDO_FVR_PGO_ANTCPO'
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8616261395708885)
,p_name=>'P310_TIPO_SANCION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1270
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_prompt=>unistr('TIPO SANCI\00D3N')
,p_source=>'TPO_SNCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion         text,',
'        a.cdgo_sncion_tpo   value',
'from    gi_d_sanciones_tipo a',
'where   1 = case --when :RGN67ATR292FLAX is null and a.cdgo_sncion_tpo is not null then 1',
'                 when :P310_OPCION_DE_USO = ''DCO'' and a.cdgo_sncion_tpo <> ''EXT'' then 1',
'                 when :P310_OPCION_DE_USO = ''DIN'' and a.cdgo_sncion_tpo <> ''COR'' then 1',
'                else 0',
'            end',
'and a.cdgo_sncion_tpo IN (''EXT'',''COR'')',
'and :P310_INDICADOR_EXTEMPORANEO = ''S''',
'order by a.dscrpcion'))
,p_lov_cascade_parent_items=>'P310_OPCION_DE_USO,P310_INDICADOR_EXTEMPORANEO'
,p_ajax_items_to_submit=>'P310_TIPO_SANCION,P310_TIPO_CALCULO_SANCION'
,p_ajax_optimize_refresh=>'N'
,p_cHeight=>1
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>unistr('31. TIPO SANCI\00D3N')
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8616687509708885)
,p_name=>'P310_TIPO_CALCULO_SANCION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1280
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
'where   a.tipo              = :P310_TIPO_SANCION',
'--and     value = ''M''',
'and     :P310_TIPO_SANCION  is not null'))
,p_lov_cascade_parent_items=>'P310_TIPO_SANCION'
,p_ajax_items_to_submit=>'P310_TIPO_CALCULO_SANCION'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>unistr('31. TIPO C\00C1LCULO SANCI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8617092791708884)
,p_name=>'P310_SANCION_MANUAL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1290
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>'31.  SANCIONES'
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
,p_item_comment=>'31. SANCIONES'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8617411348708884)
,p_name=>'P310_SANCION_SUGERIDA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1300
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>'31.  SANCIONES (SUGERIDA)'
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
,p_item_comment=>'31. SANCIONES (SUGERIDA)'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8617840441708884)
,p_name=>'P310_CLCLO_IMPSTO_CRGO_SNCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1310
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('31.  C\00C1LCULO IMPUESTO A CARGO SANCI\00D3N')
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
,p_item_comment=>unistr('31.  C\00C1LCULO IMPUESTO A CARGO SANCI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8618267989708884)
,p_name=>'P310_CLCLO_NETO_SANCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1320
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('31.  C\00C1LCULO NETO SANCI\00D3N')
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
'    //minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('31.  C\00C1LCULO NETO SANCI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8618605729708883)
,p_name=>'P310_SANCION_SELECCIONADA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1330
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>'31.  concepto SANCION'
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
'   // minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'31.  concepto SANCION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8619092786708883)
,p_name=>'P310_DIFERENCIA_CNCPTO_SNCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1340
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('31.  DIFERENCIA CONCEPTO SANCI\00D3N')
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
'    //emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'   // minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('31.  DIFERENCIA CONCEPTO SANCI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8619446721708883)
,p_name=>'P310_CALCULO_DFRNCIA_PGO_SNCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1350
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('31.  C\00C1LCULO DIFERENCIA PAGO SANCI\00D3N')
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
'   // minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('31.  C\00C1LCULO DIFERENCIA PAGO SANCI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8619864054708883)
,p_name=>'P310_VALOR_CONCEPTO_SANCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1360
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('31.  Calculo pago IMPUESTO SANCI\00D3N')
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
,p_item_comment=>unistr('31.  Calculo pago IMPUESTO SANCI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8620239832708882)
,p_name=>'P310_CLCLO_DESCUENTO_SANCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1370
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('31.  C\00C1LCULO DESCUENTO SANCI\00D3N')
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
,p_item_comment=>unistr('31.  C\00C1LCULO DESCUENTO SANCI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8620613728708882)
,p_name=>'P310_CLCLO_SLDO_FVR_PGO_SNCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1380
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('31.  C\00C1LCULO SALDO A FAVOR PAGO SANCI\00D3N')
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
,p_item_comment=>unistr('31.  C\00C1LCULO SALDO A FAVOR PAGO SANCI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8621075109708882)
,p_name=>'P310_MENOS_SLDO_FVR_PRDO_ANTRIOR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1390
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
,p_item_comment=>unistr('32. MENOS SALDO A FAVOR DEL PERIODO ANTERIOR SIN SOLICITUD DE DEVOLUCI\00D3N O COMPENSACI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8621422834708882)
,p_name=>'P310_CALCULO_TOTAL_SALDO_CARGO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1400
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('33. C\00C1LCULO TOTAL SALDO A CARGO (RENGL\00D3N 25-26-27-28-29+30+31-32)')
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
,p_item_comment=>unistr('33. C\00C1LCULO TOTAL SALDO A CARGO (RENGL\00D3N 25-26-27-28-29+30+31-32)')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8621858263708881)
,p_name=>'P310_TOTAL_SALDO_CARGO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1410
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('33. TOTAL SALDO A CARGO (RENGL\00D3N 25-26-27-28-29+30+31-32)')
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
,p_item_comment=>unistr('33. TOTAL SALDO A CARGO (RENGL\00D3N 25-26-27-28-29+30+31-32)')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8622208479708881)
,p_name=>'P310_TOTAL_SALDO_FAVOR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1420
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('34. TOTAL SALDO A FAVOR (RENGL\00D3N 25-26-27-28-29+30+31-32) SI EL RESULTADO ES <br />MENOR A CERO')
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
,p_item_comment=>unistr('34. TOTAL SALDO A FAVOR (RENGL\00D3N 25-26-27-28-29+30+31-32) SI EL RESULTADO ES MENOR A CERO')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8622668244708881)
,p_name=>'P310_ITEM_CERO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1430
,p_item_plug_id=>wwv_flow_api.id(146542534937826233)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8623371548708880)
,p_name=>'P310_VALOR_PAGAR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1360
,p_item_plug_id=>wwv_flow_api.id(146542579838826234)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>'35. VALOR A PAGAR'
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
,p_item_comment=>'35. VALOR A PAGAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8623775101708880)
,p_name=>'P310_DESCUENTO_PRONTO_PAGO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1370
,p_item_plug_id=>wwv_flow_api.id(146542579838826234)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('36. DESCUENTO POR PRONTO PAGO (Si existe, liqu\00EDdelo seg\00FAn el<br /> Acuerdo Municipal o distrital)')
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
,p_item_comment=>unistr('36. DESCUENTO POR PRONTO PAGO (Si existe, liqu\00EDdelo seg\00FAn el Acuerdo Municipal o distrital)')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8624146535708880)
,p_name=>'P310_INTERESES_MORA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1380
,p_item_plug_id=>wwv_flow_api.id(146542579838826234)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>'37. INTERESES DE MORA'
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
,p_item_comment=>'37. INTERESES DE MORA'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8624526658708879)
,p_name=>'P310_TOTAL_PAGAR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1390
,p_item_plug_id=>wwv_flow_api.id(146542579838826234)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('38. TOTAL A PAGAR (RENGL\00D3N 35-36+37)')
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
'    //minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('38. TOTAL A PAGAR (RENGL\00D3N 35-36+37)')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8624969710708879)
,p_name=>'P310_APORTE_VOLUNTARIO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1400
,p_item_plug_id=>wwv_flow_api.id(146542579838826234)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
 p_id=>wwv_flow_api.id(8625398667708879)
,p_name=>'P310_VALOR_PAGO_VOLUNTARIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1410
,p_item_plug_id=>wwv_flow_api.id(146542579838826234)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>unistr('39. LIQUIDE EL VALOR DEL PAGO VOLUNTARIO (Seg\00FAn instrucciones <br />del municipio/distrito)')
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
'   // minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('39. LIQUIDE EL VALOR DEL PAGO VOLUNTARIO (Seg\00FAn instrucciones del municipio/distrito)')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8625746745708878)
,p_name=>'P310_DESTINO_APORTE_VOLUNTARIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1420
,p_item_plug_id=>wwv_flow_api.id(146542579838826234)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>'DESTINO DE MI APORTE VOLUNTARIO'
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
,p_item_comment=>'DESTINO DE MI APORTE VOLUNTARIO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8626136065708878)
,p_name=>'P310_TOTAL_PAGAR_PAGO_VOLUNTARIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1430
,p_item_plug_id=>wwv_flow_api.id(146542579838826234)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
,p_item_comment=>unistr('40. TOTAL A PAGAR CON PAGO VOLUNTARIO (Rengl\00F3n 38 + 39)')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8626580609708878)
,p_name=>'P310_VALOR_PAGAR_BANCOS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1440
,p_item_plug_id=>wwv_flow_api.id(146542579838826234)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
,p_item_comment=>'VALOR A PAGAR EN BANCOS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8626937325708877)
,p_name=>'P310_CALCULO_VALOR_PAGAR_BANCOS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1450
,p_item_plug_id=>wwv_flow_api.id(146542579838826234)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
'    //minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO  A PAGAR BANCOS')
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8627932345708876)
,p_name=>'P310_NOMBRES_DECLARANTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(22561880291204678)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_prompt=>'NOMBRES Y APELLIDOS DEL DECLARANTE'
,p_source=>'ID_SJTO_RSPNSBLE_FRMA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.prmer_nmbre || '' '' || a.prmer_aplldo || '' '' || a.sgndo_aplldo d,',
'         a.id_sjto_rspnsble r',
'    from si_i_sujetos_responsable a',
'   where a.id_sjto_impsto = :P310_ID_SJTO_IMPSTO',
'     and a.cdgo_tpo_rspnsble in (''L'',''A'', ''R'', ''P'', ''LS'')',
'     and a.prncpal_s_n =''S''',
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
 p_id=>wwv_flow_api.id(8628371695708876)
,p_name=>'P310_TPO_IDNTFCCION_DCLRNTE_FRMA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(22561880291204678)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_idntfccion_tpo ',
'from df_s_identificaciones_tipo',
'where cdgo_idntfccion_tpo IN( select b.cdgo_idntfccion_tpo ',
'                              from si_i_sujetos_responsable b ',
'                              where b.id_sjto_rspnsble  = :P310_NOMBRES_DECLARANTE) ',
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
'where   a.id_sjto_rspnsble  = :P310_NOMBRES_DECLARANTE )',
'order by dscrpcion_idntfccion_tpo asc;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P310_NOMBRES_DECLARANTE'
,p_ajax_items_to_submit=>'P310_NOMBRES_DECLARANTE,P310_TPO_IDNTFCCION_DCLRNTE_FRMA'
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
 p_id=>wwv_flow_api.id(8628701950708875)
,p_name=>'P310_IDNTFCCION_RPRSNTNTE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(22561880291204678)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
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
 p_id=>wwv_flow_api.id(8629127212708875)
,p_name=>'P310_ETIQUETA_PRINCIPAL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(22561880291204678)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
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
 p_id=>wwv_flow_api.id(8629847124708874)
,p_name=>'P310_NOMBRES_DECLARANTE_REVISOR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(23665300433385929)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_prompt=>'NOMBRES Y APELLIDOS CONTADOR O REVISOR FISCAL'
,p_source=>'ID_SJTO_RSPNSBLE_FR_RVS_CNTDOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  trim(a.prmer_nmbre) || '' '' ||trim(a.sgndo_nmbre) ||'' '' || trim(a.prmer_aplldo) ||'' ''|| trim(a.sgndo_aplldo)  text,',
'a.id_sjto_rspnsble value',
'from si_i_sujetos_responsable a',
'where a.id_sjto_impsto = :P310_ID_SJTO_IMPSTO',
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
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>'NOMBRES Y APELLIDOS REVISOR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8630293215708874)
,p_name=>'P310_TPO_IDENTIFICACION_REVISOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(23665300433385929)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_idntfccion_tpo ',
'from df_s_identificaciones_tipo',
'where cdgo_idntfccion_tpo IN( select b.cdgo_idntfccion_tpo ',
'                              from si_i_sujetos_responsable b ',
'                              where b.id_sjto_rspnsble  = :P310_NOMBRES_DECLARANTE_REVISOR) ',
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
 p_id=>wwv_flow_api.id(8630625763708874)
,p_name=>'P310_IDENTIFICACION_REVISOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(23665300433385929)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_prompt=>unistr('N\00B0 IDENTIFICACI\00D3N')
,p_source=>'IDNTFCCION_RSPNS_FR_RVS_CNTDOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>20
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_item_comment=>unistr('N\00B0 IDENTIFICACI\00D3N REVISOR')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8631018747708873)
,p_name=>'P310_TARJETA_PROFESIONAL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(23665300433385929)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_prompt=>'TARJETA PROFESIONAL'
,p_source=>'TARJETA_PROFESIONAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>100
,p_cMaxlength=>50
,p_colspan=>10
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
,p_item_comment=>'TARJETA PROFESIONAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8631461138708873)
,p_name=>'P310_REVISADO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(23665300433385929)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_idntfccion_tpo ',
'from df_s_identificaciones_tipo',
'where cdgo_idntfccion_tpo IN( select b.cdgo_idntfccion_tpo ',
'                              from si_i_sujetos_responsable b ',
'                              where b.id_sjto_rspnsble  = :P310_NOMBRES_DECLARANTE_REVISOR) ',
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
 p_id=>wwv_flow_api.id(8631814172708873)
,p_name=>'P310_ETIQUETA_SECUNDARIA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(23665300433385929)
,p_item_source_plug_id=>wwv_flow_api.id(146432375401819096)
,p_item_default=>'0'
,p_prompt=>'ETIQUETA SECUNDARIA'
,p_source=>'ETQUETA_FRMA_SCNDRIA'
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
,p_item_comment=>'ETIQUETA FIRMA SECUNDARIO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8634018658708871)
,p_name=>'P310_IDNTFCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(330518870403390502)
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
 p_id=>wwv_flow_api.id(8634421113708871)
,p_name=>'P310_ID_PAGE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(330518870403390502)
,p_prompt=>'Id Page'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(8683920835708840)
,p_computation_sequence=>10
,p_computation_item=>'P310_CLCLA_FCHA_PRSNTCION_FINAL'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char( pkg_gi_declaraciones_funciones.fnc_co_fcha_mxma_prsntcion( p_id_dclrcion_vgncia_frmlrio =>  :P310_ID_DCLRCION_VGNCIA_FRMLRIO,',
'                                                                          p_idntfccion => :P310_IDNTFCCION , ',
'                                                                          p_id_sjto_tpo => :P310_ID_SJTO_IMPSTO ),',
'                                                                          ''dd/mm/yyyy'' ) as fecha from dual'))
,p_compute_when_type=>'NEVER'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(8684332768708839)
,p_computation_sequence=>20
,p_computation_item=>'P310_ID_PAGE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8689951906708835)
,p_validation_name=>'P310_FCHA_RGSTRO must be timestamp'
,p_validation_sequence=>130
,p_validation=>'P310_FCHA_RGSTRO'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>unistr('#LABEL# no es una fecha val\00EDda.')
,p_validation_condition_type=>'NEVER'
,p_associated_item=>wwv_flow_api.id(8556886000708937)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8690361700708835)
,p_validation_name=>'P310_FCHA_ULTMA_MDFCCION must be timestamp'
,p_validation_sequence=>150
,p_validation=>'P310_FCHA_ULTMA_MDFCCION'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>unistr('#LABEL# no es una fecha val\00EDda.')
,p_validation_condition_type=>'NEVER'
,p_associated_item=>wwv_flow_api.id(8557699279708936)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8690779537708835)
,p_validation_name=>'P310_FCHA_PRSNTCION must be timestamp'
,p_validation_sequence=>160
,p_validation=>'P310_FCHA_PRSNTCION'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>unistr('#LABEL# no es una fecha val\00EDda.')
,p_validation_condition_type=>'NEVER'
,p_associated_item=>wwv_flow_api.id(8558056614708936)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8691191219708835)
,p_validation_name=>'P310_FCHA_APLCCION must be timestamp'
,p_validation_sequence=>180
,p_validation=>'P310_FCHA_APLCCION'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>unistr('#LABEL# no es una fecha val\00EDda.')
,p_validation_condition_type=>'NEVER'
,p_associated_item=>wwv_flow_api.id(8558870183708936)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8691560294708835)
,p_validation_name=>'P310_FCHA_ANLCION must be timestamp'
,p_validation_sequence=>250
,p_validation=>'P310_FCHA_ANLCION'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>unistr('#LABEL# no es una fecha val\00EDda.')
,p_validation_condition_type=>'NEVER'
,p_associated_item=>wwv_flow_api.id(8561656035708934)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8691972324708834)
,p_validation_name=>'P310_FCHA_PRSNTCION_PRYCTDA must be timestamp'
,p_validation_sequence=>260
,p_validation=>'P310_FCHA_PRSNTCION_PRYCTDA'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>unistr('#LABEL# no es una fecha val\00EDda.')
,p_validation_condition_type=>'NEVER'
,p_associated_item=>wwv_flow_api.id(8562076813708934)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8692334649708834)
,p_validation_name=>'P310_FCHA_MAXIMA_PRSNTCION must be timestamp'
,p_validation_sequence=>330
,p_validation=>'P310_FCHA_MAXIMA_PRSNTCION'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>unistr('#LABEL# no es una fecha val\00EDda.')
,p_when_button_pressed=>wwv_flow_api.id(8546468280708947)
,p_associated_item=>wwv_flow_api.id(8578251387708912)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8685520929708838)
,p_validation_name=>'Validar que no este vacio'
,p_validation_sequence=>340
,p_validation=>'P310_TOTAL_INGRESOS_GRAVADS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'El campo TOTAL INGRESOS GRAVADOS esta vacio '
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(8546468280708947)
,p_associated_item=>wwv_flow_api.id(8573627993708915)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8688766296708836)
,p_validation_name=>'Validar que P310_FCHA_MAXIMA_PRSNTCION no este vacio'
,p_validation_sequence=>350
,p_validation=>'P310_FCHA_MAXIMA_PRSNTCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo FECHA M\00C1XIMA PRESENTACI\00D3N esta vac\00EDo ')
,p_when_button_pressed=>wwv_flow_api.id(8546468280708947)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8689144033708836)
,p_validation_name=>unistr('Validar que P310_OPCION_DE_USO no este vac\00EDo')
,p_validation_sequence=>370
,p_validation=>'P310_OPCION_DE_USO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo TIPO DE USO esta vac\00EDo ')
,p_when_button_pressed=>wwv_flow_api.id(8546468280708947)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8686706371708837)
,p_validation_name=>unistr('Validar que P310_CLASIFICACION no este vac\00EDo')
,p_validation_sequence=>380
,p_validation=>'P310_CLASIFICACION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo CLASIFICACI\00D3N esta vac\00EDo ')
,p_when_button_pressed=>wwv_flow_api.id(8546468280708947)
,p_associated_item=>wwv_flow_api.id(8577451245708912)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8689561252708836)
,p_validation_name=>'Validar que P310_NOMBRES_DECLARANTE no este vacio'
,p_validation_sequence=>390
,p_validation=>'P310_NOMBRES_DECLARANTE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'El campo NOMBRES Y APELLIDOS DEL DECLARANTE esta vacio '
,p_when_button_pressed=>wwv_flow_api.id(8546468280708947)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8685940747708837)
,p_validation_name=>'validar estructura email'
,p_validation_sequence=>400
,p_validation=>'P310_CORREO_ELECTRONICO'
,p_validation2=>'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>unistr('El correo ingresado no es v\00E1lido.')
,p_when_button_pressed=>wwv_flow_api.id(8546468280708947)
,p_associated_item=>wwv_flow_api.id(8584599985708906)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8686332357708837)
,p_validation_name=>unistr('validar P310_CORREO_ELECTRONICO no este vac\00EDo')
,p_validation_sequence=>410
,p_validation=>'P310_CORREO_ELECTRONICO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo CORREO ELECTRONICO esta vac\00EDo ')
,p_when_button_pressed=>wwv_flow_api.id(8546468280708947)
,p_associated_item=>wwv_flow_api.id(8584599985708906)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8687121855708837)
,p_validation_name=>unistr('Validar que el campo P310_AVISOS_TABLEROS no este vac\00EDo')
,p_validation_sequence=>420
,p_validation=>'P310_AVISOS_TABLEROS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo  \00BFAVISOS Y TABLEROS? est\00E1 vac\00EDo.')
,p_when_button_pressed=>wwv_flow_api.id(8546468280708947)
,p_associated_item=>wwv_flow_api.id(8585314962708906)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8687526150708837)
,p_validation_name=>unistr('Validar que el campo P310_CNSRCIO_UNION_TMPRL no este vac\00EDo')
,p_validation_sequence=>430
,p_validation=>'P310_CNSRCIO_UNION_TMPRL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo \00BFES UN CONSORCIO O UNI\00D3N TEMPORAL? est\00E1 vac\00EDo.')
,p_when_button_pressed=>wwv_flow_api.id(8546468280708947)
,p_associated_item=>wwv_flow_api.id(8585727217708906)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8687954557708837)
,p_validation_name=>unistr('Validar que el campo P310_RLZA_ACTDS_PNIO_AUTNMO no este vac\00EDo')
,p_validation_sequence=>440
,p_validation=>'P310_RLZA_ACTDS_PNIO_AUTNMO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('El campo \00BFREALIZA ACTIVIDADES A TRAV\00C9S DE '),
unistr('PATRIMONIO AUT\00D3NOMO? est\00E1 vac\00EDo.')))
,p_when_button_pressed=>wwv_flow_api.id(8546468280708947)
,p_associated_item=>wwv_flow_api.id(8586146963708905)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8688380625708836)
,p_validation_name=>unistr('Validar que el campo P310_CNCLCION_ESTBLCMIENTO no este vac\00EDo')
,p_validation_sequence=>450
,p_validation=>'P310_CNCLCION_ESTBLCMIENTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('El campo \00BFESTA DECLARACI\00D3N ES POR CANCELACI\00D3N '),
unistr('DEL ESTABLECIMIENTO? est\00E1 vac\00EDo.')))
,p_when_button_pressed=>wwv_flow_api.id(8546468280708947)
,p_associated_item=>wwv_flow_api.id(8586525023708905)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8692719164708834)
,p_validation_name=>unistr('Validar que el campo P310_ES_AGNTE_AUTRTNDOR no este vac\00EDo_1')
,p_validation_sequence=>460
,p_validation=>'P310_ES_AGNTE_AUTRTNDOR'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo #LABEL# est\00E1 vac\00EDo.')
,p_when_button_pressed=>wwv_flow_api.id(8546468280708947)
,p_associated_item=>wwv_flow_api.id(8586906699708905)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8684714569708838)
,p_validation_name=>'Al agregar actividad'
,p_validation_sequence=>470
,p_validation=>'P310_ACTIVIDAD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo #LABEL# esta vac\00EDo ')
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(8568975568708920)
,p_associated_item=>wwv_flow_api.id(8570566947708918)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8685149473708838)
,p_validation_name=>'Validar diferencia entre item 16 y TOTAL INGRESOS GRAVADOS'
,p_validation_sequence=>480
,p_validation=>'P310_VALIDAITEM16'
,p_validation2=>'N'
,p_validation_type=>'ITEM_IN_VALIDATION_EQ_STRING2'
,p_error_message=>unistr('El Item #LABEL# es diferente del TOTAL INGRESOS GRAVADOS de la regi\00F3n C')
,p_always_execute=>'Y'
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(8546468280708947)
,p_associated_item=>wwv_flow_api.id(8591645742708901)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8761257440708795)
,p_name=>'Al perder el foco redondear valor item 9'
,p_event_sequence=>1
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_MNS_INGRSS_FUERA_MNCPIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8761730530708795)
,p_event_id=>wwv_flow_api.id(8761257440708795)
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
 p_id=>wwv_flow_api.id(8709941043708821)
,p_name=>'Al perder el foco redondear valor item 8'
,p_event_sequence=>11
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_TTL_INGRS_ORIOS_EXTRS_PAIS'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8710480418708821)
,p_event_id=>wwv_flow_api.id(8709941043708821)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var valor = apex.item(''P'' + pageId + ''_TTL_INGRS_ORIOS_EXTRS_PAIS'').getValue();',
'console.log(''valor: ''+valor);',
'',
'redondeoMilMasCercano(''P''+pageId+''_TTL_INGRS_ORIOS_EXTRS_PAIS'');',
'',
'var valor2 = apex.item(''P'' + pageId + ''_TTL_INGRS_ORIOS_EXTRS_PAIS'').getValue();',
'console.log(''valor2: ''+valor2);',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8711768012708820)
,p_name=>'Al perder el foco redondear valor item 11'
,p_event_sequence=>21
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_MNS_INGRSOS_DEV_REB_DES'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8712203096708820)
,p_event_id=>wwv_flow_api.id(8711768012708820)
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
 p_id=>wwv_flow_api.id(8712685325708820)
,p_name=>'Al perder el foco redondear valor item 12'
,p_event_sequence=>31
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_MNS_INGRSOS_EXPRTCIONS'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8713162643708820)
,p_event_id=>wwv_flow_api.id(8712685325708820)
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
 p_id=>wwv_flow_api.id(8713583775708820)
,p_name=>'Al perder el foco redondear valor item 13'
,p_event_sequence=>41
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_MNS_INGRSOS_VNTA_ACT_FIJS'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8714009683708819)
,p_event_id=>wwv_flow_api.id(8713583775708820)
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
 p_id=>wwv_flow_api.id(8718048290708818)
,p_name=>'Al perder el foco redondear valor item 14'
,p_event_sequence=>51
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_MNS_INGRSOS_ACTVDDS_EXCLDS'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8718501300708817)
,p_event_id=>wwv_flow_api.id(8718048290708818)
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
 p_id=>wwv_flow_api.id(8718951153708817)
,p_name=>'Al perder el foco redondear valor item 15'
,p_event_sequence=>61
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_MNS_INGRSOS_ACTVDDS_EXENTAS'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8719432065708817)
,p_event_id=>wwv_flow_api.id(8718951153708817)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'redondeoMilMasCercano(''P''+pageId+''_MNS_INGRSOS_ACTVDDS_EXENTAS'');',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8719897267708817)
,p_name=>'Al perder el foco redondear valor item 22'
,p_event_sequence=>71
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_PGO_UNDDS_CMRCLS'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8720370328708816)
,p_event_id=>wwv_flow_api.id(8719897267708817)
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
 p_id=>wwv_flow_api.id(8720736257708816)
,p_name=>'Al perder el foco redondear valor item 26'
,p_event_sequence=>81
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_MENS_VLR_EXNCN_EXNRCN_IMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8721217870708816)
,p_event_id=>wwv_flow_api.id(8720736257708816)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'redondeoMilMasCercano(''P''+pageId+''_MENS_VLR_EXNCN_EXNRCN_IMPSTO'');',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8721609077708816)
,p_name=>'Al perder el foco redondear valor item 27'
,p_event_sequence=>91
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_MENOS_RETENCIONES'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8722197041708815)
,p_event_id=>wwv_flow_api.id(8721609077708816)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'redondeoMilMasCercano(''P''+pageId+''_MENOS_RETENCIONES'');',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8722544670708815)
,p_name=>'Al perder el foco redondear valor item 28'
,p_event_sequence=>101
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_MENOS_AUTORRETENCIONES'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8723085275708815)
,p_event_id=>wwv_flow_api.id(8722544670708815)
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
 p_id=>wwv_flow_api.id(8723414444708815)
,p_name=>'Al perder el foco redondear valor item 29'
,p_event_sequence=>111
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_MENS_ANTCPO_LIQDDO_ANIO_ANTR'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8723978106708814)
,p_event_id=>wwv_flow_api.id(8723414444708815)
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
 p_id=>wwv_flow_api.id(8724324138708814)
,p_name=>'Al perder el foco redondear valor item 31 sancion manual'
,p_event_sequence=>121
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_SANCION_MANUAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8724852218708814)
,p_event_id=>wwv_flow_api.id(8724324138708814)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function sancionMinima(){',
'    var    tipo_sancion = parseFloat(apex.item(''P''+pageId+''_SANCION_MANUAL'').getValue()) ?? 0;',
'    var    indcdor_ext = apex.item(''P''+pageId+''_INDICADOR_EXTEMPORANEO'').getValue();',
'',
'    console.log(''INDICADOR EXT => ''+indcdor_ext);',
'    if (indcdor_ext === ''S''){',
'         if (tipo_sancion < 498000){',
'            apex.item(''P''+pageId+''_CLCLO_NETO_SANCION'').setValue(498000 || 0);',
'            apex.item(''P''+pageId+''_SANCION_MANUAL'').setValue(498000 || 0);',
'         }else{',
'            apex.item(''P''+pageId+''_CLCLO_NETO_SANCION'').setValue(tipo_sancion || 0);',
'         };',
'    };',
'    /*}else{',
'         apex.item(''P''+pageId+''_CLCLO_NETO_SANCION'').setValue(0 || 0);',
'         apex.item(''P''+pageId+''_SANCION_MANUAL'').setValue(0 || 0);',
'    };*/',
'       ',
'     redondeoMilMasCercano(''P''+pageId+''_SANCION_MANUAL'');',
'};',
'     ',
'//sancionMinima();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8725256297708814)
,p_name=>'Al ingresar valor'
,p_event_sequence=>131
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_SANCION_MANUAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8725713232708814)
,p_event_id=>wwv_flow_api.id(8725256297708814)
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
 p_id=>wwv_flow_api.id(8726182637708813)
,p_name=>unistr('Al   cambiar  extraer el valor sanci\00F3n manual')
,p_event_sequence=>141
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_SANCION_MANUAL,P310_MENS_VLR_EXNCN_EXNRCN_IMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8726643101708813)
,p_event_id=>wwv_flow_api.id(8726182637708813)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'calculoItem25();',
'calculoConcepto();',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8727048992708813)
,p_name=>'Al perder el foco redondear valor item 32'
,p_event_sequence=>151
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_MENOS_SLDO_FVR_PRDO_ANTRIOR'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8727579519708813)
,p_event_id=>wwv_flow_api.id(8727048992708813)
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
 p_id=>wwv_flow_api.id(8727994025708813)
,p_name=>'Al perder el foco redondear valor item 39'
,p_event_sequence=>161
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_VALOR_PAGO_VOLUNTARIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8728448911708812)
,p_event_id=>wwv_flow_api.id(8727994025708813)
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
 p_id=>wwv_flow_api.id(8728806920708812)
,p_name=>'Al perder el foco redondear valor item valor a pagar bancos'
,p_event_sequence=>171
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_VALOR_PAGAR_BANCOS'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8729366203708812)
,p_event_id=>wwv_flow_api.id(8728806920708812)
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
 p_id=>wwv_flow_api.id(8729744453708812)
,p_name=>unistr('Al dar clic al bot\00F3n consultar')
,p_event_sequence=>181
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8633624839708872)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8730208833708811)
,p_event_id=>wwv_flow_api.id(8729744453708812)
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
 p_id=>wwv_flow_api.id(8730600786708811)
,p_name=>'Al cambiar tipo calculo sancion calcular el valor sancion'
,p_event_sequence=>191
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_TIPO_CALCULO_SANCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8731167002708811)
,p_event_id=>wwv_flow_api.id(8730600786708811)
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
 p_id=>wwv_flow_api.id(8731522405708811)
,p_name=>'Al calcular tipo de calculo sancion'
,p_event_sequence=>201
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_TIPO_CALCULO_SANCION'
,p_condition_element=>'P310_TIPO_CALCULO_SANCION'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8732565915708810)
,p_event_id=>wwv_flow_api.id(8731522405708811)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P310_SANCION_MANUAL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8733062144708810)
,p_event_id=>wwv_flow_api.id(8731522405708811)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function sancionMinima3(){',
'    var    tipo_sancion = parseFloat(apex.item(''P''+pageId+''_SANCION_MANUAL'').getValue()) ?? 0;',
'    var    indcdor_ext = apex.item(''P''+pageId+''_INDICADOR_EXTEMPORANEO'').getValue();',
'',
'    console.log(''INDICADOR EXT3 => ''+indcdor_ext);',
'    if (indcdor_ext === ''S''){',
'         if (tipo_sancion < 498000){',
'            apex.item(''P''+pageId+''_CLCLO_NETO_SANCION'').setValue(498000 || 0);',
'            apex.item(''P''+pageId+''_SANCION_MANUAL'').setValue(498000 || 0);',
'         }else{',
'            apex.item(''P''+pageId+''_CLCLO_NETO_SANCION'').setValue(tipo_sancion || 0);',
'         };    ',
'    };',
'       ',
'     redondeoMilMasCercano(''P''+pageId+''_SANCION_MANUAL'');',
'};',
'     ',
'//sancionMinima3();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8733533881708810)
,p_event_id=>wwv_flow_api.id(8731522405708811)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P310_SANCION_MANUAL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8732014503708811)
,p_event_id=>wwv_flow_api.id(8731522405708811)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P310_SANCION_SUGERIDA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8734077856708810)
,p_event_id=>wwv_flow_api.id(8731522405708811)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P310_SANCION_SUGERIDA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8734496422708809)
,p_name=>'Al calcular tipo de calculo sancion vacio'
,p_event_sequence=>211
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_TIPO_CALCULO_SANCION'
,p_condition_element=>'P310_TIPO_CALCULO_SANCION'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8734928965708809)
,p_event_id=>wwv_flow_api.id(8734496422708809)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P310_SANCION_MANUAL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8735457414708809)
,p_event_id=>wwv_flow_api.id(8734496422708809)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P310_SANCION_SUGERIDA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8735887153708809)
,p_name=>'setear items fecha'
,p_event_sequence=>221
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_FCHA_MAXIMA_PRSNTCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8736320510708808)
,p_event_id=>wwv_flow_api.id(8735887153708809)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P310_ITEMS_FECHA'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'nvl(to_date(:P310_FCHA_MAXIMA_PRSNTCION,''dd/mm/yyyy''), ''14/04/2024'')'
,p_attribute_07=>'P310_FCHA_MAXIMA_PRSNTCION'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8736799103708808)
,p_name=>unistr('Al calcular clasificaci\00F3n')
,p_event_sequence=>231
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_CLASIFICACION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8737290202708808)
,p_event_id=>wwv_flow_api.id(8736799103708808)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P310_CLASIFICACION'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8737766380708808)
,p_event_id=>wwv_flow_api.id(8736799103708808)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validarValorBanco();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8738163782708807)
,p_name=>'setear item indicador extemporaneo'
,p_event_sequence=>241
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_FCHA_MAXIMA_PRSNTCION,P310_CLASIFICACION,P310_OPCION_DE_USO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8738625370708807)
,p_event_id=>wwv_flow_api.id(8738163782708807)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P310_INDICADOR_EXTEMPORANEO'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pkg_gi_declaraciones_funciones.fnc_vl_fecha_limite(  p_cdgo_clnte                  => :F_CDGO_CLNTE,',
'                                                            p_id_dclrcion_vgncia_frmlrio  => :P310_ID_DCLRCION_VGNCIA_FRMLRIO,',
'                                                            p_idntfccion	              => :P310_IDNTFCCION,',
'                                                            p_fcha_prsntcion              => :P310_FCHA_MAXIMA_PRSNTCION,',
'                                                            p_id_sjto_tpo	              => :P310_CLASIFICACION) as indcdor_extmprneo from dual'))
,p_attribute_07=>'P310_FCHA_MAXIMA_PRSNTCION,P310_INDICADOR_EXTEMPORANEO,P310_CLASIFICACION,P310_IDNTFCCION,P310_OPCION_DE_USO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8714489066708819)
,p_name=>'Al cambiar AVISOS y TABLEROS o Tarifa SOBRETASA BOMBERIL'
,p_event_sequence=>251
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_AVISOS_TABLEROS,P310_SOBRETASA_BOMBERIL_TRFA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8714950884708819)
,p_event_id=>wwv_flow_api.id(8714489066708819)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function calculoAvisos(){',
unistr('    console.log("Entro en la funci\00F3n de validaci\00F3n calculoItem20 avisos y tableros.");'),
'   ',
'calculoItem20();',
'',
'}',
'',
'calculoAvisos();',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8715359681708819)
,p_name=>'Al actualizar item 8'
,p_event_sequence=>261
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_MNS_INGRSS_FUERA_MNCPIO,P310_MNS_INGRSOS_DEV_REB_DES,P310_MNS_INGRSOS_EXPRTCIONS,P310_MNS_INGRSOS_VNTA_ACT_FIJS,P310_MNS_INGRSOS_ACTVDDS_EXCLDS,P310_MNS_INGRSOS_ACTVDDS_EXENTAS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8715800232708819)
,p_event_id=>wwv_flow_api.id(8715359681708819)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'regionBaseGravable();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8717109057708818)
,p_name=>'Al calcular item 25'
,p_event_sequence=>271
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_PGO_UNDDS_CMRCLS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8717601182708818)
,p_event_id=>wwv_flow_api.id(8717109057708818)
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
 p_id=>wwv_flow_api.id(8739076268708807)
,p_name=>'Al cambiar P310_VALOR_PAGAR'
,p_event_sequence=>281
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_CALCULO_TOTAL_SALDO_CARGO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8739501765708807)
,p_event_id=>wwv_flow_api.id(8739076268708807)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>unistr('calculoValorPago(); //Funci\00F3n que calculo el valor del item valor  total a pagar')
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8739966722708806)
,p_name=>unistr('Al cambiar opci\00F3n de uso consultar declaracion inicial')
,p_event_sequence=>291
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_OPCION_DE_USO'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8740454611708806)
,p_event_id=>wwv_flow_api.id(8739966722708806)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P310_CLCLO_DCLRCION_CRRCCION > 0  and :P310_OPCION_DE_USO = ''DIN'' then',
'    :P310_OPCION_DE_USO := ''DCO'';',
'elsif :P310_CLCLO_DCLRCION_CRRCCION = 0  and :P310_OPCION_DE_USO = ''DCO'' then',
'    :P310_OPCION_DE_USO := ''DIN'';',
'end if;'))
,p_attribute_02=>'P310_OPCION_DE_USO,P310_CLCLO_DCLRCION_CRRCCION'
,p_attribute_03=>'P310_OPCION_DE_USO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8740820908708806)
,p_name=>'crear actividades'
,p_event_sequence=>301
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8568975568708920)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8741310584708805)
,p_event_id=>wwv_flow_api.id(8740820908708806)
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
'            pageItems: "#P310_ACTIVIDAD,#P310_TARIFA,#P310_VLOR_IPSTO,#P310_INGRESOS_GRAVADOS,#P310_ACTIVIDAD_DESCRIPCION"   ',
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
'                    //calculoImpuesto();',
'                   apex.message.showPageSuccess("Actividad agregada.");',
'                                   ',
'                   limpiar_items();',
'                    setTimeout(function() {',
unistr('                       console.log("Esta funci\00F3n se ejecutar\00E1 despu\00E9s de 1000 milisegundos (1 segundo).");'),
'                        calculoActividadesGravadas();',
'                        console.log(''Fin calculo...'');',
'                        $(''.t-Alert--success'').fadeOut(''slow'');             ',
'                    }, 1000);',
'',
'                    ',
'                   ',
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
 p_id=>wwv_flow_api.id(8741707930708805)
,p_name=>'calcular valor impuesto'
,p_event_sequence=>311
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_INGRESOS_GRAVADOS'
,p_condition_element=>'P310_ID_SJTO_IMPSTO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'keydown'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8742246871708805)
,p_event_id=>wwv_flow_api.id(8741707930708805)
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
 p_id=>wwv_flow_api.id(8742623521708805)
,p_name=>'calcular valor impuesto al cambiar'
,p_event_sequence=>321
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_INGRESOS_GRAVADOS,P310_TARIFA'
,p_condition_element=>'P310_ID_SJTO_IMPSTO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8743189638708805)
,p_event_id=>wwv_flow_api.id(8742623521708805)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//console.log("Antes de calcular impuesto");',
'calcularImpuesto();',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8743593434708804)
,p_name=>'Al cambiar actividad economica2'
,p_event_sequence=>331
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_ACTIVIDAD'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8744003814708804)
,p_event_id=>wwv_flow_api.id(8743593434708804)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P310_TARIFA,P310_ACTIVIDAD_DESCRIPCION'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.trfa,',
'       a.cdgo_dclrcns_esqma_trfa || '' - '' || a.dscrpcion',
'from gi_d_dclrcns_esqma_trfa a',
'where a.id_dclrcns_esqma_trfa = :P310_ACTIVIDAD'))
,p_attribute_07=>'P310_ACTIVIDAD'
,p_attribute_08=>'N'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8744429010708804)
,p_name=>'prueba'
,p_event_sequence=>341
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8573284374708915)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8744904470708803)
,p_event_id=>wwv_flow_api.id(8744429010708804)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//console.log(''Iniciando calculo...'');',
'calculoActividadesGravadas();',
'//console.log(''Fin calculo...'');',
'buildJsonActividades();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8745388684708803)
,p_name=>'PROBAR SUMA COLUMNA'
,p_event_sequence=>351
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8572869600708916)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8745802796708803)
,p_event_id=>wwv_flow_api.id(8745388684708803)
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
'            //console.log("Suma Total: " + sumaTotal);',
'        });',
'    }',
'',
unistr('    // Llama a la funci\00F3n para calcular la suma total cuando sea necesario'),
'    calcularSumaTotal();',
'});',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8746231965708802)
,p_name=>'Al cambiar P310_APORTE_VOLUNTARIO'
,p_event_sequence=>361
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_APORTE_VOLUNTARIO,P310_VALOR_PAGO_VOLUNTARIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8746709102708802)
,p_event_id=>wwv_flow_api.id(8746231965708802)
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
 p_id=>wwv_flow_api.id(8747176303708802)
,p_name=>'Al cambiar P310_VALOR_PAGAR '
,p_event_sequence=>371
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_VALOR_PAGAR'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8747617581708802)
,p_event_id=>wwv_flow_api.id(8747176303708802)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
unistr('calcularItem38();//Funci\00F3n que calcula el valor del item38')))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8748009700708801)
,p_name=>'Al cambiar P310_VLOR_IPSTO'
,p_event_sequence=>381
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_VLOR_IPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8748500274708801)
,p_event_id=>wwv_flow_api.id(8748009700708801)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'redondeoMilMasCercano(''P''+pageId+''_VLOR_IPSTO'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8748929959708801)
,p_name=>'Al dar click boton BTN_NUEVA_ACTIVIDAD'
,p_event_sequence=>391
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8576784233708913)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8749435067708801)
,p_event_id=>wwv_flow_api.id(8748929959708801)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'limpiar_items();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8749805341708801)
,p_name=>'Al dar click boton BTN_CANCELAR'
,p_event_sequence=>401
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8569308193708919)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8750382814708800)
,p_event_id=>wwv_flow_api.id(8749805341708801)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.theme.closeRegion("gestionActividadEconomica");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8750785164708800)
,p_name=>'Al hacer clic BTN_MOSTRAR_REGION_ACTIVIDADES'
,p_event_sequence=>411
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8569787771708919)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8751273874708800)
,p_event_id=>wwv_flow_api.id(8750785164708800)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(8569787771708919)
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function limpiar_items(){',
'  // Limpiamos Items''',
'    apex.item("P310_ACTIVIDAD").setValue("");',
'    apex.item("P310_TARIFA").setValue("");',
'    apex.item("P310_INGRESOS_GRAVADOS").setValue("");',
'    apex.item("P310_VLOR_IPSTO").setValue("");',
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
 p_id=>wwv_flow_api.id(8751600392708799)
,p_name=>'Al cambiar P310_TOTAL_PAGAR'
,p_event_sequence=>421
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_TOTAL_PAGAR,P310_VALOR_PAGO_VOLUNTARIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8752185950708799)
,p_event_id=>wwv_flow_api.id(8751600392708799)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>unistr('calcularItem40();//Funci\00F3n que calcula el valor del item340')
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8752551024708799)
,p_name=>'Al hacer clic'
,p_event_sequence=>431
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(22941344186896169)
,p_triggering_element=>'BTN_ACCIONES'
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8753154263708799)
,p_event_id=>wwv_flow_api.id(8752551024708799)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//valorColumna();',
'calcularId();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8753579792708799)
,p_name=>'Al hacer clic columna eliminar'
,p_event_sequence=>441
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(22941344186896169)
,p_triggering_element=>'ELIMINAR'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8754072825708798)
,p_event_id=>wwv_flow_api.id(8753579792708799)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calcularId();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8754408113708798)
,p_name=>'al seleccionar '
,p_event_sequence=>451
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(22941344186896169)
,p_triggering_element=>'SELECCIONAR'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'SEQ_ID'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8754954334708798)
,p_event_id=>wwv_flow_api.id(8754408113708798)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'ELIMINAR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8762103498708794)
,p_name=>unistr('Al hacer clic BTN_CREATE para registrar la declaraci\00F3n')
,p_event_sequence=>461
,p_bind_type=>'bind'
,p_bind_event_type=>'apexbeforepagesubmit'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8762619038708794)
,p_event_id=>wwv_flow_api.id(8762103498708794)
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
'    var campo4 = $v("P" + pageId + "_NMRO_ESTBLCMIENTS");',
'    var campo5 = $v("P" + pageId + "_AVISOS_TABLEROS");',
'    var campo6 = $v("P" + pageId + "_CNSRCIO_UNION_TMPRL");',
'    var campo7 = $v("P" + pageId + "_RLZA_ACTDS_PNIO_AUTNMO");',
'    var campo8 = $v("P" + pageId + "_CNCLCION_ESTBLCMIENTO");',
'    var campo9 = $v("P" + pageId + "_FCHA_MAXIMA_PRSNTCION");',
'    var campo10 = $v("P" + pageId + "_CORREO_ELECTRONICO");',
'    //var Item16 = $v("P" + pageId + "_TOTAL_INGRESOS_GRVBLES");',
'    //var totalIngresosGravados = $v("P" + pageId + "_TOTAL_INGRESOS_GRAVADS");',
'    var es_agnt_autrtndr = $v("P" + pageId + "_ES_AGNTE_AUTRTNDOR");',
'',
'    var valid = true;',
unistr('    // Validar si los campos est\00E1n vac\00EDos'),
unistr('    //console.log("Antes de validaci\00F3n");'),
'    ',
'    if (campo1.trim() === "") {console.log("valida 1."); valid = false; }',
'    if (campo2.trim() === "") {console.log("valida 2."); valid = false; }',
'    if (campo3.trim() === "") {console.log("valida 3."); valid = false; }',
'    if (campo4.trim() === "") {console.log("valida 4."); valid = false; }',
'    if (campo5.trim() === "") {console.log("valida 5."); valid = false; }',
'    if (campo6.trim() === "") {console.log("valida 6."); valid = false; }',
'    if (campo7.trim() === "") {console.log("valida 7."); valid = false; }',
'    if (campo8.trim() === "") {console.log("valida 8."); valid = false; }',
'    if (campo9.trim() === "") {console.log("valida 9."); valid = false; }',
'    if (campo10.trim() === "") {console.log("valida 10."); valid = false;}',
'    if (es_agnt_autrtndr.trim() === "") {console.log("valida es_agnt_autrtndr"); valid = false;}',
'    ',
'    /*if (Item16 != totalIngresosGravados) {',
'        console.log("valida Item16. diferente totalIngresosGravados.");',
'        valid = false;',
'      };*/',
'    ',
'',
'    if (!valid) {',
unistr('        deshabilitarItems(); // Si alguna validaci\00F3n falla, ejecuta deshabilitarItems'),
'         //apex.event.gCancelFlag = true;',
unistr('         //console.log("Algunos campos est\00E1n vac\00EDos, deshabilitando \00EDtems.");'),
'    } else {',
unistr('        habilitarItems(); // Si todos los campos est\00E1n llenos, ejecuta habilitarItems'),
unistr('        //console.log("Todos los campos est\00E1n llenos, habilitando \00EDtems.");'),
'    }',
'}',
'validarCampos();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8755386329708798)
,p_name=>'Al cambiar P310_NOMBRES_DECLARANTE'
,p_event_sequence=>471
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_NOMBRES_DECLARANTE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8755860679708797)
,p_event_id=>wwv_flow_api.id(8755386329708798)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P310_TPO_IDNTFCCION_DCLRNTE_FRMA,P310_IDNTFCCION_RPRSNTNTE'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  b.cdgo_idntfccion_tpo , ',
'        a.idntfccion_rspnsble        ',
'from    v_si_i_sujetos_responsable    a',
'join    df_s_identificaciones_tipo    b on a.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo                                    ',
'where   a.id_sjto_rspnsble  = :P310_NOMBRES_DECLARANTE;'))
,p_attribute_07=>'P310_NOMBRES_DECLARANTE'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8756210960708797)
,p_name=>'Al cambiar P310_NOMBRES_DECLARANTE_REVISOR'
,p_event_sequence=>481
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_NOMBRES_DECLARANTE_REVISOR'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8756775464708797)
,p_event_id=>wwv_flow_api.id(8756210960708797)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P310_TPO_IDENTIFICACION_REVISOR,P310_IDENTIFICACION_REVISOR'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  b.cdgo_idntfccion_tpo , ',
'        a.idntfccion_rspnsble        ',
'from    v_si_i_sujetos_responsable    a',
'join    df_s_identificaciones_tipo    b on a.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo                                    ',
'where   a.id_sjto_rspnsble  = :P310_NOMBRES_DECLARANTE_REVISOR;'))
,p_attribute_07=>'P310_NOMBRES_DECLARANTE_REVISOR'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8757154140708797)
,p_name=>'Calcular item 20 al cambiar ( 17, 19)'
,p_event_sequence=>491
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_TOTAL_IMPUESTO,P310_IMPUESTO_LEY'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8757673162708797)
,p_event_id=>wwv_flow_api.id(8757154140708797)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'regionBaseGravable();',
'calculoItem20();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8758065061708796)
,p_name=>'Al cambiar  P310_GENERACION_ENERGIA '
,p_event_sequence=>501
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_GENERACION_ENERGIA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8758536067708796)
,p_event_id=>wwv_flow_api.id(8758065061708796)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'calculoActividadesGravadas();',
'//calculoTotalActividades();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8758972645708796)
,p_name=>'Al cambiar  P310_CNCLCION_ESTBLCMIENTO'
,p_event_sequence=>511
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_CNCLCION_ESTBLCMIENTO,P310_ES_AGNTE_AUTRTNDOR'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8759442447708796)
,p_event_id=>wwv_flow_api.id(8758972645708796)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculoActividadesGravadas();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8759823184708796)
,p_name=>'Al cambiar  P310_CLASIFICACION'
,p_event_sequence=>521
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_CLASIFICACION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8760836406708795)
,p_event_id=>wwv_flow_api.id(8759823184708796)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P310_CLCLA_FCHA_PRSNTCION_FINAL'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char( pkg_gi_declaraciones_funciones.fnc_co_fcha_mxma_prsntcion( p_id_dclrcion_vgncia_frmlrio =>  :P310_ID_DCLRCION_VGNCIA_FRMLRIO,',
'                                                                          p_idntfccion => :P310_IDNTFCCION , ',
'                                                                          p_id_sjto_tpo => :P310_CLASIFICACION),',
'                                                                          ''dd/mm/yyyy'' ) as fecha from dual                                      '))
,p_attribute_07=>'P310_ID_DCLRCION_VGNCIA_FRMLRIO,P310_IDNTFCCION,P310_CLASIFICACION'
,p_attribute_08=>'N'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8760322153708795)
,p_event_id=>wwv_flow_api.id(8759823184708796)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('var pageId = &APP_PAGE_ID.;  // Extrae el n\00FAmero de la pagina.'),
'',
'var fechamax = apex.item(''P''+pageId+''_CLCLA_FCHA_PRSNTCION_FINAL'').getValue();',
'',
'//debugger;',
'console.log(''fechamax => ''+fechamax);',
'',
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
'$(''#P310_FCHA_MAXIMA_PRSNTCION'').datepicker(''option'', ''maxDate'', maxDate);',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8716210434708818)
,p_name=>'Al perder el foco calcular y redondear valor anticipo'
,p_event_sequence=>531
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_ANTICIPO_ANIO_SIGUIENTE'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8716791543708818)
,p_event_id=>wwv_flow_api.id(8716210434708818)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function anticipoMinimo(){',
'    var vlor_antcpo         = parseFloat(apex.item(''P''+pageId+''_ANTICIPO_ANIO_SIGUIENTE'').getValue()) ?? 0;',
'    var v_total_impsto_ica  = parseFloat(apex.item(''P''+pageId+''_TTL_IMPSTO_INDSTRIA_CMRCIO'').getValue()) ?? 0;',
'    var clclo_antcpo        = (v_total_impsto_ica  * 40 ) / 100;',
'    /*var v_cncla_est         = apex.item(''P''+pageId+''_CNCLCION_ESTBLCMIENTO'').getValue() ?? 0;',
'',
'    if (v_cncla_est == ''S''){',
'        ',
'        apex.item(''P''+pageId+''_ANTICIPO_ANIO_SIGUIENTE'').setValue(0 || 0);',
'     ',
'    }else if (v_cncla_est == ''N'') {*/',
'        ',
'        if (vlor_antcpo <  clclo_antcpo ) {',
'            apex.item(''P''+pageId+''_ANTICIPO_ANIO_SIGUIENTE'').setValue(clclo_antcpo || 0);',
'         }else{',
'            apex.item(''P''+pageId+''_ANTICIPO_ANIO_SIGUIENTE'').setValue(vlor_antcpo || 0);',
'        };',
'        ',
'    //};',
'    ',
'    redondeoMilMasCercano(''P''+pageId+''_ANTICIPO_ANIO_SIGUIENTE'');',
'};',
'',
'anticipoMinimo();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8710845884708821)
,p_name=>'calcular item 25 al cambiar (20,21,22,23,24)'
,p_event_sequence=>541
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_TTL_IMPSTO_INDSTRIA_CMRCIO,P310_MENS_VLR_EXNCN_EXNRCN_IMPSTO,P310_MENOS_RETENCIONES,P310_MENOS_AUTORRETENCIONES,P310_MENS_ANTCPO_LIQDDO_ANIO_ANTR,P310_MENOS_SLDO_FVR_PRDO_ANTRIOR,P310_TIPO_CALCULO_SANCION,,P310_FCHA_MAXIMA_PRSNTCION,P310_OPCION_'
||'DE_USO,P310_CLASIFICACION,P310_TIPO_SANCION,P310_PGO_UNDDS_CMRCLS,P310_ANTICIPO_ANIO_SIGUIENTE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8711393819708821)
,p_event_id=>wwv_flow_api.id(8710845884708821)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function calculo(){',
'  setTimeout(function() {',
unistr('                       console.log("Esta funci\00F3n se ejecutar\00E1 despu\00E9s de 500 milisegundos calculoItem25()");'),
'                         calculoItem25();                              ',
'                        console.log(''Fin calculo calculoItem21(); PRIMERO '');                    ',
'                    }, 300);',
'    ',
'    ',
'     setTimeout(function() {',
unistr('                       console.log("Esta funci\00F3n se ejecutar\00E1 despu\00E9s de 500 milisegundos calculoConcepto()");'),
'                         calculoConcepto();                             ',
'                        console.log(''Fin calculo  calculoConcepto();...'');                    ',
'                    }, 500);',
'       calculoItem25();',
'     setTimeout(function() {',
unistr('                       console.log("Esta funci\00F3n se ejecutar\00E1 despu\00E9s de 500 milisegundos calculoValorPago()");'),
'                         calculoValorPago ();                          ',
'                        console.log(''Fin calculo  calculoValorPago ();'');                    ',
'                    }, 300);',
'}',
'',
'calculo();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8699821151708828)
,p_name=>unistr('Al cambiar clasificaci\00F3n')
,p_event_sequence=>551
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_CLASIFICACION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8700392591708827)
,p_event_id=>wwv_flow_api.id(8699821151708828)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8700726323708826)
,p_name=>'Al cambiar P310_CLCLO_NETO_SANCION'
,p_event_sequence=>561
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_CLCLO_NETO_SANCION,P310_MENS_VLR_EXNCN_EXNRCN_IMPSTO,P310_MENS_ANTCPO_LIQDDO_ANIO_ANTR,P310_MENOS_AUTORRETENCIONES,P310_MENOS_RETENCIONES,P310_SANCION_MANUAL,P310_PGO_UNDDS_CMRCLS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8701216546708826)
,p_event_id=>wwv_flow_api.id(8700726323708826)
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
'                    }, 500);',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8701661894708826)
,p_name=>'Al cambiar  P310_NOMBRE_DECLARANTE'
,p_event_sequence=>571
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_NOMBRES_DECLARANTE'
,p_condition_element=>'P310_NOMBRES_DECLARANTE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8702124554708825)
,p_event_id=>wwv_flow_api.id(8701661894708826)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P310_ETIQUETA_PRINCIPAL'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(w.dscrpcion, '''')  as descripcion_firma ',
'from',
'si_i_sujetos_responsable r',
'inner join ws_d_tipo_firma w on',
'r.cdgo_tpo_rspnsble  = w.cdgo_tpo_frma ',
'where r.id_sjto_rspnsble  =  :P310_NOMBRES_DECLARANTE',
'and r.prncpal_s_n =''S''',
'AND ROWNUM = 1'))
,p_attribute_07=>'P310_NOMBRES_DECLARANTE,P310_ETIQUETA_PRINCIPAL'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8702609079708825)
,p_event_id=>wwv_flow_api.id(8701661894708826)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P310_ETIQUETA_PRINCIPAL'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8703046519708825)
,p_name=>'Al cambiar  P310_IDENTIFICACION_REVISOR'
,p_event_sequence=>581
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_NOMBRES_DECLARANTE_REVISOR'
,p_condition_element=>'P310_NOMBRES_DECLARANTE_REVISOR'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8703538788708825)
,p_event_id=>wwv_flow_api.id(8703046519708825)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P310_ETIQUETA_SECUNDARIA'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select w.dscrpcion  as descripcion_firma from',
'si_i_sujetos_responsable r',
'inner join ws_d_tipo_firma w on',
'r.cdgo_tpo_rspnsble  = w.cdgo_tpo_frma ',
'where r.id_sjto_rspnsble  =  :P310_NOMBRES_DECLARANTE_REVISOR',
'AND ROWNUM = 1'))
,p_attribute_07=>'P310_NOMBRES_DECLARANTE_REVISOR,P310_ETIQUETA_SECUNDARIA'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8704066267708824)
,p_event_id=>wwv_flow_api.id(8703046519708825)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P310_ETIQUETA_SECUNDARIA'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8704498733708824)
,p_name=>'Actualizar etique'
,p_event_sequence=>591
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_NOMBRES_DECLARANTE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8704991715708824)
,p_event_id=>wwv_flow_api.id(8704498733708824)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P310_ETIQUETA_PRINCIPAL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8705320125708824)
,p_name=>'al cambiar etiqueta secundaria'
,p_event_sequence=>601
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_NOMBRES_DECLARANTE_REVISOR'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8705895688708824)
,p_event_id=>wwv_flow_api.id(8705320125708824)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P310_ETIQUETA_SECUNDARIA'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8706250649708823)
,p_name=>'setear item valor minimo'
,p_event_sequence=>611
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_INDICADOR_EXTEMPORANEO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8706737721708823)
,p_event_id=>wwv_flow_api.id(8706250649708823)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function sancionMinima2(){',
'    var    tipo_sancion = parseFloat(apex.item(''P''+pageId+''_SANCION_MANUAL'').getValue()) ?? 0;',
'    var    indcdor_ext = apex.item(''P''+pageId+''_INDICADOR_EXTEMPORANEO'').getValue();',
'',
'    console.log(''INDICADOR EXT 2 => ''+indcdor_ext);',
'    if (indcdor_ext === ''S''){',
'         /*if (tipo_sancion < 498000){',
'            apex.item(''P''+pageId+''_CLCLO_NETO_SANCION'').setValue(498000 || 0);',
'            apex.item(''P''+pageId+''_SANCION_MANUAL'').setValue(498000 || 0);',
'         }else{*/',
'            apex.item(''P''+pageId+''_CLCLO_NETO_SANCION'').setValue(tipo_sancion || 0);',
'         //};    ',
'    }else{',
'         apex.item(''P''+pageId+''_CLCLO_NETO_SANCION'').setValue(0 || 0);',
'         apex.item(''P''+pageId+''_SANCION_MANUAL'').setValue(0 || 0);',
'    };',
'       ',
'     redondeoMilMasCercano(''P''+pageId+''_SANCION_MANUAL'');',
'};',
'     ',
'sancionMinima2();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8707146806708823)
,p_name=>'Al cambiar valor del item 8'
,p_event_sequence=>621
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P310_TTL_INGRS_ORIOS_EXTRS_PAIS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8707675042708823)
,p_event_id=>wwv_flow_api.id(8707146806708823)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function limpiarActividades(){',
'    ',
'    let $waitPopup = apex.widget.waitPopup();',
'    try{',
'        //apex.item(''P'' + pageId + ''_SEQ_ID'').setValue(p_seq_id);',
'        await apex.server.process ( "ajax_limpiar_Actividades", {',
'            //pageItems: "#P310_SEQ_ID"   ',
'        }, {',
'            success: function( pData ){',
'             //   console.log(pData);',
'                if (pData.o_cdgo_rspsta != 0){',
'                  //  console.log(pData.o_cdgo_rspsta);',
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
'                    apex.region("actividad").refresh();                      ',
'                    //apex.message.showPageSuccess("Actividad eliminada.");',
'                    setTimeout(function() {',
'                          calculoActividadesGravadas();',
'                         $(''.t-Alert--success'').fadeOut(''slow'');         ',
'                       // console.log(''Fin calculo...'');                    ',
'                    }, 1000);',
'                }',
'            }',
'        })',
'     ',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        $waitPopup.remove();',
'    }',
'};',
'',
'limpiarActividades();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8708116139708822)
,p_event_id=>wwv_flow_api.id(8707146806708823)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'limpiar_items();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8708686329708822)
,p_event_id=>wwv_flow_api.id(8707146806708823)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P310_ACTIVIDAD'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8709042419708822)
,p_name=>'diferencia'
,p_event_sequence=>631
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(129774161366071015)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8709534165708822)
,p_event_id=>wwv_flow_api.id(8709042419708822)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
unistr('function validaci\00F3nItem16() {'),
'    var item10 = parseFloat(apex.item(''P''+pageId+''_TTL_INGRS_ORIOS_EXTRS_MNCPIO'').getValue()) ?? 0;',
'    var item11 = parseFloat(apex.item(''P''+pageId+''_MNS_INGRSOS_DEV_REB_DES'').getValue()) ?? 0;',
'    var item12 = parseFloat(apex.item(''P''+pageId+''_MNS_INGRSOS_EXPRTCIONS'').getValue()) ?? 0;',
'    var item13 = parseFloat(apex.item(''P''+pageId+''_MNS_INGRSOS_VNTA_ACT_FIJS'').getValue()) ?? 0;',
'    var item14 = parseFloat(apex.item(''P''+pageId+''_MNS_INGRSOS_ACTVDDS_EXCLDS'').getValue()) ?? 0;',
'    var item15 = parseFloat(apex.item(''P''+pageId+''_MNS_INGRSOS_ACTVDDS_EXENTAS'').getValue()) ?? 0;',
'    var total = item10 - item11 - item12 - item13 - item14 - item15;',
'    apex.item(''P''+pageId+''_TOTAL_INGRESOS_GRVBLES'').setValue(total || 0);',
'    ',
'    var item16 = parseFloat(apex.item(''P''+pageId+''_TOTAL_INGRESOS_GRVBLES'').getValue()) ?? 0;',
'    var itemTotalIngresos = parseFloat(apex.item(''P''+pageId+''_TOTAL_INGRESOS_GRAVADS'').getValue()) ?? 0;',
'    ',
'    if (item16 != itemTotalIngresos){',
'        apex.message.showErrors ([',
'                        {',
'                            type:       "error",',
'                            location:   "page",',
'                            message:    ''item16(''+item16+'') es diferente de itemTotalIngresos (''+itemTotalIngresos+'')'',',
'                            unsafe:     false',
'                        }',
'                    ]);',
'        console.log(''item16(''+item16+'') es diferente de itemTotalIngresos (''+itemTotalIngresos+'')'');',
'    }else{',
'        ',
'        console.log(''item16(''+item16+'') es igual a itemTotalIngresos (''+itemTotalIngresos+'')'');',
'    }',
'};'))
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8699435733708829)
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
'        and seq_id = :P310_SEQ_ID;',
' ',
'         if v_cntdad > 0 then',
'            APEX_COLLECTION.DELETE_MEMBER(',
'            p_collection_name => ''ACTIVIDADES'',',
'            p_seq => :P310_SEQ_ID); ',
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
 p_id=>wwv_flow_api.id(8564818718708931)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(146432375401819096)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Create Formu'
,p_attribute_01=>'TABLE'
,p_attribute_03=>'GI_G_DECLARACIONES_V2'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>'Error al registrar #SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(8546468280708947)
,p_process_success_message=>unistr('Declaraci\00F3n registrada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8698276191708829)
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
'    -- insert en la tabla de activades  id_dclrcion => P310_ID_DCLRCION ',
'    ',
'',
'  --  v_id_dclrcion    :=     :P310_ID_DCLRCION;',
'    pkg_gi_declaraciones_utlddes.prc_hg_formulario(p_cdgo_clnte                 => :F_CDGO_CLNTE,',
'                                                  p_id_sjto_impsto              => :P310_ID_SJTO_IMPSTO,',
'                                                  p_id_dclrcion_v2              => :P310_ID_DCLRCION,',
'                                                  --p_id_cnddto_vgncia            => null,',
'                                                  p_id_dclrcion_vgncia_frmlrio  => :P310_ID_DCLRCION_VGNCIA_FRMLRIO,',
'                                                  p_id_pagina    		        => :APP_PAGE_ID,',
'                                                  p_id_usrio                    => :F_ID_USRIO,',
'                                                  p_id_orgen_tpo                => 1,',
'                                                  p_json_actvdds                => :P310_JSON_ACTVDDES,',
'                                                  o_id_dclrcion                 => v_id_dclrcion_v1,',
'                                                  o_cdgo_rspsta                 => v_cdgo_rspsta, ',
'                                                  o_mnsje_rspsta                => v_mnsje_rspsta);',
'',
'    if v_cdgo_rspsta > 0 then',
'        raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;',
'    :P310_ID_DCLRCION_V2 := v_id_dclrcion_v1;',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(8546468280708947)
,p_process_success_message=>unistr('Declaraci\00F3n registrada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8699040195708829)
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
'               and a.n003            = :P310_ACTIVIDAD ;',
'        ',
'            if v_rgstros > 0 then',
'                raise_application_error(-20003, ''Sr(a). '' || :F_NMBRE_USRIO || '', la Actividad ya se encuentra agregada. Por favor valide e intente nuevamente'');  ',
'            end if;',
'        end;-- FIN Se valida si la Actividad ya esta registrada      ',
'          ',
'        begin',
'            apex_collection.add_member(p_collection_name 	=> ''ACTIVIDADES''',
'                                     , p_n003               => :P310_ACTIVIDAD',
'									 , p_n004               => :P310_TARIFA',
'                                     , p_c001				=> :P310_VALOR );',
'      end;                     ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8696223053708831)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Calcular informaci\00F3n declarante firma')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.cdgo_idntfccion_tpo,',
'           b.idntfccion',
'     into  :P310_TPO_IDENTIFICACION_DECLARANTE_FIRMA,',
'           :P310_IDENTIFICACION_REPRESENTANTE',
'    from df_s_identificaciones_tipo a ',
'    join    si_i_sujetos_responsable b on a.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo',
'    where b.id_sjto_rspnsble  = :P310_ID_SJTO_IMPSTO ',
'    order by dscrpcion_idntfccion_tpo asc;',
'exception',
'      when no_data_found then',
'          :P310_TPO_IDENTIFICACION_DECLARANTE_FIRMA := null;',
'          :P310_IDENTIFICACION_REPRESENTANTE:= null;',
'  end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8696677994708831)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicia Declaracion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_id_page                       NUMBER := :APP_PAGE_ID;',
'    v_id_dclrcion_vgncia_frmlrio    NUMBER := :P310_ID_DCLRCION_VGNCIA_FRMLRIO;',
'    v_idntfccion                    VARCHAR2(50) := :P310_IDNTFCCION;',
'    v_branch                        NUMBER := :P310_BRANCH;',
'    v_id_sjto_impsto                NUMBER := :P310_ID_SJTO_IMPSTO;',
'    v_mstrar_frmlrio             VARCHAR2(2) := :P310_MSTRAR_FRMLRIO;',
'    --v_mstrar_frmlrio                VARCHAR2(50) := ''S'';',
'',
'',
'BEGIN',
unistr('    -- Verifica si la colecci\00F3n existe y la crea o la trunca'),
'    IF apex_collection.collection_exists(p_collection_name => ''ACTIVIDADES'') THEN',
'        APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''ACTIVIDADES'');',
'    END IF;',
'',
unistr('    -- Limpia la cach\00E9 de la p\00E1gina'),
'    APEX_UTIL.CLEAR_PAGE_CACHE(:APP_PAGE_ID);',
'',
'    -- Restaurar los valores de los elementos usando set_session_state',
'    apex_util.set_session_state(''P''||v_id_page||''_ID_DCLRCION_VGNCIA_FRMLRIO'', v_id_dclrcion_vgncia_frmlrio);',
'    apex_util.set_session_state(''P''||v_id_page||''_IDNTFCCION'', v_idntfccion);',
'    apex_util.set_session_state(''P''||v_id_page||''_ID_SJTO_IMPSTO'', v_id_sjto_impsto);',
'    apex_util.set_session_state(''P''||v_id_page||''_MSTRAR_FRMLRIO'', v_mstrar_frmlrio);',
'    apex_util.set_session_state(''P''||v_id_page||''_AVISOS_TABLEROS'', ''S''); ',
'    apex_util.set_session_state(''P''||v_id_page||''_CNSRCIO_UNION_TMPRL'', ''N'');   ',
'    apex_util.set_session_state(''P''||v_id_page||''_RLZA_ACTDS_PNIO_AUTNMO'', ''N'');   ',
'    apex_util.set_session_state(''P''||v_id_page||''_CNCLCION_ESTBLCMIENTO'', ''N'');   ',
'    apex_util.set_session_state(''P''||v_id_page||''_ES_AGNTE_AUTRTNDOR'', ''N'');   ',
'    apex_util.set_session_state(''P''||v_id_page||''_NMRO_ESTBLCMIENTS'', 0); ',
'    apex_util.set_session_state(''P''||v_id_page||''_BRANCH'', v_branch);  ',
'',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        NULL;',
'END;',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8698637034708829)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'limpiar id_sjto_impsto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'        :P310_ID_SJTO_IMPSTO := null;',
'        :P310_ID_DCLRCION := NULL;',
'  exception ',
'    when others then null;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'iniciar_declaracion'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8564403754708931)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(146432375401819096)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Create Form'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8695012881708832)
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
'    into        :P310_ID_IMPSTO,',
'                :P310_ID_IMPSTO_SBMPSTO,',
'                :P310_VGNCIA,',
'                :P310_ID_PRDO',
'    from        gi_d_dclrcnes_vgncias_frmlr a',
'    inner join  gi_d_dclrcnes_tpos_vgncias  b   on  b.id_dclrcion_tpo_vgncia    =   a.id_dclrcion_tpo_vgncia',
'    inner join  df_i_periodos               c   on  c.id_prdo                   =   b.id_prdo',
'    inner join  gi_d_declaraciones_tipo     d   on  d.id_dclrcn_tpo             =   b.id_dclrcn_tpo',
'    where       a.id_dclrcion_vgncia_frmlrio = :P310_ID_DCLRCION_VGNCIA_FRMLRIO;    ',
'    :P310_CDGO_CLNTE:= :F_CDGO_CLNTE;',
'    ',
'    :P310_ID_DCLRCION := NULL;',
'    :P310_ID_DCLRCION_V2 := NULL;',
'end;'))
,p_process_error_message=>'Problemas al consultar el impuesto asociado al formulario, #SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P310_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8695867068708831)
,p_process_sequence=>60
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
'    into   :P310_NMBRES_RZN_SCIAL,',
'           :P310_TPO_IDENTIFICACION,',
'           :P310_IDENTIFICACION,',
'           :P310_DRCCION_NTFCCION,',
'           :P310_TELEFONO,',
'           :P310_DEPARTAMENTO,',
'           :P310_MUNICIPIO,',
'           :P310_CORREO_ELECTRONICO           ',
'    from v_si_i_sujetos_impuesto a',
'    join si_i_personas    b   on  a.id_sjto_impsto = b.id_sjto_impsto',
'    where a.IDNTFCCION_SJTO = :P310_IDNTFCCION',
'    and a.id_impsto         = :P310_ID_IMPSTO;',
'    ',
'   :P310_DIGITO_VERIFICACION := PKG_GI_DECLARACIONES_FUNCIONES.FNC_CA_DIGITO_VERIFICACION(P_IDENTIFICACION =>:P310_IDENTIFICACION);',
'    ',
'        :P310_CLCLO_CNCPTO_ANT_INTRIA_CRCIO  := 0;',
'        :P310_CLCLO_ANTERIOR_AVISOS_TBLRS  := 0;',
'        :P310_CLCLO_CNCPTO_ANT_STSA_BMRL   := 0;',
'        :P310_TOTAL_SALDO_FAVOR            := 0;',
'        :P310_CLCLO_CNCPTO_ANT_STSA_SGRD   := 0;',
'        :P310_INTERESES_MORA_PGO_ANTERIOR := 0;',
'    ',
'end;'))
,p_process_error_message=>unistr('Problemas al consultar la informaci\00F3n asociada al contribuyente, #SQLERRM_TEXT#')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P310_IDNTFCCION'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8697006677708830)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Carga Actividades Economicas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    ',
'    if (not apex_collection.collection_exists(p_collection_name => ''ACTIVIDADES'') ) then',
'            apex_collection.create_collection( p_collection_name => ''ACTIVIDADES'');',
'     end if;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8694682214708832)
,p_process_sequence=>80
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Calcular declaraci\00F3n inicial')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_id_dclrcion_crrccion    number;',
'    v_nmro_cnsctvo            number;',
'    ',
'BEGIN',
'    --:P310_OPCION_DE_USO := ''DIN'';',
'    select pkg_gi_declaraciones_funciones.fnc_co_declaracion(p_id_dclrcion_vgncia_frmlrio => :P310_ID_DCLRCION_VGNCIA_FRMLRIO,',
'                                                             p_idntfccion                 => :P310_IDNTFCCION)',
'      into v_id_dclrcion_crrccion',
'      from dual;',
'     ',
'    if  v_id_dclrcion_crrccion > 0 then',
'       ',
'            :P310_CLCLO_DCLRCION_CRRCCION := v_id_dclrcion_crrccion;',
'',
'            select nmro_cnsctvo',
'              into v_nmro_cnsctvo',
'              from gi_g_declaraciones',
'             where id_dclrcion = :P310_CLCLO_DCLRCION_CRRCCION;',
'',
'           :P310_NMRO_DCLRCION_ANTRIOR := v_nmro_cnsctvo;',
'           --:P310_OPCION_DE_USO := ''DCO'';',
'        else',
'        ',
'           :P310_CLCLO_DCLRCION_CRRCCION := 0;',
'           :P310_NMRO_DCLRCION_ANTRIOR := 0;',
'           ',
'        end if;',
'        ',
'        if :P310_CLCLO_DCLRCION_CRRCCION > 0  and :P310_OPCION_DE_USO = ''DIN'' then',
'                :P310_OPCION_DE_USO := ''DCO'';',
'        elsif :P310_CLCLO_DCLRCION_CRRCCION = 0  and :P310_OPCION_DE_USO = ''DCO'' then',
'                :P310_OPCION_DE_USO := ''DIN'';',
'        end if;',
'    ',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P310_IDNTFCCION is not null and :P310_ID_DCLRCION_VGNCIA_FRMLRIO is not null'
,p_process_when_type=>'SQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8694297032708833)
,p_process_sequence=>90
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
'   v_json_actvdds:= null;',
'        ',
'  --   v_json_actvdds := pkg_gi_declaraciones_utlddes.fnc_co_cncptos_antriores(p_id_dclrcion => :P310_CLCLO_DCLRCION_CRRCCION);',
' v_json_actvdds := pkg_gi_declaraciones_utlddes.fnc_co_cncptos_antriores_pago(p_id_dclrcion => :P310_CLCLO_DCLRCION_CRRCCION);',
'    ',
'   if v_json_actvdds  <> ''{"CONCEPTOS":null}'' then',
'        WITH extracted_data AS (',
'    SELECT',
'        nvl(jt.P310_CONCEPTO_INDUSTRIA_COMERCIO, ''0'') AS P310_CONCEPTO_INDUSTRIA_COMERCIO,',
'        nvl(jt.P310_CONCEPTO_AVISOS_TABLEROS, ''0'') AS P310_CONCEPTO_AVISOS_TABLEROS,',
'        nvl(jt.P310_CNCPTO_SBRTSA_BMBRL, ''0'') AS P310_CNCPTO_SBRTSA_BMBRL,',
'        nvl(jt.P310_TOTAL_SALDO_FAVOR, ''0'') AS P310_TOTAL_SALDO_FAVOR,',
'        nvl(jt.P310_CNCPTO_SBRTSA_SGRDD, ''0'') AS P310_CNCPTO_SBRTSA_SGRDD,',
'        nvl(jt.P310_ANTICIPO_ANIO_SIGUIENTE, ''0'') AS P310_ANTICIPO_ANIO_SIGUIENTE,',
'        nvl(jt.P310_VALOR_CONCEPTO_ANTICIPO, ''0'') AS P310_VALOR_CONCEPTO_ANTICIPO,    ',
'        nvl(jt.P310_INTERESES_MORA_PGO_ANTERIOR, ''0'') AS P310_INTERESES_MORA_PGO_ANTERIOR',
'       ',
'    FROM JSON_TABLE(',
'        v_json_actvdds,',
'        ''$.CONCEPTOS[*]''',
'        COLUMNS (',
'            P310_CONCEPTO_INDUSTRIA_COMERCIO VARCHAR2(50) PATH ''$.P310_CONCEPTO_INDUSTRIA_COMERCIO'',',
'            P310_CONCEPTO_AVISOS_TABLEROS VARCHAR2(50) PATH ''$.P310_CONCEPTO_AVISOS_TABLEROS'',',
'            P310_CNCPTO_SBRTSA_BMBRL VARCHAR2(50) PATH ''$.P310_CNCPTO_SBRTSA_BMBRL'',',
'            P310_TOTAL_SALDO_FAVOR VARCHAR2(50) PATH ''$.P310_TOTAL_SALDO_FAVOR'',',
'            P310_CNCPTO_SBRTSA_SGRDD VARCHAR2(50) PATH ''$.P310_CNCPTO_SBRTSA_SGRDD'',',
'            P310_ANTICIPO_ANIO_SIGUIENTE    VARCHAR2(50) PATH ''$.P310_ANTICIPO_ANIO_SIGUIENTE'',',
'            P310_VALOR_CONCEPTO_ANTICIPO    VARCHAR2(50) PATH ''$.P310_VALOR_CONCEPTO_ANTICIPO'',',
'            P310_INTERESES_MORA_PGO_ANTERIOR  VARCHAR2(50) PATH ''$.P310_INTERESES_MORA''',
'',
'            )',
'        ) jt',
'    )',
'    SELECT',
'        MAX(P310_CONCEPTO_INDUSTRIA_COMERCIO) AS CNCPTO_INDSTRIA_CMRCIO,',
'        MAX(P310_CONCEPTO_AVISOS_TABLEROS) AS CNCPTO_AVSOS_TBLROS,',
'        MAX(P310_CNCPTO_SBRTSA_BMBRL) AS CNCPTO_SBRTSA_BMBRIL,',
'        MAX(P310_TOTAL_SALDO_FAVOR) AS TTL_SLDO_FVOR,',
'        MAX(P310_CNCPTO_SBRTSA_SGRDD) AS CNCPTO_SBRTSA_SGRDAD,',
'        MAX(P310_VALOR_CONCEPTO_ANTICIPO) AS VLR_CNCPTO_ANTCPO,',
'        MAX(P310_INTERESES_MORA_PGO_ANTERIOR) AS INTRSES_MRA_ANT',
'       -- MAX(P310_ANTICIPO_ANIO_SIGUIENTE) AS ANTCPO_ANIO_SGNTE',
'    into ',
'        :P310_CLCLO_CNCPTO_ANT_INTRIA_CRCIO,',
'        :P310_CLCLO_ANTERIOR_AVISOS_TBLRS,',
'        :P310_CLCLO_CNCPTO_ANT_STSA_BMRL,',
'        :P310_TOTAL_SALDO_FAVOR,',
'        :P310_CLCLO_CNCPTO_ANT_STSA_SGRD,',
'        :P310_CLCLO_CNCPTO_ANT_ANTICIPO,',
'        :P310_INTERESES_MORA_PGO_ANTERIOR',
'       -- :P310_MENS_ANTCPO_LIQDDO_ANIO_ANTR',
'        ',
'    FROM extracted_data;',
'   else ',
'        :P310_CLCLO_CNCPTO_ANT_INTRIA_CRCIO  := null;',
'        :P310_CLCLO_ANTERIOR_AVISOS_TBLRS  := null;',
'        :P310_CLCLO_CNCPTO_ANT_STSA_BMRL   := null;',
'        :P310_TOTAL_SALDO_FAVOR            := null;',
'        :P310_CLCLO_CNCPTO_ANT_STSA_SGRD   := null;',
'        :P310_CLCLO_CNCPTO_ANT_ANTICIPO    := null;',
'        :P310_INTERESES_MORA_PGO_ANTERIOR := null;',
'   end if;',
'     ',
'  ',
'       ',
'    ',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P310_CLCLO_DCLRCION_CRRCCION > 0'
,p_process_when_type=>'SQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8695415920708831)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_validarSujetoTributo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_prmtros        varchar2(2000) := ''validaSujetoTributo:''|| :F_CDGO_CLNTE ||'':''|| :P310_ID_DCLRCION_VGNCIA_FRMLRIO ||'':'' || :P310_IDNTFCCION;',
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
 p_id=>wwv_flow_api.id(8697400750708830)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_calculo_item'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_prmtros        varchar2(2000) := ''validaSujetoTributo:''|| :F_CDGO_CLNTE ||'':''|| :P310_ID_DCLRCION_VGNCIA_FRMLRIO ||'':'' || :P310_IDNTFCCION;',
'    v_json           json_object_t;',
'    v_prueba         varchar2(1000);',
'begin',
'    ',
'    ',
'        declare ',
'            v_cdgo_rspsta     number := 0;',
'            v_mnsje_rspsta    varchar(1000) := ''ok'';',
'            v_exception       exception;',
'            v_json            clob ;',
'            v_json_result     clob ;',
'            v_vlor_ttal       number := 0;',
'            v_vlor_sldo_fvor  number := 0;',
'',
'        begin',
'',
'            for i in 1..apex_application.g_f01.count loop',
'                v_json := v_json || apex_application.g_f01(i);',
'            end loop;',
'            v_vlor_ttal     := apex_application.g_x01;',
'            v_vlor_sldo_fvor := apex_application.g_x02;',
'',
'           v_json_result := pkg_gi_declaraciones_funciones_2.fnc_cl_valor_concepto( p_cdgo_clnte                   => :F_CDGO_CLNTE,',
'                                                                                    p_id_dclrcion_vgncia_frmlrio   => :P310_ID_DCLRCION_VGNCIA_FRMLRIO,',
'                                                                                    p_idntfccion                   => :P310_IDNTFCCION,',
'                                                                                    p_id_dclrcion_crrccion         => :P310_CLCLO_DCLRCION_CRRCCION,',
'                                                                                    p_id_sjto_tpo                  => :P310_CLASIFICACION,',
'                                                                                    p_fcha_pryccion                => :P310_FCHA_MAXIMA_PRSNTCION,--',
'                                                                                    p_cdgo_sncion_tpo              => :P310_TIPO_SANCION,--''EXT'',',
'                                                                                    p_cdgo_dclrcion_uso            => :P310_OPCION_DE_USO, --''DIN'',',
'                                                                                    p_id_dclrcion_incial           => :P310_CLCLO_DCLRCION_CRRCCION,',
'                                                                                    p_impsto_crgo                  => :P310_TOTAL_SALDO_CARGO,--:P310_TOTAL_IMPUESTO_CARGO,',
'                                                                                    p_ingrsos_brtos                => 0,',
'                                                                                     p_saldo_favor                 => v_vlor_sldo_fvor,--:P310_TOTAL_SALDO_FAVOR,',
'                                                                                    p_vlor_ttal                    => v_vlor_ttal,--:P310_TOTAL_SALDO_CARGO,',
'                                                                                    p_json                         => v_json);',
'',
'',
'               -- insert into muerto (v_001,c_001,t_001)values(''JSON: '',v_json,sysdate); commit;',
'                insert into muerto (v_001,c_001,t_001)values(''v_json_result: ''||:P310_FCHA_MAXIMA_PRSNTCION ,v_json_result,sysdate); commit;',
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
 p_id=>wwv_flow_api.id(8693453789708834)
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
'        ',
'         ',
'        if (not apex_collection.collection_exists(p_collection_name => ''ACTIVIDADES'') ) then',
'            apex_collection.create_collection( p_collection_name => ''ACTIVIDADES'');',
'        end if;',
'  ',
'         if :P310_ACTIVIDAD is null then ',
'                  raise v_exception;',
'         end if;',
'          -- Se valida si la Actividad ya esta registrada',
'        begin',
'            begin',
'                select count(a.n003), ',
'                        a.c001',
'                  into v_rgstros,',
'                       v_nmbre_actvdad',
'                 from apex_collections   a',
'                 where collection_name   = ''ACTIVIDADES''',
'                   and a.n003            = :P310_ACTIVIDAD',
'                   group by a.n003, a.c001;',
'                   ',
'                    ',
'              exception ',
'                  when no_data_found then',
'                        begin',
'                        insert into muerto (c_001, t_001) values(:P310_ACTIVIDAD_DESCRIPCION, sysdate); commit;',
'                            apex_collection.add_member(p_collection_name 	=> ''ACTIVIDADES''',
'                                                     , p_n003               => :P310_ACTIVIDAD',
'                                                     , p_n004               => :P310_TARIFA',
'                                                     , p_n005               => :P310_INGRESOS_GRAVADOS',
'                                                     , p_n001				=> :P310_VLOR_IPSTO',
'                                                     , p_c001               => :P310_ACTIVIDAD_DESCRIPCION);',
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
'    ',
'        when v_exception then',
'            apex_json.open_object;',
'            if :P310_ACTIVIDAD is null then            ',
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
'                                               ''</details>'' );',
'            apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8693869921708833)
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
'        and seq_id = :P310_SEQ_ID;',
'',
'        if v_cntdad > 0 then',
'            APEX_COLLECTION.DELETE_MEMBER(p_collection_name => ''ACTIVIDADES'',',
'                                          p_seq => :P310_SEQ_ID); ',
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
 p_id=>wwv_flow_api.id(8693094400708834)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_limpiar_Actividades'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_exste boolean;',
'    v_cntdad number;',
'    ',
'    v_prncpal               number;',
'    v_rgstros               number;',
'begin',
'    if APEX_COLLECTION.COLLECTION_EXISTS(''ACTIVIDADES'') then ',
'        APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''ACTIVIDADES'');',
'     end if;                   ',
'',
'    apex_json.open_object;    ',
'    apex_json.write(''o_cdgo_rspsta'', 0);',
'    apex_json.write(''o_mnsje_rspsta'',''ok'');',
'    apex_json.close_object;',
'                                                                     ',
'    exception',
'        when others then',
'            apex_json.open_object;',
'            apex_json.write(''o_cdgo_rspsta'', 100);',
'            apex_json.write(''o_mnsje_rspsta'', ''<details>'' ||  ',
'													''<summary>'' || ''No fue posible limpiar las actividades, '' ||',
'													''por favor intente nuevamente.</summary>'' || ''</p>'' ||',
'											  ''</details>'' || sqlerrm);',
'            apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8697858851708830)
,p_process_sequence=>60
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
