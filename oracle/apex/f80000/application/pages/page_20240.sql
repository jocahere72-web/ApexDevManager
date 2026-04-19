prompt --application/pages/page_20240
begin
wwv_flow_api.create_page(
 p_id=>2024001
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Proceso Selecci\00F3n Lote Persuasivo')
,p_step_title=>unistr('Proceso Selecci\00F3n Lote Persuasivo')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1',
'#APP_IMAGES#xlsx.min.js',
'#APP_IMAGES#FileSaver.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var json;',
'',
'// Variable global para manejar el debounce',
'let debounceTimer;',
'',
'function validar_sel(valid) {',
'    clearTimeout(debounceTimer); // Limpiar el timer anterior',
'    debounceTimer = setTimeout(() => {',
unistr('        console.log("Acci\00F3n din\00E1mica ejecutada (debounce):", new Date());'),
'',
'        const region = apex.region("simu_sujetos");',
'        if (!region) {',
unistr('            console.error("No se encontr\00F3 la regi\00F3n simu_sujetos.");'),
'            return;',
'        }',
'',
'        const view = region.widget().interactiveGrid("getViews", "grid");',
'        if (!view) {',
'            console.error("No se pudo obtener la vista del Interactive Grid.");',
'            return;',
'        }',
'',
'        const model = view.model;',
'        const records = view.view$.grid("getSelectedRecords");',
'',
'        const filteredRecords = records.filter(record => model.getValue(record, "INDCDOR_PRCSDO").v === ''N'');',
'',
'        const json = filteredRecords.map(record => ({',
'            ID_PRCSOS_SMU_SJTO: model.getValue(record, "ID_PRCSOS_SMU_SJTO").trim(),',
'            ID_SJTO: model.getValue(record, "ID_SJTO").trim(),',
'            VLOR_TTAL_DDA: model.getValue(record, "VLOR_TTAL_DDA").trim(),',
'            IDNTFCCION: model.getValue(record, "IDNTFCCION").trim(),',
'            ID_PRCSOS_SMU_LTE: model.getValue(record, "ID_PRCSOS_SMU_LTE"),',
'            ID_PRCSO_TPO: model.getValue(record, "ID_PRCSO_TPO"),',
'            ID_SJTO_IMPSTO: model.getValue(record, "ID_SJTO_IMPSTO"),',
'            ID_IMPSTO: model.getValue(record, "ID_IMPSTO"),',
'            ID_IMPSTO_SBMPSTO: model.getValue(record, "ID_IMPSTO_SBMPSTO")',
'        }));',
'    ',
'            window.localStorage.setItem(''jsonCobro'', json.length > 0 ? JSON.stringify(json) : '''');',
'            console.log(''Json: '',JSON.stringify(json));',
'',
'        if (json.length > 0) {',
'            try {',
'                apex.server.process("registrarJson", {',
'                    f01: JSON.stringify(json),',
'                    pageItems: "#F_CDGO_CLNTE, #F_ID_USRIO"',
'                }, {',
'                    success: function (data) {',
'                        if (data.o_cdgo_rspsta !== 0) {',
'                            apex.message.clearErrors();',
'                            apex.message.showErrors([{',
'                                type: "error",',
'                                location: "page",',
'                                message: data.o_mnsje_rspsta,',
'                                unsafe: false',
'                            }]);',
'                        } else {',
'              //              window.localStorage.clear();',
'                            apex.item("P2024001_SEL_TDOS").setValue("N");',
'                        }',
'                    }',
'                });',
'            } catch (e) {',
'                apex.message.clearErrors();',
'                apex.message.showErrors([{',
'                    type: "error",',
'                    location: "page",',
'                    message: `Error al seleccionar los actos: ${e}`,',
'                    unsafe: false',
'                }]);',
'            }',
'        }',
'',
'        const isSingleRecord = json.length === 1;',
'        const isMassive = json.length > 1;',
'',
'        if (isSingleRecord) {',
'            apex.item("BTN_RSPNSBLE").show();',
'        } else {',
'            apex.item("BTN_RSPNSBLE").hide();',
'        }',
'',
'        if (filteredRecords.length > 0) {',
'            if ($v(''P2024001_ID_PRCSO_TPO'') === "2") {',
'                apex.item("BTN_INCIAR_PRCSO").show();',
'                apex.item("BTN_INCIAR_CBRO_PRSSVO").hide();',
'            } else {',
'                apex.item("BTN_INCIAR_PRCSO").hide();',
'                apex.item("BTN_INCIAR_CBRO_PRSSVO").show();',
'            }',
'            apex.item("BTN_ELMNAR_SJTO").show();',
'        } else {',
'            apex.item("BTN_INCIAR_PRCSO").hide();',
'            apex.item("BTN_INCIAR_CBRO_PRSSVO").hide();',
'            apex.item("BTN_ELMNAR_SJTO").hide();',
'        }',
'',
'        $s(''P2024001_PRCSO_SMU_SJTO'', isSingleRecord ? json[0]["ID_PRCSOS_SMU_SJTO"] : '''');',
'        $s(''P2024001_MASIVO'', isMassive ? ''S'' : ''N'');',
'',
'        region.widget().interactiveGrid("setSelectedRecords", filteredRecords);',
'    }, 200); // Tiempo de espera para consolidar eventos',
'}',
'',
'function seleccionarTodos(e, btn, grid, data) {    ',
'',
'    const json = data.filter(f => f.INDCDOR_PRCSDO.v === ''N'').map(m => ({',
'            ID_PRCSOS_SMU_SJTO: m.ID_PRCSOS_SMU_SJTO,',
'            ID_SJTO: m.ID_SJTO,',
'            VLOR_TTAL_DDA: m.VLOR_TTAL_DDA,',
'            IDNTFCCION: m.IDNTFCCION,',
'            ID_PRCSOS_SMU_LTE: m.ID_PRCSOS_SMU_LTE,',
'            ID_PRCSO_TPO: m.ID_PRCSO_TPO,',
'            ID_SJTO_IMPSTO: m.ID_SJTO_IMPSTO,',
'            ID_IMPSTO: m.ID_IMPSTO,',
'            ID_IMPSTO_SBMPSTO: m.ID_IMPSTO_SBMPSTO',
'        }));',
'',
'    if (!json.length) {',
'        apex.message.showErrors([{ ',
'            type: "error", ',
'            location: "page", ',
unistr('            message: "No hay datos v\00E1lidos para procesar.", '),
'            unsafe: false ',
'        }]);',
'        return;',
'    }',
'',
'    window.localStorage.setItem(''jsonCobro'', JSON.stringify(json));',
'    ',
'    try{',
'        apex.server.process("setearItem",{',
'            f01: ''S''',
'        },{',
'            success: function(data){',
'                if(data.o_cdgo_rspsta != 0){',
'                    apex.message.showerrors([{',
'                        type: "error",',
'                        location: "page",',
unistr('                        message: "error al setaera el \00EDtem",'),
'                        unsafe: false',
'                    }]);',
'                }else{',
unistr('                    console.log(''\00EDtem: '',apex.item("P2024001_SEL_TDOS").getValue());'),
'                }',
'            }',
'        }',
'        );',
'    }catch(e){',
'        console.log(''Exception: '',e);',
'    }',
'',
'   if (apex.item("P2024001_SEL_TDOS").getValue() === ''S''){       ',
'       apex.server.process("registrarJson", {',
'        f01: JSON.stringify(json),',
'        pageItems: "#F_CDGO_CLNTE, #F_ID_USRIO"',
'    }, {',
'        success: function(data) {',
'            if (data.o_cdgo_rspsta !== 0) {',
'                apex.message.showErrors([{',
'                    type: "error",',
'                    location: "page",',
'                    message: data.o_mnsje_rspsta,',
'                    unsafe: false',
'                }]);',
'            } else {',
'                window.localStorage.clear();',
'                console.log(''Respuesta: '', data.o_mnsje_rspsta);',
'            }',
'        },',
'        error: function(error) {',
'            console.error("Error en registrarJson:", error);',
'            apex.message.showErrors([{ ',
'                type: "error", ',
'                location: "page", ',
'                message: "Error al registrar los datos en el servidor.", ',
'                unsafe: false ',
'            }]);',
'        }',
'    });',
'   }',
'}',
'',
'',
'$(document).on("scroll",function() {',
'  apex.navigation.dialog.close(true);',
'});',
'',
'const refrescarSujetos = () => {',
'    var region = apex.region( "simu_sujetos" );',
'    region.refresh();',
'}',
'',
'const iniciarProcesoPersuasivo = function(){    ',
'    ',
'    var plantilla = apex.item("P2024001_ID_PLNTLLA").getValue();',
'    console.log(''Plantilla: '',plantilla);',
'    if (plantilla === ""){',
'        apex.message.alert(''No has seleccionado la plantilla'');',
'    }else{',
unistr('        apex.message.confirm( "\00BFDesea iniciar proceso de cobro persuasivo para los dedudores seleccionados?", async function( okPressed ) { '),
'            if( okPressed ) {',
'                var json = localStorage.getItem(''jsonCobro'');',
'                console.log(''json :'' ,json);',
'                var popup = apex.widget.waitPopup();',
'                await apex.server.process(',
'                                "Iniciar_Proceso_Persuasivo",',
'                                {  ',
'                                    f01: json,',
'                                    pageItems: "#F_CDGO_CLNTE, #P2024001_ID_PRCSO_SMU_LOTE, #F_ID_USRIO, #P2024001_ID_PLNTLLA"',
'                                },',
'                                {',
'                                    success: function(pData){',
'                                        popup.remove();',
'                                        if (pData.o_cdgo_rspsta != 0){ ',
'                                            apex.message.clearErrors();',
'                                            apex.message.alert(pData.o_mnsje_rspsta);',
'                                        }else{',
unistr('                                            apex.message.alert("Proceso se realizar\00E1 en segundo plano, al terminar ser\00E1 notificado para imprimir los documentos!", function(){'),
'                                                if (okPressed){',
'                                                    apex.submit();',
'                                                }',
'                                            });                                            ',
'                                        }',
'                                    }',
'                                }',
'                            );',
'                        } // Fin if',
'                    });',
'    }    ',
'}',
'',
'const fnConsultarSujetosExcel = function(p_id_lote){',
'    ',
'    var popup = apex.widget.waitPopup();',
'    ',
'    apex.server.process(',
'            "Obtener_informacion_Excel",',
'            {    ',
'                 x01: p_id_lote',
'            },',
'            {',
'                //dataType: ''text'',',
'                success: function( pData ){',
'',
'                    popup.remove();',
'                    ',
'                    var wb = XLSX.utils.book_new();',
'                        ',
'                    wb.Props = {',
'                            Title: "Candidatos para proceso de cobro juridico",',
'                            Subject: "",',
'                            Author: "Equipo GENESYS",',
'                            CreatedDate: new Date(2017,12,19)',
'                    };',
'                    ',
'                    //Parseamos los candidatos que se devuelven del lote',
'                    var v_candidatos = JSON.parse(pData.o_json_cnddto);',
'                        ',
'                    wb.SheetNames.push("Candidatos");',
'                    //var ws_data = [[''hello'' , ''world'']];',
'                    //var ws = XLSX.utils.aoa_to_sheet(ws_data);',
'                    var ws = XLSX.utils.json_to_sheet(v_candidatos);',
'',
'',
'                    wb.Sheets["Candidatos"] = ws;',
'',
'                    /*',
'                        const content = XLSX.write(book, { type: ''buffer'', bookType: ''xlsx'', bookSST: false });',
'                                    fs.writeFileSync("/path/to/folder/test-write.xlsx", content);',
'                    */',
'',
'                    var wbout = XLSX.write(wb, { type: ''binary'', bookType: ''xls'', bookSST: false });',
'',
'',
'                    function s2ab(s) {',
'',
'                            var buf = new ArrayBuffer(s.length);',
'                            var view = new Uint8Array(buf);',
'                            for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF;',
'                            return buf;',
'',
'                    }',
'                        ',
'                        ',
'                    ',
'                    // Descarga el archivo',
'                    saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), pData.o_file_name);',
'                    ',
'                    ',
'                  ',
'                }',
'            }',
'        );',
'}',
'',
'const merge_oficios_x_resolucion = async () => {',
'',
'  console.time(''loop'');',
'  let popup = apex.widget.waitPopup();',
'  let zip = new JSZip();',
'  let v_json = localStorage.getItem(''jsonResolucionesEmbargoOficio'');',
'  let contentJson = JSON.parse(v_json)',
'  let array = JSON.parse(v_json);',
'  let cantidad = array.length;',
'  let contador = 0;',
'    ',
'  if (cantidad > 0) {',
'    let i = 0;',
'    let respData = [];',
'',
'    //Instanciar variable de tipo PDFDocument.',
'    let PDFDocument = PDFLib.PDFDocument;',
'    ',
'    //Crear nuevo PDF',
'    const mergedPdf = await PDFDocument.create();',
'      ',
'    console.log(''array[''+i+''].ID_ER  = ''+ array[i].ID_ER );',
'      ',
'    const { dataOficio } = await peticionServerProcess(''Valida_Resoluciones'', { f01: v_json });',
'    while (i < dataOficio.length){  ',
'    console.log(''dataOficio: ''+JSON.stringify(dataOficio)+''/''+dataOficio.length);',
'    const { data } = await peticionServerProcess(''prc_co_documentos_msvos'', { f01: JSON.stringify(dataOficio[i]) });',
'        let j = 0;',
'        ',
'        while (j < data.length){',
'            console.log(''while oficios: ''+JSON.stringify(dataOficio[j]));',
unistr('            //Data de los actos pertenecientes a los oficios de cada resoluci\00F3n de embargo seleccionada.'),
'            console.log(''Data: ''+data);',
'            ',
'            //Convertir PDF de la data en base64.',
'            let tem = await convertBase64ToFile(`data:application/pdf;base64,${data[j].fileBlob}`, ''Documento'');',
'',
'            //Leer documento en base64',
'            const document = await readFileAsync(tem);',
'            const document2 = await PDFDocument.load(document);',
'',
'            let copiedPages = await mergedPdf.copyPages(document2, document2.getPageIndices());',
'            copiedPages.forEach((page) => mergedPdf.addPage(page));',
'',
'            respData = respData.concat(data);',
'            j++;',
'        }',
'        i++;',
'    }',
'          ',
'    const mergedPdfFile = await mergedPdf.save();',
'    zip.file(''Oficios_de_embargo.pdf'', mergedPdfFile);',
'    zip.generateAsync({ type: "blob" }).then(mergedPdfFile => {',
'      download(mergedPdfFile, `Oficios_de_embargo.zip`, ''application/zip'');',
'    });',
'    console.timeEnd(''loop''); // Muestra por consola: "loop: 63ms"',
'  } else {',
'    alert(''No existen documentos asociados.'')',
'  }',
'  popup.remove();',
'}',
'',
'function validacion() {',
'    ',
'    var plantilla = apex.item("P2024001_ID_PLNTLLA").getValue();',
'    ',
'    if ( plantilla === "" ) {',
'        apex.message.alert(''No ha seleccionado la plantilla'');',
'        return false; ',
'    } else {',
'        return true; ',
'    }',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//validar_sel();',
'//apex.region("simu_sujetos").widget().interactiveGrid("setSelectedRecords", []);',
'apex.item("P2024001_SEL_TDOS").setValue(''N'');',
'',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#BTN_ABRIR_MODAL_INICIAR_PRCSO{',
'    display: none;',
'}'))
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ZGALINDO'
,p_last_upd_yyyymmddhh24miss=>'20260327165108'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(44078592415701377)
,p_plug_name=>'Tabular'
,p_region_name=>'tab_lotes'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(17363723095919377)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4100707410148601)
,p_plug_name=>'Traza'
,p_region_name=>'traza'
,p_parent_plug_id=>wwv_flow_api.id(44078592415701377)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from v_cb_g_procesos_persuasivo_traza',
'where id_prcsos_smu_lte = :P2024001_ID_PRCSO_SMU_LOTE'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(213286960936830719)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4100993669148603)
,p_name=>'ID_PRCSOS_PRSSVO_TRZA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSOS_PRSSVO_TRZA'
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
 p_id=>wwv_flow_api.id(4101087014148604)
,p_name=>'ID_PRCSOS_SMU_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSOS_SMU_SJTO'
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
,p_parent_column_id=>wwv_flow_api.id(4087871870850405)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4101154888148605)
,p_name=>'ID_PRCSOS_SMU_LTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSOS_SMU_LTE'
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
 p_id=>wwv_flow_api.id(4101241008148606)
,p_name=>'ID_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO'
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
 p_id=>wwv_flow_api.id(4101325613148607)
,p_name=>'PRCSOS_PERSSVO_TRZA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCSOS_PERSSVO_TRZA'
,p_data_type=>'CLOB'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Observaciones'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(4101464239148608)
,p_name=>'FCHA_PRCSO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_PRCSO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(4101526325148609)
,p_name=>'ID_USRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_USRIO'
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
 p_id=>wwv_flow_api.id(4187159356203601)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Idntfccion Sjto'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(4187219129203602)
,p_name=>'NMBRE_TRCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TRCRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nmbre Trcro'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(4187328877203603)
,p_name=>'ID_PRCSOS_PRSSVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSOS_PRSSVO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Prcsos Prssvo'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(4187455534203604)
,p_name=>'ID_PRCSO_PRSSVO_LTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSO_PRSSVO_LTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Prcso Prssvo Lte'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(4100834755148602)
,p_internal_uid=>4100834755148602
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
 p_id=>wwv_flow_api.id(4106339457157816)
,p_interactive_grid_id=>wwv_flow_api.id(4100834755148602)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(4106436779157816)
,p_report_id=>wwv_flow_api.id(4106339457157816)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4106955483157817)
,p_view_id=>wwv_flow_api.id(4106436779157816)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(4100993669148603)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4107436720157819)
,p_view_id=>wwv_flow_api.id(4106436779157816)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(4101087014148604)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4107961161157820)
,p_view_id=>wwv_flow_api.id(4106436779157816)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(4101154888148605)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4108446262157822)
,p_view_id=>wwv_flow_api.id(4106436779157816)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(4101241008148606)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4108973430157823)
,p_view_id=>wwv_flow_api.id(4106436779157816)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(4101325613148607)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4109448148157825)
,p_view_id=>wwv_flow_api.id(4106436779157816)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(4101464239148608)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4109970229157826)
,p_view_id=>wwv_flow_api.id(4106436779157816)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(4101526325148609)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4193110790207953)
,p_view_id=>wwv_flow_api.id(4106436779157816)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(4187159356203601)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4193629637207954)
,p_view_id=>wwv_flow_api.id(4106436779157816)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(4187219129203602)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4194147615207955)
,p_view_id=>wwv_flow_api.id(4106436779157816)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(4187328877203603)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4194623074207957)
,p_view_id=>wwv_flow_api.id(4106436779157816)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(4187455534203604)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(34008718756655772)
,p_plug_name=>'Responsables'
,p_region_name=>'sujetos_responsables'
,p_parent_plug_id=>wwv_flow_api.id(44078592415701377)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_prcsos_smu_rspnsble,',
'       a.id_prcsos_smu_sjto,',
'       a.idntfccion,',
'       b.dscrpcion_idntfccion_tpo,',
'       a.nmbre_cmplto,',
'       a.prncpal_s_n,',
'       a.drccion_ntfccion,',
'       a.email',
'  from v_cb_g_procesos_simu_rspnsble a',
'  join df_s_identificaciones_tipo b',
'    on b.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo;'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(213286960936830719)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3190349836159001)
,p_name=>'EMAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMAIL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Email'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>320
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
 p_id=>wwv_flow_api.id(4224596651846301)
,p_name=>'DRCCION_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DRCCION_NTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Direcci\00F3n Notificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(34010680738655791)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
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
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(34010727483655792)
,p_name=>'DSCRPCION_IDNTFCCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_IDNTFCCION_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Tipo Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(34010898288655794)
,p_name=>'PRNCPAL_S_N'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRNCPAL_S_N'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(34012406362655809)
,p_name=>'Editar'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton">Editar',
'<span class="fa fa-pencil"></span>',
'</button>'))
,p_link_target=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:RP,9:P9_ID_PRCSOS_SMU_RSPNSBLE,P9_ID_PRCSOS_SMU_SJTO:&ID_PRCSOS_SMU_RSPNSBLE.,&ID_PRCSOS_SMU_SJTO.'
,p_static_id=>'editar_rspnsble'
,p_use_as_row_header=>true
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(39790407584923274)
,p_name=>'ID_PRCSOS_SMU_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSOS_SMU_RSPNSBLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(39790550830923275)
,p_name=>'ID_PRCSOS_SMU_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSOS_SMU_SJTO'
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
,p_parent_column_id=>wwv_flow_api.id(39790333729923273)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(142209954394126097)
,p_name=>'NMBRE_CMPLTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_CMPLTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>803
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
 p_id=>wwv_flow_api.id(34010350118655788)
,p_internal_uid=>34010350118655788
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>false
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>false
,p_no_data_found_message=>'seleccione un registro de la cartera'
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    return options;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(34042099653796851)
,p_interactive_grid_id=>wwv_flow_api.id(34010350118655788)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(34042268520796851)
,p_report_id=>wwv_flow_api.id(34042099653796851)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3196253441159122)
,p_view_id=>wwv_flow_api.id(34042268520796851)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(3190349836159001)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4230581268849558)
,p_view_id=>wwv_flow_api.id(34042268520796851)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(4224596651846301)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(34043727631796855)
,p_view_id=>wwv_flow_api.id(34042268520796851)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(34010680738655791)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>97
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(34044190750796856)
,p_view_id=>wwv_flow_api.id(34042268520796851)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(34010727483655792)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(34045205767796858)
,p_view_id=>wwv_flow_api.id(34042268520796851)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(34010898288655794)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(34086370210371418)
,p_view_id=>wwv_flow_api.id(34042268520796851)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(34012406362655809)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>77
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(39817878182002265)
,p_view_id=>wwv_flow_api.id(34042268520796851)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(39790407584923274)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(39818357613002266)
,p_view_id=>wwv_flow_api.id(34042268520796851)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(39790550830923275)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(143242166603232685)
,p_view_id=>wwv_flow_api.id(34042268520796851)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(142209954394126097)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(37972717090757369)
,p_plug_name=>'Cartera'
,p_parent_plug_id=>wwv_flow_api.id(44078592415701377)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.id_prcsos_smu_sjto,',
'       a.vgncia,',
'       b.prdo,',
'       c.dscrpcion,',
'       a.vlor_cptal,',
'       a.vlor_intres ',
'  from cb_g_procesos_smu_mvmnto a',
'  join v_gf_g_cartera_x_concepto b  on b.id_sjto_impsto = a.id_sjto_impsto',
'                                       and b.cdgo_mvnt_fncro_estdo = ''NO''',
'  join df_i_conceptos c     on c.id_cncpto = a.id_cncpto and c.id_cncpto = b.id_cncpto',
'  join df_i_periodos  d     on d.id_prdo = a.id_prdo and d.id_prdo = b.id_prdo',
'  where b.vlor_sldo_cptal > 0',
'    and not exists (select 1 from  cb_g_procesos_jrdco_mvmnto e',
'                   where  e.id_sjto_impsto = a.id_sjto_impsto',
'                   and e.vgncia = a.vgncia',
'                   and e.id_prdo = a.id_prdo',
'                   and e.id_cncpto = a.id_cncpto)    ',
'',
'',
'',
'',
'',
'',
'',
'',
'/*',
'select a.id_prcsos_smu_sjto,',
'       a.vgncia,',
'       c.prdo,',
'       b.dscrpcion,',
'       a.vlor_cptal,',
'       a.vlor_intres ',
'  from cb_g_procesos_smu_mvmnto a',
'  join df_i_conceptos b ',
'    on b.id_cncpto = a.id_cncpto  ',
'  join df_i_periodos c',
'    on a.id_prdo = c.id_prdo ; ',
'    */'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(213286960936830719)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(37972999678757372)
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
 p_id=>wwv_flow_api.id(37973283337757374)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(37973351408757375)
,p_name=>'VLOR_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Saldo Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(37973475791757376)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Saldo Inter\00E9s')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(39790662196923276)
,p_name=>'ID_PRCSOS_SMU_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSOS_SMU_SJTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_parent_column_id=>wwv_flow_api.id(39790333729923273)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(39790707069923277)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Periodo'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(37972834489757370)
,p_internal_uid=>37972834489757370
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
 p_id=>wwv_flow_api.id(37978523186779173)
,p_interactive_grid_id=>wwv_flow_api.id(37972834489757370)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(37978641666779173)
,p_report_id=>wwv_flow_api.id(37978523186779173)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(37979650266779180)
,p_view_id=>wwv_flow_api.id(37978641666779173)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(37972999678757372)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>69
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(37980656595779184)
,p_view_id=>wwv_flow_api.id(37978641666779173)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(37973283337757374)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>178
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(37981110189779186)
,p_view_id=>wwv_flow_api.id(37978641666779173)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(37973351408757375)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>95
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(37981602101779188)
,p_view_id=>wwv_flow_api.id(37978641666779173)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(37973475791757376)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>98
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(39824673846018800)
,p_view_id=>wwv_flow_api.id(37978641666779173)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(39790662196923276)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(39952340584736923)
,p_view_id=>wwv_flow_api.id(37978641666779173)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(39790707069923277)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>65
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(44078803422701379)
,p_plug_name=>'Lotes'
,p_region_name=>'lotes'
,p_parent_plug_id=>wwv_flow_api.id(44078592415701377)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(213286960936830719)
,p_plug_name=>'Sujetos'
,p_region_name=>'simu_sujetos'
,p_parent_plug_id=>wwv_flow_api.id(44078803422701379)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select *',
'  from (select a.id_impsto,',
'               a.id_impsto_sbmpsto,',
'               a.id_prcsos_smu_sjto,',
'               replace(a.idntfccion, ''-'', '''') as idntfccion,',
'               a.drccion,',
'               a.vlor_ttal_dda,',
'               a.fcha_ingrso as fcha_ingrso,',
'               a.indcdor_prcsdo,',
'               a.id_sjto,',
'               b.id_sjto_impsto,',
'               decode(a.cdgo_orgn_sjto,',
'                      ''EX'',',
'                      ''EXISTENTE'',',
'                      ''INEXISTENTE(OTRAS FUENTES DE INFORMACION)'') as cdgo_orgn_sjto,',
'               a.id_prcso_tpo,',
'               a.id_prcsos_smu_lte,',
'              (select listagg( DISTINCT c.vgncia, '', '') within group (order by c.vgncia asc) ',
'               from genesys.cb_g_procesos_smu_mvmnto  c where   c.id_impsto = a.id_impsto',
'                     and c.id_impsto_sbmpsto = a.id_impsto_sbmpsto',
'                     and c.ID_PRCSOS_SMU_SJTO = a.ID_PRCSOS_SMU_SJTO) vgncias_prssvo',
'',
'        ',
'        /*,',
'               c.PRMER_NMBRE,',
'               c.IDNTFCCION as IDNTFCCION_rspnsble,',
'               c.EMAIL*/',
'          from v_cb_g_procesos_simu_sujeto a',
'          left join si_i_sujetos_impuesto b',
'            on a.id_sjto = b.id_sjto',
'            and a.id_impsto = b.id_impsto',
'          /*join cb_g_procesos_simu_rspnsble c',
'            on c.ID_PRCSOS_SMU_SJTO = a.ID_PRCSOS_SMU_SJTO*/',
'         where a.id_prcsos_smu_lte = :P2024001_ID_PRCSO_SMU_LOTE',
'           and a.actvo = ''S''',
'          -- and a.indcdor_prcsdo = ''N''',
'           and exists',
'         (select 1',
'                  from cb_g_procesos_smu_mvmnto m',
'                 where m.id_sjto_impsto = b.id_sjto_impsto',
'                   and m.id_prcsos_smu_sjto = a.id_prcsos_smu_sjto',
'                   and m.id_impsto = a.id_impsto',
'                   and m.id_impsto_sbmpsto = a.id_impsto_sbmpsto)',
'         order by a.id_prcsos_smu_sjto, a.id_sjto)',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3953632107905301)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3953796004905302)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4087472345850401)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
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
 p_id=>wwv_flow_api.id(4087578712850402)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
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
 p_id=>wwv_flow_api.id(4087626130850403)
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
 p_id=>wwv_flow_api.id(4087784094850404)
,p_name=>'ID_PRCSO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSO_TPO'
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
 p_id=>wwv_flow_api.id(4087871870850405)
,p_name=>'ID_PRCSOS_SMU_LTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSOS_SMU_LTE'
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
 p_id=>wwv_flow_api.id(28003389909885501)
,p_name=>'Responsables'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Responsables'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" >Ver Responsables<spanclass="fa fa-external-link-square"></span>',
'</button>'))
,p_link_target=>'f?p=&APP_ID.:167:&SESSION.::&DEBUG.:RP,167:P167_ID_INSTNCIA_FLJO,P167_ID_PRCSOS_SMU_SJTO:&ID_INSTNCIA_FLJO.,&ID_PRCSOS_SMU_SJTO.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(28422732306503101)
,p_name=>'Vigencias Persuasivos'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIAS_PRSSVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Vigencias Persuasivos'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(34013287303655817)
,p_name=>'VLOR_TTAL_DDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_DDA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Total Deuda'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(34013305544655818)
,p_name=>'FCHA_INGRSO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_INGRSO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha Registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(34994564545771872)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(36461645633071085)
,p_name=>'DRCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DRCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(37975802120757400)
,p_name=>'INDCDOR_PRCSDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_PRCSDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Procesado'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Si;S,No;N,Error;E'
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
 p_id=>wwv_flow_api.id(38909193773878475)
,p_name=>'ID_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO'
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
 p_id=>wwv_flow_api.id(39790333729923273)
,p_name=>'ID_PRCSOS_SMU_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSOS_SMU_SJTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'N'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(141779113405950474)
,p_name=>'CDGO_ORGN_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ORGN_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Origen del sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>41
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
 p_id=>wwv_flow_api.id(34009789603655783)
,p_internal_uid=>34009789603655783
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
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>800
,p_show_icon_view=>false
,p_show_detail_view=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'	config.initialSelection = false;',
'    return selectAll(config, {',
'        name: ''Seleccionar Todos'',',
'        action: seleccionarTodos',
'    }) ;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(34034615798758910)
,p_interactive_grid_id=>wwv_flow_api.id(34009789603655783)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>1000
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(34034771738758910)
,p_report_id=>wwv_flow_api.id(34034615798758910)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(2881013189397314)
,p_view_id=>wwv_flow_api.id(34034771738758910)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(36461645633071085)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>292
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3959654503905852)
,p_view_id=>wwv_flow_api.id(34034771738758910)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(3953632107905301)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4093496917850690)
,p_view_id=>wwv_flow_api.id(34034771738758910)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(4087472345850401)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4093939630850695)
,p_view_id=>wwv_flow_api.id(34034771738758910)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(4087578712850402)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4094444673850697)
,p_view_id=>wwv_flow_api.id(34034771738758910)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(4087626130850403)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4096612633910760)
,p_view_id=>wwv_flow_api.id(34034771738758910)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(4087784094850404)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4097924857952363)
,p_view_id=>wwv_flow_api.id(34034771738758910)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(4087871870850405)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28008619399908353)
,p_view_id=>wwv_flow_api.id(34034771738758910)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(28003389909885501)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28428861127503297)
,p_view_id=>wwv_flow_api.id(34034771738758910)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(28422732306503101)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(34277763208041870)
,p_view_id=>wwv_flow_api.id(34034771738758910)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(34013287303655817)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>251
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(34278268332041871)
,p_view_id=>wwv_flow_api.id(34034771738758910)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(34013305544655818)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>122
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35005825417089349)
,p_view_id=>wwv_flow_api.id(34034771738758910)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(34994564545771872)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>281
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(38134530885268498)
,p_view_id=>wwv_flow_api.id(34034771738758910)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(37975802120757400)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(39032248921188107)
,p_view_id=>wwv_flow_api.id(34034771738758910)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(38909193773878475)
,p_is_visible=>true
,p_is_frozen=>false
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(39814762996983623)
,p_view_id=>wwv_flow_api.id(34034771738758910)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(39790333729923273)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(141812809464074706)
,p_view_id=>wwv_flow_api.id(34034771738758910)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(141779113405950474)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(213425608751634301)
,p_plug_name=>'Lotes'
,p_region_name=>'lotes'
,p_parent_plug_id=>wwv_flow_api.id(44078803422701379)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--stacked:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>'<div id="downloadLink"></div>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(213425362031634299)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_api.id(221935146034148784)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i>',
'    </b>',
'</h5>',
'<i>',
unistr('<b><i>1.</i></b>Esta funcionalidad permite la gesti\00F3n de lotes de los procesos jur\00EDdicos.<br><br>'),
'',
unistr('<b><i>2.</i></b>Permite crear un nuevo lote de selecci\00F3n donde se podr\00E1 incluir los candidatos/sujetos con cartera apta para realizar proceso de cobro.<br><br>'),
'',
unistr('<b><i>3.</i></b>Al escoger un sujeto o registro del lote se cargara la cartera y los responsables en la pesta\00F1a "Responsables & Cartera"<br><br>'),
'',
unistr('<b><i>4.</i></b>En la pesta\00F1a de "Responsables & Cartera" es posible actualizar la informaci\00F3n de los responsables del candidato/sujeto o de incluir un nuevo responsable en caso de ser necesario.<br><br>'),
'',
unistr('<b><i>5.</i></b>Para iniciar el proceso de cobro se deben seleccionar los candidatos/sujetos asociados a un lote y que adem\00E1s no hayan sido procesados con anterioridad. si el candidato/sujeto ya fue procesado este no podr\00E1 ser seleccionado para su ma')
||unistr('nipulaci\00F3n y/o nuevo inicio de cobro.<br><br>'),
unistr('  Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'        </i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2871130698363369)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(213425362031634299)
,p_button_name=>'BTN_NUEVO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Generar <br>Lote Puntual'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:2024005:&SESSION.::&DEBUG.:RP,2024005:P2024005_BRANCH,P2024005_ID_PRCSO_TPO:&APP_PAGE_ID.,&P2024001_ID_PRCSO_TPO.'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(28343793619289302)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(213425362031634299)
,p_button_name=>'Ir_a_Impresion_de_actos_persuasivos'
,p_button_static_id=>'resultados'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>unistr('<strong><em>Ir a Impresi\00F3n de Actos <br> Persuasivos</em></strong>')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:127:&SESSION.::&DEBUG.:RP,127::'
,p_icon_css_classes=>'fa-box-arrow-in-ne'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5008029295692705)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(213425362031634299)
,p_button_name=>'BTN_LTE_MSVO'
,p_button_static_id=>'BTN_LTE_MSVO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>unistr('Lote Candidatos <br>Masivos Por <br>Par\00E1metros')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:2024006:&SESSION.::&DEBUG.:RP,2024006::'
,p_icon_css_classes=>'fa-database-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2871579830363369)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(213425362031634299)
,p_button_name=>'BTN_SQL'
,p_button_static_id=>'BTN_SQL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>unistr('Selecci\00F3n Masiva<br>por Regla')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:RP,17:P17_ID_PRCSOS_SMU_LTE,P17_ID_PRCSO_TPO:&P2024001_ID_PRCSO_SMU_LOTE.,&P2024001_ID_PRCSO_TPO.'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-file-sql'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2871914615363370)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(213425362031634299)
,p_button_name=>'BTN_AGRGAR_SJTO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Agregar Candidato(s)'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:2024005:&SESSION.::&DEBUG.:RP,2024005:P2024005_BRANCH,P2024005_ID_PRCSO_SMU_LOTE,P2024005_ID_PRCSO_TPO:&APP_PAGE_ID.,&P2024001_ID_PRCSO_SMU_LOTE.,&P2024001_ID_PRCSO_TPO.'
,p_button_condition=>'P2024001_ID_PRCSO_SMU_LOTE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-user'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2872318446363370)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(213425362031634299)
,p_button_name=>'BTN_RSPNSBLE'
,p_button_static_id=>'BTN_RSPNSBLE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Nuevo Responsable'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'      FROM v_cb_g_procesos_simu_sujeto a',
'     WHERE a.id_prcsos_smu_lte = :P2024001_ID_PRCSO_SMU_LOTE',
'       AND a.actvo = ''S''',
'       AND a.indcdor_prcsdo = ''N'';'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-users'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2872746459363370)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(213425362031634299)
,p_button_name=>'BTN_INCIAR_PRCSO'
,p_button_static_id=>'BTN_INCIAR_PRCSO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>unistr('Iniciar <br/>Proceso Jur\00EDdico')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-play'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2873163340363370)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(213425362031634299)
,p_button_name=>'BTN_CARGAR_ARCHIVO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Agregar candidatos <br>mediante cargue<br> de archivos'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:132:&SESSION.::&DEBUG.:RP,132:P132_ID_PRCSO_SMU_LOTE,P132_ID_CRGA,P132_ID_PRCSO_TPO,P132_ID_IMPSTO,P132_ID_IMPSTO_SBMPSTO,P132_VGNCIA,P132_ID_PRDO:&P2024001_ID_PRCSO_SMU_LOTE.,&P2024001_ID_CRGA.,&P2024001_ID_PRCSO_TPO.,&P2024001_ID_IMPSTO.,&P2024001_ID_IMPSTO_SBMPSTO.,&P2024001_VGNCIA.,&P2024001_ID_PRDO.'
,p_icon_css_classes=>'fa-file-excel-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2873543013363370)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(213425362031634299)
,p_button_name=>'BTN_INCIAR_CBRO_PRSSVO'
,p_button_static_id=>'BTN_INCIAR_CBRO_PRSSVO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Iniciar <br/>Proceso Persuasivo'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    SELECT 1',
'      FROM v_cb_g_procesos_simu_sujeto a',
'     WHERE a.id_prcsos_smu_lte = :P2024001_ID_PRCSO_SMU_LOTE',
'       AND a.actvo = ''S''',
'       AND a.indcdor_prcsdo = ''N'';'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-play'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2873910291363371)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(213425362031634299)
,p_button_name=>'BTN_ELMNAR_LTE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Eliminar Lote'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'      FROM v_cb_g_procesos_simu_sujeto a',
'     WHERE a.id_prcsos_smu_lte = :P2024001_ID_PRCSO_SMU_LOTE',
'       AND a.actvo = ''S''',
'       AND a.indcdor_prcsdo = ''N'';'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2874302625363371)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_api.id(213425362031634299)
,p_button_name=>'BTN_ELMNAR_SJTO'
,p_button_static_id=>'BTN_ELMNAR_SJTO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Eliminar Sujetos'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'      FROM v_cb_g_procesos_simu_sujeto a',
'     WHERE a.id_prcsos_smu_lte = :P2024001_ID_PRCSO_SMU_LOTE',
'       AND a.actvo = ''S''',
'       AND a.indcdor_prcsdo = ''N'';'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2874755860363371)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_api.id(213425362031634299)
,p_button_name=>'BTN_IR_PRCSO_JRDCO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>unistr('Gesti\00F3n de <br/>Procesos Juridicos')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:RP,10::'
,p_button_condition=>'P2024001_ID_PRCSO_TPO'
,p_button_condition2=>'2'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-external-link-square'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2875112211363371)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_api.id(213425362031634299)
,p_button_name=>'BTN_RSLTDOS_PRCSMNTO'
,p_button_static_id=>'resultados'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Resultados de <br>Procesamiento'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:45:&SESSION.::&DEBUG.:RP,45:P45_ID_PRCSO_JRDCO_LTE_IP:&P2024001_ID_PRCSO_JRDCO_LTE_IP.'
,p_button_condition=>'P2024001_ID_PRCSO_JRDCO_LTE_IP'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2875597575363371)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_api.id(213425362031634299)
,p_button_name=>'BTN_DSCRGAR_ARCHVO_LTE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>unistr('Descargar informaci\00F3n<br> del lote')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:2024001:&SESSION.:imprimir:&DEBUG.:::'
,p_icon_css_classes=>'fa-download'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4218248238108601)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_api.id(213425362031634299)
,p_button_name=>'BTN_ACTLZAR_RSPNSBLES'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Actualizar Responsables'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:156:&SESSION.::&DEBUG.:RP,156:P156_ID_PRCSO_SMU_LOTE,P156_ID_CRGA,P156_ID_PRCSO_TPO:&P2024001_ID_PRCSO_SMU_LOTE.,&P2024001_ID_CRGA_SR.,&P2024001_ID_PRCSO_TPO.'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(27981040397967802)
,p_button_sequence=>160
,p_button_plug_id=>wwv_flow_api.id(213425362031634299)
,p_button_name=>'BTN_DTLLE_PRCSO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>unistr('Informaci\00F3n Errores<br>Del Proceso')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:2024012:&SESSION.::&DEBUG.:RP,2024012:P2024012_ID_PRCSOS_SMU_LTE:&P2024001_ID_PRCSO_SMU_LOTE.'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(27981133083967803)
,p_button_sequence=>170
,p_button_plug_id=>wwv_flow_api.id(213425362031634299)
,p_button_name=>'BTN_ARCHVO_RSPNSBLES'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>unistr('Descargar Informaci\00F3n<br> De Responsables<br>  Del Lote ')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:2024001:&SESSION.:responsables:&DEBUG.:RP::'
,p_icon_css_classes=>'fa-download'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4198530743283917)
,p_button_sequence=>180
,p_button_plug_id=>wwv_flow_api.id(213425362031634299)
,p_button_name=>'BTN_DTLLE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>unistr('Detalle Selecci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:2024008:&SESSION.::&DEBUG.:RP:P2024008_ID_PRCSO_SMU_LOTE:&P2024001_ID_PRCSO_SMU_LOTE.'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(28435874089660801)
,p_button_sequence=>190
,p_button_plug_id=>wwv_flow_api.id(213425362031634299)
,p_button_name=>'BTN_CONSULTAR_PRCSS_SGND_PLNO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Resultados Procesos en <br>Segundo Planode <br>Procesamiento'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:173:&SESSION.::&DEBUG.:RP,173::'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2885754090363382)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(213425608751634301)
,p_button_name=>'BTN_CONSULTA'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_column_span=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2886191802363382)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(213425608751634301)
,p_button_name=>'BTN_ACTLZAR_OBSVCION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>unistr('Actualizar Observaci\00F3n')
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:RP:P30_ID_PRCSOS_SMU_LTE:&P2024001_ID_PRCSO_SMU_LOTE.'
,p_icon_css_classes=>'fa-clipboard-edit'
,p_grid_column_attributes=>'style="left:10px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2912631826363399)
,p_branch_name=>'Go To Page 9'
,p_branch_action=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:RP,9:P9_ID_PRCSOS_SMU_SJTO:&P2024001_PRCSO_SMU_SJTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(2872318446363370)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2913054590363399)
,p_branch_name=>'Go To Page 15'
,p_branch_action=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:RP,15:P15_ID_PRCSO_SMU_LOTE,P15_MSVO,P15_ID_PRCSO_TPO:&P2024001_ID_PRCSO_SMU_LOTE.,&P2024001_MASIVO.,&P2024001_ID_PRCSO_TPO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(2872746459363370)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2913445345363399)
,p_branch_name=>'Go To Page 127'
,p_branch_action=>'f?p=&APP_ID.:127:&SESSION.::&DEBUG.:RP,127:P127_ID_PRCSO_SMU_LOTE,P127_MSVO,P127_ID_PRCSO_TPO:&P2024001_ID_PRCSO_SMU_LOTE.,&P2024001_MASIVO.,&P2024001_ID_PRCSO_TPO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'BTN_INCIAR_CBRO_PRSSVO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2886503011363382)
,p_name=>'P2024001_ID_PRCSO_SMU_LOTE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(213425608751634301)
,p_prompt=>unistr('Lote de Selecci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''*Lote: '' || a.id_prcsos_smu_lte || '' *Fecha: '' ||',
'       to_char(a.fcha_lte, ''dd/mm/yyyy'') || '' *Funcionario: '' ||',
'       b.nmbre_trcro as dscrpcion_Lte,',
'       a.id_prcsos_smu_lte',
'  from cb_g_procesos_simu_lote a, v_sg_g_usuarios b',
' where a.id_fncnrio = b.id_fncnrio',
'   and a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.id_prcso_tpo = :P2024001_ID_PRCSO_TPO',
'   and b.id_usrio = :F_ID_USRIO',
'   and a.id_prcso_tpo = 1',
'-- and to_char(a.fcha_lte,''yyyymmdd'')< ''20241202''',
' order by a.id_prcsos_smu_lte desc',
''))
,p_colspan=>9
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Es el lote de selecci\00F3n realizado por un funcionario. Al consultarlo mostrara la informaci\00F3n de los candidatos, contenida en el lote para poder procesarla y generar el proceso jur\00EDdico.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'700'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2887477219363383)
,p_name=>'P2024001_TIPO_PROCESAMIENTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(213425608751634301)
,p_item_default=>'SEL'
,p_prompt=>'Tipo Procesamiento'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Procesar todos;ALL,Procesar puntuales;SEL'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2887839700363383)
,p_name=>'P2024001_JSON'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(213425608751634301)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2888274621363383)
,p_name=>'P2024001_PRCSO_SMU_SJTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(213425608751634301)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2888613700363384)
,p_name=>'P2024001_MASIVO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(213425608751634301)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2889023531363384)
,p_name=>'P2024001_OBSRVCION_LTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(213425608751634301)
,p_prompt=>unistr('Observaci\00F3n de Lote')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>200
,p_cHeight=>3
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Muestra la observaci\00F3n del lote que fue ingresada cuando se genero un lote nuevo de selecci\00F3n de candidatos.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2889932760363384)
,p_name=>'P2024001_DSCRPCION_PRCSO_TPO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(213425608751634301)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2890370605363384)
,p_name=>'P2024001_ID_PLNTLLA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(213425608751634301)
,p_prompt=>'Plantillas Para Persuasivo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.dscrpcion d,',
'       b.id_plntlla r',
'  from gn_d_actos_tipo a',
'  join gn_d_plantillas b on b.id_acto_tpo = a.id_acto_tpo',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.cdgo_acto_tpo in (''OCP'',''NAO'');'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'60%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2890797206363385)
,p_name=>'P2024001_ID_PRCSO_JRDCO_LTE_IP'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(213425608751634301)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2891169080363385)
,p_name=>'P2024001_ID_PRCSO_TPO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(213425608751634301)
,p_item_default=>'1'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2891562190363385)
,p_name=>'P2024001_ID_CRGA'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(213425608751634301)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2891994540363385)
,p_name=>'P2024001_ID_IMPSTO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(213425608751634301)
,p_prompt=>'Tipo de Impuesto'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>200
,p_cHeight=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2892375648363386)
,p_name=>'P2024001_VGNCIA'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(213425608751634301)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2892787654363386)
,p_name=>'P2024001_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(213425608751634301)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2893100944363386)
,p_name=>'P2024001_ID_PRDO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(213425608751634301)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3190598904159003)
,p_name=>'P2024001_ID_LTE_SIMU'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(213425608751634301)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3975542233732001)
,p_name=>'P2024001_SEL_TDOS'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(213425608751634301)
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4240519375270001)
,p_name=>'P2024001_ID_CRGA_SR'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(213425608751634301)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(37239986808282004)
,p_name=>'P2024001_SJTO_PRCSDOS'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(213425608751634301)
,p_prompt=>'Registros Procesados:'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>200
,p_cHeight=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(2897793985363390)
,p_computation_sequence=>10
,p_computation_item=>'P2024001_OBSRVCION_LTE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select obsrvcion',
'from cb_g_procesos_simu_lote',
'where id_prcsos_smu_lte = :P2024001_ID_PRCSO_SMU_LOTE'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(2897377562363390)
,p_computation_sequence=>20
,p_computation_item=>'P2024001_DSCRPCION_PRCSO_TPO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.dscrpcion',
'from cb_g_procesos_simu_lote a',
'join cb_d_procesos_tipo b on b.id_prcso_tpo = a.id_prcso_tpo',
'where a.id_prcsos_smu_lte = :P2024001_ID_PRCSO_SMU_LOTE'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(2898544014363391)
,p_computation_sequence=>40
,p_computation_item=>'P2024001_ID_IMPSTO_SBMPSTO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_impsto_sbmpsto',
'from cb_g_procesos_smu_mvmnto a',
'where exists (select 1 from cb_g_procesos_simu_sujeto b',
'where a.id_prcsos_smu_sjto = b.id_prcsos_smu_sjto',
'and b.id_prcsos_smu_lte = :P2024001_ID_PRCSO_SMU_LOTE)',
'group by id_impsto_sbmpsto;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(37239741409282002)
,p_computation_sequence=>50
,p_computation_item=>'P2024001_ID_IMPSTO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.id_impsto',
'from cb_g_procesos_smu_mvmnto a',
'join df_i_impuestos_subimpuesto b on b.id_impsto_sbmpsto = a.id_impsto_sbmpsto',
'where exists (select 1 from cb_g_procesos_simu_sujeto b',
'where a.id_prcsos_smu_sjto = b.id_prcsos_smu_sjto',
'and b.id_prcsos_smu_lte = :P2024001_ID_PRCSO_SMU_LOTE)',
'group by b.id_impsto;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(37239802568282003)
,p_computation_sequence=>60
,p_computation_item=>'P2024001_SJTO_PRCSDOS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    ''Total registros: '' || TO_CHAR(COUNT(*), ''FM999G999G990'') || ',
'    '' [ Procesados: '' || TO_CHAR(COUNT(CASE WHEN indcdor_prcsdo = ''S'' THEN 1 END), ''FM999G999G990'') || ',
'    '' ('' || TRIM(TO_CHAR(COUNT(CASE WHEN indcdor_prcsdo = ''S'' THEN 1 END) * 100 / NULLIF(COUNT(*), 0), ''990.99'', ''NLS_NUMERIC_CHARACTERS = ''''. '''''')) || ''%)'' ||',
'    '' / Pendientes: '' || TO_CHAR(COUNT(CASE WHEN indcdor_prcsdo = ''N'' THEN 1 END), ''FM999G999G990'') || ',
'    '' ('' || TRIM(TO_CHAR(COUNT(CASE WHEN indcdor_prcsdo = ''N'' THEN 1 END) * 100 / NULLIF(COUNT(*), 0), ''990.99'', ''NLS_NUMERIC_CHARACTERS = ''''. '''''')) || ''%) ]''',
'    AS "Resumen de Proceso"',
'FROM cb_g_procesos_simu_sujeto a',
'WHERE a.id_prcsos_smu_lte = :P2024001_ID_PRCSO_SMU_LOTE;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(4139391818859401)
,p_computation_sequence=>70
,p_computation_item=>'P2024001_ID_CRGA'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>'select id_crga from et_g_carga where nmbre_crga=''PRS'';'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(4240656520270002)
,p_computation_sequence=>80
,p_computation_item=>'P2024001_ID_CRGA_SR'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select vlor from cb_d_process_prssvo_cnfgrcn where cdgo_cnfgrcion = ''ACTEM''',
''))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2901611186363393)
,p_name=>unistr('Guardar en sesi\00F3n el valor del sub-impuesto selccionado')
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P14_SUB_IMPUESTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2902110825363394)
,p_event_id=>wwv_flow_api.id(2901611186363393)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    APEX_UTIL.SET_SESSION_STATE(''P14_ID_IMPSTO_SBMPSTO'',:P14_ID_IMPSTO_SBMPSTO);',
'END;'))
,p_attribute_02=>'P14_ID_IMPSTO_SBMPSTO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2902584476363394)
,p_name=>'al seleccionar un registro de lotes'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(213286960936830719)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2903049971363394)
,p_event_id=>wwv_flow_api.id(2902584476363394)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'validar_sel();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2903912931363395)
,p_name=>'al cargar la pagina'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2904411197363395)
,p_event_id=>wwv_flow_api.id(2903912931363395)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*$(document).ready(function() {  ',
'    var region = apex.region("lotes_simu");',
'    if (region) {',
'        apex.region("lotes_simu").widget().interactiveGrid("setSelectedRecords", []);',
'    }      ',
'});',
'*/'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2904881778363395)
,p_name=>'close dialog'
,p_event_sequence=>50
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2905302266363395)
,p_event_id=>wwv_flow_api.id(2904881778363395)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//console.log(this, sujeto);',
'var actElment = this.affectedElements[0].activeElement;',
'',
'var idActive = $(actElment).attr(''id'') || $(actElment).data(''action'');',
'var region = (idActive === ''BTN_INCIAR_PRCSO'' || idActive === ''all_process'') ? apex.region("simu_sujetos") ',
'                                                                             : (idActive === ''BTN_RSPNSBLE'' ? apex.region("sujetos_responsables") : undefined);',
'',
'var sujeto = $v(''P2024001_PRCSO_SMU_SJTO'');',
'',
'if (region == undefined && sujeto !== null && idActive !== ''resultados''){',
'    region = apex.region("sujetos_responsables");',
'}',
'',
'if (region) ',
'    region.refresh(); ',
' '))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2905771111363396)
,p_name=>'al cerrar la ventana de reglas'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(49269875096384349)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2906211253363396)
,p_event_id=>wwv_flow_api.id(2905771111363396)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var url = ''f?p='' +  $v(''pFlowId'') + '':'' + $v(''pFlowStepId'') + '':'' + $v(''pInstance'');',
'window.location.href = url;'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2906686479363396)
,p_name=>'Al cerrar ventana de Observacion de lote'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(2886191802363382)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2907160769363396)
,p_event_id=>wwv_flow_api.id(2906686479363396)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2907534786363396)
,p_name=>'Al darle click al boton eliminar sujeto'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(2874302625363371)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2908007753363397)
,p_event_id=>wwv_flow_api.id(2907534786363396)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var json = window.localStorage.jsonCobro;',
'let $waitPopup;',
'try {',
'    JSON.parse(json);',
unistr('    apex.message.confirm(''\00BFEst\00E1 seguro de Borrar el/los sujeto(s)?'', (ok) => {'),
'        if (ok) {',
'            if (apex.page.validate()) {',
'                $waitPopup = apex.widget.waitPopup();',
'                apex.server.process("EliminarSujetosCobro", {',
'                    f01: json,',
'                    pageItems: "#P2024001_ID_PRCSO_SMU_LOTE"',
'                }).then((resp) => {',
'                    $waitPopup.remove();',
'                    if (resp.type === ''OK'') {',
'                        apex.message.showPageSuccess(resp.msg);',
'                        window.location.href = resp.url;',
'                    }',
'                });',
'            }',
'        }',
'    })',
'',
'} catch (e) {',
'    apex.message.clearErrors();',
'    apex.message.showErrors([',
'        {',
'            type: "error",',
'            location: ["page"],',
'            message: "No se encontraron datos seleccionados",',
'            unsafe: false',
'        }]);',
'} finally {',
'    if ($waitPopup)',
'        $waitPopup.remove();',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2908410470363397)
,p_name=>'Al dar click en BTN_INCIAR_CBRO_PRSSVO'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(2873543013363370)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2908920598363397)
,p_event_id=>wwv_flow_api.id(2908410470363397)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'iniciarProcesoPersuasivo();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2909380271363397)
,p_name=>'Al cambiar item P2024001_TIPO_PROCESAMIENTO'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2024001_TIPO_PROCESAMIENTO'
,p_condition_element=>'P2024001_TIPO_PROCESAMIENTO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'ALL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2909886454363398)
,p_event_id=>wwv_flow_api.id(2909380271363397)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''button[data-action="selectAll"]'').click();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2910303456363398)
,p_event_id=>wwv_flow_api.id(2909380271363397)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.region("simu_sujetos").widget().interactiveGrid("setSelectedRecords", []);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2910760175363398)
,p_name=>'Al dar Click en BTN_DSCRGAR_ARCHVO_LTE'
,p_event_sequence=>130
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(2875597575363371)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2911252927363398)
,p_event_id=>wwv_flow_api.id(2910760175363398)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnConsultarSujetosExcel($v(''P2024001_ID_PRCSO_SMU_LOTE''));'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2911673549363399)
,p_name=>'Al seleccionar plantilla'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2024001_ID_PLNTLLA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2912199858363399)
,p_event_id=>wwv_flow_api.id(2911673549363399)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P2024001_ID_PLNTLLA'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5008795926692712)
,p_name=>'al cambiar P2024001_ID_IMPSTO_MS'
,p_event_sequence=>160
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2024001_ID_IMPSTO_MS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5008876637692713)
,p_event_id=>wwv_flow_api.id(5008795926692712)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select min(id_impsto_sbmpsto)',
'      into :P2024001_ID_IMPSTO_SBMPSTO_MS       ',
'      from df_i_impuestos_subimpuesto',
'     where id_impsto = :P2024001_ID_IMPSTO_MS;',
'end;'))
,p_attribute_02=>'P2024001_ID_IMPSTO_MS,P2024001_ID_IMPSTO_SBMPSTO_MS'
,p_attribute_03=>'P2024001_ID_IMPSTO_SBMPSTO_MS'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3883577298930816)
,p_name=>'Al dar clic a BTN_INCIAR_PRCSO'
,p_event_sequence=>170
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(2872746459363370)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3883658877930817)
,p_event_id=>wwv_flow_api.id(3883577298930816)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (validacion()) {',
'    apex.submit();',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2901283256363393)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'prc_dscrga_excel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'  v_num_fla       number := 5;     -- Numero de filas del excel',
'  v_num_impstos   number := 5;',
'  v_num_col       number := 0;     -- Inicio de columnas',
'  v_bfile         bfile;           -- Apuntador del documento en disco',
'  o_file_blob     blob;            -- Archivo blob de salida',
'  v_directorio    clob;            -- Directorio donde caera el archivo',
'  v_file_name     varchar2(3000);  -- Nombre del rachivo',
'  v_file_blob     blob;            ',
'  v_nmbre_clnte   varchar2(1000); ',
'  v_slgan         varchar2(1000); ',
'  v_nit           varchar2(1000);  ',
'  v_nmbre_dcmnto  varchar2(100);',
'begin',
'  -- Datos del cliente',
'  select  upper(nmbre_clnte)',
'        , nmro_idntfccion',
'        , upper(slgan)          ',
'  into  v_nmbre_clnte ',
'      , v_nit',
'      , v_slgan',
'  from df_s_clientes',
'  where cdgo_clnte = :F_CDGO_CLNTE;',
'  ',
'  o_file_blob  :=  empty_blob(); -- Inicializacion del blob ',
'  v_directorio := ''COPIAS'';      -- Nombre del directorio donde caera el archivo',
'  v_file_name  := ''Temp_.xlsx'';  -- Nombre del archivo',
'  --se crea un hoja       ',
'  as_xlsx.new_sheet(''Candidatos'');',
'  ',
'  --combinamos celdas  ',
'  as_xlsx.mergecells( 1, 1, 12, 1 );  --Cliente',
'  as_xlsx.mergecells( 1, 2, 12, 2 );  --Slogan',
'  as_xlsx.mergecells( 1, 3, 12, 3 );  --Nit',
'  ',
'  --estilos de encabezado          ',
'  as_xlsx.cell( 1, 1 , v_nmbre_clnte, p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'' )',
'                                   , p_fontId => as_xlsx.get_font( ''Calibri'', p_bold => true, p_fontsize => 12));      ',
'                                   ',
'  as_xlsx.cell( 1, 2 , v_slgan, p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'' )',
'                                   , p_fontId => as_xlsx.get_font( ''Calibri'', p_bold => true, p_fontsize => 12));',
'                                   ',
'  as_xlsx.cell( 1, 3 , ''Nit. '' || v_nit, p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'' )',
'                                   , p_fontId => as_xlsx.get_font( ''Calibri'', p_bold => true, p_fontsize => 12));',
'                                   ',
'  -- Aliniar fila 6 del excel y creamos filtro',
'  as_xlsx.set_row(p_row  => 5',
'                , p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'', p_vertical => ''center'')',
'                , p_fontId    => as_xlsx.get_font( ''Calibri'', p_bold => true, p_fontsize => 11));  ',
'  ',
'  --as_xlsx.set_autofilter(4, 4, p_row_start => 5, p_row_end => 1000 ); --Filtro',
'  ',
'  --Nombre de las columnas',
'  as_xlsx.cell( 1, v_num_fla , ''CLIENTE*'');',
'  as_xlsx.cell( 2, v_num_fla , ''FECHA LOTE'');',
'  as_xlsx.cell( 3, v_num_fla , ''ID SUJETO'');',
unistr('  as_xlsx.cell( 4, v_num_fla , ''IDENTIFICACI\00D3N*'');'),
'  as_xlsx.cell( 5, v_num_fla , ''FUNCIONARIO*'');',
'  as_xlsx.cell( 6, v_num_fla , ''VALOR CARTERA'');',
'  as_xlsx.cell( 7, v_num_fla , ''VIGENCIA DESDE*'');',
'  as_xlsx.cell( 8, v_num_fla , ''VIGENCIA HASTA*'');',
'  as_xlsx.cell( 9, v_num_fla , ''IMPUESTO*'');',
'  as_xlsx.cell( 10, v_num_fla , ''SUB. IMPUESTO*'');',
'  as_xlsx.cell( 11, v_num_fla , ''RESPONSABLES'');',
'  as_xlsx.cell( 12, v_num_fla , ''CODIGO TIPO PROCESO'');',
'  as_xlsx.cell( 13, v_num_fla , ''ID LOTE*'');',
'  as_xlsx.cell( 14, v_num_fla , ''ID SUJETO LOTE'');',
'  as_xlsx.cell( 15, v_num_fla , ''EMAIL*'');',
'',
'  -- Consulta de impuestos',
' /* as_xlsx.cell( 16, v_num_fla , ''ID IMPUEST0'');',
'  as_xlsx.cell( 17, v_num_fla , ''COD. IMPUESTO'');',
'  as_xlsx.cell( 18, v_num_fla , ''NOMBRE IMPUESTO'');',
'  as_xlsx.cell( 19, v_num_fla , ''ID SUB. IMPUESTO'');',
'  as_xlsx.cell( 20, v_num_fla , ''COD. SUB. IMPUESTO'');',
'  as_xlsx.cell( 21, v_num_fla , ''NOMBRE SUB. IMPUESTO'');',
'  ',
'  for c_impsto in (select a.id_impsto, a.cdgo_impsto, a.nmbre_impsto ',
'                     from df_c_impuestos a',
'                     where cdgo_clnte = :F_CDGO_CLNTE) loop ',
'                    ',
'    v_num_impstos :=  v_num_impstos + 1;  ',
'    as_xlsx.cell( 16, v_num_impstos , c_impsto.id_impsto);',
'    as_xlsx.cell( 17, v_num_impstos , c_impsto.cdgo_impsto);',
'    as_xlsx.cell( 18, v_num_impstos , c_impsto.nmbre_impsto);',
'    ',
'    ',
'    for c_subimpsto in (select a.id_impsto_sbmpsto, a.cdgo_impsto_sbmpsto, a.nmbre_impsto_sbmpsto',
'                          from df_i_impuestos_subimpuesto a',
'                          where id_impsto = c_impsto.id_impsto) loop',
'    ',
'      v_num_impstos :=  v_num_impstos + 1;  ',
'      as_xlsx.cell( 19, v_num_impstos , c_subimpsto.id_impsto_sbmpsto);',
'      as_xlsx.cell( 20, v_num_impstos , c_subimpsto.cdgo_impsto_sbmpsto);',
'      as_xlsx.cell( 21, v_num_impstos , c_subimpsto.nmbre_impsto_sbmpsto);',
'    ',
'    end loop;',
'    ',
'  end loop;*/',
'',
'  -- Consulta ',
'  for c_candidatos in (select a.cdgo_clnte,',
'       to_char(a.fcha_lte) as fecha_lte,',
'       b.id_sjto,',
'       to_char(d.idntfccion) as idntfccion,',
'       a.id_prcso_tpo,',
'       b.indcdor_prcsdo,',
'       a.id_fncnrio,',
'       b.vlor_ttal_dda,',
'       v.vigencia_desde,',
'       v.vigencia_hasta,',
'       v.id_impsto,',
'       v.id_impsto_sbmpsto,',
'       LISTAGG(c.prmer_nmbre || '' '' || c.sgndo_nmbre || '' '' ||',
'               c.prmer_aplldo || '' '' || c.sgndo_aplldo,',
'               '', '') WITHIN GROUP(ORDER BY c.prmer_nmbre || '' '' || c.sgndo_nmbre || '' '' || c.prmer_aplldo || '' '' || c.sgndo_aplldo) nmbre_rspnsbles,',
'       a.id_prcsos_smu_lte,',
'       b.id_prcsos_smu_sjto,',
'       c.email',
'  from cb_g_procesos_simu_lote a',
'  join cb_g_procesos_simu_sujeto b',
'    on a.id_prcsos_smu_lte = b.id_prcsos_smu_lte',
'  join cb_g_procesos_simu_rspnsble c',
'    on b.id_prcsos_smu_sjto = c.id_prcsos_smu_sjto',
'  join si_c_sujetos d',
'    on d.id_sjto = b.id_sjto',
'  JOIN (SELECT id_prcsos_smu_sjto,',
'               id_impsto,',
'               id_impsto_sbmpsto,',
'               MIN(vgncia) AS vigencia_desde,',
'               MAX(vgncia) AS vigencia_hasta',
'          FROM cb_g_procesos_smu_mvmnto',
'         GROUP BY id_prcsos_smu_sjto, id_impsto,',
'               id_impsto_sbmpsto) v',
'    ON v.id_prcsos_smu_sjto = b.id_prcsos_smu_sjto',
' where a.id_prcsos_smu_lte = :P2024001_ID_PRCSO_SMU_LOTE',
'   and b.actvo = ''S''',
' group by a.cdgo_clnte,',
'          a.fcha_lte,',
'          a.id_fncnrio,',
'          a.id_prcso_tpo,',
'          a.id_prcsos_smu_lte,',
'          b.id_prcsos_smu_sjto,',
'          b.id_sjto,',
'          d.idntfccion,',
'          b.indcdor_prcsdo,',
'          b.vlor_ttal_dda,',
'          v.vigencia_desde,',
'          v.vigencia_hasta,',
'          v.id_impsto,',
'          v.id_impsto_sbmpsto,',
'          c.email) loop',
'',
'      -- aqui se debe hacer la consulta y ir llenado las filas',
'      v_num_fla :=  v_num_fla + 1;  ',
'      as_xlsx.cell( 1, v_num_fla , c_candidatos.cdgo_clnte);    ',
'      as_xlsx.cell( 2, v_num_fla , c_candidatos.fecha_lte);  ',
'      as_xlsx.cell( 3, v_num_fla , c_candidatos.id_sjto);    ',
'      as_xlsx.cell( 4, v_num_fla , c_candidatos.idntfccion);',
'      as_xlsx.cell( 5, v_num_fla , c_candidatos.id_fncnrio);',
'      as_xlsx.cell( 6, v_num_fla , c_candidatos.vlor_ttal_dda);      ',
'      as_xlsx.cell( 7, v_num_fla , c_candidatos.vigencia_desde);    ',
'      as_xlsx.cell( 8, v_num_fla , c_candidatos.vigencia_hasta);    ',
'      as_xlsx.cell( 9, v_num_fla , c_candidatos.id_impsto);',
'      as_xlsx.cell( 10, v_num_fla , c_candidatos.id_impsto_sbmpsto);',
'      as_xlsx.cell( 11, v_num_fla , c_candidatos.nmbre_rspnsbles);',
'      as_xlsx.cell( 12, v_num_fla , c_candidatos.id_prcso_tpo);',
'      as_xlsx.cell( 13, v_num_fla , c_candidatos.id_prcsos_smu_lte);',
'      as_xlsx.cell( 14, v_num_fla , c_candidatos.id_prcsos_smu_sjto);',
'',
'    end loop;',
'  ',
'  -- Guardar Excel',
'  as_xlsx.save( v_directorio, v_file_name );',
'  ',
'  v_bfile := bfilename( v_directorio, v_file_name);',
'',
'  --------------------------------------------------------------------',
'  ',
'  dbms_lob.open(v_bfile, dbms_lob.lob_readonly);',
'  dbms_lob.createtemporary(',
'      lob_loc => o_file_blob, ',
'      cache   => true, ',
'      dur     => dbms_lob.session',
'  );',
'  -- Open temporary lob',
'  dbms_lob.open(o_file_blob, dbms_lob.lob_readwrite);',
'',
'  -- Load binary file into temporary LOB',
'  dbms_lob.loadfromfile(',
'      dest_lob => o_file_blob,',
'      src_lob  => v_bfile,',
'      amount   => dbms_lob.getlength(v_bfile)',
'  );',
'',
'  -- Close lob objects',
'  dbms_lob.close(o_file_blob);',
'  dbms_lob.close(v_bfile);',
'',
'  utl_file.fremove(v_directorio,v_file_name);',
'  htp.init;',
'  owa_util.mime_header(''application/ms-excel'', false);',
'  ',
'  v_nmbre_dcmnto := ''Lote_'' || :P2024001_ID_PRCSO_SMU_LOTE || ''_'' || to_char(sysdate,''yyyymmddhhmiss'');',
'  ',
'  htp.p(''Content-length: '' ||sys.dbms_lob.getlength(o_file_blob) );  ',
'  htp.p(''Content-Disposition: attachment; filename="''|| v_nmbre_dcmnto ||''.xlsx"'');  ',
'  htp.p(''Cache-Control: max-age=0'');',
'  owa_util.http_header_close;  ',
'  wpg_docload.download_file(o_file_blob);  ',
'  apex_application.stop_apex_engine;',
'  ',
'  exception',
'    when others then',
'      raise_application_error(-20000,''Problemas al generar excel, ''||sqlerrm);',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'imprimir'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(27981261803967804)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Descargar_Excel_Responsables'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
unistr('  v_num_fla      NUMBER := 5; -- N\00FAmero de filas del Excel'),
'  v_num_col      NUMBER := 0; -- Inicio de columnas  ',
'  o_file_blob    BLOB := empty_blob(); -- Archivo BLOB de salida',
'  v_nmbre_clnte  VARCHAR2(1000);',
'  v_slgan        VARCHAR2(1000);',
'  v_nit          VARCHAR2(1000);',
'  v_nmbre_dcmnto VARCHAR2(255);',
'BEGIN',
'  -- Datos del cliente',
'  SELECT UPPER(nmbre_clnte), nmro_idntfccion, UPPER(slgan)',
'  INTO v_nmbre_clnte, v_nit, v_slgan',
'  FROM df_s_clientes',
'  WHERE cdgo_clnte = :F_CDGO_CLNTE;',
'',
'  -- Crear hoja Excel',
'  AS_XLSX.NEW_SHEET(''Candidatos'');',
'',
'  -- Combinar celdas',
'  AS_XLSX.MERGECELLS(1, 1, 16, 1); -- Cliente',
'  AS_XLSX.MERGECELLS(1, 2, 16, 2); -- Slogan',
'  AS_XLSX.MERGECELLS(1, 3, 16, 3); -- NIT',
'',
'  -- Estilos de encabezado',
'  AS_XLSX.CELL(1, 1, v_nmbre_clnte, p_alignment => AS_XLSX.GET_ALIGNMENT(p_horizontal => ''center''),',
'                                      p_fontId    => AS_XLSX.GET_FONT(''Calibri'', p_bold => TRUE, p_fontsize => 12));',
'',
'  AS_XLSX.CELL(1, 2, v_slgan, p_alignment => AS_XLSX.GET_ALIGNMENT(p_horizontal => ''center''),',
'                              p_fontId    => AS_XLSX.GET_FONT(''Calibri'', p_bold => TRUE, p_fontsize => 12));',
'',
'  AS_XLSX.CELL(1, 3, ''Nit. '' || v_nit, p_alignment => AS_XLSX.GET_ALIGNMENT(p_horizontal => ''center''),',
'                                        p_fontId    => AS_XLSX.GET_FONT(''Calibri'', p_bold => TRUE, p_fontsize => 12));',
'',
'  -- Encabezados de columnas',
'  AS_XLSX.CELL(1, v_num_fla, ''IDENTIFICACION SUJETO*'');',
'  AS_XLSX.CELL(2, v_num_fla, ''TIPO*'');',
'  AS_XLSX.CELL(3, v_num_fla, ''IDENTIFICACION*'');',
'  AS_XLSX.CELL(4, v_num_fla, ''TIPO RESPONSABLE'');',
'  AS_XLSX.CELL(5, v_num_fla, ''PRIMER NOMBRE'');',
'  AS_XLSX.CELL(6, v_num_fla, ''SEGUNDO NOMBRE'');',
'  AS_XLSX.CELL(7, v_num_fla, ''PRIMER APELLIDO'');',
'  AS_XLSX.CELL(8, v_num_fla, ''SEGUNDO APELLIDO'');',
'  AS_XLSX.CELL(9, v_num_fla, ''PAIS'');',
'  AS_XLSX.CELL(10, v_num_fla, ''DPTO'');',
'  AS_XLSX.CELL(11, v_num_fla, ''MUNICIPIO'');',
'  AS_XLSX.CELL(12, v_num_fla, ''DIRECCION'');',
'  AS_XLSX.CELL(13, v_num_fla, ''TELEFONO'');',
'  AS_XLSX.CELL(14, v_num_fla, ''CELULAR'');',
'  AS_XLSX.CELL(15, v_num_fla, ''EMAIL'');',
'  AS_XLSX.CELL(16, v_num_fla, ''NRO LOTE'');',
'',
'  -- Llenar datos',
'  FOR c_candidatos IN (',
'        select replace(a.idntfccion,''-'','''') AS idntfccion_sjto,',
'           b.cdgo_idntfccion_tpo,',
'           b.idntfccion,',
'           b.prncpal_s_n,',
'           RTRIM(REPLACE(b.prmer_nmbre, ''.'', '''')) AS prmer_nmbre,',
'           b.sgndo_nmbre,',
'           b.prmer_aplldo,',
'           b.sgndo_aplldo,',
'           b.id_pais_ntfccion,',
'           b.id_dprtmnto_ntfccion,',
'           b.id_mncpio_ntfccion,',
'           b.drccion_ntfccion,',
'           b.tlfno,',
'           b.cllar,',
'           b.email,',
'           a.id_prcsos_smu_lte',
'      from v_cb_g_procesos_simu_sujeto a',
'      join cb_g_procesos_simu_rspnsble b',
'        on a.id_prcsos_smu_sjto = b.id_prcsos_smu_sjto',
'     where a.id_prcsos_smu_lte = :P2024001_ID_PRCSO_SMU_LOTE',
'  ) LOOP',
'    v_num_fla := v_num_fla + 1;',
'    AS_XLSX.CELL(1, v_num_fla, c_candidatos.idntfccion_sjto);',
'    AS_XLSX.CELL(2, v_num_fla, c_candidatos.cdgo_idntfccion_tpo);',
'    AS_XLSX.CELL(3, v_num_fla, c_candidatos.idntfccion);',
'    AS_XLSX.CELL(4, v_num_fla, c_candidatos.prncpal_s_n);',
'    AS_XLSX.CELL(5, v_num_fla, c_candidatos.prmer_nmbre);',
'    AS_XLSX.CELL(6, v_num_fla, c_candidatos.sgndo_nmbre);',
'    AS_XLSX.CELL(7, v_num_fla, c_candidatos.prmer_aplldo);',
'    AS_XLSX.CELL(8, v_num_fla, c_candidatos.sgndo_aplldo);',
'    AS_XLSX.CELL(9, v_num_fla, c_candidatos.id_pais_ntfccion);',
'    AS_XLSX.CELL(10, v_num_fla, c_candidatos.id_dprtmnto_ntfccion);',
'    AS_XLSX.CELL(11, v_num_fla, c_candidatos.id_mncpio_ntfccion);',
'    AS_XLSX.CELL(12, v_num_fla, c_candidatos.drccion_ntfccion);',
'    AS_XLSX.CELL(13, v_num_fla, c_candidatos.tlfno);',
'    AS_XLSX.CELL(14, v_num_fla, c_candidatos.cllar);',
'    AS_XLSX.CELL(15, v_num_fla, c_candidatos.email);',
'    AS_XLSX.CELL(16, v_num_fla, c_candidatos.id_prcsos_smu_lte);',
'  END LOOP;',
'',
'  -- Generar archivo',
'  o_file_blob := AS_XLSX.FINISH;',
'',
'  -- Configurar headers para descarga en APEX',
'  HTP.INIT;',
'  OWA_UTIL.MIME_HEADER(''application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'', FALSE);',
'',
'  v_nmbre_dcmnto := ''Lote_'' || :P2024009_LTE_SLCCION_PRSSVO || ''_'' || TO_CHAR(SYSDATE, ''yyyymmddhhmiss'');',
'',
'  HTP.P(''Content-length: '' || DBMS_LOB.GETLENGTH(o_file_blob));',
'  HTP.P(''Content-Disposition: attachment; filename="'' || v_nmbre_dcmnto || ''.xlsx"'');',
'  HTP.P(''Cache-Control: max-age=0'');',
'  OWA_UTIL.HTTP_HEADER_CLOSE;',
'',
'  -- Descargar archivo',
'  WPG_DOCLOAD.DOWNLOAD_FILE(o_file_blob);',
'  APEX_APPLICATION.STOP_APEX_ENGINE;',
'',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    RAISE_APPLICATION_ERROR(-20000, ''Error al generar el Excel: '' || SQLERRM);',
'END;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'responsables'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2898829391363391)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'eliminar lotes'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    pkg_cb_proceso_juridico.prc_el_procesos_simu_lte (P_ID_PRCSOS_SMU_LTE => :P2024001_ID_PRCSO_SMU_LOTE);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(2873910291363371)
,p_process_success_message=>'Lote eliminado de forma exitosa.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2899261118363391)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'eliminar datos de session'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(2873910291363371)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2899680484363391)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar Sujetos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    pkg_cb_proceso_juridico.prc_el_procesos_simu_sjto( p_id_prcsos_smu_lte => :P2024001_ID_PRCSO_SMU_LOTE ,',
'                                                       p_json_sujetos      => :P2024001_JSON );',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(2874302625363371)
,p_process_when_type=>'NEVER'
,p_process_success_message=>'Sujetos Eliminados de Forma Exitosa!!'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3953809281905303)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(213286960936830719)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Sujetos - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2900083257363392)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'EliminarSujetosCobro'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_json                     clob;',
'    v_url                      varchar2(4000);',
'    v_id_prcso_jrdco_lte_ip    number;',
'    ',
'begin',
'     for i in 1..apex_application.g_f01.count ',
'     loop',
'         v_json :=  v_json || apex_application.g_f01(i);',
'     end loop;',
'     ',
'    pkg_cb_proceso_juridico.prc_el_procesos_simu_sjto( p_id_prcsos_smu_lte => v(''P2024001_ID_PRCSO_SMU_LOTE''),',
'                                                       p_json_sujetos      => v_json );',
'    ',
'    v_url := apex_util.prepare_url( p_url => ''f?p='' || v(''APP_ID'') || '':8:''|| v(''APP_SESSION'')||''::NO::P2024001_ID_PRCSO_SMU_LOTE:''',
'                                   || v(''P2024001_ID_PRCSO_SMU_LOTE'')',
'                                  , p_checksum_type => ''SESSION'');',
'    ',
'    htp.p(''{"type":"OK","url":"''||v_url||''","msg":"''||case when v_id_prcso_jrdco_lte_ip is null ',
'                                 then ''Sujeto(s) Eliminado(s) Correctamente!!''',
'                                 else ''Algunos registros no fueron procesados'' ',
'                            end||''"}'');',
'   /* apex_json.open_object;',
'    apex_json.write(''type'', ''OK'');',
'    apex_json.write(''url'', v_url);    ',
'    apex_json.write(''msg'',  case when v_id_prcso_jrdco_lte_ip is null ',
'                                 then ''Medida(s) cautelar(es) Iniciada(s) Correctamente!!''',
'                                 else ''Algunos registros no fueron procesados'' ',
'                            end );',
'    apex_json.close_object;*/',
'exception',
'    when others then',
'    ',
'        htp.p(''{"type":"ERROR","msg":"''||sqlerrm||''"}'');',
'        ',
'        /*apex_json.open_object;',
'        apex_json.write(''type'', ''ERROR'');',
'        apex_json.write(''msg'',  sqlerrm);',
'        apex_json.close_object;*/',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2900498201363392)
,p_process_sequence=>60
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Iniciar_Proceso_Persuasivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'        v_json_sjtos   clob;',
'        o_cdgo_rspsta  number;',
'        o_mnsje_rspsta varchar2(1000);',
'        v_msvo         number:=1;',
'        v_job_state      VARCHAR2(50);',
'begin',
'    ',
'    ',
'    for i IN 1..APEX_APPLICATION.G_F01.count loop ',
'        v_json_sjtos := v_json_sjtos||APEX_APPLICATION.G_F01(i);',
'    end loop;',
'    ',
'      insert into muerto (n_001,n_002,c_001,t_001) values (9999,10,v_json_sjtos,systimestamp);',
'  commit;',
'    v_msvo := 1;',
'    ',
'    if APEX_APPLICATION.G_F01.count > 1 then',
'            v_msvo := 2;',
'    end if;',
'       ',
'    ',
'    -- Iniciar proceso de cobro persuasivo',
'   pkg_cb_proceso_persuasivo.prc_rg_proceso_persuasivo_job( p_cdgo_clnte            => :F_CDGO_CLNTE,',
'                                                            p_id_prcsos_smu_lte     => :P2024001_ID_PRCSO_SMU_LOTE,',
'                                                            p_id_usrio              => :F_ID_USRIO,',
'                                                            p_id_plntlla            => :P2024001_ID_PLNTLLA,                                                            ',
'                                                            o_cdgo_rspsta           => o_cdgo_rspsta,',
'                                                            o_mnsje_rspsta          => o_mnsje_rspsta);',
'    ',
'    ',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'    apex_json.close_object();',
'',
'exception',
'    when others then',
'            apex_json.open_object();',
'            apex_json.write(''o_cdgo_rspsta'', 99);',
'            apex_json.write(''o_mnsje_rspsta'', ''Error: ''||sqlerrm);',
'            apex_json.close_object();',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'&P15_MNSJE.'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2900899602363392)
,p_process_sequence=>70
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Obtener_informacion_Excel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_json_cnddto json_object_t;',
'  v_json_array json_array_t := json_array_t();',
'  v_lte        NUMBER := APEX_APPLICATION.g_x01;',
'BEGIN',
'',
'  :P2024001_ID_LTE_SIMU := v_lte;',
'  insert into muerto (n_001,v_001) values (15001,''''+v_lte);',
'  commit;',
'',
'  FOR c_cnddtos_lte IN (',
'    SELECT a.cdgo_clnte,',
'           a.fcha_lte,',
'           b.id_sjto,',
'           TO_CHAR(d.idntfccion) AS idntfccion,',
'           a.id_prcso_tpo,',
'           b.indcdor_prcsdo,',
'           a.id_fncnrio,',
'           b.vlor_ttal_dda,',
'           v.vigencia_desde,',
'           v.vigencia_hasta,',
'           LISTAGG(c.prmer_nmbre || '' '' || c.sgndo_nmbre || '' '' ||',
'                   c.prmer_aplldo || '' '' ||',
'                   c.sgndo_aplldo, '', '') ',
'               WITHIN GROUP(ORDER BY c.prmer_nmbre || '' '' || c.sgndo_nmbre || '' '' || c.prmer_aplldo || '' '' || c.sgndo_aplldo) AS nmbre_rspnsbles,',
'           a.id_prcsos_smu_lte,',
'           b.id_prcsos_smu_sjto,',
'           c.email',
'      FROM cb_g_procesos_simu_lote a',
'      JOIN cb_g_procesos_simu_sujeto b',
'        ON a.id_prcsos_smu_lte = b.id_prcsos_smu_lte',
'      JOIN cb_g_procesos_simu_rspnsble c',
'        ON b.id_prcsos_smu_sjto = c.id_prcsos_smu_sjto',
'      JOIN si_c_sujetos d',
'        ON d.id_sjto = b.id_sjto',
'      JOIN (SELECT id_prcsos_smu_sjto,',
'                   MIN(vgncia) AS vigencia_desde,',
'                   MAX(vgncia) AS vigencia_hasta',
'              FROM cb_g_procesos_smu_mvmnto',
'             GROUP BY id_prcsos_smu_sjto) v',
'        ON v.id_prcsos_smu_sjto = b.id_prcsos_smu_sjto',
'     WHERE a.id_prcsos_smu_lte = v_lte',
'       AND b.indcdor_prcsdo = ''S''',
'       AND b.actvo = ''S''',
'     GROUP BY a.cdgo_clnte,',
'              a.fcha_lte,',
'              b.id_sjto,',
'              TO_CHAR(d.idntfccion),',
'              a.id_prcso_tpo,',
'              b.indcdor_prcsdo,',
'              a.id_fncnrio,',
'              b.vlor_ttal_dda,',
'              v.vigencia_desde,',
'              v.vigencia_hasta,',
'              a.id_prcsos_smu_lte,',
'              b.id_prcsos_smu_sjto,',
'              c.email',
'  ) LOOP',
'  ',
'    v_json_cnddto := json_object_t();',
'    ',
'    v_json_cnddto.put(''CLIENTE'', c_cnddtos_lte.cdgo_clnte);',
'    v_json_cnddto.put(''FECHA_LOTE'', c_cnddtos_lte.fcha_lte);',
'    v_json_cnddto.put(''ID_SUJETO'', c_cnddtos_lte.id_sjto);',
'    v_json_cnddto.put(''IDENTIFICACION'', c_cnddtos_lte.idntfccion);',
'    v_json_cnddto.put(''FUNCIONARIO'', c_cnddtos_lte.id_fncnrio);',
'    v_json_cnddto.put(''VALOR_CARTERA'', c_cnddtos_lte.vlor_ttal_dda);',
'    v_json_cnddto.put(''VIGENCIA_DESDE'', c_cnddtos_lte.vigencia_desde);',
'    v_json_cnddto.put(''VIGENCIA_HASTA'', c_cnddtos_lte.vigencia_hasta);',
'    v_json_cnddto.put(''RESPONSABLES'', c_cnddtos_lte.nmbre_rspnsbles);',
'    v_json_cnddto.put(''CODIGO_TIPO_PROCESO'', c_cnddtos_lte.id_prcso_tpo);',
'    v_json_cnddto.put(''ID_LOTE'', c_cnddtos_lte.id_prcsos_smu_lte);',
'    v_json_cnddto.put(''ID_SUJETO_LOTE'', c_cnddtos_lte.id_prcsos_smu_sjto);',
'',
'    v_json_array.append(v_json_cnddto);',
'  ',
'  END LOOP;',
'',
'  apex_json.open_object();',
'  apex_json.write(''o_json_cnddto'', v_json_array.to_clob());',
'  apex_json.write(''o_file_name'', ''Lote_'' || v_lte || ''_'' || TO_CHAR(SYSDATE, ''yyyymmddhhmiss'') || ''.xls'');',
'  apex_json.close_object();',
'  ',
'END;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3883737819930818)
,p_process_sequence=>80
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'registrarJson'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
' ',
'  v_cdgo_rspsta        number;',
'  v_mnsje_rspsta       varchar2(4000);',
'  v_error              exception;',
'  v_json_actos         clob;',
'  ',
'begin',
'',
'  for i in 1 .. apex_application.g_f01.count loop',
'    v_json_actos := v_json_actos || apex_application.g_f01(i);',
'  end loop;',
'  ',
'  insert into muerto (n_001,n_002,c_001,t_001) values (20241224,10,v_json_actos,systimestamp);',
'  commit;',
'',
'  pkg_cb_proceso_persuasivo.prc_rg_proceso_persuasivo_json(p_cdgo_clnte   => :F_CDGO_CLNTE,',
'                                                           p_id_usrio     => :F_ID_USRIO,',
'                                                           p_json_datos   => v_json_actos,',
'                                                           o_cdgo_rspsta  => v_cdgo_rspsta,',
'                                                           o_mnsje_rspsta => v_mnsje_rspsta);',
'',
'',
'  if (v_cdgo_rspsta <> 0) then',
'    raise v_error;',
'  else',
'    commit;           ',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'  end if;',
'',
'exception',
'  when v_error then',
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
 p_id=>wwv_flow_api.id(3983002101193801)
,p_process_sequence=>90
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'setearItem'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_vlor varchar2(1); ',
'    v_cdgo_rspsta number := 0; ',
'    v_mnsje_rspsta varchar2(4000); ',
'begin',
'    begin',
'        if apex_application.g_f01.count > 0 then',
'            v_vlor := apex_application.g_f01(1); ',
'        else',
'            v_cdgo_rspsta := 1;',
unistr('            v_mnsje_rspsta := ''No se recibi\00F3 ning\00FAn valor en f01.'';'),
'        end if;',
'    exception',
'        when others then',
'            v_cdgo_rspsta := 1;',
'            v_mnsje_rspsta := ''Error al obtener el valor de f01: '' || sqlerrm;',
'    end;',
'',
'    if v_cdgo_rspsta = 0 then',
'        begin',
'            APEX_UTIL.SET_SESSION_STATE(''P2024001_SEL_TDOS'', v_vlor);',
'        exception',
'            when others then',
'                v_cdgo_rspsta := 1;',
unistr('                v_mnsje_rspsta := ''Error al setear el \00EDtem P2024001_SEL_TDOS: '' || sqlerrm;'),
'        end;',
'    end if;',
'',
'    -- Respuesta JSON',
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
