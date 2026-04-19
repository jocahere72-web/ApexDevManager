prompt --application/pages/page_00145
begin
wwv_flow_api.create_page(
 p_id=>145
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Impresi\00F3n de Actos - Medidas Cautelares')
,p_step_title=>unistr('<b>Impresi\00F3n de Actos - Medidas Cautelares</b>')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#APP_IMAGES#pdf-lib.min.js',
'#APP_IMAGES#FileSaver.min.js',
'#APP_IMAGES#jszip.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function seleccionarTodosEmbargos(e,btn,grid,data){',
'  let datos = data.map((m) => {',
'          return { "ID_ER": m.ID_EMBRGOS_RSLCION,',
'                   "ID_ACTO": m.ID_ACTO',
'                 }; ',
'      }); ',
'  ',
'  window.localStorage.setItem(''JSON_EMB'', JSON.stringify(datos));',
'  ',
'}',
'',
'function seleccionarTodosOficiosEmb(e,btn,grid,data){',
'  let datos = data.map((m) => {',
'          return { "ID_ACTO": m.ID_ACTO}; ',
'      }); ',
'  ',
'  window.localStorage.setItem(''JSON_OF_EMB'', JSON.stringify(datos));',
'  ',
'}',
'',
'function seleccionarTodosDesembargos(e,btn,grid,data){',
'  let datos = data.map((m) => {',
'          return { "ID_ACTO": m.ID_ACTO',
'                 }; ',
'      }); ',
'  ',
'  window.localStorage.setItem(''JSON_DES'', JSON.stringify(datos));',
'  ',
'}',
'',
'function seleccionarTodosOficiosDes(e,btn,grid,data){',
'  let datos = data.map((m) => {',
'          return { "ID_ACTO": m.ID_ACTO',
'                 }; ',
'      }); ',
'  ',
'  window.localStorage.setItem(''JSON_OF_DES'', JSON.stringify(datos));',
'  ',
'}',
'',
'',
'',
'',
unistr('/* GENERACI\00D3N DE PDFS */'),
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
unistr('//Funci\00F3n que descarga PDF para Resoluciones de Embargo en un \00FAnico Archivo'),
'const FnResolucionesEmbargo = async () => {',
'  console.time(''loop'');',
'  let popup = apex.widget.waitPopup();',
'  let v_json = localStorage.getItem(''JSON_EMB'');',
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
'      const { data } = await peticionServerProcess(''Consultar_Documentos'', { f01: JSON.stringify(array.slice(i, i + 19 + 1))});',
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
'    zip.file(`Resoluciones_Embargo.pdf`, mergedPdfFile);',
'    zip.generateAsync({ type: "blob" }).then(mergedPdfFile => {',
'      download(mergedPdfFile, `Resoluciones_Embargo.zip`, ''application/zip'');',
'    });',
'    console.timeEnd(''loop''); // Muestra por consola: "loop: 63ms"',
'  } else {',
'    alert(''No existen documentos asociados.'')',
'  }',
'  popup.remove();',
'}',
'',
unistr('//Funci\00F3n que descarga PDFS individuales para Resoluciones de Embargo'),
'const FnResolucionesEmbargoInd = async () => {',
'  console.time(''loop'');',
'  let popup = apex.widget.waitPopup();',
'  let zip = new JSZip();',
'  let v_json = localStorage.getItem(''JSON_EMB'');',
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
'      const { data } = await peticionServerProcess(''Consultar_Documentos'', { f01: JSON.stringify(array.slice(i, i + 19 + 1)) });',
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
'        let file = new File([mergedPdfFile], "Resoluciones_de_embargo_individual" + i + j +".pdf", {',
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
'const FnOficiosEmbargoInd = async () => {',
'  console.time(''loop'');',
'  let popup = apex.widget.waitPopup();',
'  let zip = new JSZip();',
'  let v_json = localStorage.getItem(''JSON_OF_EMB'');',
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
'      const { data } = await peticionServerProcess(''Consultar_Documentos'', { f01: JSON.stringify(array.slice(i, i + 19 + 1)) });',
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
'        let file = new File([mergedPdfFile], "Oficios_Embargo_individual" + i + j +".pdf", {',
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
'      download(mergedPdfFile, `Oficios_Embargo_individual.zip`, ''application/zip'');',
'    });',
'    console.timeEnd(''loop''); // Muestra por consola: "loop: 63ms"',
'  } else {',
'    alert(''No existen documentos asociados.'')',
'  }',
'  popup.remove();',
'}',
'',
'const FnOficiosEmbargo = async () => {',
'  console.time(''loop'');',
'  let popup = apex.widget.waitPopup();',
'  let v_json = localStorage.getItem(''JSON_OF_EMB'');',
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
'      const { data } = await peticionServerProcess(''Consultar_Documentos'', { f01: JSON.stringify(array.slice(i, i + 19 + 1))});',
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
'    zip.file(`Oficios_Embargo.pdf`, mergedPdfFile);',
'    zip.generateAsync({ type: "blob" }).then(mergedPdfFile => {',
'      download(mergedPdfFile, `Oficios_Embargo.zip`, ''application/zip'');',
'    });',
'    console.timeEnd(''loop''); // Muestra por consola: "loop: 63ms"',
'  } else {',
'    alert(''No existen documentos asociados.'')',
'  }',
'  popup.remove();',
'}',
'',
'',
unistr('//Funci\00F3n que descarga PDF para Resoluciones de Desembargo en un \00FAnico Archivo'),
'const FnResolucionesDesembargo = async () => {',
'  console.time(''loop'');',
'  let popup = apex.widget.waitPopup();',
'  let v_json = localStorage.getItem(''JSON_DES'');',
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
'      const { data } = await peticionServerProcess(''Consultar_Documentos'', { f01: JSON.stringify(array.slice(i, i + 19 + 1))});',
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
'    zip.file(`Resoluciones_Desembargo.pdf`, mergedPdfFile);',
'    zip.generateAsync({ type: "blob" }).then(mergedPdfFile => {',
'      download(mergedPdfFile, `Resoluciones_Desembargo.zip`, ''application/zip'');',
'    });',
'    console.timeEnd(''loop''); // Muestra por consola: "loop: 63ms"',
'  } else {',
'    alert(''No existen documentos asociados.'')',
'  }',
'  popup.remove();',
'}',
'',
unistr('//Funci\00F3n que descarga PDFS individuales para Resoluciones de Embargo'),
'const FnResolucionesDesembargoInd = async () => {',
'  console.time(''loop'');',
'  let popup = apex.widget.waitPopup();',
'  let zip = new JSZip();',
'  let v_json = localStorage.getItem(''JSON_DES'');',
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
'      const { data } = await peticionServerProcess(''Consultar_Documentos'', { f01: JSON.stringify(array.slice(i, i + 19 + 1)) });',
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
'        let file = new File([mergedPdfFile], "Resoluciones_Desembargo_individual" + i + j +".pdf", {',
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
'      download(mergedPdfFile, `Resoluciones_Desembargo_individual.zip`, ''application/zip'');',
'    });',
'    console.timeEnd(''loop''); // Muestra por consola: "loop: 63ms"',
'  } else {',
'    alert(''No existen documentos asociados.'')',
'  }',
'  popup.remove();',
'}',
'',
'const FnOficiosDesembargoInd = async () => {',
'  console.time(''loop'');',
'  let popup = apex.widget.waitPopup();',
'  let zip = new JSZip();',
'  let v_json = localStorage.getItem(''JSON_OF_DES'');',
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
'      const { data } = await peticionServerProcess(''Consultar_Documentos'', { f01: JSON.stringify(array.slice(i, i + 19 + 1)) });',
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
'        let file = new File([mergedPdfFile], "Oficios_Desembargo_individual" + i + j +".pdf", {',
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
'      download(mergedPdfFile, `Oficios_Desembargo_individual.zip`, ''application/zip'');',
'    });',
'    console.timeEnd(''loop''); // Muestra por consola: "loop: 63ms"',
'  } else {',
'    alert(''No existen documentos asociados.'')',
'  }',
'  popup.remove();',
'}',
'',
'const FnOficiosDesembargo = async () => {',
'  console.time(''loop'');',
'  let popup = apex.widget.waitPopup();',
'  let v_json = localStorage.getItem(''JSON_OF_DES'');',
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
'      const { data } = await peticionServerProcess(''Consultar_Documentos'', { f01: JSON.stringify(array.slice(i, i + 19 + 1))});',
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
'    zip.file(`Oficios_Desembargo.pdf`, mergedPdfFile);',
'    zip.generateAsync({ type: "blob" }).then(mergedPdfFile => {',
'      download(mergedPdfFile, `Oficios_Desembargo.zip`, ''application/zip'');',
'    });',
'    console.timeEnd(''loop''); // Muestra por consola: "loop: 63ms"',
'  } else {',
'    alert(''No existen documentos asociados.'')',
'  }',
'  popup.remove();',
'}'))
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JAGUAS'
,p_last_upd_yyyymmddhh24miss=>'20220216131321'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(153751199327710238)
,p_plug_name=>unistr('<b>Par\00E1metros de consulta</b>')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17345839561919369)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(153751770948710244)
,p_plug_name=>'Resoluciones_Embargo'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_acto',
'     , trunc(a.fcha_acto) as fcha_acto',
'     , a.idntfccion',
'     , a.id_acto',
'     , a.vgncias',
'     , b.vlor_mdda_ctlar',
'     , nvl(d.nmro_prcso_jrdco,0) as nmro_prcso_jrdco',
'     , ''<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" aria-labelledby="id_tareas_ig_grid_vc_ctx id_tareas_ig_grid_vc_cur">Ver PDF <span class="fa fa-eye"></span></button>'' as pdf',
'from v_mc_g_embargos_resolucion a',
'join mc_g_embargos_cartera b on a.id_embrgos_crtra = b.id_embrgos_crtra',
'left join mc_g_embrgos_crt_prc_jrd c on b.id_embrgos_crtra = c.id_embrgos_crtra',
'left join cb_g_procesos_juridico d on d.id_prcsos_jrdco = c.id_prcsos_jrdco',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and (b.id_tpos_mdda_ctlar = :P145_TPOS_MDDA_CTLAR)',
'and (trunc(a.fcha_rgstro_embrgo) >= :P145_FCHA_DSDE or :P145_FCHA_DSDE is null)',
'and (trunc(a.fcha_rgstro_embrgo) <= :P145_FCHA_HSTA or :P145_FCHA_HSTA is null)',
'and (a.nmro_acto >= :P145_NMRO_ACTO_DSDE or :P145_NMRO_ACTO_DSDE is null)',
'and (a.nmro_acto <= :P145_NMRO_ACTO_HSTA or :P145_NMRO_ACTO_HSTA is null)',
'and a.id_dcmnto is not null'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>':P145_ACTOS = ''R'' and :P145_PRCSOS = ''E'''
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(153751935854710246)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'No. Acto'
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
 p_id=>wwv_flow_api.id(153752052078710247)
,p_name=>'FCHA_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ACTO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(153752165844710248)
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
 p_id=>wwv_flow_api.id(153752258814710249)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
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
 p_id=>wwv_flow_api.id(153752308298710250)
,p_name=>'PDF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PDF'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(154365042495352801)
,p_name=>'VGNCIAS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIAS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Vigencias'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(154365179743352802)
,p_name=>'VLOR_MDDA_CTLAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_MDDA_CTLAR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Cuant\00EDa')
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
 p_id=>wwv_flow_api.id(154365223563352803)
,p_name=>'NMRO_PRCSO_JRDCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_PRCSO_JRDCO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('No. Proceso Jur\00EDdico')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(154365499790352805)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(154365574240352806)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(153751850672710245)
,p_internal_uid=>153751850672710245
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'	config.initialSelection = false;',
'   window.localStorage.removeItem(''JSON_EMB'');',
'    return selectAll(config, {',
'        name: ''Todos'',',
'        action: seleccionarTodosEmbargos',
'    }) ;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(154357587542248806)
,p_interactive_grid_id=>wwv_flow_api.id(153751850672710245)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>20
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(154357656316248818)
,p_report_id=>wwv_flow_api.id(154357587542248806)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(2218572013891)
,p_view_id=>wwv_flow_api.id(154357656316248818)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(154365223563352803)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154358105953248829)
,p_view_id=>wwv_flow_api.id(154357656316248818)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(153751935854710246)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154361784866293302)
,p_view_id=>wwv_flow_api.id(154357656316248818)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(153752052078710247)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154362229917293304)
,p_view_id=>wwv_flow_api.id(154357656316248818)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(153752165844710248)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>191
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154362751688293310)
,p_view_id=>wwv_flow_api.id(154357656316248818)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(153752258814710249)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154363265334293311)
,p_view_id=>wwv_flow_api.id(154357656316248818)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(153752308298710250)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154371008172353676)
,p_view_id=>wwv_flow_api.id(154357656316248818)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(154365042495352801)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154372166104361286)
,p_view_id=>wwv_flow_api.id(154357656316248818)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(154365179743352802)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154378977628435456)
,p_view_id=>wwv_flow_api.id(154357656316248818)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(154365499790352805)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(154365988683352810)
,p_plug_name=>'Resoluciones_Desembargo'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_acto',
'     , trunc(a.fcha_acto) as fcha_acto',
'     , a.idntfccion',
'     , a.id_acto',
'     , d.vgncias',
'     , c.vlor_mdda_ctlar',
'     , nvl(f.nmro_prcso_jrdco,0) as nmro_prcso_jrdco',
'     , ''<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" aria-labelledby="id_tareas_ig_grid_vc_ctx id_tareas_ig_grid_vc_cur">Ver PDF <span class="fa fa-eye"></span></button>'' as pdf',
'from v_mc_g_desembargos_resolucion a',
'join mc_g_desembargos_cartera b on a.id_dsmbrgos_rslcion = b.id_dsmbrgos_rslcion',
'join mc_g_embargos_cartera c on b.id_embrgos_crtra = c.id_embrgos_crtra',
'join v_mc_g_embargos_resolucion d on d.id_embrgos_crtra = c.id_embrgos_crtra',
'left join mc_g_embrgos_crt_prc_jrd e on c.id_embrgos_crtra = e.id_embrgos_crtra',
'left join cb_g_procesos_juridico f on f.id_prcsos_jrdco = e.id_prcsos_jrdco',
'join gn_g_actos g on g.id_acto = a.id_acto',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and c.id_tpos_mdda_ctlar = :P145_TPOS_MDDA_CTLAR',
'and (trunc(a.fcha_rgstro_dsmbrgo) >= :P145_FCHA_DSDE or :P145_FCHA_DSDE is null)',
'and (trunc(a.fcha_rgstro_dsmbrgo) <= :P145_FCHA_HSTA or :P145_FCHA_HSTA is null)',
'and (a.nmro_acto >= :P145_NMRO_ACTO_DSDE or :P145_NMRO_ACTO_DSDE is null)',
'and (a.nmro_acto <= :P145_NMRO_ACTO_HSTA or :P145_NMRO_ACTO_HSTA is null)',
'and g.id_dcmnto is not null'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>':P145_ACTOS = ''R'' and :P145_PRCSOS = ''D'''
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(154366182776352812)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'No. Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(154366207398352813)
,p_name=>'FCHA_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ACTO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(154366338303352814)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(154366422813352815)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
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
 p_id=>wwv_flow_api.id(154366563381352816)
,p_name=>'PDF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PDF'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_01=>'&PDF.'
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,file_blob,file_name,file_mimetype,id_acto,&ID_ACTO.'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(154366666310352817)
,p_name=>'VGNCIAS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIAS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Vigencias'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(154366707631352818)
,p_name=>'VLOR_MDDA_CTLAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_MDDA_CTLAR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Cuant\00EDa')
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
 p_id=>wwv_flow_api.id(154366819770352819)
,p_name=>'NMRO_PRCSO_JRDCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_PRCSO_JRDCO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('No. Proceso Jur\00EDdico')
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
 p_id=>wwv_flow_api.id(154366968456352820)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>90
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(154367050094352821)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(154366099725352811)
,p_internal_uid=>154366099725352811
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'	config.initialSelection = false;',
'   window.localStorage.removeItem(''JSON_DES'');',
'    return selectAll(config, {',
'        name: ''Todos'',',
'        action: seleccionarTodosDesembargos',
'    }) ;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(154386902323511666)
,p_interactive_grid_id=>wwv_flow_api.id(154366099725352811)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(154387036592511666)
,p_report_id=>wwv_flow_api.id(154386902323511666)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154387555947511670)
,p_view_id=>wwv_flow_api.id(154387036592511666)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(154366182776352812)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154387909670511675)
,p_view_id=>wwv_flow_api.id(154387036592511666)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(154366207398352813)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154388435995511677)
,p_view_id=>wwv_flow_api.id(154387036592511666)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(154366338303352814)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>191
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154388944279511679)
,p_view_id=>wwv_flow_api.id(154387036592511666)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(154366422813352815)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154389445507511681)
,p_view_id=>wwv_flow_api.id(154387036592511666)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(154366563381352816)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154389992066511683)
,p_view_id=>wwv_flow_api.id(154387036592511666)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(154366666310352817)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154390424183511685)
,p_view_id=>wwv_flow_api.id(154387036592511666)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(154366707631352818)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154390968495511686)
,p_view_id=>wwv_flow_api.id(154387036592511666)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(154366819770352819)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154391492167511688)
,p_view_id=>wwv_flow_api.id(154387036592511666)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(154366968456352820)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(154367220697352823)
,p_plug_name=>'<b>Opciones</b>'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(154368227620352833)
,p_plug_name=>'Oficios_Embargo'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_acto_ofcio as nmro_acto',
'     , trunc(a.fcha_ofcio) as fcha_acto',
'     , a.acto_ofcio as id_acto',
'     , a.dscrpcion as entdad',
'     , a.rspnsble',
'     , ''<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" aria-labelledby="id_tareas_ig_grid_vc_ctx id_tareas_ig_grid_vc_cur">Ver PDF <span class="fa fa-eye"></span></button>'' as pdf',
'from v_mc_g_solicitudes_y_oficios a',
'join v_mc_g_embargos_resolucion b on a.id_embrgos_crtra = b.id_embrgos_crtra',
'join mc_g_embargos_cartera c on b.id_embrgos_crtra = c.id_embrgos_crtra',
'left join mc_g_embrgos_crt_prc_jrd d on b.id_embrgos_crtra = d.id_embrgos_crtra',
'left join cb_g_procesos_juridico e on d.id_prcsos_jrdco = e.id_prcsos_jrdco',
'join gn_g_actos f on a.acto_ofcio = f.id_acto',
'where b.cdgo_clnte = :F_CDGO_CLNTE',
'and c.id_tpos_mdda_ctlar = :P145_TPOS_MDDA_CTLAR',
'and (trunc(a.fcha_ofcio) >= :P145_FCHA_DSDE or :P145_FCHA_DSDE is null)',
'and (trunc(a.fcha_ofcio) <= :P145_FCHA_HSTA or :P145_FCHA_HSTA is null)',
'and (a.nmro_acto_ofcio >= :P145_NMRO_ACTO_DSDE or :P145_NMRO_ACTO_DSDE is null)',
'and (a.nmro_acto_ofcio <= :P145_NMRO_ACTO_HSTA or :P145_NMRO_ACTO_HSTA is null)',
'and f.id_dcmnto is not null'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>':P145_ACTOS = ''O'' and :P145_PRCSOS = ''E'''
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(154368416102352835)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'No. Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(154368521257352836)
,p_name=>'FCHA_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ACTO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(154368724753352838)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
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
 p_id=>wwv_flow_api.id(154368865913352839)
,p_name=>'PDF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PDF'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_01=>'&PDF.'
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,file_blob,file_name,file_mimetype,id_acto,&ID_ACTO.'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(154369247245352843)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>90
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(154369340722352844)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(154412271552826409)
,p_name=>'ENTDAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ENTDAD'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Entdad'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(154412307284826410)
,p_name=>'RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSPNSBLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Rspnsble'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(154368306906352834)
,p_internal_uid=>154368306906352834
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'	config.initialSelection = false;',
'   window.localStorage.removeItem(''JSON_OF_EMB'');',
'    return selectAll(config, {',
'        name: ''Todos'',',
'        action: seleccionarTodosOficiosEmb',
'    }) ;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(154406391260825767)
,p_interactive_grid_id=>wwv_flow_api.id(154368306906352834)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(154406488460825772)
,p_report_id=>wwv_flow_api.id(154406391260825767)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154406932725825782)
,p_view_id=>wwv_flow_api.id(154406488460825772)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(154368416102352835)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154407424535825787)
,p_view_id=>wwv_flow_api.id(154406488460825772)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(154368521257352836)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154408445593825792)
,p_view_id=>wwv_flow_api.id(154406488460825772)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(154368724753352838)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154408932399825794)
,p_view_id=>wwv_flow_api.id(154406488460825772)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(154368865913352839)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154410953477825815)
,p_view_id=>wwv_flow_api.id(154406488460825772)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(154369247245352843)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154422825043215537)
,p_view_id=>wwv_flow_api.id(154406488460825772)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(154412271552826409)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>265
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154423266345215539)
,p_view_id=>wwv_flow_api.id(154406488460825772)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(154412307284826410)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>227
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(154369453277352845)
,p_plug_name=>'Oficios_Desembargo'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_acto',
'     , trunc(a.fcha_acto) as fcha_acto',
'     , a.id_acto',
'     , a.entidad',
'     , a.rspnsble',
'     , ''<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" aria-labelledby="id_tareas_ig_grid_vc_ctx id_tareas_ig_grid_vc_cur">Ver PDF <span class="fa fa-eye"></span></button>'' as pdf',
'from v_mc_g_desembargos_oficio a',
'join v_mc_g_desembargos_resolucion b on a.id_dsmbrgos_rslcion = b.id_dsmbrgos_rslcion',
'join mc_g_desembargos_cartera c on c.id_dsmbrgos_rslcion = b.id_dsmbrgos_rslcion',
'join mc_g_embargos_cartera d on d.id_embrgos_crtra = c.id_embrgos_crtra',
'join gn_g_actos h on h.id_acto = a.id_acto',
'where b.cdgo_clnte = :F_CDGO_CLNTE',
'and d.id_tpos_mdda_ctlar = :P145_TPOS_MDDA_CTLAR',
'and (trunc(a.fcha_acto) >= :P145_FCHA_DSDE or :P145_FCHA_DSDE is null)',
'and (trunc(a.fcha_acto) <= :P145_FCHA_HSTA or :P145_FCHA_HSTA is null)',
'and (a.nmro_acto >= :P145_NMRO_ACTO_DSDE or :P145_NMRO_ACTO_DSDE is null)',
'and (a.nmro_acto <= :P145_NMRO_ACTO_HSTA or :P145_NMRO_ACTO_HSTA is null)',
'and h.id_dcmnto is not null',
'union',
'select a.nmro_acto',
'     , trunc(a.fcha_acto) as fcha_acto',
'     , a.id_acto',
'     , ''TODAS LAS ENTIDADES'' as entidad',
'     , null as rspnsble',
'     , ''<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" aria-labelledby="id_tareas_ig_grid_vc_ctx id_tareas_ig_grid_vc_cur">Ver PDF <span class="fa fa-eye"></span></button>'' as pdf',
'from mc_g_desembargos_oficio a',
'join v_mc_g_desembargos_resolucion b on a.id_dsmbrgos_rslcion = b.id_dsmbrgos_rslcion',
'join mc_g_desembargos_cartera c on c.id_dsmbrgos_rslcion = b.id_dsmbrgos_rslcion',
'join mc_g_embargos_cartera d on d.id_embrgos_crtra = c.id_embrgos_crtra',
'join gn_g_actos h on h.id_acto = a.id_acto',
'where b.cdgo_clnte = :F_CDGO_CLNTE',
'and d.id_tpos_mdda_ctlar = :P145_TPOS_MDDA_CTLAR',
'and a.id_slctd_ofcio is null',
'and (trunc(a.fcha_acto) >= :P145_FCHA_DSDE or :P145_FCHA_DSDE is null)',
'and (trunc(a.fcha_acto) <= :P145_FCHA_HSTA or :P145_FCHA_HSTA is null)',
'and (a.nmro_acto >= :P145_NMRO_ACTO_DSDE or :P145_NMRO_ACTO_DSDE is null)',
'and (a.nmro_acto <= :P145_NMRO_ACTO_HSTA or :P145_NMRO_ACTO_HSTA is null)',
'and h.id_dcmnto is not null'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>':P145_ACTOS = ''O'' and :P145_PRCSOS = ''D'''
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(154369659096352847)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'No. Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(154369736766352848)
,p_name=>'FCHA_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ACTO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(154369945350352850)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
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
 p_id=>wwv_flow_api.id(154411413809826401)
,p_name=>'PDF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PDF'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_01=>'&PDF.'
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,file_blob,file_name,file_mimetype,id_acto,&ID_ACTO.'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(154411811614826405)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>90
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(154411961133826406)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(154412036884826407)
,p_name=>'ENTIDAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ENTIDAD'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Entidad'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(154412136298826408)
,p_name=>'RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSPNSBLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Rspnsble'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(154369595213352846)
,p_internal_uid=>154369595213352846
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'	config.initialSelection = false;',
'   window.localStorage.removeItem(''JSON_OF_DES'');',
'    return selectAll(config, {',
'        name: ''Todos'',',
'        action: seleccionarTodosOficiosDes',
'    }) ;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(154417077858871088)
,p_interactive_grid_id=>wwv_flow_api.id(154369595213352846)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(154417165820871088)
,p_report_id=>wwv_flow_api.id(154417077858871088)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154417605019871090)
,p_view_id=>wwv_flow_api.id(154417165820871088)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(154369659096352847)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154418125038871093)
,p_view_id=>wwv_flow_api.id(154417165820871088)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(154369736766352848)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154418665408871097)
,p_view_id=>wwv_flow_api.id(154417165820871088)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(154369945350352850)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154419173149871098)
,p_view_id=>wwv_flow_api.id(154417165820871088)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(154411413809826401)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154419635291871103)
,p_view_id=>wwv_flow_api.id(154417165820871088)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(154411811614826405)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154420550513871125)
,p_view_id=>wwv_flow_api.id(154417165820871088)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(154412036884826407)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(154421012093871127)
,p_view_id=>wwv_flow_api.id(154417165820871088)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(154412136298826408)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(154367381495352824)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(154367220697352823)
,p_button_name=>'BTN_IMPRMIR_EMBRGOS_IND'
,p_button_static_id=>'BTN_IMPRMIR_EMBRGOS_IND'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Descargar Embargos en <br> archivos individuales'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P145_ACTOS = ''R'' and :P145_PRCSOS = ''E'' and :P145_TPO_IMPRSION = ''VA'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-file-pdf-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(154367762907352828)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(154367220697352823)
,p_button_name=>'BTN_IMPRMIR_EMBRGOS'
,p_button_static_id=>'BTN_IMPRMIR_EMBRGOS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Descargar Embargos en <br> \00FAnico archivo')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P145_ACTOS = ''R'' and :P145_PRCSOS = ''E'' and :P145_TPO_IMPRSION = ''UA'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-file-pdf-o'
,p_grid_new_grid=>false
);
end;
/
begin
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(154367475560352825)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(154367220697352823)
,p_button_name=>'BTN_IMPRMIR_DSMBRGOS_IND'
,p_button_static_id=>'BTN_IMPRMIR_DSMBRGOS_IND'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Descargar Desembargos en <br> archivos individuales'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P145_ACTOS = ''R'' and :P145_PRCSOS = ''D'' and :P145_TPO_IMPRSION = ''VA'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-file-pdf-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(154367842254352829)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(154367220697352823)
,p_button_name=>'BTN_IMPRMIR_DSMBRGOS'
,p_button_static_id=>'BTN_IMPRMIR_DSMBRGOS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Descargar Desembargos en <br> \00FAnico archivo')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P145_ACTOS = ''R'' and :P145_PRCSOS = ''D'' and :P145_TPO_IMPRSION = ''UA'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-file-pdf-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(154367538380352826)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(154367220697352823)
,p_button_name=>'BTN_IMPRMIR_OF_EMBRGOS_IND'
,p_button_static_id=>'BTN_IMPRMIR_OF_EMBRGOS_IND'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Descargar Oficios de <br> Embargo en <br> archivos individuales'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P145_ACTOS = ''O'' and :P145_PRCSOS = ''E'' and :P145_TPO_IMPRSION = ''VA'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-file-pdf-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(154412499202826411)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(154367220697352823)
,p_button_name=>'BTN_IMPRMIR_OF_EMBRGOS'
,p_button_static_id=>'BTN_IMPRMIR_OF_EMBRGOS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>unistr('Descargar Oficios de <br> Embargo en <br> \00FAnico archivo')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P145_ACTOS = ''O'' and :P145_PRCSOS = ''E'' and :P145_TPO_IMPRSION = ''UA'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-file-pdf-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(154367612977352827)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(154367220697352823)
,p_button_name=>'BTN_IMPRMIR_OF_DSMBRGOS_IND'
,p_button_static_id=>'BTN_IMPRMIR_OF_DSMBRGOS_IND'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Descargar Oficios de <br> Desembargo en <br> archivos individuales'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P145_ACTOS = ''O'' and :P145_PRCSOS = ''D'' and :P145_TPO_IMPRSION = ''VA'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-file-pdf-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(154412544743826412)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(154367220697352823)
,p_button_name=>'BTN_IMPRMIR_OF_DSMBRGOS'
,p_button_static_id=>'BTN_IMPRMIR_OF_DSMBRGOS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>unistr('Descargar Oficios de <br> Desembargo en <br> \00FAnico archivo')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P145_ACTOS = ''O'' and :P145_PRCSOS = ''D'' and :P145_TPO_IMPRSION = ''UA'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-file-pdf-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(153751688616710243)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(153751199327710238)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(17409089099919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(153751242305710239)
,p_name=>'P145_ACTOS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(153751199327710238)
,p_item_default=>'R'
,p_prompt=>'Actos'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Resoluciones;R,Oficios de notificaci\00F3n;O')
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(153751329081710240)
,p_name=>'P145_PRCSOS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(153751199327710238)
,p_prompt=>'Proceso de Medida Cautelar:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Embargo;E,Desembargo;D'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(153751474861710241)
,p_name=>'P145_FCHA_DSDE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(153751199327710238)
,p_prompt=>'Fecha Acto Desde:'
,p_format_mask=>'dd/mm/yyyy'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(153751578629710242)
,p_name=>'P145_FCHA_HSTA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(153751199327710238)
,p_prompt=>'Fecha Acto Hasta:'
,p_format_mask=>'dd/mm/yyyy'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(154365352430352804)
,p_name=>'P145_TPO_IMPRSION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(153751199327710238)
,p_item_default=>'UA'
,p_prompt=>unistr('Tipo Archivo de Impresi\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Un s\00F3lo Archivo;UA,Archivos Individuales;VA')
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(154365773836352808)
,p_name=>'P145_NMRO_ACTO_DSDE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(153751199327710238)
,p_prompt=>'No. Acto Desde:'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(154365832134352809)
,p_name=>'P145_NMRO_ACTO_HSTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(153751199327710238)
,p_prompt=>'No. Acto Hasta:'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(154367120434352822)
,p_name=>'P145_TPOS_MDDA_CTLAR'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(153751199327710238)
,p_prompt=>'Tipo Medida Cautelar'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d, id_tpos_mdda_ctlar as v',
'from mc_d_tipos_mdda_ctlar',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and actvo = ''S'''))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(154412691223826413)
,p_name=>'Al dar Click en BTN_IMPRMIR_EMBRGOS_IND'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(154367381495352824)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(154412718808826414)
,p_event_id=>wwv_flow_api.id(154412691223826413)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'FnResolucionesEmbargoInd();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(154413015292826417)
,p_name=>'Al dar Click en BTN_IMPRMIR_EMBRGOS'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(154367762907352828)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(154413110651826418)
,p_event_id=>wwv_flow_api.id(154413015292826417)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'FnResolucionesEmbargo();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(154413223613826419)
,p_name=>'Al dar Click en BTN_IMPRMIR_OF_EMBRGOS_IND'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(154367538380352826)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(154413360360826420)
,p_event_id=>wwv_flow_api.id(154413223613826419)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'FnOficiosEmbargoInd();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(154413477281826421)
,p_name=>'Al dar Click en BTN_IMPRMIR_OF_EMBRGOS'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(154412499202826411)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(154413592156826422)
,p_event_id=>wwv_flow_api.id(154413477281826421)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'FnOficiosEmbargo();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(154413611010826423)
,p_name=>'Al dar Click en BTN_IMPRMIR_DSMBRGOS_IND'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(154367475560352825)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(154413733027826424)
,p_event_id=>wwv_flow_api.id(154413611010826423)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'FnResolucionesDesembargoInd();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(154413831868826425)
,p_name=>'Al dar Click en BTN_IMPRMIR_DSMBRGOS'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(154367842254352829)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(154413996653826426)
,p_event_id=>wwv_flow_api.id(154413831868826425)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'FnResolucionesDesembargo();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(154414002230826427)
,p_name=>'Al dar Click en BTN_IMPRMIR_OF_DSMBRGOS_IND'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(154367612977352827)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(154414149494826428)
,p_event_id=>wwv_flow_api.id(154414002230826427)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'FnOficiosDesembargoInd();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(154414221041826429)
,p_name=>'Al dar Click en BTN_IMPRMIR_OF_DSMBRGOS'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(154412544743826412)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(154414313485826430)
,p_event_id=>wwv_flow_api.id(154414221041826429)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'FnOficiosDesembargo();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(154365639760352807)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(153751770948710244)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Resoluciones_Embargo - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(154412841766826415)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar_Documentos'
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
'  apex_json.open_object;        -- {',
'  apex_json.open_array(''data''); --  , "data":[',
'  for c_document in (select b.file_blob, b.file_name, b.file_bfile, a.nmro_acto',
'                      from gn_g_actos a',
'                      join gd_g_documentos b on a.id_dcmnto = b.id_dcmnto',
'                      join json_table(v_json, ''$[*]''',
'                                        columns (',
'                                             json_id_acto varchar2(100) path ''$.ID_ACTO''',
'                                        ) ) as x on x.json_id_acto = a.id_acto',
'                      where b.file_blob is not null  ',
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
end;
/
