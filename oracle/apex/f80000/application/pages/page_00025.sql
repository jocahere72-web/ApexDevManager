prompt --application/pages/page_00025
begin
wwv_flow_api.create_page(
 p_id=>25
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Impresion de Actos de Procesos Juridicos'
,p_step_title=>'Impresion de Actos de Procesos Juridicos'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js',
'#APP_IMAGES#pdf-lib.min.js',
'#APP_IMAGES#FileSaver.min.js',
'#APP_IMAGES#jszip.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function validar_sel(valid) {',
'',
'    var region = apex.region("actos_proceso");',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'              ',
'        //OBTENEMOS UN JSON CON LOS DATOS SELECCIONADOS QUE NO HAN SIDO PROCESADOS',
'        var json = records.map(function (record) {',
'            return { "ID_ACTO": model.getValue(record, "ID_ACTO").trim()',
'                   };',
'        });',
'                ',
'        window.localStorage.setItem(''jsonProcesosTodos'', json.length > 0 ? JSON.stringify(json) : '''');',
'        return;',
'    } ',
'',
'}',
'',
'function seleccionarTodos(e,btn,grid,data){',
'    var datos = data.map((m) => {',
'            return { "ID_ACTO": m.ID_ACTO',
'                   }; ',
'        }); ',
'    window.localStorage.setItem(''jsonProcesosTodos'', JSON.stringify(datos));',
'    //apex.submit(''btn_Procesar_Embargo'');',
'}',
'',
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
'const merge_oficios_x_resolucion = async () => {',
'',
'  console.time(''loop'');',
'  let popup = apex.widget.waitPopup();',
'  let zip = new JSZip();',
'  let v_json = localStorage.getItem(''jsonProcesosTodos'');',
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
'    ',
unistr('    console.log(''Tama\00F1o Del Array: ''+array.length);  '),
'    ',
'    while (i < array.length){  ',
'    console.log(''While i: ''+i);',
'    console.log(''Json Acto: ''+JSON.stringify(array[i]));',
'    const { data } = await peticionServerProcess(''prc_co_documentos_msvos'', { f01: JSON.stringify(array[i]) });',
'        let j = 0;',
'        ',
'        console.log(''Data: ''+data);',
'        ',
'        while (j < data.length){',
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
'  ',
'    const mergedPdfFile = await mergedPdf.save();',
'    zip.file(''ActosProcesoDeCobro.pdf'', mergedPdfFile);',
'    zip.generateAsync({ type: "blob" }).then(mergedPdfFile => {',
'      download(mergedPdfFile, ''ActosProcesoDeCobro.zip'', ''application/zip'');',
'    });',
'    console.timeEnd(''loop''); // Muestra por consola: "loop: 63ms"',
'  } else {',
'    alert(''No existen documentos asociados.'')',
'  }',
'  popup.remove();',
'}',
'',
'',
unistr('// Une los oficios por resoluci\00F3n en paralelo (sin ZIP)'),
'const merge_pdf_paralelo = async () => {',
'  console.time(''merge_parallel'');',
'  const popup = apex.widget.waitPopup();',
'',
unistr('  // ==== Configuraci\00F3n ===='),
unistr('  const CONCURRENCY = 4;      // n\00FAmero m\00E1ximo de peticiones simult\00E1neas'),
'  const PDF_NAME = ''ActosProcesoDeCobro.pdf'';',
'',
'  // ==== Utilidades ====',
'  // Limitador de concurrencia simple (cola FIFO)',
'  const createLimiter = (n) => {',
'    let active = 0;',
'    const queue = [];',
'    const next = () => {',
'      if (active >= n || queue.length === 0) return;',
'      active++;',
'      const { fn, resolve, reject } = queue.shift();',
'      (async () => {',
'        try { resolve(await fn()); }',
'        catch (e) { reject(e); }',
'        finally {',
'          active--;',
'          next();',
'        }',
'      })();',
'    };',
'    return (fn) => new Promise((resolve, reject) => {',
'      queue.push({ fn, resolve, reject });',
'      next();',
'    });',
'  };',
'',
'  // Base64 -> Uint8Array (acepta base64 plano o con prefijo data:)',
'  const base64ToUint8Array = (b64) => {',
'    const pure = b64.includes('','') ? b64.split('','').pop() : b64;',
'    const binStr = atob(pure);',
'    const len = binStr.length;',
'    const bytes = new Uint8Array(len);',
'    for (let i = 0; i < len; i++) bytes[i] = binStr.charCodeAt(i);',
'    return bytes;',
'  };',
'',
'  try {',
'    const v_json = localStorage.getItem(''jsonProcesosTodos'');',
'    if (!v_json) {',
'      apex.message.alert(''No hay procesos en localStorage.'');',
'      return;',
'    }',
'',
'    let items;',
'    try {',
'      items = JSON.parse(v_json);',
'    } catch {',
unistr('      apex.message.alert(''JSON inv\00E1lido en localStorage.'');'),
'      return;',
'    }',
'',
'    if (!Array.isArray(items) || items.length === 0) {',
'      apex.message.alert(''No existen documentos asociados.'');',
'      return;',
'    }',
'',
'    const limit = createLimiter(CONCURRENCY);',
'    const results = new Array(items.length);',
'',
'    // 1) Obtener PDFs en paralelo',
'    await Promise.all(',
'      items.map((item, idx) =>',
'        limit(async () => {',
'          const { data } = await peticionServerProcess(''prc_co_documentos_msvos'', { f01: JSON.stringify(item) });',
'          if (!Array.isArray(data) || data.length === 0) {',
'            results[idx] = [];',
'            return;',
'          }',
'',
'          const pdfBytesArr = [];',
'          for (const row of data) {',
'            if (!row || !row.fileBlob) continue;',
'            const bytes = base64ToUint8Array(row.fileBlob);',
'            pdfBytesArr.push(bytes);',
'          }',
'          results[idx] = pdfBytesArr;',
'        })',
'      )',
'    );',
'',
'    // 2) Unir PDFs de forma secuencial (para mantener el orden)',
'    const { PDFDocument } = PDFLib;',
'    const mergedPdf = await PDFDocument.create();',
'',
'    for (let i = 0; i < results.length; i++) {',
'      const pdfList = results[i] || [];',
'      for (const bytes of pdfList) {',
'        try {',
'          const srcDoc = await PDFDocument.load(bytes);',
'          const pages = await mergedPdf.copyPages(srcDoc, srcDoc.getPageIndices());',
'          pages.forEach(p => mergedPdf.addPage(p));',
'        } catch (e) {',
unistr('          console.warn(`Error procesando PDF del \00EDndice ${i}:`, e);'),
'        }',
'      }',
'    }',
'',
'    // 3) Descargar PDF final',
'    const mergedBytes = await mergedPdf.save();',
'    const blob = new Blob([mergedBytes], { type: ''application/pdf'' });',
'    download(blob, PDF_NAME, ''application/pdf'');',
'',
'    console.timeEnd(''merge_parallel'');',
'  } catch (err) {',
'    console.error(err);',
unistr('    apex.message.alert(''Ocurri\00F3 un error uniendo los PDF. Revisa la consola para m\00E1s detalles.'');'),
'  } finally {',
'    popup?.remove?.();',
'  }',
'};',
'',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'validar_sel();',
'',
'apex.region("actos_proceso").widget().interactiveGrid("setSelectedRecords", []);'))
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(17445683081942948)
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20251219091409'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69603336262422231)
,p_plug_name=>'Actos proceso juridico'
,p_region_name=>'actos_proceso'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT d.id_prcsos_jrdco,',
'       d.nmro_prcso_jrdco,',
'       d.id_prcsos_jrdco_dcmnto,',
'       d.id_acto,',
'       d.nmro_acto,',
'       TO_CHAR(TRUNC(d.fcha_acto), ''dd/mm/yyyy'') AS fcha_acto,',
'       d.dscrpcion_acto_tpo,',
'       d.idntfccion,',
'       d.id_etpa,',
'       d.id_acto_tpo',
'  FROM v_cb_g_procesos_jrdco_dcmnto d',
' WHERE d.id_etpa = :P25_ETPA_DCMNTO',
'   AND d.id_acto IS NOT NULL',
'   AND (:P25_PRCSO_JRDCO_DSDE IS NULL OR d.nmro_prcso_jrdco >= :P25_PRCSO_JRDCO_DSDE)',
'   AND (:P25_PRCSO_JRDCO_HSTA IS NULL OR d.nmro_prcso_jrdco <= :P25_PRCSO_JRDCO_HSTA)',
'   AND (:P25_NMRO_ACTO_DSDE   IS NULL OR d.nmro_acto >= :P25_NMRO_ACTO_DSDE)',
'   AND (:P25_NMRO_ACTO_HSTA   IS NULL OR d.nmro_acto <= :P25_NMRO_ACTO_HSTA)',
'   AND (:P25_FECHA_ACTO_DSDE  IS NULL OR TRUNC(d.fcha_acto) >= TRUNC(TO_DATE(:P25_FECHA_ACTO_DSDE, ''DD/MM/YYYY'')))',
'   AND (:P25_FECHA_ACTO_HSTA  IS NULL OR TRUNC(d.fcha_acto) <= TRUNC(TO_DATE(:P25_FECHA_ACTO_HSTA, ''DD/MM/YYYY'')))',
'   AND (:P25_SUJETO           IS NULL OR d.idntfccion LIKE ''%'' || :P25_SUJETO || ''%'')',
'   AND (:P25_TPO_ACTO         IS NULL OR d.id_acto_tpo = :P25_TPO_ACTO)',
'   AND (:P25_INDCDOR_NTFCDO   IS NULL OR d.indcdor_ntfcdo = :P25_INDCDOR_NTFCDO)',
'   AND (:P25_LTE_IMPRSION     IS NULL OR EXISTS (',
'           SELECT 1',
'             FROM CB_G_PROCESOS_JRDCO_LTE_DTLLE a',
'            WHERE a.ID_PRCSDO = d.ID_PRCSOS_JRDCO_DCMNTO',
'              AND a.ID_PRCSO_JRDCO_LTE = :P25_LTE_IMPRSION',
'       ))',
'   AND (',
'       :P25_VLDA_CRTRA = ''N'' ',
'       OR',
'       (:P25_VLDA_CRTRA = ''S'' AND EXISTS (',
'           SELECT 1',
'             FROM cb_g_prcsos_jrdc_dcmnt_mvnt t  ',
'             JOIN v_gf_g_cartera_x_concepto v    ',
'               ON v.id_impsto = t.id_impsto',
'              AND v.id_impsto_sbmpsto = t.id_impsto_sbmpsto',
'              AND v.id_prdo = t.id_prdo',
'              AND v.id_cncpto = t.id_cncpto',
'              AND v.id_sjto_impsto = t.id_sjto_impsto',
'             JOIN si_i_sujetos_responsable e     ',
'               ON e.id_sjto_impsto = t.id_sjto_impsto',
'            WHERE t.id_prcsos_jrdco_dcmnto = d.id_prcsos_jrdco_dcmnto ',
'              AND v.cdgo_clnte = :F_CDGO_CLNTE',
'              AND v.cdgo_mvnt_fncro_estdo = ''NO''',
'              AND e.prncpal_s_n = ''S''',
'              AND (v.vlor_sldo_cptal + v.vlor_intres) > 0 -- Saldo mayor a 0',
'       ))',
'   );'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(57849743143104911)
,p_name=>'PDF'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue;" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver PDF <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,file_blob,file_name,file_mimetype,id_acto,&ID_ACTO.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(69603507204422233)
,p_name=>'ID_PRCSOS_JRDCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSOS_JRDCO'
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(69603624971422234)
,p_name=>'ID_PRCSOS_JRDCO_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSOS_JRDCO_DCMNTO'
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
 p_id=>wwv_flow_api.id(69603739406422235)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(69603806018422236)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero de Acto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(69603940719422237)
,p_name=>'FCHA_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha de Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(69604080023422238)
,p_name=>'DSCRPCION_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ACTO_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo de Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(69604299226422240)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(69604329157422241)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(69604511138422243)
,p_name=>'NMRO_PRCSO_JRDCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_PRCSO_JRDCO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00FAmero Proceso Jur\00EDdico')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>true
,p_max_length=>30
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
 p_id=>wwv_flow_api.id(69604616440422244)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(69604914681422247)
,p_name=>'ID_ETPA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ETPA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(82860179557223435)
,p_name=>'ID_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(69603413521422232)
,p_internal_uid=>69603413521422232
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
'   window.localStorage.removeItem(''jsonEmbargo'');',
'    return selectAll(config, {',
'        name: ''Seleccionar Todos'',',
'        action: seleccionarTodos',
'    }) ;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(70126521149478619)
,p_interactive_grid_id=>wwv_flow_api.id(69603413521422232)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>20
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(70126618919478619)
,p_report_id=>wwv_flow_api.id(70126521149478619)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(58339097626253016)
,p_view_id=>wwv_flow_api.id(70126618919478619)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(57849743143104911)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70127168943478622)
,p_view_id=>wwv_flow_api.id(70126618919478619)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(69603507204422233)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70127694402478624)
,p_view_id=>wwv_flow_api.id(70126618919478619)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(69603624971422234)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70128103816478625)
,p_view_id=>wwv_flow_api.id(70126618919478619)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(69603739406422235)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70128613853478627)
,p_view_id=>wwv_flow_api.id(70126618919478619)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(69603806018422236)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>129
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70129125683478628)
,p_view_id=>wwv_flow_api.id(70126618919478619)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(69603940719422237)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70129644820478630)
,p_view_id=>wwv_flow_api.id(70126618919478619)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(69604080023422238)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>304
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70211530174550432)
,p_view_id=>wwv_flow_api.id(70126618919478619)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(69604299226422240)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70212452914550435)
,p_view_id=>wwv_flow_api.id(70126618919478619)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(69604511138422243)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>177
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70212910412550436)
,p_view_id=>wwv_flow_api.id(70126618919478619)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(69604616440422244)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>186.2222442626953
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70264562003671413)
,p_view_id=>wwv_flow_api.id(70126618919478619)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(69604914681422247)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83255531154441162)
,p_view_id=>wwv_flow_api.id(70126618919478619)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(82860179557223435)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69605075073422248)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
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
 p_id=>wwv_flow_api.id(91487600661759427)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <center>',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'        </b>',
'    </center>',
'</h5>',
'<p>',
unistr('<b><i></i></b>Esta funcionalidad permite descargar o imprimir los actos generados en cada una de las etapas del proceso jur\00EDdico, ya sea de forma masiva o puntual.<br><br>'),
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</p>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(137607147523871098)
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
 p_id=>wwv_flow_api.id(69605186075422249)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(69605075073422248)
,p_button_name=>'BTN_IMPRIMIR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Descargar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(70090347739442499)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(137607147523871098)
,p_button_name=>'btn_cnsltar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(82860765178223441)
,p_branch_name=>'Ir a pagina 2'
,p_branch_action=>'f?p=66000:2:&SESSION.:&P25_MSVO.:&DEBUG.:RP:P2_ID_RPRTE,P2_XML,P2_NMBRE_ZIP:19,&P25_XML.,lotezip&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(69605186075422249)
,p_branch_sequence=>10
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17964378897544707)
,p_name=>'P25_VLDA_CRTRA'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(137607147523871098)
,p_prompt=>'Valida Cartera'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'Si'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57849659234104910)
,p_name=>'P25_ID_FLJO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(137607147523871098)
,p_prompt=>'Flujo de Proceso Juridico'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.dscrpcion_fljo ,b.id_fljo',
' from wf_d_flujos b',
'where id_prcso = 10',
'  and cdgo_clnte = :f_cdgo_clnte'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el tipo de flujo para poder mostrar las etapas jur\00EDdicas.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69604756674422245)
,p_name=>'P25_FECHA_ACTO_DSDE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(137607147523871098)
,p_prompt=>'Fecha Acto Desde'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Fecha de Acto Inicial'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69604859356422246)
,p_name=>'P25_FECHA_ACTO_HSTA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(137607147523871098)
,p_prompt=>'Fecha Acto Hasta'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Fecha de Acto Final'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70090741626442502)
,p_name=>'P25_PRCSO_JRDCO_DSDE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(137607147523871098)
,p_prompt=>unistr('Proceso Jur\00EDdico Desde')
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Numero de Proceso Jur\00EDdico inicial')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70091163071442504)
,p_name=>'P25_ETPA_DCMNTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(137607147523871098)
,p_prompt=>unistr('Etapas Proceso Jur\00EDdico')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select initcap(a.nmbre_trea)nmbre_trea, a.id_fljo_trea',
'  from v_wf_d_flujos_tarea a',
' where a.id_fljo = :p25_id_fljo',
' order by a.nmbre_trea'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P25_ID_FLJO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Etapas del Flujo de los Procesos Juridicos'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70091552703442505)
,p_name=>'P25_NMRO_ACTO_DSDE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(137607147523871098)
,p_prompt=>unistr('N\00FAmero Acto Desde')
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Numero de Acto Inicial'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70091987089442505)
,p_name=>'P25_SUJETO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(137607147523871098)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Identificaci\00F3n del sujeto asociado al proceso jur\00EDdico.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(82860243952223436)
,p_name=>'P25_MSVO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(137607147523871098)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(82860355436223437)
,p_name=>'P25_XML'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(137607147523871098)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91487222858759423)
,p_name=>'P25_PRCSO_JRDCO_HSTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(137607147523871098)
,p_prompt=>unistr('Proceso Jur\00EDdico Hasta')
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Numero de Proceso Juridico Final'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91487383623759424)
,p_name=>'P25_NMRO_ACTO_HSTA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(137607147523871098)
,p_prompt=>unistr('N\00FAmero Acto Hasta')
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Numero de Acto Final'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91487466996759425)
,p_name=>'P25_TPO_ACTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(137607147523871098)
,p_prompt=>'Tipo de Acto'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select lower(a.dscrpcion) as dscrpcion,a.id_acto_tpo',
'  from gn_d_actos_tipo a',
' where exists (select 1',
'                 from v_cb_g_procesos_jrdco_dcmnto b',
'                where b.id_acto_tpo = a.id_acto_tpo)',
'   and exists (select 1',
'                 from GN_D_ACTOS_TIPO_TAREA b',
'                where b.id_acto_tpo = a.id_acto_tpo',
'                  and b.id_fljo_trea = :P25_ETPA_DCMNTO);'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P25_ETPA_DCMNTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Tipos de Actos asociados a las diferentes etapas del flujo.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91487540178759426)
,p_name=>'P25_LTE_IMPRSION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(137607147523871098)
,p_prompt=>unistr('Lote de Impresi\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''*Lote: ''||a.cnsctvo_lte||'' *Fecha: ''||to_char(a.fcha_lte,''dd/mm/yyyy'')||'' *Funcionario: ''||b.nmbre_trcro||'' *Tipo de Acto: ''||c.dscrpcion  as dscrpcion_Lte,',
'       a.id_prcso_jrdco_lte',
'  from cb_g_procesos_juridico_lote a, v_sg_g_usuarios b, gn_d_actos_tipo c',
' where a.id_fncnrio = b.id_fncnrio',
'   and c.id_acto_tpo = a.id_acto_tpo',
'   and a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.id_acto_tpo = :P25_TPO_ACTO',
'   and a.tpo_lte = ''LIM'';'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P25_TPO_ACTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Lotes de Impresi\00F3n asociados a un tipo de acto.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(129806796789160906)
,p_name=>'P25_INDCDOR_NTFCDO'
,p_is_required=>true
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(137607147523871098)
,p_prompt=>'Notificado'
,p_display_as=>'NATIVE_YES_NO'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'Si'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(82860492441223438)
,p_name=>'Al seleccionar datos de grilla'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(69603336262422231)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(82860528106223439)
,p_event_id=>wwv_flow_api.id(82860492441223438)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validar_sel();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(57015905996842305)
,p_name=>'New'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P25_FECHA_ACTO_DSDE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57016020569842306)
,p_event_id=>wwv_flow_api.id(57015905996842305)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P25_FECHA_ACTO_HSTA").datepicker( ''option'' , ''minDate'' , $("#P25_FECHA_ACTO_DSDE").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(14836581937406304)
,p_name=>'CLIC_BTN_IMPRIMIR'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(69605186075422249)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(14836653872406305)
,p_event_id=>wwv_flow_api.id(14836581937406304)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//merge_oficios_x_resolucion();',
'merge_pdf_paralelo();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69604401266422242)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(69603336262422231)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Actos proceso juridico: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14836746319406306)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'prc_co_documentos_msvos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  cadena           varchar2(100) := '''';',
'  l_clob	       CLOB;',
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
'  ',
'  insert into muerto (v_001,c_001) values (''Json Procesos'',v_json);commit;',
'  ',
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
'  apex_json.close_all;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
