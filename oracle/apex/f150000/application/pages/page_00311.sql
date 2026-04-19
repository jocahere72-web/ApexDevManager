prompt --application/pages/page_00311
begin
wwv_flow_api.create_page(
 p_id=>311
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Formulario Mensual'
,p_alias=>'DL_FRM_ICA_MENSUAL'
,p_step_title=>'Formulario Mensual'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1',
'#IMAGE_PREFIX#javascript/infortributos/js/accounting.min.js',
'#IMAGE_PREFIX#javascript/infortributos/Declaraciones/formularioDeclaracionV2.js?v=0017'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
unistr('var pageId = &APP_PAGE_ID.;  // Extrae el n\00FAmero de la pagina.'),
'var estado_calculo = true;						  ',
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
'        // Obtenemos un json con los datos seleccionados que no han sido procesados',
'        var json = records.map((record) => {',
'            return {',
'                "SEQ_ID": model.getValue(record, "SEQ_ID")',
'            };',
'        });',
'',
'        if (json.length > 0) {',
'            const promises = records.map((data) => {',
'                seq = model.getValue(data, "SEQ_ID"); 											 ',
'                apex.item(''P'' + pageId + ''_SEQ_ID'').setValue(seq);',
'               // return model.setValue(data, "VLOR_IPSTO", redondearAlMultiploDeMil(vlor_impuesto));',
'            });',
'            Promise.all(promises).then(() => {',
'            }).catch((error) => {',
'                console.error("Error al actualizar valores de impuesto:", error);',
'            });',
'        }',
'    }    ',
'};',
'',
'async function eliminarActividad(p_seq_id){    ',
'    let $waitPopup = apex.widget.waitPopup();',
'    try{',
'        apex.item(''P'' + pageId + ''_SEQ_ID'').setValue(p_seq_id);       ',
'        await apex.server.process ( "ajax_eliminar_Actividad", {',
'            pageItems: "#P"+pageId+"_SEQ_ID"   ',
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
'                    apex.region("actividad").refresh();   ',
'                   // apex.theme.closeRegion("gestionActividadEconomica");',
'                    //calculoImpuesto();',
'                     apex.message.showPageSuccess("Actividad eliminada.");                                                        ',
'                     setTimeout(function() {',
'                        calculoActividadesGravadas();                      ',
'                        buildJsonActividades();  ',
'                        validarValorBanco();',
'                         $(''.t-Alert--success'').fadeOut(''slow'');         ',
'                    }, 1000);                 ',
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
'apex.item( ''P'' + pageId + ''_CLCLA_FCHA_PRSNTCION_FINAL'').show();',
'apex.item( ''P'' + pageId + ''_TPO_IDENTIFICACION'' ).enable();',
'apex.item( ''P'' + pageId + ''_IDENTIFICACION'' ).enable(); ',
'apex.item( ''P'' + pageId + ''_DIGITO_VERIFICACION'' ).enable();',
'apex.item( ''P'' + pageId + ''_AVISOS_TABLEROS'' ).setValue(''N'');',
'apex.item( ''P'' + pageId + ''_CNSRCIO_UNION_TMPRL'' ).setValue(''N'');',
'apex.item( ''P'' + pageId + ''_RLZA_ACTDS_PNIO_AUTNMO'' ).setValue(''N'');',
'apex.item( ''P'' + pageId + ''_CNCLCION_ESTBLCMIENTO'' ).setValue(''N''); ',
'apex.item( ''P'' + pageId + ''_TTL_INGRS_ORIOS_EXTRS_PAIS'' ).enable();',
'apex.item( ''P'' + pageId + ''_TTL_INGRS_ORIOS_EXTRS_MNCPIO'' ).show();',
'apex.item( ''P'' + pageId + ''_TOTAL_INGRESOS_GRVBLES'' ).enable();',
'apex.item( ''P'' + pageId + ''_MNS_INGRSS_FUERA_MNCPIO'' ).enable();',
'apex.item( ''P'' + pageId + ''_MNS_INGRSOS_DEV_REB_DES'' ).enable();',
'apex.item( ''P'' + pageId + ''_MNS_INGRSOS_EXPRTCIONS'' ).enable();',
'apex.item( ''P'' + pageId + ''_MNS_INGRSOS_VNTA_ACT_FIJS'' ).enable();',
'apex.item( ''P'' + pageId + ''_MNS_INGRSOS_ACTVDDS_EXCLDS'' ).enable();',
'apex.item( ''P'' + pageId + ''_MNS_INGRSOS_ACTVDDS_EXENTAS'' ).enable();',
'apex.item( ''P'' + pageId + ''_MNS_VLR_EXNCION_SBRE_IMPSTO'' ).enable();',
'apex.item( ''P'' + pageId + ''_MNS_RTNCNES_PRCTCRON_PRDO'' ).enable();',
'apex.item( ''P'' + pageId + ''_AUTORRETNCNES_AVSOS_TBLROS'' ).enable();',
'apex.item( ''P'' + pageId + ''_AUTO_RRTNCNES_SBRTSA_BMBROS'' ).enable();',
'apex.item( ''P'' + pageId + ''_TOTAL_AUTORRETENCIONES'' ).enable();',
'apex.item( ''P'' + pageId + ''_TOTAL_INGRESOS_GRAVADS'' ).enable();',
'apex.item( ''P'' + pageId + ''_TOTAL_IMPUESTO'' ).enable();',
'apex.item( ''P'' + pageId + ''_IMPUESTO_LEY'' ).enable();',
'apex.item( ''P'' + pageId + ''_CALCULO_INTRSS_INTRIA_CMRCIO'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_INTRIA_CRCIO'' ).show();    ',
'apex.item( ''P'' + pageId + ''_TOTAL_IMPUESTO_CARGO'' ).enable();	',
'apex.item( ''P'' + pageId + ''_IMPUESTO_AVISOS_TABLEROS'').enable();',
'apex.item( ''P'' + pageId + ''_SOBRETASA_BOMBERIL'').enable();',
'apex.item( ''P'' + pageId + ''_SOBRETASA_SEGURIDAD'').enable();',
'apex.item( ''P'' + pageId + ''_ANTICIPO_ANIO_SIGUIENTE'').enable();',
'apex.item( ''P'' + pageId + ''_SANCION_SUGERIDA'' ).enable();',
'apex.item( ''P'' + pageId + ''_TOTAL_SALDO_CARGO'' ).enable();',
'apex.item( ''P'' + pageId + ''_TOTAL_SALDO_FAVOR'' ).enable();',
'apex.item( ''P'' + pageId + ''_DESCUENTO_PRONTO_PAGO'' ).show();',
'apex.item( ''P'' + pageId + ''_INTERESES_MORA'' ).enable();',
'apex.item( ''P'' + pageId + ''_TOTAL_PAGAR'' ).enable(); ',
'apex.item( ''P'' + pageId + ''_VALOR_PAGAR'' ).enable();',
'apex.item( ''P'' + pageId + ''_TOTAL_PAGAR_PAGO_VOLUNTARIO'' ).enable();',
'apex.item( ''P'' + pageId + ''_APORTE_VOLUNTARIO'' ).setValue(''N'');',
'apex.item( ''P'' + pageId + ''_TARIFA'' ).enable();    ',
'apex.item( ''P'' + pageId + ''_SANCION_MANUAL'').show();',
'apex.item( ''P'' + pageId + ''_NMRO_ESTBLCMIENTS'').show();',
'apex.item( ''P'' + pageId + ''_AVISOS_TABLEROS'').show();',
'apex.item( ''P'' + pageId + ''_CNSRCIO_UNION_TMPRL'').show();',
'apex.item( ''P'' + pageId + ''_RLZA_ACTDS_PNIO_AUTNMO'').show();',
'apex.item( ''P'' + pageId + ''_CNCLCION_ESTBLCMIENTO'').show();  ',
'apex.item( ''P'' + pageId + ''_GENERACION_ENERGIA'' ).show();',
'apex.item( ''P'' + pageId + ''_IMPUESTO_LEY'' ).show();',
'apex.item( ''P'' + pageId + ''_IMPUESTO_AVISOS_TABLEROS'').show();',
'apex.item( ''P'' + pageId + ''_SALDO_FAVOR_AVISOS_TABLEROS'').show();',
'apex.item( ''P'' + pageId + ''_CONCEPTO_AVISOS_TABLEROS'').show();',
'apex.item( ''P'' + pageId + ''_DIFERENCIA_AVISOS_TABLEROS'').show();',
'apex.item( ''P'' + pageId + ''_CLCLO_ANTERIOR_AVISOS_TBLRS'').show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DFCIA_PGO_AVSS_TBLRS'').show();',
'apex.item( ''P'' + pageId + ''_VLR_PAGO_AVISOS_TABLEROS'').show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_AVSS_TBLRS'').show();',
'apex.item( ''P'' + pageId + ''_CLCLO_INTRSS_AVSS_TBLRS'').show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_AVSS_TBS'').show();',
'apex.item( ''P'' + pageId + ''_CLCLO_SLDO_FVR_PGO_AVSS_TBS'').show();',
'apex.item( ''P'' + pageId + ''_PGO_UNDDS_CMRCLS'').enable();',
'apex.item( ''P'' + pageId + ''_SOBRETASA_BOMBERIL'').show();',
'apex.item( ''P'' + pageId + ''_SLDO_FVR_CNPTO_SBTSA_BMRL'').show();',
'apex.item( ''P'' + pageId + ''_DFRNCIA_CNCPTO_SBTSA_BMRL'').show();',
'apex.item( ''P'' + pageId + ''_CNCPTO_SBRTSA_BMBRL'').show();',
'apex.item( ''P'' + pageId + ''_CLCLO_CNCPTO_ANT_STSA_BMRL'').show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DIF_PGO_STSA_BMRL'').show();',
'apex.item( ''P'' + pageId + ''_CLCLO_VLR_PGO_STSA_BMRL'').show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_STSA_BMRL'').show();',
'apex.item( ''P'' + pageId + ''_CLCLO_INTRSES_STSA_BMRL'').show();',
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
'apex.item( ''P'' + pageId + ''_SLDO_FVR_CNCPTO_ANTCPO'' ).show();',
'apex.item( ''P'' + pageId + ''_DFRNCIA_CNCPTO_ANTCPO'' ).show();',
'apex.item( ''P'' + pageId + ''_VALOR_CONCEPTO_ANTICIPO'' ).show();',
'apex.item( ''P'' + pageId + ''_CALCULO_INTERES_ANTICIPO'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_CNCPTO_ANT_ANTICIPO'' ).show();',
'apex.item( ''P'' + pageId + ''_CALCULO_PGO_ANTICIPO'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DIF_PGO_ANTICIPO'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_SLDO_FVR_PGO_ANTICIPO'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_ANTICIPO'' ).show();',
'apex.item( ''P'' + pageId + ''_TOTAL_IMPUESTO_CARGO'').show();',
'apex.item( ''P'' + pageId + ''_CALCULO_TOTAL_SALDO_CARGO'' ).show();',
'apex.item( ''P'' + pageId + ''_CLCLO_DESCUENTO_SANCION'' ).show();',
'apex.item( ''P'' + pageId + ''_MENOS_SLDO_FVR_PRDO_ANTRIOR'').show(); ',
'apex.item( ''P'' + pageId + ''_APORTE_VOLUNTARIO'').show();    ',
'apex.item( ''P'' + pageId + ''_VALOR_PAGO_VOLUNTARIO'').show();  ',
'apex.item( ''P'' + pageId + ''_TOTAL_PAGAR_PAGO_VOLUNTARIO'').show(); ',
'apex.item( ''P'' + pageId + ''_VALOR_PAGAR'').show();    ',
'apex.item( ''P'' + pageId + ''_ETIQUETA_PRINCIPAL'').show();',
'apex.item( ''P'' + pageId + ''_ETIQUETA_SECUNDARIA'').show();',
'apex.item( ''P'' + pageId + ''_CALCULO_VALOR_PAGAR_BANCOS'').show();',
'apex.item( ''P'' + pageId + ''_VALOR_PAGAR_BANCOS'').enable();',
'apex.item( ''P'' + pageId + ''_MENS_VLR_EXNCN_EXNRCN_IMPSTO'').show();',
'apex.item( ''P'' + pageId + ''_DESTINO_APORTE_VOLUNTARIO'').enable();',
'apex.item( ''P'' + pageId + ''_TPO_IDNTFCCION_DCLRNTE_FRMA'' ).enable();',
'apex.item( ''P'' + pageId + ''_IDNTFCCION_RPRSNTNTE'' ).enable();',
'apex.item( ''P'' + pageId + ''_TPO_IDENTIFICACION_REVISOR'' ).enable();',
'apex.item( ''P'' + pageId + ''_IDENTIFICACION_REVISOR'' ).enable();   ',
'    ',
'document.addEventListener(''keydown'', function(event) {',
'        if (event.key === "Escape" || event.keyCode === 27) {',
unistr('           // event.preventDefault(); // Evita que "Esc" cancele el env\00EDo'),
'            deshabilitarItems(); ',
'        }',
'    });',
'};   ',
'',
'function deshabilitarItems() {',
'apex.item( ''P'' + pageId + ''_CLCLA_FCHA_PRSNTCION_FINAL'').hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DCLRCION_CRRCCION'').hide();',
'apex.item( ''P'' + pageId + ''_ID_DCLRCION_V2'').hide();',
'apex.item( ''P'' + pageId + ''_ID_DCLRCION'').hide();',
'apex.item( ''P'' + pageId + ''_NMBRE_RSPNS_FRMA'').hide();',
'apex.item( ''P'' + pageId + ''_ID_PAGE'').hide();',
'apex.item( ''P'' + pageId + ''_JSON_ITEM'').hide();',
'apex.item( ''P'' + pageId + ''_JSON_VALORES'').hide();',
'apex.item( ''P'' + pageId + ''_ITEMS_FECHA'').hide();  ',
'apex.item( ''P'' + pageId + ''CLCLA_FCHA_PRSNTCION_FINAL_1'' ).hide();',
'apex.item( ''P'' + pageId + ''_TPO_IDENTIFICACION'' ).disable();',
'apex.item( ''P'' + pageId + ''_IDENTIFICACION'' ).disable();',
'apex.item( ''P'' + pageId + ''_CORREO_ELECTRONICO'' ).enable();',
'apex.item( ''P'' + pageId + ''_DIGITO_VERIFICACION'' ).disable();',
'apex.item( ''P'' + pageId + ''_TTL_INGRS_ORIOS_EXTRS_PAIS'' ).disable();',
'apex.item( ''P'' + pageId + ''_TTL_INGRS_ORIOS_EXTRS_MNCPIO'' ).hide();',
'apex.item( ''P'' + pageId + ''_TOTAL_INGRESOS_GRVBLES'' ).disable();',
'apex.item( ''P'' + pageId + ''_MNS_INGRSS_FUERA_MNCPIO'' ).disable();',
'apex.item( ''P'' + pageId + ''_MNS_INGRSOS_DEV_REB_DES'' ).disable();',
'apex.item( ''P'' + pageId + ''_MNS_INGRSOS_EXPRTCIONS'' ).hide();',
'apex.item( ''P'' + pageId + ''_MNS_INGRSOS_VNTA_ACT_FIJS'' ).disable();',
'apex.item( ''P'' + pageId + ''_MNS_INGRSOS_ACTVDDS_EXCLDS'' ).disable();',
'apex.item( ''P'' + pageId + ''_MNS_INGRSOS_ACTVDDS_EXENTAS'' ).disable();',
'apex.item( ''P'' + pageId + ''_MNS_VLR_EXNCION_SBRE_IMPSTO'').disable();',
'apex.item( ''P'' + pageId + ''_MNS_RTNCNES_PRCTCRON_PRDO'' ).disable();',
'apex.item( ''P'' + pageId + ''_AUTORRETNCNES_AVSOS_TBLROS'' ).disable();',
'apex.item( ''P'' + pageId + ''_AUTO_RRTNCNES_SBRTSA_BMBROS'' ).disable();',
'apex.item( ''P'' + pageId + ''_TOTAL_AUTORRETENCIONES'' ).disable();',
'//apex.item( ''P'' + pageId + ''_MENOS_RETENCIONES'' ).hide();',
'apex.item( ''P'' + pageId + ''_MENOS_AUTORRETENCIONES'' ).hide();',
'apex.item( ''P'' + pageId + ''_MENS_ANTCPO_LIQDDO_ANIO_ANTR'' ).hide();',
'apex.item( ''P'' + pageId + ''_ANTICIPO_ANIO_SIGUIENTE'' ).hide();',
'apex.item( ''P'' + pageId + ''_TOTAL_SALDO_FAVOR'' ).hide();',
'apex.item( ''P'' + pageId + ''_TOTAL_INGRESOS_GRAVADS'' ).disable();',
'apex.item( ''P'' + pageId + ''_TOTAL_IMPUESTO'' ).disable();',
'apex.item( ''P'' + pageId + ''_IMPUESTO_LEY'' ).disable();',
'apex.item( ''P'' + pageId + ''_CONCEPTO_INDUSTRIA_COMERCIO'' ).hide();',
'apex.item( ''P'' + pageId + ''_SLDO_FVR_CNCPTO_INTRIA_CMRCIO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_CNCPTO_ANT_INTRIA_CRCIO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DFCIA_PGO_INTRIA_CMRCIO'' ).hide();',
'apex.item( ''P'' + pageId + ''_VALOR_PAGO_INDUSTRIA_COMERCIO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CALCULO_DSCNTO_INTRIA_CMRCIO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CALCULO_INTRSS_INTRIA_CMRCIO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_INTRIA_CRCIO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_SLDO_FVR_PGO_INTRIA_CCIO'' ).hide();   ',
'apex.item( ''P'' + pageId + ''_TOTAL_IMPUESTO_CARGO'' ).disable();	',
'apex.item( ''P'' + pageId + ''_IMPUESTO_AVISOS_TABLEROS'').disable();',
'apex.item( ''P'' + pageId + ''_SOBRETASA_BOMBERIL'').disable();',
'apex.item( ''P'' + pageId + ''_SOBRETASA_SEGURIDAD'').disable();',
'apex.item( ''P'' + pageId + ''_ANTICIPO_ANIO_SIGUIENTE'').disable();',
'apex.item( ''P'' + pageId + ''_SANCION_SUGERIDA'' ).disable();',
'apex.item( ''P'' + pageId + ''_TOTAL_SALDO_CARGO'' ).disable();',
'apex.item( ''P'' + pageId + ''_TOTAL_SALDO_FAVOR'' ).disable();',
'apex.item( ''P'' + pageId + ''_DESCUENTO_PRONTO_PAGO'' ).hide();',
'apex.item( ''P'' + pageId + ''_INTERESES_MORA'' ).disable();',
'apex.item( ''P'' + pageId + ''_TOTAL_PAGAR'' ).disable(); ',
'apex.item( ''P'' + pageId + ''_VALOR_PAGAR'' ).disable();',
'apex.item( ''P'' + pageId + ''_TOTAL_PAGAR_PAGO_VOLUNTARIO'' ).disable();',
'apex.item( ''P'' + pageId + ''_APORTE_VOLUNTARIO'' ).setValue(''N'');',
'apex.item( ''P'' + pageId + ''_TARIFA'' ).disable();    ',
'apex.item( ''P'' + pageId + ''_SANCION_MANUAL'').hide();',
'apex.item( ''P'' + pageId + ''_NMRO_ESTBLCMIENTS'').hide();',
'apex.item( ''P'' + pageId + ''_AVISOS_TABLEROS'').hide();',
'apex.item( ''P'' + pageId + ''_CNSRCIO_UNION_TMPRL'').hide();',
'apex.item( ''P'' + pageId + ''_RLZA_ACTDS_PNIO_AUTNMO'').hide();',
'apex.item( ''P'' + pageId + ''_CNCLCION_ESTBLCMIENTO'').hide();  ',
'apex.item( ''P'' + pageId + ''_GENERACION_ENERGIA'' ).hide();',
'apex.item( ''P'' + pageId + ''_IMPUESTO_LEY'' ).hide();',
'apex.item( ''P'' + pageId + ''_IMPUESTO_AVISOS_TABLEROS'').hide();',
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
'apex.item( ''P'' + pageId + ''_PGO_UNDDS_CMRCLS'').disable();',
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
'apex.item( ''P'' + pageId + ''_CLCLO_INTRSES_STSA_SGRD'').hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_STSA_SGRD'').hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_SLDO_FVR_PGO_STSA_SGRD'').hide();',
'apex.item( ''P'' + pageId + ''_SLDO_FVR_CNCPTO_ANTCPO'' ).hide();',
'apex.item( ''P'' + pageId + ''_DFRNCIA_CNCPTO_ANTCPO'' ).hide();',
'apex.item( ''P'' + pageId + ''_VALOR_CONCEPTO_ANTICIPO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CALCULO_INTERES_ANTICIPO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_CNCPTO_ANT_ANTICIPO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CALCULO_PGO_ANTICIPO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DIF_PGO_ANTICIPO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_SLDO_FVR_PGO_ANTICIPO'' ).hide();',
'apex.item( ''P'' + pageId + ''_CLCLO_DSCNTO_INT_ANTICIPO'' ).hide();',
'apex.item( ''P'' + pageId + ''_TOTAL_IMPUESTO_CARGO'').hide();',
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
'apex.item( ''P'' + pageId + ''_SANCION_MANUAL'').hide();',
'apex.item( ''P'' + pageId + ''_MENS_VLR_EXNCN_EXNRCN_IMPSTO'').hide();',
'apex.item( ''P'' + pageId + ''_MENOS_SLDO_FVR_PRDO_ANTRIOR'').hide(); ',
'apex.item( ''P'' + pageId + ''_VALOR_PAGAR'').hide();',
'apex.item( ''P'' + pageId + ''_DESTINO_APORTE_VOLUNTARIO'').disable();',
'apex.item( ''P'' + pageId + ''_APORTE_VOLUNTARIO'').hide();    ',
'apex.item( ''P'' + pageId + ''_VALOR_PAGO_VOLUNTARIO'').hide();  ',
'apex.item( ''P'' + pageId + ''_TOTAL_PAGAR_PAGO_VOLUNTARIO'').hide();     ',
'apex.item( ''P'' + pageId + ''_JSON_ACTVDDES'').hide();   ',
'apex.item( ''P'' + pageId + ''_CLCLO_CNCPTO_INDSTRIA_CMRCIO'').hide();   ',
'apex.item( ''P'' + pageId + ''_TPO_IDNTFCCION_DCLRNTE_FRMA'' ).disable();',
'apex.item( ''P'' + pageId + ''_IDNTFCCION_RPRSNTNTE'' ).disable();',
'apex.item( ''P'' + pageId + ''_TPO_IDENTIFICACION_REVISOR'' ).disable();',
'apex.item( ''P'' + pageId + ''_IDENTIFICACION_REVISOR'' ).disable();',
'apex.item( ''P'' + pageId + ''_TARIFA'' ).disable();',
'apex.item( ''P'' + pageId + ''_ETIQUETA_PRINCIPAL'').hide();',
'apex.item( ''P'' + pageId + ''_ETIQUETA_SECUNDARIA'').hide();',
'apex.item( ''P'' + pageId + ''_CALCULO_VALOR_PAGAR_BANCOS'').hide();',
'apex.item( ''P'' + pageId + ''_VALOR_PAGAR_BANCOS'').disable();',
'};',
'',
'function calculoTotalActividades() {',
'    var region = apex.region(''actividad'');',
'    var v_total_ingresos_gravados = 0;',
'    var v_total_impuesto = 0;',
'',
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
'        v_total_ingresos_gravados = v_total_ingresos_gravados ?? 0;',
'        v_total_impuesto = v_total_impuesto ?? 0;',
'        apex.item(''P''+pageId+''_TOTAL_INGRESOS_GRAVADS'').setValue(parseFloat(v_total_ingresos_gravados));',
'        apex.item(''P''+pageId+''_TOTAL_IMPUESTO'').setValue(parseFloat(v_total_impuesto));',
'        apex.item(''P''+pageId+''_TTL_IMPSTO_INDSTRIA_CMRCIO'').setValue(parseFloat(v_total_impuesto));',
'	}',
'    ',
'    regionBaseGravable();',
'    calculoItem24();',
'    TTAL_PGOS_ABNOS_CUENTA_ICA(); //CAMBIAR A calculoTotalActividades',
'					',
'};',
'',
'function TTAL_PGOS_ABNOS_CUENTA_ICA(){',
'    var TOTAL_INGRESOS_GRAVADS  = parseFloat(apex.item(''P''+pageId+''_TOTAL_INGRESOS_GRAVADS'').getValue()) ?? 0; //Extrae el valor del item 17  ',
'    apex.item(''P''+pageId+''_TTAL_PGOS_ABNOS_CUENTA_ICA'').setValue(TOTAL_INGRESOS_GRAVADS || 0);',
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
'    var total = 0;//item9 + item11 + item12 + item13 + item14 + item15 + itemTotalIngresos;',
'    apex.item(''P''+pageId+''_TTL_INGRS_ORIOS_EXTRS_PAIS'').setValue(total || 0);',
'    var calculoItem10 = parseFloat(total) - parseFloat(item9);',
'    ',
'    if (calculoItem10 <= 0){',
'        apex.item(''P''+pageId+''_TTL_INGRS_ORIOS_EXTRS_MNCPIO'').setValue(0);',
'        apex.item(''P''+pageId+''_TTL_INGRS_ORIOS_EXTRS_MNCPIO'').refresh();',
'    }else{',
'        apex.item(''P''+pageId+''_TTL_INGRS_ORIOS_EXTRS_MNCPIO'').setValue(calculoItem10);',
'    }',
'					   ',
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
'    apex.item(''P''+pageId+''_TOTAL_INGRESOS_GRVBLES'').setValue(0 || 0);	 ',
'};',
'',
unistr('//Funci\00F3n que calcula los valores de los concepto industria y comercio, avisos y tablero y sobretasa bomberil'),
'function calculoItem24() {',
'    var valor_ttal_impsto            = apex.item(''P''+pageId+''_TOTAL_IMPUESTO'').getValue();',
'    var impsto_ley                   = apex.item(''P''+pageId+''_IMPUESTO_LEY'').getValue();  ',
'    var indicador                    = apex.item(''P''+pageId+''_TIPO_CALCULO_SANCION'').getValue();',
'    var valor_sancion_manual         = apex.item(''P''+pageId+''_SANCION_MANUAL'').getValue();',
'    var valor_sancion_sugerida       = apex.item(''P''+pageId+''_SANCION_SUGERIDA'').getValue();',
'    var TTL_IMPSTO_INDSTRIA_CMRCIO   =  redondearAlMultiploDeMil(parseFloat(valor_ttal_impsto) + parseFloat(impsto_ley));',
'	var indicador_avisostablero      = apex.item(''P''+pageId+''_AVISOS_TABLEROS'').getValue();',
'   ',
'	if (indicador_avisostablero ===''S'') {',
'		var IMPUESTO_AVISOS_TABLEROS = redondearAlMultiploDeMil((parseFloat(TTL_IMPSTO_INDSTRIA_CMRCIO) * 15) / 100);',
'		apex.item(''P''+pageId+''_IMPUESTO_AVISOS_TABLEROS'').setValue(0);	',
'	}else{',
'		apex.item(''P''+pageId+''_IMPUESTO_AVISOS_TABLEROS'').setValue(0); ',
'	}    ',
'    var SOBRETASA_BOMBERIL = redondearAlMultiploDeMil((parseFloat(TTL_IMPSTO_INDSTRIA_CMRCIO) * 7) / 100);',
'    apex.item(''P''+pageId+''_SOBRETASA_BOMBERIL'').setValue(0);',
'',
'};',
'',
unistr('//Funci\00F3n que calcula el item 25'),
'function calculoItem25(){',
'    var item10 = parseFloat(apex.item(''P''+pageId+''_TTL_IMPSTO_INDSTRIA_CMRCIO'').getValue()) ?? 0;',
'    var item14 = parseFloat(apex.item(''P''+pageId+''_MENOS_RETENCIONES'').getValue()) ?? 0;',
'    ',
'    var item30 = (item10 * 40 )/100 ;',
'   // apex.item(''P''+pageId+''_ANTICIPO_ANIO_SIGUIENTE'').setValue(redondearAlMultiploDeMil(parseFloat(item30)) || 0);',
'    var total = item10 ;					 ',
'        ',
'    if (total < 0 ){',
'        apex.item(''P''+pageId+''_TOTAL_IMPUESTO_CARGO'').setValue(0 || 0);',
'        apex.item(''P''+pageId+''_CLCLO_IMPSTO_CRGO_SNCION'').setValue(0 || 0);																					  ',
'    }else{																	   ',
'        apex.item(''P''+pageId+''_TOTAL_IMPUESTO_CARGO'').setValue(total || 0);',
'        apex.item(''P''+pageId+''_CLCLO_IMPSTO_CRGO_SNCION'').setValue(total || 0);',
'    }    ',
'    ',
'    calculoItem33();',
'};',
'',
unistr('function calculoItem33(){ //33. C\00C1LCULO  TOTAL SALDO A CARGO (RENGL\00D3N 25-26-27-28-29+30+31-32)'),
'    var item25 = parseFloat(apex.item(''P''+pageId+''_TOTAL_IMPUESTO_CARGO'').getValue()) ?? 0;',
'    var item14 = parseFloat(apex.item(''P''+pageId+''_MENOS_RETENCIONES'').getValue()) ?? 0;',
'    var item31 = parseFloat(apex.item(''P''+pageId+''_CLCLO_NETO_SANCION'').getValue()) ?? 0;',
'    var item32 = parseFloat(apex.item(''P''+pageId+''_MENOS_SLDO_FVR_PRDO_ANTRIOR'').getValue()) ?? 0;',
'	',
'    var item33 = item25;',
'',
'    if (item33 < 0) { // Valida la diferencia del TOTAL SALDO A CARGO.',
'        // apex.item(''P''+pageId+''_CALCULO_TOTAL_SALDO_CARGO'').setValue(0 || 0);',
'         apex.item(''P''+pageId+''_TOTAL_SALDO_CARGO'').setValue(0 || 0);',
'    }else{',
'		  apex.item(''P''+pageId+''_TOTAL_SALDO_CARGO'').setValue( item33|| 0);',
'		//  apex.item(''P''+pageId+''_CALCULO_TOTAL_SALDO_CARGO'').setValue( item33 || 0);',
'    }',
'    ',
'      ',
'    item33 = item33  - item31;',
'    if (item33 < 0) { ',
'         apex.item(''P''+pageId+''_CALCULO_TOTAL_SALDO_CARGO'').setValue(0 || 0);',
'        ',
'        ',
'    }else{',
'         apex.item(''P''+pageId+''_CALCULO_TOTAL_SALDO_CARGO'').setValue( item33 || 0);',
'        ',
'    }',
'	',
'	CLCLO_CNCPTO_INDSTRIA_CMRCIO();',
'};',
'',
'function limpiar_items(){',
'    // Limpiamos Items',
'    apex.item(''P''+pageId+''_ACTIVIDAD'').setValue("");',
'    apex.item(''P''+pageId+''_TARIFA'').setValue("");',
'    apex.item(''P''+pageId+''_INGRESOS_GRAVADOS'').setValue("");',
'    apex.item(''P''+pageId+''_VLOR_IPSTO'').setValue("");',
'};',
'',
unistr('function CLCLO_CNCPTO_INDSTRIA_CMRCIO (){ // - C\00C1LCULO CONCEPTO INDUSTRIA COMERCIO 	'),
'     var item20 = parseFloat(apex.item(''P''+pageId+''_TTL_IMPSTO_INDSTRIA_CMRCIO'').getValue()) ?? 0;',
'     var item14 = parseFloat(apex.item(''P''+pageId+''_MENOS_RETENCIONES'').getValue()) ?? 0;',
'    ',
'    var TOTAL_SALDO_CARGO        = parseFloat(apex.item(''P''+pageId+''_TOTAL_SALDO_CARGO'').getValue()) ?? 0;   ',
'    var IMPUESTO_AVISOS_TABLEROS = parseFloat(apex.item(''P''+pageId+''_IMPUESTO_AVISOS_TABLEROS'').getValue()) ?? 0;',
'    var SOBRETASA_BOMBERIL       = parseFloat(apex.item(''P''+pageId+''_SOBRETASA_BOMBERIL'').getValue()) ?? 0;      ',
'    var SOBRETASA_SEGURIDAD      = parseFloat(apex.item(''P''+pageId+''_SOBRETASA_SEGURIDAD'').getValue()) ?? 0;     ',
'    var CLCLO_NETO_SANCION       = parseFloat(apex.item(''P''+pageId+''_CLCLO_NETO_SANCION'').getValue()) ?? 0;      ',
'    var ANTICIPO_ANIO_SIGUIENTE  = parseFloat(apex.item(''P''+pageId+''_ANTICIPO_ANIO_SIGUIENTE'').getValue()) ?? 0; ',
'    ',
'    var CLCLO_CNCPTO_INDSTRIA_CMRCIO  = (   item20 - item14    // - ANTICIPO_ANIO_SIGUIENTE  si se quiere descontar anticipo del total saldo a cargo',
'                                        );   ',
'    ',
'    if (CLCLO_CNCPTO_INDSTRIA_CMRCIO < 0) { //Condicion que valida el valor del concepto ICA y el saldo a favor del concepto ICA',
'        //SETEAR',
'         apex.item(''P''+pageId+''_CLCLO_CNCPTO_INDSTRIA_CMRCIO'').setValue(CLCLO_CNCPTO_INDSTRIA_CMRCIO || 0); ',
'         apex.item(''P''+pageId+''_SLDO_FVR_CNCPTO_INTRIA_CMRCIO'').setValue((1 - 2) * CLCLO_CNCPTO_INDSTRIA_CMRCIO || 0);',
'         apex.item(''P''+pageId+''_CONCEPTO_INDUSTRIA_COMERCIO'').setValue(0 || 0); ',
'    ',
'    }else{',
'         apex.item(''P''+pageId+''_CLCLO_CNCPTO_INDSTRIA_CMRCIO'').setValue(CLCLO_CNCPTO_INDSTRIA_CMRCIO || 0); ',
'         apex.item(''P''+pageId+''_CONCEPTO_INDUSTRIA_COMERCIO'').setValue( CLCLO_CNCPTO_INDSTRIA_CMRCIO|| 0);  //4778',
'         apex.item(''P''+pageId+''_SLDO_FVR_CNCPTO_INTRIA_CMRCIO'').setValue(0 || 0);',
'    }        ',
'    ',
'    CONCEPTO_AVISOS_TABLEROS();',
'    CNCPTO_SBRTSA_BMBRL();',
'    CNCPTO_SBRTSA_SGRDD();',
'    CNCPTO_ANTICIPO_ANIO_SIGUIENTE();',
'    CNCPTO_DIFERENCIA_CNCPTO_SNCION ();',
'    ',
'};',
'',
unistr('function calcularItem40(){  //40. TOTAL A PAGAR CON PAGO VOLUNTARIO (Rengl\00F3n 38 + 39)   '),
'     var item38 = parseFloat(apex.item(''P''+pageId+''_TOTAL_PAGAR'').getValue()) ?? 0 ;',
'     var item39 = parseFloat(apex.item(''P''+pageId+''_VALOR_PAGO_VOLUNTARIO'').getValue()) ?? 0; ',
'     var vlor_pgo_bnco = parseFloat(apex.item(''P''+pageId+''_VALOR_PAGAR_BANCOS'').getValue()) ?? 0; ',
'     var vlor_ttal_pgo_vlntrio = parseFloat(apex.item(''P''+pageId+''_TOTAL_PAGAR_PAGO_VOLUNTARIO'').getValue()) ?? 0; ',
'     var totalApagar = (item38 + item39);',
'    ',
'    if (totalApagar >= 0 ){    ',
'        if (vlor_ttal_pgo_vlntrio != totalApagar ){',
'			apex.item(''P''+pageId+''_TOTAL_PAGAR_PAGO_VOLUNTARIO'').setValue(totalApagar || 0); ',
'            apex.item(''P''+pageId+''_VALOR_PAGAR_BANCOS'').setValue(totalApagar ?? 0);     ',
'            apex.item(''P'' + pageId + ''_CALCULO_VALOR_PAGAR_BANCOS'')?.setValue(totalApagar ?? 0);   ',
'        }',
'    }else{',
'        apex.item(''P''+pageId+''_TOTAL_PAGAR_PAGO_VOLUNTARIO'').setValue(0 || 0); ',
'        apex.item(''P''+pageId+''_VALOR_PAGAR_BANCOS'').setValue(0 ?? 0);     ',
'        apex.item(''P'' + pageId + ''_CALCULO_VALOR_PAGAR_BANCOS'')?.setValue(0 ?? 0);',
'    }',
'   ',
'};',
'',
'function calcularItem11() {',
'    var CONCEPTO_SANCION = parseFloat(apex.item(''P''+pageId+''_VALOR_CONCEPTO_SANCION'').getValue()) ?? 0;',
'    var DESCUENTO_SANCION = parseFloat(apex.item(''P''+pageId+''_CLCLO_DESCUENTO_SANCION'').getValue()) ?? 0;',
'    var SANCION = CONCEPTO_SANCION - DESCUENTO_SANCION;',
'    apex.item(''P''+pageId+''_DESTINO_APORTE_VOLUNTARIO'').setValue(SANCION || 0);	',
'};',
'            ',
'function calcularItem13() {',
'    //var RETENCIONES = parseFloat(apex.item(''P''+pageId+''_TTL_IMPSTO_INDSTRIA_CMRCIO'').getValue()) ?? 0;',
'    var RETENCIONES = parseFloat(apex.item(''P''+pageId+''_VALOR_PAGO_INDUSTRIA_COMERCIO'').getValue()) ?? 0;',
'    apex.item(''P''+pageId+''_PGO_UNDDS_CMRCLS'').setValue(RETENCIONES || 0);	',
'};',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('var pageId = &APP_PAGE_ID.;  // Extrae el n\00FAmero de la pagina.'),
'deshabilitarItems();',
'calculoActividadesGravadas();',
'buildJsonActividades(); ',
'calculoItem24();',
'calculoTotalActividades();',
'calculoValorPago();',
'calcularItem38();',
'//calcularItem40();',
'//validarValorBanco();'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
,p_step_template=>wwv_flow_api.id(252164311814651356)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_last_updated_by=>'LARIZA'
,p_last_upd_yyyymmddhh24miss=>'20250722104623'
);
end;
/
begin
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(138475417164171512)
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
,p_ajax_items_to_submit=>'P311_ID_DCLRCION'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P311_ID_DCLRCION_VGNCIA_FRMLRIO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(14984385949248585)
,p_plug_name=>unistr('B. Discriminaci\00F3n de Actividades Gravadas')
,p_region_name=>'actividad'
,p_parent_plug_id=>wwv_flow_api.id(138475417164171512)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
,p_plug_display_sequence=>40
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
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(14984664074248587)
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
 p_id=>wwv_flow_api.id(14984745113248588)
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
 p_id=>wwv_flow_api.id(14984800068248589)
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
 p_id=>wwv_flow_api.id(14984931393248590)
,p_name=>'VLOR_IGRSOS_GRVDOS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_IGRSOS_GRVDOS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_heading=>'Ingresos Gravados'
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
 p_id=>wwv_flow_api.id(14985012461248591)
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
 p_id=>wwv_flow_api.id(14985151069248592)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Actividades Gravadas'
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
 p_id=>wwv_flow_api.id(14985183820248593)
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
 p_id=>wwv_flow_api.id(14984548151248586)
,p_internal_uid=>14984548151248586
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
 p_id=>wwv_flow_api.id(15239125975865240)
,p_interactive_grid_id=>wwv_flow_api.id(14984548151248586)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(15239218207865240)
,p_report_id=>wwv_flow_api.id(15239125975865240)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(15239752973865241)
,p_view_id=>wwv_flow_api.id(15239218207865240)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(14984664074248587)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(15240252506865243)
,p_view_id=>wwv_flow_api.id(15239218207865240)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(14984745113248588)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(15240775588865245)
,p_view_id=>wwv_flow_api.id(15239218207865240)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(14984800068248589)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(15241181382865246)
,p_view_id=>wwv_flow_api.id(15239218207865240)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(14984931393248590)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>160
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(15241733173865248)
,p_view_id=>wwv_flow_api.id(15239218207865240)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(14985012461248591)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(15242223424865250)
,p_view_id=>wwv_flow_api.id(15239218207865240)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(14985151069248592)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>539
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(15242703888865251)
,p_view_id=>wwv_flow_api.id(15239218207865240)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(14985183820248593)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(14984367842248584)
,p_plug_name=>'.'
,p_parent_plug_id=>wwv_flow_api.id(14984385949248585)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252169105903651390)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(15364480003547445)
,p_plug_name=>'Actividad_Economica'
,p_region_name=>'gestionActividadEconomica'
,p_parent_plug_id=>wwv_flow_api.id(14984385949248585)
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
 p_id=>wwv_flow_api.id(138585164905178645)
,p_plug_name=>'Opciones de Uso'
,p_parent_plug_id=>wwv_flow_api.id(138475417164171512)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P311_ID_DCLRCION_VGNCIA_FRMLRIO is not null and :P311_IDNTFCCION is not null and :P311_MSTRAR_FRMLRIO = ''S'''
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(138585233778178646)
,p_plug_name=>'Datos Generales'
,p_parent_plug_id=>wwv_flow_api.id(138475417164171512)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P311_ID_DCLRCION_VGNCIA_FRMLRIO is not null and :P311_IDNTFCCION is not null and :P311_MSTRAR_FRMLRIO = ''S'''
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(138585297200178647)
,p_plug_name=>'C. Base Gravable de ICA'
,p_parent_plug_id=>wwv_flow_api.id(138475417164171512)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(138585576700178649)
,p_plug_name=>'Retencion A Titulos De Impuesto De Industria Y Comercio'
,p_parent_plug_id=>wwv_flow_api.id(138475417164171512)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P311_ID_DCLRCION_VGNCIA_FRMLRIO is not null and :P311_IDNTFCCION is not null and :P311_MSTRAR_FRMLRIO = ''S'''
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(138585621601178650)
,p_plug_name=>'Pago'
,p_parent_plug_id=>wwv_flow_api.id(138475417164171512)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
,p_plug_display_sequence=>70
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P311_ID_DCLRCION_VGNCIA_FRMLRIO is not null and :P311_IDNTFCCION is not null and :P311_MSTRAR_FRMLRIO = ''S'''
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(138585702026178651)
,p_plug_name=>'Firmas'
,p_parent_plug_id=>wwv_flow_api.id(138475417164171512)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
,p_plug_display_sequence=>80
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P311_ID_DCLRCION_VGNCIA_FRMLRIO is not null and :P311_IDNTFCCION is not null and :P311_MSTRAR_FRMLRIO = ''S'''
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(14604922053557094)
,p_plug_name=>'Firma del declarante'
,p_parent_plug_id=>wwv_flow_api.id(138585702026178651)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(15708342195738345)
,p_plug_name=>'Firma del  contador o revisor fiscal'
,p_parent_plug_id=>wwv_flow_api.id(138585702026178651)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(138586172061178655)
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
 p_id=>wwv_flow_api.id(322561912165742918)
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
,p_plug_display_when_condition=>':P311_ID_DCLRCION_VGNCIA_FRMLRIO is not null and :P311_ID_SJTO_IMPSTO is null'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8884648886100729)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(138586172061178655)
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
 p_id=>wwv_flow_api.id(8885016264100729)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(138586172061178655)
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
 p_id=>wwv_flow_api.id(8830378090100688)
,p_button_sequence=>650
,p_button_plug_id=>wwv_flow_api.id(14984367842248584)
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
 p_id=>wwv_flow_api.id(8830781750100688)
,p_button_sequence=>660
,p_button_plug_id=>wwv_flow_api.id(14984367842248584)
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
 p_id=>wwv_flow_api.id(8886517238100730)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(322561912165742918)
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
 p_id=>wwv_flow_api.id(8888877864100732)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(14984385949248585)
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
 p_id=>wwv_flow_api.id(8829604800100687)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(14984385949248585)
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
 p_id=>wwv_flow_api.id(8885409938100729)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(138475417164171512)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Registrar Declaraci\00F3n')
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_execute_validations=>'N'
,p_button_condition=>'P311_ID_SJTO_IMPSTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8884258564100728)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(138475417164171512)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'f?p=&APP_ID.:311:&SESSION.::&DEBUG.:::'
,p_button_condition=>'P311_ID_SJTO_IMPSTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8888062281100731)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(15364480003547445)
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
 p_id=>wwv_flow_api.id(8888478738100732)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(15364480003547445)
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
 p_id=>wwv_flow_api.id(6881586445115325)
,p_button_sequence=>670
,p_button_plug_id=>wwv_flow_api.id(138475417164171512)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:&P311_BRANCH.:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(8993626259100796)
,p_branch_name=>'Go To Page 3'
,p_branch_action=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,1:P3_ID_DCLRCION:&P311_ID_DCLRCION_V2.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(8885409938100729)
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5853807577379013)
,p_name=>'P311_ETIQUETA_SECUNDARIA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(15708342195738345)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(5854642941379021)
,p_name=>'P311_ETIQUETA_PRINCIPAL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(14604922053557094)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(5866682108781014)
,p_name=>'P311_TARJETA_PROFESIONAL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(15708342195738345)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(5866746655781015)
,p_name=>'P311_INTERESES_MORA_PGO_ANTERIOR'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'MOSTRAR_FORMULARIO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6537660594740314)
,p_name=>'P311_INDICADOR_EXTEMPORANEO'
,p_item_sequence=>1470
,p_item_plug_id=>wwv_flow_api.id(138585164905178645)
,p_prompt=>'INDICADOR EXTEMPORANEO'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>':P312_ID_DCLRCION_VGNCIA_FRMLRIO IS NOT NULL AND :P312_IDNTFCCION IS NOT NULL'
,p_display_when_type=>'SQL_EXPRESSION'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_item_comment=>'INDICADOR EXTEMPORANEO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6918144716077145)
,p_name=>'P311_ITEM_CERO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>780
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8810092934100659)
,p_name=>'P311_TIPO_DECLARACION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'TIPO DECLARACION '
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8810497930100661)
,p_name=>'P311_ID_DCLRCION'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8810880659100661)
,p_name=>'P311_ID_DCLRCION_V2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8811186124100662)
,p_name=>'P311_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_prompt=>unistr('Tipo Declaraci\00F3n ')
,p_source=>'ID_DCLRCION_VGNCIA_FRMLRIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      b.dscrpcion,',
'            a.id_dclrcion_vgncia_frmlrio',
'from        gi_d_dclrcnes_vgncias_frmlr a',
'inner join  gi_d_formularios            b   on  b.id_frmlrio            =   a.id_frmlrio',
'where       a.id_dclrcion_vgncia_frmlrio    =   :P311_ID_DCLRCION_VGNCIA_FRMLRIO;'))
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
 p_id=>wwv_flow_api.id(8811522418100663)
,p_name=>'P311_VGNCIA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
,p_lov_cascade_parent_items=>'P311_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_ajax_items_to_submit=>'P311_VGNCIA'
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
 p_id=>wwv_flow_api.id(8811916307100663)
,p_name=>'P311_ID_PRDO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
,p_lov_cascade_parent_items=>'P311_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_ajax_items_to_submit=>'P311_ID_PRDO'
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
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8812388842100663)
,p_name=>'P311_JSON_ITEM'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_prompt=>'P311_JSON_ITEM'
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
 p_id=>wwv_flow_api.id(8812726015100663)
,p_name=>'P311_JSON_VALORES'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_prompt=>'P311_JSON_VALORES'
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
 p_id=>wwv_flow_api.id(8813184770100664)
,p_name=>'P311_ID_SJTO_IMPSTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_source=>'ID_SJTO_IMPSTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'ID_SUJETO_IMPUESTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8813518189100664)
,p_name=>'P311_MSTRAR_FRMLRIO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'MOSTRAR_FORMULARIO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8813990988100664)
,p_name=>'P311_BRANCH'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'BRANCH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8814364964100664)
,p_name=>'P311_CDGO_CLNTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'CODIGO_CLIENTE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8814771841100665)
,p_name=>'P311_ID_IMPSTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_source=>'ID_IMPSTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_IMPUESTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8815180930100665)
,p_name=>'P311_ID_IMPSTO_SBMPSTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_source=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_SUBIMPUESTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8815535089100665)
,p_name=>'P311_NMRO_CNSCTVO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_source=>'NMRO_CNSCTVO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'NUMERO_CONSECUTIVO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8815990688100665)
,p_name=>'P311_CDGO_DCLRCION_ESTDO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_source=>'CDGO_DCLRCION_ESTDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'CODIGO_DECLARACION_ESTADO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8816305643100666)
,p_name=>'P311_ID_DCLRCION_USO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_source=>'ID_DCLRCION_USO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_DECLARACION_USO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8816745631100666)
,p_name=>'P311_ID_DCLRCION_CRRCCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_source=>'ID_DCLRCION_CRRCCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_DECLARACION_CORRECCION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8817142273100666)
,p_name=>'P311_ID_USRIO_RGSTRO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_source=>'ID_USRIO_RGSTRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_USUARIO_REGISTRO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8817543306100666)
,p_name=>'P311_FCHA_RGSTRO'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_source=>'FCHA_RGSTRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'FEHCA_REGISTRO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8817930017100667)
,p_name=>'P311_ID_USRIO_ULTIMA_MDFCCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_source=>'ID_USRIO_ULTIMA_MDFCCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_USUARIO_ULTIMA_MODIFICACION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8818372984100668)
,p_name=>'P311_FCHA_ULTMA_MDFCCION'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_source=>'FCHA_ULTMA_MDFCCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'FECHA_ULTIMA_MODIFICACION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8818702344100668)
,p_name=>'P311_FCHA_PRSNTCION'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_source=>'FCHA_PRSNTCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'FECHA_PRESENTACION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8819111187100668)
,p_name=>'P311_ID_USRIO_APLCCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_source=>'ID_USRIO_APLCCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_USUARIO_APLICION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8819523434100668)
,p_name=>'P311_FCHA_APLCCION'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_source=>'FCHA_APLCCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'FECHA_APLICACION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8819928942100669)
,p_name=>'P311_BSE_GRVBLE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_source=>'BSE_GRVBLE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'BASE_GRAVABLE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8820393255100669)
,p_name=>'P311_VLOR_TTAL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_source=>'VLOR_TTAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'VALOR_TOTAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8820760787100669)
,p_name=>'P311_VLOR_PAGO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_source=>'VLOR_PAGO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'VALOR_PAGO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8821143035100669)
,p_name=>'P311_ID_RCDO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_source=>'ID_RCDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_RECAUDO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8821584170100670)
,p_name=>'P311_ID_LQDCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_source=>'ID_LQDCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_LIQUIDACION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8821957893100670)
,p_name=>'P311_ID_USRIO_ANLCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_source=>'ID_USRIO_ANLCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_USUARIO_ANULACION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8822339689100670)
,p_name=>'P311_FCHA_ANLCION'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_source=>'FCHA_ANLCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'FECHA_ANULACION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8822754731100670)
,p_name=>'P311_FCHA_PRSNTCION_PRYCTDA'
,p_source_data_type=>'DATE'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_source=>'FCHA_PRSNTCION_PRYCTDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'FECHA_PRESENTACION_PROYECTADA '
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8823161585100671)
,p_name=>'P311_ID_DCMNTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_source=>'ID_DCMNTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_DOCUMENTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8823555254100671)
,p_name=>'P311_ID_CNDDTO_VGNCIA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_source=>'ID_CNDDTO_VGNCIA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ID_CANDIDATO_VIGENCIA'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8823954866100671)
,p_name=>'P311_INDCDOR_MGRDO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_source=>'INDCDOR_MGRDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'INDICADOR_MIGRADO '
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8824367734100671)
,p_name=>'P311_CDGO_ORGN_TPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_source=>'CDGO_ORGN_TPO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'CODIGO_ORIGEN_TIPO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8824758544100671)
,p_name=>'P311_NMBRE_RSPNS_FRMA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8831141073100689)
,p_name=>'P311_TOTAL_INGRESOS_GRAVADS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(14984367842248584)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>'PAGOS O ABONOS EN CUENTAS'
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
 p_id=>wwv_flow_api.id(8831538770100689)
,p_name=>'P311_TOTAL_IMPUESTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(14984367842248584)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8831912544100690)
,p_name=>'P311_GENERACION_ENERGIA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(14984367842248584)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8832347657100690)
,p_name=>'P311_IMPUESTO_LEY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(14984367842248584)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8832724681100691)
,p_name=>'P311_JSON_ACTVDDES'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(14984367842248584)
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
 p_id=>wwv_flow_api.id(8833177083100691)
,p_name=>'P311_ACTIVIDADES_GRAVADAS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(14984367842248584)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_DCLRCNS_ESQMA_TRFA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'ACTIVIDADES GRAVADAS '
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8833579683100691)
,p_name=>'P311_IMPUESTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(14984367842248584)
,p_use_cache_before_default=>'NO'
,p_source=>'VLOR_IPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>'IMPUESTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8834275337100692)
,p_name=>'P311_CLASIFICACION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(138585164905178645)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
'             where       b.id_dclrcion_vgncia_frmlrio  =   :P311_ID_DCLRCION_VGNCIA_FRMLRIO',
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
 p_id=>wwv_flow_api.id(8834601633100693)
,p_name=>'P311_OPCION_DE_USO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(138585164905178645)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8835027717100693)
,p_name=>'P311_FCHA_MAXIMA_PRSNTCION'
,p_source_data_type=>'DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(138585164905178645)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'FECHA LIMITE DE PAGO'
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
,p_attribute_03=>'&P311_CLCLA_FCHA_PRSNTCION_FINAL.'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_item_comment=>'FECHA LIMITE DE PAGO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8835450139100693)
,p_name=>'P311_ITEMS_FECHA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(138585164905178645)
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
 p_id=>wwv_flow_api.id(8835896246100693)
,p_name=>'P311_CLCLO_DCLRCION_CRRCCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(138585164905178645)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_prompt=>unistr('C\00C1LCULO DECLARACI\00D3N DE CORRECCI\00D3N')
,p_source=>'CLCLO_DCLRCION_CRRCCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_colspan=>4
,p_grid_column=>1
,p_display_when=>':P311_ID_DCLRCION_VGNCIA_FRMLRIO IS NOT NULL AND :P311_IDNTFCCION IS NOT NULL'
,p_display_when_type=>'SQL_EXPRESSION'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
,p_item_comment=>unistr('C\00C1LCULO DECLARACI\00D3N DE CORRECCI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8836248431100694)
,p_name=>'P311_NMRO_DCLRCION_ANTRIOR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(138585164905178645)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
,p_item_comment=>unistr('N\00DAMERO DE DECLARACI\00D3N ANTERIOR')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8836668326100695)
,p_name=>'P311_CLCLA_FCHA_PRSNTCION_FINAL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(138585164905178645)
,p_prompt=>unistr('CALCULA FECHA PRESENTACI\00D3N FINAL')
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char( pkg_gi_declaraciones_funciones.fnc_co_fcha_mxma_prsntcion( p_id_dclrcion_vgncia_frmlrio =>  :P311_ID_DCLRCION_VGNCIA_FRMLRIO,',
'                                                                          p_idntfccion => :P311_IDNTFCCION , ',
'                                                                          p_id_sjto_tpo => :P311_ID_SJTO_IMPSTO ),',
'                                                                          ''dd/mm/yyyy'' ) as fecha from dual'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>9
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_item_comment=>unistr('CALCULA FECHA PRESENTACI\00D3N FINAL')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8837385849100696)
,p_name=>'P311_NMBRES_RZN_SCIAL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_api.id(138585233778178646)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_prompt=>'4. ESTABLECIMIENTO'
,p_source=>'NMBRES_RZN_SCIAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_item_comment=>'4. ESTABLECIMIENTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8837793565100696)
,p_name=>'P311_TPO_IDENTIFICACION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_api.id(138585233778178646)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_prompt=>unistr('3.TIPO DE IDENTIFICACI\00D3N')
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
,p_colspan=>4
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>unistr('3.TIPO DE IDENTIFICACI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8838172749100696)
,p_name=>'P311_IDENTIFICACION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_api.id(138585233778178646)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_prompt=>unistr('IDENTIFICACI\00D3N')
,p_source=>'IDNTFCCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_item_comment=>unistr('IDENTIFICACI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8838519799100697)
,p_name=>'P311_IDENTIFICACION_ANTERIOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_api.id(138585233778178646)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_source=>'IDNTFCCION_ANT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>unistr('IDENTIFICACI\00D3N ANTERIOR')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8838984283100697)
,p_name=>'P311_DIGITO_VERIFICACION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_api.id(138585233778178646)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8839314760100697)
,p_name=>'P311_DRCCION_NTFCCION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_api.id(138585233778178646)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_prompt=>unistr('5.DIRECCI\00D3N DEL RETENEDOR')
,p_source=>'DRCCION_NTFCCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
,p_item_comment=>unistr('5.DIRECCI\00D3N DEL RETENEDOR')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8839728128100697)
,p_name=>'P311_DEPARTAMENTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_api.id(138585233778178646)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8840105508100698)
,p_name=>'P311_MUNICIPIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_api.id(138585233778178646)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8840589278100698)
,p_name=>'P311_TELEFONO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_api.id(138585233778178646)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_prompt=>unistr('6.TEL\00C9FONO')
,p_source=>'TLFNO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_tag_attributes=>'onkeypress="return  validarExpresion(event, ''numeroEntero'')" '
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
,p_item_comment=>unistr('6.TEL\00C9FONO')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8840933256100698)
,p_name=>'P311_CORREO_ELECTRONICO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_api.id(138585233778178646)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_prompt=>unistr('CORREO <br />ELECTR\00D3NICO')
,p_source=>'CRREO_ELCTRNCO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'EMAIL'
,p_attribute_05=>'NONE'
,p_item_comment=>unistr('CORREO ELECTR\00D3NICO')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8841329930100698)
,p_name=>'P311_NMRO_ESTBLCMIENTS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_api.id(138585233778178646)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8841792725100699)
,p_name=>'P311_AVISOS_TABLEROS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_api.id(138585233778178646)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8842193848100699)
,p_name=>'P311_CNSRCIO_UNION_TMPRL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_api.id(138585233778178646)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8842513599100699)
,p_name=>'P311_RLZA_ACTDS_PNIO_AUTNMO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_api.id(138585233778178646)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8842926935100699)
,p_name=>'P311_CNCLCION_ESTBLCMIENTO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_api.id(138585233778178646)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8843627448100700)
,p_name=>'P311_TTL_INGRS_ORIOS_EXTRS_PAIS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_api.id(138585297200178647)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>'11. TOTAL INGRESOS BRUTOS ORDINARIOS Y EXTRAORDINARIOS <br /> DEL PERIODO EN TODO EL PAIS'
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
,p_item_comment=>'11. TOTAL INGRESOS BRUTOS ORDINARIOS Y EXTRAORDINARIOS DEL PERIODO EN TODO EL PAIS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8844042354100700)
,p_name=>'P311_MNS_INGRSS_FUERA_MNCPIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_api.id(138585297200178647)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>'12. MENOS  INGRESOS OBTENIDOS FUERA DE ESTE DISTRITO'
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
 p_id=>wwv_flow_api.id(8844494060100701)
,p_name=>'P311_TTL_INGRS_ORIOS_EXTRS_MNCPIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_api.id(138585297200178647)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8844862929100701)
,p_name=>'P311_MNS_INGRSOS_DEV_REB_DES'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_api.id(138585297200178647)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>'13. TOTAL INGRESOS DENTRO DEL DISTRITO BASE DE AUTORETENCION'
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
,p_item_comment=>'11. MENOS INGRESOS POR DEVOLUCIONES, REBAJAS, DESCUENTOS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8845210719100701)
,p_name=>'P311_MNS_INGRSOS_EXPRTCIONS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_api.id(138585297200178647)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8845646460100701)
,p_name=>'P311_MNS_INGRSOS_VNTA_ACT_FIJS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_api.id(138585297200178647)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8846025932100702)
,p_name=>'P311_MNS_INGRSOS_ACTVDDS_EXCLDS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_api.id(138585297200178647)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8846481314100702)
,p_name=>'P311_MNS_INGRSOS_ACTVDDS_EXENTAS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>600
,p_item_plug_id=>wwv_flow_api.id(138585297200178647)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>'16. TOTAL INGRESOS NETOS GRAVABLES BASE DE AUTORETENCION'
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
,p_item_comment=>'16. TOTAL INGRESOS NETOS GRAVABLES BASE DE AUTORETENCION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8846882787100702)
,p_name=>'P311_TOTAL_INGRESOS_GRVBLES'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>610
,p_item_plug_id=>wwv_flow_api.id(138585297200178647)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_prompt=>'17. AUTORRETENCIONES DEL IMPUESTO DE INDUSTRIA Y COMERCIO'
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
,p_item_comment=>'17. AUTORRETENCIONES DEL IMPUESTO DE INDUSTRIA Y COMERCIO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8847562388100703)
,p_name=>'P311_TTL_IMPSTO_INDSTRIA_CMRCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>'8. RETENCION DE INDUSTRIA Y COMERCIO'
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
,p_item_comment=>'8.RETENCION DE INDUSTRIA Y COMERCIO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8847916998100704)
,p_name=>'P311_CLCLO_CNCPTO_INDSTRIA_CMRCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8848352755100704)
,p_name=>'P311_CONCEPTO_INDUSTRIA_COMERCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8848747719100704)
,p_name=>'P311_SLDO_FVR_CNCPTO_INTRIA_CMRCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8849141528100704)
,p_name=>'P311_CLCLO_CNCPTO_ANT_INTRIA_CRCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8849538549100705)
,p_name=>'P311_CLCLO_DFCIA_PGO_INTRIA_CMRCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8849975840100705)
,p_name=>'P311_VALOR_PAGO_INDUSTRIA_COMERCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8850342786100705)
,p_name=>'P311_CALCULO_DSCNTO_INTRIA_CMRCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8850718770100705)
,p_name=>'P311_CALCULO_INTRSS_INTRIA_CMRCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8851120038100706)
,p_name=>'P311_CLCLO_DSCNTO_INT_INTRIA_CRCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8851596403100706)
,p_name=>'P311_CLCLO_SLDO_FVR_PGO_INTRIA_CCIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8851956976100706)
,p_name=>'P311_IMPUESTO_AVISOS_TABLEROS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>'17. AUTORRETENCIONES DEL IMPUESTO DE INDUSTRIA Y COMERCIO'
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
,p_item_comment=>unistr('21. IMPUESTO DE AVISOS Y TABLEROS (15% de rengl\00F3n 20)')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8852374950100706)
,p_name=>'P311_SALDO_FAVOR_AVISOS_TABLEROS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8852723456100707)
,p_name=>'P311_CONCEPTO_AVISOS_TABLEROS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8853193015100707)
,p_name=>'P311_DIFERENCIA_AVISOS_TABLEROS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8853549890100707)
,p_name=>'P311_CLCLO_ANTERIOR_AVISOS_TBLRS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8853900434100707)
,p_name=>'P311_CLCLO_DFCIA_PGO_AVSS_TBLRS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8854301873100708)
,p_name=>'P311_VLR_PAGO_AVISOS_TABLEROS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8854745901100708)
,p_name=>'P311_CLCLO_DSCNTO_AVSS_TBLRS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8855132221100708)
,p_name=>'P311_CLCLO_INTRSS_AVSS_TBLRS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8855554428100709)
,p_name=>'P311_CLCLO_DSCNTO_INT_AVSS_TBS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>'DESCUENTO INTERESES IMPUESTO DE AVISOS Y TABLEROS'
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
 p_id=>wwv_flow_api.id(8855901526100709)
,p_name=>'P311_CLCLO_SLDO_FVR_PGO_AVSS_TBS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8856377660100709)
,p_name=>'P311_PGO_UNDDS_CMRCLS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1400
,p_item_plug_id=>wwv_flow_api.id(138585621601178650)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>'13. VALOR PAGO DE RETENCIONES'
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
,p_item_comment=>'13. VALOR PAGO DE RETENCIONES'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8856729610100709)
,p_name=>'P311_SOBRETASA_BOMBERIL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>'23. SOBRETASA BOMBERIL'
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
,p_item_comment=>'23. SOBRETASA BOMBERIL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8857147810100710)
,p_name=>'P311_SLDO_FVR_CNPTO_SBTSA_BMRL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8857564906100710)
,p_name=>'P311_DFRNCIA_CNCPTO_SBTSA_BMRL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8857998053100710)
,p_name=>'P311_CNCPTO_SBRTSA_BMBRL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8858372095100711)
,p_name=>'P311_CLCLO_CNCPTO_ANT_STSA_BMRL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8858708326100711)
,p_name=>'P311_CLCLO_DIF_PGO_STSA_BMRL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8859124973100711)
,p_name=>'P311_CLCLO_VLR_PGO_STSA_BMRL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8859597089100712)
,p_name=>'P311_CLCLO_DSCNTO_STSA_BMRL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8859977433100712)
,p_name=>'P311_CLCLO_INTRSES_STSA_BMRL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8860337077100712)
,p_name=>'P311_CLCLO_DSCNTO_INT_STSA_BMRL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8860702909100712)
,p_name=>'P311_CLCLO_SLDO_FVR_PGO_STSA_BMRL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8861142128100713)
,p_name=>'P311_SOBRETASA_SEGURIDAD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8861549220100713)
,p_name=>'P311_CNCPTO_SBRTSA_SGRDD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8861912111100713)
,p_name=>'P311_DFRNCIA_CNCPTO_STSA_SGRD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8862377619100714)
,p_name=>'P311_SLDO_FVR_CNCPTO_STSA_SGRD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8862722615100714)
,p_name=>'P311_CLCLO_CNCPTO_ANT_STSA_SGRD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8863122830100714)
,p_name=>'P311_CLCLO_DIF_PGO_STSA_SGRD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8863575307100714)
,p_name=>'P311_CALCULO_PGO_STSA_SGRD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8863971008100715)
,p_name=>'P311_CLCLO_DSCNTO_STSA_SGRD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8864336591100715)
,p_name=>'P311_CLCLO_INTRSES_STSA_SGRD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>'INTERESES SOBRETASA DE SEGURIDAD'
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
 p_id=>wwv_flow_api.id(8864705376100715)
,p_name=>'P311_CLCLO_DSCNTO_INT_STSA_SGRD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>'DESCUENTO INTERESES SOBRETASA DE SEGURIDAD'
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
 p_id=>wwv_flow_api.id(8865106312100715)
,p_name=>'P311_CLCLO_SLDO_FVR_PGO_STSA_SGRD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8865590834100716)
,p_name=>'P311_TOTAL_IMPUESTO_CARGO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
,p_item_comment=>unistr('25. TOTAL IMPUESTO A CARGO (RENGL\00D3N 20+21+22+23+24)')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8865934007100716)
,p_name=>'P311_MENS_VLR_EXNCN_EXNRCN_IMPSTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>'25. MENOS RETENCIONES PRACTICADAS EN EXCESO O INDEBIDAS O POR OPERACIONES ANULADAS, RESCINDIDAS O RESUELTAS'
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
,p_item_comment=>'25. MENOS RETENCIONES PRACTICADAS EN EXCESO O INDEBIDAS O POR OPERACIONES ANULADAS, RESCINDIDAS O RESUELTAS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8866389226100716)
,p_name=>'P311_MENOS_RETENCIONES'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1420
,p_item_plug_id=>wwv_flow_api.id(138585621601178650)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>unistr('14. MENOS RETENCIONES PR\00C1CTICAS EN EXCESO O INDEBIDAS')
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
,p_item_comment=>unistr('14. MENOS RETENCIONES PR\00C1CTICAS EN EXCESO O INDEBIDAS')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8866766589100716)
,p_name=>'P311_MENOS_AUTORRETENCIONES'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>'28. MENOS AUTORRETENCIONES PRACTICADAS A FAVOR DE ESTE MUNICIPIO O DISTRITO EN ESTE PERIODO'
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
,p_item_comment=>'28. MENOS AUTORRETENCIONES PRACTICADAS A FAVOR DE ESTE MUNICIPIO O DISTRITO EN ESTE PERIODO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8867180424100717)
,p_name=>'P311_MENS_ANTCPO_LIQDDO_ANIO_ANTR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
,p_item_comment=>unistr('29. MENOS ANTICIPO LIQUIDADO EN EL A\00D1O ANTERIOR')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8867507360100717)
,p_name=>'P311_ANTICIPO_ANIO_SIGUIENTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8867936527100717)
,p_name=>'P311_SLDO_FVR_CNCPTO_ANTCPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'SALDO A FAVOR CONCEPTO ANTICIPO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8868332650100717)
,p_name=>'P311_DFRNCIA_CNCPTO_ANTCPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
'    //emptyInputBehavior: "zero",',
'    overrideMinMaxLimits: "floor",',
'',
'    //minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'DIFERENCIA CONCEPTO ANTICIPO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8868726522100717)
,p_name=>'P311_VALOR_CONCEPTO_ANTICIPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8869147953100718)
,p_name=>'P311_CALCULO_INTERES_ANTICIPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8869552256100718)
,p_name=>'P311_TIPO_SANCION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>620
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
'                 when :P311_OPCION_DE_USO = ''DCO'' and a.cdgo_sncion_tpo <> ''EXT'' then 1',
'                 when :P311_OPCION_DE_USO = ''DIN'' and a.cdgo_sncion_tpo <> ''COR'' then 1',
'                else 0',
'            end',
'and a.cdgo_sncion_tpo IN (''EXT'',''COR'')',
'order by a.dscrpcion'))
,p_lov_cascade_parent_items=>'P311_OPCION_DE_USO,P311_INDICADOR_EXTEMPORANEO'
,p_ajax_items_to_submit=>'P311_TIPO_SANCION,P311_TIPO_CALCULO_SANCION'
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
 p_id=>wwv_flow_api.id(8869917096100718)
,p_name=>'P311_TIPO_CALCULO_SANCION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>630
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
'where   a.tipo              = :P311_TIPO_SANCION',
'--and     value = ''S''',
'and     :P311_TIPO_SANCION  is not null'))
,p_lov_cascade_parent_items=>'P311_TIPO_SANCION'
,p_ajax_items_to_submit=>'P311_TIPO_CALCULO_SANCION'
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
 p_id=>wwv_flow_api.id(8870380969100718)
,p_name=>'P311_SANCION_MANUAL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>640
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>'9. SANCIONES'
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
,p_item_comment=>'9. SANCIONES'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8870783998100719)
,p_name=>'P311_SANCION_SUGERIDA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>650
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>'9. SANCIONES (SUGERIDA)'
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
,p_item_comment=>'9. SANCIONES (SUGERIDA)'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8871185994100719)
,p_name=>'P311_CLCLO_IMPSTO_CRGO_SNCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>660
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8871588673100719)
,p_name=>'P311_CLCLO_NETO_SANCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>670
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8871907051100719)
,p_name=>'P311_SANCION_SELECCIONADA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>680
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8872366272100720)
,p_name=>'P311_DIFERENCIA_CNCPTO_SNCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>690
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
'    //minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('DIFERENCIA CONCEPTO SANCI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8872739980100720)
,p_name=>'P311_CALCULO_DFRNCIA_PGO_SNCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>700
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8873151886100720)
,p_name=>'P311_VALOR_CONCEPTO_SANCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>710
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('Calculo pago IMPUESTO SANCI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8873503777100720)
,p_name=>'P311_CLCLO_DESCUENTO_SANCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>720
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>unistr('DESCUENTO SANCI\00D3N')
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
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8873929587100721)
,p_name=>'P311_CLCLO_SLDO_FVR_PGO_SNCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>730
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8874310695100721)
,p_name=>'P311_MENOS_SLDO_FVR_PRDO_ANTRIOR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>740
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8874754135100721)
,p_name=>'P311_CALCULO_TOTAL_SALDO_CARGO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>750
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>unistr('27. CALCULO TOTAL SALDO A CARGO (RENGL\00D3N 24-25+26)')
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
,p_item_comment=>unistr('27. CALCULO TOTAL SALDO A CARGO (RENGL\00D3N 24-25+26)')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8875187883100721)
,p_name=>'P311_TOTAL_SALDO_CARGO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>760
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>'10. TOTAL A PAGAR'
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
,p_item_comment=>'10. TOTAL A PAGAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8875593975100722)
,p_name=>'P311_TOTAL_SALDO_FAVOR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>770
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8876255091100722)
,p_name=>'P311_VALOR_PAGAR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1360
,p_item_plug_id=>wwv_flow_api.id(138585621601178650)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>unistr('29. VALOR A PAGAR POR RETENCIONES Y AUTORETENCIONES (Rengl\00F3n 28)')
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
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('29. VALOR A PAGAR POR RETENCIONES Y AUTORETENCIONES (Rengl\00F3n 28)')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8876692085100722)
,p_name=>'P311_DESCUENTO_PRONTO_PAGO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1410
,p_item_plug_id=>wwv_flow_api.id(138585621601178650)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>'DESCUENTO PRONTO PAGO'
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
'    //minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>'DESCUENTO PRONTO PAGO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8877023352100723)
,p_name=>'P311_INTERESES_MORA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1390
,p_item_plug_id=>wwv_flow_api.id(138585621601178650)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>'12. VALOR PAGO INTERESES DE MORA (CON DESCUENTO SI APLICA)'
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
,p_item_comment=>'12. VALOR PAGO INTERESES DE MORA (CON DESCUENTO SI APLICA)'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8877419581100723)
,p_name=>'P311_TOTAL_PAGAR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1430
,p_item_plug_id=>wwv_flow_api.id(138585621601178650)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>'15. PAGO TOTAL'
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
,p_item_comment=>'PAGO TOTAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8877871605100723)
,p_name=>'P311_APORTE_VOLUNTARIO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1440
,p_item_plug_id=>wwv_flow_api.id(138585621601178650)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8878234833100723)
,p_name=>'P311_VALOR_PAGO_VOLUNTARIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1450
,p_item_plug_id=>wwv_flow_api.id(138585621601178650)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8878643989100724)
,p_name=>'P311_DESTINO_APORTE_VOLUNTARIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1380
,p_item_plug_id=>wwv_flow_api.id(138585621601178650)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>'11. VALOR PAGOS SANCIONES'
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
,p_item_comment=>'11. VALOR PAGOS SANCIONES'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8879080231100724)
,p_name=>'P311_TOTAL_PAGAR_PAGO_VOLUNTARIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1460
,p_item_plug_id=>wwv_flow_api.id(138585621601178650)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
'    minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('40. TOTAL A PAGAR CON PAGO VOLUNTARIO (Rengl\00F3n 38 + 39)')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8879469826100724)
,p_name=>'P311_VALOR_PAGAR_BANCOS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1470
,p_item_plug_id=>wwv_flow_api.id(138585621601178650)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8879807596100724)
,p_name=>'P311_CALCULO_VALOR_PAGAR_BANCOS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1480
,p_item_plug_id=>wwv_flow_api.id(138585621601178650)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8880818888100725)
,p_name=>'P311_NOMBRES_DECLARANTE_REVISOR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(15708342195738345)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_prompt=>'NOMBRES Y APELLIDOS CONTADOR O REVISOR FISCAL'
,p_source=>'ID_SJTO_RSPNSBLE_FR_RVS_CNTDOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  trim(a.prmer_nmbre) || '' '' ||trim(a.sgndo_nmbre) ||'' '' || trim(a.prmer_aplldo) ||'' ''|| trim(a.sgndo_aplldo)  text,',
'a.id_sjto_rspnsble value',
'from si_i_sujetos_responsable a',
'where a.id_sjto_impsto = :P311_ID_SJTO_IMPSTO',
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
 p_id=>wwv_flow_api.id(8881229647100726)
,p_name=>'P311_TPO_IDENTIFICACION_REVISOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(15708342195738345)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_idntfccion_tpo ',
'from df_s_identificaciones_tipo',
'where cdgo_idntfccion_tpo IN( select b.cdgo_idntfccion_tpo ',
'                              from si_i_sujetos_responsable b ',
'                              where b.id_sjto_rspnsble  = :P311_NOMBRES_DECLARANTE_REVISOR) ',
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
 p_id=>wwv_flow_api.id(8881646729100726)
,p_name=>'P311_IDENTIFICACION_REVISOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(15708342195738345)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8882055187100727)
,p_name=>'P311_REVISADO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(15708342195738345)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_idntfccion_tpo ',
'from df_s_identificaciones_tipo',
'where cdgo_idntfccion_tpo IN( select b.cdgo_idntfccion_tpo ',
'                              from si_i_sujetos_responsable b ',
'                              where b.id_sjto_rspnsble  = :P311_NOMBRES_DECLARANTE_REVISOR) ',
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
 p_id=>wwv_flow_api.id(8882743559100727)
,p_name=>'P311_NOMBRES_DECLARANTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(14604922053557094)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_prompt=>'NOMBRES Y APELLIDOS DEL DECLARANTE'
,p_source=>'ID_SJTO_RSPNSBLE_FRMA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.prmer_nmbre || '' '' || a.prmer_aplldo || '' '' || a.sgndo_aplldo text,',
'         a.id_sjto_rspnsble value',
'    from si_i_sujetos_responsable a',
'   where a.id_sjto_impsto = :P311_ID_SJTO_IMPSTO',
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
 p_id=>wwv_flow_api.id(8883150801100728)
,p_name=>'P311_TPO_IDNTFCCION_DCLRNTE_FRMA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(14604922053557094)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_idntfccion_tpo ',
'from df_s_identificaciones_tipo',
'where cdgo_idntfccion_tpo IN( select b.cdgo_idntfccion_tpo ',
'                              from si_i_sujetos_responsable b ',
'                              where b.id_sjto_rspnsble  = :P311_NOMBRES_DECLARANTE) ',
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
'where   a.id_sjto_rspnsble  = :P311_NOMBRES_DECLARANTE )',
'order by dscrpcion_idntfccion_tpo asc;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P311_NOMBRES_DECLARANTE'
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
 p_id=>wwv_flow_api.id(8883534783100728)
,p_name=>'P311_IDNTFCCION_RPRSNTNTE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(14604922053557094)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(8886904032100730)
,p_name=>'P311_IDNTFCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(322561912165742918)
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
 p_id=>wwv_flow_api.id(8887331246100731)
,p_name=>'P311_ID_PAGE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(322561912165742918)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8889299560100732)
,p_name=>'P311_ACTIVIDAD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(14984385949248585)
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
'                                                            p_id_dclrcion_vgncia_frmlrio    =>  :P311_ID_DCLRCION_VGNCIA_FRMLRIO',
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
 p_id=>wwv_flow_api.id(8889608242100732)
,p_name=>'P311_ACTIVIDAD_DESCRIPCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(14984385949248585)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8890072278100732)
,p_name=>'P311_TARIFA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(14984385949248585)
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
 p_id=>wwv_flow_api.id(8890415801100733)
,p_name=>'P311_INGRESOS_GRAVADOS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(14984385949248585)
,p_use_cache_before_default=>'NO'
,p_item_default=>'0'
,p_prompt=>'Ingresos Gravados'
,p_source=>'VLOR_IGRSOS_GRVDOS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_cSize=>20
,p_begin_on_new_line=>'N'
,p_grid_column=>8
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(252201432664651457)
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
,p_item_comment=>'INGRESOS GRAVADOS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8890850751100733)
,p_name=>'P311_VLOR_IPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(14984385949248585)
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
 p_id=>wwv_flow_api.id(8891291595100733)
,p_name=>'P311_SEQ_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(14984385949248585)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8910269382698549)
,p_name=>'P311_CLCLO_CNCPTO_ANT_ANTICIPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO CONCEPTO ANTERIOR ANTICIPO')
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
,p_item_comment=>unistr('C\00C1LCULO CONCEPTO ANTERIOR ANTICIPO')
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8910526621696048)
,p_name=>'P311_CALCULO_PGO_ANTICIPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO PAGO CONCEPTO ANTICIPO')
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
,p_item_comment=>unistr('C\00C1LCULO PAGO CONCEPTO ANTICIPO')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8910871777694302)
,p_name=>'P311_CLCLO_DIF_PGO_ANTICIPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO DIFERENCIA PAGO ANTICIPO')
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
'    //minimumValue: "0",',
'    modifyValueOnWheel: false',
'}'))
,p_item_comment=>unistr('C\00C1LCULO DIFERENCIA PAGO ANTICIPO')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8911111011691672)
,p_name=>'P311_CLCLO_SLDO_FVR_PGO_ANTICIPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>600
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO SALDO A FAVOR PAGO ANTICIPO')
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
,p_item_comment=>unistr('C\00C1LCULO SALDO A FAVOR PAGO ANTICIPO')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8911466991689065)
,p_name=>'P311_CLCLO_DSCNTO_INT_ANTICIPO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>610
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>unistr('C\00C1LCULO DESCUENTO INTERESES CONCEPTO ANTICIPO')
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
,p_item_comment=>unistr('C\00C1LCULO DESCUENTO INTERESES CONCEPTO ANTICIPO')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9013873350936003)
,p_name=>'P311_MNS_VLR_EXNCION_SBRE_IMPSTO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>620
,p_item_plug_id=>wwv_flow_api.id(138585297200178647)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(9013977017936004)
,p_name=>'P311_MNS_RTNCNES_PRCTCRON_PRDO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>630
,p_item_plug_id=>wwv_flow_api.id(138585297200178647)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(9014048135936005)
,p_name=>'P311_AUTORRETNCNES_AVSOS_TBLROS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>640
,p_item_plug_id=>wwv_flow_api.id(138585297200178647)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(9014150058936006)
,p_name=>'P311_AUTO_RRTNCNES_SBRTSA_BMBROS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>650
,p_item_plug_id=>wwv_flow_api.id(138585297200178647)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(9014284589936007)
,p_name=>'P311_TOTAL_AUTORRETENCIONES'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>660
,p_item_plug_id=>wwv_flow_api.id(138585297200178647)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
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
 p_id=>wwv_flow_api.id(9014383327936008)
,p_name=>'P311_TTAL_PGOS_ABNOS_CUENTA_ICA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(138585576700178649)
,p_item_source_plug_id=>wwv_flow_api.id(138475417164171512)
,p_item_default=>'0'
,p_prompt=>unistr('7. BASE DE RETENCI\00D3N')
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
,p_item_comment=>unistr('7.BASE DE RETENCI\00D3N')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10363410025049401)
,p_name=>'P311_CLCLA_FCHA_PRSNTCION_FINAL_1'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(138585164905178645)
,p_prompt=>unistr('Fecha L\00EDmite de presentaci\00F3n')
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion( p_id_dclrcion_vgncia_frmlrio =>  :P311_ID_DCLRCION_VGNCIA_FRMLRIO,',
'                                                                          p_idntfccion => :P311_IDNTFCCION , ',
'                                                                          p_id_sjto_tpo => :P311_ID_SJTO_IMPSTO ),',
'                                                                          ''dd/mm/yyyy'' ) as fecha from dual'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>9
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_item_comment=>unistr('CALCULA FECHA PRESENTACI\00D3N FINAL')
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(8937676823100762)
,p_computation_sequence=>10
,p_computation_item=>'P311_CLCLA_FCHA_PRSNTCION_FINAL'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char( pkg_gi_declaraciones_funciones.fnc_co_fcha_mxma_prsntcion( p_id_dclrcion_vgncia_frmlrio =>  :P311_ID_DCLRCION_VGNCIA_FRMLRIO,',
'                                                                          p_idntfccion => :P311_IDNTFCCION , ',
'                                                                          p_id_sjto_tpo => :P311_ID_SJTO_IMPSTO ),',
'                                                                          ''dd/mm/yyyy'' ) as fecha from dual',
'                                                                                                                                               '))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(8937943928100763)
,p_computation_sequence=>20
,p_computation_item=>'P311_ID_PAGE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8938782224100764)
,p_validation_name=>'P311_FCHA_RGSTRO must be timestamp'
,p_validation_sequence=>130
,p_validation=>'P311_FCHA_RGSTRO'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>unistr('#LABEL# no es una fecha val\00EDda.')
,p_associated_item=>wwv_flow_api.id(8817543306100666)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8939183147100764)
,p_validation_name=>'P311_FCHA_ULTMA_MDFCCION must be timestamp'
,p_validation_sequence=>150
,p_validation=>'P311_FCHA_ULTMA_MDFCCION'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>unistr('#LABEL# no es una fecha val\00EDda.')
,p_associated_item=>wwv_flow_api.id(8818372984100668)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8939551413100764)
,p_validation_name=>'P311_FCHA_PRSNTCION must be timestamp'
,p_validation_sequence=>160
,p_validation=>'P311_FCHA_PRSNTCION'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>unistr('#LABEL# no es una fecha val\00EDda.')
,p_associated_item=>wwv_flow_api.id(8818702344100668)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8939941251100764)
,p_validation_name=>'P311_FCHA_APLCCION must be timestamp'
,p_validation_sequence=>180
,p_validation=>'P311_FCHA_APLCCION'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>unistr('#LABEL# no es una fecha val\00EDda.')
,p_associated_item=>wwv_flow_api.id(8819523434100668)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8940330598100764)
,p_validation_name=>'P311_FCHA_ANLCION must be timestamp'
,p_validation_sequence=>250
,p_validation=>'P311_FCHA_ANLCION'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>unistr('#LABEL# no es una fecha val\00EDda.')
,p_associated_item=>wwv_flow_api.id(8822339689100670)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8940764836100764)
,p_validation_name=>'P311_FCHA_PRSNTCION_PRYCTDA must be timestamp'
,p_validation_sequence=>260
,p_validation=>'P311_FCHA_PRSNTCION_PRYCTDA'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>unistr('#LABEL# no es una fecha val\00EDda.')
,p_associated_item=>wwv_flow_api.id(8822754731100670)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5867440157781022)
,p_validation_name=>'Validar que P311_FCHA_MAXIMA_PRSNTCION no este vacio'
,p_validation_sequence=>340
,p_validation=>'P311_FCHA_MAXIMA_PRSNTCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo FECHA M\00C1XIMA PRESENTACI\00D3N esta vac\00EDo ')
,p_when_button_pressed=>wwv_flow_api.id(8885409938100729)
,p_associated_item=>wwv_flow_api.id(8835027717100693)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5867225103781020)
,p_validation_name=>'Validar que P311_CLASIFICACION no este vacio'
,p_validation_sequence=>350
,p_validation=>'P311_CLASIFICACION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo CLASIFICACI\00D3N esta vac\00EDo ')
,p_when_button_pressed=>wwv_flow_api.id(8885409938100729)
,p_associated_item=>wwv_flow_api.id(8834275337100692)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5867347538781021)
,p_validation_name=>unistr('Validar que P311_OPCION_DE_USO no este vac\00EDo')
,p_validation_sequence=>360
,p_validation=>'P311_OPCION_DE_USO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo TIPO DE USO esta vac\00EDo ')
,p_when_button_pressed=>wwv_flow_api.id(8885409938100729)
,p_associated_item=>wwv_flow_api.id(8834601633100693)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8938356030100763)
,p_validation_name=>'Validar que no este vacio'
,p_validation_sequence=>370
,p_validation=>'P311_TOTAL_INGRESOS_GRAVADS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'El campo TOTAL INGRESOS GRAVADOS esta vacio '
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(8885409938100729)
,p_associated_item=>wwv_flow_api.id(8831141073100689)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5866909901781017)
,p_validation_name=>'Validar que P311_NOMBRES_DECLARANTE no este vacio'
,p_validation_sequence=>380
,p_validation=>'P311_NOMBRES_DECLARANTE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'El campo NOMBRES Y APELLIDOS DEL DECLARANTE esta vacio '
,p_when_button_pressed=>wwv_flow_api.id(8885409938100729)
,p_associated_item=>wwv_flow_api.id(8882743559100727)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6903350203135701)
,p_validation_name=>'validar estructura email'
,p_validation_sequence=>390
,p_validation=>'P311_CORREO_ELECTRONICO'
,p_validation2=>'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>unistr('Ingrese un correo v\00E1lido ')
,p_when_button_pressed=>wwv_flow_api.id(8885409938100729)
,p_associated_item=>wwv_flow_api.id(8840933256100698)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5868507944781033)
,p_validation_name=>unistr('validar P311_CORREO_ELECTRONICO no este vac\00EDo')
,p_validation_sequence=>400
,p_validation=>'P311_CORREO_ELECTRONICO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El campo CORREO esta vac\00EDo ')
,p_when_button_pressed=>wwv_flow_api.id(8885409938100729)
,p_associated_item=>wwv_flow_api.id(8840933256100698)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8947814087100770)
,p_name=>'Al perder el foco redondear valor item 9'
,p_event_sequence=>1
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_MNS_INGRSS_FUERA_MNCPIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8948395061100771)
,p_event_id=>wwv_flow_api.id(8947814087100770)
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
 p_id=>wwv_flow_api.id(8472636378912011)
,p_name=>'Al perder el foco redondear valor item 7'
,p_event_sequence=>11
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_TTAL_PGOS_ABNOS_CUENTA_ICA'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8472754869912012)
,p_event_id=>wwv_flow_api.id(8472636378912011)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'redondeoMilMasCercano(''P''+pageId+''_TTAL_PGOS_ABNOS_CUENTA_ICA'');',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8472813994912013)
,p_name=>'Al perder el foco redondear valor item 8'
,p_event_sequence=>21
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_TTL_IMPSTO_INDSTRIA_CMRCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8472933601912014)
,p_event_id=>wwv_flow_api.id(8472813994912013)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'redondeoMilMasCercano(''P''+pageId+''_TTL_IMPSTO_INDSTRIA_CMRCIO'');',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8948778647100772)
,p_name=>'Al perder el foco redondear valor item 11'
,p_event_sequence=>31
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_MNS_INGRSOS_DEV_REB_DES'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8949205894100772)
,p_event_id=>wwv_flow_api.id(8948778647100772)
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
 p_id=>wwv_flow_api.id(8949681105100772)
,p_name=>'Al perder el foco redondear valor item 12'
,p_event_sequence=>41
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_MNS_INGRSOS_EXPRTCIONS'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8950152226100772)
,p_event_id=>wwv_flow_api.id(8949681105100772)
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
 p_id=>wwv_flow_api.id(8950542659100772)
,p_name=>'Al perder el foco redondear valor item 13'
,p_event_sequence=>51
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_MNS_INGRSOS_VNTA_ACT_FIJS'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8951000098100773)
,p_event_id=>wwv_flow_api.id(8950542659100772)
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
 p_id=>wwv_flow_api.id(8951453585100773)
,p_name=>'Al perder el foco redondear valor item 14'
,p_event_sequence=>61
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_MNS_INGRSOS_ACTVDDS_EXCLDS'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8951918037100773)
,p_event_id=>wwv_flow_api.id(8951453585100773)
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
 p_id=>wwv_flow_api.id(8952398945100773)
,p_name=>'Al perder el foco redondear valor item 15'
,p_event_sequence=>71
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_MNS_INGRSOS_ACTVDDS_EXENTAS'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8952844442100773)
,p_event_id=>wwv_flow_api.id(8952398945100773)
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
 p_id=>wwv_flow_api.id(8953287951100774)
,p_name=>'Al perder el foco redondear valor item 22'
,p_event_sequence=>81
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_PGO_UNDDS_CMRCLS'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8953776472100774)
,p_event_id=>wwv_flow_api.id(8953287951100774)
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
 p_id=>wwv_flow_api.id(8954132986100774)
,p_name=>'Al perder el foco redondear valor item 26'
,p_event_sequence=>91
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_MENS_VLR_EXNCN_EXNRCN_IMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8954617378100774)
,p_event_id=>wwv_flow_api.id(8954132986100774)
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
 p_id=>wwv_flow_api.id(8955035964100775)
,p_name=>'Al perder el foco redondear valor item 27'
,p_event_sequence=>101
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_MENOS_RETENCIONES'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8955584463100775)
,p_event_id=>wwv_flow_api.id(8955035964100775)
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
 p_id=>wwv_flow_api.id(8955951211100775)
,p_name=>'Al perder el foco redondear valor item 28'
,p_event_sequence=>111
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_MENOS_AUTORRETENCIONES'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8956499596100775)
,p_event_id=>wwv_flow_api.id(8955951211100775)
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
 p_id=>wwv_flow_api.id(8956817200100775)
,p_name=>'Al perder el foco redondear valor item 29'
,p_event_sequence=>121
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_MENS_ANTCPO_LIQDDO_ANIO_ANTR'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8957322291100776)
,p_event_id=>wwv_flow_api.id(8956817200100775)
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
 p_id=>wwv_flow_api.id(8957752608100776)
,p_name=>'Al perder el foco redondear valor item 31 sancion manual'
,p_event_sequence=>131
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_SANCION_MANUAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8958206297100776)
,p_event_id=>wwv_flow_api.id(8957752608100776)
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
 p_id=>wwv_flow_api.id(8959587172100777)
,p_name=>'Al perder el foco redondear valor item 32'
,p_event_sequence=>141
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_MENOS_SLDO_FVR_PRDO_ANTRIOR'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8960021210100777)
,p_event_id=>wwv_flow_api.id(8959587172100777)
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
 p_id=>wwv_flow_api.id(8960490712100777)
,p_name=>'Al perder el foco redondear valor item 39'
,p_event_sequence=>151
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_VALOR_PAGO_VOLUNTARIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8960990462100777)
,p_event_id=>wwv_flow_api.id(8960490712100777)
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
 p_id=>wwv_flow_api.id(8961341991100777)
,p_name=>'Al perder el foco redondear valor item valor a pagar bancos'
,p_event_sequence=>161
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_VALOR_PAGAR_BANCOS'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8961806830100778)
,p_event_id=>wwv_flow_api.id(8961341991100777)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function validarItemPagarBanco(){',
'     var VALOR_PAGAR_BANCOS = parseFloat(apex.item(''P''+pageId+''_VALOR_PAGAR_BANCOS'').getValue()) ?? 0;',
'    // var calculo_PAGAR_BANCOS = parseFloat(apex.item(''P''+pageId+''_CALCULO_VALOR_PAGAR_BANCOS'').getValue()) ?? 0;',
'    var TOTAL_PAGAR_PAGO_VOLUNTARIO = parseFloat(apex.item(''P''+pageId+''_TOTAL_PAGAR_PAGO_VOLUNTARIO'').getValue()) ?? 0;',
'    ',
'    if (  VALOR_PAGAR_BANCOS  > TOTAL_PAGAR_PAGO_VOLUNTARIO ) {',
'        apex.item(''P''+pageId+''_VALOR_PAGAR_BANCOS'').setValue( TOTAL_PAGAR_PAGO_VOLUNTARIO);',
'        apex.item(''P''+pageId+''_CALCULO_VALOR_PAGAR_BANCOS'').setValue( TOTAL_PAGAR_PAGO_VOLUNTARIO);',
'    } else { ',
'       apex.item(''P''+pageId+''_VALOR_PAGAR_BANCOS'').setValue( VALOR_PAGAR_BANCOS);',
'       apex.item(''P''+pageId+''_CALCULO_VALOR_PAGAR_BANCOS'').setValue(VALOR_PAGAR_BANCOS || 0); ',
'    }   ',
'}',
'',
'validarItemPagarBanco();',
'//redondeoMilMasCercano(''P''+pageId+''_VALOR_PAGAR_BANCOS'');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8962291346100778)
,p_name=>unistr('Al dar clic al bot\00F3n consultar')
,p_event_sequence=>171
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8886517238100730)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8962796061100778)
,p_event_id=>wwv_flow_api.id(8962291346100778)
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
 p_id=>wwv_flow_api.id(8963113711100779)
,p_name=>'Al cambiar tipo calculo sancion calcular el valor sancion'
,p_event_sequence=>181
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_TIPO_CALCULO_SANCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8963626247100779)
,p_event_id=>wwv_flow_api.id(8963113711100779)
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
 p_id=>wwv_flow_api.id(8964043358100779)
,p_name=>'Al calcular tipo de calculo sancion'
,p_event_sequence=>191
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_TIPO_CALCULO_SANCION'
,p_condition_element=>'P311_TIPO_CALCULO_SANCION'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8964507414100779)
,p_event_id=>wwv_flow_api.id(8964043358100779)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P311_SANCION_MANUAL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5865314218781001)
,p_event_id=>wwv_flow_api.id(8964043358100779)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function sancionMinima3(){',
'    var    tipo_sancion = parseFloat(apex.item(''P''+pageId+''_SANCION_MANUAL'').getValue()) ?? 0;',
'    var    indcdor_ext = apex.item(''P''+pageId+''_INDICADOR_EXTEMPORANEO'').getValue();',
'',
'    if (indcdor_ext === ''S''){',
'         if (tipo_sancion < 471000){',
'            apex.item(''P''+pageId+''_CLCLO_NETO_SANCION'').setValue(471000 || 0);',
'            apex.item(''P''+pageId+''_SANCION_MANUAL'').setValue(471000 || 0);',
'         }else{',
'            apex.item(''P''+pageId+''_CLCLO_NETO_SANCION'').setValue(tipo_sancion || 0);',
'         };    ',
'    };',
'     redondeoMilMasCercano(''P''+pageId+''_SANCION_MANUAL'');',
'};',
'     ',
'//sancionMinima3();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8965013024100779)
,p_event_id=>wwv_flow_api.id(8964043358100779)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P311_SANCION_MANUAL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8965539752100780)
,p_event_id=>wwv_flow_api.id(8964043358100779)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P311_SANCION_SUGERIDA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8966091665100780)
,p_event_id=>wwv_flow_api.id(8964043358100779)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P311_SANCION_SUGERIDA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5865476718781002)
,p_name=>'Al calcular tipo de calculo sancion vacio'
,p_event_sequence=>201
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_TIPO_CALCULO_SANCION'
,p_condition_element=>'P311_TIPO_CALCULO_SANCION'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5865642607781004)
,p_event_id=>wwv_flow_api.id(5865476718781002)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P311_SANCION_MANUAL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5865747592781005)
,p_event_id=>wwv_flow_api.id(5865476718781002)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P311_SANCION_SUGERIDA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8992672739100795)
,p_name=>'setear items fecha'
,p_event_sequence=>211
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_FCHA_MAXIMA_PRSNTCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8993101282100795)
,p_event_id=>wwv_flow_api.id(8992672739100795)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P311_ITEMS_FECHA'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'nvl(to_date(:P311_FCHA_MAXIMA_PRSNTCION,''dd/mm/yyyy''), ''14/04/2024'')'
,p_attribute_07=>'P311_FCHA_MAXIMA_PRSNTCION'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8968260820100781)
,p_name=>'Al actualizar item 8'
,p_event_sequence=>221
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_MNS_INGRSS_FUERA_MNCPIO,P311_MNS_INGRSOS_DEV_REB_DES,P311_MNS_INGRSOS_EXPRTCIONS,P311_MNS_INGRSOS_VNTA_ACT_FIJS,P311_MNS_INGRSOS_ACTVDDS_EXCLDS,P311_MNS_INGRSOS_ACTVDDS_EXENTAS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8968799559100782)
,p_event_id=>wwv_flow_api.id(8968260820100781)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'//regionBaseGravable();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8969260937100782)
,p_event_id=>wwv_flow_api.id(8968260820100781)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculoItem16();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8971432029100783)
,p_name=>unistr('Al calcular clasificaci\00F3n')
,p_event_sequence=>231
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_CLASIFICACION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8971952433100783)
,p_event_id=>wwv_flow_api.id(8971432029100783)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P311_CLASIFICACION'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8972488550100784)
,p_event_id=>wwv_flow_api.id(8971432029100783)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validarValorBanco();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9478983443621040)
,p_name=>'setear item indicador extemporaneo'
,p_event_sequence=>241
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_FCHA_MAXIMA_PRSNTCION,P311_CLASIFICACION,P311_OPCION_DE_USO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9479060068621041)
,p_event_id=>wwv_flow_api.id(9478983443621040)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P311_INDICADOR_EXTEMPORANEO'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pkg_gi_declaraciones_funciones.fnc_vl_fecha_limite(  p_cdgo_clnte                  => :F_CDGO_CLNTE,',
'                                                            p_id_dclrcion_vgncia_frmlrio  => :P311_ID_DCLRCION_VGNCIA_FRMLRIO,',
'                                                            p_idntfccion	              => :P311_IDNTFCCION,',
'                                                            p_fcha_prsntcion              => :P311_FCHA_MAXIMA_PRSNTCION,',
'                                                            p_id_sjto_tpo	              => :P311_CLASIFICACION) as indcdor_extmprneo from dual'))
,p_attribute_07=>'P311_FCHA_MAXIMA_PRSNTCION,P311_INDICADOR_EXTEMPORANEO,P311_CLASIFICACION,P311_IDNTFCCION,P311_OPCION_DE_USO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(10837146122286554)
,p_name=>'Al cambiar  P311_CLASIFICACION'
,p_event_sequence=>251
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_CLASIFICACION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10838053170286556)
,p_event_id=>wwv_flow_api.id(10837146122286554)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P311_CLCLA_FCHA_PRSNTCION_FINAL'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char( pkg_gi_declaraciones_funciones.fnc_co_fcha_mxma_prsntcion( p_id_dclrcion_vgncia_frmlrio =>  :P311_ID_DCLRCION_VGNCIA_FRMLRIO,',
'                                                                          p_idntfccion => :P311_IDNTFCCION, ',
'                                                                          p_id_sjto_tpo => :P311_CLASIFICACION),',
'                                                                          ''dd/mm/yyyy'' ) as fecha from dual                                      '))
,p_attribute_07=>'P311_ID_DCLRCION_VGNCIA_FRMLRIO,P311_IDNTFCCION,P311_CLASIFICACION'
,p_attribute_08=>'N'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10837536807286556)
,p_event_id=>wwv_flow_api.id(10837146122286554)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('var pageId = &APP_PAGE_ID.;  // Extrae el n\00FAmero de la pagina.'),
'var fechamax = apex.item(''P''+pageId+''_CLCLA_FCHA_PRSNTCION_FINAL'').getValue();',
'var partesFecha = fechamax.split(''/'');',
'',
unistr('// Convertir el mes (posici\00F3n 1) a n\00FAmero, restar 1 y asegurar que tenga dos d\00EDgitos'),
'var ano = (parseInt(partesFecha[2]));',
'var mes = (parseInt(partesFecha[1], 10) - 1).toString().padStart(2, ''0'');',
'var dia = (parseInt(partesFecha[0])); ',
'//var fechaModificada = fechaFormateada.replaceAll(''/'', '','');',
'var maxDate = new Date(ano,mes,dia); ',
'',
'$(''#P311_FCHA_MAXIMA_PRSNTCION'').datepicker(''option'', ''maxDate'', maxDate);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8980990978100788)
,p_name=>'Al cambiar P311_VALOR_PAGAR'
,p_event_sequence=>261
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_CALCULO_TOTAL_SALDO_CARGO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8981479222100788)
,p_event_id=>wwv_flow_api.id(8980990978100788)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>unistr('calculoValorPago(); //Funci\00F3n que calculo el valor del item valor  total a pagar')
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5852684710379001)
,p_name=>'Calcular item 24 al cambiar TOTAL IMPUESTO'
,p_event_sequence=>271
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_CLASIFICACION,P311_OPCION_DE_USO,P311_FCHA_MAXIMA_PRSNTCION,P311_TTL_IMPSTO_INDSTRIA_CMRCIO,P311_MENOS_RETENCIONES'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5852736559379002)
,p_event_id=>wwv_flow_api.id(5852684710379001)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setTimeout(function() {',
'                        calculoItem24();',
'                         $(''.t-Alert--success'').fadeOut(''slow'');             ',
'                    }, 500);                 ',
'              ',
'',
'setTimeout(function() {',
'                         calculoItem25();    ',
'                         calculoConcepto();                        ',
'                    }, 500);',
'',
'setTimeout(function() {',
'                        calculoValorPago ();',
'                    }, 500);',
'',
'setTimeout(function() {',
'                        calcularItem13();',
'                    }, 500);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8981833662100789)
,p_name=>unistr('Al cambiar opci\00F3n de uso consultar declaracion inicial')
,p_event_sequence=>281
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_OPCION_DE_USO'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8982337469100789)
,p_event_id=>wwv_flow_api.id(8981833662100789)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P311_CLCLO_DCLRCION_CRRCCION > 0  and :P311_OPCION_DE_USO = ''DIN'' then',
'    :P311_OPCION_DE_USO := ''DCO'';',
'elsif :P311_CLCLO_DCLRCION_CRRCCION = 0  and :P311_OPCION_DE_USO = ''DCO'' then',
'    :P311_OPCION_DE_USO := ''DIN'';',
'end if;',
''))
,p_attribute_02=>'P311_OPCION_DE_USO,P311_CLCLO_DCLRCION_CRRCCION'
,p_attribute_03=>'P311_OPCION_DE_USO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8982723262100789)
,p_name=>'crear actividades'
,p_event_sequence=>291
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8888877864100732)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8983296907100790)
,p_event_id=>wwv_flow_api.id(8982723262100789)
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
'            pageItems: "#P311_ACTIVIDAD,#P311_TARIFA,#P311_VLOR_IPSTO,#P311_INGRESOS_GRAVADOS,#P311_ACTIVIDAD_DESCRIPCION"   ',
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
'                   setTimeout(function () {',
'                       /* var $errorAlert = $(''.a-Notification-item'');',
'                        if ($errorAlert.length > 0) {',
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
'                   // apex.theme.closeRegion("gestionActividadEconomica");',
'                       apex.message.showPageSuccess("Actividad agregada.");',
'                       limpiar_items();',
'                    setTimeout(function() {',
'                        calculoActividadesGravadas();',
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
 p_id=>wwv_flow_api.id(8974602703100785)
,p_name=>'calcular valor impuesto'
,p_event_sequence=>301
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_INGRESOS_GRAVADOS'
,p_condition_element=>'P311_ID_SJTO_IMPSTO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'keydown'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8975142401100785)
,p_event_id=>wwv_flow_api.id(8974602703100785)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(9479279390621043)
,p_name=>'calcular valor impuesto al cambiar'
,p_event_sequence=>311
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_INGRESOS_GRAVADOS,P311_TARIFA'
,p_condition_element=>'P311_ID_SJTO_IMPSTO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9479349221621044)
,p_event_id=>wwv_flow_api.id(9479279390621043)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'calcularImpuesto();',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8989008444100793)
,p_name=>'Al cambiar actividad economica2'
,p_event_sequence=>321
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_ACTIVIDAD'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8989514118100793)
,p_event_id=>wwv_flow_api.id(8989008444100793)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P311_TARIFA,P311_ACTIVIDAD_DESCRIPCION'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.trfa,',
'       a.cdgo_dclrcns_esqma_trfa || '' - '' || a.dscrpcion',
'from gi_d_dclrcns_esqma_trfa a',
'where a.id_dclrcns_esqma_trfa = :P311_ACTIVIDAD'))
,p_attribute_07=>'P311_ACTIVIDAD'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8973752280100785)
,p_name=>'prueba'
,p_event_sequence=>331
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(148543044974799405)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8974252191100785)
,p_event_id=>wwv_flow_api.id(8973752280100785)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'calculoActividadesGravadas();',
'buildJsonActividades();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8975596251100785)
,p_name=>'PROBAR SUMA COLUMNA'
,p_event_sequence=>341
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(136502625106520404)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8976078501100786)
,p_event_id=>wwv_flow_api.id(8975596251100785)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('// Espera a que la p\00E1gina se cargue completamente'),
'$(document).ready(function() {',
unistr('    // Obt\00E9n el objeto de Interactive Grid por su ID'),
'    var ig$ = apex.region("actividad").widget();',
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
'        });',
'    }',
unistr('    // Llama a la funci\00F3n para calcular la suma total cuando sea necesario'),
'    calcularSumaTotal();',
'});',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8976496949100786)
,p_name=>'Al cambiar P311_IMPUESTO_LEY calcular valores formulario'
,p_event_sequence=>351
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_IMPUESTO_LEY'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8976905480100786)
,p_event_id=>wwv_flow_api.id(8976496949100786)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculoActividadesGravadas();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8979101428100787)
,p_name=>'Al cambiar P311_APORTE_VOLUNTARIO'
,p_event_sequence=>361
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_APORTE_VOLUNTARIO,P311_VALOR_PAGO_VOLUNTARIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8979615011100787)
,p_event_id=>wwv_flow_api.id(8979101428100787)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('function validarPagoVoluntario (){  // Funci\00F3n que valida si aporte voluntario es N, cambia el valor del item valor pago voluntario a cero.'),
'    var aprte_vlntrio =  apex.item(''P''+pageId+''_APORTE_VOLUNTARIO'').getValue();',
'    var vlor_aprte_vlntrio =  apex.item(''P''+pageId+''_VALOR_PAGO_VOLUNTARIO'').getValue();',
'   ',
'    if (aprte_vlntrio !== ''S'' && vlor_aprte_vlntrio > 0 ){',
'        apex.item(''P''+pageId+''_VALOR_PAGO_VOLUNTARIO'').setValue(0 || 0); ',
'    }',
'    ',
'    validarsumapagovoluntario();',
'}',
'',
'function validarsumapagovoluntario (){  ',
'     var aprte_vlntrio      =  apex.item(''P''+pageId+''_APORTE_VOLUNTARIO'').getValue();',
'     var vlor_aprte_vlntrio =  apex.item(''P''+pageId+''_VALOR_PAGO_VOLUNTARIO'').getValue();',
'     var vlro_pgar_bncos    =  apex.item(''P''+pageId+''_VALOR_PAGAR_BANCOS'').getValue();',
'     var ttal_pgar_pgo_vlntrio    =  apex.item(''P''+pageId+''_TOTAL_PAGAR_PAGO_VOLUNTARIO'').getValue(); //item40',
'   // apex.item(''P''+pageId+''_CALCULO_VALOR_PAGAR_BANCOS'').hide();    ',
'   // apex.item(''P''+pageId+''_VALOR_PAGAR_BANCOS'').hide(); ',
'    if (aprte_vlntrio === ''S'' && vlro_pgar_bncos < ttal_pgar_pgo_vlntrio ){',
'        apex.item(''P''+pageId+''_VALOR_PAGAR_BANCOS'').setValue(ttal_pgar_pgo_vlntrio || 0); ',
'        apex.item(''P''+pageId+''_CALCULO_VALOR_PAGAR_BANCOS'').setValue(ttal_pgar_pgo_vlntrio || 0); ',
'    }else{',
'          apex.item(''P''+pageId+''_VALOR_PAGAR_BANCOS'').setValue(ttal_pgar_pgo_vlntrio || 0); ',
'          apex.item(''P''+pageId+''_CALCULO_VALOR_PAGAR_BANCOS'').setValue(ttal_pgar_pgo_vlntrio || 0); ',
'    }',
'}',
'',
'//validarPagoVoluntario();',
'//validarsumapagovoluntario();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8984505121100791)
,p_name=>'Al cambiar P311_VALOR_PAGAR '
,p_event_sequence=>371
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_VALOR_PAGAR'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8985084117100791)
,p_event_id=>wwv_flow_api.id(8984505121100791)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>unistr('calcularItem38();//Funci\00F3n que calcula el valor del item38')
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8985420910100791)
,p_name=>'Al dar click boton BTN_NUEVA_ACTIVIDAD'
,p_event_sequence=>381
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8888062281100731)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8985922519100792)
,p_event_id=>wwv_flow_api.id(8985420910100791)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function limpiar_items(){',
'    // Limpiamos Items',
'    apex.item("P311_ACTIVIDAD").setValue("");',
'    apex.item("P311_TARIFA").setValue("");',
'    apex.item("P311_INGRESOS_GRAVADOS").setValue("");',
'    apex.item("P311_VLOR_IPSTO").setValue("");',
'}',
'',
'// Limpiamos Items',
'limpiar_items();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8987262530100792)
,p_name=>'Al cambiar P311_VLOR_IPSTO'
,p_event_sequence=>391
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_VLOR_IPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8987745484100792)
,p_event_id=>wwv_flow_api.id(8987262530100792)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'redondeoMilMasCercano(''P''+pageId+''_VLOR_IPSTO'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8986396357100792)
,p_name=>'Al dar click boton BTN_CANCELAR'
,p_event_sequence=>401
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8888478738100732)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8986828905100792)
,p_event_id=>wwv_flow_api.id(8986396357100792)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.theme.closeRegion("gestionActividadEconomica");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8983615345100790)
,p_name=>'Al hacer clic BTN_MOSTRAR_REGION_ACTIVIDADES'
,p_event_sequence=>411
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8829604800100687)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8984190420100791)
,p_event_id=>wwv_flow_api.id(8983615345100790)
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
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8988105475100793)
,p_name=>'Al cambiar P311_TOTAL_PAGAR'
,p_event_sequence=>421
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_TOTAL_PAGAR,P311_VALOR_PAGO_VOLUNTARIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8988601471100793)
,p_event_id=>wwv_flow_api.id(8988105475100793)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>unistr('calcularItem40();//Funci\00F3n que calcula el valor del item340')
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8989951627100794)
,p_name=>'Al hacer clic columna eliminar'
,p_event_sequence=>431
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(14984385949248585)
,p_triggering_element=>'ELIMINAR'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8990441315100794)
,p_event_id=>wwv_flow_api.id(8989951627100794)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calcularId();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8991789806100794)
,p_name=>'al seleccionar '
,p_event_sequence=>441
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(14984385949248585)
,p_triggering_element=>'SELECCIONAR'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'SEQ_ID'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8992240380100795)
,p_event_id=>wwv_flow_api.id(8991789806100794)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'ELIMINAR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8978229812100787)
,p_name=>'Al hacer clic BTN_CREATE'
,p_event_sequence=>451
,p_bind_type=>'bind'
,p_bind_event_type=>'apexbeforepagesubmit'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8978733196100787)
,p_event_id=>wwv_flow_api.id(8978229812100787)
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
'    ',
'    if (campo1.trim() === "") { valid = false; }',
'    if (campo2.trim() === "") { valid = false; }',
'    if (campo3.trim() === "") { valid = false; }',
'    /*if (campo4.trim() === "") { valid = false; }',
'    if (campo5.trim() === "") { valid = false; }',
'    if (campo6.trim() === "") { valid = false; }',
'    if (campo7.trim() === "") { valid = false; }',
'    if (campo8.trim() === "") { valid = false; }*/',
'    if (campo9.trim() === "") { valid = false; }',
'    if (campo10.trim() === "") { valid = false; }',
'',
'    if (!valid) {',
unistr('        deshabilitarItems(); // Si alguna validaci\00F3n falla, ejecuta deshabilitarItems'),
'         //apex.event.gCancelFlag = true;',
'    } else {',
unistr('        habilitarItems(); // Si todos los campos est\00E1n llenos, ejecuta habilitarItems'),
'    }',
'}',
'validarCampos();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5866097374781008)
,p_name=>'Al ingresar valor'
,p_event_sequence=>461
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_SANCION_MANUAL,P311_TIPO_CALCULO_SANCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5866126773781009)
,p_event_id=>wwv_flow_api.id(5866097374781008)
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
 p_id=>wwv_flow_api.id(5852844068379003)
,p_name=>'Al cambiar P311_CLCLO_NETO_SANCION'
,p_event_sequence=>471
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_CLCLO_NETO_SANCION,P311_SANCION_MANUAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5852921115379004)
,p_event_id=>wwv_flow_api.id(5852844068379003)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'calculoItem25();',
'setTimeout(function() {',
'                          calculoValorPago ();                            ',
'                    }, 500);',
'setTimeout(function() {',
'                          calcularItem11 ();                            ',
'                    }, 500);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5866289508781010)
,p_name=>'Al cambiar P311_NOMBRES_DECLARANTE'
,p_event_sequence=>481
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_NOMBRES_DECLARANTE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5866345289781011)
,p_event_id=>wwv_flow_api.id(5866289508781010)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P311_TPO_IDNTFCCION_DCLRNTE_FRMA,P311_IDNTFCCION_RPRSNTNTE'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  b.cdgo_idntfccion_tpo , ',
'        a.idntfccion_rspnsble        ',
'from    v_si_i_sujetos_responsable    a',
'join    df_s_identificaciones_tipo    b on a.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo                                    ',
'where   a.id_sjto_rspnsble  = :P311_NOMBRES_DECLARANTE;'))
,p_attribute_07=>'P311_NOMBRES_DECLARANTE'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5866450490781012)
,p_name=>'Al cambiar P311_NOMBRES_DECLARANTE_REVISOR'
,p_event_sequence=>491
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_NOMBRES_DECLARANTE_REVISOR'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5866570634781013)
,p_event_id=>wwv_flow_api.id(5866450490781012)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P311_TPO_IDENTIFICACION_REVISOR,P311_IDENTIFICACION_REVISOR'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  b.cdgo_idntfccion_tpo , ',
'        a.idntfccion_rspnsble        ',
'from    v_si_i_sujetos_responsable    a',
'join    df_s_identificaciones_tipo    b on a.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo                                    ',
'where   a.id_sjto_rspnsble  = :P311_NOMBRES_DECLARANTE_REVISOR;'))
,p_attribute_07=>'P311_NOMBRES_DECLARANTE_REVISOR'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5853999721379014)
,p_name=>'Al cambiar  P311_IDENTIFICACION_REVISOR'
,p_event_sequence=>501
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_NOMBRES_DECLARANTE_REVISOR'
,p_condition_element=>'P311_NOMBRES_DECLARANTE_REVISOR'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5854016969379015)
,p_event_id=>wwv_flow_api.id(5853999721379014)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P311_ETIQUETA_SECUNDARIA'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select w.dscrpcion  as descripcion_firma from',
'si_i_sujetos_responsable r',
'inner join ws_d_tipo_firma w on',
'r.cdgo_tpo_rspnsble  = w.cdgo_tpo_frma ',
'where r.id_sjto_rspnsble  =  :P311_NOMBRES_DECLARANTE_REVISOR',
'AND ROWNUM = 1'))
,p_attribute_07=>'P311_NOMBRES_DECLARANTE_REVISOR,P311_ETIQUETA_SECUNDARIA'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5854101834379016)
,p_event_id=>wwv_flow_api.id(5853999721379014)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P311_ETIQUETA_SECUNDARIA'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5855189222379026)
,p_name=>'Al cambiar  P311_NOMBRE_DECLARANTE'
,p_event_sequence=>511
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_NOMBRES_DECLARANTE'
,p_condition_element=>'P311_NOMBRES_DECLARANTE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5855268165379027)
,p_event_id=>wwv_flow_api.id(5855189222379026)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P311_ETIQUETA_PRINCIPAL'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(w.dscrpcion, '''')  as descripcion_firma ',
'from',
'si_i_sujetos_responsable r',
'inner join ws_d_tipo_firma w on',
'r.cdgo_tpo_rspnsble  = w.cdgo_tpo_frma ',
'where r.id_sjto_rspnsble  =  :P311_NOMBRES_DECLARANTE',
'and r.prncpal_s_n =''S''',
'AND ROWNUM = 1'))
,p_attribute_07=>'P311_NOMBRES_DECLARANTE,P311_ETIQUETA_PRINCIPAL'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5855346605379028)
,p_event_id=>wwv_flow_api.id(5855189222379026)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P311_ETIQUETA_PRINCIPAL'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6885920981473801)
,p_name=>'Actualizar etique'
,p_event_sequence=>521
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_NOMBRES_DECLARANTE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6886029773473802)
,p_event_id=>wwv_flow_api.id(6885920981473801)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P311_ETIQUETA_PRINCIPAL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6886246587473804)
,p_name=>'al cambiar etiqueta secundaria'
,p_event_sequence=>531
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_NOMBRES_DECLARANTE_REVISOR'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6886301513473805)
,p_event_id=>wwv_flow_api.id(6886246587473804)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P311_ETIQUETA_SECUNDARIA'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12086932100132215)
,p_name=>'Al seleccionar CALENDARIO ESPECIAL'
,p_event_sequence=>541
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_CLASIFICACION'
,p_condition_element=>'P311_CLASIFICACION'
,p_triggering_condition_type=>'IN_LIST'
,p_triggering_expression=>'481'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12087395925132216)
,p_event_id=>wwv_flow_api.id(12086932100132215)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>unistr('CALENDARIO ESPECIAL (Solo aplica para contribuyentes que cumplan condiciones establecidas en el Par\00E1grafo 1ro Art 3 de Res. 0001746 de 28-12-2023 Calendario Tributario 2024)')
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8947468940100770)
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
'        and seq_id = :P311_SEQ_ID;',
' ',
'         if v_cntdad > 0 then',
'            APEX_COLLECTION.DELETE_MEMBER(',
'            p_collection_name => ''ACTIVIDADES'',',
'            p_seq => :P311_SEQ_ID); ',
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
 p_id=>wwv_flow_api.id(8825528037100674)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(138475417164171512)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Create Formu'
,p_attribute_01=>'TABLE'
,p_attribute_03=>'GI_G_DECLARACIONES_V2'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>'Error al registrar #SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(8885409938100729)
,p_process_success_message=>unistr('Declaraci\00F3n registrada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8946254421100769)
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
'    -- insert en la tabla de activades  id_dclrcion => P311_ID_DCLRCION ',
'    ',
'',
'  --  v_id_dclrcion    :=     :P311_ID_DCLRCION;',
'    pkg_gi_declaraciones_utlddes.prc_hg_formulario(p_cdgo_clnte                 => :F_CDGO_CLNTE,',
'                                                  p_id_sjto_impsto              => :P311_ID_SJTO_IMPSTO,',
'                                                  p_id_dclrcion_v2              => :P311_ID_DCLRCION,',
'                                                  --p_id_cnddto_vgncia            => null,',
'                                                  p_id_dclrcion_vgncia_frmlrio  => :P311_ID_DCLRCION_VGNCIA_FRMLRIO,',
'                                                  p_id_pagina    		        => :APP_PAGE_ID,',
'                                                  p_id_usrio                    => :F_ID_USRIO,',
'                                                  p_id_orgen_tpo                => 1,',
'                                                  p_json_actvdds                => :P311_JSON_ACTVDDES,',
'                                                  o_id_dclrcion                 => v_id_dclrcion_v1,',
'                                                  o_cdgo_rspsta                 => v_cdgo_rspsta, ',
'                                                  o_mnsje_rspsta                => v_mnsje_rspsta);',
'',
'    if v_cdgo_rspsta > 0 then',
'        raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;',
'    :P311_ID_DCLRCION_V2 := v_id_dclrcion_v1;',
'    ',
'end;'))
,p_process_error_message=>'Error al registrar #SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(8885409938100729)
,p_process_success_message=>unistr('Declaraci\00F3n registrada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8947016185100769)
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
'               and a.n003            = :P311_ACTIVIDAD ;',
'        ',
'            if v_rgstros > 0 then',
'                raise_application_error(-20003, ''Sr(a). '' || :F_NMBRE_USRIO || '', la Actividad ya se encuentra agregada. Por favor valide e intente nuevamente'');  ',
'            end if;',
'        end;-- FIN Se valida si la Actividad ya esta registrada      ',
'          ',
'        begin',
'            apex_collection.add_member(p_collection_name 	=> ''ACTIVIDADES''',
'                                     , p_n003               => :P311_ACTIVIDAD',
'									 , p_n004               => :P311_TARIFA',
'                                     , p_c001				=> :P311_VALOR );',
'      end;                     ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8944214905100767)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Calcular informaci\00F3n declarante firma')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.cdgo_idntfccion_tpo,',
'           b.idntfccion',
'     into  :P311_TPO_IDENTIFICACION_DECLARANTE_FIRMA,',
'           :P311_IDENTIFICACION_REPRESENTANTE',
'    from df_s_identificaciones_tipo a ',
'    join    si_i_sujetos_responsable b on a.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo',
'    where b.id_sjto_rspnsble  = :P311_ID_SJTO_IMPSTO ',
'    order by dscrpcion_idntfccion_tpo asc;',
'exception',
'      when no_data_found then',
'          :P311_TPO_IDENTIFICACION_DECLARANTE_FIRMA := null;',
'          :P311_IDENTIFICACION_REPRESENTANTE:= null;',
'  end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8944668085100768)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inicia Declaracion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_id_page                       NUMBER         := :APP_PAGE_ID;',
'    v_id_dclrcion_vgncia_frmlrio    NUMBER         := :P311_ID_DCLRCION_VGNCIA_FRMLRIO;',
'    v_idntfccion                    VARCHAR2(50)   := :P311_IDNTFCCION;',
'    v_branch                        NUMBER         := :P311_BRANCH;',
'    v_id_sjto_impsto                NUMBER         := :P311_ID_SJTO_IMPSTO;',
'    v_mstrar_frmlrio                VARCHAR2(2)    := :P311_MSTRAR_FRMLRIO;',
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
'    apex_util.set_session_state(''P311_ID_DCLRCION_VGNCIA_FRMLRIO'', v_id_dclrcion_vgncia_frmlrio);',
'    apex_util.set_session_state(''P311_IDNTFCCION'', v_idntfccion);',
'    apex_util.set_session_state(''P311_ID_SJTO_IMPSTO'', v_id_sjto_impsto);',
'    apex_util.set_session_state(''P311_MSTRAR_FRMLRIO'', v_mstrar_frmlrio);',
'    apex_util.set_session_state(''P311_BRANCH'', v_branch);   ',
'exception',
'    when others then',
'        NULL;',
'end;',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8946674140100769)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'limpiar id_sjto_impsto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'        :P311_ID_SJTO_IMPSTO := null;',
'        :P311_ID_DCLRCION := NULL;',
'  exception ',
'    when others then null;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'iniciar_declaracion'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8825106825100673)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(138475417164171512)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Create Form'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8943058830100766)
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
'    into        :P311_ID_IMPSTO,',
'                :P311_ID_IMPSTO_SBMPSTO,',
'                :P311_VGNCIA,',
'                :P311_ID_PRDO',
'    from        gi_d_dclrcnes_vgncias_frmlr a',
'    inner join  gi_d_dclrcnes_tpos_vgncias  b   on  b.id_dclrcion_tpo_vgncia    =   a.id_dclrcion_tpo_vgncia',
'    inner join  df_i_periodos               c   on  c.id_prdo                   =   b.id_prdo',
'    inner join  gi_d_declaraciones_tipo     d   on  d.id_dclrcn_tpo             =   b.id_dclrcn_tpo',
'    where       a.id_dclrcion_vgncia_frmlrio = :P311_ID_DCLRCION_VGNCIA_FRMLRIO;',
'    :P311_CDGO_CLNTE:= :F_CDGO_CLNTE;',
'    ',
'    :P311_ID_DCLRCION := NULL;',
'    :P311_ID_DCLRCION_V2 := NULL;',
'end;'))
,p_process_error_message=>'Problemas al consultar el impuesto asociado al formulario, #SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P311_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8943818124100767)
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
'    into   :P311_NMBRES_RZN_SCIAL,',
'           :P311_TPO_IDENTIFICACION,',
'           :P311_IDENTIFICACION,',
'           :P311_DRCCION_NTFCCION,',
'           :P311_TELEFONO,',
'           :P311_DEPARTAMENTO,',
'           :P311_MUNICIPIO,',
'           :P311_CORREO_ELECTRONICO           ',
'    from v_si_i_sujetos_impuesto a',
'    join si_i_personas    b   on  a.id_sjto_impsto = b.id_sjto_impsto',
'    where a.IDNTFCCION_SJTO = :P311_IDNTFCCION',
'    and a.id_impsto         = :P311_ID_IMPSTO;',
'    ',
'     :P311_DIGITO_VERIFICACION := PKG_GI_DECLARACIONES_FUNCIONES.FNC_CA_DIGITO_VERIFICACION(P_IDENTIFICACION =>:P311_IDENTIFICACION);',
'    ',
'    :P311_CLCLO_CNCPTO_ANT_INTRIA_CRCIO  := 0;',
'    :P311_CLCLO_ANTERIOR_AVISOS_TBLRS  := 0;',
'    :P311_CLCLO_CNCPTO_ANT_STSA_BMRL   := 0;',
'    :P311_TOTAL_SALDO_FAVOR            := 0;',
'    :P311_CLCLO_CNCPTO_ANT_STSA_SGRD   := 0;',
'    :P311_INTERESES_MORA_PGO_ANTERIOR := 0;',
'    ',
'end;'))
,p_process_error_message=>unistr('Problemas al consultar la informaci\00F3n asociada al contribuyente, #SQLERRM_TEXT#')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P311_IDNTFCCION'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8945084301100768)
,p_process_sequence=>70
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
 p_id=>wwv_flow_api.id(8942665218100766)
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
'    --:P311_OPCION_DE_USO := ''DIN'';',
'    select pkg_gi_declaraciones_funciones.fnc_co_declaracion(p_id_dclrcion_vgncia_frmlrio => :P311_ID_DCLRCION_VGNCIA_FRMLRIO,',
'                                                             p_idntfccion                 => :P311_IDNTFCCION)',
'      into v_id_dclrcion_crrccion',
'      from dual;',
'     ',
'    if  v_id_dclrcion_crrccion > 0 then',
'       ',
'            :P311_CLCLO_DCLRCION_CRRCCION := v_id_dclrcion_crrccion;',
'',
'            select nmro_cnsctvo',
'              into v_nmro_cnsctvo',
'              from gi_g_declaraciones',
'             where id_dclrcion = :P311_CLCLO_DCLRCION_CRRCCION;',
'',
'           :P311_NMRO_DCLRCION_ANTRIOR := v_nmro_cnsctvo;',
'           --:P311_OPCION_DE_USO := ''DCO'';',
'        else',
'        ',
'           :P311_CLCLO_DCLRCION_CRRCCION := 0;',
'           :P311_NMRO_DCLRCION_ANTRIOR := 0;',
'           ',
'        end if;',
'        ',
'         if :P311_CLCLO_DCLRCION_CRRCCION > 0  and :P311_OPCION_DE_USO = ''DIN'' then',
'                :P311_OPCION_DE_USO := ''DCO'';',
'        elsif :P311_CLCLO_DCLRCION_CRRCCION = 0  and :P311_OPCION_DE_USO = ''DCO'' then',
'                :P311_OPCION_DE_USO := ''DIN'';',
'        end if;',
'    ',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P311_IDNTFCCION is not null and :P311_ID_DCLRCION_VGNCIA_FRMLRIO is not null'
,p_process_when_type=>'SQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8942262200100765)
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
'    v_json_actvdds:= null;',
'        ',
'    v_json_actvdds := pkg_gi_declaraciones_utlddes.fnc_co_cncptos_antriores(p_id_dclrcion => :P311_CLCLO_DCLRCION_CRRCCION);',
'    ',
'    if v_json_actvdds  <> ''{"CONCEPTOS":null}'' then     ',
'        WITH extracted_data AS (',
'        SELECT',
'            nvl(jt.P311_CONCEPTO_INDUSTRIA_COMERCIO, ''0'') AS P311_CONCEPTO_INDUSTRIA_COMERCIO,',
'            nvl(jt.P311_CONCEPTO_AVISOS_TABLEROS, ''0'') AS P311_CONCEPTO_AVISOS_TABLEROS,',
'            nvl(jt.P311_CNCPTO_SBRTSA_BMBRL, ''0'') AS P311_CNCPTO_SBRTSA_BMBRL,',
'            nvl(jt.P311_TOTAL_SALDO_FAVOR, ''0'') AS P311_TOTAL_SALDO_FAVOR,',
'            nvl(jt.P311_CNCPTO_SBRTSA_SGRDD, ''0'') AS P311_CNCPTO_SBRTSA_SGRDD,',
'            nvl(jt.P311_ANTICIPO_ANIO_SIGUIENTE, ''0'') AS P311_ANTICIPO_ANIO_SIGUIENTE,',
'            nvl(jt.P311_INTERESES_MORA_PGO_ANTERIOR, ''0'') AS P311_INTERESES_MORA_PGO_ANTERIOR            ',
'        FROM JSON_TABLE(',
'            v_json_actvdds,',
'            ''$.CONCEPTOS[*]''',
'            COLUMNS (',
'                P311_CONCEPTO_INDUSTRIA_COMERCIO VARCHAR2(50) PATH ''$.P311_CONCEPTO_INDUSTRIA_COMERCIO'',',
'                P311_CONCEPTO_AVISOS_TABLEROS VARCHAR2(50) PATH ''$.P311_CONCEPTO_AVISOS_TABLEROS'',',
'                P311_CNCPTO_SBRTSA_BMBRL VARCHAR2(50) PATH ''$.P311_CNCPTO_SBRTSA_BMBRL'',',
'                P311_TOTAL_SALDO_FAVOR VARCHAR2(50) PATH ''$.P311_TOTAL_SALDO_FAVOR'',',
'                P311_CNCPTO_SBRTSA_SGRDD VARCHAR2(50) PATH ''$.P311_CNCPTO_SBRTSA_SGRDD'',',
'                P311_ANTICIPO_ANIO_SIGUIENTE    VARCHAR2(50) PATH ''$.P311_ANTICIPO_ANIO_SIGUIENTE'',',
'                P311_INTERESES_MORA_PGO_ANTERIOR  VARCHAR2(50) PATH ''$.P311_INTERESES_MORA''',
'                )',
'            ) jt',
'        )',
'        SELECT',
'            MAX(P311_CONCEPTO_INDUSTRIA_COMERCIO) AS CNCPTO_INDSTRIA_CMRCIO,',
'            MAX(P311_CONCEPTO_AVISOS_TABLEROS) AS CNCPTO_AVSOS_TBLROS,',
'            MAX(P311_CNCPTO_SBRTSA_BMBRL) AS CNCPTO_SBRTSA_BMBRIL,',
'            MAX(P311_TOTAL_SALDO_FAVOR) AS TTL_SLDO_FVOR,',
'            MAX(P311_CNCPTO_SBRTSA_SGRDD) AS CNCPTO_SBRTSA_SGRDAD,',
'            MAX(P311_INTERESES_MORA_PGO_ANTERIOR) AS INTRSES_MRA_ANT',
'           -- MAX(P311_ANTICIPO_ANIO_SIGUIENTE) AS ANTCPO_ANIO_SGNTE',
'        into ',
'            :P311_CLCLO_CNCPTO_ANT_INTRIA_CRCIO,',
'            :P311_CLCLO_ANTERIOR_AVISOS_TBLRS,',
'            :P311_CLCLO_CNCPTO_ANT_STSA_BMRL,',
'            :P311_TOTAL_SALDO_FAVOR,',
'            :P311_CLCLO_CNCPTO_ANT_STSA_SGRD,',
'            :P311_INTERESES_MORA_PGO_ANTERIOR',
'           -- :P311_MENS_ANTCPO_LIQDDO_ANIO_ANTR',
'',
'        FROM extracted_data;',
'     else ',
'        :P311_CLCLO_CNCPTO_ANT_INTRIA_CRCIO  := null;',
'        :P311_CLCLO_ANTERIOR_AVISOS_TBLRS    := null;',
'        :P311_CLCLO_CNCPTO_ANT_STSA_BMRL     := null;',
'        :P311_TOTAL_SALDO_FAVOR              := null;',
'        :P311_CLCLO_CNCPTO_ANT_STSA_SGRD     := null;',
'        :P311_INTERESES_MORA_PGO_ANTERIOR    := null;',
'   end if;',
'    ',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P311_CLCLO_DCLRCION_CRRCCION > 0'
,p_process_when_type=>'SQL_EXPRESSION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8943419665100767)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_validarSujetoTributo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_prmtros        varchar2(2000) := ''validaSujetoTributo:''|| :F_CDGO_CLNTE ||'':''|| :P311_ID_DCLRCION_VGNCIA_FRMLRIO ||'':'' || :P311_IDNTFCCION;',
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
 p_id=>wwv_flow_api.id(8945440105100768)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_calculo_item'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_prmtros        varchar2(2000) := ''validaSujetoTributo:''|| :F_CDGO_CLNTE ||'':''|| :P311_ID_DCLRCION_VGNCIA_FRMLRIO ||'':'' || :P311_IDNTFCCION;',
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
'                                                                                    p_id_dclrcion_vgncia_frmlrio   => :P311_ID_DCLRCION_VGNCIA_FRMLRIO,',
'                                                                                    p_idntfccion                   => :P311_IDNTFCCION,',
'                                                                                    p_id_dclrcion_crrccion         => :P311_CLCLO_DCLRCION_CRRCCION,',
'                                                                                    p_id_sjto_tpo                  => :P311_CLASIFICACION,',
'                                                                                    p_fcha_pryccion                => :P311_FCHA_MAXIMA_PRSNTCION,--',
'                                                                                    p_cdgo_sncion_tpo              => :P311_TIPO_SANCION,--''EXT'',',
'                                                                                    p_cdgo_dclrcion_uso            => :P311_OPCION_DE_USO, --''DIN'',',
'                                                                                    p_id_dclrcion_incial           => :P311_CLCLO_DCLRCION_CRRCCION,',
'                                                                                    p_impsto_crgo                  => :P311_TOTAL_SALDO_CARGO,--:P310_TOTAL_IMPUESTO_CARGO,',
'                                                                                    p_ingrsos_brtos                => 0,',
'                                                                                    p_saldo_favor                  => v_vlor_sldo_fvor,--:P310_TOTAL_SALDO_FAVOR,',
'                                                                                    p_vlor_ttal                    => v_vlor_ttal,--:P310_TOTAL_SALDO_CARGO,',
'                                                                                    p_json                         => v_json);',
'',
'',
'               -- insert into muerto (v_001,c_001,t_001)values(''JSON: '',v_json,sysdate); commit;',
'                insert into muerto (v_001,c_001,t_001)values(''v_json_result: ''||:P311_FCHA_MAXIMA_PRSNTCION ,v_json_result,sysdate); commit;',
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
 p_id=>wwv_flow_api.id(8941431749100765)
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
'         if :P311_ACTIVIDAD is null then ',
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
'                   and a.n003            = :P311_ACTIVIDAD',
'                   group by a.n003, a.c001;',
'                   ',
'                    ',
'              exception ',
'                  when no_data_found then',
'                        begin',
'                            apex_collection.add_member(p_collection_name 	=> ''ACTIVIDADES''',
'                                                     , p_n003               => :P311_ACTIVIDAD',
'                                                     , p_n004               => :P311_TARIFA',
'                                                     , p_n005               => :P311_INGRESOS_GRAVADOS',
'                                                     , p_n001				=> :P311_VLOR_IPSTO',
'                                                     , p_c001               => :P311_ACTIVIDAD_DESCRIPCION);',
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
'            apex_json.open_object;',
'            if :P311_ACTIVIDAD is null then            ',
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
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8941885797100765)
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
'        and seq_id = :P311_SEQ_ID;',
'',
'        if v_cntdad > 0 then',
'            APEX_COLLECTION.DELETE_MEMBER(p_collection_name => ''ACTIVIDADES'',',
'                                          p_seq => :P311_SEQ_ID); ',
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
 p_id=>wwv_flow_api.id(8945836283100769)
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
