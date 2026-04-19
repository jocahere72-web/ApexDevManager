prompt --application/pages/page_20250_002
begin
wwv_flow_api.create_page(
 p_id=>2025044
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Desembargo Puntual por Propietario'
,p_step_title=>'Desembargo Puntual por Propietario'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1',
'#APP_IMAGES#pdf-lib.min.js',
'#APP_IMAGES#FileSaver.min.js',
'#APP_IMAGES#jszip.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//Se ocultan los botones ',
'',
'function datos_resoluciones() {',
'    ',
'var region = apex.region("resoluciones")',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");   ',
'         console.log(''Entro 1'');',
'        ',
'         if (records.length > 0) {',
'              console.log(''Entro 2'');',
'            ',
'         var idResolucion = records.map(function (record) {',
'            return model.getValue(record, "ID_EMBRGOS_RSLCION");                 ',
'            })[0];',
'                console.log(''Entro 3'',idResolucion);  ',
'         var vigencias = records.map(function (record) {',
'            return model.getValue(record, "VGNCIAS");                 ',
'            })[0];',
'                  console.log(''Entro 4'',vigencias);     ',
'             ',
unistr('        apex.item("P152_ID_EMBRGOS_RSLCION").setValue(idResolucion);   // Reemplaza con el nombre de tu \00EDtem de sesi\00F3n'),
'        $s("P152_ID_EMBRGOS_RSLCION", idResolucion);',
unistr('        apex.item("P152_VGNCIAS").setValue(vigencias);   // Reemplaza con el nombre de tu \00EDtem de sesi\00F3n'),
'        $s("P152_VGNCIAS", vigencias);             ',
'        console.log(''Entro 5'',vigencias);               ',
'            ',
'     }',
'    }',
'   }',
'',
'   ',
'',
'',
'',
'function datos_oficios() {',
'    ',
'    var region = apex.region("oficios");',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'              ',
'        //OBTENEMOS UN JSON CON LOS DATOS SELECCIONADOS QUE NO HAN SIDO PROCESADOS',
'        var json = records.map(function (record) {',
'            return { "ID_SO": model.getValue(record, "ID_SLCTD_OFCIO").trim(),',
'                     "ID_EC": model.getValue(record, "ID_EMBRGOS_CRTRA").trim(),',
'                     "ID_ER": model.getValue(record, "ID_EMBRGOS_RSLCION").trim()',
'                   };',
'        });',
'               ',
'        //SETEAMOS EL VALOR DEL JSON EN FORMA DE CADENA AL ITEM ',
'        $s(''P110_JSON_OFCIOS'', json.length > 0 ? JSON.stringify(json) : '''');',
'        ',
'        //SETEAMOS EL VALOR DEL JSON EN FORMA DE CADENA AL LOCALSTORAGE ',
'        window.localStorage.setItem(''JSON_OFICIOS'', JSON.stringify(json));',
'        ',
'         //HABILITAMOS O DESHABILITAMOS EL BOTOM DEPENDIENDO SI HAY MAS DE UN REGISTRO SELECCIONADO',
'       /* if (json.length === 1 ){                ',
'            $s(''P42_ID_EMBRGOS_RSLCION'',  json[0]["ID_ER"] );//SETEAMOS EL VALOR DEL ID DE LA CARTERA SI SOLO HAY UNO SELECIONADO ',
'        }else {',
'            $s(''P42_ID_EMBRGOS_RSLCION'',  '''');',
'        }     */',
'        ',
'        //SOLO SE PUEDE INICIAR EL PROCESO SI HAY POR LO MENOS UN REGISTRO SELECCIONADO',
'        if (records.length > 0 ) {',
'            apex.item("BTN_RLCION_OFCIOS").show();',
'        }else {',
'            apex.item("BTN_RLCION_OFCIOS").hide();',
'        }',
'        ',
'        /*let jsonOficio = records.map(function (record) { return { "ID_ER": model.getValue(record, "ID_EMBRGOS_RSLCION").trim()',
'                                                                , "TIENE_DCMNTO": model.getValue(record, "TNE_DCMNTO") }; });',
'                                        window.localStorage.setItem(''jsonResolucionesEmbargoOficio'', JSON.stringify(jsonOficio.filter(data => { return data.TIENE_DCMNTO === ''S'' })));',
'        return;*/',
'',
'    }',
'    ',
'    apex.item("btn_desembargo_parcial").hide();    ',
'',
'}',
'',
'',
'function seleccionarTodos(e,btn,grid,data){',
'  let datos = data.map((m) => {',
'          return { "ID_ER": m.ID_EMBRGOS_RSLCION,',
'                   "ID_EC": m.ID_EMBRGOS_CRTRA,',
'                   "ID_IF": m.ID_INSTNCIA_FLJO,',
'                   "ID_ACTO": m.ID_ACTO,',
'                   "IDNTF": m.IDNTFCCION,',
'                   "ID_TE": m.ID_TPOS_EMBRGO,',
'                   "ID_FTE": m.ID_FLJO_TREA_ESTDO,',
'                   "ID_FT": m.ID_FLJO_TREA,',
'                   "TIENE_DCMNTO": m.TIENE_DCMNTO,',
'                   "TIENE_PLANTILLA": m.TIENE_PLANTILLA',
'                 }; ',
'      }); ',
'  ',
'  window.localStorage.setItem(''jsonResolucionesEmbargo'', JSON.stringify(dtos_si_dcmnto));',
'  // Validacion de no tener plantilla',
'  let dtos_no_plntlla = datos.filter((f) => { return f.TIENE_PLANTILLA === ''N'' });',
'  if (dtos_no_plntlla.length > 0) {',
'    apex.item("btn_Generar_Documentos").show();    ',
'  } else {',
'    apex.item("btn_Generar_Documentos").hide();',
'  }',
'  ',
'  // Validacion de si tener plantilla',
'  let dtos_si_plntlla = datos.filter((f) => { return f.TIENE_PLANTILLA === ''S'' && f.TIENE_DCMNTO === ''N'' });',
'  ',
'  if (dtos_si_plntlla.length > 0) {',
'    apex.item("btn_generar_actos").show();    ',
'  } else {',
'    apex.item("btn_generar_actos").hide();',
'  }',
'        ',
'  // Validacion de si tiene documento',
'  let dtos_si_dcmnto = datos.filter(f => { return f.TIENE_DCMNTO === ''S'' });',
'  ',
'  if(dtos_si_dcmnto.length > 0) {',
'    if(dtos_si_dcmnto.length > 1) {',
'      apex.item("BTN_IMPRMIR_2").show();',
'      apex.item("BTN_IMPRMIR").show();',
'    } else {',
'      apex.item("BTN_IMPRMIR_2").show();',
'      apex.item("BTN_IMPRMIR").hide();',
'    }',
'  } else {',
'    apex.item("BTN_IMPRMIR_2").hide();',
'    apex.item("BTN_IMPRMIR").hide();',
'  }',
'  ',
'  window.localStorage.setItem(''jsonResolucionesEmbargoOficio'', JSON.stringify(dtos_si_dcmnto));',
'  //apex.submit(''btn_Procesar_Embargo'');',
'}',
'',
'/***********************************************************',
unistr('********************GENERACI\00D3N MASIVA DE PDF''S**************'),
'***********************************************************/',
'const peticionServerProcess = (proc, json) => {',
'    return apex.server.process(proc, json);',
'}',
'',
'const convertBase64ToFile = (base64String, fileName) => {',
'     let arr = base64String.split('','');',
'     let mime = arr[0].match(/:(.*?);/)[1];',
'     let bstr = atob(arr[1]);',
'     let n = bstr.length;',
'     let uint8Array = new Uint8Array(n);',
'     while (n--) {',
'        uint8Array[n] = bstr.charCodeAt(n);',
'     }',
'     let file = new File([uint8Array], fileName, { type: mime });',
'     return file;',
'}',
'',
'const readFileAsync = (file) => {',
'  return new Promise((resolve, reject) => {',
'    let reader = new FileReader();',
'    reader.onload = () => {',
'      resolve(reader.result);',
'    };',
'    reader.onerror = reject;',
'    reader.readAsArrayBuffer(file);',
'  })',
'}',
'',
'const download = async (file, filename, type) => {',
'  const link = document.createElement(''a'');',
'  link.download = filename;',
'  let binaryData = [];',
'  binaryData.push(file);',
'  link.href = await URL.createObjectURL(new File(binaryData, { type: ''application/pdf'' }))',
'  link.download = filename;',
'  link.click();',
'}',
'',
'',
'const merge = async () => {',
'  console.time(''loop'');',
'  let popup = apex.widget.waitPopup();',
'  let v_json = localStorage.getItem(''jsonResolucionesEmbargo'');',
'  let array = JSON.parse(v_json);',
'  console.log(''Array de merge'',array)',
'  let cantidad = array.length;',
'  console.log(''cantidad'', cantidad)',
'  if (cantidad > 0) {',
'    let PDFDocument = PDFLib.PDFDocument;',
'    const mergedPdf = await PDFDocument.create();',
'    let i = 0;',
'    let respData = [];',
'    while (i < cantidad) {',
'      const { data } = await peticionServerProcess(''prc_co_documentos'', { f01: JSON.stringify(array.slice(i, i + 19 + 1))});',
'      console.log(`# de datos => ${data.length}`)',
'      let j = 0',
'      console.log(''data => '', data)',
'      while (j < data.length) {',
'        let tem = await convertBase64ToFile(`data:application/pdf;base64,${data[j].fileBlob}`, data[j].fileName);',
'        const document = await readFileAsync(tem);',
'        const document2 = await PDFDocument.load(document);',
'        let copiedPages = await mergedPdf.copyPages(document2, document2.getPageIndices());',
'        copiedPages.forEach((page) => mergedPdf.addPage(page));',
'        j++;',
'      }',
'      respData = respData.concat(data)',
'      i = i + 20;',
'    }',
'    const mergedPdfFile = await mergedPdf.save();',
'    //download(mergedPdfFile, `Detalle lote #${nmro_lote}.pdf`, ''application/pdf'');',
'    let zip = new JSZip();',
'    zip.file(`Gestion_de_embargos.pdf`, mergedPdfFile);',
'    zip.generateAsync({ type: "blob" }).then(mergedPdfFile => {',
'      download(mergedPdfFile, `Resoluciones_de_embargo_masivo.zip`, ''application/zip'');',
'    });',
'    console.timeEnd(''loop''); // Muestra por consola: "loop: 63ms"',
'  } else {',
'    alert(''No existen documentos asociados.'')',
'  }',
'  popup.remove();',
'}',
'',
'const merge_2 = async () => {',
'  console.time(''loop'');',
'  let popup = apex.widget.waitPopup();',
'  let zip = new JSZip();',
'  let v_json = localStorage.getItem(''jsonResolucionesEmbargo'');',
'  let contentJson = JSON.parse(v_json)',
'  let array = JSON.parse(v_json);',
'  console.log(''Array de merge'',array)',
'  let cantidad = array.length;',
'  let contador = 0;',
'  console.log(''cantidad'', v_json)',
'  if (cantidad > 0) {',
'    let i = 0;',
'    let respData = [];',
'    while (i <= cantidad) {',
'      const { data } = await peticionServerProcess(''prc_co_documentos'', { f01: JSON.stringify(array.slice(i, i + 19 + 1)) });',
'      console.log(`# de datos => ${data.length}`)',
'      let j = 0',
'      while (j < data.length) {',
'          ',
'        let PDFDocument = PDFLib.PDFDocument;',
'        const mergedPdf = await PDFDocument.create();',
'        let tem = await convertBase64ToFile(`data:application/pdf;base64,${data[j].fileBlob}`, data[j].fileName);',
'        const document = await readFileAsync(tem);',
'        const document2 = await PDFDocument.load(document);',
'        let copiedPages = await mergedPdf.copyPages(document2, document2.getPageIndices());',
'        copiedPages.forEach((page) => mergedPdf.addPage(page));',
'          ',
'        const mergedPdfFile = await mergedPdf.save();',
'        let file = new File([mergedPdfFile], "prueba" + i + j +".pdf", {',
'          type: "application/pdf;charset=utf-8",',
'        });',
'        let obj = contentJson[contador];',
'        zip.file(data[j].fileName, file);',
'        contador++;',
'        j++;',
'      }',
'      respData = respData.concat(data)',
'      i = i + 20;',
'    }',
'      ',
'    zip.generateAsync({ type: "blob" }).then(mergedPdfFile => {',
'      download(mergedPdfFile, `Resoluciones_de_embargo_individual.zip`, ''application/zip'');',
'    });',
'    console.timeEnd(''loop''); // Muestra por consola: "loop: 63ms"',
'  } else {',
'    alert(''No existen documentos asociados.'')',
'  }',
'  popup.remove();',
'}',
'',
'const merge_oficio_puntual_x_resolucion = async () => {',
'   //debugger;',
'  console.time(''loop'');',
'  let popup = apex.widget.waitPopup();',
'  let zip = new JSZip();',
'  let json = localStorage.getItem(''jsonResolucionesEmbargoOficio'');',
'    console.log(''of1'', json)',
'  let array = JSON.parse(json);',
'  console.log(''Array de merge'', array)',
'  let cantidad = array.length;',
'  let contador = 0;',
'    ',
'  if (cantidad > 0) {',
'    let i = 0;',
'    let respData = [];',
'    while (i < cantidad) {',
'      console.log(''i: ''+i+'' - array: ''+array[i].ID_ER);',
'      const { dataOficio } = await peticionServerProcess(''prc_co_documentos_oficio'', { x01: array[i].ID_ER });',
'      //const { dataOficio } = await peticionServerProcess(''prc_co_documentos_oficio'', { x01: json });',
'      console.log(''i: ''+i+'' - array: ''+JSON.stringify(dataOficio));',
'      const { data } = await peticionServerProcess(''prc_co_documentos_individual_oficios'', { f01:  JSON.stringify(dataOficio) });',
'      console.log(`# de datos => ${data.length}`)',
'      let j = 0 ',
'      while (j < data.length) {',
'        let PDFDocument = PDFLib.PDFDocument;',
'        const mergedPdf = await PDFDocument.create();',
'        let tem = await convertBase64ToFile(`data:application/pdf;base64,${data[j].fileBlob}`, data[j].fileName);',
'        const document = await readFileAsync(tem);',
'        const document2 = await PDFDocument.load(document);',
'        let copiedPages = await mergedPdf.copyPages(document2, document2.getPageIndices());',
'        copiedPages.forEach((page) => mergedPdf.addPage(page));',
'          ',
'        const mergedPdfFile = await mergedPdf.save();',
'        let file = new File([mergedPdfFile], "prueba" + i + j +".pdf", {',
'          type: "application/pdf;charset=utf-8",',
'        });',
'        //let obj = contentJson[contador];',
'        zip.file(data[j].fileName, file);',
'        contador++;',
'        j++;',
'      }',
'      i++;',
'    }',
'      ',
'    zip.generateAsync({ type: "blob" }).then(mergedPdfFile => {',
'      download(mergedPdfFile, `Oficios_de_embargo_individual.zip`, ''application/zip'');',
'    });',
'    ',
'  } else {',
'    alert(''No existen documentos asociados.'')',
'  }',
'  popup.remove();',
'  console.timeEnd(''loop''); // Muestra por consola: "loop: 63ms"',
'}',
'',
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
'',
'    ',
'    //Recorrer las resoluciones',
'    /*while (i < array.length) {',
'        console.log(''while: ''+i);',
unistr('        //data de oficios de x cada resoluci\00F3n de embargo seleccionada.'),
'        const { dataOficio } = await peticionServerProcess(''prc_co_documentos_oficio'', { x01: array[i].ID_ER });',
'        ',
'        console.log(''Data_Oficio: ''+JSON.stringify(dataOficio));',
'        ',
'        let j = 0;',
'        ',
'        while (j < dataOficio.length){',
unistr('            //Data de los actos pertenecientes a los oficios de cada resoluci\00F3n de embargo seleccionada.'),
'            const { data } = await peticionServerProcess(''prc_co_documentos'', { f01: JSON.stringify(dataOficio) });',
'             ',
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
'',
'        i++;',
'    }*/',
'        ',
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
'/*****************************************************************************************',
unistr('**************************************FIN GENERACI\00D3N MASIVA*******************************'),
'*****************************************************************************************/',
'',
'async function MensajeRespuesta(){',
'    ',
unistr('    console.log(''Ejecuto la funci\00F3n MensajeRespuesta'');'),
'    var json = window.localStorage.getItem(''jsonResolucionesEmbargo'');',
'    console.log(''Json: ''+json);',
'    let $waitPopup;',
'    ',
'await apex.server.process("ConsultarOficio", {',
'                f01: json,',
'                pageItems: "#"',
'            },{',
'                success: function(data){',
'                    console.log(data);',
'                    if (data.o_cdgo_rspsta === 0){',
'                        ',
'                        apex.item( "BTN_GNRA_OFCIO" ).show();',
'                        ',
'                        ',
'                    }else{',
'                        apex.item( "BTN_GNRA_OFCIO" ).hide();',
'                   }',
'             }',
'      })',
'}',
'',
'',
'',
'//Generacion de oficios',
'const GenerarDocumentosEmbargoOficio = () => {',
'    var json = window.localStorage.jsonResolucionesEmbargo;',
'    var $waitPopup;',
'    console.log(''Json: ''+json);',
'  console.log(''Ejecuto la funcion GenerarDocumentosEmbargoOficio'');',
'    try {',
'        //JSON.parse(json);',
unistr('        apex.message.confirm(''\00BFEst\00E1 seguro de enviar los registros para generar los actos de embargo?'', (ok) => {'),
'            if (ok) {',
'                if (apex.page.validate()) {',
'                    $waitPopup = apex.widget.waitPopup();',
'                    apex.server.process("GenerarActosEmbargoOficio", {',
'                        f01: json,',
'                        pageItems: ""',
'                    }).then((resp) => {',
'                        $waitPopup.remove();',
'                        if (resp.o_cdgo_rspsta === 0) {',
'                            Swal.fire(        ',
unistr('                                        ''<h2><b>\00A1El proceso se ha iniciado correctamente!</b></h2>'','),
'                                        ''<h3>'' + ''Se ha enviado un correo electronico a '' + resp.correo + ''</h3>'',',
'                                        ''success''',
'                            ).then((result) => {',
'                                //apex.submit();',
'                                if (resp.o_url !== ''#''){',
'                                    window.location.href = '''';',
'                                }',
'',
'                            });',
'                            //window.location.href = '''';',
'                        }else{',
'                            Swal.fire({        ',
'                                icon: ''error'',',
unistr('                                title:  ''<H2 >Validaci\00F3n</H2>'','),
'                                html:   `<h4>${resp.o_cdgo_rspsta+''-''+resp.o_mnsje_rspsta}</h4>`',
'                            }).then((result) => {',
'                                //$(elm).val('''');',
'                            }); ',
'                        }',
'                    });',
'                }',
'            }',
'        })',
'',
'    } catch (e) {',
'        apex.message.clearErrors();',
'        apex.message.showErrors([',
'            {',
'                type: "error",',
'                location: ["page"],',
'                message: "No se encontraron datos seleccionados",',
'                unsafe: false',
'            }]);',
'    } finally {',
'        if ($waitPopup)',
'            $waitPopup.remove();',
'    }',
'}',
'',
'async function Informacion_Reporte_Embargo_Excel(){',
'    ',
unistr('    console.log(''Ejecuto la funci\00F3n MensajeRespuesta'');'),
'    var json = window.localStorage.getItem(''JSON_OFICIOS'');',
'    console.log(''Json: ''+json);',
'    let $waitPopup;',
'    ',
'    await apex.server.process("DescargarExcel", {',
'                f01: json,',
'                pageItems: "#"',
'            },{',
'                success: function(data){',
'                    console.log(data);',
'                    if (data.o_cdgo_rspsta === 0){',
'                        ',
'                        apex.item( "P110_TPO_ENTDD" ).setValue(data.v_tpo_entdd);',
'                        apex.item( "P110_LTE_ENTDD_BR" ).setValue(data.v_lte_mdda_ctlar);',
'                        apex.item( "P110_RSLCNS_IMPRSN" ).setValue(data.v_rslcnes_imprsn);',
'                        apex.submit( ''imprimir_branch'' ); ',
'                        ',
'                    }else{',
'                        Swal.fire({        ',
'                                icon: ''error'',',
unistr('                                title:  ''<H2 >Validaci\00F3n</H2>'','),
'                                html:   `<h4>${data.o_cdgo_rspsta+''-''+data.o_mnsje_rspsta}</h4>`',
'                            });',
'                        //apex.item( "BTN_GNRA_OFCIO" ).hide();//poner el swalfire',
'                   }',
'             }',
'      })',
'}',
''))
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'YGOMEZ'
,p_last_upd_yyyymmddhh24miss=>'20250915123749'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(150784729340214543)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
' ',
'    </b>',
'</h5>',
'<p>Funcionalidad que permite realizar el desembargo parcial por propietarios del embargo seleccionado. </p>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(150785196237214548)
,p_plug_name=>'Oficios de Embargo'
,p_region_name=>'oficios'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_slctd_ofcio,',
'       a.id_embrgos_crtra,',
'       a.id_entddes,',
'       a.nmro_acto_ofcio,',
'       to_char(a.fcha_ofcio,''dd/mm/yyyy'') as fcha_ofcio,',
'       a.dscrpcion,',
'       a.rspnsble,',
'       a.activo,',
'       a.id_embrgos_rslcion,',
'       b.cnsctvo_embrgo,',
'       b.idntfccion,',
'       b.id_tpos_embrgo,',
'       a.acto_ofcio,',
'       case when c.id_dcmnto is not null then',
'           ''S''',
'       else',
'           ''N''',
'       end as tne_dcmnto,',
'       case when a.acto_ofcio is null and c.id_dcmnto is null',
'                then ',
'                ''<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" aria-labelledby="id_tareas_ig_grid_vc_ctx id_tareas_ig_grid_vc_cur">Modificar plantilla <span class="fa     fa-external'
||'-link"></span>',
'                </button>''',
'        else '' ''',
'       end as plantilla,',
'       case when a.acto_ofcio is not null',
'                then ''<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" aria-labelledby="id_tareas_ig_grid_vc_ctx id_tareas_ig_grid_vc_cur">Ver PDF <span class="fa fa-eye"></span>',
'            </button>''',
'        else '' ''',
'       end as pdf,',
'       e.tpo_imprsion_ofcio',
'  from v_mc_g_solicitudes_y_oficios a',
'  join v_mc_g_embargos_resolucion b on b.id_embrgos_rslcion = a.id_embrgos_rslcion',
'                                   and b.id_embrgos_crtra = a.id_embrgos_crtra',
'  left join gn_g_actos            c on c.id_acto = a.acto_ofcio',
'  join mc_d_entidades            d on a.id_entddes = d.id_entddes',
'  join mc_d_entidades_tipo      e on d.cdgo_entdad_tpo = e.cdgo_entdad_tpo',
' where a.id_embrgos_rslcion is not null',
'   and not exists (select 2',
'                     from mc_g_desembargos_oficio c',
'                    where c.id_slctd_ofcio = a.id_slctd_ofcio',
'                      and c.estado_rvctria = ''N'');',
'                      '))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(151633179598028586)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(28056595785834443)
,p_name=>'NMRO_ACTO_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO_OFCIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero Acto Oficio')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>240
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
 p_id=>wwv_flow_api.id(28056617052834444)
,p_name=>'FCHA_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_OFCIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha Oficio'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>250
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(28056780652834445)
,p_name=>'ID_EMBRGOS_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RSLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>260
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_parent_column_id=>wwv_flow_api.id(78421754695490152)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(28056896089834446)
,p_name=>'CNSCTVO_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNSCTVO_EMBRGO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Consecutivo embargo'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>270
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
 p_id=>wwv_flow_api.id(28056942444834447)
,p_name=>'ID_TPOS_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TPOS_EMBRGO'
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
 p_id=>wwv_flow_api.id(28057025828834448)
,p_name=>'ACTO_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTO_OFCIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Acto Oficio'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>290
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
 p_id=>wwv_flow_api.id(28057122096834449)
,p_name=>'TNE_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNE_DCMNTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFTiene Documento?')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>300
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>1
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
 p_id=>wwv_flow_api.id(28057209660834450)
,p_name=>'PLANTILLA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PLANTILLA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Plantilla'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>310
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>273
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
 p_id=>wwv_flow_api.id(28057355180834451)
,p_name=>'TPO_IMPRSION_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_IMPRSION_OFCIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Tipo Impresi\00F3n Oficio')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>320
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(83287222962041154)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(150785455015214550)
,p_name=>'ID_SLCTD_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTD_OFCIO'
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
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(150785495340214551)
,p_name=>'ID_EMBRGOS_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_CRTRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(150785930800214555)
,p_name=>'ID_ENTDDES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ENTDDES'
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
 p_id=>wwv_flow_api.id(150786025049214556)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Entidad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(171115641600344040)
,p_name=>'RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSPNSBLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Responsable'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>403
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
 p_id=>wwv_flow_api.id(171115738669344041)
,p_name=>'ACTIVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTIVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(150785277587214549)
,p_internal_uid=>150785277587214549
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
 p_id=>wwv_flow_api.id(151689282565217210)
,p_interactive_grid_id=>wwv_flow_api.id(150785277587214549)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(151689438554217211)
,p_report_id=>wwv_flow_api.id(151689282565217210)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28159596903000745)
,p_view_id=>wwv_flow_api.id(151689438554217211)
,p_display_seq=>22
,p_column_id=>wwv_flow_api.id(28056595785834443)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28160099701000748)
,p_view_id=>wwv_flow_api.id(151689438554217211)
,p_display_seq=>23
,p_column_id=>wwv_flow_api.id(28056617052834444)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28160604151000749)
,p_view_id=>wwv_flow_api.id(151689438554217211)
,p_display_seq=>24
,p_column_id=>wwv_flow_api.id(28056780652834445)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28161091364000751)
,p_view_id=>wwv_flow_api.id(151689438554217211)
,p_display_seq=>25
,p_column_id=>wwv_flow_api.id(28056896089834446)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28161602026000752)
,p_view_id=>wwv_flow_api.id(151689438554217211)
,p_display_seq=>26
,p_column_id=>wwv_flow_api.id(28056942444834447)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28162098051000754)
,p_view_id=>wwv_flow_api.id(151689438554217211)
,p_display_seq=>27
,p_column_id=>wwv_flow_api.id(28057025828834448)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28162573894000755)
,p_view_id=>wwv_flow_api.id(151689438554217211)
,p_display_seq=>28
,p_column_id=>wwv_flow_api.id(28057122096834449)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28162999291000756)
,p_view_id=>wwv_flow_api.id(151689438554217211)
,p_display_seq=>29
,p_column_id=>wwv_flow_api.id(28057209660834450)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28163504662000758)
,p_view_id=>wwv_flow_api.id(151689438554217211)
,p_display_seq=>30
,p_column_id=>wwv_flow_api.id(28057355180834451)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83443913373615799)
,p_view_id=>wwv_flow_api.id(151689438554217211)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(83287222962041154)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(151691185458217245)
,p_view_id=>wwv_flow_api.id(151689438554217211)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(150785455015214550)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(151691723803217246)
,p_view_id=>wwv_flow_api.id(151689438554217211)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(150785495340214551)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(151693743956217253)
,p_view_id=>wwv_flow_api.id(151689438554217211)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(150785930800214555)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(151694221336217255)
,p_view_id=>wwv_flow_api.id(151689438554217211)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(150786025049214556)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>219
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(172362311475377512)
,p_view_id=>wwv_flow_api.id(151689438554217211)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(171115641600344040)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>279
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(172362823292377515)
,p_view_id=>wwv_flow_api.id(151689438554217211)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(171115738669344041)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(151633179598028586)
,p_plug_name=>'Resoluciones de Embargo'
,p_region_name=>'resoluciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select x.*',
'from (',
'        select distinct a.id_embrgos_rslcion,',
'               a.id_embrgos_crtra,',
'               --a.cnsctvo_embrgo,',
'               to_char(trunc(a.fcha_rgstro_embrgo),''dd/mm/yyyy'') as fcha_rgstro_embrgo,',
'               a.id_acto,',
'               a.nmro_acto,',
'               to_char(a.fcha_acto,''dd/mm/yyyy'') as fcha_acto,',
'               a.id_tpos_embrgo,',
'               a.dscrpcion_tipo_embargo,',
'               a.idntfccion,',
'               a.vgncias,',
'               a.cdgo_crtra,',
'               a.id_instncia_fljo,',
'               a.id_fljo_trea_estdo,',
'               a.CDGO_ESTDO_PRCSO,',
'               a.id_fljo_trea,',
'               d.DSCRPCION_VSBLE as Estado,              ',
'               a.dscrpcion_estado_crtra as dscrpcion_estdo_crtra,',
'               case when a.id_acto is not null and a.id_dcmnto is not null',
'                    then ''<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" aria-labelledby="id_tareas_ig_grid_vc_ctx id_tareas_ig_grid_vc_cur">Ver PDF <span class="fa fa-eye"></span></b'
||'utton>''',
'                    else '' ''',
'               end as pdf,',
'               case when a.dcmnto_rslcion is not null and a.id_dcmnto is null',
'                   then ''<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" aria-labelledby="id_tareas_ig_grid_vc_ctx id_tareas_ig_grid_vc_cur">Modificar plantilla <span class="fa fa-exte'
||'rnal-link"></span></button>''',
'                   else '' ''',
'               end as plantilla,       ',
'               case when a.dcmnto_rslcion is not null',
'                   then ''S''',
'                   else ''N''',
'                end as tiene_plantilla,        ',
'                case when a.id_acto is not null',
'                   then ''S''',
'                   else ''N''',
'                end as tiene_acto,',
'                case when a.id_dcmnto is not null',
'                   then ''S''',
'                   else ''N''',
'                end as tiene_dcmnto,',
unistr('                decode(z.id_embrgos_rslcion,null,''No'',''S\00ED'') TIENE_REMANENTE'),
'        from v_mc_g_embargos_resolucion a',
'        --join mc_d_estados_cartera b on b.id_estdos_crtra = a.id_estdos_crtra',
'        left join wf_d_flujos_tarea_estado d on d.id_fljo_trea = a.id_fljo_trea',
'                                            and d.id_fljo_trea_estdo = a.id_fljo_trea_estdo',
'        left join mc_g_solicitudes_y_oficios e on e.id_embrgos_crtra = a.id_embrgos_crtra    ',
'        left join mc_g_embrgo_remnte_dtlle z on a.id_embrgos_rslcion = z.id_embrgos_rslcion',
'        left join mc_g_embargos_remanente y on y.id_embrgos_rmnte = z.id_embrgos_rmnte   ',
'                  and z.id_embrgos_rslcion in (select m.id_embrgo_rslcion from gf_g_titulos_judicial m)    ',
'        where a.cdgo_clnte = :F_CDGO_CLNTE',
'        and a.id_tpos_embrgo = :P2025044_TPO_EMBRGO',
'        and a.cdgo_estdos_crtra in (''E'',''S'')',
'        and (:P2025044_RSLCION_EMBARGO is null or a.nmro_acto = :P2025044_RSLCION_EMBARGO)',
'        and (:P2025044_FCHA_RSLCION_DSDE is null or trunc(a.fcha_acto) >= trunc(to_date(:P2025044_FCHA_RSLCION_DSDE,''DD/MM/YYYY'')))',
'        and (:P2025044_FCHA_RSLCION_HSTA is null or trunc(a.fcha_acto) <= trunc(to_date(:P2025044_FCHA_RSLCION_HSTA,''DD/MM/YYYY'')))',
'        and (:P2025044_FCHA_RGSTRO_DSDE is null or trunc(a.fcha_rgstro_embrgo) >= trunc(to_date(:P2025044_FCHA_RGSTRO_DSDE,''DD/MM/YYYY'')))',
'        and (:P2025044_FCHA_RGSTRO_HSTA is null or trunc(a.fcha_rgstro_embrgo) <= trunc(to_date(:P2025044_FCHA_RGSTRO_HSTA,''DD/MM/YYYY'')))',
'        and (:P2025044_SUJETO is null or a.idntfccion = :P2025044_SUJETO)',
'        and (:P2025044_TIENE_OFCIO is null or e.gnra_ofcio = :P2025044_TIENE_OFCIO)',
'      /*  and exists (select 1 from V_GF_G_MOVIMIENTOS_DETALLE n                     ',
'                       join si_i_sujetos_impuesto s on s.id_sjto_impsto =  n.id_sjto_impsto',
'                     where n.idntfccion is not null',
'                        and n.cdgo_clnte = a.cdgo_clnte',
'                        and n.id_impsto = a.id_impsto  ',
'                        and n.id_impsto_sbmpsto = a.id_impsto_sbmpsto',
'                        and s.id_sjto = a.id_sjto)*/',
'        and exists (select 1',
'                      from v_mc_g_embargos_rspnsble_emb d',
'                     where d.id_embrgos_crtra = a.id_embrgos_crtra',
'                       and d.id_embrgos_rslcion = a.id_embrgos_rslcion',
'                       and (:P2025044_ID_RSPNSBLE is null or trim(d.idntfccion) = trim(:P2025044_ID_RSPNSBLE)))) x',
'where (:P2025044_TIENE_DCMTO is null or x.tiene_acto = :P2025044_TIENE_DCMTO)',
' group by x.id_embrgos_rslcion,',
'            x.id_embrgos_crtra,',
'            x.fcha_rgstro_embrgo,',
'            x.id_acto,',
'            x.nmro_acto,',
'            x.fcha_acto,',
'            x.id_tpos_embrgo,',
'            x.dscrpcion_tipo_embargo,',
'            x.idntfccion,',
'            x.vgncias,',
'            x.cdgo_crtra,',
'            x.id_instncia_fljo,',
'            x.id_fljo_trea_estdo,',
'            x.id_fljo_trea,',
'            x.Estado,',
'            x.dscrpcion_estdo_crtra,',
'            x.pdf,',
'            x.plantilla,',
'            x.tiene_plantilla,',
'            x.tiene_acto,',
'            x.CDGO_ESTDO_PRCSO,',
'            x.tiene_dcmnto,',
'            x.tiene_remanente'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(28057423830834452)
,p_name=>'FCHA_RGSTRO_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO_EMBRGO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha Registro Embargo'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>380
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(28057537065834453)
,p_name=>'ID_TPOS_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TPOS_EMBRGO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>390
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
 p_id=>wwv_flow_api.id(28057683948834454)
,p_name=>'VGNCIAS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIAS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Vigencias'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>400
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(28057707233834455)
,p_name=>'CDGO_ESTDO_PRCSO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ESTDO_PRCSO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado Proceso'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>410
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(28057865589834456)
,p_name=>'DSCRPCION_ESTDO_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ESTDO_CRTRA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado Cartera'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>420
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(28057905757834457)
,p_name=>'PLANTILLA1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PLANTILLA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>430
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(28058075111834458)
,p_name=>'TIENE_PLANTILLA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIENE_PLANTILLA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tiene Plantilla'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>440
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>1
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
 p_id=>wwv_flow_api.id(28058149350834459)
,p_name=>'TIENE_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIENE_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tiene Acto'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>450
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>1
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
 p_id=>wwv_flow_api.id(28058250459834460)
,p_name=>'TIENE_REMANENTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIENE_REMANENTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tiene Remanente'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>460
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(28237045117163169)
,p_name=>'PDF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PDF'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>470
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(78420768936490142)
,p_name=>'CDGO_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CRTRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('C\00F3digo <br> Cartera')
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>240
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
 p_id=>wwv_flow_api.id(78420903438490143)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
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
 p_id=>wwv_flow_api.id(78421003472490144)
,p_name=>'ID_FLJO_TREA_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA_ESTDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>260
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(78421069225490145)
,p_name=>'ID_FLJO_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA'
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
 p_id=>wwv_flow_api.id(78421172287490146)
,p_name=>'ESTADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTADO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>280
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
 p_id=>wwv_flow_api.id(78421754695490152)
,p_name=>'ID_EMBRGOS_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RSLCION'
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
 p_id=>wwv_flow_api.id(78422613019490160)
,p_name=>'ID_EMBRGOS_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_CRTRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>320
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(150784909055214545)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(150785003515214546)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(151636180339028593)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading_alignment=>'RIGHT'
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(151636871063028593)
,p_name=>'FCHA_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Fecha <br>Resoluci\00F3n')
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(151637390737028594)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Resoluci\00F3n <br> Desembargo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(171115349134344037)
,p_name=>'DSCRPCION_TIPO_EMBARGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_TIPO_EMBARGO'
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
 p_id=>wwv_flow_api.id(171115426023344038)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>25
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
 p_id=>wwv_flow_api.id(181820863004659244)
,p_name=>'TIENE_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIENE_DCMNTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>370
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(151633693705028587)
,p_internal_uid=>151633693705028587
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
end;
/
begin
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(151634098624028588)
,p_interactive_grid_id=>wwv_flow_api.id(151633693705028587)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(151634215554028589)
,p_report_id=>wwv_flow_api.id(151634098624028588)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28168211250030768)
,p_view_id=>wwv_flow_api.id(151634215554028589)
,p_display_seq=>35
,p_column_id=>wwv_flow_api.id(28057423830834452)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28168720552030769)
,p_view_id=>wwv_flow_api.id(151634215554028589)
,p_display_seq=>36
,p_column_id=>wwv_flow_api.id(28057537065834453)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28169230382030771)
,p_view_id=>wwv_flow_api.id(151634215554028589)
,p_display_seq=>37
,p_column_id=>wwv_flow_api.id(28057683948834454)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28169721238030772)
,p_view_id=>wwv_flow_api.id(151634215554028589)
,p_display_seq=>38
,p_column_id=>wwv_flow_api.id(28057707233834455)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28170242605030774)
,p_view_id=>wwv_flow_api.id(151634215554028589)
,p_display_seq=>39
,p_column_id=>wwv_flow_api.id(28057865589834456)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28170741494030776)
,p_view_id=>wwv_flow_api.id(151634215554028589)
,p_display_seq=>40
,p_column_id=>wwv_flow_api.id(28057905757834457)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28171245415030777)
,p_view_id=>wwv_flow_api.id(151634215554028589)
,p_display_seq=>41
,p_column_id=>wwv_flow_api.id(28058075111834458)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28171741315030779)
,p_view_id=>wwv_flow_api.id(151634215554028589)
,p_display_seq=>42
,p_column_id=>wwv_flow_api.id(28058149350834459)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28172269938030780)
,p_view_id=>wwv_flow_api.id(151634215554028589)
,p_display_seq=>43
,p_column_id=>wwv_flow_api.id(28058250459834460)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28335144492967276)
,p_view_id=>wwv_flow_api.id(151634215554028589)
,p_display_seq=>44
,p_column_id=>wwv_flow_api.id(28237045117163169)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(78635402565238448)
,p_view_id=>wwv_flow_api.id(151634215554028589)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(78420768936490142)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>123
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(78635777085238452)
,p_view_id=>wwv_flow_api.id(151634215554028589)
,p_display_seq=>24
,p_column_id=>wwv_flow_api.id(78420903438490143)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(78636255286238455)
,p_view_id=>wwv_flow_api.id(151634215554028589)
,p_display_seq=>25
,p_column_id=>wwv_flow_api.id(78421003472490144)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(78636743405238456)
,p_view_id=>wwv_flow_api.id(151634215554028589)
,p_display_seq=>26
,p_column_id=>wwv_flow_api.id(78421069225490145)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(78637292153238458)
,p_view_id=>wwv_flow_api.id(151634215554028589)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(78421172287490146)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>77
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(82324791509667891)
,p_view_id=>wwv_flow_api.id(151634215554028589)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(78421754695490152)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83187477007362909)
,p_view_id=>wwv_flow_api.id(151634215554028589)
,p_display_seq=>29
,p_column_id=>wwv_flow_api.id(78422613019490160)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(151636615635028593)
,p_view_id=>wwv_flow_api.id(151634215554028589)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(151636180339028593)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(151637243879028594)
,p_view_id=>wwv_flow_api.id(151634215554028589)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(151636871063028593)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>126
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(151637793448028594)
,p_view_id=>wwv_flow_api.id(151634215554028589)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(151637390737028594)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>179
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(151690320746217214)
,p_view_id=>wwv_flow_api.id(151634215554028589)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(150784909055214545)
,p_is_visible=>false
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(172349670930213640)
,p_view_id=>wwv_flow_api.id(151634215554028589)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(171115349134344037)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>123
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(172350113029213643)
,p_view_id=>wwv_flow_api.id(151634215554028589)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(171115426023344038)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>191
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(181872838299879896)
,p_view_id=>wwv_flow_api.id(151634215554028589)
,p_display_seq=>33
,p_column_id=>wwv_flow_api.id(181820863004659244)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(156993466566399465)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <b>',
'        <center>Opciones ',
'            <i class="fa fa-gears" aria-hidden="true"></i>',
'        </center>',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(171115955995344043)
,p_plug_name=>'Responsables'
,p_region_name=>'Grib_Responsables'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_embrgos_rspnsble,',
'       a.id_embrgos_crtra,',
'       a.id_embrgos_rslcion,',
'       a.dscrpcion_idntfccion_tpo,',
'       a.idntfccion,',
'       a.nmbre_cmplto,',
'       a.dsmbrgdo',
'from v_mc_g_embargos_rspnsble_emb a'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(151633179598028586)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(28416835898582066)
,p_name=>'DSMBRGDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSMBRGDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('\00BFDesembargado?')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Si;S,No;N'
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
 p_id=>wwv_flow_api.id(171117009348344054)
,p_name=>'ID_EMBRGOS_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RSPNSBLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(171117127193344055)
,p_name=>'ID_EMBRGOS_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_CRTRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(171117231818344056)
,p_name=>'ID_EMBRGOS_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RSLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(78421754695490152)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(171117281398344057)
,p_name=>'DSCRPCION_IDNTFCCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_IDNTFCCION_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Tipo identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(171117438612344058)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(171117484318344059)
,p_name=>'NMBRE_CMPLTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_CMPLTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>403
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
 p_id=>wwv_flow_api.id(171116876613344053)
,p_internal_uid=>171116876613344053
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
 p_id=>wwv_flow_api.id(172398084064703862)
,p_interactive_grid_id=>wwv_flow_api.id(171116876613344053)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(172398215356703862)
,p_report_id=>wwv_flow_api.id(172398084064703862)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28578412840605450)
,p_view_id=>wwv_flow_api.id(172398215356703862)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(28416835898582066)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(172398760629703865)
,p_view_id=>wwv_flow_api.id(172398215356703862)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(171117009348344054)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(172399213626703868)
,p_view_id=>wwv_flow_api.id(172398215356703862)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(171117127193344055)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(172399698251703870)
,p_view_id=>wwv_flow_api.id(172398215356703862)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(171117231818344056)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(172400228004703871)
,p_view_id=>wwv_flow_api.id(172398215356703862)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(171117281398344057)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(172400679765703872)
,p_view_id=>wwv_flow_api.id(172398215356703862)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(171117438612344058)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(172401237262703875)
,p_view_id=>wwv_flow_api.id(172398215356703862)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(171117484318344059)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(171117605743344060)
,p_plug_name=>'tab'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(17363723095919377)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(171117682654344061)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17345839561919369)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(14428042175620264)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(156993466566399465)
,p_button_name=>'btn_Desembargo_Prop'
,p_button_static_id=>'btn_desembargo_total'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Desembargo por <br> Propietarios'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-gears'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(14432702826620268)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_api.id(171117682654344061)
,p_button_name=>'btn_Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(14448895739620282)
,p_branch_name=>'pagina 2025043'
,p_branch_action=>'f?p=&APP_ID.:2025043:&SESSION.::&DEBUG.:RP,153:P2025043_ID_EMBRGOS_RSLCION,P2025043_VGNCIAS:&P2025044_ID_EMBRGOS_RSLCION.,&P2025044_VGNCIAS.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(14428042175620264)
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'btn_Desembargo_Prop'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14433132062620268)
,p_name=>'P2025044_TPO_EMBRGO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(171117682654344061)
,p_prompt=>'Tipo de Medida Cautelar'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion,id_tpos_mdda_ctlar',
'from mc_d_tipos_mdda_ctlar',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and actvo = ''S'' and dscrpcion = ''FINANCIERO'''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14433583307620269)
,p_name=>'P2025044_RSLCION_EMBARGO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(171117682654344061)
,p_prompt=>unistr('Resoluci\00F3n de Embargo')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Ingrese la resoluci\00F3n de embargo a consultar')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14434430066620271)
,p_name=>'P2025044_FCHA_RSLCION_DSDE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(171117682654344061)
,p_prompt=>unistr('Fecha Resoluci\00F3n Inicial')
,p_format_mask=>'dd/mm/yyyy'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione del calendario la fecha inicial de la resoluci\00F3n que desea consultar.')
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14435367815620272)
,p_name=>'P2025044_FCHA_RSLCION_HSTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(171117682654344061)
,p_prompt=>unistr('Fecha Resoluci\00F3n Final')
,p_format_mask=>'dd/mm/yyyy'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione del calendario la fecha final de la resoluci\00F3n que desea consultar.')
,p_attribute_02=>'&P110_FCHA_RSLCION_DSDE.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14436220001620272)
,p_name=>'P2025044_SUJETO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(171117682654344061)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Es el n\00FAmero de identificaci\00F3n del sujeto asociado a un Embargo, ingrese un n\00FAmero de identificaci\00F3n del sujeto para buscar de manera puntual el Embargo donde este contenida esa identificaci\00F3n.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14437188485620274)
,p_name=>'P2025044_OFCIO_EMBARGO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(171117682654344061)
,p_prompt=>'Oficio de Embargo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Ingrese el oficio de embargo a consultar.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14438055802620274)
,p_name=>'P2025044_FCHA_OFCIO_DSDE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(171117682654344061)
,p_prompt=>'Fecha Oficio Inicial'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Seleccione del calendario la fecha inicial del oficio a consultar.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14438938569620274)
,p_name=>'P2025044_FCHA_OFCIO_HSTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(171117682654344061)
,p_prompt=>'Fecha Oficio final'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Seleccione del calendario la fecha final del oficio a consultar.'
,p_attribute_02=>'&P2025044_FCHA_OFCIO_HSTA.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14439845898620275)
,p_name=>'P2025044_ID_RSPNSBLE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(171117682654344061)
,p_prompt=>unistr('Identificaci\00F3n Responsable')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Ingrese el n\00FAmero de identificaci\00F3n del responsable del embargo.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14440778034620275)
,p_name=>'P2025044_FCHA_RGSTRO_DSDE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(171117682654344061)
,p_prompt=>'Fecha de Registro Desde'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Seleccione del calendario la fecha inicial del registro del embargo.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14441646400620275)
,p_name=>'P2025044_FCHA_RGSTRO_HSTA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(171117682654344061)
,p_prompt=>'Fecha de Registro Hasta'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_02=>'&P110_FCHA_RGSTRO_DSDE.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14442040846620276)
,p_name=>'P2025044_ID_FNCNRIO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(171117682654344061)
,p_prompt=>'Abogado'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT e.nmbre_trcro d, e.id_fncnrio r',
'  FROM v_df_c_funcionarios e',
' where exists (select 1 from mc_g_embargos_resolucion f where f.id_fncnrio = e.id_fncnrio)',
' ORDER BY e.nmbre_trcro'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14442426412620276)
,p_name=>'P2025044_TIENE_DCMTO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(171117682654344061)
,p_prompt=>unistr('\00BFDocumento Resoluci\00F3n?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Si;S,No;N'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14442862922620276)
,p_name=>'P2025044_TIENE_OFCIO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(171117682654344061)
,p_prompt=>unistr('\00BFOficios Generados?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Si;S,No;N'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14443290448620277)
,p_name=>'P2025044_JSON'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(171117682654344061)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14443661328620277)
,p_name=>'P2025044_ID_EMBRGOS_RSLCION'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(171117682654344061)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14444090614620277)
,p_name=>'P2025044_VGNCIAS'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(171117682654344061)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(14445109673620279)
,p_name=>'Al seleccionar registros'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(151633179598028586)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(14445648584620279)
,p_event_id=>wwv_flow_api.id(14445109673620279)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var model = this.data.model;',
'var selectedRecords = this.data.selectedRecords;',
'console.log(''Entro 1''); ',
'if (selectedRecords.length > 0) {',
'  var selectedValue = model.getValue(selectedRecords[0], "ID_EMBRGOS_RSLCION");',
'  apex.item("P2025044_ID_EMBRGOS_RSLCION").setValue(selectedValue);',
'     console.log(''Entro 3'',selectedValue); ',
'    ',
'   var vigencias =  model.getValue(selectedRecords[0], "VGNCIAS");',
'      console.log(''Entro 4'',vigencias);  ',
'       apex.item("P2025044_VGNCIAS").setValue(vigencias.replace(/,/g, "-"));          ',
'}',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(14446017855620280)
,p_name=>'Al cambiar fecha RD'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2025044_FCHA_RSLCION_DSDE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(14446561803620280)
,p_event_id=>wwv_flow_api.id(14446017855620280)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P2025044_FCHA_RSLCION_HSTA").datepicker( ''option'' , ''minDate'' , $("#P2025044_FCHA_RSLCION_DSDE").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(14446963566620280)
,p_name=>'Al cambiar fecha OD'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2025044_FCHA_OFCIO_DSDE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(14447485916620280)
,p_event_id=>wwv_flow_api.id(14446963566620280)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P2025044_FCHA_OFCIO_HSTA").datepicker( ''option'' , ''minDate'' , $("#P2025044_FCHA_OFCIO_DSDE").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(14447876175620281)
,p_name=>'Al cambiar fecha RegD'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2025044_FCHA_RGSTRO_DSDE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(14448326559620281)
,p_event_id=>wwv_flow_api.id(14447876175620281)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P2025044_FCHA_RGSTRO_HSTA").datepicker( ''option'' , ''minDate'' , $("#P2025044_FCHA_RGSTRO_DSDE").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14444747414620278)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Asigna Resoluci\00F3n ID')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare ',
'  v_count number(10);',
'begin',
'',
'select count(*) into v_count',
'from v_mc_g_embargos_rspnsble_emb a',
'where a.id_embrgos_rslcion = :P2025044_id_embrgos_rslcion',
'and   nvl(a.dsmbrgdo,''N'') = ''N'';',
'',
'if v_count < 2 then',
'   apex_error.add_error(',
'    p_message          => ''Solo existe un registro de propietario, para desembargar se debe hacer desde el flujo del proceso.'',',
'    p_display_location => apex_error.c_inline_in_notification',
'  );',
'end if;',
'     ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(13677309733328811)
);
end;
/
