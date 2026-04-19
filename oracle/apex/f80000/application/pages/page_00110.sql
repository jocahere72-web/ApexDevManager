prompt --application/pages/page_00110
begin
wwv_flow_api.create_page(
 p_id=>110
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Candidatos a Embargar'
,p_step_title=>'Candidatos a Embargar'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#APP_IMAGES#pdf-lib.min.js',
'#APP_IMAGES#FileSaver.min.js',
'#APP_IMAGES#jszip.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//Se ocultan los botones ',
'apex.item("BTN_RLCION_OFCIOS").hide();',
'',
'function datos_resoluciones() {',
'    ',
'    apex.item("btn_Generar_Documentos").hide();   ',
'    apex.item("btn_generar_actos").hide();',
'    ',
'    var region = apex.region("resoluciones");',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'              ',
'        //OBTENEMOS UN JSON CON LOS DATOS SELECCIONADOS QUE NO HAN SIDO PROCESADOS',
'        var json = records.map(function (record) {',
'            return { "ID_ER": model.getValue(record, "ID_EMBRGOS_RSLCION").trim(),',
'                     "ID_EC": model.getValue(record, "ID_EMBRGOS_CRTRA").trim(),',
'                     "ID_IF": model.getValue(record, "ID_INSTNCIA_FLJO").trim(),',
'                     "IDNTF": model.getValue(record, "IDNTFCCION").trim(),',
'                     "ID_ACTO": model.getValue(record, "ID_ACTO").trim(),',
'                     "ID_TE": model.getValue(record, "ID_TPOS_EMBRGO").trim(),',
'                     "ID_FTE": model.getValue(record, "ID_FLJO_TREA_ESTDO").trim(),',
'                     "ID_FT": model.getValue(record, "ID_FLJO_TREA").trim()',
'                   };',
'        });',
'        ',
'      window.localStorage.setItem(''jsonResolucionesEmbargo'', JSON.stringify(json));',
'      ',
'         //HABILITAMOS O DESHABILITAMOS EL BOTOM DEPENDIENDO SI HAY MAS DE UN REGISTRO SELECCIONADO',
'        if (json.length === 1 ){                ',
'            $s(''P110_ID_EMBRGOS_RSLCION'',  json[0]["ID_ER"] );//SETEAMOS EL VALOR DEL ID DEL EMBARGO SI SOLO HAY UNO SELECIONADO ',
'            $s(''P110_ID_EMBRGOS_CRTRA''  ,  json[0]["ID_EC"] );',
'            $s(''P110_IDNTFCCION''  ,  json[0]["IDNTF"] );',
'            //$s(''P110_CNSCTVO_EMBRGO''  ,  json[0]["CN_EM"] );',
'            $s(''P110_ID_TPOS_EMBRGO''  ,  json[0]["ID_TE"] );',
'        }else {',
'            $s(''P110_ID_EMBRGOS_RSLCION'',  '''');',
'            $s(''P110_ID_EMBRGOS_CRTRA'',  '''');',
'            $s(''P110_IDNTFCCION''  ,  '''' );',
'           // $s(''P110_CNSCTVO_EMBRGO''  ,  '''');',
'            $s(''P110_ID_TPOS_EMBRGO''  ,  '''' );',
'           ',
'        }     ',
'        ',
'      // Validacion de no tener plantilla',
'        var dtos_no_plntlla = records.filter((f) => { return model.getValue(f, "TIENE_PLANTILLA") == ''N''; });',
'        if (dtos_no_plntlla.length > 0){',
'            apex.item("btn_Generar_Documentos").show();',
'            apex.item("btn_generar_actos").hide();',
'            ',
'        } else {',
'            apex.item("btn_Generar_Documentos").hide();',
'            apex.item("btn_generar_actos").show();',
'        }',
'        ',
'      // Validacion de si tener plantilla',
'        var dtos_si_plntlla = records.filter((f) => {',
'                                            return model.getValue(f, "TIENE_PLANTILLA") == ''S'' && model.getValue(f, "TIENE_DCMNTO") == ''N'';',
'                                         });',
'        if (dtos_si_plntlla.length > 0){',
'          apex.item("btn_generar_actos").show();',
'        } else {',
'          apex.item("btn_generar_actos").hide();',
'        }',
'      ',
'      // Validacion de tener documento',
'        let dtos_si_dcmnto = records.filter((f) => { return model.getValue(f, "TIENE_DCMNTO") == ''S'' });',
'        if(dtos_si_dcmnto.length > 0) {',
'          if(dtos_si_dcmnto.length > 1) {',
'            apex.item("BTN_IMPRMIR_2").show();',
'            apex.item("BTN_IMPRMIR").show();',
'            apex.item("BTN_IMPRMIR_OFICIO_PUNTUAL").show();',
'          } else {',
'            apex.item("BTN_IMPRMIR_2").show();',
'            apex.item("BTN_IMPRMIR_OFICIO_PUNTUAL").show();',
'            apex.item("BTN_IMPRMIR").hide();',
'          }',
'        } else {',
'          apex.item("BTN_IMPRMIR_2").hide();',
'          apex.item("BTN_IMPRMIR").hide();',
'          apex.item("BTN_IMPRMIR_OFICIO_PUNTUAL").hide();',
'        }',
'        ',
'        let jsonOficio = records.map(function (record) { return { "ID_ER": model.getValue(record, "ID_EMBRGOS_RSLCION").trim()',
'                                                                , "TIENE_DCMNTO": model.getValue(record, "TIENE_DCMNTO") }; });',
'                                        window.localStorage.setItem(''jsonResolucionesEmbargoOficio'', JSON.stringify(jsonOficio.filter(data => { return data.TIENE_DCMNTO === ''S'' })));',
'        return;',
'      ',
'    }',
'    ',
'    apex.item("btn_Generar_Documentos").hide();    ',
'    apex.item("btn_generar_actos").hide();',
'}',
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
'function datos_responsables() {',
'    ',
'    ',
'    var region = apex.region("Responsables")',
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
'            return model.getValue(record, "ID_DSMBRGOS_RSLCION");                 ',
'            })[0];',
'                console.log(''Entro 3'',idResolucion);  ',
'         var idActo = records.map(function (record) {',
'            return model.getValue(record, "ID_ACTO_DSMBARGO");                 ',
'            })[0];',
'                  console.log(''Entro 4'',idActo);     ',
'             ',
unistr('        apex.item("P110_ID_DSMBRGO_RSLCION").setValue(idResolucion);   // Reemplaza con el nombre de tu \00EDtem de sesi\00F3n'),
'        $s("P110_ID_DSMBRGO_RSLCION", idResolucion);',
unistr('        apex.item("P110_ID_ACTO_RSLCION").setValue(idActo);   // Reemplaza con el nombre de tu \00EDtem de sesi\00F3n'),
'        $s("P110_ID_ACTO_RSLCION", idActo);             ',
'        console.log(''Entro 5'',idActo);               ',
'         ',
' ',
'    }',
'   }',
'    }',
'',
'function do_action() {',
'   ',
'    console.log("ID:", $v("P110_ID_ACTO_RSLCION")); // Debe mostrar el valor esperado',
'    console.log("Nombre:", $v("P110_ID_DSMBRGO_RSLCION"));',
'',
'    apex.server.process("Actualiza_PDF_Resolucion", {',
'    pageItems: "#P110_ID_ACTO_RSLCION,#P110_ID_DSMBRGO_RSLCION" ',
'        }, {',
'          success: function(pData) {',
'            console.log("Respuesta del servidor:", pData);',
'             apex.message.showPageSuccess(pData.mensaje);  ',
'          },',
'          error: function(request, status, error) {',
'            console.error("Error:", error);',
'          }',
'        });',
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
,p_required_role=>wwv_flow_api.id(17445683081942948)
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20251022102726'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(82770559372499905)
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
unistr('<p>Funcionalidad que permite realizar el desembargo parcial o total de los embargos seleccionadas, adem\00E1s permite observar la informaci\00F3n del bien embargado y los responsables del embargo.</p>'),
unistr('<p><b>1.</b>El desembargo total se hace con los datos de las resoluciones de embargo, se deben seleccionar los embargos y luego presionar el bot\00F3n "Desembargo total" para luego seleccionar la causal e ingresar los datos de la causal para poder realiz')
||'ar el/los desembargos</p>',
unistr('<p><b>2.</b>El desembargo parcial se hace con los datos de los oficios de un embargo, se deben seleccionar los oficios asociados a un embargo y luego presionar el bot\00F3n "Desembargo Parcial" para luego seleccionar la causal e ingresar los datos de la ')
||'causal para poder realizar el/los desembargo</p>',
unistr('<p>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(82771026269499910)
,p_plug_name=>'Oficios de Embargo'
,p_region_name=>'oficios'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>40
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
'                      ',
'                      '))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(83619009630313948)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(6073788913867325)
,p_name=>'CNSCTVO_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNSCTVO_EMBRGO'
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
 p_id=>wwv_flow_api.id(6073851758867326)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(6073916424867327)
,p_name=>'ID_TPOS_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TPOS_EMBRGO'
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
 p_id=>wwv_flow_api.id(57850818193104922)
,p_name=>'PDF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PDF'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Documento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_attribute_01=>'&PDF.'
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,file_blob,file_name,file_mimetype,id_acto,&ACTO_OFCIO.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(57850911566104923)
,p_name=>'ACTO_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTO_OFCIO'
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
 p_id=>wwv_flow_api.id(67114726933324303)
,p_name=>'FCHA_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_OFCIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha de Oficio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
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
 p_id=>wwv_flow_api.id(82771285047499912)
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
 p_id=>wwv_flow_api.id(82771325372499913)
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
 p_id=>wwv_flow_api.id(82771589948499915)
,p_name=>'NMRO_ACTO_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO_OFCIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Numero de Oficio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(82771760832499917)
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
 p_id=>wwv_flow_api.id(82771855081499918)
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
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(82771950892499919)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(82772035565499920)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(88979121658684826)
,p_name=>'bienes'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" >Consultar Bienes',
'<span class="fa fa-external-link"></span>',
'</button>'))
,p_link_target=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.:RP,41:P41_ID_SLCTD_OFCIO,P41_ID_ENTDDES,P41_OCULTAR_APLICAR:&ID_SLCTD_OFCIO.,&ID_ENTDDES.,1'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(103101471632629402)
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
 p_id=>wwv_flow_api.id(103101568701629403)
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(103101629585629404)
,p_name=>'ID_EMBRGOS_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RSLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(83620885892313954)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(153750122851710228)
,p_name=>'TNE_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNE_DCMNTO'
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
 p_id=>wwv_flow_api.id(153751003508710237)
,p_name=>'TPO_IMPRSION_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_IMPRSION_OFCIO'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(187464172532158013)
,p_name=>'PLANTILLA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PLANTILLA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Plantilla'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_attribute_01=>'&PLANTILLA.'
,p_link_target=>'f?p=&APP_ID.:112:&SESSION.::&DEBUG.:RP,112:P112_CDGO_EMBRGO,P112_ID_EMBRGOS_RSLCION,P112_ID_TPOS_MDDA_CTLAR,P112_TIPO_DCMNTO,P112_IDNTFCCION,P112_NOMBRE_ETPA,P112_ID_EMBRGOS_CRTRA,P112_ID_SLCTD_OFCIO:&CNSCTVO_EMBRGO.,&ID_EMBRGOS_RSLCION.,&ID_TPOS_EMB'
||'RGO.,O,&IDNTFCCION.,Embargo,&ID_EMBRGOS_CRTRA.,&ID_SLCTD_OFCIO.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(82771107619499911)
,p_internal_uid=>82771107619499911
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
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(83675112597502572)
,p_interactive_grid_id=>wwv_flow_api.id(82771107619499911)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(83675268586502573)
,p_report_id=>wwv_flow_api.id(83675112597502572)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6902679703953028)
,p_view_id=>wwv_flow_api.id(83675268586502573)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(6073788913867325)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6903181745953032)
,p_view_id=>wwv_flow_api.id(83675268586502573)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(6073851758867326)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6903534819953047)
,p_view_id=>wwv_flow_api.id(83675268586502573)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(6073916424867327)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(58531242749733183)
,p_view_id=>wwv_flow_api.id(83675268586502573)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(57850818193104922)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>91
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(58538033314776481)
,p_view_id=>wwv_flow_api.id(83675268586502573)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(57850911566104923)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67404186570742669)
,p_view_id=>wwv_flow_api.id(83675268586502573)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(67114726933324303)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83677015490502607)
,p_view_id=>wwv_flow_api.id(83675268586502573)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(82771285047499912)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83677553835502608)
,p_view_id=>wwv_flow_api.id(83675268586502573)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(82771325372499913)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83678576994502613)
,p_view_id=>wwv_flow_api.id(83675268586502573)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(82771589948499915)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>123
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83679573988502615)
,p_view_id=>wwv_flow_api.id(83675268586502573)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(82771760832499917)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83680051368502617)
,p_view_id=>wwv_flow_api.id(83675268586502573)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(82771855081499918)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>170
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83680581332502618)
,p_view_id=>wwv_flow_api.id(83675268586502573)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(82771950892499919)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89319919665565120)
,p_view_id=>wwv_flow_api.id(83675268586502573)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(88979121658684826)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>148
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104348141507662874)
,p_view_id=>wwv_flow_api.id(83675268586502573)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(103101471632629402)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>267
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104348653324662877)
,p_view_id=>wwv_flow_api.id(83675268586502573)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(103101568701629403)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104349176647662879)
,p_view_id=>wwv_flow_api.id(83675268586502573)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(103101629585629404)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154269136491003930)
,p_view_id=>wwv_flow_api.id(83675268586502573)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(153750122851710228)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154341801869071891)
,p_view_id=>wwv_flow_api.id(83675268586502573)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(153751003508710237)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(187479215218593439)
,p_view_id=>wwv_flow_api.id(83675268586502573)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(187464172532158013)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>146.2
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(83619009630313948)
,p_plug_name=>'Resoluciones de Embargo'
,p_region_name=>'resoluciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
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
'        left join mc_g_solicitudes_y_oficios e on e.id_embrgos_crtra = a.id_embrgos_crtra',
'    ',
'        left join mc_g_embrgo_remnte_dtlle z on a.id_embrgos_rslcion = z.id_embrgos_rslcion',
'        left join mc_g_embargos_remanente y on y.id_embrgos_rmnte = z.id_embrgos_rmnte   ',
'                  and z.id_embrgos_rslcion in (select m.id_embrgo_rslcion from gf_g_titulos_judicial m)',
'',
'    ',
'        where a.cdgo_clnte = :F_CDGO_CLNTE',
'        and a.id_tpos_embrgo = :P110_TPO_EMBRGO',
'        and a.cdgo_estdos_crtra in (''E'',''S'')',
'        --and a.id_fncnrio = :F_ID_FNCNRIO',
'        --and (a.id_fncnrio = :P110_ID_FNCNRIO or :P110_ID_FNCNRIO  is null)',
'        and (:P110_RSLCION_EMBARGO is null or a.nmro_acto = :P110_RSLCION_EMBARGO)',
'        and (:P110_FCHA_RSLCION_DSDE is null or trunc(a.fcha_acto) >= trunc(to_date(:P110_FCHA_RSLCION_DSDE,''DD/MM/YYYY'')))',
'        and (:P110_FCHA_RSLCION_HSTA is null or trunc(a.fcha_acto) <= trunc(to_date(:P110_FCHA_RSLCION_HSTA,''DD/MM/YYYY'')))',
'        and (:P110_FCHA_RGSTRO_DSDE is null or trunc(a.fcha_rgstro_embrgo) >= trunc(to_date(:P110_FCHA_RGSTRO_DSDE,''DD/MM/YYYY'')))',
'        and (:P110_FCHA_RGSTRO_HSTA is null or trunc(a.fcha_rgstro_embrgo) <= trunc(to_date(:P110_FCHA_RGSTRO_HSTA,''DD/MM/YYYY'')))',
'        and (:P110_SUJETO is null or a.idntfccion = :P110_SUJETO)',
'        and (:P110_TIENE_OFCIO is null or e.gnra_ofcio = :P110_TIENE_OFCIO)',
'        /*and (a.id_acto is null or exists (select 2',
'                                            from v_mc_g_solicitudes_y_oficios b',
'                                           where b.id_embrgos_rslcion = a.id_embrgos_rslcion',
'                                             and b.id_embrgos_crtra = a.id_embrgos_crtra',
'                                             and b.nmro_acto_ofcio = nvl(:P110_OFCIO_EMBARGO,b.nmro_acto_ofcio)',
'                                             and (:P110_FCHA_OFCIO_DSDE is null or trunc(b.fcha_ofcio) >= trunc(to_date(:P110_FCHA_OFCIO_DSDE,''DD/MM/YYYY'')))',
'                                             and (:P110_FCHA_OFCIO_HSTA is null or trunc(b.fcha_ofcio) <= trunc(to_date(:P110_FCHA_OFCIO_HSTA,''DD/MM/YYYY'')))*/',
'                                             /*and not exists (select 2',
'                                                               from mc_g_desembargos_oficio c',
'                                                              where c.id_slctd_ofcio = b.id_slctd_ofcio',
'                                                                and c.estado_rvctria = ''N'')*/--))',
'        and exists (select 1',
'                      from v_mc_g_embargos_rspnsble_emb d',
'                     where d.id_embrgos_crtra = a.id_embrgos_crtra',
'                       and d.id_embrgos_rslcion = a.id_embrgos_rslcion',
'                       and (:P110_ID_RSPNSBLE is null or trim(d.idntfccion) = trim(:P110_ID_RSPNSBLE)))) x',
'where (:P110_TIENE_DCMTO is null or x.tiene_acto = :P110_TIENE_DCMTO)',
'group by x.id_embrgos_rslcion,',
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
'            x.tiene_remanente',
'order by x.nmro_acto,x.idntfccion;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(6071954455867307)
,p_name=>'FCHA_RGSTRO_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO_EMBRGO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha de Registro '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(6072028778867308)
,p_name=>'CDGO_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CRTRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('C\00F3digo de Cartera')
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>170
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
 p_id=>wwv_flow_api.id(6072351319867311)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(6072755370867315)
,p_name=>'ID_TPOS_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TPOS_EMBRGO'
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
 p_id=>wwv_flow_api.id(6074309228867331)
,p_name=>'ID_FLJO_TREA_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA_ESTDO'
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
 p_id=>wwv_flow_api.id(6074422408867332)
,p_name=>'ID_FLJO_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA'
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
 p_id=>wwv_flow_api.id(6075142347867339)
,p_name=>'ESTADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTADO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado de Etapa'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>210
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
 p_id=>wwv_flow_api.id(22970301694661601)
,p_name=>'TIENE_REMANENTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIENE_REMANENTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFRemanente?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>290
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
 p_id=>wwv_flow_api.id(38952390694269718)
,p_name=>'DSCRPCION_ESTDO_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ESTDO_CRTRA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado de Cartera'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
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
 p_id=>wwv_flow_api.id(57848789017104901)
,p_name=>'Flujo'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" >Ir a flujo<span class="fa fa-external-link-square"></span>',
'</button>'))
,p_link_target=>'f?p=&APP_ID.:125:&SESSION.::&DEBUG.:RP,125:P125_ID_INSTNCIA_FLJO,P125_ID_FLJO_TREA:&ID_INSTNCIA_FLJO.,&ID_FLJO_TREA.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(57848896377104902)
,p_name=>'PDF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PDF'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Documento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
,p_value_alignment=>'CENTER'
,p_attribute_01=>'&PDF.'
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,file_blob,file_name,file_mimetype,id_acto,&ID_ACTO.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(57849332397104907)
,p_name=>'PLANTILLA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PLANTILLA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Plantilla'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
,p_value_alignment=>'CENTER'
,p_attribute_01=>'&PLANTILLA.'
,p_link_target=>'f?p=&APP_ID.:112:&SESSION.::&DEBUG.:RP,112:P112_CDGO_EMBRGO,P112_ID_EMBRGOS_CRTRA,P112_ID_EMBRGOS_RSLCION,P112_ID_TPOS_MDDA_CTLAR,P112_TIPO_DCMNTO,P112_NOMBRE_ETPA:,&ID_EMBRGOS_CRTRA.,&ID_EMBRGOS_RSLCION.,&ID_TPOS_EMBRGO.,R,Embargo'
,p_filter_is_required=>false
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
 p_id=>wwv_flow_api.id(67114872006324304)
,p_name=>'TIENE_PLANTILLA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIENE_PLANTILLA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>250
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
 p_id=>wwv_flow_api.id(67114958287324305)
,p_name=>'TIENE_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIENE_ACTO'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(82770739087499907)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(82770833547499908)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(83620885892313954)
,p_name=>'ID_EMBRGOS_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RSLCION'
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
,p_enable_pivot=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(83621447597313955)
,p_name=>'ID_EMBRGOS_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_CRTRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'id_embrgos_crtra'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(83622010371313955)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(83622701095313955)
,p_name=>'FCHA_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Fecha Resoluci\00F3n')
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
 p_id=>wwv_flow_api.id(83623220769313956)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Resoluci\00F3n de Embargo')
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
 p_id=>wwv_flow_api.id(103101179166629399)
,p_name=>'DSCRPCION_TIPO_EMBARGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_TIPO_EMBARGO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tipo de Embargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
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
 p_id=>wwv_flow_api.id(103101256055629400)
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(103101396130629401)
,p_name=>'VGNCIAS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIAS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Vigencias'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
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
 p_id=>wwv_flow_api.id(151396557788785905)
,p_name=>'TIENE_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIENE_DCMNTO'
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
 p_id=>wwv_flow_api.id(188899413743325433)
,p_name=>'CDGO_ESTDO_PRCSO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ESTDO_PRCSO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Generaci\00F3n Documento')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>280
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:INICIADO;INI,FINALIZADO;FIN'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(83619523737313949)
,p_internal_uid=>83619523737313949
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'	config.initialSelection = false;',
'   window.localStorage.removeItem(''jsonResolucionesEmbargo'');',
'    return selectAll(config, {',
'        name: ''Todos'',',
'        action: seleccionarTodos',
'    }) ;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(83619928656313950)
,p_interactive_grid_id=>wwv_flow_api.id(83619523737313949)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(83620045586313951)
,p_report_id=>wwv_flow_api.id(83619928656313950)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6265559535532364)
,p_view_id=>wwv_flow_api.id(83620045586313951)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(6071954455867307)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>125
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6266026146532366)
,p_view_id=>wwv_flow_api.id(83620045586313951)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(6072028778867308)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>145
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6400594597730184)
,p_view_id=>wwv_flow_api.id(83620045586313951)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(6072351319867311)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6852053340074883)
,p_view_id=>wwv_flow_api.id(83620045586313951)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(6072755370867315)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8237002349743673)
,p_view_id=>wwv_flow_api.id(83620045586313951)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(6074309228867331)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8245223782783050)
,p_view_id=>wwv_flow_api.id(83620045586313951)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(6074422408867332)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8354830413571339)
,p_view_id=>wwv_flow_api.id(83620045586313951)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(6075142347867339)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22976378129661900)
,p_view_id=>wwv_flow_api.id(83620045586313951)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(22970301694661601)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49848078086025646)
,p_view_id=>wwv_flow_api.id(83620045586313951)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(38952390694269718)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>121
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(57854075502112217)
,p_view_id=>wwv_flow_api.id(83620045586313951)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(57848789017104901)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>85
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(57879186538386416)
,p_view_id=>wwv_flow_api.id(83620045586313951)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(57848896377104902)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>86
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(58058245180880399)
,p_view_id=>wwv_flow_api.id(83620045586313951)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(57849332397104907)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>99
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67406863011844196)
,p_view_id=>wwv_flow_api.id(83620045586313951)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(67114872006324304)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67407335213844198)
,p_view_id=>wwv_flow_api.id(83620045586313951)
,p_display_seq=>21
,p_column_id=>wwv_flow_api.id(67114958287324305)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83621250415313955)
,p_view_id=>wwv_flow_api.id(83620045586313951)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(83620885892313954)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83621809560313955)
,p_view_id=>wwv_flow_api.id(83620045586313951)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(83621447597313955)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>89
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83622445667313955)
,p_view_id=>wwv_flow_api.id(83620045586313951)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(83622010371313955)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83623073911313956)
,p_view_id=>wwv_flow_api.id(83620045586313951)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(83622701095313955)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>122
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83623623480313956)
,p_view_id=>wwv_flow_api.id(83620045586313951)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(83623220769313956)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>159
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83676150778502576)
,p_view_id=>wwv_flow_api.id(83620045586313951)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(82770739087499907)
,p_is_visible=>false
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104335500962499002)
,p_view_id=>wwv_flow_api.id(83620045586313951)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(103101179166629399)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>123
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104335943061499005)
,p_view_id=>wwv_flow_api.id(83620045586313951)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(103101256055629400)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>183
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104336409527499007)
,p_view_id=>wwv_flow_api.id(83620045586313951)
,p_display_seq=>24
,p_column_id=>wwv_flow_api.id(103101396130629401)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>188
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(151456043927362026)
,p_view_id=>wwv_flow_api.id(83620045586313951)
,p_display_seq=>22
,p_column_id=>wwv_flow_api.id(151396557788785905)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189418840046532494)
,p_view_id=>wwv_flow_api.id(83620045586313951)
,p_display_seq=>25
,p_column_id=>wwv_flow_api.id(188899413743325433)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>177.60000610351562
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(88979296598684827)
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
 p_id=>wwv_flow_api.id(103101786027629405)
,p_plug_name=>'Responsables'
,p_region_name=>'Responsables'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_embrgos_rspnsble,',
'       a.id_embrgos_crtra,',
'       a.id_embrgos_rslcion,',
'       a.dscrpcion_idntfccion_tpo,',
'       a.idntfccion,',
'       a.nmbre_cmplto,',
'       a.dsmbrgdo, ',
'       c.id_tpos_mdda_ctlar,',
'       c.id_csles_dsmbrgo,',
'     --  c.idntfccion idntfcion_prdio,',
'       c.id_acto as id_acto_dsmbargo,',
'       (select  max(o.id_acto)          ',
'           from  mc_g_desembargos_oficio o ',
'          where o.id_dsmbrgos_rslcion = a.id_dsmbrgos_rslcion) as acto_oficio,',
'       a.id_dsmbrgos_rslcion,',
'         case when a.id_dsmbrgos_rslcion is not null ',
'                    then ''<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" aria-labelledby="id_tareas_ig_grid_vc_ctx id_tareas_ig_grid_vc_cur">Ver PDF <span class="fa fa-eye"></span></b'
||'utton>''',
'                    else '' ''',
'               end as pdf_ofcio,',
'          case when a.id_dsmbrgos_rslcion is not null ',
'                    then ''<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" aria-labelledby="id_tareas_ig_grid_vc_ctx id_tareas_ig_grid_vc_cur">Ver PDF <span class="fa fa-eye"></span></b'
||'utton>''',
'                    else '' ''',
'               end as pdf,',
'          case when a.id_dsmbrgos_rslcion is not null ',
'                    then ''<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" aria-labelledby="id_tareas_ig_grid_vc_ctx id_tareas_ig_grid_vc_cur">Modificar plantilla <span class="fa fa-ext'
||'ernal-link"></span>',
'                           </button>''',
'                    else '' ''',
'               end as plntlla_rslcion,',
'         case when a.id_dsmbrgos_rslcion is not null ',
unistr('                    then ''<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" aria-labelledby="id_tareas_ig_grid_vc_ctx id_tareas_ig_grid_vc_cur">Actualiza PFD Resoluci\00F3n <span class="fa f')
||'a-external-link"></span>',
'                           </button>''',
'                    else '' ''',
'               end as btn_actlza_pdf_res',
'from v_mc_g_embargos_rspnsble_emb a',
'left join mc_g_desembargos_resolucion c on c.id_dsmbrgos_rslcion = a.id_dsmbrgos_rslcion',
'',
'',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(83619009630313948)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(14005640532961805)
,p_name=>'DSMBRGDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSMBRGDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('\00BFDesembargado?')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Si;S,No;N'
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_null_text=>'N'
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
 p_id=>wwv_flow_api.id(14005700499961806)
,p_name=>'ID_DSMBRGOS_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DSMBRGOS_RSLCION'
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
 p_id=>wwv_flow_api.id(14005887682961807)
,p_name=>'PDF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PDF'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>unistr('Resoluci\00F3n Desembargo')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attribute_01=>'&PDF.'
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,file_blob,file_name,file_mimetype,id_acto,&ID_ACTO_DSMBARGO.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(14006048177961809)
,p_name=>'ID_ACTO_DSMBARGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_DSMBARGO'
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
 p_id=>wwv_flow_api.id(14006560531961814)
,p_name=>'PDF_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PDF_OFCIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Oficio Desembargo'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attribute_01=>'&PDF_OFCIO.'
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,file_blob,file_name,file_mimetype,id_acto,&ACTO_OFICIO.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(14007197110961820)
,p_name=>'ACTO_OFICIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTO_OFICIO'
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
 p_id=>wwv_flow_api.id(14009033979961839)
,p_name=>'ID_TPOS_MDDA_CTLAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TPOS_MDDA_CTLAR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
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
 p_id=>wwv_flow_api.id(14009113244961840)
,p_name=>'ID_CSLES_DSMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CSLES_DSMBRGO'
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
 p_id=>wwv_flow_api.id(14009556066961844)
,p_name=>'PLNTLLA_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PLNTLLA_RSLCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>unistr('Plantilla Resoluci\00F3n')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>170
,p_value_alignment=>'LEFT'
,p_attribute_01=>'&PLNTLLA_RSLCION.'
,p_link_target=>'f?p=&APP_ID.:123:&SESSION.::&DEBUG.:RP:P123_CDGO_EMBRGO,P123_ID_DSMBRGOS_RSLCION,P123_NOMBRE_ETPA,P123_TIPO_DCMNTO,P123_ID_EMBRGOS_CRTRA,P123_ID_TPOS_MDDA_CTLAR,P123_IDNTFCCION,P123_ID_CSLES_DSMBRGO,P123_BRANCH:,&ID_DSMBRGOS_RSLCION.,Desembargo Propi'
||'etario,R,&ID_EMBRGOS_CRTRA.,&ID_TPOS_MDDA_CTLAR.,&IDNTFCCION_PRDIO.,&ID_CSLES_DSMBRGO.,110'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(14619133432931202)
,p_name=>'BTN_ACTLZA_PDF_RES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BTN_ACTLZA_PDF_RES'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>unistr('Actualiza PDF Resoluci\00F3n')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>180
,p_value_alignment=>'LEFT'
,p_attribute_01=>'&BTN_ACTLZA_PDF_RES.'
,p_link_target=>'javascript:do_action();'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(14619462924931205)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(14619541671931206)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(103102839380629416)
,p_name=>'ID_EMBRGOS_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RSPNSBLE'
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
 p_id=>wwv_flow_api.id(103102957225629417)
,p_name=>'ID_EMBRGOS_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_CRTRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(103103061850629418)
,p_name=>'ID_EMBRGOS_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RSLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(83620885892313954)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(103103111430629419)
,p_name=>'DSCRPCION_IDNTFCCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_IDNTFCCION_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Tipo identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(103103268644629420)
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
 p_id=>wwv_flow_api.id(103103314350629421)
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
 p_id=>wwv_flow_api.id(103102706645629415)
,p_internal_uid=>103102706645629415
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
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(104383914096989224)
,p_interactive_grid_id=>wwv_flow_api.id(103102706645629415)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(104384045388989224)
,p_report_id=>wwv_flow_api.id(104383914096989224)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14085547271706927)
,p_view_id=>wwv_flow_api.id(104384045388989224)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(14005640532961805)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14086060754706930)
,p_view_id=>wwv_flow_api.id(104384045388989224)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(14005700499961806)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14090828043765982)
,p_view_id=>wwv_flow_api.id(104384045388989224)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(14005887682961807)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14097011032935668)
,p_view_id=>wwv_flow_api.id(104384045388989224)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(14006048177961809)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14145444805316301)
,p_view_id=>wwv_flow_api.id(104384045388989224)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(14006560531961814)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14155669817326390)
,p_view_id=>wwv_flow_api.id(104384045388989224)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(14007197110961820)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14597036351620966)
,p_view_id=>wwv_flow_api.id(104384045388989224)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(14009033979961839)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14597591162620967)
,p_view_id=>wwv_flow_api.id(104384045388989224)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(14009113244961840)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14601215281653791)
,p_view_id=>wwv_flow_api.id(104384045388989224)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(14009556066961844)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14629714457112215)
,p_view_id=>wwv_flow_api.id(104384045388989224)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(14619133432931202)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14634833369773372)
,p_view_id=>wwv_flow_api.id(104384045388989224)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(14619462924931205)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104384590661989227)
,p_view_id=>wwv_flow_api.id(104384045388989224)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(103102839380629416)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104385043658989230)
,p_view_id=>wwv_flow_api.id(104384045388989224)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(103102957225629417)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104385528283989232)
,p_view_id=>wwv_flow_api.id(104384045388989224)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(103103061850629418)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104386058036989233)
,p_view_id=>wwv_flow_api.id(104384045388989224)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(103103111430629419)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104386509797989234)
,p_view_id=>wwv_flow_api.id(104384045388989224)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(103103268644629420)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104387067294989237)
,p_view_id=>wwv_flow_api.id(104384045388989224)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(103103314350629421)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(103103435775629422)
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
 p_id=>wwv_flow_api.id(103103512686629423)
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
 p_id=>wwv_flow_api.id(6131272263461422)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(88979296598684827)
,p_button_name=>'btn_Generar_Documentos'
,p_button_static_id=>'btn_Generar_Documentos'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Plantilla<br> De Embargo'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-gears'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6131649617461424)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(88979296598684827)
,p_button_name=>'btn_generar_actos'
,p_button_static_id=>'btn_generar_actos'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Generar <br> Actos/Documentos<br>de Embargo'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_vlor_cnfgrcion varchar2(3);',
'    v_prmtir         boolean;',
'begin',
'    ',
'    begin',
'        select vlor into v_vlor_cnfgrcion',
'        from cb_d_process_prssvo_cnfgrcn',
'        where cdgo_clnte = :F_CDGO_CLNTE',
'          and CDGO_CNFGRCION = ''GDE'';',
'    exception',
'        when no_data_found then',
'            v_prmtir := false;',
'    end;',
'    ',
'    -- Si el parametro GDE = A (Automatico), No se permite',
'    if v_vlor_cnfgrcion = ''A'' then',
'        v_prmtir := false;',
unistr('    -- Si el parametro GDE = M (Manual), se permite mostrar el bot\00F3n'),
'    elsif v_vlor_cnfgrcion = ''M'' then',
'        v_prmtir := true;',
'    end if;',
'    ',
'    return v_prmtir;',
'    ',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-cog'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6074584614867333)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(88979296598684827)
,p_button_name=>'btn_aplicar'
,p_button_static_id=>'btn_aplicar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Aplicar Cambio  <br/>de Etapa/Estado'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6075793231867345)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(88979296598684827)
,p_button_name=>'BTN_RSLTDOS_PRCSMNTO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Resultados de <br>Procesamiento'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:113:&SESSION.::&DEBUG.:RP,113:P113_ID_LTE_MDDA_CTLAR_IP:&P110_ID_LTE_MDDA_CTLAR.'
,p_button_condition=>'P110_ID_LTE_MDDA_CTLAR'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8926357582392902)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_api.id(88979296598684827)
,p_button_name=>'BTN_IMPRMIR_MASIVO_PUNTUAL'
,p_button_static_id=>'BTN_IMPRMIR_2'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Descargar Embargos <br> en Archivos <br> Individuales'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file-pdf-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8926648020394609)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_api.id(88979296598684827)
,p_button_name=>'BTN_IMPRMIR_MASIVO_CONSOLIDADO'
,p_button_static_id=>'BTN_IMPRMIR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Descargar Embargos <br> En un solo Archivo'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file-pdf-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(153705884883793001)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_api.id(88979296598684827)
,p_button_name=>'BTN_IMPRMIR_OFICIO_PUNTUAL'
,p_button_static_id=>'BTN_IMPRMIR_OFICIO_PUNTUAL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Descargar Oficios <br> En Archivos <br> Individuales'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file-pdf-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(153750215321710229)
,p_button_sequence=>160
,p_button_plug_id=>wwv_flow_api.id(88979296598684827)
,p_button_name=>'BTN_IMPRMIR_OFICIO'
,p_button_static_id=>'BTN_IMPRMIR_OFICIO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Descargar Oficios <br> En un solo Archivo'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file-pdf-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8966626176593179)
,p_button_sequence=>170
,p_button_plug_id=>wwv_flow_api.id(88979296598684827)
,p_button_name=>'BTN_ASOCIAR_MEDIDA_CAUTELAR'
,p_button_static_id=>'BTN_ASOCIAR_MEDIDA_CAUTELAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Asociar Medida <br>Cautelar'
,p_button_position=>'BELOW_BOX'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-clipboard-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(186949557744453002)
,p_button_sequence=>180
,p_button_plug_id=>wwv_flow_api.id(88979296598684827)
,p_button_name=>'BTN_GNRA_OFCIO'
,p_button_static_id=>'BTN_GNRA_OFCIO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Generar Oficios'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(188171017840179541)
,p_button_sequence=>200
,p_button_plug_id=>wwv_flow_api.id(88979296598684827)
,p_button_name=>'BTN_RLCION_OFCIOS'
,p_button_static_id=>'BTN_RLCION_OFCIOS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>unistr('Relaci\00F3n Oficios</br>Excel')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file-excel-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6135988657461428)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(103103512686629423)
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
 p_id=>wwv_flow_api.id(6143482877461443)
,p_branch_name=>unistr('Ir a P\00E1gina 66-T')
,p_branch_action=>'f?p=&APP_ID.:66:&SESSION.::&DEBUG.:RP,66:P66_TIPO_DESEMBARGO,P66_ID_TIPO_EMBARGO,P66_ID_EMBRGOS_CRTRA,P66_ID_EMBRGOS_RSLCION:T,&P110_TPO_EMBRGO.,&P110_ID_EMBRGOS_CRTRA.,&P110_ID_EMBRGOS_RSLCION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6143802278461444)
,p_branch_name=>unistr('Ir a P\00E1gina 66-P')
,p_branch_action=>'f?p=&APP_ID.:66:&SESSION.::&DEBUG.:RP,66:P66_ID_EMBRGOS_RSLCION,P66_TIPO_DESEMBARGO,P66_ID_TIPO_EMBARGO,P66_ID_EMBRGOS_CRTRA:&P110_ID_EMBRGOS_RSLCION.,P,&P110_TPO_EMBRGO.,&P110_ID_EMBRGOS_CRTRA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6072294607867310)
,p_branch_name=>unistr('Ir a P\00E1gina 67')
,p_branch_action=>'f?p=&APP_ID.:67:&SESSION.::&DEBUG.:RP,67:P67_ID_TIPO_EMBARGO:&P110_TPO_EMBRGO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6131272263461422)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(188171981331179550)
,p_branch_name=>'descargar_excel'
,p_branch_action=>'f?p=&APP_ID.:110:&SESSION.:imprimir:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>40
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'imprimir_branch'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6073004468867318)
,p_name=>'P110_IDNTFCCION'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(103103512686629423)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6073136485867319)
,p_name=>'P110_CNSCTVO_EMBRGO'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(103103512686629423)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6073243289867320)
,p_name=>'P110_ID_TPOS_EMBRGO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(103103512686629423)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6074980639867337)
,p_name=>'P110_ID_LTE_MDDA_CTLAR'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(103103512686629423)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6136302701461428)
,p_name=>'P110_RSLCION_EMBARGO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(103103512686629423)
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
 p_id=>wwv_flow_api.id(6136714584461430)
,p_name=>'P110_FCHA_RSLCION_DSDE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(103103512686629423)
,p_prompt=>unistr('Fecha Resoluci\00F3n Inicial')
,p_format_mask=>'dd/mm/yyyy'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Seleccione del calendario la fecha inicial de la resoluci\00F3n que desea consultar.')
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6137191294461430)
,p_name=>'P110_FCHA_RSLCION_HSTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(103103512686629423)
,p_prompt=>unistr('Fecha Resoluci\00F3n Final')
,p_format_mask=>'dd/mm/yyyy'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Seleccione del calendario la fecha final de la resoluci\00F3n que desea consultar.')
,p_attribute_02=>'&P110_FCHA_RSLCION_DSDE.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6137549964461430)
,p_name=>'P110_OFCIO_EMBARGO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(103103512686629423)
,p_prompt=>'Oficio de Embargo'
,p_display_as=>'NATIVE_TEXT_FIELD'
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
 p_id=>wwv_flow_api.id(6137997424461431)
,p_name=>'P110_FCHA_OFCIO_DSDE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(103103512686629423)
,p_prompt=>'Fecha Oficio Inicial'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Seleccione del calendario la fecha inicial del oficio a consultar.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6138377326461431)
,p_name=>'P110_FCHA_OFCIO_HSTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(103103512686629423)
,p_prompt=>'Fecha Oficio final'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Seleccione del calendario la fecha final del oficio a consultar.'
,p_attribute_02=>'&P110_FCHA_OFCIO_HSTA.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6138751677461431)
,p_name=>'P110_TPO_EMBRGO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(103103512686629423)
,p_prompt=>'Tipo de Medida Cautelar'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion,id_tpos_mdda_ctlar',
'from mc_d_tipos_mdda_ctlar',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and actvo = ''S'''))
,p_lov_display_null=>'YES'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tipo de medida cautelar. '
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6139130620461432)
,p_name=>'P110_SUJETO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(103103512686629423)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
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
 p_id=>wwv_flow_api.id(6139571672461432)
,p_name=>'P110_ID_RSPNSBLE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(103103512686629423)
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
 p_id=>wwv_flow_api.id(6139904508461432)
,p_name=>'P110_JSON_RESOLUCIONES'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(103103512686629423)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6140383526461432)
,p_name=>'P110_JSON_OFCIOS'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(103103512686629423)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6140720000461432)
,p_name=>'P110_ID_EMBRGOS_RSLCION'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(103103512686629423)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6141102715461433)
,p_name=>'P110_ID_EMBRGOS_CRTRA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(103103512686629423)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8720250023742220)
,p_name=>'P110_JSON'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(103103512686629423)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14010108386961850)
,p_name=>'P110_ID_ACTO_RSLCION'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(103103512686629423)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14619047634931201)
,p_name=>'P110_ID_DSMBRGO_RSLCION'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(103103512686629423)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38950823162269703)
,p_name=>'P110_FCHA_RGSTRO_DSDE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(103103512686629423)
,p_prompt=>'Fecha de Registro Desde'
,p_display_as=>'NATIVE_DATE_PICKER'
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
 p_id=>wwv_flow_api.id(38950929316269704)
,p_name=>'P110_FCHA_RGSTRO_HSTA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(103103512686629423)
,p_prompt=>'Fecha de Registro Hasta'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Seleccione del calendario la fecha final del registro del embargo.'
,p_attribute_02=>'&P110_FCHA_RGSTRO_DSDE.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67115041197324306)
,p_name=>'P110_TIENE_DCMTO'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(103103512686629423)
,p_prompt=>unistr('\00BFDocumento Resoluci\00F3n?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Si;S,No;N'
,p_lov_display_null=>'YES'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186988936968480503)
,p_name=>'P110_TIENE_OFCIO'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(103103512686629423)
,p_prompt=>unistr('\00BFOficios Generados?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Si;S,No;N'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(189539185077081202)
,p_name=>'P110_TPO_ENTDD'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(103103512686629423)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(189539297834081203)
,p_name=>'P110_LTE_ENTDD_BR'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(103103512686629423)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(189539342596081204)
,p_name=>'P110_RSLCNS_IMPRSN'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(103103512686629423)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(189540569898081216)
,p_name=>'P110_ID_FNCNRIO'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(103103512686629423)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6141540098461441)
,p_name=>'Al seleccionar registros'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(83619009630313948)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6142042871461442)
,p_event_id=>wwv_flow_api.id(6141540098461441)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//validar_sel();',
'datos_resoluciones();',
'MensajeRespuesta();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6142499486461442)
,p_name=>'Al seleccionar oficios'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(82771026269499910)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6142912427461443)
,p_event_id=>wwv_flow_api.id(6142499486461442)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'datos_oficios();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6074033617867328)
,p_name=>'Al darle clic al boton Generar actos'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(6131649617461424)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6074147321867329)
,p_event_id=>wwv_flow_api.id(6074033617867328)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var json = window.localStorage.getItem(''jsonResolucionesEmbargo'');',
'let $waitPopup;',
'try {',
'    ',
unistr('    apex.message.confirm(''\00BFEst\00E1 seguro de enviar los registros para generar los actos de embargo?'', (ok) => {'),
'        if (ok) {',
'            if (apex.page.validate()) {',
'                $waitPopup = apex.widget.waitPopup();',
'                apex.server.process("GenerarActosEmbargo", {',
'                    f01: json,',
'                    pageItems: ""',
'                }).then((resp) => {',
'                    $waitPopup.remove();',
'                    if (resp.o_cdgo_rspsta === 0) {',
'                        Swal.fire({        ',
'                            icon: ''info'',',
unistr('                            title:  ''<H2 >Informaci\00F3n</H2>'','),
'                            html:   `<h4>Los documentos de embargo han sido generado de forma exitosa!</h4>`',
'                        }).then((result) => {',
'                            //apex.submit();',
'                            if (resp.o_url !== ''#''){',
'                                window.location.href = '''';',
'                            }',
'                            ',
'                        });',
'                        //window.location.href = '''';',
'                    }else{',
'                        Swal.fire({        ',
'                            icon: ''error'',',
unistr('                            title:  ''<H2 >Validaci\00F3n</H2>'','),
'                            html:   `<h4>${resp.o_cdgo_rspsta+''-''+resp.o_mnsje_rspsta}</h4>`',
'                        }).then((result) => {',
'                            //$(elm).val('''');',
'                        }); ',
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
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6074693728867334)
,p_name=>'AL darle click al boton aplicar'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(6074584614867333)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6074763088867335)
,p_event_id=>wwv_flow_api.id(6074693728867334)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var json = window.localStorage.jsonResolucionesEmbargo;',
'let $waitPopup;',
'try {',
'    JSON.parse(json);',
unistr('    apex.message.confirm(''\00BFEst\00E1 seguro de enviar los registros para el cambio de estado/etapa de embargo?'', (ok) => {'),
'        if (ok) {',
'            if (apex.page.validate()) {',
'                $waitPopup = apex.widget.waitPopup();',
'                apex.server.process("CambioEtapaEmbargo", {',
'                    f01: json,',
'                    pageItems: ""',
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
'}'))
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(57850132085104915)
,p_name=>'Al cambiar fecha resolucion'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P110_FCHA_RSLCION_DSDE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57850201019104916)
,p_event_id=>wwv_flow_api.id(57850132085104915)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P110_FCHA_RSLCION_HSTA").datepicker( ''option'' , ''minDate'' , $("#P110_FCHA_RSLCION_DSDE").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(57850486257104918)
,p_name=>'Al cambiar fecha oficio'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P110_FCHA_OFCIO_DSDE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57850591948104919)
,p_event_id=>wwv_flow_api.id(57850486257104918)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P110_FCHA_OFCIO_HSTA").datepicker( ''option'' , ''minDate'' , $("#P110_FCHA_OFCIO_DSDE").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(57850694328104920)
,p_name=>'Al cambiar fecha registro'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P110_FCHA_RGSTRO_DSDE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57850724443104921)
,p_event_id=>wwv_flow_api.id(57850694328104920)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P110_FCHA_RGSTRO_HSTA").datepicker( ''option'' , ''minDate'' , $("#P110_FCHA_RGSTRO_DSDE").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8719878166742216)
,p_name=>'Al dar click en BTN_IMPRMIR_2'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8926357582392902)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8719957358742217)
,p_event_id=>wwv_flow_api.id(8719878166742216)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'merge_2();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8720085406742218)
,p_name=>'Al dar click en BTN_IMPRMIR'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8926648020394609)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8720186605742219)
,p_event_id=>wwv_flow_api.id(8720085406742218)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'merge();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(153706060990793003)
,p_name=>'Al dar click en BTN_IMPRMIR_OFICIO_PUNTUAL'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(153705884883793001)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(153706154580793004)
,p_event_id=>wwv_flow_api.id(153706060990793003)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'merge_oficio_puntual_x_resolucion();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(153750352528710230)
,p_name=>'Al dar Click en BTN_IMPRMIR_OFICIO'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(153750215321710229)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(153750410093710231)
,p_event_id=>wwv_flow_api.id(153750352528710230)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'merge_oficios_x_resolucion();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(186949740810453004)
,p_name=>'clic BTN_GNRA_OFCIO'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(186949557744453002)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(186949824203453005)
,p_event_id=>wwv_flow_api.id(186949740810453004)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'GenerarDocumentosEmbargoOficio();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(188171154049179542)
,p_name=>'CLIC_BTN_RLCION_OFCIOS'
,p_event_sequence=>130
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(188171017840179541)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(188171207008179543)
,p_event_id=>wwv_flow_api.id(188171154049179542)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'Informacion_Reporte_Embargo_Excel();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(14619274484931203)
,p_name=>'Al seleccionar registros resp'
,p_event_sequence=>150
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(103101786027629405)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(14619398692931204)
,p_event_id=>wwv_flow_api.id(14619274484931203)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'datos_responsables();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6130506614461422)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(83619009630313948)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Resoluciones de Embargo: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6125246545461417)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(82771026269499910)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Notificaciones de Embargo: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14619644492931207)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(103101786027629405)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Responsables - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(189540383788081214)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CargarFuncionario'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P110_ID_FNCNRIO is null then',
'    :P110_ID_FNCNRIO := :F_ID_FNCNRIO;',
'end if;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(189539016510081201)
,p_process_sequence=>80
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'prc_dscrga_excel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_file_blob     blob;',
'  v_json          clob;',
'  v_cdgo_rspsta   number;',
'  v_mnsje_rspsta  varchar2(4000);',
'  v_nmbre_dcmnto  varchar2(100);',
'  begin',
'  ',
'  select json_object(key ''TPO_ENTDD''      value :P110_TPO_ENTDD,',
'                     key ''LTE_ENTDD_BR''   value :P110_LTE_ENTDD_BR,',
'                     key ''RSLCNES_IMPRSN'' value :P110_RSLCNS_IMPRSN RETURNING CLOB',
'                    )             ',
'         into v_json',
'   from dual;',
'        ',
'  pkg_cb_medidas_cautelares.prc_gn_embrgo_rlcion_excl(p_cdgo_clnte     => :F_CDGO_CLNTE,',
'                                                      p_json           => v_json,',
'                                                      o_file_blob      => v_file_blob,',
'                                                      o_cdgo_rspsta    => v_cdgo_rspsta,',
'                                                      o_mnsje_rspsta   => v_mnsje_rspsta);',
'  ',
'  htp.init;',
'  owa_util.mime_header(''application/ms-excel'', false);',
'  ',
'  v_nmbre_dcmnto := ''Relacion_Embargo_'' || to_char(sysdate,''yyyymmddhhmiss'');',
'  ',
'  htp.p(''Content-length: '' ||sys.dbms_lob.getlength(v_file_blob) );  ',
'  htp.p(''Content-Disposition: attachment; filename="''|| v_nmbre_dcmnto ||''.xlsx"'');  ',
'  htp.p(''Cache-Control: max-age=0'');',
'  owa_util.http_header_close;  ',
'  wpg_docload.download_file(v_file_blob);  ',
'  apex_application.stop_apex_engine;',
'  ',
'  exception',
'    when others then',
'      raise_application_error(-20000,''Problemas al generar excel, ''||sqlerrm);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'imprimir'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6074270135867330)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GenerarActosEmbargo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_json                     clob;',
'    v_url                      varchar2(4000);',
'    v_id_lte_mdda_ctlar_ip    number;',
'    o_cdgo_rspsta             number;',
'    o_mnsje_rspsta            varchar2(2000);',
'    v_mnsje                   varchar2(4000);',
'begin',
'     v_json := empty_clob();',
'     for i in 1..APEX_APPLICATION.g_f01.count loop',
'       v_json :=  v_json || apex_application.g_f01(i);',
'     end loop;',
'     ',
'     --insert into muerto (n_001,v_001,v_002,c_001) values (1010,''Json callback'',''Codigo Cliente: ''||v(''F_CDGO_CLNTE'')||'' - Id Usuario: '' ||v(''F_ID_USRIO''),v_json);commit;',
'                                                   ',
'    PKG_CB_MEDIDAS_CAUTELARES.prc_rg_gnrcion_actos_embargo(p_cdgo_clnte     => v(''F_CDGO_CLNTE''),',
'                                                           p_id_usuario     => v(''F_ID_USRIO''),                                        ',
'                                                           p_json_rslciones => v_json,',
'                                                           o_cdgo_rspsta    => o_cdgo_rspsta,',
'                                                           o_mnsje_rspsta   => o_mnsje_rspsta);',
'                                                           ',
'    --insert into muerto (n_001,v_001,c_001) values (1010,''Respuesta prc_rg_gnrcion_actos_embargo'',''Codigo Respuesta: ''||o_cdgo_rspsta||'' - Mensaje Respuesta: ''||o_mnsje_rspsta);commit;',
'    ',
'    v_url := apex_util.prepare_url( p_url => ''f?p='' || v(''APP_ID'') || '':110:''|| v(''APP_SESSION'')||''::NO:::'', p_checksum_type => ''SESSION'');',
'    ',
'    if o_cdgo_rspsta <> 0 then',
'        v_url := ''#'';',
'    end if;',
'    ',
'    /*htp.p(''{"type":"OK","url":"''||v_url||''","msg":"''||case when v_id_lte_mdda_ctlar_ip is null ',
'                                 then ''Actos generados Correctamente.''',
'                                 else ''Algunos registros no fueron procesados.'' ',
'                            end||''"}'');*/',
'                            ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'    apex_json.write(''o_url'', v_url);',
'    apex_json.close_object;',
'    ',
'exception',
'    when others then',
'    ',
'        --htp.p(''{"type":"ERROR","msg":"''||sqlerrm||''"}'');',
'        v_mnsje := ''Callback: Error al intentar procesar embargos. ''||sqlerrm;',
'        ',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', 100);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje);',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(186949651706453003)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GenerarActosEmbargoOficio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_json                    clob;',
'    v_json_prmtros            clob;',
'    v_url                     varchar2(4000);',
'    v_id_lte_mdda_ctlar_ip    number;',
'    v_correo                  varchar2(1000);',
'    v_id_json                 number;',
'    o_cdgo_rspsta             number;',
'    o_mnsje_rspsta            varchar2(2000);',
'    v_mnsje                   varchar2(4000);',
'begin',
'',
'     v_json := empty_clob();',
'     v_json_prmtros := empty_clob();',
'     ',
'     for i in 1..APEX_APPLICATION.g_f01.count loop',
'       v_json :=  v_json || apex_application.g_f01(i);',
'     end loop;',
'     ',
'     insert into MC_G_EMBRGOS_OFCIO_JSON ',
'                 (CDGO_CLNTE,',
'                  JSON_RSLCION) ',
'          values (:F_CDGO_CLNTE,',
'                  v_json)',
'     returning id_embrgos_ofcio_json into v_id_json;',
'          commit;',
'     ',
'     select email into v_correo',
'     from v_sg_g_usuarios where id_usrio = :F_ID_USRIO;',
'     ',
'     begin',
'       select json_object(key ''p_id_usuario'' value :F_ID_USRIO)',
'          into v_json_prmtros',
'        from dual;',
'',
'        pkg_ma_envios.prc_co_envio_programado( p_cdgo_clnte		=> :F_CDGO_CLNTE,',
'                                               p_idntfcdor		=> ''Inicio.Ofic.Embargo'',',
'                                               p_json_prmtros	=> v_json_prmtros);',
'     end;',
'     ',
'    PKG_CB_MEDIDAS_CAUTELARES.prc_gn_oficios_embargo_job(p_cdgo_clnte     => v(''F_CDGO_CLNTE''),',
'                                                         p_id_usuario     => v(''F_ID_USRIO''),                                       ',
'                                                         p_id_json        => v_id_json,',
'                                                         o_cdgo_rspsta    => o_cdgo_rspsta,',
'                                                         o_mnsje_rspsta   => o_mnsje_rspsta);',
'                                                           ',
'    --insert into muerto (n_001,v_001,c_001) values (1010,''Respuesta prc_rg_gnrcion_actos_embargo'',''Codigo Respuesta: ''||o_cdgo_rspsta||'' - Mensaje Respuesta: ''||o_mnsje_rspsta);commit;',
'    ',
'    v_url := apex_util.prepare_url( p_url => ''f?p='' || v(''APP_ID'') || '':110:''|| v(''APP_SESSION'')||''::NO:::'', p_checksum_type => ''SESSION'');',
'    ',
'    if o_cdgo_rspsta <> 0 then',
'        v_url := ''#'';',
'    end if;',
'    ',
'    --o_cdgo_rspsta := 0;',
'    --o_mnsje_rspsta := ''OK'';',
'    ',
'    /*htp.p(''{"type":"OK","url":"''||v_url||''","msg":"''||case when v_id_lte_mdda_ctlar_ip is null ',
'                                 then ''Actos generados Correctamente.''',
'                                 else ''Algunos registros no fueron procesados.'' ',
'                            end||''"}'');*/',
'                            ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'    apex_json.write(''o_url'', v_url);',
'    apex_json.write(''correo'', v_correo);',
'    apex_json.close_object;',
'    ',
'exception',
'    when others then',
'    ',
'        --htp.p(''{"type":"ERROR","msg":"''||sqlerrm||''"}'');',
'        v_mnsje := ''Callback: Error al intentar procesar embargos. ''||sqlerrm;',
'        ',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', 100);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje);',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6074882470867336)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CambioEtapaEmbargo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_json                     clob;',
'    v_url                      varchar2(4000);',
'    v_id_lte_mdda_ctlar_ip    number;',
'    v_mnsje_error            varchar2(4000);',
'begin',
'     v_json := empty_clob();',
'     for i in 1..apex_application.g_f01.count ',
'     loop',
'         v_json :=  v_json || apex_application.g_f01(i);',
'     end loop;',
'                                                   ',
'    PKG_CB_MEDIDAS_CAUTELARES.prc_rg_cmbio_etpa_estdo_embrgo(p_cdgo_clnte     => v(''F_CDGO_CLNTE''),',
'                                                             p_id_usuario     => v(''F_ID_USRIO''),                                        ',
'                                                             p_json_rslciones => v_json,',
'                                                             p_id_lte_mdda_ctlar_ip => v_id_lte_mdda_ctlar_ip,',
'                                                            p_mnsje_error => v_mnsje_error);',
'',
'    v_url := apex_util.prepare_url( p_url => ''f?p='' || v(''APP_ID'') || '':110:''|| v(''APP_SESSION'')||''::NO::P110_ID_LTE_MDDA_CTLAR:''||v_id_lte_mdda_ctlar_ip, p_checksum_type => ''SESSION'');',
'    ',
'    htp.p(''{"type":"OK","url":"''||v_url||''","msg":"''||case when v_id_lte_mdda_ctlar_ip is null and v_mnsje_error is null',
'                                 then ''Actos generados Correctamente!!''',
'                                 else ''Algunos registros no fueron procesados. ''|| v_mnsje_error',
'                            end||''"}'');',
'                            ',
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
 p_id=>wwv_flow_api.id(151459821185101140)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'prc_co_documentos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  cadena           varchar2(30) := '''';',
'  l_clob	         CLOB;',
'  v_json           clob;',
'  v_archvo_blob    blob;',
'  v_cdgo_rspsta    number;',
'  v_mnsje_rspsta   varchar2(1000);',
'begin',
'  v_json := empty_clob();',
'--insert into muerto(v_001,n_001,t_001) values(''el v_json es: '',APEX_APPLICATION.g_f01.count,systimestamp);commit;',
'  for i in 1..APEX_APPLICATION.g_f01.count loop',
'  --insert into muerto(v_001,n_001,t_001) values(''APEX_APPLICATION.g_f01(i)'',APEX_APPLICATION.g_f01.count,systimestamp);commit;',
'       v_json := v_json || APEX_APPLICATION.g_f01(i);',
'  end loop;',
'  apex_json.open_object;        -- {',
'  apex_json.open_array(''data''); --  , "data":[',
'  for c_document in (select b.file_blob, b.file_name, b.file_bfile, a.nmro_acto from gd_g_documentos b',
'                     join v_mc_g_embargos_resolucion a  on a.id_dcmnto = b.id_dcmnto',
'                     left join mc_g_embrgos_crt_prc_jrd d  on d.id_embrgos_crtra = a.id_embrgos_crtra',
'                     left join cb_g_procesos_juridico c on c.id_prcsos_jrdco = d.id_prcsos_jrdco',
'                     join json_table(v_json, ''$[*]''',
'                                        columns (',
'                                             json_id_acto varchar2(100) path ''$.ID_ACTO''',
'                                        ) ) as x on x.json_id_acto = a.id_acto  ',
'                     order by c.nmro_prcso_jrdco asc',
'                    /*select b.file_blob, b.file_name, b.file_bfile, a.nmro_acto',
'                      from gn_g_actos a',
'                      join gd_g_documentos b on a.id_dcmnto = b.id_dcmnto',
'                      join json_table(v_json, ''$[*]''',
'                                        columns (',
'                                             json_id_acto varchar2(100) path ''$.ID_ACTO''',
'                                        ) ) as x on x.json_id_acto = a.id_acto',
'                      --where b.file_blob is not null  ',
'                      order by a.nmro_acto asc*/) loop',
'                      ',
'    if c_document.file_blob is null then',
'      pkg_gd_utilidades.prc_co_archco_dsco(p_bfile        => c_document.file_bfile',
'                                        , o_archvo_blob   => v_archvo_blob',
'                                        , o_cdgo_rspsta   => v_cdgo_rspsta',
'                                        , o_mnsje_rspsta  => v_mnsje_rspsta);',
'      l_CLOB := apex_web_service.blob2clobbase64(v_archvo_blob);',
'    else',
'      l_CLOB := apex_web_service.blob2clobbase64(c_document.file_blob);',
'    end if;',
'                                       ',
'    apex_json.open_object;    --    {',
'    apex_json.write(''fileBlob'', l_CLOB); --      "fileBlob": documento en blob',
'    apex_json.write(''fileName'', c_document.file_name); --      "fileName": nombre del documento',
'    apex_json.close_object;   --    }',
'      ',
'  end loop;',
'  apex_json.close_all;          --  ]   -- }',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16514018644473715)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'prc_co_documentos_individual_oficios'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  cadena           varchar2(30) := '''';',
'  l_clob	         CLOB;',
'  v_json           clob;',
'  v_archvo_blob    blob;',
'  v_cdgo_rspsta    number;',
'  v_mnsje_rspsta   varchar2(1000);',
'begin',
'  v_json := empty_clob();',
'--insert into muerto(v_001,n_001,t_001) values(''el v_json es: '',APEX_APPLICATION.g_f01.count,systimestamp);commit;',
'  for i in 1..APEX_APPLICATION.g_f01.count loop',
'  --insert into muerto(v_001,n_001,t_001) values(''APEX_APPLICATION.g_f01(i)'',APEX_APPLICATION.g_f01.count,systimestamp);commit;',
'       v_json := v_json || APEX_APPLICATION.g_f01(i);',
'  end loop;',
'  apex_json.open_object;        -- {',
'  apex_json.open_array(''data''); --  , "data":[',
'  for c_document in (select b.file_blob, b.file_name, b.file_bfile, a.nmro_acto',
'                      from gn_g_actos a',
'                      join gd_g_documentos b on a.id_dcmnto = b.id_dcmnto',
'                      join json_table(v_json, ''$[*]''',
'                                        columns (',
'                                             json_id_acto varchar2(100) path ''$.ID_ACTO''',
'                                        ) ) as x on x.json_id_acto = a.id_acto',
'                      --where b.file_blob is not null  ',
'                      order by a.nmro_acto asc) loop',
'                      ',
'    if c_document.file_blob is null then',
'      pkg_gd_utilidades.prc_co_archco_dsco(p_bfile        => c_document.file_bfile',
'                                        , o_archvo_blob   => v_archvo_blob',
'                                        , o_cdgo_rspsta   => v_cdgo_rspsta',
'                                        , o_mnsje_rspsta  => v_mnsje_rspsta);',
'      l_CLOB := apex_web_service.blob2clobbase64(v_archvo_blob);',
'    else',
'      l_CLOB := apex_web_service.blob2clobbase64(c_document.file_blob);',
'    end if;',
'                                       ',
'    apex_json.open_object;    --    {',
'    apex_json.write(''fileBlob'', l_CLOB); --      "fileBlob": documento en blob',
'    apex_json.write(''fileName'', c_document.file_name); --      "fileName": nombre del documento',
'    apex_json.close_object;   --    }',
'      ',
'  end loop;',
'  apex_json.close_all;          --  ]   -- }',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12379165537437104)
,p_process_sequence=>60
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'prc_co_documentos_msvos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  cadena           varchar2(30) := '''';',
'  l_clob	         CLOB;',
'  v_json           clob;',
'  v_archvo_blob    blob;',
'  v_cdgo_rspsta    number;',
'  v_mnsje_rspsta   varchar2(1000);',
'begin',
'  v_json := empty_clob();',
'--insert into muerto(v_001,n_001,t_001) values(''el v_json es: '',APEX_APPLICATION.g_f01.count,systimestamp);commit;',
'  for i in 1..APEX_APPLICATION.g_f01.count loop',
'       v_json := v_json || APEX_APPLICATION.g_f01(i);',
'  end loop;',
'    insert into muerto(v_001,c_001) values(''JSON_OFICIOS'',v_json);commit;',
'  apex_json.open_object;        -- {',
'  apex_json.open_array(''data''); --  , "data":[',
'  for c_document in (select b.file_blob, b.file_name, b.file_bfile, a.nmro_acto',
'                      from gn_g_actos a',
'                      join gd_g_documentos b on a.id_dcmnto = b.id_dcmnto',
'                      join json_table(v_json, ''$''',
'                                        columns (',
'                                             json_id_acto varchar2(100) path ''$.ID_ACTO''',
'                                        ) ) as x on x.json_id_acto = a.id_acto',
'                      --where b.file_blob is not null  ',
'                      order by a.nmro_acto asc) loop',
'                      ',
'    if c_document.file_blob is null then',
'      pkg_gd_utilidades.prc_co_archco_dsco(p_bfile        => c_document.file_bfile',
'                                        , o_archvo_blob   => v_archvo_blob',
'                                        , o_cdgo_rspsta   => v_cdgo_rspsta',
'                                        , o_mnsje_rspsta  => v_mnsje_rspsta);',
'      l_CLOB := apex_web_service.blob2clobbase64(v_archvo_blob);',
'    else',
'      l_CLOB := apex_web_service.blob2clobbase64(c_document.file_blob);',
'    end if;',
'                                       ',
'    apex_json.open_object;    --    {',
'    apex_json.write(''fileBlob'', l_CLOB); --      "fileBlob": documento en blob',
'    apex_json.write(''fileName'', c_document.file_name); --      "fileName": nombre del documento',
'    apex_json.close_object;   --    }',
'      ',
'  end loop;',
'  apex_json.close_all;          --  ]   -- }',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(153705986132793002)
,p_process_sequence=>70
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'prc_co_documentos_oficio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*declare',
'  v_cdgo_rspsta    number;',
'  v_mnsje_rspsta   varchar2(4000);',
'  v_json_rslcion   clob := apex_application.g_x01;',
'  v_rslcnes        number;',
'begin',
'  delete from mc_g_imprsn_ofcios;',
'  ',
'  apex_json.open_object;        -- {',
'  apex_json.open_array(''dataOficio''); --  , "data":[',
'   ',
'    ',
'    for c_datos in (select ',
'                            a.rslcnes_imprsn',
'                    from mc_g_solicitudes_y_oficios a ',
'                    where a.id_embrgos_rslcion in (select ',
'                                    rslcion',
'                                from ',
'                                json_table (v_json_rslcion,''$[*]''',
'                                    columns (rslcion number PATH ''$.ID_ER''',
'                                    )))',
'                            group by a.rslcnes_imprsn) loop',
'                            ',
'                            select rslciones into v_rslcnes from',
'                                                (select level,',
'                                                    (regexp_substr(c_datos.rslcnes_imprsn,',
'                                                    ''[^,]+'', 1, level )) as rslciones',
'                                                from dual',
'                                                connect by level <= regexp_count( ',
'                                                                c_datos.rslcnes_imprsn,',
'                                                                '','' ) + 1',
'                                                and prior sys_guid() is not null',
'                                                and level = 1);',
'                            ',
'                            insert into mc_g_imprsn_ofcios (id_embrgos_rslcion) values (v_rslcnes);commit;     ',
'                end loop;',
'    ',
'    for c_oficios in (select a.id_acto_ofcio',
'                        from mc_g_solicitudes_y_oficios a join mc_d_entidades b on a.id_entddes = b.id_entddes',
'                        where a.id_embrgos_rslcion in (select ',
'                                        rslcion',
'                                    from ',
'                                    json_table (v_json_rslcion,''$[*]''',
'                                        columns (rslcion number PATH ''$.ID_ER''',
'                                        )))',
'                                        and b.cdgo_entdad_tpo = ''BR''',
'                                order by a.id_acto_ofcio asc ) loop',
'                                       ',
'    apex_json.open_object;    --    {',
'    apex_json.write(''ID_ACTO'', c_oficios.id_acto_ofcio); --      "idActo": id del acto oficio',
'    apex_json.close_object;   --    }',
'      ',
'  end loop;',
'  ',
'  for c_oficios in (select min(a.id_acto_ofcio) as id_acto_ofcio',
'                        from mc_g_solicitudes_y_oficios a ',
'                        join mc_d_entidades b on a.id_entddes = b.id_entddes',
'                        where a.id_embrgos_rslcion in (select id_embrgos_rslcion from mc_g_imprsn_ofcios)',
'                                        and b.cdgo_entdad_tpo <> ''BR''',
'                        group by a.id_entddes,a.id_embrgos_rslcion ) loop',
'                                       ',
'    apex_json.open_object;    --    {',
'    apex_json.write(''ID_ACTO'', c_oficios.id_acto_ofcio); --      "idActo": id del acto oficio',
'    apex_json.close_object;   --    }',
'      ',
'  end loop;',
'  ',
'  apex_json.close_all;          --  ]   -- }',
'end;*/',
'',
'declare',
'  v_cdgo_rspsta    number;',
'  v_mnsje_rspsta   varchar2(1000);',
'  v_id_rslcion     number := apex_application.g_x01;',
'begin',
'',
'  apex_json.open_object;        -- {',
'  apex_json.open_array(''dataOficio''); --  , "data":[',
'  for c_oficios in (select distinct(a.id_acto_ofcio) as acto_ofcio',
'                    from mc_g_solicitudes_y_oficios a',
'                    where a.id_embrgos_rslcion = v_id_rslcion                   ',
'                    order by a.id_acto_ofcio asc ) loop',
'                                       ',
'    apex_json.open_object;    --    {',
'    apex_json.write(''ID_ACTO'', c_oficios.acto_ofcio); --      "idActo": id del acto oficio',
'    apex_json.close_object;   --    }',
'      ',
'  end loop;',
'  apex_json.close_all;          --  ]   -- }',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(186988809712480502)
,p_process_sequence=>80
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ConsultarOficio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_json                    clob;',
'    v_id_lte_mdda_ctlar_ip    number;',
'    v_vlor_gnrcion            varchar2(10);',
'    o_cdgo_rspsta             number;',
'    o_mnsje_rspsta            varchar2(2000);',
'    v_mnsje                   varchar2(4000);',
'    v_contador                number;',
'begin',
'     v_json := empty_clob();',
'     for i in 1..APEX_APPLICATION.g_f01.count loop',
'       v_json :=  v_json || apex_application.g_f01(i);',
'     end loop;',
'     ',
'     select a.VLOR',
'        into v_vlor_gnrcion',
'    from cb_d_process_prssvo_cnfgrcn a',
'    where a.cdgo_clnte = :F_CDGO_CLNTE',
'        and a.CDGO_CNFGRCION = ''GDO'';',
'     ',
'     select  count(*) into v_contador',
'        from mc_g_solicitudes_y_oficios a join mc_g_embargos_cartera b ',
'        on a.id_embrgos_crtra = b.id_embrgos_crtra',
'    where a.gnra_ofcio = ''N'' and a.id_embrgos_crtra in (',
'    select id_embrgos_crtra from  mc_g_embargos_sjto where id_sjto in (',
'                    select id_sjto from v_si_i_sujetos_impuesto',
'        where idntfccion_sjto in (select identificacion',
'                from ',
'                json_table (v_json,''$[*]''',
'                            columns (identificacion varchar2 (400) PATH ''$.IDNTF''',
'                            )))));',
'    ',
'    if (v_contador > 0 and v_vlor_gnrcion = ''N'') then',
'          o_cdgo_rspsta := 0;',
'          o_mnsje_rspsta := ''Si tiene resoluciones sin oficios'';',
'      else',
'        o_cdgo_rspsta := 10;',
'        o_mnsje_rspsta := ''No hay resoluciones sin oficio'';',
'    end if;',
'                            ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'    apex_json.close_object;',
'    ',
'exception',
'    when others then',
'    ',
'        --htp.p(''{"type":"ERROR","msg":"''||sqlerrm||''"}'');',
'        v_mnsje := ''Callback: Error al intentar procesar embargos. ''||sqlerrm;',
'        ',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', 100);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje);',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(188170985158179540)
,p_process_sequence=>90
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DescargarExcel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'  v_json           clob;',
'  v_tpo_entdd      varchar2(5);',
'  v_cntdd          number;',
'  v_lte_mdda_ctlar number;',
'  v_rslcnes_imprsn clob;',
'  v_mnsje          varchar2(4000);',
'  v_cdgo_rspsta    number;',
'begin',
'',
'   v_json := empty_clob();',
'   for i in 1..APEX_APPLICATION.g_f01.count loop',
'      v_json :=  v_json || apex_application.g_f01(i);',
'   end loop;',
'   ',
'   --Validamos que solo venga una solicitud en el json',
'   select count(*) into v_cntdd from ',
'          json_table (v_json,''$[*]''',
'                        columns (id_embrgo_crtra varchar2 (400) PATH ''$.ID_EC''',
'                       ));',
'    ',
'   if v_cntdd > 1 then',
'     v_cdgo_rspsta := 10;',
unistr('     v_mnsje       := ''No puede seleccionar m\00E1s de un registro para ser procesado, por favor valide la selecci\00F3n.'';'),
'     ',
'   elsif v_cntdd = 0 then',
'     v_cdgo_rspsta := 20;',
'     v_mnsje       := ''Por favor seleccione un registro para realizar el proceso.'';',
'     ',
'   elsif v_cntdd = 1 then',
unistr('   --Seleccionamos el tipo de entidad para realizar la validaci\00F3n'),
'   select b.cdgo_entdad_tpo into v_tpo_entdd',
'     from mc_g_solicitudes_y_oficios a ',
'           join mc_d_entidades b on a.id_entddes = b.id_entddes',
'        where a.id_slctd_ofcio in (',
'        select id_slctd_ofcio',
'        from ',
'        json_table (v_json,''$[*]''',
'                    columns (id_slctd_ofcio varchar2 (400) PATH ''$.ID_SO''',
'                    )));',
'   ',
'       --Validamos que tipo de entidad es para los datos que se van a mandar al procedimiento',
'       if (v_tpo_entdd = ''BR''  ) then',
'           select id_lte_mdda_ctlar into v_lte_mdda_ctlar',
'             from MC_G_EMBARGOS_CARTERA',
'                where id_embrgos_crtra in (',
'                select id_embrgo_crtra',
'                from ',
'                json_table (v_json,''$[*]''',
'                            columns (id_embrgo_crtra varchar2 (400) PATH ''$.ID_EC''',
'                            )));',
'           v_cdgo_rspsta := 0;',
'           v_mnsje       := ''OK'';',
'           ',
'      elsif (v_tpo_entdd = ''FN'') then',
'         select a.rslcnes_imprsn into v_rslcnes_imprsn',
'                 from mc_g_solicitudes_y_oficios a ',
'                    where a.id_slctd_ofcio in (',
'                    select id_slctd_ofcio',
'                    from ',
'                    json_table (v_json,''$[*]''',
'                                columns (id_slctd_ofcio varchar2 (400) PATH ''$.ID_SO''',
'                                )));',
'          v_cdgo_rspsta := 0;',
'          v_mnsje       := ''OK'';',
'       end if;',
'   end if;',
'   ',
'   apex_json.open_object;',
'   apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'   apex_json.write(''o_mnsje_rspsta'', v_mnsje);',
'   apex_json.write(''v_tpo_entdd'', v_tpo_entdd);',
'   apex_json.write(''v_lte_mdda_ctlar'', v_lte_mdda_ctlar);',
'   apex_json.write(''v_rslcnes_imprsn'', v_rslcnes_imprsn);',
'   apex_json.close_object;',
' ',
'exception',
'    when others then',
'        --htp.p(''{"type":"ERROR","msg":"''||sqlerrm||''"}'');',
'        --v_mnsje := ''Callback: Error al intentar procesar embargos. ''||sqlerrm;',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', 100);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje);',
'        apex_json.close_object;',
'    ',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12788550563551503)
,p_process_sequence=>100
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Valida_Resoluciones'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_json           clob;',
'  v_cdgo_rspsta    number;',
'  v_mnsje_rspsta   varchar2(4000);',
'  v_id_rslcion     number := apex_application.g_x01;',
'begin',
'  ',
'  v_json := empty_clob();',
'--insert into muerto(v_001,n_001,t_001) values(''el v_json es: '',APEX_APPLICATION.g_f01.count,systimestamp);commit;',
'  for i in 1..APEX_APPLICATION.g_f01.count loop',
'  --insert into muerto(v_001,n_001,t_001) values(''APEX_APPLICATION.g_f01(i)'',APEX_APPLICATION.g_f01.count,systimestamp);commit;',
'       v_json := v_json || APEX_APPLICATION.g_f01(i);',
'  end loop;',
'  ',
'  insert into muerto (v_001,c_001) values (''Json'',v_json);commit;',
'  ',
'  --apex_json.initialize_clob_output;',
'  apex_json.open_object;        ',
'  apex_json.open_array(''dataOficio''); --  , "data":[',
'  for c_oficios in (select distinct(a.id_acto_ofcio) as acto_ofcio',
'                    from mc_g_solicitudes_y_oficios a',
'                    where a.id_embrgos_rslcion in (select id_embrgos_rslcion',
'                                                    from ',
'                                                    json_table (v_json,''$[*]''',
'                                                                columns (id_embrgos_rslcion varchar2 (400) PATH ''$.ID_ER''',
'                                                                )))',
'                    order by a.id_acto_ofcio asc ) loop',
'                                       ',
'    apex_json.open_object;    --    {',
'    apex_json.write(''ID_ACTO'', c_oficios.acto_ofcio); --      "idActo": id del acto oficio',
'    apex_json.close_object;   --    }',
'      ',
'  end loop;',
'    ',
'  apex_json.close_all;',
'  --insert into muerto (v_001,c_001) values (''Json 2'',apex_json.get_clob_output);commit;',
'  --apex_json.free_output;',
'  ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14619763305931208)
,p_process_sequence=>110
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualiza_PDF_Resolucion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_mnsje varchar2(4000);',
'  v_rprte number;',
'begin',
' ',
' select max(p.id_rprte) into v_rprte ',
'  from mc_g_desembargos_resolucion c join gn_d_plantillas p on c.id_plntlla = p.id_plntlla',
'  where c.id_dsmbrgos_rslcion = :P110_id_DSMBRGO_RSLCION;',
' ',
' if :P110_ID_ACTO_RSLCION is not null and :P110_ID_DSMBRGO_RSLCION is not null and v_rprte is not null then',
'     pkg_cb_medidas_cautelares.prc_rg_blob_acto_embargo(:F_CDGO_CLNTE,',
'                                                             :P110_ID_ACTO_RSLCION,',
'                                                             ''<data><id_dsmbrgos_rslcion>'' ||',
'                                                             :P110_id_DSMBRGO_RSLCION ||',
'                                                             ''</id_dsmbrgos_rslcion></data>'',',
'                                                             v_rprte); ',
'        commit;                                                     ',
'        v_mnsje := ''Proceso Finalizado'';                                                     ',
'        apex_json.open_object;',
'        apex_json.write(''mensaje'', v_mnsje);',
'        apex_json.close_object;',
' else ',
'        v_mnsje := ''Debe seleccionar un registro y la plantilla debe tener un reporte asociado'';                                                     ',
'        apex_json.open_object;',
'        apex_json.write(''mensaje'', v_mnsje);',
'        apex_json.close_object;',
' end if;',
'    ',
'exception',
'    when others then',
'    ',
'        --htp.p(''{"type":"ERROR","msg":"''||sqlerrm||''"}'');',
'        v_mnsje := ''Callback: Error al intentar procesar embargos. ''||sqlerrm;',
'        insert into muerto (v_001) values (''ERROR  :P110_ID_ACTO_RSLCION ''||:P110_ID_ACTO_RSLCION||'' :P110_id_DSMBRGO_RSLCION ''); commit;',
'        apex_json.open_object;',
'        apex_json.write(''mensaje'', v_mnsje);',
'        apex_json.close_object;                                                         ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
