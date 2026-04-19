prompt --application/pages/page_00118
begin
wwv_flow_api.create_page(
 p_id=>118
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Candidatos a Desembargar'
,p_step_title=>'Candidatos a Desembargar'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1',
'#APP_IMAGES#pdf-lib.min.js',
'#APP_IMAGES#FileSaver.min.js',
'#APP_IMAGES#jszip.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//Ocultamos los botones',
'apex.item("BTN_GNRA_OFCIO").hide();',
'apex.item("BTN_RLCION_OFCIOS").hide();',
'',
'function datos_resoluciones() {',
'    ',
'    apex.item("btn_dtos_csal").hide();',
'    ',
'    var region = apex.region("resoluciones_desembargo");',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");        ',
'              ',
'        //OBTENEMOS UN JSON CON LOS DATOS SELECCIONADOS QUE NO HAN SIDO PROCESADOS',
'        var json = records.map(function (record) {',
'            return { "ID_ER": model.getValue(record, "ID_EMBRGOS_RSLCION").trim(),',
'                     "ID_DR": model.getValue(record, "ID_DSMBRGOS_RSLCION").trim(),',
'                     "ID_EC": model.getValue(record, "ID_EMBRGOS_CRTRA").trim(),',
'                     "ID_IF": model.getValue(record, "ID_INSTNCIA_FLJO").trim(),',
'                     "IDNTF": model.getValue(record, "IDNTFCCION").trim(),',
'                     "ID_ACTO": model.getValue(record, "ID_ACTO").trim(), ',
'                     "ID_TMC": model.getValue(record, "ID_TPOS_MDDA_CTLAR").trim(),',
'                     "ID_FTE": model.getValue(record, "ID_FLJO_TREA_ESTDO").trim(),',
'                     "ID_FT": model.getValue(record, "ID_FLJO_TREA").trim(),',
'                     "ID_DS": model.getValue(record, "ID_DSMBRGO_SPRTE").trim(),',
'                     "ID_CD": model.getValue(record, "ID_CSLES_DSMBRGO").trim()                    ',
'                   };',
'        });',
'        ',
'        //window.localStorage.setItem(''jsonResolucionesDesembargo'', JSON.stringify(json));',
'               ',
'        //SETEAMOS EL VALOR DEL JSON EN FORMA DE CADENA AL ITEM ',
'        //$s(''P119_JSON_RESOLUCIONES'', json.length > 0 ? JSON.stringify(json) : '''');',
'        ',
'        window.localStorage.setItem(''jsonResolucionesDesembargo'', json.length > 0 ? JSON.stringify(json) : '''');',
'                ',
'         //HABILITAMOS O DESHABILITAMOS EL BOTOM DEPENDIENDO SI HAY MAS DE UN REGISTRO SELECCIONADO',
'        if (json.length === 1 ){                ',
'            $s(''P118_ID_DSMBRGOS_RSLCION'',  json[0]["ID_DR"] );//SETEAMOS EL VALOR DEL ID DEL EMBARGO SI SOLO HAY UNO SELECIONADO ',
'            $s(''P118_ID_EMBRGOS_CRTRA''  ,  json[0]["ID_EC"] );',
'            $s(''P118_IDNTFCCION''  ,  json[0]["IDNTF"] );',
'            $s(''P118_ID_TPOS_EMBRGO''  ,  json[0]["ID_TMC"] );',
'            $s(''P118_ID_DSMBRGO_SPRTE''  ,  json[0]["ID_DS"] );',
'            ',
'            apex.item("btn_dtos_csal").show();',
'            ',
'        }else {',
'            $s(''P118_ID_DSMBRGOS_RSLCION'',  '''');',
'            $s(''P118_ID_EMBRGOS_CRTRA'',  '''');',
'            $s(''P118_IDNTFCCION''  ,  '''' );',
'            $s(''P118_ID_TPOS_EMBRGO''  ,  '''' );',
'            $s(''P118_ID_DSMBRGO_SPRTE''  ,  '''');',
'           ',
'        }     ',
'        ',
'        ',
'        // Validacion de tener documento',
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
'        //SOLO SE PUEDE INICIAR EL PROCESO SI HAY POR LO MENOS UN REGISTRO SELECCIONADO',
'        /*if (records.length > 0 ) {',
'            apex.item("btn_desembargo_total").show();',
'            apex.item("btn_desembargo_parcial").hide();',
'        }else {',
'            apex.item("btn_desembargo_total").hide();',
'        }*/',
'        ',
'        let jsonOficio = records.map(function (record) { return { "ID_DR": model.getValue(record, "ID_DSMBRGOS_RSLCION").trim()',
'                                                                , "TIENE_DCMNTO": model.getValue(record, "TIENE_DCMNTO").trim() }; });',
'        ',
'        window.localStorage.setItem(''jsonResolucionesDesembargoOficio'', JSON.stringify(jsonOficio.filter(data => { return data.TIENE_DCMNTO === ''S'' })));',
'',
'        return;',
'    }',
'    ',
'    //apex.item("btn_desembargo_total").hide();    ',
'    //apex.item("btn_desembargo_parcial").hide();',
'}',
'',
'async function Set_Session(){',
'await apex.server.process("Set Session Value", {',
'                pageItems: "#P118_ID_ACTO,#P118_ID_SLCTD_OFCIO,#P118_ID_ENTDDES"',
'            },{',
'                success: function(data){',
'                    console.log(data);',
'             }',
'      })',
'}',
'',
'function datos_oficios() {',
'    console.log(''ok'');',
'    var region = apex.region("oficios_desembargo");',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        var descripcion = records.map(function (record) {',
'            return model.getValue(record, "DSCRPCION");',
'        })[0];',
'        ',
'        var id_acto = records.map(function (record) {',
'            return model.getValue(record, "ID_ACTO");',
'        })[0];',
'        ',
'        var id_slctud_ofcio = records.map(function (record) {',
'            return model.getValue(record, "ID_SLCTD_OFCIO");',
'        })[0];',
'        ',
'        var id_entddes = records.map(function (record) {',
'            return model.getValue(record, "ID_ENTDDES");',
'        })[0];',
'        ',
'        console.log(descripcion);',
'        console.log(id_acto);',
'        console.log(id_slctud_ofcio);',
'        console.log(id_entddes);',
'        ',
'        ',
'        if (descripcion == ''OFICIO GENERALIZADO'') {',
'            apex.item("BTN_VER_PDF").show();',
'            apex.item( "P118_ID_ACTO" ).setValue(id_acto);',
'            apex.item( "P118_ID_SLCTD_OFCIO" ).setValue(id_slctud_ofcio);',
'            apex.item( "P118_ID_ENTDDES" ).setValue(id_entddes);',
'            apex.item("G_PDF").hide();',
'            Set_Session();',
'        }else{',
'            apex.item("BTN_VER_PDF").hide();',
'        }',
'        ',
'        //OBTENEMOS UN JSON CON LOS DATOS SELECCIONADOS QUE NO HAN SIDO PROCESADOS',
'        var json = records.map(function (record) {',
'            return { "ID_SO": model.getValue(record, "ID_SLCTD_OFCIO").trim(),',
'                     "ID_EC": model.getValue(record, "ID_EMBRGOS_CRTRA").trim(),',
'                     "ID_DR": model.getValue(record, "ID_DSMBRGOS_RSLCION").trim(),',
'                     "ID_DO": model.getValue(record, "ID_DSMBRGO_OFCIO").trim(),',
'                   };',
'        });',
'               ',
'        //SETEAMOS EL VALOR DEL JSON EN FORMA DE CADENA AL ITEM ',
'        $s(''P119_JSON_OFCIOS'', json.length > 0 ? JSON.stringify(json) : '''');',
'        ',
'        window.localStorage.setItem(''JSON_OFCIOS_DSMBRGOS'', json.length > 0 ? JSON.stringify(json) : '''');',
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
'		',
'        return;',
'    }',
'    ',
'    //apex.item("btn_desembargo_parcial").hide();    ',
'',
'}',
'',
'',
'function seleccionarTodos(e,btn,grid,data){',
'    var datos = data.map((m) => {',
'            return { "ID_DR": m.ID_DSMBRGOS_RSLCION,',
'                     "ID_EC": m.ID_EMBRGOS_CRTRA,',
'                     "ID_IF": m.ID_INSTNCIA_FLJO,',
'                     "IDNTF": m.IDNTFCCION,',
'                     "ID_TMC": m.ID_TPOS_MDDA_CTLAR,',
'                     "ID_FTE": m.ID_FLJO_TREA_ESTDO,',
'                     "ID_FT": m.ID_FLJO_TREA,',
'                     "ID_DS": m.ID_DSMBRGO_SPRTE,                     ',
'                     "ID_CD": m.ID_CSLES_DSMBRGO  ',
'                   }; ',
'        }); ',
'    window.localStorage.setItem(''jsonResolucionesDesembargo'', JSON.stringify(datos));',
'    //apex.submit(''btn_Procesar_Embargo'');',
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
'  let v_json = localStorage.getItem(''jsonResolucionesDesembargo'');',
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
'        console.log(''(i < cantidad) => '', i+'' < ''+cantidad);',
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
'    zip.file(`Gestion_de_Actos_Desembargo.pdf`, mergedPdfFile);',
'    zip.generateAsync({ type: "blob" }).then(mergedPdfFile => {',
'      download(mergedPdfFile, `Resoluciones_de_Desembargo_masivo.zip`, ''application/zip'');',
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
'  let v_json = localStorage.getItem(''jsonResolucionesDesembargo'');',
'  let contentJson = JSON.parse(v_json)',
'  let array = JSON.parse(v_json);',
'  console.log(''Array de merge'',array)',
'  let cantidad = array.length;',
'  let contador = 0;',
'  console.log(''cantidad'', cantidad)',
'  if (cantidad > 0) {',
'    let i = 0;',
'    let respData = [];',
'    while (i <= cantidad) {',
'      console.log(''(i < cantidad) => '', i+'' < ''+cantidad);',
'        const { data } = await peticionServerProcess(''prc_co_documentos'', { f01: JSON.stringify(array.slice(i, i + 19 + 1)) });',
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
'      download(mergedPdfFile, `Resoluciones_de_Desembargo_individual.zip`, ''application/zip'');',
'    });',
'    console.timeEnd(''loop''); // Muestra por consola: "loop: 63ms"',
'  } else {',
'    alert(''No existen documentos asociados.'')',
'  }',
'  popup.remove();',
'}',
'',
'const merge_oficio_puntual_x_resolucion = async () => {',
'  console.time(''loop'');',
'  let popup = apex.widget.waitPopup();',
'  let zip = new JSZip();',
'  let json = localStorage.getItem(''jsonResolucionesDesembargoOficio'');',
'  let array = JSON.parse(json);',
'  console.log(''Array de merge'', array)',
'  let cantidad = array.length;',
'  let contador = 0;',
'  if (cantidad > 0) {',
'    let i = 0;',
'    let respData = [];',
'    while (i < cantidad) {',
'      console.log(''array: ''+array[i].ID_DR);',
'      const { dataOficio } = await peticionServerProcess(''prc_co_documentos_oficio'', { x01: array[i].ID_DR });',
'      const { data } = await peticionServerProcess(''prc_co_documentos'', { f01: JSON.stringify(dataOficio) });',
'      console.log(`# de datos => ${data.length}`)',
'      let j = 0',
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
'      download(mergedPdfFile, `Oficios_de_Desembargo_individual.zip`, ''application/zip'');',
'    });',
'    ',
'  } else {',
'    alert(''No existen documentos asociados.'')',
'  }',
'  popup.remove();',
'  console.timeEnd(''loop''); // Muestra por consola: "loop: 63ms"',
'}',
'',
'const merge_oficios_x_resolucion = async () => {',
'  console.time(''loop'');',
'  let popup = apex.widget.waitPopup();',
'  let zip = new JSZip();',
'  let v_json = localStorage.getItem(''jsonResolucionesDesembargoOficio'');',
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
'    ',
'    //Recorrer las resoluciones',
'    while (i < array.length) {',
'        ',
unistr('        //data de oficios de x cada resoluci\00F3n de embargo seleccionada.'),
'        const { dataOficio } = await peticionServerProcess(''prc_co_documentos_oficio'', { x01: array[i].ID_DR });',
'        ',
'        let j = 0;',
'        ',
'        while (j < dataOficio.length){',
unistr('            //Data de los actos pertenecientes a los oficios de cada resoluci\00F3n de embargo seleccionada.'),
'            const { data } = await peticionServerProcess(''prc_co_documentos'', { f01: JSON.stringify(dataOficio) });',
'',
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
'    }',
'        ',
'    const mergedPdfFile = await mergedPdf.save();',
'    zip.file(''Oficios_de_Desembargo.pdf'', mergedPdfFile);',
'    zip.generateAsync({ type: "blob" }).then(mergedPdfFile => {',
'      download(mergedPdfFile, `Oficios_de_Desembargo.zip`, ''application/zip'');',
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
'const GenerarDocumentosDesembargoOficio = () => { ',
'    var json = window.localStorage.getItem(''jsonResolucionesDesembargo'');',
'    let $waitPopup;',
'    try {',
'',
unistr('        apex.message.confirm(''\00BFEst\00E1 seguro de enviar los registros para generar los actos de embargo?'', (ok) => {'),
'            if (ok) {',
'                if (apex.page.validate()) {',
'                    $waitPopup = apex.widget.waitPopup();',
'                    apex.server.process("GenerarActosDesembargoOficio", {',
'                        f01: json,',
'                        pageItems: ""',
'                    }).then((resp) => {',
'                        $waitPopup.remove();',
'                        if (resp.o_cdgo_rspsta === 0) {',
unistr('                            Swal.fire(''<h2><b>\00A1El proceso se ha iniciado correctamente!</b></h2>'','),
'                                        ''<h3>'' + ''Se ha enviado un correo electronico a '' + resp.correo + ''</h3>'',',
'                                        ''success''',
'                                     ).then((result) => {',
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
'async function MensajeRespuesta(){',
'    ',
unistr('    console.log(''Ejecuto la funci\00F3n MensajeRespuesta'');'),
'    var json = window.localStorage.getItem(''jsonResolucionesDesembargo'');',
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
'async function Informacion_Reporte_Dsmbargo_Excel(){',
'    ',
unistr('    console.log(''Ejecuto la funci\00F3n Informacion_Reporte_Dsmbargo_Excel'');'),
'    var json = window.localStorage.getItem(''JSON_OFCIOS_DSMBRGOS'');',
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
'                        apex.item( "P118_TPO_ENTDD" ).setValue(data.v_tpo_entdd);',
'                        //apex.item( "P118_LTE_ENTDD_BR" ).setValue(data.v_lte_mdda_ctlar);',
'                        apex.item( "P118_RSLCNS_IMPRSN" ).setValue(data.v_rslcnes_imprsn);',
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
'',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.region("resoluciones_desembargo").widget().interactiveGrid("setSelectedRecords", []);',
'datos_resoluciones();',
'datos_oficios();',
'apex.item("BTN_IMPRMIR_2").hide();',
'apex.item("BTN_IMPRMIR").hide();',
'apex.item("btn_generar_actos").hide();',
'apex.item("BTN_IMPRMIR_OFICIO_PUNTUAL").hide();'))
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(17445683081942948)
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20251104111930'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(122712086128265508)
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
'<p>Funcionalidad que permite realizar el desembargo parcial o total de los embargos seleccionadas. ademas permite observar la informacion del bien embargado y los responsables del embargo.</p>',
'<p>1.El desembargo total se hace con los datos de las resoluciones de embargo, se deben seleccionar los embargos y luego presionar el boton "Desembargo total" para luego seleccionar la causal e ingresar los datos de la causal para poder realizar el/l'
||'os desembargos</p>',
'<p>2.El desemabrgo parcial se hace con los datos de los oficios de un embargo, se deben seleccionar los oficios asociados a un embargo y luego presionar el boton "Desemnbargo Parcial" para luego seleccionar la causal e ingresar los datos de la causal'
||' para poder realizar el/los desembargo</p>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(122712553025265513)
,p_plug_name=>'Oficios de Desembargo'
,p_region_name=>'oficios_desembargo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.id_dsmbrgo_ofcio,',
'       c.id_slctd_ofcio,       ',
'       c.id_dsmbrgos_rslcion,',
'       a.id_entddes,',
'       nvl(a.dscrpcion, ''OFICIO GENERALIZADO'') as dscrpcion,',
'       nvl(a.rspnsble,''TODOS LOS RESPONSABLES'') as rspnsble,       ',
'       c.id_acto,',
'       c.nmro_acto,',
'       to_char(c.fcha_acto,''dd/mm/yyyy'') as fcha_acto,',
'       a.id_embrgos_crtra,',
'       a.activo,',
'       b.id_tpos_mdda_ctlar,',
'       b.idntfccion,',
'       case',
'                   when c.id_acto is not null then',
'                    ''<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" aria-labelledby="id_tareas_ig_grid_vc_ctx id_tareas_ig_grid_vc_cur">Ver PDF <span class="fa fa-eye"></span>',
'</button>''',
'                   else',
'                    '' ''',
'                 end as pdf',
'          from mc_g_desembargos_oficio c',
'          left join v_mc_g_solicitudes_y_oficios a on a.id_slctd_ofcio = c.id_slctd_ofcio',
'          join v_mc_g_desembargos_resolucion b on b.id_dsmbrgos_rslcion = c.id_dsmbrgos_rslcion',
' where c.estado_rvctria = ''N'' ',
' and c.nmro_acto is not null'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(123560536386079551)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(5931984594225402)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
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
 p_id=>wwv_flow_api.id(46014485579632920)
,p_name=>'PLANTILLA'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" aria-labelledby="id_tareas_ig_grid_vc_ctx id_tareas_ig_grid_vc_cur">Modificar plantilla <span class="fa fa-external-link"></span>',
'</button>'))
,p_link_target=>'f?p=&APP_ID.:123:&SESSION.::&DEBUG.:RP,123:P123_CDGO_EMBRGO,P123_ID_DSMBRGOS_RSLCION,P123_ID_TPOS_MDDA_CTLAR,P123_TIPO_DCMNTO,P123_IDNTFCCION,P123_NOMBRE_ETPA,P123_ID_EMBRGOS_CRTRA,P123_ID_DSMBRGO_OFCIO:,&ID_DSMBRGOS_RSLCION.,&ID_TPOS_MDDA_CTLAR.,O,&'
||'IDNTFCCION.,Desembargo,&ID_EMBRGOS_CRTRA.,&ID_DSMBRGO_OFCIO.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(50348624786541112)
,p_name=>'ID_DSMBRGO_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DSMBRGO_OFCIO'
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
 p_id=>wwv_flow_api.id(50348737142541113)
,p_name=>'ID_DSMBRGOS_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DSMBRGOS_RSLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(50347590650541101)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(50348920739541115)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero Oficio')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>190
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
 p_id=>wwv_flow_api.id(50349000934541116)
,p_name=>'FCHA_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha Oficio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
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
,p_include_in_export=>false
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(55214468467092118)
,p_name=>'ID_TPOS_MDDA_CTLAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TPOS_MDDA_CTLAR'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(55214579750092119)
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
 p_id=>wwv_flow_api.id(122712811803265515)
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
 p_id=>wwv_flow_api.id(122712852128265516)
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
 p_id=>wwv_flow_api.id(122713287588265520)
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
 p_id=>wwv_flow_api.id(122713381837265521)
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
 p_id=>wwv_flow_api.id(122713477648265522)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(122713562321265523)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(128920648414450429)
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
 p_id=>wwv_flow_api.id(143042998388395005)
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
 p_id=>wwv_flow_api.id(143043095457395006)
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
 p_id=>wwv_flow_api.id(153910442743508902)
,p_name=>'PDF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PDF'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Pdf'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
,p_value_alignment=>'CENTER'
,p_attribute_01=>'&PDF.'
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,file_blob,file_name,file_mimetype,id_acto,&ID_ACTO.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(122712634375265514)
,p_internal_uid=>122712634375265514
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
 p_id=>wwv_flow_api.id(123616639353268175)
,p_interactive_grid_id=>wwv_flow_api.id(122712634375265514)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(123616795342268176)
,p_report_id=>wwv_flow_api.id(123616639353268175)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5939876724233269)
,p_view_id=>wwv_flow_api.id(123616795342268176)
,p_display_seq=>21
,p_column_id=>wwv_flow_api.id(5931984594225402)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(46819720577365749)
,p_view_id=>wwv_flow_api.id(123616795342268176)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(46014485579632920)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>141
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54249781507718845)
,p_view_id=>wwv_flow_api.id(123616795342268176)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(50348624786541112)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54250247139718849)
,p_view_id=>wwv_flow_api.id(123616795342268176)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(50348737142541113)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54251204506718853)
,p_view_id=>wwv_flow_api.id(123616795342268176)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(50348920739541115)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>105
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54251739880718854)
,p_view_id=>wwv_flow_api.id(123616795342268176)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(50349000934541116)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>105
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55368235737586290)
,p_view_id=>wwv_flow_api.id(123616795342268176)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(55214468467092118)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55371270161666764)
,p_view_id=>wwv_flow_api.id(123616795342268176)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(55214579750092119)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(123618542246268210)
,p_view_id=>wwv_flow_api.id(123616795342268176)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(122712811803265515)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(123619080591268211)
,p_view_id=>wwv_flow_api.id(123616795342268176)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(122712852128265516)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(123621100744268218)
,p_view_id=>wwv_flow_api.id(123616795342268176)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(122713287588265520)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(123621578124268220)
,p_view_id=>wwv_flow_api.id(123616795342268176)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(122713381837265521)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>219
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(123622108088268221)
,p_view_id=>wwv_flow_api.id(123616795342268176)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(122713477648265522)
,p_is_visible=>false
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(129261446421330723)
,p_view_id=>wwv_flow_api.id(123616795342268176)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(128920648414450429)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>132
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(144289668263428477)
,p_view_id=>wwv_flow_api.id(123616795342268176)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(143042998388395005)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>279
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(144290180080428480)
,p_view_id=>wwv_flow_api.id(123616795342268176)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(143043095457395006)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(153917806075552106)
,p_view_id=>wwv_flow_api.id(123616795342268176)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(153910442743508902)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(123560536386079551)
,p_plug_name=>'Resoluciones de Desembargo'
,p_region_name=>'resoluciones_desembargo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct (a.id_dsmbrgos_rslcion) as id_dsmbrgos_rslcion,',
'                to_char(a.fcha_rgstro_dsmbrgo, ''dd/mm/yyyy'') as fcha_rgstro_dsmbrgo,',
'                a.idntfccion,',
'                a.id_acto,',
'                a.nmro_acto,',
'                to_char(a.fcha_acto, ''dd/mm/yyyy'') as fcha_acto,',
'                a.id_tpos_mdda_ctlar,',
'                a.dscrpcion_tpo_mdda_ctlar,',
'                b.nmro_acto as nmro_rslcion_emb,',
'                to_char(b.fcha_acto, ''dd/mm/yyyy'') as fcha_rslcion_emb,',
'                b.dscrpcion_tipo_embargo,',
'                b.cdgo_crtra,',
'                a.id_instncia_fljo,',
'                a.id_fljo_trea_estdo,',
'                a.id_fljo_trea,',
'                d.DSCRPCION_VSBLE as Estado,',
'                b.id_embrgos_rslcion,',
'                a.id_csles_dsmbrgo,',
'                a.cdgo_csal,',
'                a.dscrpcion_csal,',
'                b.id_embrgos_crtra,',
'                e.id_dsmbrgo_sprte,',
'                case',
'                   when a.id_acto is not null then',
'                    ''<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" aria-labelledby="id_tareas_ig_grid_vc_ctx id_tareas_ig_grid_vc_cur">Ver PDF <span class="fa fa-eye"></span>',
'</button>''',
'                   else',
'                    '' ''',
'                 end as pdf,',
'                case',
'                  when f.id_dcmnto is not null then',
'                   ''S''',
'                  else',
'                   ''N''',
'                end as tiene_dcmnto,',
'                w.nmro_rslcn as rmnte',
'  from v_mc_g_desembargos_resolucion a',
'  join v_mc_g_embargos_resolucion b',
'    on b.id_instncia_fljo = a.id_instncia_fljo',
'  join v_wf_d_flujos_tarea c',
'    on c.id_fljo_trea = a.id_fljo_trea',
'  left join wf_d_flujos_tarea_estado d',
'    on d.id_fljo_trea = c.id_fljo_trea',
'   and d.id_fljo_trea_estdo = a.id_fljo_trea_estdo',
'  left join mc_g_desembargos_soporte e',
'    on e.id_dsmbrgos_rslcion = a.id_dsmbrgos_rslcion',
'  left join gn_g_actos f',
'    on f.id_acto = a.id_acto',
'  left join mc_g_desembargos_oficio g',
'    on g.id_dsmbrgos_rslcion = a.id_dsmbrgos_rslcion',
'  left join (select x.nmro_rslcn, y.id_embrgos_rslcion',
'               from mc_g_embargos_remanente x',
'               join mc_g_embrgo_remnte_dtlle y',
'                 on y.id_embrgos_rmnte = x.id_embrgos_rmnte',
'              where x.cdgo_estdo_embrgo = ''E'') w',
'    on w.id_embrgos_rslcion = b.id_embrgos_rslcion  ',
' where b.cdgo_estdos_crtra = ''D''',
'   and a.id_tpos_mdda_ctlar = :P118_TPO_MDDA_CTLAR',
'   and a.id_csles_dsmbrgo = nvl(:P118_CSAL_DSMBRGO, a.id_csles_dsmbrgo)',
'   and a.activo = ''S''',
'   and a.cdgo_clnte = :F_CDGO_CLNTE',
'   and b.id_impsto = nvl(:P118_ID_IMPSTO, b.id_impsto)',
'   and b.id_impsto_sbmpsto =',
'       nvl(:P118_ID_IMPSTO_SBMPSTO, b.id_impsto_sbmpsto)',
'   --and (b.id_fncnrio = :P_118_ID_FNCNRIO or :P_118_ID_FNCNRIO is null)',
'   and (:P118_RSLCION_EMBARGO is null or',
'       b.nmro_acto = :P118_RSLCION_EMBARGO)',
'   and (:P118_RSLCION_DSMBARGO is null or',
'       a.nmro_acto = :P118_RSLCION_DSMBARGO)',
'   and (:P118_FCHA_RSLCION_DSDE is null or',
'       trunc(a.fcha_acto) >=',
'       trunc(to_date(:P118_FCHA_RSLCION_DSDE, ''DD/MM/YYYY'')))',
'   and (:P118_FCHA_RSLCION_HSTA is null or',
'       trunc(a.fcha_acto) <=',
'       trunc(to_date(:P118_FCHA_RSLCION_HSTA, ''DD/MM/YYYY'')))',
'   and (:P118_FCHA_RGSTRO_DSDE is null or',
'       trunc(a.fcha_rgstro_dsmbrgo) >=',
'       trunc(to_date(:P118_FCHA_RGSTRO_DSDE, ''DD/MM/YYYY'')))',
'   and (:P118_FCHA_RGSTRO_HSTA is null or',
'       trunc(a.fcha_rgstro_dsmbrgo) <=',
'       trunc(to_date(:P118_FCHA_RGSTRO_HSTA, ''DD/MM/YYYY'')))',
'   and (:P118_SUJETO is null or a.idntfccion = :P118_SUJETO)',
'   and (case',
'         when f.id_dcmnto is null and ''N'' = :P118_RSLCION_DCMNTO then',
'          1',
'         when f.id_dcmnto is not null and ''S'' = :P118_RSLCION_DCMNTO then',
'          1',
'         when (f.id_dcmnto = f.id_dcmnto or f.id_dcmnto is null) and',
'              :P118_RSLCION_DCMNTO is null then',
'          1',
'         else',
'          0',
'       end = 1)',
'   and (g.gnra_ofcio = :P118_OFCIO_DCMNTO or :P118_OFCIO_DCMNTO is null)',
'  /* and exists',
' (select 1',
'          from mc_g_desembargos_oficio f',
'         where f.id_dsmbrgos_rslcion = a.id_dsmbrgos_rslcion',
'           and (:P118_OFCIO_DSMBARGO is null or',
'               f.nmro_acto = :P118_OFCIO_DSMBARGO)',
'           and (:P118_FCHA_OFCIO_DSDE is null or',
'               trunc(f.fcha_acto) >=',
'               trunc(to_date(:P118_FCHA_OFCIO_DSDE, ''DD/MM/YYYY'')))',
'           and (:P118_FCHA_OFCIO_HSTA is null or',
'               trunc(f.fcha_acto) <=',
'               trunc(to_date(:P118_FCHA_OFCIO_HSTA, ''DD/MM/YYYY''))))*/',
'/*and exists (select g.id_embrgos_rspnsble,',
'      g.id_embrgos_crtra,',
'      g.id_embrgos_rslcion,',
'      g.dscrpcion_idntfccion_tpo,',
'      g.idntfccion,',
'      g.nmbre_cmplto',
' from v_mc_g_embargos_rspnsble_emb g',
'where g.id_embrgos_crtra = b.id_embrgos_crtra',
'  and g.id_embrgos_rslcion = b.id_embrgos_rslcion',
'  and (:P118_ID_RSPNSBLE is null or trim(g.idntfccion) = trim(:P118_ID_RSPNSBLE)))*/',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(28754346402929302)
,p_name=>'RMNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RMNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Embargo <br>Remanente'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>380
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
 p_id=>wwv_flow_api.id(46014158307632917)
,p_name=>'PLANTILLA'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Plantilla'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" aria-labelledby="id_tareas_ig_grid_vc_ctx id_tareas_ig_grid_vc_cur">Modificar plantilla <span class="fa fa-external-link"></span>',
'</button>'))
,p_link_target=>'f?p=&APP_ID.:123:&SESSION.::&DEBUG.:RP,123:P123_CDGO_EMBRGO,P123_ID_DSMBRGOS_RSLCION,P123_ID_TPOS_MDDA_CTLAR,P123_TIPO_DCMNTO,P123_IDNTFCCION,P123_NOMBRE_ETPA,P123_ID_EMBRGOS_CRTRA,P123_ID_CSLES_DSMBRGO:,&ID_DSMBRGOS_RSLCION.,&ID_TPOS_MDDA_CTLAR.,R,&'
||'IDNTFCCION.,Desembargo,&ID_EMBRGOS_CRTRA.,&ID_CSLES_DSMBRGO.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(50347590650541101)
,p_name=>'ID_DSMBRGOS_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DSMBRGOS_RSLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
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
 p_id=>wwv_flow_api.id(50347621174541102)
,p_name=>'FCHA_RGSTRO_DSMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO_DSMBRGO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha <br> Registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
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
 p_id=>wwv_flow_api.id(50347783726541103)
,p_name=>'ID_TPOS_MDDA_CTLAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TPOS_MDDA_CTLAR'
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
 p_id=>wwv_flow_api.id(50347802681541104)
,p_name=>'DSCRPCION_TPO_MDDA_CTLAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_TPO_MDDA_CTLAR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tipo <br> Desembargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
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
 p_id=>wwv_flow_api.id(50347930825541105)
,p_name=>'NMRO_RSLCION_EMB'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_RSLCION_EMB'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Resoluci\00F3n <br> Embargo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
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
 p_id=>wwv_flow_api.id(50348050949541106)
,p_name=>'FCHA_RSLCION_EMB'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RSLCION_EMB'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Fecha  <br>Resoluci\00F3n Embargo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
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
 p_id=>wwv_flow_api.id(50348125724541107)
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
 p_id=>wwv_flow_api.id(50348260226541108)
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
 p_id=>wwv_flow_api.id(50348360260541109)
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
 p_id=>wwv_flow_api.id(50348426013541110)
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
 p_id=>wwv_flow_api.id(50348529075541111)
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
 p_id=>wwv_flow_api.id(50349111483541117)
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(50349281399541118)
,p_name=>'CDGO_CSAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CSAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>300
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
 p_id=>wwv_flow_api.id(50349380095541119)
,p_name=>'DSCRPCION_CSAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CSAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Causal <br> Desembargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>310
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
 p_id=>wwv_flow_api.id(50349969807541125)
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
 p_id=>wwv_flow_api.id(50350432181541130)
,p_name=>'ID_DSMBRGO_SPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DSMBRGO_SPRTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>330
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
 p_id=>wwv_flow_api.id(55214692579092120)
,p_name=>'ID_CSLES_DSMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CSLES_DSMBRGO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>340
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(57851622945104930)
,p_name=>'Flujo'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Ir al Flujo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>350
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" >Ir a flujo<span class="fa fa-external-link-square"></span>',
'</button>'))
,p_link_target=>'f?p=&APP_ID.:125:&SESSION.::&DEBUG.:RP,125:P125_ID_INSTNCIA_FLJO,P125_ID_FLJO_TREA:&ID_INSTNCIA_FLJO.,&ID_FLJO_TREA.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(57851794427104931)
,p_name=>'PDF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PDF'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Documento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>360
,p_value_alignment=>'CENTER'
,p_attribute_01=>'&PDF.'
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR,P127_COLUMNA_BFILE:v_gn_g_actos,file_blob,file_name,file_mimetype,id_acto,&ID_ACTO.,FILE_BFILE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(122712265843265510)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(122712360303265511)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(123563537127079558)
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(123564227851079558)
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
 p_id=>wwv_flow_api.id(123564747525079559)
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
 p_id=>wwv_flow_api.id(143042705922395002)
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
 p_id=>wwv_flow_api.id(143042782811395003)
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
 p_id=>wwv_flow_api.id(153748219792710209)
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
 p_id=>wwv_flow_api.id(123561050493079552)
,p_internal_uid=>123561050493079552
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
 p_id=>wwv_flow_api.id(123561455412079553)
,p_interactive_grid_id=>wwv_flow_api.id(123561050493079552)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(123561572342079554)
,p_report_id=>wwv_flow_api.id(123561455412079553)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28768472603039781)
,p_view_id=>wwv_flow_api.id(123561572342079554)
,p_display_seq=>34
,p_column_id=>wwv_flow_api.id(28754346402929302)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(46792450107707302)
,p_view_id=>wwv_flow_api.id(123561572342079554)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(46014158307632917)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>142
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50353500540541377)
,p_view_id=>wwv_flow_api.id(123561572342079554)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(50347590650541101)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50354092737541379)
,p_view_id=>wwv_flow_api.id(123561572342079554)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(50347621174541102)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>153
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50354565110541381)
,p_view_id=>wwv_flow_api.id(123561572342079554)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(50347783726541103)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50355091111541383)
,p_view_id=>wwv_flow_api.id(123561572342079554)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(50347802681541104)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>145
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50355591375541384)
,p_view_id=>wwv_flow_api.id(123561572342079554)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(50347930825541105)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>162
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50356089339541386)
,p_view_id=>wwv_flow_api.id(123561572342079554)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(50348050949541106)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>193
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50562759353289413)
,p_view_id=>wwv_flow_api.id(123561572342079554)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(50348125724541107)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>123
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50563133873289417)
,p_view_id=>wwv_flow_api.id(123561572342079554)
,p_display_seq=>24
,p_column_id=>wwv_flow_api.id(50348260226541108)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50563612074289420)
,p_view_id=>wwv_flow_api.id(123561572342079554)
,p_display_seq=>25
,p_column_id=>wwv_flow_api.id(50348360260541109)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50564100193289421)
,p_view_id=>wwv_flow_api.id(123561572342079554)
,p_display_seq=>26
,p_column_id=>wwv_flow_api.id(50348426013541110)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50564648941289423)
,p_view_id=>wwv_flow_api.id(123561572342079554)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(50348529075541111)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>77
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54252148297718856)
,p_view_id=>wwv_flow_api.id(123561572342079554)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(50349111483541117)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54256679163878738)
,p_view_id=>wwv_flow_api.id(123561572342079554)
,p_display_seq=>28
,p_column_id=>wwv_flow_api.id(50349281399541118)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54257127292878740)
,p_view_id=>wwv_flow_api.id(123561572342079554)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(50349380095541119)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55114833795413874)
,p_view_id=>wwv_flow_api.id(123561572342079554)
,p_display_seq=>29
,p_column_id=>wwv_flow_api.id(50349969807541125)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55121200729497635)
,p_view_id=>wwv_flow_api.id(123561572342079554)
,p_display_seq=>30
,p_column_id=>wwv_flow_api.id(50350432181541130)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55403172854320427)
,p_view_id=>wwv_flow_api.id(123561572342079554)
,p_display_seq=>31
,p_column_id=>wwv_flow_api.id(55214692579092120)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(58577357704608460)
,p_view_id=>wwv_flow_api.id(123561572342079554)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(57851622945104930)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>85
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(58765529410639300)
,p_view_id=>wwv_flow_api.id(123561572342079554)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(57851794427104931)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>88
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(123563972423079558)
,p_view_id=>wwv_flow_api.id(123561572342079554)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(123563537127079558)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(123564600667079559)
,p_view_id=>wwv_flow_api.id(123561572342079554)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(123564227851079558)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>126
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(123565150236079559)
,p_view_id=>wwv_flow_api.id(123561572342079554)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(123564747525079559)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>179
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(123617677534268179)
,p_view_id=>wwv_flow_api.id(123561572342079554)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(122712265843265510)
,p_is_visible=>false
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(144277027718264605)
,p_view_id=>wwv_flow_api.id(123561572342079554)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(143042705922395002)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>123
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(144277469817264608)
,p_view_id=>wwv_flow_api.id(123561572342079554)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(143042782811395003)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>191
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(153800195087930861)
,p_view_id=>wwv_flow_api.id(123561572342079554)
,p_display_seq=>33
,p_column_id=>wwv_flow_api.id(153748219792710209)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(128920823354450430)
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
 p_id=>wwv_flow_api.id(143043312783395008)
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
'       a.dsmbrgdo, ',
'       c.id_acto as id_acto_dsmbargo,',
'       (select  max(o.id_acto)          ',
'           from  mc_g_desembargos_oficio o ',
'          where o.id_dsmbrgos_rslcion = a.id_dsmbrgos_rslcion) as acto_oficio,',
'       a.id_dsmbrgos_rslcion,',
'       case when a.id_dsmbrgos_rslcion is not null ',
'                    then ''<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" aria-labelledby="id_tareas_ig_grid_vc_ctx id_tareas_ig_grid_vc_cur">Ver PDF <span class="fa fa-eye"></span></b'
||'utton>''',
'                    else '' ''',
'               end as pdf_ofcio,',
'          case when a.id_dsmbrgos_rslcion is not null ',
'                    then ''<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" aria-labelledby="id_tareas_ig_grid_vc_ctx id_tareas_ig_grid_vc_cur">Ver PDF <span class="fa fa-eye"></span></b'
||'utton>''',
'                    else '' ''',
'               end as pdf',
'from v_mc_g_embargos_rspnsble_emb a',
'left join MC_G_DESEMBARGOS_RESOLUCION c on c.id_dsmbrgos_rslcion = a.id_dsmbrgos_rslcion',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(123560536386079551)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(14006168344961810)
,p_name=>'DSMBRGDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSMBRGDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Desembargado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(14006273334961811)
,p_name=>'ID_ACTO_DSMBARGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_DSMBARGO'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(14006302598961812)
,p_name=>'ID_DSMBRGOS_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DSMBRGOS_RSLCION'
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
 p_id=>wwv_flow_api.id(14006402543961813)
,p_name=>'PDF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PDF'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>unistr('Resoluci\00F3n Desembargo')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(14007236160961821)
,p_name=>'ACTO_OFICIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTO_OFICIO'
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
 p_id=>wwv_flow_api.id(14007316963961822)
,p_name=>'PDF_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PDF_OFCIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Oficio Desembargo'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attribute_01=>'&PDF_OFICIO.'
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
 p_id=>wwv_flow_api.id(143044366136395019)
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
 p_id=>wwv_flow_api.id(143044483981395020)
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
 p_id=>wwv_flow_api.id(143044588606395021)
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
,p_parent_column_id=>wwv_flow_api.id(50349111483541117)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(143044638186395022)
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
 p_id=>wwv_flow_api.id(143044795400395023)
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
 p_id=>wwv_flow_api.id(143044841106395024)
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
 p_id=>wwv_flow_api.id(143044233401395018)
,p_internal_uid=>143044233401395018
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
 p_id=>wwv_flow_api.id(144325440852754827)
,p_interactive_grid_id=>wwv_flow_api.id(143044233401395018)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(144325572144754827)
,p_report_id=>wwv_flow_api.id(144325440852754827)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14099188128979713)
,p_view_id=>wwv_flow_api.id(144325572144754827)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(14006168344961810)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150.5
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14099603469979714)
,p_view_id=>wwv_flow_api.id(144325572144754827)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(14006273334961811)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14100071965979716)
,p_view_id=>wwv_flow_api.id(144325572144754827)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(14006302598961812)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14100562445979717)
,p_view_id=>wwv_flow_api.id(144325572144754827)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(14006402543961813)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14161459209415151)
,p_view_id=>wwv_flow_api.id(144325572144754827)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(14007236160961821)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14161918458415153)
,p_view_id=>wwv_flow_api.id(144325572144754827)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(14007316963961822)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(144326117417754830)
,p_view_id=>wwv_flow_api.id(144325572144754827)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(143044366136395019)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(144326570414754833)
,p_view_id=>wwv_flow_api.id(144325572144754827)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(143044483981395020)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(144327055039754835)
,p_view_id=>wwv_flow_api.id(144325572144754827)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(143044588606395021)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(144327584792754836)
,p_view_id=>wwv_flow_api.id(144325572144754827)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(143044638186395022)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>272.1
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(144328036553754837)
,p_view_id=>wwv_flow_api.id(144325572144754827)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(143044795400395023)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>195.10000000000002
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(144328594050754840)
,p_view_id=>wwv_flow_api.id(144325572144754827)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(143044841106395024)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>409.1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(143044962531395025)
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
 p_id=>wwv_flow_api.id(143045039442395026)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17345839561919369)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(154051352956264042)
,p_plug_name=>'Oficios de Desembargo.'
,p_region_name=>'oficios_desembargo_2'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.id_dsmbrgo_ofcio,',
'       c.id_slctd_ofcio,       ',
'       c.id_dsmbrgos_rslcion,',
'       a.id_entddes,',
'       nvl(a.dscrpcion, ''OFICIO GENERALIZADO'') as dscrpcion,',
'       nvl(a.rspnsble,''TODOS LOS RESPONSABLES'') as rspnsble,       ',
'       c.id_acto,',
'       c.nmro_acto,',
'       to_char(c.fcha_acto,''dd/mm/yyyy'') as fcha_acto,',
'       a.id_embrgos_crtra,',
'       a.activo,',
'       b.id_tpos_mdda_ctlar,',
'       b.idntfccion',
'          from mc_g_desembargos_oficio c',
'          left join v_mc_g_solicitudes_y_oficios a on a.id_slctd_ofcio = c.id_slctd_ofcio',
'          join v_mc_g_desembargos_resolucion b on b.id_dsmbrgos_rslcion = c.id_dsmbrgos_rslcion',
' where c.estado_rvctria = ''N'' ',
' and c.nmro_acto is not null'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(123560536386079551)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(154051816718264047)
,p_name=>'ID_DSMBRGO_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DSMBRGO_OFCIO'
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
 p_id=>wwv_flow_api.id(154051974283264048)
,p_name=>'ID_DSMBRGOS_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DSMBRGOS_RSLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(50347590650541101)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(154052061588264049)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
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
 p_id=>wwv_flow_api.id(154052147028264050)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero Oficio')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(154082109186391301)
,p_name=>'FCHA_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha Oficio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(154082254641391302)
,p_name=>'ID_TPOS_MDDA_CTLAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TPOS_MDDA_CTLAR'
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(154082377419391303)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
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
 p_id=>wwv_flow_api.id(154082496334391304)
,p_name=>'ID_SLCTD_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTD_OFCIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(154082544311391305)
,p_name=>'ID_EMBRGOS_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_CRTRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(154082619152391306)
,p_name=>'ID_ENTDDES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ENTDDES'
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
 p_id=>wwv_flow_api.id(154082763638391307)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Entidad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
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
 p_id=>wwv_flow_api.id(154082868897391308)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>140
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(154082946036391309)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>150
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(154083101528391311)
,p_name=>'RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSPNSBLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Responsable'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
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
 p_id=>wwv_flow_api.id(154083292846391312)
,p_name=>'ACTIVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTIVO'
,p_data_type=>'VARCHAR2'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(154051588785264044)
,p_internal_uid=>154051588785264044
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
 p_id=>wwv_flow_api.id(154088326096392957)
,p_interactive_grid_id=>wwv_flow_api.id(154051588785264044)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(154088407316392957)
,p_report_id=>wwv_flow_api.id(154088326096392957)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154089937582392964)
,p_view_id=>wwv_flow_api.id(154088407316392957)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(154051816718264047)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154090470478392967)
,p_view_id=>wwv_flow_api.id(154088407316392957)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(154051974283264048)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154090906833392969)
,p_view_id=>wwv_flow_api.id(154088407316392957)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(154052061588264049)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154091495945392971)
,p_view_id=>wwv_flow_api.id(154088407316392957)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(154052147028264050)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154091905043392973)
,p_view_id=>wwv_flow_api.id(154088407316392957)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(154082109186391301)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154092460216392975)
,p_view_id=>wwv_flow_api.id(154088407316392957)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(154082254641391302)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154092936500392977)
,p_view_id=>wwv_flow_api.id(154088407316392957)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(154082377419391303)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154093432506392979)
,p_view_id=>wwv_flow_api.id(154088407316392957)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(154082496334391304)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154093917367392984)
,p_view_id=>wwv_flow_api.id(154088407316392957)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(154082544311391305)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154094419560392986)
,p_view_id=>wwv_flow_api.id(154088407316392957)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(154082619152391306)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154094910309392988)
,p_view_id=>wwv_flow_api.id(154088407316392957)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(154082763638391307)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154095493284392997)
,p_view_id=>wwv_flow_api.id(154088407316392957)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(154082868897391308)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154096877008393002)
,p_view_id=>wwv_flow_api.id(154088407316392957)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(154083101528391311)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154097336205393004)
,p_view_id=>wwv_flow_api.id(154088407316392957)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(154083292846391312)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(154051468237264043)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(122712553025265513)
,p_button_name=>'BTN_VER_PDF'
,p_button_static_id=>'BTN_VER_PDF'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ver Pdf'
,p_button_position=>'ABOVE_BOX'
,p_button_redirect_url=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,file_blob,file_name,file_mimetype,id_acto,&P118_ID_ACTO.'
,p_icon_css_classes=>'fa-file-pdf-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(50349586333541121)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(128920823354450430)
,p_button_name=>'btn_dtos_csal'
,p_button_static_id=>'btn_dtos_csal'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Datos Causal <br>de Desembargo'
,p_button_position=>'BELOW_BOX'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-window-edit'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(39958112459765661)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(128920823354450430)
,p_button_name=>'btn_Generar_Documentos'
,p_button_static_id=>'btn_desembargo_total'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Actos <br> De Desembargo'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-gears'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(154083465455391314)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(154051352956264042)
,p_button_name=>'BTN_CNSLTA_BNES'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Consultar Bienes'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.:RP:P41_ID_SLCTD_OFCIO,P41_ID_ENTDDES,P41_OCULTAR_APLICAR:&P118_ID_SLCTD_OFCIO.,&P118_ID_ENTDDES.,1'
,p_icon_css_classes=>'fa-box-arrow-in-ne'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(39958518594765670)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(128920823354450430)
,p_button_name=>'btn_generar_actos'
,p_button_static_id=>'btn_desembargo_parcial'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Generar Documentos <br>de Desembargo'
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
'          and CDGO_CNFGRCION = ''GDD'';',
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
 p_id=>wwv_flow_api.id(39958958777765670)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(128920823354450430)
,p_button_name=>'btn_aplicar'
,p_button_static_id=>'btn_aplicar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Aplicar Cambio  <br/>de Etapa/Estado'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(39959324305765670)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(128920823354450430)
,p_button_name=>'BTN_RSLTDOS_PRCSMNTO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Resultados de <br>Procesamiento'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:113:&SESSION.::&DEBUG.:RP,113:P113_ID_LTE_MDDA_CTLAR_IP:&P118_ID_LTE_MDDA_CTLAR.'
,p_button_condition=>'P118_ID_LTE_MDDA_CTLAR'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(153747628230710203)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(128920823354450430)
,p_button_name=>'BTN_IMPRMIR_MASIVO_PUNTUAL'
,p_button_static_id=>'BTN_IMPRMIR_2'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Descargar Desembargos <br> en Archivos <br> Individuales'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(153748619295710213)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(128920823354450430)
,p_button_name=>'BTN_IMPRMIR_MASIVO_CONSOLIDADO'
,p_button_static_id=>'BTN_IMPRMIR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Descargar Desembargos <br> En un solo Archivo'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(153748336364710210)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(128920823354450430)
,p_button_name=>'BTN_IMPRMIR_OFICIO_PUNTUAL'
,p_button_static_id=>'BTN_IMPRMIR_OFICIO_PUNTUAL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Descargar Oficios <br> En Archivos <br> Individuales'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(153750514181710232)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(128920823354450430)
,p_button_name=>'BTN_IMPRMIR_OFICIO'
,p_button_static_id=>'BTN_IMPRMIR_OFICIO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Descargar Oficios <br> En un solo Archivo'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(186989407073480508)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(128920823354450430)
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
 p_id=>wwv_flow_api.id(189539431641081205)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_api.id(128920823354450430)
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
 p_id=>wwv_flow_api.id(39963698410765686)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_api.id(143045039442395026)
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
 p_id=>wwv_flow_api.id(39976537816765718)
,p_branch_name=>unistr('Ir a P\00E1gina 66-T')
,p_branch_action=>'f?p=&APP_ID.:66:&SESSION.::&DEBUG.:RP,66:P66_TIPO_DESEMBARGO,P66_ID_TIPO_EMBARGO,P66_ID_EMBRGOS_CRTRA,P66_ID_EMBRGOS_RSLCION:T,&P118_TPO_EMBRGO.,&P118_ID_EMBRGOS_CRTRA.,&P118_ID_EMBRGOS_RSLCION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(39976944222765718)
,p_branch_name=>unistr('Ir a P\00E1gina 66-P')
,p_branch_action=>'f?p=&APP_ID.:66:&SESSION.::&DEBUG.:RP,66:P66_ID_EMBRGOS_RSLCION,P66_TIPO_DESEMBARGO,P66_ID_TIPO_EMBARGO,P66_ID_EMBRGOS_CRTRA:&P118_ID_EMBRGOS_RSLCION.,P,&P118_TPO_EMBRGO.,&P118_ID_EMBRGOS_CRTRA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(39976135816765718)
,p_branch_name=>unistr('Ir a P\00E1gina 124 - Selecc. Plantillas')
,p_branch_action=>'f?p=&APP_ID.:124:&SESSION.::&DEBUG.:RP,124:P124_ID_TIPO_EMBARGO,P124_CSAL_DSMBRGO:&P118_TPO_MDDA_CTLAR.,&P118_CSAL_DSMBRGO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(39958112459765661)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(50350992226541135)
,p_branch_name=>unistr('Ir a P\00E1gina 122')
,p_branch_action=>'f?p=&APP_ID.:122:&SESSION.::&DEBUG.:RP,122:P122_ID_DSMBRGO_SPRTE,P122_ID_DSMBRGOS_RSLCION,P122_ID_EMBRGOS_CRTRA:&P118_ID_DSMBRGO_SPRTE.,&P118_ID_DSMBRGOS_RSLCION.,&P118_ID_EMBRGOS_CRTRA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(50349586333541121)
,p_branch_sequence=>40
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(189539961303081210)
,p_branch_name=>'descargar_excel'
,p_branch_action=>'f?p=&APP_ID.:118:&SESSION.:imprimir:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>50
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'imprimir_branch'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14836215891406301)
,p_name=>'P118_RSLCION_DCMNTO'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_prompt=>unistr('\00BFDocumento Resoluci\00F3n?')
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
 p_id=>wwv_flow_api.id(14836363488406302)
,p_name=>'P118_OFCIO_DCMNTO'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_prompt=>unistr('\00BFDocumento Oficio?')
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
 p_id=>wwv_flow_api.id(15114177890131801)
,p_name=>'P118_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el impuesto por el cual desea consultar de forma puntual.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15114208296131802)
,p_name=>'P118_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P118_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P118_ID_IMPSTO'
,p_ajax_items_to_submit=>'P118_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_grid_column=>4
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el sub-impuesto por el cual desea consultar de forma puntual. La informaci\00F3n mostrada depende del impuesto que se escoja.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39964053630765687)
,p_name=>'P118_RSLCION_DSMBARGO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_prompt=>unistr('Resoluci\00F3n de Desembargo')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Ingrese la resoluci\00F3n de desembargo a consultar')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39964443623765690)
,p_name=>'P118_FCHA_RSLCION_DSDE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_prompt=>unistr('Fecha Resoluci\00F3n Inicial')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Seleccione del calendario la fecha inicial de la resoluci\00F3n que desea consultar.')
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39964861190765690)
,p_name=>'P118_FCHA_RSLCION_HSTA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_prompt=>unistr('Fecha Resoluci\00F3n Final')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Seleccione del calendario la fecha final de la resoluci\00F3n que desea consultar.')
,p_attribute_02=>'&P118_FCHA_RSLCION_DSDE.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39965236061765690)
,p_name=>'P118_OFCIO_DSMBARGO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_prompt=>'Oficio de Desembargo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Ingrese el oficio de desembargo a consultar.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39965645033765691)
,p_name=>'P118_FCHA_OFCIO_DSDE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_prompt=>'Fecha Oficio Inicial'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Seleccione del calendario la fecha inicial del oficio a consultar.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39966060527765691)
,p_name=>'P118_FCHA_OFCIO_HSTA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_prompt=>'Fecha Oficio final'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Seleccione del calendario la fecha final del oficio a consultar.'
,p_attribute_02=>'&P118_FCHA_OFCIO_DSDE.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39966403117765691)
,p_name=>'P118_TPO_MDDA_CTLAR'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_prompt=>'Tipo de Medida Cautelar'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion,id_tpos_mdda_ctlar',
'from mc_d_tipos_mdda_ctlar',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and actvo = ''S'''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tipo de medida cautelar. '
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39966810995765692)
,p_name=>'P118_SUJETO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Es el n\00FAmero de identificaci\00F3n del sujeto asociado a un proceso jur\00EDdico, ingrese un n\00FAmero de identificaci\00F3n del sujeto para buscar de manera puntual el proceso donde este contenida esa identificaci\00F3n.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39967233686765692)
,p_name=>'P118_ID_RSPNSBLE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>unistr('Ingrese el n\00FAmero de identificaci\00F3n del responsable del desembargo.')
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39967683583765692)
,p_name=>'P118_FCHA_RGSTRO_DSDE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_prompt=>'Fecha de Registro Desde'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Seleccione del calendario la fecha inicial del registro del desembargo.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39968022626765693)
,p_name=>'P118_FCHA_RGSTRO_HSTA'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_prompt=>'Fecha de Registro Hasta'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Seleccione del calendario la fecha final del registro del desembargo.'
,p_attribute_02=>'&P118_FCHA_RGSTRO_DSDE.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39968481613765693)
,p_name=>'P118_JSON_RESOLUCIONES'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39968868836765693)
,p_name=>'P118_JSON_OFCIOS'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39969208716765693)
,p_name=>'P118_ID_DSMBRGOS_RSLCION'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39969603925765697)
,p_name=>'P118_ID_EMBRGOS_CRTRA'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39970092448765697)
,p_name=>'P118_IDNTFCCION'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39970466627765697)
,p_name=>'P118_CNSCTVO_EMBRGO'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39970836101765697)
,p_name=>'P118_ID_TPOS_EMBRGO'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39971276102765697)
,p_name=>'P118_ID_LTE_MDDA_CTLAR'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50350876055541134)
,p_name=>'P118_ID_DSMBRGO_SPRTE'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62817147632590324)
,p_name=>'P118_RSLCION_EMBARGO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_prompt=>unistr('Resoluci\00F3n de Embargo')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Ingrese la resoluci\00F3n de desembargo a consultar')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(66611755832137101)
,p_name=>'P118_CSAL_DSMBRGO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_prompt=>'Causales de Desembargo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_csal,id_csles_dsmbrgo',
'from mc_d_causales_desembargo',
'where cdgo_clnte = :f_cdgo_clnte',
'and (SLCTUD_FNCNRIO = ''S'' or SLCTUD_RSPNSBLE = ''S'');'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(154003649416232615)
,p_name=>'P118_ID_ACTO'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(154083354054391313)
,p_name=>'P118_VLDA_RGION'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       a.dscrpcion',
'          from mc_g_desembargos_oficio c',
'          left join v_mc_g_solicitudes_y_oficios a on a.id_slctd_ofcio = c.id_slctd_ofcio',
'          join v_mc_g_desembargos_resolucion b on b.id_dsmbrgos_rslcion = c.id_dsmbrgos_rslcion',
' where c.estado_rvctria = ''N'' ',
' and c.nmro_acto is not null',
' and  b.idntfccion = 	:P118_SUJETO'))
,p_item_default_type=>'SQL_QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(154083724256391317)
,p_name=>'P118_ID_SLCTD_OFCIO'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(154083883292391318)
,p_name=>'P118_ID_ENTDDES'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(189539639632081207)
,p_name=>'P118_TPO_ENTDD'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(189539751586081208)
,p_name=>'P118_LTE_ENTDD_BR'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(189539807928081209)
,p_name=>'P118_RSLCNS_IMPRSN'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(189540678238081217)
,p_name=>'P118_ID_FNCNRIO'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(143045039442395026)
,p_prompt=>'Abogado'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT e.nmbre_trcro d, e.id_fncnrio r',
'  FROM v_df_c_funcionarios e',
' where exists (select 1 from mc_g_embargos_resolucion f where f.id_fncnrio = e.id_fncnrio)',
' ORDER BY e.nmbre_trcro'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(39973340285765710)
,p_name=>'Al seleccionar registros'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(123560536386079551)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39973870586765711)
,p_event_id=>wwv_flow_api.id(39973340285765710)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'datos_resoluciones();',
'MensajeRespuesta();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(39974243630765716)
,p_name=>'Al seleccionar oficios'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(122712553025265513)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39974799984765717)
,p_event_id=>wwv_flow_api.id(39974243630765716)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'datos_oficios();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(39972483273765706)
,p_name=>'Al darle clic al boton Generar actos'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(39958518594765670)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39972900117765709)
,p_event_id=>wwv_flow_api.id(39972483273765706)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var json = window.localStorage.jsonResolucionesDesembargo;',
'let $waitPopup;',
'try {',
'    JSON.parse(json);',
'    ',
unistr('    apex.message.confirm(''\00BFEst\00E1 seguro de enviar los registros para generar los actos de desembargo?'', (ok) => {'),
'        if (ok) {',
'            if (apex.page.validate()) {',
'                $waitPopup = apex.widget.waitPopup();',
'                apex.server.process("GenerarActosDesembargo", {',
'                    f01: json,',
'                    pageItems: ""',
'                }).then((resp) => {',
'                    $waitPopup.remove();',
'                    if (resp.o_cdgo_rspsta === 0) {',
unistr('                        apex.message.showPageSuccess(''La generaci\00F3n de documentos de Desembargo se ha ejecutado de forma exitosa. ''+resp.o_mnsje_rspsta);'),
'                        if (resp.o_url !== ''#''){',
'                            window.location.href = resp.o_url;',
'                        }',
'                        ',
'                    }else{',
'                        Swal.fire({        ',
'                            icon: ''error'',',
unistr('                            title:  ''<H2 >Validaci\00F3n</H2>'','),
'                            html:   `<h4>${resp.o_cdgo_rspsta+''-''+resp.o_mnsje_rspsta}</h4>`',
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
 p_id=>wwv_flow_api.id(39975158636765717)
,p_name=>'AL darle click al boton aplicar'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(39958958777765670)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39975663146765717)
,p_event_id=>wwv_flow_api.id(39975158636765717)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var json = window.localStorage.jsonResolucionesDesembargo;',
'let $waitPopup;',
'try {',
'    JSON.parse(json);',
unistr('    apex.message.confirm(''\00BFEst\00E1 seguro de enviar los registros para el cambio de estado/etapa de embargo?'', (ok) => {'),
'        if (ok) {',
'            if (apex.page.validate()) {',
'                $waitPopup = apex.widget.waitPopup();',
'                apex.server.process("CambioEtapaDesembargo", {',
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
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(57851046088104924)
,p_name=>'Al cambiar fecha RD'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_FCHA_RSLCION_DSDE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57851170392104925)
,p_event_id=>wwv_flow_api.id(57851046088104924)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P118_FCHA_RSLCION_HSTA").datepicker( ''option'' , ''minDate'' , $("#P118_FCHA_RSLCION_DSDE").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(57851247458104926)
,p_name=>'Al cambiar fecha OD'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_FCHA_OFCIO_DSDE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57851326750104927)
,p_event_id=>wwv_flow_api.id(57851247458104926)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P118_FCHA_OFCIO_HSTA").datepicker( ''option'' , ''minDate'' , $("#P118_FCHA_OFCIO_DSDE").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(57851439127104928)
,p_name=>'Al cambiar fecha RegD'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_FCHA_RGSTRO_DSDE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57851575776104929)
,p_event_id=>wwv_flow_api.id(57851439127104928)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P118_FCHA_RGSTRO_HSTA").datepicker( ''option'' , ''minDate'' , $("#P118_FCHA_RGSTRO_DSDE").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(153747701353710204)
,p_name=>'Al dar Click en BTN_IMPRMIR_MASIVO_PUNTUAL'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(153747628230710203)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(153747849073710205)
,p_event_id=>wwv_flow_api.id(153747701353710204)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'merge_2();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(153748473020710211)
,p_name=>'Al dar click en BTN_IMPRMIR_OFICIO_PUNTUAL'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(153748336364710210)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(153748528682710212)
,p_event_id=>wwv_flow_api.id(153748473020710211)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'merge_oficio_puntual_x_resolucion();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(153748764118710214)
,p_name=>'Al dar click en BTN_IMPRMIR_MASIVO_CONSOLIDADO'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(153748619295710213)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(153748874437710215)
,p_event_id=>wwv_flow_api.id(153748764118710214)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'merge();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(154083907308391319)
,p_name=>'Seleccionar oficios'
,p_event_sequence=>110
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(154051352956264042)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(154084066883391320)
,p_event_id=>wwv_flow_api.id(154083907308391319)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'datos_oficios();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(153750666400710233)
,p_name=>'Al dar Click en BTN_IMPRMIR_OFICIO'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(153750514181710232)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(153750795585710234)
,p_event_id=>wwv_flow_api.id(153750666400710233)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'merge_oficios_x_resolucion();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(186989576717480509)
,p_name=>'clic BTN_GNRA_OFCIO'
,p_event_sequence=>130
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(186989407073480508)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(186989614170480510)
,p_event_id=>wwv_flow_api.id(186989576717480509)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'GenerarDocumentosDesembargoOficio();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(189540115742081212)
,p_name=>'CLIC_BTN_RLCION_OFCIOS'
,p_event_sequence=>140
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(189539431641081205)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(189540233159081213)
,p_event_id=>wwv_flow_api.id(189540115742081212)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'Informacion_Reporte_Dsmbargo_Excel();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39957474754765660)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(123560536386079551)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Resoluciones de Embargo: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39948987938765653)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(122712553025265513)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Notificaciones de Embargo: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(154083575734391315)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar Sesion'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P118_VLDA_RGION'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(39963698410765686)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(189540421753081215)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CargarFuncionario'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P118_ID_FNCNRIO is null then',
'    :P118_ID_FNCNRIO := :F_ID_FNCNRIO;',
'end if;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(189540065078081211)
,p_process_sequence=>10
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
'  select json_object(key ''TPO_ENTDD''      value :P118_TPO_ENTDD,',
'                     --key ''LTE_ENTDD_BR''   value :P110_LTE_ENTDD_BR,',
'                     key ''RSLCNES_IMPRSN'' value :P118_RSLCNS_IMPRSN',
'                    )             ',
'         into v_json',
'   from dual;',
'',
'  pkg_cb_medidas_cautelares.prc_gn_dsmbrgo_rlcion_excl(p_cdgo_clnte     => :F_CDGO_CLNTE,',
'                                                       P_fcha_rgstro_dsmbrgo_dsde => :P118_FCHA_RGSTRO_DSDE,',
'                                                       P_fcha_rgstro_dsmbrgo_hsta => :P118_FCHA_RGSTRO_HSTA,',
'                                                       p_json           => v_json,',
'                                                       o_file_blob      => v_file_blob,',
'                                                       o_cdgo_rspsta    => v_cdgo_rspsta,',
'                                                       o_mnsje_rspsta   => v_mnsje_rspsta);',
'  ',
'  htp.init;',
'  owa_util.mime_header(''application/ms-excel'', false);',
'  ',
'  v_nmbre_dcmnto := ''Relacion_Desembargos_'' || to_char(sysdate,''yyyymmddhhmiss'');',
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
 p_id=>wwv_flow_api.id(39971652311765705)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GenerarActosDesembargo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_json                     clob;',
'    v_url                      varchar2(4000);',
'    v_id_lte_mdda_ctlar_ip    number;',
'    o_cdgo_rspsta             number;',
'    o_mnsje_rspsta            varchar2(1000);',
'begin',
'     for i in 1..apex_application.g_f01.count ',
'     loop',
'         v_json :=  v_json || apex_application.g_f01(i);',
'     end loop;',
'                                                   ',
'    PKG_CB_MEDIDAS_CAUTELARES.prc_rg_gnrcion_actos_desembargo(p_cdgo_clnte     => v(''F_CDGO_CLNTE''),',
'                                                           p_id_usuario     => v(''F_ID_USRIO''),                                        ',
'                                                           p_json_rslciones => v_json,',
'                                                           o_cdgo_rspsta    => o_cdgo_rspsta,',
'                                                           o_mnsje_rspsta   => o_mnsje_rspsta);',
'    ',
'    v_url := apex_util.prepare_url( p_url => ''f?p='' || v(''APP_ID'') || '':118:''|| v(''APP_SESSION'')||''::NO:::'', p_checksum_type => ''SESSION'');',
'    ',
'    if o_cdgo_rspsta <> 0 then',
'        v_url := ''#'';',
'    end if;',
'    /*htp.p(''{"type":"OK","url":"''||v_url||''","msg":"''||case when v_id_lte_mdda_ctlar_ip is null ',
'                                 then ''Actos generados Correctamente!!''',
'                                 else ''Algunos registros no fueron procesados'' ',
'                            end||''"}'');*/',
'                            ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'',  o_mnsje_rspsta);',
'    apex_json.write(''o_url'', v_url);    ',
'    apex_json.close_object;',
'exception',
'    when others then',
'    ',
'        --htp.p(''{"type":"ERROR","msg":"''||sqlerrm||''"}'');',
'        ',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', 99);',
unistr('        apex_json.write(''o_mnsje_rspsta'',  ''Callback: Error al procesar generaci\00F3n de documentos de desembago.'');'),
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39972042447765706)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CambioEtapaDesembargo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_json                     clob;',
'    v_url                      varchar2(4000);',
'    v_id_lte_mdda_ctlar_ip    number;',
'    ',
'begin',
'     for i in 1..apex_application.g_f01.count ',
'     loop',
'         v_json :=  v_json || apex_application.g_f01(i);',
'     end loop;',
'                                                   ',
'    PKG_CB_MEDIDAS_CAUTELARES.prc_rg_cmbio_etpa_estdo_dsmbrgo(p_cdgo_clnte     => v(''F_CDGO_CLNTE''),',
'                                                             p_id_usuario     => v(''F_ID_USRIO''),                                        ',
'                                                             p_json_rslciones => v_json,',
'                                                             p_id_lte_mdda_ctlar_ip => v_id_lte_mdda_ctlar_ip);',
'',
'    v_url := apex_util.prepare_url( p_url => ''f?p='' || v(''APP_ID'') || '':118:''|| v(''APP_SESSION'')||''::NO::P118_ID_LTE_MDDA_CTLAR:''||v_id_lte_mdda_ctlar_ip, p_checksum_type => ''SESSION'');',
'    ',
'    htp.p(''{"type":"OK","url":"''||v_url||''","msg":"''||case when v_id_lte_mdda_ctlar_ip is null ',
'                                 then ''Cambio de etapa/estado generado Correctamente!!''',
'                                 else ''Algunos registros no fueron procesados'' ',
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
 p_id=>wwv_flow_api.id(153747936238710206)
,p_process_sequence=>30
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
'--insert into muerto(v_001,n_001,t_001) values(''el v_json es: '',APEX_APPLICATION.g_f01.count,systimestamp);commit;',
'  for i in 1..APEX_APPLICATION.g_f01.count loop',
'  --insert into muerto(v_001,n_001,t_001) values(''APEX_APPLICATION.g_f01(i)'',APEX_APPLICATION.g_f01.count,systimestamp);commit;',
'       v_json := v_json || APEX_APPLICATION.g_f01(i);',
'  end loop;',
'  ',
'  insert into muerto(v_001, c_001, t_001) values(''val_pdf_desemb'', v_json, systimestamp);',
'  ',
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
 p_id=>wwv_flow_api.id(153748070391710207)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'prc_co_documentos_oficio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_cdgo_rspsta    number;',
'  v_mnsje_rspsta   varchar2(1000);',
'  v_id_rslcion     number := apex_application.g_x01;',
'begin',
'',
'  apex_json.open_object;        -- {',
'  apex_json.open_array(''dataOficio''); --  , "data":[',
'  for c_oficios in (select a.id_acto as acto_ofcio',
'                    from v_mc_g_desembargos_oficio a',
'                    where a.id_dsmbrgos_rslcion = v_id_rslcion',
'                    order by a.id_acto asc ) loop',
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
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(154003711773232616)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Session Value'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(4000);',
'',
'begin',
'    ',
'    v_cdgo_rspsta := 0;',
'    v_mnsje_rspsta := ''Ok'';',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'' , v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(186989733567480511)
,p_process_sequence=>60
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GenerarActosDesembargoOficio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_json                    clob;',
'    v_json_prmtros            clob;',
'    v_id_json                 number;',
'    v_url                     varchar2(4000);',
'    v_id_lte_mdda_ctlar_ip    number;',
'    o_cdgo_rspsta             number;',
'    o_mnsje_rspsta            varchar2(2000);',
'    v_mnsje                   varchar2(4000);',
'    v_correo                  varchar2(4000);',
'begin',
'',
'     v_json := empty_clob();',
'     v_json_prmtros := empty_clob();',
'     ',
'     for i in 1..APEX_APPLICATION.g_f01.count loop',
'       v_json :=  v_json || apex_application.g_f01(i);',
'     end loop;',
'     ',
'     --delete MC_G_DSMBRGS_OFCIO_JSON;',
'     ',
'     insert into MC_G_DSMBRGS_OFCIO_JSON ',
'                   (CDGO_CLNTE,',
'                    JSON_RSLCION) ',
'            values (:F_CDGO_CLNTE,',
'                    v_json)',
'     returning id_dsmbrgs_ofcio_json into v_id_json;',
'            commit;',
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
'                                               p_idntfcdor		=> ''Inicio.Ofi.Desembargo'',',
'                                               p_json_prmtros	=> v_json_prmtros);',
'     end;',
'     ',
'     --insert into muerto (n_001,v_001,v_002,c_001) values (1010,''Json callback'',''Codigo Cliente: ''||v(''F_CDGO_CLNTE'')||'' - Id Usuario: '' ||v(''F_ID_USRIO''),v_json);commit;',
'     ',
'     PKG_CB_MEDIDAS_CAUTELARES.prc_gn_oficios_desembargo_job(p_cdgo_clnte     => v(''F_CDGO_CLNTE''),',
'                                                         p_id_usuario     => v(''F_ID_USRIO''),                                       ',
'                                                         p_id_json        => v_id_json,',
'                                                         o_cdgo_rspsta    => o_cdgo_rspsta,',
'                                                         o_mnsje_rspsta   => o_mnsje_rspsta);',
'                                                   ',
'    ',
'    v_url := apex_util.prepare_url( p_url => ''f?p='' || v(''APP_ID'') || '':118:''|| v(''APP_SESSION'')||''::NO:::'', p_checksum_type => ''SESSION'');',
'    ',
'    if o_cdgo_rspsta <> 0 then',
'        v_url := ''#'';',
'    end if;',
'    ',
'    o_cdgo_rspsta := 0;',
'    o_mnsje_rspsta := ''OK'';',
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
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(188170019829179531)
,p_process_sequence=>70
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ConsultarOficio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_json                     clob;',
'    v_id_lte_mdda_ctlar_ip    number;',
'    o_cdgo_rspsta             number;',
'    o_mnsje_rspsta            varchar2(2000);',
'    v_mnsje                   varchar2(4000);',
'    v_contador                number;',
'begin',
'     for i in 1..APEX_APPLICATION.g_f01.count loop',
'       v_json :=  v_json || apex_application.g_f01(i);',
'     end loop;',
'     ',
'     select  count(*) into v_contador',
'        from mc_g_desembargos_oficio',
'    where gnra_ofcio = ''N'' and id_dsmbrgos_rslcion in (select id_dsmbrgos_rslcion',
'                                                        from ',
'                                                        json_table (v_json,''$[*]''',
'                                                                    columns (id_dsmbrgos_rslcion varchar2 (400) PATH ''$.ID_DR''',
'                                                                    )));',
'    if (v_contador = 0) then',
'          o_cdgo_rspsta := 10;',
'          o_mnsje_rspsta := ''No hay resoluciones sin oficio'';          ',
'      else',
'        o_cdgo_rspsta := 0;',
'        o_mnsje_rspsta := ''Si tiene resoluciones sin oficios'';',
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
 p_id=>wwv_flow_api.id(189539511742081206)
,p_process_sequence=>80
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DescargarExcel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'  v_json           clob;',
'  v_tpo_entdd      varchar2(5);',
'  v_cntdd          number;',
'  v_lte_mdda_ctlar number;',
'  v_rslcnes_imprsn varchar2(2000);',
'  v_mnsje          varchar2(4000);',
'  v_cdgo_rspsta    number;',
'begin',
'',
'   v_json := empty_clob();',
'   for i in 1..APEX_APPLICATION.g_f01.count loop',
'      v_json :=  v_json || apex_application.g_f01(i);',
'   end loop;',
'   ',
'   --insert into muerto (v_001,c_001) values (''CALLBACK Json Desembargo Oficios'',v_json);commit;',
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
'  select b.cdgo_entdad_tpo into v_tpo_entdd',
'     from v_mc_g_desembargos_oficio a ',
'           join mc_d_entidades b on a.id_entddes = b.id_entddes',
'        where a.id_dsmbrgo_ofcio in (',
'        select id_dsmbrgo_ofcio',
'        from ',
'        json_table (v_json,''$[*]''',
'                    columns (id_dsmbrgo_ofcio varchar2 (400) PATH ''$.ID_DO''',
'                    )));',
'   ',
' select a.rslcnes_imprsn into v_rslcnes_imprsn',
'         from mc_g_desembargos_oficio a ',
'            where a.id_dsmbrgo_ofcio in (',
'            select id_dsmbrgo_ofcio',
'            from ',
'            json_table (v_json,''$[*]''',
'                        columns (id_dsmbrgo_ofcio varchar2 (400) PATH ''$.ID_DO''',
'                        )));',
'          v_cdgo_rspsta := 0;',
'          v_mnsje       := ''OK'';',
'',
'   end if;',
'   ',
'   --insert into muerto (v_001,v_002,c_001) values (''CALLBACK Json Desembargo Oficios'',v_tpo_entdd,v_rslcnes_imprsn);commit;',
'   ',
'   apex_json.open_object;',
'   apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'   apex_json.write(''o_mnsje_rspsta'', v_mnsje);',
'   apex_json.write(''v_tpo_entdd'', v_tpo_entdd);',
'   --apex_json.write(''v_lte_mdda_ctlar'', v_lte_mdda_ctlar);',
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
end;
/
